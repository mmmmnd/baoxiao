package com.baoxiao.framework.aspectj;


import cn.hutool.core.lang.Dict;
import com.baoxiao.common.annotation.DictFormat;
import com.baoxiao.common.core.domain.R;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.utils.JsonUtils;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.system.service.impl.SysDictDataServiceImpl;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Aspect
@Component
public class DictAspect {

    private Logger log = LoggerFactory.getLogger(DictAspect.class);

    @Autowired
    private SysDictDataServiceImpl sysDictDataService;

    @Pointcut("execution(* com.baoxiao.*.controller.*.*(..))")
    public void execute(){

    }

    @Around("execute()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Long start = System.currentTimeMillis();
        //获取执行完的数据
        Object proceed = point.proceed();
        //翻译数据
        translateDict(proceed);
        log.info("解析数据执行时间:{}", (System.currentTimeMillis() - start));
        return proceed;

    }

    /**
     * 翻译字典
     * @param result
     */
    private void translateDict(Object result) {
        TableDataInfo<Dict> dictResultPage = null;
        R<Dict> dictResult = null;

        if (result instanceof TableDataInfo) {
            dictResultPage = (TableDataInfo<Dict>) result;
        } else if(result instanceof R) {
            dictResult = (R<Dict>) result;
        } else {
            return;
        }

        //封装返回的值
        List<Dict> items = new ArrayList<>();
        if(result instanceof TableDataInfo){
            List<?> list = dictResultPage.getRows();

            //循环list获取里面注册标注的数据添加值
            for (Object item : list) {
                //获取值进行json格式的转化
                String json = JsonUtils.toJsonString(item);
                Dict parseObject = JsonUtils.parseMap(json);
                Dict dict = eachKeyValue(parseObject, item);
                items.add(dict);
            }
            dictResultPage.setRows(items);
        } else {
            Object data = dictResult.getData();

            if(data != null) {
                String json = JsonUtils.toJsonString(data);
                Dict parseObject = JsonUtils.parseMap(json);
                Dict dict = eachKeyValue(parseObject, data);

                dictResult.setData(dict);
            }
        }
    }

    /**
     * 遍历获取对象中的属性和名称
     * @param parseObject 加工后对象
     * @param o 源对象
     * @return 结果
     */
    private Dict eachKeyValue(Dict parseObject, Object o){
        for (Field field : getAllFields(o)) {
            //获取注解标注的值
            if (field.getAnnotation(DictFormat.class)!=null){
                String dictDataSource = field.getAnnotation(DictFormat.class).dictDataSource();
                String dictText = field.getAnnotation(DictFormat.class).dictText();
                //获取当前key值
                String keys = String.valueOf(parseObject.get(field.getName()));
                //获取当前字典中的值
                String textValue = translateTextValue(dictDataSource,keys);
                if (StringUtils.isNotBlank(dictText)){
                    parseObject.put(dictText,textValue);
                }else {
                    parseObject.put(field.getName()+"Name",textValue);
                }
            }
        }

        return parseObject;
    }

    /**
     * 获取字典中的值
     * @param dictDataSource 名称
     * @param keys 值
     * @return
     */
    private String translateTextValue(String dictDataSource, String keys) {
        if (StringUtils.isBlank(dictDataSource) || StringUtils.isBlank(keys)){
            return null;
        }

        StringBuffer buffer = new StringBuffer();

        //分割key将分割的key循环便利进行查询
        String[] key = keys.split(",");
        for (String k : key) {
            if (k.trim().length()==0){
                continue;
            }
            log.info("字典中的值:{}",k);
            String tempValue = sysDictDataService.selectDictLabel(dictDataSource,k);

            if (StringUtils.isNotBlank(tempValue)){
                if (!"".equals(buffer.toString())){
                    buffer.append(",");
                }
                buffer.append(tempValue);
            }
        }

        return buffer.toString();
    }

    /**
     * 通过反射包括父类的所有属性类型
     * @param object
     * @return
     */
    private Field[] getAllFields(Object object){
        Class<?> clazz = object.getClass();
        List<Field> fieldList = new ArrayList<>();
        while (clazz!=null){
            fieldList.addAll(new ArrayList<>(Arrays.asList(clazz.getDeclaredFields())));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);

        return fields;
    }

}

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
import java.util.Map;
import java.util.stream.Collectors;

@Aspect
@Component
public class DictAspect {

    private Logger log = LoggerFactory.getLogger(DictAspect.class);

    @Autowired
    private SysDictDataServiceImpl sysDictDataService;

    @Pointcut("execution(* com.baoxiao.*.controller.*.*(..))")
    public void execute() {
    }

    @Around("execute()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Long start = System.currentTimeMillis();
        Object proceed = point.proceed();
        translateDict(proceed);
        log.info("解析数据执行时间: {}", (System.currentTimeMillis() - start));
        return proceed;
    }

    private void translateDict(Object result) {
        if (result instanceof TableDataInfo) {
            translateTableDataInfo((TableDataInfo<Dict>) result);
        } else if (result instanceof R) {
            translateR((R<Object>) result);
        }
    }

    private void translateTableDataInfo(TableDataInfo<Dict> dictResultPage) {
        List<?> items = dictResultPage.getRows();
        List<Dict> translatedItems = items.stream()
            .map(item -> eachKeyValue(JsonUtils.parseMap(JsonUtils.toJsonString(item)), item))
            .collect(Collectors.toList());
        dictResultPage.setRows(translatedItems);
    }

    private void translateR(R<Object> dictResult) {
        Object data = dictResult.getData();
        if (data instanceof List) {
            List<Dict> translatedDataList = ((List<?>) data).stream()
                .map(item -> eachKeyValue(JsonUtils.parseMap(JsonUtils.toJsonString(item)), item))
                .collect(Collectors.toList());
            dictResult.setData(translatedDataList);
        } else if (data != null) {
            Dict dict = eachKeyValue(JsonUtils.parseMap(JsonUtils.toJsonString(data)), data);
            dictResult.setData(dict);
        }
    }

    private Dict eachKeyValue(Dict parseObject, Object o) {
        for (Field field : getAllFields(o)) {
            DictFormat annotation = field.getAnnotation(DictFormat.class);
            if (annotation != null) {
                String dictDataSource = annotation.dictDataSource();
                String dictText = annotation.dictText();
                String keys = String.valueOf(parseObject.get(field.getName()));
                String textValue = translateTextValue(dictDataSource, keys);
                parseObject.put(StringUtils.isNotBlank(dictText) ? dictText : field.getName() + "Name", textValue);
            }
        }
        return parseObject;
    }

    private String translateTextValue(String dictDataSource, String keys) {
        if (StringUtils.isAnyBlank(dictDataSource, keys)) {
            return null;
        }
        return Arrays.stream(keys.split(","))
            .filter(StringUtils::isNotBlank)
            .map(k -> {
                log.info("字典中的值: {}", k);
                return sysDictDataService.selectDictLabel(dictDataSource, k);
            })
            .filter(StringUtils::isNotBlank)
            .collect(Collectors.joining(","));
    }

    private Field[] getAllFields(Object object) {
        List<Field> fieldList = new ArrayList<>();
        Class<?> clazz = object.getClass();
        while (clazz != null) {
            fieldList.addAll(Arrays.asList(clazz.getDeclaredFields()));
            clazz = clazz.getSuperclass();
        }
        return fieldList.toArray(new Field[0]);
    }
}

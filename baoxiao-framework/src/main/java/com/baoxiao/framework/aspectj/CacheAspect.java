package com.baoxiao.framework.aspectj;

import com.baoxiao.common.annotation.CacheBatchEvict;
import com.baoxiao.common.utils.SpelUtil;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.common.utils.redis.CacheUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


import java.lang.reflect.Method;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Aspect
@Component
public class CacheAspect {

    private Logger log = LoggerFactory.getLogger(CacheAspect.class);

    @Around("@annotation(cacheBatchEvict)")
    public Object proceed(ProceedingJoinPoint joinPoint, CacheBatchEvict cacheBatchEvict) throws Throwable {
        String spel = cacheBatchEvict.key();
        String condition = cacheBatchEvict.condition();
        String cacheNames = StringUtils.isNotEmpty(cacheBatchEvict.value()) ? cacheBatchEvict.value() : cacheBatchEvict.cacheNames();

        /*校验缓存条件值*/
        String conditionStr =  getSpelValue(joinPoint, condition);
        boolean conditionFlag = Boolean.parseBoolean(conditionStr);

        if(conditionFlag){
            //TODO 做一些业务上的校验,判断是否需要校验
        }

        /*全部删除*/
        if(cacheBatchEvict.allEntries()){
            CacheUtils.clear(cacheNames);
        }

        /*获取spelValue后将List遍历进行删除*/
        String spelStr = getSpelValue(joinPoint, spel);

        List<Long> spelList = Stream.of(spelStr.split(",")).map(Long::parseLong).collect(Collectors.toList());
        spelList.forEach(spelItem ->  CacheUtils.evict(cacheNames, spelItem));

        log.info("cacheNames -> {} ， spel -> {} ",cacheNames,spelList);

        return joinPoint.proceed();
    }

    /**
     * 将spel表达式转换为缓存名字
     */
    private String getSpelValue(ProceedingJoinPoint joinPoint, String spel) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method targetMethod = methodSignature.getMethod();
        Object target = joinPoint.getTarget();
        Object[] arguments = joinPoint.getArgs();
        return SpelUtil.parse(target, spel, targetMethod, arguments);
    }

}

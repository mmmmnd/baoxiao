package com.baoxiao.common.annotation;

import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface CacheBatchEvict {

    /**
     * value 是cacheNames的别名
     */
    @AliasFor("cacheNames")
    String value() default "";

    /**
     * 这个属性也是一个字符串数组，并且也是"value"的别名
     */
    @AliasFor("value")
    String cacheNames() default "";

    /**
     * key需要指定一个spEL表达式，通过spEL表达式获取方法参数
     */
    String key() default "";

    /**
     * 用于为缓存清除操作设置一些条件
     */
    String condition() default "";

    /**
     * 表示是否应该清除所有的缓存项
     */
    boolean allEntries() default false;
}

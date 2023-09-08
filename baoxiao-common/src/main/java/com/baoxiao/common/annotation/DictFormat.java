package com.baoxiao.common.annotation;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DictFormat {

    /**
     * 方法描述:类型dataSource
     * @return
     */
    String dictDataSource();

    /**
     * 返回后台的put到json中的文件key值
     * @return
     */
    String dictText() default "";
}

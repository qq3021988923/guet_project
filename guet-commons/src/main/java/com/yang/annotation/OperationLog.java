package com.yang.annotation;

import java.lang.annotation.*;

/**
 * 操作日志注解
 * 在需要记录操作日志的方法上添加此注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OperationLog {

    /**
     * 操作模块
     */
    String module() default "";

    /**
     * 操作类型
     */
    String operation() default "";
}

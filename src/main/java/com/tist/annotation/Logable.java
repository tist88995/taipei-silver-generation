package com.tist.annotation;

import com.tist.domain.enum_package.LogableOperation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 資料異動紀錄註解
 *
 * @author Torr
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
public @interface Logable {

    LogableOperation value() default LogableOperation.ALL;

}

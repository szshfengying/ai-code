/*
 * Powered By [lixin]
 *
 */

package com.rzhkj.project.entity;

import com.rzhkj.core.base.BaseEntity;
import lombok.Data;


/**
 * @author lixin hegaoye@qq.com
 * @version 1.0
 * @since 1.0
 */

@Data
public class ClassInfo extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 5454155825314635342L;


    private Long id;//数据库字段:id  属性显示:id
    private String tableCode;//数据库字段:tableCode  属性显示:表编码
    private String code;//数据库字段:code  属性显示:类编码
    private String basePackage;//数据库字段:package  属性显示:包名
    private String notes;//数据库字段:notes  属性显示:类注释
    private String className;//数据库字段:className  属性显示:类名


}


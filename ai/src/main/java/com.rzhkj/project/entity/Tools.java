/*
 * Powered By [lixin]
 * 代码脚手架工具生成 [rapid-framework]
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
public class Tools extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 5454155825314635342L;

    private Long id;//数据库字段:id  属性显示:id
    private String toolsCategoryCode;//数据库字段:toolsCategoryCode  属性显示:工具类型编码
    private String code;//数据库字段:code  属性显示:工具编码
    private String name;//数据库字段:name  属性显示:工具名
    private String path;//数据库字段:path  属性显示:工具类存放路径
    private String description;//数据库字段:description  属性显示:工具说明
    private String state;//数据库字段:state  属性显示:状态：停用[Disenable]，启用[Enable]
}


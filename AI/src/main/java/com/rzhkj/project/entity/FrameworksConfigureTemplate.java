/*
 * Powered By [lixin]
 * 代码脚手架工具生成 [rapid-framework]
 */

package com.rzhkj.project.entity;

import com.rzhkj.core.base.BaseEntity;
import lombok.Data;

import java.util.List;


/**
 * @author lixin hegaoye@qq.com
 * @version 1.0
 * @since 1.0
 */

@Data
public class FrameworksConfigureTemplate extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 5454155825314635342L;

    private Long id;//数据库字段:id  属性显示:id
    private String code;//数据库字段:code  属性显示:模板编码
    private String frameworksCode;//数据库字段:frameworksCode  属性显示:框架编码
    private String name;//数据库字段:name  属性显示:模板名称
    private String description;//数据库字段:description  属性显示:模板说明
    private String path;//数据库字段:path  属性显示:模板路径
    private String saveFilePath;//数据库字段:saveFilePath  属性显示:生成文件存储路径
    private String state;//数据库字段:state  属性显示:状态：停用[Disenable]，启用[Enable]
    private String fileType;//数据库字段:fileType  属性显示:文件类型 Java, Xml, Property


    private List<FrameworkAttribute> frameworkAttributeList;
}

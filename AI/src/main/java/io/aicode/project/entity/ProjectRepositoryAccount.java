/*
 * Powered By [lixin]
 *
 */

package io.aicode.project.entity;

import io.aicode.base.BaseEntity;
import lombok.Data;

/**
 * @author lixin hegaoye@qq.com
 * @version 1.0
 * @since 1.0
 */

@Data
public class ProjectRepositoryAccount extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 5454155825314635342L;

    private Long id;//数据库字段:id  属性显示:id
    private String code;//数据库字段:code  属性显示:版本管理编码
    private String projectCode;//数据库字段:projectCode  属性显示:项目编码
    private String account;//数据库字段:account  属性显示:帐户名
    private String password;//数据库字段:password  属性显示:密码
    private String home;//数据库字段:home  属性显示:仓库地址
    private String description;//数据库字段:description  属性显示:仓库说明
    private String state;//数据库字段:state  属性显示:状态：停用[Disenable]，启用[Enable]
    private String type;//数据库字段:type  属性显示:仓库类型:Git, Svn

    public ProjectRepositoryAccount() {
    }

    public ProjectRepositoryAccount(String projectCode) {
        this.projectCode = projectCode;
    }
}


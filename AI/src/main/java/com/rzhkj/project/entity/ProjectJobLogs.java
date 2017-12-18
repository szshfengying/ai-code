/*
 * Powered By [lixin]
 *
 */

package com.rzhkj.project.entity;

import com.rzhkj.core.base.BaseEntity;
import lombok.Data;

import java.util.Date;


/**
 * @author lixin hegaoye@qq.com
 * @version 1.0
 * @since 1.0
 */

@Data
public class ProjectJobLogs extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 5454155825314635342L;

    private Long id;//数据库字段:id  属性显示:id
    private String code;//数据库字段:code  属性显示:任务编码
    private String result;//数据库字段:result  属性显示:执行结果,任务状态+文字描述
    private String info;//数据库字段:info  属性显示:执行信息
    private java.util.Date createTime;//数据库字段:createTime  属性显示:执行时间

    public ProjectJobLogs() {
    }

    public ProjectJobLogs(String code, String result, String info, Date createTime) {
        this.code = code;
        this.result = result;
        this.info = info;
        this.createTime = createTime;
    }
}

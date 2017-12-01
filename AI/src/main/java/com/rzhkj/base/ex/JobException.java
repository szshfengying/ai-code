/*
 * Copyright (c) 2017. 郑州仁中和科技有限公司.保留所有权利.
 *                       http://www.rzhkj.com/
 *      郑州仁中和科技有限公司保留所有代码著作权.如有任何疑问请访问官方网站与我们联系.
 *      代码只针对特定客户使用，不得在未经允许或授权的情况下对外传播扩散.恶意传播者，法律后果自行承担.
 *      本代码仅用于龐帝業務系统.
 */
package com.rzhkj.base.ex;


import com.rzhkj.core.exceptions.BaseException;

/**
 * 基础数据配置异常
 *
 * @author lixin
 *         公寓方异常
 */
public class JobException extends BaseException {


    public JobException(PonddyException exceptionMessage) {
        super(exceptionMessage);
    }

    public JobException(PonddyException exceptionMessage, Object... params) {
        super(exceptionMessage, params);
    }

    public JobException(String message) {
        super(message);
    }

    public JobException(String message, Throwable cause) {
        super(message, cause);
    }
}

/*
 *
 *                       http://www.aicode.io
 *
 *
 *      本代码仅用于AI-Code.
 */

package io.aicode.core.common;

import io.aicode.core.Env;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 常量表
 */
public enum Constants {
    sessionid("sessionId"),//登陆session key
    SS_TIMEOUT(360000L * 1000 * 4), //session过期时间(毫秒)
    Cookie_Maxage(5),//cookie 最大过期
    AccountCode("accountCode"),//jwt 的key
    ;

    public Object val;

    Constants(Object val) {
        this.val = val;
    }

    private final static Logger log = LoggerFactory.getLogger(Constants.class);

    public static String Domain = null;
    public static String AssistantDomain = null;


    static {
        switch (Env.env) {
            case DEVELOP:
                log.info("----------常量表 开启开发环境-------------");
                Domain = null;
                AssistantDomain = null;
                log.info("===> 域名" + Domain);
                log.info("----------常量表 开启开发环境-------------");
                break;
            case SANDBOX:
                log.info("----------常量表 开启测试环境-------------");
                Domain = null;
                AssistantDomain = null;
                log.info("===> 域名" + Domain);
                log.info("----------常量表 开启测试环境-------------");
                break;
            case PRODUCT:
                log.info("----------常量表 开启生产环境-------------");
                Domain = "ponddy.com";
                AssistantDomain = "ponddy.com";
                log.info("===> 域名" + Domain.toString());
                log.info("===> 域名" + AssistantDomain.toString());
                log.info("----------常量表 开启生产环境-------------");
                break;
        }
    }
}
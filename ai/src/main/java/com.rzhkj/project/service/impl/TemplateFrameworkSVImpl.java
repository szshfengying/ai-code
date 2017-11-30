/*
 * Powered By [lixin]
 * 代码脚手架工具生成 [rapid-framework]
 */

package com.rzhkj.project.service.impl;


import com.baidu.fsg.uid.UidGenerator;
import com.rzhkj.core.base.BaseMybatisDAO;
import com.rzhkj.core.base.BaseMybatisSVImpl;
import com.rzhkj.project.dao.TemplateFrameworkDAO;
import com.rzhkj.project.entity.TemplateFramework;
import com.rzhkj.project.service.TemplateFrameworkSV;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Component
@Service
public class TemplateFrameworkSVImpl extends BaseMybatisSVImpl<TemplateFramework, Long> implements TemplateFrameworkSV {

    @Resource
    private TemplateFrameworkDAO templateFrameworkDAO;

    @Resource
    private UidGenerator uidGenerator;

    @Override
    protected BaseMybatisDAO getBaseMybatisDAO() {
        return templateFrameworkDAO;
    }

}

/*
 * Powered By [lixin]
 *
 */

package com.rzhkj.project.service.impl;

import com.baidu.fsg.uid.UidGenerator;
import com.google.common.collect.Maps;
import com.rzhkj.core.base.BaseMybatisDAO;
import com.rzhkj.core.base.BaseMybatisSVImpl;
import com.rzhkj.core.exceptions.BaseException;
import com.rzhkj.core.exceptions.ProjectJobException;
import com.rzhkj.core.tools.Executors;
import com.rzhkj.core.tools.StringTools;
import com.rzhkj.project.dao.ProjectJobDAO;
import com.rzhkj.project.dao.ProjectJobLogsDAO;
import com.rzhkj.project.entity.ProjectJob;
import com.rzhkj.project.entity.ProjectJobStateEnum;
import com.rzhkj.project.service.GenerateSV;
import com.rzhkj.project.service.ProjectJobSV;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;


@Component
@Service
public class ProjectJobSVImpl extends BaseMybatisSVImpl<ProjectJob, Long> implements ProjectJobSV {

    @Resource
    private ProjectJobDAO projectJobDAO;

    @Resource
    private ProjectJobLogsDAO projectJobLogsDAO;

    @Resource
    private GenerateSV generateSV;

    @Resource
    private UidGenerator uidGenerator;

    @Override
    protected BaseMybatisDAO getBaseMybatisDAO() {
        return projectJobDAO;
    }

    /**
     * 创建项目任务
     * 1.验证参数
     * 2.设置默认属性
     * 3.保存
     *
     * @param projectJob
     */
    @Override
    public void build(ProjectJob projectJob) {
        //1.验证参数
        if (projectJob == null || StringTools.isEmpty(projectJob.getProjectCode())) {
            logger.error(BaseException.BaseExceptionEnum.Empty_Param.toString());
            throw new ProjectJobException(BaseException.BaseExceptionEnum.Empty_Param);
        }
        //2.设置默认属性
        projectJob.setCode(String.valueOf(uidGenerator.getUID()));
        projectJob.setNumber(0);
        projectJob.setState(ProjectJobStateEnum.Create.name());
        projectJob.setCreateTime(new Date());
        //3.保存
        this.save(projectJob);
    }

    /**
     * 删除任务
     * 1.判断参数
     * 2.判断任务是否存在
     * 3.删除任务
     * 4.删除任务执行日志
     *
     * @param code 任务编码
     */
    @Override
    public void delete(String code) {
        //1.判断参数
        if (StringTools.isEmpty(code)) {
            logger.error(BaseException.BaseExceptionEnum.Empty_Param.toString());
            throw new ProjectJobException(BaseException.BaseExceptionEnum.Empty_Param);
        }

        //2.判断任务是否存在
        Map<String, Object> map = Maps.newHashMap();
        map.put("code", code);
        ProjectJob projectJob = projectJobDAO.load(map);
        if (projectJob == null) {
            logger.error(BaseException.BaseExceptionEnum.Result_Not_Exist.toString());
            throw new ProjectJobException(BaseException.BaseExceptionEnum.Result_Not_Exist);
        }
        //3.删除任务
        projectJobDAO.delete(code);

        //4.删除任务执行日志
        projectJobLogsDAO.delete(code);

    }

    /**
     * 执行任务
     * 1.创建项目
     * 2.获取类信息
     * 3.获取模板信息
     * 4.生成源码
     * 5.获取模块信息
     * 6.获取版本控制管理信息
     *
     * @param projectCode 项目编码
     */
    @Override
    public ProjectJob execute(String projectCode) {
        //创建任务追踪
        ProjectJob projectJob = new ProjectJob();
        projectJob.setCode(String.valueOf(uidGenerator.getUID()));
        projectJob.setProjectCode(projectCode);
        projectJob.setState(ProjectJob.State.Executing.name());
        projectJob.setNumber(1);
        projectJob.setCreateTime(new Date());
        projectJobDAO.insert(projectJob);

        Executors.singleThreadExecutor(new Runnable() {
            @Override
            public void run() {
                generateSV.aiCode(projectCode, projectJob);
            }
        });
        return projectJob;
    }


}

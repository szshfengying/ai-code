package io.aicode.project.ctrl;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import io.aicode.base.BaseCtrl;
import io.aicode.base.core.BeanRet;
import io.aicode.base.exceptions.BaseException;
import io.aicode.base.tools.Page;
import io.aicode.base.tools.StringTools;
import io.aicode.base.websocket.WSClientManager;
import io.aicode.project.entity.ProjectJob;
import io.aicode.project.service.ProjectJobSV;
import io.aicode.project.service.ProjectSV;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;
import java.util.Map;


/**
 * 项目任务管理控制器
 * 1.查询任务详情信息
 * 2.查询项目任务信息集合
 * 3.创建任务
 * 4.修改任务
 * 5.删除任务
 * 6.执行任务
 *
 * @author lixin
 */
@Controller
@RequestMapping("/project/job")
@Api(value = "项目任务管理控制器", description = "项目任务管理控制器")
public class ProjectJobCtrl extends BaseCtrl {

    @Resource
    private ProjectJobSV projectJobSV;
    @Resource
    private ProjectSV projectSV;

    @Resource
    private WSClientManager wsClientManager;

    /**
     * 查询任务详情信息
     *
     * @param code 任务编码
     * @return BeanRet
     */
    @ApiOperation(value = "查询任务详情信息", notes = "查询任务详情信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "code", value = "任务编码", paramType = "query")
    })
    @GetMapping(value = "/load")
    @ResponseBody
    public BeanRet load(String code) {
        try {
            Assert.hasText(code, BaseException.BaseExceptionEnum.Empty_Param.toString());
            Map<String, Object> map = new HashedMap();
            map.put("code", code);
            ProjectJob projectJob = projectJobSV.load(map);
            logger.info(JSON.toJSONString(projectJob));
            return BeanRet.create(true, "查询任务详情信息", projectJob);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return BeanRet.create("未查到需要的内容");
        }
    }


    /**
     * 查询项目任务信息集合 按照时间顺序倒叙排序
     *
     * @return 分页对象
     */
    @ApiOperation(value = "查询项目任务信息集合 按照时间顺序倒叙排序", notes = "查询项目任务信息集合 按照时间顺序倒叙排序")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "code", value = "项目编码", paramType = "query"),
            @ApiImplicitParam(name = "curPage", value = "当前页", required = true, paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", required = true, paramType = "query")
    })
    @GetMapping(value = "/list")
    @ResponseBody
    public BeanRet list(String code, @ApiIgnore Page<ProjectJob> page) {
        try {
            Assert.notNull(page, BaseException.BaseExceptionEnum.Empty_Param.toString());
            Map<String, Object> map = Maps.newHashMap();
            map.put("projectCode", code);
            page.setParams(map);
            page = projectJobSV.getList(page);
            int count = projectJobSV.count(map);
            page.setTotalRow(count);

            logger.info(JSON.toJSONString(page));
            return BeanRet.create(true, "", page);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return BeanRet.create("未查到需要的内容");
        }
    }

    /**
     * 创建任务
     *
     * @return BeanRet
     */
    @ApiOperation(value = "创建任务", notes = "创建任务")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "projectCode", value = "项目编码", required = true, paramType = "query"),
            @ApiImplicitParam(name = "name", value = "任务名", required = true, paramType = "query"),
            @ApiImplicitParam(name = "description", value = "任务描述", required = true, paramType = "query")
    })
    @PostMapping("/build")
    @ResponseBody
    public BeanRet build(@ApiIgnore ProjectJob projectJob) {
        try {
            Assert.hasText(projectJob.getProjectCode(), BaseException.BaseExceptionEnum.Empty_Param.toString());
            Map<String, Object> map = Maps.newHashMap();
            map.put("projectCode", projectJob.getProjectCode());
            ProjectJob projectJobLoad = projectJobSV.load(map);
            if (projectJobLoad != null) {
                return BeanRet.create(true, "创建任务成功", projectJobLoad);
            }
            projectJobSV.build(projectJob);
            return BeanRet.create(true, "创建任务成功", projectJob);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return BeanRet.create(false, "创建任务失败");
        }
    }


    /**
     * 修改任务
     *
     * @return BeanRet
     */
    @ApiOperation(value = "修改任务", notes = "修改任务")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "code", value = "项目编码", required = true, paramType = "query"),
            @ApiImplicitParam(name = "name", value = "任务名", paramType = "query"),
            @ApiImplicitParam(name = "state", value = "任务状态", paramType = "query"),
            @ApiImplicitParam(name = "description", value = "任务描述", paramType = "query")
    })
    @PutMapping("/modify")
    @ResponseBody
    public BeanRet modify(@ApiIgnore ProjectJob projectJob) {
        try {
            Assert.hasText(projectJob.getCode(), BaseException.BaseExceptionEnum.Empty_Param.toString());

            if (StringTools.isEmpty(projectJob.getState())) {
                return BeanRet.create(false, "任务没有做任何修改");
            }

            projectJobSV.saveOrUpdate(projectJob);
            return BeanRet.create(true, "修改任务成功", projectJob);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return BeanRet.create(false, "修改任务失败");
        }
    }


    /**
     * 删除任务
     *
     * @return BeanRet
     */
    @ApiOperation(value = "删除任务", notes = "删除任务")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "code", value = "项目编码", required = true, paramType = "query"),
    })
    @DeleteMapping("/delete")
    @ResponseBody
    public BeanRet delete(String code) {
        try {
            Assert.hasText(code, BaseException.BaseExceptionEnum.Empty_Param.toString());

            projectJobSV.delete(code);
            return BeanRet.create(true, "删除任务成功");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return BeanRet.create(false, "删除任务失败");
        }
    }


    /**
     * 构建任务
     *
     * @param code 项目编码
     * @return BeanRet
     */
    @ApiOperation(value = "执行任务", notes = "执行任务")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "code", value = "任务编码", paramType = "query")
    })
    @GetMapping(value = "/execute")
    @ResponseBody
    public BeanRet execute(String code, HttpServletRequest request) {
        try {
            Assert.hasText(code, BaseException.BaseExceptionEnum.Empty_Param.toString());
            Session webSocketSession = wsClientManager.get();
            if (webSocketSession != null) {
                //生成代码
                ProjectJob projectJob = projectJobSV.execute(code);
                return BeanRet.create(true, "执行任务成功", projectJob);
            }
            return BeanRet.create();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return BeanRet.create("执行任务失败");
        }
    }

}

/*
 *  * Copyright (c) 2017. 郑州仁中和科技有限公司.保留所有权利.
 *                       http://www.rzhkj.com/
 *      郑州仁中和科技有限公司保留所有代码著作权.如有任何疑问请访问官方网站与我们联系.
 *      代码只针对特定客户使用，不得在未经允许或授权的情况下对外传播扩散.恶意传播者，法律后果自行承担.
 *      本代码仅用于AI-Code.
 */
package com.rzhkj.project.ctrl;

import com.alibaba.fastjson.JSON;
import com.rzhkj.core.base.BaseCtrl;
import com.rzhkj.core.entity.BeanRet;
import com.rzhkj.core.entity.Page;
import com.rzhkj.core.tools.StringTools;
import com.rzhkj.core.tools.redis.RedisUtils;
import com.rzhkj.project.entity.DisplayAttribute;
import com.rzhkj.project.service.DisplayAttributeSV;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;


/**
 * 显示属性
 *
 * @author berton
 */
@Controller
@RequestMapping("/displayAttribute")
@Api(value = "显示属性控制器", description = "显示属性控制器")
public class DisplayAttributeCtrl extends BaseCtrl {
    private final static Logger logger = LoggerFactory.getLogger(DisplayAttributeCtrl.class);

    @Resource
    protected RedisTemplate<String, Object> redisTemplate;
    @Resource
    protected RedisUtils redisUtils;

    @Resource
    private DisplayAttributeSV displayAttributeSV;


    /**
     * 查询显示属性详情信息
     *
     * @param id
     * @return BeanRet
     */
    @ApiOperation(value = "查询显示属性详情信息", notes = "查询显示属性详情信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "id", paramType = "query")
    })
    @GetMapping(value = "/loadById")
    @ResponseBody
    public BeanRet loadById(@PathVariable Long id) {
        if (id == null) {
            return BeanRet.create();
        }

        DisplayAttribute displayAttribute = displayAttributeSV.load(id);
        logger.info(JSON.toJSONString(displayAttribute));
        return BeanRet.create(true, "查询详情信息", displayAttribute);
    }


    /**
     * 查询显示属性详情信息
     *
     * @param mapFieldColumnCode 字段编码
     * @return BeanRet
     */
    @ApiOperation(value = "查询显示属性详情信息", notes = "查询显示属性详情信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "mapFieldColumnCode", value = "字段编码", paramType = "query")
    })
    @GetMapping(value = "/loadByMapFieldColumnCode")
    @ResponseBody
    public BeanRet loadByMapFieldColumnCode(@PathVariable String mapFieldColumnCode) {
        if (StringTools.isEmpty(mapFieldColumnCode)) {
            return BeanRet.create();
        }

        DisplayAttribute displayAttribute = displayAttributeSV.loadByMapFieldColumnCode(mapFieldColumnCode);
        logger.info(JSON.toJSONString(displayAttribute));
        return BeanRet.create(true, "查询详情信息", displayAttribute);
    }


    /**
     * 查询显示属性信息集合
     *
     * @return 分页对象
     */
    @ApiOperation(value = "查询显示属性信息集合", notes = "查询显示属性信息集合")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "curPage", value = "当前页", required = true, paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", required = true, paramType = "query"),
            @ApiImplicitParam(name = "id", value = "", paramType = "query"),
            @ApiImplicitParam(name = "mapFieldColumnCode", value = "字段编码", paramType = "query"),
            @ApiImplicitParam(name = "isRequired", value = "是否必填 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isAllowUpdate", value = "是否允许修改 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isListPageDisplay", value = "是否分页列表显示 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isDetailPageDisplay", value = "是否详情页显示 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isQueryRequired", value = "是否是查询条件 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "displayType", value = "显示格式 自动完成 Autocomplete,级联选择 Cascader,日期选择框 DatePicker,时间选择 TimePicker,输入框 Input,数字输入框 InputNumber,提及 Mention,邮箱 Email，电话Phone，手机Mobile，备注说明 Summary，选择器 Select，单选 Radio，多选框 Checkbox,评分 Rate,加载展位图 Skeleton,滑动输入条 Silder，开关 Switch,穿梭框 Transfer,选择树 TreeSelect ,上传 Upload,头像 Avatar", paramType = "query")
    })
    @GetMapping(value = "/list")
    @ResponseBody
    public BeanRet list(@ApiIgnore DisplayAttribute displayAttribute, @ApiIgnore Page<DisplayAttribute> page) {
        if (page == null) {
            return BeanRet.create(false, "分页对象不能为空");
        }
        page.setParams(JSON.parseObject(JSON.toJSONString(displayAttribute)));
        page = displayAttributeSV.getList(page);
        return BeanRet.create(true, "查询成功", page);
    }

    /**
     * 创建显示属性
     *
     * @return BeanRet
     */
    @ApiOperation(value = "创建显示属性", notes = "创建显示属性")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "", paramType = "query", required = true),
            @ApiImplicitParam(name = "mapFieldColumnCode", value = "字段编码", paramType = "query", required = true),
            @ApiImplicitParam(name = "isRequired", value = "是否必填 Y,N", paramType = "query", required = true),
            @ApiImplicitParam(name = "isAllowUpdate", value = "是否允许修改 Y,N", paramType = "query", required = true),
            @ApiImplicitParam(name = "isListPageDisplay", value = "是否分页列表显示 Y,N", paramType = "query", required = true),
            @ApiImplicitParam(name = "isDetailPageDisplay", value = "是否详情页显示 Y,N", paramType = "query", required = true),
            @ApiImplicitParam(name = "isQueryRequired", value = "是否是查询条件 Y,N", paramType = "query", required = true),
            @ApiImplicitParam(name = "displayType", value = "显示格式 自动完成 Autocomplete,级联选择 Cascader,日期选择框 DatePicker,时间选择 TimePicker,输入框 Input,数字输入框 InputNumber,提及 Mention,邮箱 Email，电话Phone，手机Mobile，备注说明 Summary，选择器 Select，单选 Radio，多选框 Checkbox,评分 Rate,加载展位图 Skeleton,滑动输入条 Silder，开关 Switch,穿梭框 Transfer,选择树 TreeSelect ,上传 Upload,头像 Avatar", paramType = "query", required = true)
    })
    @PostMapping("/save")
    @ResponseBody
    public BeanRet save(@ApiIgnore DisplayAttribute displayAttribute) {
        displayAttributeSV.save(displayAttribute);
        return BeanRet.create(true, "保存成功");
    }


    /**
     * 修改显示属性
     *
     * @return BeanRet
     */
    @ApiOperation(value = "修改显示属性", notes = "修改显示属性")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "", paramType = "query"),
            @ApiImplicitParam(name = "mapFieldColumnCode", value = "字段编码", paramType = "query"),
            @ApiImplicitParam(name = "isRequired", value = "是否必填 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isAllowUpdate", value = "是否允许修改 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isListPageDisplay", value = "是否分页列表显示 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isDetailPageDisplay", value = "是否详情页显示 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "isQueryRequired", value = "是否是查询条件 Y,N", paramType = "query"),
            @ApiImplicitParam(name = "displayType", value = "显示格式 自动完成 Autocomplete,级联选择 Cascader,日期选择框 DatePicker,时间选择 TimePicker,输入框 Input,数字输入框 InputNumber,提及 Mention,邮箱 Email，电话Phone，手机Mobile，备注说明 Summary，选择器 Select，单选 Radio，多选框 Checkbox,评分 Rate,加载展位图 Skeleton,滑动输入条 Silder，开关 Switch,穿梭框 Transfer,选择树 TreeSelect ,上传 Upload,头像 Avatar", paramType = "query")
    })
    @PutMapping("/modify")
    @ResponseBody
    public BeanRet modify(@ApiIgnore DisplayAttribute displayAttribute) {
        displayAttributeSV.update(displayAttribute);
        return BeanRet.create(true, "修改成功");
    }

}
/*
 * http://www.aicode.io
本代码仅用于AI-Code.
 */

package io.aicode.display.dao;

import com.google.common.collect.Maps;
import io.aicode.base.BaseMybatisDAOImpl;
import io.aicode.display.entity.DisplayAttribute;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 显示属性
 *
 * @author lixin
 */
@Repository
public class DisplayAttributeDAO extends BaseMybatisDAOImpl<DisplayAttribute, Long> {

    /**
     * 加载一个对象显示属性 通过mapFieldColumnCode
     *
     * @param mapFieldColumnCode 字段编码
     * @return DisplayAttribute
     */
    public DisplayAttribute loadByMapFieldColumnCode(String mapFieldColumnCode) {
        return getSqlSession().selectOne(this.sqlmapNamespace + ".loadByMapFieldColumnCode", mapFieldColumnCode);
    }

    /**
     * 更新对象显示属性 通过mapFieldColumnCode
     *
     * @param mapFieldColumnCode 字段编码
     */
    public void updateByMapFieldColumnCode(DisplayAttribute displayAttribute, String mapFieldColumnCode) {
        if (mapFieldColumnCode != null) {
            displayAttribute.setMapFieldColumnCode(mapFieldColumnCode);
        }
        getSqlSession().update(this.sqlmapNamespace + ".update", displayAttribute);
    }

    /**
     * 删除对象显示属性
     *
     * @param id @param mapFieldColumnCode 字段编码
     */
    public void delete(Long id, String mapFieldColumnCode) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (id != null) {
            map.put("id", id);
        }
        if (mapFieldColumnCode != null) {
            map.put("mapFieldColumnCode", mapFieldColumnCode);
        }
        getSqlSession().delete(this.sqlmapNamespace + ".delete", map);
    }

    /**
     * 根据项目编码统计是否已经设置显示属性
     *
     * @param projectCode 项目编码
     * @return int
     */
    public int countByProjectCode(String projectCode) {
        Map<String, Object> map = Maps.newHashMap();
        map.put("projectCode", projectCode);
        return getSqlSession().selectOne(sqlmapNamespace + ".countByProjectCode", map);
    }
}

/*
 * Powered By [lixin]
 *
 */

package com.rzhkj.project.dao;


import com.rzhkj.core.base.BaseMybatisDAOImpl;
import com.rzhkj.project.entity.FrameworkAttribute;
import org.springframework.stereotype.Repository;


@Repository
public class FrameworkAttributeDAO extends BaseMybatisDAOImpl<FrameworkAttribute, Long> {

    /**
     * 删除
     *
     * @param code 属性编码
     */
    public void delete(String code) {
        getSqlSession().delete(sqlmapNamespace + ".delete", code);
    }
}

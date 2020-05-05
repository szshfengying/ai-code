package io.aicode.base.core.mysql;

import io.aicode.base.tools.StringTools;
import org.apache.commons.collections.CollectionUtils;

import java.util.List;

/**
 * Created by chendehui on 20/5/5.
 */
public class SqlToJava {

    public static String getTableName(String sql) {
        List<String> list = StringTools.getByPattern(sql, "");
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        return list.get(0);
    }

    public static void main(String[] args) {
        String sql = "CREATE TABLE `project_model`  (\n" +
                "  `id` bigint(20) NOT NULL,\n" +
                "  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '模块编码',\n" +
                "  `pre_code` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '上级模块编码',\n" +
                "  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '模块显示名称',\n" +
                "  `route` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '模块路由',\n" +
                "  `css` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '模块css样式',\n" +
                "  `is_menu` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '是否是菜单 Y,N',\n" +
                "  `ico` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '模块图标',\n" +
                "  PRIMARY KEY (`id`, `code`) USING BTREE\n" +
                ") ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '模块' ROW_FORMAT = Dynamic;";
        //获取包含 表明的sql片段
        List<String> matchList = StringTools.getByPattern(sql, "\\s*(CREATE|create)\\s?(TABLE|table)\\s?[`]*\\w+[`]*\\s*\\(");
        System.out.println(matchList);
        //获取表名注释sql片段
        matchList = StringTools.getByPattern(sql, "(COMMENT|comment)\\s*=\\s*'\\W*'");
        System.out.println(matchList);
        //获取字段声明sql片段
        matchList = StringTools.getByPattern(sql, "\\s{2,}[`\\w_]*\\s+\\w+[\\(\\d+\\)]*['\\d*\\-:\\s\\a-zA-Z_\\u4e00-\\u9fa5]*,");
        System.out.println(matchList);


    }

}

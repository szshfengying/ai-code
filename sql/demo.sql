-- AI-Code 为您构建代码，享受智慧生活!
DROP DATABASE if EXISTS sms;
CREATE DATABASE sms;
USE sms;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dglg_sms
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `seq_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(20) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_change_proposal`
--

DROP TABLE IF EXISTS `customer_bank_change_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_bank_change_proposal` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `bank_card_id` bigint(20) NOT NULL,
  `before_bank_card_status` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `username` varchar(20) NOT NULL,
  `old_account` varchar(50) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `old_bank` varchar(10) DEFAULT NULL,
  `bank` varchar(10) NOT NULL,
  `old_branch` varchar(255) DEFAULT NULL,
  `new_branch` varchar(255) NOT NULL,
  `old_realname` varchar(20) DEFAULT NULL,
  `realname` varchar(20) NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `auditor` varchar(20) DEFAULT NULL,
  `audit_at` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_reference` (`reference`),
  KEY `i_username` (`username`),
  KEY `i_bank_card_id` (`bank_card_id`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_info` (
  `seq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(255) NOT NULL DEFAULT '',
  `bank_name` varchar(255) NOT NULL DEFAULT '',
  `enabled` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(20) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `bank_code` (`bank_code`),
  UNIQUE KEY `bank_name` (`bank_name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `common_payee`
--

DROP TABLE IF EXISTS `customer_common_payee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_common_payee` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user` varchar(20) NOT NULL,
  `target_user` varchar(20) NOT NULL,
  `target_realname` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_from_target` (`from_user`,`target_user`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_change_proposal`
--

DROP TABLE IF EXISTS `customer_credit_change_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_credit_change_proposal` (
  `seq_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'seq_id',
  `username` varchar(20) NOT NULL DEFAULT '会员登录名',
  `reference` varchar(20) NOT NULL DEFAULT '' COMMENT '提案编号',
  `credit` decimal(22,6) NOT NULL DEFAULT '0.000000' COMMENT '变更金额',
  `income` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1，添加额度，0，减少额度',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `audit_time` datetime DEFAULT NULL,
  `audit_by` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(50) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(50) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  KEY `i_username` (`username`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='会员额度变更请求';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_change_record`
--

DROP TABLE IF EXISTS `customer_credit_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_credit_change_record` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `income` bit(1) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `before_amount` decimal(22,6) NOT NULL,
  `amount` decimal(22,6) NOT NULL,
  `after_amount` decimal(22,6) NOT NULL,
  `reference` varchar(30) NOT NULL,
  `wallet_type` tinyint(4) NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  PRIMARY KEY (`seq_id`),
  KEY `i_username` (`username`) USING BTREE,
  KEY `i_reference` (`reference`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=75059 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '(hash后的)密码',
  `salt` varchar(18) NOT NULL COMMENT '盐',
  `type` tinyint(4) NOT NULL COMMENT '用户类型',
  `invitation_code` varchar(10) NOT NULL DEFAULT '' COMMENT '注册使用的邀请码',
  `invitation_user` varchar(20) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(20) NOT NULL COMMENT '创建人',
  `create_url` varchar(255) NOT NULL COMMENT '创建的url',
  `create_ip` varchar(50) NOT NULL COMMENT '创建IP',
  `last_update_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `parent_second` varchar(50) NOT NULL DEFAULT '' COMMENT '二级上级',
  `parent_third` varchar(50) NOT NULL DEFAULT '' COMMENT '三级上级',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `locked` bit(1) NOT NULL,
  `last_locked_time` datetime DEFAULT NULL,
  `last_locked_by` varchar(20) DEFAULT NULL,
  `locked_until` datetime DEFAULT NULL,
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_username` (`product_code`,`username`) USING BTREE,
  KEY `i_invitation_code` (`invitation_code`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2113 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表，该表记录着用户的私密信息.如用户名，密码。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_bank_card`
--

DROP TABLE IF EXISTS `customer_bank_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_bank_card` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `real_name` varchar(20) NOT NULL,
  `card_account` varchar(50) NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `branch` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  PRIMARY KEY (`seq_id`),
  KEY `i_owner` (`owner`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1254253307320664066 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_data`
--

DROP TABLE IF EXISTS `customer_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_data` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `level` tinyint(4) NOT NULL COMMENT '等级',
  `commission` decimal(22,6) NOT NULL,
  `virtual_credit` decimal(22,6) NOT NULL COMMENT '额度',
  `login_times` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `total_deposit` decimal(22,6) NOT NULL DEFAULT '0.000000',
  `total_agent_commission` decimal(22,6) NOT NULL DEFAULT '0.000000',
  `success_login_times` int(11) NOT NULL DEFAULT '0' COMMENT '成功登陆次数',
  `last_read_deposit_deal_time` datetime NOT NULL,
  `last_deposit_time` datetime DEFAULT NULL,
  `last_deposit_amount` decimal(22,6) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(20) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_username` (`product_code`,`username`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2092 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户数据表，记录着用户的数值信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `phone` varchar(50) NOT NULL,
  `wechat` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL COMMENT '名字',
  `last_update_time` datetime NOT NULL COMMENT '最后修改时间',
  `last_update_by` varchar(20) NOT NULL COMMENT '最后修改人',
  `create_by` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `liaotianbao_id` varchar(50) NOT NULL DEFAULT '' COMMENT '聊天宝ID',
  `liaotianbao_nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '聊天宝昵称',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_username` (`product_code`,`username`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2092 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表。该表记录着用户的个人信息。包括手机、住址、姓名等等。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_login_log`
--

DROP TABLE IF EXISTS `customer_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_login_log` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `current_name` varchar(50) NOT NULL COMMENT '当前姓名',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  `client_ip` varchar(50) NOT NULL COMMENT '登陆ip',
  `area` varchar(50) NOT NULL COMMENT '登陆地区',
  `referer` varchar(255) NOT NULL COMMENT 'referrer',
  `agent` varchar(255) NOT NULL COMMENT '浏览器',
  `host` varchar(100) NOT NULL,
  `success` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否成功',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(20) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`seq_id`) USING BTREE,
  KEY `i_username` (`username`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7929 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登录日志。记录着用户每次的登录信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_remark`
--

DROP TABLE IF EXISTS `customer_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_remark` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`seq_id`),
  KEY `i_username` (`username`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_setting`
--

DROP TABLE IF EXISTS `customer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_setting` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `sys_msg_notice` bit(1) NOT NULL COMMENT '是否接受系统消息',
  `use_lang` tinyint(4) NOT NULL,
  `withdraw_password` varchar(50) NOT NULL DEFAULT '' COMMENT '取款密码',
  `need_create_group` bit(1) NOT NULL DEFAULT b'0',
  `ali_max_group` int(11) NOT NULL DEFAULT '1',
  `wechat_max_group` int(11) NOT NULL DEFAULT '1',
  `yun_max_group` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(20) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(20) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `receipt` bit(1) NOT NULL DEFAULT b'1',
  `daily_ali_receipt` int(11) NOT NULL DEFAULT '25',
  `daily_wechat_receipt` int(11) NOT NULL DEFAULT '25',
  `daily_yun_receipt` int(11) NOT NULL DEFAULT '25',
  `daily_ali_receipt_total` int(11) NOT NULL DEFAULT '0',
  `daily_wechat_receipt_total` int(11) NOT NULL DEFAULT '0',
  `daily_yun_receipt_total` int(11) NOT NULL DEFAULT '0',
  `pending_ali_limit` int(11) NOT NULL DEFAULT '5',
  `pending_wechat_limit` int(11) NOT NULL DEFAULT '5',
  `pending_yun_limit` int(11) NOT NULL DEFAULT '5',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `open_dpay` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_username` (`product_code`,`username`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2093 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户设定表，保存用户对系统的基本设置。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_code`
--

DROP TABLE IF EXISTS `customer_inv_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_inv_code` (
  `seq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inv_code` varchar(20) NOT NULL,
  `owner` varchar(20) NOT NULL,
  `used` bit(1) NOT NULL,
  `user` varchar(20) NOT NULL,
  `used_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_inv_code` (`inv_code`),
  KEY `i_owner` (`owner`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_code` varchar(50) NOT NULL COMMENT '商户编号',
  `nick_name` varchar(50) NOT NULL COMMENT '商户名称',
  `tenant_code` varchar(50) NOT NULL COMMENT '所属租户编号',
  `enabled` bit(1) NOT NULL COMMENT '是否启用',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `callback_url` varchar(255) NOT NULL DEFAULT '' COMMENT '回调地址',
  `private_key` varchar(255) NOT NULL COMMENT '秘钥',
  `revise` bit(1) NOT NULL COMMENT '是否可以修正',
  `revise_max_times` int(11) NOT NULL COMMENT '最大修正次数',
  `revised_offset` decimal(22,6) NOT NULL COMMENT '修正偏移量',
  `fix_only` bit(1) NOT NULL COMMENT '只使用固码',
  `daily_withdraw_times` int(11) NOT NULL COMMENT '每日提款次数',
  `daily_withdraw_limit` int(11) NOT NULL COMMENT '每日提款上限',
  `withdraw_min_limit` decimal(22,6) NOT NULL COMMENT '每次提款最低额度',
  `withdraw_max_limit` decimal(22,6) NOT NULL COMMENT '每次提款最高额度',
  `withdraw_fee_rate` decimal(22,6) NOT NULL COMMENT '提款费率',
  `create_time` datetime NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(50) NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `anti_brush_limit` int(11) NOT NULL,
  `disabled_time` datetime DEFAULT NULL COMMENT '禁用时间',
  `withdraw_password` varchar(50) NOT NULL DEFAULT '' COMMENT '商户提款密码',
  `withdraw_interface_type` int(11) NOT NULL DEFAULT '1' COMMENT '1，人工。2，e闪付。3，汇才纯代',
  `withdraw_interface_url` varchar(1024) NOT NULL DEFAULT '',
  `withdraw_interface_app_id` varchar(64) NOT NULL DEFAULT '',
  `withdraw_interface_key` varchar(128) NOT NULL DEFAULT '',
  `withdraw_interface_aes_key` varchar(128) NOT NULL DEFAULT '',
  `open_dpay` int(11) NOT NULL DEFAULT '0',
  `dpay_wallet_min_limit` decimal(22,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_merchant_code` (`merchant_code`),
  KEY `i_tenant_code` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='商户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_data`
--

DROP TABLE IF EXISTS `merchant_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_data` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_code` varchar(50) NOT NULL COMMENT '商户编号',
  `tenant_code` varchar(50) NOT NULL COMMENT '所属租户编号',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '等级',
  `wallet` decimal(22,6) NOT NULL DEFAULT '0.000000' COMMENT '钱包',
  `payment_total` decimal(22,6) NOT NULL COMMENT '存款总额',
  `divided_total` decimal(22,6) NOT NULL COMMENT '分润总额',
  `recover_total` decimal(22,6) NOT NULL COMMENT '追回总额',
  `last_withdraw_time` datetime DEFAULT NULL COMMENT '最后提款时间',
  `last_withdraw_amount` decimal(22,6) NOT NULL COMMENT '最后提款额度',
  `withdraw_total` decimal(22,6) NOT NULL COMMENT '提款总额',
  `withdraw_times` int(11) NOT NULL COMMENT '提款总次数',
  `repair_add_total` decimal(22,6) NOT NULL COMMENT '修复加款总额',
  `repair_sub_total` decimal(22,6) NOT NULL COMMENT '修复减款总额',
  `create_time` datetime NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(50) NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_merchant_code` (`merchant_code`),
  KEY `i_tenant_code` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='商户数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_wallet_change_record`
--

DROP TABLE IF EXISTS `merchant_wallet_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_wallet_change_record` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_code` varchar(50) NOT NULL COMMENT '商户号',
  `tenant_code` varchar(50) NOT NULL COMMENT '租户编号',
  `income` bit(1) NOT NULL COMMENT '进出款',
  `type` tinyint(4) NOT NULL COMMENT '商户额度变更类型',
  `wallet_before` decimal(22,6) NOT NULL,
  `amount` decimal(22,6) NOT NULL COMMENT '加/减 额度',
  `wallet_after` decimal(22,6) NOT NULL,
  `query_reference` varchar(30) NOT NULL COMMENT '对应的订单号',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `product_code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`seq_id`),
  KEY `i_merchant_code` (`merchant_code`),
  KEY `i_query_reference` (`query_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=14091 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_wallet_repair_proposal`
--

DROP TABLE IF EXISTS `merchant_wallet_repair_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_wallet_repair_proposal` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `tenant_code` varchar(50) NOT NULL,
  `merchant_code` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `amount` decimal(22,6) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_by` varchar(30) DEFAULT NULL COMMENT '审核人',
  `create_time` datetime NOT NULL,
  `create_by` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(30) NOT NULL,
  `locked_by` varchar(30) DEFAULT NULL,
  `locked_time` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  KEY `i_reference` (`reference`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_merchant_code` (`merchant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_withdraw_proposal`
--

DROP TABLE IF EXISTS `merchant_withdraw_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_withdraw_proposal` (
  `seq_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL COMMENT '提款请求订单号',
  `tenant_code` varchar(50) NOT NULL COMMENT '租户编号',
  `merchant_code` varchar(50) NOT NULL COMMENT '商户编号',
  `merchant_bank_card_ref` varchar(50) NOT NULL COMMENT '商户银行卡索引',
  `merchant_bank_card_account` varchar(50) NOT NULL COMMENT '商户银行卡账号',
  `amount` decimal(22,6) NOT NULL COMMENT '提款金额',
  `status` tinyint(4) NOT NULL COMMENT '提案状态',
  `tenant_bank_card_ref` varchar(50) NOT NULL COMMENT '租户银行卡索引',
  `tenant_bank_card_account` varchar(50) NOT NULL COMMENT '租户银行卡账号',
  `service_fee_rate` decimal(22,6) NOT NULL COMMENT '提款服务费率',
  `service_fee` decimal(22,6) NOT NULL COMMENT '提款服务费用',
  `real_amount` decimal(22,6) NOT NULL COMMENT '实际到账额度',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_by` varchar(30) DEFAULT NULL COMMENT '审核人',
  `create_time` datetime NOT NULL,
  `create_by` varchar(30) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(30) NOT NULL,
  `locked_by` varchar(30) DEFAULT NULL,
  `locked_time` datetime DEFAULT NULL,
  `merchant_bank_card_province` varchar(20) NOT NULL COMMENT '商户银行卡省',
  `merchant_bank_card_city` varchar(20) NOT NULL COMMENT '商户银行卡市',
  `merchant_bank_card_branch` varchar(50) NOT NULL COMMENT '商户银行卡支行地址',
  `tenant_bank_card_province` varchar(20) NOT NULL COMMENT '租户银行卡省',
  `tenant_bank_card_city` varchar(20) NOT NULL COMMENT '租户银行卡市',
  `tenant_bank_card_branch` varchar(50) NOT NULL COMMENT '租户银行卡支行地址',
  `merchant_bank_card_nick_name` varchar(50) NOT NULL COMMENT '商户银行卡昵称',
  `tenant_bank_card_nick_name` varchar(50) NOT NULL COMMENT '租户银行卡昵称',
  `tenant_bank_card_realname` varchar(50) NOT NULL COMMENT '开户名称',
  `merchant_bank_card_realname` varchar(50) NOT NULL COMMENT '开户名称',
  `callback` varchar(255) DEFAULT NULL,
  `merchant_bank` varchar(10) NOT NULL DEFAULT '' COMMENT '商戶银行编号',
  `tenant_bank` varchar(10) DEFAULT NULL COMMENT '租户银行编号',
  `withdraw_interface_type` int(11) NOT NULL DEFAULT '1' COMMENT '1，人工。2，e闪付。3，汇才纯代',
  `request_reference` varchar(128) NOT NULL DEFAULT '',
  `third_reference` varchar(128) NOT NULL DEFAULT '',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_reference` (`reference`),
  KEY `i_merchant_bank_card_ref` (`merchant_bank_card_ref`),
  KEY `i_tenant_bank_card_ref` (`tenant_bank_card_ref`),
  KEY `i_merchant_bank_card_account` (`merchant_bank_card_account`),
  KEY `i_tenant_bank_card_account` (`tenant_bank_card_account`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_code` varchar(50) NOT NULL COMMENT '产品编号',
  `model` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属模式',
  `nick_name` varchar(50) NOT NULL COMMENT '产品名称',
  `tenant_code` varchar(50) NOT NULL COMMENT '所属租户编号',
  `enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `create_by` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `last_update_by` varchar(50) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `disabled_time` datetime DEFAULT NULL COMMENT '禁用时间',
  `app_Version` varchar(50) NOT NULL DEFAULT '' COMMENT 'app版本号',
  `app_ready` int(11) NOT NULL DEFAULT '0' COMMENT '是否已打包',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_product_code` (`product_code`),
  KEY `i_tenant_code` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge_deal`
--

DROP TABLE IF EXISTS `customer_recharge_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_recharge_deal` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `provider_reference` varchar(30) DEFAULT NULL,
  `amount` decimal(22,6) NOT NULL,
  `real_amount` decimal(22,6) DEFAULT NULL,
  `bank` varchar(10) DEFAULT NULL,
  `owner` varchar(20) NOT NULL DEFAULT '',
  `receipt_card` varchar(50) NOT NULL,
  `deposit_card` varchar(50) NOT NULL,
  `depositor` varchar(20) NOT NULL,
  `auditor` varchar(20) DEFAULT NULL,
  `auditor_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `recharge_interface_type` int(11) NOT NULL DEFAULT '1' COMMENT '1，人工。2，e闪付。3，欢乐宝资金平台',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_reference` (`reference`) USING BTREE,
  KEY `i_username` (`username`),
  KEY `i_provider_reference` (`provider_reference`) USING BTREE,
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_info`
--

DROP TABLE IF EXISTS `res_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_info` (
  `seq_id` bigint(20) NOT NULL,
  `res_group` int(20) NOT NULL DEFAULT '-1',
  `super_group` int(20) NOT NULL DEFAULT '-1',
  `category` int(20) NOT NULL DEFAULT '-1',
  `res_level` int(20) NOT NULL DEFAULT '-1',
  `need_sys_role` int(20) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role2`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `seq_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(50) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(50) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `super_role` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `create_by_role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者角色',
  PRIMARY KEY (`seq_id`),
  KEY `i_tenant_code` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='角色（新后台）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_res`
--

DROP TABLE IF EXISTS `role_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_res` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `merchant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属商户',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `enabled` int(11) NOT NULL DEFAULT '0' COMMENT '是否有权限',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(50) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `k_unique` (`role_id`,`res_id`,`tenant_code`,`merchant_code`,`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=282043 DEFAULT CHARSET=utf8 COMMENT='角色所拥有的权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_properties`
--

DROP TABLE IF EXISTS `product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_property` (
  `sys_key` varchar(255) NOT NULL,
  `sys_value` varchar(255) NOT NULL COMMENT '系统值',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(50) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(50) NOT NULL DEFAULT '',
  `model` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属模式',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `sys_role_update` int(11) NOT NULL DEFAULT '0' COMMENT '只有系统角色能修改',
  `sys_role_read` int(11) NOT NULL DEFAULT '0' COMMENT '只对系统角色可见',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_unique` (`product_code`,`sys_key`,`model`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1958 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_code` varchar(50) NOT NULL COMMENT '租户编号',
  `nick_name` varchar(50) NOT NULL COMMENT '租户名称',
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(50) NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `disabled_time` datetime DEFAULT NULL COMMENT '禁用时间',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_tenant_code` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='租户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_deal`
--

DROP TABLE IF EXISTS `customer_transfer_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_transfer_deal` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user` varchar(20) NOT NULL,
  `to_user` varchar(20) NOT NULL,
  `amount` decimal(22,6) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(20) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `last_update_by` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属产品',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_reference` (`reference`),
  KEY `i_from_user` (`from_user`),
  KEY `i_to_user` (`to_user`),
  KEY `i_tenant_code` (`tenant_code`),
  KEY `i_product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user2`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `seq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_login_time` datetime DEFAULT NULL,
  `remark` varchar(50) NOT NULL COMMENT '备注',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `create_by` varchar(50) NOT NULL DEFAULT '',
  `last_update_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `last_update_by` varchar(50) NOT NULL DEFAULT '',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `ip_allow_login` varchar(1024) NOT NULL DEFAULT '' COMMENT '允许登录的IP',
  `create_by_role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者角色',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='后台管理员（新后台）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_operation_log`
--

DROP TABLE IF EXISTS `user_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_log` (
  `seq_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'seq_id',
  `op_catelogue` int(11) NOT NULL DEFAULT '0' COMMENT '操作分类。',
  `op_type` int(11) NOT NULL DEFAULT '0' COMMENT '操作。',
  `op_target_type` int(11) NOT NULL DEFAULT '0' COMMENT '操作对象类型。',
  `success` int(11) NOT NULL DEFAULT '0' COMMENT '操作是否成功',
  `client_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '客户端IP',
  `client_agent` varchar(255) NOT NULL DEFAULT '' COMMENT '客户端信息（浏览器信息）',
  `request_param` varchar(4096) NOT NULL DEFAULT '' COMMENT '请求参数',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `time_spend` int(11) NOT NULL DEFAULT '0' COMMENT '处理费时',
  `create_time` datetime NOT NULL DEFAULT '2019-01-01 00:00:00' COMMENT '操作时间',
  `create_by` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `time_spend2` int(11) NOT NULL DEFAULT '0' COMMENT '处理费时2',
  `tenant_code` varchar(50) NOT NULL DEFAULT '' COMMENT '所属租户',
  `ari` varchar(50) NOT NULL DEFAULT '' COMMENT '请求ID',
  PRIMARY KEY (`seq_id`,`create_time`),
  KEY `i_create_by` (`create_by`),
  KEY `idx_time_spend` (`time_spend`),
  KEY `i_tenant_code` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8 COMMENT='后台用户操作日志'
/*!50500 PARTITION BY RANGE  COLUMNS(create_time)
(PARTITION p_201900 VALUES LESS THAN ('2020-01-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202001 VALUES LESS THAN ('2020-02-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202002 VALUES LESS THAN ('2020-03-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202003 VALUES LESS THAN ('2020-04-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202004 VALUES LESS THAN ('2020-05-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202005 VALUES LESS THAN ('2020-06-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202006 VALUES LESS THAN ('2020-07-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202007 VALUES LESS THAN ('2020-08-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202008 VALUES LESS THAN ('2020-09-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202009 VALUES LESS THAN ('2020-10-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202010 VALUES LESS THAN ('2020-11-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202011 VALUES LESS THAN ('2020-12-01 00:00:00') ENGINE = InnoDB,
 PARTITION p_202012 VALUES LESS THAN ('2021-01-01 00:00:00') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 13:46:01

CREATE TABLE `worker_node` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
  `HOST_NAME` varchar(64) NOT NULL COMMENT 'host name',
  `PORT` varchar(64) NOT NULL COMMENT 'port',
  `TYPE` int(11) NOT NULL COMMENT 'node type: ACTUAL or CONTAINER',
  `LAUNCH_DATE` date NOT NULL COMMENT 'launch date',
  `MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'modified time',
  `CREATED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'created time',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1263 DEFAULT CHARSET=utf8 COMMENT='DB WorkerID Assigner for UID Generator';

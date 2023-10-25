/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : localhost:3306
 Source Schema         : baoxiao

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 25/10/2023 21:28:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for baoxiao_bank
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_bank`;
CREATE TABLE `baoxiao_bank` (
  `bank_id` bigint(20) NOT NULL COMMENT '银行id',
  `bank_name` varchar(40) NOT NULL COMMENT '银行名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0显示 1隐藏）',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='银行';

-- ----------------------------
-- Records of baoxiao_bank
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_bank` VALUES (1, '1', 1, 1, '1', '2023-10-16 22:06:10', '1', '2023-10-16 22:06:14', '');
COMMIT;

-- ----------------------------
-- Table structure for baoxiao_client
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_client`;
CREATE TABLE `baoxiao_client` (
  `client_id` bigint(20) NOT NULL COMMENT '客商id',
  `client_unit_name` varchar(60) NOT NULL COMMENT '客商单位名称',
  `client_agreement_name` varchar(60) NOT NULL COMMENT '客商协议名称',
  `business_type` tinyint(1) NOT NULL COMMENT '业务类型',
  `customer_name` varchar(20) NOT NULL COMMENT '客服人员',
  `sell_name` varchar(20) NOT NULL COMMENT '销售人员',
  `contacts_name` varchar(20) NOT NULL COMMENT '联系人',
  `phone` char(11) NOT NULL COMMENT '联系电话',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0显示 1隐藏）',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户信息';

-- ----------------------------
-- Records of baoxiao_client
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_client` VALUES (1714468353012334593, '菁鸿科技（备注）', '菁鸿科技', 0, '疯狂的狮子Li', '本部门及以下 密码666666', '王', '13512345678', 0, 0, 0, '', '2023-10-18 10:28:03', 'admin', '2023-10-18 10:28:03', 'admin');
INSERT INTO `baoxiao_client` VALUES (1714468691626885121, '四海服饰（服装）', '四海服饰', 1, '疯狂的狮子Li', '本部门及以下 密码666666', '王', '13512345678', 0, 0, 0, '', '2023-10-18 10:29:24', 'admin', '2023-10-18 10:29:24', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for baoxiao_collection
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_collection`;
CREATE TABLE `baoxiao_collection` (
  `collection_id` bigint(20) NOT NULL COMMENT '费用id',
  `collection_sum` decimal(10,2) NOT NULL COMMENT '金额',
  `collection_user` varchar(20) NOT NULL COMMENT '收款人姓名',
  `collection_bank` char(19) NOT NULL COMMENT '银行卡',
  `collection_bank_name` varchar(40) NOT NULL COMMENT '银行名称',
  `collection_bank_address` varchar(60) NOT NULL COMMENT '开户行',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收款人信息';

-- ----------------------------
-- Records of baoxiao_collection
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_collection` VALUES (1716360039988604930, 1.00, '1', '1', '1', '1');
INSERT INTO `baoxiao_collection` VALUES (1716446407116918786, 222.00, '222', '222', '222', '222');
INSERT INTO `baoxiao_collection` VALUES (1716452557010989058, 666.00, '666', '666', '666', '666');
COMMIT;

-- ----------------------------
-- Table structure for baoxiao_company
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_company`;
CREATE TABLE `baoxiao_company` (
  `company_id` bigint(20) NOT NULL COMMENT '公司id',
  `company_name` varchar(60) NOT NULL COMMENT '公司名称',
  `company_address` varchar(255) NOT NULL COMMENT '公司地址',
  `company_contact` varchar(20) NOT NULL COMMENT '公司联系人',
  `phone` char(11) NOT NULL COMMENT '联系电话',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态（0显示 1隐藏）',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子公司管理';

-- ----------------------------
-- Records of baoxiao_company
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_company` VALUES (1714455348723757058, '盈信贸易', '北京', '王', '13888888888', 0, 0, '', '2023-10-18 09:36:23', 'admin', '2023-10-18 09:36:23', 'admin');
INSERT INTO `baoxiao_company` VALUES (1714455534346874881, '优乐钢材', '上海', '王', '13888888888', 0, 0, '', '2023-10-18 09:37:07', 'admin', '2023-10-18 09:37:07', 'admin');
INSERT INTO `baoxiao_company` VALUES (1714455639149948929, '福朵鞋业', '广州', '王', '13888888888', 0, 0, '', '2023-10-18 09:37:32', 'admin', '2023-10-18 09:37:32', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for baoxiao_fee
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_fee`;
CREATE TABLE `baoxiao_fee` (
  `fee_id` bigint(20) NOT NULL COMMENT '费用id',
  `fee_item` varchar(60) NOT NULL COMMENT '收支项目',
  `baoxiao_sum` decimal(10,2) NOT NULL COMMENT '报销金额',
  `tax_rate` decimal(5,2) NOT NULL COMMENT '税率%',
  `special_ricket` decimal(5,2) NOT NULL COMMENT '进项税额（专票）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='费用明细';

-- ----------------------------
-- Records of baoxiao_fee
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_fee` VALUES (1716446406965923842, '222', 222.00, 222.00, 222.00);
INSERT INTO `baoxiao_fee` VALUES (1716360039950856193, '1', 1.00, 1.00, 1.00);
INSERT INTO `baoxiao_fee` VALUES (1716452556964851713, '999', 999.00, 999.00, 999.00);
COMMIT;

-- ----------------------------
-- Table structure for baoxiao_order
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_order`;
CREATE TABLE `baoxiao_order` (
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `order_number` bigint(20) NOT NULL COMMENT '订单编号',
  `order_type` tinyint(1) NOT NULL COMMENT '订单类型',
  `order_date` datetime NOT NULL COMMENT '订单日期',
  `baoxiao_type` tinyint(1) NOT NULL COMMENT '报销类型',
  `baoxiao_sum` decimal(10,2) NOT NULL COMMENT '报销金额',
  `payment_sum` decimal(10,2) NOT NULL COMMENT '支付金额',
  `offset_loan_sum` decimal(10,2) NOT NULL COMMENT '冲借款金额',
  `total_amount` decimal(10,2) NOT NULL COMMENT '金额合计',
  `collection_id` bigint(20) NOT NULL COMMENT '收款人',
  `fee_id` bigint(20) NOT NULL COMMENT '费用明细id',
  `is_offset_loan` tinyint(1) NOT NULL DEFAULT '0' COMMENT '冲借款 (0 未冲 1已冲)',
  `is_dept_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '部门分摊 (0末分 1已分)',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 （0显示 1隐藏）',
  `user_id` bigint(20) NOT NULL COMMENT '制单人id',
  `user_name` varchar(40) NOT NULL COMMENT '制单人',
  `baoxiao_user_id` bigint(20) NOT NULL COMMENT '报销人id',
  `baoxiao_user_name` varchar(20) NOT NULL COMMENT '报销人名称',
  `dept_id` bigint(20) NOT NULL COMMENT '报销部门id',
  `dept_name` varchar(40) NOT NULL COMMENT '报销部门名称',
  `company_id` bigint(20) NOT NULL COMMENT '报销公司id',
  `client_id` bigint(20) NOT NULL COMMENT '客户id',
  `remark` varchar(255) NOT NULL COMMENT '事由',
  `audit_id` bigint(20) NOT NULL COMMENT '审批流',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单';

-- ----------------------------
-- Records of baoxiao_order
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_order` VALUES (1716360040017965057, 1698047096001000001, 0, '2023-10-23 15:44:57', 0, 0.00, 0.00, 0.00, 111.00, 1716360039988604930, 1716360039950856193, 0, 0, 0, 1, 'admin', 1, '疯狂的狮子Li', 105, '测试部门', 1714455348723757058, 1714468353012334593, '111', 0, 0, '2023-10-23 15:44:57', 'admin', '2023-10-25 17:52:12', 'admin');
INSERT INTO `baoxiao_order` VALUES (1716446407339216897, 1698067688001000001, 0, '2023-10-23 21:28:08', 0, 0.00, 0.00, 0.00, 222.00, 1716446407116918786, 1716446406965923842, 0, 0, 0, 1, 'admin', 2, '本部门及以下 密码666666', 108, '市场部门', 1714455348723757058, 1714468353012334593, '222', 0, 0, '2023-10-23 21:28:08', 'admin', '2023-10-23 21:28:08', 'admin');
INSERT INTO `baoxiao_order` VALUES (1716452557212315650, 1698069154001000001, 0, '2023-10-23 21:52:34', 0, 0.00, 0.00, 0.00, 999.00, 1716452557010989058, 1716452556964851713, 0, 0, 0, 1, 'admin', 1, '疯狂的狮子Li', 105, '测试部门', 1714455639149948929, 1714468353012334593, '3339999', 0, 0, '2023-10-23 21:52:34', 'admin', '2023-10-25 17:53:29', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for baoxiao_order_file
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao_order_file`;
CREATE TABLE `baoxiao_order_file` (
  `file_id` bigint(20) NOT NULL COMMENT '文件id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `oss_id` bigint(20) NOT NULL COMMENT 'ossid',
  `file_name` varchar(255) NOT NULL COMMENT '文件名',
  `original_name` varchar(255) NOT NULL COMMENT '原名',
  `url` varchar(500) NOT NULL COMMENT 'URL地址',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单文件';

-- ----------------------------
-- Records of baoxiao_order_file
-- ----------------------------
BEGIN;
INSERT INTO `baoxiao_order_file` VALUES (1716446392764010497, 1716446407339216897, 1714286212693536769, '2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg', 'leaf.jpg', 'http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg');
INSERT INTO `baoxiao_order_file` VALUES (1716451223859851266, 1716452557212315650, 1714286212693536769, '2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg', 'leaf.jpg', 'http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg');
INSERT INTO `baoxiao_order_file` VALUES (1717117095708368897, 1716452557212315650, 1714286212693536769, '2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg', 'leaf.jpg', 'http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (1714287984539512833, 'baoxiao_bank', '银行', NULL, NULL, 'BaoxiaoBank', 'crud', 'com.baoxiao.app', 'app', 'bank', '银行', 'baoxiao', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"}', 'admin', '2023-10-17 22:28:34', 'admin', '2023-10-17 22:32:35', NULL);
INSERT INTO `gen_table` VALUES (1714289406110773249, 'baoxiao_client', '客户信息', NULL, NULL, 'BaoxiaoClient', 'crud', 'com.baoxiao.app', 'app', 'client', '客户信息', 'baoxiao', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"}', 'admin', '2023-10-17 22:36:30', 'admin', '2023-10-17 22:37:53', NULL);
INSERT INTO `gen_table` VALUES (1714293558903746561, 'baoxiao_collection', '收款人信息', NULL, NULL, 'BaoxiaoCollection', 'crud', 'com.baoxiao.app', 'app', 'collection', '收款人信息', 'baoxiao', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"}', 'admin', '2023-10-17 22:30:37', 'admin', '2023-10-17 22:53:48', NULL);
INSERT INTO `gen_table` VALUES (1714294620628889601, 'baoxiao_fee', '费用明细', NULL, NULL, 'BaoxiaoFee', 'crud', 'com.baoxiao.system', 'system', 'fee', '费用明细', 'baoxiao', '0', '/', NULL, 'admin', '2023-10-17 22:30:21', 'admin', '2023-10-17 22:30:21', NULL);
INSERT INTO `gen_table` VALUES (1714294666661376002, 'baoxiao_company', '子公司管理', NULL, NULL, 'BaoxiaoCompany', 'crud', 'com.baoxiao.app', 'app', 'company', '子公司管理', 'baoxiao', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"}', 'admin', '2023-10-17 22:30:03', 'admin', '2023-10-17 22:59:12', NULL);
INSERT INTO `gen_table` VALUES (1714295597784281089, 'baoxiao_order_file', '订单文件', NULL, NULL, 'BaoxiaoOrderFile', 'crud', 'com.baoxiao.system', 'system', 'orderFile', '订单文件', 'baoxiao', '0', '/', NULL, 'admin', '2023-10-17 22:30:59', 'admin', '2023-10-17 22:30:59', NULL);
INSERT INTO `gen_table` VALUES (1714295631267409922, 'baoxiao_order', '订单', NULL, NULL, 'BaoxiaoOrder', 'crud', 'com.baoxiao.app', 'app', 'order', '订单', 'baoxiao', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"}', 'admin', '2023-10-17 22:52:16', 'admin', '2023-10-17 23:02:18', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (1714287984564678658, 1714287984539512833, 'bank_id', '银行id', 'bigint(20)', 'Long', 'bankId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984577261570, 1714287984539512833, 'bank_name', '银行名称', 'varchar(40)', 'String', 'bankName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984585650178, 1714287984539512833, 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984589844482, 1714287984539512833, 'status', '状态（0显示 1隐藏）', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984594038785, 1714287984539512833, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984606621698, 1714287984539512833, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984606621699, 1714287984539512833, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984627593218, 1714287984539512833, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714287984631787522, 1714287984539512833, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-10-17 22:31:20', 'admin', '2023-10-17 22:32:35');
INSERT INTO `gen_table_column` VALUES (1714289406144327681, 1714289406110773249, 'client_id', '客商id', 'bigint(20)', 'Long', 'clientId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406148521985, 1714289406110773249, 'client_unit_name', '客商单位名称', 'varchar(60)', 'String', 'clientUnitName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406156910594, 1714289406110773249, 'client_agreement_name', '客商协议名称', 'varchar(60)', 'String', 'clientAgreementName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406161104898, 1714289406110773249, 'business_type', '业务类型', 'tinyint(1)', 'Integer', 'businessType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406161104899, 1714289406110773249, 'customer_name', '客服人员', 'varchar(20)', 'String', 'customerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406165299201, 1714289406110773249, 'sell_name', '销售人员', 'varchar(20)', 'String', 'sellName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406169493506, 1714289406110773249, 'contacts_name', '联系人', 'varchar(20)', 'String', 'contactsName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406169493507, 1714289406110773249, 'phone', '联系电话', 'char(11)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406173687809, 1714289406110773249, 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406177882114, 1714289406110773249, 'status', '状态（0显示 1隐藏）', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406182076418, 1714289406110773249, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406190465025, 1714289406110773249, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406194659330, 1714289406110773249, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406198853634, 1714289406110773249, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714289406198853635, 1714289406110773249, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-10-17 22:36:59', 'admin', '2023-10-17 22:37:53');
INSERT INTO `gen_table_column` VALUES (1714293558945689602, 1714293558903746561, 'collection_id', '费用id', 'bigint(20)', 'Long', 'collectionId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:53:29', 'admin', '2023-10-17 22:53:48');
INSERT INTO `gen_table_column` VALUES (1714293558949883906, 1714293558903746561, 'collection_sum', '金额', 'decimal(10,2)', 'BigDecimal', 'collectionSum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-17 22:53:29', 'admin', '2023-10-17 22:53:48');
INSERT INTO `gen_table_column` VALUES (1714293558958272513, 1714293558903746561, 'collection_user', '收款人姓名', 'varchar(20)', 'String', 'collectionUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:53:29', 'admin', '2023-10-17 22:53:48');
INSERT INTO `gen_table_column` VALUES (1714293558958272514, 1714293558903746561, 'collection_bank', '银行卡', 'char(19)', 'String', 'collectionBank', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:53:29', 'admin', '2023-10-17 22:53:48');
INSERT INTO `gen_table_column` VALUES (1714293558962466818, 1714293558903746561, 'collection_bank_name', '银行名称', 'varchar(40)', 'String', 'collectionBankName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-10-17 22:53:29', 'admin', '2023-10-17 22:53:48');
INSERT INTO `gen_table_column` VALUES (1714293558962466819, 1714293558903746561, 'collection_bank_address', '开户行', 'varchar(60)', 'String', 'collectionBankAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-10-17 22:53:29', 'admin', '2023-10-17 22:53:48');
INSERT INTO `gen_table_column` VALUES (1714294620654055425, 1714294620628889601, 'fee_id', '费用id', 'bigint(20)', 'Long', 'feeId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:57:42', 'admin', '2023-10-17 22:57:42');
INSERT INTO `gen_table_column` VALUES (1714294620654055426, 1714294620628889601, 'fee_item', '收支项目', 'varchar(60)', 'String', 'feeItem', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-17 22:57:42', 'admin', '2023-10-17 22:57:42');
INSERT INTO `gen_table_column` VALUES (1714294620654055427, 1714294620628889601, 'baoxiao_sum', '报销金额', 'decimal(10,2)', 'BigDecimal', 'baoxiaoSum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:57:42', 'admin', '2023-10-17 22:57:42');
INSERT INTO `gen_table_column` VALUES (1714294620654055428, 1714294620628889601, 'tax_rate', '税率%', 'decimal(5,2)', 'BigDecimal', 'taxRate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:57:42', 'admin', '2023-10-17 22:57:42');
INSERT INTO `gen_table_column` VALUES (1714294620670832642, 1714294620628889601, 'special_ricket', '进项税额（专票）', 'decimal(5,2)', 'BigDecimal', 'specialRicket', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-10-17 22:57:42', 'admin', '2023-10-17 22:57:42');
INSERT INTO `gen_table_column` VALUES (1714294666686541825, 1714294666661376002, 'company_id', '公司id', 'bigint(20)', 'Long', 'companyId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666694930433, 1714294666661376002, 'company_name', '公司名称', 'varchar(60)', 'String', 'companyName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666699124737, 1714294666661376002, 'company_address', '公司地址', 'varchar(255)', 'String', 'companyAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666699124738, 1714294666661376002, 'company_contact', '公司联系人', 'varchar(20)', 'String', 'companyContact', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666699124739, 1714294666661376002, 'phone', '联系电话', 'char(11)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666703319042, 1714294666661376002, 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666703319043, 1714294666661376002, 'status', '状态（0显示 1隐藏）', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666703319044, 1714294666661376002, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666707513345, 1714294666661376002, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666711707649, 1714294666661376002, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666715901953, 1714294666661376002, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714294666720096257, 1714294666661376002, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-10-17 22:57:53', 'admin', '2023-10-17 22:59:12');
INSERT INTO `gen_table_column` VALUES (1714295597809446913, 1714295597784281089, 'file_id', '文件id', 'bigint(20)', 'Long', 'fileId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 23:01:35', 'admin', '2023-10-17 23:01:35');
INSERT INTO `gen_table_column` VALUES (1714295597813641218, 1714295597784281089, 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-17 23:01:35', 'admin', '2023-10-17 23:01:35');
INSERT INTO `gen_table_column` VALUES (1714295597817835521, 1714295597784281089, 'oss_id', 'ossid', 'bigint(20)', 'Long', 'ossId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 23:01:35', 'admin', '2023-10-17 23:01:35');
INSERT INTO `gen_table_column` VALUES (1714295597817835522, 1714295597784281089, 'file_name', '文件名', 'varchar(255)', 'String', 'fileName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-10-17 23:01:35', 'admin', '2023-10-17 23:01:35');
INSERT INTO `gen_table_column` VALUES (1714295597817835523, 1714295597784281089, 'original_name', '原名', 'varchar(255)', 'String', 'originalName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-10-17 23:01:35', 'admin', '2023-10-17 23:01:35');
INSERT INTO `gen_table_column` VALUES (1714295597822029825, 1714295597784281089, 'url', 'URL地址', 'varchar(500)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2023-10-17 23:01:35', 'admin', '2023-10-17 23:01:35');
INSERT INTO `gen_table_column` VALUES (1714295631288381441, 1714295631267409922, 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631296770050, 1714295631267409922, 'order_number', '订单编号', 'bigint(20)', 'Long', 'orderNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631300964354, 1714295631267409922, 'order_type', '订单类型', 'tinyint(1)', 'Integer', 'orderType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631305158658, 1714295631267409922, 'order_date', '订单日期', 'datetime', 'Date', 'orderDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631305158659, 1714295631267409922, 'baoxiao_sum', '报销金额', 'decimal(10,2)', 'BigDecimal', 'baoxiaoSum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631305158660, 1714295631267409922, 'payment_sum', '支付金额', 'decimal(10,2)', 'BigDecimal', 'paymentSum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631309352961, 1714295631267409922, 'offsetLoanSum', '冲借款金额', 'decimal(10,2)', 'BigDecimal', 'offsetLoanSum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631309352962, 1714295631267409922, 'offset_loan_sum', '冲借款金额', 'decimal(10,2)', 'BigDecimal', 'offsetLoanSum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631313547265, 1714295631267409922, 'total_amount', '金额合计', 'decimal(10,2)', 'BigDecimal', 'totalAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631313547266, 1714295631267409922, 'collection_id', '收款人', 'bigint(20)', 'Long', 'collectionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631317741569, 1714295631267409922, 'fee_id', '费用明细id', 'bigint(20)', 'Long', 'feeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631317741570, 1714295631267409922, 'is_offset_loan', '冲借款 (0 未冲 1已冲)', 'tinyint(1)', 'Integer', 'isOffsetLoan', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631321935873, 1714295631267409922, 'is_dept_share', '部门分摊 (0末分 1已分)', 'tinyint(1)', 'Integer', 'isDeptShare', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631321935874, 1714295631267409922, 'order_status', '状态 （0显示 1隐藏）', 'tinyint(1)', 'Integer', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631321935875, 1714295631267409922, 'user_id', '制单人id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631326130178, 1714295631267409922, 'user_name', '制单人', 'varchar(40)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 16, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631330324481, 1714295631267409922, 'baoxiao_user_id', '报销人id', 'bigint(20)', 'Long', 'baoxiaoUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631334518785, 1714295631267409922, 'baoxiao_user_name', '报销人名称', 'varchar(20)', 'String', 'baoxiaoUserName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 18, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631334518786, 1714295631267409922, 'dept_id', '报销部门id', 'bigint(20)', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631338713090, 1714295631267409922, 'dept_name', '报销部门名称', 'varchar(40)', 'String', 'deptName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 20, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631338713091, 1714295631267409922, 'company_id', '报销公司id', 'bigint(20)', 'Long', 'companyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631338713092, 1714295631267409922, 'remark', '事由', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 22, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631342907393, 1714295631267409922, 'audit_id', '审批流', 'bigint(20)', 'Long', 'auditId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631351296002, 1714295631267409922, 'del_flag', '删除标志（0代表存在 2代表删除）', 'tinyint(1)', 'Integer', 'delFlag', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631355490306, 1714295631267409922, 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631355490307, 1714295631267409922, 'status', '状态（0显示 1隐藏）', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 26, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631359684610, 1714295631267409922, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631363878914, 1714295631267409922, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 28, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631368073218, 1714295631267409922, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 29, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
INSERT INTO `gen_table_column` VALUES (1714295631368073219, 1714295631267409922, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 30, 'admin', '2023-10-17 23:01:43', 'admin', '2023-10-17 23:02:18');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint(20) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-07-19 15:32:25', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-07-19 15:32:25', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-07-19 15:32:25', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-07-19 15:32:25', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-07-19 15:32:25', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'false', 'Y', 'admin', '2023-07-19 15:32:25', 'admin', '2023-10-17 22:24:22', 'true:开启, false:关闭');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (1714457282927046657, 0, '普通报销', '0', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:44:04', 'admin', '2023-10-18 09:44:17', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457379026939905, 0, '好活', '1', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:44:27', 'admin', '2023-10-18 09:44:27', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457442331570178, 0, '合作单位报销', '2', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:44:42', 'admin', '2023-10-18 09:44:42', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457503887175681, 0, '合作单位转账', '3', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:44:57', 'admin', '2023-10-18 09:45:03', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457579585974273, 0, '雇主责任险', '4', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:45:15', 'admin', '2023-10-18 09:45:21', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457716106375169, 0, '内部资金调拨', '5', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:45:47', 'admin', '2023-10-18 09:45:47', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457768774250497, 0, '社保', '6', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:46:00', 'admin', '2023-10-18 09:46:00', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457840270356481, 0, '生育津贴返还', '7', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:46:17', 'admin', '2023-10-18 09:46:17', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457921136537601, 0, '工会费', '8', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:46:36', 'admin', '2023-10-18 09:46:36', NULL);
INSERT INTO `sys_dict_data` VALUES (1714457976170000386, 0, '内部转账', '9', 'order_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:46:49', 'admin', '2023-10-18 09:46:49', NULL);
INSERT INTO `sys_dict_data` VALUES (1714458866247446529, 0, '报销单', '0', 'order_baoxiao_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:50:21', 'admin', '2023-10-18 09:50:52', NULL);
INSERT INTO `sys_dict_data` VALUES (1714458977383919617, 0, '差旅费报销单', '1', 'order_baoxiao_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:50:48', 'admin', '2023-10-18 09:50:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1714459036750098433, 0, '借款', '2', 'order_baoxiao_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:51:02', 'admin', '2023-10-18 09:51:02', NULL);
INSERT INTO `sys_dict_data` VALUES (1714459078533754881, 0, '保证金', '3', 'order_baoxiao_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:51:12', 'admin', '2023-10-18 09:51:12', NULL);
INSERT INTO `sys_dict_data` VALUES (1714459130970943489, 0, '调整单据', '4', 'order_baoxiao_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:51:25', 'admin', '2023-10-18 09:51:25', NULL);
INSERT INTO `sys_dict_data` VALUES (1714459175090827266, 0, '付款申请', '5', 'order_baoxiao_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:51:35', 'admin', '2023-10-18 09:51:35', NULL);
INSERT INTO `sys_dict_data` VALUES (1714460293367771137, 0, '外包A类', '0', 'client_business_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:56:02', 'admin', '2023-10-18 09:56:02', NULL);
INSERT INTO `sys_dict_data` VALUES (1714460335390502913, 0, '外包B类', '1', 'client_business_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:56:12', 'admin', '2023-10-18 09:56:12', NULL);
INSERT INTO `sys_dict_data` VALUES (1714460397151629314, 0, '外包C类', '2', 'client_business_type', NULL, 'default', 'N', '0', 'admin', '2023-10-18 09:56:26', 'admin', '2023-10-18 09:56:26', NULL);
INSERT INTO `sys_dict_data` VALUES (1714632991087771650, 0, '未冲', '0', 'order_offset_loan', NULL, 'default', 'N', '0', 'admin', '2023-10-18 21:22:16', 'admin', '2023-10-18 21:22:16', NULL);
INSERT INTO `sys_dict_data` VALUES (1714633057869479937, 0, '已冲', '1', 'order_offset_loan', NULL, 'default', 'N', '0', 'admin', '2023-10-18 21:22:32', 'admin', '2023-10-18 21:22:32', NULL);
INSERT INTO `sys_dict_data` VALUES (1714633183941869570, 0, '未分', '0', 'order_dept_share', NULL, 'default', 'N', '0', 'admin', '2023-10-18 21:23:02', 'admin', '2023-10-18 21:23:02', NULL);
INSERT INTO `sys_dict_data` VALUES (1714633229756252162, 0, '已分', '1', 'order_dept_share', NULL, 'default', 'N', '0', 'admin', '2023-10-18 21:23:13', 'admin', '2023-10-18 21:23:13', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1714456989858443266, '订单类型', 'order_type', '0', 'admin', '2023-10-18 09:42:54', 'admin', '2023-10-18 09:43:06', '报销管理订单类型');
INSERT INTO `sys_dict_type` VALUES (1714458747540254721, '报销类型', 'order_baoxiao_type', '0', 'admin', '2023-10-18 09:49:53', 'admin', '2023-10-18 09:49:53', '报销管理报销类型');
INSERT INTO `sys_dict_type` VALUES (1714460235264077826, '业务类型', 'client_business_type', '0', 'admin', '2023-10-18 09:55:48', 'admin', '2023-10-18 09:55:48', '客户信息业务类型');
INSERT INTO `sys_dict_type` VALUES (1714632715509415937, '报销冲借款', 'order_offset_loan', '0', 'admin', '2023-10-18 21:21:10', 'admin', '2023-10-18 21:21:10', NULL);
INSERT INTO `sys_dict_type` VALUES (1714632899740024833, '报销分摊', 'order_dept_share', '0', 'admin', '2023-10-18 21:21:54', 'admin', '2023-10-18 21:21:54', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (1681589484865593345, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-19 16:59:10');
INSERT INTO `sys_logininfor` VALUES (1681852290164789250, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 10:23:28');
INSERT INTO `sys_logininfor` VALUES (1681859041928863746, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 10:50:18');
INSERT INTO `sys_logininfor` VALUES (1681861644179922946, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-07-20 11:00:38');
INSERT INTO `sys_logininfor` VALUES (1681870166426873857, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-07-20 11:34:30');
INSERT INTO `sys_logininfor` VALUES (1681870430697385986, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 11:35:33');
INSERT INTO `sys_logininfor` VALUES (1681916964197625858, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 14:40:27');
INSERT INTO `sys_logininfor` VALUES (1681917141306306562, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-07-20 14:41:10');
INSERT INTO `sys_logininfor` VALUES (1681938261082370050, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 16:05:05');
INSERT INTO `sys_logininfor` VALUES (1681941012268969986, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-07-20 16:16:01');
INSERT INTO `sys_logininfor` VALUES (1681962412144848897, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:41:03');
INSERT INTO `sys_logininfor` VALUES (1681962987972456450, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '退出成功', '2023-07-20 17:43:20');
INSERT INTO `sys_logininfor` VALUES (1681963740527063042, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:46:20');
INSERT INTO `sys_logininfor` VALUES (1681963796101591041, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:46:33');
INSERT INTO `sys_logininfor` VALUES (1681964965251248129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:51:12');
INSERT INTO `sys_logininfor` VALUES (1681965069521645569, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:51:37');
INSERT INTO `sys_logininfor` VALUES (1681965270210703361, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '1', '验证码错误', '2023-07-20 17:52:24');
INSERT INTO `sys_logininfor` VALUES (1681965291312246786, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:52:30');
INSERT INTO `sys_logininfor` VALUES (1681965480638935042, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:53:15');
INSERT INTO `sys_logininfor` VALUES (1681965712109989889, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-07-20 17:54:10');
INSERT INTO `sys_logininfor` VALUES (1714204434754613250, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Linux', '0', '登录成功', '2023-10-17 16:59:20');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-07-19 15:32:25', 'admin', '2023-10-17 23:00:59', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-07-19 15:32:25', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-07-19 15:32:25', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 4, 'https://gitee.com/dromara/RuoYi-Vue-Plus', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-07-19 15:32:25', '', NULL, 'RuoYi-Vue-Plus官网地址');
INSERT INTO `sys_menu` VALUES (5, '测试菜单', 0, 5, 'demo', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2023-07-19 15:50:56', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-07-19 15:32:25', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-07-19 15:32:25', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-07-19 15:32:25', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-07-19 15:32:25', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-07-19 15:32:25', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-07-19 15:32:25', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-07-19 15:32:25', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-07-19 15:32:25', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-07-19 15:32:25', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-07-19 15:32:25', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-07-19 15:32:25', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-07-19 15:32:25', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-07-19 15:32:25', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-07-19 15:32:25', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 'admin', '2023-07-19 15:32:25', '', NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2023-07-19 15:32:25', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 5, 'XxlJob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2023-07-19 15:32:25', '', NULL, 'Xxl-Job控制台菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-07-19 15:32:25', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-07-19 15:32:25', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', NULL, 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '测试单表菜单');
INSERT INTO `sys_menu` VALUES (1501, '测试单表查询', 1500, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1502, '测试单表新增', 1500, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1503, '测试单表修改', 1500, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1504, '测试单表删除', 1500, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1505, '测试单表导出', 1500, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', NULL, 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '测试树表菜单');
INSERT INTO `sys_menu` VALUES (1507, '测试树表查询', 1506, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1508, '测试树表新增', 1506, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1509, '测试树表修改', 1506, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1510, '测试树表删除', 1506, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1511, '测试树表导出', 1506, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 'admin', '2023-07-19 15:50:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714288324508823553, '银行管理', 0, 0, 'bank', 'app/bank/index', NULL, 1, 0, 'C', '0', '0', 'app:bank:list', 'money', 'admin', '2023-10-17 22:33:44', 'admin', '2023-10-17 22:35:40', '银行菜单');
INSERT INTO `sys_menu` VALUES (1714288324513017857, '银行查询', 1714288324508823553, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:bank:query', '#', 'admin', '2023-10-17 22:33:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714288324513017858, '银行新增', 1714288324508823553, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:bank:add', '#', 'admin', '2023-10-17 22:33:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714288324513017859, '银行修改', 1714288324508823553, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:bank:edit', '#', 'admin', '2023-10-17 22:33:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714288324513017860, '银行删除', 1714288324508823553, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:bank:remove', '#', 'admin', '2023-10-17 22:33:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714288324513017861, '银行导出', 1714288324508823553, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:bank:export', '#', 'admin', '2023-10-17 22:33:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714289641247649793, '客户管理', 0, 0, 'client', 'app/client/index', NULL, 1, 0, 'C', '0', '0', 'app:client:list', 'server', 'admin', '2023-10-17 22:38:42', 'admin', '2023-10-17 23:00:49', '客户信息菜单');
INSERT INTO `sys_menu` VALUES (1714289641247649794, '客户信息查询', 1714289641247649793, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:client:query', '#', 'admin', '2023-10-17 22:38:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714289641247649795, '客户信息新增', 1714289641247649793, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:client:add', '#', 'admin', '2023-10-17 22:38:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714289641247649796, '客户信息修改', 1714289641247649793, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:client:edit', '#', 'admin', '2023-10-17 22:38:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714289641247649797, '客户信息删除', 1714289641247649793, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:client:remove', '#', 'admin', '2023-10-17 22:38:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714289641247649798, '客户信息导出', 1714289641247649793, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:client:export', '#', 'admin', '2023-10-17 22:38:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295027467988993, '子公司管理', 0, 0, 'company', 'app/company/index', NULL, 1, 0, 'C', '0', '0', 'app:company:list', 'tree-table', 'admin', '2023-10-17 22:59:53', 'admin', '2023-10-17 23:00:42', '子公司管理菜单');
INSERT INTO `sys_menu` VALUES (1714295027467988994, '子公司管理查询', 1714295027467988993, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:company:query', '#', 'admin', '2023-10-17 22:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295027467988995, '子公司管理新增', 1714295027467988993, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:company:add', '#', 'admin', '2023-10-17 22:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295027467988996, '子公司管理修改', 1714295027467988993, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:company:edit', '#', 'admin', '2023-10-17 22:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295027467988997, '子公司管理删除', 1714295027467988993, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:company:remove', '#', 'admin', '2023-10-17 22:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295027467988998, '子公司管理导出', 1714295027467988993, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:company:export', '#', 'admin', '2023-10-17 22:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295821651062785, '新增报销', 1714296849192628225, 1, 'order', 'app/order/index', NULL, 1, 0, 'C', '0', '0', 'app:order:list', 'edit', 'admin', '2023-10-17 23:05:01', 'admin', '2023-10-17 23:19:56', '订单菜单');
INSERT INTO `sys_menu` VALUES (1714295821651062786, '订单查询', 1714295821651062785, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:order:query', '#', 'admin', '2023-10-17 23:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295821651062787, '订单新增', 1714295821651062785, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:order:add', '#', 'admin', '2023-10-17 23:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295821651062788, '订单修改', 1714295821651062785, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:order:edit', '#', 'admin', '2023-10-17 23:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295821651062789, '订单删除', 1714295821651062785, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:order:remove', '#', 'admin', '2023-10-17 23:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714295821651062790, '订单导出', 1714295821651062785, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:order:export', '#', 'admin', '2023-10-17 23:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1714296849192628225, '报销管理', 0, 0, 'order', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'nested', 'admin', '2023-10-17 23:06:34', 'admin', '2023-10-17 23:06:34', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-07-19 15:32:25', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-07-19 15:32:25', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1714285501922586625, 'OSS对象存储', 1, 'com.baoxiao.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '', '/system/oss/upload', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossId\":null,\"groupId\":4,\"groupType\":1,\"fileName\":null,\"originalName\":null,\"fileSuffix\":null,\"url\":null,\"service\":null}', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: 拒绝连接 (Connection refused)]', '2023-10-17 22:21:28');
INSERT INTO `sys_oper_log` VALUES (1714285995160154113, '对象存储配置', 2, 'com.baoxiao.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/system/oss/config', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":3,\"configKey\":\"aliyun\",\"accessKey\":\"LTAI5tCWrJgiUQBj8YfXpp7E\",\"secretKey\":\"7eNNErYraTAObIJ4IbPZ25xPaOz10k\",\"bucketName\":\"file-bucket-demo\",\"prefix\":\"\",\"endpoint\":\"oss-cn-shenzhen.aliyuncs.com\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"1\",\"region\":\"\",\"ext1\":\"\",\"remark\":null,\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:23:26');
INSERT INTO `sys_oper_log` VALUES (1714286163590819841, '对象存储状态修改', 2, 'com.baoxiao.web.controller.system.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '', '/system/oss/config/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":3,\"configKey\":\"aliyun\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"0\",\"region\":null,\"ext1\":null,\"remark\":null,\"accessPolicy\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:24:06');
INSERT INTO `sys_oper_log` VALUES (1714286212735479809, 'OSS对象存储', 1, 'com.baoxiao.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '', '/system/oss/upload', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossId\":null,\"groupId\":0,\"groupType\":1,\"fileName\":null,\"originalName\":null,\"fileSuffix\":null,\"url\":null,\"service\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1714286212693536769\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"fileName\":\"leaf.jpg\"}}', 0, '', '2023-10-17 22:24:18');
INSERT INTO `sys_oper_log` VALUES (1714286231588876289, '参数管理', 2, 'com.baoxiao.web.controller.system.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/system/config/updateByKey', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:24:22\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:24:22');
INSERT INTO `sys_oper_log` VALUES (1714286610598768642, 'OSS对象存储', 1, 'com.baoxiao.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '', '/system/oss/upload', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossId\":null,\"groupId\":0,\"groupType\":2,\"fileName\":null,\"originalName\":null,\"fileSuffix\":null,\"url\":null,\"service\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1714286609931874306\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/e7c2a767679c41009dd6b7d5bfdba85e.doc\",\"fileName\":\"新建 DOC 文档.doc\"}}', 0, '', '2023-10-17 22:25:52');
INSERT INTO `sys_oper_log` VALUES (1714286990116171777, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_bank\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:27:23');
INSERT INTO `sys_oper_log` VALUES (1714287942894268417, '代码生成', 3, 'com.baoxiao.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1714286989629632513', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:31:10');
INSERT INTO `sys_oper_log` VALUES (1714287984682119170, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_bank\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:31:20');
INSERT INTO `sys_oper_log` VALUES (1714288298579636226, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:32:34\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714287984539512833\",\"tableName\":\"baoxiao_bank\",\"tableComment\":\"银行\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoBank\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"bank\",\"functionName\":\"银行\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:31:20\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:32:34\",\"columnId\":\"1714287984564678658\",\"tableId\":\"1714287984539512833\",\"columnName\":\"bank_id\",\"columnComment\":\"银行id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"bankId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"BankId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:31:20\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:32:34\",\"columnId\":\"1714287984577261570\",\"tableId\":\"1714287984539512833\",\"columnName\":\"bank_name\",\"columnComment\":\"银行名称\",\"columnType\":\"varchar(40)\",\"javaType\":\"String\",\"javaField\":\"bankName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"BankName\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:31:20\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:32:34\",\"columnId\":\"1714287984585650178\",\"tableId\":\"1714287984539512833\",\"columnName\":\"sort\",\"columnComment\":\"排序\",\"columnType\":\"int(11)\",\"ja', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:32:35');
INSERT INTO `sys_oper_log` VALUES (1714288327755214850, '代码生成', 8, 'com.baoxiao.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"baoxiao_bank\"}', '', 0, '', '2023-10-17 22:32:42');
INSERT INTO `sys_oper_log` VALUES (1714289076480421890, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:33:44\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:35:40\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1714288324508823553\",\"menuName\":\"银行管理\",\"orderNum\":0,\"path\":\"bank\",\"component\":\"app/bank/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:bank:list\",\"icon\":\"money\",\"remark\":\"银行菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:35:40');
INSERT INTO `sys_oper_log` VALUES (1714289201739116545, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_client\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:36:10');
INSERT INTO `sys_oper_log` VALUES (1714289312531656706, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '', '/tool/gen/synchDb/baoxiao_client', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:36:37');
INSERT INTO `sys_oper_log` VALUES (1714289381074972673, '代码生成', 3, 'com.baoxiao.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1714289201609093121', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:36:53');
INSERT INTO `sys_oper_log` VALUES (1714289406278545410, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_client\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:36:59');
INSERT INTO `sys_oper_log` VALUES (1714289631864991745, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:37:52\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714289406110773249\",\"tableName\":\"baoxiao_client\",\"tableComment\":\"客户信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoClient\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"client\",\"functionName\":\"客户信息\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:36:59\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:37:52\",\"columnId\":\"1714289406144327681\",\"tableId\":\"1714289406110773249\",\"columnName\":\"client_id\",\"columnComment\":\"客商id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"clientId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"ClientId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:36:59\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:37:52\",\"columnId\":\"1714289406148521985\",\"tableId\":\"1714289406110773249\",\"columnName\":\"client_unit_name\",\"columnComment\":\"客商单位名称\",\"columnType\":\"varchar(60)\",\"javaType\":\"String\",\"javaField\":\"clientUnitName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"ClientUnitName\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:36:59\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:37:52\",\"columnId\":\"1714289406156910594\",\"tableId\":\"1714289406110773249\",\"columnName\":\"client_agreement', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:37:53');
INSERT INTO `sys_oper_log` VALUES (1714289641658691586, '代码生成', 8, 'com.baoxiao.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"baoxiao_client\"}', '', 0, '', '2023-10-17 22:37:55');
INSERT INTO `sys_oper_log` VALUES (1714290744873889794, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:38:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:42:18\",\"parentName\":null,\"parentId\":3,\"children\":[],\"menuId\":\"1714289641247649793\",\"menuName\":\"客户管理\",\"orderNum\":1,\"path\":\"client\",\"component\":\"app/client/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:client:list\",\"icon\":\"server\",\"remark\":\"客户信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:42:18');
INSERT INTO `sys_oper_log` VALUES (1714290766512304130, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-19 15:32:25\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:42:23\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":1,\"menuName\":\"系统管理\",\"orderNum\":0,\"path\":\"system\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"system\",\"remark\":\"系统管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:42:23');
INSERT INTO `sys_oper_log` VALUES (1714290839220563969, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:38:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:42:40\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1714289641247649793\",\"menuName\":\"客户管理\",\"orderNum\":1,\"path\":\"client\",\"component\":\"app/client/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:client:list\",\"icon\":\"server\",\"remark\":\"客户信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:42:41');
INSERT INTO `sys_oper_log` VALUES (1714293559000215553, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_collection\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:53:29');
INSERT INTO `sys_oper_log` VALUES (1714293638910095362, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:53:48\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714293558903746561\",\"tableName\":\"baoxiao_collection\",\"tableComment\":\"收款人信息\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoCollection\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"collection\",\"functionName\":\"收款人信息\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:53:48\",\"columnId\":\"1714293558945689602\",\"tableId\":\"1714293558903746561\",\"columnName\":\"collection_id\",\"columnComment\":\"费用id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"collectionId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"CollectionId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:53:48\",\"columnId\":\"1714293558949883906\",\"tableId\":\"1714293558903746561\",\"columnName\":\"collection_sum\",\"columnComment\":\"金额\",\"columnType\":\"decimal(10,2)\",\"javaType\":\"BigDecimal\",\"javaField\":\"collectionSum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"CollectionSum\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:53:48\",\"columnId\":\"1714293558958272513\",\"tableId\":\"1714293558903746561\",\"columnN', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:53:48');
INSERT INTO `sys_oper_log` VALUES (1714293684791586817, '代码生成', 8, 'com.baoxiao.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"baoxiao_collection\"}', '', 0, '', '2023-10-17 22:53:59');
INSERT INTO `sys_oper_log` VALUES (1714294013344002050, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:54:33\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:55:17\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1714293684011446273\",\"menuName\":\"收款人信息\",\"orderNum\":1,\"path\":\"collection\",\"component\":\"app/collection/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:collection:list\",\"icon\":\"education\",\"remark\":\"收款人信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:55:17');
INSERT INTO `sys_oper_log` VALUES (1714294620851187713, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_fee\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:57:42');
INSERT INTO `sys_oper_log` VALUES (1714294666762039297, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_company\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:57:53');
INSERT INTO `sys_oper_log` VALUES (1714294757497417730, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:14\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714294666661376002\",\"tableName\":\"baoxiao_company\",\"tableComment\":\"公司\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoCompany\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"company\",\"functionName\":\"公司管理\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:14\",\"columnId\":\"1714294666686541825\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_id\",\"columnComment\":\"公司id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"companyId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"CompanyId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:14\",\"columnId\":\"1714294666694930433\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_name\",\"columnComment\":\"公司名称\",\"columnType\":\"varchar(60)\",\"javaType\":\"String\",\"javaField\":\"companyName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"CompanyName\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:14\",\"columnId\":\"1714294666699124737\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_address\",\"column', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:58:15');
INSERT INTO `sys_oper_log` VALUES (1714294793509711874, '代码生成', 8, 'com.baoxiao.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"baoxiao_company\"}', '', 0, '', '2023-10-17 22:58:23');
INSERT INTO `sys_oper_log` VALUES (1714294869133012993, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:41\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714294666661376002\",\"tableName\":\"baoxiao_company\",\"tableComment\":\"公司管理\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoCompany\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"company\",\"functionName\":\"公司管理\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:41\",\"columnId\":\"1714294666686541825\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_id\",\"columnComment\":\"公司id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"companyId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"CompanyId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:41\",\"columnId\":\"1714294666694930433\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_name\",\"columnComment\":\"公司名称\",\"columnType\":\"varchar(60)\",\"javaType\":\"String\",\"javaField\":\"companyName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"CompanyName\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:58:41\",\"columnId\":\"1714294666699124737\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_address\",\"colu', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:58:42');
INSERT INTO `sys_oper_log` VALUES (1714294995893268482, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:59:11\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714294666661376002\",\"tableName\":\"baoxiao_company\",\"tableComment\":\"子公司管理\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoCompany\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"company\",\"functionName\":\"子公司管理\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:59:11\",\"columnId\":\"1714294666686541825\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_id\",\"columnComment\":\"公司id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"companyId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"CompanyId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:59:11\",\"columnId\":\"1714294666694930433\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_name\",\"columnComment\":\"公司名称\",\"columnType\":\"varchar(60)\",\"javaType\":\"String\",\"javaField\":\"companyName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"CompanyName\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:57:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 22:59:11\",\"columnId\":\"1714294666699124737\",\"tableId\":\"1714294666661376002\",\"columnName\":\"company_address\",\"co', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 22:59:12');
INSERT INTO `sys_oper_log` VALUES (1714295027795144705, '代码生成', 8, 'com.baoxiao.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"baoxiao_company\"}', '', 0, '', '2023-10-17 22:59:19');
INSERT INTO `sys_oper_log` VALUES (1714295376379555842, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:59:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:00:42\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1714295027467988993\",\"menuName\":\"子公司管理\",\"orderNum\":0,\"path\":\"company\",\"component\":\"app/company/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:company:list\",\"icon\":\"tree-table\",\"remark\":\"子公司管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:00:42');
INSERT INTO `sys_oper_log` VALUES (1714295404120682498, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:38:42\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:00:49\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1714289641247649793\",\"menuName\":\"客户管理\",\"orderNum\":0,\"path\":\"client\",\"component\":\"app/client/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:client:list\",\"icon\":\"server\",\"remark\":\"客户信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:00:49');
INSERT INTO `sys_oper_log` VALUES (1714295447758221314, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-19 15:32:25\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:00:59\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":1,\"menuName\":\"系统管理\",\"orderNum\":1,\"path\":\"system\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"system\",\"remark\":\"系统管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:00:59');
INSERT INTO `sys_oper_log` VALUES (1714295597847195650, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_order_file\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:01:35');
INSERT INTO `sys_oper_log` VALUES (1714295631414210562, '代码生成', 6, 'com.baoxiao.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"baoxiao_order\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:01:43');
INSERT INTO `sys_oper_log` VALUES (1714295778349068289, '代码生成', 2, 'com.baoxiao.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:02:18\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"\"},\"tableId\":\"1714295631267409922\",\"tableName\":\"baoxiao_order\",\"tableComment\":\"订单\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"BaoxiaoOrder\",\"tplCategory\":\"crud\",\"packageName\":\"com.baoxiao.app\",\"moduleName\":\"app\",\"businessName\":\"order\",\"functionName\":\"订单\",\"functionAuthor\":\"baoxiao\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:01:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:02:18\",\"columnId\":\"1714295631288381441\",\"tableId\":\"1714295631267409922\",\"columnName\":\"order_id\",\"columnComment\":\"订单id\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"orderId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"increment\":false,\"query\":false,\"capJavaField\":\"OrderId\",\"list\":true,\"required\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:01:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:02:18\",\"columnId\":\"1714295631296770050\",\"tableId\":\"1714295631267409922\",\"columnName\":\"order_number\",\"columnComment\":\"订单编号\",\"columnType\":\"bigint(20)\",\"javaType\":\"Long\",\"javaField\":\"orderNumber\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"increment\":false,\"query\":true,\"capJavaField\":\"OrderNumber\",\"list\":true,\"required\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:01:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:02:18\",\"columnId\":\"1714295631300964354\",\"tableId\":\"1714295631267409922\",\"columnName\":\"order_type\",\"columnComment\":\"订单类型\",\"columnT', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:02:18');
INSERT INTO `sys_oper_log` VALUES (1714295822083076098, '代码生成', 8, 'com.baoxiao.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"baoxiao_order\"}', '', 0, '', '2023-10-17 23:02:29');
INSERT INTO `sys_oper_log` VALUES (1714296849205211137, '菜单管理', 1, 'com.baoxiao.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:06:33\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:06:33\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1714296849192628225\",\"menuName\":\"报销管理\",\"orderNum\":0,\"path\":\"order\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"nested\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:06:34');
INSERT INTO `sys_oper_log` VALUES (1714296957711855617, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:05:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:06:59\",\"parentName\":null,\"parentId\":\"1714296849192628225\",\"children\":[],\"menuId\":\"1714295821651062785\",\"menuName\":\"订单\",\"orderNum\":1,\"path\":\"order\",\"component\":\"app/order/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:order:list\",\"icon\":\"#\",\"remark\":\"订单菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:06:59');
INSERT INTO `sys_oper_log` VALUES (1714299989434478593, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:05:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:19:02\",\"parentName\":null,\"parentId\":\"1714296849192628225\",\"children\":[],\"menuId\":\"1714295821651062785\",\"menuName\":\"报销维护\",\"orderNum\":1,\"path\":\"order\",\"component\":\"app/order/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:order:list\",\"icon\":\"#\",\"remark\":\"订单菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:19:02');
INSERT INTO `sys_oper_log` VALUES (1714300097148399617, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:05:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:19:27\",\"parentName\":null,\"parentId\":\"1714296849192628225\",\"children\":[],\"menuId\":\"1714295821651062785\",\"menuName\":\"报销维护\",\"orderNum\":1,\"path\":\"order\",\"component\":\"app/order/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:order:list\",\"icon\":\"edit\",\"remark\":\"订单菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:19:28');
INSERT INTO `sys_oper_log` VALUES (1714300212873441282, '菜单管理', 2, 'com.baoxiao.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-17 23:05:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-17 23:19:55\",\"parentName\":null,\"parentId\":\"1714296849192628225\",\"children\":[],\"menuId\":\"1714295821651062785\",\"menuName\":\"新增报销\",\"orderNum\":1,\"path\":\"order\",\"component\":\"app/order/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"app:order:list\",\"icon\":\"edit\",\"remark\":\"订单菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-17 23:19:56');
INSERT INTO `sys_oper_log` VALUES (1714454579916222465, '子公司管理', 1, 'com.baoxiao.app.controller.BaoxiaoCompanyController.add()', 'POST', 1, 'admin', '', '/app/company', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"companyId\":null,\"companyName\":\"盈信贸易\",\"companyAddress\":\"北京\",\"companyContact\":\"王\",\"phone\":\"13888888888\",\"sort\":0,\"status\":0,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoCompanyMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoCompanyMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_company  ( company_id, company_name, company_address, company_contact, phone, sort, status,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n; Field \'remark\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'remark\' doesn\'t have a default value', '2023-10-18 09:33:20');
INSERT INTO `sys_oper_log` VALUES (1714454617551712257, '子公司管理', 1, 'com.baoxiao.app.controller.BaoxiaoCompanyController.add()', 'POST', 1, 'admin', '', '/app/company', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"companyId\":null,\"companyName\":\"盈信贸易\",\"companyAddress\":\"北京\",\"companyContact\":\"王\",\"phone\":\"13888888888\",\"sort\":0,\"status\":0,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoCompanyMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoCompanyMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_company  ( company_id, company_name, company_address, company_contact, phone, sort, status,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n; Field \'remark\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'remark\' doesn\'t have a default value', '2023-10-18 09:33:29');
INSERT INTO `sys_oper_log` VALUES (1714455348908306434, '子公司管理', 1, 'com.baoxiao.app.controller.BaoxiaoCompanyController.add()', 'POST', 1, 'admin', '', '/app/company', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"companyId\":\"1714455348723757058\",\"companyName\":\"盈信贸易\",\"companyAddress\":\"北京\",\"companyContact\":\"王\",\"phone\":\"13888888888\",\"sort\":0,\"status\":0,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:36:23');
INSERT INTO `sys_oper_log` VALUES (1714455534460121089, '子公司管理', 1, 'com.baoxiao.app.controller.BaoxiaoCompanyController.add()', 'POST', 1, 'admin', '', '/app/company', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"companyId\":\"1714455534346874881\",\"companyName\":\"优乐钢材\",\"companyAddress\":\"上海\",\"companyContact\":\"王\",\"phone\":\"13888888888\",\"sort\":0,\"status\":0,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:37:07');
INSERT INTO `sys_oper_log` VALUES (1714455639217057794, '子公司管理', 1, 'com.baoxiao.app.controller.BaoxiaoCompanyController.add()', 'POST', 1, 'admin', '', '/app/company', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"companyId\":\"1714455639149948929\",\"companyName\":\"福朵鞋业\",\"companyAddress\":\"广州\",\"companyContact\":\"王\",\"phone\":\"13888888888\",\"sort\":0,\"status\":0,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:37:32');
INSERT INTO `sys_oper_log` VALUES (1714456989929746434, '字典类型', 1, 'com.baoxiao.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:42:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:42:54\",\"dictId\":\"1714456989858443266\",\"dictName\":\"订单类型\",\"dictType\":\"order_type\",\"status\":\"0\",\"remark\":\"报销管理\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:42:54');
INSERT INTO `sys_oper_log` VALUES (1714457039867129857, '字典类型', 2, 'com.baoxiao.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:42:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:43:05\",\"dictId\":\"1714456989858443266\",\"dictName\":\"订单类型\",\"dictType\":\"order_type\",\"status\":\"0\",\"remark\":\"报销管理订单类型\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:43:06');
INSERT INTO `sys_oper_log` VALUES (1714457283103207425, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:44:03\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:44:03\",\"dictCode\":\"1714457282927046657\",\"dictSort\":0,\"dictLabel\":\"好活\",\"dictValue\":\"0\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:44:04');
INSERT INTO `sys_oper_log` VALUES (1714457336043712514, '字典数据', 2, 'com.baoxiao.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:44:04\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:44:16\",\"dictCode\":\"1714457282927046657\",\"dictSort\":0,\"dictLabel\":\"普通报销\",\"dictValue\":\"0\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:44:17');
INSERT INTO `sys_oper_log` VALUES (1714457379115020289, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:44:26\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:44:26\",\"dictCode\":\"1714457379026939905\",\"dictSort\":0,\"dictLabel\":\"好活\",\"dictValue\":\"1\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:44:27');
INSERT INTO `sys_oper_log` VALUES (1714457442377707522, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:44:41\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:44:41\",\"dictCode\":\"1714457442331570178\",\"dictSort\":0,\"dictLabel\":\"合作单位报销\",\"dictValue\":\"2\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:44:42');
INSERT INTO `sys_oper_log` VALUES (1714457503950090242, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:44:56\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:44:56\",\"dictCode\":\"1714457503887175681\",\"dictSort\":0,\"dictLabel\":\"3\",\"dictValue\":\"合作单位转账\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:44:57');
INSERT INTO `sys_oper_log` VALUES (1714457530386788353, '字典数据', 2, 'com.baoxiao.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:44:57\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:45:02\",\"dictCode\":\"1714457503887175681\",\"dictSort\":0,\"dictLabel\":\"合作单位转账\",\"dictValue\":\"3\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:45:03');
INSERT INTO `sys_oper_log` VALUES (1714457579963461634, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:45:14\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:45:14\",\"dictCode\":\"1714457579585974273\",\"dictSort\":0,\"dictLabel\":\"4\",\"dictValue\":\"雇主责任险\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:45:15');
INSERT INTO `sys_oper_log` VALUES (1714457606874116097, '字典数据', 2, 'com.baoxiao.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:45:15\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:45:21\",\"dictCode\":\"1714457579585974273\",\"dictSort\":0,\"dictLabel\":\"雇主责任险\",\"dictValue\":\"4\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:45:21');
INSERT INTO `sys_oper_log` VALUES (1714457716144123906, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:45:47\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:45:47\",\"dictCode\":\"1714457716106375169\",\"dictSort\":0,\"dictLabel\":\"内部资金调拨\",\"dictValue\":\"5\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:45:47');
INSERT INTO `sys_oper_log` VALUES (1714457768832970754, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:45:59\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:45:59\",\"dictCode\":\"1714457768774250497\",\"dictSort\":0,\"dictLabel\":\"社保\",\"dictValue\":\"6\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:46:00');
INSERT INTO `sys_oper_log` VALUES (1714457840312299522, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:46:16\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:46:16\",\"dictCode\":\"1714457840270356481\",\"dictSort\":0,\"dictLabel\":\"生育津贴返还\",\"dictValue\":\"7\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:46:17');
INSERT INTO `sys_oper_log` VALUES (1714457921186869249, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:46:36\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:46:36\",\"dictCode\":\"1714457921136537601\",\"dictSort\":0,\"dictLabel\":\"工会费\",\"dictValue\":\"8\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:46:36');
INSERT INTO `sys_oper_log` VALUES (1714457976216137729, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:46:49\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:46:49\",\"dictCode\":\"1714457976170000386\",\"dictSort\":0,\"dictLabel\":\"内部转账\",\"dictValue\":\"9\",\"dictType\":\"order_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:46:49');
INSERT INTO `sys_oper_log` VALUES (1714458747561226242, '字典类型', 1, 'com.baoxiao.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:49:53\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:49:53\",\"dictId\":\"1714458747540254721\",\"dictName\":\"报销类型\",\"dictType\":\"order_baoxiao_type\",\"status\":\"0\",\"remark\":\"报销管理报销类型\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:49:53');
INSERT INTO `sys_oper_log` VALUES (1714458866293583873, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:50:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:50:21\",\"dictCode\":\"1714458866247446529\",\"dictSort\":0,\"dictLabel\":\"报销单\",\"dictValue\":\"1\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:50:21');
INSERT INTO `sys_oper_log` VALUES (1714458977434251265, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:50:47\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:50:47\",\"dictCode\":\"1714458977383919617\",\"dictSort\":0,\"dictLabel\":\"差旅费报销单\",\"dictValue\":\"1\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:50:48');
INSERT INTO `sys_oper_log` VALUES (1714458995109048321, '字典数据', 2, 'com.baoxiao.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:50:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:50:52\",\"dictCode\":\"1714458866247446529\",\"dictSort\":0,\"dictLabel\":\"报销单\",\"dictValue\":\"0\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"N\",\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:50:52');
INSERT INTO `sys_oper_log` VALUES (1714459036800430082, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:51:02\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:51:02\",\"dictCode\":\"1714459036750098433\",\"dictSort\":0,\"dictLabel\":\"借款\",\"dictValue\":\"2\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:51:02');
INSERT INTO `sys_oper_log` VALUES (1714459078588280834, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:51:12\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:51:12\",\"dictCode\":\"1714459078533754881\",\"dictSort\":0,\"dictLabel\":\"保证金\",\"dictValue\":\"3\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:51:12');
INSERT INTO `sys_oper_log` VALUES (1714459131017080834, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:51:24\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:51:24\",\"dictCode\":\"1714459130970943489\",\"dictSort\":0,\"dictLabel\":\"调整单据\",\"dictValue\":\"4\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:51:25');
INSERT INTO `sys_oper_log` VALUES (1714459175136964609, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:51:35\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:51:35\",\"dictCode\":\"1714459175090827266\",\"dictSort\":0,\"dictLabel\":\"付款申请\",\"dictValue\":\"5\",\"dictType\":\"order_baoxiao_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:51:35');
INSERT INTO `sys_oper_log` VALUES (1714460235280855042, '字典类型', 1, 'com.baoxiao.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:55:47\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:55:47\",\"dictId\":\"1714460235264077826\",\"dictName\":\"业务类型\",\"dictType\":\"client_business_type\",\"status\":\"0\",\"remark\":\"客户信息业务类型\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:55:48');
INSERT INTO `sys_oper_log` VALUES (1714460293418102786, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:56:01\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:56:01\",\"dictCode\":\"1714460293367771137\",\"dictSort\":0,\"dictLabel\":\"外包A类\",\"dictValue\":\"0\",\"dictType\":\"client_business_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:56:02');
INSERT INTO `sys_oper_log` VALUES (1714460335440834562, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:56:11\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:56:11\",\"dictCode\":\"1714460335390502913\",\"dictSort\":0,\"dictLabel\":\"外包B类\",\"dictValue\":\"1\",\"dictType\":\"client_business_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:56:12');
INSERT INTO `sys_oper_log` VALUES (1714460397222932481, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 09:56:26\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 09:56:26\",\"dictCode\":\"1714460397151629314\",\"dictSort\":0,\"dictLabel\":\"外包C类\",\"dictValue\":\"2\",\"dictType\":\"client_business_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 09:56:26');
INSERT INTO `sys_oper_log` VALUES (1714465085469143041, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13812345678\",\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,    create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:15:04');
INSERT INTO `sys_oper_log` VALUES (1714465132554399745, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13812345678\",\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,    create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:15:15');
INSERT INTO `sys_oper_log` VALUES (1714466549717446657, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,    create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:20:53');
INSERT INTO `sys_oper_log` VALUES (1714466751631241217, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,    create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:21:41');
INSERT INTO `sys_oper_log` VALUES (1714466773705863169, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,    create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:21:47');
INSERT INTO `sys_oper_log` VALUES (1714467225721831426, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,  sort,   create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?,   ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2023-10-18 10:23:34');
INSERT INTO `sys_oper_log` VALUES (1714467258571620354, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,  sort,   create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?,   ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2023-10-18 10:23:42');
INSERT INTO `sys_oper_log` VALUES (1714467529305554945, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,  sort,   create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?,   ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2023-10-18 10:24:47');
INSERT INTO `sys_oper_log` VALUES (1714467557780684802, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,  sort,   create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?,   ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2023-10-18 10:24:54');
INSERT INTO `sys_oper_log` VALUES (1714467768808701954, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,  sort,   create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?,   ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n; Field \'remark\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'remark\' doesn\'t have a default value', '2023-10-18 10:25:44');
INSERT INTO `sys_oper_log` VALUES (1714467805764714498, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":null,\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":null}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoClientMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoClientMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_client  ( client_id, client_unit_name, client_agreement_name, business_type, customer_name, sell_name, contacts_name, phone,  sort,   create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?,   ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'remark\' doesn\'t have a default value\n; Field \'remark\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'remark\' doesn\'t have a default value', '2023-10-18 10:25:53');
INSERT INTO `sys_oper_log` VALUES (1714468353389821953, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":\"1714468353012334593\",\"clientUnitName\":\"菁鸿科技（备注）\",\"clientAgreementName\":\"菁鸿科技\",\"businessType\":0,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 10:28:03');
INSERT INTO `sys_oper_log` VALUES (1714468691832406017, '客户信息', 1, 'com.baoxiao.app.controller.BaoxiaoClientController.add()', 'POST', 1, 'admin', '', '/app/client', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"clientId\":\"1714468691626885121\",\"clientUnitName\":\"四海服饰（服装）\",\"clientAgreementName\":\"四海服饰\",\"businessType\":1,\"customerName\":\"疯狂的狮子Li\",\"sellName\":\"本部门及以下 密码666666\",\"contactsName\":\"王\",\"phone\":\"13512345678\",\"sort\":0,\"status\":null,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 10:29:24');
INSERT INTO `sys_oper_log` VALUES (1714469092669456386, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714469092438769665\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 10:31:00');
INSERT INTO `sys_oper_log` VALUES (1714470040246616065, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714470039529390082\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714470039764271105\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'baoxiao_type\' in \'field list\'\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'baoxiao_type\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'baoxiao_type\' in \'field list\'', '2023-10-18 10:34:46');
INSERT INTO `sys_oper_log` VALUES (1714470101647032322, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714470101324070913\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714470101458288641\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'baoxiao_type\' in \'field list\'\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'baoxiao_type\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'baoxiao_type\' in \'field list\'', '2023-10-18 10:35:00');
INSERT INTO `sys_oper_log` VALUES (1714472369423319042, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714472369209409538\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714472369289101314\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'client_id\' in \'field list\'\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'client_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'client_id\' in \'field list\'', '2023-10-18 10:44:01');
INSERT INTO `sys_oper_log` VALUES (1714473113195053057, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714473112981143553\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714473113060835330\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'client_id\' in \'field list\'\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'client_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'client_id\' in \'field list\'', '2023-10-18 10:46:58');
INSERT INTO `sys_oper_log` VALUES (1714475412416036866, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714475412256653314\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714475412323762177\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:56:06');
INSERT INTO `sys_oper_log` VALUES (1714475587280764930, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714475587108798466\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714475587196878850\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'sort\' doesn\'t have a default value\n; Field \'sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sort\' doesn\'t have a default value', '2023-10-18 10:56:48');
INSERT INTO `sys_oper_log` VALUES (1714475622957514754, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714475622798131201\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714475622844268546\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n### The error may exist in com/baoxiao/app/mapper/BaoxiaoOrderMapper.java (best guess)\n### The error may involve com.baoxiao.app.mapper.BaoxiaoOrderMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO baoxiao_order  ( order_id, order_number, order_type, order_date, baoxiao_type, baoxiao_sum, payment_sum, offset_loan_sum, total_amount, collection_id, fee_id, is_offset_loan, is_dept_share, order_status, user_id, user_name, baoxiao_user_id, baoxiao_user_name, dept_id, dept_name, company_id, client_id, remark, audit_id,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ? )\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2023-10-18 10:56:57');
INSERT INTO `sys_oper_log` VALUES (1714475683015753729, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"1688\",\"remark\":\"第一次报销\",\"fees\":[{\"feeId\":\"1714475682327887874\",\"feeItem\":\"车费\",\"baoxiaoSum\":\"200\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714475682390802433\",\"collectionSum\":\"200\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714469092438769665\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 10:57:11');
INSERT INTO `sys_oper_log` VALUES (1714480158380064769, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714480158371676161\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 11:14:58');
INSERT INTO `sys_oper_log` VALUES (1714480299103158274, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"12\",\"remark\":\"12\",\"fees\":[{\"feeId\":\"1714480298973134850\",\"feeItem\":\"0\",\"baoxiaoSum\":\"0\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714480298981523457\",\"collectionSum\":\"0\",\"collectionUser\":\"0\",\"collectionBank\":\"0\",\"collectionBankName\":\"0\",\"collectionBankAddress\":\"0\"}],\"fileIds\":[\"1714480158371676161\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 11:15:31');
INSERT INTO `sys_oper_log` VALUES (1714480892773335041, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714480892756557825\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 11:17:53');
INSERT INTO `sys_oper_log` VALUES (1714481842812551169, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714481842749636610\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 11:21:40');
INSERT INTO `sys_oper_log` VALUES (1714482460411232258, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"126\",\"remark\":\"0\",\"fees\":[{\"feeId\":\"1714482068151533570\",\"feeItem\":\"0\",\"baoxiaoSum\":\"0\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714482068189282306\",\"collectionSum\":\"1\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[\"1714481842749636610\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 11:24:07');
INSERT INTO `sys_oper_log` VALUES (1714483104736018434, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714483104681492481\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 11:26:40');
INSERT INTO `sys_oper_log` VALUES (1714483352661327873, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"168\",\"remark\":\"第二次报销测试\",\"fees\":[{\"feeId\":\"1714483129738264577\",\"feeItem\":\"住宿费\",\"baoxiaoSum\":\"168\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714483129763430401\",\"collectionSum\":\"168\",\"collectionUser\":\"王\",\"collectionBank\":\"6222222222222\",\"collectionBankName\":\"中国银行\",\"collectionBankAddress\":\"中国银行支行\"}],\"fileIds\":[\"1714483104681492481\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 11:27:39');
INSERT INTO `sys_oper_log` VALUES (1714483558714949634, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714483558018695170\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 11:28:29');
INSERT INTO `sys_oper_log` VALUES (1714483955496108034, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1714483955479330818\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-18 11:30:03');
INSERT INTO `sys_oper_log` VALUES (1714483998252843010, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"123\",\"remark\":\"123\",\"fees\":[{\"feeId\":\"1714483984726212609\",\"feeItem\":\"0\",\"baoxiaoSum\":\"0\",\"taxRate\":\"0\",\"specialRicket\":\"0\"}],\"collections\":[{\"collectionId\":\"1714483984780738562\",\"collectionSum\":\"1\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[\"1714483955479330818\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 11:30:13');
INSERT INTO `sys_oper_log` VALUES (1714632715983372290, '字典类型', 1, 'com.baoxiao.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 21:21:10\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 21:21:10\",\"dictId\":\"1714632715509415937\",\"dictName\":\"报销冲借款\",\"dictType\":\"order_offset_loan\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 21:21:10');
INSERT INTO `sys_oper_log` VALUES (1714632899836493826, '字典类型', 1, 'com.baoxiao.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 21:21:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 21:21:54\",\"dictId\":\"1714632899740024833\",\"dictName\":\"报销分摊\",\"dictType\":\"order_dept_share\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 21:21:54');
INSERT INTO `sys_oper_log` VALUES (1714632991217795073, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 21:22:16\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 21:22:16\",\"dictCode\":\"1714632991087771650\",\"dictSort\":0,\"dictLabel\":\"0\",\"dictValue\":\"未冲\",\"dictType\":\"order_offset_loan\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 21:22:16');
INSERT INTO `sys_oper_log` VALUES (1714633057924005889, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 21:22:31\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 21:22:31\",\"dictCode\":\"1714633057869479937\",\"dictSort\":0,\"dictLabel\":\"1\",\"dictValue\":\"已冲\",\"dictType\":\"order_offset_loan\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 21:22:32');
INSERT INTO `sys_oper_log` VALUES (1714633183971229698, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 21:23:02\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 21:23:02\",\"dictCode\":\"1714633183941869570\",\"dictSort\":0,\"dictLabel\":\"未分\",\"dictValue\":\"0\",\"dictType\":\"order_dept_share\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 21:23:02');
INSERT INTO `sys_oper_log` VALUES (1714633229802389506, '字典数据', 1, 'com.baoxiao.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-18 21:23:12\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-18 21:23:12\",\"dictCode\":\"1714633229756252162\",\"dictSort\":0,\"dictLabel\":\"已分\",\"dictValue\":\"1\",\"dictType\":\"order_dept_share\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-18 21:23:13');
INSERT INTO `sys_oper_log` VALUES (1716355673797832705, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"111\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716355672564707329\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1\",\"taxRate\":\"1\",\"specialRicket\":\"1\"}],\"collections\":[{\"collectionId\":\"1716355672816365569\",\"collectionSum\":\"1\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: SELECT file_id,order_id,oss_id,file_name,original_name,url FROM baoxiao_order_file WHERE file_id IN ( )\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: SELECT file_id,order_id,oss_id,file_name,original_name,url FROM baoxiao_order_file WHERE file_id IN ( )', '2023-10-23 15:27:36');
INSERT INTO `sys_oper_log` VALUES (1716355753636409346, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"111\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716355753493803010\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1\",\"taxRate\":\"1\",\"specialRicket\":\"1\"}],\"collections\":[{\"collectionId\":\"1716355753514774530\",\"collectionSum\":\"1\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: SELECT file_id,order_id,oss_id,file_name,original_name,url FROM baoxiao_order_file WHERE file_id IN ( )\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: SELECT file_id,order_id,oss_id,file_name,original_name,url FROM baoxiao_order_file WHERE file_id IN ( )', '2023-10-23 15:27:55');
INSERT INTO `sys_oper_log` VALUES (1716360040160571393, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"111\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716360039950856193\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1\",\"taxRate\":\"1\",\"specialRicket\":\"1\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-23 15:44:57');
INSERT INTO `sys_oper_log` VALUES (1716384672515272705, '订单文件', 3, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.remove()', 'DELETE', 1, 'admin', '', '/app/orderFile/1716360040017965057', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2023-10-23 17:22:49');
INSERT INTO `sys_oper_log` VALUES (1716384735685685250, '订单文件', 3, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.remove()', 'DELETE', 1, 'admin', '', '/app/orderFile/1716360040017965057', '127.0.0.1', '内网IP', '{}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2023-10-23 17:23:05');
INSERT INTO `sys_oper_log` VALUES (1716446393443487746, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1716446392764010497\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-23 21:28:05');
INSERT INTO `sys_oper_log` VALUES (1716446407775424513, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":2,\"baoxiaoUserName\":\"本部门及以下 密码666666\",\"deptId\":108,\"deptName\":\"市场部门\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"222\",\"remark\":\"222\",\"fees\":[{\"feeId\":\"1716446406965923842\",\"feeItem\":\"222\",\"baoxiaoSum\":\"222\",\"taxRate\":\"222\",\"specialRicket\":\"222\"}],\"collections\":[{\"collectionId\":\"1716446407116918786\",\"collectionSum\":\"222\",\"collectionUser\":\"222\",\"collectionBank\":\"222\",\"collectionBankName\":\"222\",\"collectionBankAddress\":\"222\"}],\"fileIds\":[\"1716446392764010497\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-23 21:28:08');
INSERT INTO `sys_oper_log` VALUES (1716451224778403841, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1716451223859851266\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-23 21:47:17');
INSERT INTO `sys_oper_log` VALUES (1716451232663695361, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455534346874881\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"3333333\",\"remark\":\"333\",\"fees\":[{\"feeId\":\"1716451232294596610\",\"feeItem\":\"333\",\"baoxiaoSum\":\"333\",\"taxRate\":\"333\",\"specialRicket\":\"333\"}],\"collections\":[{\"collectionId\":\"1716451232407842817\",\"collectionSum\":\"333\",\"collectionUser\":\"333\",\"collectionBank\":\"333\",\"collectionBankName\":\"333\",\"collectionBankAddress\":\"333\"}],\"fileIds\":[\"1716451223859851266\"]}', '', 1, 'WRONGTYPE Operation against a key holding the wrong kind of value. channel: [id: 0x804dda99, L:/127.0.0.1:34014 - R:localhost/127.0.0.1:6379] command: (INCR), promise: java.util.concurrent.CompletableFuture@d750422[Not completed, 1 dependents], params: [baoxiao:order:order_id:]', '2023-10-23 21:47:19');
INSERT INTO `sys_oper_log` VALUES (1716452557531082753, '订单', 1, 'com.baoxiao.app.controller.BaoxiaoOrderController.add()', 'POST', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"companyId\":\"1714455534346874881\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"baoxiaoType\":0,\"orderType\":null,\"totalAmount\":\"3333333\",\"remark\":\"333\",\"fees\":[{\"feeId\":\"1716452556964851713\",\"feeItem\":\"333\",\"baoxiaoSum\":\"333\",\"taxRate\":\"333\",\"specialRicket\":\"333\"}],\"collections\":[{\"collectionId\":\"1716452557010989058\",\"collectionSum\":\"333\",\"collectionUser\":\"333\",\"collectionBank\":\"333\",\"collectionBankName\":\"333\",\"collectionBankAddress\":\"333\"}],\"fileIds\":[\"1716451223859851266\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-23 21:52:35');
INSERT INTO `sys_oper_log` VALUES (1717104750437228546, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"111\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716360039950856193\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1.00\",\"taxRate\":\"1.00\",\"specialRicket\":\"1.00\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1.00\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, '', '2023-10-25 17:04:09');
INSERT INTO `sys_oper_log` VALUES (1717104870255910913, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"111\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716360039950856193\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1.00\",\"taxRate\":\"1.00\",\"specialRicket\":\"1.00\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1.00\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, '', '2023-10-25 17:04:38');
INSERT INTO `sys_oper_log` VALUES (1717105073407025154, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"111\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716360039950856193\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1.00\",\"taxRate\":\"1.00\",\"specialRicket\":\"1.00\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1.00\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, '', '2023-10-25 17:05:26');
INSERT INTO `sys_oper_log` VALUES (1717114176804118529, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"totalAmount\":\"999\",\"remark\":\"111999\",\"fees\":[{\"feeId\":null,\"feeItem\":\"999\",\"baoxiaoSum\":\"9999\",\"taxRate\":\"9999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:41:37');
INSERT INTO `sys_oper_log` VALUES (1717114541893115905, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"totalAmount\":\"999\",\"remark\":\"111999\",\"fees\":[{\"feeId\":null,\"feeItem\":\"999\",\"baoxiaoSum\":\"9999\",\"taxRate\":\"9999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:43:04');
INSERT INTO `sys_oper_log` VALUES (1717114716078366721, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"totalAmount\":\"999\",\"remark\":\"111999\",\"fees\":[{\"feeId\":null,\"feeItem\":\"999\",\"baoxiaoSum\":\"9999\",\"taxRate\":\"9999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:43:45');
INSERT INTO `sys_oper_log` VALUES (1717114841030877185, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"totalAmount\":\"999\",\"remark\":\"111999\",\"fees\":[{\"feeId\":null,\"feeItem\":\"999\",\"baoxiaoSum\":\"9999\",\"taxRate\":\"9999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:44:15');
INSERT INTO `sys_oper_log` VALUES (1717115012649213954, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"totalAmount\":\"999\",\"remark\":\"111999\",\"fees\":[{\"feeId\":null,\"feeItem\":\"999\",\"baoxiaoSum\":\"9999\",\"taxRate\":\"9999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:44:56');
INSERT INTO `sys_oper_log` VALUES (1717115394498650114, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468691626885121\",\"baoxiaoUserId\":3,\"baoxiaoUserName\":\"仅本人 密码666666\",\"deptId\":102,\"deptName\":\"长沙分公司\",\"totalAmount\":\"999\",\"remark\":\"111999\",\"fees\":[{\"feeId\":null,\"feeItem\":\"999\",\"baoxiaoSum\":\"9999\",\"taxRate\":\"9999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:46:27');
INSERT INTO `sys_oper_log` VALUES (1717115792802340865, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"111.00\",\"remark\":\"111\",\"fees\":[{\"feeId\":null,\"feeItem\":\"1\",\"baoxiaoSum\":\"1.00\",\"taxRate\":\"1.00\",\"specialRicket\":\"1.00\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1.00\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:48:02');
INSERT INTO `sys_oper_log` VALUES (1717116161246781441, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"111.00\",\"remark\":\"111\",\"fees\":[{\"feeId\":null,\"feeItem\":\"1\",\"baoxiaoSum\":\"1.00\",\"taxRate\":\"1.00\",\"specialRicket\":\"1.00\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1.00\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '', 1, 'com.baoxiao.app.mapper.BaoxiaoFeeMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column \'fee_id\' cannot be null\n; Column \'fee_id\' cannot be null; nested exception is java.sql.BatchUpdateException: Column \'fee_id\' cannot be null', '2023-10-25 17:49:30');
INSERT INTO `sys_oper_log` VALUES (1717116844725411842, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716360040017965057\",\"companyId\":\"1714455348723757058\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"111.00\",\"remark\":\"111\",\"fees\":[{\"feeId\":\"1716360039950856193\",\"feeItem\":\"1\",\"baoxiaoSum\":\"1.00\",\"taxRate\":\"1.00\",\"specialRicket\":\"1.00\"}],\"collections\":[{\"collectionId\":\"1716360039988604930\",\"collectionSum\":\"1.00\",\"collectionUser\":\"1\",\"collectionBank\":\"1\",\"collectionBankName\":\"1\",\"collectionBankAddress\":\"1\"}],\"fileIds\":[]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-25 17:52:13');
INSERT INTO `sys_oper_log` VALUES (1717117095754506241, '订单文件', 1, 'com.baoxiao.app.controller.BaoxiaoOrderFileController.add()', 'POST', 1, 'admin', '', '/app/orderFile', '127.0.0.1', '内网IP', '{\"ossId\":[\"1714286212693536769\"]}', '{\"total\":1,\"rows\":[{\"fileId\":\"1717117095708368897\",\"orderId\":0,\"ossId\":\"1714286212693536769\",\"fileName\":\"2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\",\"originalName\":\"leaf.jpg\",\"url\":\"http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg\"}],\"code\":200,\"msg\":\"查询成功\"}', 0, '', '2023-10-25 17:53:13');
INSERT INTO `sys_oper_log` VALUES (1717117162557186049, '订单', 2, 'com.baoxiao.app.controller.BaoxiaoOrderController.edit()', 'PUT', 1, 'admin', '', '/app/order', '127.0.0.1', '内网IP', '{\"orderId\":\"1716452557212315650\",\"companyId\":\"1714455639149948929\",\"clientId\":\"1714468353012334593\",\"baoxiaoUserId\":1,\"baoxiaoUserName\":\"疯狂的狮子Li\",\"deptId\":105,\"deptName\":\"测试部门\",\"totalAmount\":\"999\",\"remark\":\"3339999\",\"fees\":[{\"feeId\":\"1716452556964851713\",\"feeItem\":\"999\",\"baoxiaoSum\":\"999\",\"taxRate\":\"999\",\"specialRicket\":\"999\"}],\"collections\":[{\"collectionId\":\"1716452557010989058\",\"collectionSum\":\"666\",\"collectionUser\":\"666\",\"collectionBank\":\"666\",\"collectionBankName\":\"666\",\"collectionBankAddress\":\"666\"}],\"fileIds\":[\"1716451223859851266\",\"1717117095708368897\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-10-25 17:53:29');
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `oss_id` bigint(20) NOT NULL COMMENT '对象存储主键',
  `group_id` bigint(20) NOT NULL COMMENT '分组id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `group_type` bigint(20) NOT NULL COMMENT '分组类型id',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) NOT NULL COMMENT 'URL地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(20) NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='OSS对象存储表';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
INSERT INTO `sys_oss` VALUES (1714286212693536769, 0, 1, 103, 1, '2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg', 'leaf.jpg', '.jpg', 'http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/d0e5f466cb7f43cbb8e84f7014135a21.jpg', '2023-10-17 22:24:18', 'admin', '2023-10-17 22:24:18', 'admin', 'aliyun');
INSERT INTO `sys_oss` VALUES (1714286609931874306, 0, 1, 103, 2, '2023/10/17/e7c2a767679c41009dd6b7d5bfdba85e.doc', '新建 DOC 文档.doc', '.doc', 'http://file-bucket-demo.oss-cn-shenzhen.aliyuncs.com/2023/10/17/e7c2a767679c41009dd6b7d5bfdba85e.doc', '2023-10-17 22:25:52', 'admin', '2023-10-17 22:25:52', 'admin', 'aliyun');
COMMIT;

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint(20) NOT NULL COMMENT '主建',
  `config_key` varchar(20) NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) DEFAULT '' COMMENT '域',
  `access_policy` char(1) NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对象存储配置表';

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 'admin', '2023-07-19 15:32:25', 'admin', '2023-07-19 15:32:25', NULL);
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2023-07-19 15:32:25', 'admin', '2023-07-19 15:32:25', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'LTAI5tCWrJgiUQBj8YfXpp7E', '7eNNErYraTAObIJ4IbPZ25xPaOz10k', 'file-bucket-demo', '', 'oss-cn-shenzhen.aliyuncs.com', '', 'N', '', '1', '0', '', 'admin', '2023-07-19 15:32:25', 'admin', '2023-10-17 22:24:06', '');
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2023-07-19 15:32:25', 'admin', '2023-07-19 15:32:25', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 'admin', '2023-07-19 15:32:25', 'admin', '2023-07-19 15:32:25', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_group`;
CREATE TABLE `sys_oss_group` (
  `group_id` bigint(20) NOT NULL COMMENT '分组id',
  `group_type` bigint(20) NOT NULL COMMENT '分组类型id（0是父id）',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `name` varchar(20) NOT NULL COMMENT '分组名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL COMMENT '上传人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_oss_group
-- ----------------------------
BEGIN;
INSERT INTO `sys_oss_group` VALUES (1, 0, 1, 1, '图片', '2023-10-17 17:23:04', '1', '2023-10-17 17:23:07', '1');
INSERT INTO `sys_oss_group` VALUES (2, 0, 1, 1, '办公三件套', '2023-10-17 17:23:51', '1', '2023-10-17 17:23:54', '1');
INSERT INTO `sys_oss_group` VALUES (3, 0, 1, 1, '其他', '2023-10-17 17:24:10', '1', '2023-10-17 17:24:13', '1');
INSERT INTO `sys_oss_group` VALUES (4, 1, 1, 1, '全部分组', '2023-10-17 17:25:24', '1', '2023-10-17 17:25:28', '1');
INSERT INTO `sys_oss_group` VALUES (5, 2, 1, 1, '全部分组', '2023-10-17 17:25:45', '1', '2023-10-17 17:25:48', '1');
INSERT INTO `sys_oss_group` VALUES (6, 3, 1, 1, '全部分组', '2023-10-17 17:25:58', '1', '2023-10-17 17:26:03', '1');
INSERT INTO `sys_oss_group` VALUES (1714286652000743426, 2, 1, 103, '1', '2023-10-17 22:26:02', 'admin', '2023-10-17 22:26:02', 'admin');
INSERT INTO `sys_oss_group` VALUES (1714286670585704449, 1, 1, 103, '2', '2023-10-17 22:26:07', 'admin', '2023-10-17 22:26:07', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-07-19 15:32:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-07-19 15:32:25', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-07-19 15:32:25', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '本部门及以下', 'test1', 3, '4', 1, 1, '0', '0', 'admin', '2023-07-19 15:50:56', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '仅本人', 'test2', 4, '5', 1, 1, '0', '0', 'admin', '2023-07-19 15:50:56', 'admin', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1500);
INSERT INTO `sys_role_menu` VALUES (3, 1501);
INSERT INTO `sys_role_menu` VALUES (3, 1502);
INSERT INTO `sys_role_menu` VALUES (3, 1503);
INSERT INTO `sys_role_menu` VALUES (3, 1504);
INSERT INTO `sys_role_menu` VALUES (3, 1505);
INSERT INTO `sys_role_menu` VALUES (3, 1506);
INSERT INTO `sys_role_menu` VALUES (3, 1507);
INSERT INTO `sys_role_menu` VALUES (3, 1508);
INSERT INTO `sys_role_menu` VALUES (3, 1509);
INSERT INTO `sys_role_menu` VALUES (3, 1510);
INSERT INTO `sys_role_menu` VALUES (3, 1511);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 1500);
INSERT INTO `sys_role_menu` VALUES (4, 1501);
INSERT INTO `sys_role_menu` VALUES (4, 1502);
INSERT INTO `sys_role_menu` VALUES (4, 1503);
INSERT INTO `sys_role_menu` VALUES (4, 1504);
INSERT INTO `sys_role_menu` VALUES (4, 1505);
INSERT INTO `sys_role_menu` VALUES (4, 1506);
INSERT INTO `sys_role_menu` VALUES (4, 1507);
INSERT INTO `sys_role_menu` VALUES (4, 1508);
INSERT INTO `sys_role_menu` VALUES (4, 1509);
INSERT INTO `sys_role_menu` VALUES (4, 1510);
INSERT INTO `sys_role_menu` VALUES (4, 1511);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-10-17 16:59:20', 'admin', '2023-07-19 15:32:25', 'admin', '2023-10-17 16:59:20', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-07-19 15:32:25', 'admin', '2023-07-19 15:32:25', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2023-07-19 15:50:56', 'admin', '2023-07-19 15:50:56', 'test', '2023-07-19 15:50:56', NULL);
INSERT INTO `sys_user` VALUES (4, 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2023-07-19 15:50:56', 'admin', '2023-07-19 15:50:56', 'test1', '2023-07-19 15:50:56', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);
COMMIT;

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `order_num` int(11) DEFAULT '0' COMMENT '排序号',
  `test_key` varchar(255) DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试单表';

-- ----------------------------
-- Records of test_demo
-- ----------------------------
BEGIN;
INSERT INTO `test_demo` VALUES (1, 102, 4, 1, '测试数据权限', '测试', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, 102, 3, 2, '子节点1', '111', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, 102, 3, 3, '子节点2', '222', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, 108, 4, 4, '测试数据', 'demo', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, 108, 3, 13, '子节点11', '1111', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, 108, 3, 12, '子节点22', '2222', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, 108, 3, 11, '子节点33', '3333', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, 108, 3, 10, '子节点44', '4444', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, 108, 3, 9, '子节点55', '5555', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, 108, 3, 8, '子节点66', '6666', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, 108, 3, 7, '子节点77', '7777', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, 108, 3, 6, '子节点88', '8888', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, 108, 3, 5, '子节点99', '9999', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) DEFAULT NULL COMMENT '值',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试树表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------
BEGIN;
INSERT INTO `test_tree` VALUES (1, 0, 102, 4, '测试数据权限', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, 1, 102, 3, '子节点1', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, 2, 102, 3, '子节点2', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, 0, 108, 4, '测试树1', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, 4, 108, 3, '子节点11', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, 4, 108, 3, '子节点22', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, 4, 108, 3, '子节点33', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, 5, 108, 3, '子节点44', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, 6, 108, 3, '子节点55', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, 7, 108, 3, '子节点66', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, 7, 108, 3, '子节点77', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, 10, 108, 3, '子节点88', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, 10, 108, 3, '子节点99', 0, '2023-07-19 15:50:56', 'admin', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_group` VALUES (1, 'xxl-job-executor', '示例执行器', 0, 'http://192.168.16.128:9101/', '2023-10-25 21:28:08');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_info` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `I_trigger_time` (`trigger_time`) USING BTREE,
  KEY `I_handle_code` (`handle_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_log_report` VALUES (1, '2023-07-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (2, '2023-07-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (3, '2023-07-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (4, '2023-07-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (5, '2023-10-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (6, '2023-10-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (7, '2023-10-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (8, '2023-10-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (9, '2023-10-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (10, '2023-10-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (11, '2023-10-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (12, '2023-10-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (13, '2023-10-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (14, '2023-10-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (15, '2023-10-25 00:00:00', 0, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_registry` VALUES (4, 'EXECUTOR', 'xxl-job-executor', 'http://192.168.16.128:9101/', '2023-10-25 21:27:48');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

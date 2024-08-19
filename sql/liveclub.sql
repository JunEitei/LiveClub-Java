/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50708 (5.7.8-rc)
 Source Host           : localhost:3306
 Source Schema         : liveclub

 Target Server Type    : MySQL
 Target Server Version : 50708 (5.7.8-rc)
 File Encoding         : 65001

 Date: 29/06/2024 17:52:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-27 15:04:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-27 15:04:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-06-27 15:04:23', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-27 15:04:23', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-06-27 15:04:23', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET latin1 DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET latin1 DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '负责人',
  `phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET latin1 DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET latin1 DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET latin1 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', 'LiveClub', 0, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', 'LiveClub Osaka', 1, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', 'LiveClub Tyoko', 2, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', 'LiveClub Yamanashi', 1, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', 'LiveClub xxx', 2, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', 'LiveClub bbb', 3, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', 'LiveClub ccc', 4, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', 'LiveClub aaa', 5, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', 'LiveClub qqq', 1, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', 'LiveClub www', 2, 'damao', '070-90700215', 'dadada.maomaomao@gmail.com', '0', '0', 'admin', '2024-06-28 08:26:57', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
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
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-06-27 15:04:23', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-06-27 15:04:23', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-06-27 15:04:23', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-06-27 15:04:23', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`access_time`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-27 15:48:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-27 17:33:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-27 17:40:42');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-27 17:52:20');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-28 08:14:47');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (105, 'admin', '127.0.0.1', '0', '退出成功', '2024-06-28 08:31:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-28 08:31:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-28 14:07:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-28 15:17:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (109, 'admin', '127.0.0.1', '0', '退出成功', '2024-06-28 17:04:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-28 17:05:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-28 17:06:31');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (112, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 10:26:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (113, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 10:26:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (114, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 10:26:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (115, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 10:26:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (116, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 10:27:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (117, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 10:27:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (118, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 10:34:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (119, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 10:35:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (120, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:32:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (121, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:32:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (122, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:32:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (123, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:33:42');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (124, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:33:47');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (125, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:34:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (126, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:35:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (127, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:37:31');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (128, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:42:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (129, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:43:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (130, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:46:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (131, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:46:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (132, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:47:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (133, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:47:34');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (134, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:47:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (135, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:47:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (136, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:49:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (137, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:49:10');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (138, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:49:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (139, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:49:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (140, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:50:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (141, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:50:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (142, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 11:50:31');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (143, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 11:51:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (144, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 12:08:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (145, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 12:48:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (146, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 12:56:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (147, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 15:18:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (148, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 16:07:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (149, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 16:12:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (150, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 16:12:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (151, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 16:12:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (152, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 16:29:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (153, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 16:29:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (154, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 16:30:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (155, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 16:30:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (156, 'admin', '192.168.65.1', '0', '退出成功', '2024-06-29 16:51:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (157, 'admin', '192.168.65.1', '0', '登录成功', '2024-06-29 16:51:39');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'Club管理', 0, 1, 'club', NULL, '', 1, 0, 'M', '0', '0', '', 'dashboard', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:44:06', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '會員管理', 1, 2, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'peoples', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:34:33', '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 108, 1, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'password', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:42:35', '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '選單管理', 108, 2, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:42:43', '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '場地管理', 1, 1, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'livehouse', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:46:08', '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 108, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'excel', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:42:24', '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '系統管理', 0, 1, 'system', '', '', 1, 0, 'M', '0', '0', '', 'swagger', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:46:39', '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '線上用戶', 108, 5, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:42:16', '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日誌', 108, 3, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:42:01', '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登入日誌', 108, 4, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 16:42:07', '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用戶查詢', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用戶新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用戶修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用戶刪除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用戶匯出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用戶導入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重設密碼', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查詢', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色刪除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色導出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '選單查詢', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '選單新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '選單修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '選單刪除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部門查詢', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部門新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部門修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部門刪除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查詢', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典刪除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典導出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查詢', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作刪除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日誌匯出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登入查詢', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登入刪除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日誌匯出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '帳戶解鎖', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '線上查詢', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量強退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '單條強退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-06-27 15:04:22', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
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
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (100, '用户头像', 2, 'com.kitamura.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}', 0, NULL, '2024-06-27 15:59:25', 104);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (101, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-06-28 08:27:46', 16);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (102, '角色管理', 2, 'com.kitamura.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-06-27 16:04:22\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:21', 39);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (103, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:27', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (104, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/107', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-28 08:28:33', 5);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (105, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1035', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:38', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (106, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1036', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:40', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (107, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1037', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:45', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (108, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1038', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:48', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (109, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/107', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:51', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (110, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/112', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 08:28:58', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (111, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/111', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-06-28 15:18:48', 23);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (112, '角色管理', 2, 'com.kitamura.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-06-27 16:04:22\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,3,114,115,1055,1056,1058,1057,1059,1060,116],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:19:11', 27);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (113, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/111', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:19:19', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (114, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/113', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:19:21', 13);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (115, '个人信息', 2, 'com.kitamura.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '192.168.65.1', '', '{\"admin\":false,\"email\":\"dadada.maomaomao@gmail.com\",\"nickName\":\"LiveClub\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 11:38:59', 59);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (116, '角色管理', 2, 'com.kitamura.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '192.168.65.1', '', '{\"admin\":false,\"createTime\":\"2024-06-27 16:04:22\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:21:51', 35);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (117, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/3', '192.168.65.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-29 15:22:05', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (118, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/114', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:09', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (119, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/115', '192.168.65.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-29 15:22:11', 5);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (120, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1055', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:16', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (121, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1056', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:17', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (122, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1058', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:18', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (123, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1057', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:19', 13);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (124, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1059', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:20', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (125, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1060', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:20', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (126, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/116', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:21', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (127, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/115', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:22', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (128, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/3', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:23', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (129, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/110', '192.168.65.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-29 15:22:33', 4);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (130, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1049', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:37', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (131, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1050', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:38', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (132, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1051', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:38', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (133, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1052', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:39', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (134, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1053', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:40', 13);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (135, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1054', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:40', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (136, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/110', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:41', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (137, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"線上用戶\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:56', 18);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (138, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:22:58', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (139, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"線上用戶\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":108,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:40:06', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (140, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"系統監控\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:40:18', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (141, '角色管理', 2, 'com.kitamura.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '192.168.65.1', '', '{\"admin\":false,\"createTime\":\"2024-06-27 16:04:22\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,108,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:17', 20);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (142, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1030', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:30', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (143, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1031', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:31', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (144, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1032', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:32', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (145, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1033', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:33', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (146, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1034', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:34', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (147, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/106', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:49:36', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (148, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系統管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:50:12', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (149, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用戶管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:50:35', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (150, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"password\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:50:58', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (151, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1020', '192.168.65.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-06-29 15:51:32', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (152, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1020', '192.168.65.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-06-29 15:51:34', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (153, '角色管理', 2, 'com.kitamura.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '192.168.65.1', '', '{\"admin\":false,\"createTime\":\"2024-06-27 16:04:22\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,108,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,105,1025,1026,1027,1028,1029,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:51:43', 18);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (154, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1020', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:51:57', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (155, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1021', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:51:58', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (156, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1022', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:51:59', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (157, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1023', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:52:00', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (158, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1024', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:52:01', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (159, '菜单管理', 3, 'com.kitamura.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/104', '192.168.65.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 15:52:03', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (160, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部門管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:01:24', 20);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (161, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:01:47', 13);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (162, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"radio\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"系統監控\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:02:08', 15);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (163, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"Livehouse管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:32:34', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (164, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"password\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:32:45', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (165, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"選單管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:33:00', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (166, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"Livehouse管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:33:29', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (167, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用戶管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:33:32', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (168, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"場地管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:34:03', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (169, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"會員管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:34:33', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (170, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"Club管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:35:02', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (171, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"radio\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"系統管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:41:20', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (172, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/operlog/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":500,\"menuName\":\"操作日誌\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":108,\"path\":\"operlog\",\"perms\":\"system:operlog:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:42:01', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (173, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/logininfor/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":501,\"menuName\":\"登入日誌\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":108,\"path\":\"logininfor\",\"perms\":\"system:logininfor:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:42:07', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (174, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"線上用戶\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":108,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:42:16', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (175, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":108,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:42:24', 17);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (176, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"password\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":108,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:42:35', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (177, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"選單管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":108,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:42:43', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (178, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"radio\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"系統管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:43:10', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (179, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"Club管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"club\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:43:16', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (180, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"Club管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"club\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:44:06', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (181, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"livehouse\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"場地管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:46:08', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (182, '菜单管理', 2, 'com.kitamura.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '192.168.65.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-06-27 16:04:22\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"系統管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 16:46:39', 9);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-06-27 15:04:22', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-06-27 15:04:22', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
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
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-06-27 15:04:22', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-06-27 15:04:22', 'admin', '2024-06-29 15:51:43', '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1045);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(16) DEFAULT '' COMMENT '手机号码',
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', 'LiveClub', '00', 'dadada.maomaomao@gmail.com', '070-90700215', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-27 06:04:22', 'admin', '2024-06-27 15:04:22', '', '2024-06-29 11:38:58', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'yuka', 'LiveClub', '00', 'yuka@gmail.com', '070-90700215', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-27 15:04:22', 'admin', '2024-06-27 15:04:22', '', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

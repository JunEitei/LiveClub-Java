/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50708 (5.7.8-rc)
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50708 (5.7.8-rc)
 File Encoding         : 65001

 Date: 03/07/2024 14:21:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  `encrypted_data_key` text COLLATE utf8_bin COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'spring:\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n      min-request-size: 8192\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', '58dde4e3760499d3bac2d77a3a1e9018', '2020-05-20 12:00:00', '2023-12-04 08:08:23', 'nacos', '0:0:0:0:0:0:0:1', '', '', '通用配置', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (2, 'liveclub-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 俱樂部服务\n        - id: liveclub-club\n          uri: lb://liveclub-club\n          predicates:\n            - Path=/club/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n      - /club/**', '38ed2a731d1c67dc4dba3bdca3d7975d', '2020-05-14 14:17:55', '2024-07-03 05:20:40', NULL, '192.168.65.1', '', '', '网关模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (3, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456', 'b4466607fb57a9290bfbe6fb87b1450f', '2020-11-20 00:00:00', '2024-06-29 03:24:51', NULL, '192.168.65.1', '', '', '认证中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (5, 'liveclub-system-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        connectTimeout: 30000\n        socketTimeout: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/liveclub?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: root\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com', 'e527d87b7da2916f13579a63e63e7b14', '2020-11-20 00:00:00', '2024-06-27 07:43:12', NULL, '192.168.65.1', '', '', '系统模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (8, 'liveclub-club-dev.yml', 'DEFAULT_GROUP', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://root:root@localhost:27017/admin\n      database: liveclub', '740aaf88d1d1e57511f3adad775c13cb', '2020-11-20 00:00:00', '2024-07-02 08:08:45', NULL, '192.168.65.1', '', '', '', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (9, 'sentinel-liveclub-gateway', 'DEFAULT_GROUP', '[\n    {\n        \"resource\": \"liveclub-auth\",\n        \"count\": 500,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n	{\n        \"resource\": \"liveclub-system\",\n        \"count\": 1000,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n    {\n        \"resource\": \"liveclub-club\",\n        \"count\": 1000,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    }\n]', '1b0871112ade615075cc037d71042ec1', '2020-11-20 00:00:00', '2024-06-29 06:53:28', NULL, '192.168.65.1', '', '', '限流策略', 'null', 'null', 'json', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (10, 'liveclub-gateway-prod.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: liveclub-redis\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 俱樂部服务\n        - id: liveclub-club\n          uri: lb://liveclub-club\n          predicates:\n            - Path=/club/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n      - /club/**', '9a3b0b746fc231630b7e5af4a34640c8', '2024-06-28 09:39:17', '2024-07-03 05:20:29', NULL, '192.168.65.1', '', '', '网关模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (11, 'application-prod.yml', 'DEFAULT_GROUP', 'spring:\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n      min-request-size: 8192\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', '58dde4e3760499d3bac2d77a3a1e9018', '2024-06-29 02:06:13', '2024-06-29 02:06:13', NULL, '192.168.65.1', '', '', '通用配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (12, 'liveclub-auth-prod.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: liveclub-redis\n    port: 6379\n    password: 123456', '8d2f2e5cdac8c9b4ec19d58c7411c424', '2024-06-29 02:37:29', '2024-06-29 03:24:33', NULL, '192.168.65.1', '', '', '认证中心', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (13, 'liveclub-club-prod.yml', 'DEFAULT_GROUP', '# Minio配置\nminio:\n  url: http://liveclub-minio:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://root:root@liveclub-mongo:27017/admin\n      database: liveclub', '3852a720ea9093583ad71daa14ef4e7f', '2024-07-02 07:34:32', '2024-07-02 08:08:51', NULL, '192.168.65.1', '', '', '', '', '', 'yaml', '', '');
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 1, 'liveclub-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: liveclub-gen\n          uri: lb://liveclub-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: liveclub-job\n          uri: lb://liveclub-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: liveclub-file\n          uri: lb://liveclub-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '6595fbde095a6d27054fd88c3e3531e4', '2024-06-27 15:21:21', '2024-06-27 07:21:21', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 2, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n', '8bd9dada9a94822feeab40de55efced6', '2024-06-27 15:23:31', '2024-06-27 07:23:32', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (4, 3, 'liveclub-monitor-dev.yml', 'DEFAULT_GROUP', '', '# spring\nspring:\n  security:\n    user:\n      name: ruoyi\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: LiveClub服务状态监控\n', '55bfb4191044a263c6475436f01cab37', '2024-06-27 15:23:57', '2024-06-27 07:23:58', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (5, 4, 'liveclub-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        connectTimeout: 30000\n        socketTimeout: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: password\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '4ebcc6108cc266d00a0eb925bfcfcb6b', '2024-06-27 15:24:26', '2024-06-27 07:24:27', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 5, 'liveclub-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n\n# 代码生成\ngen:\n  # 作者\n  author: ruoyi\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.kitamura.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', 'fd2c9d23012c9b24a2ef15751ea0883f', '2024-06-27 15:25:11', '2024-06-27 07:25:11', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (7, 6, 'liveclub-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '00bb2a84fd5100644e29cf463a8d28ba', '2024-06-27 15:25:34', '2024-06-27 07:25:35', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 7, 'liveclub-file-dev.yml', 'DEFAULT_GROUP', '', '# 本地文件上传    \r\nfile:\r\n    domain: http://127.0.0.1:9300\r\n    path: D:/ruoyi/uploadPath\r\n    prefix: /statics\r\n\r\n# FastDFS配置\r\nfdfs:\r\n  domain: http://8.129.231.12\r\n  soTimeout: 3000\r\n  connectTimeout: 2000\r\n  trackerList: 8.129.231.12:22122\r\n\r\n# Minio配置\r\nminio:\r\n  url: http://8.129.231.12:9000\r\n  accessKey: minioadmin\r\n  secretKey: minioadmin\r\n  bucketName: test', '5382b93f3d8059d6068c0501fdd41195', '2024-06-27 15:26:06', '2024-06-27 07:26:06', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 8, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n', '174086706809a8e67277c85c3725a27f', '2024-06-27 15:37:45', '2024-06-27 07:37:46', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 9, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  main:\n    allow-bean-definition-overriding: true', 'ee6bdea34e408b929a29c1e8d7f3eae9', '2024-06-27 15:39:21', '2024-06-27 07:39:22', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (5, 10, 'liveclub-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        connectTimeout: 30000\n        socketTimeout: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: password\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com', '7ab2b63d84783c45dd590b688f60aa6b', '2024-06-27 15:40:35', '2024-06-27 07:40:36', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 11, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  main:\n    allow-bean-definition-overriding: true', 'ee6bdea34e408b929a29c1e8d7f3eae9', '2024-06-27 15:41:36', '2024-06-27 07:41:37', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (5, 12, 'liveclub-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        connectTimeout: 30000\n        socketTimeout: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: root\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com', '41d5a59a831de9b5e9cd3dee5b31c062', '2024-06-27 15:43:11', '2024-06-27 07:43:12', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (7, 13, 'liveclub-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com\n', 'cc18dbb4dbfbbb4fd8a378fd8759e9e7', '2024-06-27 15:43:27', '2024-06-27 07:43:28', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 14, 'liveclub-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com\n\n# 代码生成\ngen:\n  # 作者\n  author: damao\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.kitamura.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', '3ccae90d61a05cbbaf5cd7f8a3f7d6de', '2024-06-27 15:43:37', '2024-06-27 07:43:38', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 15, 'liveclub-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: liveclub-gen\n          uri: lb://liveclub-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: liveclub-job\n          uri: lb://liveclub-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: liveclub-file\n          uri: lb://liveclub-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '96d4d43482d892cd8d8e256d8512e224', '2024-06-27 17:27:38', '2024-06-27 09:27:38', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (4, 16, 'liveclub-monitor-dev.yml', 'DEFAULT_GROUP', '', '# spring\nspring:\n  security:\n    user:\n      name: liveclub\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: LiveClub服务状态监控\n', 'e9672e0b6af2f95bec0b7ae6647b4e93', '2024-06-28 16:34:18', '2024-06-28 08:34:18', NULL, '192.168.65.1', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 17, 'liveclub-file-dev.yml', 'DEFAULT_GROUP', '', '# 本地文件上传    \nfile:\n    domain: http://127.0.0.1:9300\n    path: /liveclub/uploadPath\n    prefix: /statics\n\n# FastDFS配置\nfdfs:\n  domain: http://8.129.231.12\n  soTimeout: 3000\n  connectTimeout: 2000\n  trackerList: 8.129.231.12:22122\n\n# Minio配置\nminio:\n  url: http://8.129.231.12:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucketName: test', '6678a3524a12c3a83e8a0f8c25d50b6d', '2024-06-28 16:36:28', '2024-06-28 08:36:29', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 18, 'liveclub-file-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9002\n  accessKey: 9FKiOOJnkG4I49XH2Vh7\n  secretKey: M6Q7tXhf2swLWgCeQGhxzflkCHDMxmpVSssX9OR3\n  bucketName: liveclub', 'bcacb921c08c2072332f9be5637ce626', '2024-06-28 17:15:50', '2024-06-28 09:15:50', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 19, 'liveclub-gateway-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: liveclub-gen\n          uri: lb://liveclub-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: liveclub-job\n          uri: lb://liveclub-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: liveclub-file\n          uri: lb://liveclub-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '8ee860544f4688f02824949f272165fe', '2024-06-28 17:39:16', '2024-06-28 09:39:17', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 20, 'application-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n      min-request-size: 8192\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', '58dde4e3760499d3bac2d77a3a1e9018', '2024-06-29 10:06:13', '2024-06-29 02:06:13', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (10, 21, 'liveclub-gateway-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: liveclub-gen\n          uri: lb://liveclub-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: liveclub-job\n          uri: lb://liveclub-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: liveclub-file\n          uri: lb://liveclub-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '8ee860544f4688f02824949f272165fe', '2024-06-29 10:33:35', '2024-06-29 02:33:36', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 22, 'liveclub-auth-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456', 'b4466607fb57a9290bfbe6fb87b1450f', '2024-06-29 10:37:29', '2024-06-29 02:37:29', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 23, 'liveclub-auth-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456', 'b4466607fb57a9290bfbe6fb87b1450f', '2024-06-29 10:38:07', '2024-06-29 02:38:07', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 24, 'liveclub-auth-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: liveclub-redis\n    port: 6379\n    password: 123456', '8d2f2e5cdac8c9b4ec19d58c7411c424', '2024-06-29 11:22:05', '2024-06-29 03:22:05', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 25, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456', 'b4466607fb57a9290bfbe6fb87b1450f', '2024-06-29 11:22:31', '2024-06-29 03:22:32', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 26, 'liveclub-auth-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: ${redis.server.address}\n    port: 6379\n    password: 123456', '21c215d6a0e255d1560476024fd73626', '2024-06-29 11:24:33', '2024-06-29 03:24:33', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 27, 'liveclub-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: ${redis.server.address}\n    port: 6379\n    password: 123456', '21c215d6a0e255d1560476024fd73626', '2024-06-29 11:24:50', '2024-06-29 03:24:51', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 28, 'liveclub-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/liveclub?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com\n\n# 代码生成\ngen:\n  # 作者\n  author: damao\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.kitamura.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', '9d660a82787a8228231ba415081c4ea2', '2024-06-29 12:42:23', '2024-06-29 04:42:24', NULL, '192.168.65.1', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (7, 29, 'liveclub-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/liveclub?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.kitamura.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By LiveClub\n  licenseUrl: https://www.liveclub.com\n', '9061356f6db0678d1d0b66fa6aff1fdd', '2024-06-29 12:42:23', '2024-06-29 04:42:24', NULL, '192.168.65.1', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (9, 30, 'sentinel-liveclub-gateway', 'DEFAULT_GROUP', '', '[\r\n    {\r\n        \"resource\": \"liveclub-auth\",\r\n        \"count\": 500,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"liveclub-system\",\r\n        \"count\": 1000,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"liveclub-gen\",\r\n        \"count\": 200,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"liveclub-job\",\r\n        \"count\": 300,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    }\r\n]', 'a4b4d00278874331f7c8b30673f4e601', '2024-06-29 12:43:30', '2024-06-29 04:43:31', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 31, 'liveclub-file-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9002\n  accessKey: 9FKiOOJnkG4I49XH2Vh7\n  secretKey: M6Q7tXhf2swLWgCeQGhxzflkCHDMxmpVSssX9OR3\n  bucketName: liveclub', 'bcacb921c08c2072332f9be5637ce626', '2024-06-29 12:52:31', '2024-06-29 04:52:31', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 32, 'liveclub-file-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9002\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub', '31c46232c9dfe67159a0fa9565ff4510', '2024-06-29 13:35:43', '2024-06-29 05:35:44', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 33, 'liveclub-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: liveclub-gen\n          uri: lb://liveclub-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: liveclub-job\n          uri: lb://liveclub-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: liveclub-file\n          uri: lb://liveclub-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '8ee860544f4688f02824949f272165fe', '2024-06-29 14:53:16', '2024-06-29 06:53:17', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (9, 34, 'sentinel-liveclub-gateway', 'DEFAULT_GROUP', '', '[\n    {\n        \"resource\": \"liveclub-auth\",\n        \"count\": 500,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n	{\n        \"resource\": \"liveclub-system\",\n        \"count\": 1000,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n    {\n        \"resource\": \"liveclub-file\",\n        \"count\": 1000,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    }\n]', 'f0632310346fe5b2324e5635af52d241', '2024-06-29 14:53:27', '2024-06-29 06:53:28', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (10, 35, 'liveclub-gateway-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: liveclub-redis\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: liveclub-gen\n          uri: lb://liveclub-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: liveclub-job\n          uri: lb://liveclub-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: liveclub-file\n          uri: lb://liveclub-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '88456e86e4da99808cdf1374ea4add21', '2024-06-29 14:53:59', '2024-06-29 06:54:00', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 36, 'liveclub-club-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub', '1aab58b4db047d2ba51eecdfcb0af23c', '2024-07-02 15:34:15', '2024-07-02 07:34:15', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 37, 'liveclub-club-prod.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://localhost:27017/liveclub', '1310feabf13a3659eefa30fca5371127', '2024-07-02 15:34:31', '2024-07-02 07:34:32', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (13, 38, 'liveclub-club-prod.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://localhost:27017/liveclub', '1310feabf13a3659eefa30fca5371127', '2024-07-02 15:35:08', '2024-07-02 07:35:09', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 39, 'liveclub-club-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://localhost:27017/liveclub', '1310feabf13a3659eefa30fca5371127', '2024-07-02 15:35:16', '2024-07-02 07:35:17', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 40, 'liveclub-club-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://localhost:27017/liveclub', '1310feabf13a3659eefa30fca5371127', '2024-07-02 16:05:20', '2024-07-02 08:05:21', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (13, 41, 'liveclub-club-prod.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://liveclub-minio:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://liveclub-mongo:27017/liveclub', '5996f22a61adb95e795db7afb28b9d19', '2024-07-02 16:05:43', '2024-07-02 08:05:44', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 42, 'liveclub-club-dev.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://127.0.0.1:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://root:root@localhost:27017/admin\n      database: live', '0d66f6ba6804aa07959632097f78eb62', '2024-07-02 16:08:45', '2024-07-02 08:08:45', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (13, 43, 'liveclub-club-prod.yml', 'DEFAULT_GROUP', '', '# Minio配置\nminio:\n  url: http://liveclub-minio:9000\n  accessKey: qhuvpVQRtX0H7ZrHSCPc\n  secretKey: DipDy0K5lc5Kjgx5jTfhTzTtXzAoR10g5kKeop92\n  bucketName: liveclub\nspring:\n  data:\n    mongodb:\n      uri: mongodb://root:root@liveclub-mongo:27017/admin\n      database: live', '40b58461b72370b9081ab4d1a3621c19', '2024-07-02 16:08:51', '2024-07-02 08:08:51', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 44, 'liveclub-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 俱樂部服务\n        - id: liveclub-club\n          uri: lb://liveclub-club\n          predicates:\n            - Path=/club/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '8a850f6b7798301a83c73ac1f00e690d', '2024-07-03 10:12:24', '2024-07-03 02:12:24', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (10, 45, 'liveclub-gateway-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: liveclub-redis\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 俱樂部服务\n        - id: liveclub-club\n          uri: lb://liveclub-club\n          predicates:\n            - Path=/club/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', 'b14c300f405344c6f9cb5164478c93a9', '2024-07-03 13:18:05', '2024-07-03 05:18:05', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (10, 46, 'liveclub-gateway-prod.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: liveclub-redis\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 俱樂部服务\n        - id: liveclub-club\n          uri: lb://liveclub-club\n          predicates:\n            - Path=/club/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n      - /club/*\n', 'a54f965e588958faea8521a6c19c5d9d', '2024-07-03 13:20:29', '2024-07-03 05:20:29', NULL, '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 47, 'liveclub-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: liveclub-auth\n          uri: lb://liveclub-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 系统模块\n        - id: liveclub-system\n          uri: lb://liveclub-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 俱樂部服务\n        - id: liveclub-club\n          uri: lb://liveclub-club\n          predicates:\n            - Path=/club/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n      - /club/*\n', '2af28da2b9de6963e65a3969a908d472', '2024-07-03 13:20:39', '2024-07-03 05:20:40', NULL, '192.168.65.1', 'U', '', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(191) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`username`, `role`) VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

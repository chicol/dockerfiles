/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : iso

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-05-10 19:38:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `info_doc`
-- ----------------------------
DROP TABLE IF EXISTS `info_doc`;
CREATE TABLE `info_doc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `template_code` varchar(255) DEFAULT NULL,
  `template_url` varchar(255) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `info_doc_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `info_doc_item`
-- ----------------------------
DROP TABLE IF EXISTS `info_doc_item`;
CREATE TABLE `info_doc_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `content` text,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `info_doc_item_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `info_doc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_doc_item
-- ----------------------------

-- ----------------------------
-- Table structure for `info_doc_item_permission`
-- ----------------------------
DROP TABLE IF EXISTS `info_doc_item_permission`;
CREATE TABLE `info_doc_item_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `doc_item_id` bigint(20) NOT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `description` text,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_item_id` (`doc_item_id`),
  CONSTRAINT `info_doc_item_permission_ibfk_1` FOREIGN KEY (`doc_item_id`) REFERENCES `info_doc_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_doc_item_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `info_doc_template`
-- ----------------------------
DROP TABLE IF EXISTS `info_doc_template`;
CREATE TABLE `info_doc_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) NOT NULL,
  `template_code` varchar(255) DEFAULT NULL,
  `template_url` varchar(255) DEFAULT NULL,
  `template_name` varchar(200) NOT NULL,
  `user_code` varchar(200) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `sdate` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_doc_template
-- ----------------------------

-- ----------------------------
-- Table structure for `info_knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `info_knowledge`;
CREATE TABLE `info_knowledge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `system_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `system_id` (`system_id`),
  CONSTRAINT `info_knowledge_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`),
  CONSTRAINT `info_knowledge_ibfk_2` FOREIGN KEY (`system_id`) REFERENCES `info_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_knowledge
-- ----------------------------

-- ----------------------------
-- Table structure for `info_role_doc_item_permission`
-- ----------------------------
DROP TABLE IF EXISTS `info_role_doc_item_permission`;
CREATE TABLE `info_role_doc_item_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `info_role_doc_item_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `info_role_doc_item_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `info_doc_item_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_role_doc_item_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `info_role_template_item_permission`
-- ----------------------------
DROP TABLE IF EXISTS `info_role_template_item_permission`;
CREATE TABLE `info_role_template_item_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `info_role_template_item_permission_ibfk_2` (`permission_id`),
  CONSTRAINT `info_role_template_item_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `info_role_template_item_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `info_template_item_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_role_template_item_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `info_system`
-- ----------------------------
DROP TABLE IF EXISTS `info_system`;
CREATE TABLE `info_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT '0',
  `parent_id` bigint(20) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `info_system_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`),
  CONSTRAINT `info_system_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `info_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_system
-- ----------------------------

-- ----------------------------
-- Table structure for `info_template`
-- ----------------------------
DROP TABLE IF EXISTS `info_template`;
CREATE TABLE `info_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `system_id` bigint(20) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `system_id` (`system_id`),
  CONSTRAINT `info_template_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`),
  CONSTRAINT `info_template_ibfk_2` FOREIGN KEY (`system_id`) REFERENCES `info_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_template
-- ----------------------------

-- ----------------------------
-- Table structure for `info_template_item`
-- ----------------------------
DROP TABLE IF EXISTS `info_template_item`;
CREATE TABLE `info_template_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `content` text,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `info_template_item_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `info_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_template_item
-- ----------------------------

-- ----------------------------
-- Table structure for `info_template_item_permission`
-- ----------------------------
DROP TABLE IF EXISTS `info_template_item_permission`;
CREATE TABLE `info_template_item_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `template_item_id` bigint(20) NOT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `description` text,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_item_id` (`template_item_id`),
  CONSTRAINT `info_template_item_permission_ibfk_1` FOREIGN KEY (`template_item_id`) REFERENCES `info_template_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_template_item_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_company`
-- ----------------------------
DROP TABLE IF EXISTS `sys_company`;
CREATE TABLE `sys_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `code` varchar(200) NOT NULL,
  `industry_id` bigint(20) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `zipcode` varchar(64) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `scale_id` bigint(20) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `industry` (`industry_id`),
  KEY `region_id` (`region_id`),
  KEY `scale_id` (`scale_id`),
  CONSTRAINT `sys_company_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `sys_company_industry` (`id`),
  CONSTRAINT `sys_company_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `sys_region` (`id`),
  CONSTRAINT `sys_company_ibfk_3` FOREIGN KEY (`scale_id`) REFERENCES `sys_company_scale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_company
-- ----------------------------
INSERT INTO `sys_company` VALUES ('1', '紫方数据公司', '36b79020-1b76-11e7-8ab1-57fa25625208', 'ZF', '12', '140105', '腾飞创新园', null, '11', '15836945678', '324458425411', '12364455@zifangdt.com', '2', '1', '2017-03-27 16:36:58', '1', '2017-04-20 17:37:35');

-- ----------------------------
-- Table structure for `sys_company_industry`
-- ----------------------------
DROP TABLE IF EXISTS `sys_company_industry`;
CREATE TABLE `sys_company_industry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_company_industry
-- ----------------------------
INSERT INTO `sys_company_industry` VALUES ('1', '农、林、牧、渔、水利业');
INSERT INTO `sys_company_industry` VALUES ('2', '工业');
INSERT INTO `sys_company_industry` VALUES ('3', '制造业');
INSERT INTO `sys_company_industry` VALUES ('4', '机械、电气、电子设备制造业');
INSERT INTO `sys_company_industry` VALUES ('5', '地质普查、勘探业和建筑业');
INSERT INTO `sys_company_industry` VALUES ('6', '商业、公共饮食业、物资供销和仓储业');
INSERT INTO `sys_company_industry` VALUES ('7', '房地产管理、公用事业、居民服务和咨询服务业');
INSERT INTO `sys_company_industry` VALUES ('8', '卫生、体育和社会服务业');
INSERT INTO `sys_company_industry` VALUES ('9', '教育、文化艺术和广播电视业');
INSERT INTO `sys_company_industry` VALUES ('10', '科学研究和综合技术服务事业');
INSERT INTO `sys_company_industry` VALUES ('11', '国家机关、党政机关和社会团体');
INSERT INTO `sys_company_industry` VALUES ('12', '其它行业');

-- ----------------------------
-- Table structure for `sys_company_scale`
-- ----------------------------
DROP TABLE IF EXISTS `sys_company_scale`;
CREATE TABLE `sys_company_scale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_company_scale
-- ----------------------------
INSERT INTO `sys_company_scale` VALUES ('1', '少于20人');
INSERT INTO `sys_company_scale` VALUES ('2', '20到50人');
INSERT INTO `sys_company_scale` VALUES ('3', '50到100人');
INSERT INTO `sys_company_scale` VALUES ('4', '100到500人');
INSERT INTO `sys_company_scale` VALUES ('5', '500到2000人');
INSERT INTO `sys_company_scale` VALUES ('6', '2000到10000人');
INSERT INTO `sys_company_scale` VALUES ('7', '10000人以上');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', '36b79020-1b76-11e7-8ab1-57fa25625208', 'group1/M00/00/00/wKgBD1jnXoWASZBKAAAaUjxG_pg579.png', '2017-04-07 17:40:19');

-- ----------------------------
-- Table structure for `sys_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_info`;
CREATE TABLE `sys_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_info
-- ----------------------------
INSERT INTO `sys_info` VALUES ('1', '1', '紫方数据公司', null, null, '1', '2017-04-20 14:37:41');

-- ----------------------------
-- Table structure for `sys_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `head` varchar(100) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `description` text,
  `parent_id` bigint(20) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `sys_organization_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`),
  CONSTRAINT `sys_organization_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sys_organization` (`id`),
  CONSTRAINT `sys_organization_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sys_organization_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '1', 'ZF1', '紫方数据', '1', '2', null, null, '0', '根节点', null, '1', '2017-03-30 11:22:55', '1', '2017-03-30 11:22:55');
INSERT INTO `sys_organization` VALUES ('27', '1', 'ZF27', '测试部', '2', '2', null, null, '0', null, '1', '1', '2017-03-31 09:23:14', '1', '2017-03-31 09:23:14');
INSERT INTO `sys_organization` VALUES ('28', '1', 'ZF28', '紫方数据2', '1', '1', null, null, '0', '根节点', null, '1', '2017-04-10 14:48:29', '1', '2017-04-13 15:52:57');
INSERT INTO `sys_organization` VALUES ('29', '1', 'ZF29', '测试3', '3', '0', null, null, '0', null, '27', '1', '2017-04-10 16:43:54', '1', '2017-04-10 16:43:54');
INSERT INTO `sys_organization` VALUES ('30', '1', 'ZF30', '测试4', '3', '0', null, null, '0', null, '29', '1', '2017-04-10 16:44:23', '1', '2017-04-10 16:44:23');
INSERT INTO `sys_organization` VALUES ('32', '1', 'ZF32', '测试6', '2', '1', null, null, '0', null, '1', '1', '2017-04-10 16:45:02', '1', '2017-04-10 16:45:02');
INSERT INTO `sys_organization` VALUES ('33', '1', 'ZF33', '测试7', '3', '0', null, null, '0', null, '32', '1', '2017-04-10 16:45:31', '1', '2017-04-10 16:45:34');
INSERT INTO `sys_organization` VALUES ('34', '1', 'ZF34', '测试8', '3', '0', null, null, '0', null, '33', '1', '2017-04-10 16:45:51', '1', '2017-04-10 16:45:51');
INSERT INTO `sys_organization` VALUES ('35', '1', 'ZF35', '测试9', '2', '0', null, null, '0', null, '1', '1', '2017-04-10 16:46:07', '1', '2017-04-10 16:46:07');
INSERT INTO `sys_organization` VALUES ('36', '1', 'ZF11', '推广部', '2', '15', 'kelly', null, '0', '推广部', '28', '1', '2017-04-13 13:56:00', '1', '2017-04-13 14:04:04');
INSERT INTO `sys_organization` VALUES ('37', '1', 'ZF10', '人事部', '2', '5', null, null, '0', null, '28', '1', '2017-04-13 13:58:27', '1', '2017-04-13 13:58:27');
INSERT INTO `sys_organization` VALUES ('39', '1', '158', '2668', '1', '12559', null, null, '0', null, null, '1', '2017-04-18 18:41:31', '1', '2017-04-18 18:41:31');

-- ----------------------------
-- Table structure for `sys_organization_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization_type`;
CREATE TABLE `sys_organization_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization_type
-- ----------------------------
INSERT INTO `sys_organization_type` VALUES ('1', '公司', null, null, null, null);
INSERT INTO `sys_organization_type` VALUES ('2', '部门', null, null, null, null);
INSERT INTO `sys_organization_type` VALUES ('3', '小组', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `description` text,
  `type` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `sys_permission_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('19', null, '1', null, null, '1', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('20', null, '2', null, null, '1', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('21', '查看', '2', 'VIEW', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('22', '编辑', '2', 'EDIT', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('23', '查看', '3', 'VIEW', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('24', '添加', '3', 'ADD', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('25', '修改', '3', 'EDIT', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('26', '删除', '3', 'DELETE', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('27', '查看', '4', 'VIEW', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('28', '添加', '4', 'ADD', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('29', '导入', '4', 'IMPORT', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('30', '修改', '4', 'EDIT', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('31', '删除', '4', 'DELETE', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('32', '重置密码', '4', 'RESET', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('33', '查看', '5', 'VIEW', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('34', '添加', '5', 'ADD', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('35', '修改', '5', 'EDIT', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('36', '删除', '5', 'DELETE', null, '0', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('37', null, '6', null, null, '1', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('38', null, '3', null, null, '1', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('39', null, '4', null, null, '1', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('40', null, '5', null, null, '1', '1', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('41', null, '7', null, null, '1', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('42', '查看', '7', 'VIEW', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('43', '添加', '7', 'ADD', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('44', '修改', '7', 'EDIT', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('45', '删除', '7', 'DELETE', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('46', null, '8', null, null, '1', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('47', '查看', '8', 'VIEW', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('48', '导入', '8', 'IMPORT', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('49', '分配权限', '8', 'ASSIGN', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('50', '删除', '8', 'DELETE', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('51', null, '9', null, null, '1', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('52', '查看', '9', 'VIEW', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('53', '导入', '9', 'IMPORT', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('54', '修改', '9', 'EDIT', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('55', '删除', '9', 'DELETE', null, '0', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('56', null, '10', null, null, '1', '0', '1', '2017-04-13 17:08:40', '1', '2017-04-13 17:08:40');
INSERT INTO `sys_permission` VALUES ('61', null, '11', null, null, '1', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('62', null, '12', null, null, '1', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('63', '查看', '11', 'VIEW', null, '0', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('64', '添加', '11', 'ADD', null, '0', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('65', '修改', '11', 'EDIT', null, '0', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('66', '删除', '11', 'DELETE', null, '0', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('67', '查看', '12', 'VIEW', null, '0', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');
INSERT INTO `sys_permission` VALUES ('68', '分配权限', '12', 'ASSIGN', null, '0', '0', '1', '2017-05-09 14:02:30', '1', '2017-05-09 14:02:30');

-- ----------------------------
-- Table structure for `sys_region`
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `id` bigint(20) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDE246DAB6CD7916D` (`parent_id`),
  CONSTRAINT `FKDE246DAB6CD7916D` FOREIGN KEY (`parent_id`) REFERENCES `sys_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_region
-- ----------------------------
INSERT INTO `sys_region` VALUES ('86', '中国', null, '0', null);
INSERT INTO `sys_region` VALUES ('110000', '北京市', null, '1', '86');
INSERT INTO `sys_region` VALUES ('110100', '市辖区', null, '2', '110000');
INSERT INTO `sys_region` VALUES ('110101', '东城区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110102', '西城区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110103', '崇文区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110104', '宣武区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110105', '朝阳区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110106', '丰台区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110107', '石景山区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110108', '海淀区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110109', '门头沟区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110111', '房山区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110112', '通州区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110113', '顺义区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110114', '昌平区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110115', '大兴区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110116', '怀柔区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110117', '平谷区', null, '3', '110100');
INSERT INTO `sys_region` VALUES ('110200', '县', null, '2', '110000');
INSERT INTO `sys_region` VALUES ('110228', '密云县', null, '3', '110200');
INSERT INTO `sys_region` VALUES ('110229', '延庆县', null, '3', '110200');
INSERT INTO `sys_region` VALUES ('120000', '天津市', null, '1', '86');
INSERT INTO `sys_region` VALUES ('120100', '市辖区', null, '2', '120000');
INSERT INTO `sys_region` VALUES ('120101', '和平区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120102', '河东区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120103', '河西区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120104', '南开区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120105', '河北区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120106', '红桥区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120107', '塘沽区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120108', '汉沽区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120109', '大港区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120110', '东丽区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120111', '西青区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120112', '津南区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120113', '北辰区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120114', '武清区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120115', '宝坻区', null, '3', '120100');
INSERT INTO `sys_region` VALUES ('120200', '县', null, '2', '120000');
INSERT INTO `sys_region` VALUES ('120221', '宁河县', null, '3', '120200');
INSERT INTO `sys_region` VALUES ('120223', '静海县', null, '3', '120200');
INSERT INTO `sys_region` VALUES ('120225', '蓟县', null, '3', '120200');
INSERT INTO `sys_region` VALUES ('130000', '河北省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('130100', '石家庄市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130102', '长安区', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130103', '桥东区', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130104', '桥西区', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130105', '新华区', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130107', '井陉矿区', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130108', '裕华区', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130121', '井陉县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130123', '正定县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130124', '栾城县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130125', '行唐县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130126', '灵寿县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130127', '高邑县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130128', '深泽县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130129', '赞皇县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130130', '无极县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130131', '平山县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130132', '元氏县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130133', '赵县', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130181', '辛集市', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130182', '藁城市', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130183', '晋州市', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130184', '新乐市', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130185', '鹿泉市', null, '3', '130100');
INSERT INTO `sys_region` VALUES ('130200', '唐山市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130202', '路南区', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130203', '路北区', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130204', '古冶区', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130205', '开平区', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130207', '丰南区', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130208', '丰润区', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130223', '滦县', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130224', '滦南县', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130225', '乐亭县', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130227', '迁西县', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130229', '玉田县', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130230', '唐海县', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130281', '遵化市', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130283', '迁安市', null, '3', '130200');
INSERT INTO `sys_region` VALUES ('130300', '秦皇岛市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130302', '海港区', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130303', '山海关区', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130304', '北戴河区', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130321', '青龙满族自治县', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130322', '昌黎县', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130323', '抚宁县', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130324', '卢龙县', null, '3', '130300');
INSERT INTO `sys_region` VALUES ('130400', '邯郸市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130402', '邯山区', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130403', '丛台区', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130404', '复兴区', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130406', '峰峰矿区', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130421', '邯郸县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130423', '临漳县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130424', '成安县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130425', '大名县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130426', '涉县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130427', '磁县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130428', '肥乡县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130429', '永年县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130430', '邱县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130431', '鸡泽县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130432', '广平县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130433', '馆陶县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130434', '魏县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130435', '曲周县', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130481', '武安市', null, '3', '130400');
INSERT INTO `sys_region` VALUES ('130500', '邢台市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130502', '桥东区', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130503', '桥西区', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130521', '邢台县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130522', '临城县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130523', '内丘县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130524', '柏乡县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130525', '隆尧县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130526', '任县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130527', '南和县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130528', '宁晋县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130529', '巨鹿县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130530', '新河县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130531', '广宗县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130532', '平乡县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130533', '威县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130534', '清河县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130535', '临西县', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130581', '南宫市', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130582', '沙河市', null, '3', '130500');
INSERT INTO `sys_region` VALUES ('130600', '保定市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130602', '新市区', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130603', '北市区', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130604', '南市区', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130621', '满城县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130622', '清苑县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130623', '涞水县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130624', '阜平县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130625', '徐水县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130626', '定兴县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130627', '唐县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130628', '高阳县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130629', '容城县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130630', '涞源县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130631', '望都县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130632', '安新县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130633', '易县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130634', '曲阳县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130635', '蠡县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130636', '顺平县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130637', '博野县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130638', '雄县', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130681', '涿州市', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130682', '定州市', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130683', '安国市', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130684', '高碑店市', null, '3', '130600');
INSERT INTO `sys_region` VALUES ('130700', '张家口市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130702', '桥东区', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130703', '桥西区', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130705', '宣化区', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130706', '下花园区', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130721', '宣化县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130722', '张北县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130723', '康保县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130724', '沽源县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130725', '尚义县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130726', '蔚县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130727', '阳原县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130728', '怀安县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130729', '万全县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130730', '怀来县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130731', '涿鹿县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130732', '赤城县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130733', '崇礼县', null, '3', '130700');
INSERT INTO `sys_region` VALUES ('130800', '承德市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130802', '双桥区', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130803', '双滦区', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130804', '鹰手营子矿区', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130821', '承德县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130822', '兴隆县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130823', '平泉县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130824', '滦平县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130825', '隆化县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130826', '丰宁满族自治县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130827', '宽城满族自治县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130828', '围场满族蒙古族自治县', null, '3', '130800');
INSERT INTO `sys_region` VALUES ('130900', '沧州市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('130902', '新华区', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130903', '运河区', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130921', '沧县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130922', '青县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130923', '东光县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130924', '海兴县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130925', '盐山县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130926', '肃宁县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130927', '南皮县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130928', '吴桥县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130929', '献县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130930', '孟村回族自治县', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130981', '泊头市', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130982', '任丘市', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130983', '黄骅市', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('130984', '河间市', null, '3', '130900');
INSERT INTO `sys_region` VALUES ('131000', '廊坊市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('131002', '安次区', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131003', '广阳区', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131022', '固安县', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131023', '永清县', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131024', '香河县', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131025', '大城县', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131026', '文安县', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131028', '大厂回族自治县', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131081', '霸州市', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131082', '三河市', null, '3', '131000');
INSERT INTO `sys_region` VALUES ('131100', '衡水市', null, '2', '130000');
INSERT INTO `sys_region` VALUES ('131102', '桃城区', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131121', '枣强县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131122', '武邑县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131123', '武强县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131124', '饶阳县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131125', '安平县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131126', '故城县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131127', '景县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131128', '阜城县', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131181', '冀州市', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('131182', '深州市', null, '3', '131100');
INSERT INTO `sys_region` VALUES ('140000', '山西省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('140100', '太原市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140105', '小店区', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140106', '迎泽区', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140107', '杏花岭区', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140108', '尖草坪区', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140109', '万柏林区', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140110', '晋源区', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140121', '清徐县', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140122', '阳曲县', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140123', '娄烦县', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140181', '古交市', null, '3', '140100');
INSERT INTO `sys_region` VALUES ('140200', '大同市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140202', '城区', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140203', '矿区', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140211', '南郊区', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140212', '新荣区', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140221', '阳高县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140222', '天镇县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140223', '广灵县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140224', '灵丘县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140225', '浑源县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140226', '左云县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140227', '大同县', null, '3', '140200');
INSERT INTO `sys_region` VALUES ('140300', '阳泉市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140302', '城区', null, '3', '140300');
INSERT INTO `sys_region` VALUES ('140303', '矿区', null, '3', '140300');
INSERT INTO `sys_region` VALUES ('140311', '郊区', null, '3', '140300');
INSERT INTO `sys_region` VALUES ('140321', '平定县', null, '3', '140300');
INSERT INTO `sys_region` VALUES ('140322', '盂县', null, '3', '140300');
INSERT INTO `sys_region` VALUES ('140400', '长治市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140402', '城区', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140411', '郊区', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140421', '长治县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140423', '襄垣县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140424', '屯留县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140425', '平顺县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140426', '黎城县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140427', '壶关县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140428', '长子县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140429', '武乡县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140430', '沁县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140431', '沁源县', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140481', '潞城市', null, '3', '140400');
INSERT INTO `sys_region` VALUES ('140500', '晋城市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140502', '城区', null, '3', '140500');
INSERT INTO `sys_region` VALUES ('140521', '沁水县', null, '3', '140500');
INSERT INTO `sys_region` VALUES ('140522', '阳城县', null, '3', '140500');
INSERT INTO `sys_region` VALUES ('140524', '陵川县', null, '3', '140500');
INSERT INTO `sys_region` VALUES ('140525', '泽州县', null, '3', '140500');
INSERT INTO `sys_region` VALUES ('140581', '高平市', null, '3', '140500');
INSERT INTO `sys_region` VALUES ('140600', '朔州市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140602', '朔城区', null, '3', '140600');
INSERT INTO `sys_region` VALUES ('140603', '平鲁区', null, '3', '140600');
INSERT INTO `sys_region` VALUES ('140621', '山阴县', null, '3', '140600');
INSERT INTO `sys_region` VALUES ('140622', '应县', null, '3', '140600');
INSERT INTO `sys_region` VALUES ('140623', '右玉县', null, '3', '140600');
INSERT INTO `sys_region` VALUES ('140624', '怀仁县', null, '3', '140600');
INSERT INTO `sys_region` VALUES ('140700', '晋中市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140702', '榆次区', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140721', '榆社县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140722', '左权县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140723', '和顺县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140724', '昔阳县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140725', '寿阳县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140726', '太谷县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140727', '祁县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140728', '平遥县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140729', '灵石县', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140781', '介休市', null, '3', '140700');
INSERT INTO `sys_region` VALUES ('140800', '运城市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140802', '盐湖区', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140821', '临猗县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140822', '万荣县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140823', '闻喜县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140824', '稷山县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140825', '新绛县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140826', '绛县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140827', '垣曲县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140828', '夏县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140829', '平陆县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140830', '芮城县', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140881', '永济市', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140882', '河津市', null, '3', '140800');
INSERT INTO `sys_region` VALUES ('140900', '忻州市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('140902', '忻府区', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140921', '定襄县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140922', '五台县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140923', '代县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140924', '繁峙县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140925', '宁武县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140926', '静乐县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140927', '神池县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140928', '五寨县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140929', '岢岚县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140930', '河曲县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140931', '保德县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140932', '偏关县', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('140981', '原平市', null, '3', '140900');
INSERT INTO `sys_region` VALUES ('141000', '临汾市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('141002', '尧都区', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141021', '曲沃县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141022', '翼城县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141023', '襄汾县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141024', '洪洞县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141025', '古县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141026', '安泽县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141027', '浮山县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141028', '吉县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141029', '乡宁县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141030', '大宁县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141031', '隰县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141032', '永和县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141033', '蒲县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141034', '汾西县', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141081', '侯马市', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141082', '霍州市', null, '3', '141000');
INSERT INTO `sys_region` VALUES ('141100', '吕梁市', null, '2', '140000');
INSERT INTO `sys_region` VALUES ('141102', '离石区', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141121', '文水县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141122', '交城县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141123', '兴县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141124', '临县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141125', '柳林县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141126', '石楼县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141127', '岚县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141128', '方山县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141129', '中阳县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141130', '交口县', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141181', '孝义市', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('141182', '汾阳市', null, '3', '141100');
INSERT INTO `sys_region` VALUES ('150000', '内蒙古自治区', null, '1', '86');
INSERT INTO `sys_region` VALUES ('150100', '呼和浩特市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150102', '新城区', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150103', '回民区', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150104', '玉泉区', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150105', '赛罕区', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150121', '土默特左旗', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150122', '托克托县', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150123', '和林格尔县', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150124', '清水河县', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150125', '武川县', null, '3', '150100');
INSERT INTO `sys_region` VALUES ('150200', '包头市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150202', '东河区', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150203', '昆都仑区', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150204', '青山区', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150205', '石拐区', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150206', '白云矿区', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150207', '九原区', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150221', '土默特右旗', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150222', '固阳县', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150223', '达尔罕茂明安联合旗', null, '3', '150200');
INSERT INTO `sys_region` VALUES ('150300', '乌海市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150302', '海勃湾区', null, '3', '150300');
INSERT INTO `sys_region` VALUES ('150303', '海南区', null, '3', '150300');
INSERT INTO `sys_region` VALUES ('150304', '乌达区', null, '3', '150300');
INSERT INTO `sys_region` VALUES ('150400', '赤峰市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150402', '红山区', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150403', '元宝山区', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150404', '松山区', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150421', '阿鲁科尔沁旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150422', '巴林左旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150423', '巴林右旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150424', '林西县', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150425', '克什克腾旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150426', '翁牛特旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150428', '喀喇沁旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150429', '宁城县', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150430', '敖汉旗', null, '3', '150400');
INSERT INTO `sys_region` VALUES ('150500', '通辽市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150502', '科尔沁区', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150521', '科尔沁左翼中旗', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150522', '科尔沁左翼后旗', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150523', '开鲁县', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150524', '库伦旗', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150525', '奈曼旗', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150526', '扎鲁特旗', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150581', '霍林郭勒市', null, '3', '150500');
INSERT INTO `sys_region` VALUES ('150600', '鄂尔多斯市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150602', '东胜区', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150621', '达拉特旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150622', '准格尔旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150623', '鄂托克前旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150624', '鄂托克旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150625', '杭锦旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150626', '乌审旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150627', '伊金霍洛旗', null, '3', '150600');
INSERT INTO `sys_region` VALUES ('150700', '呼伦贝尔市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150701', '市辖区', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150702', '海拉尔区', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150721', '阿荣旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150722', '莫力达瓦达斡尔族自治旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150723', '鄂伦春自治旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150724', '鄂温克族自治旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150725', '陈巴尔虎旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150726', '新巴尔虎左旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150727', '新巴尔虎右旗', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150781', '满洲里市', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150782', '牙克石市', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150783', '扎兰屯市', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150784', '额尔古纳市', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150785', '根河市', null, '3', '150700');
INSERT INTO `sys_region` VALUES ('150800', '巴彦淖尔市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150801', '市辖区', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150802', '临河区', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150821', '五原县', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150822', '磴口县', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150823', '乌拉特前旗', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150824', '乌拉特中旗', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150825', '乌拉特后旗', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150826', '杭锦后旗', null, '3', '150800');
INSERT INTO `sys_region` VALUES ('150900', '乌兰察布市', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('150901', '市辖区', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150902', '集宁区', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150921', '卓资县', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150922', '化德县', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150923', '商都县', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150924', '兴和县', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150925', '凉城县', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150926', '察哈尔右翼前旗', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150927', '察哈尔右翼中旗', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150928', '察哈尔右翼后旗', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150929', '四子王旗', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('150981', '丰镇市', null, '3', '150900');
INSERT INTO `sys_region` VALUES ('152200', '兴安盟', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('152201', '乌兰浩特市', null, '3', '152200');
INSERT INTO `sys_region` VALUES ('152202', '阿尔山市', null, '3', '152200');
INSERT INTO `sys_region` VALUES ('152221', '科尔沁右翼前旗', null, '3', '152200');
INSERT INTO `sys_region` VALUES ('152222', '科尔沁右翼中旗', null, '3', '152200');
INSERT INTO `sys_region` VALUES ('152223', '扎赉特旗', null, '3', '152200');
INSERT INTO `sys_region` VALUES ('152224', '突泉县', null, '3', '152200');
INSERT INTO `sys_region` VALUES ('152500', '锡林郭勒盟', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('152501', '二连浩特市', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152502', '锡林浩特市', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152522', '阿巴嘎旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152523', '苏尼特左旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152524', '苏尼特右旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152525', '东乌珠穆沁旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152526', '西乌珠穆沁旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152527', '太仆寺旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152528', '镶黄旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152529', '正镶白旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152530', '正蓝旗', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152531', '多伦县', null, '3', '152500');
INSERT INTO `sys_region` VALUES ('152900', '阿拉善盟', null, '2', '150000');
INSERT INTO `sys_region` VALUES ('152921', '阿拉善左旗', null, '3', '152900');
INSERT INTO `sys_region` VALUES ('152922', '阿拉善右旗', null, '3', '152900');
INSERT INTO `sys_region` VALUES ('152923', '额济纳旗', null, '3', '152900');
INSERT INTO `sys_region` VALUES ('210000', '辽宁省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('210100', '沈阳市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210101', '市辖区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210102', '和平区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210103', '沈河区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210104', '大东区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210105', '皇姑区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210106', '铁西区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210111', '苏家屯区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210112', '东陵区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210113', '新城子区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210114', '于洪区', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210122', '辽中县', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210123', '康平县', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210124', '法库县', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210181', '新民市', null, '3', '210100');
INSERT INTO `sys_region` VALUES ('210200', '大连市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210201', '市辖区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210202', '中山区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210203', '西岗区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210204', '沙河口区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210211', '甘井子区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210212', '旅顺口区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210213', '金州区', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210224', '长海县', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210281', '瓦房店市', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210282', '普兰店市', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210283', '庄河市', null, '3', '210200');
INSERT INTO `sys_region` VALUES ('210300', '鞍山市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210301', '市辖区', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210302', '铁东区', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210303', '铁西区', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210304', '立山区', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210311', '千山区', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210321', '台安县', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210323', '岫岩满族自治县', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210381', '海城市', null, '3', '210300');
INSERT INTO `sys_region` VALUES ('210400', '抚顺市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210401', '市辖区', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210402', '新抚区', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210403', '东洲区', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210404', '望花区', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210411', '顺城区', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210421', '抚顺县', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210422', '新宾满族自治县', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210423', '清原满族自治县', null, '3', '210400');
INSERT INTO `sys_region` VALUES ('210500', '本溪市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210501', '市辖区', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210502', '平山区', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210503', '溪湖区', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210504', '明山区', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210505', '南芬区', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210521', '本溪满族自治县', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210522', '桓仁满族自治县', null, '3', '210500');
INSERT INTO `sys_region` VALUES ('210600', '丹东市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210601', '市辖区', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210602', '元宝区', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210603', '振兴区', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210604', '振安区', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210624', '宽甸满族自治县', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210681', '东港市', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210682', '凤城市', null, '3', '210600');
INSERT INTO `sys_region` VALUES ('210700', '锦州市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210701', '市辖区', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210702', '古塔区', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210703', '凌河区', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210711', '太和区', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210726', '黑山县', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210727', '义县', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210781', '凌海市', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210782', '北宁市', null, '3', '210700');
INSERT INTO `sys_region` VALUES ('210800', '营口市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210801', '市辖区', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210802', '站前区', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210803', '西市区', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210804', '鲅鱼圈区', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210811', '老边区', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210881', '盖州市', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210882', '大石桥市', null, '3', '210800');
INSERT INTO `sys_region` VALUES ('210900', '阜新市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('210901', '市辖区', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210902', '海州区', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210903', '新邱区', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210904', '太平区', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210905', '清河门区', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210911', '细河区', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210921', '阜新蒙古族自治县', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('210922', '彰武县', null, '3', '210900');
INSERT INTO `sys_region` VALUES ('211000', '辽阳市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('211001', '市辖区', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211002', '白塔区', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211003', '文圣区', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211004', '宏伟区', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211005', '弓长岭区', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211011', '太子河区', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211021', '辽阳县', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211081', '灯塔市', null, '3', '211000');
INSERT INTO `sys_region` VALUES ('211100', '盘锦市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('211101', '市辖区', null, '3', '211100');
INSERT INTO `sys_region` VALUES ('211102', '双台子区', null, '3', '211100');
INSERT INTO `sys_region` VALUES ('211103', '兴隆台区', null, '3', '211100');
INSERT INTO `sys_region` VALUES ('211121', '大洼县', null, '3', '211100');
INSERT INTO `sys_region` VALUES ('211122', '盘山县', null, '3', '211100');
INSERT INTO `sys_region` VALUES ('211200', '铁岭市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('211201', '市辖区', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211202', '银州区', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211204', '清河区', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211221', '铁岭县', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211223', '西丰县', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211224', '昌图县', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211281', '调兵山市', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211282', '开原市', null, '3', '211200');
INSERT INTO `sys_region` VALUES ('211300', '朝阳市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('211301', '市辖区', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211302', '双塔区', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211303', '龙城区', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211321', '朝阳县', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211322', '建平县', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211324', '喀喇沁左翼蒙古族自治县', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211381', '北票市', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211382', '凌源市', null, '3', '211300');
INSERT INTO `sys_region` VALUES ('211400', '葫芦岛市', null, '2', '210000');
INSERT INTO `sys_region` VALUES ('211401', '市辖区', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('211402', '连山区', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('211403', '龙港区', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('211404', '南票区', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('211421', '绥中县', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('211422', '建昌县', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('211481', '兴城市', null, '3', '211400');
INSERT INTO `sys_region` VALUES ('220000', '吉林省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('220100', '长春市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220101', '市辖区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220102', '南关区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220103', '宽城区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220104', '朝阳区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220105', '二道区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220106', '绿园区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220112', '双阳区', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220122', '农安县', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220181', '九台市', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220182', '榆树市', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220183', '德惠市', null, '3', '220100');
INSERT INTO `sys_region` VALUES ('220200', '吉林市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220201', '市辖区', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220202', '昌邑区', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220203', '龙潭区', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220204', '船营区', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220211', '丰满区', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220221', '永吉县', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220281', '蛟河市', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220282', '桦甸市', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220283', '舒兰市', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220284', '磐石市', null, '3', '220200');
INSERT INTO `sys_region` VALUES ('220300', '四平市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220301', '市辖区', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220302', '铁西区', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220303', '铁东区', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220322', '梨树县', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220323', '伊通满族自治县', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220381', '公主岭市', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220382', '双辽市', null, '3', '220300');
INSERT INTO `sys_region` VALUES ('220400', '辽源市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220401', '市辖区', null, '3', '220400');
INSERT INTO `sys_region` VALUES ('220402', '龙山区', null, '3', '220400');
INSERT INTO `sys_region` VALUES ('220403', '西安区', null, '3', '220400');
INSERT INTO `sys_region` VALUES ('220421', '东丰县', null, '3', '220400');
INSERT INTO `sys_region` VALUES ('220422', '东辽县', null, '3', '220400');
INSERT INTO `sys_region` VALUES ('220500', '通化市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220501', '市辖区', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220502', '东昌区', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220503', '二道江区', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220521', '通化县', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220523', '辉南县', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220524', '柳河县', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220581', '梅河口市', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220582', '集安市', null, '3', '220500');
INSERT INTO `sys_region` VALUES ('220600', '白山市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220601', '市辖区', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220602', '八道江区', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220621', '抚松县', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220622', '靖宇县', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220623', '长白朝鲜族自治县', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220625', '江源县', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220681', '临江市', null, '3', '220600');
INSERT INTO `sys_region` VALUES ('220700', '松原市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220701', '市辖区', null, '3', '220700');
INSERT INTO `sys_region` VALUES ('220702', '宁江区', null, '3', '220700');
INSERT INTO `sys_region` VALUES ('220721', '前郭尔罗斯蒙古族自治县', null, '3', '220700');
INSERT INTO `sys_region` VALUES ('220722', '长岭县', null, '3', '220700');
INSERT INTO `sys_region` VALUES ('220723', '乾安县', null, '3', '220700');
INSERT INTO `sys_region` VALUES ('220724', '扶余县', null, '3', '220700');
INSERT INTO `sys_region` VALUES ('220800', '白城市', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('220801', '市辖区', null, '3', '220800');
INSERT INTO `sys_region` VALUES ('220802', '洮北区', null, '3', '220800');
INSERT INTO `sys_region` VALUES ('220821', '镇赉县', null, '3', '220800');
INSERT INTO `sys_region` VALUES ('220822', '通榆县', null, '3', '220800');
INSERT INTO `sys_region` VALUES ('220881', '洮南市', null, '3', '220800');
INSERT INTO `sys_region` VALUES ('220882', '大安市', null, '3', '220800');
INSERT INTO `sys_region` VALUES ('222400', '延边朝鲜族自治州', null, '2', '220000');
INSERT INTO `sys_region` VALUES ('222401', '延吉市', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222402', '图们市', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222403', '敦化市', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222404', '珲春市', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222405', '龙井市', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222406', '和龙市', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222424', '汪清县', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('222426', '安图县', null, '3', '222400');
INSERT INTO `sys_region` VALUES ('230000', '黑龙江省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('230100', '哈尔滨市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230101', '市辖区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230102', '道里区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230103', '南岗区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230104', '道外区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230106', '香坊区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230107', '动力区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230108', '平房区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230109', '松北区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230111', '呼兰区', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230123', '依兰县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230124', '方正县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230125', '宾县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230126', '巴彦县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230127', '木兰县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230128', '通河县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230129', '延寿县', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230181', '阿城市', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230182', '双城市', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230183', '尚志市', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230184', '五常市', null, '3', '230100');
INSERT INTO `sys_region` VALUES ('230200', '齐齐哈尔市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230201', '市辖区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230202', '龙沙区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230203', '建华区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230204', '铁锋区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230205', '昂昂溪区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230206', '富拉尔基区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230207', '碾子山区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230208', '梅里斯达斡尔族区', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230221', '龙江县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230223', '依安县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230224', '泰来县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230225', '甘南县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230227', '富裕县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230229', '克山县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230230', '克东县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230231', '拜泉县', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230281', '讷河市', null, '3', '230200');
INSERT INTO `sys_region` VALUES ('230300', '鸡西市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230301', '市辖区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230302', '鸡冠区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230303', '恒山区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230304', '滴道区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230305', '梨树区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230306', '城子河区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230307', '麻山区', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230321', '鸡东县', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230381', '虎林市', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230382', '密山市', null, '3', '230300');
INSERT INTO `sys_region` VALUES ('230400', '鹤岗市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230401', '市辖区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230402', '向阳区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230403', '工农区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230404', '南山区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230405', '兴安区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230406', '东山区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230407', '兴山区', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230421', '萝北县', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230422', '绥滨县', null, '3', '230400');
INSERT INTO `sys_region` VALUES ('230500', '双鸭山市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230501', '市辖区', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230502', '尖山区', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230503', '岭东区', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230505', '四方台区', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230506', '宝山区', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230521', '集贤县', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230522', '友谊县', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230523', '宝清县', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230524', '饶河县', null, '3', '230500');
INSERT INTO `sys_region` VALUES ('230600', '大庆市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230601', '市辖区', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230602', '萨尔图区', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230603', '龙凤区', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230604', '让胡路区', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230605', '红岗区', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230606', '大同区', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230621', '肇州县', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230622', '肇源县', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230623', '林甸县', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230624', '杜尔伯特蒙古族自治县', null, '3', '230600');
INSERT INTO `sys_region` VALUES ('230700', '伊春市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230701', '市辖区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230702', '伊春区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230703', '南岔区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230704', '友好区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230705', '西林区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230706', '翠峦区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230707', '新青区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230708', '美溪区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230709', '金山屯区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230710', '五营区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230711', '乌马河区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230712', '汤旺河区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230713', '带岭区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230714', '乌伊岭区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230715', '红星区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230716', '上甘岭区', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230722', '嘉荫县', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230781', '铁力市', null, '3', '230700');
INSERT INTO `sys_region` VALUES ('230800', '佳木斯市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230801', '市辖区', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230802', '永红区', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230803', '向阳区', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230804', '前进区', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230805', '东风区', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230811', '郊区', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230822', '桦南县', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230826', '桦川县', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230828', '汤原县', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230833', '抚远县', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230881', '同江市', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230882', '富锦市', null, '3', '230800');
INSERT INTO `sys_region` VALUES ('230900', '七台河市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('230901', '市辖区', null, '3', '230900');
INSERT INTO `sys_region` VALUES ('230902', '新兴区', null, '3', '230900');
INSERT INTO `sys_region` VALUES ('230903', '桃山区', null, '3', '230900');
INSERT INTO `sys_region` VALUES ('230904', '茄子河区', null, '3', '230900');
INSERT INTO `sys_region` VALUES ('230921', '勃利县', null, '3', '230900');
INSERT INTO `sys_region` VALUES ('231000', '牡丹江市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('231001', '市辖区', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231002', '东安区', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231003', '阳明区', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231004', '爱民区', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231005', '西安区', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231024', '东宁县', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231025', '林口县', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231081', '绥芬河市', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231083', '海林市', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231084', '宁安市', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231085', '穆棱市', null, '3', '231000');
INSERT INTO `sys_region` VALUES ('231100', '黑河市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('231101', '市辖区', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231102', '爱辉区', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231121', '嫩江县', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231123', '逊克县', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231124', '孙吴县', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231181', '北安市', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231182', '五大连池市', null, '3', '231100');
INSERT INTO `sys_region` VALUES ('231200', '绥化市', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('231201', '市辖区', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231202', '北林区', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231221', '望奎县', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231222', '兰西县', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231223', '青冈县', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231224', '庆安县', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231225', '明水县', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231226', '绥棱县', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231281', '安达市', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231282', '肇东市', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('231283', '海伦市', null, '3', '231200');
INSERT INTO `sys_region` VALUES ('232700', '大兴安岭地区', null, '2', '230000');
INSERT INTO `sys_region` VALUES ('232721', '呼玛县', null, '3', '232700');
INSERT INTO `sys_region` VALUES ('232722', '塔河县', null, '3', '232700');
INSERT INTO `sys_region` VALUES ('232723', '漠河县', null, '3', '232700');
INSERT INTO `sys_region` VALUES ('310000', '上海市', null, '1', '86');
INSERT INTO `sys_region` VALUES ('310100', '市辖区', null, '2', '310000');
INSERT INTO `sys_region` VALUES ('310101', '黄浦区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310103', '卢湾区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310104', '徐汇区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310105', '长宁区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310106', '静安区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310107', '普陀区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310108', '闸北区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310109', '虹口区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310110', '杨浦区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310112', '闵行区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310113', '宝山区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310114', '嘉定区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310115', '浦东新区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310116', '金山区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310117', '松江区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310118', '青浦区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310119', '南汇区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310120', '奉贤区', null, '3', '310100');
INSERT INTO `sys_region` VALUES ('310200', '县', null, '2', '310000');
INSERT INTO `sys_region` VALUES ('310230', '崇明县', null, '3', '310200');
INSERT INTO `sys_region` VALUES ('320000', '江苏省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('320100', '南京市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320101', '市辖区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320102', '玄武区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320103', '白下区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320104', '秦淮区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320105', '建邺区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320106', '鼓楼区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320107', '下关区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320111', '浦口区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320113', '栖霞区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320114', '雨花台区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320115', '江宁区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320116', '六合区', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320124', '溧水县', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320125', '高淳县', null, '3', '320100');
INSERT INTO `sys_region` VALUES ('320200', '无锡市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320201', '市辖区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320202', '崇安区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320203', '南长区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320204', '北塘区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320205', '锡山区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320206', '惠山区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320211', '滨湖区', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320281', '江阴市', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320282', '宜兴市', null, '3', '320200');
INSERT INTO `sys_region` VALUES ('320300', '徐州市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320301', '市辖区', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320302', '鼓楼区', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320303', '云龙区', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320304', '九里区', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320305', '贾汪区', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320311', '泉山区', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320321', '丰县', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320322', '沛县', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320323', '铜山县', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320324', '睢宁县', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320381', '新沂市', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320382', '邳州市', null, '3', '320300');
INSERT INTO `sys_region` VALUES ('320400', '常州市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320401', '市辖区', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320402', '天宁区', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320404', '钟楼区', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320405', '戚墅堰区', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320411', '新北区', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320412', '武进区', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320481', '溧阳市', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320482', '金坛市', null, '3', '320400');
INSERT INTO `sys_region` VALUES ('320500', '苏州市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320501', '市辖区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320502', '沧浪区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320503', '平江区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320504', '金阊区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320505', '虎丘区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320506', '吴中区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320507', '相城区', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320581', '常熟市', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320582', '张家港市', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320583', '昆山市', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320584', '吴江市', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320585', '太仓市', null, '3', '320500');
INSERT INTO `sys_region` VALUES ('320600', '南通市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320601', '市辖区', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320602', '崇川区', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320611', '港闸区', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320621', '海安县', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320623', '如东县', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320681', '启东市', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320682', '如皋市', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320683', '通州市', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320684', '海门市', null, '3', '320600');
INSERT INTO `sys_region` VALUES ('320700', '连云港市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320701', '市辖区', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320703', '连云区', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320705', '新浦区', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320706', '海州区', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320721', '赣榆县', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320722', '东海县', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320723', '灌云县', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320724', '灌南县', null, '3', '320700');
INSERT INTO `sys_region` VALUES ('320800', '淮安市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320801', '市辖区', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320802', '清河区', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320803', '楚州区', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320804', '淮阴区', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320811', '清浦区', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320826', '涟水县', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320829', '洪泽县', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320830', '盱眙县', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320831', '金湖县', null, '3', '320800');
INSERT INTO `sys_region` VALUES ('320900', '盐城市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('320901', '市辖区', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320902', '亭湖区', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320903', '盐都区', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320921', '响水县', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320922', '滨海县', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320923', '阜宁县', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320924', '射阳县', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320925', '建湖县', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320981', '东台市', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('320982', '大丰市', null, '3', '320900');
INSERT INTO `sys_region` VALUES ('321000', '扬州市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('321001', '市辖区', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321002', '广陵区', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321003', '邗江区', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321011', '维扬区', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321023', '宝应县', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321081', '仪征市', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321084', '高邮市', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321088', '江都市', null, '3', '321000');
INSERT INTO `sys_region` VALUES ('321100', '镇江市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('321101', '市辖区', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321102', '京口区', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321111', '润州区', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321112', '丹徒区', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321181', '丹阳市', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321182', '扬中市', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321183', '句容市', null, '3', '321100');
INSERT INTO `sys_region` VALUES ('321200', '泰州市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('321201', '市辖区', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321202', '海陵区', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321203', '高港区', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321281', '兴化市', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321282', '靖江市', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321283', '泰兴市', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321284', '姜堰市', null, '3', '321200');
INSERT INTO `sys_region` VALUES ('321300', '宿迁市', null, '2', '320000');
INSERT INTO `sys_region` VALUES ('321301', '市辖区', null, '3', '321300');
INSERT INTO `sys_region` VALUES ('321302', '宿城区', null, '3', '321300');
INSERT INTO `sys_region` VALUES ('321311', '宿豫区', null, '3', '321300');
INSERT INTO `sys_region` VALUES ('321322', '沭阳县', null, '3', '321300');
INSERT INTO `sys_region` VALUES ('321323', '泗阳县', null, '3', '321300');
INSERT INTO `sys_region` VALUES ('321324', '泗洪县', null, '3', '321300');
INSERT INTO `sys_region` VALUES ('330000', '浙江省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('330100', '杭州市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330101', '市辖区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330102', '上城区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330103', '下城区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330104', '江干区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330105', '拱墅区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330106', '西湖区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330108', '滨江区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330109', '萧山区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330110', '余杭区', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330122', '桐庐县', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330127', '淳安县', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330182', '建德市', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330183', '富阳市', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330185', '临安市', null, '3', '330100');
INSERT INTO `sys_region` VALUES ('330200', '宁波市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330201', '市辖区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330203', '海曙区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330204', '江东区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330205', '江北区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330206', '北仑区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330211', '镇海区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330212', '鄞州区', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330225', '象山县', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330226', '宁海县', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330281', '余姚市', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330282', '慈溪市', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330283', '奉化市', null, '3', '330200');
INSERT INTO `sys_region` VALUES ('330300', '温州市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330301', '市辖区', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330302', '鹿城区', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330303', '龙湾区', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330304', '瓯海区', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330322', '洞头县', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330324', '永嘉县', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330326', '平阳县', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330327', '苍南县', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330328', '文成县', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330329', '泰顺县', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330381', '瑞安市', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330382', '乐清市', null, '3', '330300');
INSERT INTO `sys_region` VALUES ('330400', '嘉兴市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330401', '市辖区', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330402', '秀城区', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330411', '秀洲区', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330421', '嘉善县', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330424', '海盐县', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330481', '海宁市', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330482', '平湖市', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330483', '桐乡市', null, '3', '330400');
INSERT INTO `sys_region` VALUES ('330500', '湖州市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330501', '市辖区', null, '3', '330500');
INSERT INTO `sys_region` VALUES ('330502', '吴兴区', null, '3', '330500');
INSERT INTO `sys_region` VALUES ('330503', '南浔区', null, '3', '330500');
INSERT INTO `sys_region` VALUES ('330521', '德清县', null, '3', '330500');
INSERT INTO `sys_region` VALUES ('330522', '长兴县', null, '3', '330500');
INSERT INTO `sys_region` VALUES ('330523', '安吉县', null, '3', '330500');
INSERT INTO `sys_region` VALUES ('330600', '绍兴市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330601', '市辖区', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330602', '越城区', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330621', '绍兴县', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330624', '新昌县', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330681', '诸暨市', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330682', '上虞市', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330683', '嵊州市', null, '3', '330600');
INSERT INTO `sys_region` VALUES ('330700', '金华市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330701', '市辖区', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330702', '婺城区', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330703', '金东区', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330723', '武义县', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330726', '浦江县', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330727', '磐安县', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330781', '兰溪市', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330782', '义乌市', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330783', '东阳市', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330784', '永康市', null, '3', '330700');
INSERT INTO `sys_region` VALUES ('330800', '衢州市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330801', '市辖区', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330802', '柯城区', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330803', '衢江区', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330822', '常山县', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330824', '开化县', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330825', '龙游县', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330881', '江山市', null, '3', '330800');
INSERT INTO `sys_region` VALUES ('330900', '舟山市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('330901', '市辖区', null, '3', '330900');
INSERT INTO `sys_region` VALUES ('330902', '定海区', null, '3', '330900');
INSERT INTO `sys_region` VALUES ('330903', '普陀区', null, '3', '330900');
INSERT INTO `sys_region` VALUES ('330921', '岱山县', null, '3', '330900');
INSERT INTO `sys_region` VALUES ('330922', '嵊泗县', null, '3', '330900');
INSERT INTO `sys_region` VALUES ('331000', '台州市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('331001', '市辖区', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331002', '椒江区', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331003', '黄岩区', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331004', '路桥区', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331021', '玉环县', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331022', '三门县', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331023', '天台县', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331024', '仙居县', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331081', '温岭市', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331082', '临海市', null, '3', '331000');
INSERT INTO `sys_region` VALUES ('331100', '丽水市', null, '2', '330000');
INSERT INTO `sys_region` VALUES ('331101', '市辖区', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331102', '莲都区', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331121', '青田县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331122', '缙云县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331123', '遂昌县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331124', '松阳县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331125', '云和县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331126', '庆元县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331127', '景宁畲族自治县', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('331181', '龙泉市', null, '3', '331100');
INSERT INTO `sys_region` VALUES ('340000', '安徽省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('340100', '合肥市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340101', '市辖区', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340102', '瑶海区', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340103', '庐阳区', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340104', '蜀山区', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340111', '包河区', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340121', '长丰县', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340122', '肥东县', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340123', '肥西县', null, '3', '340100');
INSERT INTO `sys_region` VALUES ('340200', '芜湖市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340201', '市辖区', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340202', '镜湖区', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340203', '马塘区', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340204', '新芜区', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340207', '鸠江区', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340221', '芜湖县', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340222', '繁昌县', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340223', '南陵县', null, '3', '340200');
INSERT INTO `sys_region` VALUES ('340300', '蚌埠市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340301', '市辖区', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340302', '龙子湖区', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340303', '蚌山区', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340304', '禹会区', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340311', '淮上区', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340321', '怀远县', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340322', '五河县', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340323', '固镇县', null, '3', '340300');
INSERT INTO `sys_region` VALUES ('340400', '淮南市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340401', '市辖区', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340402', '大通区', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340403', '田家庵区', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340404', '谢家集区', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340405', '八公山区', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340406', '潘集区', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340421', '凤台县', null, '3', '340400');
INSERT INTO `sys_region` VALUES ('340500', '马鞍山市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340501', '市辖区', null, '3', '340500');
INSERT INTO `sys_region` VALUES ('340502', '金家庄区', null, '3', '340500');
INSERT INTO `sys_region` VALUES ('340503', '花山区', null, '3', '340500');
INSERT INTO `sys_region` VALUES ('340504', '雨山区', null, '3', '340500');
INSERT INTO `sys_region` VALUES ('340521', '当涂县', null, '3', '340500');
INSERT INTO `sys_region` VALUES ('340600', '淮北市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340601', '市辖区', null, '3', '340600');
INSERT INTO `sys_region` VALUES ('340602', '杜集区', null, '3', '340600');
INSERT INTO `sys_region` VALUES ('340603', '相山区', null, '3', '340600');
INSERT INTO `sys_region` VALUES ('340604', '烈山区', null, '3', '340600');
INSERT INTO `sys_region` VALUES ('340621', '濉溪县', null, '3', '340600');
INSERT INTO `sys_region` VALUES ('340700', '铜陵市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340701', '市辖区', null, '3', '340700');
INSERT INTO `sys_region` VALUES ('340702', '铜官山区', null, '3', '340700');
INSERT INTO `sys_region` VALUES ('340703', '狮子山区', null, '3', '340700');
INSERT INTO `sys_region` VALUES ('340711', '郊区', null, '3', '340700');
INSERT INTO `sys_region` VALUES ('340721', '铜陵县', null, '3', '340700');
INSERT INTO `sys_region` VALUES ('340800', '安庆市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('340801', '市辖区', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340802', '迎江区', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340803', '大观区', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340811', '宜秀区', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340822', '怀宁县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340823', '枞阳县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340824', '潜山县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340825', '太湖县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340826', '宿松县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340827', '望江县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340828', '岳西县', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('340881', '桐城市', null, '3', '340800');
INSERT INTO `sys_region` VALUES ('341000', '黄山市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341001', '市辖区', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341002', '屯溪区', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341003', '黄山区', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341004', '徽州区', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341021', '歙县', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341022', '休宁县', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341023', '黟县', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341024', '祁门县', null, '3', '341000');
INSERT INTO `sys_region` VALUES ('341100', '滁州市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341101', '市辖区', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341102', '琅琊区', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341103', '南谯区', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341122', '来安县', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341124', '全椒县', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341125', '定远县', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341126', '凤阳县', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341181', '天长市', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341182', '明光市', null, '3', '341100');
INSERT INTO `sys_region` VALUES ('341200', '阜阳市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341201', '市辖区', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341202', '颍州区', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341203', '颍东区', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341204', '颍泉区', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341221', '临泉县', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341222', '太和县', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341225', '阜南县', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341226', '颍上县', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341282', '界首市', null, '3', '341200');
INSERT INTO `sys_region` VALUES ('341300', '宿州市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341301', '市辖区', null, '3', '341300');
INSERT INTO `sys_region` VALUES ('341302', '俑桥区', null, '3', '341300');
INSERT INTO `sys_region` VALUES ('341321', '砀山县', null, '3', '341300');
INSERT INTO `sys_region` VALUES ('341322', '萧县', null, '3', '341300');
INSERT INTO `sys_region` VALUES ('341323', '灵璧县', null, '3', '341300');
INSERT INTO `sys_region` VALUES ('341324', '泗县', null, '3', '341300');
INSERT INTO `sys_region` VALUES ('341400', '巢湖市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341401', '市辖区', null, '3', '341400');
INSERT INTO `sys_region` VALUES ('341402', '居巢区', null, '3', '341400');
INSERT INTO `sys_region` VALUES ('341421', '庐江县', null, '3', '341400');
INSERT INTO `sys_region` VALUES ('341422', '无为县', null, '3', '341400');
INSERT INTO `sys_region` VALUES ('341423', '含山县', null, '3', '341400');
INSERT INTO `sys_region` VALUES ('341424', '和县', null, '3', '341400');
INSERT INTO `sys_region` VALUES ('341500', '六安市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341501', '市辖区', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341502', '金安区', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341503', '裕安区', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341521', '寿县', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341522', '霍邱县', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341523', '舒城县', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341524', '金寨县', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341525', '霍山县', null, '3', '341500');
INSERT INTO `sys_region` VALUES ('341600', '亳州市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341601', '市辖区', null, '3', '341600');
INSERT INTO `sys_region` VALUES ('341602', '谯城区', null, '3', '341600');
INSERT INTO `sys_region` VALUES ('341621', '涡阳县', null, '3', '341600');
INSERT INTO `sys_region` VALUES ('341622', '蒙城县', null, '3', '341600');
INSERT INTO `sys_region` VALUES ('341623', '利辛县', null, '3', '341600');
INSERT INTO `sys_region` VALUES ('341700', '池州市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341701', '市辖区', null, '3', '341700');
INSERT INTO `sys_region` VALUES ('341702', '贵池区', null, '3', '341700');
INSERT INTO `sys_region` VALUES ('341721', '东至县', null, '3', '341700');
INSERT INTO `sys_region` VALUES ('341722', '石台县', null, '3', '341700');
INSERT INTO `sys_region` VALUES ('341723', '青阳县', null, '3', '341700');
INSERT INTO `sys_region` VALUES ('341800', '宣城市', null, '2', '340000');
INSERT INTO `sys_region` VALUES ('341801', '市辖区', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341802', '宣州区', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341821', '郎溪县', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341822', '广德县', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341823', '泾县', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341824', '绩溪县', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341825', '旌德县', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('341881', '宁国市', null, '3', '341800');
INSERT INTO `sys_region` VALUES ('350000', '福建省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('350100', '福州市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350101', '市辖区', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350102', '鼓楼区', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350103', '台江区', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350104', '仓山区', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350105', '马尾区', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350111', '晋安区', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350121', '闽侯县', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350122', '连江县', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350123', '罗源县', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350124', '闽清县', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350125', '永泰县', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350128', '平潭县', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350181', '福清市', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350182', '长乐市', null, '3', '350100');
INSERT INTO `sys_region` VALUES ('350200', '厦门市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350201', '市辖区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350203', '思明区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350205', '海沧区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350206', '湖里区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350211', '集美区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350212', '同安区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350213', '翔安区', null, '3', '350200');
INSERT INTO `sys_region` VALUES ('350300', '莆田市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350301', '市辖区', null, '3', '350300');
INSERT INTO `sys_region` VALUES ('350302', '城厢区', null, '3', '350300');
INSERT INTO `sys_region` VALUES ('350303', '涵江区', null, '3', '350300');
INSERT INTO `sys_region` VALUES ('350304', '荔城区', null, '3', '350300');
INSERT INTO `sys_region` VALUES ('350305', '秀屿区', null, '3', '350300');
INSERT INTO `sys_region` VALUES ('350322', '仙游县', null, '3', '350300');
INSERT INTO `sys_region` VALUES ('350400', '三明市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350401', '市辖区', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350402', '梅列区', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350403', '三元区', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350421', '明溪县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350423', '清流县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350424', '宁化县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350425', '大田县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350426', '尤溪县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350427', '沙县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350428', '将乐县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350429', '泰宁县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350430', '建宁县', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350481', '永安市', null, '3', '350400');
INSERT INTO `sys_region` VALUES ('350500', '泉州市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350501', '市辖区', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350502', '鲤城区', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350503', '丰泽区', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350504', '洛江区', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350505', '泉港区', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350521', '惠安县', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350524', '安溪县', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350525', '永春县', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350526', '德化县', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350527', '金门县', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350581', '石狮市', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350582', '晋江市', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350583', '南安市', null, '3', '350500');
INSERT INTO `sys_region` VALUES ('350600', '漳州市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350601', '市辖区', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350602', '芗城区', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350603', '龙文区', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350622', '云霄县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350623', '漳浦县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350624', '诏安县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350625', '长泰县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350626', '东山县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350627', '南靖县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350628', '平和县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350629', '华安县', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350681', '龙海市', null, '3', '350600');
INSERT INTO `sys_region` VALUES ('350700', '南平市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350701', '市辖区', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350702', '延平区', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350721', '顺昌县', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350722', '浦城县', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350723', '光泽县', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350724', '松溪县', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350725', '政和县', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350781', '邵武市', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350782', '武夷山市', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350783', '建瓯市', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350784', '建阳市', null, '3', '350700');
INSERT INTO `sys_region` VALUES ('350800', '龙岩市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350801', '市辖区', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350802', '新罗区', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350821', '长汀县', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350822', '永定县', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350823', '上杭县', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350824', '武平县', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350825', '连城县', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350881', '漳平市', null, '3', '350800');
INSERT INTO `sys_region` VALUES ('350900', '宁德市', null, '2', '350000');
INSERT INTO `sys_region` VALUES ('350901', '市辖区', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350902', '蕉城区', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350921', '霞浦县', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350922', '古田县', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350923', '屏南县', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350924', '寿宁县', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350925', '周宁县', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350926', '柘荣县', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350981', '福安市', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('350982', '福鼎市', null, '3', '350900');
INSERT INTO `sys_region` VALUES ('360000', '江西省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('360100', '南昌市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360101', '市辖区', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360102', '东湖区', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360103', '西湖区', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360104', '青云谱区', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360105', '湾里区', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360111', '青山湖区', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360121', '南昌县', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360122', '新建县', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360123', '安义县', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360124', '进贤县', null, '3', '360100');
INSERT INTO `sys_region` VALUES ('360200', '景德镇市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360201', '市辖区', null, '3', '360200');
INSERT INTO `sys_region` VALUES ('360202', '昌江区', null, '3', '360200');
INSERT INTO `sys_region` VALUES ('360203', '珠山区', null, '3', '360200');
INSERT INTO `sys_region` VALUES ('360222', '浮梁县', null, '3', '360200');
INSERT INTO `sys_region` VALUES ('360281', '乐平市', null, '3', '360200');
INSERT INTO `sys_region` VALUES ('360300', '萍乡市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360301', '市辖区', null, '3', '360300');
INSERT INTO `sys_region` VALUES ('360302', '安源区', null, '3', '360300');
INSERT INTO `sys_region` VALUES ('360313', '湘东区', null, '3', '360300');
INSERT INTO `sys_region` VALUES ('360321', '莲花县', null, '3', '360300');
INSERT INTO `sys_region` VALUES ('360322', '上栗县', null, '3', '360300');
INSERT INTO `sys_region` VALUES ('360323', '芦溪县', null, '3', '360300');
INSERT INTO `sys_region` VALUES ('360400', '九江市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360401', '市辖区', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360402', '庐山区', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360403', '浔阳区', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360421', '九江县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360423', '武宁县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360424', '修水县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360425', '永修县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360426', '德安县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360427', '星子县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360428', '都昌县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360429', '湖口县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360430', '彭泽县', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360481', '瑞昌市', null, '3', '360400');
INSERT INTO `sys_region` VALUES ('360500', '新余市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360501', '市辖区', null, '3', '360500');
INSERT INTO `sys_region` VALUES ('360502', '渝水区', null, '3', '360500');
INSERT INTO `sys_region` VALUES ('360521', '分宜县', null, '3', '360500');
INSERT INTO `sys_region` VALUES ('360600', '鹰潭市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360601', '市辖区', null, '3', '360600');
INSERT INTO `sys_region` VALUES ('360602', '月湖区', null, '3', '360600');
INSERT INTO `sys_region` VALUES ('360622', '余江县', null, '3', '360600');
INSERT INTO `sys_region` VALUES ('360681', '贵溪市', null, '3', '360600');
INSERT INTO `sys_region` VALUES ('360700', '赣州市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360701', '市辖区', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360702', '章贡区', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360721', '赣县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360722', '信丰县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360723', '大余县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360724', '上犹县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360725', '崇义县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360726', '安远县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360727', '龙南县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360728', '定南县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360729', '全南县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360730', '宁都县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360731', '于都县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360732', '兴国县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360733', '会昌县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360734', '寻乌县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360735', '石城县', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360781', '瑞金市', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360782', '南康市', null, '3', '360700');
INSERT INTO `sys_region` VALUES ('360800', '吉安市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360801', '市辖区', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360802', '吉州区', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360803', '青原区', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360821', '吉安县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360822', '吉水县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360823', '峡江县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360824', '新干县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360825', '永丰县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360826', '泰和县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360827', '遂川县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360828', '万安县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360829', '安福县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360830', '永新县', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360881', '井冈山市', null, '3', '360800');
INSERT INTO `sys_region` VALUES ('360900', '宜春市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('360901', '市辖区', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360902', '袁州区', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360921', '奉新县', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360922', '万载县', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360923', '上高县', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360924', '宜丰县', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360925', '靖安县', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360926', '铜鼓县', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360981', '丰城市', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360982', '樟树市', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('360983', '高安市', null, '3', '360900');
INSERT INTO `sys_region` VALUES ('361000', '抚州市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('361001', '市辖区', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361002', '临川区', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361021', '南城县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361022', '黎川县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361023', '南丰县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361024', '崇仁县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361025', '乐安县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361026', '宜黄县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361027', '金溪县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361028', '资溪县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361029', '东乡县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361030', '广昌县', null, '3', '361000');
INSERT INTO `sys_region` VALUES ('361100', '上饶市', null, '2', '360000');
INSERT INTO `sys_region` VALUES ('361101', '市辖区', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361102', '信州区', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361121', '上饶县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361122', '广丰县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361123', '玉山县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361124', '铅山县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361125', '横峰县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361126', '弋阳县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361127', '余干县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361128', '鄱阳县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361129', '万年县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361130', '婺源县', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('361181', '德兴市', null, '3', '361100');
INSERT INTO `sys_region` VALUES ('370000', '山东省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('370100', '济南市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370101', '市辖区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370102', '历下区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370103', '市中区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370104', '槐荫区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370105', '天桥区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370112', '历城区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370113', '长清区', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370124', '平阴县', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370125', '济阳县', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370126', '商河县', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370181', '章丘市', null, '3', '370100');
INSERT INTO `sys_region` VALUES ('370200', '青岛市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370201', '市辖区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370202', '市南区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370203', '市北区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370205', '四方区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370211', '黄岛区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370212', '崂山区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370213', '李沧区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370214', '城阳区', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370281', '胶州市', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370282', '即墨市', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370283', '平度市', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370284', '胶南市', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370285', '莱西市', null, '3', '370200');
INSERT INTO `sys_region` VALUES ('370300', '淄博市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370301', '市辖区', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370302', '淄川区', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370303', '张店区', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370304', '博山区', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370305', '临淄区', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370306', '周村区', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370321', '桓台县', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370322', '高青县', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370323', '沂源县', null, '3', '370300');
INSERT INTO `sys_region` VALUES ('370400', '枣庄市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370401', '市辖区', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370402', '市中区', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370403', '薛城区', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370404', '峄城区', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370405', '台儿庄区', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370406', '山亭区', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370481', '滕州市', null, '3', '370400');
INSERT INTO `sys_region` VALUES ('370500', '东营市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370501', '市辖区', null, '3', '370500');
INSERT INTO `sys_region` VALUES ('370502', '东营区', null, '3', '370500');
INSERT INTO `sys_region` VALUES ('370503', '河口区', null, '3', '370500');
INSERT INTO `sys_region` VALUES ('370521', '垦利县', null, '3', '370500');
INSERT INTO `sys_region` VALUES ('370522', '利津县', null, '3', '370500');
INSERT INTO `sys_region` VALUES ('370523', '广饶县', null, '3', '370500');
INSERT INTO `sys_region` VALUES ('370600', '烟台市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370601', '市辖区', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370602', '芝罘区', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370611', '福山区', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370612', '牟平区', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370613', '莱山区', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370634', '长岛县', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370681', '龙口市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370682', '莱阳市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370683', '莱州市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370684', '蓬莱市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370685', '招远市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370686', '栖霞市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370687', '海阳市', null, '3', '370600');
INSERT INTO `sys_region` VALUES ('370700', '潍坊市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370701', '市辖区', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370702', '潍城区', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370703', '寒亭区', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370704', '坊子区', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370705', '奎文区', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370724', '临朐县', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370725', '昌乐县', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370781', '青州市', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370782', '诸城市', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370783', '寿光市', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370784', '安丘市', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370785', '高密市', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370786', '昌邑市', null, '3', '370700');
INSERT INTO `sys_region` VALUES ('370800', '济宁市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370801', '市辖区', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370802', '市中区', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370811', '任城区', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370826', '微山县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370827', '鱼台县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370828', '金乡县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370829', '嘉祥县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370830', '汶上县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370831', '泗水县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370832', '梁山县', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370881', '曲阜市', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370882', '兖州市', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370883', '邹城市', null, '3', '370800');
INSERT INTO `sys_region` VALUES ('370900', '泰安市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('370901', '市辖区', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('370902', '泰山区', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('370903', '岱岳区', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('370921', '宁阳县', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('370923', '东平县', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('370982', '新泰市', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('370983', '肥城市', null, '3', '370900');
INSERT INTO `sys_region` VALUES ('371000', '威海市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371001', '市辖区', null, '3', '371000');
INSERT INTO `sys_region` VALUES ('371002', '环翠区', null, '3', '371000');
INSERT INTO `sys_region` VALUES ('371081', '文登市', null, '3', '371000');
INSERT INTO `sys_region` VALUES ('371082', '荣成市', null, '3', '371000');
INSERT INTO `sys_region` VALUES ('371083', '乳山市', null, '3', '371000');
INSERT INTO `sys_region` VALUES ('371100', '日照市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371101', '市辖区', null, '3', '371100');
INSERT INTO `sys_region` VALUES ('371102', '东港区', null, '3', '371100');
INSERT INTO `sys_region` VALUES ('371103', '岚山区', null, '3', '371100');
INSERT INTO `sys_region` VALUES ('371121', '五莲县', null, '3', '371100');
INSERT INTO `sys_region` VALUES ('371122', '莒县', null, '3', '371100');
INSERT INTO `sys_region` VALUES ('371200', '莱芜市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371201', '市辖区', null, '3', '371200');
INSERT INTO `sys_region` VALUES ('371202', '莱城区', null, '3', '371200');
INSERT INTO `sys_region` VALUES ('371203', '钢城区', null, '3', '371200');
INSERT INTO `sys_region` VALUES ('371300', '临沂市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371301', '市辖区', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371302', '兰山区', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371311', '罗庄区', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371312', '河东区', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371321', '沂南县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371322', '郯城县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371323', '沂水县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371324', '苍山县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371325', '费县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371326', '平邑县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371327', '莒南县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371328', '蒙阴县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371329', '临沭县', null, '3', '371300');
INSERT INTO `sys_region` VALUES ('371400', '德州市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371401', '市辖区', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371402', '德城区', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371421', '陵县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371422', '宁津县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371423', '庆云县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371424', '临邑县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371425', '齐河县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371426', '平原县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371427', '夏津县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371428', '武城县', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371481', '乐陵市', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371482', '禹城市', null, '3', '371400');
INSERT INTO `sys_region` VALUES ('371500', '聊城市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371501', '市辖区', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371502', '东昌府区', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371521', '阳谷县', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371522', '莘县', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371523', '茌平县', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371524', '东阿县', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371525', '冠县', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371526', '高唐县', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371581', '临清市', null, '3', '371500');
INSERT INTO `sys_region` VALUES ('371600', '滨州市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371601', '市辖区', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371602', '滨城区', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371621', '惠民县', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371622', '阳信县', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371623', '无棣县', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371624', '沾化县', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371625', '博兴县', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371626', '邹平县', null, '3', '371600');
INSERT INTO `sys_region` VALUES ('371700', '荷泽市', null, '2', '370000');
INSERT INTO `sys_region` VALUES ('371701', '市辖区', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371702', '牡丹区', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371721', '曹县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371722', '单县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371723', '成武县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371724', '巨野县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371725', '郓城县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371726', '鄄城县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371727', '定陶县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('371728', '东明县', null, '3', '371700');
INSERT INTO `sys_region` VALUES ('410000', '河南省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('410100', '郑州市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410101', '市辖区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410102', '中原区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410103', '二七区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410104', '管城回族区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410105', '金水区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410106', '上街区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410108', '惠济区', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410122', '中牟县', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410181', '巩义市', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410182', '荥阳市', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410183', '新密市', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410184', '新郑市', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410185', '登封市', null, '3', '410100');
INSERT INTO `sys_region` VALUES ('410200', '开封市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410201', '市辖区', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410202', '龙亭区', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410203', '顺河回族区', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410204', '鼓楼区', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410205', '禹王台区', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410211', '金明区', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410221', '杞县', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410222', '通许县', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410223', '尉氏县', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410224', '开封县', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410225', '兰考县', null, '3', '410200');
INSERT INTO `sys_region` VALUES ('410300', '洛阳市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410301', '市辖区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410302', '老城区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410303', '西工区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410304', '廛河回族区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410305', '涧西区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410306', '吉利区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410307', '洛龙区', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410322', '孟津县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410323', '新安县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410324', '栾川县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410325', '嵩县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410326', '汝阳县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410327', '宜阳县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410328', '洛宁县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410329', '伊川县', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410381', '偃师市', null, '3', '410300');
INSERT INTO `sys_region` VALUES ('410400', '平顶山市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410401', '市辖区', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410402', '新华区', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410403', '卫东区', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410404', '石龙区', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410411', '湛河区', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410421', '宝丰县', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410422', '叶县', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410423', '鲁山县', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410425', '郏县', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410481', '舞钢市', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410482', '汝州市', null, '3', '410400');
INSERT INTO `sys_region` VALUES ('410500', '安阳市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410501', '市辖区', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410502', '文峰区', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410503', '北关区', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410505', '殷都区', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410506', '龙安区', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410522', '安阳县', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410523', '汤阴县', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410526', '滑县', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410527', '内黄县', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410581', '林州市', null, '3', '410500');
INSERT INTO `sys_region` VALUES ('410600', '鹤壁市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410601', '市辖区', null, '3', '410600');
INSERT INTO `sys_region` VALUES ('410602', '鹤山区', null, '3', '410600');
INSERT INTO `sys_region` VALUES ('410603', '山城区', null, '3', '410600');
INSERT INTO `sys_region` VALUES ('410611', '淇滨区', null, '3', '410600');
INSERT INTO `sys_region` VALUES ('410621', '浚县', null, '3', '410600');
INSERT INTO `sys_region` VALUES ('410622', '淇县', null, '3', '410600');
INSERT INTO `sys_region` VALUES ('410700', '新乡市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410701', '市辖区', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410702', '红旗区', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410703', '卫滨区', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410704', '凤泉区', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410711', '牧野区', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410721', '新乡县', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410724', '获嘉县', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410725', '原阳县', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410726', '延津县', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410727', '封丘县', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410728', '长垣县', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410781', '卫辉市', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410782', '辉县市', null, '3', '410700');
INSERT INTO `sys_region` VALUES ('410800', '焦作市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410801', '市辖区', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410802', '解放区', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410803', '中站区', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410804', '马村区', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410811', '山阳区', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410821', '修武县', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410822', '博爱县', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410823', '武陟县', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410825', '温县', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410881', '济源市', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410882', '沁阳市', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410883', '孟州市', null, '3', '410800');
INSERT INTO `sys_region` VALUES ('410900', '濮阳市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('410901', '市辖区', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('410902', '华龙区', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('410922', '清丰县', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('410923', '南乐县', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('410926', '范县', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('410927', '台前县', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('410928', '濮阳县', null, '3', '410900');
INSERT INTO `sys_region` VALUES ('411000', '许昌市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411001', '市辖区', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411002', '魏都区', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411023', '许昌县', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411024', '鄢陵县', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411025', '襄城县', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411081', '禹州市', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411082', '长葛市', null, '3', '411000');
INSERT INTO `sys_region` VALUES ('411100', '漯河市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411101', '市辖区', null, '3', '411100');
INSERT INTO `sys_region` VALUES ('411102', '源汇区', null, '3', '411100');
INSERT INTO `sys_region` VALUES ('411103', '郾城区', null, '3', '411100');
INSERT INTO `sys_region` VALUES ('411104', '召陵区', null, '3', '411100');
INSERT INTO `sys_region` VALUES ('411121', '舞阳县', null, '3', '411100');
INSERT INTO `sys_region` VALUES ('411122', '临颍县', null, '3', '411100');
INSERT INTO `sys_region` VALUES ('411200', '三门峡市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411201', '市辖区', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411202', '湖滨区', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411221', '渑池县', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411222', '陕县', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411224', '卢氏县', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411281', '义马市', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411282', '灵宝市', null, '3', '411200');
INSERT INTO `sys_region` VALUES ('411300', '南阳市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411301', '市辖区', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411302', '宛城区', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411303', '卧龙区', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411321', '南召县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411322', '方城县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411323', '西峡县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411324', '镇平县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411325', '内乡县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411326', '淅川县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411327', '社旗县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411328', '唐河县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411329', '新野县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411330', '桐柏县', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411381', '邓州市', null, '3', '411300');
INSERT INTO `sys_region` VALUES ('411400', '商丘市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411401', '市辖区', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411402', '梁园区', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411403', '睢阳区', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411421', '民权县', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411422', '睢县', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411423', '宁陵县', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411424', '柘城县', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411425', '虞城县', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411426', '夏邑县', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411481', '永城市', null, '3', '411400');
INSERT INTO `sys_region` VALUES ('411500', '信阳市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411501', '市辖区', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411502', '师河区', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411503', '平桥区', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411521', '罗山县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411522', '光山县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411523', '新县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411524', '商城县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411525', '固始县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411526', '潢川县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411527', '淮滨县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411528', '息县', null, '3', '411500');
INSERT INTO `sys_region` VALUES ('411600', '周口市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411601', '市辖区', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411602', '川汇区', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411621', '扶沟县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411622', '西华县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411623', '商水县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411624', '沈丘县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411625', '郸城县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411626', '淮阳县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411627', '太康县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411628', '鹿邑县', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411681', '项城市', null, '3', '411600');
INSERT INTO `sys_region` VALUES ('411700', '驻马店市', null, '2', '410000');
INSERT INTO `sys_region` VALUES ('411701', '市辖区', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411702', '驿城区', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411721', '西平县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411722', '上蔡县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411723', '平舆县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411724', '正阳县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411725', '确山县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411726', '泌阳县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411727', '汝南县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411728', '遂平县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('411729', '新蔡县', null, '3', '411700');
INSERT INTO `sys_region` VALUES ('420000', '湖北省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('420100', '武汉市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420101', '市辖区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420102', '江岸区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420103', '江汉区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420104', '乔口区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420105', '汉阳区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420106', '武昌区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420107', '青山区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420111', '洪山区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420112', '东西湖区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420113', '汉南区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420114', '蔡甸区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420115', '江夏区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420116', '黄陂区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420117', '新洲区', null, '3', '420100');
INSERT INTO `sys_region` VALUES ('420200', '黄石市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420201', '市辖区', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420202', '黄石港区', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420203', '西塞山区', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420204', '下陆区', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420205', '铁山区', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420222', '阳新县', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420281', '大冶市', null, '3', '420200');
INSERT INTO `sys_region` VALUES ('420300', '十堰市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420301', '市辖区', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420302', '茅箭区', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420303', '张湾区', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420321', '郧县', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420322', '郧西县', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420323', '竹山县', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420324', '竹溪县', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420325', '房县', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420381', '丹江口市', null, '3', '420300');
INSERT INTO `sys_region` VALUES ('420500', '宜昌市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420501', '市辖区', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420502', '西陵区', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420503', '伍家岗区', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420504', '点军区', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420505', '虎亭区', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420506', '夷陵区', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420525', '远安县', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420526', '兴山县', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420527', '秭归县', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420528', '长阳土家族自治县', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420529', '五峰土家族自治县', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420581', '宜都市', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420582', '当阳市', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420583', '枝江市', null, '3', '420500');
INSERT INTO `sys_region` VALUES ('420600', '襄樊市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420601', '市辖区', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420602', '襄城区', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420606', '樊城区', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420607', '襄阳区', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420624', '南漳县', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420625', '谷城县', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420626', '保康县', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420682', '老河口市', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420683', '枣阳市', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420684', '宜城市', null, '3', '420600');
INSERT INTO `sys_region` VALUES ('420700', '鄂州市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420701', '市辖区', null, '3', '420700');
INSERT INTO `sys_region` VALUES ('420702', '梁子湖区', null, '3', '420700');
INSERT INTO `sys_region` VALUES ('420703', '华容区', null, '3', '420700');
INSERT INTO `sys_region` VALUES ('420704', '鄂城区', null, '3', '420700');
INSERT INTO `sys_region` VALUES ('420800', '荆门市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420801', '市辖区', null, '3', '420800');
INSERT INTO `sys_region` VALUES ('420802', '东宝区', null, '3', '420800');
INSERT INTO `sys_region` VALUES ('420804', '掇刀区', null, '3', '420800');
INSERT INTO `sys_region` VALUES ('420821', '京山县', null, '3', '420800');
INSERT INTO `sys_region` VALUES ('420822', '沙洋县', null, '3', '420800');
INSERT INTO `sys_region` VALUES ('420881', '钟祥市', null, '3', '420800');
INSERT INTO `sys_region` VALUES ('420900', '孝感市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('420901', '市辖区', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420902', '孝南区', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420921', '孝昌县', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420922', '大悟县', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420923', '云梦县', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420981', '应城市', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420982', '安陆市', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('420984', '汉川市', null, '3', '420900');
INSERT INTO `sys_region` VALUES ('421000', '荆州市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('421001', '市辖区', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421002', '沙市区', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421003', '荆州区', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421022', '公安县', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421023', '监利县', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421024', '江陵县', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421081', '石首市', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421083', '洪湖市', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421087', '松滋市', null, '3', '421000');
INSERT INTO `sys_region` VALUES ('421100', '黄冈市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('421101', '市辖区', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421102', '黄州区', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421121', '团风县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421122', '红安县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421123', '罗田县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421124', '英山县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421125', '浠水县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421126', '蕲春县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421127', '黄梅县', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421181', '麻城市', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421182', '武穴市', null, '3', '421100');
INSERT INTO `sys_region` VALUES ('421200', '咸宁市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('421201', '市辖区', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421202', '咸安区', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421221', '嘉鱼县', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421222', '通城县', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421223', '崇阳县', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421224', '通山县', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421281', '赤壁市', null, '3', '421200');
INSERT INTO `sys_region` VALUES ('421300', '随州市', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('421301', '市辖区', null, '3', '421300');
INSERT INTO `sys_region` VALUES ('421302', '曾都区', null, '3', '421300');
INSERT INTO `sys_region` VALUES ('421381', '广水市', null, '3', '421300');
INSERT INTO `sys_region` VALUES ('422800', '恩施土家族苗族自治州', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('422801', '恩施市', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422802', '利川市', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422822', '建始县', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422823', '巴东县', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422825', '宣恩县', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422826', '咸丰县', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422827', '来凤县', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('422828', '鹤峰县', null, '3', '422800');
INSERT INTO `sys_region` VALUES ('429000', '省直辖行政单位', null, '2', '420000');
INSERT INTO `sys_region` VALUES ('429004', '仙桃市', null, '3', '429000');
INSERT INTO `sys_region` VALUES ('429005', '潜江市', null, '3', '429000');
INSERT INTO `sys_region` VALUES ('429006', '天门市', null, '3', '429000');
INSERT INTO `sys_region` VALUES ('429021', '神农架林区', null, '3', '429000');
INSERT INTO `sys_region` VALUES ('430000', '湖南省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('430100', '长沙市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430101', '市辖区', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430102', '芙蓉区', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430103', '天心区', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430104', '岳麓区', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430105', '开福区', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430111', '雨花区', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430121', '长沙县', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430122', '望城县', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430124', '宁乡县', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430181', '浏阳市', null, '3', '430100');
INSERT INTO `sys_region` VALUES ('430200', '株洲市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430201', '市辖区', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430202', '荷塘区', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430203', '芦淞区', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430204', '石峰区', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430211', '天元区', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430221', '株洲县', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430223', '攸县', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430224', '茶陵县', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430225', '炎陵县', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430281', '醴陵市', null, '3', '430200');
INSERT INTO `sys_region` VALUES ('430300', '湘潭市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430301', '市辖区', null, '3', '430300');
INSERT INTO `sys_region` VALUES ('430302', '雨湖区', null, '3', '430300');
INSERT INTO `sys_region` VALUES ('430304', '岳塘区', null, '3', '430300');
INSERT INTO `sys_region` VALUES ('430321', '湘潭县', null, '3', '430300');
INSERT INTO `sys_region` VALUES ('430381', '湘乡市', null, '3', '430300');
INSERT INTO `sys_region` VALUES ('430382', '韶山市', null, '3', '430300');
INSERT INTO `sys_region` VALUES ('430400', '衡阳市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430401', '市辖区', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430405', '珠晖区', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430406', '雁峰区', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430407', '石鼓区', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430408', '蒸湘区', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430412', '南岳区', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430421', '衡阳县', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430422', '衡南县', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430423', '衡山县', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430424', '衡东县', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430426', '祁东县', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430481', '耒阳市', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430482', '常宁市', null, '3', '430400');
INSERT INTO `sys_region` VALUES ('430500', '邵阳市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430501', '市辖区', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430502', '双清区', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430503', '大祥区', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430511', '北塔区', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430521', '邵东县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430522', '新邵县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430523', '邵阳县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430524', '隆回县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430525', '洞口县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430527', '绥宁县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430528', '新宁县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430529', '城步苗族自治县', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430581', '武冈市', null, '3', '430500');
INSERT INTO `sys_region` VALUES ('430600', '岳阳市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430601', '市辖区', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430602', '岳阳楼区', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430603', '云溪区', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430611', '君山区', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430621', '岳阳县', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430623', '华容县', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430624', '湘阴县', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430626', '平江县', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430681', '汨罗市', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430682', '临湘市', null, '3', '430600');
INSERT INTO `sys_region` VALUES ('430700', '常德市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430701', '市辖区', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430702', '武陵区', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430703', '鼎城区', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430721', '安乡县', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430722', '汉寿县', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430723', '澧县', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430724', '临澧县', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430725', '桃源县', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430726', '石门县', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430781', '津市市', null, '3', '430700');
INSERT INTO `sys_region` VALUES ('430800', '张家界市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430801', '市辖区', null, '3', '430800');
INSERT INTO `sys_region` VALUES ('430802', '永定区', null, '3', '430800');
INSERT INTO `sys_region` VALUES ('430811', '武陵源区', null, '3', '430800');
INSERT INTO `sys_region` VALUES ('430821', '慈利县', null, '3', '430800');
INSERT INTO `sys_region` VALUES ('430822', '桑植县', null, '3', '430800');
INSERT INTO `sys_region` VALUES ('430900', '益阳市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('430901', '市辖区', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('430902', '资阳区', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('430903', '赫山区', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('430921', '南县', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('430922', '桃江县', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('430923', '安化县', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('430981', '沅江市', null, '3', '430900');
INSERT INTO `sys_region` VALUES ('431000', '郴州市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('431001', '市辖区', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431002', '北湖区', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431003', '苏仙区', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431021', '桂阳县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431022', '宜章县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431023', '永兴县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431024', '嘉禾县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431025', '临武县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431026', '汝城县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431027', '桂东县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431028', '安仁县', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431081', '资兴市', null, '3', '431000');
INSERT INTO `sys_region` VALUES ('431100', '永州市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('431101', '市辖区', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431102', '芝山区', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431103', '冷水滩区', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431121', '祁阳县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431122', '东安县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431123', '双牌县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431124', '道县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431125', '江永县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431126', '宁远县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431127', '蓝山县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431128', '新田县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431129', '江华瑶族自治县', null, '3', '431100');
INSERT INTO `sys_region` VALUES ('431200', '怀化市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('431201', '市辖区', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431202', '鹤城区', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431221', '中方县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431222', '沅陵县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431223', '辰溪县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431224', '溆浦县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431225', '会同县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431226', '麻阳苗族自治县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431227', '新晃侗族自治县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431228', '芷江侗族自治县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431229', '靖州苗族侗族自治县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431230', '通道侗族自治县', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431281', '洪江市', null, '3', '431200');
INSERT INTO `sys_region` VALUES ('431300', '娄底市', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('431301', '市辖区', null, '3', '431300');
INSERT INTO `sys_region` VALUES ('431302', '娄星区', null, '3', '431300');
INSERT INTO `sys_region` VALUES ('431321', '双峰县', null, '3', '431300');
INSERT INTO `sys_region` VALUES ('431322', '新化县', null, '3', '431300');
INSERT INTO `sys_region` VALUES ('431381', '冷水江市', null, '3', '431300');
INSERT INTO `sys_region` VALUES ('431382', '涟源市', null, '3', '431300');
INSERT INTO `sys_region` VALUES ('433100', '湘西土家族苗族自治州', null, '2', '430000');
INSERT INTO `sys_region` VALUES ('433101', '吉首市', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433122', '泸溪县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433123', '凤凰县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433124', '花垣县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433125', '保靖县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433126', '古丈县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433127', '永顺县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('433130', '龙山县', null, '3', '433100');
INSERT INTO `sys_region` VALUES ('440000', '广东省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('440100', '广州市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440101', '市辖区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440103', '荔湾区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440104', '越秀区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440105', '海珠区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440106', '天河区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440111', '白云区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440112', '黄埔区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440113', '番禺区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440114', '花都区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440115', '南沙区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440116', '萝岗区', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440183', '增城市', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440184', '从化市', null, '3', '440100');
INSERT INTO `sys_region` VALUES ('440200', '韶关市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440201', '市辖区', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440203', '武江区', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440204', '浈江区', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440205', '曲江区', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440222', '始兴县', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440224', '仁化县', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440229', '翁源县', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440232', '乳源瑶族自治县', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440233', '新丰县', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440281', '乐昌市', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440282', '南雄市', null, '3', '440200');
INSERT INTO `sys_region` VALUES ('440300', '深圳市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440301', '市辖区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440303', '罗湖区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440304', '福田区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440305', '南山区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440306', '宝安区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440307', '龙岗区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440308', '盐田区', null, '3', '440300');
INSERT INTO `sys_region` VALUES ('440400', '珠海市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440401', '市辖区', null, '3', '440400');
INSERT INTO `sys_region` VALUES ('440402', '香洲区', null, '3', '440400');
INSERT INTO `sys_region` VALUES ('440403', '斗门区', null, '3', '440400');
INSERT INTO `sys_region` VALUES ('440404', '金湾区', null, '3', '440400');
INSERT INTO `sys_region` VALUES ('440500', '汕头市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440501', '市辖区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440507', '龙湖区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440511', '金平区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440512', '濠江区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440513', '潮阳区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440514', '潮南区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440515', '澄海区', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440523', '南澳县', null, '3', '440500');
INSERT INTO `sys_region` VALUES ('440600', '佛山市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440601', '市辖区', null, '3', '440600');
INSERT INTO `sys_region` VALUES ('440604', '禅城区', null, '3', '440600');
INSERT INTO `sys_region` VALUES ('440605', '南海区', null, '3', '440600');
INSERT INTO `sys_region` VALUES ('440606', '顺德区', null, '3', '440600');
INSERT INTO `sys_region` VALUES ('440607', '三水区', null, '3', '440600');
INSERT INTO `sys_region` VALUES ('440608', '高明区', null, '3', '440600');
INSERT INTO `sys_region` VALUES ('440700', '江门市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440701', '市辖区', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440703', '蓬江区', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440704', '江海区', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440705', '新会区', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440781', '台山市', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440783', '开平市', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440784', '鹤山市', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440785', '恩平市', null, '3', '440700');
INSERT INTO `sys_region` VALUES ('440800', '湛江市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440801', '市辖区', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440802', '赤坎区', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440803', '霞山区', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440804', '坡头区', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440811', '麻章区', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440823', '遂溪县', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440825', '徐闻县', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440881', '廉江市', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440882', '雷州市', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440883', '吴川市', null, '3', '440800');
INSERT INTO `sys_region` VALUES ('440900', '茂名市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('440901', '市辖区', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('440902', '茂南区', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('440903', '茂港区', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('440923', '电白县', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('440981', '高州市', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('440982', '化州市', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('440983', '信宜市', null, '3', '440900');
INSERT INTO `sys_region` VALUES ('441200', '肇庆市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441201', '市辖区', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441202', '端州区', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441203', '鼎湖区', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441223', '广宁县', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441224', '怀集县', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441225', '封开县', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441226', '德庆县', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441283', '高要市', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441284', '四会市', null, '3', '441200');
INSERT INTO `sys_region` VALUES ('441300', '惠州市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441301', '市辖区', null, '3', '441300');
INSERT INTO `sys_region` VALUES ('441302', '惠城区', null, '3', '441300');
INSERT INTO `sys_region` VALUES ('441303', '惠阳区', null, '3', '441300');
INSERT INTO `sys_region` VALUES ('441322', '博罗县', null, '3', '441300');
INSERT INTO `sys_region` VALUES ('441323', '惠东县', null, '3', '441300');
INSERT INTO `sys_region` VALUES ('441324', '龙门县', null, '3', '441300');
INSERT INTO `sys_region` VALUES ('441400', '梅州市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441401', '市辖区', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441402', '梅江区', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441421', '梅县', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441422', '大埔县', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441423', '丰顺县', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441424', '五华县', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441426', '平远县', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441427', '蕉岭县', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441481', '兴宁市', null, '3', '441400');
INSERT INTO `sys_region` VALUES ('441500', '汕尾市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441501', '市辖区', null, '3', '441500');
INSERT INTO `sys_region` VALUES ('441502', '城区', null, '3', '441500');
INSERT INTO `sys_region` VALUES ('441521', '海丰县', null, '3', '441500');
INSERT INTO `sys_region` VALUES ('441523', '陆河县', null, '3', '441500');
INSERT INTO `sys_region` VALUES ('441581', '陆丰市', null, '3', '441500');
INSERT INTO `sys_region` VALUES ('441600', '河源市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441601', '市辖区', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441602', '源城区', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441621', '紫金县', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441622', '龙川县', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441623', '连平县', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441624', '和平县', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441625', '东源县', null, '3', '441600');
INSERT INTO `sys_region` VALUES ('441700', '阳江市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441701', '市辖区', null, '3', '441700');
INSERT INTO `sys_region` VALUES ('441702', '江城区', null, '3', '441700');
INSERT INTO `sys_region` VALUES ('441721', '阳西县', null, '3', '441700');
INSERT INTO `sys_region` VALUES ('441723', '阳东县', null, '3', '441700');
INSERT INTO `sys_region` VALUES ('441781', '阳春市', null, '3', '441700');
INSERT INTO `sys_region` VALUES ('441800', '清远市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('441801', '市辖区', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441802', '清城区', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441821', '佛冈县', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441823', '阳山县', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441825', '连山壮族瑶族自治县', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441826', '连南瑶族自治县', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441827', '清新县', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441881', '英德市', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441882', '连州市', null, '3', '441800');
INSERT INTO `sys_region` VALUES ('441900', '东莞市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('442000', '中山市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('445100', '潮州市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('445101', '市辖区', null, '3', '445100');
INSERT INTO `sys_region` VALUES ('445102', '湘桥区', null, '3', '445100');
INSERT INTO `sys_region` VALUES ('445121', '潮安县', null, '3', '445100');
INSERT INTO `sys_region` VALUES ('445122', '饶平县', null, '3', '445100');
INSERT INTO `sys_region` VALUES ('445200', '揭阳市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('445201', '市辖区', null, '3', '445200');
INSERT INTO `sys_region` VALUES ('445202', '榕城区', null, '3', '445200');
INSERT INTO `sys_region` VALUES ('445221', '揭东县', null, '3', '445200');
INSERT INTO `sys_region` VALUES ('445222', '揭西县', null, '3', '445200');
INSERT INTO `sys_region` VALUES ('445224', '惠来县', null, '3', '445200');
INSERT INTO `sys_region` VALUES ('445281', '普宁市', null, '3', '445200');
INSERT INTO `sys_region` VALUES ('445300', '云浮市', null, '2', '440000');
INSERT INTO `sys_region` VALUES ('445301', '市辖区', null, '3', '445300');
INSERT INTO `sys_region` VALUES ('445302', '云城区', null, '3', '445300');
INSERT INTO `sys_region` VALUES ('445321', '新兴县', null, '3', '445300');
INSERT INTO `sys_region` VALUES ('445322', '郁南县', null, '3', '445300');
INSERT INTO `sys_region` VALUES ('445323', '云安县', null, '3', '445300');
INSERT INTO `sys_region` VALUES ('445381', '罗定市', null, '3', '445300');
INSERT INTO `sys_region` VALUES ('450000', '广西壮族自治区', null, '1', '86');
INSERT INTO `sys_region` VALUES ('450100', '南宁市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450101', '市辖区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450102', '兴宁区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450103', '青秀区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450105', '江南区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450107', '西乡塘区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450108', '良庆区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450109', '邕宁区', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450122', '武鸣县', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450123', '隆安县', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450124', '马山县', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450125', '上林县', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450126', '宾阳县', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450127', '横县', null, '3', '450100');
INSERT INTO `sys_region` VALUES ('450200', '柳州市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450201', '市辖区', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450202', '城中区', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450203', '鱼峰区', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450204', '柳南区', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450205', '柳北区', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450221', '柳江县', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450222', '柳城县', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450223', '鹿寨县', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450224', '融安县', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450225', '融水苗族自治县', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450226', '三江侗族自治县', null, '3', '450200');
INSERT INTO `sys_region` VALUES ('450300', '桂林市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450301', '市辖区', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450302', '秀峰区', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450303', '叠彩区', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450304', '象山区', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450305', '七星区', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450311', '雁山区', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450321', '阳朔县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450322', '临桂县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450323', '灵川县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450324', '全州县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450325', '兴安县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450326', '永福县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450327', '灌阳县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450328', '龙胜各族自治县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450329', '资源县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450330', '平乐县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450331', '荔蒲县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450332', '恭城瑶族自治县', null, '3', '450300');
INSERT INTO `sys_region` VALUES ('450400', '梧州市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450401', '市辖区', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450403', '万秀区', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450404', '蝶山区', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450405', '长洲区', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450421', '苍梧县', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450422', '藤县', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450423', '蒙山县', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450481', '岑溪市', null, '3', '450400');
INSERT INTO `sys_region` VALUES ('450500', '北海市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450501', '市辖区', null, '3', '450500');
INSERT INTO `sys_region` VALUES ('450502', '海城区', null, '3', '450500');
INSERT INTO `sys_region` VALUES ('450503', '银海区', null, '3', '450500');
INSERT INTO `sys_region` VALUES ('450512', '铁山港区', null, '3', '450500');
INSERT INTO `sys_region` VALUES ('450521', '合浦县', null, '3', '450500');
INSERT INTO `sys_region` VALUES ('450600', '防城港市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450601', '市辖区', null, '3', '450600');
INSERT INTO `sys_region` VALUES ('450602', '港口区', null, '3', '450600');
INSERT INTO `sys_region` VALUES ('450603', '防城区', null, '3', '450600');
INSERT INTO `sys_region` VALUES ('450621', '上思县', null, '3', '450600');
INSERT INTO `sys_region` VALUES ('450681', '东兴市', null, '3', '450600');
INSERT INTO `sys_region` VALUES ('450700', '钦州市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450701', '市辖区', null, '3', '450700');
INSERT INTO `sys_region` VALUES ('450702', '钦南区', null, '3', '450700');
INSERT INTO `sys_region` VALUES ('450703', '钦北区', null, '3', '450700');
INSERT INTO `sys_region` VALUES ('450721', '灵山县', null, '3', '450700');
INSERT INTO `sys_region` VALUES ('450722', '浦北县', null, '3', '450700');
INSERT INTO `sys_region` VALUES ('450800', '贵港市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450801', '市辖区', null, '3', '450800');
INSERT INTO `sys_region` VALUES ('450802', '港北区', null, '3', '450800');
INSERT INTO `sys_region` VALUES ('450803', '港南区', null, '3', '450800');
INSERT INTO `sys_region` VALUES ('450804', '覃塘区', null, '3', '450800');
INSERT INTO `sys_region` VALUES ('450821', '平南县', null, '3', '450800');
INSERT INTO `sys_region` VALUES ('450881', '桂平市', null, '3', '450800');
INSERT INTO `sys_region` VALUES ('450900', '玉林市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('450901', '市辖区', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('450902', '玉州区', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('450921', '容县', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('450922', '陆川县', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('450923', '博白县', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('450924', '兴业县', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('450981', '北流市', null, '3', '450900');
INSERT INTO `sys_region` VALUES ('451000', '百色市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('451001', '市辖区', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451002', '右江区', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451021', '田阳县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451022', '田东县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451023', '平果县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451024', '德保县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451025', '靖西县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451026', '那坡县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451027', '凌云县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451028', '乐业县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451029', '田林县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451030', '西林县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451031', '隆林各族自治县', null, '3', '451000');
INSERT INTO `sys_region` VALUES ('451100', '贺州市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('451101', '市辖区', null, '3', '451100');
INSERT INTO `sys_region` VALUES ('451102', '八步区', null, '3', '451100');
INSERT INTO `sys_region` VALUES ('451121', '昭平县', null, '3', '451100');
INSERT INTO `sys_region` VALUES ('451122', '钟山县', null, '3', '451100');
INSERT INTO `sys_region` VALUES ('451123', '富川瑶族自治县', null, '3', '451100');
INSERT INTO `sys_region` VALUES ('451200', '河池市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('451201', '市辖区', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451202', '金城江区', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451221', '南丹县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451222', '天峨县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451223', '凤山县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451224', '东兰县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451225', '罗城仫佬族自治县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451226', '环江毛南族自治县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451227', '巴马瑶族自治县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451228', '都安瑶族自治县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451229', '大化瑶族自治县', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451281', '宜州市', null, '3', '451200');
INSERT INTO `sys_region` VALUES ('451300', '来宾市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('451301', '市辖区', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451302', '兴宾区', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451321', '忻城县', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451322', '象州县', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451323', '武宣县', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451324', '金秀瑶族自治县', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451381', '合山市', null, '3', '451300');
INSERT INTO `sys_region` VALUES ('451400', '崇左市', null, '2', '450000');
INSERT INTO `sys_region` VALUES ('451401', '市辖区', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451402', '江洲区', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451421', '扶绥县', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451422', '宁明县', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451423', '龙州县', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451424', '大新县', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451425', '天等县', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('451481', '凭祥市', null, '3', '451400');
INSERT INTO `sys_region` VALUES ('460000', '海南省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('460100', '海口市', null, '2', '460000');
INSERT INTO `sys_region` VALUES ('460101', '市辖区', null, '3', '460100');
INSERT INTO `sys_region` VALUES ('460105', '秀英区', null, '3', '460100');
INSERT INTO `sys_region` VALUES ('460106', '龙华区', null, '3', '460100');
INSERT INTO `sys_region` VALUES ('460107', '琼山区', null, '3', '460100');
INSERT INTO `sys_region` VALUES ('460108', '美兰区', null, '3', '460100');
INSERT INTO `sys_region` VALUES ('460200', '三亚市', null, '2', '460000');
INSERT INTO `sys_region` VALUES ('460201', '市辖区', null, '3', '460200');
INSERT INTO `sys_region` VALUES ('469000', '省直辖县级行政单位', null, '2', '460000');
INSERT INTO `sys_region` VALUES ('469001', '五指山市', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469002', '琼海市', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469003', '儋州市', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469005', '文昌市', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469006', '万宁市', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469007', '东方市', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469025', '定安县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469026', '屯昌县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469027', '澄迈县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469028', '临高县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469030', '白沙黎族自治县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469031', '昌江黎族自治县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469033', '乐东黎族自治县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469034', '陵水黎族自治县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469035', '保亭黎族苗族自治县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469036', '琼中黎族苗族自治县', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469037', '西沙群岛', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469038', '南沙群岛', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('469039', '中沙群岛的岛礁及其海域', null, '3', '469000');
INSERT INTO `sys_region` VALUES ('500000', '重庆市', null, '1', '86');
INSERT INTO `sys_region` VALUES ('500100', '市辖区', null, '2', '500000');
INSERT INTO `sys_region` VALUES ('500101', '万州区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500102', '涪陵区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500103', '渝中区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500104', '大渡口区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500105', '江北区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500106', '沙坪坝区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500107', '九龙坡区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500108', '南岸区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500109', '北碚区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500110', '万盛区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500111', '双桥区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500112', '渝北区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500113', '巴南区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500114', '黔江区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500115', '长寿区', null, '3', '500100');
INSERT INTO `sys_region` VALUES ('500200', '县', null, '2', '500000');
INSERT INTO `sys_region` VALUES ('500222', '綦江县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500223', '潼南县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500224', '铜梁县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500225', '大足县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500226', '荣昌县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500227', '璧山县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500228', '梁平县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500229', '城口县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500230', '丰都县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500231', '垫江县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500232', '武隆县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500233', '忠县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500234', '开县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500235', '云阳县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500236', '奉节县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500237', '巫山县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500238', '巫溪县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500240', '石柱土家族自治县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500241', '秀山土家族苗族自治县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500242', '酉阳土家族苗族自治县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500243', '彭水苗族土家族自治县', null, '3', '500200');
INSERT INTO `sys_region` VALUES ('500300', '市', null, '2', '500000');
INSERT INTO `sys_region` VALUES ('500381', '江津市', null, '3', '500300');
INSERT INTO `sys_region` VALUES ('500382', '合川市', null, '3', '500300');
INSERT INTO `sys_region` VALUES ('500383', '永川市', null, '3', '500300');
INSERT INTO `sys_region` VALUES ('500384', '南川市', null, '3', '500300');
INSERT INTO `sys_region` VALUES ('510000', '四川省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('510100', '成都市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510101', '市辖区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510104', '锦江区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510105', '青羊区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510106', '金牛区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510107', '武侯区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510108', '成华区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510112', '龙泉驿区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510113', '青白江区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510114', '新都区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510115', '温江区', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510121', '金堂县', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510122', '双流县', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510124', '郫县', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510129', '大邑县', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510131', '蒲江县', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510132', '新津县', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510181', '都江堰市', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510182', '彭州市', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510183', '邛崃市', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510184', '崇州市', null, '3', '510100');
INSERT INTO `sys_region` VALUES ('510300', '自贡市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510301', '市辖区', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510302', '自流井区', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510303', '贡井区', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510304', '大安区', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510311', '沿滩区', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510321', '荣县', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510322', '富顺县', null, '3', '510300');
INSERT INTO `sys_region` VALUES ('510400', '攀枝花市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510401', '市辖区', null, '3', '510400');
INSERT INTO `sys_region` VALUES ('510402', '东区', null, '3', '510400');
INSERT INTO `sys_region` VALUES ('510403', '西区', null, '3', '510400');
INSERT INTO `sys_region` VALUES ('510411', '仁和区', null, '3', '510400');
INSERT INTO `sys_region` VALUES ('510421', '米易县', null, '3', '510400');
INSERT INTO `sys_region` VALUES ('510422', '盐边县', null, '3', '510400');
INSERT INTO `sys_region` VALUES ('510500', '泸州市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510501', '市辖区', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510502', '江阳区', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510503', '纳溪区', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510504', '龙马潭区', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510521', '泸县', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510522', '合江县', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510524', '叙永县', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510525', '古蔺县', null, '3', '510500');
INSERT INTO `sys_region` VALUES ('510600', '德阳市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510601', '市辖区', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510603', '旌阳区', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510623', '中江县', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510626', '罗江县', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510681', '广汉市', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510682', '什邡市', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510683', '绵竹市', null, '3', '510600');
INSERT INTO `sys_region` VALUES ('510700', '绵阳市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510701', '市辖区', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510703', '涪城区', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510704', '游仙区', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510722', '三台县', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510723', '盐亭县', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510724', '安县', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510725', '梓潼县', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510726', '北川羌族自治县', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510727', '平武县', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510781', '江油市', null, '3', '510700');
INSERT INTO `sys_region` VALUES ('510800', '广元市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510801', '市辖区', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510802', '市中区', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510811', '元坝区', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510812', '朝天区', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510821', '旺苍县', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510822', '青川县', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510823', '剑阁县', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510824', '苍溪县', null, '3', '510800');
INSERT INTO `sys_region` VALUES ('510900', '遂宁市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('510901', '市辖区', null, '3', '510900');
INSERT INTO `sys_region` VALUES ('510903', '船山区', null, '3', '510900');
INSERT INTO `sys_region` VALUES ('510904', '安居区', null, '3', '510900');
INSERT INTO `sys_region` VALUES ('510921', '蓬溪县', null, '3', '510900');
INSERT INTO `sys_region` VALUES ('510922', '射洪县', null, '3', '510900');
INSERT INTO `sys_region` VALUES ('510923', '大英县', null, '3', '510900');
INSERT INTO `sys_region` VALUES ('511000', '内江市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511001', '市辖区', null, '3', '511000');
INSERT INTO `sys_region` VALUES ('511002', '市中区', null, '3', '511000');
INSERT INTO `sys_region` VALUES ('511011', '东兴区', null, '3', '511000');
INSERT INTO `sys_region` VALUES ('511024', '威远县', null, '3', '511000');
INSERT INTO `sys_region` VALUES ('511025', '资中县', null, '3', '511000');
INSERT INTO `sys_region` VALUES ('511028', '隆昌县', null, '3', '511000');
INSERT INTO `sys_region` VALUES ('511100', '乐山市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511101', '市辖区', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511102', '市中区', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511111', '沙湾区', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511112', '五通桥区', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511113', '金口河区', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511123', '犍为县', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511124', '井研县', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511126', '夹江县', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511129', '沐川县', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511132', '峨边彝族自治县', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511133', '马边彝族自治县', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511181', '峨眉山市', null, '3', '511100');
INSERT INTO `sys_region` VALUES ('511300', '南充市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511301', '市辖区', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511302', '顺庆区', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511303', '高坪区', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511304', '嘉陵区', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511321', '南部县', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511322', '营山县', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511323', '蓬安县', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511324', '仪陇县', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511325', '西充县', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511381', '阆中市', null, '3', '511300');
INSERT INTO `sys_region` VALUES ('511400', '眉山市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511401', '市辖区', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511402', '东坡区', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511421', '仁寿县', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511422', '彭山县', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511423', '洪雅县', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511424', '丹棱县', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511425', '青神县', null, '3', '511400');
INSERT INTO `sys_region` VALUES ('511500', '宜宾市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511501', '市辖区', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511502', '翠屏区', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511521', '宜宾县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511522', '南溪县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511523', '江安县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511524', '长宁县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511525', '高县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511526', '珙县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511527', '筠连县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511528', '兴文县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511529', '屏山县', null, '3', '511500');
INSERT INTO `sys_region` VALUES ('511600', '广安市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511601', '市辖区', null, '3', '511600');
INSERT INTO `sys_region` VALUES ('511602', '广安区', null, '3', '511600');
INSERT INTO `sys_region` VALUES ('511621', '岳池县', null, '3', '511600');
INSERT INTO `sys_region` VALUES ('511622', '武胜县', null, '3', '511600');
INSERT INTO `sys_region` VALUES ('511623', '邻水县', null, '3', '511600');
INSERT INTO `sys_region` VALUES ('511681', '华蓥市', null, '3', '511600');
INSERT INTO `sys_region` VALUES ('511700', '达州市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511701', '市辖区', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511702', '通川区', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511721', '达县', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511722', '宣汉县', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511723', '开江县', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511724', '大竹县', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511725', '渠县', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511781', '万源市', null, '3', '511700');
INSERT INTO `sys_region` VALUES ('511800', '雅安市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511801', '市辖区', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511802', '雨城区', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511821', '名山县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511822', '荥经县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511823', '汉源县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511824', '石棉县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511825', '天全县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511826', '芦山县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511827', '宝兴县', null, '3', '511800');
INSERT INTO `sys_region` VALUES ('511900', '巴中市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('511901', '市辖区', null, '3', '511900');
INSERT INTO `sys_region` VALUES ('511902', '巴州区', null, '3', '511900');
INSERT INTO `sys_region` VALUES ('511921', '通江县', null, '3', '511900');
INSERT INTO `sys_region` VALUES ('511922', '南江县', null, '3', '511900');
INSERT INTO `sys_region` VALUES ('511923', '平昌县', null, '3', '511900');
INSERT INTO `sys_region` VALUES ('512000', '资阳市', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('512001', '市辖区', null, '3', '512000');
INSERT INTO `sys_region` VALUES ('512002', '雁江区', null, '3', '512000');
INSERT INTO `sys_region` VALUES ('512021', '安岳县', null, '3', '512000');
INSERT INTO `sys_region` VALUES ('512022', '乐至县', null, '3', '512000');
INSERT INTO `sys_region` VALUES ('512081', '简阳市', null, '3', '512000');
INSERT INTO `sys_region` VALUES ('513200', '阿坝藏族羌族自治州', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('513221', '汶川县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513222', '理县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513223', '茂县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513224', '松潘县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513225', '九寨沟县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513226', '金川县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513227', '小金县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513228', '黑水县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513229', '马尔康县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513230', '壤塘县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513231', '阿坝县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513232', '若尔盖县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513233', '红原县', null, '3', '513200');
INSERT INTO `sys_region` VALUES ('513300', '甘孜藏族自治州', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('513321', '康定县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513322', '泸定县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513323', '丹巴县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513324', '九龙县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513325', '雅江县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513326', '道孚县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513327', '炉霍县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513328', '甘孜县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513329', '新龙县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513330', '德格县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513331', '白玉县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513332', '石渠县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513333', '色达县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513334', '理塘县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513335', '巴塘县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513336', '乡城县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513337', '稻城县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513338', '得荣县', null, '3', '513300');
INSERT INTO `sys_region` VALUES ('513400', '凉山彝族自治州', null, '2', '510000');
INSERT INTO `sys_region` VALUES ('513401', '西昌市', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513422', '木里藏族自治县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513423', '盐源县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513424', '德昌县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513425', '会理县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513426', '会东县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513427', '宁南县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513428', '普格县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513429', '布拖县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513430', '金阳县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513431', '昭觉县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513432', '喜德县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513433', '冕宁县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513434', '越西县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513435', '甘洛县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513436', '美姑县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('513437', '雷波县', null, '3', '513400');
INSERT INTO `sys_region` VALUES ('520000', '贵州省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('520100', '贵阳市', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('520101', '市辖区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520102', '南明区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520103', '云岩区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520111', '花溪区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520112', '乌当区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520113', '白云区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520114', '小河区', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520121', '开阳县', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520122', '息烽县', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520123', '修文县', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520181', '清镇市', null, '3', '520100');
INSERT INTO `sys_region` VALUES ('520200', '六盘水市', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('520201', '钟山区', null, '3', '520200');
INSERT INTO `sys_region` VALUES ('520203', '六枝特区', null, '3', '520200');
INSERT INTO `sys_region` VALUES ('520221', '水城县', null, '3', '520200');
INSERT INTO `sys_region` VALUES ('520222', '盘县', null, '3', '520200');
INSERT INTO `sys_region` VALUES ('520300', '遵义市', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('520301', '市辖区', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520302', '红花岗区', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520303', '汇川区', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520321', '遵义县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520322', '桐梓县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520323', '绥阳县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520324', '正安县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520325', '道真仡佬族苗族自治县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520326', '务川仡佬族苗族自治县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520327', '凤冈县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520328', '湄潭县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520329', '余庆县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520330', '习水县', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520381', '赤水市', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520382', '仁怀市', null, '3', '520300');
INSERT INTO `sys_region` VALUES ('520400', '安顺市', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('520401', '市辖区', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('520402', '西秀区', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('520421', '平坝县', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('520422', '普定县', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('520423', '镇宁布依族苗族自治县', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('520424', '关岭布依族苗族自治县', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('520425', '紫云苗族布依族自治县', null, '3', '520400');
INSERT INTO `sys_region` VALUES ('522200', '铜仁地区', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('522201', '铜仁市', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522222', '江口县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522223', '玉屏侗族自治县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522224', '石阡县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522225', '思南县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522226', '印江土家族苗族自治县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522227', '德江县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522228', '沿河土家族自治县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522229', '松桃苗族自治县', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522230', '万山特区', null, '3', '522200');
INSERT INTO `sys_region` VALUES ('522300', '黔西南布依族苗族自治州', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('522301', '兴义市', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522322', '兴仁县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522323', '普安县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522324', '晴隆县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522325', '贞丰县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522326', '望谟县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522327', '册亨县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522328', '安龙县', null, '3', '522300');
INSERT INTO `sys_region` VALUES ('522400', '毕节地区', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('522401', '毕节市', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522422', '大方县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522423', '黔西县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522424', '金沙县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522425', '织金县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522426', '纳雍县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522427', '威宁彝族回族苗族自治县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522428', '赫章县', null, '3', '522400');
INSERT INTO `sys_region` VALUES ('522600', '黔东南苗族侗族自治州', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('522601', '凯里市', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522622', '黄平县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522623', '施秉县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522624', '三穗县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522625', '镇远县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522626', '岑巩县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522627', '天柱县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522628', '锦屏县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522629', '剑河县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522630', '台江县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522631', '黎平县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522632', '榕江县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522633', '从江县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522634', '雷山县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522635', '麻江县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522636', '丹寨县', null, '3', '522600');
INSERT INTO `sys_region` VALUES ('522700', '黔南布依族苗族自治州', null, '2', '520000');
INSERT INTO `sys_region` VALUES ('522701', '都匀市', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522702', '福泉市', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522722', '荔波县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522723', '贵定县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522725', '瓮安县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522726', '独山县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522727', '平塘县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522728', '罗甸县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522729', '长顺县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522730', '龙里县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522731', '惠水县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('522732', '三都水族自治县', null, '3', '522700');
INSERT INTO `sys_region` VALUES ('530000', '云南省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('530100', '昆明市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530101', '市辖区', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530102', '五华区', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530103', '盘龙区', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530111', '官渡区', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530112', '西山区', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530113', '东川区', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530121', '呈贡县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530122', '晋宁县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530124', '富民县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530125', '宜良县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530126', '石林彝族自治县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530127', '嵩明县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530128', '禄劝彝族苗族自治县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530129', '寻甸回族彝族自治县', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530181', '安宁市', null, '3', '530100');
INSERT INTO `sys_region` VALUES ('530300', '曲靖市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530301', '市辖区', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530302', '麒麟区', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530321', '马龙县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530322', '陆良县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530323', '师宗县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530324', '罗平县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530325', '富源县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530326', '会泽县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530328', '沾益县', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530381', '宣威市', null, '3', '530300');
INSERT INTO `sys_region` VALUES ('530400', '玉溪市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530401', '市辖区', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530402', '红塔区', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530421', '江川县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530422', '澄江县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530423', '通海县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530424', '华宁县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530425', '易门县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530426', '峨山彝族自治县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530427', '新平彝族傣族自治县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530428', '元江哈尼族彝族傣族自治县', null, '3', '530400');
INSERT INTO `sys_region` VALUES ('530500', '保山市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530501', '市辖区', null, '3', '530500');
INSERT INTO `sys_region` VALUES ('530502', '隆阳区', null, '3', '530500');
INSERT INTO `sys_region` VALUES ('530521', '施甸县', null, '3', '530500');
INSERT INTO `sys_region` VALUES ('530522', '腾冲县', null, '3', '530500');
INSERT INTO `sys_region` VALUES ('530523', '龙陵县', null, '3', '530500');
INSERT INTO `sys_region` VALUES ('530524', '昌宁县', null, '3', '530500');
INSERT INTO `sys_region` VALUES ('530600', '昭通市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530601', '市辖区', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530602', '昭阳区', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530621', '鲁甸县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530622', '巧家县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530623', '盐津县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530624', '大关县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530625', '永善县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530626', '绥江县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530627', '镇雄县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530628', '彝良县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530629', '威信县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530630', '水富县', null, '3', '530600');
INSERT INTO `sys_region` VALUES ('530700', '丽江市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530701', '市辖区', null, '3', '530700');
INSERT INTO `sys_region` VALUES ('530702', '古城区', null, '3', '530700');
INSERT INTO `sys_region` VALUES ('530721', '玉龙纳西族自治县', null, '3', '530700');
INSERT INTO `sys_region` VALUES ('530722', '永胜县', null, '3', '530700');
INSERT INTO `sys_region` VALUES ('530723', '华坪县', null, '3', '530700');
INSERT INTO `sys_region` VALUES ('530724', '宁蒗彝族自治县', null, '3', '530700');
INSERT INTO `sys_region` VALUES ('530800', '思茅市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530801', '市辖区', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530802', '翠云区', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530821', '普洱哈尼族彝族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530822', '墨江哈尼族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530823', '景东彝族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530824', '景谷傣族彝族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530826', '江城哈尼族彝族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530827', '孟连傣族拉祜族佤族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530828', '澜沧拉祜族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530829', '西盟佤族自治县', null, '3', '530800');
INSERT INTO `sys_region` VALUES ('530900', '临沧市', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('530901', '市辖区', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530902', '临翔区', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530921', '凤庆县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530922', '云县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530923', '永德县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530924', '镇康县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530926', '耿马傣族佤族自治县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('530927', '沧源佤族自治县', null, '3', '530900');
INSERT INTO `sys_region` VALUES ('532300', '楚雄彝族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('532301', '楚雄市', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532322', '双柏县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532323', '牟定县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532324', '南华县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532325', '姚安县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532326', '大姚县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532327', '永仁县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532328', '元谋县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532329', '武定县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532331', '禄丰县', null, '3', '532300');
INSERT INTO `sys_region` VALUES ('532500', '红河哈尼族彝族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('532501', '个旧市', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532502', '开远市', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532522', '蒙自县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532523', '屏边苗族自治县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532524', '建水县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532525', '石屏县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532526', '弥勒县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532527', '泸西县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532528', '元阳县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532529', '红河县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532530', '金平苗族瑶族傣族自治县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532531', '绿春县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532532', '河口瑶族自治县', null, '3', '532500');
INSERT INTO `sys_region` VALUES ('532600', '文山壮族苗族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('532621', '文山县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532622', '砚山县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532623', '西畴县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532624', '麻栗坡县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532625', '马关县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532626', '丘北县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532627', '广南县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532628', '富宁县', null, '3', '532600');
INSERT INTO `sys_region` VALUES ('532800', '西双版纳傣族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('532801', '景洪市', null, '3', '532800');
INSERT INTO `sys_region` VALUES ('532822', '勐海县', null, '3', '532800');
INSERT INTO `sys_region` VALUES ('532823', '勐腊县', null, '3', '532800');
INSERT INTO `sys_region` VALUES ('532900', '大理白族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('532901', '大理市', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532922', '漾濞彝族自治县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532923', '祥云县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532924', '宾川县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532925', '弥渡县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532926', '南涧彝族自治县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532927', '巍山彝族回族自治县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532928', '永平县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532929', '云龙县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532930', '洱源县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532931', '剑川县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('532932', '鹤庆县', null, '3', '532900');
INSERT INTO `sys_region` VALUES ('533100', '德宏傣族景颇族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('533102', '瑞丽市', null, '3', '533100');
INSERT INTO `sys_region` VALUES ('533103', '潞西市', null, '3', '533100');
INSERT INTO `sys_region` VALUES ('533122', '梁河县', null, '3', '533100');
INSERT INTO `sys_region` VALUES ('533123', '盈江县', null, '3', '533100');
INSERT INTO `sys_region` VALUES ('533124', '陇川县', null, '3', '533100');
INSERT INTO `sys_region` VALUES ('533300', '怒江傈僳族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('533321', '泸水县', null, '3', '533300');
INSERT INTO `sys_region` VALUES ('533323', '福贡县', null, '3', '533300');
INSERT INTO `sys_region` VALUES ('533324', '贡山独龙族怒族自治县', null, '3', '533300');
INSERT INTO `sys_region` VALUES ('533325', '兰坪白族普米族自治县', null, '3', '533300');
INSERT INTO `sys_region` VALUES ('533400', '迪庆藏族自治州', null, '2', '530000');
INSERT INTO `sys_region` VALUES ('533421', '香格里拉县', null, '3', '533400');
INSERT INTO `sys_region` VALUES ('533422', '德钦县', null, '3', '533400');
INSERT INTO `sys_region` VALUES ('533423', '维西傈僳族自治县', null, '3', '533400');
INSERT INTO `sys_region` VALUES ('540000', '西藏自治区', null, '1', '86');
INSERT INTO `sys_region` VALUES ('540100', '拉萨市', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('540101', '市辖区', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540102', '城关区', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540121', '林周县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540122', '当雄县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540123', '尼木县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540124', '曲水县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540125', '堆龙德庆县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540126', '达孜县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('540127', '墨竹工卡县', null, '3', '540100');
INSERT INTO `sys_region` VALUES ('542100', '昌都地区', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('542121', '昌都县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542122', '江达县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542123', '贡觉县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542124', '类乌齐县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542125', '丁青县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542126', '察雅县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542127', '八宿县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542128', '左贡县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542129', '芒康县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542132', '洛隆县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542133', '边坝县', null, '3', '542100');
INSERT INTO `sys_region` VALUES ('542200', '山南地区', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('542221', '乃东县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542222', '扎囊县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542223', '贡嘎县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542224', '桑日县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542225', '琼结县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542226', '曲松县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542227', '措美县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542228', '洛扎县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542229', '加查县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542231', '隆子县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542232', '错那县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542233', '浪卡子县', null, '3', '542200');
INSERT INTO `sys_region` VALUES ('542300', '日喀则地区', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('542301', '日喀则市', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542322', '南木林县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542323', '江孜县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542324', '定日县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542325', '萨迦县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542326', '拉孜县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542327', '昂仁县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542328', '谢通门县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542329', '白朗县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542330', '仁布县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542331', '康马县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542332', '定结县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542333', '仲巴县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542334', '亚东县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542335', '吉隆县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542336', '聂拉木县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542337', '萨嘎县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542338', '岗巴县', null, '3', '542300');
INSERT INTO `sys_region` VALUES ('542400', '那曲地区', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('542421', '那曲县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542422', '嘉黎县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542423', '比如县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542424', '聂荣县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542425', '安多县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542426', '申扎县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542427', '索县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542428', '班戈县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542429', '巴青县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542430', '尼玛县', null, '3', '542400');
INSERT INTO `sys_region` VALUES ('542500', '阿里地区', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('542521', '普兰县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542522', '札达县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542523', '噶尔县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542524', '日土县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542525', '革吉县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542526', '改则县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542527', '措勤县', null, '3', '542500');
INSERT INTO `sys_region` VALUES ('542600', '林芝地区', null, '2', '540000');
INSERT INTO `sys_region` VALUES ('542621', '林芝县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('542622', '工布江达县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('542623', '米林县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('542624', '墨脱县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('542625', '波密县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('542626', '察隅县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('542627', '朗县', null, '3', '542600');
INSERT INTO `sys_region` VALUES ('610000', '陕西省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('610100', '西安市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610101', '市辖区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610102', '新城区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610103', '碑林区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610104', '莲湖区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610111', '灞桥区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610112', '未央区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610113', '雁塔区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610114', '阎良区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610115', '临潼区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610116', '长安区', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610122', '蓝田县', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610124', '周至县', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610125', '户县', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610126', '高陵县', null, '3', '610100');
INSERT INTO `sys_region` VALUES ('610200', '铜川市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610201', '市辖区', null, '3', '610200');
INSERT INTO `sys_region` VALUES ('610202', '王益区', null, '3', '610200');
INSERT INTO `sys_region` VALUES ('610203', '印台区', null, '3', '610200');
INSERT INTO `sys_region` VALUES ('610204', '耀州区', null, '3', '610200');
INSERT INTO `sys_region` VALUES ('610222', '宜君县', null, '3', '610200');
INSERT INTO `sys_region` VALUES ('610300', '宝鸡市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610301', '市辖区', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610302', '渭滨区', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610303', '金台区', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610304', '陈仓区', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610322', '凤翔县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610323', '岐山县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610324', '扶风县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610326', '眉县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610327', '陇县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610328', '千阳县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610329', '麟游县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610330', '凤县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610331', '太白县', null, '3', '610300');
INSERT INTO `sys_region` VALUES ('610400', '咸阳市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610401', '市辖区', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610402', '秦都区', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610403', '杨凌区', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610404', '渭城区', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610422', '三原县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610423', '泾阳县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610424', '乾县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610425', '礼泉县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610426', '永寿县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610427', '彬县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610428', '长武县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610429', '旬邑县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610430', '淳化县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610431', '武功县', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610481', '兴平市', null, '3', '610400');
INSERT INTO `sys_region` VALUES ('610500', '渭南市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610501', '市辖区', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610502', '临渭区', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610521', '华县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610522', '潼关县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610523', '大荔县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610524', '合阳县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610525', '澄城县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610526', '蒲城县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610527', '白水县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610528', '富平县', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610581', '韩城市', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610582', '华阴市', null, '3', '610500');
INSERT INTO `sys_region` VALUES ('610600', '延安市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610601', '市辖区', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610602', '宝塔区', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610621', '延长县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610622', '延川县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610623', '子长县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610624', '安塞县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610625', '志丹县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610626', '吴旗县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610627', '甘泉县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610628', '富县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610629', '洛川县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610630', '宜川县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610631', '黄龙县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610632', '黄陵县', null, '3', '610600');
INSERT INTO `sys_region` VALUES ('610700', '汉中市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610701', '市辖区', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610702', '汉台区', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610721', '南郑县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610722', '城固县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610723', '洋县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610724', '西乡县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610725', '勉县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610726', '宁强县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610727', '略阳县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610728', '镇巴县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610729', '留坝县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610730', '佛坪县', null, '3', '610700');
INSERT INTO `sys_region` VALUES ('610800', '榆林市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610801', '市辖区', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610802', '榆阳区', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610821', '神木县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610822', '府谷县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610823', '横山县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610824', '靖边县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610825', '定边县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610826', '绥德县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610827', '米脂县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610828', '佳县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610829', '吴堡县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610830', '清涧县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610831', '子洲县', null, '3', '610800');
INSERT INTO `sys_region` VALUES ('610900', '安康市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('610901', '市辖区', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610902', '汉滨区', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610921', '汉阴县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610922', '石泉县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610923', '宁陕县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610924', '紫阳县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610925', '岚皋县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610926', '平利县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610927', '镇坪县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610928', '旬阳县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('610929', '白河县', null, '3', '610900');
INSERT INTO `sys_region` VALUES ('611000', '商洛市', null, '2', '610000');
INSERT INTO `sys_region` VALUES ('611001', '市辖区', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611002', '商州区', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611021', '洛南县', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611022', '丹凤县', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611023', '商南县', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611024', '山阳县', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611025', '镇安县', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('611026', '柞水县', null, '3', '611000');
INSERT INTO `sys_region` VALUES ('620000', '甘肃省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('620100', '兰州市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620101', '市辖区', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620102', '城关区', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620103', '七里河区', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620104', '西固区', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620105', '安宁区', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620111', '红古区', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620121', '永登县', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620122', '皋兰县', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620123', '榆中县', null, '3', '620100');
INSERT INTO `sys_region` VALUES ('620200', '嘉峪关市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620201', '市辖区', null, '3', '620200');
INSERT INTO `sys_region` VALUES ('620300', '金昌市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620301', '市辖区', null, '3', '620300');
INSERT INTO `sys_region` VALUES ('620302', '金川区', null, '3', '620300');
INSERT INTO `sys_region` VALUES ('620321', '永昌县', null, '3', '620300');
INSERT INTO `sys_region` VALUES ('620400', '白银市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620401', '市辖区', null, '3', '620400');
INSERT INTO `sys_region` VALUES ('620402', '白银区', null, '3', '620400');
INSERT INTO `sys_region` VALUES ('620403', '平川区', null, '3', '620400');
INSERT INTO `sys_region` VALUES ('620421', '靖远县', null, '3', '620400');
INSERT INTO `sys_region` VALUES ('620422', '会宁县', null, '3', '620400');
INSERT INTO `sys_region` VALUES ('620423', '景泰县', null, '3', '620400');
INSERT INTO `sys_region` VALUES ('620500', '天水市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620501', '市辖区', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620502', '秦城区', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620503', '北道区', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620521', '清水县', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620522', '秦安县', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620523', '甘谷县', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620524', '武山县', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620525', '张家川回族自治县', null, '3', '620500');
INSERT INTO `sys_region` VALUES ('620600', '武威市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620601', '市辖区', null, '3', '620600');
INSERT INTO `sys_region` VALUES ('620602', '凉州区', null, '3', '620600');
INSERT INTO `sys_region` VALUES ('620621', '民勤县', null, '3', '620600');
INSERT INTO `sys_region` VALUES ('620622', '古浪县', null, '3', '620600');
INSERT INTO `sys_region` VALUES ('620623', '天祝藏族自治县', null, '3', '620600');
INSERT INTO `sys_region` VALUES ('620700', '张掖市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620701', '市辖区', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620702', '甘州区', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620721', '肃南裕固族自治县', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620722', '民乐县', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620723', '临泽县', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620724', '高台县', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620725', '山丹县', null, '3', '620700');
INSERT INTO `sys_region` VALUES ('620800', '平凉市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620801', '市辖区', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620802', '崆峒区', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620821', '泾川县', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620822', '灵台县', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620823', '崇信县', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620824', '华亭县', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620825', '庄浪县', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620826', '静宁县', null, '3', '620800');
INSERT INTO `sys_region` VALUES ('620900', '酒泉市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('620901', '市辖区', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620902', '肃州区', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620921', '金塔县', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620922', '安西县', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620923', '肃北蒙古族自治县', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620924', '阿克塞哈萨克族自治县', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620981', '玉门市', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('620982', '敦煌市', null, '3', '620900');
INSERT INTO `sys_region` VALUES ('621000', '庆阳市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('621001', '市辖区', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621002', '西峰区', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621021', '庆城县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621022', '环县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621023', '华池县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621024', '合水县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621025', '正宁县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621026', '宁县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621027', '镇原县', null, '3', '621000');
INSERT INTO `sys_region` VALUES ('621100', '定西市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('621101', '市辖区', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621102', '安定区', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621121', '通渭县', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621122', '陇西县', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621123', '渭源县', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621124', '临洮县', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621125', '漳县', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621126', '岷县', null, '3', '621100');
INSERT INTO `sys_region` VALUES ('621200', '陇南市', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('621201', '市辖区', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621202', '武都区', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621221', '成县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621222', '文县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621223', '宕昌县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621224', '康县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621225', '西和县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621226', '礼县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621227', '徽县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('621228', '两当县', null, '3', '621200');
INSERT INTO `sys_region` VALUES ('622900', '临夏回族自治州', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('622901', '临夏市', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622921', '临夏县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622922', '康乐县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622923', '永靖县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622924', '广河县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622925', '和政县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622926', '东乡族自治县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', null, '3', '622900');
INSERT INTO `sys_region` VALUES ('623000', '甘南藏族自治州', null, '2', '620000');
INSERT INTO `sys_region` VALUES ('623001', '合作市', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623021', '临潭县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623022', '卓尼县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623023', '舟曲县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623024', '迭部县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623025', '玛曲县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623026', '碌曲县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('623027', '夏河县', null, '3', '623000');
INSERT INTO `sys_region` VALUES ('630000', '青海省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('630100', '西宁市', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('630101', '市辖区', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630102', '城东区', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630103', '城中区', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630104', '城西区', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630105', '城北区', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630121', '大通回族土族自治县', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630122', '湟中县', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('630123', '湟源县', null, '3', '630100');
INSERT INTO `sys_region` VALUES ('632100', '海东地区', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632121', '平安县', null, '3', '632100');
INSERT INTO `sys_region` VALUES ('632122', '民和回族土族自治县', null, '3', '632100');
INSERT INTO `sys_region` VALUES ('632123', '乐都县', null, '3', '632100');
INSERT INTO `sys_region` VALUES ('632126', '互助土族自治县', null, '3', '632100');
INSERT INTO `sys_region` VALUES ('632127', '化隆回族自治县', null, '3', '632100');
INSERT INTO `sys_region` VALUES ('632128', '循化撒拉族自治县', null, '3', '632100');
INSERT INTO `sys_region` VALUES ('632200', '海北藏族自治州', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632221', '门源回族自治县', null, '3', '632200');
INSERT INTO `sys_region` VALUES ('632222', '祁连县', null, '3', '632200');
INSERT INTO `sys_region` VALUES ('632223', '海晏县', null, '3', '632200');
INSERT INTO `sys_region` VALUES ('632224', '刚察县', null, '3', '632200');
INSERT INTO `sys_region` VALUES ('632300', '黄南藏族自治州', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632321', '同仁县', null, '3', '632300');
INSERT INTO `sys_region` VALUES ('632322', '尖扎县', null, '3', '632300');
INSERT INTO `sys_region` VALUES ('632323', '泽库县', null, '3', '632300');
INSERT INTO `sys_region` VALUES ('632324', '河南蒙古族自治县', null, '3', '632300');
INSERT INTO `sys_region` VALUES ('632500', '海南藏族自治州', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632521', '共和县', null, '3', '632500');
INSERT INTO `sys_region` VALUES ('632522', '同德县', null, '3', '632500');
INSERT INTO `sys_region` VALUES ('632523', '贵德县', null, '3', '632500');
INSERT INTO `sys_region` VALUES ('632524', '兴海县', null, '3', '632500');
INSERT INTO `sys_region` VALUES ('632525', '贵南县', null, '3', '632500');
INSERT INTO `sys_region` VALUES ('632600', '果洛藏族自治州', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632621', '玛沁县', null, '3', '632600');
INSERT INTO `sys_region` VALUES ('632622', '班玛县', null, '3', '632600');
INSERT INTO `sys_region` VALUES ('632623', '甘德县', null, '3', '632600');
INSERT INTO `sys_region` VALUES ('632624', '达日县', null, '3', '632600');
INSERT INTO `sys_region` VALUES ('632625', '久治县', null, '3', '632600');
INSERT INTO `sys_region` VALUES ('632626', '玛多县', null, '3', '632600');
INSERT INTO `sys_region` VALUES ('632700', '玉树藏族自治州', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632721', '玉树县', null, '3', '632700');
INSERT INTO `sys_region` VALUES ('632722', '杂多县', null, '3', '632700');
INSERT INTO `sys_region` VALUES ('632723', '称多县', null, '3', '632700');
INSERT INTO `sys_region` VALUES ('632724', '治多县', null, '3', '632700');
INSERT INTO `sys_region` VALUES ('632725', '囊谦县', null, '3', '632700');
INSERT INTO `sys_region` VALUES ('632726', '曲麻莱县', null, '3', '632700');
INSERT INTO `sys_region` VALUES ('632800', '海西蒙古族藏族自治州', null, '2', '630000');
INSERT INTO `sys_region` VALUES ('632801', '格尔木市', null, '3', '632800');
INSERT INTO `sys_region` VALUES ('632802', '德令哈市', null, '3', '632800');
INSERT INTO `sys_region` VALUES ('632821', '乌兰县', null, '3', '632800');
INSERT INTO `sys_region` VALUES ('632822', '都兰县', null, '3', '632800');
INSERT INTO `sys_region` VALUES ('632823', '天峻县', null, '3', '632800');
INSERT INTO `sys_region` VALUES ('640000', '宁夏回族自治区', null, '1', '86');
INSERT INTO `sys_region` VALUES ('640100', '银川市', null, '2', '640000');
INSERT INTO `sys_region` VALUES ('640101', '市辖区', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640104', '兴庆区', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640105', '西夏区', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640106', '金凤区', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640121', '永宁县', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640122', '贺兰县', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640181', '灵武市', null, '3', '640100');
INSERT INTO `sys_region` VALUES ('640200', '石嘴山市', null, '2', '640000');
INSERT INTO `sys_region` VALUES ('640201', '市辖区', null, '3', '640200');
INSERT INTO `sys_region` VALUES ('640202', '大武口区', null, '3', '640200');
INSERT INTO `sys_region` VALUES ('640205', '惠农区', null, '3', '640200');
INSERT INTO `sys_region` VALUES ('640221', '平罗县', null, '3', '640200');
INSERT INTO `sys_region` VALUES ('640300', '吴忠市', null, '2', '640000');
INSERT INTO `sys_region` VALUES ('640301', '市辖区', null, '3', '640300');
INSERT INTO `sys_region` VALUES ('640302', '利通区', null, '3', '640300');
INSERT INTO `sys_region` VALUES ('640323', '盐池县', null, '3', '640300');
INSERT INTO `sys_region` VALUES ('640324', '同心县', null, '3', '640300');
INSERT INTO `sys_region` VALUES ('640381', '青铜峡市', null, '3', '640300');
INSERT INTO `sys_region` VALUES ('640400', '固原市', null, '2', '640000');
INSERT INTO `sys_region` VALUES ('640401', '市辖区', null, '3', '640400');
INSERT INTO `sys_region` VALUES ('640402', '原州区', null, '3', '640400');
INSERT INTO `sys_region` VALUES ('640422', '西吉县', null, '3', '640400');
INSERT INTO `sys_region` VALUES ('640423', '隆德县', null, '3', '640400');
INSERT INTO `sys_region` VALUES ('640424', '泾源县', null, '3', '640400');
INSERT INTO `sys_region` VALUES ('640425', '彭阳县', null, '3', '640400');
INSERT INTO `sys_region` VALUES ('640500', '中卫市', null, '2', '640000');
INSERT INTO `sys_region` VALUES ('640501', '市辖区', null, '3', '640500');
INSERT INTO `sys_region` VALUES ('640502', '沙坡头区', null, '3', '640500');
INSERT INTO `sys_region` VALUES ('640521', '中宁县', null, '3', '640500');
INSERT INTO `sys_region` VALUES ('640522', '海原县', null, '3', '640500');
INSERT INTO `sys_region` VALUES ('650000', '新疆维吾尔自治区', null, '1', '86');
INSERT INTO `sys_region` VALUES ('650100', '乌鲁木齐市', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('650101', '市辖区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650102', '天山区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650103', '沙依巴克区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650104', '新市区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650105', '水磨沟区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650106', '头屯河区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650107', '达坂城区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650108', '东山区', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650121', '乌鲁木齐县', null, '3', '650100');
INSERT INTO `sys_region` VALUES ('650200', '克拉玛依市', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('650201', '市辖区', null, '3', '650200');
INSERT INTO `sys_region` VALUES ('650202', '独山子区', null, '3', '650200');
INSERT INTO `sys_region` VALUES ('650203', '克拉玛依区', null, '3', '650200');
INSERT INTO `sys_region` VALUES ('650204', '白碱滩区', null, '3', '650200');
INSERT INTO `sys_region` VALUES ('650205', '乌尔禾区', null, '3', '650200');
INSERT INTO `sys_region` VALUES ('652100', '吐鲁番地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('652101', '吐鲁番市', null, '3', '652100');
INSERT INTO `sys_region` VALUES ('652122', '鄯善县', null, '3', '652100');
INSERT INTO `sys_region` VALUES ('652123', '托克逊县', null, '3', '652100');
INSERT INTO `sys_region` VALUES ('652200', '哈密地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('652201', '哈密市', null, '3', '652200');
INSERT INTO `sys_region` VALUES ('652222', '巴里坤哈萨克自治县', null, '3', '652200');
INSERT INTO `sys_region` VALUES ('652223', '伊吾县', null, '3', '652200');
INSERT INTO `sys_region` VALUES ('652300', '昌吉回族自治州', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('652301', '昌吉市', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652302', '阜康市', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652303', '米泉市', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652323', '呼图壁县', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652324', '玛纳斯县', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652325', '奇台县', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652327', '吉木萨尔县', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652328', '木垒哈萨克自治县', null, '3', '652300');
INSERT INTO `sys_region` VALUES ('652700', '博尔塔拉蒙古自治州', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('652701', '博乐市', null, '3', '652700');
INSERT INTO `sys_region` VALUES ('652722', '精河县', null, '3', '652700');
INSERT INTO `sys_region` VALUES ('652723', '温泉县', null, '3', '652700');
INSERT INTO `sys_region` VALUES ('652800', '巴音郭楞蒙古自治州', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('652801', '库尔勒市', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652822', '轮台县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652823', '尉犁县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652824', '若羌县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652825', '且末县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652826', '焉耆回族自治县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652827', '和静县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652828', '和硕县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652829', '博湖县', null, '3', '652800');
INSERT INTO `sys_region` VALUES ('652900', '阿克苏地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('652901', '阿克苏市', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652922', '温宿县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652923', '库车县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652924', '沙雅县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652925', '新和县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652926', '拜城县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652927', '乌什县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652928', '阿瓦提县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('652929', '柯坪县', null, '3', '652900');
INSERT INTO `sys_region` VALUES ('653000', '克孜勒苏柯尔克孜自治州', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('653001', '阿图什市', null, '3', '653000');
INSERT INTO `sys_region` VALUES ('653022', '阿克陶县', null, '3', '653000');
INSERT INTO `sys_region` VALUES ('653023', '阿合奇县', null, '3', '653000');
INSERT INTO `sys_region` VALUES ('653024', '乌恰县', null, '3', '653000');
INSERT INTO `sys_region` VALUES ('653100', '喀什地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('653101', '喀什市', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653121', '疏附县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653122', '疏勒县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653123', '英吉沙县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653124', '泽普县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653125', '莎车县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653126', '叶城县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653127', '麦盖提县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653128', '岳普湖县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653129', '伽师县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653130', '巴楚县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653131', '塔什库尔干塔吉克自治县', null, '3', '653100');
INSERT INTO `sys_region` VALUES ('653200', '和田地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('653201', '和田市', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653221', '和田县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653222', '墨玉县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653223', '皮山县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653224', '洛浦县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653225', '策勒县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653226', '于田县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('653227', '民丰县', null, '3', '653200');
INSERT INTO `sys_region` VALUES ('654000', '伊犁哈萨克自治州', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('654002', '伊宁市', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654003', '奎屯市', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654021', '伊宁县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654022', '察布查尔锡伯自治县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654023', '霍城县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654024', '巩留县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654025', '新源县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654026', '昭苏县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654027', '特克斯县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654028', '尼勒克县', null, '3', '654000');
INSERT INTO `sys_region` VALUES ('654200', '塔城地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('654201', '塔城市', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654202', '乌苏市', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654221', '额敏县', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654223', '沙湾县', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654224', '托里县', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654225', '裕民县', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654226', '和布克赛尔蒙古自治县', null, '3', '654200');
INSERT INTO `sys_region` VALUES ('654300', '阿勒泰地区', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('654301', '阿勒泰市', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('654321', '布尔津县', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('654322', '富蕴县', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('654323', '福海县', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('654324', '哈巴河县', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('654325', '青河县', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('654326', '吉木乃县', null, '3', '654300');
INSERT INTO `sys_region` VALUES ('659000', '省直辖行政单位', null, '2', '650000');
INSERT INTO `sys_region` VALUES ('659001', '石河子市', null, '3', '659000');
INSERT INTO `sys_region` VALUES ('659002', '阿拉尔市', null, '3', '659000');
INSERT INTO `sys_region` VALUES ('659003', '图木舒克市', null, '3', '659000');
INSERT INTO `sys_region` VALUES ('659004', '五家渠市', null, '3', '659000');
INSERT INTO `sys_region` VALUES ('710000', '台湾省', null, '1', '86');
INSERT INTO `sys_region` VALUES ('810000', '香港特别行政区', null, '1', '86');
INSERT INTO `sys_region` VALUES ('820000', '澳门特别行政区', null, '1', '86');

-- ----------------------------
-- Table structure for `sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` text,
  `parent_id` bigint(20) DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sys_resource_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', 'SYSTEM_MANAGE', '系统管理', '1', '系统管理', null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('2', 'SYSTEM_COMPANY_MANAGE', '公司管理', '1', '公司管理', '1', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('3', 'SYSTEM_ORGANIZATION_MANAGE', '机构管理', '2', '机构管理', '1', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('4', 'SYSTEM_USER_MANAGE', '人员管理', '3', '人员管理', '1', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('5', 'SYSTEM_ROLE_MANAGE', '角色管理', '4', '角色管理', '1', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('6', 'INFO_CENTER', '信息中心', '2', '信息中心', null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('7', 'INFO_SYSTEM_MANAGE', '体系管理', '1', '体系管理', '6', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('8', 'INFO_TEMPLATE_MANAGE', '模板管理', '2', '模板管理', '6', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('9', 'INFO_KNOWLEDGE_MANAGE', '知识管理', '3', '知识管理', '6', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('10', 'DOC_MANAGE', '文档管理', '3', '文档管理', null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('11', 'DOC_MY', '我的文档', '1', '我的文档', '10', null, null, null, null);
INSERT INTO `sys_resource` VALUES ('12', 'DOC_ALL', '所有文档', '2', '所有文档', '10', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`),
  CONSTRAINT `sys_role_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_permission` (`role_id`,`permission_id`) USING BTREE,
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `identification` varchar(128) DEFAULT NULL,
  `realname` varchar(200) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `qq` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '14e1b600b1fd579f47433b88e8d85291', null, '管理员', '0', '2f25fa80-257c-11e7-8da9-3dd37c081450', null, null, '123@qq.com', '2017-03-01', '15874263698', null, null, '0', '0', '1', '2017-02-28 15:51:32', '1', '2017-04-20 11:48:16');

-- ----------------------------
-- Table structure for `sys_user_company`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_company`;
CREATE TABLE `sys_user_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sys_user_company_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_user_company_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_company
-- ----------------------------
INSERT INTO `sys_user_company` VALUES ('1', '1', '1', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_user_import`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_import`;
CREATE TABLE `sys_user_import` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_import
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_import_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_import_item`;
CREATE TABLE `sys_user_import_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `orgs` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `realname` varchar(200) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `birthday` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `result` varchar(64) NOT NULL,
  `msg` text,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  CONSTRAINT `sys_user_import_item_ibfk_1` FOREIGN KEY (`import_id`) REFERENCES `sys_user_import` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_import_item
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_organization`;
CREATE TABLE `sys_user_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `organization_id` bigint(20) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `sys_user_organization_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_user_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_organization
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role` (`user_id`,`role_id`) USING BTREE,
  KEY `role_id` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

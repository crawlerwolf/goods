/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2022-03-17 12:44:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application_application
-- ----------------------------
DROP TABLE IF EXISTS `application_application`;
CREATE TABLE `application_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) NOT NULL,
  `good_type` varchar(255) NOT NULL,
  `good_num` int(11) NOT NULL,
  `good_use` varchar(255) NOT NULL,
  `application_department` varchar(255) NOT NULL,
  `application_date` date NOT NULL,
  `application_mark` varchar(255) DEFAULT NULL,
  `receive_department` varchar(255) DEFAULT NULL,
  `receive_date` date DEFAULT NULL,
  `divide_mark` varchar(255) DEFAULT NULL,
  `application_user_id` int(11) DEFAULT NULL,
  `divide_use_id` int(11) DEFAULT NULL,
  `receive_user_id` int(11) DEFAULT NULL,
  `is_purchase` tinyint(1) DEFAULT NULL,
  `is_reach` tinyint(1) DEFAULT NULL,
  `is_receive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_application_receive_user_id_68365522_fk_auth_user_id` (`receive_user_id`),
  KEY `application_application_divide_use_id_3d0fbe09_fk_auth_user_id` (`divide_use_id`),
  KEY `application_applicat_application_user_id_2253cc1c_fk_auth_user` (`application_user_id`),
  CONSTRAINT `application_applicat_application_user_id_2253cc1c_fk_auth_user` FOREIGN KEY (`application_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `application_application_divide_use_id_3d0fbe09_fk_auth_user_id` FOREIGN KEY (`divide_use_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `application_application_receive_user_id_68365522_fk_auth_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application_application
-- ----------------------------
INSERT INTO `application_application` VALUES ('2', 'A4打印纸', '包', '11', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-17', null, '2', '4', '2', '1', '1', '1');
INSERT INTO `application_application` VALUES ('3', 'A4打印纸', '包', '1', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-17', null, '2', '4', '2', '1', '1', '1');
INSERT INTO `application_application` VALUES ('4', 'A4打印纸', '包', '1', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-17', null, '3', '4', '3', '1', '1', '1');
INSERT INTO `application_application` VALUES ('5', 'A4打印纸', '包', '10', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-17', null, '3', '4', '3', '1', '1', '1');
INSERT INTO `application_application` VALUES ('6', 'A4打印纸', '包', '1', '打印', '采购部', '2022-03-16', null, '采购部', '2022-03-17', null, '2', '4', '2', '1', '1', '1');
INSERT INTO `application_application` VALUES ('7', '机械硬盘', '1TB', '5', '扩容', '研发', '2022-03-17', null, '研发', '2022-03-17', null, '3', '4', '3', '1', '1', '1');
INSERT INTO `application_application` VALUES ('9', 'A4打印纸', '包', '1', '打印', '分发', '2022-03-17', null, '分发', '2022-03-17', null, '4', '4', '4', '1', '1', '1');
INSERT INTO `application_application` VALUES ('11', 'A4打印纸', '包', '1', '打印', '分发', '2022-03-17', null, '', null, null, '4', null, null, '1', '0', '0');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('2', 'cashier');
INSERT INTO `auth_group` VALUES ('4', 'purchase');
INSERT INTO `auth_group` VALUES ('1', 'staff');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('8', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('7', '1', '28');
INSERT INTO `auth_group_permissions` VALUES ('26', '2', '16');
INSERT INTO `auth_group_permissions` VALUES ('1', '2', '25');
INSERT INTO `auth_group_permissions` VALUES ('2', '2', '26');
INSERT INTO `auth_group_permissions` VALUES ('4', '2', '28');
INSERT INTO `auth_group_permissions` VALUES ('20', '2', '29');
INSERT INTO `auth_group_permissions` VALUES ('24', '2', '31');
INSERT INTO `auth_group_permissions` VALUES ('31', '4', '25');
INSERT INTO `auth_group_permissions` VALUES ('27', '4', '26');
INSERT INTO `auth_group_permissions` VALUES ('28', '4', '28');
INSERT INTO `auth_group_permissions` VALUES ('29', '4', '29');
INSERT INTO `auth_group_permissions` VALUES ('30', '4', '31');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add application', '7', 'add_application');
INSERT INTO `auth_permission` VALUES ('26', 'Can change application', '7', 'change_application');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete application', '7', 'delete_application');
INSERT INTO `auth_permission` VALUES ('28', 'Can view application', '7', 'view_application');
INSERT INTO `auth_permission` VALUES ('29', '导出csv格式数据', '7', 'csv');
INSERT INTO `auth_permission` VALUES ('30', '导出excel格式数据', '7', 'excel');
INSERT INTO `auth_permission` VALUES ('31', '导出json格式数据', '7', 'json');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$260000$hSfRks9gA4hzsvAlvlZPo8$cIhDWZYI3gDm31UFDykPFW017GVacPJv4pzczuW9q8s=', '2022-03-17 12:39:01.486966', '1', 'admin', '', '', 'admin@qq.com', '1', '1', '2022-03-15 09:58:48.851740');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$260000$rkb5sBrAQLMoE3v5kLzHdX$iq+cmRkzvWTn3lEg6UMUN96X+XDIExYq1N93I0BMTH8=', '2022-03-16 16:08:10.977131', '0', 'demo1', '', '', '', '1', '1', '2022-03-15 10:27:00.000000');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$260000$8ectHMID3bJUdUUhoW9MBf$+npTtesrf/A0mby4aWBpFY11kOXYq33sIBcgj+bHooY=', '2022-03-17 12:40:08.297976', '0', 'demo2', '', '', '', '1', '1', '2022-03-15 10:28:00.000000');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$260000$Mm2h6wO9g9mne3r0lkLYVa$sGpcwJFRGs2gMi0kyw9j4U7OOo1DGJyQYivyatmSKps=', '2022-03-17 12:35:09.006412', '0', 'demo3', '', '', '', '1', '1', '2022-03-15 10:28:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES ('1', '2', '1');
INSERT INTO `auth_user_groups` VALUES ('4', '3', '4');
INSERT INTO `auth_user_groups` VALUES ('3', '4', '2');

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2022-03-15 10:25:30.143384', '1', '员工', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2022-03-15 10:26:14.165011', '2', '出纳', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2022-03-15 10:27:47.981546', '2', 'demo1', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2022-03-15 10:28:07.358353', '3', 'demo2', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2022-03-15 10:28:32.965629', '4', 'demo3', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2022-03-15 10:29:03.978644', '2', 'demo1', '2', '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2022-03-15 10:29:15.552062', '3', 'demo2', '2', '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2022-03-15 10:29:25.714214', '4', 'demo3', '2', '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2022-03-15 10:30:51.748778', '1', '员工', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2022-03-15 10:51:11.337790', '1', 'staff', '2', '[{\"changed\": {\"fields\": [\"Name\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2022-03-15 10:51:52.639584', '2', 'cashier', '2', '[{\"changed\": {\"fields\": [\"Name\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2022-03-15 11:29:03.145919', '1', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('13', '2022-03-15 11:34:16.635115', '1', 'A4打印纸', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2022-03-15 11:34:35.440330', '2', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('15', '2022-03-15 11:47:10.386518', '2', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\", \"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('16', '2022-03-15 11:49:10.311907', '3', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('17', '2022-03-15 11:49:26.236629', '3', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('18', '2022-03-15 11:50:59.612895', '3', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('19', '2022-03-15 11:55:28.138588', '1', 'staff', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2022-03-15 11:55:42.948269', '2', 'cashier', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2022-03-15 11:57:22.077171', '1', 'staff', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2022-03-15 12:10:08.590630', '4', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('23', '2022-03-15 12:10:19.578445', '5', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('24', '2022-03-15 13:35:58.528085', '3', 'admin', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2022-03-15 13:36:40.837466', '3', 'admin', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2022-03-15 15:37:04.067762', '2', 'cashier', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2022-03-15 15:37:26.205775', '1', 'staff', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2022-03-15 16:47:49.593026', '1', 'staff', '2', '[]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2022-03-15 16:47:54.427140', '2', 'cashier', '2', '[]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2022-03-15 16:48:05.876621', '3', 'admin', '3', '', '3', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2022-03-15 17:11:02.877999', '2', 'cashier', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2022-03-15 17:11:09.392606', '1', 'staff', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2022-03-16 09:07:37.522995', '2', 'cashier', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2022-03-16 09:07:59.618147', '1', 'staff', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2022-03-16 10:08:42.204368', '5', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\", \"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('36', '2022-03-16 16:16:27.346919', '6', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('37', '2022-03-17 10:07:32.570725', '2', 'cashier', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2022-03-17 10:19:28.767130', '5', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5df2\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('39', '2022-03-17 10:19:42.608569', '3', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5df2\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('40', '2022-03-17 10:19:50.762101', '2', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5df2\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('41', '2022-03-17 10:43:44.147523', '7', '机械硬盘', '1', '[{\"added\": {}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('42', '2022-03-17 10:56:44.771641', '4', 'purchase', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2022-03-17 10:57:01.700577', '3', 'demo2', '2', '[{\"changed\": {\"fields\": [\"Last login\", \"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2022-03-17 10:58:00.276636', '3', 'demo2', '2', '[{\"changed\": {\"fields\": [\"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2022-03-17 10:58:11.881733', '4', 'demo3', '2', '[{\"changed\": {\"fields\": [\"Last login\", \"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2022-03-17 11:13:03.104388', '4', 'purchase', '2', '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2022-03-17 11:18:36.894898', '3', 'demo2', '2', '[{\"changed\": {\"fields\": [\"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2022-03-17 11:18:42.246625', '4', 'demo3', '2', '[{\"changed\": {\"fields\": [\"Last login\", \"Groups\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2022-03-17 11:30:21.021164', '8', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('50', '2022-03-17 11:39:39.589358', '9', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('51', '2022-03-17 11:44:55.394179', '5', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('52', '2022-03-17 11:44:55.510869', '3', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('53', '2022-03-17 11:44:55.879886', '2', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('54', '2022-03-17 11:46:41.191377', '4', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('55', '2022-03-17 11:47:27.558874', '9', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('56', '2022-03-17 11:47:27.764325', '8', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('57', '2022-03-17 11:47:27.906947', '7', '机械硬盘', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('58', '2022-03-17 11:47:27.989726', '6', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('59', '2022-03-17 11:49:55.237516', '8', 'A4打印纸', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2022-03-17 12:14:22.829341', '10', '', '2', '[{\"changed\": {\"fields\": [\"id\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('61', '2022-03-17 12:14:22.933065', '4', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\", \"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('62', '2022-03-17 12:33:57.407188', '6', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('63', '2022-03-17 12:34:53.818879', '7', '机械硬盘', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('64', '2022-03-17 12:36:43.616323', '7', '机械硬盘', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\", \"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('65', '2022-03-17 12:37:19.003064', '6', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\", \"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('66', '2022-03-17 12:37:26.785299', '6', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('67', '2022-03-17 12:38:02.715593', '5', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('68', '2022-03-17 12:38:02.841228', '4', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('69', '2022-03-17 12:38:02.973875', '3', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('70', '2022-03-17 12:38:03.115497', '2', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('71', '2022-03-17 12:38:03.207253', '7', '机械硬盘', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('72', '2022-03-17 12:38:14.532077', '9', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u9886\\u53d6\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('73', '2022-03-17 12:38:34.854927', '9', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u9886\\u7528\\u90e8\\u95e8\", \"\\u9886\\u7528\\u4eba\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('74', '2022-03-17 12:38:50.008550', '11', 'A4打印纸', '1', '[{\"added\": {}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('75', '2022-03-17 12:39:17.129315', '10', '', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2022-03-17 12:39:45.299251', '9', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2022-03-17 12:39:45.432901', '5', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2022-03-17 12:39:45.665281', '4', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2022-03-17 12:39:45.865747', '3', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2022-03-17 12:39:46.067210', '2', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\", \"\\u662f\\u5426\\u6536\\u5230\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2022-03-17 12:39:54.105762', '11', 'A4打印纸', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u8d2d\\u4e70\"]}}]', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'application', 'application');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-03-15 09:56:12.743389');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-03-15 09:56:25.096733');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-03-15 09:56:28.037958');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-03-15 09:56:28.156644');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-03-15 09:56:28.209504');
INSERT INTO `django_migrations` VALUES ('6', 'application', '0001_initial', '2022-03-15 09:56:31.938648');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2022-03-15 09:56:33.046717');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2022-03-15 09:56:34.229589');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2022-03-15 09:56:35.273829');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2022-03-15 09:56:35.384536');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2022-03-15 09:56:36.347990');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2022-03-15 09:56:36.402844');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2022-03-15 09:56:36.450751');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2022-03-15 09:56:37.390234');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2022-03-15 09:56:38.423505');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0010_alter_group_name_max_length', '2022-03-15 09:56:40.117050');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0011_update_proxy_permissions', '2022-03-15 09:56:40.314505');
INSERT INTO `django_migrations` VALUES ('18', 'auth', '0012_alter_user_first_name_max_length', '2022-03-15 09:56:41.665943');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2022-03-15 09:56:42.836835');
INSERT INTO `django_migrations` VALUES ('20', 'application', '0002_auto_20220315_1114', '2022-03-15 11:14:31.037392');
INSERT INTO `django_migrations` VALUES ('21', 'application', '0003_auto_20220315_1128', '2022-03-15 11:28:59.931455');
INSERT INTO `django_migrations` VALUES ('22', 'application', '0004_auto_20220315_1148', '2022-03-15 11:49:02.340036');
INSERT INTO `django_migrations` VALUES ('23', 'application', '0005_alter_application_options', '2022-03-15 15:36:05.377166');
INSERT INTO `django_migrations` VALUES ('24', 'application', '0006_alter_application_options', '2022-03-15 17:10:50.278579');
INSERT INTO `django_migrations` VALUES ('25', 'application', '0007_alter_application_options', '2022-03-16 09:06:51.632202');
INSERT INTO `django_migrations` VALUES ('30', 'application', '0008_auto_20220317_1220', '2022-03-17 12:21:46.323954');
INSERT INTO `django_migrations` VALUES ('31', 'application', '0009_auto_20220317_1236', '2022-03-17 12:36:39.405572');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0pt3hixath22h5li4g5b4r9aeaijg8os', '.eJxVjMsOwiAQRf-FtSG8Cy7d-w0EmBmpGkhKuzL-uzbpQrf3nHNfLKZtrXEbuMQZ2JlpdvrdcioPbDuAe2q3zktv6zJnviv8oINfO-Dzcrh_BzWN-q2lD1QCOCIMlpLPCvVEUkg9WQVChayFMmSskU456SmDQ9ICtAoBi2DvD-CmN38:1nUhvk:KcDZMT-DBBgTR_-u8J_gqFwNtNGff12aXz-CpjBb314', '2022-03-31 12:40:08.357817');
INSERT INTO `django_session` VALUES ('mor27j74czmwsozl9sujnrn7g7dary3a', '.eJxVjMsOwiAQRf-FtSG8Cy7d-w0EmBmpGkhKuzL-uzbpQrf3nHNfLKZtrXEbuMQZ2JlpdvrdcioPbDuAe2q3zktv6zJnviv8oINfO-Dzcrh_BzWN-q2lD1QCOCIMlpLPCvVEUkg9WQVChayFMmSskU456SmDQ9ICtAoBi2DvD-CmN38:1nUfaO:nA-Ye3qm0d6WayU6Taim5kzeWjWSV5emWY9bh-xkGwM', '2022-03-31 10:09:56.399533');

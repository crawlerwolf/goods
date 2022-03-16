/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2022-03-16 15:17:20
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
  `receive_department` varchar(255) NOT NULL,
  `receive_date` date DEFAULT NULL,
  `divide_mark` varchar(255) DEFAULT NULL,
  `application_user_id` int(11) DEFAULT NULL,
  `divide_use_id` int(11) DEFAULT NULL,
  `receive_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_application_receive_user_id_68365522_fk_auth_user_id` (`receive_user_id`),
  KEY `application_application_divide_use_id_3d0fbe09_fk_auth_user_id` (`divide_use_id`),
  KEY `application_applicat_application_user_id_2253cc1c_fk_auth_user` (`application_user_id`),
  CONSTRAINT `application_applicat_application_user_id_2253cc1c_fk_auth_user` FOREIGN KEY (`application_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `application_application_divide_use_id_3d0fbe09_fk_auth_user_id` FOREIGN KEY (`divide_use_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `application_application_receive_user_id_68365522_fk_auth_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application_application
-- ----------------------------
INSERT INTO `application_application` VALUES ('2', 'A4打印纸', '包', '11', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-15', null, '2', '4', '2');
INSERT INTO `application_application` VALUES ('3', 'A4打印纸', '包', '1', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-15', null, '2', '4', '2');
INSERT INTO `application_application` VALUES ('4', 'A4打印纸', '包', '1', '打印', '采购部', '2022-03-15', null, '', null, null, '3', null, null);
INSERT INTO `application_application` VALUES ('5', 'A4打印纸', '包', '10', '打印', '采购部', '2022-03-15', null, '采购部', '2022-03-16', null, '3', '4', '3');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('2', 'cashier');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('8', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('7', '1', '28');
INSERT INTO `auth_group_permissions` VALUES ('1', '2', '25');
INSERT INTO `auth_group_permissions` VALUES ('2', '2', '26');
INSERT INTO `auth_group_permissions` VALUES ('4', '2', '28');
INSERT INTO `auth_group_permissions` VALUES ('20', '2', '29');
INSERT INTO `auth_group_permissions` VALUES ('24', '2', '31');

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
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$260000$hSfRks9gA4hzsvAlvlZPo8$cIhDWZYI3gDm31UFDykPFW017GVacPJv4pzczuW9q8s=', '2022-03-16 11:48:25.177521', '1', 'admin', '', '', 'admin@qq.com', '1', '1', '2022-03-15 09:58:48.851740');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$260000$rkb5sBrAQLMoE3v5kLzHdX$iq+cmRkzvWTn3lEg6UMUN96X+XDIExYq1N93I0BMTH8=', '2022-03-16 14:37:37.526092', '0', 'demo1', '', '', '', '1', '1', '2022-03-15 10:27:00.000000');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$260000$8ectHMID3bJUdUUhoW9MBf$+npTtesrf/A0mby4aWBpFY11kOXYq33sIBcgj+bHooY=', '2022-03-15 12:09:17.505843', '0', 'demo2', '', '', '', '1', '1', '2022-03-15 10:28:00.000000');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$260000$Mm2h6wO9g9mne3r0lkLYVa$sGpcwJFRGs2gMi0kyw9j4U7OOo1DGJyQYivyatmSKps=', '2022-03-16 14:44:20.798734', '0', 'demo3', '', '', '', '1', '1', '2022-03-15 10:28:00.000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES ('1', '2', '1');
INSERT INTO `auth_user_groups` VALUES ('2', '3', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
INSERT INTO `django_session` VALUES ('6p7div2zi46k8l45ht5hrr1zjmchsccd', '.eJxVjEEOwiAQRe_C2hA7wkBduvcMhGEGqRpISrsy3l2bdKHb_977LxXiupSwdpnDxOqsBnX43Simh9QN8D3WW9Op1WWeSG-K3mnX18byvOzu30GJvXxrCx7YOAC0DggsJyOSs7F0PLmcM7Hh0SAmsC56xNEzwuAYORKCkHp_ANUrN-g:1nU2px:yPAsJhB1IZznf8EBG86kLKczeeqHdsOPXH6vl2uQek0', '2022-03-29 16:47:25.901179');
INSERT INTO `django_session` VALUES ('kiftozaw50e64dzpdob9nh9forh8g9wx', '.eJxVjEEOwiAQRe_C2hDaITB16d4zkGEGpGogKe3KeHdt0oVu_3vvv1SgbS1h62kJs6izsur0u0XiR6o7kDvVW9Pc6rrMUe-KPmjX1ybpeTncv4NCvXxryIN1A1gA71M2BsHFnDHDxA6RRWgy7CUBCpFFGOMoxkcE7wgjO_X-ANXMN-Q:1nUNOO:C_Ey3fQk0Ao_98Sd7rHCYMzRklkyLW8TwWG8X6rMKkg', '2022-03-30 14:44:20.857273');

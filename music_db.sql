/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : music_db1

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2020-04-04 22:41:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 歌曲评论', '6', 'add_comment');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 歌曲评论', '6', 'change_comment');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 歌曲评论', '6', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 歌曲动态', '7', 'add_dynamic');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 歌曲动态', '7', 'change_dynamic');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 歌曲动态', '7', 'delete_dynamic');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 歌曲分类', '8', 'add_label');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 歌曲分类', '8', 'change_label');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 歌曲分类', '8', 'delete_label');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 歌曲信息', '9', 'add_song');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 歌曲信息', '9', 'change_song');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 歌曲信息', '9', 'delete_song');
INSERT INTO `auth_permission` VALUES ('28', 'Can add user', '10', 'add_myuser');
INSERT INTO `auth_permission` VALUES ('29', 'Can change user', '10', 'change_myuser');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete user', '10', 'delete_myuser');

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
  KEY `django_admin_log_user_id_c564eba6_fk_user_myuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'index', 'comment');
INSERT INTO `django_content_type` VALUES ('7', 'index', 'dynamic');
INSERT INTO `django_content_type` VALUES ('8', 'index', 'label');
INSERT INTO `django_content_type` VALUES ('9', 'index', 'song');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('10', 'user', 'myuser');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-04-03 02:26:17.770675');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-04-03 02:26:19.306952');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-04-03 02:26:23.355890');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-04-03 02:26:24.097107');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-04-03 02:26:24.160410');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-04-03 02:26:24.218670');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-04-03 02:26:24.269021');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-04-03 02:26:24.306547');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-04-03 02:26:24.350040');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-04-03 02:26:24.426036');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-04-03 02:26:24.470034');
INSERT INTO `django_migrations` VALUES ('12', 'user', '0001_initial', '2020-04-03 02:26:29.007576');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2020-04-03 02:26:30.881649');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2020-04-03 02:26:30.958844');
INSERT INTO `django_migrations` VALUES ('15', 'index', '0001_initial', '2020-04-03 02:26:35.794149');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2020-04-03 02:26:36.398855');

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
INSERT INTO `django_session` VALUES ('kmej1mwugv6lt9fgir3y0o6mg9memev9', 'YWQ3NzEyNzZkNTdkYzNlNGI0Yjg4NjQ0Y2JlMjY0Yzk0Y2I3YzczNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NmYzYWZhMDQxOWQ1MmJiNzU2MTg4YjBmMzhlNDZjZjhjZGE4YmNmIiwicGxheV9saXN0IjpbeyJzb25nX2lkIjo2LCJzb25nX3NpbmdlciI6Ilx1NTQzNFx1ODJlNVx1NWUwYyIsInNvbmdfbmFtZSI6Ilx1NTIyYlx1NTE4ZFx1OGJiMFx1OGQ3NyIsInNvbmdfdGltZSI6IjA4OjIxIn0seyJzb25nX2lkIjozLCJzb25nX3NpbmdlciI6IlRhbmsiLCJzb25nX25hbWUiOiJcdTRlMDlcdTU2ZmRcdTYwNGIiLCJzb25nX3RpbWUiOiIwMzo1OSJ9LHsic29uZ19pZCI6MTEsInNvbmdfc2luZ2VyIjoiXHU1MzYyXHU1ZGU3XHU5N2YzIiwic29uZ19uYW1lIjoiXHU1OTdkXHU1ZmMzXHU1MjA2XHU2MjRiIiwic29uZ190aW1lIjoiMDM6NDQifV0sImt3b3JkIjoiIn0=', '2020-04-18 13:46:40.797939');
INSERT INTO `django_session` VALUES ('lt01qh39jee982j3geik9lm68hpad4vo', 'YzVkNjg3YzVkMDNlZTVkYmFiZTlmOWUwNWI5NGQxNTMzMzZjZDUyNDp7InBsYXlfbGlzdCI6W3sic29uZ19pZCI6MTEsInNvbmdfc2luZ2VyIjoiXHU1MzYyXHU1ZGU3XHU5N2YzIiwic29uZ19uYW1lIjoiXHU1OTdkXHU1ZmMzXHU1MjA2XHU2MjRiIiwic29uZ190aW1lIjoiMDM6NDQifSx7InNvbmdfaWQiOjcsInNvbmdfc2luZ2VyIjoiXHU5MWQxXHU4MzhlIiwic29uZ19uYW1lIjoiXHU3MjMxXHU3Njg0XHU5YjU0XHU2Y2Q1Iiwic29uZ190aW1lIjoiMDM6MTEifV19', '2020-04-18 13:51:50.888730');
INSERT INTO `django_session` VALUES ('w2x3vzvvbs0mi2ggdv1gxri1p76y8alh', 'N2MzYzg1MWE2ZDVmNjBiNzczMzc4OWQ3YTM2NmI1MTU4Mzg5MjlhMDp7InBsYXlfbGlzdCI6W3sic29uZ19pZCI6Nywic29uZ19zaW5nZXIiOiJcdTkxZDFcdTgzOGUiLCJzb25nX25hbWUiOiJcdTcyMzFcdTc2ODRcdTliNTRcdTZjZDUiLCJzb25nX3RpbWUiOiIwMzoxMSJ9LHsic29uZ19pZCI6Mywic29uZ19zaW5nZXIiOiJUYW5rIiwic29uZ19uYW1lIjoiXHU0ZTA5XHU1NmZkXHU2MDRiIiwic29uZ190aW1lIjoiMDM6NTkifSx7InNvbmdfaWQiOjYsInNvbmdfc2luZ2VyIjoiXHU1NDM0XHU4MmU1XHU1ZTBjIiwic29uZ19uYW1lIjoiXHU1MjJiXHU1MThkXHU4YmIwXHU4ZDc3Iiwic29uZ190aW1lIjoiMDg6MjEifV19', '2020-04-18 14:33:57.681554');
INSERT INTO `django_session` VALUES ('zqtthy451v7aw68sf7u4kb1bim863vtn', 'YzVkNjg3YzVkMDNlZTVkYmFiZTlmOWUwNWI5NGQxNTMzMzZjZDUyNDp7InBsYXlfbGlzdCI6W3sic29uZ19pZCI6MTEsInNvbmdfc2luZ2VyIjoiXHU1MzYyXHU1ZGU3XHU5N2YzIiwic29uZ19uYW1lIjoiXHU1OTdkXHU1ZmMzXHU1MjA2XHU2MjRiIiwic29uZ190aW1lIjoiMDM6NDQifSx7InNvbmdfaWQiOjcsInNvbmdfc2luZ2VyIjoiXHU5MWQxXHU4MzhlIiwic29uZ19uYW1lIjoiXHU3MjMxXHU3Njg0XHU5YjU0XHU2Y2Q1Iiwic29uZ190aW1lIjoiMDM6MTEifV19', '2020-04-18 13:49:05.179394');

-- ----------------------------
-- Table structure for index_comment
-- ----------------------------
DROP TABLE IF EXISTS `index_comment`;
CREATE TABLE `index_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(500) NOT NULL,
  `comment_user` varchar(20) NOT NULL,
  `comment_date` varchar(50) NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `index_comment_song_id_e60ecaa2_fk_index_song_song_id` (`song_id`),
  CONSTRAINT `index_comment_song_id_e60ecaa2_fk_index_song_song_id` FOREIGN KEY (`song_id`) REFERENCES `index_song` (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_comment
-- ----------------------------
INSERT INTO `index_comment` VALUES ('1', '我要点评<<别再记起>>', '匿名用户', '2020-04-02', '6');

-- ----------------------------
-- Table structure for index_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `index_dynamic`;
CREATE TABLE `index_dynamic` (
  `dynamic_id` int(11) NOT NULL AUTO_INCREMENT,
  `dynamic_plays` int(11) NOT NULL,
  `dynamic_search` int(11) NOT NULL,
  `dynamic_down` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`dynamic_id`),
  KEY `index_dynamic_song_id_21bb9711_fk_index_song_song_id` (`song_id`),
  CONSTRAINT `index_dynamic_song_id_21bb9711_fk_index_song_song_id` FOREIGN KEY (`song_id`) REFERENCES `index_song` (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_dynamic
-- ----------------------------
INSERT INTO `index_dynamic` VALUES ('1', '34', '45', '22', '1');
INSERT INTO `index_dynamic` VALUES ('3', '47', '17', '21', '2');
INSERT INTO `index_dynamic` VALUES ('4', '57', '34', '14', '3');
INSERT INTO `index_dynamic` VALUES ('5', '4', '6', '2', '4');
INSERT INTO `index_dynamic` VALUES ('6', '28', '7', '5', '5');
INSERT INTO `index_dynamic` VALUES ('7', '175', '65', '55', '6');
INSERT INTO `index_dynamic` VALUES ('8', '123', '53', '20', '7');
INSERT INTO `index_dynamic` VALUES ('9', '13', '16', '33', '8');
INSERT INTO `index_dynamic` VALUES ('10', '6', '12', '18', '9');
INSERT INTO `index_dynamic` VALUES ('11', '66', '65', '35', '10');
INSERT INTO `index_dynamic` VALUES ('12', '106', '70', '93', '11');
INSERT INTO `index_dynamic` VALUES ('13', '49', '32', '45', '12');
INSERT INTO `index_dynamic` VALUES ('14', '95', '54', '12', '13');

-- ----------------------------
-- Table structure for index_label
-- ----------------------------
DROP TABLE IF EXISTS `index_label`;
CREATE TABLE `index_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(10) NOT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_label
-- ----------------------------
INSERT INTO `index_label` VALUES ('1', '情感天地');
INSERT INTO `index_label` VALUES ('2', '摇滚金属');
INSERT INTO `index_label` VALUES ('3', '经典流行');
INSERT INTO `index_label` VALUES ('4', '环境心情');
INSERT INTO `index_label` VALUES ('5', '午后场景');
INSERT INTO `index_label` VALUES ('6', '岁月流金');
INSERT INTO `index_label` VALUES ('7', '青春校园');
INSERT INTO `index_label` VALUES ('8', '其它');

-- ----------------------------
-- Table structure for index_song
-- ----------------------------
DROP TABLE IF EXISTS `index_song`;
CREATE TABLE `index_song` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) NOT NULL,
  `song_singer` varchar(50) NOT NULL,
  `song_time` varchar(10) NOT NULL,
  `song_album` varchar(50) NOT NULL,
  `song_languages` varchar(20) NOT NULL,
  `song_type` varchar(20) NOT NULL,
  `song_release` varchar(20) NOT NULL,
  `song_img` varchar(20) NOT NULL,
  `song_lyrics` varchar(50) NOT NULL,
  `song_file` varchar(50) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `index_song_label_id_9b9b68ed_fk_index_label_label_id` (`label_id`),
  CONSTRAINT `index_song_label_id_9b9b68ed_fk_index_label_label_id` FOREIGN KEY (`label_id`) REFERENCES `index_label` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_song
-- ----------------------------
INSERT INTO `index_song` VALUES ('1', '爱我是对的', '胡夏', '04:20', '胡夏封面', '国语', '流行', '2012-10-01', '1.jpg', '暂无歌词', '1.m4a', '3');
INSERT INTO `index_song` VALUES ('2', '体面', '于文文', '04:20', '《前任3》', '国语', '流行', '2019-10-11', '2.jpg', '暂无歌词', '2.m4a', '4');
INSERT INTO `index_song` VALUES ('3', '三国恋', 'Tank', '03:59', '《再见前任》', '国语', '摇滚', '2010-12-11', '3.jpg', '暂无歌词', '3.m4a', '2');
INSERT INTO `index_song` VALUES ('4', '会长大的幸福', 'Tank', '05:01', '第三回合', '国语', '励志', '2009-09-18', '4.jpg', '暂无歌词', '4.m4a', '4');
INSERT INTO `index_song` VALUES ('5', '满满', '王铮亮', '03:21', '爱，一直在', '国语', '甜蜜', '2011-01-01', '5.jpg', '暂无歌词', '5.m4a', '1');
INSERT INTO `index_song` VALUES ('6', '别再记起', '吴若希', '08:21', '他不在我', '粤语', '场景', '2020-01-22', '6.jpg', '暂无歌词', '6.m4a', '4');
INSERT INTO `index_song` VALUES ('7', '爱的魔法', '金莎', '03:11', '他不爱我', '国语', '甜蜜', '2012-03-19', '7.jpg', '暂无歌词', '7.m4a', '1');
INSERT INTO `index_song` VALUES ('8', '演员', '薛之谦', '04:11', '演员', '国语', '流行', '2015-06-05', '8.jpg', '暂无歌词', '8.m4a', '3');
INSERT INTO `index_song` VALUES ('9', '放爱一个假', '许慧欣', '03:23', '迷', '国语', '安静', '2006-07-01', '9.jpg', '暂无歌词', '9.m4a', '4');
INSERT INTO `index_song` VALUES ('10', 'Volar', '未知', '03:52', '未知', '粤语', '摇滚', '2006-08-09', '10.jpg', '暂无歌词', '10.m4a', '2');
INSERT INTO `index_song` VALUES ('11', '好心分手', '卢巧音', '03:44', '未知', '国语', '伤感', '2015-07-24', '11.jpg', '11.txt', '11.m4a', '1');
INSERT INTO `index_song` VALUES ('12', '就是这样', '未知', '04:44', '未知', '国语', '流行', '2017-08-09', '12.jpg', '暂无歌词', '12.m4a', '3');
INSERT INTO `index_song` VALUES ('13', '爱过了又怎样', '张惠春', '04:09', '未知', '国语', '流行', '2016-09-07', '13.jpg', '暂无歌词', '13.m4a', '3');

-- ----------------------------
-- Table structure for user_myuser
-- ----------------------------
DROP TABLE IF EXISTS `user_myuser`;
CREATE TABLE `user_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `weChat` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_myuser
-- ----------------------------
INSERT INTO `user_myuser` VALUES ('1', 'pbkdf2_sha256$100000$JUPYrx5BXLvK$8bLcl8s4Qs55OpisHCx/no31Qsqgz6BA7bwGtSuvEFQ=', '2020-04-04 06:26:35.415032', '0', 'admin', '', '', '', '0', '1', '2020-04-04 06:21:01.993346', '', '', '123456');
INSERT INTO `user_myuser` VALUES ('2', 'pbkdf2_sha256$100000$NY7qqnyc7Q4w$N/UGC5veK0x5q9lZXfNqHyQOxyPJZuAZQv7tT5jfkTw=', '2020-04-04 06:55:45.121805', '1', '1234', '', '', '1234@qq.com', '1', '1', '2020-04-04 06:55:06.115552', '', '', '');

-- ----------------------------
-- Table structure for user_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_myuser_groups`;
CREATE TABLE `user_myuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_myuser_groups_myuser_id_group_id_680fbae2_uniq` (`myuser_id`,`group_id`),
  KEY `user_myuser_groups_group_id_e21a6dfd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_myuser_groups_group_id_e21a6dfd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_myuser_groups_myuser_id_dfd02c0f_fk_user_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_myuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_myuser_user_permissions`;
CREATE TABLE `user_myuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_myuser_user_permiss_myuser_id_permission_id_ae8df385_uniq` (`myuser_id`,`permission_id`),
  KEY `user_myuser_user_per_permission_id_d16c386c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_myuser_user_per_myuser_id_5d2dcfb0_fk_user_myus` FOREIGN KEY (`myuser_id`) REFERENCES `user_myuser` (`id`),
  CONSTRAINT `user_myuser_user_per_permission_id_d16c386c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_myuser_user_permissions
-- ----------------------------

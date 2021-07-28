/*
 Navicat Premium Data Transfer

 Source Server         : 8889
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:8889
 Source Schema         : laravel_api_dome

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 28/07/2021 18:13:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lara_ad
-- ----------------------------
DROP TABLE IF EXISTS `lara_ad`;
CREATE TABLE `lara_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `code` varchar(255) DEFAULT NULL COMMENT '编号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `ordernum` int(11) NOT NULL COMMENT '排序',
  `pic` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `linkurl` varchar(255) DEFAULT NULL COMMENT '外链',
  `txt1` text COMMENT '文本',
  `content` text COMMENT '内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='碎片管理';

-- ----------------------------
-- Records of lara_ad
-- ----------------------------
BEGIN;
INSERT INTO `lara_ad` VALUES (1, '关于我们页面', 'about', '16', 0, NULL, 'http://www.baidu.com', NULL, '<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: 18px; color: #000000; font-family: impact, sans-serif;\">测试内容</span></p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://127.0.0.1:8000/uploads/tinymce/images/5c8a679d645fbeb4f47261bee2a6d44b610119c55203d.png\" alt=\"\" width=\"200\" height=\"200\" /></p>', '2021-07-28 16:49:58', '2021-07-28 18:06:56');
INSERT INTO `lara_ad` VALUES (4, '首页左侧文案', 'home_right_info', '17', 0, NULL, NULL, NULL, NULL, '2021-07-28 16:56:36', '2021-07-28 18:07:01');
COMMIT;

-- ----------------------------
-- Table structure for lara_ad_ting
-- ----------------------------
DROP TABLE IF EXISTS `lara_ad_ting`;
CREATE TABLE `lara_ad_ting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `txt` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='碎片管理-文本内容';

-- ----------------------------
-- Records of lara_ad_ting
-- ----------------------------
BEGIN;
INSERT INTO `lara_ad_ting` VALUES (6, 1, NULL, NULL);
INSERT INTO `lara_ad_ting` VALUES (5, 1, NULL, NULL);
INSERT INTO `lara_ad_ting` VALUES (3, 4, '001', '文本1');
INSERT INTO `lara_ad_ting` VALUES (4, 4, '002', '文本2');
INSERT INTO `lara_ad_ting` VALUES (7, 1, NULL, NULL);
INSERT INTO `lara_ad_ting` VALUES (8, 1, NULL, NULL);
INSERT INTO `lara_ad_ting` VALUES (9, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_extension_histories
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_extension_histories`;
CREATE TABLE `lara_admin_extension_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lara_admin_extension_histories_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_extension_histories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_extensions`;
CREATE TABLE `lara_admin_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lara_admin_extensions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_extensions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_menu`;
CREATE TABLE `lara_admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `lara_admin_menu` VALUES (1, 0, 1, 'Index', 'feather icon-bar-chart-2', '/', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (2, 0, 2, 'Admin', 'feather icon-settings', '', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (3, 2, 3, 'Users', '', 'auth/users', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (4, 2, 4, 'Roles', '', 'auth/roles', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (5, 2, 5, 'Permission', '', 'auth/permissions', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (6, 2, 6, 'Menu', '', 'auth/menu', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (7, 2, 7, 'Extensions', '', 'auth/extensions', '', 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_menu` VALUES (8, 0, 8, 'information', 'fa-500px', NULL, '', 1, '2021-07-12 14:29:53', '2021-07-12 14:31:17');
INSERT INTO `lara_admin_menu` VALUES (9, 8, 9, 'us', 'fa-user', '/us', '', 1, '2021-07-12 14:35:27', '2021-07-12 14:36:02');
INSERT INTO `lara_admin_menu` VALUES (10, 8, 10, 'column', 'fa-columns', '/column', '', 1, '2021-07-27 15:50:37', '2021-07-28 14:53:42');
INSERT INTO `lara_admin_menu` VALUES (11, 8, 11, 'info', 'fa-google-wallet', '/info', '', 1, '2021-07-28 15:33:08', '2021-07-28 15:33:08');
INSERT INTO `lara_admin_menu` VALUES (12, 8, 12, 'ad', 'fa-adn', '/ad', '', 1, '2021-07-28 15:34:12', '2021-07-28 15:34:12');
INSERT INTO `lara_admin_menu` VALUES (13, 8, 13, 'ext', 'fa-angellist', 'ext', '', 1, '2021-07-28 17:31:15', '2021-07-28 17:31:15');
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_permission_menu`;
CREATE TABLE `lara_admin_permission_menu` (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `lara_admin_permission_menu_permission_id_menu_id_unique` (`permission_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_permission_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_permissions`;
CREATE TABLE `lara_admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lara_admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `lara_admin_permissions` VALUES (1, 'Auth management', 'auth-management', '', '', 1, 0, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_permissions` VALUES (2, 'Users', 'users', '', '/auth/users*', 2, 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_permissions` VALUES (3, 'Roles', 'roles', '', '/auth/roles*', 3, 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_permissions` VALUES (4, 'Permissions', 'permissions', '', '/auth/permissions*', 4, 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_permissions` VALUES (5, 'Menu', 'menu', '', '/auth/menu*', 5, 1, '2021-07-12 12:29:07', NULL);
INSERT INTO `lara_admin_permissions` VALUES (6, 'Extension', 'extension', '', '/auth/extensions*', 6, 1, '2021-07-12 12:29:07', NULL);
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_role_menu`;
CREATE TABLE `lara_admin_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `lara_admin_role_menu_role_id_menu_id_unique` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `lara_admin_role_menu` VALUES (1, 8, '2021-07-12 14:29:53', '2021-07-12 14:29:53');
INSERT INTO `lara_admin_role_menu` VALUES (1, 9, '2021-07-12 14:35:27', '2021-07-12 14:35:27');
INSERT INTO `lara_admin_role_menu` VALUES (1, 10, '2021-07-27 16:18:45', '2021-07-27 16:18:45');
INSERT INTO `lara_admin_role_menu` VALUES (1, 13, '2021-07-28 17:31:15', '2021-07-28 17:31:15');
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_role_permissions`;
CREATE TABLE `lara_admin_role_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `lara_admin_role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_role_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_role_users`;
CREATE TABLE `lara_admin_role_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `lara_admin_role_users_role_id_user_id_unique` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `lara_admin_role_users` VALUES (1, 1, '2021-07-12 12:29:07', '2021-07-12 12:29:07');
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_roles`;
CREATE TABLE `lara_admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lara_admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `lara_admin_roles` VALUES (1, 'Administrator', 'administrator', '2021-07-12 12:29:07', '2021-07-12 12:29:07');
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_settings`;
CREATE TABLE `lara_admin_settings` (
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lara_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `lara_admin_users`;
CREATE TABLE `lara_admin_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lara_admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_admin_users
-- ----------------------------
BEGIN;
INSERT INTO `lara_admin_users` VALUES (1, 'admin', '$2y$10$Tm65ynity/5XLXGTCamGXuXDRW1Kk7fsOgJ9V1D/qTr6gyPb4Sn.6', 'Administrator', NULL, NULL, '2021-07-12 12:29:07', '2021-07-28 10:45:09');
COMMIT;

-- ----------------------------
-- Table structure for lara_column
-- ----------------------------
DROP TABLE IF EXISTS `lara_column`;
CREATE TABLE `lara_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `title` varchar(30) NOT NULL COMMENT '分类名称',
  `pic` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `order` int(11) NOT NULL COMMENT '排序字段',
  `content` longblob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of lara_column
-- ----------------------------
BEGIN;
INSERT INTO `lara_column` VALUES (1, 0, 'root', '', 1, NULL, '2021-07-27 17:08:27', '2021-07-27 17:08:27');
INSERT INTO `lara_column` VALUES (2, 1, '关于我们', NULL, 2, NULL, '2021-07-28 15:08:39', '2021-07-28 15:08:39');
INSERT INTO `lara_column` VALUES (3, 1, '新闻中心', NULL, 3, NULL, '2021-07-28 15:08:45', '2021-07-28 15:08:45');
COMMIT;

-- ----------------------------
-- Table structure for lara_ext
-- ----------------------------
DROP TABLE IF EXISTS `lara_ext`;
CREATE TABLE `lara_ext` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `title` varchar(30) NOT NULL COMMENT '分类名称',
  `pic` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `order` int(11) NOT NULL COMMENT '排序字段',
  `content` longblob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='扩展分类表';

-- ----------------------------
-- Records of lara_ext
-- ----------------------------
BEGIN;
INSERT INTO `lara_ext` VALUES (1, 0, 'root', '', 1, NULL, '2021-07-27 17:08:27', '2021-07-27 17:08:27');
INSERT INTO `lara_ext` VALUES (2, 1, '文章属性', NULL, 2, NULL, '2021-07-28 15:08:39', '2021-07-28 17:36:39');
INSERT INTO `lara_ext` VALUES (15, 1, '碎片类别', NULL, 3, NULL, '2021-07-28 17:36:58', '2021-07-28 17:36:58');
INSERT INTO `lara_ext` VALUES (16, 15, '首页', NULL, 4, NULL, '2021-07-28 17:37:04', '2021-07-28 17:37:04');
INSERT INTO `lara_ext` VALUES (17, 15, '关于我们', NULL, 5, NULL, '2021-07-28 17:37:15', '2021-07-28 17:37:21');
INSERT INTO `lara_ext` VALUES (18, 2, '首推', NULL, 6, NULL, '2021-07-28 17:49:36', '2021-07-28 17:49:36');
INSERT INTO `lara_ext` VALUES (19, 2, '热点', NULL, 7, NULL, '2021-07-28 17:49:45', '2021-07-28 17:49:51');
COMMIT;

-- ----------------------------
-- Table structure for lara_info
-- ----------------------------
DROP TABLE IF EXISTS `lara_info`;
CREATE TABLE `lara_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '父级分类ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `edit_name` varchar(255) DEFAULT NULL COMMENT '编辑',
  `linkurl` varchar(255) DEFAULT NULL COMMENT '外链',
  `seotitle` varchar(255) DEFAULT NULL COMMENT 'seo标题',
  `keyword` text COMMENT '关键词',
  `description` text COMMENT '描述',
  `hits` int(11) DEFAULT '0' COMMENT '浏览次数',
  `pic` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `img` varchar(255) DEFAULT NULL COMMENT '大图',
  `property` varchar(500) DEFAULT NULL COMMENT '属性',
  `content` text COMMENT '内容',
  `filepath` varchar(255) DEFAULT NULL COMMENT '附件',
  `ordernum` int(11) DEFAULT '0' COMMENT '排序',
  `videourl` varchar(255) DEFAULT NULL COMMENT '视频链接',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of lara_info
-- ----------------------------
BEGIN;
INSERT INTO `lara_info` VALUES (1, 3, '垂直搜索引擎站点的准则及主要特点', NULL, NULL, NULL, NULL, NULL, NULL, '垂直搜索引擎站点的准则及主要特点', '垂直搜索引擎站点的准则及主要特点垂直搜索不只是类google的行业通用搜索。以房产行业为例，如果我们按照google抓取网页的方式，来建造一个房产行业google的做法，是行不通的。技术壁垒不用解释，就算我们借助nutch,lucene等搜', 3, 'images/317eaf8e430afd5577f43daa91a7c19a.png', NULL, '[\"18\",\"19\"]', '<p>垂直搜索引擎站点的准则及主要特点<br />\r\n垂直搜索不只是类google的行业通用搜索。以房产行业为例，如果我们按照google抓取网页的方式，来建造一个房产行业google的做法，是行不通的。技术壁垒不用解释，就算我们借助nutch,lucene等搜索技术来做，我们也无法提供差异化的服务,而没有差异化的产品在互联网赢家通吃的规则下是无法生存的，就是不要简单地模仿，而要想办法形成互补。<br />\r\n垂直搜索和目前的google,baidu等通用搜索从定位，内容，用户，市场策略等都是不同的。所以垂直搜索不只是简单的行业google。<br />\r\n用户使用google,baidu等通用搜索引擎的方式是通过关键字的方式实现的，是语义上的搜索，返回的结果倾向于知识成果，比如文章，论文，新闻等；垂直搜索也是提供关键字来进行搜索的，但被放到了一个行业知识的上下文中，返回的结果更倾向于信息，消息，条目等。对买房的人讲，他希望找的房子供求信息和文章，新闻等不同。这个特性是他们各自的的技术特点决定的。打个比方，如果google搜索引擎是一个正金字塔型，那么垂直搜索引擎就是个倒金字塔型，两者是互补的。<br />\r\n垂直搜索引擎的三个特点：<br />\r\n垂直搜索引擎抓取的数据来源于垂直搜索引擎关注的行业站点：<br />\r\n垂直搜索引擎抓取的数据倾向于结构化数据和元数据：<br />\r\n垂直搜索引擎的搜索行为是基于结构化数据和元数据的结构化搜索<br />\r\n垂直搜索引擎站点的8条准则：<br />\r\n选择一个好的垂直搜索方向。俗话说男怕选错行，这一点对于搜索引擎来说也是一样的，除了选择的这个行业有垂直搜索的大量需求外，这个行业的数据属性最好不要和Yahoo,Google等通用搜索的的抓取方向重叠。<br />\r\n目前热门的垂直搜索行业有：购物，旅游，汽车，工作，房产，交友等行业。搜索引擎对动态url数据不敏感也是众所周知的，这些可以作为垂直搜索引擎的切入点；<br />\r\n评价所选垂直搜索行业的网站、垂直搜索内容、行业构成等情况：<br />\r\n我们都知道垂直搜索引擎并不提供内容来源，它的数据依赖爬虫搜集，并做了深度加工而来的。因此考虑垂直搜索引擎的所处的大环境和定位至关重要。<br />\r\n深入分析垂直搜索引擎的索引数据特点：<br />\r\n垂直搜索引擎的索引数据过于结构化，那么进入的门槛比较低，行业竞争会形成一窝蜂的局面；如果搜索数据特点是非结构化的，抓取，分析这样的数据很困难，进入壁<br />\r\n垒太高，很可能出师未捷身先死。<br />\r\n垂直搜索引擎的索引数据倾向于结构化数据和元数据，这个特点是区别于yahoo,google等通用搜索引擎的，这是垂直搜索引擎的立足点。而垂直搜索引擎是根植于某一个行业，因此行业知识，行业专家这些也是通用搜索引擎不具备的。也就是说进入垂直搜索是有门槛的。垂直搜索引擎的搜索结果要覆盖整个行业，搜索相关性要高于通用搜索引擎，贴近用户搜索意图，搜索结果要及时。<br />\r\n垂直搜索引擎的web2.0需求：<br />\r\n垂直搜索引擎的搜索数据由于带有结构化的天性，相对于通用搜索引擎的全文索引而言，更显的少而精。因此，设计的时候要提供收集用户数据的接口，同时提供tag,积分等机制，使搜索结果更加“垂直”。<br />\r\n垂直搜索引擎的目标是帮助用户解决问题，而不只是向通用搜索引擎一样发现信息：这一点是垂直搜索引擎的终极目标。在做垂直搜索引擎的时候你需要考虑：什么问题是这个行业内的特殊性问题，什么问题是一般性问题。keso多次提到google的目标是<br />\r\n让用户尽快离开google，而垂直搜索引擎应该粘住用户。一般来说，使用垂直搜索引擎的用户都是和用户的利益需求密切相关的。所谓利益需求是我自己独创的，大意是和用户工作密切相关，生活中必不可少的需求，而求有持续性。比如：学生找论文，业主找装修信息等等这样的需求。因此粘住用户，让用户有反馈的途径是一个关键部分。<br />\r\n垂直搜索引擎的社区化特征：<br />\r\n俗话说物以类聚，人以群分，垂直搜索引擎定位于一个行业，服务于一群特定需求的人群，这个特点决定了垂直搜索的社区化行为。人们利用垂直搜索引擎解决问题，分享回馈。现在做网站都讲求社区化，所以垂直搜索引擎本质上还是：对垂直门户信息提供方式的一次简化性的整合。</p>', NULL, 0, NULL, NULL, '2021-07-28 18:08:22');
INSERT INTO `lara_info` VALUES (3, 3, '搜索引擎给网站和网吧行业带来的影响', NULL, '', '', '', '', NULL, '搜索引擎给网站和网吧行业带来的影响', '搜索引擎给网站和网吧行业带来的影响什么是搜索引擎？搜索引擎有什么作用？现在有很多人不太了解这一问题，那么下面就给大家简单介绍一下，搜索引擎是指根据一定的策略、运用特定的计算机程序从互联网上搜集信息，在对信息进行组织和处理后，为用户提供检索服', 0, '', '', '[\"18\",\"19\"]', '<p>搜索引擎给网站和网吧行业带来的影响<br />\r\n什么是搜索引擎？搜索引擎有什么作用？现在有很多人不太了解这一问题，那么下面就给大家简单介绍一下，搜索引擎是指根据一定的策略、运用特定的计算机程序从互联网上搜集信息，在对信息进行组织和处理后，为用户提供检索服务，将用户检索相关的信息展示给用户的系统。<br />\r\n网站的命脉就是流量，而网站的流量可以分为两类。一类是自然流量，一类就是通过搜索引擎而来的流量。如果搜索引擎能够能多能有效的抓取网站内容，那么对于网站的好处是不言而喻的。所以，SEO也应运而生了。<br />\r\n在百度和谷歌两大搜索引擎的工作中，百度的工作周期相对来说短一些，百度大约在10天左右重新访问网站一次，Google大约在15天左右重新访问一次网站。由于一天之内不能游历全球所有的网站，如果推广网站时，能到更多的网站上提交相应的网站信息，也是加快蜘蛛收录网站内容的重要环节。<br />\r\n走进网吧，不难发现各个网吧内的电脑浏览器首页或工具条上都会有google或百度的标志。百度甚至还推出了网吧联盟，可见搜索引擎们对网吧行业都格外的青睐。现在我们常用的搜索引擎无非就是百度和google两种。从百度方面来看，百度联盟可以算是目前唯一一个能够覆盖所有网吧并和几乎所有主流网吧软件缔结合作关系的媒体运营平台。而google方面也不甘示弱，谷歌已经注意到了网吧市场，网吧已经成为了谷歌的新型合作伙伴。网吧的首页和工具条上都会出现谷歌的标志，相应地会给谷歌带去流量。谷歌对网吧市场的关注，表明谷歌注意到网吧作为中国互联网市场的特色之一。由于我国PC拥有量远落后于美国等西方国家，网吧作为网民主要上网地点的比例逐年在上升，我国网民在网吧上网的比例偏高。据CNNIC第20次中国互联网络发展状况统计报告显示，超过1/3（37.2％）的网民表示经常去网吧上网，比2006年12月的32.3％高了5个百分点，第一次超过网民在工作单位上网的比例而成为第二大上网场所。</p>\r\n', '', 0, '', NULL, '2021-07-28 18:11:58');
INSERT INTO `lara_info` VALUES (4, 3, '使用“Noframes”标记进行网站优化的优越性', NULL, '', '', '', '', NULL, '使用“Noframes”标记进行网站优化的优越性', '使用“Noframes”标记进行网站优化的优越性使用框架的网页无法被使用网络蜘蛛（spiders）或网络爬虫（crawlers）的搜索引擎（如Google）正确索引。在一个框架网页的后台代码中，一般能够看到的是网页的', 0, '', '', '', '<p>使用&ldquo;Noframes&rdquo;标记进行网站优化的优越性<br />\r\n使用框架的网页无法被使用网络蜘蛛（spiders）或网络爬虫（crawlers）的搜索引擎（如Google）正确索引。<br />\r\n在一个框架网页的后台代码中，一般能够看到的是网页的标题标记（MetaTitle）、描述标记（MetaDescription）、关键字标记（MetaKeywords）及其它原标记（MetaTags），同时还会看到一个框架集标记（FramesetTag）。框架中的内容在后台代码中是无法被体现的，而对于那些主要搜索引擎的搜索程序来说，如Google的GoogleBot和Freshbot，其设计思路都是完全忽略某些HTML代码，转而直接锁定网页上的实际内容进行索引。这样一来，网络蜘蛛在那些一般性的框架网页上根本找不到要搜索的内容。这是由于那些具体内容都被放到我们称之为&ldquo;内部网页&rdquo;中去了。<br />\r\n使用了框架型网页并不意味着就完全无法对其网页进行优化。实际上在HTML标记中，有一个叫做NOFRAME的标记，如果使用得当的话我们就可以有效地对页面进行优化了，从而使得搜索引擎能够正确索引你框架网页上的内容信息。也有网站这样使用NOFRAMES标记：他们在NOFRAMES标记里放上这么一段话：&ldquo;本网页使用了框架，但您的浏览器不支持框架。请下载新的浏览器观看。&rdquo;<br />\r\n让我们看看那些专业的搜索引擎优化公司是怎么做的吧。他们在使用了框架的网页中，有效的提供含有丰富关键字和关键短语的重要文字和内容，从而有效帮助网站在SERP（搜索引擎搜索结果页）中取得较高的排名（页面等级）。<br />\r\n这样优化的结果，其实就是让主要搜索引擎不但读取了你的网页后台代码中的标题和其它原标记，而且对那些不支持框架的浏览器所无法显示的页面内容信息，也进行了索引。如果你出于某种原因非要使用框架结构，那么请紧记：在你的后台代码中一定要正确的使用NOFRAMES标记，这一点非常重要。<br />\r\n很显然，我们所说的这些优化措施，只有对那些网页内容经过精心撰写，并且在内容中充分使用了重要关键字和关键短语的网站才起作用。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (5, 3, '如何才能做好网站结构优化', NULL, '', '', '', '', NULL, '如何才能做好网站结构优化', '如何才能做好网站结构优化合理的优化可以要搜索引擎更清晰的认识到你的页面结构、权重划分，进而更容易抓取页面内容进行索引，进而从整体上判断你的网站核心主题。所以网站结构优化无疑在搜索引擎中占据了举足轻重的地位，导航清晰自然导航清晰自然，才会使用', 1, '', '', '', '<p>如何才能做好网站结构优化<br />\r\n合理的优化可以要搜索引擎更清晰的认识到你的页面结构、权重划分，进而更容易抓取页面内容进行索引，进而从整体上判断你的网站核心主题。所以网站结构优化无疑在搜索引擎中占据了举足轻重的地位，<br />\r\n导航清晰自然<br />\r\n导航清晰自然，才会使用户尽快的找到所需要的资源点入页面。有些站长将导航故意设计的很深，一层层的排开，为的是带来更多的PV，但是实际上不仅影响了用户体验，搜索引擎的抓取也是不友好的表现。所以在网站首页的导航要求不要太深，一般直接指向下一个目录就可以。而目录之下的导航继续指向内容就可以。要导航赋有层次感更容易使搜索引擎进行权重的判断。同时在导航中加入sitemap生成也是必要的，方便于搜索搜索引擎对页面内容的获取，使需要展现的东西即使的反馈给搜索引擎进行索引。一般来说程序中会带这么一个功能，如果没有的话也可以直接百度搜索地图生成器进行处理。<br />\r\n内容排版优化<br />\r\n对于页面的标题就不用我们操心了，所有程序都自动添加了标题标签，一般来说我们针对文章内容做优化。文章中的内容一般主要利用变色加粗来突出强调重要性。在文章内容中一般第一段出现一次关键字可以适当加粗，然后在文章结尾再出现一次关键字为最好，从用户体验出发，关键字多了就会被认为作弊了，同时在文章中可以适当加入长尾关键字同样是一种优化方案，没必要生搬硬套的优化主关键字。<br />\r\n页面权重分配主次<br />\r\n除了外部链接可以为网站页面带入权重，同时网站内部的链接优化的好坏同样关乎页面权重。网站主页的权重是最高的，其它次之。哪些页面具备很好的排名能力，完全取决于结构的优化后所得到的，所以优化网站重要的是一个权重层次的优化。一般的优化方式为：主页链接指向所有目录频道，所有目录频道指向其他频道，而频道主页全部都要链接网站主页。所有目录频道全部指向该目录内容，而不要做的是频道目录链接其他目录中的内容。并且所有内容全部要指向网站主页以及上一级的目录频道，权重分配才会具有主次。<br />\r\n合理使用超文本链接<br />\r\n很多网站在建设中为了美观大量的使用图片以及flash在网站结构中做链接都是些华而不实的东西，因为搜索引擎是不抓取这些图片的，蜘蛛也只会识别文字，可以说网站优化的目的完全没有达到。合理做网站优化网页结构的优化，呈现于搜索引擎面前的只能是文字的表现形式，使用超链描文本是最好的效果。而且很多站长在导航设计中为了更醒目的将信息展示给客户而使用大量的图片做链接，在搜索引擎索引上带来的损失无疑也是最大的。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (6, 3, '网站优化时至关重要的三个标签', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '网站优化时至关重要的三个标签我们所谓的网站优化是对网站进行程序、内容、版块、布局等多方面的优化调整，使网站更容易被搜索引擎收录，提高用户体验和转化率进而创造价值。其中有几个标签是必不可少的：网站关键词、网站标题、网站内容。我们通过南京SEO', 1, '', '', '', '网站优化时至关重要的三个标签<br/>\r\n我们所谓的网站优化是对网站进行程序、内容、版块、布局等多方面的优化调整，使网站更容易被搜索引擎收录，提高用户体验和转化率进而创造价值。<br/>\r\n其中有几个标签是必不可少的：网站关键词、网站标题、网站内容。我们通过南京SEO工作中的体会来说明一下。网站关键词是对网页内容的重点词的筛选，写文章前要确定文章围绕什么来写，突出哪些关键词，这样我们就会有意识排列关键词的密度，利于搜索引擎查阅。对于用户没有什么影响，但对于搜索引擎影响很大，每个搜索引擎都有不同的算法计算密度比例从而获得排名位置，关键词密度不宜过少，当然也不宜过多。我们认为关键词密度控制在3％-8％为好。<br/>\r\n网站标题，搜索引擎判断网页内容的主要依据，也是用户了解这个网站、被这个网页吸引来的动力。网站标题既要全面包含网页的内容，又要言简意赅。网站标题是搜索引擎页面优化中最重要的因素，搜搜引擎依据它所表达的内容来判定一个网页的主题内容。<br/>\r\n网站内容其实也就是我们说的文章内容的摘要，写好摘要也是应对搜索引擎的重要手段，搜索引擎同样也要依据此判断整个页面的内容。<br/>\r\n网站关键词的作法。首页关键词一般要与网站名称和网站的主要方向相一致，突出你所要表达的重点。栏目关键词要依据本栏目的名称来确定，也可以加上网站名称，通过该栏目名称关键词搜索引擎便能更好的分辨这个页面，从而让你在同类网站的权重中取得一些优势。<br/>\r\n网站标题的作法。网页标题的空间是十分宝贵的额，要把最重要的东西放在这寸土寸金的地方。首页标题一般是网站标题和网站关键词，与网站关键词有一致的地方。网站栏目标题也要依据网站栏目名称来写，采用栏目名称和该栏目关键词利于提高栏目的权重，提高被搜索引擎收录的机会。<br/>\r\n关于网站内容的作法。首页内容当然是要将首页标题、关键字和一些特殊栏目的内容融合在一起，这是搜索引擎收录首页后显示出来的内容。分栏目网页内容也是要将分栏目的标题、关键字、栏目名称，尽量融合在一起，便于搜索引擎浏览，提高分栏目的权重。从SEO观点看，我们的网页是写给搜索引擎看的。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (7, 3, '合理做好网站结构优化网站优化的关键', NULL, '', '', '', '', NULL, '合理做好网站结构优化网站优化的关键', '合理做好网站结构优化网站优化的关键合理的优化可以要搜索引擎更清晰的认识到你的页面结构、权重划分，进而更容易抓取页面内容进行索引，进而从整体上判断你的网站核心主题。所以网站结构优化无疑在搜索引擎中占据了举足轻重的地位，导航结构一目了然导航清晰', 0, '', '', '', '<p>合理做好网站结构优化网站优化的关键<br />\r\n合理的优化可以要搜索引擎更清晰的认识到你的页面结构、权重划分，进而更容易抓取页面内容进行索引，进而从整体上判断你的网站核心主题。所以网站结构优化无疑在搜索引擎中占据了举足轻重的地位，<br />\r\n导航结构一目了然<br />\r\n导航清晰自然，才会使用户尽快的找到所需要的资源点入页面。有些站长将导航故意设计的很深，一层层的排开，为的是带来更多的PV，但是实际上不仅影响了用户体验，搜索引擎的抓取也是不友好的表现。所以在网站首页的导航要求不要太深，一般直接指向下一个目录就可以。而目录之下的导航继续指向内容就可以。要导航赋有层次感更容易使搜索引擎进行权重的判断。同时在导航中加入sitemap生成也是必要的，方便于搜索搜索引擎对页面内容的获取，使需要展现的东西即使的反馈给搜索引擎进行索引。一般来说程序中会带这么一个功能，如果没有的话也可以直接百度搜索地图生成器进行处理。<br />\r\n页面权重分配主次<br />\r\n除了外部链接可以为网站页面带入权重，同时网站内部的链接优化的好坏同样关乎页面权重。网站主页的权重是最高的，其它次之。哪些页面具备很好的排名能力，完全取决于结构的优化后所得到的，所以优化网站重要的是一个权重层次的优化。一般的优化方式为：主页链接指向所有目录频道，所有目录频道指向其他频道，而频道主页全部都要链接网站主页。所有目录频道全部指向该目录内容，而不要做的是频道目录链接其他目录中的内容。并且所有内容全部要指向网站主页以及上一级的目录频道，权重分配才会具有主次。<br />\r\n合理使用超文本链接<br />\r\n很多网站在建设中为了美观大量的使用图片以及flash在网站结构中做链接都是些华而不实的东西，因为搜索引擎是不抓取这些图片的，蜘蛛也只会识别文字，可以说SEO的目的完全没有达到。合理做SEO网页结构的优化，呈现于搜索引擎面前的只能是文字的表现形式，使用超链描文本是最好的效果。而且很多站长在导航设计中为了更醒目的将信息展示给客户而使用大量的图片做链接，在搜索引擎索引上带来的损失无疑也是最大的。<br />\r\n内容排版优化<br />\r\n对于页面的标题就不用我们操心了，所有程序都自动添加了标题标签，一般来说我们针对文章内容做优化。文章中的内容一般主要利用变色加粗来突出强调重要性。在文章内容中一般第一段出现一次关键字可以适当加粗，然后在文章结尾再出现一次关键字为最好，从用户体验出发，关键字多了就会被认为作弊了，同时在文章中可以适当加入长尾关键字同样是一种优化方案，没必要生搬硬套的优化主关键字。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (8, 3, '网站优化如何做好用户登陆页面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '网站优化如何做好用户登陆页面可以说，很多做网站策划的人，基本是不会考虑用户登陆页面信息需求分析并兼顾到用户体验的这类问题，我认识很多来做网站优化的人，大部分人能够将优化方案细化到行业，我认为基本还算是一个合格的策划人员，不过让大家失望的是，', 1, '', '', '', '网站优化如何做好用户登陆页面<br/>\r\n可以说，很多做网站策划的人，基本是不会考虑用户登陆页面信息需求分析并兼顾到用户体验的这类问题，我认识很多来做网站优化的人，大部分人能够将优化方案细化到行业，我认为基本还算是一个合格的策划人员，不过让大家失望的是，很多策划都是用建站方案来修改做做，很没有意思，我想这种方案也能叫做策划吗，策划至少也是在行业上做一些差异化，用户需求定位的东西，不要觉得策划就是做布局，做栏目设计这么简单东西，除了这些，模拟用户点击思路，网站跳转流程以及相应过程中的提示是最为重要的！<br/>\r\n那么，针对性的用户登陆页面优化都要考虑哪些信息呢？首先还是登陆页面表现信息的定位，就是你这个页面主要为用户提供什么，想让用户知道什么，用户看到这些信息会有哪些疑问，如何在登陆页面中导入这些疑问的答案，用户看到了解这些信息会去做什么，还想要了解什么相关的内容，这样模拟用户思维的方式才能将登陆页面需要展示的内容考虑全面；其次就是这些信息的布局，个人建议用户登陆页面既要像一个栏目页面，又要具有首页的充足信息，以最大提升站点产品或者服务信息的曝光度，并用最恰当的位置对用户最一些引导，你想让他去哪些页面，重点推荐哪些产品和服务，这些产品或服务的特点、功能、价格一定要抓住他的需要，看完就会点击去了解详情，不然你就失去了这个用户；<br/>\r\n最后就是用户登陆页面的信任度，你会发现有很多登陆页面做的和站点其他页面差异很大，我也知道他们可能是需要突出这个页面的信息，让用户来关注，但这样过度的引导，很夸张的一些设计反而会降低用户信任，觉得是不是一个虚假广告信息呢？我做过这样一个测试，在一个登陆页面上没有放LOGO，设计风格和站点相关联页面差异也很大，结果这个登陆页面的产品很少有人来咨询和预定，后来我稍作调整，效果就翻了几番，', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (9, 3, '针对网站优化的系列策略', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '针对网站优化的系列策略针对网站优化制定了一系列策略，显得尤为重要。网站优化目前主要从以下几个方面入手。关键字策略要点：关键词选取、关键词位置、关键词密度1.确定网站定位内容总共包含的关键词，通常有几百个。频道建设初期选取10-20个左右最核', 0, '', '', '', '针对网站优化的系列策略<br/>\r\n针对网站优化制定了一系列策略，显得尤为重要。网站优化目前主要从以下几个方面入手。<br/>\r\n关键字策略<br/>\r\n要点：关键词选取、关键词位置、关键词密度<br/>\r\n1.确定网站定位内容总共包含的关键词，通常有几百个。频道建设初期选取10-20个左右最核心的关键词，以及由这些词衍生的关键词作为首批优化的对象。<br/>\r\n2.提高googleDouble-Listing的可能性。特别是文章最终页的核心关键字可以是1个为主，伴随2，3个衍生词。<br/>\r\n3.将重要突出的关键字尽量放在首页靠前的位置，为每个栏目页，列表页均匀的分配不同的关键词。<br/>\r\n4.尽量将需要优化的关键词组靠近放置在一个网页中。（例如想优化网站建设，就要尽可能的将网站建设和V网站建设技巧靠近放置）。<br/>\r\n5.可以将关键字放置在页面的链接中。（但这个影响正在减少）<br/>\r\n6.每个网页重点突出的关键字最好控制在4个以内，每个关键字的密度在2％-8％之间。页面核心关键字总密度控制在25％左右。<br/>\r\n7.在title和description中加入关键字（keyword据说已经不再被搜索引擎关注），title中最多放置3个关键词，description最多放置3-4个关键字。用关键词来造句，250个字母。<br/>\r\n8.可以通过给页面加入与主题相关的导出链接的方式，来增加关键词密度。尽量不要通过简单堆砌大量重复关键字的方式来提高关键字的密度。例如围绕网站优化和网站优化策略为关键字的文章，可以通过增加与网站优化、网站优化策略、长城网站优化相关的各种性质文章来达到增加关键词密度的目的。<br/>\r\n网页优化－模板优化<br/>\r\n要点：网页结构、网页主题、网页导航、网页更新<br/>\r\n1.为网页指定明确单一的内容主题。通过频道导航（特别是首页），并在网页中放置关键字，以及频道导入、导出链接的关键字突出主题。<br/>\r\n2.网站的各个页面结构尽量保持简单和一致，有利于搜索引擎理解频道。网页文件的大小最好控制在100K以内，尽量压缩网页内配图的体积以便搜索引擎读取同时提高载入速度；<br/>\r\n3.不要轻易使重定向、框架等对搜索引擎不友好页面处理方式。<br/>\r\n4.标题的文字长度（title）最好控制在40-60个字母以内，并将关键字尽量放置在title中突出主题。<br/>\r\n5.尽量把关键字放到网页文件名中，图片的名字，图片替代文字中使它们更容易被搜索引擎理解。<br/>\r\n6.通过页面之间title和description的描述来突出主题。<br/>\r\n7.把关键字和文章分段标题，重要段落用粗体、斜体、大字体等方式突出网页要表达的主题。<br/>\r\n8.可以。通过关键字在文章标题，正文的位置，突出的方式，出现的频率来体现页面的独特性。<br/>\r\n9.将页面公共内容相似的部分外置。（Yahoo会查看相似页面导出链接的相似性。Google会对网页内容分段建立&ldquo;信息指纹&rdquo;。）<br/>\r\n10.尽量不要在一个频道内出现大量相同或相似的内容页面。文章最终页的正文内容不要过短。<br/>\r\n11.网站栏目网页内容保持规律的更新，文章最终页通过评论等形式保持内容更新。<br/>\r\n链接策略<br/>\r\n要点：导入导出和內链接、链接页面内容相关性<br/>\r\n1.网站首页尽量不要放置过多的导出链接，所有页面导出链接最大不要超过100个。<br/>\r\n2.网站尽量减少交换链接的数量，控制在5，6个高质量网站交换链接。。<br/>\r\n3.一个页面的PR值的一个简单计算公式：PR（A）=0.15+0.85（PR（Ti）/C（Ti）+&hellip;+PR（Tn）/C（Tn））。合理的理由PR值高的页面，并非所有页面都互链就好。<br/>\r\n4.保持导入和导出链接有所指向页面有比较高的质量。例如PR&gt;4的页面。。<br/>\r\n5.使导入、內链接中的源头文字和指向页面内容具有较强的关联性。保持两个相连接页面内容的相关，尽量避免不相关内容页面的链接。<br/>\r\n6.注意导入链接在原页面的位置，通常认为导入链接所在位置的价值关系是：<br/>\r\n原页面导航中&gt;原页面内容中&gt;广告中&gt;合作站点中。<br/>\r\n7.建立HTML站点图，使网站内所有页面与站点图的链接指向页面不超过2层。一个站点图链接最好控制在50个以内。链接过多就要把站点图分为几页<br/>\r\n8.想办法增大导入链接的数量，例如：通过del.icio.us或者在blog等地方发留言等方式<br/>\r\n9.yahoo网站深度链接比值控制在75％以上。<br/>\r\nDLR=Totalbacklinks-Numberofbacklinkstothetoplevelofthewebsitex100％Totalbacklinks<br/>\r\n10.尽量缩短URL的长度，保持在65个字母之内，URL的页面层级在2层以内。<br/>\r\n11.保持网站内所有页面链接的唯一性，尽量不要用多个URL指向同一个页面。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (10, 3, '网站优化最基本的搜索引擎优化策略', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '网站优化最基本的搜索引擎优化策略网站的实际内容是你网络优化策略的一个重要的因素。如果你想你的网站能在搜索结果中排得靠前，在你的网站中必须有实际的内容。搜索引擎的蜘蛛基本上是一个瞎子。他们只能对你网页内容进行判断你网站的质量，而不能从图片、f', 0, '', '', '', '网站优化最基本的搜索引擎优化策略<br/>\r\n网站的实际内容是你网络优化策略的一个重要的因素。如果你想你的网站能在搜索结果中排得靠前，在你的网站中必须有实际的内容。搜索引擎的蜘蛛基本上是一个瞎子。他们只能对你网页内容进行判断你网站的质量，而不能从图片、flash动画上判断。在所有的页面中有充足的内容给搜索引擎进行索引是一个成功搜索引擎优化策略的基本需要。很容易明白，为什么一个没什么内容的网站很难排上去。人们在查找信息的时候，总是希望找到一个包括很多重要信息的网站。很自然，网页内容丰富的网站要比那些网页内容还那么丰富的网站排名要好得多。每个为他们的网站进行优化的站主牢记。不要忘记更新你的网站。无论是搜索引擎还是访问者都希望看到比较新的信息。这是什么意思呢？这就要求你要收集大量的信息，专注于这领域的变化。<br/>\r\n关键字密度<br/>\r\n网页上通常会有数以百计的词语，那么搜索引擎怎样去分辨哪些是描述你的网站的重要的词语呢？搜索引擎会统计你一个页面的字数。那些重复出现的词或短语被认为比较重要些。搜索引擎利用自身的算法来统计你页面中每个字的重要程度。关键字数与该页面字数的比例称为关键字密度，这是一个搜索引擎优化策略最重要的一个因素。为了得到更好的排名，你的关键字必须在页面中出现若干次，或者在搜索引擎允许的范围内。怎样才能知道关键字的密度是多少才能得到较好的排名呢？很简单，只要你在搜索引擎中搜索你要优化的关键字，然后统计一下排在前面几个网站该关键字的密度就可以了。当然也有很多统计关键字密度的工具。<br/>\r\n突出关键字<br/>\r\n在有价值的地方放置关键字，当你统计完你的页面需要多少个关键字后，接下来就是考虑把你的关键字放在网页的什么地方。突出关键字是吸引搜索引擎注意的一个最重要的因素。搜索引擎将会专注于你网页中某一部分的内容，处于这一关注部分的词语显得比其他部分的词语要重要得多。这就是所谓的&ldquo;突出关键字&rdquo;。<br/>\r\n点击流行度<br/>\r\n另外一个在某些搜索引擎中影响排名的因素是点击流行度，在搜索结果中点击连接到你网页的次数会被统计。经常被点击的页面的点击流行度就较高。当访问者从搜索结果中点击你的网站时，搜索引擎将来给你网站奖励一定的分数。如果你的网站得到较高的点击量，那么你将来得到比那些点击量较低的网站更多的分数。不要尝试去重复点击你的网站，对于同一IP的重复点击，搜索引擎会将其删除。当再次重登陆到搜索引擎时会大大影响到排名。搜索引擎会认为这是一个无价值的页面。这并不是一个好的优化策略。<br/>\r\n链接流行度<br/>\r\n链接流行度被认为是搜索引擎优化的一个主要因素。搜索引擎会认为外部链接较多的网站重要性也相对较高。不是所有的链接都是公平的，从高质量网站的链出会给你网站更多的分数。链接文字必须包含有你优化的关键字，这样也会提高你网站的排名。链接流行度并不是在你所能控制的范围，但是你可以按照以下的做法来提高链接流行度：<br/>\r\nA：做一个高质量的网站，如果人们发现他有有价值的内容，他们会主动的与你进行链接。<br/>\r\nB：使交换链接变得更简易。在交换链接页面放置交换链接代码，把交换链接的联系方式放在显眼的地方，方便伙伴与你交换。<br/>\r\nC：在搜索引擎中找出你竞争对手的链接伙伴，要求他们与你进行交换链接。互利的交换链接对双方都是有利的。<br/>\r\nD：在重要的网站中做广告或者在收费目录中提交你的网站。<br/>\r\n当然，你还可以向很多免费目录、黄页等提交。你还可以在你的作品中加上你的链接', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (11, 3, '明确网站优化思路才能更好进行网络营销', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '明确网站优化思路才能更好进行网络营销随着大量黑帽SEO的横行，搜索引擎已经察觉到这种不良现象所带来的不利了：搜索引擎赖以生存的竞价推广在很多优势项目上流失（譬如美容，减肥，医疗这些非常敏感的关键字），那么随之而来的就是搜索引擎作出改变了，它', 0, '', '', '', '明确网站优化思路才能更好进行网络营销<br/>\r\n随着大量黑帽SEO的横行，搜索引擎已经察觉到这种不良现象所带来的不利了：搜索引擎赖以生存的竞价推广在很多优势项目上流失（譬如美容，减肥，医疗这些非常敏感的关键字），那么随之而来的就是搜索引擎作出改变了，它不断改变算法，实际上就是为了滤掉那些黑帽SEO方法所带来的排名，但是无论如何，有一点始终是可以确定的，那就是搜索引擎的最终目的还是脱离不了为用户收集到最真实最有效最权威的信息以供浏览者参考。从这个角度出发，我们就能确定我们优化的最基本策略了，那就是面向用户，同时也面向搜索引擎。<br/>\r\n很多人把SEO与营销分明，我却认为，seo本身就是一种营销，那么我们SEO的策略也就很明显了，那就是我们应该从营销学的角度去SEO，我们建站的目的是什么?就是想用户展现用户想要的也是我们优势的东西，而且我们同时要让搜索引擎能够把它抓取，对，这就是重点，那么我们的思路就明显了，那以下五个因素的就是我们最应该注意的了。<br/>\r\n搜索引擎优化策略：网站内容<br/>\r\n网站的实际内容是你网络优化策略的一个重要的因素。如果你想你的网站能在搜索结果中排得靠前，在你的网站中必须有实际的内容。搜索引擎的蜘蛛基本上是一个瞎子。他们只能对你网页内容进行判断你网站的质量，而不能从图片、flash动画上判断。在所有的页面中有充足的内容给搜索引擎进行索引是一个成功搜索引擎优化策略的基本需要。很容易明白，为什么一个没什么内容的网站很难排上去。人们在查找信息的时候，总是希望找到一个包括很多重要信息的网站。很自然，网页内容丰富的网站要比那些网页内容还那么丰富的网站排名要好得多。每个为他们的网站进行优化的站主牢记。不要忘记更新你的网站。无论是搜索引擎还是访问者都希望看到比较新的信息。这是什么意思呢?这就要求你要收集大量的信息，专注于这领域的变化。<br/>\r\n搜索引擎优化策略：关键字密度<br/>\r\n网页上通常会有数以百计的词语，那么搜索引擎怎样去分辨哪些是描述你的网站的重要的词语呢?搜索引擎会统计你一个页面的字数。那些重复出现的词或短语被认为比较重要些。搜索引擎利用自身的算法来统计你页面中每个字的重要程度。关键字数与该页面字数的比例称为关键字密度，这是一个搜索引擎优化策略最重要的一个因素。<br/>\r\n为了得到更好的排名，你的关键字必须在页面中出现若干次，或者在搜索引擎允许的范围内。<br/>\r\n怎样才能知道关键字的密度是多少才能得到较好的排名呢?很简单，只要你在搜索引擎中搜索你要优化的关键字，然后统计一下排在前面几个网站该关键字的密度就可以了。当然也有很多统计关键字密度的工具（你可以在本站上找到）。<br/>\r\n搜索引擎优化策略：突出关键字<br/>\r\n在有价值的地方放置关键字，当你统计完你的页面需要多少个关键字后，接下来就是考虑把你的关键字放在网页的什么地方。突出关键字是吸引搜索引擎注意的一个最重要的因素。搜索引擎将会专注于你网页中某一部分的内容，处于这一关注部分的词语显得比其他部分的词语要重要得多。这就是所谓的&ldquo;突出关键字&rdquo;。<br/>\r\nTitle和meta标签：在上一节已经提到，title标签是网页中最重要的标签。所以在title中放置关键字显得非常重要。有一些搜索引擎会额外的注意&ldquo;描述&rdquo;与&ldquo;关键字&rdquo;标签。<br/>\r\n标题（headings）<br/>\r\n标题标签为你的访问者指明了哪些是网站中比较重要的内容。&ldquo;标题&rdquo;：是处于<br/>\r\n中的文字。在&ldquo;标题&rdquo;标签中能出现关键字对于提高你网站排名有很大的好处。<br/>\r\n超链接文本：你链接到一个网页与你网站内容相关，这一想法是非常正常的事。这也是关键字在链接文本中为什么那么重要。<br/>\r\n:URL文本：在你的域名和你的网页中出现关键字对于搜索引擎排名会产生很大的影响。这样的关键字被称为&ldquo;URL文本&rdquo;，在另一个网站与你网站建立链接时，尽量使用关键字作为链接文字，这有利于提高你网站的重要性，从而影响到PR。<br/>\r\n顶部：网页顶部的文本，每段开头的内容显得特别重要，所以，尽量在这些地方把关键字包含进来。<br/>\r\n点击流行度<br/>\r\n另外一个在某些搜索引擎中影响排名的因素是点击流行度，在搜索结果中点击连接到你网页的次数会被统计。经常被点击的页面的点击流行度就较高。当访问者从搜索结果中点击你的网站时，搜索引擎将来给你网站奖励一定的分数。如果你的网站得到较高的点击量，那么你将来得到比那些点击量较低的网站更多的分数。不要尝试去重复点击你的网站，对于同一IP的重复点击，搜索引擎会将其删除。当再次重登陆到搜索引擎时会大大影响到排名。搜索引擎会认为这是一个无价值的页面。这并不是一个好的优化策略。<br/>\r\n链接流行度<br/>\r\n链接流行度被认为是搜索引擎优化的一个主要因素。搜索引擎会认为外部链接较多的网站重要性也相对较高。不是所有的链接都是公平的，从高质量网站的链出会给你网站更多的分数。链接文字必须包含有你优化的关键字，这样也会提高你网站的排名。链接流行度并不是在你所能控制的范围，但是你可以按照以下的做法来提高链接流行度：<br/>\r\n做一个高质量的网站，如果人们发现他有有价值的内容，他们会主动的与你进行链接。<br/>\r\n使交换链接变得更简易。在交换链接页面放置交换链接代码，把交换链接的联系方式放在显眼的地方，方便伙伴与你交换。<br/>\r\n在搜索引擎中找出你竞争对手的链接伙伴，要求他们与你进行交换链接。互利的交换链接对双方都是有利的。<br/>\r\n在重要的网站中做广告或者在收费目录中提交你的网站。<br/>\r\n当然，你还可以向很多免费目录、黄页等提交。你还可以在你的作品中加上你的链接（如ebook，发表的文章等）。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (12, 3, 'seo优化心态“成绩和排名都是昨天”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '如果想要走进seo这个行业当中，你的前提必须能拥有一个淡定的心态，不管你是学习百度搜索引擎的优化还是谷歌，都要保持一个平衡心态，可以坚持的住搜索引擎给你带来的困扰。就和我们在校学生一样，如果有难题你能解决了，那么老师是不是会比较欣赏你比较看', 0, '', '', '', '如果想要走进seo这个行业当中，你的前提必须能拥有一个淡定的心态，不管你是学习百度搜索引擎的优化还是谷歌，都要保持一个平衡心态，可以坚持的住搜索引擎给你带来的困扰。就和我们在校学生一样，如果有难题你能解决了，那么老师是不是会比较欣赏你比较看重你呢?同样搜索引擎也会这样看待你，看待你的网站。<br/>\r\n据统计分析，很大一部分的seo朋友，他们无法忍受辛辛苦苦seo了几个月的网站却没有任何的收入。于是便有了现在深受广大站长欢迎的站群思路，没错，站群见效确实很快，而且收入也很高。但这样属于一种作弊的手法，你这次横穿马路没有出事故，那么下次呢?下下次呢?你这次考试作弊没有被老师发现，那么下次会不会就被发现了呢?同样的道理，百度是非常排斥站群的，这样对广大seo站长不公平，同样的会误导一些seo新手们学习seo的正确思路。<br/>\r\n百度SEO排名第一，是无数SEOer精英和SEO站梦寐以求的位置，无数SEOer都在向排名第一奋斗，但是丘士达和SEO资料站都骄傲了，我就是第一。每个SEO都要谦虚、每天都要学习新知识，成绩和排名都是昨天的。<br/>\r\nSEO优化前要做的是做好整个网站的前期工作，定位和调整自己的心态。<br/>\r\n做SEO的态度，谦虚、真诚、决心、要做的是一个点，而不是一个面。SEO不只只是做外链。SEO的归纳，做SEO，重要在于源源不断的长尾关键词。做深入、做垂直，等成功后，再扩展。领悟搜索引擎与网站的沟通。五条金律，面对客户，必真诚、为客户服务周到。对于做事业的，必先了解SEO知识，网站的排名要素在于锚文本。<br/>\r\n很多人都会这样认为,以为我骄傲了.可是你有没有站在我的角度想过?为什么那么多人喜欢丘仕达的文章?有没想过这个问题?我的文章全部都是实战.从一开始的系列讲座到升降机案例到热血江湖私服案例到车载冰箱案例到163邮箱案例到土豆网案例到英文站sometopics案例,每个案例都有其独特的地方:<br/>\r\n讲座系列是入门;升降机是商业词,很多企业站都可以参考;热血江湖私服是热门词,从分词及创意链接建设的角度打造成一个成功案例;车载冰箱是商业词,与升降机不同的,在于它是单页面,对商城类或多产品的站有借鉴意义;163邮箱是巧用百度相关搜索,教大家如何寻找低竞争度高搜索量的词;土豆网案例是直接借用知名网站的品牌,瓜分流量;英文站案例是从中文站到英文站的一个跨度,过了这道槛,也许就可以到达另一个境界...', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (13, 3, '网站优化中的四个不可忽视', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '一、网站安全检测不可以忽略俗语说，身体是革命的本钱，网站也不是例外，如果一个网站不健康，那么它就没法在这互联网生存下去。据一些安全网站的统计，造成网站流量急促下降的原因排名在首位就是网站被黑或挂马，故做好网站安全维护，是让网站有稳定流量的保', 0, '', '', NULL, '一、网站安全检测不可以忽略<br/>\r\n俗语说，身体是革命的本钱，网站也不是例外，如果一个网站不健康，那么它就没法在这互联网生存下去。据一些安全网站的统计，造成网站流量急促下降的原因排名在首位就是网站被黑或挂马，故做好网站安全维护，是让网站有稳定流量的保证。目前针对网站的安全维护更多在于网站漏洞的检测和修复。一般网站安全检测有：SQL注入漏洞检测、XSS跨站攻击测试、数据库权限检测和文件夹权限检测。如果是新手的可以去亿思网站安全检测平台（iiscan）里面进行扫描，属于比较傻瓜化工具。另外，务必要把发现漏洞及早修复，否则还是很容易遭受入侵。<br/>\r\n二、网站内链优化不可以忽略<br/>\r\n网站内链优化跟外链优化是同等重要的，外链的目前是吸引蜘蛛的到来，而内链的作用就是延长蜘蛛在网站逗留时间。相信不少站长也有做网站内链的优化，但很多就简单将关键字链接到首页而已。这样内链优化显然是不及格的。一个好的内链优化是将链接形成一个网状，如一些相关内容的文章，就可以共有关键词链接。像国内的时光网这些网站的内链优化就做得很好，一个关键字往往引起几篇文章的导读列表中，这样蜘蛛会在网站里面不断逗留，也会更快采集到你最新发布的信息。<br/>\r\n三、网站的外链也不可以忽略<br/>\r\n要知道为什么要做外链。其实做外链就是增强自己网站的权重和认可性。每当别人的网站上出现了自己网站的一个网址时，那么这个网址就是自己的外链。它相当于别人的网站为自己的网站投了一票，认可自己的网站。但是这个外链对自己网站的作用是有差异的。当一个外链是来自一个权重很高的网站的时候，那么对自己的网站的权重和排名就会起很大的影响了。否则，就可能所起的做用就很小了，甚至某些差的网站还会起反的作用，影响自己网站的排名和权重。那么什么样的网站才是好的呢?具体的说就是那些合法的网站，并且网站的快照收录正常，网站的pr值越高越好。在这样的网站上做外链，自然对自己的网站就有很大的作用了。<br/>\r\n做外链也要找相关性的网站，并且外链的锚文本要使用关键字。我们做外链并不是随随便便的在仍何网站上去做，尤其是做网站的友情链接，我们要找那些与我们行业相关或者是相近的网站去做交换，因为，外链的来源页面与自己的网站内容越相关，那么对自己的网站排名就越有用。帮助性就越大。否则起到的作用就微乎其微了。此外，做网站外链的锚文本与自己的关键词最好保持一致，这样就不会导致权重分散，与那些不相关的锚文本做外链相比，会对网站的排名更加有利。因此，做外链时要注意相关性和锚文本的描述。做外链时要注意外链的来源页面和外链的出现位置，禁止以作弊的手段做外链。我们在做外链的时候也不能随便的看那个网站的权重高就去做。做外链不仅要看对方网站权重和快照的更新情况，还要看对方网站已经导出外链的数量。一个高权重的网站，网站快照也非常靠前能够实现隔日更新。固然是一个做外链的不错选择，但是，我们还要看它网站上已经导出的外链的数量，如果它页面上导出的外链数量相当多，那么久意味着每个网站分得的权重相当低，那么与这样的网站做外链也不会有多少好处。最后网站的外链数量越多，那么意味着网站的认可度就越高，但是这些外链不要通过作弊的手段来实现，那么只是眼前一时的风光，最后终究是要被发现继而会受到搜索引擎的惩罚的。网站的外链最好出现在文章之中，这样才更好。这样就可以被避免指认为垃圾外链。好了说了这么多，相信你对网站的外链如何去做，已经有了一个深入的了解吧。这就是我所分享的我们在做网站优化外链的时候要注意的问题。希望有所启发帮助。网站优化做起来自然就很简单了。<br/>\r\n四、网站内容原创性不可以忽略<br/>\r\n网站的内容终究给浏览者看的，而且原创性内容是吸引他们眼球的重要法宝，另外，网站内容原创性对网站内容收录也起到很大作用。其实针对一些新手来说，一时半刻写出一些原创性文章，的确是有难度的，但如果一味转载别人的文章，那么这站也吸引不了什么用户，也吸引不了蜘蛛的到来。所以，对于新手来说，网站务必要有原创。可以针对一些资讯文章里面添加一些个人的见解，这就属于自己原创性的东西，可以看一下网易、腾讯这些大网站，其资讯类文章的内容基本一样，但往往在后面加多几个评价或内容补充，这就成一篇原创文章;而对于一些教程类文章，可以先模仿前人的操作，然后根据自己实际操作再写，这样也是自己很好的原创。<br/>\r\n原创文章作用不仅体现在网站的收录和外链的增加上，它还贡献了用户点击。搜索引擎给予网站排名的一个重要参考因素，就是网站的流行度。当用户访问你的网站，并被你网站内容深深吸引，以至于成为网站常客，然后越来越多人慕名而来，访问量与回头客越来越多。而搜索引擎以此来判断这个网站很有价值，并且给予高权重，如一些seo名人博客就是如此，ZAC、乐思蜀博客。这也是一些seo排名软件的原理，模拟用户访问网站，点击网站，以此来欺骗搜索引擎，获取好的排名。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (14, 3, '关键词的位置在网站优化推广中的作用', NULL, '', '', '', '', NULL, '关键词的位置在网站优化推广中的作用', '关键词分布是指这些关键词在网页上的位置。这个位置可以是title标签、链接、headings、文本主体，或任何有文字出现的地方。title标签是一个网页最重要的搜索关键词放置的最佳位置。在title标签内，关键词的布局方式是很重要的。最重要', 0, '', '', '', '<p>关键词分布是指这些关键词在网页上的位置。这个位置可以是title标签、链接、headings、文本主体，或任何有文字出现的地方。<br />\r\n<br />\r\ntitle标签是一个网页最重要的搜索关键词放置的最佳位置。在title标签内，关键词的布局方式是很重要的。最重要的关键词应放置在网页title标签的开头部分。如果放<br />\r\n上全部关键词，则在title标签内有造成关键词堆砌（keywordstuffing）的危险。千万不要在title标签内使用任何关键词超过三次。为了防止触发关键词堆砌过滤器（keyword<br />\r\nstuffingfilter），最多出现两次会更安全。<br />\r\n<br />\r\n对于优化来说，我们要将关键词尽可能的放在网站的各个角落，千万不要因为懒惰而不去做。像最开始的时候域名、logo、图片alt标签、导航等等，还有关键词一定要在锚文本，文章，栏目中出现，这样对于网站关键词的布局来说很重要。<br />\r\n<br />\r\n还有关键词的组合是在推广中的一个重要步骤，主要是在将关键词分布的同时进行关键词的细分组合，更多的使用在一些大型网站的优化上，会使整个站点进行了很精细化的布局之后，然后再将整个站点相关以及有用户常规关键词的关键词进行组合推广，这样子能够在无形之中增加网站的相关度，以及整站的权威度。<br />\r\n<br />\r\n当搜索引擎调整的时候，关键词的排名就会忽上忽下，如果在搜索引擎调整前，网站进行改变，那么就会有好的排名。变可以是网站颜色的改变，网站功能的变，这些属于页面的变，还有一个是用户体验的变。如果你的网站内容足够真实，有理有据，经过好心人的转载，那么你网站的流量会有很大的提高。提高用户体验不要想的很难，只要你站在用户考虑问题就好了，不要自己太主观了。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (15, 3, '网站优化中七个增加外链的方法', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第一，我们要知道为什么要做外链。其实做外链就是增强自己网站的权重和认可性。每当别人的网站上出现了自己网站的一个网址时，那么这个网址就是自己的外链。它相当于别人的网站为自己的网站投了一票，认可自己的网站。但是这个外链对自己网站的作用是有差异的', 0, '', '', NULL, '第一，我们要知道为什么要做外链。其实做外链就是增强自己网站的权重和认可性。每当别人的网站上出现了自己网站的一个网址时，那么这个网址就是自己的外链。它相当于别人的网站为自己的网站投了一票，认可自己的网站。但是这个外链对自己网站的作用是有差异的。当一个外链是来自一个权重很高的网站的时候，那么对自己的网站的权重和排名就会起很大的影响了。否则，就可能所起的做用就很小了，甚至某些差的网站还会起反的作用，影响自己网站的排名和权重。那么什么样的网站才是好的呢?具体的说就是那些合法的网站，并且网站的快照收录正常，网站的pr值越高越好。在这样的网站上做外链，自然对自己的网站就有很大的作用了。<br/>\r\n第二：博客网站是权重高而且流量大的资源，而且现在的博客都是免费的，所以我们更要利用起这些资源，例如我们在博客中写文章加入链接或者是在其他博客中留言加入链接，可以大量的推广。<br/>\r\n第三：软文的投放，软文是一种很好的宣传方式，如果你写一篇很精彩的文章并且发布到相应权重高的网站上，之后会有很多网站进行转载，这样就大大增加了网站的外链。<br/>\r\n第四：论坛的个性签名，在一些权重高的论坛上发布留言并且在留言中的个性签名中设置网站的链接。<br/>\r\n第五，做外链也要找相关性的网站，并且外链的锚文本要使用关键字。我们做外链并不是随随便便的在仍何网站上去做，尤其是做网站的友情链接，我们要找那些与我们行业相关或者是相近的网站去做交换，因为，外链的来源页面与自己的网站内容越相关，那么对自己的网站排名就越有用。帮助性就越大。否则起到的作用就微乎其微了。此外，做网站外链的锚文本与自己的关键词最好保持一致，这样就不会导致权重分散，与那些不相关的锚文本做外链相比，会对网站的排名更加有利。因此，做外链时要注意相关性和锚文本的描述。<br/>\r\n第六，做外链时要注意外链的来源页面和外链的出现位置，禁止以作弊的手段做外链。我们在做外链的时候也不能随便的看那个网站的权重高就去做。做外链不仅要看对方网站权重和快照的更新情况，还要看对方网站已经导出外链的数量。一个高权重的网站，网站快照也非常靠前能够实现隔日更新。固然是一个做外链的不错选择，但是，我们还要看它网站上已经导出的外链的数量，如果它页面上导出的外链数量相当多，那么久意味着每个网站分得的权重相当低，那么与这样的网站做外链也不会有多少好处。最后网站的外链数量越多，那么意味着网站的认可度就越高，但是这些外链不要通过作弊的手段来实现，那么只是眼前一时的风光，最后终究是要被发现继而会受到搜索引擎的惩罚的。网站的外链最好出现在文章之中，这样才更好。这样就可以被避免指认为垃圾外链。好了说了这么多，相信你对网站的外链如何去做，已经有了一个深入的了解吧。这就是我所分享的我们在做网站优化外链的时候要注意的问题。<br/>\r\n第七，坚持原创。这句话是老生常谈了，这里就再啰嗦一次，由于我的是个人独立博客，而博客的本质在于记录、分享和交流，而原创内容则是促进交流互动的主要方式，我在我建立个人独立博客起写的第一篇文章也有说到做这个博客是为了更好的学习和实践SEO，也是对自己查漏补缺，而原创正是做好SEO的利器之一，既能够提高自己的原创写作能力，也是对来到你博客的博友一种态度、一种责任。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (16, 3, '网站优化关键词是决定网站排名的重点', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '网站优化关键词是决定网站排名的重点关键词是整个网站登录过程中最基本，也是最重要的一步，是我们进行网页优化的基础，因此怎么强调其重要性都不过分。然而关键词的确定并非一件轻而易举的事，要考虑诸多因素，比如关键词必须与你的网站内容有关，词语间如何', 0, '', '', NULL, '网站优化关键词是决定网站排名的重点<br/>\r\n关键词是整个网站登录过程中最基本，也是最重要的一步，是我们进行网页优化的基础，因此怎么强调其重要性都不过分。然而关键词的确定并非一件轻而易举的事，要考虑诸多因素，比如关键词必须与你的网站内容有关，词语间如何组合排列，是否符合搜索工具的要求，尽量避免采用热门关键词。所以说选择正确的关键词绝对是需要下一番工夫的。<br/>\r\n选择相关的关键词<br/>\r\n对一家企业来说，挑选的关键词当然必须与自己的产品或服务有关。不要听信那些靠毫不相干的热门关键词吸引更多访问量的宣传，那样做不仅不道德，而且毫无意义。试想一个查找测速仪的人，会对你生产的酱油感兴趣吗?当然不。必须承认，有时这种作法的确能提高网站的访问量，但既然你目的是销售产品，不是提供免费的小道消息，那么靠这种作弊手段增加访问量又有何用呢?<br/>\r\n选择具体的关键词<br/>\r\n我们在挑选关键词时还有一点要注意，就是避免拿含义宽泛的一般性词语作为主打关键词，而是要根据你的业务或产品的种类，尽可能选取具体的词。比如一家销售木工机具的厂家，&ldquo;CarpenterTools&rdquo;不是合适的关键词，&ldquo;ChainSaws&rdquo;则可能是明智的选择。<br/>\r\n有人会问，既然&ldquo;CarpenterTools&rdquo;是集合名词，涵盖了厂家所有的产品，为什么不用?我们不妨拿CarpenterTools到Google一试，你会发现搜索结果居然在6位数以上（实际数字为189,000），也就是说你的竞争者有近200,000个!想在这么多竞争者当中脱颖而出几乎是&ldquo;不可能完成的任务&rdquo;。相反，&ldquo;ChainSaws&rdquo;项下的搜索结果则少得多（69,800个），你有更多的机会排在竞争者的前面。<br/>\r\n选用较长的关键词<br/>\r\n与查询信息时尽量使用单词原形态相反，在提交网站时我们最好使用单词的较长形态，如可以用&ldquo;games&rdquo;的时候，尽量不要选择&ldquo;game&rdquo;。因为在搜索引擎支持单词多形态或断词查询的情况下，选用&ldquo;games&rdquo;可以保证你的网页在以&ldquo;games&rdquo;和&ldquo;game&rdquo;搜索时，都能获得被检索的机会。<br/>\r\n不少关于如何选择关键词的文章都特别提到单词的错误拼写，如&ldquo;contemorarymoderncoffeetables&rdquo;，提醒我们别忘将之纳入关键词选择之列。其理论是，有些单词经常被用户拼错，考虑到一般人不会以错别字作为自己的目标关键词，因此如果聪明的你发现了这一诀窍，以错拼单词优化你的网页，那么一旦遇到用户再以这个错别字进行搜索，你就会高高在上，昂然屹立于搜索结果的前列!', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (17, 3, '做好seo优化就是网站优化成功的一半', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第一，内容的优化：1、不要建立一个文本内容过长的网页，要适度使用分页来显示，没有人愿意读长篇的内容，那样会让眼睛很累。2、文笔要多变，搜索者很可能会使用不同的组合词或者不同的词序。3、在最前面以最重要的信息作为开始，继续在整篇文章中强调重要', 0, '', '', NULL, '第一，内容的优化：<br/>\r\n1、不要建立一个文本内容过长的网页，要适度使用分页来显示，没有人愿意读长篇的内容，那样会让眼睛很累。<br/>\r\n2、文笔要多变，搜索者很可能会使用不同的组合词或者不同的词序。<br/>\r\n3、在最前面以最重要的信息作为开始，继续在整篇文章中强调重要的概念，最后通过一个强有力的总结作为结束。<br/>\r\n4、要像直接的营销人员一直思考。怎么样撰写内容才可以留住访客，使用语言的魅力留住大部分人。<br/>\r\n第二，细节（可以这样理解为产品图片一定要显示、产品说明要没有错别字、只要能填的信息都填上）这让做的目的很简朴，&lt;4.细节（可以这样理解为产品图片一定要显示、产品说明要没有错别字、只要能填的信息都填上）这让做的目的很简朴。让我客户以为我很细心、专业、有实力！产品页面用好h1标签，使用合适的字体加粗。主要是产品名称用好h1，产品描述中对产品名称进行加粗加黑。当然，尽量不要破坏用户的感觉。（这个，我也没有提到产品页面关键词的密度问题。现在用户体验很重要，一般关键词密度合适就够了。<br/>\r\n第三，其他诸如外链的互换、网站服务器的稳定、打开速度、域名时间长短就不谈了。最后，我看到很多网站的代码不够简洁，对于SEO优化不是很友好。网站导航链接是搜索引擎蜘蛛向下爬行的重要线路，也是保证网站频道之间互通的桥梁，建议使用文字链接。<br/>', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (18, 3, '关键词优化的三大误区及解决方法', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1、关键词选择过于宽泛这个现象经常出现在对网站建设制作和网站关键词优化知之甚少，甚至一点都不了解的客户身上。相对宽泛的关键词，的确能够带来更多流量，及更多的潜在客户。但是同样的，宽泛的关键词也同样增加了优化难度，工作量的加大以及时间的增长同', 0, '', '', NULL, '1、关键词选择过于宽泛<br/>\r\n<br/>\r\n这个现象经常出现在对网站建设制作和网站关键词优化知之甚少，甚至一点都不了解的客户身上。相对宽泛的关键词，的确能够带来更多流量，及更多的潜在客户。但是同样的，宽泛的关键词也同样增加了优化难度，工作量的加大以及时间的增长同样会提升优化成本及优化风险。如果我们的客户主要来自本地区，那么不妨使用&quot;地名+核心词&quot;的方式，比如&quot;上海网站建设&quot;。或者也可以给核心词前面加一个定语，类似&quot;专业网站建设&quot;这样的词就是降低了优化难度。相比宽泛的关键词优化结果的不确定性，倒不如选择更有把握的关键词，通过服务确定在了一个区域，其实优化而来的效果也不见得就差。<br/>\r\n<br/>\r\n解决方法：<br/>\r\n<br/>\r\n毋庸置疑，关键词确定首先是一定要吻合网站主题。如果网站是以网站建设制作为主的，那么关键词一定是围绕着&ldquo;网站建设&rdquo;，甚至&ldquo;网络公司&rdquo;这个主题的。很多人在确定关键词时，东一榔头西一棒槌，甚至有些词都风马牛不相及。不仅加大了优化难度，即使优化上去了，由于没有系统的规划，也为以后的工作埋下了隐患。关键词确定缺乏系统性，也是很多刚开始学习实践优化的朋友经常犯得错误，我们通过长期积累发现，网站关键词优化就像数学上的画圆，理想的状态的就是更多的出现交集。<br/>\r\n<br/>\r\n最大的交集莫过于同心多圆，同一个圆心下，以不同半径画圆，交集出现的最多，网站优化也最省力气效果也最理想。何谓关键词选择同心多圆呢?就是确定一个核心关键词，围绕着核心词发掘选择一些延展词和长尾词。比如&ldquo;网站建设&rdquo;是核心词，那么&ldquo;上海网站建设&rdquo;、&ldquo;专业网站建设&rdquo;、&ldquo;网站建设公司&rdquo;就是延展词，&ldquo;上海网站建设找哪家&rdquo;、&ldquo;网站建设公司怎么样&rdquo;等等就是长尾词。而这些词，最大的交集就是&ldquo;网站建设&rdquo;，也就是实现确定的核心词。<br/>\r\n<br/>\r\n2、关键词数量过于众多<br/>\r\n<br/>\r\n如果一个网站的权重足够，其实无所谓什么词，只要相关性足够都一定可以排在很靠前的位置。这也是为什么一些高权重的网站，很多延展词和长尾词都带来非常可观的流量的原因。但是问题就是我们网站的权重不够，不然也不至于这么辛苦的想办法优化了。对一个权重并不理想的网站来说，明智的做法就是确定少而精的关键词，而非贪多求全。而且数量有限的关键词确定上，也要可能的吻合同心多圆的准则，尽可能多的出现关键词权重交集。相关这点，笔者在文章《基于网站优化的关键词选择方法分析解读》做过专门论述，其中的第一条就是：关键词选择同心多圆。<br/>\r\n<br/>\r\n解决方法：<br/>\r\n<br/>\r\n很多站长喜欢把很多关键词放在首页上，认为首页权重高，把关键词放在首页，得到排名的机会高一点。如果你能找到的主要和次级关键词不太多，一共四五个，那么这样还可以接受。但如果最重要和比较重要的相关关键词有10多20个，那就不要勉强都挤在首页上。<br/>\r\n每一个页面的目标关键词限制在2-3个，不然页面内容写作，内部链接的安排，外部链接的锚文字等都会遇到矛盾无法解决。最后的结果是，一个页面也还只是能得到2-3个词的排名而已。不如提早规划，把不同重要性的词分布到不同的页面。<br/>\r\n<br/>\r\n3、关键词确定过于主观<br/>\r\n<br/>\r\n没有调查就没有发言权，网站关键词的选择同样需要调查，从而科学的选择合适的词。这个笔者深有感触，规划网站制作的时候，自以为是的感觉&quot;网页制作&quot;这样的词一定比较热门，甚至认为基本上和&quot;网站建设&quot;这样的词流量差不多吧。当时就把公司的网站的TITLE侧重于网页制作，但是后来对用户访问流量分析才发现，事实并非如此。在确定关键词时候，一定不能主观，而是要进行一个缜密客观的分析。最好的办法就是分析一下竞争对手的网站，看看他们确定了哪些词。如果优化对象是百度，那么百度指数也是一个不错的参考。<br/>\r\n<br/>\r\n解决方法：<br/>\r\n<br/>\r\n进行深入的关键词研究，除了避免最主要关键词选择重大失误，也有助于所有关键词在不同频道页的安排。最主要关键词通常是搜索数量最多的那2-3个，搜索次数低一等级的有哪些?这些词之间的意义差异性有多大?是否应该安排独立的频道?哪些词可以合并在一个频道?有多少这种中等程度的关键词需要安排?网站的整体架构是否能够满足这些关键词?是否找到的关键词太少，不足以使网站架构足够丰满?等等。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (19, 3, '有效的优化企业网站的四点技巧', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '	1、确定网站主题关键词：根据企业网站的产品和内容，选择合理的关键词，然后对所选择的关键词进行分析，主要是看关键词的竞争度大小，包括被搜索量，竞争对手的使用等情况。据此来确定网站最终的主题目标关键词，一般为三到五个主题关键词。	做产品的关键', 0, '', '', NULL, '<div>\r\n	1、确定网站主题关键词：根据企业网站的产品和内容，选择合理的关键词，然后对所选择的关键词进行分析，主要是看关键词的竞争度大小，包括被搜索量，竞争对手的使用等情况。据此来确定网站最终的主题目标关键词，一般为三到五个主题关键词。</div>\r\n<div>\r\n	做产品的关键词密度分布要合适，SEO要根据关键词密度判断这个网站的中心思想，一般在百分之二和百分之八之间，密度很低，中心思想不突出，可能影响排名，现在密度很多，有作弊嫌疑，会被降低权重或者被惩罚。</div>\r\n<div>\r\n	2、合理规划网站标题、描述等信息：一个网站，确定好关键词后，就要规划网站的标题和描述信息了。搜索引擎在爬寻和收录一个网站的时候，是通过网站标题和描述以及关键词来进行识别和判断网站的类别和性质以及主题内容的。所以合理的网站标题、描述信息，对于网站被搜索引擎收录有非常大的帮助。</div>\r\n<div>\r\n	网站题目要包含网站产品的keywords,网友在访问时，通常搜索的是关键词，不是企业的名字，根据SEO抓取原理，只有题目中有相关关键词才能被用户查到，标题位置是很重要的，好比现在炒得像地王一样。</div>\r\n<div>\r\n	3、巧妙布局长尾关键词：一般情况下，主题关键词是定位网站的主题，而真正能够带来意向客户的，往往是合理的长尾关键词。根据目标关键词，展开相关内容的分析，包括产品、行业等信息，最终确立被搜索量大，竞争小且能符合自己站点的长尾关键词，可以给网站带来非常可观的流量以及意向客户。</div>\r\n<div>\r\n	4、规划网站的结构和内容：在上面的关键词等信息确立好后，就该对网站布局结构和具体内容了。在网站上，按照搜索引擎蜘蛛爬寻规则，合理布局内容和关键词，可以使网站达到一个良好的搜索引擎友好度。另外需要注意，在网站的页面，尽量不出现flash和JS特效。尽量少用图片。对图片添加Alt属性标签，便于搜索引擎识别图片含义。</div>\r\n<div>\r\n	要强调的是网站内容的原创和更新频率很重要，还有最重要的是，文章内部关键词布局。文章标题里一定要出现关键词，而且越先出现越好，标题用h1标签进行框定企业站内容和标题都是从数据库里面调用出来的，那么我们要修改相应的程度文件，在标题调用部分用h1标签进行限定。文章的第一段一定要出现关键词，链接到首页，而且在前50个字出现为最佳</div>\r\n<div>\r\n	文章中间部分合理出现一定频率的关键词就ok，文章最后一段的后100个字必须出现关键词，文章最后用&ldquo;上一篇&rdquo;和&ldquo;下一篇&rdquo;进行内部链接的构建，紧接着用相关文章推荐的方式进行链接构建。</div>', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (20, 3, '谈谈做好网站的外链优化的技巧', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '	首先就是内容了，内容就是软文，软文的投放，在网站运营这方面是非常有效的，而且软文也是外链建设的非常好的一个方式，软文的质量直接决定了它的传播速度，在这呢给大家介绍一个软文投放的好地方www.admin5.com这个网站的软文转载性非常强，', 0, '', '', NULL, '<div>\r\n	首先就是内容了，内容就是软文，软文的投放，在网站运营这方面是非常有效的，而且软文也是外链建设的非常好的一个方式，软文的质量直接决定了它的传播速度，在这呢给大家介绍一个软文投放的好地方<ahref=\"http://www.admin5.com\">www.admin5.com</a>这个网站的软文转载性非常强，不过审核比较严格，只要你的审核过了，百度一百回收录，而且会有很大一部分人立马转载。</div>\r\n<div>\r\n	其次是论坛个性签名，不要小瞧了这一点，都以为论坛交流起不了多大的用处，你可以想象一下，顶一个帖子增加一个外链，一天去顶20个帖子，我们网站每天都会稳步增加一定的链接，网站权重是不是会一点点的在提升呢?坚持每日去论坛顶帖子，见效很快。</div>\r\n<div>\r\n	不过关于论坛签名，验证有没有用一个最简单的方法就是，直接带上网址，如果是比较热门的论坛的话，比如说A5论坛，签名在那里，第二天你百度一下你的网址，如果在A5论坛有出现的话，那么就是有用的，就是被收录的，自然链接的签名就是有用的，所以逛论坛也是我们必须要努力的，努力拿到带签名的权利，虽然别人不会去点，但是蜘蛛会去爬，一天发很多帖子也是算外链的，学习和做链接两不误，何乐而不为呢，一些大的论坛，比如说A5，新浪论坛，SEOWHY，等，这些都是可以去的地方，只要你用心发现，有很多地方都是可以进步的。</div>\r\n<div>\r\n	第三那是友情链接，在外链中，友情链接应该算是比较实惠的，为什么这么说呢?因为这是互相受益的一个过程，只要我们链接的网站没有被K或者降权，对我们是有百利而无一害的。链接的时候注意一点，你不要非得链接比你PR值高的站点，人家一般也不会跟你交换链接，最好就是找比你低点，或者差不多的网站，找有潜力的，链接方面就得自己多方面的揣摩了。</div>\r\n<div>\r\n	值得注意的是跟别人交换友谊链接时必定要用site:对方网站网址,检查对方网站在谷歌和baidu是否收录.如果未收录.请千万别加他的友谊链接.可能这个站是被搜索引擎K过的.您加上他的链接的话必K.那就全完蛋了.</div>\r\n<div>\r\n	第四点建设博客，找几个权重比较好的博客，多花点心血努力的建设起来，等到一定程度，会有意想不到的惊喜。还有很多方式可以用，比如去好点的论坛发帖了，添加网址目录了等等，都有待我们一起去探索。</div>\r\n<div>\r\n	最后添加外链在短时间不是越多越好.保持一天平均就行，不要今天心情好就加它几十条，明天一条不加这样就不好了.也不要一次加外链过多，过多只会让搜索引擎注意到您.最后会K了您站.做外链保持,平均和有质量才是最重要的.俗话是&ldquo;内容为皇，外链为王&rdquo;，所以高质量的外链也是对网站排名非常重要的。现在问答类网站比较多，他们往往喜欢采集这些大型网站的数据，所以你发一条外链，很有可能就等于发了N条，不过前提是质量一定要高。那么怎样才会有高质量的外链呢？</div>', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (21, 3, '网站优化设计中不可顾此失彼的三方面', '', '', '', '', '', '', '网站优化设计中不可顾此失彼的三方面', '	网站优化设计的含义具体表现在三个方面：		第一方面、从用户的角度来说，经过网站的优化设计，用户可以方便地浏览网站的信息、使用网站的服务；以用户需求为导向，设计方便的网站导航，网页下载速度尽可能快，网页布局合理并且适合保存、打印、转发，网站', 0, '', '', '', '<div>网站优化设计的含义具体表现在三个方面：</div>\r\n\r\n<div>第一方面、从用户的角度来说，经过网站的优化设计，用户可以方便地浏览网站的信息、使用网站的服务；以用户需求为导向，设计方便的网站导航，网页下载速度尽可能快，网页布局合理并且适合保存、打印、转发，网站信息丰富、有效，有助于用户产生信任；<br />\r\n<br />\r\n第二方面、从基于搜索引擎的推广网站的角度来说，优化设计的网站使得搜索引擎则可以顺利抓取网站的基本信息，当用户通过搜索引擎检索时，企业期望的网站摘要信息可以出现在理想的位置，使得用户能够发现有关信息并引起兴趣，从而点击搜索结果并达到网站获取进一步的信息的服务，直至成为真正的顾客；适合搜索引擎检索（搜索引擎优化），便于积累网络营销网站资源（如互换链接、互换广告等）；<br />\r\n<br />\r\n第三方面、从网站运营维护的角度来说，网站运营人员则可以对网站方便地进行管理维护，有利于各种网络营销方法的应用，并且可以积累有价值的网络营销资源，因为只有经过网站优化设计的企业网站才能真正具有网络营销导向，才能与网络营销策略相一致。充分体现网站的网络营销功能，使得各种网络营销方法可以发挥最大效果，网站便于日常信息更新、维护、改版升级，便于获得和管理注册用户资源等。</div>\r\n\r\n<div>从上面可以看出，网站优化设计并非只是搜索引擎优化，搜索引擎优化只是网站优化设计中的一部分，不过这部分内容对于网站推广的影响非常明显和直接，因此更容易引起重视。同时，我们也可以看出，在有关网站设计的对网站推广优化的内容中，这里并没有特别强调搜索引擎优化的作用，因为真正的网站设计优化不仅仅是搜索引擎优化，应坚持用户导向而不是搜索引擎导向。</div>\r\n\r\n<div>所以，在网站优化中应坚持以用户为导向的原则，因为网站的内容和服务是否有价值最终是由用户来判断的，即使网站在搜索引擎中的表现很好，如果用户使用感觉很不方便，同样不会产生理想的效果。而且，网站推广也并非完全依赖搜索引擎，还需要综合考虑各种相关因素。因此网站优化设计中三个层面的内容不能顾此失彼，应实现全面优化，尤其是对用户的优化应放在首位。</div>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (22, 3, '网站中的标题和关键词优化原则', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '标题优化原则：a.俗话说，题好文一半，题高文则深。读标题的人是读正文的5倍，标题好比商品价码标签，要用标题向消费者打招呼，并以此抓住消费者的目光。b.每个标题都应带出产品给潜在买主自身利益的承诺。这种承诺明显有益于消费者。c.标题中突出产品', 0, '', '', NULL, '标题优化原则：<br/>\r\n<br/>\r\na.俗话说，题好文一半，题高文则深。读标题的人是读正文的5倍，标题好比商品价码标签，要用标题向消费者打招呼，并以此抓住消费者的目光。<br/>\r\n<br/>\r\nb.每个标题都应带出产品给潜在买主自身利益的承诺。这种承诺明显有益于消费者。<br/>\r\n<br/>\r\nc.标题中突出产品或服务的优势和特点，知名品牌要在标题中出现，如诺基亚6500S<br/>\r\n<br/>\r\nd.始终注意在标题中加入新的信息，带有信息的广告标题，往往会多出22％的人记住它。<br/>\r\n<br/>\r\ne.在标题中避免使用否定词、使用完整的公司名称、加入联系方式、不相干人名等杂乱信息。避免使用有字无实的瞎标题。<br/>\r\n<br/>\r\nf.标题中一定要包含关键词：<br/>\r\n<br/>\r\ng.关键字出现在不同地方，有不同的效果，吸引力排名如下：<br/>\r\n<br/>\r\n标题＋网页描述&gt;标题&gt;网页描述&gt;不出现关键字<br/>\r\n<br/>\r\n如果您的网站标题中含有关键字，那么效果比只有网页描述中含有关键字更好，当然效果最好的是网站标题和网页描述中都含有关键字。<br/>\r\n<br/>\r\n关键词优化原则：<br/>\r\n<br/>\r\na、URL文本。在你的域名和你的网页中呈现关键字关于搜索引擎排名会产生很大的影响。<br/>\r\n<br/>\r\nb、在整个页面中合理规划关键词，这样的最佳效果是，没有特意放置关键词，但关键词却无处不在。<br/>\r\n<br/>\r\nc、在另一个网站与你网站树立链接时，尽量运用关键字作为链接文字，这有利于进步你网站的重要性，从而影响到PR。<br/>\r\n<br/>\r\nd、网站的内容自然要盘绕关键词展开，文章类型的页面在文章的首尾呈现关键词，并做上到首页的链接或是关键词页面的链接。<br/>\r\n<br/>\r\ne、增加关键词的密度，关键词的密度在3％-6％为宜。切忌为了增加关键词的密度而堆积关键词。这样做的结果将得到搜索引擎的严厉惩罚的。<br/>\r\n<br/>\r\nf、关键词这么重要，自然在网站最重要的部位要呈现你的主打关键词了啊。在title及description中呈现关键词，在导航中尽量的呈现关键词。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (23, 3, '网站优化的九个技巧', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第一，要清楚记得网站排名是需要你去优化的。曾经看到一些企业网站，只顾着网站上线，维护方面一律不管，等到企业规模做大的时候就开始着急，当初没有考虑到对搜索引擎友好，离开了搜索引擎网站就是离开了生存的空间。第二，网站排名的提高不是短期的行为，简', 0, '', '', NULL, '第一，要清楚记得网站排名是需要你去优化的。曾经看到一些企业网站，只顾着网站上线，维护方面一律不管，等到企业规模做大的时候就开始着急，当初没有考虑到对搜索引擎友好，离开了搜索引擎网站就是离开了生存的空间。<br/>\r\n<br/>\r\n第二，网站排名的提高不是短期的行为，简单的说是一门学科，负责的说是很深奥的技术，任何做seo优化的都不能说自己绝对是高手，需要在实践中学习应用然后解决企业网站排名需要解决的问题。<br/>\r\n<br/>\r\n第三，网站排名稳定的法宝，也是最重要的一点。稳定的排名需要有充实的内容，如果网站是大量的采集，搜索引擎会认为作弊或者抄袭，权重会降低，会被搜索引擎认为是垃圾站，影响网站排名和收录，快照也相对慢。原创文章需要发布在A5论坛或者中国站长论坛，权重相对较高。<br/>\r\n<br/>\r\n第四，重在坚持。优化较成功的网站，有时也会因为服务器的不稳定，外链、友情链接的因素而影响排名，遇到这些问题要坚持去解决，从而保持好的排名。<br/>\r\n<br/>\r\n第五、网站结构的扁平化规划<br/>\r\n目录和内容结构最好不要超过3层，如果有超过三层的，最好通过子域名来调整和简化结构层数。另外目录命名的规范做法是使用英文而不是拼音字母<br/>\r\n<br/>\r\n第六、页面容量的合理化<br/>\r\n合理的页面容量会提升网页的显示速度，增加对搜索引擎蜘蛛程序的友好度。同时建议js脚本和css脚本尽量用链接文件<br/>\r\n<br/>\r\n第七、外部文件策略<br/>\r\n把javascript文件和css文件分别放在js和css外部文件中。这样做的好处是把重要的页面内容放到页面顶部，同时能缩小文件大小。有利于搜索引擎快速准确地抓取页面<br/>\r\n重要内容。其他的字体（FONT）和格式化标签也尽量少用，建议采用CSS定义。<br/>\r\n<br/>\r\n第八、外部链接<br/>\r\n尽可能多地让其他跟你主题相关的网站链接本站，同时尽量同PR值更高的网站进行相互链接。如果网站提供与主题相关的导出链接，被搜索引擎认为有丰富的与主题相关的内容，也有利于排名，例如各类招商网站、投融资网站的概念。另外避免链接不顾质量的大面积撒网，对搜索引擎而言宁少要精。<br/>\r\n<br/>\r\n第九、网站地图<br/>\r\n网站自身的网站地图是搜索引擎更全面索引收录你的网站的重要因素。建议制作基于文本的网站地图，内含网站所有栏目、子栏目。网站地图的三大因素：文本、链接、关键词，都极其有利于搜索引擎抓取主要页面内容。特别是动态生成目录网站尤其需要创建网站地图。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (24, 3, '网站中长尾关键词的优化', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '改进长尾现在主关键词的竞争度非常的惨烈，而且连长尾关键词的竞争程度也非常的激烈，有竞争就会有对手，对于对手就要知己知彼，我们要了解对手的长尾关键词和自己的长尾关键词，然后我们就能够避实就虚，从对手的长尾关键词的弱点着手，创建或者改进对手的长', 0, '', '', NULL, '改进长尾<br/>\r\n现在主关键词的竞争度非常的惨烈，而且连长尾关键词的竞争程度也非常的激烈，有竞争就会有对手，对于对手就要知己知彼，我们要了解对手的长尾关键词和自己的长尾关键词，然后我们就能够避实就虚，从对手的长尾关键词的弱点着手，创建或者改进对手的长尾关键词，给对手以致命一击，如果只是单纯的复制不进行创新改进的话，那么就不会给对手造成致命的危险了!<br/>\r\n<br/>\r\n找热度长尾<br/>\r\n在主关键词选择好了之后可以到一些相关的行业网站查看一些长尾关键词的动向，这是为了研究行业的动向和人们关注的动向，我们依然那减肥这个关键词举例，我们如果在bd的搜索框里面输入减肥这两个字之后就会出来一个下拉列表，这些列表出来的关键词就是长尾词，我们就可以查看这些长尾词的热度，然后还可以到淘宝上面看相关的销售排名，那种减肥产品好卖，而淘宝上面显示的数据都是比较客观的，参考的价值也比较高，而我们就可以从这些行业网站再结合bd的搜索就能够找到热度长尾，于是你的网站的转化率自然就会高了!<br/>\r\n<br/>\r\n创造长尾<br/>\r\n在我们通过上面两点的优化选择出来长尾关键词之后，肯定还有未知的而且即将火爆的长尾关键词没有挖掘出来，而且这种情况是肯定存在的，就看咱们自己有没有创新的能力了，任何事物都没有最好，只有更好，所以我们把这些长尾关键词做好，然后让bd收录，并且刷bd下拉框，或者刷bd的相关搜索，再通过网络水军发帖，通过这种无孔不入的网络宣传，就能够让自己的长尾关键词占领各大搜索引擎市场，于是你就能够垄断这个长尾关键词了!<br/>\r\n<br/>\r\n进行多重排列组合<br/>\r\n改变短语中的次序以创建不同的词语组合。使用不常用的组合，组合成一个问句。包含同义词、替换词、比喻词和常见错拼词。包含所卖产品的商标名和品名。使用其他限定词来创建更多的两字组合，三字，四字组合。<br/>\r\n<br/>\r\n例如，如果你的关键词是赚钱，你可能遇到象广告赚钱，网络赚钱，网站赚钱，等等词组。如果关键词是软件解决方案，不防试试流量分析软件解决方案，流量分析报告，流量报告工具，B2B软件解决方案，电子商务软件解决方案，等等。需要注意的是，关键词组不一定有意义，虽然在你进行组合时，它们必须具备相关含义。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (26, 3, '原创内容与相关性原则对搜索引擎的影响', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '在网站优化过程中有几点需要特别的注意到，而网站的原创性是其中几点中最重要和最核心的一个环节，在网上普天盖地的优化教材中一定不会少了对此强调，现在就来谈一下网站内容的原创性对搜索引擎的影响。虽然网站优化总体的原则是对搜索引擎而言的，但是归根结', 0, '', '', NULL, '在网站优化过程中有几点需要特别的注意到，而网站的原创性是其中几点中最重要和最核心的一个环节，在网上普天盖地的优化教材中一定不会少了对此强调，现在就来谈一下网站内容的原创性对搜索引擎的影响。<br/>\r\n<br/>\r\n虽然网站优化总体的原则是对搜索引擎而言的，但是归根结底是面向用户的，如果浏览者不接受网站的内容，就是是网站的有好的排名也是无济于事的，现在咱们抛开网站原创性对用户的作用不谈，现在咱们只谈网站内容的原创性对于搜索引擎的影响。<br/>\r\n<br/>\r\n相关性原则是指会计信息要同信息使用者的经济决策相关联，即人们可以利用会计信息做出有关的经济决策,财务会计的基本原则之一。一般认为，一项信息是否具有相关性，要取决于其预测价值、反馈价值与及时性。如果一项信息能帮助使用者预测未来事项的结果，则此项信息具有预测价值，使用者可根据预测的可能结果，做出最佳选择。<br/>\r\n<br/>\r\n刚开始接触到这个概念的时候，用百度进行了几次检索，都没找到能让自己满意的解释。做搜索引擎优化的人很多，专于技术的很多，也许你会一直认为，技术是最重要的。面向企业的网站SEO是远远超过了技术发挥，到左边的关键字做一个更好的排名这么简单。搜索引擎优化是根据你的目标客户和客户的行为，其中，在为业内人士深入了解。由于网页&ldquo;相关性&rdquo;是我们进行网络优化的最终目标，需要进一步探讨。<br/>\r\n<br/>\r\n记得以前听过有人那样解释相关性原则：搜索引擎发挥作用的最基本原则&mdash;&mdash;相关性原则，有人更是将之上升为搜索引擎的&ldquo;第一定律&rdquo;。用户在信息检索，最关心的是如何找到他们想要在最短的时间用户，因此搜索引擎提出了更高的要求，不局限于简单的数据库搜索，返回的结果，这些结果也应再加工，确定最能满足用户的搜索意图，然后优先最佳匹配网页。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (27, 3, '网站的收录量', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '收录量和收录率是作为站点内容更新频率的衡量标准，而内容更新仅仅只是权重表现的一部分。影响收录的因素有很多，比如站点架构、访问速度、内容质量。当然，站点权重反过来也会影响收录。笔者的站点基本上了首页的内容都会被收录到，但是涉及到栏目列表页，蜘', 2, '', '', NULL, '收录量和收录率是作为站点内容更新频率的衡量标准，而内容更新仅仅只是权重表现的一部分。影响收录的因素有很多，比如站点架构、访问速度、内容质量。当然，站点权重反过来也会影响收录。笔者的站点基本上了首页的内容都会被收录到，但是涉及到栏目列表页，蜘蛛基本上是不关顾的。基于这种情况，我考虑通过改版首页、多栏目细分，尽量减少站点栏目层数的做法，将蜘蛛引导到列表页增加收录。<br/>\r\n<br/>\r\n收录了也会被删除。什么样的内容会被删除呢?重复、关键字堆砌的页面。搜索引擎内容比对的过程可能需要好几天，甚至好几周时间才能完成。这次期间可能会把收录的内容放出来，也可能不放。但是暂时的秒收并不能代表什么。复制粘贴的站长时代已经过去了，网站内容起码应该伪原创，或者通过专题、栏目重组进行加工和整理，老酒换新瓶。这样才能避免收录的页面被搜索引擎删除。<br/>\r\n<br/>\r\n无论是收录还是流量，一切都应该回到事物的本质。网站为流量，流量为现金。做资讯卖流量，做产品卖产品，都必须转化为现金。无论是什么站点，都是殊途同归。从结果推导过程，看你选择什么样的路。所以，不要太看重收录，关键看结果。<br/>\r\n<br/>\r\n收录不等于流量，稳定才是权重。无论是热门关键字还是长尾关键字，稳定才是关键。切莫浮躁，操之过急。做好基本功，建立起权重壁垒。不少收录上百万的站点，流量也有少的可怜的。收录并不能代表流量，这也是跟站点类型有关。资讯类的肯定收录多，产品类的收录肯定少，这不具备可比性，因为收入模式可能有差别。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (28, 3, '百度依据什么给你的网站降权', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '百度的蜘蛛更注重服务器的稳定性，百度的蜘蛛更看重服务器稳定性，网站稳定性，像Google比较人性化的搜索引擎，如果网站出现当机状态，Google虽然也会有一定降权，但是不会像百度一般，降权后就长期不访问页面或更有甚者达到去除多数页面，造成网', 3, '', '', NULL, '百度的蜘蛛更注重服务器的稳定性，百度的蜘蛛更看重服务器稳定性，网站稳定性，像Google比较人性化的搜索引擎，如果网站出现当机状态，Google虽然也会有一定降权，但是不会像百度一般，降权后就长期不访问页面或更有甚者达到去除多数页面，造成网站收录10以下的惩罚，所以不论任何人想做百度的优化，一定要保证稳定的服务器，尽量避免出现当机。<br/>\r\n<br/>\r\n百度比较注重网页内的图片大小，从百度来说，图片越小，页面访问速度越快，所以如果图片过大，网站的访问速度会影响到用户体验，同样，也会影响到百度蜘蛛的爬行，并影响百度蜘蛛给予网站页面的权重，所以建议大家尽量减小图片质量，最好用WEB格式存储图片，以保证图片的最小存储。<br/>\r\n<br/>\r\n百度更注重Title的编写，百度主要的内容参考是有Title得来得，虽然其他的搜索引擎也已经对Keywords和Description的参考越来越低，但是百度的搜索引擎几乎已经达到忽略Keywords和Description的程度，所以对于百度优化，Title的编写更加重要。<br/>\r\n<br/>\r\n百度的优化更注重域名首页活跃度，虽然所有搜索引擎对首页活跃度都十分重视，但是从穆杰多次实验后得出的结果是，百度对于域名首页的活跃度更加重视，一般的搜索引擎主要收录来源是靠蜘蛛逐层抓取，Google的抓取层次要比其他搜索引擎更深，而百度的蜘蛛是最不愿意深入抓取内容的，他更喜欢首页活跃度较高的网站，然后就是域名首页活跃度较高的网站，如果针对百度做优化，一定要保证域名首页经常更新，最好的建议是每天域名首页更新40％以上，尽量达到60％，要是能够有80％-100％的更新频率，那是最佳的，而且尽量保证更新不要都在一个时间进行，如果可以平均分配到每天的每个小时，那样会让百度的蜘蛛更加喜欢你的网站，域名首页权重高了，网站内容的权重自然也会搞起来。<br/>\r\n<br/>\r\n百度的SEO优化更加注重内部链接，从之前在法律界工作时的实验来看，百度比其他搜索引擎更加注重内部链接，法律界网站所建立的内部词库，使法律界在很多相关词语的优化上更有优势，从而当时法律、法规等词语一度排在百度首页前三位，当然这种优化对Google也有帮助，但是Google的优化外部链接的权重参考值更高一些。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (29, 3, '搜索引擎优化是一种进步', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '搜索引擎毕竟是一套程序，只能根据预先的设定工作。由于互联网上的信息越来越多，信息的形式越来越复杂，如何从浩如瀚海的互联网中挑选出最符合用户需求的信息（这是加快信息流动的重要途径），称为搜索引擎必须面对的问题。为此，无数工程师设计出各种算法来', 1, '', '', NULL, '搜索引擎毕竟是一套程序，只能根据预先的设定工作。由于互联网上的信息越来越多，信息的形式越来越复杂，如何从浩如瀚海的互联网中挑选出最符合用户需求的信息（这是加快信息流动的重要途径），称为搜索引擎必须面对的问题。为此，无数工程师设计出各种算法来区分网页的相关性，进行机器识别。<br/>\r\n<br/>\r\n由于软硬件的限制，搜索引擎拥有了和真人不同的收录特性，比如，只能检索文字信息，对图形、音频、视频甄别能力非常低。对于文字信息，由于语义判断存在难以克服的困难，如何甄别重点词语成了难题。无论是西方的Google还是本土的百度，都无法做到分词上的尽善尽美，各种瑕疵严重降低了搜索结果的准确性，从信息流动的角度来看，不利于信息流动。<br/>\r\n<br/>\r\n此时，对网站本身进行优化，使之对真人访问友好，对搜索引擎也友好，就成了加速信息流动的客观要求。作为提供信息的网站，渴望获得尽可能多的定向流量，那么，就必须帮助搜索引擎提高搜索效率，加快信息流动。只有信息流动速度加快，才能获得更多的定向流量。协助搜索引擎，就是帮助自己发展，这应该成为网站所有者的共识。<br/>\r\n<br/>\r\n理想的搜索引擎优化需要做到两个方面：第一，参与信息流动，加速信息流动;第二，协助搜索引擎，而不是绑架搜索引擎。所谓的参与信息流动，就是提供优质的信息，而且最好是原创的信息，加速信息流动，就是主动链接相关的信息，通过链接展示其他人拥有的优质资源。协助搜索引擎，就是主动修改诸如网页标签等各种信息，使之便于搜索引擎收录和检索。但是，就目前来看，网上的诸多搜索引擎优化师（SEOer）的所作所为，近乎绑架搜索引擎，其行为造成的后果就是严重干扰了信息的正常流动，危害整个互联网的健康。一旦被搜索引擎惩罚，这类SEOer没有资格抱怨。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (30, 3, '新站优化的方法', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '首先我认为，你必须在网站架设服务器前对网站有个成熟的构思，就是我该建设什么性质的网站？有哪些栏目分类？seo主题是什么？我的建站兴趣又是什么？等等等这些问题都研究好了并且自认为有很好的兴趣和吃苦耐劳精神后，那么请在本地电脑上先模拟一个网站并', 5, '', '', NULL, '首先我认为，你必须在网站架设服务器前对网站有个成熟的构思，就是我该建设什么性质的网站？有哪些栏目分类？seo主题是什么？我的建站兴趣又是什么？等等<br/>\r\n<br/>\r\n等这些问题都研究好了并且自认为有很好的兴趣和吃苦耐劳精神后，那么请在本地电脑上先模拟一个网站并且做好各类栏目和seo、模板等（不要轻易的急急忙忙上传1个cms程序到服务器，否则在未来几天甚至1个月内你反复的更改网页标题、栏目会被搜索引擎认为网站运营不成熟，容易进入沙盒状态）<br/>\r\n<br/>\r\n当网站每天更新一些原创/非原创信息同时，多去一些站长论坛、网站或者天涯、百度空间等权重高的地方发一些信息，在信息处做一下外链。这样很快您的网站首页就会被搜索引擎收录。这个时候，你不必惊喜，继续保持努力！每天有规律的更新！慢慢的你的网站页面就会在搜索引擎出现的越来越多。<br/>\r\n<br/>\r\n等你在本地电脑上做好网站模板、栏目、各页面title和description后，那么就可以上传到您的服务器了，并且做好域名绑定（一定要选择稳定的服务器商，不然会给今后的搜索引擎带来重大的打击！并且一定要用国际域名，搜索引擎对二级域名很不友好，权重高大站除外）<br/>\r\n<br/>\r\n新站上传完毕后，在服务器开始按照您的栏目分类每天最少每个栏目发表2篇文章！最好原创，或者伪原创找点符合栏目的文章后花点功夫改标题和内容段落以及修改。（核心提示：个人站长不要想着把自己的网站栏目做大做广，只需要精选一两个关键词，并且根据这一两个关键词分类分精后做几个一级栏目即可，切勿分成几十上百个栏目，比如一级栏目10个每个一级栏目下属二级栏目又是五六个、七八个这样下来你的网站将有百八十个栏目，试问一下，你是个人站长你有多少精力去每天完成这些栏目的更新？不要想着别人可以做到我为什么行？你要想想别人说不定是很多人共同做一个网站，或者他的职业就是靠网站为生。你也不要认为我用采集程序搞定，不需要自己动手，那么我很严肃的告诉你，这一套在前几年搜索引擎很吃香，但是现在不行啦，当今的主流搜索引擎百度、谷歌都极其讨厌采集站。就算你采集了上万条信息被收录也没有多大意思，因为相同标题和内容的页面被收录后往往前十页都没有排名。收录这么多也只是个表面、空架子。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (31, 3, '影响关键词排名的三个因素', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '关键词密度专业的网站优化者都知道，关键词的密度一般3％-8％是比较好的，其实，只要文章中不进行关键词的堆砌，不含有背景和文字颜色一样的关键词文本，搜索词在页面中出现的次数越多越好，密度比较高，说明页面与搜索词的相关性越高，关于搜索引擎相关性', 0, '', '', NULL, '关键词密度<br/>\r\n<br/>\r\n专业的网站优化者都知道，关键词的密度一般3％-8％是比较好的，其实，只要文章中不进行关键词的堆砌，不含有背景和文字颜色一样的关键词文本，搜索词在页面中出现的次数越多越好，密度比较高，说明页面与搜索词的相关性越高，关于搜索引擎相关性的计算还有其他的因素，密度只是因素的一部分，并且重要程度也越来越低。<br/>\r\n<br/>\r\n关键词的匹配度<br/>\r\n<br/>\r\n说到关键词的匹配度，需要了解一些中文分词方面的知识，这方面的知识可以参加我以前写的一篇博文：中文网站seo需要了解中文分词技术。搜索引擎对搜索词进行分词技术处理后，如果索引的文章中的关键词完整匹配出现，说明与搜索词最相关。比如搜索&ldquo;右脑学习&rdquo;时，页面上连续完整出现&ldquo;右脑学习&rdquo;四个字是最相关的。如果&ldquo;右脑&rdquo;和&ldquo;学习&rdquo;两个词没有连续匹配出现，只要出现的距离近一些，也被搜索引擎认为相关性稍微大一些。关键词的匹配度越好，说明相关性越大，当然排名也会好一些。<br/>\r\n<br/>\r\n关键词的格式和位置<br/>\r\n<br/>\r\n其实，关键词在页面中出现的格式和位置都被记录在索引库中。关键词出现在比较重要位置，如Title标签、黑体、H1-h6等，说明页面与关键词越相关。这一部分就是页面SEO<br/>\r\n<br/>\r\n所要解决的。大家可以看到这个郑州seo网站，每个页面加粗的关键词其实就是页面中我要进行优化的。', NULL, 0, NULL, NULL, NULL);
INSERT INTO `lara_info` VALUES (32, 3, '有效的推广网站的方法', '', '', '', '', '', '', '有效的推广网站的方法', '通过新闻媒体进行宣传如果你认为你的网站确实很有特色，能够让人有去了还想去的感觉，或者你的网站能够提供一些能获取利润的投资建议，给访问者带来一定的利益，你可以借助于电视、广播等媒体进行一系列报道，或者自己可以写一些有关自己站点特色内容的报道寄', 0, '', '', '', '<p>通过新闻媒体进行宣传<br />\r\n<br />\r\n如果你认为你的网站确实很有特色，能够让人有去了还想去的感觉，或者你的网站能够提供一些能获取利润的投资建议，给访问者带来一定的利益，你可以借助于电视、广播等媒体进行一系列报道，或者自己可以写一些有关自己站点特色内容的报道寄到比较有影响的报刊杂志处，寻求他们的帮助。<br />\r\n<br />\r\n利用留言板进行宣传<br />\r\n<br />\r\n如果你的网站有类似公告栏或留言板的功能，你完全可以在这些位置放上你网站的地址，一旦其他网友在浏览你的留言或公告栏时，就有可能见到你网站的地址而顺便去拜访你的主页。<br />\r\n<br />\r\n到各大报刊发表文章<br />\r\n<br />\r\n作为一名电脑爱好者，学习和使用电脑的时间肯定不会太短，而且在理论和实践中也肯定积累了不少经验和心得。这时你最好不要把这些经验独享，应该用语言把它表达出来，与其他同行或网友进行真挚交流，不去计较个人的得失。写好后将它邮寄给比较出名的报刊，让其他更多的电脑爱好者与自己一同进步。在文章的末尾可以注明自己的联系地址，例如自己的个人主页地址、电子邮件地址，如果大家能从你的文章获得收获的话，他们一般会很乐意与你多联系的，这样你的主页访问量一定会大大提升的。<br />\r\n<br />\r\n利用电子邮件发出通知<br />\r\n<br />\r\n如果你手中有许多朋友或者用户的电子邮件地址，你可以考虑利用电子邮件来通知他们来访问。利用这种方法来宣传主页的关键之处在于要留心收集用户电子邮件的地址，你拥有的电子邮件数量越多，就意味着你的主页蕴藏着越大的访问量。即使是这样，你的邮件内容也要包含一些有用的东西，尽量不要发那种垃圾邮件。<br />\r\n<br />\r\n这些方法都是老生常谈为什么还要提起呢？因为这些方法对网站的推广的效果比较好的，所以这些方法要尽量的掌握好。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (33, 3, '网站的关键词优化', '', '', '', '', '', '', '网站的关键词优化', '不少网站优化者喜欢把所有的关键词放在一起优化，这是犯了兵家大忌，战线太长，往往不利于局面的控制，所以，我喜欢一个一个的优化。在优化过程中，我们可以放置关键词的位置有以下技巧：对于网站的名称（即C类关键词）这样容易优化的关键词，放置在文章的开', 0, '', '', '', '<p>不少网站优化者喜欢把所有的关键词放在一起优化，这是犯了兵家大忌，战线太长，往往不利于局面的控制，所以，我喜欢一个一个的优化。在优化过程中，我们可以放置关键词的位置有以下技巧：<br />\r\n<br />\r\n对于网站的名称（即C类关键词）这样容易优化的关键词，放置在文章的开始位置，加上超链接，超链接通常指向首页，对于目标关键词（即A类关键词）我们通常融入文章中，加入超链接，由指向首页和A类关键词相关页面两种方式的链接，个人倾向于后者的链接。<br />\r\n<br />\r\n对于长尾关键词，我们应该围绕制定的关键词选择，因为我们所做的一切都是为了更好实现关键词的快速的到达搜索引擎的首页。<br />\r\n<br />\r\n对于关键词的修改，个人认为可以改，但不能频繁修改，修改关键词是为了更好的体现网站主题内容，而不是为了便于优化关键词而修改标题。<br />\r\n<br />\r\n网站优化，有些人说是很简单的问题，他们认为把相应的关键词放在标题中，发发文章，加点外链足以让网站获得好的排名;有些人认为很难，他们认为文章虽然收录了，但流量却没有增加，外链虽然增加了，但过些天百度一更新又减少了，他们无法掌握其中的度。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (34, 3, '网站优化友情链接的技巧和方法', '', '', '', '', '', '', '网站优化友情链接的技巧和方法', '网站相关度网站的相关度在换取链接的时候是首要考虑的一个因素，我们尽量要与同行业、或者是相关行业的网站做链接。比如我们公司的石料生产线的网站，就要找与机械五金行业相关的网站，如果找服饰或者医药行业的网站来交换链接的话是肯定不行的。因为相关性强', 0, '', '', '', '<p><strong>网站相关度</strong><br />\r\n网站的相关度在换取链接的时候是首要考虑的一个因素，我们尽量要与同行业、或者是相关行业的网站做链接。比如我们公司的石料生产线的网站，就要找与机械五金行业相关的网站，如果找服饰或者医药行业的网站来交换链接的话是肯定不行的。因为相关性强的交换链接，搜索引擎就会看重些，得到搜索引擎的认可对网站本身也是有一定作用的。<br />\r\n<strong>网站收录数量</strong><br />\r\n我们通过查询工具或者百度site加域名能查出网站的收录数量，网站的收录数量能看出一个网站的质量。根据网站的的整体页面来查看网站的收录页面，通过查看收录来换取同等的友链。<br />\r\n<strong>友情链接主动找上门</strong><br />\r\n寻找链接的过程中是最耗费时间和精力的，我们要寻找和一个个查很麻烦。根据自己交换链接的经验，如果想让链接主动找上自己的话，到一些友情链接平台、论坛上发一些自己网站的相关信息来寻求链接，需要注意的是为了避免不相关的链接找你，在发表链接信息的时候一定要注明交换的条件，这样可以节省不少时间。<br />\r\npr值<br />\r\n虽然谷歌现在退出了中国，表面上看说不会看中pr值，实际上站长们交换链接看pr已经形成了一种习惯，高pr的网站还是会被很多站长看重。pr高的网站权重相对来说也会高，如果交换高质量的pr对我们网站还是会起到很大的作用的。<br />\r\n<strong>首页快照</strong><br />\r\n首页快照在交换链接的时候也是作为一个参考点标准，快照可以判定出网站的更新频率和蜘蛛光临的频率。一般网站首页的权重是最高的，我们还可以通过快照来判断出网站的权重问题。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (35, 3, '网站优化中优化图片的技巧', '', '', '', '', '', '', '网站优化中优化图片的技巧', '几乎没有哪个网页上是没有图片的。如果你经历过56K猫的年代，你一定不会很喜欢有大量图片的网站。因为加载那样一个网页会花费大量的时间。即使在现在，网络带宽有了很多的提高，56K猫逐渐淡出，优化图片以加快网页速度还是很有必要的。优化图片包括减少', 0, '', '', '', '<p>几乎没有哪个网页上是没有图片的。如果你经历过56K猫的年代，你一定不会很喜欢有大量图片的网站。因为加载那样一个网页会花费大量的时间。<br />\r\n<br />\r\n即使在现在，网络带宽有了很多的提高，56K猫逐渐淡出，优化图片以加快网页速度还是很有必要的。<br />\r\n<br />\r\n优化图片包括减少图片数、降低图像质量、使用恰当的格式。<br />\r\n<br />\r\n1、减少图片数：去除不必要的图片。<br />\r\n<br />\r\n2、降低图像质量：如果不是很必要，尝试降低图像的质量，尤其是jpg格式，降低5％的质量看起来变化不是很大，但文件大小的变化是比较大的。<br />\r\n<br />\r\n3、使用恰当的格式：请参阅下一点。<br />\r\n<br />\r\n因此，在上传图片之前，你需要对图片进行编辑，如果你觉得photoshop太麻烦，可以试试一些在线图片编辑工具。懒得编辑而又想图片有特殊的效果？可以试试用过调用javascript来实现图片特效。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (36, 3, '网站优化应该懂得的技巧', '', '', '', '', '', '', '网站优化应该懂得的技巧', '文章缺乏可读性;在用户体验越来越重要的背景下。最好的伪原创方式还是人工进行伪原创，自己手工修改一篇文章来达到伪原创目的，我07年学习SEO时，为了节约时间，大量采用伪原创工具生成的文章，结果感觉收录的效果不是很好，于是便尝试自己修改文章，结', 0, '', '', '', '<p>文章缺乏可读性;在用户体验越来越重要的背景下。最好的伪原创方式还是人工进行伪原创，自己手工修改一篇文章来达到伪原创目的，我07年学习SEO时，为了节约时间，大量采用伪原创工具生成的文章，结果感觉收录的效果不是很好，于是便尝试自己修改文章，结果是每篇文章基本都收录了，欣喜之余，更加坚定自己的决定。在这个过程中，我总结了以下几点伪原创的技巧，特供献给对软文写作比较迷茫的新人。<br />\r\n<br />\r\n1、长话短说：在不影响整句原意的前提下删除一些文字或词语。比如：&quot;春节旅游要选择去美丽的<br />\r\n<br />\r\n&quot;;修改后：&quot;春节旅游要去巴厘岛旅游&quot;<br />\r\n<br />\r\n2、短话长说，在不影响整句原意的前提下加上一部分文字或词语，或者把它扩展成两句话等;比如：&ldquo;巴厘岛旅游价格&rdquo;，修改后：&ldquo;春节旅游到巴厘岛旅游价格是多少？&rdquo;。<br />\r\n<br />\r\n3、前后倒置：就是把一句话的前后词语位置调换。比如：&ldquo;春节旅游到巴厘岛旅游价格是多少？&rdquo;，修改后：&ldquo;到春节巴厘岛旅游价格是多少？&rdquo;。<br />\r\n<br />\r\n4、书面语与口语互换：就是文章的某些口头语，用书面语言代替，同样遇见书面语时，用口头语代替。如：&ldquo;吃的多，喝的也多&rdquo;可以用&ldquo;大吃大喝&rdquo;或者&ldquo;暴饮暴食&rdquo;等等来代替。<br />\r\n<br />\r\n5、其它的方法：如&ldquo;一周&rdquo;用&ldquo;7天&rdquo;代替。&ldquo;30天&rdquo;用&ldquo;一个月&rdquo;代替等等。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (37, 3, '网站的整站优化策略', '', '', '', '', '', '', '网站的整站优化策略', '网站结构优化：针对搜索引擎特点，网站栏目一般都是以首页、新闻中心、产品中心、专题、联系方式五层结构去实现。结构优化使搜索引擎有内容可收录，也利于搜索引擎收录。网站内容优化：增加原创的内容，减少采集它站内容。内容在网站的作用就是为了让用户所了', 0, '', '', '', '<p>网站结构优化：针对搜索引擎特点，网站栏目一般都是以首页、新闻中心、产品中心、专题、联系方式五层结构去实现。结构优化使搜索引擎有内容可收录，也利于搜索引擎收录。<br />\r\n<br />\r\n网站内容优化：增加原创的内容，减少采集它站内容。内容在网站的作用就是为了让用户所了解，或所需求，根据自己的产品，让通过搜索引擎到达网站的用户了解产品。增加用户的体验度。<br />\r\n<br />\r\n网站关键词布局：关键词布局就要想到网站的五层结构去实现，去考虑。要求合理的布局，不要使用户进来看不明白，原有文章的意思。这样跟网页优化就没两样了。<br />\r\n<br />\r\n网站页面优化：从网站的代码去优化、网站布局，页面链接等优化。<br />\r\n<br />\r\n用户体验优化：用户到达此站看此站是干干净净，不会跟关键词优化，插入关键词，关键词加粗，这种情况出现。显示出此站的大放性，这样用户就对此站的评价高了。体验度自然而然也高了。<br />\r\n<br />\r\n网站内链策略：让主关键词，长尾词，通为一词，让关键词变得可扩展性。达到金字塔效果。<br />\r\n<br />\r\n网站外链策略：在做外链的同时，要联想到防止链接权重不均衡现象。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (38, 3, '做网站优化应该懂的知识', '', '', '', '', '', '', '做网站优化应该懂的知识', '关键字的选取其实关键字的选取也是在慢慢的实践过程中学到的知识，关于关键字的选择，比如说我自己在公司里优化的企业站，关键字的一般格式就是，产品_产品_产品-公司名称，其中最难优化的在第一位，然后依次往后移，但是不要放太多的产品关键字，不要超过', 0, '', '', '', '<p>关键字的选取<br />\r\n<br />\r\n其实关键字的选取也是在慢慢的实践过程中学到的知识，关于关键字的选择，比如说我自己在公司里优化的企业站，关键字的一般格式就是，产品_产品_产品-公司名称，其中最难优化的在第一位，然后依次往后移，但是不要放太多的产品关键字，不要超过3个，那么太容易导致关键字权重的分散。<br />\r\n<br />\r\n内部链接的构造<br />\r\n<br />\r\n这个主要是指网站内容如何更好的链接在一起，仿造百度百科，虽然没有百科那么强大的系统，但是文章中的一些位置也是可以巧妙的连在一起的，一般网站文章页的网页标题都是&ldquo;文章标题--公司名称&rdquo;，那么在放内链的时候，在中间放上，就如&ldquo;文章标题&rdquo;（带上这个文章的网址）所说之类的，这也就是一个小小的方式，亦或者在最后放上另外推荐文章之类的，不过一般的CMS系统都有这个功能，使之更好的融洽网站。<br />\r\n<br />\r\n网页的制作和代码的了解<br />\r\n<br />\r\nSEO应该懂的基本的网页制作，至少应该看得懂html语言，熟练掌握这个基础，在SEO中，网站也是和自己密不可分的，html语言但是作为网站的构造语言，大家作为优化人员定要熟练使用，比如说最基本的优化网站代码，假如给你一份网站，首先了解的应该是这个网站的内部结构怎么样，不管怎么说，一些对网站内部的基本的优化操作时一定要具备，alt标签，h1&mdash;h7标签，以及最重要的title，等等。<br />\r\n<br />\r\n外部链接的发布<br />\r\n<br />\r\n关于外部链接，有太多的方式可循，譬如最简单的论坛签名，比如说A5论坛签名，最近观察了一下A5论坛的权重很高，一般发布一篇帖子上去，很快就被收录了，那么签名就变的有一定的效果，积少成多，而博客之类的，应该知道的是linkwheel，有兴趣的朋友可以自己去百度一下，这个方式虽然最累，但是效果也是不错的，而另外的友情链接就是很重要的，有时候一条好的友情链接不次于带50的签名帖子，友情链接是网站的直接合作伙伴，请重视。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (39, 3, '怎样做网站的优化更有效？', '', '', '', '', '', '', '怎样做网站的优化更有效？', '关键字的使用当网民在互联网上寻找信息，在搜索框中，键入他们具体的关键字。如果你网站的关键字排在搜索引擎前列，那你的网站被网民找到的几率大大增加。所以你必须使用关键字。你必须站在网站访客的角度来思考问题。想一想，他们愿意搜索和可能搜索的关键字', 0, '', '', '', '<p>关键字的使用<br />\r\n<br />\r\n当网民在互联网上寻找信息，在搜索框中，键入他们具体的关键字。如果你网站的关键字排在搜索引擎前列，那你的网站被网民找到的几率大大增加。所以你必须使用关键字。你必须站在网站访客的角度来思考问题。想一想，他们愿意搜索和可能搜索的关键字，然后在你的网站中使用这些关键字，使网站访客能够找到它。你应该使用最适当的关键字，这样你的网站就不会只排在搜索结果的最后几页了。另一方面，你也应该考虑其他相关的关键字。其中有提供相同项目或信息，为了知道哪些关键字是适合的，你可以利用一个在线工具，帮助你找出哪些是合适的关键字以及相关的关键字。<br />\r\n<br />\r\n建立与其他网站的链接<br />\r\n<br />\r\n和别的网站建立连接，可以增加网站流量和权重。但是建立的链接的时候，你要考虑对方的网站内容是否和你的网站相关。最好是对方的网站已经运营了一段时间，并且有一定的流量。这样当这些网站的访客访问网站时，也会看到你的网站，就可能会点击进入了。当然，你也也必须更新网站内容，确保网站能够引起访客的兴趣。<br />\r\n<br />\r\n提交网站到搜索引擎<br />\r\n<br />\r\n如果你想要更多的流量，那么你应该不能忽略搜索引擎，你可以利用搜索引擎的免费提交服务，填写申请表格，将网站提交到搜索引擎。这样做是为了使你的网站尽快被搜索引擎收录。灵位还有一些服务，需要你支付费用，比如竞价广告，这就看你自己的选择了。一般情况下至少1个月，你的网站才会被搜索引擎收录。</p>\r\n', '', 0, '', NULL, NULL);
INSERT INTO `lara_info` VALUES (40, 3, '网站的优化与权重', '', '', '', '', '', '', '网站的优化与权重', '内容的原创度，文字能力是个人站长最重要的能力，最好的内容源，应该是网上从来没有出现过的内容，所以自然会受到搜索引擎的青睐，但是普通的站长，无法做出足够多的原创内容，这是制约个人网站发展的一个原因。所以许多个人网站会采取其它的方法获得内容。改', 0, '', '', '', '<p>内容的原创度，文字能力是个人站长最重要的能力，最好的内容源，应该是网上从来没有出现过的内容，所以自然会受到搜索引擎的青睐，但是普通的站长，无法做出足够多的原创内容，这是制约个人网站发展的一个原因。所以许多个人网站会采取其它的方法获得内容。<br />\r\n<br />\r\n改编（伪原创），意思就是快速修改其它网站的内容，掐头去尾，或是增增减减、调整段落次序等方法。我们也可以适当运用图片和ALT标签来稍微增加文章的原创度，图片只要有修改，就会成为原创.搜索引擎几乎是百分百的识别出大量的&ldquo;伪原创&rdquo;内容，如果你的网站内容全部是这样来的，就不可能获得好的权重。<br />\r\n<br />\r\n网站的更新频率，更新频率快，让引擎觉得你的站是活跃的，我们也可以一些技术手段来达到这目的，就是我们常说的更新带动器，如在首页显示随机文章，让搜索引擎每次来你的首页都会看到你的首页有所变化，从而增加快照的更新频率，也会给予你相当的权重。</p>\r\n', '', 0, '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lara_migrations
-- ----------------------------
DROP TABLE IF EXISTS `lara_migrations`;
CREATE TABLE `lara_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lara_migrations
-- ----------------------------
BEGIN;
INSERT INTO `lara_migrations` VALUES (1, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `lara_migrations` VALUES (2, '2020_09_07_090635_create_admin_settings_table', 1);
INSERT INTO `lara_migrations` VALUES (3, '2020_09_22_015815_create_admin_extensions_table', 1);
INSERT INTO `lara_migrations` VALUES (4, '2020_11_01_083237_update_admin_menu_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for lara_us
-- ----------------------------
DROP TABLE IF EXISTS `lara_us`;
CREATE TABLE `lara_us` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `age` tinyint(4) unsigned DEFAULT '0' COMMENT '年龄',
  `edu` varchar(255) DEFAULT NULL COMMENT '学历',
  `home` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `polity` varchar(255) DEFAULT NULL COMMENT '政治面貌',
  `marry` tinyint(1) DEFAULT '0' COMMENT '默认 否 0  是 1',
  `image` varchar(800) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `idcards` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `status` tinyint(1) DEFAULT '0' COMMENT '默认 0 ',
  `openid` varchar(255) DEFAULT NULL COMMENT '微信openid',
  `unionid` varchar(255) DEFAULT NULL COMMENT '微信unionid',
  `company_id` int(10) DEFAULT NULL COMMENT '公司ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lara_us
-- ----------------------------
BEGIN;
INSERT INTO `lara_us` VALUES (2, '15600172039', '思远', '刘朝相', '0', 19, '1', '山东', '12', 0, 'https://thirdwx.qlogo.cn/mmopen/vi_32/qMaPLdTNpCKTgwrd2k5qjDunib6aIHZlVGVrNXlDu1rpxsDmkDmc7Rp7Z9Mj1YhliabicNCibNNdibgqYxDkXnfc5lA/132', '2021-05-20 14:08:13', '371522200011248412', 0, 'ovGiP5XU-OMsHenR6IFh2UUv-8e8', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

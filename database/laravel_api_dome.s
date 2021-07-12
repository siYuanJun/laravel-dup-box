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

 Date: 12/07/2021 12:57:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `lara_admin_users` VALUES (1, 'admin', '$2y$10$Tm65ynity/5XLXGTCamGXuXDRW1Kk7fsOgJ9V1D/qTr6gyPb4Sn.6', 'Administrator', NULL, NULL, '2021-07-12 12:29:07', '2021-07-12 12:29:07');
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
-- Table structure for lara_worker
-- ----------------------------
DROP TABLE IF EXISTS `lara_worker`;
CREATE TABLE `lara_worker` (
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='工人表';

-- ----------------------------
-- Records of lara_worker
-- ----------------------------
BEGIN;
INSERT INTO `lara_worker` VALUES (2, '15600172039', '思远', '刘朝相', '0', 18, '1', '山东', '12', 0, 'https://thirdwx.qlogo.cn/mmopen/vi_32/qMaPLdTNpCKTgwrd2k5qjDunib6aIHZlVGVrNXlDu1rpxsDmkDmc7Rp7Z9Mj1YhliabicNCibNNdibgqYxDkXnfc5lA/132', '2021-05-20 14:08:13', '371522200011248412', 0, 'ovGiP5XU-OMsHenR6IFh2UUv-8e8', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

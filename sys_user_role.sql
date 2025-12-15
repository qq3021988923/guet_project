/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : db_spzx

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2025-12-11 23:15:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_admin_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('7', '9', '11', '2023-07-18 10:59:09', '2023-07-18 10:59:09', '0');
INSERT INTO `sys_user_role` VALUES ('10', '10', '8', '2023-07-18 11:09:35', '2025-12-05 23:35:57', '0');
INSERT INTO `sys_user_role` VALUES ('11', '10', '5', '2023-07-18 14:28:42', '2025-12-05 23:39:31', '0');
INSERT INTO `sys_user_role` VALUES ('12', '32', '6', '2023-07-18 14:33:04', '2023-07-18 14:33:04', '0');
INSERT INTO `sys_user_role` VALUES ('13', '10', '13', '2023-07-18 14:39:07', '2025-12-05 23:42:59', '0');

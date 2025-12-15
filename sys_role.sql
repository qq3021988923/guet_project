/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : db_spzx

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2025-12-11 23:16:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('2', 'test02', 'test02', 'test02', '2023-09-03 21:23:41', '2023-09-03 21:23:59', '0');
INSERT INTO `sys_role` VALUES ('9', '平台管理员', 'ptgly', '平台管理员', '2023-05-04 10:36:06', '2023-06-02 09:03:31', '0');
INSERT INTO `sys_role` VALUES ('10', '用户管理员', 'yhgly', '用户管理员', '2023-05-04 10:36:22', '2023-07-18 08:40:56', '0');
INSERT INTO `sys_role` VALUES ('36', '销售人员', '销售', null, '2023-09-03 23:23:04', '2023-09-03 23:23:04', '0');
INSERT INTO `sys_role` VALUES ('37', '测试人员', 'test', null, '2023-09-03 23:24:26', '2023-09-04 10:04:17', '0');
INSERT INTO `sys_role` VALUES ('38', '开发人员', 'dev', null, '2023-09-03 23:24:32', '2025-12-05 23:30:24', '0');
INSERT INTO `sys_role` VALUES ('39', '运维人员', 'yw', null, '2023-09-04 10:04:41', '2025-12-05 23:30:27', '0');

/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : guet

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2025-12-17 04:58:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `basicdata`
-- ----------------------------
DROP TABLE IF EXISTS `basicdata`;
CREATE TABLE `basicdata` (
  `base_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `base_name` varchar(20) NOT NULL,
  `base_desc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`base_id`),
  KEY `FK_sub_basic` (`parent_id`),
  CONSTRAINT `FK_sub_basic` FOREIGN KEY (`parent_id`) REFERENCES `basicdata` (`base_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of basicdata
-- ----------------------------
INSERT INTO `basicdata` VALUES ('1', null, '常用区间', '');
INSERT INTO `basicdata` VALUES ('2', null, '运货方式', null);
INSERT INTO `basicdata` VALUES ('3', null, '付款方式', null);
INSERT INTO `basicdata` VALUES ('4', '1', '大连', null);
INSERT INTO `basicdata` VALUES ('5', '1', '香港', null);
INSERT INTO `basicdata` VALUES ('6', '1', '深圳', null);
INSERT INTO `basicdata` VALUES ('7', '1', '新加坡', null);
INSERT INTO `basicdata` VALUES ('8', '1', '宁波', '');
INSERT INTO `basicdata` VALUES ('9', '2', '海运', '');
INSERT INTO `basicdata` VALUES ('10', '2', '空运', null);
INSERT INTO `basicdata` VALUES ('11', '2', '陆运', null);
INSERT INTO `basicdata` VALUES ('12', '3', '全款', null);
INSERT INTO `basicdata` VALUES ('13', '3', '预付定金', null);
INSERT INTO `basicdata` VALUES ('14', '3', '到付', null);
INSERT INTO `basicdata` VALUES ('15', null, '取货方式', null);
INSERT INTO `basicdata` VALUES ('16', '15', '上门取件', null);
INSERT INTO `basicdata` VALUES ('17', '15', '自动配送', null);
INSERT INTO `basicdata` VALUES ('18', '15', '快递邮寄', null);
INSERT INTO `basicdata` VALUES ('21', null, '单位', '单位');
INSERT INTO `basicdata` VALUES ('22', '21', '斤', '斤');
INSERT INTO `basicdata` VALUES ('23', '21', '公斤', '公斤');
INSERT INTO `basicdata` VALUES ('24', '21', '件', '件');
INSERT INTO `basicdata` VALUES ('25', '21', '个', '个');
INSERT INTO `basicdata` VALUES ('36', null, '测试1', '测试');
INSERT INTO `basicdata` VALUES ('43', '36', '11', '11');
INSERT INTO `basicdata` VALUES ('44', '36', '22', '22');
INSERT INTO `basicdata` VALUES ('45', '36', '33', '33');
INSERT INTO `basicdata` VALUES ('68', '1', '北京', '北京');
INSERT INTO `basicdata` VALUES ('69', '21', '台', '台');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌名称',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌图标',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类品牌';

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '小米', 'http://139.198.127.41:9000/sph/20230506/小米.png', '2023-05-06 09:30:27', '2023-06-02 09:40:24', '0');
INSERT INTO `brand` VALUES ('2', '华为', 'http://139.198.127.41:9000/sph/20230506/华为.png', '2023-05-06 09:31:19', '2023-05-06 09:31:19', '0');
INSERT INTO `brand` VALUES ('3', '14', '1', '2023-07-18 16:09:22', '2025-12-12 01:47:45', '0');
INSERT INTO `brand` VALUES ('4', 'opop4', 'http://127.0.0.1:9000/spzx-bucket/20230718/fc34453767a245b5836d3693dd4a5be2.jpg', '2023-07-18 16:21:12', '2023-07-18 16:29:20', '1');

-- ----------------------------
-- Table structure for `guet_customer`
-- ----------------------------
DROP TABLE IF EXISTS `guet_customer`;
CREATE TABLE `guet_customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `customer_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customer_phone` bigint DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_sex` varchar(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_customer
-- ----------------------------
INSERT INTO `guet_customer` VALUES ('1', '12', null, '王总', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('2', '1', '33', '小明', '324234', '3423423', '上海', '6', '666');
INSERT INTO `guet_customer` VALUES ('5', '12', null, '马化腾', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('7', '12', null, '小张', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('8', null, null, '张无忌123', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('9', '1', '3', '张无忌111', '333', '3333', '333', '3', '33');
INSERT INTO `guet_customer` VALUES ('15', '5', null, '杨', '18776423429', '3021988923@qq.com', '广西水利电力职业技术学院（长堽校区）', '男', 'hello');

-- ----------------------------
-- Table structure for `guet_order`
-- ----------------------------
DROP TABLE IF EXISTS `guet_order`;
CREATE TABLE `guet_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `order_price` int DEFAULT NULL,
  `order_total` bigint DEFAULT NULL,
  `order_status` tinyint DEFAULT NULL,
  `order_address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_payment` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_shipping` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_citi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order_phone` varchar(255) DEFAULT NULL,
  `order_person` varchar(255) DEFAULT NULL,
  `order_pickup` varchar(30) DEFAULT NULL,
  `order_unit` varchar(20) DEFAULT NULL,
  `order_brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_order
-- ----------------------------
INSERT INTO `guet_order` VALUES ('8', '1', '1', 'td5913698346', '手串', '50', '9', '495', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-17 04:23:09', '全款', '海运', '大连', '没有bug', '18776423429', '王天罡', '上门取件', '个', '百年老树');
INSERT INTO `guet_order` VALUES ('10', '1', '1', 'td5914135042', '电脑', '5', '5000', '25000', '1', '广西区桂林市金鸡路1号', '2025-12-17 03:42:15', '预付定金', '空运', '大连', '不要报错', '18776423429', '自己人', '自动配送', '斤', '苹果');
INSERT INTO `guet_order` VALUES ('11', '5', '15', 'td5916659401', '电脑', '5', '5000', '25000', '1', '广西区桂林市金鸡路1号', '2025-12-17 04:24:19', '全款', '海运', '大连', '不要报错', '18776423429', '自己人', '上门取件', '斤', '苹果');

-- ----------------------------
-- Table structure for `guet_role`
-- ----------------------------
DROP TABLE IF EXISTS `guet_role`;
CREATE TABLE `guet_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of guet_role
-- ----------------------------
INSERT INTO `guet_role` VALUES ('9', '平台管理员', 'ptgly', '平台管理员', '2025-09-03 21:23:41', '2025-12-11 23:21:12', '0');
INSERT INTO `guet_role` VALUES ('10', '用户管理员', 'yhgly', '用户管理员', '2025-09-03 21:23:41', '2025-12-11 23:21:15', '0');
INSERT INTO `guet_role` VALUES ('36', '销售人员', '销售', null, '2025-09-03 21:23:41', '2025-12-11 23:21:17', '0');
INSERT INTO `guet_role` VALUES ('37', '测试人员', 'test', null, '2025-09-03 21:23:41', '2025-12-11 23:21:18', '0');
INSERT INTO `guet_role` VALUES ('38', '开发人员', 'dev', null, '2025-09-03 21:23:41', '2025-12-11 23:21:20', '0');
INSERT INTO `guet_role` VALUES ('39', '运维人员', 'yw', null, '2025-09-03 21:23:41', '2025-12-11 23:21:25', '0');
INSERT INTO `guet_role` VALUES ('45', '总经理1', '234234', '老板', '2025-12-12 01:48:45', '2025-12-14 21:51:13', '0');

-- ----------------------------
-- Table structure for `guet_user`
-- ----------------------------
DROP TABLE IF EXISTS `guet_user`;
CREATE TABLE `guet_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '瀵嗙爜',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of guet_user
-- ----------------------------
INSERT INTO `guet_user` VALUES ('1', 'admin', '$2a$10$aaYV4UAtwpwXbI8nnudeGuruueF4ZIlqsK5NkHEfdt2nO64yEClcS', '隔壁老王1', '15011113652', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '管理员账号', '1', '2025-08-01 10:17:18', '2025-12-16 07:43:48', '男');
INSERT INTO `guet_user` VALUES ('5', 'zhangsan', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '张三33', '13589658968', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '', '1', '2025-08-01 10:17:18', '2025-12-16 09:14:15', '男');
INSERT INTO `guet_user` VALUES ('6', 'test1212', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', 'test12', '15011245632', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', 'test12', '0', '2025-08-01 10:17:18', '2025-12-16 07:42:57', '男');
INSERT INTO `guet_user` VALUES ('12', 'lucy1', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '1', '1', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '1', '1', '2025-08-01 10:17:18', '2025-12-16 07:42:57', '男');
INSERT INTO `guet_user` VALUES ('13', 'hello', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', 'hello', '12343423423', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', 'hello', '1', '2025-08-01 10:17:18', '2025-12-16 07:42:57', '女');
INSERT INTO `guet_user` VALUES ('14', 'hello', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '111', '444', '444', '77', '1', '2025-12-12 04:03:33', '2025-12-16 07:42:57', '');
INSERT INTO `guet_user` VALUES ('16', 'hello1', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '222', '55', '33', '88', '1', '2025-12-12 04:18:44', '2025-12-16 07:42:57', '');
INSERT INTO `guet_user` VALUES ('17', 'hello1', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '33', '66', '222', '99', '1', '2025-12-12 04:18:45', '2025-12-16 07:42:57', null);
INSERT INTO `guet_user` VALUES ('26', 'hello123', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', 'demo001', '', null, '', '0', '2025-12-12 22:57:17', '2025-12-16 07:42:57', '');
INSERT INTO `guet_user` VALUES ('29', '广西234', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '小明111', '', null, '', '1', '2025-12-15 09:23:56', '2025-12-16 07:42:57', '');
INSERT INTO `guet_user` VALUES ('30', '北京', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '小明111', '', null, '', '1', '2025-12-15 09:24:27', '2025-12-16 07:42:57', '');

-- ----------------------------
-- Table structure for `guet_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `guet_user_role`;
CREATE TABLE `guet_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_admin_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';

-- ----------------------------
-- Records of guet_user_role
-- ----------------------------
INSERT INTO `guet_user_role` VALUES ('18', '45', '5');
INSERT INTO `guet_user_role` VALUES ('26', '45', '30');
INSERT INTO `guet_user_role` VALUES ('27', '10', '30');
INSERT INTO `guet_user_role` VALUES ('28', '38', '30');
INSERT INTO `guet_user_role` VALUES ('43', '10', '1');
INSERT INTO `guet_user_role` VALUES ('44', '36', '1');
INSERT INTO `guet_user_role` VALUES ('45', '9', '1');

-- ----------------------------
-- Table structure for `guet_logistics`
-- ----------------------------
DROP TABLE IF EXISTS `guet_logistics`;
CREATE TABLE `guet_logistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '订单ID',
  `status` tinyint NOT NULL COMMENT '状态: 1待取件 2已取件 3运输中 4已到达 5派送中 6已签收',
  `location` varchar(100) DEFAULT NULL COMMENT '当前位置',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物流轨迹表';

-- ----------------------------
-- Records of guet_logistics (示例数据)
-- ----------------------------
INSERT INTO `guet_logistics` (`order_id`, `status`, `location`, `operator`, `remark`) VALUES 
(8, 1, '广西水利电力职业技术学院（长堽校区）', '系统', '订单已创建，等待取件'),
(8, 2, '南宁市青秀区营业点', '快递员小李', '已取件'),
(8, 3, '南宁转运中心', '系统', '包裹已发出，正在运输中'),
(10, 1, '广西区桂林市金鸡路1号', '系统', '订单已创建，等待取件'),
(11, 1, '广西区桂林市金鸡路1号', '系统', '订单已创建，等待取件');

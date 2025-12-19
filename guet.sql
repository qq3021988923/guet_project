/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : guet

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2025-12-20 04:05:41
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_customer
-- ----------------------------
INSERT INTO `guet_customer` VALUES ('1', '12', null, '王总', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('2', '1', '33', '小明', '324234', '3423423', '上海', '6', '666');
INSERT INTO `guet_customer` VALUES ('5', '12', null, '马化腾', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('7', '12', null, '小张', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('8', null, null, '张无忌123', null, null, null, null, null);
INSERT INTO `guet_customer` VALUES ('15', '5', null, '杨', '18776423429', '3021988923@qq.com', '广西水利电力职业技术学院（长堽校区）', '男', 'hello');
INSERT INTO `guet_customer` VALUES ('16', '1', null, '杨某', '18776423429', '3021988923@qq.com', '广西水利电力职业技术学院（长堽校区）', '男', null);
INSERT INTO `guet_customer` VALUES ('17', '1', null, '张三', '18776423429', '3021988923@qq.com', '广西水利电力职业技术学院（长堽校区）', '男', null);
INSERT INTO `guet_customer` VALUES ('18', '14', null, '小明明', '18776423429', '3021988923@qq.com', '广西水利电力职业技术学院（长堽校区）', '男', null);
INSERT INTO `guet_customer` VALUES ('19', '14', null, '杨', '18776423429', '3021988923@qq.com', '广西水利电力职业技术学院（长堽校区）', '女', null);

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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_logistics
-- ----------------------------
INSERT INTO `guet_logistics` VALUES ('1', '13', '3', '北京', '自己人', '贵重物品 轻拿轻放', '2025-12-19 14:02:22');
INSERT INTO `guet_logistics` VALUES ('2', '13', '5', '我家', '自己人', '', '2025-12-19 14:14:17');
INSERT INTO `guet_logistics` VALUES ('3', '16', '2', '福建', '自己人', '物件较大', '2025-12-19 14:22:15');
INSERT INTO `guet_logistics` VALUES ('4', '16', '3', '广西', '自己人', '', '2025-12-19 14:26:15');
INSERT INTO `guet_logistics` VALUES ('5', '15', '4', ' 广西水利电力职业技术学院（长堽校区）', '自己人', '', '2025-12-19 14:27:08');
INSERT INTO `guet_logistics` VALUES ('6', '15', '5', ' 广西水利电力职业技术学院（长堽校区', '自己人', '', '2025-12-19 14:29:29');
INSERT INTO `guet_logistics` VALUES ('7', '14', '2', '大连', '自己人', '', '2025-12-19 14:29:41');
INSERT INTO `guet_logistics` VALUES ('8', '14', '3', '广西', '自己人', '', '2025-12-19 14:30:04');
INSERT INTO `guet_logistics` VALUES ('9', '14', '4', '广西水利电力职业技术学院', '自己人', '', '2025-12-19 14:30:38');

-- ----------------------------
-- Table structure for `guet_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `guet_operation_log`;
CREATE TABLE `guet_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '操作用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '操作用户名',
  `module` varchar(50) DEFAULT NULL COMMENT '操作模块：用户管理/订单管理/客户管理等',
  `operation` varchar(50) DEFAULT NULL COMMENT '操作类型：新增/修改/删除/查询/登录/登出',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` text COMMENT '请求参数',
  `ip` varchar(50) DEFAULT NULL COMMENT '操作IP',
  `status` tinyint DEFAULT '1' COMMENT '状态：1成功 0失败',
  `error_msg` text COMMENT '错误信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';

-- ----------------------------
-- Records of guet_operation_log
-- ----------------------------
INSERT INTO `guet_operation_log` VALUES ('1', '1', '未知用户', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"北京\",\"brand\":\"欧莱雅\",\"citi\":\"大连\",\"customerId\":2,\"desc\":\"护肤品\",\"name\":\"洗面奶\",\"number\":30,\"payment\":\"全款\",\"person\":\"张记\",\"phone\":\"18776423429\",\"pickup\":\"上门取件\",\"price\":78,\"shipping\":\"海运\",\"total\":2340,\"unit\":\"件\",\"userId\":1}]', '127.0.0.1', '1', null, '2025-12-20 02:11:12');
INSERT INTO `guet_operation_log` VALUES ('2', '1', '自己人', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 02:31:25');
INSERT INTO `guet_operation_log` VALUES ('3', '1', '自己人', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 02:35:46');
INSERT INTO `guet_operation_log` VALUES ('4', '14', '111', '用户管理', '保存用户', 'com.yang.guetconsumerr.controller.GuetController.saveUser()', '[{\"roleIds\":[10,36,9],\"user\":{\"id\":1,\"memo\":\"管理员账号\",\"name\":\"马化腾\",\"password\":\"123456\",\"phone\":\"15011113652\",\"sex\":\"男\",\"username\":\"admin\"}}]', '127.0.0.1', '1', null, '2025-12-20 02:40:57');
INSERT INTO `guet_operation_log` VALUES ('5', '14', '111', '用户管理', '保存用户', 'com.yang.guetconsumerr.controller.GuetController.saveUser()', '[{\"roleIds\":[10,9],\"user\":{\"id\":1,\"memo\":\"管理员账号\",\"name\":\"马化腾\",\"password\":\"123456\",\"phone\":\"15011113652\",\"sex\":\"男\",\"username\":\"admin\"}}]', '127.0.0.1', '1', null, '2025-12-20 02:43:02');
INSERT INTO `guet_operation_log` VALUES ('6', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 02:56:54');
INSERT INTO `guet_operation_log` VALUES ('7', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 02:56:58');
INSERT INTO `guet_operation_log` VALUES ('8', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 02:59:43');
INSERT INTO `guet_operation_log` VALUES ('9', '14', '111', '客户管理', '新增客户', 'com.yang.guetconsumerr.controller.CustomerController.insert()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"email\":\"3021988923@qq.com\",\"name\":\"杨\",\"phone\":\"18776423429\",\"sex\":\"女\",\"userId\":14}]', '127.0.0.1', '1', null, '2025-12-20 02:59:55');
INSERT INTO `guet_operation_log` VALUES ('10', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 03:15:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_order
-- ----------------------------
INSERT INTO `guet_order` VALUES ('11', '5', '15', 'td5916659401', '电脑', '5', '5000', '25000', '1', '广西区桂林市金鸡路1号', '2025-12-17 04:24:19', '全款', '海运', '大连', '不要报错', '18776423429', '自己人', '上门取件', '斤', '苹果');
INSERT INTO `guet_order` VALUES ('13', '1', '2', 'td5938365049', '被子', '8', '17', '136', '1', '广西区桂林市金鸡路1号', '2025-12-17 10:26:05', '预付定金', '空运', '大连', '轻拿轻放', '18776423429', '暂放小卖部', '快递邮寄', '个', '京东甄选');
INSERT INTO `guet_order` VALUES ('14', '1', '16', 'td5938555898', '笔记本', '5', '7777', '38885', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-17 10:29:15', '全款', '海运', '大连', '666', '18776423429', '小黑', '上门取件', '斤', '华为');
INSERT INTO `guet_order` VALUES ('15', '1', '17', 'td5938678491', '椅子', '5', '88', '440', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-17 10:31:18', '全款', '海运', '大连', '', '18776423429', '杨果', '上门取件', '斤', '拼多多');
INSERT INTO `guet_order` VALUES ('16', '1', '17', 'td6125165963', '塑料颗', '10', '0', '8', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-19 14:19:25', '全款', '海运', '宁波', '塑料', '18776423429', '张经理', '上门取件', '斤', '三无产品');
INSERT INTO `guet_order` VALUES ('17', '14', '18', 'td6126046782', '内裤', '50', '9', '450', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-19 14:34:06', '全款', '海运', '大连', '急用，请优先发货', '18776423429', '杨总', '上门取件', '件', '纯棉');
INSERT INTO `guet_order` VALUES ('18', '1', '2', 'td6167872678', '洗面奶', '30', '78', '2340', '1', '北京', '2025-12-20 02:11:12', '全款', '海运', '大连', '护肤品', '18776423429', '张记', '上门取件', '件', '欧莱雅');

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
INSERT INTO `guet_user` VALUES ('1', 'admin', '$2a$10$gsJYGPZNz1fcpquHZYRey.RoZXVlFGp9EqkM.9LbRwHfAcmp9.Fpa', '马化腾', '15011113652', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '管理员账号', '1', '2025-08-01 10:17:18', '2025-12-20 02:43:02', '男');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';

-- ----------------------------
-- Records of guet_user_role
-- ----------------------------
INSERT INTO `guet_user_role` VALUES ('18', '45', '5');
INSERT INTO `guet_user_role` VALUES ('26', '45', '30');
INSERT INTO `guet_user_role` VALUES ('27', '10', '30');
INSERT INTO `guet_user_role` VALUES ('28', '38', '30');
INSERT INTO `guet_user_role` VALUES ('52', '10', '1');
INSERT INTO `guet_user_role` VALUES ('53', '9', '1');

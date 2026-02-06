/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : guet

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2026-02-06 17:32:13
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of basicdata
-- ----------------------------
INSERT INTO `basicdata` VALUES ('1', null, '常用区间', '');
INSERT INTO `basicdata` VALUES ('2', null, '运货方式', null);
INSERT INTO `basicdata` VALUES ('3', null, '付款方式', null);
INSERT INTO `basicdata` VALUES ('4', '1', '越秀区', '越秀区');
INSERT INTO `basicdata` VALUES ('5', '1', '海珠区', '海珠区');
INSERT INTO `basicdata` VALUES ('6', '1', '荔枝区', '荔枝区');
INSERT INTO `basicdata` VALUES ('7', '1', '天河区', '天河区');
INSERT INTO `basicdata` VALUES ('8', '1', '白云区', '白云区');
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
INSERT INTO `basicdata` VALUES ('68', '1', '黄埔区', '黄埔区');
INSERT INTO `basicdata` VALUES ('69', '21', '台', '台');
INSERT INTO `basicdata` VALUES ('70', null, '运输路线', '路线管理');
INSERT INTO `basicdata` VALUES ('71', '70', '大连-上海', '800km,海运25h,空运1h,陆运10h');
INSERT INTO `basicdata` VALUES ('72', '70', '大连-北京', '400km,海运16h,空运0.5h,陆运5h');
INSERT INTO `basicdata` VALUES ('73', '70', '上海-广州', '1500km,海运60h,空运2h,陆运19h');
INSERT INTO `basicdata` VALUES ('74', '70', '广州-深圳', '150km,海运6h,空运0.2h,陆运2h');
INSERT INTO `basicdata` VALUES ('75', '70', '深圳-香港', '50km,海运2h,空运0.1h,陆运1h');
INSERT INTO `basicdata` VALUES ('76', null, '运输成本', '每公里成本');
INSERT INTO `basicdata` VALUES ('77', '71', '海运成本', '0.8');
INSERT INTO `basicdata` VALUES ('78', '71', '空运成本', '5.0');
INSERT INTO `basicdata` VALUES ('79', '71', '陆运成本', '2.0');
INSERT INTO `basicdata` VALUES ('80', '71', '海运成本', '0.8');
INSERT INTO `basicdata` VALUES ('81', '71', '空运成本', '5.0');
INSERT INTO `basicdata` VALUES ('82', '71', '陆运成本', '2.0');
INSERT INTO `basicdata` VALUES ('83', '76', '海运成本', '0.8');
INSERT INTO `basicdata` VALUES ('84', '76', '空运成本', '5.0');
INSERT INTO `basicdata` VALUES ('85', '76', '陆运成本', '2.0');

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
-- Table structure for `guet_finance`
-- ----------------------------
DROP TABLE IF EXISTS `guet_finance`;
CREATE TABLE `guet_finance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `unpaid_amount` decimal(10,2) NOT NULL,
  `payment_status` tinyint DEFAULT '1' COMMENT '1未付 2部分付 3已付',
  `payment_count` int DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_finance
-- ----------------------------
INSERT INTO `guet_finance` VALUES ('39', '11', '25000.00', '15000.00', '10000.00', '2', '2', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '客户要求分期付款');
INSERT INTO `guet_finance` VALUES ('40', '13', '136.00', '136.00', '0.00', '3', '1', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '已全额付款');
INSERT INTO `guet_finance` VALUES ('41', '14', '38885.00', '20000.00', '18885.00', '2', '1', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '首付已收，尾款待收');
INSERT INTO `guet_finance` VALUES ('42', '15', '440.00', '440.00', '0.00', '3', '1', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '现金交易');
INSERT INTO `guet_finance` VALUES ('43', '16', '8.00', '0.00', '8.00', '1', '0', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '待付款');
INSERT INTO `guet_finance` VALUES ('44', '17', '450.00', '0.00', '450.00', '1', '0', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '待付款');
INSERT INTO `guet_finance` VALUES ('45', '18', '2340.00', '1000.00', '1340.00', '2', '1', '2026-01-22 00:03:50', '2026-01-22 00:03:50', '已付定金');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `guet_logistics` VALUES ('10', '21', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2025-12-20 11:19:52');
INSERT INTO `guet_logistics` VALUES ('11', '22', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2025-12-20 11:19:52');
INSERT INTO `guet_logistics` VALUES ('12', '21', '3', '越南', '马化腾', '', '2025-12-20 11:21:08');
INSERT INTO `guet_logistics` VALUES ('13', '17', '4', '上海', '111', '', '2025-12-20 11:23:51');
INSERT INTO `guet_logistics` VALUES ('14', '23', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2025-12-20 11:25:22');
INSERT INTO `guet_logistics` VALUES ('15', '24', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2025-12-20 11:25:22');
INSERT INTO `guet_logistics` VALUES ('16', '25', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2025-12-20 11:25:22');
INSERT INTO `guet_logistics` VALUES ('17', '18', '3', '贵州', '马化腾', '1234', '2025-12-24 14:13:39');
INSERT INTO `guet_logistics` VALUES ('18', '11', '3', '上海', '张三33', '1', '2026-01-20 23:01:18');
INSERT INTO `guet_logistics` VALUES ('19', '26', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2026-01-20 23:42:23');
INSERT INTO `guet_logistics` VALUES ('20', '27', '1', '广西区桂林市金鸡路1号', null, '订单已创建，等待取件', '2026-01-20 23:46:48');
INSERT INTO `guet_logistics` VALUES ('21', '28', '1', '广西区桂林市金鸡路1号', null, '订单已创建，等待取件', '2026-01-21 19:27:06');
INSERT INTO `guet_logistics` VALUES ('22', '29', '1', '广西区桂林市金鸡路1号', null, '订单已创建，等待取件', '2026-01-21 19:27:06');
INSERT INTO `guet_logistics` VALUES ('23', '30', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2026-01-21 23:47:17');
INSERT INTO `guet_logistics` VALUES ('24', '31', '1', '广西水利电力职业技术学院（长堽校区）', null, '订单已创建，等待取件', '2026-01-21 23:47:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';

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
INSERT INTO `guet_operation_log` VALUES ('11', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:26:25');
INSERT INTO `guet_operation_log` VALUES ('12', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:26:46');
INSERT INTO `guet_operation_log` VALUES ('13', '1', '马化腾', '用户管理', '保存用户', 'com.yang.guetconsumerr.controller.GuetController.saveUser()', '[{\"roleIds\":[9],\"user\":{\"id\":13,\"memo\":\"hello\",\"name\":\"hello\",\"password\":\"123456\",\"phone\":\"12343423423\",\"sex\":\"女\",\"username\":\"hello\"}}]', '127.0.0.1', '1', null, '2025-12-20 10:27:02');
INSERT INTO `guet_operation_log` VALUES ('14', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:27:27');
INSERT INTO `guet_operation_log` VALUES ('15', '14', '111', '用户管理', '保存用户', 'com.yang.guetconsumerr.controller.GuetController.saveUser()', '[{\"roleIds\":[9],\"user\":{\"id\":14,\"memo\":\"77\",\"name\":\"111\",\"password\":\"123456\",\"phone\":\"444\",\"sex\":\"\",\"username\":\"hello\"}}]', '127.0.0.1', '1', null, '2025-12-20 10:27:44');
INSERT INTO `guet_operation_log` VALUES ('16', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:27:57');
INSERT INTO `guet_operation_log` VALUES ('17', '14', '111', '用户管理', '保存用户', 'com.yang.guetconsumerr.controller.GuetController.saveUser()', '[{\"roleIds\":[10],\"user\":{\"id\":14,\"memo\":\"77\",\"name\":\"111\",\"password\":\"123456\",\"phone\":\"444\",\"sex\":\"\",\"username\":\"hello\"}}]', '127.0.0.1', '1', null, '2025-12-20 10:28:18');
INSERT INTO `guet_operation_log` VALUES ('18', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:28:32');
INSERT INTO `guet_operation_log` VALUES ('19', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:33:06');
INSERT INTO `guet_operation_log` VALUES ('20', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:33:32');
INSERT INTO `guet_operation_log` VALUES ('21', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:33:44');
INSERT INTO `guet_operation_log` VALUES ('22', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:33:57');
INSERT INTO `guet_operation_log` VALUES ('23', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:34:02');
INSERT INTO `guet_operation_log` VALUES ('24', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:39:13');
INSERT INTO `guet_operation_log` VALUES ('25', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:39:42');
INSERT INTO `guet_operation_log` VALUES ('26', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 10:40:17');
INSERT INTO `guet_operation_log` VALUES ('27', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 11:07:16');
INSERT INTO `guet_operation_log` VALUES ('28', '1', '马化腾', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"citi\":\"海珠区\",\"customerId\":2,\"desc\":\"生活用品\",\"items\":[{\"brand\":\"温州货\",\"name\":\"被子\",\"number\":3,\"price\":99,\"total\":297,\"unit\":\"件\"},{\"brand\":\"地摊货\",\"name\":\"鞋子\",\"number\":4,\"price\":19,\"total\":76,\"unit\":\"个\"}],\"payment\":\"预付定金\",\"person\":\"杨怡\",\"phone\":\"18776423429\",\"pickup\":\"自动配送\",\"shipping\":\"空运\",\"userId\":1}]', '127.0.0.1', '0', '[400] during [POST] to [http://guet-provide/logistics/init?location=%E5%B9%BF%E8%A5%BF%E6%B0%B4%E5%88%A9%E7%94%B5%E5%8A%9B%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2%EF%BC%88%E9%95%BF%E5%A0%BD%E6%A0%A1%E5%8C%BA%EF%BC%89] [LogisticsService#initLogistics(Integer,String,String)]: [{\"timestamp\":\"2025-12-20T03:13:37.698+00:00\",\"status\":400,\"error\":\"Bad Request\",\"path\":\"/logistics/init\"}]', '2025-12-20 11:13:37');
INSERT INTO `guet_operation_log` VALUES ('29', '1', '马化腾', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"citi\":\"海珠区\",\"customerId\":2,\"desc\":\"生活用品\",\"items\":[{\"brand\":\"温州货\",\"name\":\"被子\",\"number\":3,\"price\":99,\"total\":297,\"unit\":\"件\"},{\"brand\":\"地摊货\",\"name\":\"鞋子\",\"number\":4,\"price\":19,\"total\":76,\"unit\":\"个\"}],\"payment\":\"预付定金\",\"person\":\"杨怡\",\"phone\":\"18776423429\",\"pickup\":\"自动配送\",\"shipping\":\"空运\",\"userId\":1}]', '127.0.0.1', '0', '[400] during [POST] to [http://guet-provide/logistics/init?location=%E5%B9%BF%E8%A5%BF%E6%B0%B4%E5%88%A9%E7%94%B5%E5%8A%9B%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2%EF%BC%88%E9%95%BF%E5%A0%BD%E6%A0%A1%E5%8C%BA%EF%BC%89] [LogisticsService#initLogistics(Integer,String,String)]: [{\"timestamp\":\"2025-12-20T03:14:07.106+00:00\",\"status\":400,\"error\":\"Bad Request\",\"path\":\"/logistics/init\"}]', '2025-12-20 11:14:07');
INSERT INTO `guet_operation_log` VALUES ('30', '1', '马化腾', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"citi\":\"海珠区\",\"customerId\":2,\"desc\":\"生活用品\",\"items\":[{\"brand\":\"温州货\",\"name\":\"被子\",\"number\":3,\"price\":99,\"total\":297,\"unit\":\"件\"},{\"brand\":\"地摊货\",\"name\":\"鞋子\",\"number\":4,\"price\":19,\"total\":76,\"unit\":\"个\"}],\"payment\":\"预付定金\",\"person\":\"杨怡\",\"phone\":\"18776423429\",\"pickup\":\"自动配送\",\"shipping\":\"空运\",\"userId\":1}]', '127.0.0.1', '1', null, '2025-12-20 11:19:52');
INSERT INTO `guet_operation_log` VALUES ('31', '1', '马化腾', '物流管理', '更新物流状态', 'com.yang.guetconsumerr.controller.LogisticsController.addLogistics()', '[{\"location\":\"越南\",\"operator\":\"马化腾\",\"orderId\":21,\"remark\":\"\",\"status\":3,\"statusText\":\"运输中\"}]', '127.0.0.1', '1', null, '2025-12-20 11:21:08');
INSERT INTO `guet_operation_log` VALUES ('32', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-20 11:21:31');
INSERT INTO `guet_operation_log` VALUES ('33', '14', '111', '物流管理', '更新物流状态', 'com.yang.guetconsumerr.controller.LogisticsController.addLogistics()', '[{\"location\":\"上海\",\"operator\":\"111\",\"orderId\":17,\"remark\":\"\",\"status\":4,\"statusText\":\"已送达\"}]', '127.0.0.1', '1', null, '2025-12-20 11:23:51');
INSERT INTO `guet_operation_log` VALUES ('34', '14', '111', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"citi\":\"白云区\",\"customerId\":19,\"desc\":\"生活用品\",\"items\":[{\"brand\":\"温州货\",\"name\":\"被子\",\"number\":3,\"price\":99,\"total\":297,\"unit\":\"斤\"},{\"brand\":\"耐克\",\"name\":\"衣服\",\"number\":5,\"price\":88,\"total\":440,\"unit\":\"件\"},{\"brand\":\"海飞丝\",\"name\":\"洗发水\",\"number\":2,\"price\":39,\"total\":78,\"unit\":\"个\"}],\"payment\":\"全款\",\"person\":\"杨怡\",\"phone\":\"18776423429\",\"pickup\":\"上门取件\",\"shipping\":\"海运\",\"userId\":14}]', '127.0.0.1', '1', null, '2025-12-20 11:25:22');
INSERT INTO `guet_operation_log` VALUES ('35', '14', '111', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-20 11:25:46');
INSERT INTO `guet_operation_log` VALUES ('36', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-24 13:42:01');
INSERT INTO `guet_operation_log` VALUES ('37', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-24 13:42:03');
INSERT INTO `guet_operation_log` VALUES ('38', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-24 13:42:09');
INSERT INTO `guet_operation_log` VALUES ('39', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"hello\"},{}]', '127.0.0.1', '1', null, '2025-12-24 13:46:59');
INSERT INTO `guet_operation_log` VALUES ('40', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-24 13:48:54');
INSERT INTO `guet_operation_log` VALUES ('41', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2025-12-24 13:48:59');
INSERT INTO `guet_operation_log` VALUES ('42', '1', '马化腾', '物流管理', '更新物流状态', 'com.yang.guetconsumerr.controller.LogisticsController.addLogistics()', '[{\"location\":\"贵州\",\"operator\":\"马化腾\",\"orderId\":18,\"remark\":\"1234\",\"status\":3,\"statusText\":\"运输中\"}]', '127.0.0.1', '1', null, '2025-12-24 14:13:39');
INSERT INTO `guet_operation_log` VALUES ('43', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2025-12-24 14:18:07');
INSERT INTO `guet_operation_log` VALUES ('44', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-20 21:11:52');
INSERT INTO `guet_operation_log` VALUES ('45', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-20 22:27:41');
INSERT INTO `guet_operation_log` VALUES ('46', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-20 22:27:44');
INSERT INTO `guet_operation_log` VALUES ('47', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-20 22:31:37');
INSERT INTO `guet_operation_log` VALUES ('48', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-20 22:31:39');
INSERT INTO `guet_operation_log` VALUES ('49', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-20 22:31:46');
INSERT INTO `guet_operation_log` VALUES ('50', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-20 23:00:36');
INSERT INTO `guet_operation_log` VALUES ('51', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-20 23:00:41');
INSERT INTO `guet_operation_log` VALUES ('52', '5', '张三33', '物流管理', '更新物流状态', 'com.yang.guetconsumerr.controller.LogisticsController.addLogistics()', '[{\"location\":\"上海\",\"operator\":\"张三33\",\"orderId\":11,\"remark\":\"1\",\"status\":3,\"statusText\":\"运输中\"}]', '127.0.0.1', '1', null, '2026-01-20 23:01:18');
INSERT INTO `guet_operation_log` VALUES ('53', '5', '张三33', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"citi\":\"越秀区\",\"customerId\":15,\"desc\":\"1\",\"items\":[{\"brand\":\"小米制造\",\"name\":\"筷子\",\"number\":10,\"price\":9,\"total\":90,\"unit\":\"个\"}],\"payment\":\"全款\",\"person\":\"张无忌\",\"phone\":\"18776423429\",\"pickup\":\"上门取件\",\"shipping\":\"海运\",\"userId\":5}]', '127.0.0.1', '1', null, '2026-01-20 23:42:23');
INSERT INTO `guet_operation_log` VALUES ('54', '5', '张三33', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西区桂林市金鸡路1号\",\"citi\":\"越秀区\",\"customerId\":15,\"desc\":\"到底\",\"items\":[{\"brand\":\"三五产品\",\"name\":\"袋子\",\"number\":20,\"price\":2,\"total\":40,\"unit\":\"个\"}],\"payment\":\"到付\",\"person\":\"啊\",\"phone\":\"18776423429\",\"pickup\":\"快递邮寄\",\"shipping\":\"空运\",\"userId\":5}]', '127.0.0.1', '1', null, '2026-01-20 23:46:48');
INSERT INTO `guet_operation_log` VALUES ('55', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 16:00:25');
INSERT INTO `guet_operation_log` VALUES ('56', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:04:29');
INSERT INTO `guet_operation_log` VALUES ('57', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:04:32');
INSERT INTO `guet_operation_log` VALUES ('58', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:05:07');
INSERT INTO `guet_operation_log` VALUES ('59', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:05:12');
INSERT INTO `guet_operation_log` VALUES ('60', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:05:16');
INSERT INTO `guet_operation_log` VALUES ('61', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:53:14');
INSERT INTO `guet_operation_log` VALUES ('62', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:53:18');
INSERT INTO `guet_operation_log` VALUES ('63', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 17:57:13');
INSERT INTO `guet_operation_log` VALUES ('64', '1', '马化腾', '用户管理', '保存用户', 'com.yang.guetconsumerr.controller.GuetController.saveUser()', '[{\"roleIds\":[10,9,36],\"user\":{\"id\":1,\"memo\":\"管理员账号\",\"name\":\"马化腾\",\"password\":\"123456\",\"phone\":\"15011113652\",\"sex\":\"男\",\"username\":\"admin\"}}]', '127.0.0.1', '1', null, '2026-01-21 18:35:17');
INSERT INTO `guet_operation_log` VALUES ('65', '1', '马化腾', '用户管理', '删除用户', 'com.yang.guetconsumerr.controller.GuetController.deleteUserPhysicallyById()', '[30]', '127.0.0.1', '1', null, '2026-01-21 18:35:25');
INSERT INTO `guet_operation_log` VALUES ('66', '1', '马化腾', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西区桂林市金鸡路1号\",\"citi\":\"越秀区\",\"customerId\":2,\"desc\":\"到底\",\"items\":[{\"brand\":\"3\",\"name\":\"1\",\"number\":2,\"price\":2,\"total\":4,\"unit\":\"斤\"},{\"brand\":\"3\",\"name\":\"2\",\"number\":1,\"price\":2,\"total\":2,\"unit\":\"件\"}],\"payment\":\"全款\",\"person\":\"啊\",\"phone\":\"18776423429\",\"pickup\":\"上门取件\",\"shipping\":\"海运\",\"userId\":1}]', '127.0.0.1', '1', null, '2026-01-21 19:27:06');
INSERT INTO `guet_operation_log` VALUES ('67', '1', '马化腾', '订单管理', '删除订单', 'com.yang.guetconsumerr.controller.GuetOrderController.delete()', '[29]', '127.0.0.1', '1', null, '2026-01-21 19:27:50');
INSERT INTO `guet_operation_log` VALUES ('68', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 19:35:18');
INSERT INTO `guet_operation_log` VALUES ('69', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 19:35:21');
INSERT INTO `guet_operation_log` VALUES ('70', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"admin\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 19:43:57');
INSERT INTO `guet_operation_log` VALUES ('71', '5', '张三33', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 19:44:02');
INSERT INTO `guet_operation_log` VALUES ('72', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:25:42');
INSERT INTO `guet_operation_log` VALUES ('73', '1', '马化腾', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:33:05');
INSERT INTO `guet_operation_log` VALUES ('74', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:38:10');
INSERT INTO `guet_operation_log` VALUES ('75', '1', '马化腾', '订单管理', '删除订单', 'com.yang.guetconsumerr.controller.GuetOrderController.delete()', '[18]', '127.0.0.1', '1', null, '2026-01-21 23:39:50');
INSERT INTO `guet_operation_log` VALUES ('76', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:40:45');
INSERT INTO `guet_operation_log` VALUES ('77', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:41:06');
INSERT INTO `guet_operation_log` VALUES ('78', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:41:59');
INSERT INTO `guet_operation_log` VALUES ('79', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:42:18');
INSERT INTO `guet_operation_log` VALUES ('80', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:43:05');
INSERT INTO `guet_operation_log` VALUES ('81', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:44:33');
INSERT INTO `guet_operation_log` VALUES ('82', '1', '马化腾', '用户管理', '禁用用户', 'com.yang.guetconsumerr.controller.GuetController.deleteUserById()', '[5]', '127.0.0.1', '1', null, '2026-01-21 23:45:05');
INSERT INTO `guet_operation_log` VALUES ('83', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"zhangsan\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:45:11');
INSERT INTO `guet_operation_log` VALUES ('84', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:45:18');
INSERT INTO `guet_operation_log` VALUES ('85', '1', '马化腾', '用户管理', '启用用户', 'com.yang.guetconsumerr.controller.GuetController.updateStatus()', '[5]', '127.0.0.1', '1', null, '2026-01-21 23:45:22');
INSERT INTO `guet_operation_log` VALUES ('86', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"test1212\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:45:40');
INSERT INTO `guet_operation_log` VALUES ('87', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:45:47');
INSERT INTO `guet_operation_log` VALUES ('88', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"lucy1\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:45:58');
INSERT INTO `guet_operation_log` VALUES ('89', '12', '1', '订单管理', '新增订单', 'com.yang.guetconsumerr.controller.GuetOrderController.addOrder()', '[{\"address\":\"广西水利电力职业技术学院（长堽校区）\",\"citi\":\"天河区\",\"customerId\":7,\"desc\":\"\",\"items\":[{\"brand\":\"HUAWEI\",\"name\":\"华为手机\",\"number\":10,\"price\":3999,\"total\":39990,\"unit\":\"台\"},{\"brand\":\"MI\",\"name\":\"红米手机\",\"number\":5,\"price\":1999,\"total\":9995,\"unit\":\"台\"}],\"payment\":\"全款\",\"person\":\"计算机\",\"phone\":\"18776423429\",\"pickup\":\"上门取件\",\"shipping\":\"海运\",\"userId\":12}]', '127.0.0.1', '1', null, '2026-01-21 23:47:17');
INSERT INTO `guet_operation_log` VALUES ('90', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-21 23:47:27');
INSERT INTO `guet_operation_log` VALUES ('91', '1', '马化腾', '用户管理', '删除用户', 'com.yang.guetconsumerr.controller.GuetController.deleteUserPhysicallyById()', '[12]', '127.0.0.1', '1', null, '2026-01-21 23:47:33');
INSERT INTO `guet_operation_log` VALUES ('92', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-22 00:58:49');
INSERT INTO `guet_operation_log` VALUES ('93', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-22 01:06:05');
INSERT INTO `guet_operation_log` VALUES ('94', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-22 01:14:30');
INSERT INTO `guet_operation_log` VALUES ('95', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-22 01:25:34');
INSERT INTO `guet_operation_log` VALUES ('96', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-22 01:47:08');
INSERT INTO `guet_operation_log` VALUES ('97', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-01-22 01:47:44');
INSERT INTO `guet_operation_log` VALUES ('98', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-02-06 17:28:03');
INSERT INTO `guet_operation_log` VALUES ('99', null, '未知用户', '系统', '用户登录', 'com.yang.guetconsumerr.controller.GuetController.verifyLogin()', '[{\"password\":\"123456\",\"username\":\"admin\"},{}]', '127.0.0.1', '1', null, '2026-02-06 17:29:31');
INSERT INTO `guet_operation_log` VALUES ('100', '1', '马化腾', '财务管理', '添加收款', 'com.yang.guetconsumerr.controller.FinanceController.addPayment()', '[{\"financeId\":41,\"operatorId\":1,\"orderId\":14,\"paymentAmount\":1000,\"paymentMethod\":\"银行转账\"}]', '127.0.0.1', '0', '[500] during [POST] to [http://guet-provide/finance/payment] [FinanceService#addPayment(PaymentDTO)]: [{\"timestamp\":\"2026-02-06T09:30:50.888+00:00\",\"status\":500,\"error\":\"Internal Server Error\",\"path\":\"/finance/payment\"}]', '2026-02-06 17:30:50');
INSERT INTO `guet_operation_log` VALUES ('101', '1', '马化腾', '财务管理', '添加收款', 'com.yang.guetconsumerr.controller.FinanceController.addPayment()', '[{\"financeId\":41,\"operatorId\":1,\"orderId\":14,\"paymentAmount\":1000,\"paymentMethod\":\"银行转账\"}]', '127.0.0.1', '0', '[500] during [POST] to [http://guet-provide/finance/payment] [FinanceService#addPayment(PaymentDTO)]: [{\"timestamp\":\"2026-02-06T09:31:04.303+00:00\",\"status\":500,\"error\":\"Internal Server Error\",\"path\":\"/finance/payment\"}]', '2026-02-06 17:31:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_order
-- ----------------------------
INSERT INTO `guet_order` VALUES ('11', '5', '15', 'td5916659401', '电脑', '5', '5000', '25000', '1', '广西区桂林市金鸡路1号', '2025-12-17 04:24:19', '全款', '海运', '大连', '不要报错', '18776423429', '自己人', '上门取件', '斤', '苹果');
INSERT INTO `guet_order` VALUES ('13', '1', '2', 'td5938365049', '被子', '8', '17', '136', '1', '广西区桂林市金鸡路1号', '2025-12-17 10:26:05', '预付定金', '空运', '大连', '轻拿轻放', '18776423429', '暂放小卖部', '快递邮寄', '个', '京东甄选');
INSERT INTO `guet_order` VALUES ('14', '1', '16', 'td5938555898', '笔记本', '5', '7777', '38885', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-17 10:29:15', '全款', '海运', '大连', '666', '18776423429', '小黑', '上门取件', '斤', '华为');
INSERT INTO `guet_order` VALUES ('15', '1', '17', 'td5938678491', '椅子', '5', '88', '440', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-17 10:31:18', '全款', '海运', '大连', '', '18776423429', '杨果', '上门取件', '斤', '拼多多');
INSERT INTO `guet_order` VALUES ('16', '1', '17', 'td6125165963', '塑料颗', '10', '0', '8', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-19 14:19:25', '全款', '海运', '宁波', '塑料', '18776423429', '张经理', '上门取件', '斤', '三无产品');
INSERT INTO `guet_order` VALUES ('17', '14', '18', 'td6126046782', '内裤', '50', '9', '450', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-19 14:34:06', '全款', '海运', '大连', '急用，请优先发货', '18776423429', '杨总', '上门取件', '件', '纯棉');
INSERT INTO `guet_order` VALUES ('19', '1', '2', 'td6200417647', '被子', '3', '99', '297', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:13:37', '预付定金', '空运', '海珠区', '生活用品', '18776423429', '杨怡', '自动配送', '件', '温州货');
INSERT INTO `guet_order` VALUES ('20', '1', '2', 'td6200447088', '被子', '3', '99', '297', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:14:07', '预付定金', '空运', '海珠区', '生活用品', '18776423429', '杨怡', '自动配送', '件', '温州货');
INSERT INTO `guet_order` VALUES ('21', '1', '2', 'td6200791360', '被子', '3', '99', '297', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:19:52', '预付定金', '空运', '海珠区', '生活用品', '18776423429', '杨怡', '自动配送', '件', '温州货');
INSERT INTO `guet_order` VALUES ('22', '1', '2', 'td6200792098', '鞋子', '4', '19', '76', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:19:52', '预付定金', '空运', '海珠区', '生活用品', '18776423429', '杨怡', '自动配送', '个', '地摊货');
INSERT INTO `guet_order` VALUES ('23', '14', '19', 'td6201121999', '被子', '3', '99', '297', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:25:22', '全款', '海运', '白云区', '生活用品', '18776423429', '杨怡', '上门取件', '斤', '温州货');
INSERT INTO `guet_order` VALUES ('24', '14', '19', 'td6201122020', '衣服', '5', '88', '440', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:25:22', '全款', '海运', '白云区', '生活用品', '18776423429', '杨怡', '上门取件', '件', '耐克');
INSERT INTO `guet_order` VALUES ('25', '14', '19', 'td6201122036', '洗发水', '2', '39', '78', '1', '广西水利电力职业技术学院（长堽校区）', '2025-12-20 11:25:22', '全款', '海运', '白云区', '生活用品', '18776423429', '杨怡', '上门取件', '个', '海飞丝');
INSERT INTO `guet_order` VALUES ('26', '5', '15', 'td8923743823', '筷子', '10', '9', '90', '1', '广西水利电力职业技术学院（长堽校区）', '2026-01-20 23:42:23', '全款', '海运', '越秀区', '1', '18776423429', '张无忌', '上门取件', '个', '小米制造');
INSERT INTO `guet_order` VALUES ('27', '5', '15', 'td8924008434', '袋子', '20', '2', '40', '1', '广西区桂林市金鸡路1号', '2026-01-20 23:46:48', '到付', '空运', '越秀区', '到底', '18776423429', '啊', '快递邮寄', '个', '三五产品');
INSERT INTO `guet_order` VALUES ('28', '1', '2', 'td8994826556', '1', '2', '2', '4', '1', '广西区桂林市金鸡路1号', '2026-01-21 19:27:06', '全款', '海运', '越秀区', '到底', '18776423429', '啊', '上门取件', '斤', '3');
INSERT INTO `guet_order` VALUES ('30', '12', '7', 'td9010437026', '华为手机', '10', '3999', '39990', '1', '广西水利电力职业技术学院（长堽校区）', '2026-01-21 23:47:17', '全款', '海运', '天河区', '', '18776423429', '计算机', '上门取件', '台', 'HUAWEI');
INSERT INTO `guet_order` VALUES ('31', '12', '7', 'td9010437053', '红米手机', '5', '1999', '9995', '1', '广西水利电力职业技术学院（长堽校区）', '2026-01-21 23:47:17', '全款', '海运', '天河区', '', '18776423429', '计算机', '上门取件', '台', 'MI');

-- ----------------------------
-- Table structure for `guet_payment_record`
-- ----------------------------
DROP TABLE IF EXISTS `guet_payment_record`;
CREATE TABLE `guet_payment_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `finance_id` bigint NOT NULL,
  `order_id` int NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_time` timestamp NOT NULL,
  `operator_id` bigint DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guet_payment_record
-- ----------------------------
INSERT INTO `guet_payment_record` VALUES ('1', '1', '11', '10000.00', '转账', '2025-12-18 10:30:00', '1', '2026-01-22 00:03:50');
INSERT INTO `guet_payment_record` VALUES ('2', '1', '11', '5000.00', '支付宝', '2025-12-19 14:20:00', '1', '2026-01-22 00:03:50');
INSERT INTO `guet_payment_record` VALUES ('3', '2', '13', '136.00', '现金', '2025-12-17 11:00:00', '1', '2026-01-22 00:03:50');
INSERT INTO `guet_payment_record` VALUES ('4', '3', '14', '20000.00', '微信', '2025-12-17 15:30:00', '1', '2026-01-22 00:03:50');
INSERT INTO `guet_payment_record` VALUES ('5', '4', '15', '440.00', '转账', '2025-12-18 09:00:00', '1', '2026-01-22 00:03:50');
INSERT INTO `guet_payment_record` VALUES ('6', '7', '18', '1000.00', '支付宝', '2025-12-20 10:00:00', '1', '2026-01-22 00:03:50');

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
INSERT INTO `guet_user` VALUES ('1', 'admin', '$2a$10$E8lSfiCvctipyXlBQdcJw.x7Ts1ptZVL2F.WmI.7ZyJEfsptC1Xwu', '马化腾', '15011113652', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '管理员账号', '1', '2025-08-01 10:17:18', '2026-01-21 18:35:17', '男');
INSERT INTO `guet_user` VALUES ('5', 'zhangsan', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '张三33', '13589658968', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '', '1', '2025-08-01 10:17:18', '2026-01-21 23:45:22', '男');
INSERT INTO `guet_user` VALUES ('6', 'test1212', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', 'test12', '15011245632', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', 'test12', '0', '2025-08-01 10:17:18', '2025-12-16 07:42:57', '男');
INSERT INTO `guet_user` VALUES ('12', 'lucy1', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '1', '1', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', '1', '1', '2025-08-01 10:17:18', '2025-12-16 07:42:57', '男');
INSERT INTO `guet_user` VALUES ('13', 'hello', '$2a$10$sO8ytR6bCq1CLeP1W7Qi3eWyEf7ronQ0lAyA0iFmbkT1dUNEfoeMm', 'hello', '12343423423', 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg', 'hello', '1', '2025-08-01 10:17:18', '2025-12-20 10:27:02', '女');
INSERT INTO `guet_user` VALUES ('14', 'hello', '$2a$10$0bOajXwm0Lv2Mr0mxCk2.uFj9yz1zgz7ttpHqt4SOimIc4G6Zk27q', '111', '444', '444', '77', '1', '2025-12-12 04:03:33', '2025-12-20 10:28:18', '');
INSERT INTO `guet_user` VALUES ('16', 'hello1', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '222', '55', '33', '88', '1', '2025-12-12 04:18:44', '2025-12-16 07:42:57', '');
INSERT INTO `guet_user` VALUES ('17', 'hello1', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '33', '66', '222', '99', '1', '2025-12-12 04:18:45', '2025-12-16 07:42:57', null);
INSERT INTO `guet_user` VALUES ('26', 'hello123', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', 'demo001', '', null, '', '0', '2025-12-12 22:57:17', '2025-12-16 07:42:57', '');
INSERT INTO `guet_user` VALUES ('29', '广西234', '$2a$10$EBAjGQz4zfn8SiX1WF4G6upRfWOqJ8w9xIEpTpYPO//SmM4pWiagy', '小明111', '', null, '', '1', '2025-12-15 09:23:56', '2025-12-16 07:42:57', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';

-- ----------------------------
-- Records of guet_user_role
-- ----------------------------
INSERT INTO `guet_user_role` VALUES ('18', '45', '5');
INSERT INTO `guet_user_role` VALUES ('26', '45', '30');
INSERT INTO `guet_user_role` VALUES ('27', '10', '30');
INSERT INTO `guet_user_role` VALUES ('28', '38', '30');
INSERT INTO `guet_user_role` VALUES ('54', '9', '13');
INSERT INTO `guet_user_role` VALUES ('56', '10', '14');
INSERT INTO `guet_user_role` VALUES ('57', '10', '1');
INSERT INTO `guet_user_role` VALUES ('58', '9', '1');
INSERT INTO `guet_user_role` VALUES ('59', '36', '1');

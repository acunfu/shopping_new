/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : shopping_db

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 15/12/2021 14:47:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for shop_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart_item`;
CREATE TABLE `shop_cart_item`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `pid` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_cart_item
-- ----------------------------
INSERT INTO `shop_cart_item` VALUES (4, 2, 6, 1);
INSERT INTO `shop_cart_item` VALUES (5, 2, 5, 2);
INSERT INTO `shop_cart_item` VALUES (6, 3, 4, 1);
INSERT INTO `shop_cart_item` VALUES (12, 1, 1, NULL);
INSERT INTO `shop_cart_item` VALUES (13, 1, 1, NULL);
INSERT INTO `shop_cart_item` VALUES (14, 1, 1, NULL);
INSERT INTO `shop_cart_item` VALUES (15, 1, 2, NULL);
INSERT INTO `shop_cart_item` VALUES (16, 1, 1, NULL);

-- ----------------------------
-- Table structure for shop_product
-- ----------------------------
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE `shop_product`  (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_price` double(10, 2) NULL DEFAULT NULL,
  `p_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shop_product
-- ----------------------------
INSERT INTO `shop_product` VALUES (1, '键盘', '键盘是用于操作计算机设备运行的一种指令和数据输入装置，也指经过系统安排操作一台机器或设备的一组功能键（如打字机、电脑键盘）。', 200.50, 'static/img/keybord.jpg');
INSERT INTO `shop_product` VALUES (2, '鼠标', '鼠标，是计算机的一种外接输入设备，也是计算机显示系统纵横坐标定位的指示器，因形似老鼠而得名（港台作滑鼠）。其标准称呼应该是“鼠标器”，英文名“Mouse”，鼠标的使用是为了使计算机的操作更加简便快捷，来代替键盘那繁琐的指令。', 80.00, 'static/img/mounse.jpg');
INSERT INTO `shop_product` VALUES (3, '大米', '大米（Rice），亦称稻米，是稻谷经清理、砻谷、碾米、成品整理等工序后制成的食物。大米是中国大部分地区人民的主要食品。', 120.00, 'static/img/race.jpg');
INSERT INTO `shop_product` VALUES (4, '小米', '小米官网直营小米公司旗下所有产品,包括Xiaomi手机系列Xiaomi 11 Ultra、MIX FOLD,Redmi 红米系列Redmi Note 9、Redmi K40 Pro,小米电视、笔记本、米家智能家居等,同时提供小米客户服务及售后支持。', 100.00, 'static/img/srace.gif');
INSERT INTO `shop_product` VALUES (5, '杯子', '杯子是一种专门盛水的器皿。其主要功能都是用来饮酒或饮茶，一般容积不大。', 30.00, 'static/img/cup.jpg');
INSERT INTO `shop_product` VALUES (6, '主机', '主机是指计算机除去输入输出设备以外的主要机体部分。也是用于放置主板及其他主要部件的控制箱体（容器Mainframe）。', 3000.00, 'static/img/box.png');
INSERT INTO `shop_product` VALUES (7, 'CPU', 'CPU一般指中央处理器。 中央处理器（central processing unit，简称CPU）作为计算机系统的运算和控制核心，是信息处理、程序运行的最终执行单元。', 1500.00, 'static/img/cpu.jpg');
INSERT INTO `shop_product` VALUES (8, '显示器', '显示器（display, screen）是属于电脑的I/O设备，即输入输出设备。它是一种将一定的电子文件通过特定的传输设备显示到屏幕上再反射到人眼的显示工具。它可以分为CRT、LCD等多种类型。', 1200.00, 'static/img/print.jpg');
INSERT INTO `shop_product` VALUES (9, '手机', '手机，全称为移动电话或无线电话，通常称为手机，原本只是一种通讯工具，早期又有“大哥大”的俗称，是可以在较广范围内使用的便携式电话终端，最早是由美国贝尔实验室在1940年制造的战地移动电话机发展而来。', 5000.00, 'static/img/iphone.jpg');
INSERT INTO `shop_product` VALUES (10, '笔记本', '笔记本电脑（Laptop），简称笔记本，又称“便携式电脑，手提电脑、掌上电脑或膝上型电脑”，特点是机身小巧。比台式机携带方便，是一种小型、便于携带的个人电脑。通常重1-3公斤。当前发展趋势是体积越来越小，重量越来越轻，功能越来越强。', 8000.00, 'static/img/notebook.jpg');
INSERT INTO `shop_product` VALUES (11, 'MacBookPro', '迄今最强的 MacBook Pro 来了。搭载首次为专业用户设计的 Apple 芯片：超高速 M1 Pro 或 M1 Max，带来性能和续航的颠覆性提升。炫目的 Liquid 视网膜 XDR 屏，全面升级的摄像头和音频系统，各类强大端口也都整装就位。一款独树一帜的笔记本电脑由此诞生。这个 MacBook Pro，就是个猛兽。', 12.40, 'static/img/mbp.jpg');

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_author` int NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO `shop_user` VALUES (1, 'root', 'root', 1);
INSERT INTO `shop_user` VALUES (2, 'admin', 'admin', 1);
INSERT INTO `shop_user` VALUES (3, 'u1', 'u1', 0);
INSERT INTO `shop_user` VALUES (4, 'u2', 'u2', 0);

SET FOREIGN_KEY_CHECKS = 1;

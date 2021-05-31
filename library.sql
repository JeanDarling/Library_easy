/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 19/06/2020 09:26:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `press` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出版社',
  `pubdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出版日期',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书类型',
  `bookshelf` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书架',
  `count` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`bookname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('国内外建筑风格大全', '托尼', '私人教育出版社', '2019-07-30', '建筑设计类', '6', 899);
INSERT INTO `book` VALUES ('心理学基础', '萨顶顶', '同济大学出版社', '2019-01-30', '外语类', '3', 869);
INSERT INTO `book` VALUES ('新东方英语词汇', '俞敏洪', '人民日报出版社', '2019-08-09', '外语类', '2', 9);
INSERT INTO `book` VALUES ('算法设计', '郑宗汉', '同济大学出版社', '2019-07-29', '计算机科学类', '1', 58);
INSERT INTO `book` VALUES ('计算机组成原理', '王道', '电子工业出版社', '2019-08-16', '计算机科学类', '1', 6);
INSERT INTO `book` VALUES ('计算机网络', '吴英', '人民日报出版社', '2019-07-29', '计算机科学类', '1', 84);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `bookname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借书日期',
  `days` int(11) NOT NULL COMMENT '借阅天数',
  `count` int(11) NOT NULL COMMENT '借阅数量',
  PRIMARY KEY (`id`, `bookname`) USING BTREE,
  INDEX `bookname`(`bookname`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`bookname`) REFERENCES `book` (`bookname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('2019001', '国内外建筑风格大全', '建筑设计类', '2019-8-5', 9, 99);
INSERT INTO `borrow` VALUES ('2019001', '计算机组成原理', '计算机科学类', '2019-8-3', 9, 3);
INSERT INTO `borrow` VALUES ('2019001', '计算机网络', '计算机科学类', '2019-8-3', 8, 6);
INSERT INTO `borrow` VALUES ('2019002', '心理学基础', '外语类', '2019-8-3', 9, 30);
INSERT INTO `borrow` VALUES ('2019002', '算法设计', '计算机科学类', '2019-8-3', 5, 1);
INSERT INTO `borrow` VALUES ('2019002', '计算机组成原理', '计算机科学类', '2019-8-3', 6, 1);
INSERT INTO `borrow` VALUES ('2019004', '算法设计', '计算机科学类', '2019-8-3', 1, 1);
INSERT INTO `borrow` VALUES ('2019005', '国内外建筑风格大全', '建筑设计类', '2019-8-5', 1, 1);
INSERT INTO `borrow` VALUES ('2019005', '心理学基础', '外语类', '2019-8-5', 1, 1);
INSERT INTO `borrow` VALUES ('2019005', '新东方英语词汇', '外语类', '2019-8-5', 1, 1);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `islogin` int(10) NOT NULL DEFAULT 0 COMMENT '是否登录',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '激活码',
  `state` int(1) NOT NULL DEFAULT 0 COMMENT '激活状态',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', 'ff0ad942f3afc7a5', 1, '', 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系',
  `islogin` int(10) NULL DEFAULT 0 COMMENT '是否登录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2019001', '001', '男', '123456789', '123456789@qq.com', '计算机学院', 1);
INSERT INTO `student` VALUES ('2019002', '刘亦菲', '女', '256321452', '1453622@qq.com', '航空学院', 0);
INSERT INTO `student` VALUES ('2019003', '牛本', '男', '11222225', '51625616512@qq.com', '建筑学院', 0);
INSERT INTO `student` VALUES ('2019004', '吴吉吉', '男', '25635412', '254615@163.com', '法律系', 1);
INSERT INTO `student` VALUES ('2019005', '陈周志刚', '男', '63595', '95946515982@163.com', '体育学院', 1);

SET FOREIGN_KEY_CHECKS = 1;

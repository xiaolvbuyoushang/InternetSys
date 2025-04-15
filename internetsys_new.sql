/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : internetsys

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 31/03/2025 16:32:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `amdinID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adminName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adminPass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`amdinID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin', '123456');

-- ----------------------------
-- Table structure for auditor
-- ----------------------------
DROP TABLE IF EXISTS `auditor`;
CREATE TABLE `auditor`  (
  `auditorID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `auditorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `auditorPass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` int(255) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auditor
-- ----------------------------
INSERT INTO `auditor` VALUES ('1', 'Feng Zitao', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('2', 'Lu Yunxi', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('3', '1111', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('4', 'Hou Lu', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('5', 'Yan Zhiyuan', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('6', 'Xia Yunxi', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('7', 'Deng Lan', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('8', 'Wei Xiaoming', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('9', 'Yin Jiehong', '123456', 1358889999);
INSERT INTO `auditor` VALUES ('10', 'He Rui', '123456', 1358889999);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `companyid` int(10) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typeid` int(10) NOT NULL,
  `monitorname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cellphone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`companyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '市级政府', 'street1', 1, 'Tony', '11111112');
INSERT INTO `company` VALUES (2, '区网安局', '南邻区', 2, '赵三', '55566633322');
INSERT INTO `company` VALUES (5, '纵横家', 'street11', 3, 'TIMI', '1123653269');
INSERT INTO `company` VALUES (7, 'ceo@iqianyue.com', 'street12', 4, 'Watter', '1123653288');
INSERT INTO `company` VALUES (8, '市政府', 'street13', 1, 'Mary', '5623653269');
INSERT INTO `company` VALUES (9, '区监察局', 'street11', 2, '小王', '1123653289');
INSERT INTO `company` VALUES (11, '毒霸安全公司', 'street12', 3, '小宝', '1123653269');

-- ----------------------------
-- Table structure for companytype
-- ----------------------------
DROP TABLE IF EXISTS `companytype`;
CREATE TABLE `companytype`  (
  `typeid` int(2) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of companytype
-- ----------------------------
INSERT INTO `companytype` VALUES (1, '市级单位');
INSERT INTO `companytype` VALUES (2, '市级各辖区单位');
INSERT INTO `companytype` VALUES (3, '受监管企业单位');
INSERT INTO `companytype` VALUES (4, '安全服务单位');

-- ----------------------------
-- Table structure for exchangerecords
-- ----------------------------
DROP TABLE IF EXISTS `exchangerecords`;
CREATE TABLE `exchangerecords`  (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NULL DEFAULT NULL,
  `GiftID` int(11) NULL DEFAULT NULL,
  `ExchangeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RecordID`) USING BTREE,
  INDEX `GiftID`(`GiftID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of exchangerecords
-- ----------------------------
INSERT INTO `exchangerecords` VALUES (1, 3, 1, '2025-03-26 21:01:27');
INSERT INTO `exchangerecords` VALUES (2, 3, 1, '2025-03-26 21:01:44');
INSERT INTO `exchangerecords` VALUES (3, 3, 7, '2025-03-26 21:02:40');
INSERT INTO `exchangerecords` VALUES (4, 3, 1, '2025-03-26 21:15:07');
INSERT INTO `exchangerecords` VALUES (5, 3, 2, '2025-03-27 16:09:56');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taskid` int(10) NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 1, '已对违规操作进行处罚');
INSERT INTO `feedback` VALUES (2, 1, '已恢复网络，并定位攻击者位置');
INSERT INTO `feedback` VALUES (4, 1, '已清除恶意软件，并处罚了制作该软件的人。');
INSERT INTO `feedback` VALUES (5, 4, '已及时抢修。');
INSERT INTO `feedback` VALUES (6, 4, '已及时抢修。');
INSERT INTO `feedback` VALUES (7, 7, '33333');
INSERT INTO `feedback` VALUES (8, 7, '33333');

-- ----------------------------
-- Table structure for gifts
-- ----------------------------
DROP TABLE IF EXISTS `gifts`;
CREATE TABLE `gifts`  (
  `GiftID` int(11) NOT NULL AUTO_INCREMENT,
  `GiftName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `RequiredPoints` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  PRIMARY KEY (`GiftID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gifts
-- ----------------------------
INSERT INTO `gifts` VALUES (1, '蓝牙耳机', 500, 97);
INSERT INTO `gifts` VALUES (2, '无线鼠标', 300, 149);
INSERT INTO `gifts` VALUES (3, '运动手表', 800, 50);
INSERT INTO `gifts` VALUES (4, '电动牙刷', 200, 200);
INSERT INTO `gifts` VALUES (5, '便携式充电宝', 350, 180);
INSERT INTO `gifts` VALUES (6, '耳机架', 100, 250);
INSERT INTO `gifts` VALUES (7, '手工皮包', 1000, 29);
INSERT INTO `gifts` VALUES (8, '智能音响', 1200, 40);
INSERT INTO `gifts` VALUES (9, '数码相框', 600, 120);
INSERT INTO `gifts` VALUES (11, '电热水壶', 250, 90);
INSERT INTO `gifts` VALUES (12, '高级围巾', 500, 110);
INSERT INTO `gifts` VALUES (13, 'DIY拼图套件', 150, 160);
INSERT INTO `gifts` VALUES (14, '小型吸尘器', 700, 60);
INSERT INTO `gifts` VALUES (15, '精美茶具', 950, 20);
INSERT INTO `gifts` VALUES (16, '虚拟现实眼镜', 1300, 25);
INSERT INTO `gifts` VALUES (17, '烘焙工具套件', 450, 130);
INSERT INTO `gifts` VALUES (18, '旅行背包', 550, 140);
INSERT INTO `gifts` VALUES (19, '无线耳机', 750, 75);
INSERT INTO `gifts` VALUES (20, '精致手表', 2000, 10);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logid` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `logindate` date NOT NULL,
  PRIMARY KEY (`logid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 1, '2019-12-10');
INSERT INTO `log` VALUES (2, 1, '2019-12-10');
INSERT INTO `log` VALUES (3, 1, '2019-12-10');
INSERT INTO `log` VALUES (4, 1, '2019-12-10');
INSERT INTO `log` VALUES (5, 1, '2019-12-10');
INSERT INTO `log` VALUES (6, 1, '2019-12-10');
INSERT INTO `log` VALUES (7, 1, '2019-12-10');
INSERT INTO `log` VALUES (8, 1, '2019-12-10');
INSERT INTO `log` VALUES (9, 1, '2019-12-10');
INSERT INTO `log` VALUES (10, 1, '2019-12-10');
INSERT INTO `log` VALUES (11, 1, '2019-12-10');
INSERT INTO `log` VALUES (12, 1, '2019-12-10');
INSERT INTO `log` VALUES (13, 3, '2019-12-10');
INSERT INTO `log` VALUES (14, 3, '2019-12-10');
INSERT INTO `log` VALUES (15, 3, '2019-12-10');
INSERT INTO `log` VALUES (16, 1, '2019-12-10');
INSERT INTO `log` VALUES (17, 1, '2019-12-10');
INSERT INTO `log` VALUES (18, 1, '2019-12-10');
INSERT INTO `log` VALUES (19, 2, '2019-12-10');
INSERT INTO `log` VALUES (20, 2, '2019-12-10');
INSERT INTO `log` VALUES (21, 2, '2019-12-10');
INSERT INTO `log` VALUES (22, 2, '2019-12-10');
INSERT INTO `log` VALUES (23, 2, '2019-12-10');
INSERT INTO `log` VALUES (24, 2, '2019-12-10');
INSERT INTO `log` VALUES (25, 1, '2019-12-11');
INSERT INTO `log` VALUES (26, 1, '2019-12-11');
INSERT INTO `log` VALUES (27, 2, '2019-12-11');
INSERT INTO `log` VALUES (28, 1, '2019-12-11');
INSERT INTO `log` VALUES (29, 1, '2019-12-11');
INSERT INTO `log` VALUES (30, 1, '2019-12-11');
INSERT INTO `log` VALUES (31, 1, '2019-12-11');
INSERT INTO `log` VALUES (32, 1, '2019-12-11');
INSERT INTO `log` VALUES (33, 1, '2019-12-11');
INSERT INTO `log` VALUES (34, 2, '2019-12-11');
INSERT INTO `log` VALUES (35, 2, '2019-12-11');
INSERT INTO `log` VALUES (36, 1, '2019-12-11');
INSERT INTO `log` VALUES (37, 4, '2019-12-11');
INSERT INTO `log` VALUES (38, 2, '2019-12-11');
INSERT INTO `log` VALUES (39, 1, '2019-12-11');
INSERT INTO `log` VALUES (40, 1, '2019-12-11');
INSERT INTO `log` VALUES (41, 1, '2019-12-11');
INSERT INTO `log` VALUES (42, 1, '2019-12-11');
INSERT INTO `log` VALUES (43, 1, '2019-12-11');
INSERT INTO `log` VALUES (44, 1, '2019-12-11');
INSERT INTO `log` VALUES (45, 1, '2019-12-11');
INSERT INTO `log` VALUES (46, 1, '2019-12-11');
INSERT INTO `log` VALUES (47, 1, '2019-12-11');
INSERT INTO `log` VALUES (48, 1, '2019-12-11');
INSERT INTO `log` VALUES (49, 1, '2019-12-11');
INSERT INTO `log` VALUES (50, 1, '2019-12-11');
INSERT INTO `log` VALUES (51, 2, '2019-12-11');
INSERT INTO `log` VALUES (52, 1, '2019-12-11');
INSERT INTO `log` VALUES (53, 1, '2019-12-11');
INSERT INTO `log` VALUES (54, 1, '2019-12-11');
INSERT INTO `log` VALUES (55, 1, '2019-12-11');
INSERT INTO `log` VALUES (56, 2, '2019-12-11');
INSERT INTO `log` VALUES (57, 2, '2019-12-11');
INSERT INTO `log` VALUES (58, 2, '2019-12-11');
INSERT INTO `log` VALUES (59, 2, '2019-12-11');
INSERT INTO `log` VALUES (60, 2, '2019-12-11');
INSERT INTO `log` VALUES (61, 2, '2019-12-11');
INSERT INTO `log` VALUES (62, 2, '2019-12-11');
INSERT INTO `log` VALUES (63, 2, '2019-12-11');
INSERT INTO `log` VALUES (64, 4, '2019-12-11');
INSERT INTO `log` VALUES (65, 1, '2019-12-11');
INSERT INTO `log` VALUES (66, 1, '2019-12-11');
INSERT INTO `log` VALUES (67, 1, '2019-12-11');
INSERT INTO `log` VALUES (68, 2, '2019-12-11');
INSERT INTO `log` VALUES (69, 4, '2019-12-11');
INSERT INTO `log` VALUES (70, 1, '2019-12-11');
INSERT INTO `log` VALUES (71, 1, '2019-12-11');
INSERT INTO `log` VALUES (72, 1, '2019-12-15');
INSERT INTO `log` VALUES (73, 2, '2019-12-18');
INSERT INTO `log` VALUES (74, 2, '2019-12-24');
INSERT INTO `log` VALUES (75, 1, '2019-12-24');
INSERT INTO `log` VALUES (76, 2, '2019-12-24');
INSERT INTO `log` VALUES (77, 1, '2019-12-24');
INSERT INTO `log` VALUES (78, 1, '2020-01-06');
INSERT INTO `log` VALUES (79, 1, '2020-01-31');
INSERT INTO `log` VALUES (80, 1, '2020-01-31');
INSERT INTO `log` VALUES (81, 4, '2025-01-01');
INSERT INTO `log` VALUES (82, 3, '2025-03-19');
INSERT INTO `log` VALUES (83, 3, '2025-03-19');
INSERT INTO `log` VALUES (84, 3, '2025-03-19');
INSERT INTO `log` VALUES (85, 3, '2025-03-19');
INSERT INTO `log` VALUES (86, 3, '2025-03-20');
INSERT INTO `log` VALUES (87, 1, '2025-03-20');
INSERT INTO `log` VALUES (88, 1, '2025-03-20');
INSERT INTO `log` VALUES (89, 3, '2025-03-20');
INSERT INTO `log` VALUES (90, 3, '2025-03-20');
INSERT INTO `log` VALUES (91, 3, '2025-03-20');
INSERT INTO `log` VALUES (92, 3, '2025-03-20');
INSERT INTO `log` VALUES (93, 3, '2025-03-21');
INSERT INTO `log` VALUES (94, 3, '2025-03-21');
INSERT INTO `log` VALUES (95, 3, '2025-03-21');
INSERT INTO `log` VALUES (96, 3, '2025-03-21');
INSERT INTO `log` VALUES (97, 3, '2025-03-21');
INSERT INTO `log` VALUES (98, 3, '2025-03-21');
INSERT INTO `log` VALUES (99, 3, '2025-03-21');
INSERT INTO `log` VALUES (100, 3, '2025-03-21');
INSERT INTO `log` VALUES (101, 3, '2025-03-21');
INSERT INTO `log` VALUES (102, 3, '2025-03-21');
INSERT INTO `log` VALUES (103, 3, '2025-03-21');
INSERT INTO `log` VALUES (104, 3, '2025-03-21');
INSERT INTO `log` VALUES (105, 3, '2025-03-21');
INSERT INTO `log` VALUES (106, 3, '2025-03-21');
INSERT INTO `log` VALUES (107, 3, '2025-03-21');
INSERT INTO `log` VALUES (108, 3, '2025-03-21');
INSERT INTO `log` VALUES (109, 3, '2025-03-21');
INSERT INTO `log` VALUES (110, 3, '2025-03-21');
INSERT INTO `log` VALUES (111, 3, '2025-03-21');
INSERT INTO `log` VALUES (112, 3, '2025-03-21');
INSERT INTO `log` VALUES (113, 3, '2025-03-21');
INSERT INTO `log` VALUES (114, 3, '2025-03-21');
INSERT INTO `log` VALUES (115, 3, '2025-03-21');
INSERT INTO `log` VALUES (116, 3, '2025-03-21');
INSERT INTO `log` VALUES (117, 3, '2025-03-21');
INSERT INTO `log` VALUES (118, 3, '2025-03-21');
INSERT INTO `log` VALUES (119, 3, '2025-03-21');
INSERT INTO `log` VALUES (120, 3, '2025-03-21');
INSERT INTO `log` VALUES (121, 3, '2025-03-21');
INSERT INTO `log` VALUES (122, 3, '2025-03-21');
INSERT INTO `log` VALUES (123, 3, '2025-03-21');
INSERT INTO `log` VALUES (124, 3, '2025-03-21');
INSERT INTO `log` VALUES (125, 3, '2025-03-21');
INSERT INTO `log` VALUES (126, 3, '2025-03-21');
INSERT INTO `log` VALUES (127, 3, '2025-03-21');
INSERT INTO `log` VALUES (128, 3, '2025-03-24');
INSERT INTO `log` VALUES (129, 3, '2025-03-24');
INSERT INTO `log` VALUES (130, 3, '2025-03-24');
INSERT INTO `log` VALUES (131, 3, '2025-03-24');
INSERT INTO `log` VALUES (132, 3, '2025-03-24');
INSERT INTO `log` VALUES (133, 3, '2025-03-24');
INSERT INTO `log` VALUES (134, 3, '2025-03-24');
INSERT INTO `log` VALUES (135, 3, '2025-03-24');
INSERT INTO `log` VALUES (136, 3, '2025-03-24');
INSERT INTO `log` VALUES (137, 3, '2025-03-26');
INSERT INTO `log` VALUES (138, 3, '2025-03-26');
INSERT INTO `log` VALUES (139, 3, '2025-03-26');
INSERT INTO `log` VALUES (140, 3, '2025-03-26');
INSERT INTO `log` VALUES (141, 3, '2025-03-26');
INSERT INTO `log` VALUES (142, 3, '2025-03-26');
INSERT INTO `log` VALUES (143, 3, '2025-03-26');
INSERT INTO `log` VALUES (144, 3, '2025-03-26');
INSERT INTO `log` VALUES (145, 3, '2025-03-26');
INSERT INTO `log` VALUES (146, 3, '2025-03-26');
INSERT INTO `log` VALUES (147, 3, '2025-03-26');
INSERT INTO `log` VALUES (148, 3, '2025-03-26');
INSERT INTO `log` VALUES (149, 3, '2025-03-26');
INSERT INTO `log` VALUES (150, 3, '2025-03-26');
INSERT INTO `log` VALUES (151, 3, '2025-03-26');
INSERT INTO `log` VALUES (152, 3, '2025-03-26');
INSERT INTO `log` VALUES (153, 3, '2025-03-26');
INSERT INTO `log` VALUES (154, 3, '2025-03-26');
INSERT INTO `log` VALUES (155, 3, '2025-03-26');
INSERT INTO `log` VALUES (156, 3, '2025-03-26');
INSERT INTO `log` VALUES (157, 3, '2025-03-26');
INSERT INTO `log` VALUES (158, 3, '2025-03-26');
INSERT INTO `log` VALUES (159, 3, '2025-03-26');
INSERT INTO `log` VALUES (160, 3, '2025-03-26');
INSERT INTO `log` VALUES (161, 3, '2025-03-26');
INSERT INTO `log` VALUES (162, 3, '2025-03-26');
INSERT INTO `log` VALUES (163, 3, '2025-03-26');
INSERT INTO `log` VALUES (164, 3, '2025-03-27');
INSERT INTO `log` VALUES (165, 3, '2025-03-27');
INSERT INTO `log` VALUES (166, 3, '2025-03-27');
INSERT INTO `log` VALUES (167, 3, '2025-03-27');
INSERT INTO `log` VALUES (168, 3, '2025-03-27');
INSERT INTO `log` VALUES (169, 3, '2025-03-27');
INSERT INTO `log` VALUES (170, 3, '2025-03-27');
INSERT INTO `log` VALUES (171, 3, '2025-03-27');
INSERT INTO `log` VALUES (172, 3, '2025-03-27');
INSERT INTO `log` VALUES (173, 3, '2025-03-27');
INSERT INTO `log` VALUES (174, 3, '2025-03-27');
INSERT INTO `log` VALUES (175, 3, '2025-03-27');
INSERT INTO `log` VALUES (176, 3, '2025-03-27');
INSERT INTO `log` VALUES (177, 3, '2025-03-27');
INSERT INTO `log` VALUES (178, 3, '2025-03-27');
INSERT INTO `log` VALUES (179, 3, '2025-03-27');
INSERT INTO `log` VALUES (180, 3, '2025-03-27');
INSERT INTO `log` VALUES (181, 3, '2025-03-27');
INSERT INTO `log` VALUES (182, 3, '2025-03-27');
INSERT INTO `log` VALUES (183, 3, '2025-03-28');
INSERT INTO `log` VALUES (184, 3, '2025-03-28');
INSERT INTO `log` VALUES (185, 3, '2025-03-28');
INSERT INTO `log` VALUES (186, 3, '2025-03-28');
INSERT INTO `log` VALUES (187, 3, '2025-03-28');
INSERT INTO `log` VALUES (188, 3, '2025-03-30');
INSERT INTO `log` VALUES (189, 3, '2025-03-30');
INSERT INTO `log` VALUES (190, 3, '2025-03-30');
INSERT INTO `log` VALUES (191, 3, '2025-03-30');
INSERT INTO `log` VALUES (192, 3, '2025-03-30');
INSERT INTO `log` VALUES (193, 3, '2025-03-30');
INSERT INTO `log` VALUES (194, 3, '2025-03-30');
INSERT INTO `log` VALUES (195, 3, '2025-03-30');
INSERT INTO `log` VALUES (196, 3, '2025-03-30');
INSERT INTO `log` VALUES (197, 3, '2025-03-30');
INSERT INTO `log` VALUES (198, 3, '2025-03-30');
INSERT INTO `log` VALUES (199, 6, '2025-03-30');
INSERT INTO `log` VALUES (200, 3, '2025-03-30');

-- ----------------------------
-- Table structure for taskone
-- ----------------------------
DROP TABLE IF EXISTS `taskone`;
CREATE TABLE `taskone`  (
  `taskid` int(10) NOT NULL AUTO_INCREMENT COMMENT '漏洞id',
  `tasktype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assigndate` date NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '审核状态',
  `auditcomment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyid` int(10) NULL DEFAULT NULL,
  `level` int(2) NULL DEFAULT NULL,
  `dispose_status` enum('pending','processing','resolved','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'pending' COMMENT '处置状态',
  `auditorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处置人员',
  `dispose_time` datetime NULL DEFAULT NULL COMMENT '处置时间',
  `basis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处置依据',
  PRIMARY KEY (`taskid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taskone
-- ----------------------------
INSERT INTO `taskone` VALUES (1, '违规处理', '2019-12-09', 1, 'sdfsdf', '违规使用网络工具处理', 2, 2, 'resolved', 'He Rui', '2025-03-30 20:26:03', '以完美解决');
INSERT INTO `taskone` VALUES (2, '网络攻击', '2019-12-10', 1, 'aaaaaaaaaaaaaaaa', '政府内网遭受不明攻击，需尽快处理', 2, 2, 'processing', '12', '2025-03-30 19:20:29', '可是');
INSERT INTO `taskone` VALUES (3, '恶意软件', '2019-12-11', 1, '测试', '网络上有危险性极大的恶意软件需要清理', 9, 1, 'pending', '10', '2025-03-28 18:20:46', '1');
INSERT INTO `taskone` VALUES (4, '信息泄露', '2019-12-11', 1, '测试', '某公司发生了大量数据泄漏事件', 11, 3, 'pending', '10', '2025-03-28 18:20:48', '1');
INSERT INTO `taskone` VALUES (5, '安全威胁/漏洞', '2019-12-11', 1, '通过', '发现网络安全威胁信息', 2, 1, 'pending', '10', '2025-03-28 18:20:50', '1');
INSERT INTO `taskone` VALUES (6, '违处信息', '2019-12-11', 0, '测试', '违规使用VPN', 2, 1, 'pending', '10', '2025-03-28 18:20:52', '1');
INSERT INTO `taskone` VALUES (7, '恶意软件', '2019-12-24', 1, '测试', '清楚\r\n\r\n', 2, 1, 'pending', '10', '2025-03-28 18:20:54', '1');
INSERT INTO `taskone` VALUES (26, '违处信息', '2025-03-21', 0, '测试', 'aaaa', 0, 2, 'resolved', '12', '2025-03-30 19:33:00', '我是你得');
INSERT INTO `taskone` VALUES (27, '违处信息', '2025-03-21', 0, '测试', 'aa', 0, 1, 'pending', '10', '2025-03-28 18:20:59', '1');
INSERT INTO `taskone` VALUES (28, '违处信息', '2025-03-27', 2, '', 'sdsfda', 0, 1, 'resolved', 'He Rui', '2025-03-31 10:07:35', '误报');
INSERT INTO `taskone` VALUES (29, '违处信息', '2025-03-27', 2, 'asdads', '12345566778', 0, 1, 'pending', '10', '2025-03-28 18:21:05', '1');
INSERT INTO `taskone` VALUES (30, '违处信息', '2025-03-30', 0, NULL, 'aaa', 0, 4, 'pending', NULL, NULL, NULL);
INSERT INTO `taskone` VALUES (31, '违处信息', '2025-03-30', 0, NULL, 'asdasd', 0, 2, 'pending', NULL, NULL, NULL);
INSERT INTO `taskone` VALUES (32, '违处信息', '2025-03-30', 0, NULL, 'asdasd', 0, 2, 'pending', NULL, NULL, NULL);
INSERT INTO `taskone` VALUES (33, '恶意软件', '2025-03-30', 0, NULL, 'asdasd', 0, 2, 'pending', NULL, NULL, NULL);
INSERT INTO `taskone` VALUES (34, '网络攻击', '2025-03-30', 0, NULL, 'asdad', 0, 4, 'pending', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyid` int(10) NOT NULL,
  `status` int(11) NOT NULL,
  `operation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(2) NOT NULL,
  `userpass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int(255) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', '1112225563', NULL, NULL, 1, 1, NULL, 1, '1234567', 1);
INSERT INTO `user` VALUES (2, '赵三', '11122233311', NULL, NULL, 2, 1, NULL, 2, '123456', 2);
INSERT INTO `user` VALUES (3, '小刘', '13961023668', NULL, NULL, 5, 1, NULL, 3, '1234567', 900);
INSERT INTO `user` VALUES (4, '皇城PK', '13961023668', NULL, NULL, 7, 1, NULL, 4, '111', 1);
INSERT INTO `user` VALUES (5, '张璐', '140-1961-06', 'lzha@icloud.com', 'wx', 3, 1, '1', 1, '123456', 22);
INSERT INTO `user` VALUES (6, 'Yokoyama Yuto', '186-8456-49', 'yoky@yahoo.com', 'wx', 3, 1, '1', 2, '123456', 60);
INSERT INTO `user` VALUES (7, '赵云熙', '760-1608-32', 'zhaoyunxi6@icloud.com', 'wx', 1, 1, '1', 3, '123456', 23);
INSERT INTO `user` VALUES (8, 'Ishikawa Hikari', '769-535-023', 'ishikawah2014@gmail.com', 'wx', 3, 1, '1', 1, '123456', 15);
INSERT INTO `user` VALUES (9, '邹云熙', '158-3413-27', 'zou4@gmail.com', 'wx', 2, 1, '1', 2, '123456', 3);
INSERT INTO `user` VALUES (10, '江子异', '139-1836-72', 'jziy@gmail.com', 'wx', 3, 1, '1', 2, '123456', 2);
INSERT INTO `user` VALUES (11, 'Kono Ayano', '155-6694-30', 'kayano@gmail.com', 'wx', 3, 1, '1', 3, '123456', 17);
INSERT INTO `user` VALUES (12, 'Koyama Mitsuki', '179-0346-49', 'mkoyama@gmail.com', 'wx', 4, 1, '1', 2, '123456', 25);
INSERT INTO `user` VALUES (13, '雷岚', '141-4266-69', 'lei7@gmail.com', 'wx', 3, 1, '1', 2, '123456', 7);
INSERT INTO `user` VALUES (14, '袁岚', '131-3597-21', 'layuan60@gmail.com', 'wx', 1, 1, '1', 2, '123456', 4);
INSERT INTO `user` VALUES (15, '丁睿', '755-5664-94', 'dinrui6@gmail.com', 'wx', 4, 1, '1', 1, '123456', 25);
INSERT INTO `user` VALUES (16, 'Ishida Shino', '172-6563-17', 'ishidashino@yahoo.com', 'wx', 1, 1, '1', 1, '123456', 7);
INSERT INTO `user` VALUES (17, '郑璐', '156-3673-70', 'zlu221@outlook.com', 'wx', 4, 1, '1', 3, '123456', 30);
INSERT INTO `user` VALUES (18, '钱秀英', '159-9286-21', 'xiuyqian@icloud.com', 'wx', 4, 1, '1', 1, '123456', 15);
INSERT INTO `user` VALUES (19, 'Matsuda Nanami', '149-5939-72', 'nanamim@outlook.com', 'wx', 4, 1, '1', 3, '123456', 12);
INSERT INTO `user` VALUES (20, '董璐', '166-0355-43', 'lu827@mail.com', 'wx', 1, 1, '1', 1, '123456', 5);
INSERT INTO `user` VALUES (21, '曾詩涵', '760-803-709', 'zeng1950@outlook.com', 'wx', 4, 1, '1', 2, '123456', 8);
INSERT INTO `user` VALUES (22, '钟岚', '147-8430-64', 'zhonlan@gmail.com', 'wx', 1, 1, '1', 2, '123456', 6);
INSERT INTO `user` VALUES (23, 'Matsumoto Yuna', '10-2738-607', 'yuna8@gmail.com', 'wx', 2, 1, '1', 1, '123456', 12);
INSERT INTO `user` VALUES (24, '冯安琪', '20-046-1272', 'fenga@outlook.com', 'wx', 2, 1, '1', 2, '123456', 22);

-- ----------------------------
-- Table structure for vulnerability_disposal
-- ----------------------------
DROP TABLE IF EXISTS `vulnerability_disposal`;
CREATE TABLE `vulnerability_disposal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '处置记录唯一标识',
  `taskid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '漏洞任务ID（关联漏洞表）',
  `dispose_time` datetime NOT NULL COMMENT '处置时间',
  `disposestatus` enum('pending','processing','resolved','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending' COMMENT '处置状态',
  `auditorID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处置人员ID（关联用户表）',
  `basis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '处置依据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_taskid`(`taskid`) USING BTREE,
  INDEX `idx_dispose_time`(`dispose_time`) USING BTREE,
  INDEX `idx_auditorID`(`auditorID`) USING BTREE,
  INDEX `idx_status`(`disposestatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '漏洞处置记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vulnerability_disposal
-- ----------------------------
INSERT INTO `vulnerability_disposal` VALUES (1, '1', '2025-03-28 17:43:08', 'pending', '1', '测试');
INSERT INTO `vulnerability_disposal` VALUES (2, '1', '2025-03-29 11:51:17', 'closed', '1', 'a');
INSERT INTO `vulnerability_disposal` VALUES (3, '1', '2025-03-30 15:09:30', 'processing', '1', '1');

SET FOREIGN_KEY_CHECKS = 1;

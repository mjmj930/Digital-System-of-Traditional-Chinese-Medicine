/*
 Navicat Premium Data Transfer

 Source Server         : Database
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : herbalsystem

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 02/05/2024 16:42:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for formula_categories
-- ----------------------------
DROP TABLE IF EXISTS `formula_categories`;
CREATE TABLE `formula_categories`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分类的唯一标识符',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '分类描述',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储中医方剂的分类信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of formula_categories
-- ----------------------------

-- ----------------------------
-- Table structure for formula_ingredients
-- ----------------------------
DROP TABLE IF EXISTS `formula_ingredients`;
CREATE TABLE `formula_ingredients`  (
  `ingredient_id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `formula_id` int NOT NULL COMMENT '方剂的唯一标识符，外键',
  `herb_id` int NOT NULL COMMENT '药材的唯一标识符，外键',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标识药材角色（君、臣、佐、使）',
  `dosage` float NOT NULL COMMENT '药材的使用量',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用量的单位（克、两等）',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用药说明',
  PRIMARY KEY (`ingredient_id`) USING BTREE,
  INDEX `formula_id`(`formula_id` ASC) USING BTREE,
  INDEX `herb_id`(`herb_id` ASC) USING BTREE,
  CONSTRAINT `formula_ingredients_ibfk_1` FOREIGN KEY (`formula_id`) REFERENCES `formulas` (`formula_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `formula_ingredients_ibfk_2` FOREIGN KEY (`herb_id`) REFERENCES `herb_basic_info` (`herb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储方剂的组成成分和分量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of formula_ingredients
-- ----------------------------

-- ----------------------------
-- Table structure for formulas
-- ----------------------------
DROP TABLE IF EXISTS `formulas`;
CREATE TABLE `formulas`  (
  `formula_id` int NOT NULL AUTO_INCREMENT COMMENT '自动增长的唯一标识符',
  `category_id` int NOT NULL COMMENT '方剂所属分类的标识符，外键',
  `chinese_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方剂的中文名称',
  `pinyin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方剂的汉语拼音名称',
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方剂的英文名称',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方剂的文献来源或出处',
  `usage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '方剂的用法说明',
  `functions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '方剂的主要功效',
  `indications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '方剂的主治功能',
  `pathogenesis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '方剂涉及的病机描述',
  `precautions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '使用该方剂时的注意事项',
  `formula_song` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '方剂的记忆歌谣，帮助记忆方剂组成',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录的创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录的最后更新时间',
  PRIMARY KEY (`formula_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `formulas_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `formula_categories` (`category_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储中医方剂的基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of formulas
-- ----------------------------

-- ----------------------------
-- Table structure for herb_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `herb_basic_info`;
CREATE TABLE `herb_basic_info`  (
  `herb_id` int NOT NULL AUTO_INCREMENT COMMENT '药材ID,主键,自动递增',
  `herb_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药材名称',
  `herb_pinyin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `herb_alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材别名',
  `herb_english_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材英文名',
  `herb_latin_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材拉丁学名',
  `category_id` int NULL DEFAULT NULL COMMENT '药材类别ID,外键,关联herb_category表',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`herb_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `herb_basic_info_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `herb_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '中药材基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_basic_info
-- ----------------------------
INSERT INTO `herb_basic_info` VALUES (1, '麻黄', 'Mahuang', '色道麻、结力根[蒙古]、龙沙、卑相、卑盐、狗骨', 'Chinese Ephedrs Herb', 'Ephedrae Herba', 20, '2024-04-28 23:05:40', '2024-04-28 23:05:40');

-- ----------------------------
-- Table structure for herb_category
-- ----------------------------
DROP TABLE IF EXISTS `herb_category`;
CREATE TABLE `herb_category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `parent_id` int NULL DEFAULT NULL COMMENT '父类别ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `category_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别编码',
  `category_level` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '类别层级',
  `category_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `category_code`(`category_code` ASC) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `herb_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `herb_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储中药材分类的基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_category
-- ----------------------------
INSERT INTO `herb_category` VALUES (1, NULL, '解表药', 'JB', 1, '以发散表邪、解除表证为主要作用的一类中药。又称发表药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (2, NULL, '清热药', 'QR', 1, '以清解里热为主要作用的药物。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (3, NULL, '泻下药', 'XX', 1, '以清解里热为主要作用的药物。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (4, NULL, '祛风湿药', 'QFS', 1, '以祛风除湿，解除痹痛，用治风湿痹证为主要功用的药物。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (5, NULL, '芳香化湿药', 'FXHS', 1, '以化湿运脾为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (6, NULL, '温里药', 'WL', 1, '以温暖脏腑经络、消除里寒为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (7, NULL, '理气药', 'LQ', 1, '以疏畅气机、消除气滞、平降气逆为主要作用的一类中药。又称行气药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (8, NULL, '消导药', 'XD', 1, '以消化饮食、导行积滞为主要作用的一类中药。又称消食药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (9, NULL, '止血药', 'ZX', 1, '以制止人体各种出血为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (10, NULL, '活血药', 'HX', 1, '以通利血脉、促进血行、消散瘀血为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (11, NULL, '化痰止咳平喘药', 'HTZKPC', 1, '以祛痰、消痰、制止和减轻咳嗽气喘为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (12, NULL, '安神药', 'AS', 1, '以安定神志为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (13, NULL, '平肝熄风药', 'PGXF', 1, '以平肝潜阳、熄风止痉为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (14, NULL, '开窍药', 'KQ', 1, '以通关开窍、启闭醒神为主要作用的一类中药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (15, NULL, '补益药', 'BY', 1, '以补益人体物质亏损、增强人体活动机能、提高抗病能力、消除虚弱证候为主要作用的一类中药。又称补虚药、补养药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (16, NULL, '固涩药', 'GS', 1, '以收敛固涩为主要作用的一类中药。又称收涩药、收敛药。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (17, NULL, '外用药', 'WY', 1, '以外用为主，通过与体表局部直接接触而起治疗作用的药物。', '2024-04-28 22:17:27', '2024-04-28 22:17:27');
INSERT INTO `herb_category` VALUES (18, NULL, '利水渗湿药', 'LSCS', 1, '以通利水道、渗泄水湿为主要作用的一类中药。', '2024-04-28 22:32:21', '2024-04-28 22:32:21');
INSERT INTO `herb_category` VALUES (19, NULL, '驱虫药', 'QCY', 1, '以驱除或杀灭肠道寄生虫为主要作用的一类中药。', '2024-04-28 22:32:21', '2024-04-28 22:32:21');
INSERT INTO `herb_category` VALUES (20, 1, '发散风寒药', 'JB-FSFH', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (21, 1, '发散风热药', 'JB-FSFR', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (22, 2, '清热泻火药', 'QR-QRXH', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (23, 2, '清肝明目药', 'QR-QGMM', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (24, 2, '清热凉血药', 'QR-QRLX', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (25, 2, '清热解毒药', 'QR-QRJD', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (26, 2, '清热燥湿药', 'QR-QRZS', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (27, 2, '清虚热药', 'QR-QXR', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (28, 3, '攻下药', 'XX-GX', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (29, 3, '润下药', 'XX-RX', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (30, 3, '峻下逐水药', 'XX-JXZS', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (31, 4, '祛风湿散寒药', 'QFS-QFSSH', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (32, 4, '祛风湿清热药', 'QFS-QFSQR', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (33, 4, '祛风湿强筋骨药', 'QFS-QFSQJG', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (34, 18, '利水渗湿药', 'LSCS-LSCS', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (35, 18, '利水通淋药', 'LSCS-LSTL', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (36, 18, '清热利湿药', 'LSCS-QRLS', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (37, 6, '温中散寒药', 'WL-WZSH', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (38, 6, '温肾回阳药', 'WL-WSHY', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (39, 6, '暖肝散寒药: ', 'WL-NGSH', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (40, 6, '温肺化饮药', 'WL-WFHY', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (41, 7, '理脾和胃药', 'LQ-WPHW', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (42, 7, '疏肝解郁药', 'LQ-SGJY', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (43, 7, '疏肝和胃药', 'LQ-SGHW', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (44, 7, '通宣理肺药', 'LQ-TXLF', 2, NULL, '2024-04-28 22:43:43', '2024-04-28 22:43:43');
INSERT INTO `herb_category` VALUES (75, 8, '消导药', 'XD-XD', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (76, 9, '收敛止血药', 'ZX-SLZX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (77, 9, '凉血止血药', 'ZX-LXZX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (78, 9, '化瘀止血药', 'ZX-HYZX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (79, 9, '温经止血药', 'ZX-WJZX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (80, 10, '活血化瘀药', 'HX-HXZY', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (81, 10, '破血消癥药', 'HX-PXX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (82, 11, '温化寒痰药', 'HTZKPC-WHHT', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (83, 11, '清化热痰药', 'HTZKPC-QHRT', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (84, 11, '止咳平喘药', 'HTZKPC-ZKPC', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (85, 12, '重镇安神药', 'AS-ZZAS', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (86, 12, '养心安神药', 'AS-YXAS', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (87, 13, '平肝潜阳药', 'PGXF-PGQY', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (88, 13, '熄风止痉药', 'PGXF-XFZJ', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (89, 14, '温宣开窍药', 'KQ-WXKQ', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (90, 14, '凉宣开窍药', 'KQ-LXKQ', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (91, 15, '补气药', 'BY-BQ', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (92, 15, '助阳药', 'BY-ZY', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (93, 15, '养血药', 'BY-YX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (94, 15, '滋阴药', 'BY-CY', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (95, 16, '固表止汗药', 'GS-GBZH', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (96, 16, '涩肠止泻药', 'GS-SCZX', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (97, 16, '固精止遗药', 'GS-GJZY', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (98, 16, '固精止遗药', 'GS-GBZD', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (99, 16, '固精止遗药', 'GS-LFZK', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (100, 17, '消肿解毒药', 'WY-XZJD', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (101, 17, '消肿解毒药', 'WY-PNQF', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (102, 17, '消肿解毒药', 'WY-ZSSCZY', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (103, 17, '消肿解毒药', 'WY-FP', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');
INSERT INTO `herb_category` VALUES (104, 19, '驱虫药', 'QC-QC', 2, NULL, '2024-04-29 16:37:20', '2024-04-29 16:37:20');

-- ----------------------------
-- Table structure for herb_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `herb_detail_info`;
CREATE TABLE `herb_detail_info`  (
  `herb_id` int NOT NULL COMMENT '药材ID,主键,关联herb_basic_info表',
  `herb_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材来源',
  `herb_producing_area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主要产地',
  `herb_part` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药用部位',
  `herb_property` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材性味',
  `herb_temperature` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材性温',
  `herb_meridian_tropism` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '药材归经',
  `herb_efficacy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '功效主治',
  `herb_usage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用法用量',
  `herb_precaution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '使用注意',
  `herb_storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '贮藏方法',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`herb_id`) USING BTREE,
  CONSTRAINT `herb_detail_info_ibfk_1` FOREIGN KEY (`herb_id`) REFERENCES `herb_basic_info` (`herb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '中药材详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_detail_info
-- ----------------------------

-- ----------------------------
-- Table structure for herb_image
-- ----------------------------
DROP TABLE IF EXISTS `herb_image`;
CREATE TABLE `herb_image`  (
  `image_id` int NOT NULL AUTO_INCREMENT COMMENT '图片ID,主键,自动递增',
  `herb_id` int NOT NULL COMMENT '药材ID,外键,关联herb_basic_info表',
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片路径',
  `image_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片描述',
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `herb_id`(`herb_id` ASC) USING BTREE,
  CONSTRAINT `herb_image_ibfk_1` FOREIGN KEY (`herb_id`) REFERENCES `herb_basic_info` (`herb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '中药材图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_image
-- ----------------------------

-- ----------------------------
-- Table structure for herb_price
-- ----------------------------
DROP TABLE IF EXISTS `herb_price`;
CREATE TABLE `herb_price`  (
  `price_id` int NOT NULL AUTO_INCREMENT COMMENT '价格ID,主键,自动递增',
  `herb_id` int NOT NULL COMMENT '关联的药材ID,引用药材表的主键',
  `price_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '价格类型,如retail(零售价)、wholesale(批发价)等',
  `price` decimal(10, 2) NOT NULL COMMENT '价格,保留两位小数',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '价格单位,如元/克、元/公斤等',
  `effective_date` date NULL DEFAULT NULL COMMENT '价格生效日期',
  `expiration_date` date NULL DEFAULT NULL COMMENT '价格失效日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '价格创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '价格更新时间',
  PRIMARY KEY (`price_id`) USING BTREE,
  INDEX `herb_id`(`herb_id` ASC) USING BTREE,
  CONSTRAINT `herb_price_ibfk_1` FOREIGN KEY (`herb_id`) REFERENCES `herb_basic_info` (`herb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '药材价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_price
-- ----------------------------

-- ----------------------------
-- Table structure for herb_source
-- ----------------------------
DROP TABLE IF EXISTS `herb_source`;
CREATE TABLE `herb_source`  (
  `source_id` int NOT NULL AUTO_INCREMENT COMMENT '来源ID,主键,自动递增',
  `source_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '来源名称',
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源类型',
  `source_region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源区域',
  `source_province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属省份',
  `source_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属城市',
  `source_country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属国家',
  `source_elevation` int NULL DEFAULT NULL COMMENT '来源地海拔高度',
  `source_climate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '气候条件',
  `source_soil` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来土壤类型',
  `source_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '来源地描述',
  `source_herbs` json NULL COMMENT '产地著名药材',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`source_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '药材来源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_source
-- ----------------------------

-- ----------------------------
-- Table structure for herb_supplier
-- ----------------------------
DROP TABLE IF EXISTS `herb_supplier`;
CREATE TABLE `herb_supplier`  (
  `supplier_id` int NOT NULL AUTO_INCREMENT COMMENT '供应商ID,主键,自动递增',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商名称',
  `supplier_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商联系人',
  `supplier_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商联系电话',
  `supplier_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商邮箱',
  `supplier_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '供应商创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '供应商更新时间',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '药材供应商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for herb_supplier_price
-- ----------------------------
DROP TABLE IF EXISTS `herb_supplier_price`;
CREATE TABLE `herb_supplier_price`  (
  `supplier_price_id` int NOT NULL AUTO_INCREMENT COMMENT '供应商价格ID,主键,自动递增',
  `herb_id` int NOT NULL COMMENT '关联的药材ID,引用药材表的主键',
  `supplier_id` int NOT NULL COMMENT '关联的供应商ID,引用供应商表的主键',
  `price` decimal(10, 2) NOT NULL COMMENT '供应商提供的价格,保留两位小数',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '价格单位,如元/克、元/公斤等',
  `effective_date` date NULL DEFAULT NULL COMMENT '价格生效日期',
  `expiration_date` date NULL DEFAULT NULL COMMENT '价格失效日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '价格创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '价格更新时间',
  PRIMARY KEY (`supplier_price_id`) USING BTREE,
  INDEX `herb_id`(`herb_id` ASC) USING BTREE,
  INDEX `supplier_id`(`supplier_id` ASC) USING BTREE,
  CONSTRAINT `herb_supplier_price_ibfk_1` FOREIGN KEY (`herb_id`) REFERENCES `herb_basic_info` (`herb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `herb_supplier_price_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `herb_supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '药材供应商价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of herb_supplier_price
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for rolepermissions
-- ----------------------------
DROP TABLE IF EXISTS `rolepermissions`;
CREATE TABLE `rolepermissions`  (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `permission_id`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `rolepermissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rolepermissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolepermissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for userroles
-- ----------------------------
DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles`  (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userroles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

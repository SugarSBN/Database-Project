/*
 Navicat MySQL Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : main1

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 29/05/2023 21:55:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ans1_1
-- ----------------------------
DROP TABLE IF EXISTS `ans1_1`;
CREATE TABLE `ans1_1`  (
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ans1_1
-- ----------------------------

-- ----------------------------
-- Table structure for ans1_2
-- ----------------------------
DROP TABLE IF EXISTS `ans1_2`;
CREATE TABLE `ans1_2`  (
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fcid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `credit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ans1_2
-- ----------------------------

-- ----------------------------
-- Table structure for ans1_5
-- ----------------------------
DROP TABLE IF EXISTS `ans1_5`;
CREATE TABLE `ans1_5`  (
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fcid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `credit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ans1_5
-- ----------------------------
INSERT INTO `ans1_5` VALUES ('300001', '数据结构', NULL, '2');
INSERT INTO `ans1_5` VALUES ('300002', '数据库', '300001', '2.5');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `belong` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tocomp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `becomp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (30, '1-1', '题目1', 'base1-1', '创建学生信息表（学生编号、姓名、性别、年龄、出生日期、院系名称、班级）：test1_student：sid char 12 not null、name varchar 10 not null、sex char 2、age int birthday date、dname varchar 30、class varchar 10。\n 建表语句常见错误如下：\n关键词拼写错误，少关键词、少逗号、少括号。', 'test1_student');
INSERT INTO `problem` VALUES (31, '创建课程信息表(仅考虑一门课程最多一个先行课的情况):\n课程编号、课程名称、先行课编号、学分\ntest1_course：cid char 6 not null、name varchar 40 not null、fcid char 6、\ncredit numeric\n4，1（其中4代表总长度，1代表小数点后面长度）。', '题目二', 'base1-2', '1-2', 'test1_course');
INSERT INTO `problem` VALUES (32, '给表test1_course插入如下2行数据。\n注意空值的插入使用null\n课程号 课程名 先行课程号 学分\n300001 数据结构 2300002 数据库 300001 2.5', '题目三', 'base1-5', '1-5', 'test1_course');

-- ----------------------------
-- Table structure for probset
-- ----------------------------
DROP TABLE IF EXISTS `probset`;
CREATE TABLE `probset`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `btime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etime` timestamp NOT NULL DEFAULT '2024-10-10 12:00:00',
  `rid` int NOT NULL,
  `score` int NOT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of probset
-- ----------------------------
INSERT INTO `probset` VALUES (1009, '2023-05-29 21:49:30', '2024-10-10 12:00:00', 1, 5, 1);
INSERT INTO `probset` VALUES (1010, '2023-05-29 21:49:30', '2024-10-10 12:00:00', 1, 5, 2);
INSERT INTO `probset` VALUES (1011, '2023-05-29 21:49:30', '2024-10-10 12:00:00', 1, 10, 3);
INSERT INTO `probset` VALUES (1012, '2023-05-29 21:49:30', '2024-10-10 12:00:00', 2, 5, 1);
INSERT INTO `probset` VALUES (1013, '2023-05-29 21:49:30', '2024-10-10 12:00:00', 2, 5, 2);

-- ----------------------------
-- Table structure for pub.teacher
-- ----------------------------
DROP TABLE IF EXISTS `pub.teacher`;
CREATE TABLE `pub.teacher`  (
  `id` int NOT NULL,
  `tid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NOT NULL,
  `dname` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub.teacher
-- ----------------------------
INSERT INTO `pub.teacher` VALUES (1, 850, 'Xue Zitao', 'M', 540, 54);
INSERT INTO `pub.teacher` VALUES (2, 718, 'Xie Xiaoming', 'M', 646, 88);
INSERT INTO `pub.teacher` VALUES (3, 453, 'Liao Wing Sze', 'F', 478, 82);
INSERT INTO `pub.teacher` VALUES (4, 73, 'Sit Lik Sun', 'M', 793, 97);
INSERT INTO `pub.teacher` VALUES (5, 635, 'Lu Xiuying', 'F', 700, 4);
INSERT INTO `pub.teacher` VALUES (6, 206, 'Lam Ming', 'M', 55, 88);
INSERT INTO `pub.teacher` VALUES (7, 232, 'Noguchi Itsuki', 'M', 875, 39);
INSERT INTO `pub.teacher` VALUES (8, 904, 'Chin Fat', 'M', 450, 59);
INSERT INTO `pub.teacher` VALUES (9, 602, 'Jin Jiehong', 'M', 729, 24);
INSERT INTO `pub.teacher` VALUES (10, 944, 'Kam Sum Wing', 'F', 248, 69);
INSERT INTO `pub.teacher` VALUES (11, 526, 'Liao Ka Ling', 'F', 852, 87);
INSERT INTO `pub.teacher` VALUES (12, 27, 'Nakajima Momoka', 'F', 100, 14);
INSERT INTO `pub.teacher` VALUES (13, 792, 'Harold Hernandez', 'M', 674, 79);
INSERT INTO `pub.teacher` VALUES (14, 755, 'Imai Kaito', 'M', 115, 86);
INSERT INTO `pub.teacher` VALUES (15, 613, 'Bobby Sanders', 'M', 859, 71);
INSERT INTO `pub.teacher` VALUES (16, 75, 'Adam King', 'M', 451, 18);
INSERT INTO `pub.teacher` VALUES (17, 55, 'Su Rui', 'M', 809, 36);
INSERT INTO `pub.teacher` VALUES (18, 906, 'Douglas West', 'M', 470, 63);
INSERT INTO `pub.teacher` VALUES (19, 94, 'He Lan', 'F', 571, 1);
INSERT INTO `pub.teacher` VALUES (20, 76, 'Lau Sau Man', 'F', 478, 86);
INSERT INTO `pub.teacher` VALUES (21, 418, 'Han Lan', 'F', 308, 17);
INSERT INTO `pub.teacher` VALUES (22, 666, 'Yeow Tak Wah', 'M', 318, 74);
INSERT INTO `pub.teacher` VALUES (23, 243, 'Han Yuning', 'M', 955, 67);
INSERT INTO `pub.teacher` VALUES (24, 219, 'Liang Lan', 'F', 438, 28);
INSERT INTO `pub.teacher` VALUES (25, 809, 'Mo Lu', 'F', 386, 46);
INSERT INTO `pub.teacher` VALUES (26, 860, 'Ono Riku', 'M', 498, 86);
INSERT INTO `pub.teacher` VALUES (27, 183, 'Tian Lan', 'F', 605, 83);
INSERT INTO `pub.teacher` VALUES (28, 808, 'Yuan Zitao', 'M', 505, 69);
INSERT INTO `pub.teacher` VALUES (29, 386, 'Li Ziyi', 'M', 629, 7);
INSERT INTO `pub.teacher` VALUES (30, 616, 'Donna Stephens', 'F', 177, 13);
INSERT INTO `pub.teacher` VALUES (31, 423, 'To Tak Wah', 'M', 652, 66);
INSERT INTO `pub.teacher` VALUES (32, 107, 'Yue Fat', 'M', 103, 25);
INSERT INTO `pub.teacher` VALUES (33, 70, 'Ernest Lewis', 'M', 925, 34);
INSERT INTO `pub.teacher` VALUES (34, 215, 'Tam Wing Kuen', 'M', 938, 38);
INSERT INTO `pub.teacher` VALUES (35, 273, 'Marie Bryant', 'F', 31, 89);
INSERT INTO `pub.teacher` VALUES (36, 430, 'Chin Wing Fat', 'M', 288, 21);
INSERT INTO `pub.teacher` VALUES (37, 630, 'Carlos Guzman', 'M', 155, 69);
INSERT INTO `pub.teacher` VALUES (38, 533, 'Betty Garza', 'F', 701, 20);
INSERT INTO `pub.teacher` VALUES (39, 243, 'Wei Lan', 'F', 418, 99);
INSERT INTO `pub.teacher` VALUES (40, 152, 'Guo Yuning', 'M', 976, 91);
INSERT INTO `pub.teacher` VALUES (41, 525, 'Kimura Momoe', 'F', 513, 20);
INSERT INTO `pub.teacher` VALUES (42, 53, 'Choi Ho Yin', 'M', 87, 70);
INSERT INTO `pub.teacher` VALUES (43, 534, 'Ando Mio', 'F', 946, 13);
INSERT INTO `pub.teacher` VALUES (44, 466, 'Saito Mio', 'F', 55, 85);
INSERT INTO `pub.teacher` VALUES (45, 715, 'Sano Hikaru', 'F', 723, 20);
INSERT INTO `pub.teacher` VALUES (46, 635, 'Sean Mason', 'M', 107, 50);
INSERT INTO `pub.teacher` VALUES (47, 266, 'Sasaki Seiko', 'F', 386, 6);
INSERT INTO `pub.teacher` VALUES (48, 26, 'Liang Ziyi', 'M', 29, 21);
INSERT INTO `pub.teacher` VALUES (49, 358, 'Choi Yu Ling', 'F', 766, 19);
INSERT INTO `pub.teacher` VALUES (50, 773, 'Yamashita Minato', 'M', 407, 86);
INSERT INTO `pub.teacher` VALUES (51, 829, 'Yung Ka Keung', 'M', 933, 0);
INSERT INTO `pub.teacher` VALUES (52, 108, 'Matsumoto Ryota', 'M', 354, 91);
INSERT INTO `pub.teacher` VALUES (53, 126, 'Tina Gordon', 'F', 280, 13);
INSERT INTO `pub.teacher` VALUES (54, 771, 'Sean Williams', 'M', 891, 88);
INSERT INTO `pub.teacher` VALUES (55, 40, 'Larry Hill', 'M', 711, 69);
INSERT INTO `pub.teacher` VALUES (56, 579, 'Tong Ka Ling', 'F', 928, 55);
INSERT INTO `pub.teacher` VALUES (57, 95, 'Takada Mitsuki', 'F', 379, 68);
INSERT INTO `pub.teacher` VALUES (58, 6, 'Nakamura Rena', 'F', 493, 1);
INSERT INTO `pub.teacher` VALUES (59, 209, 'Lois White', 'F', 685, 71);
INSERT INTO `pub.teacher` VALUES (60, 197, 'Long Anqi', 'F', 437, 42);
INSERT INTO `pub.teacher` VALUES (61, 195, 'Yan Yunxi', 'M', 263, 21);
INSERT INTO `pub.teacher` VALUES (62, 992, 'Kim Moreno', 'F', 374, 4);
INSERT INTO `pub.teacher` VALUES (63, 635, 'Taniguchi Hina', 'F', 549, 7);
INSERT INTO `pub.teacher` VALUES (64, 421, 'Emily Gordon', 'F', 227, 97);
INSERT INTO `pub.teacher` VALUES (65, 842, 'Hirano Kenta', 'M', 22, 91);
INSERT INTO `pub.teacher` VALUES (66, 448, 'Yamaguchi Yamato', 'M', 723, 83);
INSERT INTO `pub.teacher` VALUES (67, 595, 'Kwan Ching Wan', 'M', 4, 63);
INSERT INTO `pub.teacher` VALUES (68, 266, 'He Xiuying', 'F', 48, 93);
INSERT INTO `pub.teacher` VALUES (69, 232, 'Ueno Hikaru', 'F', 470, 56);
INSERT INTO `pub.teacher` VALUES (70, 534, 'Mao Xiuying', 'F', 607, 61);
INSERT INTO `pub.teacher` VALUES (71, 344, 'Xie Jiehong', 'M', 588, 76);
INSERT INTO `pub.teacher` VALUES (72, 298, 'Man Tsz Hin', 'M', 730, 38);
INSERT INTO `pub.teacher` VALUES (73, 194, 'Zeng Shihan', 'F', 274, 64);
INSERT INTO `pub.teacher` VALUES (74, 782, 'Rhonda Silva', 'F', 373, 52);
INSERT INTO `pub.teacher` VALUES (75, 56, 'Clifford Taylor', 'M', 272, 97);
INSERT INTO `pub.teacher` VALUES (76, 131, 'Fujii Rena', 'F', 403, 80);
INSERT INTO `pub.teacher` VALUES (77, 842, 'Hsuan Chung Yin', 'M', 675, 31);
INSERT INTO `pub.teacher` VALUES (78, 551, 'Amanda Weaver', 'F', 742, 34);
INSERT INTO `pub.teacher` VALUES (79, 887, 'Chung Sze Kwan', 'F', 656, 52);
INSERT INTO `pub.teacher` VALUES (80, 776, 'Xiong Lan', 'F', 979, 63);
INSERT INTO `pub.teacher` VALUES (81, 788, 'Ono Minato', 'M', 127, 6);
INSERT INTO `pub.teacher` VALUES (82, 17, 'Fujiwara Hikari', 'F', 491, 36);
INSERT INTO `pub.teacher` VALUES (83, 350, 'Okada Ikki', 'M', 292, 20);
INSERT INTO `pub.teacher` VALUES (84, 434, 'Nakamori Eita', 'F', 24, 32);
INSERT INTO `pub.teacher` VALUES (85, 256, 'Dai Shihan', 'F', 525, 14);
INSERT INTO `pub.teacher` VALUES (86, 671, 'Kao Kwok Kuen', 'M', 707, 89);
INSERT INTO `pub.teacher` VALUES (87, 825, 'Debra Hawkins', 'F', 994, 77);
INSERT INTO `pub.teacher` VALUES (88, 928, 'Kwong Chun Yu', 'M', 938, 70);
INSERT INTO `pub.teacher` VALUES (89, 266, 'Siu Wing Suen', 'F', 629, 21);
INSERT INTO `pub.teacher` VALUES (90, 876, 'Su Ziyi', 'M', 845, 63);
INSERT INTO `pub.teacher` VALUES (91, 229, 'Nakagawa Hikaru', 'F', 795, 18);
INSERT INTO `pub.teacher` VALUES (92, 682, 'Juanita Simpson', 'F', 914, 15);
INSERT INTO `pub.teacher` VALUES (93, 741, 'Anthony Davis', 'M', 113, 88);
INSERT INTO `pub.teacher` VALUES (94, 403, 'Kwok Kwok Wing', 'M', 670, 55);
INSERT INTO `pub.teacher` VALUES (95, 277, 'Mori Mio', 'F', 885, 37);
INSERT INTO `pub.teacher` VALUES (96, 462, 'Daniel Howard', 'M', 452, 88);
INSERT INTO `pub.teacher` VALUES (97, 842, 'Fu Hiu Tung', 'F', 307, 26);
INSERT INTO `pub.teacher` VALUES (98, 120, 'Wendy Coleman', 'F', 452, 21);
INSERT INTO `pub.teacher` VALUES (99, 373, 'Rose Phillips', 'F', 250, 37);
INSERT INTO `pub.teacher` VALUES (100, 106, 'Feng Yuning', 'M', 502, 55);
INSERT INTO `pub.teacher` VALUES (101, 716, 'Wei Xiaoming', 'M', 42, 83);
INSERT INTO `pub.teacher` VALUES (102, 40, 'Jason Marshall', 'M', 716, 66);
INSERT INTO `pub.teacher` VALUES (103, 274, 'Thomas Martinez', 'M', 905, 10);
INSERT INTO `pub.teacher` VALUES (104, 23, 'Luo Yunxi', 'M', 236, 71);
INSERT INTO `pub.teacher` VALUES (105, 805, 'Ueno Ayato', 'M', 329, 0);
INSERT INTO `pub.teacher` VALUES (106, 467, 'So Ching Wan', 'M', 770, 35);
INSERT INTO `pub.teacher` VALUES (107, 733, 'Siu Chi Yuen', 'M', 520, 43);
INSERT INTO `pub.teacher` VALUES (108, 336, 'Zheng Rui', 'M', 206, 67);
INSERT INTO `pub.teacher` VALUES (109, 893, 'Kwan Wing Fat', 'M', 850, 28);
INSERT INTO `pub.teacher` VALUES (110, 912, 'Kimura Ikki', 'M', 695, 21);
INSERT INTO `pub.teacher` VALUES (111, 283, 'Samuel Price', 'M', 222, 4);
INSERT INTO `pub.teacher` VALUES (112, 928, 'Evelyn Munoz', 'F', 435, 25);
INSERT INTO `pub.teacher` VALUES (113, 43, 'Han Sau Man', 'F', 355, 39);
INSERT INTO `pub.teacher` VALUES (114, 334, 'Xu Shihan', 'F', 793, 69);
INSERT INTO `pub.teacher` VALUES (115, 249, 'Sugawara Kaito', 'M', 333, 42);
INSERT INTO `pub.teacher` VALUES (116, 971, 'Mak Cho Yee', 'F', 155, 68);
INSERT INTO `pub.teacher` VALUES (117, 595, 'Patricia Martin', 'F', 758, 20);
INSERT INTO `pub.teacher` VALUES (118, 581, 'Kwong Chun Yu', 'M', 716, 75);
INSERT INTO `pub.teacher` VALUES (119, 539, 'Mok Sai Wing', 'M', 340, 66);
INSERT INTO `pub.teacher` VALUES (120, 188, 'Cynthia Porter', 'F', 692, 60);
INSERT INTO `pub.teacher` VALUES (121, 664, 'Elaine Owens', 'F', 75, 80);
INSERT INTO `pub.teacher` VALUES (122, 648, 'Taniguchi Hazuki', 'F', 55, 8);
INSERT INTO `pub.teacher` VALUES (123, 932, 'Takahashi Hikaru', 'F', 349, 21);
INSERT INTO `pub.teacher` VALUES (124, 882, 'Xue Yuning', 'M', 701, 42);
INSERT INTO `pub.teacher` VALUES (125, 6, 'Yin Wing Suen', 'F', 69, 64);
INSERT INTO `pub.teacher` VALUES (126, 966, 'Sato Yamato', 'M', 976, 21);
INSERT INTO `pub.teacher` VALUES (127, 618, 'Nakano Ayato', 'M', 221, 23);
INSERT INTO `pub.teacher` VALUES (128, 969, 'Ono Yuto', 'M', 952, 28);
INSERT INTO `pub.teacher` VALUES (129, 127, 'Kevin Holmes', 'M', 285, 47);
INSERT INTO `pub.teacher` VALUES (130, 419, 'Cui Lu', 'F', 603, 92);
INSERT INTO `pub.teacher` VALUES (131, 930, 'Mo Xiaoming', 'M', 524, 38);
INSERT INTO `pub.teacher` VALUES (132, 102, 'Chung Sai Wing', 'M', 446, 86);
INSERT INTO `pub.teacher` VALUES (133, 441, 'Choi Chieh Lun', 'M', 234, 10);
INSERT INTO `pub.teacher` VALUES (134, 33, 'Han Ling Ling', 'F', 167, 86);
INSERT INTO `pub.teacher` VALUES (135, 429, 'Amber Jones', 'F', 862, 98);
INSERT INTO `pub.teacher` VALUES (136, 186, 'Chung Wai Lam', 'F', 711, 23);
INSERT INTO `pub.teacher` VALUES (137, 951, 'Cheng Kar Yan', 'F', 768, 13);
INSERT INTO `pub.teacher` VALUES (138, 978, 'Sano Tsubasa', 'M', 46, 14);
INSERT INTO `pub.teacher` VALUES (139, 77, 'Yao Zitao', 'M', 712, 98);
INSERT INTO `pub.teacher` VALUES (140, 876, 'Lisa James', 'F', 521, 67);
INSERT INTO `pub.teacher` VALUES (141, 374, 'Mo Ka Fai', 'M', 861, 94);
INSERT INTO `pub.teacher` VALUES (142, 125, 'Mo Zhiyuan', 'M', 564, 72);
INSERT INTO `pub.teacher` VALUES (143, 348, 'Yung Ka Fai', 'M', 635, 43);
INSERT INTO `pub.teacher` VALUES (144, 624, 'Cheng Xiuying', 'F', 566, 60);
INSERT INTO `pub.teacher` VALUES (145, 973, 'Takeda Rena', 'F', 83, 89);
INSERT INTO `pub.teacher` VALUES (146, 636, 'Kinoshita Minato', 'M', 47, 21);
INSERT INTO `pub.teacher` VALUES (147, 327, 'Chang Hok Yau', 'M', 498, 42);
INSERT INTO `pub.teacher` VALUES (148, 232, 'Lam Wai Lam', 'F', 931, 43);
INSERT INTO `pub.teacher` VALUES (149, 611, 'Rebecca Cooper', 'F', 45, 92);
INSERT INTO `pub.teacher` VALUES (150, 687, 'Ma Xiuying', 'F', 265, 76);
INSERT INTO `pub.teacher` VALUES (151, 495, 'Ti Ming', 'M', 666, 96);
INSERT INTO `pub.teacher` VALUES (152, 437, 'Lisa Flores', 'F', 385, 68);
INSERT INTO `pub.teacher` VALUES (153, 604, 'Yuen Chiu Wai', 'M', 261, 95);
INSERT INTO `pub.teacher` VALUES (154, 576, 'Ma Kar Yan', 'F', 933, 82);
INSERT INTO `pub.teacher` VALUES (155, 691, 'Wang Zhennan', 'M', 890, 33);
INSERT INTO `pub.teacher` VALUES (156, 985, 'Tanaka Shino', 'F', 787, 19);
INSERT INTO `pub.teacher` VALUES (157, 393, 'Hui Yun Fat', 'M', 974, 64);
INSERT INTO `pub.teacher` VALUES (158, 834, 'Kudo Sakura', 'F', 654, 4);
INSERT INTO `pub.teacher` VALUES (159, 357, 'Dai Rui', 'M', 136, 5);
INSERT INTO `pub.teacher` VALUES (160, 153, 'Danielle Snyder', 'F', 185, 66);
INSERT INTO `pub.teacher` VALUES (161, 455, 'Anna Dunn', 'F', 646, 59);
INSERT INTO `pub.teacher` VALUES (162, 798, 'Mario Harrison', 'M', 988, 72);
INSERT INTO `pub.teacher` VALUES (163, 487, 'Cui Jialun', 'M', 834, 61);
INSERT INTO `pub.teacher` VALUES (164, 406, 'Fujita Misaki', 'F', 972, 57);
INSERT INTO `pub.teacher` VALUES (165, 405, 'Xiang Ziyi', 'M', 401, 14);
INSERT INTO `pub.teacher` VALUES (166, 394, 'Angela Ramirez', 'F', 207, 8);
INSERT INTO `pub.teacher` VALUES (167, 886, 'Sakurai Momoka', 'F', 586, 75);
INSERT INTO `pub.teacher` VALUES (168, 416, 'Jack Stewart', 'M', 697, 80);
INSERT INTO `pub.teacher` VALUES (169, 810, 'Li Jiehong', 'M', 72, 26);
INSERT INTO `pub.teacher` VALUES (170, 648, 'Mori Momoe', 'F', 851, 71);
INSERT INTO `pub.teacher` VALUES (171, 30, 'Cheng Rui', 'M', 889, 26);
INSERT INTO `pub.teacher` VALUES (172, 787, 'Carl Diaz', 'M', 226, 85);
INSERT INTO `pub.teacher` VALUES (173, 358, 'Loui Sze Kwan', 'F', 871, 68);
INSERT INTO `pub.teacher` VALUES (174, 342, 'Sun Zitao', 'M', 331, 18);
INSERT INTO `pub.teacher` VALUES (175, 171, 'Arimura Nanami', 'M', 752, 32);
INSERT INTO `pub.teacher` VALUES (176, 10, 'Sato Daisuke', 'M', 619, 77);
INSERT INTO `pub.teacher` VALUES (177, 94, 'He Ziyi', 'M', 516, 62);
INSERT INTO `pub.teacher` VALUES (178, 778, 'Richard Wilson', 'M', 962, 33);
INSERT INTO `pub.teacher` VALUES (179, 200, 'Kato Hazuki', 'F', 448, 94);
INSERT INTO `pub.teacher` VALUES (180, 119, 'Yuen Fat', 'M', 200, 68);
INSERT INTO `pub.teacher` VALUES (181, 447, 'Fung Wing Fat', 'M', 353, 38);
INSERT INTO `pub.teacher` VALUES (182, 240, 'He Xiaoming', 'M', 208, 12);
INSERT INTO `pub.teacher` VALUES (183, 25, 'Christopher Gomez', 'M', 707, 67);
INSERT INTO `pub.teacher` VALUES (184, 471, 'Hsuan Hui Mei', 'F', 72, 66);
INSERT INTO `pub.teacher` VALUES (185, 229, 'Lin Zhennan', 'M', 470, 25);
INSERT INTO `pub.teacher` VALUES (186, 341, 'Zhou Ziyi', 'M', 783, 27);
INSERT INTO `pub.teacher` VALUES (187, 321, 'Miura Kazuma', 'M', 338, 51);
INSERT INTO `pub.teacher` VALUES (188, 402, 'Deng Xiaoming', 'M', 127, 98);
INSERT INTO `pub.teacher` VALUES (189, 116, 'Cynthia Torres', 'F', 649, 89);
INSERT INTO `pub.teacher` VALUES (190, 114, 'Tsui Sau Man', 'F', 442, 87);
INSERT INTO `pub.teacher` VALUES (191, 477, 'Sun Yuning', 'M', 927, 64);
INSERT INTO `pub.teacher` VALUES (192, 707, 'Yu Xiaoming', 'M', 15, 9);
INSERT INTO `pub.teacher` VALUES (193, 789, 'Gu Anqi', 'F', 828, 17);
INSERT INTO `pub.teacher` VALUES (194, 303, 'Taniguchi Tsubasa', 'M', 579, 74);
INSERT INTO `pub.teacher` VALUES (195, 263, 'Siu Yu Ling', 'F', 742, 9);
INSERT INTO `pub.teacher` VALUES (196, 325, 'Sean Snyder', 'M', 677, 8);
INSERT INTO `pub.teacher` VALUES (197, 920, 'Abe Ayato', 'M', 255, 50);
INSERT INTO `pub.teacher` VALUES (198, 435, 'Zhao Yuning', 'M', 776, 52);
INSERT INTO `pub.teacher` VALUES (199, 381, 'Siu Yun Fat', 'M', 499, 56);
INSERT INTO `pub.teacher` VALUES (200, 198, 'Gong Zitao', 'M', 692, 32);
INSERT INTO `pub.teacher` VALUES (201, 87, 'Melissa Murray', 'F', 528, 74);
INSERT INTO `pub.teacher` VALUES (202, 822, 'Tsang Chiu Wai', 'M', 301, 62);
INSERT INTO `pub.teacher` VALUES (203, 832, 'Ma Rui', 'M', 452, 29);
INSERT INTO `pub.teacher` VALUES (204, 54, 'Philip Wallace', 'M', 459, 7);
INSERT INTO `pub.teacher` VALUES (205, 144, 'William Stewart', 'M', 671, 15);
INSERT INTO `pub.teacher` VALUES (206, 59, 'Arimura Aoshi', 'M', 501, 99);
INSERT INTO `pub.teacher` VALUES (207, 270, 'Uchida Itsuki', 'M', 7, 79);
INSERT INTO `pub.teacher` VALUES (208, 416, 'Edward Johnson', 'M', 48, 25);
INSERT INTO `pub.teacher` VALUES (209, 339, 'Okamoto Hazuki', 'F', 53, 15);
INSERT INTO `pub.teacher` VALUES (210, 597, 'Nakayama Kaito', 'M', 61, 79);
INSERT INTO `pub.teacher` VALUES (211, 779, 'Takada Ayato', 'M', 963, 8);
INSERT INTO `pub.teacher` VALUES (212, 132, 'Rachel Meyer', 'F', 131, 54);
INSERT INTO `pub.teacher` VALUES (213, 97, 'Yang Jialun', 'M', 614, 9);
INSERT INTO `pub.teacher` VALUES (214, 420, 'Todd Perry', 'M', 57, 9);
INSERT INTO `pub.teacher` VALUES (215, 604, 'Julia Patterson', 'F', 541, 99);
INSERT INTO `pub.teacher` VALUES (216, 22, 'Matsuda Daichi', 'M', 936, 33);
INSERT INTO `pub.teacher` VALUES (217, 684, 'Lo Ming', 'M', 730, 58);
INSERT INTO `pub.teacher` VALUES (218, 847, 'Zou Xiaoming', 'M', 653, 46);
INSERT INTO `pub.teacher` VALUES (219, 355, 'Mao Jialun', 'M', 759, 20);
INSERT INTO `pub.teacher` VALUES (220, 372, 'Yoshida Yuito', 'M', 418, 36);
INSERT INTO `pub.teacher` VALUES (221, 836, 'Pan Rui', 'M', 655, 37);
INSERT INTO `pub.teacher` VALUES (222, 704, 'Deng Lu', 'F', 167, 83);
INSERT INTO `pub.teacher` VALUES (223, 394, 'Joan Tran', 'F', 626, 47);
INSERT INTO `pub.teacher` VALUES (224, 517, 'Ono Hana', 'F', 934, 44);
INSERT INTO `pub.teacher` VALUES (225, 958, 'Fu Ka Keung', 'M', 534, 50);
INSERT INTO `pub.teacher` VALUES (226, 993, 'Gao Zhennan', 'M', 276, 55);
INSERT INTO `pub.teacher` VALUES (227, 711, 'Suzuki Yuito', 'M', 123, 88);
INSERT INTO `pub.teacher` VALUES (228, 612, 'Ono Sara', 'F', 29, 83);
INSERT INTO `pub.teacher` VALUES (229, 923, 'Sato Seiko', 'F', 883, 73);
INSERT INTO `pub.teacher` VALUES (230, 276, 'Song Rui', 'M', 735, 11);
INSERT INTO `pub.teacher` VALUES (231, 89, 'Xu Ziyi', 'M', 855, 39);
INSERT INTO `pub.teacher` VALUES (232, 690, 'Zheng Zitao', 'M', 125, 36);
INSERT INTO `pub.teacher` VALUES (233, 674, 'Fukuda Seiko', 'F', 120, 71);
INSERT INTO `pub.teacher` VALUES (234, 44, 'Shibata Daisuke', 'M', 577, 5);
INSERT INTO `pub.teacher` VALUES (235, 116, 'Kwan Ka Keung', 'M', 596, 6);
INSERT INTO `pub.teacher` VALUES (236, 364, 'Victor Munoz', 'M', 611, 59);
INSERT INTO `pub.teacher` VALUES (237, 949, 'Fan Tin Lok', 'M', 177, 93);
INSERT INTO `pub.teacher` VALUES (238, 336, 'Aoki Hana', 'F', 319, 59);
INSERT INTO `pub.teacher` VALUES (239, 604, 'Rebecca Burns', 'F', 625, 0);
INSERT INTO `pub.teacher` VALUES (240, 21, 'Ann Alexander', 'F', 352, 36);
INSERT INTO `pub.teacher` VALUES (241, 22, 'Yan Rui', 'M', 716, 2);
INSERT INTO `pub.teacher` VALUES (242, 447, 'Ikeda Hikaru', 'F', 823, 15);
INSERT INTO `pub.teacher` VALUES (243, 556, 'Otsuka Yota', 'M', 670, 73);
INSERT INTO `pub.teacher` VALUES (244, 115, 'Lei Shihan', 'F', 301, 19);
INSERT INTO `pub.teacher` VALUES (245, 324, 'Gu Zhennan', 'M', 884, 48);
INSERT INTO `pub.teacher` VALUES (246, 577, 'Hirano Shino', 'F', 129, 59);
INSERT INTO `pub.teacher` VALUES (247, 737, 'Nakayama Ren', 'F', 230, 3);
INSERT INTO `pub.teacher` VALUES (248, 524, 'Nakamori Rena', 'F', 629, 1);
INSERT INTO `pub.teacher` VALUES (249, 756, 'Zhong Anqi', 'F', 586, 9);
INSERT INTO `pub.teacher` VALUES (250, 285, 'Ikeda Ryota', 'M', 466, 96);
INSERT INTO `pub.teacher` VALUES (251, 350, 'Virginia Ross', 'F', 267, 68);
INSERT INTO `pub.teacher` VALUES (252, 532, 'Cai Anqi', 'F', 774, 23);
INSERT INTO `pub.teacher` VALUES (253, 199, 'Shannon Myers', 'F', 721, 36);
INSERT INTO `pub.teacher` VALUES (254, 314, 'Guo Zhennan', 'M', 681, 91);
INSERT INTO `pub.teacher` VALUES (255, 255, 'Shawn Cruz', 'M', 413, 76);
INSERT INTO `pub.teacher` VALUES (256, 652, 'Johnny Sanchez', 'M', 997, 37);
INSERT INTO `pub.teacher` VALUES (257, 85, 'Esther Jordan', 'F', 444, 56);
INSERT INTO `pub.teacher` VALUES (258, 999, 'Xiao Xiuying', 'F', 786, 19);
INSERT INTO `pub.teacher` VALUES (259, 466, 'Ann Washington', 'F', 580, 52);
INSERT INTO `pub.teacher` VALUES (260, 7, 'Choi Wing Kuen', 'M', 411, 31);
INSERT INTO `pub.teacher` VALUES (261, 156, 'Nakamura Takuya', 'M', 28, 18);
INSERT INTO `pub.teacher` VALUES (262, 607, 'Ruth Sanders', 'F', 163, 40);
INSERT INTO `pub.teacher` VALUES (263, 365, 'Nakagawa Airi', 'F', 589, 84);
INSERT INTO `pub.teacher` VALUES (264, 413, 'Dai Jialun', 'M', 762, 87);
INSERT INTO `pub.teacher` VALUES (265, 422, 'Okada Ayato', 'M', 614, 55);
INSERT INTO `pub.teacher` VALUES (266, 756, 'Shimizu Kazuma', 'M', 7, 21);
INSERT INTO `pub.teacher` VALUES (267, 673, 'Pan Lu', 'F', 24, 41);
INSERT INTO `pub.teacher` VALUES (268, 230, 'Fong Ho Yin', 'M', 10, 46);
INSERT INTO `pub.teacher` VALUES (269, 842, 'Yuen Chiu Wai', 'M', 329, 66);
INSERT INTO `pub.teacher` VALUES (270, 548, 'Guo Yunxi', 'M', 283, 12);
INSERT INTO `pub.teacher` VALUES (271, 732, 'Shen Rui', 'M', 360, 8);
INSERT INTO `pub.teacher` VALUES (272, 77, 'Lucille West', 'F', 33, 50);
INSERT INTO `pub.teacher` VALUES (273, 621, 'Arai Ren', 'F', 104, 79);
INSERT INTO `pub.teacher` VALUES (274, 679, 'Kudo Eita', 'F', 131, 86);
INSERT INTO `pub.teacher` VALUES (275, 180, 'Takada Miu', 'F', 41, 68);
INSERT INTO `pub.teacher` VALUES (276, 805, 'Gregory Owens', 'M', 202, 51);
INSERT INTO `pub.teacher` VALUES (277, 199, 'Nakagawa Hazuki', 'F', 751, 46);
INSERT INTO `pub.teacher` VALUES (278, 13, 'Mo Ka Ling', 'F', 35, 64);
INSERT INTO `pub.teacher` VALUES (279, 359, 'Victor Powell', 'M', 847, 55);
INSERT INTO `pub.teacher` VALUES (280, 264, 'Ku Kwok Kuen', 'M', 164, 85);
INSERT INTO `pub.teacher` VALUES (281, 405, 'Albert Holmes', 'M', 35, 27);
INSERT INTO `pub.teacher` VALUES (282, 85, 'Louise Foster', 'F', 553, 52);
INSERT INTO `pub.teacher` VALUES (283, 35, 'Nishimura Ikki', 'M', 360, 42);
INSERT INTO `pub.teacher` VALUES (284, 715, 'Loui Yun Fat', 'M', 986, 41);
INSERT INTO `pub.teacher` VALUES (285, 978, 'Yam Ka Ming', 'M', 888, 17);
INSERT INTO `pub.teacher` VALUES (286, 326, 'Sun Jialun', 'M', 156, 82);
INSERT INTO `pub.teacher` VALUES (287, 919, 'Sakurai Sakura', 'F', 681, 82);
INSERT INTO `pub.teacher` VALUES (288, 827, 'Jonathan Torres', 'M', 38, 57);
INSERT INTO `pub.teacher` VALUES (289, 387, 'Jiang Xiaoming', 'M', 394, 99);
INSERT INTO `pub.teacher` VALUES (290, 198, 'Mok Ka Ling', 'F', 929, 91);
INSERT INTO `pub.teacher` VALUES (291, 873, 'Ronald Gray', 'M', 323, 2);
INSERT INTO `pub.teacher` VALUES (292, 91, 'Ono Nanami', 'M', 217, 56);
INSERT INTO `pub.teacher` VALUES (293, 704, 'Sugawara Hazuki', 'F', 610, 90);
INSERT INTO `pub.teacher` VALUES (294, 776, 'Yin Zhennan', 'M', 246, 44);
INSERT INTO `pub.teacher` VALUES (295, 419, 'Tiffany Phillips', 'F', 444, 64);
INSERT INTO `pub.teacher` VALUES (296, 882, 'Yuan Xiuying', 'F', 943, 91);
INSERT INTO `pub.teacher` VALUES (297, 115, 'Long Xiuying', 'F', 462, 14);
INSERT INTO `pub.teacher` VALUES (298, 105, 'Han Yun Fat', 'M', 757, 86);
INSERT INTO `pub.teacher` VALUES (299, 494, 'Su Xiuying', 'F', 188, 32);
INSERT INTO `pub.teacher` VALUES (300, 585, 'Kobayashi Hana', 'F', 876, 99);
INSERT INTO `pub.teacher` VALUES (301, 594, 'Danny Hernandez', 'M', 830, 83);
INSERT INTO `pub.teacher` VALUES (302, 363, 'Clara Stewart', 'F', 621, 32);
INSERT INTO `pub.teacher` VALUES (303, 591, 'Ichikawa Miu', 'F', 298, 40);
INSERT INTO `pub.teacher` VALUES (304, 456, 'Lee Mason', 'M', 185, 19);
INSERT INTO `pub.teacher` VALUES (305, 35, 'Ho On Na', 'F', 170, 59);
INSERT INTO `pub.teacher` VALUES (306, 427, 'Xie Jialun', 'M', 754, 56);
INSERT INTO `pub.teacher` VALUES (307, 922, 'Wang Xiaoming', 'M', 701, 80);
INSERT INTO `pub.teacher` VALUES (308, 67, 'Miyazaki Shino', 'F', 528, 22);
INSERT INTO `pub.teacher` VALUES (309, 152, 'Yoshida Ikki', 'M', 597, 59);
INSERT INTO `pub.teacher` VALUES (310, 588, 'Kevin Porter', 'M', 212, 73);
INSERT INTO `pub.teacher` VALUES (311, 160, 'Shi Lu', 'F', 705, 44);
INSERT INTO `pub.teacher` VALUES (312, 597, 'Watanabe Takuya', 'M', 671, 40);
INSERT INTO `pub.teacher` VALUES (313, 633, 'Ishii Kasumi', 'M', 517, 22);
INSERT INTO `pub.teacher` VALUES (314, 536, 'Alan Martin', 'M', 690, 82);
INSERT INTO `pub.teacher` VALUES (315, 799, 'Chow Wai San', 'F', 448, 71);
INSERT INTO `pub.teacher` VALUES (316, 215, 'Jason Murray', 'M', 209, 17);
INSERT INTO `pub.teacher` VALUES (317, 911, 'Catherine Gordon', 'F', 346, 70);
INSERT INTO `pub.teacher` VALUES (318, 473, 'Jiang Jiehong', 'M', 329, 70);
INSERT INTO `pub.teacher` VALUES (319, 774, 'Kikuchi Seiko', 'F', 866, 69);
INSERT INTO `pub.teacher` VALUES (320, 343, 'Meng Shihan', 'F', 31, 26);
INSERT INTO `pub.teacher` VALUES (321, 650, 'Irene Rodriguez', 'F', 142, 81);
INSERT INTO `pub.teacher` VALUES (322, 101, 'Dong Rui', 'M', 840, 82);
INSERT INTO `pub.teacher` VALUES (323, 53, 'Heung Sum Wing', 'F', 462, 18);
INSERT INTO `pub.teacher` VALUES (324, 61, 'Ma Lai Yan', 'F', 984, 39);
INSERT INTO `pub.teacher` VALUES (325, 496, 'Pak Kwok Kuen', 'M', 143, 67);
INSERT INTO `pub.teacher` VALUES (326, 108, 'Yeow Wai Han', 'F', 365, 95);
INSERT INTO `pub.teacher` VALUES (327, 114, 'Kaneko Akina', 'F', 646, 16);
INSERT INTO `pub.teacher` VALUES (328, 274, 'Lei Yuning', 'M', 18, 77);
INSERT INTO `pub.teacher` VALUES (329, 87, 'Siu Hok Yau', 'M', 434, 99);
INSERT INTO `pub.teacher` VALUES (330, 942, 'Zheng Jialun', 'M', 166, 96);
INSERT INTO `pub.teacher` VALUES (331, 62, 'Frances Guzman', 'F', 768, 24);
INSERT INTO `pub.teacher` VALUES (332, 588, 'Imai Shino', 'F', 408, 55);
INSERT INTO `pub.teacher` VALUES (333, 147, 'Loui Tak Wah', 'M', 268, 89);
INSERT INTO `pub.teacher` VALUES (334, 360, 'Nakamura Ayato', 'M', 438, 0);
INSERT INTO `pub.teacher` VALUES (335, 699, 'Hirano Hazuki', 'F', 414, 68);
INSERT INTO `pub.teacher` VALUES (336, 500, 'Cao Yunxi', 'M', 830, 72);
INSERT INTO `pub.teacher` VALUES (337, 573, 'Cai Shihan', 'F', 221, 93);
INSERT INTO `pub.teacher` VALUES (338, 39, 'Ono Kasumi', 'M', 124, 10);
INSERT INTO `pub.teacher` VALUES (339, 424, 'Chow Cho Yee', 'F', 226, 55);
INSERT INTO `pub.teacher` VALUES (340, 762, 'Yung Ling Ling', 'F', 676, 3);
INSERT INTO `pub.teacher` VALUES (341, 892, 'Lok Hok Yau', 'M', 305, 77);
INSERT INTO `pub.teacher` VALUES (342, 266, 'Kato Ayano', 'F', 642, 34);
INSERT INTO `pub.teacher` VALUES (343, 541, 'Jin Rui', 'M', 247, 9);
INSERT INTO `pub.teacher` VALUES (344, 539, 'Tsang Kwok Yin', 'M', 705, 26);
INSERT INTO `pub.teacher` VALUES (345, 703, 'Kojima Mio', 'F', 756, 51);
INSERT INTO `pub.teacher` VALUES (346, 869, 'Ishii Rin', 'F', 11, 94);
INSERT INTO `pub.teacher` VALUES (347, 107, 'Todd Warren', 'M', 77, 40);
INSERT INTO `pub.teacher` VALUES (348, 728, 'Fu Chi Yuen', 'M', 196, 51);
INSERT INTO `pub.teacher` VALUES (349, 153, 'Gao Zhiyuan', 'M', 122, 6);
INSERT INTO `pub.teacher` VALUES (350, 56, 'Dai Tsz Ching', 'F', 935, 38);
INSERT INTO `pub.teacher` VALUES (351, 776, 'Tin Sze Yu', 'F', 881, 57);
INSERT INTO `pub.teacher` VALUES (352, 931, 'Hung Wai San', 'F', 630, 79);
INSERT INTO `pub.teacher` VALUES (353, 284, 'Sugawara Ayano', 'F', 663, 35);
INSERT INTO `pub.teacher` VALUES (354, 191, 'Matsui Kazuma', 'M', 595, 96);
INSERT INTO `pub.teacher` VALUES (355, 837, 'Sheila Kelly', 'F', 599, 49);
INSERT INTO `pub.teacher` VALUES (356, 157, 'Norma Patel', 'F', 332, 76);
INSERT INTO `pub.teacher` VALUES (357, 470, 'Hsuan Kwok Kuen', 'M', 187, 10);
INSERT INTO `pub.teacher` VALUES (358, 372, 'Yau Wing Fat', 'M', 565, 12);
INSERT INTO `pub.teacher` VALUES (359, 358, 'Sakai Itsuki', 'M', 349, 82);
INSERT INTO `pub.teacher` VALUES (360, 789, 'Tsui Lik Sun', 'M', 29, 6);
INSERT INTO `pub.teacher` VALUES (361, 725, 'Meng Kwok Kuen', 'M', 263, 8);
INSERT INTO `pub.teacher` VALUES (362, 153, 'Zhu Zitao', 'M', 332, 15);
INSERT INTO `pub.teacher` VALUES (363, 975, 'Debbie Thompson', 'F', 855, 73);
INSERT INTO `pub.teacher` VALUES (364, 689, 'He Lu', 'F', 430, 12);
INSERT INTO `pub.teacher` VALUES (365, 769, 'Christina Castillo', 'F', 319, 66);
INSERT INTO `pub.teacher` VALUES (366, 62, 'Long Rui', 'M', 326, 92);
INSERT INTO `pub.teacher` VALUES (367, 348, 'Yamada Yamato', 'M', 560, 78);
INSERT INTO `pub.teacher` VALUES (368, 444, 'Fukuda Yuto', 'M', 503, 72);
INSERT INTO `pub.teacher` VALUES (369, 587, 'Tao Siu Wai', 'F', 182, 84);
INSERT INTO `pub.teacher` VALUES (370, 80, 'Yuan Yunxi', 'M', 846, 27);
INSERT INTO `pub.teacher` VALUES (371, 375, 'Ashley Reynolds', 'F', 347, 100);
INSERT INTO `pub.teacher` VALUES (372, 688, 'Tiffany Murray', 'F', 152, 48);
INSERT INTO `pub.teacher` VALUES (373, 858, 'Lok Wing Fat', 'M', 679, 6);
INSERT INTO `pub.teacher` VALUES (374, 924, 'Ku Wing Suen', 'F', 39, 56);
INSERT INTO `pub.teacher` VALUES (375, 641, 'Pak Wing Fat', 'M', 842, 31);
INSERT INTO `pub.teacher` VALUES (376, 943, 'Qiu Yunxi', 'M', 326, 27);
INSERT INTO `pub.teacher` VALUES (377, 576, 'Goto Ikki', 'M', 663, 81);
INSERT INTO `pub.teacher` VALUES (378, 721, 'Liu Xiaoming', 'M', 732, 97);
INSERT INTO `pub.teacher` VALUES (379, 116, 'Jia Lu', 'F', 569, 6);
INSERT INTO `pub.teacher` VALUES (380, 983, 'Shi Jialun', 'M', 427, 80);
INSERT INTO `pub.teacher` VALUES (381, 92, 'Watanabe Hikaru', 'F', 177, 13);
INSERT INTO `pub.teacher` VALUES (382, 98, 'Ishii Ayato', 'M', 73, 22);
INSERT INTO `pub.teacher` VALUES (383, 894, 'Ruby Rose', 'F', 402, 34);
INSERT INTO `pub.teacher` VALUES (384, 822, 'Xiao Xiuying', 'F', 717, 68);
INSERT INTO `pub.teacher` VALUES (385, 426, 'Lo Wai Han', 'F', 892, 38);
INSERT INTO `pub.teacher` VALUES (386, 590, 'Hung Wai Yee', 'F', 713, 13);
INSERT INTO `pub.teacher` VALUES (387, 541, 'Benjamin Williams', 'M', 616, 82);
INSERT INTO `pub.teacher` VALUES (388, 204, 'Tammy Miller', 'F', 134, 15);
INSERT INTO `pub.teacher` VALUES (389, 922, 'Curtis Nichols', 'M', 807, 80);
INSERT INTO `pub.teacher` VALUES (390, 509, 'Koo Chun Yu', 'M', 530, 8);
INSERT INTO `pub.teacher` VALUES (391, 872, 'Cheng Cho Yee', 'F', 141, 44);
INSERT INTO `pub.teacher` VALUES (392, 633, 'Han Jiehong', 'M', 294, 86);
INSERT INTO `pub.teacher` VALUES (393, 605, 'Shawn Ellis', 'M', 385, 11);
INSERT INTO `pub.teacher` VALUES (394, 392, 'Zhong Jiehong', 'M', 263, 5);
INSERT INTO `pub.teacher` VALUES (395, 697, 'Ogawa Ayato', 'M', 607, 66);
INSERT INTO `pub.teacher` VALUES (396, 904, 'Koon On Kay', 'F', 863, 90);
INSERT INTO `pub.teacher` VALUES (397, 709, 'Ikeda Ren', 'F', 43, 70);
INSERT INTO `pub.teacher` VALUES (398, 47, 'Miu Ming', 'M', 662, 25);
INSERT INTO `pub.teacher` VALUES (399, 677, 'Sit Kwok Ming', 'M', 895, 41);
INSERT INTO `pub.teacher` VALUES (400, 13, 'Russell Lewis', 'M', 214, 92);
INSERT INTO `pub.teacher` VALUES (401, 595, 'Zhao Jiehong', 'M', 804, 82);
INSERT INTO `pub.teacher` VALUES (402, 625, 'Imai Ren', 'F', 816, 49);
INSERT INTO `pub.teacher` VALUES (403, 513, 'Han Wai Man', 'F', 671, 69);
INSERT INTO `pub.teacher` VALUES (404, 651, 'Aoki Nanami', 'M', 356, 9);
INSERT INTO `pub.teacher` VALUES (405, 542, 'Nakajima Yuna', 'F', 326, 84);
INSERT INTO `pub.teacher` VALUES (406, 586, 'Fong Ka Man', 'M', 151, 34);
INSERT INTO `pub.teacher` VALUES (407, 775, 'Leslie Palmer', 'F', 608, 75);
INSERT INTO `pub.teacher` VALUES (408, 223, 'Takagi Mio', 'F', 911, 32);
INSERT INTO `pub.teacher` VALUES (409, 824, 'Chen Ziyi', 'M', 147, 4);
INSERT INTO `pub.teacher` VALUES (410, 457, 'Chen Xiaoming', 'M', 97, 55);
INSERT INTO `pub.teacher` VALUES (411, 511, 'Cai Yunxi', 'M', 584, 64);
INSERT INTO `pub.teacher` VALUES (412, 96, 'Xiang Anqi', 'F', 876, 26);
INSERT INTO `pub.teacher` VALUES (413, 554, 'Philip Henry', 'M', 60, 87);
INSERT INTO `pub.teacher` VALUES (414, 904, 'Dong Xiuying', 'F', 577, 45);
INSERT INTO `pub.teacher` VALUES (415, 133, 'Yuen Tak Wah', 'M', 272, 39);
INSERT INTO `pub.teacher` VALUES (416, 578, 'Uchida Akina', 'F', 570, 13);
INSERT INTO `pub.teacher` VALUES (417, 894, 'Grace Bailey', 'F', 191, 84);
INSERT INTO `pub.teacher` VALUES (418, 298, 'Wong Fat', 'M', 720, 40);
INSERT INTO `pub.teacher` VALUES (419, 827, 'Xie Shihan', 'F', 758, 42);
INSERT INTO `pub.teacher` VALUES (420, 379, 'David Ferguson', 'M', 161, 16);
INSERT INTO `pub.teacher` VALUES (421, 588, 'Nakagawa Kaito', 'M', 954, 51);
INSERT INTO `pub.teacher` VALUES (422, 118, 'Koon Wing Suen', 'F', 684, 25);
INSERT INTO `pub.teacher` VALUES (423, 703, 'Dong Jialun', 'M', 529, 37);
INSERT INTO `pub.teacher` VALUES (424, 756, 'Tong Wing Suen', 'F', 422, 31);
INSERT INTO `pub.teacher` VALUES (425, 975, 'Tang Yunxi', 'M', 705, 75);
INSERT INTO `pub.teacher` VALUES (426, 677, 'Gu Yuning', 'M', 72, 69);
INSERT INTO `pub.teacher` VALUES (427, 495, 'Sara Warren', 'F', 91, 62);
INSERT INTO `pub.teacher` VALUES (428, 99, 'Jerry Rivera', 'M', 173, 73);
INSERT INTO `pub.teacher` VALUES (429, 447, 'Fu Wai Yee', 'F', 119, 81);
INSERT INTO `pub.teacher` VALUES (430, 680, 'Hsuan Ting Fung', 'M', 258, 95);
INSERT INTO `pub.teacher` VALUES (431, 126, 'Kato Yota', 'M', 685, 62);
INSERT INTO `pub.teacher` VALUES (432, 717, 'Hu Ziyi', 'M', 15, 11);
INSERT INTO `pub.teacher` VALUES (433, 502, 'Kikuchi Kasumi', 'M', 579, 74);
INSERT INTO `pub.teacher` VALUES (434, 649, 'Ono Daichi', 'M', 731, 54);
INSERT INTO `pub.teacher` VALUES (435, 156, 'Frank Powell', 'M', 619, 22);
INSERT INTO `pub.teacher` VALUES (436, 720, 'Tian Lu', 'F', 622, 77);
INSERT INTO `pub.teacher` VALUES (437, 422, 'Hsuan Fu Shing', 'M', 298, 43);
INSERT INTO `pub.teacher` VALUES (438, 222, 'Chan Ka Fai', 'M', 58, 1);
INSERT INTO `pub.teacher` VALUES (439, 901, 'Hayashi Hina', 'F', 615, 51);
INSERT INTO `pub.teacher` VALUES (440, 604, 'Ku Tak Wah', 'M', 687, 70);
INSERT INTO `pub.teacher` VALUES (441, 457, 'Heung Wing Fat', 'M', 71, 14);
INSERT INTO `pub.teacher` VALUES (442, 640, 'Tao Xiuying', 'F', 897, 14);
INSERT INTO `pub.teacher` VALUES (443, 270, 'Lei Yuning', 'M', 459, 49);
INSERT INTO `pub.teacher` VALUES (444, 237, 'Shawn Flores', 'M', 736, 10);
INSERT INTO `pub.teacher` VALUES (445, 489, 'Kong Ziyi', 'M', 251, 56);
INSERT INTO `pub.teacher` VALUES (446, 880, 'Glenn Marshall', 'M', 468, 25);
INSERT INTO `pub.teacher` VALUES (447, 905, 'Kam Cho Yee', 'F', 680, 40);
INSERT INTO `pub.teacher` VALUES (448, 134, 'Vincent Washington', 'M', 793, 13);
INSERT INTO `pub.teacher` VALUES (449, 604, 'Ho Hiu Tung', 'F', 347, 57);
INSERT INTO `pub.teacher` VALUES (450, 751, 'Dong Yunxi', 'M', 315, 50);
INSERT INTO `pub.teacher` VALUES (451, 431, 'Tan Rui', 'M', 427, 97);
INSERT INTO `pub.teacher` VALUES (452, 512, 'Herbert Henderson', 'M', 885, 91);
INSERT INTO `pub.teacher` VALUES (453, 651, 'Tong Hui Mei', 'F', 707, 26);
INSERT INTO `pub.teacher` VALUES (454, 649, 'Yamamoto Takuya', 'M', 950, 49);
INSERT INTO `pub.teacher` VALUES (455, 293, 'Miyamoto Yuna', 'F', 468, 25);
INSERT INTO `pub.teacher` VALUES (456, 784, 'Wong Sze Yu', 'F', 814, 48);
INSERT INTO `pub.teacher` VALUES (457, 771, 'Kenneth Powell', 'M', 219, 4);
INSERT INTO `pub.teacher` VALUES (458, 463, 'Cai Jialun', 'M', 692, 85);
INSERT INTO `pub.teacher` VALUES (459, 564, 'Meng Lan', 'F', 531, 31);
INSERT INTO `pub.teacher` VALUES (460, 881, 'Matthew Bryant', 'M', 86, 80);
INSERT INTO `pub.teacher` VALUES (461, 92, 'Shen Lu', 'F', 165, 66);
INSERT INTO `pub.teacher` VALUES (462, 401, 'Jia Lan', 'F', 46, 98);
INSERT INTO `pub.teacher` VALUES (463, 346, 'Nomura Hikaru', 'F', 727, 61);
INSERT INTO `pub.teacher` VALUES (464, 237, 'Yang Ziyi', 'M', 995, 68);
INSERT INTO `pub.teacher` VALUES (465, 870, 'Diane Long', 'F', 175, 77);
INSERT INTO `pub.teacher` VALUES (466, 520, 'Frances Hughes', 'F', 919, 85);
INSERT INTO `pub.teacher` VALUES (467, 942, 'Yamada Akina', 'F', 257, 42);
INSERT INTO `pub.teacher` VALUES (468, 218, 'Jennifer Murphy', 'F', 119, 56);
INSERT INTO `pub.teacher` VALUES (469, 239, 'Noguchi Aoshi', 'M', 832, 41);
INSERT INTO `pub.teacher` VALUES (470, 238, 'Juan Dixon', 'M', 537, 77);
INSERT INTO `pub.teacher` VALUES (471, 485, 'John Mills', 'M', 155, 67);
INSERT INTO `pub.teacher` VALUES (472, 316, 'Ono Kazuma', 'M', 463, 77);
INSERT INTO `pub.teacher` VALUES (473, 42, 'Nakagawa Nanami', 'M', 365, 55);
INSERT INTO `pub.teacher` VALUES (474, 573, 'So Chun Yu', 'M', 703, 17);
INSERT INTO `pub.teacher` VALUES (475, 942, 'Emma Gardner', 'F', 438, 32);
INSERT INTO `pub.teacher` VALUES (476, 167, 'Yu Lu', 'F', 247, 82);
INSERT INTO `pub.teacher` VALUES (477, 202, 'Thelma Nelson', 'F', 582, 58);
INSERT INTO `pub.teacher` VALUES (478, 585, 'Zhong Zhennan', 'M', 784, 96);
INSERT INTO `pub.teacher` VALUES (479, 436, 'Ma Lu', 'F', 433, 57);
INSERT INTO `pub.teacher` VALUES (480, 462, 'Joyce Moore', 'F', 177, 63);
INSERT INTO `pub.teacher` VALUES (481, 347, 'Meng Ka Ling', 'F', 597, 30);
INSERT INTO `pub.teacher` VALUES (482, 495, 'Shen Rui', 'M', 869, 28);
INSERT INTO `pub.teacher` VALUES (483, 918, 'Dorothy Grant', 'F', 195, 18);
INSERT INTO `pub.teacher` VALUES (484, 599, 'Kam Wing Sze', 'F', 610, 66);
INSERT INTO `pub.teacher` VALUES (485, 415, 'Lu Xiuying', 'F', 31, 20);
INSERT INTO `pub.teacher` VALUES (486, 299, 'Yip Ling Ling', 'F', 892, 22);
INSERT INTO `pub.teacher` VALUES (487, 119, 'Roy Garcia', 'M', 843, 50);
INSERT INTO `pub.teacher` VALUES (488, 364, 'Christina Romero', 'F', 159, 43);
INSERT INTO `pub.teacher` VALUES (489, 457, 'Jeffery Chen', 'M', 729, 53);
INSERT INTO `pub.teacher` VALUES (490, 508, 'Rita Stone', 'F', 29, 11);
INSERT INTO `pub.teacher` VALUES (491, 18, 'Qiu Rui', 'M', 782, 37);
INSERT INTO `pub.teacher` VALUES (492, 768, 'Xu Ziyi', 'M', 285, 34);
INSERT INTO `pub.teacher` VALUES (493, 632, 'Koon Wing Fat', 'M', 56, 61);
INSERT INTO `pub.teacher` VALUES (494, 142, 'Stanley Martin', 'M', 312, 83);
INSERT INTO `pub.teacher` VALUES (495, 109, 'He Zhennan', 'M', 449, 92);
INSERT INTO `pub.teacher` VALUES (496, 796, 'Maria Young', 'F', 951, 71);
INSERT INTO `pub.teacher` VALUES (497, 250, 'Tao Lan', 'F', 617, 11);
INSERT INTO `pub.teacher` VALUES (498, 600, 'Tang Jialun', 'M', 837, 59);
INSERT INTO `pub.teacher` VALUES (499, 981, 'Liao Chiu Wai', 'M', 575, 100);
INSERT INTO `pub.teacher` VALUES (500, 878, 'Ichikawa Yota', 'M', 239, 94);
INSERT INTO `pub.teacher` VALUES (501, 875, 'Amanda Patterson', 'F', 22, 92);
INSERT INTO `pub.teacher` VALUES (502, 43, 'Kinoshita Ayano', 'F', 279, 32);
INSERT INTO `pub.teacher` VALUES (503, 473, 'Jia Lan', 'F', 606, 82);
INSERT INTO `pub.teacher` VALUES (504, 344, 'Gong Ziyi', 'M', 517, 17);
INSERT INTO `pub.teacher` VALUES (505, 263, 'Fong Ka Ling', 'F', 562, 97);
INSERT INTO `pub.teacher` VALUES (506, 729, 'Dawn Castro', 'F', 139, 94);
INSERT INTO `pub.teacher` VALUES (507, 339, 'Virginia Wright', 'F', 66, 38);
INSERT INTO `pub.teacher` VALUES (508, 611, 'Judy Fisher', 'F', 497, 33);
INSERT INTO `pub.teacher` VALUES (509, 883, 'Qin Rui', 'M', 483, 50);
INSERT INTO `pub.teacher` VALUES (510, 224, 'Kelly Mills', 'F', 420, 54);
INSERT INTO `pub.teacher` VALUES (511, 932, 'Curtis Bennett', 'M', 921, 26);
INSERT INTO `pub.teacher` VALUES (512, 27, 'Chin Sau Man', 'F', 627, 54);
INSERT INTO `pub.teacher` VALUES (513, 649, 'Shi Zhennan', 'M', 650, 78);
INSERT INTO `pub.teacher` VALUES (514, 772, 'Xie Yunxi', 'M', 553, 11);
INSERT INTO `pub.teacher` VALUES (515, 95, 'Leung Ka Ming', 'M', 846, 27);
INSERT INTO `pub.teacher` VALUES (516, 857, 'Yang Xiaoming', 'M', 537, 79);
INSERT INTO `pub.teacher` VALUES (517, 893, 'Han Jialun', 'M', 475, 6);
INSERT INTO `pub.teacher` VALUES (518, 572, 'Yu Lan', 'F', 669, 59);
INSERT INTO `pub.teacher` VALUES (519, 197, 'Taniguchi Aoi', 'F', 6, 46);
INSERT INTO `pub.teacher` VALUES (520, 56, 'Lei Zhiyuan', 'M', 186, 6);
INSERT INTO `pub.teacher` VALUES (521, 3, 'Meng Wai Man', 'F', 399, 13);
INSERT INTO `pub.teacher` VALUES (522, 280, 'Miguel Reed', 'M', 31, 11);
INSERT INTO `pub.teacher` VALUES (523, 890, 'Lam Ting Fung', 'M', 827, 96);
INSERT INTO `pub.teacher` VALUES (524, 715, 'Sano Shino', 'F', 230, 98);
INSERT INTO `pub.teacher` VALUES (525, 303, 'Alexander Cole', 'M', 932, 57);
INSERT INTO `pub.teacher` VALUES (526, 9, 'Margaret Burns', 'F', 432, 52);
INSERT INTO `pub.teacher` VALUES (527, 124, 'Matsuda Yota', 'M', 702, 58);
INSERT INTO `pub.teacher` VALUES (528, 258, 'Sit Tin Lok', 'M', 747, 32);
INSERT INTO `pub.teacher` VALUES (529, 2, 'Hui Wai Man', 'F', 850, 93);
INSERT INTO `pub.teacher` VALUES (530, 505, 'Dai Kar Yan', 'F', 91, 65);
INSERT INTO `pub.teacher` VALUES (531, 307, 'Yoshida Ryota', 'M', 567, 58);
INSERT INTO `pub.teacher` VALUES (532, 1, 'Xu Rui', 'M', 293, 5);
INSERT INTO `pub.teacher` VALUES (533, 197, 'Yamamoto Ayato', 'M', 918, 80);
INSERT INTO `pub.teacher` VALUES (534, 149, 'Ye Shihan', 'F', 691, 41);
INSERT INTO `pub.teacher` VALUES (535, 218, 'Morita Hana', 'F', 506, 54);
INSERT INTO `pub.teacher` VALUES (536, 810, 'Doris Mills', 'F', 739, 84);
INSERT INTO `pub.teacher` VALUES (537, 610, 'Fu Rui', 'M', 400, 27);
INSERT INTO `pub.teacher` VALUES (538, 328, 'Heung On Na', 'F', 499, 61);
INSERT INTO `pub.teacher` VALUES (539, 824, 'Murakami Akina', 'F', 823, 44);
INSERT INTO `pub.teacher` VALUES (540, 616, 'Norma Hill', 'F', 847, 87);
INSERT INTO `pub.teacher` VALUES (541, 81, 'Iwasaki Mio', 'F', 319, 42);
INSERT INTO `pub.teacher` VALUES (542, 767, 'Timothy Bryant', 'M', 807, 92);
INSERT INTO `pub.teacher` VALUES (543, 742, 'Kimura Nanami', 'M', 136, 52);
INSERT INTO `pub.teacher` VALUES (544, 227, 'Xue Jialun', 'M', 818, 45);
INSERT INTO `pub.teacher` VALUES (545, 12, 'Anthony Cooper', 'M', 979, 76);
INSERT INTO `pub.teacher` VALUES (546, 617, 'Nakagawa Yota', 'M', 313, 39);
INSERT INTO `pub.teacher` VALUES (547, 488, 'Okada Itsuki', 'M', 474, 4);
INSERT INTO `pub.teacher` VALUES (548, 820, 'Otsuka Itsuki', 'M', 476, 46);
INSERT INTO `pub.teacher` VALUES (549, 118, 'Roy Young', 'M', 195, 26);
INSERT INTO `pub.teacher` VALUES (550, 658, 'Kimura Miu', 'F', 117, 33);
INSERT INTO `pub.teacher` VALUES (551, 770, 'Lori Baker', 'F', 303, 63);
INSERT INTO `pub.teacher` VALUES (552, 671, 'Kathy Thomas', 'F', 199, 56);
INSERT INTO `pub.teacher` VALUES (553, 886, 'Du Anqi', 'F', 344, 67);
INSERT INTO `pub.teacher` VALUES (554, 492, 'Wang Shihan', 'F', 172, 58);
INSERT INTO `pub.teacher` VALUES (555, 800, 'Monica Kim', 'F', 398, 3);
INSERT INTO `pub.teacher` VALUES (556, 328, 'Liang Rui', 'M', 568, 19);
INSERT INTO `pub.teacher` VALUES (557, 294, 'Lu Zhennan', 'M', 245, 58);
INSERT INTO `pub.teacher` VALUES (558, 910, 'Tin Kwok Wing', 'M', 515, 4);
INSERT INTO `pub.teacher` VALUES (559, 583, 'Amanda Flores', 'F', 896, 42);
INSERT INTO `pub.teacher` VALUES (560, 795, 'Yuan Xiaoming', 'M', 31, 87);
INSERT INTO `pub.teacher` VALUES (561, 167, 'Yau Wai Man', 'F', 143, 52);
INSERT INTO `pub.teacher` VALUES (562, 458, 'Pang Kar Yan', 'F', 791, 56);
INSERT INTO `pub.teacher` VALUES (563, 510, 'Lai Lai Yan', 'F', 288, 11);
INSERT INTO `pub.teacher` VALUES (564, 889, 'Tam Chieh Lun', 'M', 673, 56);
INSERT INTO `pub.teacher` VALUES (565, 422, 'Lo Wai Man', 'F', 548, 4);
INSERT INTO `pub.teacher` VALUES (566, 288, 'Yang Jialun', 'M', 864, 72);
INSERT INTO `pub.teacher` VALUES (567, 381, 'Wan Tin Lok', 'M', 1000, 91);
INSERT INTO `pub.teacher` VALUES (568, 923, 'Morita Ren', 'F', 456, 38);
INSERT INTO `pub.teacher` VALUES (569, 785, 'Hazel Hayes', 'F', 866, 26);
INSERT INTO `pub.teacher` VALUES (570, 931, 'Liang Xiaoming', 'M', 375, 15);
INSERT INTO `pub.teacher` VALUES (571, 212, 'Lui Ming', 'M', 93, 34);
INSERT INTO `pub.teacher` VALUES (572, 570, 'Ng Kwok Ming', 'M', 469, 58);
INSERT INTO `pub.teacher` VALUES (573, 226, 'Jacob Harrison', 'M', 598, 39);
INSERT INTO `pub.teacher` VALUES (574, 85, 'Victor Black', 'M', 650, 76);
INSERT INTO `pub.teacher` VALUES (575, 943, 'Arthur Butler', 'M', 275, 11);
INSERT INTO `pub.teacher` VALUES (576, 91, 'Maeda Tsubasa', 'M', 537, 66);
INSERT INTO `pub.teacher` VALUES (577, 665, 'Kikuchi Mitsuki', 'F', 43, 39);
INSERT INTO `pub.teacher` VALUES (578, 88, 'Kathleen Anderson', 'F', 343, 52);
INSERT INTO `pub.teacher` VALUES (579, 605, 'Saito Yuto', 'M', 803, 80);
INSERT INTO `pub.teacher` VALUES (580, 870, 'Shi Yuning', 'M', 674, 83);
INSERT INTO `pub.teacher` VALUES (581, 505, 'Lam On Na', 'F', 147, 53);
INSERT INTO `pub.teacher` VALUES (582, 850, 'Ma Chun Yu', 'M', 620, 50);
INSERT INTO `pub.teacher` VALUES (583, 553, 'Hu Jiehong', 'M', 306, 98);
INSERT INTO `pub.teacher` VALUES (584, 559, 'Kinoshita Nanami', 'M', 972, 62);
INSERT INTO `pub.teacher` VALUES (585, 811, 'Ricky Baker', 'M', 25, 79);
INSERT INTO `pub.teacher` VALUES (586, 675, 'Matsumoto Aoi', 'F', 258, 58);
INSERT INTO `pub.teacher` VALUES (587, 242, 'Kimura Minato', 'M', 626, 76);
INSERT INTO `pub.teacher` VALUES (588, 784, 'Wu Xiaoming', 'M', 924, 86);
INSERT INTO `pub.teacher` VALUES (589, 159, 'Hashimoto Yuito', 'M', 534, 88);
INSERT INTO `pub.teacher` VALUES (590, 478, 'Kondo Momoe', 'F', 540, 15);
INSERT INTO `pub.teacher` VALUES (591, 787, 'Fujita Nanami', 'M', 621, 20);
INSERT INTO `pub.teacher` VALUES (592, 831, 'Yamazaki Mai', 'F', 452, 21);
INSERT INTO `pub.teacher` VALUES (593, 139, 'Cindy Ross', 'F', 649, 85);
INSERT INTO `pub.teacher` VALUES (594, 316, 'Henry Holmes', 'M', 284, 49);
INSERT INTO `pub.teacher` VALUES (595, 240, 'Deng Xiuying', 'F', 658, 86);
INSERT INTO `pub.teacher` VALUES (596, 433, 'Yu Xiuying', 'F', 68, 35);
INSERT INTO `pub.teacher` VALUES (597, 725, 'Timothy Hughes', 'M', 378, 90);
INSERT INTO `pub.teacher` VALUES (598, 5, 'Pan Lan', 'F', 299, 49);
INSERT INTO `pub.teacher` VALUES (599, 432, 'Heung Kar Yan', 'F', 977, 19);
INSERT INTO `pub.teacher` VALUES (600, 499, 'Suzuki Riku', 'M', 823, 2);
INSERT INTO `pub.teacher` VALUES (601, 739, 'Tao Chiu Wai', 'M', 381, 29);
INSERT INTO `pub.teacher` VALUES (602, 673, 'Willie Powell', 'M', 512, 50);
INSERT INTO `pub.teacher` VALUES (603, 446, 'Howard Howard', 'M', 808, 37);
INSERT INTO `pub.teacher` VALUES (604, 454, 'Hazel Ortiz', 'F', 957, 9);
INSERT INTO `pub.teacher` VALUES (605, 752, 'Wang Rui', 'M', 248, 78);
INSERT INTO `pub.teacher` VALUES (606, 59, 'Nakajima Yota', 'M', 880, 18);
INSERT INTO `pub.teacher` VALUES (607, 456, 'Xu Lan', 'F', 935, 70);
INSERT INTO `pub.teacher` VALUES (608, 813, 'Yuan Zhiyuan', 'M', 972, 7);
INSERT INTO `pub.teacher` VALUES (609, 370, 'Tao Lu', 'F', 255, 76);
INSERT INTO `pub.teacher` VALUES (610, 21, 'Lau Wing Sze', 'F', 336, 25);
INSERT INTO `pub.teacher` VALUES (611, 679, 'Abe Ayano', 'F', 641, 8);
INSERT INTO `pub.teacher` VALUES (612, 152, 'Ogawa Misaki', 'F', 567, 32);
INSERT INTO `pub.teacher` VALUES (613, 310, 'Linda Richardson', 'F', 437, 13);
INSERT INTO `pub.teacher` VALUES (614, 663, 'Scott Richardson', 'M', 623, 26);
INSERT INTO `pub.teacher` VALUES (615, 823, 'Li Yuning', 'M', 463, 53);
INSERT INTO `pub.teacher` VALUES (616, 505, 'Miyazaki Hikari', 'F', 501, 48);
INSERT INTO `pub.teacher` VALUES (617, 654, 'Liang Xiaoming', 'M', 544, 94);
INSERT INTO `pub.teacher` VALUES (618, 49, 'Fu Hok Yau', 'M', 343, 2);
INSERT INTO `pub.teacher` VALUES (619, 751, 'Kwok Ling Ling', 'F', 474, 46);
INSERT INTO `pub.teacher` VALUES (620, 146, 'Randall Bennett', 'M', 354, 94);
INSERT INTO `pub.teacher` VALUES (621, 283, 'Cao Zhennan', 'M', 852, 52);
INSERT INTO `pub.teacher` VALUES (622, 534, 'Takagi Kasumi', 'M', 302, 46);
INSERT INTO `pub.teacher` VALUES (623, 465, 'Sakurai Misaki', 'F', 84, 46);
INSERT INTO `pub.teacher` VALUES (624, 500, 'Sugawara Kasumi', 'M', 982, 4);
INSERT INTO `pub.teacher` VALUES (625, 975, 'Guo Xiaoming', 'M', 478, 2);
INSERT INTO `pub.teacher` VALUES (626, 600, 'Koyama Rena', 'F', 244, 47);
INSERT INTO `pub.teacher` VALUES (627, 956, 'Mak Kwok Ming', 'M', 750, 67);
INSERT INTO `pub.teacher` VALUES (628, 870, 'Kikuchi Mitsuki', 'F', 53, 4);
INSERT INTO `pub.teacher` VALUES (629, 545, 'Xu Zitao', 'M', 288, 29);
INSERT INTO `pub.teacher` VALUES (630, 494, 'Yang Jialun', 'M', 494, 83);
INSERT INTO `pub.teacher` VALUES (631, 179, 'Ethel Schmidt', 'F', 219, 79);
INSERT INTO `pub.teacher` VALUES (632, 795, 'Yuen Ka Man', 'M', 577, 70);
INSERT INTO `pub.teacher` VALUES (633, 236, 'Yuan Jialun', 'M', 423, 66);
INSERT INTO `pub.teacher` VALUES (634, 35, 'Tong Tak Wah', 'M', 277, 61);
INSERT INTO `pub.teacher` VALUES (635, 277, 'Yokoyama Kenta', 'M', 49, 43);
INSERT INTO `pub.teacher` VALUES (636, 814, 'Tan Lan', 'F', 373, 71);
INSERT INTO `pub.teacher` VALUES (637, 29, 'Xiao Xiuying', 'F', 195, 99);
INSERT INTO `pub.teacher` VALUES (638, 807, 'Ashley Richardson', 'F', 727, 94);
INSERT INTO `pub.teacher` VALUES (639, 35, 'Nakano Mai', 'F', 325, 14);
INSERT INTO `pub.teacher` VALUES (640, 400, 'Jeffrey Soto', 'M', 994, 50);
INSERT INTO `pub.teacher` VALUES (641, 182, 'Yin Anqi', 'F', 525, 26);
INSERT INTO `pub.teacher` VALUES (642, 279, 'Russell Harrison', 'M', 3, 32);
INSERT INTO `pub.teacher` VALUES (643, 518, 'Stanley Wright', 'M', 614, 31);
INSERT INTO `pub.teacher` VALUES (644, 351, 'Ann Patterson', 'F', 948, 36);
INSERT INTO `pub.teacher` VALUES (645, 809, 'Ogawa Yuito', 'M', 212, 6);
INSERT INTO `pub.teacher` VALUES (646, 33, 'Sakurai Yota', 'M', 238, 54);
INSERT INTO `pub.teacher` VALUES (647, 217, 'Phillip Cook', 'M', 154, 80);
INSERT INTO `pub.teacher` VALUES (648, 251, 'Kao Chi Yuen', 'M', 597, 80);
INSERT INTO `pub.teacher` VALUES (649, 269, 'Ando Ayano', 'F', 458, 56);
INSERT INTO `pub.teacher` VALUES (650, 845, 'Hou Yuning', 'M', 595, 21);
INSERT INTO `pub.teacher` VALUES (651, 449, 'Randy Ortiz', 'M', 562, 92);
INSERT INTO `pub.teacher` VALUES (652, 534, 'Jin Xiaoming', 'M', 476, 30);
INSERT INTO `pub.teacher` VALUES (653, 105, 'Suzuki Miu', 'F', 849, 20);
INSERT INTO `pub.teacher` VALUES (654, 39, 'Koon Wai Man', 'F', 528, 36);
INSERT INTO `pub.teacher` VALUES (655, 650, 'Fujiwara Shino', 'F', 38, 52);
INSERT INTO `pub.teacher` VALUES (656, 141, 'Chen Yunxi', 'M', 416, 81);
INSERT INTO `pub.teacher` VALUES (657, 182, 'Xie Zhennan', 'M', 786, 7);
INSERT INTO `pub.teacher` VALUES (658, 634, 'Ku Yu Ling', 'F', 792, 56);
INSERT INTO `pub.teacher` VALUES (659, 683, 'Leung Wing Fat', 'M', 374, 11);
INSERT INTO `pub.teacher` VALUES (660, 590, 'Yoshida Ikki', 'M', 265, 86);
INSERT INTO `pub.teacher` VALUES (661, 889, 'Irene Black', 'F', 851, 65);
INSERT INTO `pub.teacher` VALUES (662, 407, 'Juanita Washington', 'F', 758, 68);
INSERT INTO `pub.teacher` VALUES (663, 514, 'Tong Wing Fat', 'M', 383, 94);
INSERT INTO `pub.teacher` VALUES (664, 204, 'Hasegawa Misaki', 'F', 651, 79);
INSERT INTO `pub.teacher` VALUES (665, 488, 'Gregory Martinez', 'M', 652, 66);
INSERT INTO `pub.teacher` VALUES (666, 223, 'Gu Lu', 'F', 545, 32);
INSERT INTO `pub.teacher` VALUES (667, 584, 'Koon Ming', 'M', 883, 37);
INSERT INTO `pub.teacher` VALUES (668, 754, 'Chu Chung Yin', 'M', 21, 73);
INSERT INTO `pub.teacher` VALUES (669, 33, 'Tamura Mio', 'F', 843, 20);
INSERT INTO `pub.teacher` VALUES (670, 186, 'Miu Tsz Ching', 'F', 405, 44);
INSERT INTO `pub.teacher` VALUES (671, 519, 'Ku Lai Yan', 'F', 639, 51);
INSERT INTO `pub.teacher` VALUES (672, 580, 'Ichikawa Momoe', 'F', 166, 95);
INSERT INTO `pub.teacher` VALUES (673, 223, 'Jin Zhennan', 'M', 428, 83);
INSERT INTO `pub.teacher` VALUES (674, 769, 'Wong On Na', 'F', 433, 4);
INSERT INTO `pub.teacher` VALUES (675, 810, 'Charlotte Watson', 'F', 762, 68);
INSERT INTO `pub.teacher` VALUES (676, 402, 'Mok Ka Man', 'M', 604, 80);
INSERT INTO `pub.teacher` VALUES (677, 872, 'Yamazaki Hikaru', 'F', 404, 55);
INSERT INTO `pub.teacher` VALUES (678, 547, 'Meng Lu', 'F', 116, 67);
INSERT INTO `pub.teacher` VALUES (679, 887, 'Yin Zitao', 'M', 778, 48);
INSERT INTO `pub.teacher` VALUES (680, 788, 'Duan Shihan', 'F', 768, 28);
INSERT INTO `pub.teacher` VALUES (681, 934, 'Kudo Ayano', 'F', 124, 46);
INSERT INTO `pub.teacher` VALUES (682, 95, 'Marvin Martinez', 'M', 58, 16);
INSERT INTO `pub.teacher` VALUES (683, 875, 'Pang Kwok Wing', 'M', 168, 58);
INSERT INTO `pub.teacher` VALUES (684, 115, 'Paul Bryant', 'M', 172, 0);
INSERT INTO `pub.teacher` VALUES (685, 71, 'Zhong Lu', 'F', 455, 75);
INSERT INTO `pub.teacher` VALUES (686, 313, 'Bobby Hawkins', 'M', 36, 47);
INSERT INTO `pub.teacher` VALUES (687, 463, 'Chang Zhennan', 'M', 200, 9);
INSERT INTO `pub.teacher` VALUES (688, 781, 'Iwasaki Shino', 'F', 873, 93);
INSERT INTO `pub.teacher` VALUES (689, 214, 'Mak Ting Fung', 'M', 703, 48);
INSERT INTO `pub.teacher` VALUES (690, 279, 'Mori Eita', 'F', 912, 36);
INSERT INTO `pub.teacher` VALUES (691, 733, 'Travis White', 'M', 631, 12);
INSERT INTO `pub.teacher` VALUES (692, 543, 'Sano Sakura', 'F', 282, 6);
INSERT INTO `pub.teacher` VALUES (693, 870, 'Xie Zhennan', 'M', 829, 85);
INSERT INTO `pub.teacher` VALUES (694, 882, 'Mark Sullivan', 'M', 101, 1);
INSERT INTO `pub.teacher` VALUES (695, 608, 'Margaret Morgan', 'F', 312, 8);
INSERT INTO `pub.teacher` VALUES (696, 190, 'Christina Romero', 'F', 361, 12);
INSERT INTO `pub.teacher` VALUES (697, 42, 'Uchida Momoe', 'F', 225, 63);
INSERT INTO `pub.teacher` VALUES (698, 139, 'Lam Wing Kuen', 'M', 219, 81);
INSERT INTO `pub.teacher` VALUES (699, 482, 'Yoshida Mio', 'F', 105, 39);
INSERT INTO `pub.teacher` VALUES (700, 677, 'Lu Xiuying', 'F', 627, 30);
INSERT INTO `pub.teacher` VALUES (701, 739, 'Sheh Wai Yee', 'F', 910, 35);
INSERT INTO `pub.teacher` VALUES (702, 117, 'Takada Takuya', 'M', 249, 5);
INSERT INTO `pub.teacher` VALUES (703, 244, 'Yamamoto Akina', 'F', 997, 2);
INSERT INTO `pub.teacher` VALUES (704, 688, 'Ueda Kasumi', 'M', 175, 73);
INSERT INTO `pub.teacher` VALUES (705, 336, 'Mak Lik Sun', 'M', 893, 53);
INSERT INTO `pub.teacher` VALUES (706, 225, 'Liu Rui', 'M', 672, 25);
INSERT INTO `pub.teacher` VALUES (707, 849, 'Arai Yuito', 'M', 377, 56);
INSERT INTO `pub.teacher` VALUES (708, 897, 'Chiba Shino', 'F', 992, 24);
INSERT INTO `pub.teacher` VALUES (709, 107, 'Zheng Shihan', 'F', 445, 24);
INSERT INTO `pub.teacher` VALUES (710, 83, 'Yamashita Seiko', 'F', 74, 99);
INSERT INTO `pub.teacher` VALUES (711, 332, 'Heung Tak Wah', 'M', 512, 0);
INSERT INTO `pub.teacher` VALUES (712, 969, 'Qian Jiehong', 'M', 910, 74);
INSERT INTO `pub.teacher` VALUES (713, 50, 'Lu Zhennan', 'M', 53, 17);
INSERT INTO `pub.teacher` VALUES (714, 151, 'Lo Fat', 'M', 969, 71);
INSERT INTO `pub.teacher` VALUES (715, 453, 'Randall Watson', 'M', 525, 84);
INSERT INTO `pub.teacher` VALUES (716, 318, 'Cho Ming', 'M', 380, 50);
INSERT INTO `pub.teacher` VALUES (717, 62, 'Lo Wing Fat', 'M', 589, 77);
INSERT INTO `pub.teacher` VALUES (718, 438, 'Wu Lu', 'F', 775, 79);
INSERT INTO `pub.teacher` VALUES (719, 929, 'Yu Ziyi', 'M', 184, 25);
INSERT INTO `pub.teacher` VALUES (720, 300, 'Ye Lu', 'F', 329, 47);
INSERT INTO `pub.teacher` VALUES (721, 434, 'Xiang Ziyi', 'M', 781, 95);
INSERT INTO `pub.teacher` VALUES (722, 501, 'Ying Tak Wah', 'M', 15, 40);
INSERT INTO `pub.teacher` VALUES (723, 196, 'Guo Lan', 'F', 955, 65);
INSERT INTO `pub.teacher` VALUES (724, 846, 'Lu Zitao', 'M', 155, 28);
INSERT INTO `pub.teacher` VALUES (725, 991, 'Inoue Aoi', 'F', 225, 13);
INSERT INTO `pub.teacher` VALUES (726, 122, 'Peng Lu', 'F', 516, 36);
INSERT INTO `pub.teacher` VALUES (727, 968, 'Wada Seiko', 'F', 521, 49);
INSERT INTO `pub.teacher` VALUES (728, 793, 'Tin Ka Ming', 'M', 471, 50);
INSERT INTO `pub.teacher` VALUES (729, 809, 'Ono Yamato', 'M', 595, 38);
INSERT INTO `pub.teacher` VALUES (730, 760, 'Mok Kwok Kuen', 'M', 237, 80);
INSERT INTO `pub.teacher` VALUES (731, 377, 'Matsui Mitsuki', 'F', 14, 52);
INSERT INTO `pub.teacher` VALUES (732, 79, 'Alice Campbell', 'F', 451, 39);
INSERT INTO `pub.teacher` VALUES (733, 541, 'Esther Baker', 'F', 382, 22);
INSERT INTO `pub.teacher` VALUES (734, 739, 'Kwan Kwok Ming', 'M', 595, 92);
INSERT INTO `pub.teacher` VALUES (735, 495, 'Danny Tucker', 'M', 187, 31);
INSERT INTO `pub.teacher` VALUES (736, 123, 'Sara Bailey', 'F', 397, 27);
INSERT INTO `pub.teacher` VALUES (737, 366, 'Takagi Airi', 'F', 810, 25);
INSERT INTO `pub.teacher` VALUES (738, 461, 'Fong Chi Ming', 'M', 312, 24);
INSERT INTO `pub.teacher` VALUES (739, 329, 'Yung Wai Man', 'F', 30, 46);
INSERT INTO `pub.teacher` VALUES (740, 98, 'Otsuka Yota', 'M', 665, 27);
INSERT INTO `pub.teacher` VALUES (741, 535, 'Zou Anqi', 'F', 10, 44);
INSERT INTO `pub.teacher` VALUES (742, 571, 'Tsui Wai Man', 'F', 260, 47);
INSERT INTO `pub.teacher` VALUES (743, 426, 'Fu Sai Wing', 'M', 709, 76);
INSERT INTO `pub.teacher` VALUES (744, 208, 'Kikuchi Sara', 'F', 840, 43);
INSERT INTO `pub.teacher` VALUES (745, 31, 'Melvin Grant', 'M', 384, 45);
INSERT INTO `pub.teacher` VALUES (746, 720, 'Choi Cho Yee', 'F', 942, 40);
INSERT INTO `pub.teacher` VALUES (747, 561, 'Emma Powell', 'F', 173, 30);
INSERT INTO `pub.teacher` VALUES (748, 737, 'Chow Chi Yuen', 'M', 744, 26);
INSERT INTO `pub.teacher` VALUES (749, 886, 'Chiang Chieh Lun', 'M', 757, 67);
INSERT INTO `pub.teacher` VALUES (750, 580, 'Teresa Thompson', 'F', 359, 75);
INSERT INTO `pub.teacher` VALUES (751, 790, 'Pang Tin Wing', 'M', 277, 28);
INSERT INTO `pub.teacher` VALUES (752, 592, 'Monica Jimenez', 'F', 613, 67);
INSERT INTO `pub.teacher` VALUES (753, 851, 'Alfred Jenkins', 'M', 322, 50);
INSERT INTO `pub.teacher` VALUES (754, 960, 'Tong Ka Man', 'M', 744, 99);
INSERT INTO `pub.teacher` VALUES (755, 335, 'Maruyama Momoe', 'F', 776, 60);
INSERT INTO `pub.teacher` VALUES (756, 77, 'Koon Ka Ling', 'F', 724, 56);
INSERT INTO `pub.teacher` VALUES (757, 663, 'Ishida Sara', 'F', 462, 54);
INSERT INTO `pub.teacher` VALUES (758, 200, 'Cheng Jiehong', 'M', 322, 14);
INSERT INTO `pub.teacher` VALUES (759, 719, 'Ryan Baker', 'M', 367, 75);
INSERT INTO `pub.teacher` VALUES (760, 442, 'Xie Lan', 'F', 475, 59);
INSERT INTO `pub.teacher` VALUES (761, 432, 'Abe Aoshi', 'M', 955, 37);
INSERT INTO `pub.teacher` VALUES (762, 33, 'Yang Ziyi', 'M', 263, 96);
INSERT INTO `pub.teacher` VALUES (763, 128, 'Kondo Daisuke', 'M', 847, 96);
INSERT INTO `pub.teacher` VALUES (764, 864, 'Saito Kenta', 'M', 861, 16);
INSERT INTO `pub.teacher` VALUES (765, 782, 'Suzuki Eita', 'F', 461, 86);
INSERT INTO `pub.teacher` VALUES (766, 842, 'Takahashi Kenta', 'M', 758, 64);
INSERT INTO `pub.teacher` VALUES (767, 308, 'Lawrence Cox', 'M', 462, 10);
INSERT INTO `pub.teacher` VALUES (768, 307, 'Kenneth Anderson', 'M', 796, 89);
INSERT INTO `pub.teacher` VALUES (769, 973, 'Hara Minato', 'M', 825, 46);
INSERT INTO `pub.teacher` VALUES (770, 798, 'Maeda Airi', 'F', 921, 72);
INSERT INTO `pub.teacher` VALUES (771, 510, 'Yuan Jialun', 'M', 737, 4);
INSERT INTO `pub.teacher` VALUES (772, 877, 'Hsuan Ka Keung', 'M', 86, 52);
INSERT INTO `pub.teacher` VALUES (773, 849, 'Fujita Rin', 'F', 807, 72);
INSERT INTO `pub.teacher` VALUES (774, 654, 'Cheng Zhiyuan', 'M', 70, 49);
INSERT INTO `pub.teacher` VALUES (775, 14, 'Wu Anqi', 'F', 62, 93);
INSERT INTO `pub.teacher` VALUES (776, 310, 'Randall Munoz', 'M', 969, 64);
INSERT INTO `pub.teacher` VALUES (777, 487, 'Koo Cho Yee', 'F', 453, 45);
INSERT INTO `pub.teacher` VALUES (778, 998, 'Ono Hikaru', 'F', 129, 88);
INSERT INTO `pub.teacher` VALUES (779, 599, 'Gao Shihan', 'F', 623, 10);
INSERT INTO `pub.teacher` VALUES (780, 611, 'Sano Momoka', 'F', 262, 62);
INSERT INTO `pub.teacher` VALUES (781, 421, 'Hasegawa Aoshi', 'M', 544, 82);
INSERT INTO `pub.teacher` VALUES (782, 482, 'Yu Xiaoming', 'M', 869, 1);
INSERT INTO `pub.teacher` VALUES (783, 172, 'Fan Shihan', 'F', 739, 11);
INSERT INTO `pub.teacher` VALUES (784, 966, 'Jeremy Russell', 'M', 142, 10);
INSERT INTO `pub.teacher` VALUES (785, 409, 'Timothy Mills', 'M', 915, 70);
INSERT INTO `pub.teacher` VALUES (786, 328, 'Yeow Sau Man', 'F', 612, 5);
INSERT INTO `pub.teacher` VALUES (787, 136, 'Yung Chung Yin', 'M', 982, 20);
INSERT INTO `pub.teacher` VALUES (788, 41, 'Heung Chung Yin', 'M', 647, 29);
INSERT INTO `pub.teacher` VALUES (789, 837, 'Harada Sara', 'F', 781, 2);
INSERT INTO `pub.teacher` VALUES (790, 524, 'Goto Shino', 'F', 857, 100);
INSERT INTO `pub.teacher` VALUES (791, 456, 'Yan Zitao', 'M', 55, 42);
INSERT INTO `pub.teacher` VALUES (792, 588, 'Kobayashi Momoe', 'F', 238, 43);
INSERT INTO `pub.teacher` VALUES (793, 885, 'Wan Ming Sze', 'F', 249, 83);
INSERT INTO `pub.teacher` VALUES (794, 991, 'Todd Patterson', 'M', 745, 82);
INSERT INTO `pub.teacher` VALUES (795, 509, 'Shibata Yuto', 'M', 994, 80);
INSERT INTO `pub.teacher` VALUES (796, 483, 'Feng Ziyi', 'M', 487, 67);
INSERT INTO `pub.teacher` VALUES (797, 470, 'Takeuchi Hina', 'F', 170, 88);
INSERT INTO `pub.teacher` VALUES (798, 252, 'Guo Zhennan', 'M', 505, 79);
INSERT INTO `pub.teacher` VALUES (799, 194, 'Nakamori Ayano', 'F', 596, 57);
INSERT INTO `pub.teacher` VALUES (800, 431, 'Sara Olson', 'F', 590, 25);
INSERT INTO `pub.teacher` VALUES (801, 298, 'Yan Jiehong', 'M', 624, 0);
INSERT INTO `pub.teacher` VALUES (802, 358, 'Wong Tin Lok', 'M', 495, 60);
INSERT INTO `pub.teacher` VALUES (803, 135, 'Kato Ayato', 'M', 745, 95);
INSERT INTO `pub.teacher` VALUES (804, 548, 'Koyama Yamato', 'M', 262, 53);
INSERT INTO `pub.teacher` VALUES (805, 816, 'Wada Ayato', 'M', 314, 72);
INSERT INTO `pub.teacher` VALUES (806, 963, 'Chen Ziyi', 'M', 582, 35);
INSERT INTO `pub.teacher` VALUES (807, 852, 'Patricia Webb', 'F', 384, 90);
INSERT INTO `pub.teacher` VALUES (808, 199, 'Xue Zhiyuan', 'M', 211, 6);
INSERT INTO `pub.teacher` VALUES (809, 471, 'Lai Sum Wing', 'F', 4, 57);
INSERT INTO `pub.teacher` VALUES (810, 955, 'Yuen On Na', 'F', 700, 14);
INSERT INTO `pub.teacher` VALUES (811, 561, 'Jiang Zitao', 'M', 335, 96);
INSERT INTO `pub.teacher` VALUES (812, 811, 'Hashimoto Miu', 'F', 601, 10);
INSERT INTO `pub.teacher` VALUES (813, 545, 'Xu Xiaoming', 'M', 789, 58);
INSERT INTO `pub.teacher` VALUES (814, 796, 'Edwin Russell', 'M', 377, 26);
INSERT INTO `pub.teacher` VALUES (815, 507, 'Ishida Ayano', 'F', 198, 47);
INSERT INTO `pub.teacher` VALUES (816, 167, 'Juanita Guzman', 'F', 166, 27);
INSERT INTO `pub.teacher` VALUES (817, 352, 'Tamura Eita', 'F', 926, 65);
INSERT INTO `pub.teacher` VALUES (818, 728, 'Victoria Jordan', 'F', 175, 32);
INSERT INTO `pub.teacher` VALUES (819, 594, 'Ryan Diaz', 'M', 441, 47);
INSERT INTO `pub.teacher` VALUES (820, 608, 'Joe Moore', 'M', 586, 32);
INSERT INTO `pub.teacher` VALUES (821, 116, 'Shi Xiuying', 'F', 529, 85);
INSERT INTO `pub.teacher` VALUES (822, 888, 'Fu Sai Wing', 'M', 252, 6);
INSERT INTO `pub.teacher` VALUES (823, 616, 'Ding Rui', 'M', 707, 54);
INSERT INTO `pub.teacher` VALUES (824, 894, 'Loui Wai Man', 'F', 23, 4);
INSERT INTO `pub.teacher` VALUES (825, 819, 'Beverly Dixon', 'F', 693, 92);
INSERT INTO `pub.teacher` VALUES (826, 616, 'Xia Xiaoming', 'M', 513, 25);
INSERT INTO `pub.teacher` VALUES (827, 67, 'Li Yunxi', 'M', 561, 7);
INSERT INTO `pub.teacher` VALUES (828, 882, 'Yue Fat', 'M', 464, 61);
INSERT INTO `pub.teacher` VALUES (829, 16, 'Wei Lu', 'F', 396, 86);
INSERT INTO `pub.teacher` VALUES (830, 370, 'Ren Lu', 'F', 314, 97);
INSERT INTO `pub.teacher` VALUES (831, 149, 'Sun Anqi', 'F', 822, 6);
INSERT INTO `pub.teacher` VALUES (832, 495, 'Mo Lu', 'F', 694, 26);
INSERT INTO `pub.teacher` VALUES (833, 714, 'Yamaguchi Yota', 'M', 976, 69);
INSERT INTO `pub.teacher` VALUES (834, 933, 'Murata Sakura', 'F', 940, 2);
INSERT INTO `pub.teacher` VALUES (835, 677, 'Liang Jialun', 'M', 248, 64);
INSERT INTO `pub.teacher` VALUES (836, 508, 'Murakami Seiko', 'F', 900, 81);
INSERT INTO `pub.teacher` VALUES (837, 857, 'Miura Ayano', 'F', 322, 64);
INSERT INTO `pub.teacher` VALUES (838, 440, 'Wang Rui', 'M', 167, 2);
INSERT INTO `pub.teacher` VALUES (839, 796, 'Qin Ziyi', 'M', 603, 59);
INSERT INTO `pub.teacher` VALUES (840, 995, 'Tamura Itsuki', 'M', 711, 85);
INSERT INTO `pub.teacher` VALUES (841, 653, 'Nakamura Hana', 'F', 166, 53);
INSERT INTO `pub.teacher` VALUES (842, 828, 'Yoshida Daichi', 'M', 129, 6);
INSERT INTO `pub.teacher` VALUES (843, 938, 'Lo Wing Sze', 'F', 503, 32);
INSERT INTO `pub.teacher` VALUES (844, 943, 'Tang Xiaoming', 'M', 201, 22);
INSERT INTO `pub.teacher` VALUES (845, 225, 'Jennifer Wagner', 'F', 68, 4);
INSERT INTO `pub.teacher` VALUES (846, 525, 'Xiang Anqi', 'F', 526, 82);
INSERT INTO `pub.teacher` VALUES (847, 930, 'Chiang Chieh Lun', 'M', 239, 71);
INSERT INTO `pub.teacher` VALUES (848, 737, 'Sasaki Kaito', 'M', 816, 82);
INSERT INTO `pub.teacher` VALUES (849, 583, 'Deborah Parker', 'F', 639, 57);
INSERT INTO `pub.teacher` VALUES (850, 667, 'Pak Cho Yee', 'F', 57, 43);
INSERT INTO `pub.teacher` VALUES (851, 112, 'Tanaka Rin', 'F', 917, 4);
INSERT INTO `pub.teacher` VALUES (852, 814, 'Frances Hughes', 'F', 206, 28);
INSERT INTO `pub.teacher` VALUES (853, 418, 'Sakai Rin', 'F', 995, 55);
INSERT INTO `pub.teacher` VALUES (854, 147, 'Takada Ryota', 'M', 723, 23);
INSERT INTO `pub.teacher` VALUES (855, 50, 'Tin Lai Yan', 'F', 82, 95);
INSERT INTO `pub.teacher` VALUES (856, 259, 'Yu Xiaoming', 'M', 300, 10);
INSERT INTO `pub.teacher` VALUES (857, 304, 'Tong Tin Wing', 'M', 608, 68);
INSERT INTO `pub.teacher` VALUES (858, 687, 'Mario Young', 'M', 413, 23);
INSERT INTO `pub.teacher` VALUES (859, 680, 'Ono Yuna', 'F', 421, 83);
INSERT INTO `pub.teacher` VALUES (860, 64, 'Ren Xiuying', 'F', 520, 21);
INSERT INTO `pub.teacher` VALUES (861, 936, 'Nakano Seiko', 'F', 498, 98);
INSERT INTO `pub.teacher` VALUES (862, 295, 'Huang Ziyi', 'M', 622, 62);
INSERT INTO `pub.teacher` VALUES (863, 256, 'Tang Tsz Ching', 'F', 364, 2);
INSERT INTO `pub.teacher` VALUES (864, 238, 'Lee Ting Fung', 'M', 685, 77);
INSERT INTO `pub.teacher` VALUES (865, 762, 'Masuda Seiko', 'F', 883, 53);
INSERT INTO `pub.teacher` VALUES (866, 900, 'Eddie Grant', 'M', 536, 30);
INSERT INTO `pub.teacher` VALUES (867, 528, 'Otsuka Riku', 'M', 256, 74);
INSERT INTO `pub.teacher` VALUES (868, 895, 'Ren Anqi', 'F', 724, 13);
INSERT INTO `pub.teacher` VALUES (869, 392, 'Kong Cho Yee', 'F', 779, 93);
INSERT INTO `pub.teacher` VALUES (870, 537, 'Takeda Ikki', 'M', 583, 91);
INSERT INTO `pub.teacher` VALUES (871, 989, 'Christina Martinez', 'F', 9, 11);
INSERT INTO `pub.teacher` VALUES (872, 149, 'Xiao Lu', 'F', 548, 38);
INSERT INTO `pub.teacher` VALUES (873, 190, 'Lo Sau Man', 'F', 581, 98);
INSERT INTO `pub.teacher` VALUES (874, 696, 'Song Xiuying', 'F', 496, 91);
INSERT INTO `pub.teacher` VALUES (875, 674, 'Kelly Myers', 'F', 834, 16);
INSERT INTO `pub.teacher` VALUES (876, 381, 'Carrie Brown', 'F', 92, 74);
INSERT INTO `pub.teacher` VALUES (877, 58, 'Liu Shihan', 'F', 871, 41);
INSERT INTO `pub.teacher` VALUES (878, 135, 'Yamashita Ayato', 'M', 701, 32);
INSERT INTO `pub.teacher` VALUES (879, 595, 'Juan Hunt', 'M', 550, 88);
INSERT INTO `pub.teacher` VALUES (880, 677, 'Yin Ka Ling', 'F', 195, 62);
INSERT INTO `pub.teacher` VALUES (881, 809, 'Yam Sze Kwan', 'F', 346, 27);
INSERT INTO `pub.teacher` VALUES (882, 131, 'Sakamoto Daisuke', 'M', 903, 93);
INSERT INTO `pub.teacher` VALUES (883, 206, 'Yue Wing Sze', 'F', 400, 79);
INSERT INTO `pub.teacher` VALUES (884, 904, 'Hasegawa Daisuke', 'M', 412, 94);
INSERT INTO `pub.teacher` VALUES (885, 693, 'Kojima Ayato', 'M', 411, 31);
INSERT INTO `pub.teacher` VALUES (886, 906, 'Long Jiehong', 'M', 351, 53);
INSERT INTO `pub.teacher` VALUES (887, 482, 'Nakamura Sakura', 'F', 369, 96);
INSERT INTO `pub.teacher` VALUES (888, 791, 'Sakai Minato', 'M', 835, 91);
INSERT INTO `pub.teacher` VALUES (889, 11, 'Fang Lan', 'F', 717, 80);
INSERT INTO `pub.teacher` VALUES (890, 540, 'He Jiehong', 'M', 870, 92);
INSERT INTO `pub.teacher` VALUES (891, 652, 'Hao Xiaoming', 'M', 226, 22);
INSERT INTO `pub.teacher` VALUES (892, 40, 'Tammy Price', 'F', 25, 55);
INSERT INTO `pub.teacher` VALUES (893, 948, 'Takagi Ryota', 'M', 609, 39);
INSERT INTO `pub.teacher` VALUES (894, 631, 'Ding Shihan', 'F', 118, 4);
INSERT INTO `pub.teacher` VALUES (895, 10, 'Fujita Kazuma', 'M', 677, 39);
INSERT INTO `pub.teacher` VALUES (896, 511, 'Leung Ka Keung', 'M', 237, 97);
INSERT INTO `pub.teacher` VALUES (897, 17, 'Heung Tin Lok', 'M', 634, 37);
INSERT INTO `pub.teacher` VALUES (898, 762, 'Cheng Yunxi', 'M', 869, 51);
INSERT INTO `pub.teacher` VALUES (899, 858, 'Xu Xiaoming', 'M', 866, 6);
INSERT INTO `pub.teacher` VALUES (900, 268, 'Fu Cho Yee', 'F', 826, 7);
INSERT INTO `pub.teacher` VALUES (901, 49, 'Mo Kwok Ming', 'M', 41, 25);
INSERT INTO `pub.teacher` VALUES (902, 336, 'Chiba Momoe', 'F', 916, 98);
INSERT INTO `pub.teacher` VALUES (903, 158, 'Watanabe Kaito', 'M', 759, 18);
INSERT INTO `pub.teacher` VALUES (904, 608, 'Meng Jiehong', 'M', 365, 25);
INSERT INTO `pub.teacher` VALUES (905, 891, 'Hirano Nanami', 'M', 310, 36);
INSERT INTO `pub.teacher` VALUES (906, 765, 'Ishida Seiko', 'F', 288, 35);
INSERT INTO `pub.teacher` VALUES (907, 941, 'Sato Rin', 'F', 629, 62);
INSERT INTO `pub.teacher` VALUES (908, 20, 'Chang Sum Wing', 'F', 14, 90);
INSERT INTO `pub.teacher` VALUES (909, 471, 'Christina Gonzalez', 'F', 863, 76);
INSERT INTO `pub.teacher` VALUES (910, 976, 'Lu Anqi', 'F', 442, 65);
INSERT INTO `pub.teacher` VALUES (911, 528, 'Arai Takuya', 'M', 840, 46);
INSERT INTO `pub.teacher` VALUES (912, 314, 'Tao Lan', 'F', 235, 78);
INSERT INTO `pub.teacher` VALUES (913, 506, 'Shibata Rena', 'F', 705, 47);
INSERT INTO `pub.teacher` VALUES (914, 430, 'Ralph Jordan', 'M', 906, 53);
INSERT INTO `pub.teacher` VALUES (915, 922, 'Qian Jiehong', 'M', 923, 6);
INSERT INTO `pub.teacher` VALUES (916, 27, 'Otsuka Kenta', 'M', 781, 84);
INSERT INTO `pub.teacher` VALUES (917, 635, 'Harada Yuito', 'M', 603, 32);
INSERT INTO `pub.teacher` VALUES (918, 22, 'Siu Wing Suen', 'F', 88, 45);
INSERT INTO `pub.teacher` VALUES (919, 835, 'Theodore Gomez', 'M', 309, 17);
INSERT INTO `pub.teacher` VALUES (920, 712, 'Julia Rogers', 'F', 201, 0);
INSERT INTO `pub.teacher` VALUES (921, 377, 'Eugene Young', 'M', 234, 8);
INSERT INTO `pub.teacher` VALUES (922, 322, 'Ricky Robertson', 'M', 970, 47);
INSERT INTO `pub.teacher` VALUES (923, 205, 'Qin Anqi', 'F', 224, 1);
INSERT INTO `pub.teacher` VALUES (924, 625, 'Phillip James', 'M', 469, 62);
INSERT INTO `pub.teacher` VALUES (925, 230, 'Han Kar Yan', 'F', 450, 24);
INSERT INTO `pub.teacher` VALUES (926, 430, 'Marjorie Ramirez', 'F', 68, 81);
INSERT INTO `pub.teacher` VALUES (927, 99, 'Wu Chieh Lun', 'M', 189, 7);
INSERT INTO `pub.teacher` VALUES (928, 643, 'Janet Stewart', 'F', 767, 20);
INSERT INTO `pub.teacher` VALUES (929, 98, 'Clarence Jordan', 'M', 245, 5);
INSERT INTO `pub.teacher` VALUES (930, 483, 'Chiba Aoi', 'F', 494, 49);
INSERT INTO `pub.teacher` VALUES (931, 269, 'Koo Siu Wai', 'F', 679, 85);
INSERT INTO `pub.teacher` VALUES (932, 699, 'Todd Brown', 'M', 66, 14);
INSERT INTO `pub.teacher` VALUES (933, 282, 'Marie Dixon', 'F', 311, 28);
INSERT INTO `pub.teacher` VALUES (934, 299, 'Heung Yun Fat', 'M', 476, 56);
INSERT INTO `pub.teacher` VALUES (935, 321, 'Wei Jiehong', 'M', 545, 18);
INSERT INTO `pub.teacher` VALUES (936, 437, 'Thelma Alexander', 'F', 110, 21);
INSERT INTO `pub.teacher` VALUES (937, 733, 'Nakayama Momoka', 'F', 460, 48);
INSERT INTO `pub.teacher` VALUES (938, 170, 'Dai Zitao', 'M', 478, 18);
INSERT INTO `pub.teacher` VALUES (939, 906, 'Marjorie Morris', 'F', 144, 36);
INSERT INTO `pub.teacher` VALUES (940, 910, 'Otsuka Yuito', 'M', 375, 56);
INSERT INTO `pub.teacher` VALUES (941, 306, 'Chung Chung Yin', 'M', 846, 21);
INSERT INTO `pub.teacher` VALUES (942, 65, 'Aoki Momoe', 'F', 993, 22);
INSERT INTO `pub.teacher` VALUES (943, 546, 'Todd Bryant', 'M', 497, 75);
INSERT INTO `pub.teacher` VALUES (944, 63, 'Chan Yun Fat', 'M', 720, 63);
INSERT INTO `pub.teacher` VALUES (945, 520, 'Kimberly Sullivan', 'F', 384, 7);
INSERT INTO `pub.teacher` VALUES (946, 795, 'Pak Kar Yan', 'F', 135, 67);
INSERT INTO `pub.teacher` VALUES (947, 77, 'Wada Hazuki', 'F', 584, 88);
INSERT INTO `pub.teacher` VALUES (948, 802, 'Yuen Wai Man', 'F', 472, 69);
INSERT INTO `pub.teacher` VALUES (949, 233, 'Takeuchi Airi', 'F', 595, 21);
INSERT INTO `pub.teacher` VALUES (950, 865, 'Mui Siu Wai', 'F', 425, 3);
INSERT INTO `pub.teacher` VALUES (951, 439, 'Deborah Green', 'F', 721, 87);
INSERT INTO `pub.teacher` VALUES (952, 567, 'Saito Tsubasa', 'M', 255, 55);
INSERT INTO `pub.teacher` VALUES (953, 573, 'Matsui Kasumi', 'M', 254, 86);
INSERT INTO `pub.teacher` VALUES (954, 386, 'Yeow Ling Ling', 'F', 944, 0);
INSERT INTO `pub.teacher` VALUES (955, 231, 'Ogawa Seiko', 'F', 498, 22);
INSERT INTO `pub.teacher` VALUES (956, 587, 'Nakayama Mai', 'F', 761, 97);
INSERT INTO `pub.teacher` VALUES (957, 187, 'Takahashi Hikari', 'F', 373, 41);
INSERT INTO `pub.teacher` VALUES (958, 456, 'Fujiwara Momoka', 'F', 101, 64);
INSERT INTO `pub.teacher` VALUES (959, 104, 'Rhonda Allen', 'F', 98, 84);
INSERT INTO `pub.teacher` VALUES (960, 565, 'Joe Wagner', 'M', 222, 76);
INSERT INTO `pub.teacher` VALUES (961, 365, 'Inoue Kenta', 'M', 452, 98);
INSERT INTO `pub.teacher` VALUES (962, 842, 'Su Anqi', 'F', 335, 54);
INSERT INTO `pub.teacher` VALUES (963, 469, 'Yin Zhennan', 'M', 952, 85);
INSERT INTO `pub.teacher` VALUES (964, 991, 'Chic Ka Ming', 'M', 125, 50);
INSERT INTO `pub.teacher` VALUES (965, 921, 'Frances Ramirez', 'F', 575, 98);
INSERT INTO `pub.teacher` VALUES (966, 503, 'Hasegawa Hikari', 'F', 844, 54);
INSERT INTO `pub.teacher` VALUES (967, 84, 'Glenn Diaz', 'M', 531, 63);
INSERT INTO `pub.teacher` VALUES (968, 81, 'Wada Shino', 'F', 508, 18);
INSERT INTO `pub.teacher` VALUES (969, 474, 'Hara Takuya', 'M', 316, 10);
INSERT INTO `pub.teacher` VALUES (970, 421, 'Tsang Suk Yee', 'F', 694, 88);
INSERT INTO `pub.teacher` VALUES (971, 782, 'Joe Guzman', 'M', 457, 87);
INSERT INTO `pub.teacher` VALUES (972, 261, 'Jesse Cook', 'M', 260, 68);
INSERT INTO `pub.teacher` VALUES (973, 579, 'Yamamoto Hana', 'F', 313, 56);
INSERT INTO `pub.teacher` VALUES (974, 240, 'Wendy Thompson', 'F', 993, 55);
INSERT INTO `pub.teacher` VALUES (975, 345, 'Endo Mai', 'F', 750, 79);
INSERT INTO `pub.teacher` VALUES (976, 99, 'Heung Fu Shing', 'M', 751, 77);
INSERT INTO `pub.teacher` VALUES (977, 661, 'Okamoto Hikari', 'F', 525, 87);
INSERT INTO `pub.teacher` VALUES (978, 103, 'Ishikawa Aoi', 'F', 44, 62);
INSERT INTO `pub.teacher` VALUES (979, 507, 'Su Yuning', 'M', 699, 24);
INSERT INTO `pub.teacher` VALUES (980, 191, 'Theresa Garza', 'F', 893, 45);
INSERT INTO `pub.teacher` VALUES (981, 914, 'Aoki Rena', 'F', 242, 25);
INSERT INTO `pub.teacher` VALUES (982, 631, 'Stanley Mendez', 'M', 166, 21);
INSERT INTO `pub.teacher` VALUES (983, 941, 'Gu Anqi', 'F', 692, 92);
INSERT INTO `pub.teacher` VALUES (984, 525, 'Kato Ayato', 'M', 878, 21);
INSERT INTO `pub.teacher` VALUES (985, 583, 'Wang Yunxi', 'M', 967, 69);
INSERT INTO `pub.teacher` VALUES (986, 475, 'Meng Jialun', 'M', 153, 77);
INSERT INTO `pub.teacher` VALUES (987, 271, 'Shen Ziyi', 'M', 418, 35);
INSERT INTO `pub.teacher` VALUES (988, 524, 'Kong Yu Ling', 'F', 878, 33);
INSERT INTO `pub.teacher` VALUES (989, 625, 'Chu Ka Keung', 'M', 556, 61);
INSERT INTO `pub.teacher` VALUES (990, 606, 'Cho Chi Ming', 'M', 48, 96);
INSERT INTO `pub.teacher` VALUES (991, 218, 'Maria Guzman', 'F', 206, 16);
INSERT INTO `pub.teacher` VALUES (992, 742, 'Kono Ikki', 'M', 412, 68);
INSERT INTO `pub.teacher` VALUES (993, 860, 'Hu Zhiyuan', 'M', 23, 86);
INSERT INTO `pub.teacher` VALUES (994, 298, 'Lu Shihan', 'F', 703, 36);
INSERT INTO `pub.teacher` VALUES (995, 762, 'Fujii Sakura', 'F', 554, 53);
INSERT INTO `pub.teacher` VALUES (996, 935, 'Kwan Fu Shing', 'M', 998, 70);
INSERT INTO `pub.teacher` VALUES (997, 403, 'Joel Cox', 'M', 740, 71);
INSERT INTO `pub.teacher` VALUES (998, 58, 'Uchida Mai', 'F', 367, 57);
INSERT INTO `pub.teacher` VALUES (999, 863, 'Li Jialun', 'M', 577, 87);
INSERT INTO `pub.teacher` VALUES (1000, 482, 'Yoshida Daisuke', 'M', 874, 23);

-- ----------------------------
-- Table structure for pub.teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `pub.teacher_course`;
CREATE TABLE `pub.teacher_course`  (
  `id` int NOT NULL,
  `cid` int NOT NULL,
  `tid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub.teacher_course
-- ----------------------------
INSERT INTO `pub.teacher_course` VALUES (1, 753, 44);
INSERT INTO `pub.teacher_course` VALUES (2, 929, 136);
INSERT INTO `pub.teacher_course` VALUES (3, 854, 468);
INSERT INTO `pub.teacher_course` VALUES (4, 849, 871);
INSERT INTO `pub.teacher_course` VALUES (5, 236, 813);
INSERT INTO `pub.teacher_course` VALUES (6, 236, 89);
INSERT INTO `pub.teacher_course` VALUES (7, 470, 746);
INSERT INTO `pub.teacher_course` VALUES (8, 698, 217);
INSERT INTO `pub.teacher_course` VALUES (9, 754, 866);
INSERT INTO `pub.teacher_course` VALUES (10, 537, 484);
INSERT INTO `pub.teacher_course` VALUES (11, 243, 457);
INSERT INTO `pub.teacher_course` VALUES (12, 668, 366);
INSERT INTO `pub.teacher_course` VALUES (13, 115, 677);
INSERT INTO `pub.teacher_course` VALUES (14, 264, 702);
INSERT INTO `pub.teacher_course` VALUES (15, 641, 765);
INSERT INTO `pub.teacher_course` VALUES (16, 544, 372);
INSERT INTO `pub.teacher_course` VALUES (17, 17, 452);
INSERT INTO `pub.teacher_course` VALUES (18, 456, 798);
INSERT INTO `pub.teacher_course` VALUES (19, 732, 47);
INSERT INTO `pub.teacher_course` VALUES (20, 555, 596);
INSERT INTO `pub.teacher_course` VALUES (21, 939, 434);
INSERT INTO `pub.teacher_course` VALUES (22, 92, 812);
INSERT INTO `pub.teacher_course` VALUES (23, 117, 599);
INSERT INTO `pub.teacher_course` VALUES (24, 746, 59);
INSERT INTO `pub.teacher_course` VALUES (25, 366, 745);
INSERT INTO `pub.teacher_course` VALUES (26, 978, 935);
INSERT INTO `pub.teacher_course` VALUES (27, 298, 726);
INSERT INTO `pub.teacher_course` VALUES (28, 869, 721);
INSERT INTO `pub.teacher_course` VALUES (29, 291, 418);
INSERT INTO `pub.teacher_course` VALUES (30, 324, 668);
INSERT INTO `pub.teacher_course` VALUES (31, 509, 75);
INSERT INTO `pub.teacher_course` VALUES (32, 193, 987);
INSERT INTO `pub.teacher_course` VALUES (33, 797, 822);
INSERT INTO `pub.teacher_course` VALUES (34, 648, 271);
INSERT INTO `pub.teacher_course` VALUES (35, 640, 279);
INSERT INTO `pub.teacher_course` VALUES (36, 835, 467);
INSERT INTO `pub.teacher_course` VALUES (37, 115, 76);
INSERT INTO `pub.teacher_course` VALUES (38, 441, 944);
INSERT INTO `pub.teacher_course` VALUES (39, 888, 128);
INSERT INTO `pub.teacher_course` VALUES (40, 957, 327);
INSERT INTO `pub.teacher_course` VALUES (41, 11, 352);
INSERT INTO `pub.teacher_course` VALUES (42, 858, 209);
INSERT INTO `pub.teacher_course` VALUES (43, 877, 251);
INSERT INTO `pub.teacher_course` VALUES (44, 74, 321);
INSERT INTO `pub.teacher_course` VALUES (45, 486, 69);
INSERT INTO `pub.teacher_course` VALUES (46, 81, 275);
INSERT INTO `pub.teacher_course` VALUES (47, 605, 761);
INSERT INTO `pub.teacher_course` VALUES (48, 721, 24);
INSERT INTO `pub.teacher_course` VALUES (49, 628, 221);
INSERT INTO `pub.teacher_course` VALUES (50, 825, 959);
INSERT INTO `pub.teacher_course` VALUES (51, 459, 592);
INSERT INTO `pub.teacher_course` VALUES (52, 502, 2);
INSERT INTO `pub.teacher_course` VALUES (53, 389, 869);
INSERT INTO `pub.teacher_course` VALUES (54, 557, 34);
INSERT INTO `pub.teacher_course` VALUES (55, 391, 695);
INSERT INTO `pub.teacher_course` VALUES (56, 750, 31);
INSERT INTO `pub.teacher_course` VALUES (57, 654, 954);
INSERT INTO `pub.teacher_course` VALUES (58, 731, 281);
INSERT INTO `pub.teacher_course` VALUES (59, 791, 137);
INSERT INTO `pub.teacher_course` VALUES (60, 869, 885);
INSERT INTO `pub.teacher_course` VALUES (61, 137, 763);
INSERT INTO `pub.teacher_course` VALUES (62, 245, 374);
INSERT INTO `pub.teacher_course` VALUES (63, 820, 370);
INSERT INTO `pub.teacher_course` VALUES (64, 278, 469);
INSERT INTO `pub.teacher_course` VALUES (65, 306, 81);
INSERT INTO `pub.teacher_course` VALUES (66, 290, 124);
INSERT INTO `pub.teacher_course` VALUES (67, 708, 403);
INSERT INTO `pub.teacher_course` VALUES (68, 620, 440);
INSERT INTO `pub.teacher_course` VALUES (69, 677, 739);
INSERT INTO `pub.teacher_course` VALUES (70, 503, 132);
INSERT INTO `pub.teacher_course` VALUES (71, 992, 41);
INSERT INTO `pub.teacher_course` VALUES (72, 732, 634);
INSERT INTO `pub.teacher_course` VALUES (73, 506, 837);
INSERT INTO `pub.teacher_course` VALUES (74, 117, 893);
INSERT INTO `pub.teacher_course` VALUES (75, 656, 140);
INSERT INTO `pub.teacher_course` VALUES (76, 395, 815);
INSERT INTO `pub.teacher_course` VALUES (77, 354, 189);
INSERT INTO `pub.teacher_course` VALUES (78, 664, 721);
INSERT INTO `pub.teacher_course` VALUES (79, 910, 824);
INSERT INTO `pub.teacher_course` VALUES (80, 392, 923);
INSERT INTO `pub.teacher_course` VALUES (81, 669, 140);
INSERT INTO `pub.teacher_course` VALUES (82, 412, 979);
INSERT INTO `pub.teacher_course` VALUES (83, 400, 472);
INSERT INTO `pub.teacher_course` VALUES (84, 502, 405);
INSERT INTO `pub.teacher_course` VALUES (85, 747, 277);
INSERT INTO `pub.teacher_course` VALUES (86, 433, 983);
INSERT INTO `pub.teacher_course` VALUES (87, 328, 208);
INSERT INTO `pub.teacher_course` VALUES (88, 127, 88);
INSERT INTO `pub.teacher_course` VALUES (89, 107, 447);
INSERT INTO `pub.teacher_course` VALUES (90, 771, 107);
INSERT INTO `pub.teacher_course` VALUES (91, 938, 267);
INSERT INTO `pub.teacher_course` VALUES (92, 7, 303);
INSERT INTO `pub.teacher_course` VALUES (93, 907, 293);
INSERT INTO `pub.teacher_course` VALUES (94, 894, 327);
INSERT INTO `pub.teacher_course` VALUES (95, 727, 918);
INSERT INTO `pub.teacher_course` VALUES (96, 802, 752);
INSERT INTO `pub.teacher_course` VALUES (97, 332, 738);
INSERT INTO `pub.teacher_course` VALUES (98, 500, 358);
INSERT INTO `pub.teacher_course` VALUES (99, 179, 224);
INSERT INTO `pub.teacher_course` VALUES (100, 703, 101);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1013 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1011, 'student1', 1);
INSERT INTO `roles` VALUES (1012, 'student2', 2);

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `problem` int NOT NULL,
  `myscore` int NOT NULL DEFAULT 0,
  `type` int NOT NULL DEFAULT 0,
  `finishtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES (1001, 1045, 1, 0, 0, '2024-10-10 12:00:00');
INSERT INTO `state` VALUES (1002, 1045, 2, 0, 0, '2024-10-10 12:00:00');
INSERT INTO `state` VALUES (1003, 1045, 3, 0, 0, '2024-10-10 12:00:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` tinyint NOT NULL,
  `btime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'u2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1046 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'root', '1', '7788iiuu', '1', 1, '2023-05-28 21:26:59', '2023-05-28 21:26:59', 'u2');
INSERT INTO `users` VALUES (1034, 'root112111', '', '7788iiuu', '', 1, '2023-05-29 06:40:39', '2023-05-29 06:40:39', 'u1034');
INSERT INTO `users` VALUES (1035, 'root2', '', '7788iiuu', '', 1, '2023-05-29 09:25:18', '2023-05-29 09:25:18', 'u1035');
INSERT INTO `users` VALUES (1036, 'root23', '', '7788iiuu', '', 1, '2023-05-29 09:49:41', '2023-05-29 09:49:41', 'u1036');
INSERT INTO `users` VALUES (1037, 'r', '', '7788iiuu', '', 1, '2023-05-29 20:57:56', '2023-05-29 20:57:56', 'u1037');
INSERT INTO `users` VALUES (1038, 'r2', '', '7788iiuu', '', 1, '2023-05-29 21:07:04', '2023-05-29 21:07:04', 'u1038');
INSERT INTO `users` VALUES (1039, 'r23', '', '7788iiuu', '', 1, '2023-05-29 21:08:43', '2023-05-29 21:08:43', 'u1039');
INSERT INTO `users` VALUES (1040, 'r233', '', '7788iiuu', '', 1, '2023-05-29 21:09:52', '2023-05-29 21:09:52', 'u1040');
INSERT INTO `users` VALUES (1041, 'r2332', '', '7788iiuu', '', 1, '2023-05-29 21:11:21', '2023-05-29 21:11:21', 'u1041');
INSERT INTO `users` VALUES (1042, 'r23324', '', '7788iiuu', '', 1, '2023-05-29 21:12:09', '2023-05-29 21:12:09', 'u1042');
INSERT INTO `users` VALUES (1043, 'r233244', '', '7788iiuu', '', 1, '2023-05-29 21:44:49', '2023-05-29 21:44:49', 'u1043');
INSERT INTO `users` VALUES (1044, 'newbee', '', '7788iiuu', '', 1, '2023-05-29 21:50:19', '2023-05-29 21:50:19', 'u1044');
INSERT INTO `users` VALUES (1045, 'newbee1', '', '7788iiuu', '', 1, '2023-05-29 21:52:13', '2023-05-29 21:52:13', 'u1045');

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80031
Source Host           : localhost:3306
Source Database       : takeout

Target Server Type    : MYSQL
Target Server Version : 80031
File Encoding         : 65001

Date: 2022-10-30 03:17:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '收货人',
  `sex` tinyint NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址管理';

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES ('1417414526093082626', '1417012167126876162', '小明', '1', '13812345678', null, null, null, null, null, null, '昌平区金燕龙办公楼', '公司', '1', '2021-07-20 17:22:12', '2021-07-20 17:26:33', '1417012167126876162', '1417012167126876162', '0');
INSERT INTO `address_book` VALUES ('1417414926166769666', '1417012167126876162', '小李', '1', '13512345678', null, null, null, null, null, null, '测试', '家', '0', '2021-07-20 17:23:47', '2021-07-20 17:23:47', '1417012167126876162', '1417012167126876162', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint NOT NULL COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1397844263642378242', '1', '湘菜', '1', '2021-05-27 09:16:58', '2021-07-15 20:25:23', '1', '1');
INSERT INTO `category` VALUES ('1397844303408574465', '1', '川菜', '2', '2021-05-27 09:17:07', '2021-06-02 14:27:22', '1', '1');
INSERT INTO `category` VALUES ('1397844391040167938', '1', '粤菜', '3', '2021-05-27 09:17:28', '2021-07-09 14:37:13', '1', '1');
INSERT INTO `category` VALUES ('1413341197421846529', '1', '饮品', '11', '2021-07-09 11:36:15', '2021-07-09 14:39:15', '1', '1');
INSERT INTO `category` VALUES ('1413342269393674242', '2', '商务套餐', '5', '2021-07-09 11:40:30', '2021-07-09 14:43:45', '1', '1');
INSERT INTO `category` VALUES ('1413384954989060097', '1', '主食', '12', '2021-07-09 14:30:07', '2021-07-09 14:39:19', '1', '1');
INSERT INTO `category` VALUES ('1413386191767674881', '2', '儿童套餐', '6', '2021-07-09 14:35:02', '2021-07-09 14:39:05', '1', '1');

-- ----------------------------
-- Table structure for code_item
-- ----------------------------
DROP TABLE IF EXISTS `code_item`;
CREATE TABLE `code_item` (
  `code` varchar(24) DEFAULT NULL COMMENT '代码',
  `code_name` varchar(100) DEFAULT NULL COMMENT '代码名称',
  `item` varchar(24) DEFAULT NULL COMMENT '代码值',
  `item_name` varchar(24) DEFAULT NULL COMMENT '代码中文',
  `isuser` int DEFAULT '1' COMMENT '是否使用标志(1可用 2不可用)',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `inputdate` datetime DEFAULT NULL COMMENT '录入日期',
  `inputuser` varchar(24) DEFAULT NULL COMMENT '录入人',
  `update_dt` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(24) DEFAULT NULL COMMENT '修改人',
  UNIQUE KEY `FK_UNION_CODE_ITEM` (`code`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of code_item
-- ----------------------------
INSERT INTO `code_item` VALUES ('AreaCode', null, '110000', '北京市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110101', '   东城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110102', '   西城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110105', '   朝阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110106', '   丰台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110107', '   石景山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110108', '   海淀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110109', '   门头沟区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110111', '   房山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110112', '   通州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110113', '   顺义区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110114', '   昌平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110115', '   大兴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110116', '   怀柔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110117', '   平谷区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110118', '   密云区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '110119', '   延庆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120000', '天津市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120101', '   和平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120102', '   河东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120103', '   河西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120104', '   南开区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120105', '   河北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120106', '   红桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120110', '   东丽区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120111', '   西青区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120112', '   津南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120113', '   北辰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120114', '   武清区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120115', '   宝坻区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120116', '   滨海新区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120117', '   宁河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120118', '   静海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '120119', '   蓟州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130000', '河北省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130100', ' 石家庄市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130102', '   长安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130104', '   桥西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130105', '   新华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130107', '   井陉矿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130108', '   裕华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130109', '   藁城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130110', '   鹿泉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130111', '   栾城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130121', '   井陉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130123', '   正定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130125', '   行唐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130126', '   灵寿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130127', '   高邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130128', '   深泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130129', '   赞皇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130130', '   无极县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130131', '   平山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130132', '   元氏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130133', '   赵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130181', '   辛集市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130183', '   晋州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130184', '   新乐市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130200', ' 唐山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130202', '   路南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130203', '   路北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130204', '   古冶区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130205', '   开平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130207', '   丰南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130208', '   丰润区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130209', '   曹妃甸区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130224', '   滦南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130225', '   乐亭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130227', '   迁西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130229', '   玉田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130281', '   遵化市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130283', '   迁安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130284', '   滦州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130300', ' 秦皇岛市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130302', '   海港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130303', '   山海关区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130304', '   北戴河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130306', '   抚宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130321', '   青龙满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130322', '   昌黎县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130324', '   卢龙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130400', ' 邯郸市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130402', '   邯山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130403', '   丛台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130404', '   复兴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130406', '   峰峰矿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130407', '   肥乡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130408', '   永年区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130423', '   临漳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130424', '   成安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130425', '   大名县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130426', '   涉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130427', '   磁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130430', '   邱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130431', '   鸡泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130432', '   广平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130433', '   馆陶县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130434', '   魏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130435', '   曲周县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130481', '   武安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130500', ' 邢台市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130502', '   襄都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130503', '   信都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130505', '   任泽区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130506', '   南和区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130522', '   临城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130523', '   内丘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130524', '   柏乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130525', '   隆尧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130528', '   宁晋县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130529', '   巨鹿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130530', '   新河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130531', '   广宗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130532', '   平乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130533', '   威县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130534', '   清河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130535', '   临西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130581', '   南宫市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130582', '   沙河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130600', ' 保定市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130602', '   竞秀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130606', '   莲池区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130607', '   满城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130608', '   清苑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130609', '   徐水区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130623', '   涞水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130624', '   阜平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130626', '   定兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130627', '   唐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130628', '   高阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130629', '   容城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130630', '   涞源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130631', '   望都县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130632', '   安新县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130633', '   易县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130634', '   曲阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130635', '   蠡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130636', '   顺平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130637', '   博野县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130638', '   雄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130681', '   涿州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130682', '   定州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130683', '   安国市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130684', '   高碑店市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130700', ' 张家口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130702', '   桥东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130703', '   桥西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130705', '   宣化区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130706', '   下花园区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130708', '   万全区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130709', '   崇礼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130722', '   张北县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130723', '   康保县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130724', '   沽源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130725', '   尚义县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130726', '   蔚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130727', '   阳原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130728', '   怀安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130730', '   怀来县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130731', '   涿鹿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130732', '   赤城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130800', ' 承德市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130802', '   双桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130803', '   双滦区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130804', '   鹰手营子矿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130821', '   承德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130822', '   兴隆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130824', '   滦平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130825', '   隆化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130826', '   丰宁满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130827', '   宽城满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130828', '   围场满族蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130881', '   平泉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130900', ' 沧州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130902', '   新华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130903', '   运河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130921', '   沧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130922', '   青县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130923', '   东光县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130924', '   海兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130925', '   盐山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130926', '   肃宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130927', '   南皮县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130928', '   吴桥县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130929', '   献县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130930', '   孟村回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130981', '   泊头市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130982', '   任丘市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130983', '   黄骅市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '130984', '   河间市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131000', ' 廊坊市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131002', '   安次区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131003', '   广阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131022', '   固安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131023', '   永清县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131024', '   香河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131025', '   大城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131026', '   文安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131028', '   大厂回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131081', '   霸州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131082', '   三河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131100', ' 衡水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131102', '   桃城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131103', '   冀州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131121', '   枣强县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131122', '   武邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131123', '   武强县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131124', '   饶阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131125', '   安平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131126', '   故城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131127', '   景县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131128', '   阜城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '131182', '   深州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140000', '山西省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140100', ' 太原市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140105', '   小店区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140106', '   迎泽区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140107', '   杏花岭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140108', '   尖草坪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140109', '   万柏林区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140110', '   晋源区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140121', '   清徐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140122', '   阳曲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140123', '   娄烦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140181', '   古交市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140200', ' 大同市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140212', '   新荣区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140213', '   平城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140214', '   云冈区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140215', '   云州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140221', '   阳高县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140222', '   天镇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140223', '   广灵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140224', '   灵丘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140225', '   浑源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140226', '   左云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140300', ' 阳泉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140302', '   城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140303', '   矿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140311', '   郊区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140321', '   平定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140322', '   盂县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140400', ' 长治市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140403', '   潞州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140404', '   上党区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140405', '   屯留区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140406', '   潞城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140423', '   襄垣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140425', '   平顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140426', '   黎城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140427', '   壶关县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140428', '   长子县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140429', '   武乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140430', '   沁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140431', '   沁源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140500', ' 晋城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140502', '   城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140521', '   沁水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140522', '   阳城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140524', '   陵川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140525', '   泽州县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140581', '   高平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140600', ' 朔州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140602', '   朔城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140603', '   平鲁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140621', '   山阴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140622', '   应县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140623', '   右玉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140681', '   怀仁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140700', ' 晋中市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140702', '   榆次区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140703', '   太谷区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140721', '   榆社县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140722', '   左权县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140723', '   和顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140724', '   昔阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140725', '   寿阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140727', '   祁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140728', '   平遥县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140729', '   灵石县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140781', '   介休市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140800', ' 运城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140802', '   盐湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140821', '   临猗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140822', '   万荣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140823', '   闻喜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140824', '   稷山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140825', '   新绛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140826', '   绛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140827', '   垣曲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140828', '   夏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140829', '   平陆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140830', '   芮城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140881', '   永济市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140882', '   河津市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140900', ' 忻州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140902', '   忻府区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140921', '   定襄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140922', '   五台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140923', '   代县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140924', '   繁峙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140925', '   宁武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140926', '   静乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140927', '   神池县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140928', '   五寨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140929', '   岢岚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140930', '   河曲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140931', '   保德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140932', '   偏关县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '140981', '   原平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141000', ' 临汾市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141002', '   尧都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141021', '   曲沃县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141022', '   翼城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141023', '   襄汾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141024', '   洪洞县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141025', '   古县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141026', '   安泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141027', '   浮山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141028', '   吉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141029', '   乡宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141030', '   大宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141031', '   隰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141032', '   永和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141033', '   蒲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141034', '   汾西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141081', '   侯马市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141082', '   霍州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141100', ' 吕梁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141102', '   离石区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141121', '   文水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141122', '   交城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141123', '   兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141124', '   临县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141125', '   柳林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141126', '   石楼县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141127', '   岚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141128', '   方山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141129', '   中阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141130', '   交口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141181', '   孝义市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '141182', '   汾阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150000', '内蒙古自治区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150100', ' 呼和浩特市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150102', '   新城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150103', '   回民区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150104', '   玉泉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150105', '   赛罕区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150121', '   土默特左旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150122', '   托克托县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150123', '   和林格尔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150124', '   清水河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150125', '   武川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150200', ' 包头市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150202', '   东河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150203', '   昆都仑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150204', '   青山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150205', '   石拐区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150206', '   白云鄂博矿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150207', '   九原区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150221', '   土默特右旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150222', '   固阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150223', '   达尔罕茂明安联合旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150300', ' 乌海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150302', '   海勃湾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150303', '   海南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150304', '   乌达区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150400', ' 赤峰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150402', '   红山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150403', '   元宝山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150404', '   松山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150421', '   阿鲁科尔沁旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150422', '   巴林左旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150423', '   巴林右旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150424', '   林西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150425', '   克什克腾旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150426', '   翁牛特旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150428', '   喀喇沁旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150429', '   宁城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150430', '   敖汉旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150500', ' 通辽市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150502', '   科尔沁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150521', '   科尔沁左翼中旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150522', '   科尔沁左翼后旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150523', '   开鲁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150524', '   库伦旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150525', '   奈曼旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150526', '   扎鲁特旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150581', '   霍林郭勒市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150600', ' 鄂尔多斯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150602', '   东胜区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150603', '   康巴什区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150621', '   达拉特旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150622', '   准格尔旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150623', '   鄂托克前旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150624', '   鄂托克旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150625', '   杭锦旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150626', '   乌审旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150627', '   伊金霍洛旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150700', ' 呼伦贝尔市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150702', '   海拉尔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150703', '   扎赉诺尔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150721', '   阿荣旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150722', '   莫力达瓦达斡尔族自治旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150723', '   鄂伦春自治旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150724', '   鄂温克族自治旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150725', '   陈巴尔虎旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150726', '   新巴尔虎左旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150727', '   新巴尔虎右旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150781', '   满洲里市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150782', '   牙克石市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150783', '   扎兰屯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150784', '   额尔古纳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150785', '   根河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150800', ' 巴彦淖尔市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150802', '   临河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150821', '   五原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150822', '   磴口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150823', '   乌拉特前旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150824', '   乌拉特中旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150825', '   乌拉特后旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150826', '   杭锦后旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150900', ' 乌兰察布市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150902', '   集宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150921', '   卓资县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150922', '   化德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150923', '   商都县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150924', '   兴和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150925', '   凉城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150926', '   察哈尔右翼前旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150927', '   察哈尔右翼中旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150928', '   察哈尔右翼后旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150929', '   四子王旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '150981', '   丰镇市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152200', ' 兴安盟', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152201', '   乌兰浩特市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152202', '   阿尔山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152221', '   科尔沁右翼前旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152222', '   科尔沁右翼中旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152223', '   扎赉特旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152224', '   突泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152500', ' 锡林郭勒盟', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152501', '   二连浩特市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152502', '   锡林浩特市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152522', '   阿巴嘎旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152523', '   苏尼特左旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152524', '   苏尼特右旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152525', '   东乌珠穆沁旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152526', '   西乌珠穆沁旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152527', '   太仆寺旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152528', '   镶黄旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152529', '   正镶白旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152530', '   正蓝旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152531', '   多伦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152900', ' 阿拉善盟', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152921', '   阿拉善左旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152922', '   阿拉善右旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '152923', '   额济纳旗', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210000', '辽宁省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210100', ' 沈阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210102', '   和平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210103', '   沈河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210104', '   大东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210105', '   皇姑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210106', '   铁西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210111', '   苏家屯区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210112', '   浑南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210113', '   沈北新区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210114', '   于洪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210115', '   辽中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210123', '   康平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210124', '   法库县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210181', '   新民市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210200', ' 大连市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210202', '   中山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210203', '   西岗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210204', '   沙河口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210211', '   甘井子区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210212', '   旅顺口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210213', '   金州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210214', '   普兰店区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210224', '   长海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210281', '   瓦房店市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210283', '   庄河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210300', ' 鞍山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210302', '   铁东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210303', '   铁西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210304', '   立山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210311', '   千山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210321', '   台安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210323', '   岫岩满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210381', '   海城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210400', ' 抚顺市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210402', '   新抚区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210403', '   东洲区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210404', '   望花区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210411', '   顺城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210421', '   抚顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210422', '   新宾满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210423', '   清原满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210500', ' 本溪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210502', '   平山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210503', '   溪湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210504', '   明山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210505', '   南芬区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210521', '   本溪满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210522', '   桓仁满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210600', ' 丹东市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210602', '   元宝区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210603', '   振兴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210604', '   振安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210624', '   宽甸满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210681', '   东港市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210682', '   凤城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210700', ' 锦州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210702', '   古塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210703', '   凌河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210711', '   太和区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210726', '   黑山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210727', '   义县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210781', '   凌海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210782', '   北镇市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210800', ' 营口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210802', '   站前区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210803', '   西市区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210804', '   鲅鱼圈区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210811', '   老边区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210881', '   盖州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210882', '   大石桥市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210900', ' 阜新市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210902', '   海州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210903', '   新邱区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210904', '   太平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210905', '   清河门区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210911', '   细河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210921', '   阜新蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '210922', '   彰武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211000', ' 辽阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211002', '   白塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211003', '   文圣区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211004', '   宏伟区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211005', '   弓长岭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211011', '   太子河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211021', '   辽阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211081', '   灯塔市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211100', ' 盘锦市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211102', '   双台子区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211103', '   兴隆台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211104', '   大洼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211122', '   盘山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211200', ' 铁岭市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211202', '   银州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211204', '   清河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211221', '   铁岭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211223', '   西丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211224', '   昌图县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211281', '   调兵山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211282', '   开原市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211300', ' 朝阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211302', '   双塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211303', '   龙城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211321', '   朝阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211322', '   建平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211324', '   喀喇沁左翼蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211381', '   北票市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211382', '   凌源市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211400', ' 葫芦岛市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211402', '   连山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211403', '   龙港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211404', '   南票区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211421', '   绥中县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211422', '   建昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '211481', '   兴城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220000', '吉林省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220100', ' 长春市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220102', '   南关区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220103', '   宽城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220104', '   朝阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220105', '   二道区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220106', '   绿园区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220112', '   双阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220113', '   九台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220122', '   农安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220182', '   榆树市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220183', '   德惠市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220184', '   公主岭市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220200', ' 吉林市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220202', '   昌邑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220203', '   龙潭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220204', '   船营区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220211', '   丰满区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220221', '   永吉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220281', '   蛟河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220282', '   桦甸市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220283', '   舒兰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220284', '   磐石市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220300', ' 四平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220302', '   铁西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220303', '   铁东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220322', '   梨树县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220323', '   伊通满族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220382', '   双辽市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220400', ' 辽源市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220402', '   龙山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220403', '   西安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220421', '   东丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220422', '   东辽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220500', ' 通化市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220502', '   东昌区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220503', '   二道江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220521', '   通化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220523', '   辉南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220524', '   柳河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220581', '   梅河口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220582', '   集安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220600', ' 白山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220602', '   浑江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220605', '   江源区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220621', '   抚松县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220622', '   靖宇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220623', '   长白朝鲜族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220681', '   临江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220700', ' 松原市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220702', '   宁江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220721', '   前郭尔罗斯蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220722', '   长岭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220723', '   乾安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220781', '   扶余市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220800', ' 白城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220802', '   洮北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220821', '   镇赉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220822', '   通榆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220881', '   洮南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '220882', '   大安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222400', ' 延边朝鲜族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222401', '   延吉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222402', '   图们市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222403', '   敦化市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222404', '   珲春市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222405', '   龙井市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222406', '   和龙市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222424', '   汪清县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '222426', '   安图县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230000', '黑龙江省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230100', ' 哈尔滨市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230102', '   道里区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230103', '   南岗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230104', '   道外区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230108', '   平房区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230109', '   松北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230110', '   香坊区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230111', '   呼兰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230112', '   阿城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230113', '   双城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230123', '   依兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230124', '   方正县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230125', '   宾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230126', '   巴彦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230127', '   木兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230128', '   通河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230129', '   延寿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230183', '   尚志市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230184', '   五常市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230200', ' 齐齐哈尔市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230202', '   龙沙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230203', '   建华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230204', '   铁锋区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230205', '   昂昂溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230206', '   富拉尔基区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230207', '   碾子山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230208', '   梅里斯达斡尔族区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230221', '   龙江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230223', '   依安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230224', '   泰来县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230225', '   甘南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230227', '   富裕县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230229', '   克山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230230', '   克东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230231', '   拜泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230281', '   讷河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230300', ' 鸡西市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230302', '   鸡冠区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230303', '   恒山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230304', '   滴道区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230305', '   梨树区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230306', '   城子河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230307', '   麻山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230321', '   鸡东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230381', '   虎林市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230382', '   密山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230400', ' 鹤岗市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230402', '   向阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230403', '   工农区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230404', '   南山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230405', '   兴安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230406', '   东山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230407', '   兴山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230421', '   萝北县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230422', '   绥滨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230500', ' 双鸭山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230502', '   尖山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230503', '   岭东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230505', '   四方台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230506', '   宝山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230521', '   集贤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230522', '   友谊县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230523', '   宝清县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230524', '   饶河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230600', ' 大庆市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230602', '   萨尔图区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230603', '   龙凤区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230604', '   让胡路区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230605', '   红岗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230606', '   大同区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230621', '   肇州县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230622', '   肇源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230623', '   林甸县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230624', '   杜尔伯特蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230700', ' 伊春市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230717', '   伊美区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230718', '   乌翠区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230719', '   友好区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230722', '   嘉荫县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230723', '   汤旺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230724', '   丰林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230725', '   大箐山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230726', '   南岔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230751', '   金林区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230781', '   铁力市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230800', ' 佳木斯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230803', '   向阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230804', '   前进区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230805', '   东风区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230811', '   郊区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230822', '   桦南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230826', '   桦川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230828', '   汤原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230881', '   同江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230882', '   富锦市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230883', '   抚远市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230900', ' 七台河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230902', '   新兴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230903', '   桃山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230904', '   茄子河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '230921', '   勃利县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231000', ' 牡丹江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231002', '   东安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231003', '   阳明区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231004', '   爱民区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231005', '   西安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231025', '   林口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231081', '   绥芬河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231083', '   海林市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231084', '   宁安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231085', '   穆棱市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231086', '   东宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231100', ' 黑河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231102', '   爱辉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231123', '   逊克县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231124', '   孙吴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231181', '   北安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231182', '   五大连池市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231183', '   嫩江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231200', ' 绥化市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231202', '   北林区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231221', '   望奎县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231222', '   兰西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231223', '   青冈县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231224', '   庆安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231225', '   明水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231226', '   绥棱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231281', '   安达市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231282', '   肇东市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '231283', '   海伦市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '232700', ' 大兴安岭地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '232701', '   漠河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '232721', '   呼玛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '232722', '   塔河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310000', '上海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310101', '   黄浦区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310104', '   徐汇区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310105', '   长宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310106', '   静安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310107', '   普陀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310109', '   虹口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310110', '   杨浦区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310112', '   闵行区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310113', '   宝山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310114', '   嘉定区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310115', '   浦东新区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310116', '   金山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310117', '   松江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310118', '   青浦区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310120', '   奉贤区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '310151', '   崇明区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320000', '江苏省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320100', ' 南京市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320102', '   玄武区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320104', '   秦淮区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320105', '   建邺区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320106', '   鼓楼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320111', '   浦口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320113', '   栖霞区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320114', '   雨花台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320115', '   江宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320116', '   六合区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320117', '   溧水区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320118', '   高淳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320200', ' 无锡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320205', '   锡山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320206', '   惠山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320211', '   滨湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320213', '   梁溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320214', '   新吴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320281', '   江阴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320282', '   宜兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320300', ' 徐州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320302', '   鼓楼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320303', '   云龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320305', '   贾汪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320311', '   泉山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320312', '   铜山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320321', '   丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320322', '   沛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320324', '   睢宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320381', '   新沂市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320382', '   邳州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320400', ' 常州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320402', '   天宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320404', '   钟楼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320411', '   新北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320412', '   武进区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320413', '   金坛区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320481', '   溧阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320500', ' 苏州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320505', '   虎丘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320506', '   吴中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320507', '   相城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320508', '   姑苏区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320509', '   吴江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320581', '   常熟市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320582', '   张家港市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320583', '   昆山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320585', '   太仓市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320600', ' 南通市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320612', '   通州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320613', '   崇川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320614', '   海门区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320623', '   如东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320681', '   启东市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320682', '   如皋市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320685', '   海安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320700', ' 连云港市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320703', '   连云区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320706', '   海州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320707', '   赣榆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320722', '   东海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320723', '   灌云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320724', '   灌南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320800', ' 淮安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320803', '   淮安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320804', '   淮阴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320812', '   清江浦区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320813', '   洪泽区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320826', '   涟水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320830', '   盱眙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320831', '   金湖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320900', ' 盐城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320902', '   亭湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320903', '   盐都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320904', '   大丰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320921', '   响水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320922', '   滨海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320923', '   阜宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320924', '   射阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320925', '   建湖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '320981', '   东台市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321000', ' 扬州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321002', '   广陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321003', '   邗江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321012', '   江都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321023', '   宝应县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321081', '   仪征市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321084', '   高邮市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321100', ' 镇江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321102', '   京口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321111', '   润州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321112', '   丹徒区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321181', '   丹阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321182', '   扬中市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321183', '   句容市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321200', ' 泰州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321202', '   海陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321203', '   高港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321204', '   姜堰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321281', '   兴化市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321282', '   靖江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321283', '   泰兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321300', ' 宿迁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321302', '   宿城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321311', '   宿豫区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321322', '   沭阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321323', '   泗阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '321324', '   泗洪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330000', '浙江省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330100', ' 杭州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330102', '   上城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330103', '   下城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330104', '   江干区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330105', '   拱墅区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330106', '   西湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330108', '   滨江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330109', '   萧山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330110', '   余杭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330111', '   富阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330112', '   临安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330122', '   桐庐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330127', '   淳安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330182', '   建德市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330200', ' 宁波市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330203', '   海曙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330205', '   江北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330206', '   北仑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330211', '   镇海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330212', '   鄞州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330213', '   奉化区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330225', '   象山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330226', '   宁海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330281', '   余姚市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330282', '   慈溪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330300', ' 温州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330302', '   鹿城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330303', '   龙湾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330304', '   瓯海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330305', '   洞头区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330324', '   永嘉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330326', '   平阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330327', '   苍南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330328', '   文成县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330329', '   泰顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330381', '   瑞安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330382', '   乐清市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330383', '   龙港市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330400', ' 嘉兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330402', '   南湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330411', '   秀洲区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330421', '   嘉善县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330424', '   海盐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330481', '   海宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330482', '   平湖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330483', '   桐乡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330500', ' 湖州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330502', '   吴兴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330503', '   南浔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330521', '   德清县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330522', '   长兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330523', '   安吉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330600', ' 绍兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330602', '   越城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330603', '   柯桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330604', '   上虞区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330624', '   新昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330681', '   诸暨市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330683', '   嵊州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330700', ' 金华市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330702', '   婺城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330703', '   金东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330723', '   武义县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330726', '   浦江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330727', '   磐安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330781', '   兰溪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330782', '   义乌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330783', '   东阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330784', '   永康市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330800', ' 衢州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330802', '   柯城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330803', '   衢江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330822', '   常山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330824', '   开化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330825', '   龙游县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330881', '   江山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330900', ' 舟山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330902', '   定海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330903', '   普陀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330921', '   岱山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '330922', '   嵊泗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331000', ' 台州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331002', '   椒江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331003', '   黄岩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331004', '   路桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331022', '   三门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331023', '   天台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331024', '   仙居县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331081', '   温岭市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331082', '   临海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331083', '   玉环市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331100', ' 丽水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331102', '   莲都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331121', '   青田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331122', '   缙云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331123', '   遂昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331124', '   松阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331125', '   云和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331126', '   庆元县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331127', '   景宁畲族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '331181', '   龙泉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340000', '安徽省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340100', ' 合肥市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340102', '   瑶海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340103', '   庐阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340104', '   蜀山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340111', '   包河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340121', '   长丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340122', '   肥东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340123', '   肥西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340124', '   庐江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340181', '   巢湖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340200', ' 芜湖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340202', '   镜湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340207', '   鸠江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340209', '   弋江区 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340210', '   湾沚区 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340212', '   繁昌区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340223', '   南陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340281', '   无为市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340300', ' 蚌埠市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340302', '   龙子湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340303', '   蚌山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340304', '   禹会区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340311', '   淮上区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340321', '   怀远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340322', '   五河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340323', '   固镇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340400', ' 淮南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340402', '   大通区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340403', '   田家庵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340404', '   谢家集区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340405', '   八公山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340406', '   潘集区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340421', '   凤台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340422', '   寿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340500', ' 马鞍山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340503', '   花山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340504', '   雨山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340506', '   博望区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340521', '   当涂县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340522', '   含山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340523', '   和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340600', ' 淮北市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340602', '   杜集区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340603', '   相山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340604', '   烈山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340621', '   濉溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340700', ' 铜陵市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340705', '   铜官区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340706', '   义安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340711', '   郊区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340722', '   枞阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340800', ' 安庆市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340802', '   迎江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340803', '   大观区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340811', '   宜秀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340822', '   怀宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340825', '   太湖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340826', '   宿松县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340827', '   望江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340828', '   岳西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340881', '   桐城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '340882', '   潜山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341000', ' 黄山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341002', '   屯溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341003', '   黄山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341004', '   徽州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341021', '   歙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341022', '   休宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341023', '   黟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341024', '   祁门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341100', ' 滁州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341102', '   琅琊区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341103', '   南谯区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341122', '   来安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341124', '   全椒县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341125', '   定远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341126', '   凤阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341181', '   天长市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341182', '   明光市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341200', ' 阜阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341202', '   颍州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341203', '   颍东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341204', '   颍泉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341221', '   临泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341222', '   太和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341225', '   阜南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341226', '   颍上县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341282', '   界首市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341300', ' 宿州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341302', '   埇桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341321', '   砀山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341322', '   萧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341323', '   灵璧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341324', '   泗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341500', ' 六安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341502', '   金安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341503', '   裕安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341504', '   叶集区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341522', '   霍邱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341523', '   舒城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341524', '   金寨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341525', '   霍山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341600', ' 亳州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341602', '   谯城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341621', '   涡阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341622', '   蒙城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341623', '   利辛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341700', ' 池州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341702', '   贵池区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341721', '   东至县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341722', '   石台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341723', '   青阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341800', ' 宣城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341802', '   宣州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341821', '   郎溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341823', '   泾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341824', '   绩溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341825', '   旌德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341881', '   宁国市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '341882', '   广德市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350000', '福建省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350100', ' 福州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350102', '   鼓楼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350103', '   台江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350104', '   仓山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350105', '   马尾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350111', '   晋安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350112', '   长乐区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350121', '   闽侯县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350122', '   连江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350123', '   罗源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350124', '   闽清县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350125', '   永泰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350128', '   平潭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350181', '   福清市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350200', ' 厦门市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350203', '   思明区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350205', '   海沧区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350206', '   湖里区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350211', '   集美区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350212', '   同安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350213', '   翔安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350300', ' 莆田市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350302', '   城厢区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350303', '   涵江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350304', '   荔城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350305', '   秀屿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350322', '   仙游县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350400', ' 三明市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350402', '   梅列区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350403', '   三元区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350421', '   明溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350423', '   清流县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350424', '   宁化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350425', '   大田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350426', '   尤溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350427', '   沙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350428', '   将乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350429', '   泰宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350430', '   建宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350481', '   永安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350500', ' 泉州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350502', '   鲤城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350503', '   丰泽区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350504', '   洛江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350505', '   泉港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350521', '   惠安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350524', '   安溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350525', '   永春县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350526', '   德化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350527', '   金门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350581', '   石狮市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350582', '   晋江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350583', '   南安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350600', ' 漳州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350602', '   芗城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350603', '   龙文区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350622', '   云霄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350623', '   漳浦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350624', '   诏安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350625', '   长泰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350626', '   东山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350627', '   南靖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350628', '   平和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350629', '   华安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350681', '   龙海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350700', ' 南平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350702', '   延平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350703', '   建阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350721', '   顺昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350722', '   浦城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350723', '   光泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350724', '   松溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350725', '   政和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350781', '   邵武市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350782', '   武夷山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350783', '   建瓯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350800', ' 龙岩市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350802', '   新罗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350803', '   永定区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350821', '   长汀县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350823', '   上杭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350824', '   武平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350825', '   连城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350881', '   漳平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350900', ' 宁德市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350902', '   蕉城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350921', '   霞浦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350922', '   古田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350923', '   屏南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350924', '   寿宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350925', '   周宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350926', '   柘荣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350981', '   福安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '350982', '   福鼎市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360000', '江西省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360100', ' 南昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360102', '   东湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360103', '   西湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360104', '   青云谱区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360111', '   青山湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360112', '   新建区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360113', '   红谷滩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360121', '   南昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360123', '   安义县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360124', '   进贤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360200', ' 景德镇市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360202', '   昌江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360203', '   珠山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360222', '   浮梁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360281', '   乐平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360300', ' 萍乡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360302', '   安源区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360313', '   湘东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360321', '   莲花县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360322', '   上栗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360323', '   芦溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360400', ' 九江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360402', '   濂溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360403', '   浔阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360404', '   柴桑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360423', '   武宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360424', '   修水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360425', '   永修县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360426', '   德安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360428', '   都昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360429', '   湖口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360430', '   彭泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360481', '   瑞昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360482', '   共青城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360483', '   庐山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360500', ' 新余市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360502', '   渝水区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360521', '   分宜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360600', ' 鹰潭市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360602', '   月湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360603', '   余江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360681', '   贵溪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360700', ' 赣州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360702', '   章贡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360703', '   南康区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360704', '   赣县区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360722', '   信丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360723', '   大余县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360724', '   上犹县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360725', '   崇义县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360726', '   安远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360728', '   定南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360729', '   全南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360730', '   宁都县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360731', '   于都县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360732', '   兴国县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360733', '   会昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360734', '   寻乌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360735', '   石城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360781', '   瑞金市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360783', '   龙南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360800', ' 吉安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360802', '   吉州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360803', '   青原区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360821', '   吉安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360822', '   吉水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360823', '   峡江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360824', '   新干县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360825', '   永丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360826', '   泰和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360827', '   遂川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360828', '   万安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360829', '   安福县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360830', '   永新县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360881', '   井冈山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360900', ' 宜春市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360902', '   袁州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360921', '   奉新县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360922', '   万载县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360923', '   上高县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360924', '   宜丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360925', '   靖安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360926', '   铜鼓县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360981', '   丰城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360982', '   樟树市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '360983', '   高安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361000', ' 抚州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361002', '   临川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361003', '   东乡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361021', '   南城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361022', '   黎川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361023', '   南丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361024', '   崇仁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361025', '   乐安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361026', '   宜黄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361027', '   金溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361028', '   资溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361030', '   广昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361100', ' 上饶市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361102', '   信州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361103', '   广丰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361104', '   广信区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361123', '   玉山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361124', '   铅山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361125', '   横峰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361126', '   弋阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361127', '   余干县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361128', '   鄱阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361129', '   万年县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361130', '   婺源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '361181', '   德兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370000', '山东省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370100', ' 济南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370102', '   历下区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370103', '   市中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370104', '   槐荫区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370105', '   天桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370112', '   历城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370113', '   长清区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370114', '   章丘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370115', '   济阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370116', '   莱芜区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370117', '   钢城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370124', '   平阴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370126', '   商河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370200', ' 青岛市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370202', '   市南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370203', '   市北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370211', '   黄岛区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370212', '   崂山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370213', '   李沧区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370214', '   城阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370215', '   即墨区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370281', '   胶州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370283', '   平度市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370285', '   莱西市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370300', ' 淄博市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370302', '   淄川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370303', '   张店区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370304', '   博山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370305', '   临淄区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370306', '   周村区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370321', '   桓台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370322', '   高青县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370323', '   沂源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370400', ' 枣庄市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370402', '   市中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370403', '   薛城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370404', '   峄城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370405', '   台儿庄区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370406', '   山亭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370481', '   滕州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370500', ' 东营市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370502', '   东营区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370503', '   河口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370505', '   垦利区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370522', '   利津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370523', '   广饶县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370600', ' 烟台市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370602', '   芝罘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370611', '   福山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370612', '   牟平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370613', '   莱山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370614', '   蓬莱区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370681', '   龙口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370682', '   莱阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370683', '   莱州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370685', '   招远市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370686', '   栖霞市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370687', '   海阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370700', ' 潍坊市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370702', '   潍城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370703', '   寒亭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370704', '   坊子区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370705', '   奎文区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370724', '   临朐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370725', '   昌乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370781', '   青州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370782', '   诸城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370783', '   寿光市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370784', '   安丘市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370785', '   高密市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370786', '   昌邑市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370800', ' 济宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370811', '   任城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370812', '   兖州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370826', '   微山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370827', '   鱼台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370828', '   金乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370829', '   嘉祥县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370830', '   汶上县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370831', '   泗水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370832', '   梁山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370881', '   曲阜市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370883', '   邹城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370900', ' 泰安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370902', '   泰山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370911', '   岱岳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370921', '   宁阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370923', '   东平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370982', '   新泰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '370983', '   肥城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371000', ' 威海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371002', '   环翠区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371003', '   文登区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371082', '   荣成市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371083', '   乳山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371100', ' 日照市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371102', '   东港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371103', '   岚山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371121', '   五莲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371122', '   莒县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371300', ' 临沂市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371302', '   兰山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371311', '   罗庄区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371312', '   河东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371321', '   沂南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371322', '   郯城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371323', '   沂水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371324', '   兰陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371325', '   费县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371326', '   平邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371327', '   莒南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371328', '   蒙阴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371329', '   临沭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371400', ' 德州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371402', '   德城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371403', '   陵城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371422', '   宁津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371423', '   庆云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371424', '   临邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371425', '   齐河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371426', '   平原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371427', '   夏津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371428', '   武城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371481', '   乐陵市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371482', '   禹城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371500', ' 聊城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371502', '   东昌府区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371503', '   茌平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371521', '   阳谷县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371522', '   莘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371524', '   东阿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371525', '   冠县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371526', '   高唐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371581', '   临清市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371600', ' 滨州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371602', '   滨城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371603', '   沾化区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371621', '   惠民县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371622', '   阳信县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371623', '   无棣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371625', '   博兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371681', '   邹平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371700', ' 菏泽市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371702', '   牡丹区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371703', '   定陶区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371721', '   曹县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371722', '   单县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371723', '   成武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371724', '   巨野县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371725', '   郓城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371726', '   鄄城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '371728', '   东明县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410000', '河南省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410100', ' 郑州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410102', '   中原区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410103', '   二七区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410104', '   管城回族区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410105', '   金水区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410106', '   上街区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410108', '   惠济区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410122', '   中牟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410181', '   巩义市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410182', '   荥阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410183', '   新密市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410184', '   新郑市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410185', '   登封市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410200', ' 开封市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410202', '   龙亭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410203', '   顺河回族区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410204', '   鼓楼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410205', '   禹王台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410212', '   祥符区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410221', '   杞县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410222', '   通许县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410223', '   尉氏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410225', '   兰考县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410300', ' 洛阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410302', '   老城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410303', '   西工区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410304', '   瀍河回族区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410305', '   涧西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410306', '   吉利区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410311', '   洛龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410322', '   孟津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410323', '   新安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410324', '   栾川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410325', '   嵩县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410326', '   汝阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410327', '   宜阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410328', '   洛宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410329', '   伊川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410381', '   偃师市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410400', ' 平顶山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410402', '   新华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410403', '   卫东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410404', '   石龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410411', '   湛河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410421', '   宝丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410422', '   叶县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410423', '   鲁山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410425', '   郏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410481', '   舞钢市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410482', '   汝州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410500', ' 安阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410502', '   文峰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410503', '   北关区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410505', '   殷都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410506', '   龙安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410522', '   安阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410523', '   汤阴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410526', '   滑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410527', '   内黄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410581', '   林州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410600', ' 鹤壁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410602', '   鹤山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410603', '   山城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410611', '   淇滨区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410621', '   浚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410622', '   淇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410700', ' 新乡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410702', '   红旗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410703', '   卫滨区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410704', '   凤泉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410711', '   牧野区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410721', '   新乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410724', '   获嘉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410725', '   原阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410726', '   延津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410727', '   封丘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410781', '   卫辉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410782', '   辉县市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410783', '   长垣市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410800', ' 焦作市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410802', '   解放区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410803', '   中站区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410804', '   马村区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410811', '   山阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410821', '   修武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410822', '   博爱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410823', '   武陟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410825', '   温县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410882', '   沁阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410883', '   孟州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410900', ' 濮阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410902', '   华龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410922', '   清丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410923', '   南乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410926', '   范县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410927', '   台前县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '410928', '   濮阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411000', ' 许昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411002', '   魏都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411003', '   建安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411024', '   鄢陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411025', '   襄城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411081', '   禹州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411082', '   长葛市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411100', ' 漯河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411102', '   源汇区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411103', '   郾城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411104', '   召陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411121', '   舞阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411122', '   临颍县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411200', ' 三门峡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411202', '   湖滨区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411203', '   陕州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411221', '   渑池县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411224', '   卢氏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411281', '   义马市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411282', '   灵宝市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411300', ' 南阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411302', '   宛城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411303', '   卧龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411321', '   南召县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411322', '   方城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411323', '   西峡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411324', '   镇平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411325', '   内乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411326', '   淅川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411327', '   社旗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411328', '   唐河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411329', '   新野县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411330', '   桐柏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411381', '   邓州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411400', ' 商丘市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411402', '   梁园区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411403', '   睢阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411421', '   民权县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411422', '   睢县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411423', '   宁陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411424', '   柘城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411425', '   虞城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411426', '   夏邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411481', '   永城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411500', ' 信阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411502', '   浉河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411503', '   平桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411521', '   罗山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411522', '   光山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411523', '   新县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411524', '   商城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411525', '   固始县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411526', '   潢川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411527', '   淮滨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411528', '   息县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411600', ' 周口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411602', '   川汇区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411603', '   淮阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411621', '   扶沟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411622', '   西华县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411623', '   商水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411624', '   沈丘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411625', '   郸城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411627', '   太康县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411628', '   鹿邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411681', '   项城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411700', ' 驻马店市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411702', '   驿城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411721', '   西平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411722', '   上蔡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411723', '   平舆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411724', '   正阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411725', '   确山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411726', '   泌阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411727', '   汝南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411728', '   遂平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '411729', '   新蔡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '419001', '   济源市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420000', '湖北省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420100', ' 武汉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420102', '   江岸区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420103', '   江汉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420104', '   硚口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420105', '   汉阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420106', '   武昌区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420107', '   青山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420111', '   洪山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420112', '   东西湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420113', '   汉南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420114', '   蔡甸区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420115', '   江夏区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420116', '   黄陂区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420117', '   新洲区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420200', ' 黄石市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420202', '   黄石港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420203', '   西塞山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420204', '   下陆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420205', '   铁山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420222', '   阳新县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420281', '   大冶市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420300', ' 十堰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420302', '   茅箭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420303', '   张湾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420304', '   郧阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420322', '   郧西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420323', '   竹山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420324', '   竹溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420325', '   房县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420381', '   丹江口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420500', ' 宜昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420502', '   西陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420503', '   伍家岗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420504', '   点军区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420505', '   猇亭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420506', '   夷陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420525', '   远安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420526', '   兴山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420527', '   秭归县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420528', '   长阳土家族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420529', '   五峰土家族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420581', '   宜都市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420582', '   当阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420583', '   枝江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420600', ' 襄阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420602', '   襄城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420606', '   樊城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420607', '   襄州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420624', '   南漳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420625', '   谷城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420626', '   保康县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420682', '   老河口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420683', '   枣阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420684', '   宜城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420700', ' 鄂州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420702', '   梁子湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420703', '   华容区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420704', '   鄂城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420800', ' 荆门市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420802', '   东宝区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420804', '   掇刀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420822', '   沙洋县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420881', '   钟祥市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420882', '   京山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420900', ' 孝感市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420902', '   孝南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420921', '   孝昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420922', '   大悟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420923', '   云梦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420981', '   应城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420982', '   安陆市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '420984', '   汉川市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421000', ' 荆州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421002', '   沙市区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421003', '   荆州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421022', '   公安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421024', '   江陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421081', '   石首市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421083', '   洪湖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421087', '   松滋市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421088', '   监利市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421100', ' 黄冈市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421102', '   黄州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421121', '   团风县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421122', '   红安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421123', '   罗田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421124', '   英山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421125', '   浠水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421126', '   蕲春县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421127', '   黄梅县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421181', '   麻城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421182', '   武穴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421200', ' 咸宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421202', '   咸安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421221', '   嘉鱼县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421222', '   通城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421223', '   崇阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421224', '   通山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421281', '   赤壁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421300', ' 随州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421303', '   曾都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421321', '   随县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '421381', '   广水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422800', ' 恩施土家族苗族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422801', '   恩施市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422802', '   利川市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422822', '   建始县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422823', '   巴东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422825', '   宣恩县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422826', '   咸丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422827', '   来凤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '422828', '   鹤峰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '429004', '   仙桃市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '429005', '   潜江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '429006', '   天门市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '429021', '   神农架林区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430000', '湖南省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430100', ' 长沙市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430102', '   芙蓉区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430103', '   天心区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430104', '   岳麓区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430105', '   开福区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430111', '   雨花区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430112', '   望城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430121', '   长沙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430181', '   浏阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430182', '   宁乡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430200', ' 株洲市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430202', '   荷塘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430203', '   芦淞区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430204', '   石峰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430211', '   天元区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430212', '   渌口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430223', '   攸县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430224', '   茶陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430225', '   炎陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430281', '   醴陵市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430300', ' 湘潭市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430302', '   雨湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430304', '   岳塘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430321', '   湘潭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430381', '   湘乡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430382', '   韶山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430400', ' 衡阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430405', '   珠晖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430406', '   雁峰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430407', '   石鼓区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430408', '   蒸湘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430412', '   南岳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430421', '   衡阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430422', '   衡南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430423', '   衡山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430424', '   衡东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430426', '   祁东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430481', '   耒阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430482', '   常宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430500', ' 邵阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430502', '   双清区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430503', '   大祥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430511', '   北塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430522', '   新邵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430523', '   邵阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430524', '   隆回县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430525', '   洞口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430527', '   绥宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430528', '   新宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430529', '   城步苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430581', '   武冈市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430582', '   邵东市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430600', ' 岳阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430602', '   岳阳楼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430603', '   云溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430611', '   君山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430621', '   岳阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430623', '   华容县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430624', '   湘阴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430626', '   平江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430681', '   汨罗市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430682', '   临湘市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430700', ' 常德市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430702', '   武陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430703', '   鼎城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430721', '   安乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430722', '   汉寿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430723', '   澧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430724', '   临澧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430725', '   桃源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430726', '   石门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430781', '   津市市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430800', ' 张家界市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430802', '   永定区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430811', '   武陵源区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430821', '   慈利县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430822', '   桑植县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430900', ' 益阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430902', '   资阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430903', '   赫山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430921', '   南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430922', '   桃江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430923', '   安化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '430981', '   沅江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431000', ' 郴州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431002', '   北湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431003', '   苏仙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431021', '   桂阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431022', '   宜章县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431023', '   永兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431024', '   嘉禾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431025', '   临武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431026', '   汝城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431027', '   桂东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431028', '   安仁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431081', '   资兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431100', ' 永州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431102', '   零陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431103', '   冷水滩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431121', '   祁阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431122', '   东安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431123', '   双牌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431124', '   道县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431125', '   江永县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431126', '   宁远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431127', '   蓝山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431128', '   新田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431129', '   江华瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431200', ' 怀化市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431202', '   鹤城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431221', '   中方县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431222', '   沅陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431223', '   辰溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431224', '   溆浦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431225', '   会同县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431226', '   麻阳苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431227', '   新晃侗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431228', '   芷江侗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431229', '   靖州苗族侗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431230', '   通道侗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431281', '   洪江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431300', ' 娄底市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431302', '   娄星区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431321', '   双峰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431322', '   新化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431381', '   冷水江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '431382', '   涟源市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433100', ' 湘西土家族苗族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433101', '   吉首市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433122', '   泸溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433123', '   凤凰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433124', '   花垣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433125', '   保靖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433126', '   古丈县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433127', '   永顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '433130', '   龙山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440000', '广东省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440100', ' 广州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440103', '   荔湾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440104', '   越秀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440105', '   海珠区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440106', '   天河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440111', '   白云区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440112', '   黄埔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440113', '   番禺区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440114', '   花都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440115', '   南沙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440117', '   从化区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440118', '   增城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440200', ' 韶关市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440203', '   武江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440204', '   浈江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440205', '   曲江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440222', '   始兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440224', '   仁化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440229', '   翁源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440232', '   乳源瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440233', '   新丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440281', '   乐昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440282', '   南雄市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440300', ' 深圳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440303', '   罗湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440304', '   福田区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440305', '   南山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440306', '   宝安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440307', '   龙岗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440308', '   盐田区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440309', '   龙华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440310', '   坪山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440311', '   光明区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440400', ' 珠海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440402', '   香洲区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440403', '   斗门区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440404', '   金湾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440500', ' 汕头市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440507', '   龙湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440511', '   金平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440512', '   濠江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440513', '   潮阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440514', '   潮南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440515', '   澄海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440523', '   南澳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440600', ' 佛山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440604', '   禅城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440605', '   南海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440606', '   顺德区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440607', '   三水区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440608', '   高明区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440700', ' 江门市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440703', '   蓬江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440704', '   江海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440705', '   新会区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440781', '   台山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440783', '   开平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440784', '   鹤山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440785', '   恩平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440800', ' 湛江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440802', '   赤坎区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440803', '   霞山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440804', '   坡头区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440811', '   麻章区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440823', '   遂溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440825', '   徐闻县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440881', '   廉江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440882', '   雷州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440883', '   吴川市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440900', ' 茂名市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440902', '   茂南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440904', '   电白区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440981', '   高州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440982', '   化州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '440983', '   信宜市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441200', ' 肇庆市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441202', '   端州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441203', '   鼎湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441204', '   高要区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441223', '   广宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441224', '   怀集县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441225', '   封开县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441226', '   德庆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441284', '   四会市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441300', ' 惠州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441302', '   惠城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441303', '   惠阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441322', '   博罗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441323', '   惠东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441324', '   龙门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441400', ' 梅州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441402', '   梅江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441403', '   梅县区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441422', '   大埔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441423', '   丰顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441424', '   五华县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441426', '   平远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441427', '   蕉岭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441481', '   兴宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441500', ' 汕尾市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441502', '   城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441521', '   海丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441523', '   陆河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441581', '   陆丰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441600', ' 河源市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441602', '   源城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441621', '   紫金县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441622', '   龙川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441623', '   连平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441624', '   和平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441625', '   东源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441700', ' 阳江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441702', '   江城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441704', '   阳东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441721', '   阳西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441781', '   阳春市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441800', ' 清远市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441802', '   清城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441803', '   清新区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441821', '   佛冈县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441823', '   阳山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441825', '   连山壮族瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441826', '   连南瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441881', '   英德市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441882', '   连州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '441900', ' 东莞市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '442000', ' 中山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445100', ' 潮州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445102', '   湘桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445103', '   潮安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445122', '   饶平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445200', ' 揭阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445202', '   榕城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445203', '   揭东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445222', '   揭西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445224', '   惠来县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445281', '   普宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445300', ' 云浮市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445302', '   云城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445303', '   云安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445321', '   新兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445322', '   郁南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '445381', '   罗定市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450000', '广西壮族自治区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450100', ' 南宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450102', '   兴宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450103', '   青秀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450105', '   江南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450107', '   西乡塘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450108', '   良庆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450109', '   邕宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450110', '   武鸣区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450123', '   隆安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450124', '   马山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450125', '   上林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450126', '   宾阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450127', '   横县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450200', ' 柳州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450202', '   城中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450203', '   鱼峰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450204', '   柳南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450205', '   柳北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450206', '   柳江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450222', '   柳城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450223', '   鹿寨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450224', '   融安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450225', '   融水苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450226', '   三江侗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450300', ' 桂林市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450302', '   秀峰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450303', '   叠彩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450304', '   象山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450305', '   七星区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450311', '   雁山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450312', '   临桂区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450321', '   阳朔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450323', '   灵川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450324', '   全州县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450325', '   兴安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450326', '   永福县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450327', '   灌阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450328', '   龙胜各族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450329', '   资源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450330', '   平乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450332', '   恭城瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450381', '   荔浦市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450400', ' 梧州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450403', '   万秀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450405', '   长洲区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450406', '   龙圩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450421', '   苍梧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450422', '   藤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450423', '   蒙山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450481', '   岑溪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450500', ' 北海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450502', '   海城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450503', '   银海区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450512', '   铁山港区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450521', '   合浦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450600', ' 防城港市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450602', '   港口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450603', '   防城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450621', '   上思县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450681', '   东兴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450700', ' 钦州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450702', '   钦南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450703', '   钦北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450721', '   灵山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450722', '   浦北县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450800', ' 贵港市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450802', '   港北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450803', '   港南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450804', '   覃塘区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450821', '   平南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450881', '   桂平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450900', ' 玉林市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450902', '   玉州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450903', '   福绵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450921', '   容县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450922', '   陆川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450923', '   博白县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450924', '   兴业县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '450981', '   北流市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451000', ' 百色市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451002', '   右江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451003', '   田阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451022', '   田东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451024', '   德保县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451026', '   那坡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451027', '   凌云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451028', '   乐业县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451029', '   田林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451030', '   西林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451031', '   隆林各族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451081', '   靖西市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451082', '   平果市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451100', ' 贺州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451102', '   八步区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451103', '   平桂区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451121', '   昭平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451122', '   钟山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451123', '   富川瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451200', ' 河池市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451202', '   金城江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451203', '   宜州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451221', '   南丹县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451222', '   天峨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451223', '   凤山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451224', '   东兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451225', '   罗城仫佬族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451226', '   环江毛南族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451227', '   巴马瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451228', '   都安瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451229', '   大化瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451300', ' 来宾市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451302', '   兴宾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451321', '   忻城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451322', '   象州县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451323', '   武宣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451324', '   金秀瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451381', '   合山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451400', ' 崇左市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451402', '   江州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451421', '   扶绥县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451422', '   宁明县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451423', '   龙州县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451424', '   大新县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451425', '   天等县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '451481', '   凭祥市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460000', '海南省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460100', ' 海口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460105', '   秀英区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460106', '   龙华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460107', '   琼山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460108', '   美兰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460200', ' 三亚市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460202', '   海棠区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460203', '   吉阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460204', '   天涯区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460205', '   崖州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '460300', ' 三沙市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '', '   西沙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469002', '   琼海市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469005', '   文昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469006', '   万宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469007', '   东方市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469021', '   定安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469022', '   屯昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469023', '   澄迈县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469024', '   临高县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469025', '   白沙黎族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469026', '   昌江黎族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469027', '   乐东黎族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469028', '   陵水黎族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469029', '   保亭黎族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '469030', '   琼中黎族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500000', '重庆市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500101', '   万州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500102', '   涪陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500103', '   渝中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500104', '   大渡口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500105', '   江北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500106', '   沙坪坝区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500107', '   九龙坡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500108', '   南岸区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500109', '   北碚区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500110', '   綦江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500111', '   大足区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500112', '   渝北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500113', '   巴南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500114', '   黔江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500115', '   长寿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500116', '   江津区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500117', '   合川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500118', '   永川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500119', '   南川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500120', '   璧山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500151', '   铜梁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500152', '   潼南区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500153', '   荣昌区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500154', '   开州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500155', '   梁平区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500156', '   武隆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500229', '   城口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500230', '   丰都县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500231', '   垫江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500233', '   忠县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500235', '   云阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500236', '   奉节县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500237', '   巫山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500238', '   巫溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500240', '   石柱土家族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500241', '   秀山土家族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500242', '   酉阳土家族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '500243', '   彭水苗族土家族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510000', '四川省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510100', ' 成都市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510104', '   锦江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510105', '   青羊区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510106', '   金牛区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510107', '   武侯区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510108', '   成华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510112', '   龙泉驿区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510113', '   青白江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510114', '   新都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510115', '   温江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510116', '   双流区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510117', '   郫都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510118', '   新津区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510121', '   金堂县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510129', '   大邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510131', '   蒲江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510181', '   都江堰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510182', '   彭州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510183', '   邛崃市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510184', '   崇州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510185', '   简阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510300', ' 自贡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510302', '   自流井区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510303', '   贡井区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510304', '   大安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510311', '   沿滩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510321', '   荣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510322', '   富顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510400', ' 攀枝花市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510402', '   东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510403', '   西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510411', '   仁和区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510421', '   米易县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510422', '   盐边县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510500', ' 泸州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510502', '   江阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510503', '   纳溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510504', '   龙马潭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510521', '   泸县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510522', '   合江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510524', '   叙永县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510525', '   古蔺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510600', ' 德阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510603', '   旌阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510604', '   罗江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510623', '   中江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510681', '   广汉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510682', '   什邡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510683', '   绵竹市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510700', ' 绵阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510703', '   涪城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510704', '   游仙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510705', '   安州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510722', '   三台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510723', '   盐亭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510725', '   梓潼县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510726', '   北川羌族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510727', '   平武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510781', '   江油市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510800', ' 广元市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510802', '   利州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510811', '   昭化区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510812', '   朝天区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510821', '   旺苍县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510822', '   青川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510823', '   剑阁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510824', '   苍溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510900', ' 遂宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510903', '   船山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510904', '   安居区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510921', '   蓬溪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510923', '   大英县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '510981', '   射洪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511000', ' 内江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511002', '   市中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511011', '   东兴区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511024', '   威远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511025', '   资中县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511083', '   隆昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511100', ' 乐山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511102', '   市中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511111', '   沙湾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511112', '   五通桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511113', '   金口河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511123', '   犍为县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511124', '   井研县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511126', '   夹江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511129', '   沐川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511132', '   峨边彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511133', '   马边彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511181', '   峨眉山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511300', ' 南充市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511302', '   顺庆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511303', '   高坪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511304', '   嘉陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511321', '   南部县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511322', '   营山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511323', '   蓬安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511324', '   仪陇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511325', '   西充县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511381', '   阆中市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511400', ' 眉山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511402', '   东坡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511403', '   彭山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511421', '   仁寿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511423', '   洪雅县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511424', '   丹棱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511425', '   青神县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511500', ' 宜宾市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511502', '   翠屏区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511503', '   南溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511504', '   叙州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511523', '   江安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511524', '   长宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511525', '   高县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511526', '   珙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511527', '   筠连县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511528', '   兴文县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511529', '   屏山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511600', ' 广安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511602', '   广安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511603', '   前锋区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511621', '   岳池县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511622', '   武胜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511623', '   邻水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511681', '   华蓥市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511700', ' 达州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511702', '   通川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511703', '   达川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511722', '   宣汉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511723', '   开江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511724', '   大竹县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511725', '   渠县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511781', '   万源市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511800', ' 雅安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511802', '   雨城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511803', '   名山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511822', '   荥经县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511823', '   汉源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511824', '   石棉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511825', '   天全县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511826', '   芦山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511827', '   宝兴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511900', ' 巴中市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511902', '   巴州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511903', '   恩阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511921', '   通江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511922', '   南江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '511923', '   平昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '512000', ' 资阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '512002', '   雁江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '512021', '   安岳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '512022', '   乐至县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513200', ' 阿坝藏族羌族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513201', '   马尔康市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513221', '   汶川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513222', '   理县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513223', '   茂县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513224', '   松潘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513225', '   九寨沟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513226', '   金川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513227', '   小金县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513228', '   黑水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513230', '   壤塘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513231', '   阿坝县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513232', '   若尔盖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513233', '   红原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513300', ' 甘孜藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513301', '   康定市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513322', '   泸定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513323', '   丹巴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513324', '   九龙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513325', '   雅江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513326', '   道孚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513327', '   炉霍县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513328', '   甘孜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513329', '   新龙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513330', '   德格县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513331', '   白玉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513332', '   石渠县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513333', '   色达县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513334', '   理塘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513335', '   巴塘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513336', '   乡城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513337', '   稻城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513338', '   得荣县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513400', ' 凉山彝族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513401', '   西昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513422', '   木里藏族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513423', '   盐源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513424', '   德昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513425', '   会理县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513426', '   会东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513427', '   宁南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513428', '   普格县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513429', '   布拖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513430', '   金阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513431', '   昭觉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513432', '   喜德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513433', '   冕宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513434', '   越西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513435', '   甘洛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513436', '   美姑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '513437', '   雷波县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520000', '贵州省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520100', ' 贵阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520102', '   南明区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520103', '   云岩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520111', '   花溪区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520112', '   乌当区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520113', '   白云区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520115', '   观山湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520121', '   开阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520122', '   息烽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520123', '   修文县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520181', '   清镇市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520200', ' 六盘水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520201', '   钟山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520203', '   六枝特区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520204', '   水城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520281', '   盘州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520300', ' 遵义市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520302', '   红花岗区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520303', '   汇川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520304', '   播州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520322', '   桐梓县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520323', '   绥阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520324', '   正安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520325', '   道真仡佬族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520326', '   务川仡佬族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520327', '   凤冈县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520328', '   湄潭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520329', '   余庆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520330', '   习水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520381', '   赤水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520382', '   仁怀市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520400', ' 安顺市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520402', '   西秀区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520403', '   平坝区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520422', '   普定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520423', '   镇宁布依族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520424', '   关岭布依族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520425', '   紫云苗族布依族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520500', ' 毕节市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520502', '   七星关区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520521', '   大方县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520522', '   黔西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520523', '   金沙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520524', '   织金县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520525', '   纳雍县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520526', '   威宁彝族回族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520527', '   赫章县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520600', ' 铜仁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520602', '   碧江区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520603', '   万山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520621', '   江口县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520622', '   玉屏侗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520623', '   石阡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520624', '   思南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520625', '   印江土家族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520626', '   德江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520627', '   沿河土家族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '520628', '   松桃苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522300', ' 黔西南布依族苗族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522301', '   兴义市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522302', '   兴仁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522323', '   普安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522324', '   晴隆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522325', '   贞丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522326', '   望谟县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522327', '   册亨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522328', '   安龙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522600', ' 黔东南苗族侗族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522601', '   凯里市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522622', '   黄平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522623', '   施秉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522624', '   三穗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522625', '   镇远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522626', '   岑巩县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522627', '   天柱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522628', '   锦屏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522629', '   剑河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522630', '   台江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522631', '   黎平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522632', '   榕江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522633', '   从江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522634', '   雷山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522635', '   麻江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522636', '   丹寨县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522700', ' 黔南布依族苗族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522701', '   都匀市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522702', '   福泉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522722', '   荔波县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522723', '   贵定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522725', '   瓮安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522726', '   独山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522727', '   平塘县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522728', '   罗甸县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522729', '   长顺县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522730', '   龙里县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522731', '   惠水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '522732', '   三都水族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530000', '云南省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530100', ' 昆明市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530102', '   五华区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530103', '   盘龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530111', '   官渡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530112', '   西山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530113', '   东川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530114', '   呈贡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530115', '   晋宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530124', '   富民县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530125', '   宜良县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530126', '   石林彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530127', '   嵩明县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530128', '   禄劝彝族苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530129', '   寻甸回族彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530181', '   安宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530300', ' 曲靖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530302', '   麒麟区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530303', '   沾益区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530304', '   马龙区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530322', '   陆良县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530323', '   师宗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530324', '   罗平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530325', '   富源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530326', '   会泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530381', '   宣威市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530400', ' 玉溪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530402', '   红塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530403', '   江川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530423', '   通海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530424', '   华宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530425', '   易门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530426', '   峨山彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530427', '   新平彝族傣族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530428', '   元江哈尼族彝族傣族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530481', '   澄江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530500', ' 保山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530502', '   隆阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530521', '   施甸县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530523', '   龙陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530524', '   昌宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530581', '   腾冲市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530600', ' 昭通市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530602', '   昭阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530621', '   鲁甸县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530622', '   巧家县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530623', '   盐津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530624', '   大关县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530625', '   永善县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530626', '   绥江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530627', '   镇雄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530628', '   彝良县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530629', '   威信县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530681', '   水富市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530700', ' 丽江市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530702', '   古城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530721', '   玉龙纳西族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530722', '   永胜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530723', '   华坪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530724', '   宁蒗彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530800', ' 普洱市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530802', '   思茅区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530821', '   宁洱哈尼族彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530822', '   墨江哈尼族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530823', '   景东彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530824', '   景谷傣族彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530825', '   镇沅彝族哈尼族拉祜族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530826', '   江城哈尼族彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530827', '   孟连傣族拉祜族佤族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530828', '   澜沧拉祜族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530829', '   西盟佤族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530900', ' 临沧市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530902', '   临翔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530921', '   凤庆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530922', '   云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530923', '   永德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530924', '   镇康县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530925', '   双江拉祜族佤族布朗族傣族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530926', '   耿马傣族佤族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '530927', '   沧源佤族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532300', ' 楚雄彝族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532301', '   楚雄市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532322', '   双柏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532323', '   牟定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532324', '   南华县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532325', '   姚安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532326', '   大姚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532327', '   永仁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532328', '   元谋县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532329', '   武定县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532331', '   禄丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532500', ' 红河哈尼族彝族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532501', '   个旧市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532502', '   开远市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532503', '   蒙自市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532504', '   弥勒市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532523', '   屏边苗族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532524', '   建水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532525', '   石屏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532527', '   泸西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532528', '   元阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532529', '   红河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532530', '   金平苗族瑶族傣族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532531', '   绿春县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532532', '   河口瑶族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532600', ' 文山壮族苗族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532601', '   文山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532622', '   砚山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532623', '   西畴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532624', '   麻栗坡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532625', '   马关县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532626', '   丘北县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532627', '   广南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532628', '   富宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532800', ' 西双版纳傣族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532801', '   景洪市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532822', '   勐海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532823', '   勐腊县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532900', ' 大理白族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532901', '   大理市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532922', '   漾濞彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532923', '   祥云县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532924', '   宾川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532925', '   弥渡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532926', '   南涧彝族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532927', '   巍山彝族回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532928', '   永平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532929', '   云龙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532930', '   洱源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532931', '   剑川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '532932', '   鹤庆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533100', ' 德宏傣族景颇族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533102', '   瑞丽市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533103', '   芒市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533122', '   梁河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533123', '   盈江县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533124', '   陇川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533300', ' 怒江傈僳族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533301', '   泸水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533323', '   福贡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533324', '   贡山独龙族怒族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533325', '   兰坪白族普米族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533400', ' 迪庆藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533401', '   香格里拉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533422', '   德钦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '533423', '   维西傈僳族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540000', '西藏自治区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540100', ' 拉萨市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540102', '   城关区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540103', '   堆龙德庆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540104', '   达孜区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540121', '   林周县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540122', '   当雄县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540123', '   尼木县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540124', '   曲水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540127', '   墨竹工卡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540200', ' 日喀则市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540202', '   桑珠孜区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540221', '   南木林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540222', '   江孜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540223', '   定日县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540224', '   萨迦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540225', '   拉孜县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540226', '   昂仁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540227', '   谢通门县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540228', '   白朗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540229', '   仁布县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540230', '   康马县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540231', '   定结县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540232', '   仲巴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540233', '   亚东县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540234', '   吉隆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540235', '   聂拉木县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540236', '   萨嘎县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540237', '   岗巴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540300', ' 昌都市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540302', '   卡若区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540321', '   江达县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540322', '   贡觉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540323', '   类乌齐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540324', '   丁青县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540325', '   察雅县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540326', '   八宿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540327', '   左贡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540328', '   芒康县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540329', '   洛隆县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540330', '   边坝县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540400', ' 林芝市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540402', '   巴宜区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540421', '   工布江达县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540422', '   米林县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540423', '   墨脱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540424', '   波密县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540425', '   察隅县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540426', '   朗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540500', ' 山南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540502', '   乃东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540521', '   扎囊县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540522', '   贡嘎县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540523', '   桑日县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540524', '   琼结县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540525', '   曲松县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540526', '   措美县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540527', '   洛扎县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540528', '   加查县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540529', '   隆子县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540530', '   错那县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540531', '   浪卡子县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540600', ' 那曲市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540602', '   色尼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540621', '   嘉黎县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540622', '   比如县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540623', '   聂荣县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540624', '   安多县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540625', '   申扎县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540626', '   索县   ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540627', '   班戈县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540628', '   巴青县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540629', '   尼玛县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '540630', '   双湖县 ', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542500', ' 阿里地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542521', '   普兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542522', '   札达县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542523', '   噶尔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542524', '   日土县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542525', '   革吉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542526', '   改则县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '542527', '   措勤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610000', '陕西省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610100', ' 西安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610102', '   新城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610103', '   碑林区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610104', '   莲湖区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610111', '   灞桥区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610112', '   未央区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610113', '   雁塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610114', '   阎良区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610115', '   临潼区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610116', '   长安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610117', '   高陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610118', '   鄠邑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610122', '   蓝田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610124', '   周至县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610200', ' 铜川市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610202', '   王益区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610203', '   印台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610204', '   耀州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610222', '   宜君县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610300', ' 宝鸡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610302', '   渭滨区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610303', '   金台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610304', '   陈仓区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610322', '   凤翔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610323', '   岐山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610324', '   扶风县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610326', '   眉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610327', '   陇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610328', '   千阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610329', '   麟游县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610330', '   凤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610331', '   太白县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610400', ' 咸阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610402', '   秦都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610403', '   杨陵区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610404', '   渭城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610422', '   三原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610423', '   泾阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610424', '   乾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610425', '   礼泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610426', '   永寿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610428', '   长武县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610429', '   旬邑县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610430', '   淳化县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610431', '   武功县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610481', '   兴平市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610482', '   彬州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610500', ' 渭南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610502', '   临渭区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610503', '   华州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610522', '   潼关县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610523', '   大荔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610524', '   合阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610525', '   澄城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610526', '   蒲城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610527', '   白水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610528', '   富平县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610581', '   韩城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610582', '   华阴市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610600', ' 延安市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610602', '   宝塔区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610603', '   安塞区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610621', '   延长县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610622', '   延川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610625', '   志丹县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610626', '   吴起县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610627', '   甘泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610628', '   富县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610629', '   洛川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610630', '   宜川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610631', '   黄龙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610632', '   黄陵县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610681', '   子长市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610700', ' 汉中市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610702', '   汉台区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610703', '   南郑区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610722', '   城固县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610723', '   洋县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610724', '   西乡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610725', '   勉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610726', '   宁强县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610727', '   略阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610728', '   镇巴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610729', '   留坝县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610730', '   佛坪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610800', ' 榆林市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610802', '   榆阳区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610803', '   横山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610822', '   府谷县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610824', '   靖边县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610825', '   定边县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610826', '   绥德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610827', '   米脂县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610828', '   佳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610829', '   吴堡县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610830', '   清涧县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610831', '   子洲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610881', '   神木市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610900', ' 安康市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610902', '   汉滨区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610921', '   汉阴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610922', '   石泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610923', '   宁陕县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610924', '   紫阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610925', '   岚皋县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610926', '   平利县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610927', '   镇坪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610928', '   旬阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '610929', '   白河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611000', ' 商洛市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611002', '   商州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611021', '   洛南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611022', '   丹凤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611023', '   商南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611024', '   山阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611025', '   镇安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '611026', '   柞水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620000', '甘肃省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620100', ' 兰州市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620102', '   城关区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620103', '   七里河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620104', '   西固区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620105', '   安宁区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620111', '   红古区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620121', '   永登县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620122', '   皋兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620123', '   榆中县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620200', ' 嘉峪关市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620300', ' 金昌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620302', '   金川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620321', '   永昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620400', ' 白银市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620402', '   白银区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620403', '   平川区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620421', '   靖远县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620422', '   会宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620423', '   景泰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620500', ' 天水市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620502', '   秦州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620503', '   麦积区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620521', '   清水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620522', '   秦安县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620523', '   甘谷县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620524', '   武山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620525', '   张家川回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620600', ' 武威市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620602', '   凉州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620621', '   民勤县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620622', '   古浪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620623', '   天祝藏族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620700', ' 张掖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620702', '   甘州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620721', '   肃南裕固族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620722', '   民乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620723', '   临泽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620724', '   高台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620725', '   山丹县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620800', ' 平凉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620802', '   崆峒区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620821', '   泾川县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620822', '   灵台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620823', '   崇信县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620825', '   庄浪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620826', '   静宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620881', '   华亭市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620900', ' 酒泉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620902', '   肃州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620921', '   金塔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620922', '   瓜州县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620923', '   肃北蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620924', '   阿克塞哈萨克族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620981', '   玉门市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '620982', '   敦煌市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621000', ' 庆阳市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621002', '   西峰区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621021', '   庆城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621022', '   环县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621023', '   华池县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621024', '   合水县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621025', '   正宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621026', '   宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621027', '   镇原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621100', ' 定西市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621102', '   安定区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621121', '   通渭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621122', '   陇西县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621123', '   渭源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621124', '   临洮县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621125', '   漳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621126', '   岷县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621200', ' 陇南市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621202', '   武都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621221', '   成县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621222', '   文县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621223', '   宕昌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621224', '   康县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621225', '   西和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621226', '   礼县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621227', '   徽县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '621228', '   两当县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622900', ' 临夏回族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622901', '   临夏市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622921', '   临夏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622922', '   康乐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622923', '   永靖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622924', '   广河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622925', '   和政县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622926', '   东乡族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '622927', '   积石山保安族东乡族撒拉族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623000', ' 甘南藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623001', '   合作市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623021', '   临潭县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623022', '   卓尼县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623023', '   舟曲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623024', '   迭部县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623025', '   玛曲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623026', '   碌曲县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '623027', '   夏河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630000', '青海省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630100', ' 西宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630102', '   城东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630103', '   城中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630104', '   城西区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630105', '   城北区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630106', '   湟中区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630121', '   大通回族土族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630123', '   湟源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630200', ' 海东市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630202', '   乐都区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630203', '   平安区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630222', '   民和回族土族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630223', '   互助土族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630224', '   化隆回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '630225', '   循化撒拉族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632200', ' 海北藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632221', '   门源回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632222', '   祁连县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632223', '   海晏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632224', '   刚察县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632300', ' 黄南藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632301', '   同仁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632322', '   尖扎县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632323', '   泽库县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632324', '   河南蒙古族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632500', ' 海南藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632521', '   共和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632522', '   同德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632523', '   贵德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632524', '   兴海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632525', '   贵南县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632600', ' 果洛藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632621', '   玛沁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632622', '   班玛县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632623', '   甘德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632624', '   达日县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632625', '   久治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632626', '   玛多县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632700', ' 玉树藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632701', '   玉树市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632722', '   杂多县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632723', '   称多县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632724', '   治多县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632725', '   囊谦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632726', '   曲麻莱县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632800', ' 海西蒙古族藏族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632801', '   格尔木市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632802', '   德令哈市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632803', '   茫崖市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632821', '   乌兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632822', '   都兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '632823', '   天峻县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640000', '宁夏回族自治区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640100', ' 银川市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640104', '   兴庆区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640105', '   西夏区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640106', '   金凤区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640121', '   永宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640122', '   贺兰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640181', '   灵武市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640200', ' 石嘴山市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640202', '   大武口区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640205', '   惠农区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640221', '   平罗县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640300', ' 吴忠市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640302', '   利通区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640303', '   红寺堡区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640323', '   盐池县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640324', '   同心县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640381', '   青铜峡市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640400', ' 固原市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640402', '   原州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640422', '   西吉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640423', '   隆德县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640424', '   泾源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640425', '   彭阳县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640500', ' 中卫市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640502', '   沙坡头区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640521', '   中宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '640522', '   海原县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650000', '新疆维吾尔自治区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650100', ' 乌鲁木齐市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650102', '   天山区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650103', '   沙依巴克区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650104', '   新市区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650105', '   水磨沟区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650106', '   头屯河区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650107', '   达坂城区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650109', '   米东区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650121', '   乌鲁木齐县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650200', ' 克拉玛依市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650202', '   独山子区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650203', '   克拉玛依区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650204', '   白碱滩区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650205', '   乌尔禾区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650400', ' 吐鲁番市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650402', '   高昌区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650421', '   鄯善县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650422', '   托克逊县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650500', ' 哈密市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650502', '   伊州区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650521', '   巴里坤哈萨克自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '650522', '   伊吾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652300', ' 昌吉回族自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652301', '   昌吉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652302', '   阜康市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652323', '   呼图壁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652324', '   玛纳斯县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652325', '   奇台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652327', '   吉木萨尔县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652328', '   木垒哈萨克自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652700', ' 博尔塔拉蒙古自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652701', '   博乐市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652702', '   阿拉山口市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652722', '   精河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652723', '   温泉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652800', ' 巴音郭楞蒙古自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652801', '   库尔勒市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652822', '   轮台县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652823', '   尉犁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652824', '   若羌县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652825', '   且末县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652826', '   焉耆回族自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652827', '   和静县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652828', '   和硕县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652829', '   博湖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652900', ' 阿克苏地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652901', '   阿克苏市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652902', '   库车市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652922', '   温宿县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652924', '   沙雅县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652925', '   新和县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652926', '   拜城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652927', '   乌什县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652928', '   阿瓦提县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '652929', '   柯坪县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653000', ' 克孜勒苏柯尔克孜自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653001', '   阿图什市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653022', '   阿克陶县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653023', '   阿合奇县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653024', '   乌恰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653100', ' 喀什地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653101', '   喀什市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653121', '   疏附县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653122', '   疏勒县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653123', '   英吉沙县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653124', '   泽普县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653125', '   莎车县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653126', '   叶城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653127', '   麦盖提县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653128', '   岳普湖县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653129', '   伽师县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653130', '   巴楚县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653131', '   塔什库尔干塔吉克自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653200', ' 和田地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653201', '   和田市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653221', '   和田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653222', '   墨玉县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653223', '   皮山县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653224', '   洛浦县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653225', '   策勒县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653226', '   于田县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '653227', '   民丰县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654000', ' 伊犁哈萨克自治州', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654002', '   伊宁市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654003', '   奎屯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654004', '   霍尔果斯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654021', '   伊宁县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654022', '   察布查尔锡伯自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654023', '   霍城县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654024', '   巩留县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654025', '   新源县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654026', '   昭苏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654027', '   特克斯县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654028', '   尼勒克县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654200', ' 塔城地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654201', '   塔城市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654202', '   乌苏市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654221', '   额敏县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654223', '   沙湾县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654224', '   托里县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654225', '   裕民县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654226', '   和布克赛尔蒙古自治县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654300', ' 阿勒泰地区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654301', '   阿勒泰市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654321', '   布尔津县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654322', '   富蕴县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654323', '   福海县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654324', '   哈巴河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654325', '   青河县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '654326', '   吉木乃县', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659001', '   石河子市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659002', '   阿拉尔市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659003', '   图木舒克市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659004', '   五家渠市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659005', '   北屯市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659006', '   铁门关市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659007', '   双河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659008', '   可克达拉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659009', '   昆玉市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '659010', '   胡杨河市', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '710000', '台湾省', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '810000', '香港特别行政区', '1', null, null, null, null, null);
INSERT INTO `code_item` VALUES ('AreaCode', null, '820000', '澳门特别行政区', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `status` int NOT NULL DEFAULT '1' COMMENT '0 停售 1 起售',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品管理';

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1397849739276890114', '辣子鸡', '1397844263642378242', '7800.00', '222222222', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '来自鲜嫩美味的小鸡，值得一尝', '1', '0', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850140982161409', '毛氏红烧肉', '1397844263642378242', '6800.00', '123412341234', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '毛氏红烧肉毛氏红烧肉，确定不来一份？', '1', '0', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850392090947585', '组庵鱼翅', '1397844263642378242', '4800.00', '123412341234', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '组庵鱼翅，看图足以表明好吃程度', '1', '0', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850851245600769', '霸王别姬', '1397844263642378242', '12800.00', '123412341234', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '还有什么比霸王别姬更美味的呢？', '1', '0', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851099502260226', '全家福', '1397844263642378242', '11800.00', '23412341234', 'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', '别光吃肉啦，来份全家福吧，让你长寿又美味', '1', '0', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851370462687234', '邵阳猪血丸子', '1397844263642378242', '13800.00', '1246812345678', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '看，美味不？来嘛来嘛，这才是最爱吖', '1', '0', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851668262465537', '口味蛇', '1397844263642378242', '16800.00', '1234567812345678', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '爬行界的扛把子，东兴-口味蛇，让你欲罢不能', '1', '0', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397852391150759938', '辣子鸡丁', '1397844303408574465', '8800.00', '2346812468', 'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', '辣子鸡丁，辣子鸡丁，永远的魂', '1', '0', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853183287013378', '麻辣兔头', '1397844303408574465', '19800.00', '123456787654321', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '麻辣兔头的详细制作，麻辣鲜香，色泽红润，回味悠长', '1', '0', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853709101740034', '蒜泥白肉', '1397844303408574465', '9800.00', '1234321234321', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', '多么的有食欲啊', '1', '0', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853890262118402', '鱼香肉丝', '1397844303408574465', '3800.00', '1234212321234', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', '鱼香肉丝简直就是我们童年回忆的一道经典菜，上学的时候点个鱼香肉丝盖饭坐在宿舍床上看着肥皂剧，绝了！现在完美复刻一下上学的时候感觉', '1', '0', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854652581064706', '麻辣水煮鱼', '1397844303408574465', '14800.00', '2345312·345321', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '鱼片是买的切好的鱼片，放几个虾，增加味道', '1', '0', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854865672679425', '鱼香炒鸡蛋', '1397844303408574465', '2000.00', '23456431·23456', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '鱼香菜也是川味的特色。里面没有鱼却鱼香味', '1', '0', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860242057375745', '脆皮烧鹅', '1397844391040167938', '12800.00', '123456786543213456', 'e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', '“广东烤鸭美而香，却胜烧鹅说古冈（今新会），燕瘦环肥各佳妙，君休偏重便宜坊”，可见烧鹅与烧鸭在粤菜之中已早负盛名。作为广州最普遍和最受欢迎的烧烤肉食，以它的“色泽金红，皮脆肉嫩，味香可口”的特色，在省城各大街小巷的烧卤店随处可见。', '1', '0', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860578738352129', '白切鸡', '1397844391040167938', '6600.00', '12345678654', '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', '白切鸡是一道色香味俱全的特色传统名肴，又叫白斩鸡，是粤菜系鸡肴中的一种，始于清代的民间。白切鸡通常选用细骨农家鸡与沙姜、蒜茸等食材，慢火煮浸白切鸡皮爽肉滑，清淡鲜美。著名的泮溪酒家白切鸡，曾获商业部优质产品金鼎奖。湛江白切鸡更是驰名粤港澳。粤菜厨坛中，鸡的菜式有200余款之多，而最为人常食不厌的正是白切鸡，深受食家青睐。', '1', '0', '2021-05-27 10:21:48', '2021-05-27 10:21:48', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860792492666881', '烤乳猪', '1397844391040167938', '38800.00', '213456432123456', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', '广式烧乳猪主料是小乳猪，辅料是蒜，调料是五香粉、芝麻酱、八角粉等，本菜品主要通过将食材放入炭火中烧烤而成。烤乳猪是广州最著名的特色菜，并且是“满汉全席”中的主打菜肴之一。烤乳猪也是许多年来广东人祭祖的祭品之一，是家家都少不了的应节之物，用乳猪祭完先人后，亲戚们再聚餐食用。', '1', '0', '2021-05-27 10:22:39', '2021-05-27 10:22:39', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860963880316929', '脆皮乳鸽', '1397844391040167938', '10800.00', '1234563212345', '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', '“脆皮乳鸽”是广东菜中的一道传统名菜，属于粤菜系，具有皮脆肉嫩、色泽红亮、鲜香味美的特点，常吃可使身体强健，清肺顺气。随着菜品制作工艺的不断发展，逐渐形成了熟炸法、生炸法和烤制法三种制作方法。无论那种制作方法，都是在鸽子经过一系列的加工，挂脆皮水后再加工而成，正宗的“脆皮乳鸽皮脆肉嫩、色泽红亮、鲜香味美、香气馥郁。这三种方法的制作过程都不算复杂，但想达到理想的效果并不容易。', '1', '0', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397861683434139649', '清蒸河鲜海鲜', '1397844391040167938', '38800.00', '1234567876543213456', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', '新鲜的海鲜，清蒸是最好的处理方式。鲜，体会为什么叫海鲜。清蒸是广州最经典的烹饪手法，过去岭南地区由于峻山大岭阻隔，交通不便，经济发展起步慢，自家打的鱼放在锅里煮了就吃，没有太多的讲究，但却发现这清淡的煮法能使鱼的鲜甜跃然舌尖。', '1', '0', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397862198033297410', '老火靓汤', '1397844391040167938', '49800.00', '123456786532455', '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', '老火靓汤又称广府汤，是广府人传承数千年的食补养生秘方，慢火煲煮的中华老火靓汤，火候足，时间长，既取药补之效，又取入口之甘甜。 广府老火汤种类繁多，可以用各种汤料和烹调方法，烹制出各种不同口味、不同功效的汤来。', '1', '0', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397862477831122945', '上汤焗龙虾', '1397844391040167938', '108800.00', '1234567865432', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', '上汤焗龙虾是一道色香味俱全的传统名菜，属于粤菜系。此菜以龙虾为主料，配以高汤制成的一道海鲜美食。本品肉质洁白细嫩，味道鲜美，蛋白质含量高，脂肪含量低，营养丰富。是色香味俱全的传统名菜。', '1', '0', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413342036832100354', '北冰洋', '1413341197421846529', '500.00', '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '', '1', '0', '2021-07-09 11:39:35', '2021-07-09 15:12:18', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413384757047271425', '王老吉', '1413341197421846529', '500.00', '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', '', '1', '0', '2021-07-09 14:29:20', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413385247889891330', '米饭', '1413384954989060097', '200.00', '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '', '1', '0', '2021-07-09 14:31:17', '2021-07-11 16:35:26', '1', '1', '0');

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES ('1397849417888346113', '1397849417854791681', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849739297861633', '1397849739276890114', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849739323027458', '1397849739276890114', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849936421761025', '1397849936404983809', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849936438538241', '1397849936404983809', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850141015715841', '1397850140982161409', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850141040881665', '1397850140982161409', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850392120307713', '1397850392090947585', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850392137084929', '1397850392090947585', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850630734262274', '1397850630700707841', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850630755233794', '1397850630700707841', '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850851274960898', '1397850851245600769', '忌口', '[\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850851283349505', '1397850851245600769', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851099523231745', '1397851099502260226', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851099527426050', '1397851099502260226', '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658754', '1397851370462687234', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658755', '1397851370462687234', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658756', '1397851370462687234', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851668283437058', '1397851668262465537', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397852391180120065', '1397852391150759938', '忌口', '[\"不要葱\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397852391196897281', '1397852391150759938', '辣度', '[\"不辣\",\"微辣\",\"重辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853183307984898', '1397853183287013378', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853423486414850', '1397853423461249026', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853709126905857', '1397853709101740034', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853890283089922', '1397853890262118402', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854133632413697', '1397854133603053569', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854652623007745', '1397854652581064706', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854652635590658', '1397854652581064706', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854865735593986', '1397854865672679425', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397855742303186946', '1397855742273826817', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397855906497605633', '1397855906468245506', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397856190573621250', '1397856190540066818', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859056709316609', '1397859056684150785', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859277837217794', '1397859277812051969', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859487502086146', '1397859487476920321', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859757061615618', '1397859757036449794', '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397860242086735874', '1397860242057375745', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397860963918065665', '1397860963880316929', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861135754506242', '1397861135733534722', '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861370035744769', '1397861370010578945', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861683459305474', '1397861683434139649', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861898467717121', '1397861898438356993', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397862198054268929', '1397862198033297410', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397862477835317250', '1397862477831122945', '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398089545865015297', '1398089545676271617', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398089782323097601', '1398089782285348866', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090003262255106', '1398090003228700673', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090264554811394', '1398090264517062657', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090455399837698', '1398090455324340225', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090685449023490', '1398090685419663362', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090825358422017', '1398090825329061889', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091007051476993', '1398091007017922561', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091296164851713', '1398091296131297281', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091546531246081', '1398091546480914433', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091729809747969', '1398091729788776450', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091889499484161', '1398091889449152513', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398092095179763713', '1398092095142014978', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398092283877306370', '1398092283847946241', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398094018939236354', '1398094018893099009', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398094391494094850', '1398094391456346113', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1399574026165727233', '1399305325713600514', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', '1399309715396669441', '1399309715396669441', '0');
INSERT INTO `dish_flavor` VALUES ('1413389540592263169', '1413384757047271425', '温度', '[\"常温\",\"冷藏\"]', '2021-07-12 09:09:16', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1413389684020682754', '1413342036832100354', '温度', '[\"常温\",\"冷藏\"]', '2021-07-09 15:12:18', '2021-07-09 15:12:18', '1', '1', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `employee_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `PK_EMPLOYEE_EMPLOYEEID` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='员工信息';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1582721683383382017', '梁文助', '18070703549', 'e10adc3949ba59abbe56e057f20f883e', '18070703549', '1', '465855422689887571', '1', '2022-10-19 21:13:50', '2022-10-29 01:29:09', '1', '1', '3549');
INSERT INTO `employee` VALUES ('1', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '18077556644', '0', '110101199001010047', '1', '2021-05-06 17:20:07', '2022-10-17 19:19:13', '1', '1', '666666');

-- ----------------------------
-- Table structure for jige_membercard_config
-- ----------------------------
DROP TABLE IF EXISTS `jige_membercard_config`;
CREATE TABLE `jige_membercard_config` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'guid主键',
  `mcard_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联会员卡ID',
  `ref_type` tinyint DEFAULT NULL COMMENT '关联类型',
  `ref_id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联ID',
  `img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '图片地址',
  `count` int DEFAULT NULL COMMENT '数量',
  `time_interval` int DEFAULT NULL COMMENT '间隔天数',
  `valid_time` int DEFAULT NULL COMMENT '有效天数',
  `json_remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'JSON备注',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jige_membercard_config
-- ----------------------------

-- ----------------------------
-- Table structure for jige_membercard_log
-- ----------------------------
DROP TABLE IF EXISTS `jige_membercard_log`;
CREATE TABLE `jige_membercard_log` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'guid主键',
  `task_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '来源任务ID 如：用户会员卡ID   ',
  `user_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联用户ID',
  `ref_type` tinyint DEFAULT NULL COMMENT '来源类型 如 产品，优惠券',
  `ref_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '来源ID',
  `get_count` int DEFAULT NULL COMMENT '领取数量',
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jige_membercard_log
-- ----------------------------

-- ----------------------------
-- Table structure for jige_membercard_user
-- ----------------------------
DROP TABLE IF EXISTS `jige_membercard_user`;
CREATE TABLE `jige_membercard_user` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'guid主键',
  `mcard_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联会员卡ID',
  `card_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '会员卡编号',
  `user_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户ID',
  `starttime` datetime DEFAULT NULL COMMENT '有效期开始日期',
  `endtime` datetime DEFAULT NULL COMMENT '有效期结束日期',
  `ref_order_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联订单id',
  `ref_order_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联订单号',
  `json_remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'JSON备注',
  `status` tinyint DEFAULT NULL COMMENT '会员卡状态',
  `addtime` datetime DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jige_membercard_user
-- ----------------------------

-- ----------------------------
-- Table structure for jige_membercard_user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `jige_membercard_user_coupons`;
CREATE TABLE `jige_membercard_user_coupons` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
  `mcard_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '会员卡id',
  `coupon_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '优惠券id',
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户id',
  `count` int DEFAULT NULL COMMENT '数量',
  `status` tinyint DEFAULT NULL COMMENT '优惠券状态99未领取，100已领取，110已失效',
  `batchnum` int DEFAULT NULL COMMENT '批次',
  `valid_days` int DEFAULT NULL COMMENT '有效天数',
  `gettime` datetime DEFAULT NULL COMMENT '领取时间',
  `starttime` datetime DEFAULT NULL COMMENT '有效开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '有效结束时间',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jige_membercard_user_coupons
-- ----------------------------

-- ----------------------------
-- Table structure for jige_member_card
-- ----------------------------
DROP TABLE IF EXISTS `jige_member_card`;
CREATE TABLE `jige_member_card` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'guid主键',
  `site_id` int DEFAULT NULL COMMENT '站点',
  `member_level` tinyint DEFAULT NULL COMMENT '会员级别',
  `card_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '默认图片',
  `card_amount` bigint DEFAULT NULL COMMENT '会员卡金额',
  `card_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '会员卡名称',
  `card_subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '会员卡副标题',
  `valid_time_unit` tinyint NOT NULL COMMENT '有效时长单位，周，月，季，年',
  `valid_time` int NOT NULL COMMENT '有效时长(周期)，表示几周，几个月',
  `starttime` datetime DEFAULT NULL COMMENT '有效期开始日期',
  `endtime` datetime DEFAULT NULL COMMENT '有效期结束日期',
  `json_remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'JSON备注',
  `card_explain` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '会员卡使用说明',
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '备注',
  `state` tinyint DEFAULT NULL COMMENT '状态',
  `addtime` datetime DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jige_member_card
-- ----------------------------

-- ----------------------------
-- Table structure for menu_info
-- ----------------------------
DROP TABLE IF EXISTS `menu_info`;
CREATE TABLE `menu_info` (
  `menuid` int NOT NULL COMMENT '菜单编号',
  `menu_name` varchar(24) DEFAULT NULL COMMENT '菜单名称',
  `isuse` int(10) unsigned zerofill DEFAULT NULL COMMENT '是否使用',
  `menu_type` int DEFAULT NULL COMMENT '菜单类型',
  `attribute1` varchar(100) DEFAULT NULL,
  `attribute2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `input_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputuser` varchar(10) DEFAULT NULL COMMENT '录入用户',
  `parent_menu` int DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单地址',
  PRIMARY KEY (`menuid`),
  UNIQUE KEY `PK_MENU_INFO` (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of menu_info
-- ----------------------------
INSERT INTO `menu_info` VALUES ('10', '系统管理', '0000000001', '1', null, null, null, null, '2022-10-22 01:39:21', null, '0', null);
INSERT INTO `menu_info` VALUES ('20', '权限管理', '0000000001', '1', null, null, null, null, '2022-10-22 01:39:22', null, '0', null);
INSERT INTO `menu_info` VALUES ('30', '商品管理', '0000000001', '1', null, null, null, null, '2022-10-22 01:39:22', null, '0', null);
INSERT INTO `menu_info` VALUES ('40', '订单管理', '0000000001', '1', null, null, null, null, '2022-10-22 01:39:23', null, '0', null);
INSERT INTO `menu_info` VALUES ('50', '数据统计', '0000000001', '1', null, null, null, null, '2022-10-22 01:39:24', null, '0', null);
INSERT INTO `menu_info` VALUES ('1010', '用户管理', '0000000001', '1', null, null, null, null, '2022-10-25 23:43:52', null, '10', '');
INSERT INTO `menu_info` VALUES ('1011', '会员管理', '0000000001', '1', null, null, null, null, '2022-10-22 00:39:28', null, '10', null);
INSERT INTO `menu_info` VALUES ('3010', '商品信息', '0000000001', '1', null, null, null, null, '2022-10-30 00:25:29', null, '30', null);
INSERT INTO `menu_info` VALUES ('4010', '订单信息', '0000000001', '1', null, null, null, null, '2022-10-30 00:31:49', null, '40', null);
INSERT INTO `menu_info` VALUES ('101010', '用户信息', '0000000001', '1', null, null, null, null, '2022-10-25 23:43:58', null, '1010', 'page/member/list.html');
INSERT INTO `menu_info` VALUES ('101110', '会员注册', '0000000001', '1', null, null, null, null, '2022-10-22 00:39:24', null, '1011', null);
INSERT INTO `menu_info` VALUES ('101111', '会员信息', '0000000001', '1', null, null, null, null, '2022-10-24 23:43:27', null, '1011', null);
INSERT INTO `menu_info` VALUES ('301010', '商品列表', '0000000001', '1', null, null, null, null, '2022-10-30 00:28:30', null, '3010', '/page/category/list.html');
INSERT INTO `menu_info` VALUES ('301011', '套餐列表', '0000000001', '1', null, null, null, null, '2022-10-30 00:30:05', null, '3010', '/page/combo/list.html');
INSERT INTO `menu_info` VALUES ('301012', '菜品批量', '0000000001', '1', null, null, null, null, '2022-10-30 00:31:25', null, '3010', '/page/food/list.html');
INSERT INTO `menu_info` VALUES ('401010', '订单列表', '0000000001', '1', null, null, null, null, '2022-10-30 00:33:15', null, '4010', '/page/order/list.html');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐';

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES ('1415580119015145474', '1413386191767674881', '儿童套餐A计划', '4000.00', '1', '', '', '61d20592-b37f-4d72-a864-07ad5bb8f3bb.jpg', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int NOT NULL COMMENT '份数',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐菜品关系';

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES ('1415580119052894209', '1415580119015145474', '1397862198033297410', '老火靓汤', '49800.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish` VALUES ('1415580119061282817', '1415580119015145474', '1413342036832100354', '北冰洋', '500.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish` VALUES ('1415580119069671426', '1415580119015145474', '1413385247889891330', '米饭', '200.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '头像',
  `status` int DEFAULT '0' COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';

-- ----------------------------
-- Records of user
-- ----------------------------

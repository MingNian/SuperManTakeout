/*
Navicat MySQL Data Transfer

Source Server         : localhost_3307
Source Server Version : 50540
Source Host           : localhost:3307
Source Database       : wm_db

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-11-08 11:27:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginId` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `adminName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO t_admin VALUES ('1', 'dingjianming', 'dingjianming', 'ding', '男', '15256993677@163.com');
INSERT INTO t_admin VALUES ('2', 'pengshaocheng', 'pengpeng', 'peng', '男', '2068618317@qq.com');

-- ----------------------------
-- Table structure for `t_cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitem`;
CREATE TABLE `t_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `commodityId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlaqkn0smwk8ycptvvv3wyqkep` (`userId`),
  KEY `FKo24oxx5rbnpptox7opcbji9fd` (`commodityId`),
  CONSTRAINT `FKo24oxx5rbnpptox7opcbji9fd` FOREIGN KEY (`commodityId`) REFERENCES `t_commodity` (`id`),
  CONSTRAINT `FKlaqkn0smwk8ycptvvv3wyqkep` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cartitem
-- ----------------------------
INSERT INTO t_cartitem VALUES ('1', '1', '4', '5');
INSERT INTO t_cartitem VALUES ('2', '1', '4', '3');
INSERT INTO t_cartitem VALUES ('3', '1', '3', '2');
INSERT INTO t_cartitem VALUES ('4', '3', '4', '2');
INSERT INTO t_cartitem VALUES ('65', '1', '5', '3');
INSERT INTO t_cartitem VALUES ('66', '1', '6', '17');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryRemark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `shopId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt1gswsm2vvya42vua48x0wrcs` (`shopId`),
  CONSTRAINT `FKt1gswsm2vvya42vua48x0wrcs` FOREIGN KEY (`shopId`) REFERENCES `t_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO t_category VALUES ('1', '清淡', '实惠', '1', '1');
INSERT INTO t_category VALUES ('2', '麻辣', '超级美味', '1', '1');
INSERT INTO t_category VALUES ('3', '炸鸡类', '好吃', '1', '2');
INSERT INTO t_category VALUES ('4', '套餐一', '绝对值', '1', '2');
INSERT INTO t_category VALUES ('5', '肉类', '好', '1', '3');
INSERT INTO t_category VALUES ('6', '干锅', '够劲', '1', '3');
INSERT INTO t_category VALUES ('7', '美味水饺', null, '1', '4');
INSERT INTO t_category VALUES ('16', '其他小吃', null, '1', '4');
INSERT INTO t_category VALUES ('17', '肉类', null, '1', '5');
INSERT INTO t_category VALUES ('18', '素菜', null, '1', '5');
INSERT INTO t_category VALUES ('19', '面条', null, '1', '6');
INSERT INTO t_category VALUES ('20', '其他', null, '1', '6');
INSERT INTO t_category VALUES ('21', '汉堡套餐', '', '1', '7');
INSERT INTO t_category VALUES ('22', '饮料', null, '1', '7');
INSERT INTO t_category VALUES ('23', '酸菜鱼', null, '1', '8');
INSERT INTO t_category VALUES ('24', '美味家常菜', null, '1', '8');
INSERT INTO t_category VALUES ('25', '豆浆饮品', null, '1', '9');
INSERT INTO t_category VALUES ('26', '点心', null, '1', '9');
INSERT INTO t_category VALUES ('27', '炒菜', null, '1', '10');
INSERT INTO t_category VALUES ('28', '香锅', null, '1', '10');
INSERT INTO t_category VALUES ('29', 'kfc专属饮料', null, '1', '11');
INSERT INTO t_category VALUES ('30', 'kfc专属套餐', null, '1', '11');
INSERT INTO t_category VALUES ('31', 'kfc专属汉堡', null, '1', '11');
INSERT INTO t_category VALUES ('32', '秋日超值套餐', null, '1', '12');
INSERT INTO t_category VALUES ('33', '秋日热销商品', null, '1', '12');
INSERT INTO t_category VALUES ('34', '健康素材', null, '1', '13');
INSERT INTO t_category VALUES ('35', '千年苏帮菜', null, '1', '13');
INSERT INTO t_category VALUES ('36', '蒸鸡', null, '1', '14');
INSERT INTO t_category VALUES ('37', '饮料', null, '1', '14');
INSERT INTO t_category VALUES ('38', '美味水饺', null, '1', '15');
INSERT INTO t_category VALUES ('39', '美味小吃', null, '1', '15');
INSERT INTO t_category VALUES ('40', '米饭', null, '1', '14');
INSERT INTO t_category VALUES ('41', '米饭', null, '1', '10');
INSERT INTO t_category VALUES ('42', '优质米饭', null, '1', '3');
INSERT INTO t_category VALUES ('43', '米饭', null, '1', '8');

-- ----------------------------
-- Table structure for `t_commodity`
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity`;
CREATE TABLE `t_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodityImg` varchar(255) DEFAULT NULL,
  `commodityName` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `commodityRemark` varchar(255) DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgbv5f4xboquj8jsaipqecmg0t` (`categoryId`),
  CONSTRAINT `FKgbv5f4xboquj8jsaipqecmg0t` FOREIGN KEY (`categoryId`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_commodity
-- ----------------------------
INSERT INTO t_commodity VALUES ('1', '/wm/upload/fa02a45a-32d2-4e00-8a95-ecb1fd4c671c.jpg', '土豆片烧肉', '20', '', '绝对好吃', '2');
INSERT INTO t_commodity VALUES ('2', '/wm/upload/null', '铁板饭', '22', '', '好吃', '1');
INSERT INTO t_commodity VALUES ('3', '/wm/img/zhajitui.jpg', '炸鸡腿', '30', '', '好吃极了', '3');
INSERT INTO t_commodity VALUES ('4', '/wm/img/sj.jpg', '全家桶', '50', '', '值', '4');
INSERT INTO t_commodity VALUES ('5', '/wm/img/wuhuarou.jpg', '梅菜扣肉', '15', '', '很好', '5');
INSERT INTO t_commodity VALUES ('6', 'wm/img/tieguo.jpg', '干锅', '20', '', '美味', '6');
INSERT INTO t_commodity VALUES ('12', '/wm/img/zi.jpg', '毛豆炒肉', '14', '', null, '1');
INSERT INTO t_commodity VALUES ('13', '/wm/img/yanhuanguang.jpg', '腌黄瓜', '11', '', null, '1');
INSERT INTO t_commodity VALUES ('14', '/wm/img/zhuxue.jpg', '毛血旺', '34', '', null, '2');
INSERT INTO t_commodity VALUES ('15', '/wm/img/xiangtang.jpg', '麻辣海蜇', '12', '', null, '2');
INSERT INTO t_commodity VALUES ('16', '/wm/img/wujian.jpg', '炸鸡套餐', '25', '', null, '3');
INSERT INTO t_commodity VALUES ('17', '/wm/img/shangxiaojikuai.jpg', '上校鸡块', '12', '', null, '3');
INSERT INTO t_commodity VALUES ('18', '/wm/img/peigengtaocan.jpg', '培根套餐', '32', '', null, '4');
INSERT INTO t_commodity VALUES ('19', '/wm/img/han.jpg', '汉堡套餐', '32', '', null, '4');
INSERT INTO t_commodity VALUES ('20', '/wm/img/geng.jpg', '开胃羹', '18', '', null, '5');
INSERT INTO t_commodity VALUES ('21', '/wm/img/hongshaorou.jpg', '红烧肉', '25', '', null, '5');
INSERT INTO t_commodity VALUES ('22', '/wm/img/ganguohuanggua.jpg', '干锅包菜', '21', '', null, '6');
INSERT INTO t_commodity VALUES ('26', '/wm/img/ganguo.jpg', '干锅牛肉', '34', '', null, '6');
INSERT INTO t_commodity VALUES ('27', '/wm/img/dashuijiao.jpg', '韭菜水饺', '12', '', null, '7');
INSERT INTO t_commodity VALUES ('28', '/wm/img/jiacaijiaozi.jpg', '白菜水饺', '12', '', null, '7');
INSERT INTO t_commodity VALUES ('29', '/wm/img/shui.jpg', '羊肉水饺', '18', '', null, '7');
INSERT INTO t_commodity VALUES ('30', '/wm/img/zhuroushuijiao.jpg', '猪肉水饺', '16', '', null, '7');
INSERT INTO t_commodity VALUES ('34', '/wm/img/fen.jpg', '鸭雪粉丝', '12', '', null, '16');
INSERT INTO t_commodity VALUES ('35', '/wm/img/fengzhua.jpg', '美味凤爪', '4', '', null, '16');
INSERT INTO t_commodity VALUES ('36', '/wm/img/duochuan.jpg', '骨肉相连', '3', '', null, '17');
INSERT INTO t_commodity VALUES ('37', '/wm/img/wuhuarou.jpg', '五花肉', '3', '', null, '17');
INSERT INTO t_commodity VALUES ('38', '/wm/img/xiaohuangyu.jpg', '小黄鱼', '4', '', null, '17');
INSERT INTO t_commodity VALUES ('39', '/wm/img/ziranniuirou.jpg', '孜然牛肉', '3', '', null, '17');
INSERT INTO t_commodity VALUES ('40', '/wm/img/ziranyangrou.jpg', '孜然羊肉', '3', '', null, '17');
INSERT INTO t_commodity VALUES ('41', '/wm/img/zhurouchuan.jpg', '猪肉串', '3', '', null, '17');
INSERT INTO t_commodity VALUES ('42', '/wm/img/ziran.jpg', '里脊肉', '3', '', null, '17');
INSERT INTO t_commodity VALUES ('43', '/wm/img/jinzhengu.jpg', '金针菇', '2', '', null, '18');
INSERT INTO t_commodity VALUES ('44', '/wm/img/mogu.jpg', '香菇', '2', '', null, '18');
INSERT INTO t_commodity VALUES ('45', '/wm/img/qiezi.jpg', '茄子', '4', '', null, '18');
INSERT INTO t_commodity VALUES ('46', '/wm/img/tudoupian.jpg', '土豆', '2', '', null, '18');
INSERT INTO t_commodity VALUES ('47', '/wm/img/yumi.jpg', '玉米', '5', '', null, '18');
INSERT INTO t_commodity VALUES ('48', '/wm/img/yi1.png', '黑椒蘑菇培根面', '24', '', null, '19');
INSERT INTO t_commodity VALUES ('49', '/wm/img/yi2.png', '黑椒烤肠培根面', '24', '', null, '19');
INSERT INTO t_commodity VALUES ('50', '/wm/img/yi3.png', '黑椒蘑菇意面', '24', '', null, '19');
INSERT INTO t_commodity VALUES ('51', '/wm/img/yi4.png', '黑椒牛柳意面', '24', '', null, '19');
INSERT INTO t_commodity VALUES ('52', '/wm/upload/4170e2f3-e389-470c-aa81-4d9a81a21ed2.jpg', '手撕包菜', '12', '', '好吃', '1');
INSERT INTO t_commodity VALUES ('53', '/wm/img/pisa1.png', '超级至尊披萨', '56', '', null, '20');
INSERT INTO t_commodity VALUES ('54', '/wm/img/pisa2.png', '培根披萨', '78', '', null, '20');
INSERT INTO t_commodity VALUES ('55', '/wm/img/pisa3.png', '田园风情披萨', '65', '', null, '20');
INSERT INTO t_commodity VALUES ('56', '/wm/img/jiroubao.jpg', '肌肉堡', '18', '', null, '21');
INSERT INTO t_commodity VALUES ('57', '/wm/img/peigengtaocan.jpg', '培根汉堡', '18', '', null, '21');
INSERT INTO t_commodity VALUES ('58', '/wm/img/jiroubao.jpg', '牛肉堡', '18', '', null, '21');
INSERT INTO t_commodity VALUES ('59', '/wm/img/jiroubao.jpg', '辣堡', '16', '', null, '21');
INSERT INTO t_commodity VALUES ('60', '/wm/img/baishi.jpg', '百事可乐', '16', '', null, '22');
INSERT INTO t_commodity VALUES ('61', '/wm/img/suancaiyu1.png', '酸菜鱼(小)', '24', '', null, '23');
INSERT INTO t_commodity VALUES ('62', '/wm/img/suancaiyu2.png', '水煮鱼(小)', '24', '', null, '23');
INSERT INTO t_commodity VALUES ('63', '/wm/img/maodu.jpg', '夫妻肺片', '24', '', null, '24');
INSERT INTO t_commodity VALUES ('64', '/wm/img/haidai.jpg', '凉拌海带', '33', '', null, '24');
INSERT INTO t_commodity VALUES ('65', '/wm/img/chengzhi.jpg', '橙汁', '8', '', null, '22');
INSERT INTO t_commodity VALUES ('67', '/wm/img/suancaiyu1.png', '酸菜鱼(中)', '34', '', null, '23');
INSERT INTO t_commodity VALUES ('68', '/wm/img/suancaiyu1.png', '酸菜鱼(大)', '44', '', null, '23');
INSERT INTO t_commodity VALUES ('69', '/wm/img/suancaiyu2.png', '水煮鱼(中)', '34', '', null, '23');
INSERT INTO t_commodity VALUES ('70', '/wm/img/suancaiyu2.png', '水煮鱼(大)', '44', '', null, '23');
INSERT INTO t_commodity VALUES ('71', '/wm/img/dj1.png', '豆浆', '3', '', null, '25');
INSERT INTO t_commodity VALUES ('72', '/wm/img/dj2.png', '黑米粥', '9', '', null, '25');
INSERT INTO t_commodity VALUES ('73', '/wm/img/dj3.png', '柠檬热茶', '7', '', null, '25');
INSERT INTO t_commodity VALUES ('74', '/wm/img/djdx1.png', '油条', '3', '', null, '26');
INSERT INTO t_commodity VALUES ('75', '/wm/img/djdx2.png', '饭团', '5', '', null, '26');
INSERT INTO t_commodity VALUES ('76', '/wm/img/kaochang.jpg', '烤肠', '3', '', null, '26');
INSERT INTO t_commodity VALUES ('77', '/wm/img/huashengmi.jpg', '炒花生米', '12', '', null, '27');
INSERT INTO t_commodity VALUES ('78', '/wm/img/doufu.jpg', '铁板豆腐', '12', '', null, '27');
INSERT INTO t_commodity VALUES ('79', '/wm/img/hong.jpg', '炒茄子', '17', '', null, '27');
INSERT INTO t_commodity VALUES ('80', '/wm/img/waxiangji.jpg', '瓦香鸡', '35', '', null, '28');
INSERT INTO t_commodity VALUES ('81', '/wm/img/sunacaiyu.jpg', '酸菜鱼', '35', '', null, '28');
INSERT INTO t_commodity VALUES ('82', '/wm/img/bingqiling.jpg', '冰淇淋', '8', '', null, '29');
INSERT INTO t_commodity VALUES ('83', '/wm/img/ka.jpg', '香浓咖啡', '8', '', null, '29');
INSERT INTO t_commodity VALUES ('84', '/wm/img/kfckele', '可口可乐', '8', '', null, '29');
INSERT INTO t_commodity VALUES ('85', '/wm/img/baishi.jpg', '百事可乐', '8', '', null, '29');
INSERT INTO t_commodity VALUES ('86', '/wm/img/fantuantaocan.jpg', '早餐套餐', '22', '', null, '30');
INSERT INTO t_commodity VALUES ('87', '/wm/img/peigengtaocan.jpg', '培根套餐', '24', '', null, '30');
INSERT INTO t_commodity VALUES ('88', '/wm/img/ji.jpg', '鸡米花', '6', '', null, '31');
INSERT INTO t_commodity VALUES ('89', '/wm/img/shizitou.jpg', '狮子头', '6', '', null, '31');
INSERT INTO t_commodity VALUES ('90', '/wm/img/jiandan.jpg', '超值营养早餐', '14', '', null, '30');
INSERT INTO t_commodity VALUES ('91', '/wm/img/ss.jpg', '超值套餐', '24', '', null, '30');
INSERT INTO t_commodity VALUES ('92', '/wm/img/jichi.jpg', '可乐鸡翅', '12', '', null, '31');
INSERT INTO t_commodity VALUES ('93', '/wm/img/m1.png', '原味板烧鸡腿麦满分配脆薯饼', '24', '', null, '32');
INSERT INTO t_commodity VALUES ('94', '/wm/img/m2.png', '猪柳麦满分配脆薯饼', '24', '', null, '32');
INSERT INTO t_commodity VALUES ('95', '/wm/img/m4.png', '猪柳蛋麦满分配脆薯饼', '24', '', null, '32');
INSERT INTO t_commodity VALUES ('96', '/wm/img/m5.png', '猪柳蛋堡配脆薯饼', '24', '', null, '32');
INSERT INTO t_commodity VALUES ('97', '/wm/img/m3.png', '悠享早晨全餐配配鲜煮咖啡', '22', '', null, '32');
INSERT INTO t_commodity VALUES ('98', '/wm/img/m7.png', '0油原味板烧鸡腿堡', '18', '', null, '33');
INSERT INTO t_commodity VALUES ('99', '/wm/img/m6.png', '小食纷享盒(那么大鸡排)', '32', '', null, '33');
INSERT INTO t_commodity VALUES ('100', '/wm/img/doupi.jpg', '凉拌千张', '12', '', null, '34');
INSERT INTO t_commodity VALUES ('101', '/wm/img/xiangcai.png', '美味年糕', '12', '', null, '34');
INSERT INTO t_commodity VALUES ('102', '/wm/img/roujuan.jpg', '美味春卷', '16', '', null, '34');
INSERT INTO t_commodity VALUES ('104', '/wm/img/gs1.png', '特色松鼠鱼', '67', '', null, '35');
INSERT INTO t_commodity VALUES ('105', '/wm/img/gs2.png', '响油鳝糊', '57', '', null, '35');
INSERT INTO t_commodity VALUES ('106', '/wm/img/gs3.png', '苏轼东坡肉', '47', '', null, '35');
INSERT INTO t_commodity VALUES ('107', '/wm/img/gs4.png', '苏式狮子头（4只）', '29', '', null, '35');
INSERT INTO t_commodity VALUES ('108', '/wm/img/gs5.png', '清蒸太湖白鱼', '37', '', null, '35');
INSERT INTO t_commodity VALUES ('109', '/wm/img/zj1.png', '巨划算 滋补蒸鸡', '190', '', null, '36');
INSERT INTO t_commodity VALUES ('110', '/wm/img/zj2.png', '团餐特惠 滋补蒸鸡', '320', '', null, '36');
INSERT INTO t_commodity VALUES ('111', '/wm/img/zj3.png', '掌柜推荐 滋补蒸鸡', '130', '', null, '36');
INSERT INTO t_commodity VALUES ('112', '/wm/img/yl1.png', '农夫山泉', '2', '', null, '37');
INSERT INTO t_commodity VALUES ('113', '/wm/img/yl2.png', '雪碧', '4', '', null, '37');
INSERT INTO t_commodity VALUES ('114', '/wm/img/yl3.png', '加多宝', '5', '', null, '37');
INSERT INTO t_commodity VALUES ('115', '/wm/img/yl4.png', '红牛', '7', '', null, '37');
INSERT INTO t_commodity VALUES ('116', '/wm/img/mi.jpg', '优质米饭', '2', '', null, '40');
INSERT INTO t_commodity VALUES ('117', '/wm/img/mi.jpg', '优质米饭', '2', '', null, '41');
INSERT INTO t_commodity VALUES ('118', '/wm/img/mi.jpg', '优质米饭', '2', '', null, '42');
INSERT INTO t_commodity VALUES ('119', '/wm/img/mi.jpg', '优质米饭', '2', '', null, '43');
INSERT INTO t_commodity VALUES ('120', '/wm/upload/null', '1', '1', '', '1', '1');

-- ----------------------------
-- Table structure for `t_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluateDate` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `shopId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderBeanId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbu2kerxyqb3p0qba1xlpfq36b` (`shopId`),
  KEY `FKpucdbd0cnjrc32a8f2k29v5xs` (`userId`),
  KEY `FKgjv3364pmlhl2xcv8njfd86ft` (`orderBeanId`),
  CONSTRAINT `FKgjv3364pmlhl2xcv8njfd86ft` FOREIGN KEY (`orderBeanId`) REFERENCES `t_orderbean` (`id`),
  CONSTRAINT `FKbu2kerxyqb3p0qba1xlpfq36b` FOREIGN KEY (`shopId`) REFERENCES `t_shop` (`id`),
  CONSTRAINT `FKpucdbd0cnjrc32a8f2k29v5xs` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------
INSERT INTO t_evaluate VALUES ('4', '2017-11-06 15:23:44', '下次还来', '0', '1', '3', '4');
INSERT INTO t_evaluate VALUES ('5', '2017-11-06 15:51:28', '蛮好吃的', '0', '2', '3', '2');
INSERT INTO t_evaluate VALUES ('7', '2017-11-07 11:44:16', '很实惠', '0', '1', '1', '5');
INSERT INTO t_evaluate VALUES ('8', '2017-11-07 19:44:08', '良心商家', '0', '1', '1', '11');
INSERT INTO t_evaluate VALUES ('9', '2017-11-07 19:44:11', '量很足', '0', '1', '1', '7');
INSERT INTO t_evaluate VALUES ('10', '2017-11-08 11:03:12', '蛮好吃的，快递小哥也很帅，还会来买的', '0', '3', '7', '46');

-- ----------------------------
-- Table structure for `t_orderbean`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderbean`;
CREATE TABLE `t_orderbean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderBeanTime` datetime DEFAULT NULL,
  `orderBeanMoney` float DEFAULT NULL,
  `orderBeanRemark` varchar(255) DEFAULT NULL,
  `addrId` int(11) NOT NULL,
  `orderBeanTel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn10puhro0mvanvk1ferhftusf` (`userId`),
  KEY `FKm4vke455vviv6f5ye10wy7lhi` (`shopId`),
  KEY `FKmwpke7gk5auvgkxlanhjeikai` (`addrId`),
  CONSTRAINT `FKmwpke7gk5auvgkxlanhjeikai` FOREIGN KEY (`addrId`) REFERENCES `t_useraddress` (`id`),
  CONSTRAINT `FKm4vke455vviv6f5ye10wy7lhi` FOREIGN KEY (`shopId`) REFERENCES `t_shop` (`id`),
  CONSTRAINT `FKn10puhro0mvanvk1ferhftusf` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderbean
-- ----------------------------
INSERT INTO t_orderbean VALUES ('1', '2017-11-08 01:39:31', '9', '加辣', '1', '1211223', '1', '1', '1');
INSERT INTO t_orderbean VALUES ('2', '2017-11-01 01:42:54', '2', '多加点米饭', '1', '1243546', '3', '1', '1');
INSERT INTO t_orderbean VALUES ('3', '2017-11-02 01:43:44', '1', '多加点配菜啊', '1', '1324543', '-1', '1', '1');
INSERT INTO t_orderbean VALUES ('4', '2017-11-01 01:44:35', '1', '快点送哦', '1', '1223456', '2', '1', '1');
INSERT INTO t_orderbean VALUES ('5', '2017-11-03 01:45:39', '2', '帮忙多给一双筷子', '1', '123434', '3', '1', '1');
INSERT INTO t_orderbean VALUES ('6', '2017-11-08 02:03:10', '1', '加辣', '1', '1234546', '0', '1', '1');
INSERT INTO t_orderbean VALUES ('7', '2017-11-04 09:19:47', '1', '多加点米饭', '1', '2134546', '0', '1', '1');
INSERT INTO t_orderbean VALUES ('8', '2017-11-05 09:20:04', '1', '帮忙多给一双筷子', '1', '2132435', '1', '1', '1');
INSERT INTO t_orderbean VALUES ('9', '2017-11-06 09:20:18', '1', '多加点配菜啊', '1', '56234232', '-1', '1', '1');
INSERT INTO t_orderbean VALUES ('10', '2017-11-01 09:20:36', '1', '希望快点送到', '1', '1324355', '3', '1', '1');
INSERT INTO t_orderbean VALUES ('11', '2017-11-07 09:20:51', '1', '不要太辣', '1', '6543221', '2', '1', '1');
INSERT INTO t_orderbean VALUES ('46', '2017-11-08 11:02:41', '75', '', '8', null, '0', '7', '3');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `commodityId` int(11) NOT NULL,
  `orderBeanId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs9e5aphdty54lapyjxkhv8ywi` (`commodityId`),
  KEY `FKpch7n36xwbtjuas7sfpu3koks` (`orderBeanId`),
  CONSTRAINT `FKpch7n36xwbtjuas7sfpu3koks` FOREIGN KEY (`orderBeanId`) REFERENCES `t_orderbean` (`id`),
  CONSTRAINT `FKs9e5aphdty54lapyjxkhv8ywi` FOREIGN KEY (`commodityId`) REFERENCES `t_commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO t_orderitem VALUES ('1', '1', '1', '1');
INSERT INTO t_orderitem VALUES ('2', '1', '1', '2');
INSERT INTO t_orderitem VALUES ('3', '1', '2', '3');
INSERT INTO t_orderitem VALUES ('4', '1', '1', '4');
INSERT INTO t_orderitem VALUES ('5', '1', '1', '5');
INSERT INTO t_orderitem VALUES ('6', '1', '2', '6');
INSERT INTO t_orderitem VALUES ('7', '1', '1', '7');
INSERT INTO t_orderitem VALUES ('8', '1', '1', '8');
INSERT INTO t_orderitem VALUES ('9', '1', '1', '9');
INSERT INTO t_orderitem VALUES ('10', '1', '1', '10');
INSERT INTO t_orderitem VALUES ('11', '1', '1', '11');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `replyDate` datetime DEFAULT NULL,
  `evaluateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4blkuj29b0k2050g0c2k9o1jy` (`evaluateId`),
  CONSTRAINT `FKr15pw106farkt8gq35b1ypcek` FOREIGN KEY (`evaluateId`) REFERENCES `t_evaluate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_searchhistory`
-- ----------------------------
DROP TABLE IF EXISTS `t_searchhistory`;
CREATE TABLE `t_searchhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyWord` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKobfal4v6ncyj10e68pc7fn5fa` (`userId`),
  CONSTRAINT `FKobfal4v6ncyj10e68pc7fn5fa` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_searchhistory
-- ----------------------------
INSERT INTO t_searchhistory VALUES ('77', '水饺', '1');
INSERT INTO t_searchhistory VALUES ('78', '鸡', '1');
INSERT INTO t_searchhistory VALUES ('79', '鱼', '1');
INSERT INTO t_searchhistory VALUES ('91', '', '16');
INSERT INTO t_searchhistory VALUES ('92', '健康', '16');
INSERT INTO t_searchhistory VALUES ('93', '', '16');

-- ----------------------------
-- Table structure for `t_shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `docPath` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `closeTime` varchar(255) DEFAULT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `shopAddress` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_djjipcmaou6rdbktvr4w8gb7y` (`userId`),
  CONSTRAINT `FKp3x5ro21bn6k00ifwxumek813` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO t_shop VALUES ('1', '1', '/upload/file.doc', '早上八点', '晚上九点', '85度饭店', '苏州仁爱路1号', '1');
INSERT INTO t_shop VALUES ('2', '1', '/upload/file.doc', '早上八点', '晚上九点', '美式快餐', '苏州仁爱路2号', '2');
INSERT INTO t_shop VALUES ('3', '1', '/upload/file.doc', '早上七点', '晚上八点', '健康食店', '苏州仁爱路3号', '3');
INSERT INTO t_shop VALUES ('4', '1', '/upload/file.doc', '早上八点', '晚上八点', '大娘水饺', '苏州仁爱路7号', '4');
INSERT INTO t_shop VALUES ('5', '1', '/upload/file.doc', '早上八点', '晚上八点', '阿好烧烤', '苏州仁爱路7号', '5');
INSERT INTO t_shop VALUES ('6', '1', '/upload/file.doc', '早上八点', '晚上八点', '芝根芝底意面', '苏州仁爱路7号', '6');
INSERT INTO t_shop VALUES ('7', '1', '/upload/file.doc', '早上八点', '晚上八点', '华莱士', '苏州仁爱路7号', '7');
INSERT INTO t_shop VALUES ('8', '1', '/upload/file.doc', '早上八点', '晚上八点', '有家酸菜鱼', '苏州仁爱路7号', '8');
INSERT INTO t_shop VALUES ('9', '1', '/upload/file.doc', '早上八点', '晚上八点', '永和大王', '苏州仁爱路7号', '9');
INSERT INTO t_shop VALUES ('10', '1', '/upload/file.doc', '早上八点', '晚上八点', '锅里乾坤', '苏州仁爱路7号', '15');
INSERT INTO t_shop VALUES ('11', '1', '/upload/file.doc', '早上八点', '晚上八点', '开封菜', '苏州仁爱路8号', '10');
INSERT INTO t_shop VALUES ('12', '1', '/upload/file.doc', '早上八点', '晚上八点', '金拱门', '苏州仁爱路9号', '11');
INSERT INTO t_shop VALUES ('13', '1', '/upload/file.doc', '早上八点', '晚上八点', '老姑苏菜馆', '苏州仁爱路6号', '12');
INSERT INTO t_shop VALUES ('14', '1', '/upload/file.doc', '早上八点', '晚上八点', '哈喽蒸鸡', '上海仁爱路5号', '13');
INSERT INTO t_shop VALUES ('15', '1', '/upload/file.doc', '早上八点', '晚上八点', '大娘水饺', '上海仁爱路11号', '14');

-- ----------------------------
-- Table structure for `t_shopapply`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopapply`;
CREATE TABLE `t_shopapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyPath` varchar(255) DEFAULT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `shopRemark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK28yeg4933oh0qnm2rrm66uqnq` (`userId`),
  CONSTRAINT `FK28yeg4933oh0qnm2rrm66uqnq` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopapply
-- ----------------------------
INSERT INTO t_shopapply VALUES ('1', '1', '三字锅', '正宗石锅', '0', '111', '2');
INSERT INTO t_shopapply VALUES ('2', '/file/afc70fc8-7241-4a82-a9e1-da094243adf5.doc', '123', '456', '0', null, '4');

-- ----------------------------
-- Table structure for `t_shopdetail`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopdetail`;
CREATE TABLE `t_shopdetail` (
  `id` int(11) NOT NULL,
  `shopAddress` varchar(255) DEFAULT NULL,
  `shopImg` varchar(255) DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `shopRemark` varchar(255) DEFAULT NULL,
  `shopOpenTime` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `leastMoney` float DEFAULT NULL,
  `serviceMoney` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopdetail
-- ----------------------------
INSERT INTO t_shopdetail VALUES ('1', '苏州仁爱路1号', '/wm/upload/null', '欢迎广大顾客莅临', '本店物美价廉，经济实惠', '2017-09-01 01:25:10', '30', '20', '10');
INSERT INTO t_shopdetail VALUES ('2', '苏州仁爱路1号', '/wm/img/tieban.jpg', '欢迎光临', '绝对正宗', '2017-10-19 01:27:19', '20', '30', '10');
INSERT INTO t_shopdetail VALUES ('3', '苏州仁爱路1号', '/wm/img/waxiangji.jpg', '健康早餐店', '主要是健康', '2017-11-01 01:29:15', '20', '15', '5');
INSERT INTO t_shopdetail VALUES ('4', '苏州仁爱路1号', '/wm/img/daniangshuijiao.jpeg', '大娘水饺,亲妈做的水饺', '家的味道,我知道', '2017-10-19 01:27:19', '20', '10', '5');
INSERT INTO t_shopdetail VALUES ('5', '苏州仁爱路1号', '/wm/img/ahao.jpg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '20', '15', '1');
INSERT INTO t_shopdetail VALUES ('6', '苏州仁爱路1号', '/wm/img/zhigen.jpg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '25', '20', '5');
INSERT INTO t_shopdetail VALUES ('7', '苏州仁爱路1号', '/wm/img/hualaishi.jpg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '20', '40', '5');
INSERT INTO t_shopdetail VALUES ('8', '苏州仁爱路1号', '/wm/img/you.jpeg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '20', '30', '5');
INSERT INTO t_shopdetail VALUES ('9', '苏州仁爱路1号', '/wm/img/yonghedawang.jpeg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '35', '25', '10');
INSERT INTO t_shopdetail VALUES ('10', '苏州仁爱路1号', '/wm/img/guoli.jpg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '56', '10', '15');
INSERT INTO t_shopdetail VALUES ('11', '苏州仁爱路1号', '/wm/img/kfc.jpeg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '33', '30', '15');
INSERT INTO t_shopdetail VALUES ('12', '苏州仁爱路12号', '/wm/img/maidanglao.jpeg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '54', '50', '10');
INSERT INTO t_shopdetail VALUES ('13', '苏州仁爱路1号31', '/wm/img/laogusu.png', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '34', '20', '6');
INSERT INTO t_shopdetail VALUES ('14', '上海仁爱路5号', '/wm/img/halouzhenji.jpg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '20', '10', '10');
INSERT INTO t_shopdetail VALUES ('15', '上海仁爱路34号', '/wm/img/daniangshuijiao.jpeg', '绝对好吃', '不好吃不要钱', '2017-10-19 01:27:19', '20', '40', '10');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginId` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  `currAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO t_user VALUES ('1', '111', '111', '习大大', '习大大', '男', '11111', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州路1号');
INSERT INTO t_user VALUES ('2', '222', '222', '刘晓晓', '刘晓晓', '男', '22222', '973026831@qq.com', '1', '/wm/img/head.png', '北京路8号');
INSERT INTO t_user VALUES ('3', '333', '333', '袁德德', '袁德德', '男', '33333', '2068618317@qq.com', '1', '/wm/img/head.png', '福州路6号');
INSERT INTO t_user VALUES ('4', '444', '444', '孔已', '孔已', '男', '44444', '2068618317@qq.com', '1', '/wm/img/head.png', '南京路88号');
INSERT INTO t_user VALUES ('5', 'zhouyi', 'zhouyi', '周一', '周一', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('6', 'zhouer', 'zhouer', '周二', '周二', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('7', 'zhousan', 'zhousan', '周三', '周三', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('8', 'zhousi', 'zhousi', '周四', '周四', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('9', 'zhouwu', 'zhouwu', '周五', '周五', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('10', 'zhouliu', 'zhouliu', '周六', '周六', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('11', 'zhouqi', 'zhouqi', '周期', '周期', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('12', 'zhouba', 'zhouba', '周八', '周八', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('13', 'zhoujiu', 'zhoujiu', '周九', '周九', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('14', 'zhangsan', 'zhangsan', '张三', '张三', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('15', 'zhangsi', 'zhangsi', '张四', '张四', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('16', 'lisi', 'lisi', '李四', '李四', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');
INSERT INTO t_user VALUES ('17', 'liwu', 'liwu', '李武', '李武', '男', '123123', '2068618317@qq.com', '1', '/wm/img/head.png', '苏州3号');

-- ----------------------------
-- Table structure for `t_useraddress`
-- ----------------------------
DROP TABLE IF EXISTS `t_useraddress`;
CREATE TABLE `t_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `defaultAddrFlag` bit(1) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKclrkjvej19oe5yupe1xkkcxuw` (`userId`),
  CONSTRAINT `FKclrkjvej19oe5yupe1xkkcxuw` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_useraddress
-- ----------------------------
INSERT INTO t_useraddress VALUES ('1', '习大大', '苏州路88号', '', '11111', '男', '1');
INSERT INTO t_useraddress VALUES ('2', '李丽', '北江路6号', '', '123', '男', '3');
INSERT INTO t_useraddress VALUES ('3', '王五', '仁爱路一号', '', '131467896', '男', '2');
INSERT INTO t_useraddress VALUES ('4', '李四', '高伯英诺', '', '456789', '男', '4');
INSERT INTO t_useraddress VALUES ('5', '张三', '仁爱路一号', '', '1234567890', '男', '1');
INSERT INTO t_useraddress VALUES ('7', '周三一', '苏州火车站', '', '46897946', '女', '7');
INSERT INTO t_useraddress VALUES ('8', '周三二', '石湖东路地铁站', '', '79461616', '女', '7');
INSERT INTO t_useraddress VALUES ('9', '周三三', '北京鸟巢', '', '469861649', '男', '7');

-- ----------------------------
-- Table structure for `t_user_shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_shop`;
CREATE TABLE `t_user_shop` (
  `shopId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`shopId`),
  KEY `FKme3dguha208gqcog7eger0des` (`shopId`),
  CONSTRAINT `FKme3dguha208gqcog7eger0des` FOREIGN KEY (`shopId`) REFERENCES `t_shop` (`id`),
  CONSTRAINT `FKdopfuvjbrxgv8jm3fklci8ejo` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_shop
-- ----------------------------
INSERT INTO t_user_shop VALUES ('1', '1');
INSERT INTO t_user_shop VALUES ('1', '3');
INSERT INTO t_user_shop VALUES ('2', '2');
INSERT INTO t_user_shop VALUES ('2', '5');

/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2016-05-03 10:04:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wj_admins`
-- ----------------------------
DROP TABLE IF EXISTS `wj_admins`;
CREATE TABLE `wj_admins` (
  `username` varchar(20) default NULL,
  `password` varchar(30) default NULL,
  `subpassword` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wj_admins
-- ----------------------------
INSERT INTO `wj_admins` VALUES ('admin', '2CB962AC59075B964B07152D234B70', '2CB962AC59075B964B07152D234B70');
INSERT INTO `wj_admins` VALUES ('qwe', '2CB962AC59075B964B07152D234B70', '2CB962AC59075B964B07152D234B70');
INSERT INTO `wj_admins` VALUES ('asd', '2CB962AC59075B964B07152D234B70', '2CB962AC59075B964B07152D234B70');
INSERT INTO `wj_admins` VALUES ('555', 'DE21C670AE7C3F6F3F1F37029303C9', '207FA2814E81A067BD2662BA10B0F1');
INSERT INTO `wj_admins` VALUES ('1111', '2CB962AC59075B964B07152D234B70', '4F3A834378C50F844E390F64C3E00A');
INSERT INTO `wj_admins` VALUES ('343', '2CB962AC59075B964B07152D234B70', '2CB962AC59075B964B07152D234B70');
INSERT INTO `wj_admins` VALUES ('123', '2CB962AC59075B964B07152D234B70', null);
INSERT INTO `wj_admins` VALUES ('qwer', '2CB962AC59075B964B07152D234B70', null);
INSERT INTO `wj_admins` VALUES ('1233', '2CB962AC59075B964B07152D234B70', null);
INSERT INTO `wj_admins` VALUES ('1233', '2CB962AC59075B964B07152D234B70', null);
INSERT INTO `wj_admins` VALUES ('1233', '2CB962AC59075B964B07152D234B70', null);
INSERT INTO `wj_admins` VALUES ('1233', '2CB962AC59075B964B07152D234B70', null);
INSERT INTO `wj_admins` VALUES ('cbf', '2CB962AC59075B964B07152D234B70', null);

-- ----------------------------
-- Table structure for `wj_answer`
-- ----------------------------
DROP TABLE IF EXISTS `wj_answer`;
CREATE TABLE `wj_answer` (
  `answerId` int(11) NOT NULL auto_increment COMMENT '答案Id',
  `replayId` int(11) NOT NULL COMMENT '回答者Id',
  `oid` int(11) NOT NULL COMMENT '回复主题Id',
  `qSeq` int(11) default NULL COMMENT '问题序号',
  `seSeq` int(11) default NULL COMMENT '选项序号',
  `seValue` varchar(1000) default NULL COMMENT '选项内容',
  `remark` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wj_answer
-- ----------------------------
INSERT INTO `wj_answer` VALUES ('35', '0', '0', null, null, null, null);
INSERT INTO `wj_answer` VALUES ('39', '16', '21', '1', '1', '1', null);
INSERT INTO `wj_answer` VALUES ('40', '16', '21', '2', '1', '1', null);
INSERT INTO `wj_answer` VALUES ('41', '16', '21', '3', '1', '123', null);
INSERT INTO `wj_answer` VALUES ('42', '17', '24', '1', '1', '20', null);
INSERT INTO `wj_answer` VALUES ('43', '17', '24', '2', '1', '20', null);
INSERT INTO `wj_answer` VALUES ('44', '17', '24', '3', '1', '20', null);
INSERT INTO `wj_answer` VALUES ('45', '17', '24', '4', '1', '6', null);
INSERT INTO `wj_answer` VALUES ('46', '17', '24', '5', '1', '', null);

-- ----------------------------
-- Table structure for `wj_object`
-- ----------------------------
DROP TABLE IF EXISTS `wj_object`;
CREATE TABLE `wj_object` (
  `oid` int(11) NOT NULL auto_increment,
  `title` varchar(1000) default NULL,
  `discribe` varchar(1000) default NULL,
  `createtime` timestamp NULL default NULL,
  `state` int(11) default NULL,
  `remark` varchar(200) default NULL,
  `anonymousFlag` char(1) default NULL COMMENT '是否匿名投递',
  `username` varchar(20) default NULL,
  `endtime` varchar(20) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wj_object
-- ----------------------------
INSERT INTO `wj_object` VALUES ('21', '员工思想动态调查问卷', '说明：\r\n1. 本调查问卷主要了解您对一些问题的看法，请认真作答。\r\n2. 问卷为不记名方式，您的个人信息和观点将受到严格保密。\r\n3. 问卷主要为单项选择题，少部分可多选，请按照要求作出选择。\r\n4. 每题必答，请注意不要漏答。', '2011-10-26 17:28:55', '2', null, '1', 'admin', null);
INSERT INTO `wj_object` VALUES ('22', 'asd 问卷', '1231331', '2016-04-26 17:13:51', '0', null, '1', 'asd', null);
INSERT INTO `wj_object` VALUES ('24', '第一小组', '评分标准：                                \r\n30分：30～27优秀；\r\n26～23 良好；\r\n22～18 及格；\r\n17～0 不及格；\r\n10分：10～9优秀；\r\n8～7 良好；\r\n6 及格；\r\n5～0 不及格\r\n\r\n小组成员：\r\n蔡晓鹏、陈振杰、张仲勋、黄玉尧\r\n\r\n项目名称：\r\n视频资讯APP', '2016-05-01 16:17:24', '1', null, '1', 'qwe', '2016-05-02');

-- ----------------------------
-- Table structure for `wj_question`
-- ----------------------------
DROP TABLE IF EXISTS `wj_question`;
CREATE TABLE `wj_question` (
  `oid` int(11) default NULL,
  `content` varchar(1000) default NULL,
  `qtype` int(11) default NULL,
  `seq` int(11) default NULL,
  `remark` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wj_question
-- ----------------------------
INSERT INTO `wj_question` VALUES ('21', '您的姓别', '0', '1', '');
INSERT INTO `wj_question` VALUES ('21', '您的年龄', '0', '2', '');
INSERT INTO `wj_question` VALUES ('21', '建议意见', '3', '3', '');
INSERT INTO `wj_question` VALUES ('24', '功能的完整性和可用性(30分)', '3', '1', null);
INSERT INTO `wj_question` VALUES ('24', '技术实现的难度  (30分)', '3', '2', null);
INSERT INTO `wj_question` VALUES ('24', '用户体验分析及改进    (30分)', '3', '3', null);
INSERT INTO `wj_question` VALUES ('24', '团队分工和合作的效果（10分）', '3', '4', null);
INSERT INTO `wj_question` VALUES ('24', '评语和建议', '3', '5', null);

-- ----------------------------
-- Table structure for `wj_replay`
-- ----------------------------
DROP TABLE IF EXISTS `wj_replay`;
CREATE TABLE `wj_replay` (
  `replayId` int(11) NOT NULL auto_increment COMMENT '回复ID',
  `replayCode` varchar(100) NOT NULL COMMENT '回复者代码',
  `replayIp` varchar(100) NOT NULL COMMENT '回复者IP',
  `oid` int(11) NOT NULL COMMENT '主题Id',
  `replayTime` timestamp NULL default NULL COMMENT '回复时间',
  `remark` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`replayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='回复内容表';

-- ----------------------------
-- Records of wj_replay
-- ----------------------------
INSERT INTO `wj_replay` VALUES ('16', 'anonymous', '0:0:0:0:0:0:0:1', '21', '2016-04-24 16:35:04', '');
INSERT INTO `wj_replay` VALUES ('17', 'anonymous', '0:0:0:0:0:0:0:1', '24', '2016-05-01 16:24:48', '');

-- ----------------------------
-- Table structure for `wj_selecter`
-- ----------------------------
DROP TABLE IF EXISTS `wj_selecter`;
CREATE TABLE `wj_selecter` (
  `oid` int(11) default NULL,
  `qseq` int(11) default NULL,
  `content` varchar(1000) default NULL,
  `selseq` int(11) default NULL,
  `remark` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wj_selecter
-- ----------------------------
INSERT INTO `wj_selecter` VALUES ('21', '1', 'A 男', '1', null);
INSERT INTO `wj_selecter` VALUES ('21', '1', 'B 女', '2', null);
INSERT INTO `wj_selecter` VALUES ('21', '2', 'A 25岁以下', '1', null);
INSERT INTO `wj_selecter` VALUES ('21', '2', 'B 25~30岁', '2', null);
INSERT INTO `wj_selecter` VALUES ('21', '2', 'C 30岁以上', '3', null);
INSERT INTO `wj_selecter` VALUES ('21', '3', '写出您的建议，意见', '0', null);
INSERT INTO `wj_selecter` VALUES ('24', '1', '', '1', null);
INSERT INTO `wj_selecter` VALUES ('24', '2', '', '1', null);
INSERT INTO `wj_selecter` VALUES ('24', '3', '', '1', null);
INSERT INTO `wj_selecter` VALUES ('24', '4', '', '1', null);
INSERT INTO `wj_selecter` VALUES ('24', '5', '', '1', null);

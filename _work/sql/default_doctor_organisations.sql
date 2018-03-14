/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-14 16:26:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `default_doctor_organisations`
-- ----------------------------
DROP TABLE IF EXISTS `default_doctor_organisations`;
CREATE TABLE `default_doctor_organisations` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `organisation` int(11) DEFAULT NULL,
  `organisation_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_organisations
-- ----------------------------
INSERT INTO `default_doctor_organisations` VALUES ('1', '2018-03-14 14:47:35', '2018-03-14 15:09:43', '1', '1', null, 'test Root');
INSERT INTO `default_doctor_organisations` VALUES ('2', '2018-03-14 14:49:59', '2018-03-14 15:03:00', '1', '2', '1', 'test2');
INSERT INTO `default_doctor_organisations` VALUES ('3', '2018-03-14 15:03:17', null, '1', '3', '1', 'test3');
INSERT INTO `default_doctor_organisations` VALUES ('4', '2018-03-14 15:04:27', null, '1', '4', '1', 'test1');
INSERT INTO `default_doctor_organisations` VALUES ('5', '2018-03-14 15:04:47', null, '1', '5', '4', 'test1.1');
INSERT INTO `default_doctor_organisations` VALUES ('6', '2018-03-14 15:05:03', null, '1', '6', '2', 'test2.1');
INSERT INTO `default_doctor_organisations` VALUES ('7', '2018-03-14 15:05:15', null, '1', '7', '2', 'test2.2');

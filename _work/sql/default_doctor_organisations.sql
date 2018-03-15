/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-14 18:48:35
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
  `subset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_organisations
-- ----------------------------
INSERT INTO `default_doctor_organisations` VALUES ('1', '2018-03-14 14:47:35', '2018-03-14 17:42:33', '1', '1', null, 'Privée');
INSERT INTO `default_doctor_organisations` VALUES ('2', '2018-03-14 14:49:59', '2018-03-14 17:43:03', '1', '2', '2', 'Publique');
INSERT INTO `default_doctor_organisations` VALUES ('3', '2018-03-14 15:03:17', null, '1', '3', '1', 'test3');
INSERT INTO `default_doctor_organisations` VALUES ('4', '2018-03-14 15:04:27', '2018-03-14 17:37:51', '1', '4', '1', 'Clinique privée');
INSERT INTO `default_doctor_organisations` VALUES ('5', '2018-03-14 15:04:47', '2018-03-14 17:44:08', '1', '5', '1', 'Soins à domicile');
INSERT INTO `default_doctor_organisations` VALUES ('6', '2018-03-14 15:05:03', '2018-03-14 17:43:23', '1', '6', '2', 'Hopital ');
INSERT INTO `default_doctor_organisations` VALUES ('7', '2018-03-14 15:05:15', '2018-03-14 17:43:38', '1', '7', '2', 'Dispensaire');

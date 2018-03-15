/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-14 19:00:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `default_doctor_doctors`
-- ----------------------------
DROP TABLE IF EXISTS `default_doctor_doctors`;
CREATE TABLE `default_doctor_doctors` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `days` text COLLATE utf8_unicode_ci,
  `hours` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opens` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closes` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_per_day` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_cat` int(11) DEFAULT NULL,
  `groupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_doctors
-- ----------------------------
INSERT INTO `default_doctor_doctors` VALUES ('1', '2018-03-14 17:55:57', null, '1', '1', null, '0', null, null, null, null, null, '0678957826', null, 'radjal@free.fr', '4 allée Jacques Ibert, 91240', '77820', 'Saint Michel sur Orge', 'dummy', '1', '1');
INSERT INTO `default_doctor_doctors` VALUES ('2', '2018-03-14 17:56:23', '2018-03-14 18:00:09', '1', '2', 'test', '1\n2\n3\n0', null, null, null, null, '', '0678957826', null, 'radjal@free.fr', '4 allée Jacques Ibert, 91240', '77820', 'Saint Michel sur Orge', 'dummy', '2', '2');

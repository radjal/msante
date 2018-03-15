/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-14 18:48:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `default_doctor_categories`
-- ----------------------------
DROP TABLE IF EXISTS `default_doctor_categories`;
CREATE TABLE `default_doctor_categories` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `speciality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_cat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_categories
-- ----------------------------
INSERT INTO `default_doctor_categories` VALUES ('1', '2018-03-10 01:54:40', null, '1', '1', 'Médecins généralistes', null, null);
INSERT INTO `default_doctor_categories` VALUES ('2', '2018-03-10 01:54:47', null, '1', '2', 'Ophtalmologue', null, null);
INSERT INTO `default_doctor_categories` VALUES ('3', '2018-03-10 01:54:53', null, '1', '3', 'ORL', null, null);
INSERT INTO `default_doctor_categories` VALUES ('4', '2018-03-10 01:54:59', null, '1', '4', 'Cardiologue', null, null);
INSERT INTO `default_doctor_categories` VALUES ('5', '2018-03-10 01:55:05', null, '1', '5', 'Spécialistes femme', null, null);
INSERT INTO `default_doctor_categories` VALUES ('6', '2018-03-10 01:55:12', null, '1', '6', 'Dentiste', null, null);
INSERT INTO `default_doctor_categories` VALUES ('7', '2018-03-10 01:55:17', null, '1', '7', 'Radiologue', null, null);
INSERT INTO `default_doctor_categories` VALUES ('8', '2018-03-10 01:55:22', null, '1', '8', 'Autres médecins', null, null);
INSERT INTO `default_doctor_categories` VALUES ('9', '2018-03-10 01:55:27', null, '1', '9', 'Etablissements de santé', null, null);

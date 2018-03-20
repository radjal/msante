/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-19 13:06:27
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
  `parent_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_categories
-- ----------------------------
INSERT INTO `default_doctor_categories` VALUES ('1', '2018-03-10 01:54:40', null, '1', '1', 'Médecins généralistes', null);
INSERT INTO `default_doctor_categories` VALUES ('2', '2018-03-10 01:54:47', '2018-03-14 22:49:06', '1', '2', 'Sage femme', '5');
INSERT INTO `default_doctor_categories` VALUES ('3', '2018-03-10 01:54:53', null, '1', '3', 'ORL', null);
INSERT INTO `default_doctor_categories` VALUES ('4', '2018-03-10 01:54:59', null, '1', '4', 'Cardiologue', null);
INSERT INTO `default_doctor_categories` VALUES ('5', '2018-03-10 01:55:05', null, '1', '5', 'Spécialistes femme', null);
INSERT INTO `default_doctor_categories` VALUES ('6', '2018-03-10 01:55:12', null, '1', '6', 'Dentiste', null);
INSERT INTO `default_doctor_categories` VALUES ('7', '2018-03-10 01:55:17', null, '1', '7', 'Radiologue', null);
INSERT INTO `default_doctor_categories` VALUES ('8', '2018-03-10 01:55:22', null, '1', '8', 'Autres médecins', null);
INSERT INTO `default_doctor_categories` VALUES ('9', '2018-03-10 01:55:27', null, '1', '9', 'Etablissements de santé', null);
INSERT INTO `default_doctor_categories` VALUES ('10', '2018-03-15 00:11:43', null, '1', '10', 'Chirurgien dentiste', '6');
INSERT INTO `default_doctor_categories` VALUES ('11', '2018-03-15 00:11:58', null, '1', '11', 'Pédiatre', '8');
INSERT INTO `default_doctor_categories` VALUES ('12', '2018-03-15 00:12:15', null, '1', '12', 'Gynécologue obstétrique ou médical', null);
INSERT INTO `default_doctor_categories` VALUES ('13', '2018-03-15 00:12:24', null, '1', '13', 'Ostéopathe', null);
INSERT INTO `default_doctor_categories` VALUES ('14', '2018-03-15 00:12:34', null, '1', '14', 'Pédicure – Podologue', null);
INSERT INTO `default_doctor_categories` VALUES ('15', '2018-03-15 00:31:48', null, '1', '15', 'Sage – femme', '5');
INSERT INTO `default_doctor_categories` VALUES ('16', '2018-03-15 00:31:56', null, '1', '16', 'Allergologue', '3');
INSERT INTO `default_doctor_categories` VALUES ('17', '2018-03-15 00:32:02', null, '1', '17', 'Urologue', null);
INSERT INTO `default_doctor_categories` VALUES ('18', '2018-03-15 00:32:09', null, '1', '18', 'Rhumatologue', null);
INSERT INTO `default_doctor_categories` VALUES ('19', '2018-03-15 00:32:15', null, '1', '19', 'Endocrinologue', null);
INSERT INTO `default_doctor_categories` VALUES ('20', '2018-03-15 00:32:26', null, '1', '20', 'Stomatologue', null);
INSERT INTO `default_doctor_categories` VALUES ('21', '2018-03-15 00:32:33', null, '1', '21', 'Orthopédiste', null);
INSERT INTO `default_doctor_categories` VALUES ('22', '2018-03-15 00:32:40', null, '1', '22', 'Diététicien', null);
INSERT INTO `default_doctor_categories` VALUES ('23', '2018-03-15 00:32:46', null, '1', '23', 'Psychologue', null);
INSERT INTO `default_doctor_categories` VALUES ('24', '2018-03-15 00:33:02', null, '1', '24', 'Psychiatre', null);
INSERT INTO `default_doctor_categories` VALUES ('25', '2018-03-15 00:33:19', null, '1', '25', 'Neurologue', null);
INSERT INTO `default_doctor_categories` VALUES ('26', '2018-03-15 00:33:30', null, '1', '26', 'Gastro-entérologue et hépatologue', null);
INSERT INTO `default_doctor_categories` VALUES ('27', '2018-03-15 02:53:55', null, '1', '27', 'Médecin du sport', null);

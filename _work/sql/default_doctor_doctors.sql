/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-04-06 05:20:43
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
  `validated` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rngps` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` text COLLATE utf8_unicode_ci,
  `week_settings` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacation_start` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacation_end` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `access` longtext COLLATE utf8_unicode_ci,
  `languages` longtext COLLATE utf8_unicode_ci,
  `diploma` longtext COLLATE utf8_unicode_ci,
  `fees` longtext COLLATE utf8_unicode_ci,
  `payment` longtext COLLATE utf8_unicode_ci,
  `insurance` text COLLATE utf8_unicode_ci,
  `homecall` text COLLATE utf8_unicode_ci,
  `latitude` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_cat` int(11) DEFAULT NULL,
  `groupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_doctors
-- ----------------------------
INSERT INTO `default_doctor_doctors` VALUES ('1', '2018-03-14 22:48:11', null, '1', '1', 'no', 'Radja Lomas', null, null, null, null, null, null, '0678957826', '0678957826', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', '77820', null, 'Bondoufle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', null, null, null, null, null, null, null, null, null, 'dummy', '1', '4');
INSERT INTO `default_doctor_doctors` VALUES ('2', '2018-03-14 23:29:25', null, '1', '2', 'no', 'Lomas', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '4 allée Jacques Ibert', '189610', null, 'Saint Michel sur Orge', 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', null, null, null, null, null, null, null, null, null, 'dummy', '3', '1');
INSERT INTO `default_doctor_doctors` VALUES ('3', '2018-03-15 01:33:59', null, '1', '3', 'no', 'Bretin Jean', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '10 Rue du Plessier', '77820', null, 'Le Châtelet-en-Brie', 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', null, null, null, null, null, null, null, null, null, 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('4', '2018-03-15 01:34:44', null, '1', '4', 'no', 'Dodin Frédéric', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '16 Allée de la Clairière,', '77820', null, 'Le Châtelet-en-Brie', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', null, null, null, null, null, null, null, null, null, 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('5', '2018-03-15 01:35:33', '2018-03-15 01:36:54', '1', '5', 'no', 'Quilain Marie', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '16 Allée de la Clairière,', '77820', null, 'Le Châtelet-en-Brie', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', null, null, null, null, null, null, null, null, null, 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('6', '2018-03-15 01:36:35', null, '1', '6', 'no', 'SCM des Docteurs Gest et Raad', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '13 Quai Maréchal Foch', '77000', null, 'Melun', 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', null, null, null, null, null, null, null, null, null, 'dummy', '4', null);
INSERT INTO `default_doctor_doctors` VALUES ('7', '2018-03-15 01:37:36', null, '1', '7', 'no', 'Docteur Salim Meliani', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '1 Rue des Sapins', '77210', null, 'Avon', 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', null, null, null, null, null, null, null, null, null, 'dummy', '24', null);
INSERT INTO `default_doctor_doctors` VALUES ('8', '2018-03-15 01:38:53', null, '1', '8', 'no', 'Docteur Allanche Laurent - Chirurgien ORL', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '54 Boulevard Aristide Briand', '77000', null, 'Melun', 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', null, null, null, null, null, null, null, null, null, 'dummy', '3', null);
INSERT INTO `default_doctor_doctors` VALUES ('9', '2018-03-15 02:57:18', null, '1', '9', 'no', 'Docteur Guillaume Paris - Médecin du sport', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '2A Avenue de Ségur', '75007', null, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', null, null, null, null, null, null, null, null, null, 'dummy', '27', null);
INSERT INTO `default_doctor_doctors` VALUES ('10', '2018-03-15 02:58:15', null, '1', '10', 'no', 'CENTRE DE CONSULTATIONS MÉDICALES 24H/24 À PARIS', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '2 Rue d\'Alexandrie', '75002', null, 'Paris', 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', null, null, null, null, null, null, null, null, null, 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('11', '2018-03-15 02:58:44', null, '1', '11', 'no', 'Dr GHERRAK Sandrine - Généraliste Paris 5', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '7 Rue Berthollet', '75005', null, 'Paris', 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', null, null, null, null, null, null, null, null, null, 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('12', '2018-03-15 02:59:46', null, '1', '12', 'no', 'Docteur Olivier Kadoch - Gynécologue', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '107 Avenue Victor Hugo', '75016', null, 'Paris', 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', null, null, null, null, null, null, null, null, null, 'dummy', '12', null);
INSERT INTO `default_doctor_doctors` VALUES ('13', '2018-03-15 03:01:24', '2018-03-28 21:10:13', '1', '13', 'no', 'Dr Ari Elhyani Dentiste Paris', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '11 Avenue de l\'Opéra', '75001', null, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', null, null, null, null, null, null, null, null, null, 'dummy', '6', null);
INSERT INTO `default_doctor_doctors` VALUES ('14', '2018-03-15 03:02:27', '2018-03-30 23:50:35', '1', '14', 'no', 'Dr Fabien Mauro', null, null, null, null, null, null, '0678957826', '0678957826', 'email@nowhere.com', '18 Rue de Turbigo', '75002', null, 'Paris', 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', null, null, null, null, null, null, null, null, null, '699df7530ec4c93', '6', '1');
INSERT INTO `default_doctor_doctors` VALUES ('15', '2018-03-31 00:00:17', '2018-04-05 21:55:09', '12', '15', 'yes', 'LAMAH Simon Pière', '0000000', '1\n2\n3\n4\n5', null, null, null, null, '664256124', null, null, 'Route de Nézérékoré', 'Nézérékoré', null, 'Nézérékoré', 'Le  Cabinet est situé à Donka', '', '', '', '', '', 'no', '', null, null, '55b8dff41b6c29b', null, null);
INSERT INTO `default_doctor_doctors` VALUES ('16', '2018-04-06 02:42:09', '2018-04-06 02:47:31', '1', '16', 'yes', 'test', '0000', '1\n2\n3\n4\n5', null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', 'no', '', null, null, 'dummy', null, null);

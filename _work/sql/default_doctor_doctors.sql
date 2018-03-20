/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-19 13:06:06
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
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_doctors
-- ----------------------------
INSERT INTO `default_doctor_doctors` VALUES ('1', '2018-03-14 22:48:11', null, '1', '1', 'Radja Lomas', '0', null, '0800', '1600', null, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', '77820', 'Bondoufle', 'dummy', '1', '4');
INSERT INTO `default_doctor_doctors` VALUES ('2', '2018-03-14 23:29:25', null, '1', '2', 'Lomas', '1\n2\n3\n4\n0', null, '0800', '1800', null, 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', '0678957826', '0678957826', 'email@nowhere.com', '4 allée Jacques Ibert', '189610', 'Saint Michel sur Orge', 'dummy', '3', '1');
INSERT INTO `default_doctor_doctors` VALUES ('3', '2018-03-15 01:33:59', null, '1', '3', 'Bretin Jean', '1\n2\n3\n4\n5', null, '0900', '1800', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '10 Rue du Plessier', '77820', 'Le Châtelet-en-Brie', 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('4', '2018-03-15 01:34:44', null, '1', '4', 'Dodin Frédéric', '0', null, '0800', '1930', null, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '16 Allée de la Clairière,', '77820', 'Le Châtelet-en-Brie', 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('5', '2018-03-15 01:35:33', '2018-03-15 01:36:54', '1', '5', 'Quilain Marie', '0', null, '0900', '1930', null, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '16 Allée de la Clairière,', '77820', 'Le Châtelet-en-Brie', 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('6', '2018-03-15 01:36:35', null, '1', '6', 'SCM des Docteurs Gest et Raad', '0', null, '0830', '1930', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '13 Quai Maréchal Foch', '77000', 'Melun', 'dummy', '4', null);
INSERT INTO `default_doctor_doctors` VALUES ('7', '2018-03-15 01:37:36', null, '1', '7', 'Docteur Salim Meliani', '0', null, '0830', '1800', null, 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', '0678957826', '0678957826', 'email@nowhere.com', '1 Rue des Sapins', '77210', 'Avon', 'dummy', '24', null);
INSERT INTO `default_doctor_doctors` VALUES ('8', '2018-03-15 01:38:53', null, '1', '8', 'Docteur Allanche Laurent - Chirurgien ORL', '0', null, '0830', '1930', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '54 Boulevard Aristide Briand', '77000', 'Melun', 'dummy', '3', null);
INSERT INTO `default_doctor_doctors` VALUES ('9', '2018-03-15 02:57:18', null, '1', '9', 'Docteur Guillaume Paris - Médecin du sport', '2\n3\n4', null, '0830', '2000', null, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '2A Avenue de Ségur', '75007', 'Paris', 'dummy', '27', null);
INSERT INTO `default_doctor_doctors` VALUES ('10', '2018-03-15 02:58:15', null, '1', '10', 'CENTRE DE CONSULTATIONS MÉDICALES 24H/24 À PARIS', '1\n2\n3\n4\n5\n6\n0', null, '0000', '2359', null, 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', '0678957826', '0678957826', 'email@nowhere.com', '2 Rue d\'Alexandrie', '75002', 'Paris', 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('11', '2018-03-15 02:58:44', null, '1', '11', 'Dr GHERRAK Sandrine - Généraliste Paris 5', '0', null, '0900', '1800', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '7 Rue Berthollet', '75005', 'Paris', 'dummy', '1', null);
INSERT INTO `default_doctor_doctors` VALUES ('12', '2018-03-15 02:59:46', null, '1', '12', 'Docteur Olivier Kadoch - Gynécologue', '0', null, '0900', '1800', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '107 Avenue Victor Hugo', '75016', 'Paris', 'dummy', '12', null);
INSERT INTO `default_doctor_doctors` VALUES ('13', '2018-03-15 03:01:24', '2018-03-19 11:55:32', '1', '13', 'Dr Ari Elhyani Dentiste Paris', '1\n2\n3\n4\n5', null, '0900', '1930', null, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '11 Avenue de l\'Opéra', '75001', 'Paris', 'dummy', '6', null);
INSERT INTO `default_doctor_doctors` VALUES ('14', '2018-03-15 03:02:27', '2018-03-19 12:03:34', '1', '14', 'Dr Fabien Mauro', '1\n2\n3\n4\n5\n6', null, '0900', '2000', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '18 Rue de Turbigo', '75002', 'Paris', 'dummy', '6', null);

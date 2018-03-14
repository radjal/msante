/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-14 12:26:55
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
  `hours` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areaname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dom_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_doctors
-- ----------------------------
INSERT INTO `default_doctor_doctors` VALUES ('1', '2018-03-10 02:03:36', null, '1', '1', 'Docteur 1', '1\n2\n3\n4\n5', '9h - 18h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', '0678957826', 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '91240', 'dummy', null, '1');
INSERT INTO `default_doctor_doctors` VALUES ('2', '2018-03-10 02:04:08', '2018-03-10 14:04:49', '1', '2', 'Docteur 2', '1\n2\n3\n4\n5', '9h-18h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', '0678957826', 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '91240', '180b3afb6e90e86', null, '2');
INSERT INTO `default_doctor_doctors` VALUES ('3', '2018-03-10 02:04:37', '2018-03-10 02:04:53', '1', '3', 'ORL', '1\n2\n3\n4\n5', '9h-17h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', '0678957826', 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '91240', 'dummy', null, '3');
INSERT INTO `default_doctor_doctors` VALUES ('4', '2018-03-10 02:05:36', null, '1', '4', 'Cardiologue', '1\n2\n3\n4\n5', '10-17h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', '0678957826', 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '91240', 'dummy', null, '4');
INSERT INTO `default_doctor_doctors` VALUES ('5', '2018-03-10 02:06:12', null, '1', '5', 'Specialiste femme', '1\n2\n3\n4', '10h-19h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', '0678957826', 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '91240', 'dummy', null, '5');
INSERT INTO `default_doctor_doctors` VALUES ('6', '2018-03-10 02:06:51', '2018-03-10 14:02:55', '1', '6', 'Dentiste', '1\n2\n3\n4\n5', '11h-20h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', null, 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '91240', '610effe9e3a37da', null, '6');
INSERT INTO `default_doctor_doctors` VALUES ('7', '2018-03-10 02:07:32', '2018-03-10 14:02:30', '1', '7', 'Radiologue', '1\n2\n3\n4\n5', '10h-18h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', '0678957826', '0678957826', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', 'Bondoufle', '91070', '332ff0453ca83cf', null, '7');
INSERT INTO `default_doctor_doctors` VALUES ('8', '2018-03-10 02:08:25', '2018-03-10 14:02:18', '1', '8', 'Oncologie', '1\n2\n3\n4\n5', '', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', null, null, null, '128 rue la boetie', 'paris', '75008', 'ea2a0fc0570f0b4', null, '8');
INSERT INTO `default_doctor_doctors` VALUES ('9', '2018-03-10 02:08:56', '2018-03-10 14:01:56', '1', '9', 'dentiste 2', '1\n2\n3\n4\n5', '10h-16h', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié.', null, null, null, '128 rue la boetie', 'paris', '75008', '9b993098e622829', null, '6');
INSERT INTO `default_doctor_doctors` VALUES ('10', '2018-03-10 14:16:32', null, '1', '10', 'Etablissements de santé', '1\n2\n3\n4\n5', '8h-22h', null, '0678957826', null, 'r4dj4l@gmail.com', '8 Ruelle des Roches', 'Le Châtelet-en-Brie', '77820', '2b781400023de91', null, '9');

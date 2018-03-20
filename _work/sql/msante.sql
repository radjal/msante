/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-03-20 05:56:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `core_settings`
-- ----------------------------
DROP TABLE IF EXISTS `core_settings`;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

-- ----------------------------
-- Records of core_settings
-- ----------------------------
INSERT INTO `core_settings` VALUES ('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y');
INSERT INTO `core_settings` VALUES ('lang_direction', 'ltr', 'ltr');
INSERT INTO `core_settings` VALUES ('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- ----------------------------
-- Table structure for `core_sites`
-- ----------------------------
DROP TABLE IF EXISTS `core_sites`;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_sites
-- ----------------------------
INSERT INTO `core_sites` VALUES ('1', 'Default Site', 'default', 'msante.localhost', '1', '1495107566', '0');

-- ----------------------------
-- Table structure for `core_users`
-- ----------------------------
DROP TABLE IF EXISTS `core_users`;
CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';

-- ----------------------------
-- Records of core_users
-- ----------------------------
INSERT INTO `core_users` VALUES ('1', 'radjal@free.fr', '856fa1e87fe6161cdd5a13b725026af856d090db', '4cd53', '1', '', '1', '', '1495107565', '1495107565', 'admin', null, null);

-- ----------------------------
-- Table structure for `default_appointments_details`
-- ----------------------------
DROP TABLE IF EXISTS `default_appointments_details`;
CREATE TABLE `default_appointments_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:01',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_appointments_details
-- ----------------------------

-- ----------------------------
-- Table structure for `default_appointments_list`
-- ----------------------------
DROP TABLE IF EXISTS `default_appointments_list`;
CREATE TABLE `default_appointments_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `doctor_id` int(11) NOT NULL DEFAULT '0',
  `appointment_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `appointment_date` int(11) NOT NULL DEFAULT '0',
  `appointment_time` int(4) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `maiden_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `other_person` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `town` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `area_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `total_pretax` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `total_final` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:01',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_appointments_list
-- ----------------------------
INSERT INTO `default_appointments_list` VALUES ('1', '1', '14', 'waiting', '20180321', '800', '', 'Mcbride', 'Celeste', 'Lomas', '', 'yes', '631618811', '678957826', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', 'Bondoufle', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', null, null);
INSERT INTO `default_appointments_list` VALUES ('2', '1', '11', '', '20180323', '800', '', 'Paumelle', 'Radja', 'Lomas', '', 'yes', '631618811', '631618811', '', '17 rue Gutenberg', '', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', null, null);
INSERT INTO `default_appointments_list` VALUES ('3', '1', '14', '', '20180329', '800', '', 'Mcbride', 'Celeste', 'Lomas', '', 'yes', '678957826', '678957826', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', 'Bondoufle', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', null, null);
INSERT INTO `default_appointments_list` VALUES ('4', '1', '14', '', '20180322', '800', null, 'Mcbride', 'Celeste', 'Mcbride', '', 'no', '', '678957826', 'radjal@free.fr', '4 all�e Jacques Ibert, 91240', 'Saint Michel sur Orge', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', null, null);
INSERT INTO `default_appointments_list` VALUES ('5', '1', '10', '', '20180320', '900', null, 'Paumelle', 'Radja', 'Lomas', '', 'no', '', '678957826', '', '17 rue Gutenberg', 'Bondoufle', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-19 20:01:00', null);
INSERT INTO `default_appointments_list` VALUES ('6', '3', '11', '', '20180322', '1000', null, '', 'Denis', 'Quaid', '', 'no', '631618811', '678957826', '', '8 Ruelle des Roches', '', '75002', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-19 20:02:00', null);
INSERT INTO `default_appointments_list` VALUES ('7', '4', '10', '', '20180319', '830', null, '', 'Daniel', 'Guilbert', '', 'no', '', '631618811', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', 'Bondoufle', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-19 20:16:00', null);
INSERT INTO `default_appointments_list` VALUES ('83', '3', '6', '', '20180315', '1330', null, '', 'Kylee', 'Bernard', '', 'no', '06 66 83 92 56', '1-164-918-6181', 'tellus@cursus.org', 'P.O. Box 958, 3484 Natoque Avenue', 'Dublin', 'L', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('84', '2', '9', '', '20180319', '1472', null, 'Sanford', 'Ethan', 'Sanford', '', 'no', '07 83 18 20 11', '1-939-328-2545', 'ipsum.nunc@mifringillami.org', 'Ap #362-3264 Risus. Rd.', 'Dutse', 'Jigawa', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('85', '2', '13', '', '20180322', '1476', null, 'Sanford', 'Ethan', 'Sanford', '', 'no', '06 40 36 22 07', '1-300-790-1262', 'libero.Proin@interdum.co.uk', 'Ap #362-3264 Risus. Rd.', 'Dutse', 'Jigawa', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('86', '2', '12', '', '20180324', '1526', null, '', 'Rana', 'Mcconnell', '', 'no', '07 77 71 19 64', '1-959-746-2953', 'augue@auctor.co.uk', '7413 Ac Rd.', 'Seattle', 'Washington', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('87', '3', '2', '', '20180327', '858', null, 'Sanford', 'Ethan', 'Sanford', '', 'no', '09 27 45 02 85', '1-118-871-0487', 'leo.elementum.sem@odioauctorvitae.com', 'Ap #362-3264 Risus. Rd.', 'Dutse', 'Jigawa', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('88', '3', '13', '', '20180325', '1140', null, '', 'Zelda', 'Howell', '', 'no', '07 24 35 60 61', '1-859-471-0690', 'eget@enimSuspendisse.edu', '2503 Placerat, Avenue', 'Pabianice', '?�dzkie', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('89', '4', '12', '', '20180323', '1354', null, '', 'Carson', 'Bird', '', 'no', '06 25 68 76 91', '1-527-312-6875', 'convallis.est@egetmetusIn.com', '629-1060 Id, Rd.', 'Crehen', 'Luik', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('90', '3', '13', '', '20180327', '1178', null, '', 'Noble', 'Medina', '', 'no', '01 60 94 05 83', '1-331-152-3581', 'pellentesque.massa@velit.ca', '1689 Lorem St.', 'Buckie', 'BA', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('91', '2', '12', '', '20180324', '1078', null, 'Sanford', 'Angela', 'Sanford', '', 'no', '02 36 27 26 84', '1-691-748-9291', 'at.auctor.ullamcorper@a.ca', 'P.O. Box 822, 130 Fames Rd.', 'La Valle/Wengen', 'Trentino-Alto Adige', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('92', '3', '4', '', '20180323', '1585', null, '', 'Walter', 'Goff', '', 'no', '06 20 19 21 11', '1-381-248-2957', 'libero.Proin.sed@nibhvulputatemauris.org', 'P.O. Box 110, 1059 Nonummy. Road', 'Sagamu', 'Ogun', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('93', '1', '10', '', '20180327', '1481', null, '', 'Radja', 'Lomas', '', 'no', '09 34 52 55 92', '1-349-770-2005', 'et.tristique@eros.com', 'Ap #581-8525 Nulla Street', 'Okene', 'KO', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('94', '2', '8', '', '20180323', '1669', null, '', 'Shaeleigh', 'Watson', '', 'no', '03 59 50 74 94', '1-801-960-9863', 'Nunc.ac.sem@faucibusutnulla.com', 'Ap #999-8166 Ipsum. St.', 'Martigues', 'PR', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('95', '4', '1', '', '20180322', '1675', null, '', 'Sacha', 'Emerson', '', 'no', '01 64 61 50 10', '1-557-135-3811', 'metus.In.nec@Aliquam.org', 'Ap #848-2265 Vel Rd.', 'Tarn�w', 'Ma?opolskie', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('96', '2', '9', '', '20180320', '1090', null, 'Sanford', 'Buffy', 'Sanford', '', 'no', '01 73 63 89 99', '1-591-901-0042', 'gravida.Aliquam.tincidunt@Integer.co.uk', 'P.O. Box 679, 3599 Nec Rd.', 'Illkirch-Graffenstaden', 'AL', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('97', '4', '8', '', '20180315', '1049', null, '', 'Rebecca', 'Christensen', '', 'no', '08 17 27 15 63', '1-497-258-2373', 'Etiam@Proin.co.uk', 'Ap #700-9585 Lorem St.', 'Heredia', 'Heredia', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('98', '2', '8', '', '20180325', '1408', null, '', 'Phoebe', 'Blankenship', '', 'no', '04 13 44 67 36', '1-201-860-8573', 'hendrerit@id.ca', 'P.O. Box 792, 571 Cras Road', 'Nanterre', '�le-de-France', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('99', '3', '1', '', '20180321', '1558', null, '', 'Imogene', 'Bentley', '', 'no', '04 74 48 34 87', '1-248-967-0866', 'ultrices.posuere.cubilia@lectusconvallisest.org', 'P.O. Box 680, 8757 Urna, Ave', 'Belfast', 'Ulster', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('100', '1', '1', '', '20180316', '885', null, '', 'Radja', 'Lomas', '', 'no', '02 21 34 43 55', '1-884-585-3238', 'lorem.Donec.elementum@DonecegestasDuis.com', '2252 Ultrices. Rd.', 'Galway', 'Connacht', '', '', '0', '0', null, null, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `default_appointments_list` VALUES ('101', '3', '13', '', '20180417', '1158', null, '', 'Randall', 'Lynn', '', 'no', '09 59 29 45 00', '1-182-608-0327', 'elit@dignissimtemporarcu.org', '8138 A, St.', 'Tambaram', 'TN', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('102', '1', '11', '', '20180412', '1269', '', '', 'Radja', 'Lomas', '', 'yes', '04 71 64 91 18', '1-448-526-4953', 'Proin.vel@placeratvelitQuisque.co.uk', 'Ap #345-4204 Aliquam Rd.', 'Funtua', 'Katsina', '', '', '0', '0', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('103', '3', '5', '', '20180406', '1065', null, '', 'Blossom', 'Willis', '', 'no', '05 41 66 66 70', '1-352-118-5565', 'Mauris.vel.turpis@vulputateullamcorper.ca', '1327 Parturient St.', 'Morwell', 'VIC', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('104', '3', '2', '', '20180401', '1108', null, '', 'Eleanor', 'Wiley', '', 'no', '09 96 76 83 42', '1-420-602-8675', 'Fusce.aliquam@sapien.org', 'P.O. Box 203, 9453 Magna Rd.', 'Pepingen', 'Vlaams-Brabant', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('105', '3', '5', '', '20180424', '1443', null, '', 'Paloma', 'Humphrey', '', 'no', '01 33 33 36 02', '1-917-444-6194', 'feugiat.non.lobortis@diam.com', 'P.O. Box 257, 171 Vitae, Av.', 'Galway', 'Connacht', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('106', '4', '11', '', '20180414', '1132', null, '', 'Chase', 'Ortiz', '', 'no', '08 23 73 52 45', '1-485-152-2154', 'egestas.hendrerit.neque@egestas.com', '8452 Tristique Avenue', '�e?me', '?zm', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('107', '2', '3', '', '20180417', '803', null, '', 'Plato', 'Hester', '', 'no', '03 57 56 39 28', '1-268-923-3724', 'mauris.sagittis@aliquetProin.co.uk', 'P.O. Box 950, 6576 Mi Road', 'Dundee', 'AN', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('108', '1', '1', '', '20180423', '1020', null, '', 'Radja', 'Lomas', '', 'no', '01 92 89 19 61', '1-321-112-9371', 'dictum.eu@musProinvel.ca', 'Ap #158-6696 Mauris Street', '�kersberga', 'AB', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('109', '4', '14', '', '20180423', '884', null, '', 'Celeste', 'Mcbride', '', 'no', '05 49 31 46 87', '1-483-749-2853', 'pede@mollisneccursus.co.uk', 'Ap #806-5695 In Street', 'Sokoto', 'SO', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('110', '3', '6', '', '20180424', '1233', null, '', 'Beau', 'Sutton', '', 'no', '09 08 19 42 97', '1-478-568-8108', 'eget@elit.org', '878-3453 Eu Rd.', 'Hay-on-Wye', 'Brecknockshire', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('111', '1', '5', '', '20180411', '1404', null, '', 'Radja', 'Lomas', '', 'no', '02 61 44 97 07', '1-659-613-8086', 'eu.sem@enimCurabiturmassa.net', '386-1669 Cras Rd.', 'Lo Espejo', 'RM', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('112', '3', '14', '', '20180409', '842', null, '', 'Xantha', 'Mcknight', '', 'no', '07 34 54 12 43', '1-265-897-5702', 'id.sapien@nisimagnased.co.uk', 'Ap #114-4948 Imperdiet Ave', 'Bendigo', 'VIC', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('113', '3', '14', '', '20180420', '1486', null, '', 'Jerome', 'Rush', '', 'no', '06 59 15 04 28', '1-603-925-1391', 'vitae@leoCrasvehicula.ca', '570-1769 Morbi Avenue', 'Minturno', 'LAZ', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('114', '1', '6', '', '20180408', '1529', null, '', 'Radja', 'Lomas', '', 'no', '03 82 45 46 95', '1-493-997-5423', 'lacus.Cras.interdum@massaVestibulum.org', 'P.O. Box 713, 3485 Tristique Rd.', 'Banda', 'UP', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('115', '2', '1', '', '20180411', '1431', null, '', 'Velma', 'Jensen', '', 'no', '08 00 31 57 22', '1-967-579-8716', 'dignissim@netus.net', 'Ap #512-2341 Viverra. Rd.', 'Follina', 'VEN', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('116', '1', '10', '', '20180420', '1414', null, '', 'Radja', 'Lomas', '', 'no', '03 47 85 08 52', '1-375-190-2541', 'vel.turpis.Aliquam@Sed.co.uk', '5639 Consectetuer Avenue', 'Lim�n (Puerto Lim�n)', 'Lim�n', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('117', '1', '7', '', '20180423', '1579', null, '', 'Radja', 'Lomas', '', 'no', '09 15 80 61 30', '1-681-794-8217', 'Mauris.nulla.Integer@Nunc.org', 'P.O. Box 954, 6381 Iaculis Rd.', 'Schriek', 'Antwerpen', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('118', '4', '3', '', '20180428', '1683', null, '', 'Carlos', 'Mccoy', '', 'no', '04 64 10 27 01', '1-894-380-5453', 'nisl@elit.co.uk', '140-8924 Turpis Street', 'Omaha', 'Nebraska', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('119', '4', '14', '', '20180406', '1146', null, '', 'Shelley', 'Vaughn', '', 'no', '08 28 11 03 62', '1-544-509-8043', 'augue.id@suscipitestac.ca', 'Ap #794-8912 Ac Rd.', 'Flin Flon', 'Manitoba', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('120', '3', '14', '', '20180426', '949', null, '', 'Yoshi', 'Mosley', '', 'no', '04 45 46 35 84', '1-447-259-9367', 'justo.Proin.non@vitaealiquet.org', '255-3221 Sit Street', 'Thon', 'Namen', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('121', '4', '7', '', '20180406', '1128', null, '', 'Iola', 'Rodriguez', '', 'no', '02 49 80 34 33', '1-375-341-1981', 'semper.Nam@ultrices.com', '598-8498 Facilisis Street', 'Hamilton', 'North Island', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('122', '1', '9', '', '20180418', '1178', null, '', 'Radja', 'Lomas', '', 'no', '08 57 58 28 07', '1-431-301-7427', 'Sed.malesuada.augue@ametnulla.ca', 'Ap #351-3476 Commodo St.', 'Jauchelette', 'WB', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('123', '1', '6', '', '20180423', '1488', null, '', 'Radja', 'Lomas', '', 'no', '08 03 95 22 30', '1-662-977-5214', 'eu.lacus@mollisInteger.org', 'Ap #864-8314 Quis Rd.', 'Yumbel', 'VII', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('124', '4', '6', '', '20180420', '1172', null, '', 'Stone', 'Golden', '', 'no', '01 89 06 52 91', '1-543-447-8921', 'vel.lectus@etrutrum.net', 'Ap #290-4999 Convallis Ave', 'M�lin', 'WB', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('125', '2', '4', '', '20180426', '1397', null, '', 'Hyatt', 'Oliver', '', 'no', '03 48 95 42 69', '1-758-793-6610', 'Suspendisse@utodio.edu', 'Ap #580-8557 Amet Road', 'Rocca San Felice', 'Campania', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('126', '4', '2', '', '20180410', '880', null, '', 'Brittany', 'Mcconnell', '', 'no', '09 96 21 23 21', '1-231-305-7882', 'justo.Proin@sit.org', '491-2254 Sem St.', 'Krak�w', 'MP', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('127', '1', '13', '', '20180404', '1112', '', '', 'Radja', 'Lomas', '', 'yes', '05 95 05 53 04', '1-648-886-7083', 'scelerisque@consequat.ca', 'P.O. Box 646, 7151 Dui. Road', 'Terneuzen', 'Zl', '', '', '0', '0', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('128', '4', '8', '', '20180418', '1693', null, '', 'Rahim', 'Roberts', '', 'no', '06 33 04 37 91', '1-249-327-6195', 'rutrum.urna.nec@augue.co.uk', '479-9449 Turpis. Av.', 'Dar?ca', 'Kocaeli', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('129', '3', '2', '', '20180401', '1285', null, '', 'Alexa', 'Weber', '', 'no', '05 77 35 66 58', '1-823-812-0515', 'molestie@eu.com', 'Ap #561-8811 Malesuada Av.', 'Berlin', 'Berlin', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('130', '3', '13', '', '20180419', '1299', null, '', 'Elliott', 'Nielsen', '', 'no', '09 30 66 24 57', '1-347-533-9505', 'placerat.Cras.dictum@blanditNam.ca', '333-8614 Nec, Road', 'Vetlanda', 'J�nk�pings l�n', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('131', '3', '11', '', '20180413', '849', null, '', 'Cassidy', 'Roberson', '', 'no', '02 88 89 00 24', '1-856-408-8287', 'egestas@atnisi.org', '377-449 Risus St.', 'Bauchi', 'Bauchi', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('132', '1', '13', '', '20180410', '803', '', '', 'Radja', 'Lomas', '', 'yes', '08 68 19 62 15', '1-170-368-0918', 'Morbi.metus@diamluctuslobortis.ca', 'P.O. Box 221, 3446 Sit Rd.', 'Muno', 'LX', '', '', '0', '0', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('133', '1', '9', '', '20180415', '1241', null, '', 'Radja', 'Lomas', '', 'no', '08 58 37 41 38', '1-642-325-2246', 'gravida@metus.com', '974-7876 Ipsum. Rd.', 'Rostock', 'MV', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('134', '3', '2', '', '20180421', '1113', null, '', 'Samuel', 'Ford', '', 'no', '07 85 12 27 47', '1-164-933-7210', 'elit.Curabitur.sed@NullaaliquetProin.net', 'P.O. Box 384, 5337 Lectus St.', 'Quesada', 'A', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('135', '2', '6', '', '20180413', '1715', null, '', 'Barbara', 'Mccarthy', '', 'no', '08 92 90 59 87', '1-537-404-6292', 'amet.risus@egestasligulaNullam.org', '682-2952 Luctus Street', 'Bursa', 'Bur', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('136', '4', '3', '', '20180419', '1437', null, '', 'Chandler', 'Rios', '', 'no', '02 33 72 79 91', '1-493-896-4570', 'ipsum@nisi.net', 'Ap #569-135 Diam Rd.', 'Zoerle-Parwijs', 'Antwerpen', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('137', '2', '1', '', '20180417', '1397', null, '', 'Melinda', 'Cole', '', 'no', '09 79 09 98 85', '1-250-651-3173', 'magna@enim.co.uk', '352-3792 Ut Road', 'Veenendaal', 'U.', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('138', '4', '11', '', '20180406', '1070', null, '', 'Vance', 'Gibson', '', 'no', '02 61 25 18 55', '1-119-437-8152', 'sagittis@nonlobortis.edu', 'P.O. Box 408, 9639 Leo. Av.', 'Uttarpara-Kotrung', 'West Bengal', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('139', '3', '11', '', '20180406', '1668', null, '', 'Ciaran', 'Horne', '', 'no', '07 95 16 84 67', '1-428-263-0411', 'ipsum@nullaCras.ca', 'P.O. Box 831, 7030 Lorem Avenue', 'Vienna', 'Wie', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('140', '3', '11', '', '20180413', '991', null, '', 'Nathan', 'Hammond', '', 'no', '08 19 66 52 10', '1-694-857-3531', 'et.malesuada.fames@nequeNullamut.net', 'Ap #859-3683 Vel Rd.', 'Toowoomba', 'Queensland', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('141', '4', '4', '', '20180423', '1590', null, '', 'Malcolm', 'Hayden', '', 'no', '02 03 59 99 45', '1-316-390-4954', 'justo.nec@orciconsectetuer.com', '572-7518 Aliquet St.', 'Oxford County', 'Ontario', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('142', '3', '6', '', '20180411', '1532', null, '', 'Kaitlin', 'Sampson', '', 'no', '04 10 80 80 43', '1-420-424-4080', 'eu@orcilacus.ca', '5414 Eu, Rd.', 'Istanbul', 'Ist', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('143', '3', '9', '', '20180410', '1646', null, '', 'Lance', 'Gonzales', '', 'no', '06 65 70 21 97', '1-725-857-3565', 'imperdiet.non@Morbivehicula.org', '1568 Congue. Ave', 'Castell�', 'Comunitat Valenciana', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('144', '3', '2', '', '20180413', '1730', null, '', 'Kellie', 'Fields', '', 'no', '08 96 07 15 58', '1-705-985-2357', 'ullamcorper.nisl.arcu@variusNam.net', 'Ap #248-8340 Elit, Av.', 'Hawera', 'NI', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('145', '3', '7', '', '20180422', '1670', null, '', 'Sigourney', 'Mueller', '', 'no', '06 40 58 63 49', '1-368-288-0833', 'Mauris.quis@anteblandit.ca', 'Ap #467-2897 Tellus Rd.', 'Anjou', 'QC', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('146', '1', '7', '', '20180413', '991', null, '', 'Radja', 'Lomas', '', 'no', '08 32 83 78 30', '1-140-241-3386', 'non@per.ca', '180-9646 Ut St.', 'Cleveland', 'Ohio', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('147', '1', '11', '', '20180421', '1020', null, '', 'Radja', 'Lomas', '', 'no', '08 13 10 62 18', '1-860-479-2574', 'in.felis@magnaPraesent.com', '6752 Neque. Street', 'Alexandra', 'SI', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('148', '4', '1', '', '20180427', '1080', null, '', 'Kenyon', 'Barrera', '', 'no', '07 61 04 04 94', '1-504-904-5012', 'dapibus.id@sodales.org', 'Ap #949-2341 Suspendisse St.', 'Amsterdam', 'N.', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('149', '1', '7', '', '20180403', '899', null, '', 'Radja', 'Lomas', '', 'no', '01 43 54 71 75', '1-348-505-8873', 'ac.risus@lacusUt.edu', '926-3261 Id Ave', 'Oswestry', 'SA', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('150', '4', '8', '', '20180424', '1611', null, '', 'Peter', 'Welch', '', 'no', '09 26 51 00 61', '1-810-979-7538', 'ut.sem.Nulla@urnasuscipitnonummy.net', 'Ap #630-1913 Ipsum Avenue', 'Richmond Hill', 'ON', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('151', '3', '10', '', '20180402', '1661', null, '', 'Fitzgerald', 'Ashley', '', 'no', '08 80 62 34 18', '1-539-985-7553', 'in.aliquet.lobortis@Maurismagna.org', '350 Nam Avenue', 'Hamburg', 'HH', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('152', '2', '4', '', '20180403', '912', null, '', 'Jesse', 'Slater', '', 'no', '07 57 51 23 58', '1-221-286-4855', 'id.erat.Etiam@erosturpis.net', '8117 Pellentesque St.', 'Cambridge', 'North Island', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('153', '2', '14', '', '20180427', '1557', null, '', 'Adam', 'Weeks', '', 'no', '08 69 50 46 45', '1-848-835-9032', 'magna.Phasellus.dolor@auctorquis.com', '255-896 Cras Rd.', 'Osasco', 'S�o Paulo', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('154', '3', '3', '', '20180420', '1332', null, '', 'Carter', 'Stanley', '', 'no', '05 08 63 94 87', '1-505-637-8847', 'volutpat.nunc@metusvitae.net', '192-1444 Nulla Street', 'Hulshout', 'Antwerpen', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('155', '3', '7', '', '20180422', '1589', null, '', 'Bell', 'Finley', '', 'no', '05 13 73 49 85', '1-308-298-0526', 'consectetuer.euismod@Aenean.net', '4742 Felis, Road', 'San Rafael', 'Cartago', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('156', '2', '14', '', '20180409', '1139', null, '', 'Amena', 'Jefferson', '', 'no', '09 66 43 78 78', '1-408-349-3010', 'sapien.Aenean.massa@ligulaAeneangravida.org', 'Ap #346-4657 Eget, Ave', 'Araban', 'Gaziantep', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('157', '3', '2', '', '20180417', '1650', null, '', 'Jonas', 'Emerson', '', 'no', '08 58 64 53 57', '1-638-822-4952', 'amet.orci.Ut@magnamalesuada.net', '351-6475 Nec Street', 'Omaha', 'Nebraska', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('158', '3', '7', '', '20180428', '891', null, '', 'Harper', 'Zimmerman', '', 'no', '01 43 98 45 87', '1-953-126-2871', 'suscipit.est@elementum.edu', '708-8006 Magna Rd.', 'Hattiesburg', 'Mississippi', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('159', '2', '2', '', '20180410', '1108', null, '', 'Fatima', 'Lewis', '', 'no', '02 46 09 75 67', '1-604-138-7310', 'Sed@Aeneanegetmagna.co.uk', 'Ap #574-368 Nam Road', 'Pelarco', 'Maule', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('160', '2', '1', '', '20180414', '1606', null, '', 'Kasimir', 'Randolph', '', 'no', '07 27 70 20 04', '1-895-318-9666', 'ut@adipiscingMaurismolestie.co.uk', '545-556 Neque Ave', 'Roosendaal', 'Noord Brabant', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('161', '4', '5', '', '20180420', '1086', null, '', 'Zephania', 'Santiago', '', 'no', '07 28 72 18 69', '1-224-122-3126', 'id.risus@maurisrhoncusid.com', 'P.O. Box 560, 3560 Integer Rd.', 'Vienna', 'Wie', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('162', '4', '8', '', '20180404', '1392', null, '', 'Pascale', 'Stokes', '', 'no', '01 32 67 20 43', '1-889-725-7297', 'Praesent@elitdictum.ca', '676-5664 Penatibus Ave', 'Vienna', 'Vienna', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('163', '4', '6', '', '20180423', '964', null, '', 'Rigel', 'Garner', '', 'no', '09 91 04 32 52', '1-856-999-6942', 'in.magna@erat.com', '598-951 Proin Rd.', 'Pittsburgh', 'PA', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('164', '3', '11', '', '20180411', '1282', null, '', 'Stephen', 'Byrd', '', 'no', '03 23 71 23 82', '1-967-441-4782', 'adipiscing@porttitorinterdum.edu', '346-7647 Curabitur St.', 'Kington', 'Herefordshire', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('165', '1', '4', '', '20180419', '1391', null, '', 'Radja', 'Lomas', '', 'no', '03 19 71 81 97', '1-176-519-1596', 'lorem.fringilla.ornare@arcuAliquamultrices.com', '326-1183 Dis St.', 'Mar�a Pinto', 'Metropolitana de Santiago', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('166', '1', '5', '', '20180423', '1091', null, '', 'Radja', 'Lomas', '', 'no', '08 58 70 59 18', '1-454-683-8495', 'sed.libero@sedleoCras.edu', 'P.O. Box 666, 3767 Porttitor Av.', 'New Plymouth', 'North Island', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('167', '2', '14', '', '20180421', '1326', null, '', 'Brynn', 'Sweet', '', 'no', '03 61 22 33 30', '1-229-775-0526', 'lacinia@Nullatempor.net', 'P.O. Box 304, 6640 Libero Rd.', 'Wimmertingen', 'Limburg', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('168', '2', '6', '', '20180411', '953', null, '', 'Caesar', 'Reese', '', 'no', '03 09 59 69 13', '1-975-245-9009', 'ante.iaculis.nec@Praesent.net', '365-5388 Eu Road', 'Nuraminis', 'SAR', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('169', '1', '12', '', '20180418', '1239', '', '', 'Radja', 'Lomas', '', 'yes', '02 34 17 45 91', '1-694-308-3955', 'ipsum.Donec.sollicitudin@sedorci.ca', 'Ap #128-9190 Molestie Avenue', 'Kalisz', 'WP', '', '', '0', '0', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('170', '2', '2', '', '20180415', '1411', null, '', 'Michelle', 'Henson', '', 'no', '03 35 35 08 81', '1-993-849-0250', 'interdum.Curabitur@dolorDonec.net', 'P.O. Box 616, 1423 Lacinia Rd.', 'Okigwe', 'IM', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('171', '1', '8', '', '20180413', '915', null, '', 'Radja', 'Lomas', '', 'no', '07 75 53 98 23', '1-535-253-7403', 'molestie.arcu.Sed@velarcu.ca', 'Ap #394-8766 Ut Av.', 'Orhangazi', 'Bur', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('172', '4', '4', '', '20180409', '1455', null, '', 'Brandon', 'Hamilton', '', 'no', '01 47 46 84 23', '1-521-150-5910', 'Aenean.euismod.mauris@vestibulum.com', '5081 Donec Ave', 'Galway', 'C', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('173', '2', '7', '', '20180423', '1146', null, '', 'Ivory', 'Aguirre', '', 'no', '03 30 58 00 52', '1-812-634-7051', 'orci.lobortis@utipsum.ca', '830-2120 Magna. Ave', 'Milena', 'Sicilia', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('174', '4', '5', '', '20180421', '1653', null, '', 'Camille', 'Strickland', '', 'no', '09 98 86 23 59', '1-299-368-3941', 'Nullam.ut@Fuscefermentum.edu', '5355 Dui. Avenue', 'San Rosendo', 'Biob�o', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('175', '3', '14', '', '20180401', '1529', null, '', 'Kamal', 'Maxwell', '', 'no', '08 74 70 14 18', '1-387-654-9130', 'Quisque.nonummy@enimcondimentum.org', 'Ap #918-6067 Eu Rd.', 'Nicoya', 'G', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('176', '3', '10', '', '20180428', '1492', null, '', 'Emma', 'Watts', '', 'no', '09 37 98 80 52', '1-794-498-8569', 'facilisis.vitae@habitantmorbitristique.co.uk', '7725 Magna. St.', 'Vienna', 'Wie', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('177', '3', '7', '', '20180407', '1680', null, '', 'Davis', 'Cohen', '', 'no', '04 18 06 53 84', '1-838-726-4079', 'nisi.a.odio@etmalesuadafames.org', 'P.O. Box 655, 8381 Nonummy Road', 'Rocca San Felice', 'CAM', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('178', '2', '1', '', '20180413', '1399', null, '', 'Armand', 'Roman', '', 'no', '08 32 79 72 52', '1-872-227-8989', 'eros@consequat.co.uk', 'Ap #178-7114 Ultricies Rd.', 'Vienna', 'Wie', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('179', '4', '7', '', '20180408', '992', null, '', 'Grant', 'Cruz', '', 'no', '01 26 91 45 66', '1-484-272-3133', 'vitae@ut.com', 'P.O. Box 348, 2831 Non Rd.', 'Morwell', 'VIC', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('180', '2', '8', '', '20180416', '982', null, '', 'Shana', 'Norris', '', 'no', '07 14 13 66 35', '1-886-880-0608', 'ligula.Nullam.enim@pede.org', '7509 Diam Street', 'Bellevue', 'Washington', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('181', '2', '13', '', '20180410', '1487', null, '', 'Fritz', 'Frank', '', 'no', '04 98 08 10 16', '1-205-376-4680', 'Nunc.lectus@imperdietnon.com', 'P.O. Box 462, 3566 Dolor. St.', 'Osasco', 'SP', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('182', '2', '5', '', '20180426', '1040', null, '', 'Dana', 'Mclaughlin', '', 'no', '09 94 69 66 97', '1-811-602-0596', 'sed.hendrerit@ultrices.net', 'Ap #494-7414 Ac Ave', 'Para�so', 'Cartago', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('183', '4', '13', '', '20180403', '1454', null, '', 'Allen', 'Schmidt', '', 'no', '09 76 43 31 87', '1-742-175-2191', 'et.arcu@Aliquamerat.com', '967-5436 Nunc Road', 'V�rnamo', 'J�nk�pings l�n', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('184', '1', '3', '', '20180424', '1109', null, '', 'Radja', 'Lomas', '', 'no', '09 20 53 58 02', '1-509-787-6220', 'pede.Cum@nonleoVivamus.co.uk', '537-1427 Lacinia Street', 'Cuenca', 'CM', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('185', '3', '10', '', '20180404', '1304', null, '', 'Jennifer', 'Cotton', '', 'no', '02 38 97 81 91', '1-672-908-2321', 'et.euismod@velitSed.co.uk', '341-4755 Amet Rd.', 'Langford', 'British Columbia', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('186', '3', '10', '', '20180405', '814', null, '', 'Martena', 'Gibson', '', 'no', '01 36 76 76 48', '1-317-684-4355', 'eu.eros.Nam@sit.com', '301-4462 Aliquam St.', 'Leiden', 'Zuid Holland', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('187', '1', '8', '', '20180417', '1414', null, '', 'Radja', 'Lomas', '', 'no', '09 79 74 90 47', '1-842-624-5721', 'nibh.Aliquam.ornare@tinciduntnunc.ca', 'Ap #807-5942 Molestie Rd.', 'Belfast', 'Ulster', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('188', '3', '7', '', '20180404', '1200', null, '', 'Seth', 'Drake', '', 'no', '02 29 04 63 33', '1-349-176-0928', 'consequat.nec.mollis@temporest.net', '5899 Molestie Av.', 'Hartlepool', 'DU', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('189', '1', '9', '', '20180413', '990', null, '', 'Radja', 'Lomas', '', 'no', '04 70 80 17 16', '1-787-874-3625', 'venenatis.lacus@egetipsumDonec.co.uk', '381-5232 Vivamus Rd.', 'Galway', 'C', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('190', '4', '6', '', '20180417', '1055', null, '', 'Kermit', 'Saunders', '', 'no', '07 65 36 04 83', '1-478-908-2588', 'amet@placerat.net', '791-3937 Velit Ave', 'Zamo??', 'LU', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('191', '4', '3', '', '20180418', '1692', null, '', 'Faith', 'Wall', '', 'no', '03 01 75 94 51', '1-669-151-8369', 'malesuada.vel@consectetuer.com', 'Ap #514-6375 Mattis Avenue', 'Wolverhampton', 'Staffordshire', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('192', '3', '4', '', '20180425', '1532', null, '', 'Risa', 'Blevins', '', 'no', '01 20 58 63 95', '1-901-663-4790', 'neque@Vestibulumuteros.com', 'P.O. Box 794, 7171 Eu St.', 'Manukau', 'North Island', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('193', '1', '11', '', '20180403', '851', null, '', 'Radja', 'Lomas', '', 'no', '03 38 39 67 73', '1-408-941-1787', 'Aliquam.gravida.mauris@gravidamolestiearcu.co.uk', '888-728 Magna. Ave', 'Itabuna', 'Bahia', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('194', '3', '14', '', '20180409', '1673', null, '', 'Burton', 'Rich', '', 'no', '07 35 98 69 01', '1-698-159-7199', 'Morbi.accumsan.laoreet@lacus.edu', '779-8816 Velit. Rd.', 'Colorado Springs', 'Colorado', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('195', '2', '12', '', '20180428', '956', null, '', 'Salvador', 'Garcia', '', 'no', '06 01 63 04 40', '1-834-365-8189', 'purus.Duis.elementum@arcuVestibulum.net', 'Ap #193-7030 Tincidunt Av.', 'Breda', 'Noord Brabant', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('196', '3', '5', '', '20180421', '1601', null, '', 'Belle', 'Gilbert', '', 'no', '02 76 33 56 20', '1-862-468-7835', 'lacinia@arcuVivamus.com', 'Ap #288-4183 Tellus. Rd.', 'Roxboro', 'QC', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('197', '1', '7', '', '20180406', '852', null, '', 'Radja', 'Lomas', '', 'no', '08 40 65 46 65', '1-732-720-9369', 'Donec.egestas.Duis@Nullam.net', 'Ap #108-8111 Lectus St.', 'C�rdoba', 'AN', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('198', '4', '10', '', '20180402', '896', null, '', 'Hammett', 'Wade', '', 'no', '03 56 53 93 64', '1-546-665-4586', 'eu.tellus@Curabiturutodio.co.uk', 'P.O. Box 640, 1905 Commodo St.', 'Vienna', 'Vienna', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('199', '2', '4', '', '20180409', '1693', null, '', 'Gavin', 'Carr', '', 'no', '09 10 19 61 33', '1-204-153-0297', 'nec.orci.Donec@semutcursus.org', 'P.O. Box 336, 6043 Libero. Road', 'Camarones', 'XV', '', '', '', '', null, null, null, null);
INSERT INTO `default_appointments_list` VALUES ('200', '1', '10', '', '20180421', '1546', null, '', 'Radja', 'Lomas', '', 'no', '05 18 81 17 35', '1-157-227-3964', 'netus.et@velconvallisin.com', '2386 Nunc St.', 'Brest', 'Bretagne', '', '', '', '', null, null, null, null);

-- ----------------------------
-- Table structure for `default_blog`
-- ----------------------------
DROP TABLE IF EXISTS `default_blog`;
CREATE TABLE `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_blog
-- ----------------------------

-- ----------------------------
-- Table structure for `default_blog_categories`
-- ----------------------------
DROP TABLE IF EXISTS `default_blog_categories`;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_blog_categories
-- ----------------------------
INSERT INTO `default_blog_categories` VALUES ('1', 'test', 'test');

-- ----------------------------
-- Table structure for `default_ci_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `default_ci_sessions`;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_ci_sessions
-- ----------------------------
INSERT INTO `default_ci_sessions` VALUES ('3cee2f3f037b16102c7e38a244983a0b', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1495107083', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('d2c988f5e84d706509c44a12c4acd5fd', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520538781', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('29d15e85330c3bebbcc6925e525a5cf6', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520643708', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('2245df3812e5ae6787bbff44ecdaa998', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520637513', '');
INSERT INTO `default_ci_sessions` VALUES ('9cf9ffd0bd1f246f14ed64f8fc2ef1ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '1520643601', '');
INSERT INTO `default_ci_sessions` VALUES ('25aa086e749a5dd7cbfc9a64b1f495ff', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520651439', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('bc325c8c8fdda8f9f35e6cf5f55203c2', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520651440', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('ee40c512d2b39e665a26f1995f08d6fd', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520653674', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('391e6d91b23c87e6c831a4a0b8bb22ab', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', '1520654161', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('9ef836f5aaf883ad2ddf83c1ed71feee', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520656676', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('0a9b653f086b52636f34b454415964a4', '::1', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mob', '1520656706', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('f18f2713e7d67bac4b86c37ba41b1ab8', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520678432', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('f7465d1a7e86a6c26e3693b4c5e7414b', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobil', '1520678455', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('bf29edcea043b6356382596bd072b7af', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520692303', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c36d1edef420acce81302e88a382a87e', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1520996428', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('b5087e89ff60960ebe12c7c031241fc9', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521001537', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('00064c53f33291f5a7fa64f9e9726031', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', '1521001821', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('dd33413f4d75fa57c9c15dc6be5d8b17', '::1', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mob', '1521001831', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('d0c53fc2e52a8ed75cf3676774f5279c', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521002387', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('62ca39531981b55d0479d900a677892f', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521022370', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('b3d9888659d31eab50c24eec713e8565', '::1', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mob', '1521022425', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e8f219aa7099cc160db654bf718e1be7', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521082883', 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:12:\"Enregistré.\";}');
INSERT INTO `default_ci_sessions` VALUES ('2fb2294069c0e7106194051ca73fc4e9', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521077025', 'a:5:{s:5:\"email\";s:19:\"support@nowhere.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"4\";s:5:\"group\";s:17:\"support-technique\";}');
INSERT INTO `default_ci_sessions` VALUES ('97323243eb42f02c1af6c78e3a1ed1ff', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521079428', 'a:6:{s:8:\"username\";s:9:\"med.staff\";s:5:\"email\";s:20:\"medstaff@nowhere.com\";s:2:\"id\";s:1:\"3\";s:7:\"user_id\";s:1:\"3\";s:8:\"group_id\";s:1:\"3\";s:5:\"group\";s:13:\"staff-medical\";}');
INSERT INTO `default_ci_sessions` VALUES ('4ef396e7ef67b706a09a693f1820e002', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521128940', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('ea5ad1ad7f307319727710dc956ecc67', '::1', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mob', '1521129338', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e891a7ebe6df566ab91f19acb49ee4b8', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521130871', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('9688d7a6f3038f2761534b9f6a87bb05', '::1', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mob', '1521130897', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c82c864ee6e2d983bec19bc9bfd57ce7', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521131102', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('dce1c0e7648569222d7b7475c2efaec9', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', '1521132263', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e0422d50fc944c13a0b68e57ba7053f3', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521137117', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('613513e1d841987baf3149870cebe4db', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521137119', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('7a8343fad3bb6dc16c335e95991c46aa', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521137121', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('26c21aa2ef0264a7ef2b5613f6efb170', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521137122', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('bc22341ebf384161534725827f614536', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521156556', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('321c52e1bd4f94244ad326c8521d8dac', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521457365', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('6f581f90ddf173d4c1a45f1389b7b05b', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521459488', '');
INSERT INTO `default_ci_sessions` VALUES ('85cff754d275b389db1aaf43f5eda4aa', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521481189', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c7eaf248c807f18c9565fd2607ea2cb3', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521490156', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e9f1b8abb8e56c0bd3a1f4cbf5922bc4', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', '1521490295', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('fb79ebc45d06f8f42744af04a211c8c9', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521499696', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c347e62476eaf583ff45bb39578adf07', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521512737', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('75ea267280e801eff814cb85d7069c0c', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', '1521513034', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('865fdbf9537cf1adfa868ed1163b5b44', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521513393', 'a:6:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:42:\"Le lien de navigation a été enregistré.\";}');
INSERT INTO `default_ci_sessions` VALUES ('82cf6861d06c9eb0b1efb090258679ca', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', '1521513543', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c5741f7214ef1ade267f4db05a4af67e', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '1521521190', 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');

-- ----------------------------
-- Table structure for `default_comments`
-- ----------------------------
DROP TABLE IF EXISTS `default_comments`;
CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `default_comment_blacklists`
-- ----------------------------
DROP TABLE IF EXISTS `default_comment_blacklists`;
CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_comment_blacklists
-- ----------------------------

-- ----------------------------
-- Table structure for `default_contact_log`
-- ----------------------------
DROP TABLE IF EXISTS `default_contact_log`;
CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_contact_log
-- ----------------------------

-- ----------------------------
-- Table structure for `default_data_fields`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_fields`;
CREATE TABLE `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=568 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_fields
-- ----------------------------
INSERT INTO `default_data_fields` VALUES ('1', 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613A323A7B733A31313A22656469746F725F74797065223B733A363A2273696D706C65223B733A31303A22616C6C6F775F74616773223B733A313A2279223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('2', 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613A323A7B733A31313A22656469746F725F74797065223B733A383A22616476616E636564223B733A31303A22616C6C6F775F74616773223B733A313A2279223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('3', 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A35303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('4', 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A35303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('20', 'Ville', 'town', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('19', 'Informations personelles', 'personal_info', 'users', 'textarea', 0x613A333A7B733A31323A2264656661756C745F74657874223B733A303A22223B733A31303A22616C6C6F775F74616773223B733A313A226E223B733A31323A22636F6E74656E745F74797065223B733A343A2274657874223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('8', 'lang:profile_dob', 'birth_date', 'users', 'datetime', 0x613A353A7B733A383A227573655F74696D65223B733A323A226E6F223B733A31303A2273746172745F64617465223B733A353A222D31303059223B733A383A22656E645F64617465223B733A303A22223B733A373A2273746F72616765223B733A343A22756E6978223B733A31303A22696E7075745F74797065223B733A383A2264726F70646F776E223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('23', 'Civilité', 'gender', 'users', 'choice', 0x613A353A7B733A31313A2263686F6963655F64617461223B733A32303A2268203A20486F6D6D650D0A66203A2046656D6D65223B733A31313A2263686F6963655F74797065223B733A353A22726164696F223B733A31333A2264656661756C745F76616C7565223B733A303A22223B733A31313A226D696E5F63686F69636573223B733A303A22223B733A31313A226D61785F63686F69636573223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('10', 'lang:profile_phone', 'phone', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A323A223230223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('11', 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A323A223230223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('12', 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('13', 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('21', 'Quartier', 'neighbourhood', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('15', 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A32303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('17', 'Nom de naissance', 'birth_name', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('22', 'Mutuelle', 'insurance', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('24', 'Médecin habituel', 'doctor_id', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('25', 'pre html', 'pre_html', 'pages', 'textarea', 0x613A333A7B733A31323A2264656661756C745F74657874223B733A303A22223B733A31303A22616C6C6F775F74616773223B733A313A2279223B733A31323A22636F6E74656E745F74797065223B733A343A2268746D6C223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('26', 'post html', 'post_html', 'pages', 'textarea', 0x613A333A7B733A31323A2264656661756C745F74657874223B733A303A22223B733A31303A22616C6C6F775F74616773223B733A313A2279223B733A31323A22636F6E74656E745F74797065223B733A343A2268746D6C223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('506', 'Bureau', 'desk_no', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('567', 'Etablissement', 'subset', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('505', 'Phone valid', 'phone_valid', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A313A2233223B733A31333A2264656661756C745F76616C7565223B733A323A226E6F223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('566', 'Structure', 'organisation', 'doctor', 'relationship', 0x613A323A7B733A31333A2263686F6F73655F73747265616D223B693A38373B733A383A226C696E6B5F757269223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('565', 'Organisme ou groupe', 'groupe', 'doctor', 'relationship', 0x613A323A7B733A31333A2263686F6F73655F73747265616D223B693A38373B733A383A226C696E6B5F757269223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('564', 'Catégorie parente', 'parent_cat', 'doctor', 'relationship', 0x613A323A7B733A31333A2263686F6F73655F73747265616D223B693A38363B733A383A226C696E6B5F757269223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('562', 'Catégorie', 'doctor_cat', 'doctor', 'relationship', 0x613A323A7B733A31333A2263686F6F73655F73747265616D223B693A38363B733A383A226C696E6B5F757269223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('563', 'Spécialité médicale', 'speciality', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('561', 'Image docteur', 'image', 'doctor', 'image', 0x613A353A7B733A363A22666F6C646572223B693A33333B733A31323A22726573697A655F7769647468223B4E3B733A31333A22726573697A655F686569676874223B4E3B733A31303A226B6565705F726174696F223B4E3B733A31333A22616C6C6F7765645F7479706573223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('560', 'Ville', 'town', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('559', 'Quartier', 'area_name', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('558', 'Adresse', 'address', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('557', 'Email', 'email', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('556', 'Mobile', 'mobile', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('555', 'Téléphone', 'telephone', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B4E3B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('553', 'RDV Max Jour(30\")', 'max_per_day', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A323B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('554', 'Description', 'description', 'doctor', 'textarea', 0x613A333A7B733A31323A2264656661756C745F74657874223B4E3B733A31303A22616C6C6F775F74616773223B4E3B733A31323A22636F6E74656E745F74797065223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('551', 'Ouverture', 'opens', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A31303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('552', 'Fermeture', 'closes', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A31303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('550', 'Heures d\'ouverture', 'hours', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A3230303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('549', 'Jours ouverts', 'days', 'doctor', 'choice', 0x613A353A7B733A31313A2263686F6963655F64617461223B733A3332353A2231203A206C756E64690D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202032203A206D617264690D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202033203A206D657263726564690D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202034203A206A657564690D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202035203A2076656E64726564690D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202036203A2073616D6564690D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202030203A2064696D616E636865223B733A31313A2263686F6963655F74797065223B733A31303A22636865636B626F786573223B733A31333A2264656661756C745F76616C7565223B733A303A22223B733A31313A226D696E5F63686F69636573223B4E3B733A31313A226D61785F63686F69636573223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('548', 'Nom du practicien', 'name', 'doctor', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A3230303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('507', 'Etage', 'floor', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A303A22223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');

-- ----------------------------
-- Table structure for `default_data_field_assignments`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_field_assignments`;
CREATE TABLE `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=565 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_field_assignments
-- ----------------------------
INSERT INTO `default_data_field_assignments` VALUES ('1', '1', '1', '1', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('2', '2', '2', '2', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('3', '1', '3', '3', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('4', '1', '3', '4', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('19', '11', '3', '19', 'no', 'no', 'Vos informations médicales', null);
INSERT INTO `default_data_field_assignments` VALUES ('8', '3', '3', '8', 'no', 'no', '', null);
INSERT INTO `default_data_field_assignments` VALUES ('23', '1', '3', '23', 'yes', 'no', 'Vous êtes un homme ou une femme?', null);
INSERT INTO `default_data_field_assignments` VALUES ('10', '4', '3', '10', 'no', 'no', 'Votre numéro de téléphone fixe', null);
INSERT INTO `default_data_field_assignments` VALUES ('11', '5', '3', '11', 'yes', 'no', 'Votre numéro de téléphone portable', null);
INSERT INTO `default_data_field_assignments` VALUES ('12', '6', '3', '12', 'no', 'no', 'Adresse lligne 1', null);
INSERT INTO `default_data_field_assignments` VALUES ('13', '7', '3', '13', 'no', 'no', 'Adresse ligne 2', null);
INSERT INTO `default_data_field_assignments` VALUES ('20', '10', '3', '20', 'no', 'no', 'Votre ville ou village de résidence', null);
INSERT INTO `default_data_field_assignments` VALUES ('15', '9', '3', '15', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('17', '2', '3', '17', 'no', 'no', 'Votre nom de jeune fille si vous êtes une femme mariée.', null);
INSERT INTO `default_data_field_assignments` VALUES ('21', '8', '3', '21', 'no', 'no', 'Votre quartier de résidence si applicable', null);
INSERT INTO `default_data_field_assignments` VALUES ('22', '12', '3', '22', 'no', 'no', 'Votre mutuelle si vous en avez une', null);
INSERT INTO `default_data_field_assignments` VALUES ('24', '13', '3', '24', 'no', 'no', 'Si vous connaissez le numéro identifiant de votre médecin, vous pouvez le renseigner ici.', null);
INSERT INTO `default_data_field_assignments` VALUES ('25', '1', '2', '25', 'no', 'no', '', null);
INSERT INTO `default_data_field_assignments` VALUES ('26', '3', '2', '26', 'no', 'no', '', null);
INSERT INTO `default_data_field_assignments` VALUES ('502', '14', '3', '505', 'no', 'no', '', null);
INSERT INTO `default_data_field_assignments` VALUES ('564', '2', '87', '567', 'yes', 'yes', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('545', '1', '85', '548', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('546', '2', '85', '549', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('547', '3', '85', '550', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('548', '4', '85', '551', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('549', '5', '85', '552', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('550', '6', '85', '553', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('551', '7', '85', '554', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('552', '8', '85', '555', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('553', '9', '85', '556', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('554', '10', '85', '557', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('555', '11', '85', '558', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('556', '12', '85', '559', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('557', '13', '85', '560', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('558', '14', '85', '561', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('559', '15', '85', '562', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('560', '1', '86', '563', 'yes', 'yes', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('561', '2', '86', '564', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('562', '16', '85', '565', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('563', '1', '87', '566', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('503', '15', '3', '506', 'no', 'no', 'Numéro de bureau ou instructitons d\'accès', null);
INSERT INTO `default_data_field_assignments` VALUES ('504', '16', '3', '507', 'no', 'no', '', null);

-- ----------------------------
-- Table structure for `default_data_streams`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_streams`;
CREATE TABLE `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_streams
-- ----------------------------
INSERT INTO `default_data_streams` VALUES ('1', 'lang:blog:blog_title', 'blog', 'blogs', null, null, 0x613A323A7B693A303B733A323A226964223B693A313B733A373A2263726561746564223B7D, null, 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('2', 'Default', 'def_page_fields', 'pages', null, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613A323A7B693A303B733A323A226964223B693A313B733A373A2263726561746564223B7D, null, 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('3', 'lang:user_profile_fields_label', 'profiles', 'users', null, 'Profiles for users module', 0x613A313A7B693A303B733A31323A22646973706C61795F6E616D65223B7D, 'display_name', 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('85', 'lang:doctor:doctors', 'doctors', 'doctor', 'doctor_', null, 0x613A343A7B693A303B733A343A2264617973223B693A313B733A31313A226465736372697074696F6E223B693A323B733A363A2267726F757065223B693A333B733A31303A22646F63746F725F636174223B7D, null, 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('86', 'lang:doctor:categories', 'categories', 'doctor', 'doctor_', null, 0x613A323A7B693A303B733A31303A22706172656E745F636174223B693A313B733A31303A227370656369616C697479223B7D, 'speciality', 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('87', 'lang:doctor:organisations', 'organisations', 'doctor', 'doctor_', null, 0x613A323A7B693A303B733A31323A226F7267616E69736174696F6E223B693A313B733A363A22737562736574223B7D, 'subset', 'title', null, 'no', null);

-- ----------------------------
-- Table structure for `default_def_page_fields`
-- ----------------------------
DROP TABLE IF EXISTS `default_def_page_fields`;
CREATE TABLE `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `pre_html` longtext COLLATE utf8_unicode_ci,
  `post_html` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_def_page_fields
-- ----------------------------
INSERT INTO `default_def_page_fields` VALUES ('1', '2017-05-18 13:39:28', '2018-03-10 00:14:29', '1', null, '<div style=\"text-align: center;\"><span style=\"font-size: 26px;\">Prenez rendez vous avec votre professionnel de sant&eacute;.</span></div>\r\n', '{{ dev:empty_cache }}\r\n\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/997cd2e64fac717/80/80\" alt=\"Généraliste\"/> \r\n			<p>Médecins généralistes</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/292281c45a9207c/80/80\" alt=\"Ophtalmologue\"/> \r\n			<p>Ophtalmologue</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/25e01b2784711d9/80/80\" alt=\"ORL\"/> \r\n			<p>ORL</p>\r\n		</div>\r\n</div>\r\n		\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/a4278245d864a56/80/80\" alt=\"Cardiologie\"/> \r\n			<p>Cardiologie</p> \r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/3590b30f5b17f8c/80/80\" alt=\"Spécialistes femme\"/> \r\n			<p>Spécialistes femme</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/379ffc54d24dc2f/80/80\" alt=\"Dentiste\"/> \r\n			<p>Dentiste</p>\r\n		</div> \r\n</div>\r\n		\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/82ed2c7f7efb8a4/80/80\" alt=\"Radiologue\"/> \r\n			<p>Radiologue</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/c8e8886f9e65488/80/80\" alt=\"Autres médecins\"/> \r\n			<p>Autres médecins</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/353de3d9e958976/80/80\" alt=\"Etablissements de santé\"/> \r\n			<p>Etablissements de santé</p>\r\n		</div>\r\n</div>', '');
INSERT INTO `default_def_page_fields` VALUES ('2', '2017-05-18 13:39:28', '2017-05-18 15:24:16', '1', null, '<p>{{ contact:form name=&quot;text|required&quot; email=&quot;text|required|valid_email&quot; subject=&quot;dropdown|Rendez-vous|Question|Autre&quot; message=&quot;textarea&quot; }}</p>\r\n\r\n<div><label for=\"name\">Nom:</label>{{ name }}</div>\r\n\r\n<div><label for=\"email\">Email:</label>{{ email }}</div>\r\n\r\n<div><label for=\"subject\">Sujet:</label>{{ subject }}</div>\r\n\r\n<div><label for=\"message\">Message:</label>{{ message }}</div>\r\n{{ /contact:form }}', null, null);
INSERT INTO `default_def_page_fields` VALUES ('3', '2017-05-18 13:39:28', null, '1', null, '{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}', null, null);
INSERT INTO `default_def_page_fields` VALUES ('4', '2017-05-18 13:39:28', null, '1', null, '{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for \"{{ query }}\".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href=\"{{ url }}\">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}', null, null);
INSERT INTO `default_def_page_fields` VALUES ('5', '2017-05-18 13:39:28', null, '1', null, '<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>', null, null);
INSERT INTO `default_def_page_fields` VALUES ('12', '2018-03-09 14:17:43', '2018-03-10 00:22:07', '1', '5', null, '', '');
INSERT INTO `default_def_page_fields` VALUES ('8', '2017-05-18 13:57:03', null, '1', '1', null, null, null);
INSERT INTO `default_def_page_fields` VALUES ('9', '2017-05-18 13:57:31', null, '1', '2', null, null, null);
INSERT INTO `default_def_page_fields` VALUES ('10', '2017-05-18 14:33:22', null, '1', '3', 'Pour venir chez {{settings:site_name}}<br />\r\n90 Avenue Francois Mitterand<br />\r\n91200 Athis-Mons<br />\r\n<iframe allowfullscreen=\"\" frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2633.046912993283!2d2.369675615668944!3d48.70458427927276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e675f208bc94e9%3A0xe9f8f7f2e1e692fc!2s90+Avenue+Fran%C3%A7ois+Mitterrand%2C+91200+Athis-Mons!5e0!3m2!1sfr!2sfr!4v1495110775316\" style=\"border:0\" width=\"600\"></iframe> ​<br />\r\n09 83 76 63 08&nbsp;<br />\r\nbgoulin@hotmail.fr<br />\r\n<br />\r\nPar les transport Bus N&deg; 285 arr&ecirc;t Marx-Dormoy<br />\r\nPaking priv&eacute;<br />\r\n<br />\r\n​', null, null);
INSERT INTO `default_def_page_fields` VALUES ('11', '2017-05-18 14:35:37', null, '1', '4', '<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"2\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Jour</td>\r\n			<td>Heures</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lundi</td>\r\n			<td>11h-20h</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mardi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mercredi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Jeudi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vendredi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Samedi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dimanche</td>\r\n			<td>ferm&eacute;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', null, null);
INSERT INTO `default_def_page_fields` VALUES ('13', '2018-03-09 23:22:20', '2018-03-10 00:04:09', '1', '6', null, '<div class=\"container\">\r\n\r\n      <div class=\"page-header\" id=\"banner\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-8 col-md-7 col-sm-6\">\r\n            <h1>Flatly</h1>\r\n            <p class=\"lead\">Flat and modern</p>\r\n          </div>\r\n          <div class=\"col-lg-4 col-md-5 col-sm-6\">\r\n            <div class=\"sponsor\">\r\n              <script async=\"\" type=\"text/javascript\" src=\"//cdn.carbonads.com/carbon.js?zoneid=1673&amp;serve=C6AILKT&amp;placement=bootswatchcom\" id=\"_carbonads_js\"></script><div id=\"carbonads\"><span><span class=\"carbon-wrap\"><a href=\"//srv.carbonads.net/ads/click/x/GTND423YCY7I4237CYS4YKQWFTSDCK7LCYAD5Z3JCEADKKJUCTAI42QKC6BDE2JIC6BDTK3EHJNCLSIZ?segment=placement:bootswatchcom;\" class=\"carbon-img\" target=\"_blank\"><img src=\"//assets.servedby-buysellads.com/p/manage/asset/id/35636\" alt=\"\" border=\"0\" height=\"100\" width=\"130\" style=\"max-width: 130px;\"></a><a href=\"//srv.carbonads.net/ads/click/x/GTND423YCY7I4237CYS4YKQWFTSDCK7LCYAD5Z3JCEADKKJUCTAI42QKC6BDE2JIC6BDTK3EHJNCLSIZ?segment=placement:bootswatchcom;\" class=\"carbon-text\" target=\"_blank\">Segment is the last integration you will need.</a></span><a href=\"http://carbonads.net/\" class=\"carbon-poweredby\" target=\"_blank\">ads via Carbon</a></span></div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-3 col-md-3 col-sm-4\">\r\n            <div class=\"list-group table-of-contents\">\r\n              <a class=\"list-group-item\" href=\"#navbar\">Navbar</a>\r\n              <a class=\"list-group-item\" href=\"#buttons\">Buttons</a>\r\n              <a class=\"list-group-item\" href=\"#typography\">Typography</a>\r\n              <a class=\"list-group-item\" href=\"#tables\">Tables</a>\r\n              <a class=\"list-group-item\" href=\"#forms\">Forms</a>\r\n              <a class=\"list-group-item\" href=\"#navs\">Navs</a>\r\n              <a class=\"list-group-item\" href=\"#indicators\">Indicators</a>\r\n              <a class=\"list-group-item\" href=\"#progress-bars\">Progress bars</a>\r\n              <a class=\"list-group-item\" href=\"#containers\">Containers</a>\r\n              <a class=\"list-group-item\" href=\"#dialogs\">Dialogs</a>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Navbar\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section clearfix\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"navbar\">Navbar</h1>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <nav class=\"navbar navbar-default\">\r\n                <div class=\"container-fluid\">\r\n                  <div class=\"navbar-header\">\r\n                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n                      <span class=\"sr-only\">Toggle navigation</span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                    </button>\r\n                    <a class=\"navbar-brand\" href=\"#\">Brand</a>\r\n                  </div>\r\n\r\n                  <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n                    <ul class=\"nav navbar-nav\">\r\n                      <li class=\"active\"><a href=\"#\">Link <span class=\"sr-only\">(current)</span></a></li>\r\n                      <li><a href=\"#\">Link</a></li>\r\n                      <li class=\"dropdown\">\r\n                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></a>\r\n                        <ul class=\"dropdown-menu\" role=\"menu\">\r\n                          <li><a href=\"#\">Action</a></li>\r\n                          <li><a href=\"#\">Another action</a></li>\r\n                          <li><a href=\"#\">Something else here</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">Separated link</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">One more separated link</a></li>\r\n                        </ul>\r\n                      </li>\r\n                    </ul>\r\n                    <form class=\"navbar-form navbar-left\" role=\"search\">\r\n                      <div class=\"form-group\">\r\n                        <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n                      </div>\r\n                      <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n                    </form>\r\n                    <ul class=\"nav navbar-nav navbar-right\">\r\n                      <li><a href=\"#\">Link</a></li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </nav>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <nav class=\"navbar navbar-inverse\">\r\n                <div class=\"container-fluid\">\r\n                  <div class=\"navbar-header\">\r\n                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-2\">\r\n                      <span class=\"sr-only\">Toggle navigation</span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                    </button>\r\n                    <a class=\"navbar-brand\" href=\"#\">Brand</a>\r\n                  </div>\r\n\r\n                  <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-2\">\r\n                    <ul class=\"nav navbar-nav\">\r\n                      <li class=\"active\"><a href=\"#\">Link <span class=\"sr-only\">(current)</span></a></li>\r\n                      <li><a href=\"#\">Link</a></li>\r\n                      <li class=\"dropdown\">\r\n                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></a>\r\n                        <ul class=\"dropdown-menu\" role=\"menu\">\r\n                          <li><a href=\"#\">Action</a></li>\r\n                          <li><a href=\"#\">Another action</a></li>\r\n                          <li><a href=\"#\">Something else here</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">Separated link</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">One more separated link</a></li>\r\n                        </ul>\r\n                      </li>\r\n                    </ul>\r\n                    <form class=\"navbar-form navbar-left\" role=\"search\">\r\n                      <div class=\"form-group\">\r\n                        <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n                      </div>\r\n                      <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n                    </form>\r\n                    <ul class=\"nav navbar-nav navbar-right\">\r\n                      <li><a href=\"#\">Link</a></li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </nav>\r\n            </div><!-- /example -->\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n\r\n      <!-- Buttons\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"page-header\">\r\n          <div class=\"row\">\r\n            <div class=\"col-lg-12\">\r\n              <h1 id=\"buttons\">Buttons</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-7\">\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default\">Default</a>\r\n              <a href=\"#\" class=\"btn btn-primary\">Primary</a>\r\n              <a href=\"#\" class=\"btn btn-success\">Success</a>\r\n              <a href=\"#\" class=\"btn btn-info\">Info</a>\r\n              <a href=\"#\" class=\"btn btn-warning\">Warning</a>\r\n              <a href=\"#\" class=\"btn btn-danger\">Danger</a>\r\n              <a href=\"#\" class=\"btn btn-link\">Link</a>\r\n            </p>\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default disabled\">Default</a>\r\n              <a href=\"#\" class=\"btn btn-primary disabled\">Primary</a>\r\n              <a href=\"#\" class=\"btn btn-success disabled\">Success</a>\r\n              <a href=\"#\" class=\"btn btn-info disabled\">Info</a>\r\n              <a href=\"#\" class=\"btn btn-warning disabled\">Warning</a>\r\n              <a href=\"#\" class=\"btn btn-danger disabled\">Danger</a>\r\n              <a href=\"#\" class=\"btn btn-link disabled\">Link</a>\r\n            </p>\r\n\r\n\r\n            <div style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-toolbar bs-component\" style=\"margin: 0;\">\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">Default</a>\r\n                  <a href=\"#\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-primary\">Primary</a>\r\n                  <a href=\"#\" class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-success\">Success</a>\r\n                  <a href=\"#\" class=\"btn btn-success dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-info\">Info</a>\r\n                  <a href=\"#\" class=\"btn btn-info dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-warning\">Warning</a>\r\n                  <a href=\"#\" class=\"btn btn-warning dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n              </div>\r\n            </div>\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-primary btn-lg\">Large button</a>\r\n              <a href=\"#\" class=\"btn btn-primary\">Default button</a>\r\n              <a href=\"#\" class=\"btn btn-primary btn-sm\">Small button</a>\r\n              <a href=\"#\" class=\"btn btn-primary btn-xs\">Mini button</a>\r\n            </p>\r\n\r\n          </div>\r\n          <div class=\"col-lg-5\">\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default btn-lg btn-block\">Block level button</a>\r\n            </p>\r\n\r\n\r\n            <div class=\"bs-component\" style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-group btn-group-justified\">\r\n                <a href=\"#\" class=\"btn btn-default\">Left</a>\r\n                <a href=\"#\" class=\"btn btn-default\">Middle</a>\r\n                <a href=\"#\" class=\"btn btn-default\">Right</a>\r\n              </div>\r\n            </div>\r\n\r\n            <div class=\"bs-component\" style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-toolbar\">\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">1</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">2</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">3</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">4</a>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">5</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">6</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">7</a>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">8</a>\r\n                  <div class=\"btn-group\">\r\n                    <a href=\"#\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\">\r\n                      Dropdown\r\n                      <span class=\"caret\"></span>\r\n                    </a>\r\n                    <ul class=\"dropdown-menu\">\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                     </ul>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <div class=\"btn-group-vertical\">\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n              </div>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Typography\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"typography\">Typography</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <!-- Headings -->\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h1>Heading 1</h1>\r\n              <h2>Heading 2</h2>\r\n              <h3>Heading 3</h3>\r\n              <h4>Heading 4</h4>\r\n              <h5>Heading 5</h5>\r\n              <h6>Heading 6</h6>\r\n              <p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h2>Example body text</h2>\r\n              <p>Nullam quis risus eget <a href=\"#\">urna mollis ornare</a> vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>\r\n              <p><small>This line of text is meant to be treated as fine print.</small></p>\r\n              <p>The following snippet of text is <strong>rendered as bold text</strong>.</p>\r\n              <p>The following snippet of text is <em>rendered as italicized text</em>.</p>\r\n              <p>An abbreviation of the word attribute is <abbr title=\"attribute\">attr</abbr>.</p>\r\n            </div>\r\n\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h2>Emphasis classes</h2>\r\n              <p class=\"text-muted\">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</p>\r\n              <p class=\"text-primary\">Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\r\n              <p class=\"text-warning\">Etiam porta sem malesuada magna mollis euismod.</p>\r\n              <p class=\"text-danger\">Donec ullamcorper nulla non metus auctor fringilla.</p>\r\n              <p class=\"text-success\">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>\r\n              <p class=\"text-info\">Maecenas sed diam eget risus varius blandit sit amet non magna.</p>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n        <!-- Blockquotes -->\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2 id=\"type-blockquotes\">Blockquotes</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"bs-component\">\r\n              <blockquote>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n                <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n              </blockquote>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"bs-component\">\r\n              <blockquote class=\"blockquote-reverse\">\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n                <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n              </blockquote>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Tables\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"tables\">Tables</h1>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <table class=\"table table-striped table-hover \">\r\n                <thead>\r\n                  <tr>\r\n                    <th>#</th>\r\n                    <th>Column heading</th>\r\n                    <th>Column heading</th>\r\n                    <th>Column heading</th>\r\n                  </tr>\r\n                </thead>\r\n                <tbody>\r\n                  <tr>\r\n                    <td>1</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr>\r\n                    <td>2</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"info\">\r\n                    <td>3</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"success\">\r\n                    <td>4</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"danger\">\r\n                    <td>5</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"warning\">\r\n                    <td>6</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"active\">\r\n                    <td>7</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                </tbody>\r\n              </table> \r\n            </div><!-- /example -->\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Forms\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"forms\">Forms</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"well bs-component\">\r\n              <form class=\"form-horizontal\">\r\n                <fieldset>\r\n                  <legend>Legend</legend>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"inputEmail\" class=\"col-lg-2 control-label\">Email</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <input type=\"text\" class=\"form-control\" id=\"inputEmail\" placeholder=\"Email\">\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"inputPassword\" class=\"col-lg-2 control-label\">Password</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <input type=\"password\" class=\"form-control\" id=\"inputPassword\" placeholder=\"Password\">\r\n                      <div class=\"checkbox\">\r\n                        <label>\r\n                          <input type=\"checkbox\"> Checkbox\r\n                        </label>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"textArea\" class=\"col-lg-2 control-label\">Textarea</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <textarea class=\"form-control\" rows=\"3\" id=\"textArea\"></textarea>\r\n                      <span class=\"help-block\">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label class=\"col-lg-2 control-label\">Radios</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <div class=\"radio\">\r\n                        <label>\r\n                          <input type=\"radio\" name=\"optionsRadios\" id=\"optionsRadios1\" value=\"option1\" checked=\"\">\r\n                          Option one is this\r\n                        </label>\r\n                      </div>\r\n                      <div class=\"radio\">\r\n                        <label>\r\n                          <input type=\"radio\" name=\"optionsRadios\" id=\"optionsRadios2\" value=\"option2\">\r\n                          Option two can be something else\r\n                        </label>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"select\" class=\"col-lg-2 control-label\">Selects</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <select class=\"form-control\" id=\"select\">\r\n                        <option>1</option>\r\n                        <option>2</option>\r\n                        <option>3</option>\r\n                        <option>4</option>\r\n                        <option>5</option>\r\n                      </select>\r\n                      <br>\r\n                      <select multiple=\"\" class=\"form-control\">\r\n                        <option>1</option>\r\n                        <option>2</option>\r\n                        <option>3</option>\r\n                        <option>4</option>\r\n                        <option>5</option>\r\n                      </select>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <div class=\"col-lg-10 col-lg-offset-2\">\r\n                      <button type=\"reset\" class=\"btn btn-default\">Cancel</button>\r\n                      <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\r\n                    </div>\r\n                  </div>\r\n                </fieldset>\r\n              </form>\r\n            <div id=\"source-button\" class=\"btn btn-primary btn-xs\" style=\"display: none;\">&lt; &gt;</div></div>\r\n          </div>\r\n          <div class=\"col-lg-4 col-lg-offset-1\">\r\n\r\n              <form class=\"bs-component\">\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"focusedInput\">Focused input</label>\r\n                  <input class=\"form-control\" id=\"focusedInput\" type=\"text\" value=\"This is focused...\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"disabledInput\">Disabled input</label>\r\n                  <input class=\"form-control\" id=\"disabledInput\" type=\"text\" placeholder=\"Disabled input here...\" disabled=\"\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-warning\">\r\n                  <label class=\"control-label\" for=\"inputWarning\">Input warning</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputWarning\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-error\">\r\n                  <label class=\"control-label\" for=\"inputError\">Input error</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputError\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-success\">\r\n                  <label class=\"control-label\" for=\"inputSuccess\">Input success</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputSuccess\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputLarge\">Large input</label>\r\n                  <input class=\"form-control input-lg\" type=\"text\" id=\"inputLarge\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputDefault\">Default input</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputDefault\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputSmall\">Small input</label>\r\n                  <input class=\"form-control input-sm\" type=\"text\" id=\"inputSmall\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\">Input addons</label>\r\n                  <div class=\"input-group\">\r\n                    <span class=\"input-group-addon\">$</span>\r\n                    <input type=\"text\" class=\"form-control\">\r\n                    <span class=\"input-group-btn\">\r\n                      <button class=\"btn btn-default\" type=\"button\">Button</button>\r\n                    </span>\r\n                  </div>\r\n                </div>\r\n              </form>\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Navs\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"navs\">Navs</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-tabs\">Tabs</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-tabs\">\r\n                <li class=\"\"><a href=\"#home\" data-toggle=\"tab\" aria-expanded=\"false\">Home</a></li>\r\n                <li class=\"active\"><a href=\"#profile\" data-toggle=\"tab\" aria-expanded=\"true\">Profile</a></li>\r\n                <li class=\"disabled\"><a>Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#dropdown1\" data-toggle=\"tab\">Action</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#dropdown2\" data-toggle=\"tab\">Another action</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n              <div id=\"myTabContent\" class=\"tab-content\">\r\n                <div class=\"tab-pane fade\" id=\"home\">\r\n                  <p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade active in\" id=\"profile\">\r\n                  <p>Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade\" id=\"dropdown1\">\r\n                  <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney\'s organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade\" id=\"dropdown2\">\r\n                  <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-pills\">Pills</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills\">\r\n                <li class=\"active\"><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Profile</a></li>\r\n                <li class=\"disabled\"><a href=\"#\">Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n            <br>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills nav-stacked\">\r\n                <li class=\"active\"><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Profile</a></li>\r\n                <li class=\"disabled\"><a href=\"#\">Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-breadcrumbs\">Breadcrumbs</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"breadcrumb\">\r\n                <li class=\"active\">Home</li>\r\n              </ul>\r\n\r\n              <ul class=\"breadcrumb\">\r\n                <li><a href=\"#\">Home</a></li>\r\n                <li class=\"active\">Library</li>\r\n              </ul>\r\n\r\n              <ul class=\"breadcrumb\">\r\n                <li><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Library</a></li>\r\n                <li class=\"active\">Data</li>\r\n              </ul>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"pagination\">Pagination</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"pagination\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">4</a></li>\r\n                <li><a href=\"#\">5</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pagination pagination-lg\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pagination pagination-sm\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">4</a></li>\r\n                <li><a href=\"#\">5</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"pager\">Pager</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"pager\">\r\n                <li><a href=\"#\">Previous</a></li>\r\n                <li><a href=\"#\">Next</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pager\">\r\n                <li class=\"previous disabled\"><a href=\"#\">← Older</a></li>\r\n                <li class=\"next\"><a href=\"#\">Newer →</a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Indicators\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"indicators\">Indicators</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Alerts</h2>\r\n            <div class=\"bs-component\">\r\n              <div class=\"alert alert-dismissible alert-warning\">\r\n                <button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>\r\n                <h4>Warning!</h4>\r\n                <p>Best check yo self, you\'re not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, <a href=\"#\" class=\"alert-link\">vel scelerisque nisl consectetur et</a>.</p>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2>Labels</h2>\r\n            <div class=\"bs-component\" style=\"margin-bottom: 40px;\">\r\n              <span class=\"label label-default\">Default</span>\r\n              <span class=\"label label-primary\">Primary</span>\r\n              <span class=\"label label-success\">Success</span>\r\n              <span class=\"label label-warning\">Warning</span>\r\n              <span class=\"label label-danger\">Danger</span>\r\n              <span class=\"label label-info\">Info</span>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2>Badges</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills\">\r\n                <li class=\"active\"><a href=\"#\">Home <span class=\"badge\">42</span></a></li>\r\n                <li><a href=\"#\">Profile <span class=\"badge\"></span></a></li>\r\n                <li><a href=\"#\">Messages <span class=\"badge\">3</span></a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Progress bars\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"progress-bars\">Progress bars</h1>\r\n            </div>\r\n\r\n            <h3 id=\"progress-basic\">Basic</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar\" style=\"width: 60%;\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-alternatives\">Contextual alternatives</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-info\" style=\"width: 20%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 40%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 60%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 80%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-striped\">Striped</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-info\" style=\"width: 20%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 40%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 60%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 80%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-animated\">Animated</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress progress-striped active\">\r\n                <div class=\"progress-bar\" style=\"width: 45%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-stacked\">Stacked</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 35%\"></div>\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 20%\"></div>\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 10%\"></div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Containers\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"containers\">Containers</h1>\r\n            </div>\r\n            <div class=\"bs-component\">\r\n              <div class=\"jumbotron\">\r\n                <h1>Jumbotron</h1>\r\n                <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>\r\n                <p><a class=\"btn btn-primary btn-lg\">Learn more</a></p>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>List groups</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <ul class=\"list-group\">\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">14</span>\r\n                  Cras justo odio\r\n                </li>\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">2</span>\r\n                  Dapibus ac facilisis in\r\n                </li>\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">1</span>\r\n                  Morbi leo risus\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"list-group\">\r\n                <a href=\"#\" class=\"list-group-item active\">\r\n                  Cras justo odio\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">Dapibus ac facilisis in\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">Morbi leo risus\r\n                </a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"list-group\">\r\n                <a href=\"#\" class=\"list-group-item\">\r\n                  <h4 class=\"list-group-item-heading\">List group item heading</h4>\r\n                  <p class=\"list-group-item-text\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">\r\n                  <h4 class=\"list-group-item-heading\">List group item heading</h4>\r\n                  <p class=\"list-group-item-text\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\r\n                </a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Panels</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-body\">\r\n                  Basic panel\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-heading\">Panel heading</div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n                <div class=\"panel-footer\">Panel footer</div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-primary\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel primary</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-success\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel success</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-warning\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel warning</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-danger\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel danger</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-info\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel info</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Wells</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well\">\r\n                Look, I\'m in a well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well well-sm\">\r\n                Look, I\'m in a small well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well well-lg\">\r\n                Look, I\'m in a large well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Dialogs\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"dialogs\">Dialogs</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <h2>Modals</h2>\r\n            <div class=\"bs-component\">\r\n              <div class=\"modal\">\r\n                <div class=\"modal-dialog\">\r\n                  <div class=\"modal-content\">\r\n                    <div class=\"modal-header\">\r\n                      <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n                      <h4 class=\"modal-title\">Modal title</h4>\r\n                    </div>\r\n                    <div class=\"modal-body\">\r\n                      <p>One fine body…</p>\r\n                    </div>\r\n                    <div class=\"modal-footer\">\r\n                      <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\r\n                      <button type=\"button\" class=\"btn btn-primary\">Save changes</button>\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-6\">\r\n            <h2>Popovers</h2>\r\n            <div class=\"bs-component\">\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"left\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Left</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"top\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Top</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"Vivamus\r\n              sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Bottom</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"right\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Right</button>\r\n            </div>\r\n            <h2>Tooltips</h2>\r\n            <div class=\"bs-component\">\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"left\" title=\"\" data-original-title=\"Tooltip on left\">Left</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"\" data-original-title=\"Tooltip on top\">Top</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"Tooltip on bottom\">Bottom</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"\" data-original-title=\"Tooltip on right\">Right</button>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <div id=\"source-modal\" class=\"modal fade\" style=\"display: none;\">\r\n        <div class=\"modal-dialog modal-lg\">\r\n          <div class=\"modal-content\">\r\n            <div class=\"modal-header\">\r\n              <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n              <h4 class=\"modal-title\">Source Code</h4>\r\n            </div>\r\n            <div class=\"modal-body\">\r\n              <pre>&lt;ul class=\"nav nav-tabs\"&gt;\r\n  &lt;li class=\"\"&gt;&lt;a href=\"#home\" data-toggle=\"tab\" aria-expanded=\"false\"&gt;Home&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"active\"&gt;&lt;a href=\"#profile\" data-toggle=\"tab\" aria-expanded=\"true\"&gt;Profile&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"disabled\"&gt;&lt;a&gt;Disabled&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"dropdown open\"&gt;\r\n    &lt;a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"true\"&gt;\r\n      Dropdown &lt;span class=\"caret\"&gt;&lt;/span&gt;\r\n    &lt;/a&gt;\r\n    &lt;ul class=\"dropdown-menu\"&gt;\r\n      &lt;li&gt;&lt;a href=\"#dropdown1\" data-toggle=\"tab\"&gt;Action&lt;/a&gt;&lt;/li&gt;\r\n      &lt;li class=\"divider\"&gt;&lt;/li&gt;\r\n      &lt;li&gt;&lt;a href=\"#dropdown2\" data-toggle=\"tab\"&gt;Another action&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n  &lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;div id=\"myTabContent\" class=\"tab-content\"&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"home\"&gt;\r\n    &lt;p&gt;Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade active in\" id=\"profile\"&gt;\r\n    &lt;p&gt;Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"dropdown1\"&gt;\r\n    &lt;p&gt;Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney\'s organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"dropdown2\"&gt;\r\n    &lt;p&gt;Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;</pre>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      \r\n\r\n\r\n    </div>', '');
INSERT INTO `default_def_page_fields` VALUES ('14', '2018-03-10 00:20:01', '2018-03-10 00:21:33', '1', '7', null, '', '');
INSERT INTO `default_def_page_fields` VALUES ('15', '2018-03-19 16:04:00', '2018-03-19 17:01:12', '1', '8', '{{ doctor:listing order_by=&quot;id&quot; order=&quot;asc&quot;&nbsp; }}<br />\r\n&nbsp; {{ id }} {{ name }} {{ area_name }} {{ town }}<br />\r\n<br />\r\n&nbsp;{{ /doctor:listing }}', '', '');
INSERT INTO `default_def_page_fields` VALUES ('16', '2018-03-19 16:49:57', '2018-03-19 17:00:47', '1', '9', '{{ doctor:show id={url:segments segment=&quot;2&quot;} }}<br />\r\n&nbsp; {{ id }} {{ name }} {{ area_name }} {{ town }}<br />\r\n&nbsp;{{ /doctor:show }}', '{{ url:segments segment=\"1\" }}\r\n{{ url:segments segment=\"2\" }}\r\n{{ url:segments segment=\"3\" }}', '');
INSERT INTO `default_def_page_fields` VALUES ('17', '2018-03-20 02:36:25', '2018-03-20 03:49:12', '1', '10', '<br />\r\n<canvas :netbeans_generated=\"true\" height=\"400\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"1214\"></canvas><canvas :netbeans_generated=\"true\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\"></canvas><canvas :netbeans_generated=\"true\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\"></canvas>', '{{ pages:page_tree start-id=\"17\" disable-levels=\"rdv-passes|mes-rdv-passes|rdv-passes-de-mes-proches\" }}', '{{ pages:page_tree start-id=\"17\" disable-levels=\"rdv-a-venir|mes-rdv-a-venir|rdv-a-venir-de-mes-proches\" }}');
INSERT INTO `default_def_page_fields` VALUES ('18', '2018-03-20 02:36:59', '2018-03-20 04:12:39', '1', '11', '<canvas :netbeans_generated=\"true\" height=\"400\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"1214\"></canvas>', '{{ appointments:my_appointments     futur_past=\"futur\" other_person=\"no\"       }} \r\nLe\r\n {{appointment_date}}  \r\nà\r\n {{appointment_time}}  \r\n \r\n{{gender}}  \r\n {{first_name}}  \r\n {{last_name}}  \r\n<br>\r\n {{ /appointments:my_appointments }} ', '');
INSERT INTO `default_def_page_fields` VALUES ('19', '2018-03-20 02:37:22', '2018-03-20 04:40:30', '1', '12', '<canvas :netbeans_generated=\"true\" height=\"0\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"0\"></canvas>', '{{ appointments:my_appointments     futur_past=\"futur\" other_person=\"yes\"       }}  \r\n<div class=\"panel panel-default\">\r\n		<div class=\"panel-heading\">\r\n		Le\r\n {{appointment_date}}  \r\nà\r\n {{appointment_time}}  \r\n </div>\r\n		<div class=\"panel-body\">\r\n{{doc_name}}\r\n{{gender}}  \r\n {{first_name}}  \r\n {{last_name}}  \r\n		</div>\r\n</div> \r\n {{ /appointments:my_appointments }} ', '');
INSERT INTO `default_def_page_fields` VALUES ('20', '2018-03-20 02:38:05', null, '1', '13', '<canvas :netbeans_generated=\"true\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\"></canvas>', null, null);
INSERT INTO `default_def_page_fields` VALUES ('21', '2018-03-20 02:38:27', '2018-03-20 04:19:43', '1', '14', null, '{{ appointments:my_appointments     futur_past=\"past\"   other_person=\"yes\"     }} \r\nLe\r\n {{appointment_date}}  \r\nà\r\n {{appointment_time}}  \r\n \r\n{{gender}}  \r\n {{first_name}}  \r\n {{last_name}}  \r\n<br>\r\n {{ /appointments:my_appointments }} ', '');
INSERT INTO `default_def_page_fields` VALUES ('22', '2018-03-20 03:33:50', '2018-03-20 04:28:20', '1', '15', null, '{{ appointments:my_appointments  }} \r\n\r\n<div class=\"panel panel-default\">\r\n		<div class=\"panel-heading\">doc {{doctor_id}} user {{user_id}}</div>\r\n		<div class=\"panel-body\">\r\n		Le\r\n {{appointment_date}}  \r\nà\r\n {{appointment_time}}  \r\n \r\n{{gender}}  \r\n {{first_name}}  \r\n {{last_name}}  \r\n		</div>\r\n</div> \r\n {{ /appointments:my_appointments }} ', '');
INSERT INTO `default_def_page_fields` VALUES ('23', '2018-03-20 03:34:47', '2018-03-20 04:18:23', '1', '16', null, '{{ appointments:my_appointments     futur_past=\"past\"      }} \r\nLe\r\n {{appointment_date}}  \r\nà\r\n {{appointment_time}}  \r\n \r\n{{gender}}  \r\n {{first_name}}  \r\n {{last_name}}  \r\n<br>\r\n {{ /appointments:my_appointments }} ', '');

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
INSERT INTO `default_doctor_doctors` VALUES ('14', '2018-03-15 03:02:27', '2018-03-19 20:51:59', '1', '14', 'Dr Fabien Mauro', '1\n2\n3\n4\n5\n6', null, '0900', '2000', null, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '18 Rue de Turbigo', '75002', 'Paris', '699df7530ec4c93', '6', '1');

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
INSERT INTO `default_doctor_organisations` VALUES ('1', '2018-03-14 14:47:35', '2018-03-15 00:14:47', '1', '1', '1', 'Privée');
INSERT INTO `default_doctor_organisations` VALUES ('2', '2018-03-14 14:49:59', '2018-03-14 17:43:03', '1', '2', '2', 'Publique');
INSERT INTO `default_doctor_organisations` VALUES ('4', '2018-03-14 15:04:27', '2018-03-14 17:37:51', '1', '3', '1', 'Clinique privée');
INSERT INTO `default_doctor_organisations` VALUES ('5', '2018-03-14 15:04:47', '2018-03-14 17:44:08', '1', '4', '1', 'Soins à domicile');
INSERT INTO `default_doctor_organisations` VALUES ('6', '2018-03-14 15:05:03', '2018-03-14 17:43:23', '1', '5', '2', 'Hopital ');
INSERT INTO `default_doctor_organisations` VALUES ('7', '2018-03-14 15:05:15', '2018-03-14 17:43:38', '1', '6', '2', 'Dispensaire');

-- ----------------------------
-- Table structure for `default_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `default_email_templates`;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_email_templates
-- ----------------------------
INSERT INTO `default_email_templates` VALUES ('1', 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\r\n				<p>\r\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\r\n				<strong>Operating System: {{ sender_os }}<br/>\r\n				<strong>User Agent: {{ sender_agent }}</strong>\r\n				</p>\r\n				<p>{{ comment }}</p>\r\n				<p>View Comment: {{ redirect_url }}</p>', 'en', '1', 'comments');
INSERT INTO `default_email_templates` VALUES ('2', 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', 'This message was sent via the contact form on with the following details:\r\n				<hr />\r\n				IP Address: {{ sender_ip }}\r\n				OS {{ sender_os }}\r\n				Agent {{ sender_agent }}\r\n				<hr />\r\n				{{ message }}\r\n\r\n				{{ name }},\r\n\r\n				{{ email }}', 'en', '1', 'pages');
INSERT INTO `default_email_templates` VALUES ('3', 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\r\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\r\n				<strong>Operating System: {{ sender_os }}</strong><br/>\r\n				<strong>User Agent: {{ sender_agent }}</strong>\r\n				</p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('4', 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\r\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\r\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\r\n				<p>&nbsp;</p>\r\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\r\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\r\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('5', 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\r\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\r\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('6', 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\r\n				<p>Your new password is: {{ new_password }}</p>\r\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('35', 'appointments-admin', 'Appointments admin', 'Email admin suite a prise de RDV', 'RDV le {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Patient: {{user_data:display_name}}', '<p>Un nouveau RDV pour {{user_data:display_name}} | {{appointment_data:email}}</p>\r\n                                                        <h2>Date de livraison {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }}</h2>\r\n                                                        <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>\r\n\r\n                                                        <p> \r\n                                                        <a href=\"https://maps.google.fr/maps/search/{{appointment_data:street}}, {{appointment_data:area_name}} {{appointment_data:town}}\" target=\"_blank\">Voir sur Google</a><br />\r\n                                                        Contact :<br />\r\n                                                        <a href=\"tel:{{appointment_data:phone}}\">{{appointment_data:phone}} </a> - <a href=\"tel:{{appointment_data:mobile}}\">{{appointment_data:mobile}} </a> - <a href=\"mailto:{{appointment_data:email}}\">{{appointment_data:email}} </a><br />\r\n                                                        </p>    \r\n                                                        <p>\r\n                                                        N° RDV: {{appointment_id}} {{ admin_url }}<br />\r\n                                                        <a href=\"{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}\" target=\"_blank\">\r\n                                                        Voir les RDV du {{appointment_data:appointment_date}}\r\n                                                        </a>\r\n                                                        <br />\r\n                                                        <a href=\"{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}\" target=\"_blank\">\r\n                                                        Voir les commandes de {{user_data:display_name}}\r\n                                                        </a>\r\n                                                        <br />\r\n                                                        RDV pris le {{ helper:date format=\"%d %b %Y à %H:%M:%S\" timestamp=appointment_data:appointment_date }}\r\n                                                        </p>\r\n                                                        <p>\r\n                                                        User ID: {{ appointment_data:user_id }}<br />\r\n                                                        IP Address: {{ sender_ip }}<br />\r\n                                                        Operating System: {{ sender_os }}<br />\r\n                                                        User Agent: {{ sender_agent }}\r\n                                                        </p>', 'fr', '0', 'appointments');
INSERT INTO `default_email_templates` VALUES ('38', 'appointments-deleted-admin', 'Appointments deleted admin', 'Email envoyé à l\'admin après annulation d\'un RDV', '{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Annulation de {{user_data:display_name}} ', '<h2>Le RDV de {{user_data:display_name}} | {{appointment_data:email}} a été annulé!</h2>\r\n                                                    <h3>Date de RDV: {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} </h3> \r\n                                                    <p> \r\n                                                    N° RDV: {{appointment_id}} - {{ admin_url }}<br />\r\n                                                    <a href=\"{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}\" target=\"_blank\">\r\n                                                    Voir les RDV du {{appointment_data:appointment_date}}\r\n                                                    </a>\r\n                                                    <br />\r\n                                                    <a href=\"{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}\" target=\"_blank\">\r\n                                                    Voir les RDV {{user_data:display_name}}\r\n                                                    </a>\r\n                                                    <br />\r\n                                                    RDV pris le {{ helper:date format=\"%d %b %Y à %H:%M:%S\" timestamp={appointment_data:appointment_date} }}\r\n                                                    </p> \r\n                                                    <p> \r\n                                                    User ID: {{ appointment_data:user_id }}<br />\r\n                                                    IP Address: {{ sender_ip }}<br />\r\n                                                    Operating System: {{ sender_os }}<br />\r\n                                                    User Agent: {{ sender_agent }}<br />\r\n                                                    </p> ', 'fr', '0', 'appointments');
INSERT INTO `default_email_templates` VALUES ('37', 'appointments-modified-admin', 'Appointments modified admin ', 'Email envoyé à l\'admin après modification d\'un RDV', '{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} - Modification par {{user_data:display_name}}', '<h2>Le RDV de {{user_data:display_name}}</h2>\r\n                                                        <h3>Date du RDV: {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}  </h3> \r\n                                                        <p>\r\n                                                        Adresse:<br /> \r\n                                                        {{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}<br />\r\n                                                        <a href=\"https://maps.google.fr/maps/search/{{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}\" target=\"_blank\">Voir sur Google</a><br />\r\n                                                        Contact :<br />\r\n                                                        <a href=\"tel:{{appointment_data:phone}}\">{{appointment_data:phone}} </a> - <a href=\"tel:{{appointment_data:mobile}}\">{{appointment_data:mobile}} </a> - <a href=\"mailto:{{appointment_data:email}}\">{{appointment_data:email}} </a><br />\r\n                                                        </p>  \r\n                                                        <p>\r\n                                                        Message du client<br />\r\n                                                        {{appointment_data:message}}\r\n                                                        </p> \r\n                                                        <p>\r\n                                                        User ID: {{ appointment_data:user_id }}<br />\r\n                                                        IP Address: {{ sender_ip }}<br />\r\n                                                        Operating System: {{ sender_os }}<br />\r\n                                                        User Agent: {{ sender_agent }}<br />\r\n                                                        </p>\r\n                                            ', 'fr', '0', 'appointments');
INSERT INTO `default_email_templates` VALUES ('36', 'appointments-patient', 'Appointment mail for patient', 'Email au patient suite à une prise de RDV par le patient', 'Votre RDV du {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}', '<p>Bonjour {{user_data:display_name}}\r\n                                                    <br/>\r\n                                                    Vous avez effectué une prise de RDV pour le {{ helper:date format=\"%A %e %b %Y à %R\" timestamp=appointment_data:appointment_date }}\r\n                                                    </p>\r\n\r\n                                                    <h2>Date du RDV{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }}</h2>\r\n                                                    <h3>Heure du RDV {{ appointment_data:appointment_time }}</h3>\r\n  \r\n                                                    <p>\r\n                                                    <a href=\"{{url:site}}appointments/view/{{appointment_id}}\" target=\"_blank\">Vous pouvez voir votre RDV içi</a><br />\r\n                                                    <br />\r\n                                                    Merci pour votre confiance.\r\n                                                    </p>\r\n                                                    <p> \r\n                                                    User ID: {{ appointment_data:user_id }}<br />\r\n                                                    IP Address: {{ sender_ip }}<br />\r\n                                                    Operating System: {{ sender_os }}<br />\r\n                                                    User Agent: {{ sender_agent }}\r\n                                            ', 'fr', '0', 'appointments');

-- ----------------------------
-- Table structure for `default_files`
-- ----------------------------
DROP TABLE IF EXISTS `default_files`;
CREATE TABLE `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_files
-- ----------------------------
INSERT INTO `default_files` VALUES ('', '1', '1', 'i', 'dentiste.jpg', '1717f2a8194f53253de0df0c7f5f998c.jpg', '{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '3', '', '0', '1520626187', '0');
INSERT INTO `default_files` VALUES ('a4278245d864a56', '1', '1', 'i', 'coeur.jpg', 'f40501b53bd7d3e0f62c5086ea1ecc2b.jpg', '{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '7', '', '0', '1520626187', '0');
INSERT INTO `default_files` VALUES ('c8e8886f9e65488', '1', '1', 'i', 'medecin.jpg', 'e6ef08347e274fc655f20c172baad122.jpg', '{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '5', '', '0', '1520626196', '0');
INSERT INTO `default_files` VALUES ('353de3d9e958976', '1', '1', 'i', 'etablissement.jpg', '056d27356ff595697ce2352501d71633.jpg', '{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '6', '', '0', '1520626199', '0');
INSERT INTO `default_files` VALUES ('25e01b2784711d9', '1', '1', 'i', 'orl.jpg', '29edb0b1c84e0ed4df17c82fe658d9d5.jpg', '{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '6', '', '0', '1520626199', '0');
INSERT INTO `default_files` VALUES ('292281c45a9207c', '1', '1', 'i', 'ophtalmo.jpg', 'da81bbdd7f739e786f674638e29ba433.jpg', '{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '4', '', '0', '1520626200', '0');
INSERT INTO `default_files` VALUES ('82ed2c7f7efb8a4', '1', '1', 'i', 'radio.jpg', 'c9c12e653b087854ac27bf50eac5a6cc.jpg', '{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '4', '', '0', '1520630061', '0');
INSERT INTO `default_files` VALUES ('3590b30f5b17f8c', '1', '1', 'i', 'femme.jpg', '41f6ec9ed1a988081b7e137dee039c0d.jpg', '{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '6', '', '0', '1520626203', '0');
INSERT INTO `default_files` VALUES ('997cd2e64fac717', '1', '1', 'i', 'stehoscope.jpg', '2591b872c7ed8b2b916540d36a2593a6.jpg', '{{ url:site }}files/large/2591b872c7ed8b2b916540d36a2593a6.jpg', '', '.jpg', 'image/jpeg', '', '160', '160', '4', '', '0', '1520626203', '0');
INSERT INTO `default_files` VALUES ('472d0eb6f160961', '2', '1', 'i', 'logo.jpg', '4434f1beca9ca4e34c7329262a6e18dc.jpg', '{{ url:site }}files/large/4434f1beca9ca4e34c7329262a6e18dc.jpg', '', '.jpg', 'image/jpeg', '', '489', '128', '13', '', '0', '1520636552', '0');
INSERT INTO `default_files` VALUES ('fea67cd85d808e4', '2', '1', 'i', 'logo.png', '2421d2e2031e3b446512f6e8bb6c56d0.png', '{{ url:site }}files/large/2421d2e2031e3b446512f6e8bb6c56d0.png', '', '.png', 'image/png', '', '489', '128', '28', '', '0', '1520636552', '0');
INSERT INTO `default_files` VALUES ('699df7530ec4c93', '33', '1', 'i', 'lion-king-wallpaper.jpg', '4105971510792d9b4b76ce47fb3eb5e4.jpg', '{{ url:site }}files/large/4105971510792d9b4b76ce47fb3eb5e4.jpg', '', '.jpg', 'image/jpeg', '', '1024', '768', '136', '', '0', '1521461554', '0');
INSERT INTO `default_files` VALUES ('59789c0711582b8', '30', '1', 'i', 'contact-placeholder.jpg', '8b37a2a2cbf9537714125a8f8476e63a.jpg', '{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg', '', '.jpg', 'image/jpeg', '', '263', '261', '4', '', '0', '1521127341', '0');

-- ----------------------------
-- Table structure for `default_file_folders`
-- ----------------------------
DROP TABLE IF EXISTS `default_file_folders`;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_file_folders
-- ----------------------------
INSERT INTO `default_file_folders` VALUES ('1', '0', 'icones', 'icones', 'local', '', '1520626147', '1520626147', '0');
INSERT INTO `default_file_folders` VALUES ('2', '0', 'logos', 'logos', 'local', '', '1520636515', '1520636515', '0');
INSERT INTO `default_file_folders` VALUES ('33', '0', 'doctors-module', 'Doctors module', 'local', '', '1521461442', '1521461442', '0');
INSERT INTO `default_file_folders` VALUES ('30', '0', 'divers', 'Divers', 'local', '', '1521127321', '1521127321', '0');

-- ----------------------------
-- Table structure for `default_groups`
-- ----------------------------
DROP TABLE IF EXISTS `default_groups`;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_groups
-- ----------------------------
INSERT INTO `default_groups` VALUES ('1', 'admin', 'Administrator');
INSERT INTO `default_groups` VALUES ('2', 'user', 'User');
INSERT INTO `default_groups` VALUES ('3', 'staff-medical', 'Staff médical');
INSERT INTO `default_groups` VALUES ('4', 'support-technique', 'Support technique');
INSERT INTO `default_groups` VALUES ('5', 'practicien', 'Practicien');
INSERT INTO `default_groups` VALUES ('6', 'devops', 'Devops');

-- ----------------------------
-- Table structure for `default_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `default_keywords`;
CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for `default_keywords_applied`
-- ----------------------------
DROP TABLE IF EXISTS `default_keywords_applied`;
CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_keywords_applied
-- ----------------------------

-- ----------------------------
-- Table structure for `default_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `default_migrations`;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_migrations
-- ----------------------------
INSERT INTO `default_migrations` VALUES ('129');

-- ----------------------------
-- Table structure for `default_modules`
-- ----------------------------
DROP TABLE IF EXISTS `default_modules`;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_modules
-- ----------------------------
INSERT INTO `default_modules` VALUES ('1', 'a:25:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fa\";s:14:\"تنظیمات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"tw\";s:12:\"網站設定\";s:2:\"cn\";s:12:\"网站设定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}', 'settings', '1.0.0', null, 'a:25:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fa\";s:105:\"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:118:\"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"tw\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"cn\";s:99:\"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}', '1', '0', '1', 'settings', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('2', 'a:11:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";s:2:\"tw\";s:14:\"Streams 核心\";s:2:\"cn\";s:14:\"Streams 核心\";s:2:\"ar\";s:31:\"الجداول الأساسية\";s:2:\"it\";s:12:\"Streams Core\";s:2:\"fa\";s:26:\"هسته استریم ها\";s:2:\"fi\";s:13:\"Striimit ydin\";}', 'streams_core', '1.0.0', null, 'a:11:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";s:2:\"tw\";s:29:\"Streams 核心資料模組。\";s:2:\"cn\";s:29:\"Streams 核心资料模组。\";s:2:\"ar\";s:57:\"وحدة البيانات الأساسية للجداول\";s:2:\"it\";s:17:\"Core dello Stream\";s:2:\"fa\";s:48:\"ماژول مرکزی برای استریم ها\";s:2:\"fi\";s:48:\"Ydin datan hallinoiva moduuli striimejä varten.\";}', '1', '0', '0', '0', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('3', 'a:21:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fa\";s:26:\"قالب های ایمیل\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"tw\";s:12:\"郵件範本\";s:2:\"cn\";s:12:\"邮件范本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}', 'templates', '1.1.1', null, 'a:21:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fa\";s:92:\"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"tw\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"cn\";s:61:\"新增、编辑与储存可显示动态资料的 email 范本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}', '1', '0', '1', 'structure', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('4', 'a:25:{s:2:\"en\";s:7:\"Add-ons\";s:2:\"ar\";s:16:\"الإضافات\";s:2:\"br\";s:12:\"Complementos\";s:2:\"pt\";s:12:\"Complementos\";s:2:\"cs\";s:8:\"Doplňky\";s:2:\"da\";s:7:\"Add-ons\";s:2:\"de\";s:13:\"Erweiterungen\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:9:\"Agregados\";s:2:\"fa\";s:17:\"افزونه ها\";s:2:\"fi\";s:9:\"Lisäosat\";s:2:\"fr\";s:10:\"Extensions\";s:2:\"he\";s:12:\"תוספות\";s:2:\"id\";s:7:\"Pengaya\";s:2:\"it\";s:7:\"Add-ons\";s:2:\"lt\";s:7:\"Priedai\";s:2:\"nl\";s:7:\"Add-ons\";s:2:\"pl\";s:12:\"Rozszerzenia\";s:2:\"ru\";s:20:\"Дополнения\";s:2:\"sl\";s:11:\"Razširitve\";s:2:\"tw\";s:12:\"附加模組\";s:2:\"cn\";s:12:\"附加模组\";s:2:\"hu\";s:14:\"Bővítmények\";s:2:\"th\";s:27:\"ส่วนเสริม\";s:2:\"se\";s:8:\"Tillägg\";}', 'addons', '2.0.0', null, 'a:25:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fa\";s:93:\"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"tw\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"cn\";s:54:\"管理员可以检视目前已经安装模组的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}', '0', '0', '1', '0', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('5', 'a:17:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}', 'blog', '2.0.0', null, 'a:25:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}', '1', '1', '1', 'content', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('6', 'a:25:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"fa\";s:10:\"نظرات\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"tw\";s:6:\"回應\";s:2:\"cn\";s:6:\"回应\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}', 'comments', '1.1.0', null, 'a:25:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fa\";s:168:\"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"tw\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"cn\";s:75:\"用户和访客可以针对新闻、页面与照片等内容发表回应。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}', '0', '0', '1', 'content', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('7', 'a:25:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fa\";s:18:\"تماس با ما\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"tw\";s:12:\"聯絡我們\";s:2:\"cn\";s:12:\"联络我们\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}', 'contact', '1.0.0', null, 'a:25:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"fa\";s:239:\"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"tw\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"cn\";s:147:\"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}', '0', '0', '0', '0', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('8', 'a:24:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fa\";s:13:\"فایل ها\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"tw\";s:6:\"檔案\";s:2:\"cn\";s:6:\"档案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}', 'files', '2.0.0', null, 'a:24:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fa\";s:79:\"مدیریت فایل های چند رسانه ای و فولدر ها سایت\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"tw\";s:33:\"管理網站中的檔案與目錄\";s:2:\"cn\";s:33:\"管理网站中的档案与目录\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}', '0', '0', '1', 'content', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('9', 'a:24:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fa\";s:13:\"گروه ها\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"tw\";s:6:\"群組\";s:2:\"cn\";s:6:\"群组\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}', 'groups', '1.0.0', null, 'a:24:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fa\";s:149:\"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"tw\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"cn\";s:45:\"用户可以依群组分类并管理其权限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}', '0', '0', '1', 'users', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('10', 'a:17:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fa\";s:21:\"کلمات کلیدی\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"tw\";s:6:\"鍵詞\";s:2:\"cn\";s:6:\"键词\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}', 'keywords', '1.1.0', null, 'a:17:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fa\";s:110:\"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"tw\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"cn\";s:64:\"集中管理可用于标题与内容的键词(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}', '0', '0', '1', 'data', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('11', 'a:15:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fa\";s:15:\"نگه داری\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"it\";s:12:\"Manutenzione\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"tw\";s:6:\"維護\";s:2:\"cn\";s:6:\"维护\";}', 'maintenance', '1.0.0', null, 'a:15:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"it\";s:65:\"Gestisci la cache del sito e esporta le informazioni dal database\";s:2:\"fa\";s:73:\"مدیریت کش سایت و صدور اطلاعات از دیتابیس\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"tw\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"cn\";s:45:\"经由管理介面手动删除暂存资料。\";}', '0', '0', '1', 'data', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('12', 'a:25:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fa\";s:11:\"منو ها\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"tw\";s:12:\"導航選單\";s:2:\"cn\";s:12:\"导航选单\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}', 'navigation', '1.1.0', null, 'a:25:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fa\";s:68:\"مدیریت منو ها و گروه های مربوط به آنها\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"tw\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"cn\";s:72:\"管理导航选单中的连结，以及它们所隶属的导航群组。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";}', '0', '0', '1', 'structure', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('13', 'a:25:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fa\";s:14:\"صفحه ها \";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"tw\";s:6:\"頁面\";s:2:\"cn\";s:6:\"页面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}', 'pages', '2.2.0', null, 'a:25:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fa\";s:96:\"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"tw\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"cn\";s:39:\"为您的网站新增自定的页面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}', '1', '1', '1', 'content', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('14', 'a:25:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fa\";s:15:\"اجازه ها\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"tw\";s:6:\"權限\";s:2:\"cn\";s:6:\"权限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}', 'permissions', '1.0.0', null, 'a:25:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fa\";s:59:\"مدیریت اجازه های گروه های کاربری\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"tw\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"cn\";s:81:\"用来控制不同类别的用户，设定其浏览特定网站内容的权限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}', '0', '0', '1', 'users', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('15', 'a:24:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fa\";s:17:\"انتقال ها\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"tw\";s:6:\"轉址\";s:2:\"cn\";s:6:\"转址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"pl\";s:14:\"Przekierowania\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}', 'redirects', '1.0.0', null, 'a:24:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fa\";s:63:\"انتقال دادن یک صفحه به یک آدرس دیگر\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"tw\";s:33:\"將網址轉址、重新定向。\";s:2:\"cn\";s:33:\"将网址转址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"pl\";s:44:\"Przekierowanie z jednego adresu URL na inny.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}', '0', '0', '1', 'structure', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('16', 'a:10:{s:2:\"en\";s:6:\"Search\";s:2:\"br\";s:7:\"Procura\";s:2:\"fr\";s:9:\"Recherche\";s:2:\"se\";s:4:\"Sök\";s:2:\"ar\";s:10:\"البحث\";s:2:\"tw\";s:6:\"搜尋\";s:2:\"cn\";s:6:\"搜寻\";s:2:\"it\";s:7:\"Ricerca\";s:2:\"fa\";s:10:\"جستجو\";s:2:\"fi\";s:4:\"Etsi\";}', 'search', '1.0.0', null, 'a:10:{s:2:\"en\";s:72:\"Search through various types of content with this modular search system.\";s:2:\"br\";s:73:\"Procure por vários tipos de conteúdo com este sistema de busca modular.\";s:2:\"fr\";s:84:\"Rechercher parmi différents types de contenus avec système de recherche modulaire.\";s:2:\"se\";s:36:\"Sök igenom olika typer av innehåll\";s:2:\"ar\";s:102:\"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.\";s:2:\"tw\";s:63:\"此模組可用以搜尋網站中不同類型的資料內容。\";s:2:\"cn\";s:63:\"此模组可用以搜寻网站中不同类型的资料内容。\";s:2:\"it\";s:71:\"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare\";s:2:\"fa\";s:115:\"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.\";s:2:\"fi\";s:76:\"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.\";}', '0', '0', '0', '0', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('17', 'a:20:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fa\";s:17:\"نقشه سایت\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"tw\";s:12:\"網站地圖\";s:2:\"cn\";s:12:\"网站地图\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}', 'sitemap', '1.3.0', null, 'a:21:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fa\";s:150:\"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"tw\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"cn\";s:84:\"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}', '0', '1', '0', 'content', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('18', 'a:25:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fa\";s:14:\"کاربران\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"tw\";s:6:\"用戶\";s:2:\"cn\";s:6:\"用户\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}', 'users', '1.1.0', null, 'a:25:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fa\";s:151:\"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"tw\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"cn\";s:87:\"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}', '0', '0', '1', '0', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('19', 'a:25:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fa\";s:16:\"متغییرها\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"tw\";s:12:\"系統變數\";s:2:\"cn\";s:12:\"系统变数\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";s:2:\"hu\";s:10:\"Változók\";}', 'variables', '1.0.0', null, 'a:25:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fa\";s:136:\"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:92:\"Gérer des variables globales pour pouvoir y accéder depuis n\'importe quel endroit du site.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"tw\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"cn\";s:45:\"管理此网站内可存取的全局变数。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}', '0', '0', '1', 'data', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('20', 'a:23:{s:2:\"en\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"da\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fa\";s:13:\"ویجت ها\";s:2:\"fi\";s:9:\"Vimpaimet\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"tw\";s:9:\"小組件\";s:2:\"cn\";s:9:\"小组件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";s:2:\"ar\";s:14:\"الودجتس\";}', 'widgets', '1.2.0', null, 'a:23:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:132:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"ودجتس\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fa\";s:76:\"مدیریت قسمت های کوچکی از سایت به طور مستقل\";s:2:\"fi\";s:81:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Vimpaimia\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"tw\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"cn\";s:103:\"可将小段的程式码透过小组件来管理。即所谓 \"Widgets\"，或称为小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}', '1', '0', '1', 'content', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('21', 'a:10:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"br\";s:7:\"WYSIWYG\";s:2:\"fa\";s:7:\"WYSIWYG\";s:2:\"fr\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";s:2:\"tw\";s:7:\"WYSIWYG\";s:2:\"cn\";s:7:\"WYSIWYG\";s:2:\"ar\";s:27:\"المحرر الرسومي\";s:2:\"it\";s:7:\"WYSIWYG\";}', 'wysiwyg', '1.0.0', null, 'a:11:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"br\";s:64:\"Provém o editor WYSIWYG para o PyroCMS fornecido pelo CKEditor.\";s:2:\"fa\";s:73:\"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. \";s:2:\"fr\";s:63:\"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";s:2:\"tw\";s:83:\"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。\";s:2:\"cn\";s:83:\"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。\";s:2:\"ar\";s:76:\"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.\";s:2:\"it\";s:57:\"Fornisce l\'editor WYSIWYG per PtroCMS creato con CKEditor\";}', '0', '0', '0', '0', '1', '1', '1', '1520614946');
INSERT INTO `default_modules` VALUES ('69', 'a:2:{s:2:\"en\";s:7:\"Doctors\";s:2:\"fr\";s:8:\"Docteurs\";}', 'doctor', '0.1.10', null, 'a:2:{s:2:\"en\";s:12:\"Doctors list\";s:2:\"fr\";s:18:\"Liste des Docteurs\";}', '0', '1', '1', 'content', '1', '1', '0', '1521461438');
INSERT INTO `default_modules` VALUES ('24', 'a:2:{s:2:\"en\";s:20:\"Calendars(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'calendars', '0.1.0', null, 'a:2:{s:2:\"en\";s:16:\"Calendars module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', '0', '1', '1', 'content', '1', '1', '0', '1520995285');
INSERT INTO `default_modules` VALUES ('25', 'a:2:{s:2:\"en\";s:17:\"Orders(Commandes)\";s:2:\"fr\";s:9:\"Commandes\";}', 'orders', '0.73.08', null, 'a:2:{s:2:\"en\";s:13:\"Orders module\";s:2:\"fr\";s:19:\"Module de commandes\";}', '0', '1', '1', 'content', '0', '0', '0', '1520994630');
INSERT INTO `default_modules` VALUES ('34', 'a:1:{s:2:\"en\";s:12:\"Token module\";}', 'token', '0.01.31', null, 'a:1:{s:2:\"en\";s:16:\"Token management\";}', '0', '1', '1', 'content', '1', '1', '0', '1521027064');
INSERT INTO `default_modules` VALUES ('75', 'a:2:{s:2:\"en\";s:23:\"Appointments(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'appointments', '0.1.10', null, 'a:2:{s:2:\"en\";s:19:\"Appointments module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', '0', '1', '1', 'content', '1', '1', '0', '1521508457');
INSERT INTO `default_modules` VALUES ('53', 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'carte', '0.98', null, 'a:1:{s:2:\"fr\";s:28:\"Module de calendrier semaine\";}', '0', '1', '1', 'content', '0', '0', '0', '1521079824');
INSERT INTO `default_modules` VALUES ('70', 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'calendar', '0.1.01', null, 'a:1:{s:2:\"fr\";s:18:\"Calendrier semaine\";}', '0', '1', '1', 'content', '1', '1', '0', '1521468454');
INSERT INTO `default_modules` VALUES ('35', 'a:2:{s:2:\"en\";s:8:\"Products\";s:2:\"fr\";s:8:\"Produits\";}', 'products', '0.61.01', null, 'a:2:{s:2:\"en\";s:16:\"Products module.\";s:2:\"fr\";s:8:\"Produits\";}', '0', '1', '1', 'content', '0', '0', '0', '1521027755');
INSERT INTO `default_modules` VALUES ('59', 'a:2:{s:2:\"en\";s:6:\"Relays\";s:2:\"fr\";s:13:\"Points Relais\";}', 'relay', '1.0.5', null, 'a:2:{s:2:\"en\";s:11:\"Relays list\";s:2:\"fr\";s:23:\"Liste des Points Relais\";}', '0', '1', '1', 'content', '0', '0', '0', '1521196881');

-- ----------------------------
-- Table structure for `default_navigation_groups`
-- ----------------------------
DROP TABLE IF EXISTS `default_navigation_groups`;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_navigation_groups
-- ----------------------------
INSERT INTO `default_navigation_groups` VALUES ('1', 'Header', 'header');
INSERT INTO `default_navigation_groups` VALUES ('2', 'Sidebar', 'sidebar');
INSERT INTO `default_navigation_groups` VALUES ('3', 'Footer', 'footer');
INSERT INTO `default_navigation_groups` VALUES ('4', 'z_unused', 'z_unused');
INSERT INTO `default_navigation_groups` VALUES ('5', 'Header Guest', 'header-guest');
INSERT INTO `default_navigation_groups` VALUES ('6', 'Dev', 'dev');

-- ----------------------------
-- Table structure for `default_navigation_links`
-- ----------------------------
DROP TABLE IF EXISTS `default_navigation_links`;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_navigation_links
-- ----------------------------
INSERT INTO `default_navigation_links` VALUES ('1', 'Home', '0', 'page', '1', '', '', '', '4', '1', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('2', 'Blog', '0', 'module', '0', 'blog', '', '', '4', '2', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('3', 'Contact', '0', 'page', '2', '', '', '', '3', '1', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('10', 'Connexion', null, 'uri', '0', '', '', 'users/login', '5', '1', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('6', 'Réservation', '0', 'page', '8', '', '', '', '4', '6', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('7', 'Livre d\'Or', '0', 'page', '9', '', '', '', '4', '7', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('8', 'Accès', '0', 'page', '10', '', '', '', '4', '8', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('9', 'Horaires', '0', 'page', '11', '', '', '', '4', '9', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('11', 'Docteurs', '0', 'module', '0', 'doctor', '', '', '4', '1', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('12', 'Bootstrap', '0', 'page', '13', '', '', '', '6', '0', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('13', 'Dentistes', '0', 'uri', '0', '', '', 'doctor?c=dentiste', '3', '3', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('14', 'Médecins généralistes', '0', 'uri', '0', '', '', 'doctor?c=Médecins généralistes', '3', '2', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('15', 'Ophtalmologie', null, 'uri', '0', '', '', 'doctor?c=Ophtalmologue', '3', '4', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('16', 'Spécialistes ORL', null, 'uri', '0', '', '', 'doctor?c=ORL', '3', '5', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('17', 'Cardiologue', null, 'uri', '0', '', '', 'doctor?c=Cardiologue', '3', '6', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('18', 'Spécialistes femme', null, 'uri', '0', '', '', 'doctor?c=Spécialistes femme', '3', '7', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('19', 'Radiologue', null, 'uri', '0', '', '', 'doctor?c=Radiologue', '3', '8', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('20', 'Autres médecins', null, 'uri', '0', '', '', 'doctor?c=Autres médecins', '3', '9', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('21', ' Etablissements de santé', null, 'uri', '0', '', '', 'doctor?c= Etablissements de santé', '3', '10', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('23', 'test plugin show doctor', '0', 'page', '16', '', '', '', '6', '4', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('24', 'test plugin list doctors', '0', 'page', '15', '', '', '', '6', '6', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('25', 'Rendez Vous', '0', 'page', '17', '', '', '', '6', '2', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('26', 'Mes RDV à venir', '0', 'page', '18', '', '', '', '6', '3', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('27', 'RDV à venir de mes proches', '0', 'page', '19', '', '', '', '6', '5', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('28', 'Mes RDV passés', '0', 'page', '20', '', '', '', '6', '7', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('29', 'RDV passés de mes proches', '0', 'page', '21', '', '', '', '6', '8', '', '0', '');
INSERT INTO `default_navigation_links` VALUES ('30', 'Calendrier', '0', 'module', '0', 'calendar', '', '', '6', '1', '', '0', '');

-- ----------------------------
-- Table structure for `default_orders_details`
-- ----------------------------
DROP TABLE IF EXISTS `default_orders_details`;
CREATE TABLE `default_orders_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `line_price` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `tax` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `final_price` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `origin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_filename` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime DEFAULT '1970-01-01 00:00:01',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_orders_details
-- ----------------------------

-- ----------------------------
-- Table structure for `default_orders_list`
-- ----------------------------
DROP TABLE IF EXISTS `default_orders_list`;
CREATE TABLE `default_orders_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `order_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `total_pretax` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `total_final` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `discount` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `order_date` datetime DEFAULT '1970-01-01 00:00:01',
  `delivery_date` date DEFAULT '1970-01-01',
  `delivery_time` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `log` text COLLATE utf8_unicode_ci,
  `i_company` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_fullname` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_firstname` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_civility` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_mail` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_street1` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_street2` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_town` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_region` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `i_country` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_company` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_fullname` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_firstname` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_civility` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_mail` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_street1` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_street2` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_town` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_region` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `d_country` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:01',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_orders_list
-- ----------------------------

-- ----------------------------
-- Table structure for `default_pages`
-- ----------------------------
DROP TABLE IF EXISTS `default_pages`;
CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_pages
-- ----------------------------
INSERT INTO `default_pages` VALUES ('1', 'home', '', 'Accueil', 'old_site-spa-thai/home', '12', '1', '1', '.ico-grp {\r\n    margin: auto;\r\n    width: 500px;\r\n}\r\n.specialite {\r\n    display: inline-block;\r\n    text-align: center;\r\n    margin: 10px;\r\n    width: 140px;\r\n    height: 100px;\r\n}', '', '', '', '0', '0', '', '0', '0', 'live', '1495107568', '1520640869', '0', '0', '1', '0');
INSERT INTO `default_pages` VALUES ('2', 'contact', '', 'Contact', 'contact', '0', '1', '2', '', '', '', '', '0', '0', '', '0', '0', 'live', '1495107568', '1495106656', '0', '0', '1', '1');
INSERT INTO `default_pages` VALUES ('3', 'search', '', 'Search', 'search', '0', '1', '3', null, null, null, '', null, null, null, '0', '0', 'live', '1495107568', '0', '', '0', '1', '2');
INSERT INTO `default_pages` VALUES ('4', 'results', '', 'Results', 'search/results', '3', '1', '4', null, null, null, '', null, null, null, '0', '0', 'live', '1495107568', '0', '', '0', '0', '0');
INSERT INTO `default_pages` VALUES ('5', '404', '', 'Page missing', '404', '0', '1', '5', null, null, null, '', null, null, null, '0', '0', 'live', '1495107568', '0', '', '0', '1', '3');
INSERT INTO `default_pages` VALUES ('12', 'old_site-spa-thai', '', 'Old_site', 'old_site-spa-thai', '0', '1', '12', '', '', '', '', '0', '0', '', '0', '0', 'draft', '1520605063', '1520641327', '0', '0', '1', '5');
INSERT INTO `default_pages` VALUES ('8', 'reservation', '', 'Réservation', 'old_site-spa-thai/reservation', '12', '1', '8', '', '', '', '', '0', '0', '', '0', '0', 'live', '1495101423', '0', '0', '0', '1', '4');
INSERT INTO `default_pages` VALUES ('9', 'livre-dor', '', 'Livre d\'Or', 'old_site-spa-thai/livre-dor', '12', '1', '9', '', '', '', '', '0', '0', '', '0', '0', 'live', '1495101451', '0', '0', '0', '1', '3');
INSERT INTO `default_pages` VALUES ('10', 'acces', '', 'Accès', 'old_site-spa-thai/acces', '12', '1', '10', '', '', '', '', '0', '0', '', '0', '0', 'live', '1495103602', '0', '0', '0', '1', '2');
INSERT INTO `default_pages` VALUES ('11', 'horaires', '', 'Horaires', 'old_site-spa-thai/horaires', '12', '1', '11', '', '', '', '', '0', '0', '', '0', '0', 'live', '1495103737', '0', '0', '0', '1', '1');
INSERT INTO `default_pages` VALUES ('13', 'bootstrap', '', 'bootstrap', 'bootstrap', '0', '1', '13', '', '', '', '', '0', '0', '', '0', '0', 'live', '1520637740', '1520640249', '0', '0', '1', '4');
INSERT INTO `default_pages` VALUES ('14', 'accueil', '', 'Accueil', 'accueil', '0', '3', '14', '.ico-grp {\r\n    margin: auto;\r\n    width: 500px;\r\n}\r\n.specialite {\r\n    display: inline-block;\r\n    text-align: center;\r\n    margin: 10px;\r\n    width: 140px;\r\n    height: 100px;\r\n}', '', '', '', '0', '0', '', '0', '0', 'live', '1520641201', '1520641293', '0', '1', '1', '0');
INSERT INTO `default_pages` VALUES ('15', 'test-plugin-list-doctors', '', 'test plugin list doctors', 'test-plugin-list-doctors', '0', '1', '15', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521475440', '1521478872', '0', '0', '1', '6');
INSERT INTO `default_pages` VALUES ('16', 'test-plugin-show-doctor', '', 'test plugin show doctor', 'test-plugin-show-doctor', '0', '1', '16', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521478197', '1521478847', '0', '0', '0', '7');
INSERT INTO `default_pages` VALUES ('17', 'rendez-vous', '', 'Rendez Vous', 'rendez-vous', '0', '1', '17', 'div.content li.active a {\r\n    color: white;\r\n}', '$( document ).ready(function() \r\n{   \r\n  \r\n  $(\'div.content ul\').addClass(\'list-group\');\r\n  $(\'div.content ul li\').addClass(\'list-group-item\');\r\n  \r\n  $(\'div.content ul li:nth-child(1)\').addClass(\'active\');\r\n});', '', '', '0', '0', '', '0', '0', 'live', '1521513385', '1521517752', '0', '0', '1', '8');
INSERT INTO `default_pages` VALUES ('18', 'mes-rdv-a-venir', '', 'Mes RDV à venir', 'rendez-vous/mes-rdv-a-venir', '17', '1', '18', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521513419', '1521519159', '0', '0', '1', '1');
INSERT INTO `default_pages` VALUES ('19', 'rdv-a-venir-de-mes-proches', '', 'RDV à venir de mes proches', 'rendez-vous/rdv-a-venir-de-mes-proches', '17', '1', '19', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521513442', '1521520830', '0', '0', '1', '2');
INSERT INTO `default_pages` VALUES ('20', 'mes-rdv-passes', '', 'Mes RDV passés', 'rendez-vous/mes-rdv-passes', '17', '1', '20', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521513485', '0', '0', '0', '1', '4');
INSERT INTO `default_pages` VALUES ('21', 'rdv-passes-de-mes-proches', '', 'RDV passés de mes proches', 'rendez-vous/rdv-passes-de-mes-proches', '17', '1', '21', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521513507', '1521519583', '0', '0', '1', '5');
INSERT INTO `default_pages` VALUES ('22', 'rdv-a-venir', '', 'RDV à venir', 'rendez-vous/rdv-a-venir', '17', '1', '22', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521516830', '1521520100', '0', '0', '1', '0');
INSERT INTO `default_pages` VALUES ('23', 'rdv-passes', '', 'RDV passés', 'rendez-vous/rdv-passes', '17', '1', '23', '', '', '', '', '0', '0', '', '0', '0', 'live', '1521516887', '1521519503', '0', '0', '1', '3');

-- ----------------------------
-- Table structure for `default_page_types`
-- ----------------------------
DROP TABLE IF EXISTS `default_page_types`;
CREATE TABLE `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_page_types
-- ----------------------------
INSERT INTO `default_page_types` VALUES ('1', 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', '2', '', null, '', '<h2>{{ page:title }}</h2> \r\n\r\n{{ pre_html }}\r\n{{ body }}\r\n{{ post_html }}', '', '', 'default.html', '1520641230', 'n', '', '');
INSERT INTO `default_page_types` VALUES ('3', 'accueil_msante', 'Accueil MSanté', 'Page d’accueil MSanté', '2', '', null, '', '{{ dev:empty_cache }}\r\n\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\" data-cat=\"Médecins généralistes\">\r\n			<img src=\"{{ url:site }}files/thumb/997cd2e64fac717/80/80\" alt=\"Généraliste\"/> \r\n			<p>Médecins généralistes</p>\r\n		</div>\r\n		<div class=\"specialite\" data-cat=\"Ophtalmologue\">\r\n			<img src=\"{{ url:site }}files/thumb/292281c45a9207c/80/80\" alt=\"Ophtalmologue\"/> \r\n			<p>Ophtalmologue</p>\r\n		</div>\r\n		<div class=\"specialite\" data-cat=\"ORL\">\r\n			<img src=\"{{ url:site }}files/thumb/25e01b2784711d9/80/80\" alt=\"ORL\"/> \r\n			<p>ORL</p>\r\n		</div>\r\n</div>\r\n		\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\" data-cat=\"Cardiologie\">\r\n			<img src=\"{{ url:site }}files/thumb/a4278245d864a56/80/80\" alt=\"Cardiologie\"/> \r\n			<p>Cardiologue</p> \r\n		</div>\r\n		<div class=\"specialite\" data-cat=\"Spécialistes femme\">\r\n			<img src=\"{{ url:site }}files/thumb/3590b30f5b17f8c/80/80\" alt=\"Spécialistes femme\"/> \r\n			<p>Spécialistes femme</p>\r\n		</div>\r\n		<div class=\"specialite\" data-cat=\"Dentiste\">\r\n			<img src=\"{{ url:site }}files/thumb/379ffc54d24dc2f/80/80\" alt=\"Dentiste\"/> \r\n			<p>Dentiste</p>\r\n		</div> \r\n</div>\r\n		\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\" data-cat=\"Radiologue\">\r\n			<img src=\"{{ url:site }}files/thumb/82ed2c7f7efb8a4/80/80\" alt=\"Radiologue\"/> \r\n			<p>Radiologue</p>\r\n		</div>\r\n		<div class=\"specialite\" data-cat=\"Autres médecins\">\r\n			<img src=\"{{ url:site }}files/thumb/c8e8886f9e65488/80/80\" alt=\"Autres médecins\"/> \r\n			<p>Autres médecins</p>\r\n		</div>\r\n		<div class=\"specialite\" data-cat=\"Etablissements de santé\">\r\n			<img src=\"{{ url:site }}files/thumb/353de3d9e958976/80/80\" alt=\"Etablissements de santé\"/> \r\n			<p>Etablissements de santé</p>\r\n		</div>\r\n</div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-size: 26px;\">Prenez rendez vous avec votre professionnel de sant&eacute;.</span></div>\r\n\r\n{{# dessous gabarit des pages normales, sauf titre H2  #}}\r\n\r\n{{ doctor:search_box }} \r\n\r\n{{ pre_html }}\r\n{{ body }}\r\n{{ post_html }}', '.ico-grp {\r\n    margin: auto;\r\n    width: 500px;\r\n}\r\n.specialite {\r\n    display: inline-block;\r\n    text-align: center;\r\n    margin: 10px;\r\n    min-width: 80px;\r\n    width: 26%;\r\n    height: 100px;\r\n    cursor: pointer;\r\n}\r\ndiv.specialite:hover {\r\nfont-weight : bold;\r\n}\r\n#doctor-search {\r\n    margin: auto;\r\n    text-align: center;\r\n    max-width: 400px;\r\n}\r\n.set {\r\n    background-color: gainsboro;\r\n    font-weight: bold;\r\n}', '{{if false }}\r\nfunction myPosition(position) {\r\n    var infopos = \"Position déterminée :\\n\";\r\n    infopos += \"Latitude : \"+position.coords.latitude +\"\\n\";\r\n    infopos += \"Longitude: \"+position.coords.longitude+\"\\n\";\r\n    infopos += \"Altitude : \"+position.coords.altitude +\"\\n\";\r\n    return infopos;\r\n}\r\n{{endif}}\r\n\r\n\r\n$( document ).ready(function() \r\n{\r\n    //add functionality to specialities\r\n    $(\'.ico-grp .specialite\').each(function() {\r\n        $( this ).on(\'click\', function _selectType(event) \r\n        {\r\n            if(typeof(event)!==\'undefined\') event.preventDefault();\r\n            var cat = $(this).attr(\"data-cat\"); \r\n            $(\'#doctor-search input[name=c]\').val(cat).addClass(\'set\');\r\n        });\r\n    });\r\n\r\n});\r\n\r\n{{ doctor:js }}', 'default.html', '1520641079', 'y', '', '');

-- ----------------------------
-- Table structure for `default_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `default_permissions`;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_permissions
-- ----------------------------
INSERT INTO `default_permissions` VALUES ('1', '3', 'doctor', '{\"edit\":\"1\",\"create\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('2', '3', 'appointments', null);
INSERT INTO `default_permissions` VALUES ('3', '4', 'blog', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('4', '4', 'comments', null);
INSERT INTO `default_permissions` VALUES ('5', '4', 'doctor', '{\"role1\":\"1\",\"role2\":\"1\",\"role3\":\"1\",\"edit\":\"1\",\"delete\":\"1\",\"create\":\"1\",\"set_location\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('6', '4', 'addons', null);
INSERT INTO `default_permissions` VALUES ('7', '4', 'files', '{\"wysiwyg\":\"1\",\"upload\":\"1\",\"download_file\":\"1\",\"edit_file\":\"1\",\"delete_file\":\"1\",\"create_folder\":\"1\",\"set_location\":\"1\",\"synchronize\":\"1\",\"edit_folder\":\"1\",\"delete_folder\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('8', '4', 'groups', null);
INSERT INTO `default_permissions` VALUES ('9', '4', 'maintenance', null);
INSERT INTO `default_permissions` VALUES ('10', '4', 'templates', null);
INSERT INTO `default_permissions` VALUES ('11', '4', 'keywords', null);
INSERT INTO `default_permissions` VALUES ('12', '4', 'navigation', null);
INSERT INTO `default_permissions` VALUES ('13', '4', 'pages', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\",\"create_types\":\"1\",\"edit_types\":\"1\",\"delete_types\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('14', '4', 'users', '{\"admin_profile_fields\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('15', '4', 'widgets', null);
INSERT INTO `default_permissions` VALUES ('16', '5', 'appointments', null);
INSERT INTO `default_permissions` VALUES ('17', '6', 'blog', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('18', '6', 'comments', null);
INSERT INTO `default_permissions` VALUES ('19', '6', 'doctor', '{\"role1\":\"1\",\"role2\":\"1\",\"role3\":\"1\",\"edit\":\"1\",\"delete\":\"1\",\"create\":\"1\",\"set_location\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('20', '6', 'addons', null);
INSERT INTO `default_permissions` VALUES ('21', '6', 'files', '{\"wysiwyg\":\"1\",\"upload\":\"1\",\"download_file\":\"1\",\"edit_file\":\"1\",\"delete_file\":\"1\",\"create_folder\":\"1\",\"set_location\":\"1\",\"synchronize\":\"1\",\"edit_folder\":\"1\",\"delete_folder\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('22', '6', 'groups', null);
INSERT INTO `default_permissions` VALUES ('23', '6', 'maintenance', null);
INSERT INTO `default_permissions` VALUES ('24', '6', 'templates', null);
INSERT INTO `default_permissions` VALUES ('25', '6', 'keywords', null);
INSERT INTO `default_permissions` VALUES ('26', '6', 'navigation', null);
INSERT INTO `default_permissions` VALUES ('27', '6', 'pages', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\",\"create_types\":\"1\",\"edit_types\":\"1\",\"delete_types\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('28', '6', 'settings', null);
INSERT INTO `default_permissions` VALUES ('29', '6', 'permissions', null);
INSERT INTO `default_permissions` VALUES ('30', '6', 'redirects', null);
INSERT INTO `default_permissions` VALUES ('31', '6', 'appointments', null);
INSERT INTO `default_permissions` VALUES ('32', '6', 'token', null);
INSERT INTO `default_permissions` VALUES ('33', '6', 'users', '{\"admin_profile_fields\":\"1\"}');
INSERT INTO `default_permissions` VALUES ('34', '6', 'variables', null);
INSERT INTO `default_permissions` VALUES ('35', '6', 'widgets', null);

-- ----------------------------
-- Table structure for `default_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `default_profiles`;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` int(11) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  `birth_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_info` longtext COLLATE utf8_unicode_ci,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbourhood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_valid` varchar(3) COLLATE utf8_unicode_ci DEFAULT 'no',
  `desk_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_profiles
-- ----------------------------
INSERT INTO `default_profiles` VALUES ('1', null, null, null, null, '1', 'Administrateur', 'Radja', 'Lomas', '303955200', null, '0678957826', '4 allée Jacques Ibert', null, '91240', '1520621218', null, 'Sourd de l\'oreille droite', 'Saint Michel sur Orge', null, null, 'h', null, 'no', null, null);
INSERT INTO `default_profiles` VALUES ('2', '2018-03-15 00:41:01', null, '1', '1', '2', 'Alfred docteur test', 'Alfred', 'Mozart', '0', '678957826', '678957826', '4 allée Jacques Ibert', '91240', '91240', null, null, null, 'Saint Michel sur Orge', null, null, 'h', null, 'no', null, null);
INSERT INTO `default_profiles` VALUES ('3', '2018-03-15 00:43:37', null, '1', '2', '3', 'Medical Staff', 'Sandra', 'Hitchcok', '0', '678957826', '678957826', '17 rue Gutenberg', null, '91070', null, 'Beyoncé', null, 'Bondoufle', null, null, 'f', null, 'no', null, null);
INSERT INTO `default_profiles` VALUES ('4', '2018-03-15 00:44:48', null, '1', '3', '4', 'Techie', 'Radja', 'Lomas', '0', '678957826', '678957826', '17 rue Gutenberg', null, '91070', null, null, null, 'Bondoufle', null, null, 'h', null, 'no', null, null);
INSERT INTO `default_profiles` VALUES ('5', '2018-03-15 01:25:15', null, '1', '4', '5', 'devops', 'devops', 'devops', '0', null, '0678957826', null, null, null, null, null, null, null, null, null, 'h', null, 'no', null, null);

-- ----------------------------
-- Table structure for `default_redirects`
-- ----------------------------
DROP TABLE IF EXISTS `default_redirects`;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_redirects
-- ----------------------------

-- ----------------------------
-- Table structure for `default_search_index`
-- ----------------------------
DROP TABLE IF EXISTS `default_search_index`;
CREATE TABLE `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_search_index
-- ----------------------------
INSERT INTO `default_search_index` VALUES ('17', 'Contact', '', null, null, 'pages', 'pages:page', 'pages:pages', '2', 'contact', 'admin/pages/edit/2', 'admin/pages/delete/2');
INSERT INTO `default_search_index` VALUES ('3', 'Search', '', null, null, 'pages', 'pages:page', 'pages:pages', '3', 'search', 'admin/pages/edit/3', 'admin/pages/delete/3');
INSERT INTO `default_search_index` VALUES ('4', 'Results', '', null, null, 'pages', 'pages:page', 'pages:pages', '4', 'search/results', 'admin/pages/edit/4', 'admin/pages/delete/4');
INSERT INTO `default_search_index` VALUES ('5', 'Page missing', '', null, null, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5');
INSERT INTO `default_search_index` VALUES ('35', 'Accueil', '', null, null, 'pages', 'pages:page', 'pages:pages', '14', 'accueil', 'admin/pages/edit/14', 'admin/pages/delete/14');
INSERT INTO `default_search_index` VALUES ('29', 'bootstrap', '', null, null, 'pages', 'pages:page', 'pages:pages', '13', 'bootstrap', 'admin/pages/edit/13', 'admin/pages/delete/13');
INSERT INTO `default_search_index` VALUES ('8', 'Réservation', '', null, null, 'pages', 'pages:page', 'pages:pages', '8', 'reservation', 'admin/pages/edit/8', 'admin/pages/delete/8');
INSERT INTO `default_search_index` VALUES ('9', 'Livre d\'Or', '', null, null, 'pages', 'pages:page', 'pages:pages', '9', 'livre-dor', 'admin/pages/edit/9', 'admin/pages/delete/9');
INSERT INTO `default_search_index` VALUES ('33', 'Accueil', '', null, null, 'pages', 'pages:page', 'pages:pages', '1', 'home', 'admin/pages/edit/1', 'admin/pages/delete/1');
INSERT INTO `default_search_index` VALUES ('14', 'Accès', '', null, null, 'pages', 'pages:page', 'pages:pages', '10', 'acces', 'admin/pages/edit/10', 'admin/pages/delete/10');
INSERT INTO `default_search_index` VALUES ('15', 'Horaires', '', null, null, 'pages', 'pages:page', 'pages:pages', '11', 'horaires', 'admin/pages/edit/11', 'admin/pages/delete/11');
INSERT INTO `default_search_index` VALUES ('55', 'test plugin list doctors', '', null, null, 'pages', 'pages:page', 'pages:pages', '15', 'test-plugin-list-doctors', 'admin/pages/edit/15', 'admin/pages/delete/15');
INSERT INTO `default_search_index` VALUES ('54', 'test plugin show doctor', '', null, null, 'pages', 'pages:page', 'pages:pages', '16', 'test-plugin-show-doctor', 'admin/pages/edit/16', 'admin/pages/delete/16');
INSERT INTO `default_search_index` VALUES ('76', 'Rendez Vous', '', null, null, 'pages', 'pages:page', 'pages:pages', '17', 'rendez-vous', 'admin/pages/edit/17', 'admin/pages/delete/17');
INSERT INTO `default_search_index` VALUES ('84', 'Mes RDV à venir', '', null, null, 'pages', 'pages:page', 'pages:pages', '18', 'rendez-vous/mes-rdv-a-venir', 'admin/pages/edit/18', 'admin/pages/delete/18');
INSERT INTO `default_search_index` VALUES ('93', 'RDV à venir de mes proches', '', null, null, 'pages', 'pages:page', 'pages:pages', '19', 'rendez-vous/rdv-a-venir-de-mes-proches', 'admin/pages/edit/19', 'admin/pages/delete/19');
INSERT INTO `default_search_index` VALUES ('59', 'Mes RDV passés', '', null, null, 'pages', 'pages:page', 'pages:pages', '20', 'rendez-vous/mes-rdv-passes', 'admin/pages/edit/20', 'admin/pages/delete/20');
INSERT INTO `default_search_index` VALUES ('88', 'RDV passés de mes proches', '', null, null, 'pages', 'pages:page', 'pages:pages', '21', 'rendez-vous/rdv-passes-de-mes-proches', 'admin/pages/edit/21', 'admin/pages/delete/21');
INSERT INTO `default_search_index` VALUES ('91', 'RDV à venir', '', null, null, 'pages', 'pages:page', 'pages:pages', '22', 'rendez-vous/rdv-a-venir', 'admin/pages/edit/22', 'admin/pages/delete/22');
INSERT INTO `default_search_index` VALUES ('87', 'RDV passés', '', null, null, 'pages', 'pages:page', 'pages:pages', '23', 'rendez-vous/rdv-passes', 'admin/pages/edit/23', 'admin/pages/delete/23');

-- ----------------------------
-- Table structure for `default_settings`
-- ----------------------------
DROP TABLE IF EXISTS `default_settings`;
CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_settings
-- ----------------------------
INSERT INTO `default_settings` VALUES ('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'MSante', '', '1', '1', '', '1000');
INSERT INTO `default_settings` VALUES ('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Annuaire des médecins', '', '0', '1', '', '999');
INSERT INTO `default_settings` VALUES ('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Annuaire des médecins et spécialiste de santé, prenez rendez vous en ligne.', '', '0', '1', '', '998');
INSERT INTO `default_settings` VALUES ('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'fr', 'func:get_supported_lang', '1', '1', '', '997');
INSERT INTO `default_settings` VALUES ('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'fr', 'func:get_supported_lang', '1', '1', '', '996');
INSERT INTO `default_settings` VALUES ('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', '1', '1', '', '995');
INSERT INTO `default_settings` VALUES ('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', '1', '1', '', '994');
INSERT INTO `default_settings` VALUES ('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', '1', '1', '', '992');
INSERT INTO `default_settings` VALUES ('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', '1', '1', '', '991');
INSERT INTO `default_settings` VALUES ('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', '0', '1', '', '990');
INSERT INTO `default_settings` VALUES ('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', '1', '1', '', '989');
INSERT INTO `default_settings` VALUES ('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', '1', '1', '', '988');
INSERT INTO `default_settings` VALUES ('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', 'Ce site est actuellement hors-ligne.\r\nMerci de revenir plus tard.', '', '0', '1', '', '987');
INSERT INTO `default_settings` VALUES ('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', '0', '1', 'integration', '985');
INSERT INTO `default_settings` VALUES ('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', '0', '1', 'integration', '984');
INSERT INTO `default_settings` VALUES ('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', '0', '1', 'integration', '983');
INSERT INTO `default_settings` VALUES ('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href=\"https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US\" target=\"_blank\">Authorized Access to your Google Account</a>', 'password', '', '', '', '0', '1', 'integration', '982');
INSERT INTO `default_settings` VALUES ('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'radjal@free.fr', '', '', '1', '1', 'email', '979');
INSERT INTO `default_settings` VALUES ('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', '1', '1', 'email', '978');
INSERT INTO `default_settings` VALUES ('mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', '1', '1', 'email', '977');
INSERT INTO `default_settings` VALUES ('mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', '0', '1', 'email', '976');
INSERT INTO `default_settings` VALUES ('mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', '0', '1', 'email', '975');
INSERT INTO `default_settings` VALUES ('mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', '0', '1', 'email', '974');
INSERT INTO `default_settings` VALUES ('mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', '0', '1', 'email', '973');
INSERT INTO `default_settings` VALUES ('mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', '0', '1', 'email', '972');
INSERT INTO `default_settings` VALUES ('mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', '0', '1', 'email', '972');
INSERT INTO `default_settings` VALUES ('admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', '1', '1', '', '0');
INSERT INTO `default_settings` VALUES ('api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '0', '0=Disabled|1=Enabled', '0', '0', 'api', '0');
INSERT INTO `default_settings` VALUES ('api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', '0', '0', 'api', '0');
INSERT INTO `default_settings` VALUES ('cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', '0', '1', 'integration', '1000');
INSERT INTO `default_settings` VALUES ('addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', '1', '0', '', '0');
INSERT INTO `default_settings` VALUES ('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'msante', 'func:get_themes', '1', '0', '', '0');
INSERT INTO `default_settings` VALUES ('admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', '1', '0', '', '0');
INSERT INTO `default_settings` VALUES ('akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', '0', '1', 'integration', '981');
INSERT INTO `default_settings` VALUES ('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', '1', '1', 'comments', '968');
INSERT INTO `default_settings` VALUES ('moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', '1', '1', 'comments', '967');
INSERT INTO `default_settings` VALUES ('comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', '1', '1', 'comments', '966');
INSERT INTO `default_settings` VALUES ('comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', '1', '1', 'comments', '965');
INSERT INTO `default_settings` VALUES ('files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', '1', '1', 'files', '986');
INSERT INTO `default_settings` VALUES ('files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', '0', '1', 'files', '994');
INSERT INTO `default_settings` VALUES ('files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>', 'text', '', '', '', '0', '1', 'files', '993');
INSERT INTO `default_settings` VALUES ('files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', '0', '1', 'files', '992');
INSERT INTO `default_settings` VALUES ('files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', '1', '1', 'files', '991');
INSERT INTO `default_settings` VALUES ('files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon\'s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', '0', '1', 'files', '991');
INSERT INTO `default_settings` VALUES ('files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>', 'text', '', '', '', '0', '1', 'files', '990');
INSERT INTO `default_settings` VALUES ('files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', '0', '1', 'files', '989');
INSERT INTO `default_settings` VALUES ('files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', '1', '1', 'files', '987');
INSERT INTO `default_settings` VALUES ('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', '0', '1', 'users', '964');
INSERT INTO `default_settings` VALUES ('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', '1', '1', 'users', '963');
INSERT INTO `default_settings` VALUES ('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '', '0=activate_by_admin|1=activate_by_email|2=no_activation', '0', '1', 'users', '961');
INSERT INTO `default_settings` VALUES ('registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', '0', '1', 'users', '962');
INSERT INTO `default_settings` VALUES ('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', '0', '1', 'users', '961');
INSERT INTO `default_settings` VALUES ('profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', '0', '1', 'users', '960');
INSERT INTO `default_settings` VALUES ('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(\'textarea#intro.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'pyroimages\'],\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	extraPlugins: \'pyroimages\',\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(\'textarea.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(\'textarea.wysiwyg-advanced\').ckeditor({\r\n	toolbar: [\r\n		[\'Maximize\'],\r\n		[\'pyroimages\', \'pyrofiles\'],\r\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\r\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\r\n		[\'Link\',\'Unlink\'],\r\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\r\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\r\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\r\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	],\r\n	extraPlugins: \'pyroimages,pyrofiles\',\r\n	width: \'99%\',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	removePlugins: \'elementspath\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});', '', '1', '1', 'wysiwyg', '993');
INSERT INTO `default_settings` VALUES ('token_setting', 'Tokens Setting', 'A Yes or No option for the token module', 'select', '1', '1', '1=Yes|0=No', '1', '1', 'token', '0');
INSERT INTO `default_settings` VALUES ('jours_ouverts', 'Jours ouverts', 'Les jours d\'ouverture (Non implementé)', 'checkbox', '1', '1,2,3,4,5,6,7', '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche', '1', '1', 'calendar', '660');
INSERT INTO `default_settings` VALUES ('min_appointment_amount', 'Montant minimum', 'Montant minimum pour accepter un achat', 'text', '0', '', '', '0', '1', 'appointments', '0');
INSERT INTO `default_settings` VALUES ('off_period', 'Période de fermeture', 'Plage de date pour une période de fermeture des livraison Format: MM-JJ|MM-JJ *NOT WORKING*', 'text', '12-24|12-25', '', '', '0', '1', 'appointments', '0');

-- ----------------------------
-- Table structure for `default_theme_options`
-- ----------------------------
DROP TABLE IF EXISTS `default_theme_options`;
CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_theme_options
-- ----------------------------
INSERT INTO `default_theme_options` VALUES ('1', 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('2', 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('3', 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('4', 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('5', 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'no', 'yes=Yes|no=No', '1', 'default');
INSERT INTO `default_theme_options` VALUES ('6', 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', '2 column', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', '1', 'default');
INSERT INTO `default_theme_options` VALUES ('7', 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'fabric', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('8', 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('9', 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('10', 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'no', 'yes=Yes|no=No', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('28', 'show_slideshow', 'Show slideshow', 'Activates slideshow', 'radio', 'no', 'no', 'yes=Yes|no=No', '1', 'bs3');
INSERT INTO `default_theme_options` VALUES ('25', 'bootSwatch_layout', 'Theme', 'Choose the default bootstrap.css or select the bootswatch theme that you prefer', 'select', 'bootstrap', 'cosmo', 'bootstrap=Default - Bootstrap|amelia=Amelia|cerulean=Cerulean|cosmo=Cosmo|cyborg=Cyborg|flatly=Flatly|journal=Journal|readable=Readable|simplex=Simplex|slate=Slate|spacelab=Spacelab|united=United|yeti=Yeti', '1', 'bs3');
INSERT INTO `default_theme_options` VALUES ('26', 'custom_css', 'Custom CSS', 'Custom master CSS overload', 'radio', 'no', 'yes', 'yes=Yes|no=No', '1', 'bs3');
INSERT INTO `default_theme_options` VALUES ('27', 'disable_right_click', 'Disable right click', 'Disable right mouse click', 'radio', 'no', 'no', 'yes=Yes|no=No', '1', 'bs3');
INSERT INTO `default_theme_options` VALUES ('24', 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'no', 'no', 'yes=Yes|no=No', '1', 'bs3');
INSERT INTO `default_theme_options` VALUES ('29', 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'no', 'no', 'yes=Yes|no=No', '1', 'msante');
INSERT INTO `default_theme_options` VALUES ('30', 'bootSwatch_layout', 'Theme', 'Choose the default bootstrap.css or select the bootswatch theme that you prefer', 'select', 'bootstrap', 'bootstrap', 'bootstrap=Default - Bootstrap|amelia=Amelia|cerulean=Cerulean|cosmo=Cosmo|cyborg=Cyborg|flatly=Flatly|journal=Journal|readable=Readable|simplex=Simplex|slate=Slate|spacelab=Spacelab|united=United|yeti=Yeti', '1', 'msante');
INSERT INTO `default_theme_options` VALUES ('31', 'custom_css', 'Custom CSS', 'Custom master CSS overload', 'radio', 'no', 'yes', 'yes=Yes|no=No', '1', 'msante');
INSERT INTO `default_theme_options` VALUES ('32', 'disable_right_click', 'Disable right click', 'Disable right mouse click', 'radio', 'no', 'no', 'yes=Yes|no=No', '1', 'msante');
INSERT INTO `default_theme_options` VALUES ('33', 'show_slideshow', 'Show slideshow', 'Activates slideshow', 'radio', 'no', 'no', 'yes=Yes|no=No', '1', 'msante');

-- ----------------------------
-- Table structure for `default_users`
-- ----------------------------
DROP TABLE IF EXISTS `default_users`;
CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';

-- ----------------------------
-- Records of default_users
-- ----------------------------
INSERT INTO `default_users` VALUES ('1', 'radjal@free.fr', '5e44f772e016797f89db5d19d179975c24d8ee85', '4cd53', '1', '', '1', '', '1495107565', '1521513631', 'admin', null, 'c0295b85cfedecb50184b72a02da225b399b7cf4');
INSERT INTO `default_users` VALUES ('2', 'practicien@nowhere.com', '7db15a5af242f976d62282149602188eb0cd96ad', 'e5d396', '5', '::1', '1', null, '1521074461', '1521076949', 'docteur.test', null, '61de7be305a949a0b6a141d5bf33fcb63a04e967');
INSERT INTO `default_users` VALUES ('3', 'medstaff@nowhere.com', '757129871de30daf6040f50f828b02d8744e8c39', '0d8c10', '3', '::1', '1', null, '1521074617', '1521076980', 'med.staff', null, 'b40d2018448fd8177b1b1527d4ca244c30e29e36');
INSERT INTO `default_users` VALUES ('4', 'support@nowhere.com', '1031f9a492618d59461444aa240ee82023354704', 'd70a25', '4', '::1', '1', null, '1521074688', '1521077026', 'support', null, '3cc21520c7d43c51f8c77ae0c74417fe32250f72');
INSERT INTO `default_users` VALUES ('5', 'devops@nowhere.com', 'f2229cde76e4ca9c4a658f6f091158fea4338bee', 'b92942', '1', '::1', '1', null, '1521077115', '1521077115', 'devops', null, null);

-- ----------------------------
-- Table structure for `default_variables`
-- ----------------------------
DROP TABLE IF EXISTS `default_variables`;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_variables
-- ----------------------------

-- ----------------------------
-- Table structure for `default_widgets`
-- ----------------------------
DROP TABLE IF EXISTS `default_widgets`;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_widgets
-- ----------------------------

-- ----------------------------
-- Table structure for `default_widget_areas`
-- ----------------------------
DROP TABLE IF EXISTS `default_widget_areas`;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_widget_areas
-- ----------------------------
INSERT INTO `default_widget_areas` VALUES ('1', 'sidebar', 'Sidebar');

-- ----------------------------
-- Table structure for `default_widget_instances`
-- ----------------------------
DROP TABLE IF EXISTS `default_widget_instances`;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_widget_instances
-- ----------------------------

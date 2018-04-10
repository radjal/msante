/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : msante

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-04-08 20:22:18
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
  `parent_cat` int(11) DEFAULT NULL,
  `speciality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_cat_image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_doctor_categories
-- ----------------------------
INSERT INTO `default_doctor_categories` VALUES ('2', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Cardiologue', null, null);
INSERT INTO `default_doctor_categories` VALUES ('3', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Dentiste', null, null);
INSERT INTO `default_doctor_categories` VALUES ('4', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Etablissement de santé', null, null);
INSERT INTO `default_doctor_categories` VALUES ('5', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Laboratoires', null, null);
INSERT INTO `default_doctor_categories` VALUES ('6', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Médecins généralistes', null, null);
INSERT INTO `default_doctor_categories` VALUES ('7', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Ophtalmologue', null, null);
INSERT INTO `default_doctor_categories` VALUES ('8', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'ORL', null, null);
INSERT INTO `default_doctor_categories` VALUES ('9', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Radiologue', null, null);
INSERT INTO `default_doctor_categories` VALUES ('10', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '0', 'Spécialistes femme', null, null);
INSERT INTO `default_doctor_categories` VALUES ('11', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Acupuncture', 'Médecine douce, Médecine chinoise', null);
INSERT INTO `default_doctor_categories` VALUES ('12', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Addictologie', 'Problème d\'alcool, Problème drogue, Problème tabac', null);
INSERT INTO `default_doctor_categories` VALUES ('13', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Alcoologie', 'Problème d\'alcool', null);
INSERT INTO `default_doctor_categories` VALUES ('14', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Algologie', 'Douleurs', null);
INSERT INTO `default_doctor_categories` VALUES ('15', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Allergologie', 'Allergies', null);
INSERT INTO `default_doctor_categories` VALUES ('16', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Andrologie', 'Pénis', null);
INSERT INTO `default_doctor_categories` VALUES ('17', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Anesthésiologie-réanimation', 'Anesthésiste - Réanimateur', null);
INSERT INTO `default_doctor_categories` VALUES ('18', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Cancérologie/Oncologie', 'Cancer', null);
INSERT INTO `default_doctor_categories` VALUES ('19', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Chirurgie orthopédique et traumatologique', 'Os, Pied, Jambes', null);
INSERT INTO `default_doctor_categories` VALUES ('20', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Chirurgie pédiatrique', 'Enfants', null);
INSERT INTO `default_doctor_categories` VALUES ('21', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Chirurgie plastique, reconstructrice et esthétique', 'Réparation de la peau', null);
INSERT INTO `default_doctor_categories` VALUES ('22', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Chirurgie urologique', 'Urine', null);
INSERT INTO `default_doctor_categories` VALUES ('23', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Chirurgie viscérale et digestive', 'Ventre', null);
INSERT INTO `default_doctor_categories` VALUES ('24', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Dermatologie et vénéréologie', 'Peau, bouton, brulure', null);
INSERT INTO `default_doctor_categories` VALUES ('25', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Endocrinologie et métabolisme/diabétologie', 'Diabète, croissance', null);
INSERT INTO `default_doctor_categories` VALUES ('26', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Gastro-entérologie et hépatologie', 'ventre', null);
INSERT INTO `default_doctor_categories` VALUES ('27', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Gériatrie', 'Personnes agées', null);
INSERT INTO `default_doctor_categories` VALUES ('28', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Hématologie', 'Drépanocytose, sang', null);
INSERT INTO `default_doctor_categories` VALUES ('29', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Maladies infectieuses et tropicales', 'Paludisme, ébola, fièvres,..', null);
INSERT INTO `default_doctor_categories` VALUES ('30', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Médecine du sport', 'sport', null);
INSERT INTO `default_doctor_categories` VALUES ('31', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Médecine du travail', 'Visite médicale', null);
INSERT INTO `default_doctor_categories` VALUES ('32', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Médecine physique et de réadaptation', 'Os, jambe , pied', null);
INSERT INTO `default_doctor_categories` VALUES ('33', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Néonatologie', 'Prématuré, bébé', null);
INSERT INTO `default_doctor_categories` VALUES ('34', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Néphrologie', 'Reins', null);
INSERT INTO `default_doctor_categories` VALUES ('35', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Neurochirurgie', 'Cerveau', null);
INSERT INTO `default_doctor_categories` VALUES ('36', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Neurologie', 'Cerveau', null);
INSERT INTO `default_doctor_categories` VALUES ('37', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Neuropédiatrie', 'Cerveau enfant', null);
INSERT INTO `default_doctor_categories` VALUES ('38', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Neuropsychiatrie', 'Psychiatrie', null);
INSERT INTO `default_doctor_categories` VALUES ('39', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Orthopédie', 'Os, jambe , pied', null);
INSERT INTO `default_doctor_categories` VALUES ('40', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Pédiatrie', 'Enfants, bébé', null);
INSERT INTO `default_doctor_categories` VALUES ('41', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Pneumologie', 'Poumons, respiration', null);
INSERT INTO `default_doctor_categories` VALUES ('42', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Proctologie', 'Hémorrhoïdes', null);
INSERT INTO `default_doctor_categories` VALUES ('43', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Psychiatrie', 'Psychiatrie', null);
INSERT INTO `default_doctor_categories` VALUES ('44', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Rhumatologie', 'Os, articulation, dos,…', null);
INSERT INTO `default_doctor_categories` VALUES ('45', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Santé publique et médecine préventive', 'Dispensaire, PMI', null);
INSERT INTO `default_doctor_categories` VALUES ('46', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Soins palliatifs', 'Fin de vie', null);
INSERT INTO `default_doctor_categories` VALUES ('47', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Tabacologie', 'Cigarette', null);
INSERT INTO `default_doctor_categories` VALUES ('48', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '1', 'Urologie', 'Urine', null);
INSERT INTO `default_doctor_categories` VALUES ('49', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '2', 'Angiologie', 'Cœur, Cardiologue', null);
INSERT INTO `default_doctor_categories` VALUES ('50', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '2', 'Cardiologie', 'Cœur, Cardiologue', null);
INSERT INTO `default_doctor_categories` VALUES ('51', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '2', 'Chirurgie thoracique et cardio-vasculaire', 'Cœur', null);
INSERT INTO `default_doctor_categories` VALUES ('52', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '2', 'Chirurgie vasculaire', 'Cœur', null);
INSERT INTO `default_doctor_categories` VALUES ('53', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '2', 'Coronarographie', 'Cœur', null);
INSERT INTO `default_doctor_categories` VALUES ('54', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '2', 'Phlébologie', 'Veine', null);
INSERT INTO `default_doctor_categories` VALUES ('55', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '3', 'Chirurgie dentaire', 'Dents', null);
INSERT INTO `default_doctor_categories` VALUES ('56', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '3', 'Dentisterie', 'Dents', null);
INSERT INTO `default_doctor_categories` VALUES ('57', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '3', 'Odontologie', 'Dents', null);
INSERT INTO `default_doctor_categories` VALUES ('58', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '3', 'Stomatologie', 'Bouche, dents, machoire', null);
INSERT INTO `default_doctor_categories` VALUES ('59', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '4', 'Explorations fonctionnelles', 'Respiration', null);
INSERT INTO `default_doctor_categories` VALUES ('60', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '4', 'Hygiène hospitalière', null, null);
INSERT INTO `default_doctor_categories` VALUES ('61', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '4', 'Médecine légale', 'Décès', null);
INSERT INTO `default_doctor_categories` VALUES ('62', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '4', 'Réanimation médicale', '0', null);
INSERT INTO `default_doctor_categories` VALUES ('63', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '4', 'Urgences', '0', null);
INSERT INTO `default_doctor_categories` VALUES ('64', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '5', 'Anatomie et cytologie pathologiques', 'Laboratoire d\'analyse, Analyse', null);
INSERT INTO `default_doctor_categories` VALUES ('65', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '5', 'Biochimie', 'Laboratoire d\'analyse, Analyse', null);
INSERT INTO `default_doctor_categories` VALUES ('66', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '5', 'Biologie médicale et physiologie', 'Laboratoire d\'analyse, Analyse', null);
INSERT INTO `default_doctor_categories` VALUES ('67', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '6', 'Génétique', 'Laboratoires', null);
INSERT INTO `default_doctor_categories` VALUES ('68', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '7', 'Généraliste', 'Médecin généraliste', null);
INSERT INTO `default_doctor_categories` VALUES ('69', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '8', 'Chirurgie ophtalmologique', 'Oeil', null);
INSERT INTO `default_doctor_categories` VALUES ('70', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '8', 'Ophtalmologie', null, null);
INSERT INTO `default_doctor_categories` VALUES ('71', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '8', 'Chirurgie ORL cervico-faciale', 'Oreille, Nez, Gorge, Os', null);
INSERT INTO `default_doctor_categories` VALUES ('72', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '8', 'ORL', 'Nez, gorge, oreille', null);
INSERT INTO `default_doctor_categories` VALUES ('73', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '9', 'Echographie', 'Radio', null);
INSERT INTO `default_doctor_categories` VALUES ('74', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '9', 'Médecine nucléaire', 'Radio', null);
INSERT INTO `default_doctor_categories` VALUES ('75', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '9', 'Radiodiagnostic et imagerie médicale', 'Radio', null);
INSERT INTO `default_doctor_categories` VALUES ('76', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '9', 'Radiothérapie', 'Radio', null);
INSERT INTO `default_doctor_categories` VALUES ('77', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, '10', 'Chirurgie gynécologie obstétrique', 'Gynéco', null);
INSERT INTO `default_doctor_categories` VALUES ('1', '2018-04-08 00:00:00', '2018-04-08 00:00:00', null, null, null, 'Autres médécins', null, null);

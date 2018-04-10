-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : msantenenndb.mysql.db
-- Généré le :  mar. 10 avr. 2018 à 08:56
-- Version du serveur :  5.6.34-log
-- Version de PHP :  7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `msantenenndb`
--

-- --------------------------------------------------------

--
-- Structure de la table `default_doctor_categories`
--

DROP TABLE IF EXISTS `default_doctor_categories`;
CREATE TABLE `default_doctor_categories` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `parent_cat` int(11) DEFAULT NULL,
  `speciality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_cat_image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_doctor_categories`
--

INSERT INTO `default_doctor_categories` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `parent_cat`, `speciality`, `keywords`, `doc_cat_image`) VALUES
(2, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Cardiologue', NULL, NULL),
(3, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Dentiste', NULL, NULL),
(4, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Etablissement de santé', NULL, NULL),
(5, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Laboratoires', NULL, NULL),
(6, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Médecins généralistes', NULL, NULL),
(7, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Ophtalmologue', NULL, NULL),
(8, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'ORL', NULL, NULL),
(9, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Radiologue', NULL, NULL),
(10, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Spécialistes femme', NULL, NULL),
(11, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Acupuncture', 'Médecine douce, Médecine chinoise', NULL),
(12, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Addictologie', 'Problème d\'alcool, Problème drogue, Problème tabac', NULL),
(13, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Alcoologie', 'Problème d\'alcool', NULL),
(14, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Algologie', 'Douleurs', NULL),
(15, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Allergologie', 'Allergies', NULL),
(16, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Andrologie', 'Pénis', NULL),
(17, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Anesthésiologie-réanimation', 'Anesthésiste - Réanimateur', NULL),
(18, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Cancérologie/Oncologie', 'Cancer', NULL),
(19, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Chirurgie orthopédique et traumatologique', 'Os, Pied, Jambes', NULL),
(20, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Chirurgie pédiatrique', 'Enfants', NULL),
(21, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Chirurgie plastique, reconstructrice et esthétique', 'Réparation de la peau', NULL),
(22, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Chirurgie urologique', 'Urine', NULL),
(23, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Chirurgie viscérale et digestive', 'Ventre', NULL),
(24, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Dermatologie et vénéréologie', 'Peau, bouton, brulure', NULL),
(25, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Endocrinologie et métabolisme/diabétologie', 'Diabète, croissance', NULL),
(26, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Gastro-entérologie et hépatologie', 'ventre', NULL),
(27, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Gériatrie', 'Personnes agées', NULL),
(28, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Hématologie', 'Drépanocytose, sang', NULL),
(29, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Maladies infectieuses et tropicales', 'Paludisme, ébola, fièvres,..', NULL),
(30, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Médecine du sport', 'sport', NULL),
(31, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Médecine du travail', 'Visite médicale', NULL),
(32, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Médecine physique et de réadaptation', 'Os, jambe , pied', NULL),
(33, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Néonatologie', 'Prématuré, bébé', NULL),
(34, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Néphrologie', 'Reins', NULL),
(35, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Neurochirurgie', 'Cerveau', NULL),
(36, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Neurologie', 'Cerveau', NULL),
(37, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Neuropédiatrie', 'Cerveau enfant', NULL),
(38, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Neuropsychiatrie', 'Psychiatrie', NULL),
(39, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Orthopédie', 'Os, jambe , pied', NULL),
(40, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Pédiatrie', 'Enfants, bébé', NULL),
(41, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Pneumologie', 'Poumons, respiration', NULL),
(42, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Proctologie', 'Hémorrhoïdes', NULL),
(43, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Psychiatrie', 'Psychiatrie', NULL),
(44, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Rhumatologie', 'Os, articulation, dos,…', NULL),
(45, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Santé publique et médecine préventive', 'Dispensaire, PMI', NULL),
(46, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Soins palliatifs', 'Fin de vie', NULL),
(47, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Tabacologie', 'Cigarette', NULL),
(48, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 1, 'Urologie', 'Urine', NULL),
(49, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 2, 'Angiologie', 'Cœur, Cardiologue', NULL),
(50, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 2, 'Cardiologie', 'Cœur, Cardiologue', NULL),
(51, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 2, 'Chirurgie thoracique et cardio-vasculaire', 'Cœur', NULL),
(52, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 2, 'Chirurgie vasculaire', 'Cœur', NULL),
(53, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 2, 'Coronarographie', 'Cœur', NULL),
(54, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 2, 'Phlébologie', 'Veine', NULL),
(55, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 3, 'Chirurgie dentaire', 'Dents', NULL),
(56, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 3, 'Dentisterie', 'Dents', NULL),
(57, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 3, 'Odontologie', 'Dents', NULL),
(58, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 3, 'Stomatologie', 'Bouche, dents, machoire', NULL),
(59, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 4, 'Explorations fonctionnelles', 'Respiration', NULL),
(60, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 4, 'Hygiène hospitalière', NULL, NULL),
(61, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 4, 'Médecine légale', 'Décès', NULL),
(62, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 4, 'Réanimation médicale', '0', NULL),
(63, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 4, 'Urgences', '0', NULL),
(64, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 5, 'Anatomie et cytologie pathologiques', 'Laboratoire d\'analyse, Analyse', NULL),
(65, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 5, 'Biochimie', 'Laboratoire d\'analyse, Analyse', NULL),
(66, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 5, 'Biologie médicale et physiologie', 'Laboratoire d\'analyse, Analyse', NULL),
(67, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 6, 'Génétique', 'Laboratoires', NULL),
(68, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 7, 'Généraliste', 'Médecin généraliste', NULL),
(69, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 8, 'Chirurgie ophtalmologique', 'Oeil', NULL),
(70, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 8, 'Ophtalmologie', NULL, NULL),
(71, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 8, 'Chirurgie ORL cervico-faciale', 'Oreille, Nez, Gorge, Os', NULL),
(72, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 8, 'ORL', 'Nez, gorge, oreille', NULL),
(73, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 9, 'Echographie', 'Radio', NULL),
(74, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 9, 'Médecine nucléaire', 'Radio', NULL),
(75, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 9, 'Radiodiagnostic et imagerie médicale', 'Radio', NULL),
(76, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 9, 'Radiothérapie', 'Radio', NULL),
(77, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 10, 'Chirurgie gynécologie obstétrique', 'Gynéco', NULL),
(1, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, NULL, 'Autres médécins', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `default_doctor_categories`
--
ALTER TABLE `default_doctor_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `default_doctor_categories`
--
ALTER TABLE `default_doctor_categories`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : msantenenndb.mysql.db
-- Généré le :  jeu. 12 avr. 2018 à 03:57
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
-- Structure de la table `core_settings`
--

DROP TABLE IF EXISTS `core_settings`;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

--
-- Déchargement des données de la table `core_settings`
--

INSERT INTO `core_settings` (`slug`, `default`, `value`) VALUES
('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y'),
('lang_direction', 'ltr', 'ltr'),
('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- --------------------------------------------------------

--
-- Structure de la table `core_sites`
--

DROP TABLE IF EXISTS `core_sites`;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `core_sites`
--

INSERT INTO `core_sites` (`id`, `name`, `ref`, `domain`, `active`, `created_on`, `updated_on`) VALUES
(1, 'Default Site', 'default', 'msante.localhost', 1, 1495107566, 0);

-- --------------------------------------------------------

--
-- Structure de la table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
CREATE TABLE `core_users` (
  `id` smallint(5) UNSIGNED NOT NULL,
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
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';

--
-- Déchargement des données de la table `core_users`
--

INSERT INTO `core_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'radjal@free.fr', '856fa1e87fe6161cdd5a13b725026af856d090db', '4cd53', 1, '', 1, '', 1495107565, 1495107565, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_appointments_details`
--

DROP TABLE IF EXISTS `default_appointments_details`;
CREATE TABLE `default_appointments_details` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:00',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_appointments_list`
--

DROP TABLE IF EXISTS `default_appointments_list`;
CREATE TABLE `default_appointments_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `doctor_id` int(11) NOT NULL DEFAULT '0',
  `appointment_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `appointment_date` int(11) NOT NULL DEFAULT '0',
  `appointment_time` int(4) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `maiden_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `birth_date` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `for_user` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `knows_doctor` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `town` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `area_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `insurance` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_pretax` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `total_final` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log` text COLLATE utf8_unicode_ci,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:00',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_appointments_list`
--

INSERT INTO `default_appointments_list` (`id`, `user_id`, `doctor_id`, `appointment_status`, `appointment_date`, `appointment_time`, `message`, `maiden_name`, `first_name`, `last_name`, `birth_date`, `gender`, `for_user`, `knows_doctor`, `phone`, `mobile`, `email`, `address`, `district`, `town`, `area_name`, `insurance`, `payment_type`, `payment_status`, `total_pretax`, `total_final`, `log`, `ip`, `user_agent`, `created_on`, `updated_on`) VALUES
(1, 17, 15, '', 20180410, 1000, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'non', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-05 14:28:23', NULL),
(2, 17, 12, '', 20180408, 1030, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'oui', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-05 14:36:55', NULL),
(3, 17, 3, '', 20180406, 1000, NULL, 'desailes', 'sandra', 'Roches', '01/01/1986', '', 'no', 'non', '678957826', '0678957826', 'r.lomas@spelldesign.fr', '', 'commune du port', 'paris', 'quartier des dunes', 'non', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-05 14:37:58', NULL),
(4, 12, 15, 'cancelled_by_patient', 20180423, 1030, NULL, '', 'Barry', 'Almamy', '10/10/50', '', 'yes', '1', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Ratoma', 'Conakry', 'Hamdallaye', '1', '', '', '0', '0', NULL, '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-05 14:58:03', '2018-04-05 14:59:52'),
(5, 12, 15, '', 20180409, 1430, NULL, '', 'Barry', 'Almamy', '10/10/50', '', 'yes', 'oui', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Ratoma ', 'Conakry', 'Hammady ', 'oui', '', '', '0', '0', NULL, '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-05 15:27:02', NULL),
(6, 17, 14, '', 20180417, 1430, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 13:00:54', NULL),
(7, 17, 16, '', 20180416, 1000, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 13:35:51', NULL),
(8, 17, 14, '', 20180412, 1030, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 13:43:52', NULL),
(9, 17, 14, '', 20180416, 1030, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 13:46:02', NULL),
(10, 17, 14, '', 20180416, 1100, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 13:46:20', NULL),
(11, 17, 14, '', 20180412, 1100, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 13:48:52', NULL),
(12, 12, 15, '', 20180410, 1030, NULL, '', 'Barry', 'Almamy', '10/10/50', '', 'yes', 'oui', '625464119', '625464119', 'abarry78250@gmail.com', '', 'ratoma', 'conakry', '', 'oui', '', '', '0', '0', NULL, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-06 15:10:53', NULL),
(13, 17, 16, '', 20180416, 1500, NULL, '', 'Radja', 'Lomas', '21/08/1979', '', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2018-04-06 15:11:21', NULL),
(14, 12, 15, '', 20180410, 1130, NULL, '', 'Barry', 'Almamy', '10/10/50', '', 'yes', 'oui', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Matam', 'Conakry ', '', 'oui', '', '', '0', '0', NULL, '80.12.39.139', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 16:06:08', NULL),
(15, 12, 15, '', 20180409, 1500, NULL, '', 'Barry', 'Almamy', '10/10/50', '', 'yes', 'oui', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Matam', 'Conakry ', '', 'oui', '', '', '0', '0', NULL, '80.12.39.139', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 18:09:54', NULL),
(16, 17, 3, '', 20180410, 1030, NULL, '', 'Sophie', 'Paumelle', '2018-04-06', 'homme', 'no', 'no', '678957826', '631618811', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Soisy sur Seine', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:14:35', NULL),
(17, 17, 3, '', 20180410, 1030, NULL, '', 'Sophie', 'Paumelle', '2005-04-06', 'homme', 'no', 'no', '678957826', '631618811', 'r.lomas@spelldesign.fr', '', 'Commune de la liberté', 'Soisy sur Seine', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:15:25', NULL),
(18, 17, 12, '', 20180408, 1100, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:22:29', NULL),
(19, 17, 12, '', 20180408, 1130, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:23:01', NULL),
(20, 17, 12, '', 20180408, 1000, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:23:13', NULL),
(21, 17, 12, '', 20180408, 1430, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:23:52', NULL),
(22, 17, 12, '', 20180408, 1500, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:24:01', NULL),
(23, 17, 12, '', 20180408, 1530, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:24:14', NULL),
(24, 17, 12, '', 20180408, 1600, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:24:25', NULL),
(25, 17, 12, '', 20180408, 1630, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:24:38', NULL),
(26, 17, 12, '', 20180408, 1700, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:24:44', NULL),
(27, 17, 12, '', 20180408, 1700, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:24:52', NULL),
(28, 17, 12, '', 20180408, 1700, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:25:09', NULL),
(29, 17, 10, '', 20180408, 1030, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 21:40:42', NULL),
(30, 17, 14, '', 20180409, 1430, NULL, '', 'Eliane', 'Roches', '1991-12-09', 'homme', 'no', 'no', '678957826', '0678957826', 'r.lomas@spelldesign.fr', '', 'Commune de la liberté', 'Le Châtelet-en-Brie', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 23:05:59', NULL),
(31, 17, 12, '', 20180420, 1030, NULL, '', 'Eliane', 'Roches', '1980-01-20', 'homme', 'no', 'no', '678957826', '', 'r.lomas@spelldesign.fr', '', 'commune de paris', 'Le Châtelet-en-Brie', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-06 23:08:47', NULL),
(32, 11, 14, '', 20180409, 1500, NULL, '', 'Boubacar ', 'Bah', '2017-11-09', '', 'no', 'oui', '665431196', '69666552', 'almamy.barry@laposte.net', '', 'Kaloum', 'Conakry ', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 23:14:04', NULL),
(33, 11, 16, 'cancelled_by_patient', 20180410, 1530, NULL, 'Bah', 'Aminata', 'Diallo', '2015-01-15', '', 'no', 'oui', '665431196', '965321795', 'almamy.barry@laposte.net', '', 'Dixinn', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-06 23:19:58', NULL),
(34, 17, 13, '', 20180418, 1030, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-06 23:54:14', NULL),
(35, 11, 12, '', 20180414, 1100, NULL, '', 'ALMAMY', 'BARRY', '2012-03-15', '', 'yes', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'Ratoma ', 'Conakry ', 'Hamdallaye ', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-07 01:20:44', NULL),
(36, 12, 10, '', 20180408, 1000, NULL, 'Kounta', 'Amina', 'Kinte', '1988-04-07', '', 'no', 'non', '625464119', '', 'abarry78250@gmail.com', '', 'Dixinn', 'Conakry', '', 'non', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-07 01:31:56', NULL),
(37, 12, 13, '', 20180414, 1530, NULL, '', 'Kounta', 'Kinte', '1967-04-18', '', 'no', 'non', '625464119', '', 'abarry78250@gmail.com', '', 'Dixinn', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-07 01:34:19', NULL),
(38, 11, 13, '', 20180413, 1000, NULL, '', 'ALMAMY', 'BARRY', '2012-03-02', '', 'yes', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'Matam', 'Conakry ', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-07 17:30:28', NULL),
(39, 11, 13, '', 20180411, 1030, NULL, 'Diallo', 'Maymouna', 'Camara', '1998-12-22', '', 'no', 'non', '665431196', '6662221245', 'almamy.barry@laposte.net', '', 'Ratoma', 'Conakry', 'Kipé', 'non', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2018-04-07 18:23:34', NULL),
(40, 11, 15, '', 20180409, 1000, NULL, '', 'ALMAMY', 'BARRY', '2012-03-02', 'femme', 'yes', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'Matam', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-07 22:33:19', NULL),
(41, 11, 10, '', 20180409, 1500, NULL, 'Montagne', 'Lena', 'William', '2011-04-08', 'femme', 'no', 'non', '665431196', '699858582', 'almamy.barry@laposte.net', '', 'Dixinn', 'Conakry ', '', 'non', '', '', '0', '0', NULL, '92.184.105.155', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-08 10:39:32', NULL),
(42, 11, 10, '', 20180409, 1000, NULL, '', 'ALMAMY', 'BARRY', '2012-03-02', 'femme', 'yes', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'Dixinn', 'Conakry ', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-08 18:50:03', NULL),
(43, 11, 11, '', 20180410, 1000, NULL, '', 'ALMAMY', 'BARRY', '2012-03-02', 'femme', 'yes', 'no', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'Kaloum', 'Conakry ', '', '', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-09 23:31:13', NULL),
(44, 12, 14, 'cancelled_by_patient', 20180424, 1700, NULL, '', 'Barry', 'Almamy', '2001-01-01', 'homme', 'yes', 'oui', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Dixinn', 'Conakry', '', 'non', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 08:24:38', NULL),
(45, 1, 211, 'cancelled_by_patient', 20180413, 1500, NULL, '', 'Radja', 'Lomas', '1978-10-20', 'femme', 'yes', 'no', '0678957826', '0678957826', 'radjal@free.fr', '', 'Le port', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2018-04-10 10:30:40', NULL),
(46, 1, 188, '', 20180413, 1000, NULL, '', 'Radja', 'Lomas', '1978-10-20', 'femme', 'yes', 'no', '0678957826', '0678957826', 'radjal@free.fr', '', 'Le port', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2018-04-10 10:32:13', NULL),
(47, 1, 211, '', 20180412, 1600, NULL, '', 'Radja', 'Lomas', '1978-10-20', 'femme', 'yes', 'no', '0678957826', '0678957826', 'radjal@free.fr', '', 'Le port', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-10 10:50:22', NULL),
(48, 17, 211, '', 20180411, 1130, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 10:52:05', NULL),
(49, 17, 188, '', 20180411, 1000, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 10:55:17', NULL),
(50, 17, 188, '', 20180411, 1030, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 10:56:40', NULL),
(51, 17, 188, '', 20180413, 1500, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', 'non', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 11:01:46', NULL),
(52, 17, 211, '', 20180411, 1500, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'non', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', 'non', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 11:14:49', NULL),
(53, 8, 188, '', 20180412, 1600, NULL, 'des', 'ruelle', 'Roches', '2018-04-10', '', 'no', 'no', '0163486116', '', 'bilbohiggins@nowhere.com', '', 'commune de belleville', 'Le Châtelet-en-Brie', '', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-10 11:37:06', NULL),
(54, 1, 188, '', 20180411, 1130, NULL, '', 'Radja', 'Lomas', '1978-10-20', 'femme', 'yes', 'no', '0678957826', '0678957826', 'radjal@free.fr', '', 'Le port', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-10 12:06:17', NULL),
(55, 17, 183, '', 20180411, 1000, NULL, '', 'Radja', 'Lomas', '1979-08-21', 'homme', 'yes', 'no', '678957826', '678957826', 'r.lomas@spelldesign.fr', '', 'commune de belleville', 'Bondoufle', 'quartier des acacias', '', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mobile Safari/537.36', '2018-04-10 22:55:18', NULL),
(56, 12, 183, '', 20180411, 1030, NULL, '', 'Barry', 'Almamy', '2001-01-01', 'homme', 'yes', 'non', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Matam', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 7.0; SM-T710 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36', '2018-04-10 23:11:57', NULL),
(57, 12, 191, '', 20180412, 1000, NULL, '', 'Bouba', 'BAH', '1988-04-04', 'homme', 'no', 'non', '625464119', '456487462', 'abarry78250@gmail.com', '', 'Ratouma', 'Conakry', 'Hamdallaye', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-10 23:33:54', NULL),
(58, 11, 191, '', 20180412, 1430, NULL, 'Baldé ', 'Hadjatou', 'Bah', '1966-04-11', 'homme', 'no', 'oui', '665431196', '', 'almamy.barry@laposte.net', '', 'Ratoma', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '80.12.37.251', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-11 00:41:48', NULL),
(59, 11, 188, '', 20180417, 1030, NULL, '', 'Lionel ', 'BAH', '1992-04-17', 'homme', 'no', 'non', '665431196', '', 'almamy.barry@laposte.net', '', 'Ratoma', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', '2018-04-11 11:07:46', NULL),
(60, 11, 183, '', 20180416, 1000, NULL, '', 'ALMAMY', 'BARRY', '2012-03-02', 'homme', 'yes', 'no', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'test', 'test', '', 'oui', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2018-04-11 12:24:58', NULL),
(61, 1, 183, '', 20180412, 1000, NULL, '', 'Radja', 'Lomas', '1978-10-20', 'femme', 'yes', 'no', '0678957826', '0678957826', 'radjal@free.fr', '', 'Le port', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', '', '', '0', '0', NULL, '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 14:21:25', NULL),
(62, 11, 183, 'cancelled_by_patient', 20180412, 1130, NULL, '', 'ALMAMY', 'BARRY', '2012-03-02', 'homme', 'yes', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'matam', 'conakry', '', 'oui', '', '', '0', '0', NULL, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 15:40:45', NULL),
(63, 11, 183, '', 20180413, 1600, NULL, '', 'Boubacar', 'BARRY', '1973-12-12', 'homme', 'no', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'Ratoma', 'Conakry', 'Dixinn', 'oui', '', '', '0', '0', NULL, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 15:44:33', NULL),
(64, 11, 184, '', 20180412, 1130, NULL, 'SOW', 'Madeau', 'BARRY', '1975-11-10', 'homme', 'no', 'oui', '665431196', '665431196', 'almamy.barry@laposte.net', '', 'mamoun', 'Dalaba', '', 'oui', '', '', '0', '0', NULL, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 17:29:27', NULL),
(65, 19, 184, '', 20180412, 1000, NULL, '', 'Alhassane', 'BALDE', '1980-10-10', 'homme', 'no', 'non', '665431196', '', 'infos@mitcoms.com', '', 'Dixinn', 'Conakry', '', 'non', '', '', '0', '0', NULL, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 17:50:30', NULL),
(66, 12, 184, '', 20180412, 1030, NULL, '', 'Barry', 'Almamy', '2001-01-01', 'homme', 'yes', 'oui', '625464119', '625464119', 'abarry78250@gmail.com', '', 'Dixinn', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 19:20:34', NULL),
(67, 19, 368, '', 20180412, 1430, NULL, '', 'INFO', 'MITCOM', '1982-12-12', 'homme', 'yes', 'non', '665431196', '665431196', 'infos@mitcoms.com', '', 'Ratoma', 'Conakry', '', 'oui', '', '', '0', '0', NULL, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-11 22:39:16', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_blog`
--

DROP TABLE IF EXISTS `default_blog`;
CREATE TABLE `default_blog` (
  `id` int(9) NOT NULL,
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
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_blog_categories`
--

DROP TABLE IF EXISTS `default_blog_categories`;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_blog_categories`
--

INSERT INTO `default_blog_categories` (`id`, `slug`, `title`) VALUES
(1, 'test', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `default_ci_sessions`
--

DROP TABLE IF EXISTS `default_ci_sessions`;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_ci_sessions`
--

INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('a0f69865c5f99027d90f5cb97e58b7f9', '66.249.93.25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434380, ''),
('ed93fe8c8e727ee8e159fe0dad9ad052', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434380, ''),
('49c7e1714fb8cdcdfc6949763053868b', '80.12.27.218', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523433092, ''),
('715f474b55822a6d5eab9db3e7dcadce', '80.12.27.218', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523433092, ''),
('d237380a3d3b2cb815a3777b5d7c0d80', '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523433091, 'a:2:{s:11:\"redirect_to\";s:10:\"users/edit\";s:14:\"admin_redirect\";s:12:\"admin/doctor\";}'),
('0fc4a604faeb3046d817947ff9e172de', '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523439510, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('101b60c4bbd6799f080dcd6ee2e911a3', '80.12.37.142', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523424198, ''),
('f15ae0fe696e4af4d138d9c5e7f1a7e7', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523465669, ''),
('223609d6550e65cc24e3996183f61e50', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523419865, ''),
('afc4b4a0921319564eb9663dff184d49', '81.230.137.192', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:48.0) Gecko/20100101 Firefox/48.0', 1523421271, ''),
('730fe5b128ed107ee96c19c055d3b9f7', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523434258, 'a:6:{s:8:\"username\";s:6:\"devops\";s:5:\"email\";s:18:\"devops@nowhere.com\";s:2:\"id\";s:1:\"5\";s:7:\"user_id\";s:1:\"5\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('018587a3f457f9e48641e79859bed3c4', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1523411570, ''),
('df67644b9fb6e8b3205995836f55248b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523419354, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('3de94f5f27612f03d07ec51916c6c2d1', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523393370, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('ce01b2fde85a61ec939283cc13cf2c1c', '188.165.251.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1523392732, ''),
('e07ea94be2b1f2f9711b34d28962be4c', '188.165.251.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1523392728, ''),
('13198a171320ba865268d77b2daa8e17', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1523391400, ''),
('ec17480c5d40ecce0af900f3d11b683f', '80.12.37.251', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523392908, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9b4ce750261942e3454412cfe02826e0', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1523391923, 'a:6:{s:8:\"username\";s:13:\"bilbo.higgins\";s:5:\"email\";s:24:\"bilbohiggins@nowhere.com\";s:2:\"id\";s:1:\"8\";s:7:\"user_id\";s:1:\"8\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9fd6a0887ca6ed51fb646dea554b7413', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1523391256, ''),
('faa59829d8d8ae2f67f540677aa8346e', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523363629, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('051366a50eb7fa88d807230c46f9ea04', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523363065, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:28:\"Le module a été installé.\";}'),
('e280b6c67b4b8ece3bc427c437322455', '80.12.27.200', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523368503, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('21f56374955783eca7c4febcdbfff92c', '66.160.134.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1523364192, ''),
('737261df2227ab9ed45d80b95080b23d', '66.160.134.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1523364193, ''),
('0c80c0bea47935ff907275fcccda9540', '66.160.134.61', 'Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)', 1523364203, ''),
('619780b6e48ca1578fe1bd86e211b522', '66.160.134.61', '', 1523364205, ''),
('0855b41e39d292e6504a34d581f19099', '188.165.251.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1523364265, ''),
('425ff82d2020212bf6ba23dc9c1d6917', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1523369333, ''),
('32049db003d5c41e0dbe929beca159db', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1523369333, ''),
('d6e1f19cd4bd01850b16015a82ee0905', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523379990, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('55df692b820d0e4353990b76bede4dcc', '176.31.224.216', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523378737, ''),
('768d178350cc9a0ac58060fb373b1aca', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523378905, ''),
('27362477b4bd75a47c1b23b9f2277aa0', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523378917, ''),
('2e74fc548d5f7f786ad3d1c3b7449c7f', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523378917, ''),
('4f6b8933e9527084abac930913f711de', '151.80.34.185', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523379328, ''),
('401b2383c9d064140fa0dfac26ef57e3', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523379751, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('44b2128ce259f42ce5e1ccffd171ce51', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523379853, ''),
('680b16386932107a25b9d383ce26c529', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523380061, ''),
('7bd00c3209567bb81fe8e6f90d7d448a', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mo', 1523386710, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('19bc8f94e6e8ce1cd910334d66caff8e', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mo', 1523386770, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e45169c80d21f7e6d0c1c3f9b3ed8e34', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523383703, ''),
('1a55879c26ee995100eaf03569c249f0', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523384620, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('f01f4746fe392f9e3551f3f959ec4042', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523389129, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('af03d8eb88d3f54d2b00127267637b21', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 7.0; SM-T710 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safar', 1523387898, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('9df100350343449453ad1e7a97ff1deb', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mo', 1523387224, ''),
('d19f591ba3e86017c8d0c7fae3dfa18b', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523387142, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('f1fab0dd6692ca26ee79a53267a1fd57', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mo', 1523387224, ''),
('510892d666c595a6914ef8b93bce11cd', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523390188, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('27ca864f4937a59249688a07cd3e0c72', '172.82.185.211', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 1523438949, ''),
('33422852cb6aa0cb625fb44ab953f796', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523434829, ''),
('ecd66d6a0cbc3e6f559311f92152f6bc', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1523359246, ''),
('88bcdd2db8667d46075d07931e64004d', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523361993, ''),
('009399f147f91be8616ab98656a1917d', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523393085, ''),
('9ca4217c2779e17f8a3cb3b8264d3b44', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523208450, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('4a4b4bdd531fe9441a0cfc34c7c61296', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523209000, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('afb3dd5ad61e84433185df3b239e5b00', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523210186, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('6cf16079330895f27eeeaa9c0c976307', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523211506, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('e10d1d0eadbb8e639d93b78528222873', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523227442, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('1867ad80ae75769bda41e87bd04bce12', '80.12.37.5', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523230308, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('37fe5380268ca3de991a7858594cc21a', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523235965, ''),
('cdc2fe1b7ca813713aa6ac3c6bfcb788', '66.249.66.223', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1523237952, ''),
('b851e27d61802d0c3a54a880871867a8', '81.230.137.192', 'Mozilla/5.0 (Windows NT 5.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2708.4 Safari/537.36', 1523348726, ''),
('94de804d05c25c75e9dbdaee30863892', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523351435, 'a:1:{s:14:\"admin_redirect\";s:12:\"admin/doctor\";}'),
('6a9b080eccf2596e1c50f6223828bce4', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523357009, ''),
('5b989ebc79d4718121471c76d799fc36', '80.12.27.200', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523372179, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('cdacae1c70359c93011d2b7bfbbb97bf', '78.213.60.211', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1523352845, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e0352dd259003733ace98277dfe16a72', '176.31.224.216', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523353380, ''),
('f208f6d7d02e86e3f58482fcb7fdb3c3', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523354285, ''),
('729eaffa65cf01e909fd67f43c5fa310', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523354299, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('2fe3aa2ca9f19d1410df0b7b408195d6', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523366603, ''),
('02129d7861d42759b58b92b1e2480a62', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523374650, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('7a47915ba5b4aacca71174b52dd93f36', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1523392467, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('f6cb9ab29a2a62fd14d3221c5a2beaaf', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523206500, ''),
('ed8edbb70f2ccf9ef5d6a3062292de38', '169.53.184.5', '', 1523205479, ''),
('b58c242532a44d3dd5268bf1b4ab2228', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523206256, ''),
('8ea0a71721e9986759df9b373bd30145', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1523096349, ''),
('2d6642a3a30053c99ee2be6ddef4a1a8', '66.249.66.219', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1523096349, ''),
('d65f367da967d35c430feb9147858405', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523206499, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('efdd542ce53c13b39189ade59d6a5a0a', '87.250.224.54', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523100062, ''),
('3918b61ee16ccf9b440d410ee02a072e', '180.76.15.17', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523105463, ''),
('41df7fe77540d00b4f40671910bf1ff0', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523107288, ''),
('001c6c4b13ed6dc1b42a21084ba41b15', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523124273, ''),
('bdb1bf1bf0de685ac83ac93450b3d1ea', '87.250.224.215', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523112641, ''),
('4ab6fe5d72093722bc923674934f19cc', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523113587, ''),
('82ce1442b34e8d2133eea948b5bf1a98', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523113549, ''),
('bb48b3af459a9fd852d8a6be66f319fb', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523113615, ''),
('47f125856283456fd75dea99866f3f18', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobil', 1523113728, ''),
('eb7b44e9f6480ecf5211f73e1edae118', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523116702, ''),
('e3034b552991c80db88dfb4ce33643e4', '80.12.34.176', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523121090, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('02305da70b4930a8e6bf1ae51029c2b7', '80.12.34.176', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523125146, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('2675890041856a1e44c61ff41c60650e', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523124273, ''),
('d28df2247aa73514b6be1b0fa27e421f', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523124273, ''),
('8355ae2466ab7eeaf8ce023f2e1e5cf9', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523341821, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e7b4741adb3eeaa18a89e66a6a51a19f', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1523238007, ''),
('cf5efda2b0acb2dd13f2ac89afe2d96f', '180.76.15.160', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523256567, ''),
('f925aa9b74793896726190ee2bae9159', '180.76.15.140', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523256568, ''),
('4bcdf4b1c28134354a758dcee57fedbc', '141.8.183.10', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523257825, ''),
('84b72950574c554d7eded81c58df95bd', '92.184.104.247', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523274823, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('a8954f7ec1a42023ed26e55045a8ed33', '87.250.224.74', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523259443, ''),
('529ed881f63d2c658e7de7772fc1b5e3', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523260301, ''),
('d4531e82de9894bce26c0f852c3a13bc', '92.184.104.247', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523281705, ''),
('beb48f857e326be7f0df380485dd397a', '66.249.93.25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523262635, ''),
('89622d02d421e1d06427870e26cd244e', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523262636, ''),
('9744e8978c8fcf12526a1c8eac71575d', '66.249.93.25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523262636, ''),
('2eba6ed462366782cd7ef2375f89e4ce', '66.249.93.47', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523265409, ''),
('bdba0b6590bc56ed29384915b8b6228d', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523265409, ''),
('f0bc2f30dd6bcabc2a58ae133c367eff', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523269356, ''),
('21784b41075033c80f8ec8eb860a21b0', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523269357, ''),
('c9d672a0cd69012fb894153cc6e35fae', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1523270834, ''),
('00084e46c4375391b72ef3b0944c6af5', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523271286, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('1ad7e63dbb05aa7923f3acc7ba3d4bc3', '185.89.129.106', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1523271404, ''),
('a58bcd41d5183e49570f3a9cc0f1cf4f', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523344343, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('964fdfc903b8a3d2fe6e160883f455ff', '92.184.104.247', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523283238, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('95ecdf3eb961becd90397f19cd36a94f', '92.184.104.247', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523283288, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('8994270cf8d691b9182ba819167fe9b4', '92.184.104.247', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523283288, ''),
('d8712076942b3abe6a08abb3c4f2517c', '80.215.167.57', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523283979, ''),
('b4b71f053804ae3bcb0e33b3454fa15a', '80.215.167.57', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523284047, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('dbff52593ba3cef2bb7412cc330cd0b9', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523296807, 'a:6:{s:8:\"username\";s:6:\"devops\";s:5:\"email\";s:18:\"devops@nowhere.com\";s:2:\"id\";s:1:\"5\";s:7:\"user_id\";s:1:\"5\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('675f9097bfa73b6b5b35bafc7df397e2', '66.249.81.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523285615, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('7175810b01ac020d4ff468ea67d2eb41', '66.249.81.251', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523285615, ''),
('18790f81da1f68a8db841a9e9d02fce6', '196.52.43.122', '', 1523286391, ''),
('961b686acfb6e93b778789359a793de1', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523297627, ''),
('0ce198ddb21615784f0da832fa918b16', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523343043, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('246b166979868bcdfec01bd7278b8796', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523297627, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('03904873903bfd7677ac577c9c6cc137', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523297627, ''),
('2ef54710ca46f03b8a7356d4eecac8b8', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523299815, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('b6d655cd61c955949995b098eb2c0ead', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523300517, ''),
('e316b7c74024bcc66e5b1ae39b0ed672', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523300856, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('8ac938b86a05063979b8451830f75ec5', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523302002, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('d4e68391bf9bbfe3a70bc13c64a3a1f9', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334349, ''),
('33f26626bf02965e478645cb38622506', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523303836, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('59d7b7e0971d10b9cad0409fc4d6ed12', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334394, ''),
('fd24d4e44e368c0888353d36f4c401d4', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523302193, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:12:\"Enregistré.\";}'),
('0a1e8bc8e0b381d920e6b9e49ebdec40', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523302153, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('c574993184b56c596fe8cca1e161cf6a', '78.213.60.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523302988, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:50:\"<p>Compte utilisateur mis à jour avec succès</p>\";}'),
('336d6bf197367825b9bec9c809847704', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobi', 1523304143, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9068bbb0b039733142ad30d83468d2f2', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523305175, ''),
('f2826010c39e4347631c5f550a13698f', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobi', 1523304014, ''),
('ceb7c36e78c8e1407db43b147853c2ff', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523305175, ''),
('ad1f5545c1c8a27995f881c8f176e4cb', '66.249.93.51', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523305175, ''),
('8636a963a2a169b21d6a65708738f93e', '66.102.9.27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523305175, ''),
('5857efd76a23c57675b1175d4f437a55', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523306059, ''),
('37591d5f2a7ba93cd9a07455ff94601f', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334349, ''),
('873e6b56b34654c3f4c11655ae9fe924', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334336, ''),
('54792a3d69c0c8cd378049a541d9aa62', '92.184.105.45', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523306911, ''),
('205bd724e6056248c38143650ee21cfc', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523307140, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('c49733856e5cff6b275a42c478e24f3e', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523314400, ''),
('61b5916cd7a2b7689f41e33c91638e70', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523314434, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('0025811dd4d398f56993d5797e580d36', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1523314517, ''),
('41804239b5d614923c688ac5b0656a67', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523331375, ''),
('fe893fb7c411b437635b5fead44fcfdf', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523331375, ''),
('741501419e6e4c46a643e0f0df803690', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523331375, ''),
('651822ea3f8eaabee294f0b481e6b922', '54.183.165.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523332800, ''),
('4470b96b6b3b04b862639f8f5511f19c', '54.183.165.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523332800, ''),
('a317c7b25e550b7c975cab396f348ae7', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523332845, ''),
('c8554ab56d5e85408e3b34dc3c3d6dd4', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523332859, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('64cd46fa5140a465d433160d7507f3a0', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523332972, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('c3deb67246bc484695c26dba1b1ed951', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523332978, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('c92fcbcc17accf20bd2c1496e3699bbf', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523332992, 'a:6:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:43:\"La page \"accueil pro\" a été enregistrée.\";}'),
('6419aed7f46effcdcd900a834e06018c', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523332995, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('43d065ba0ed7be0a5e316252c74900ab', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523374632, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('03c6581468a935756aef75b0ddff789c', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523341615, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:96:\"Les modifications de la template d\'email \"Appointment mail for patient\" ont été sauvegardées.\";}'),
('f678a0e9e65906fb57584372280d2a75', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523334746, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('41c805daa0128900784d205b7df9d5d4', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523333810, ''),
('078e6010d59f8b7a5541246f5fe2c533', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523333860, ''),
('0d8e38b83af7cfa6f52561619c9a905d', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523333951, ''),
('7630a7b2c589737b95eacf50cdf6ccfe', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523333951, ''),
('f240c63caae6720ed20b19e9305c66c9', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334081, ''),
('a0e3cb2163c274f74ca8e5e7a7459fa5', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334126, ''),
('2b800e6247a910e28d52db290dfd4868', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334187, ''),
('2c9ad3fb97a2c8f013efe86b7c3d6727', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334189, ''),
('e7a38504b438b35e0cc32e65e812f8ac', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334199, ''),
('d710ca2ee5ad3c50ce6e2a7359d10055', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334279, ''),
('e45fd7678fffb6f80d015e138d489e9c', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334309, ''),
('c8c912e9f0f6968585a245699b871f38', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334310, ''),
('8962fdd78d6737ab65961ef7925d574d', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522978618, ''),
('684747c792b32c9065d1b1a54b1a4c23', '151.80.34.185', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522977572, ''),
('99e24f4534ff2a64ce3447768e537fd2', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522883837, ''),
('d20020ce6fd5d35baab8a2aa7305bd15', '141.8.183.10', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522882097, ''),
('49e53044a468427e9e20182b863aceb4', '66.249.66.223', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522883836, ''),
('c18b74bc5f196a97cb0f3d95256ad2a2', '138.246.253.19', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.85 Safari/537.36', 1522877897, ''),
('8177db31d34b8228b21d10818a182604', '129.78.110.124', '', 1522873762, ''),
('ca02d5e4a32b978348bbb5e5c1421fcd', '129.78.110.124', '', 1522873762, ''),
('d26ab6ed65b840ac45d9b1ae922e12c5', '40.77.177.122', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1522873385, ''),
('c4530cec0f292d7aee947aba1a6b974a', '40.77.167.82', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1522873380, ''),
('1102d5430e0b444684b10a35f867abf2', '40.77.167.82', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1522873367, ''),
('a9febe88782e7f8e7dca938daefa725b', '180.76.15.16', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522872269, ''),
('8ed69a1fdbf8cd10ec254a1daa92b6a2', '180.76.15.7', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522870270, ''),
('7c321e43b3ba9ecf7de4f0adfec70b11', '180.76.15.161', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522870268, ''),
('baf47152686e582e986a6f95d94c5638', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522869373, ''),
('d16d73dc551d0007c8d8f378153697b1', '188.165.251.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1522868749, ''),
('2f3acde4a4ff0e8e4fb227a02e837593', '46.17.46.246', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1522868546, ''),
('6fc983365ff8ea64b6e9d4ba87410d1d', '169.54.244.82', '', 1522858179, ''),
('28df93d145ecf02a132a29e1ba144a0b', '46.17.46.246', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1522865340, ''),
('b9057ad8d2514e8b5b78845ef9a070c7', '195.154.177.103', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1522844272, ''),
('9e0d67a18296602650d3ac89b554c4b8', '207.46.13.131', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1522838180, ''),
('5af396687960bef7ba5e8cd4b913ba32', '207.46.13.131', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1522838167, ''),
('ce4edfc3d68cd2e852d0e4c52ec355e0', '66.249.66.221', 'Googlebot-Image/1.0', 1522832103, ''),
('4a4253d3fc29e22331be130c027a21f5', '66.249.66.223', 'Googlebot-Image/1.0', 1522832103, ''),
('5b4d02b2de4accbe50b626b68571a5cc', '66.249.66.223', 'Googlebot-Image/1.0', 1522832103, ''),
('b3639e455867c73d6c9344624a7ee000', '66.249.66.219', 'Googlebot-Image/1.0', 1522832103, ''),
('b8e8571ec0a03b5ff07b202adeead0a5', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955395, ''),
('a4b8777476ca8f23f3cfc3f41f02878a', '66.249.66.223', 'Googlebot-Image/1.0', 1522832102, ''),
('c2ab10526bbb81d53b343422d375cea9', '66.249.66.221', 'Googlebot-Image/1.0', 1522832102, ''),
('f889386b144f5bcf383aecf0de4da6cc', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522831872, ''),
('e0a267645532fe580824bde2262c63d8', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522967593, ''),
('f75f628017e1c9ebb9d7e0c5e134d288', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523032088, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('ddd9fcef4d07dad65a7f9e69f505ced6', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955427, 'a:1:{s:11:\"redirect_to\";s:10:\"users/edit\";}'),
('07897a0c105ab36e93f8fc3a7186338f', '148.62.14.156', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1522957210, ''),
('e56346ceb7986b32feb4557a328ac4b9', '148.62.14.156', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1522957211, ''),
('fa5d4642907c0860928e99fb1fdfe19e', '141.8.183.10', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522964074, ''),
('c119ee2e6de94c64bdcc640acfb3a100', '180.76.15.5', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522966231, ''),
('ef40ee07472f24578e65ec11a6c49c02', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955426, ''),
('27f51765df2a66a0cc595e603202720b', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955265, ''),
('2cff28c9b327ab8addac3d40de974caa', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955265, ''),
('69a417d1bfbcf9b88d7e97d74415c3dc', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955297, ''),
('c6aef26d3b9d0156bbf63d3bae51bf7d', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955338, ''),
('b90aa031acd48c01793787e5d742774a', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955338, ''),
('f79ed07ebe9fcefb463b6cb5bf1e9d65', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955386, ''),
('2d42b6b332daf9c018e9d618954f0cb2', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955390, ''),
('7d87815841d2156f91f661d659742014', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955390, '');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('546c95fee3c538ff8a6d22c76bc293ad', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522948450, ''),
('5182500d70d85fd79ecece5231b2f871', '148.62.14.156', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1522951211, ''),
('8d30a6a93a2d189756790d5f3859f8eb', '148.62.14.156', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1522951211, ''),
('c0c9a18eab59fc68f1053880cfa72f5d', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522955570, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('10d7f87681ec1ba26d442b1f70cae7b2', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952671, ''),
('4a4f72c585f6ea2dc9ecdc249c4b9747', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952671, ''),
('efe23608054b2a672a6b186b09c387e6', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952671, ''),
('d1b3b20b6da8de997d4a2a29dd908820', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952671, ''),
('790d5034bea61e6d73633565d07e2b5d', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952746, ''),
('409e45a7e8cd5e207c04d212a2c9fbe0', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952838, ''),
('ee3e039241fa6cb4dc2a2c0f9ed5ed51', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952842, ''),
('79bbb36889832030ff308a062ed390d1', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522952844, ''),
('1076956cba8c923155ea32efe76fdd9c', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522956969, ''),
('77662c99151c6d455178ca9747fddb8e', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522957006, ''),
('62b642a126e17c6544de46a2d8f3d304', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955264, ''),
('c25cfd042525d771f8d13dc45b9f3bf0', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955265, ''),
('9ad21fe8bfee395e633ff1868fb817fa', '59.57.37.8', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36', 1522946795, ''),
('a6c207e3ef2b3d157ddb556267465771', '80.12.38.177', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522927760, ''),
('6be09ad19f9402eac8b3ccc9fc5bc96e', '80.12.38.177', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522927762, ''),
('631cbadc80558a7f5ae9133365a0cd57', '80.12.38.177', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522927762, ''),
('388e0393ef80fd98cafa3d921d6e2f67', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 1522927878, ''),
('c6dd23fc9683bc7243fd97998f192bcc', '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522948395, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('099cc1d8c5eeda15dba012b5be3d82b1', '180.76.15.33', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522935309, ''),
('e2d78f31e8b6305398b6b61f052654d9', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522935674, ''),
('a810dc4f2dfb6d5371f3452a5b2fb4f8', '180.76.15.144', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522937308, ''),
('6d6e5d8b62a0a9c374d6cd46c47e97a2', '180.76.15.19', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522937310, ''),
('2755eb12d05f0c2e6afe49e6315533aa', '151.80.34.185', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522939022, ''),
('6c03c46e4ad3b9fae624b05ec6a50d18', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523051175, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('eaa22d8773d87c89cc0a5b7770ed8e63', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522945456, ''),
('fa3efa0a04835a31c53a5d9d357237fb', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522955394, ''),
('96d14bfa52ac70feb4dd9388b69fa3f7', '80.12.38.177', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522927760, ''),
('5cdf9e462fc334e7309a5d1a7e5ad4ee', '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522927709, ''),
('fcbe76c9f21113fd71de16a21ad2ccd8', '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522927760, ''),
('e4ab5d7a0a5df1d1e31dcbea47c5b75b', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522928296, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('7f344be4fd88ef53a610f38120a25b0e', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523113384, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('81eb566788abfb34cfeb3084aea8c09e', '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522927748, ''),
('b26068d92372cc029d0eb478ee5c7022', '92.184.97.69', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522909024, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('b675bf6fcca8e32de6f9054368eb1119', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522917248, ''),
('77f1d9f33dbba4feeed128c85e70034b', '141.8.142.24', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522920187, ''),
('077106ca9c97605644c2f5b3513d7458', '80.12.38.177', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522923732, ''),
('5fff5eec01da26266e7163193efc5ba3', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522923264, ''),
('3a9f2f64ddff6a1ffc5207909c7cd414', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522923319, ''),
('c3f51f1db79ba749680272988e84a1c2', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523301752, 'a:7:{s:8:\"username\";s:6:\"devops\";s:5:\"email\";s:18:\"devops@nowhere.com\";s:2:\"id\";s:1:\"5\";s:7:\"user_id\";s:1:\"5\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:50:\"<p>Compte utilisateur mis à jour avec succès</p>\";}'),
('aaeaab4532d13d7c26c18eb3420097e3', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522905428, ''),
('3123c7f0a79a56c09b01f99ade24afd5', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522905428, ''),
('fe429da0d56a12dc9d7bd4c8ed15c8a5', '66.249.93.22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522905427, ''),
('ab82f6d710293cbfd1d17375996bbd36', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522905427, ''),
('ec82f5abf26c1e4ad8bece73f97292d5', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522905427, ''),
('68858d5769ab2ba661b57f7ea4f03469', '178.154.171.51', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522905027, ''),
('a80554b6682dcb060af5bdf691e57b02', '124.106.101.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 1522898346, ''),
('937d03849f5f7fcd37ce2c774f5e6bc2', '176.15.20.236', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0; MDDCJS)', 1522897139, ''),
('fbc6524e24d1a1809909883ede5dfadd', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522888587, ''),
('b33c3a4d90b31094ad53bd8782c2a2e5', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522888586, ''),
('d7bb481228f28382c570b58d395081de', '66.249.66.221', 'Googlebot-Image/1.0', 1522884026, ''),
('162b6971f86ddc5af30e91bdb231a510', '66.249.66.219', 'Googlebot-Image/1.0', 1522884035, ''),
('1ed396ab8870433d47f4c603b63785fd', '66.249.66.219', 'Googlebot-Image/1.0', 1522884035, ''),
('327fa8d1d35754ee80ef111ef1e5e905', '66.249.66.219', 'Googlebot-Image/1.0', 1522884036, ''),
('de58671f9af5efa614eb2b1e27f5deb0', '66.249.66.219', 'Googlebot-Image/1.0', 1522884026, ''),
('3777104982e751b3d46bb0b010910066', '66.249.66.221', 'Googlebot-Image/1.0', 1522884026, ''),
('3a9453229d582a04c165afaeed36d365', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522883890, ''),
('7f5a22931a4b510a97edde73eaa26ad3', '66.249.66.219', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522883890, ''),
('3e55759f641fc463b6deed42d73cacaa', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523109478, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('52869e1098c4a3610f17185ccb4dcc2a', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1523093012, ''),
('2f8e36f5886227abe4ed5099358a763b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523116081, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('44357a478e0ca9a5d758735791fb90d1', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523086874, ''),
('3861058ea2c5175b6a71b5c34187f7a2', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1523078591, ''),
('bce351c5e1b1f6f9bbdc756330d7c869', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1523078585, ''),
('46dfb8de02df10154e48bd00b3c05c09', '178.154.200.46', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523076599, ''),
('fb7f39fa4ab1c326aabed719087bb1c0', '95.108.181.102', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523073401, ''),
('f06a1dfbd134c7549941940d3636053b', '141.8.142.55', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523064141, ''),
('3e3eaeb33ae823312f535cf999d60754', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523060331, ''),
('0b4acdaea02cb59566ea4cc6fd00f27e', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523060330, ''),
('bf13765afbde20e0c8ef6a39d7d2b73e', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523060330, ''),
('806061637efbafa4a2a7d64055db02fc', '95.221.50.9', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR ', 1523058050, ''),
('f124f3860bd099372f49d3149bdc516b', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050507, ''),
('09095f9a2044420457b9e1cc5d8d7543', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050506, ''),
('48d9bb956eba1a3cba2c0f82652a85bc', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050460, ''),
('09960c06fe85603f9fa925d685e5e486', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050424, ''),
('1a4c6b8076ba2b09636e6bcb26972320', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050419, ''),
('a49924e0df4e8dea9a6b880ea8a5699c', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050357, ''),
('e768b5a26d3fb52aa6bfc9e501526641', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050239, ''),
('dd8ca581b833b9f27ef2d192fe59a746', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050317, ''),
('2346218ec028b06fafd32c451c322809', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523050724, ''),
('04c8156d4de7360adc5e44f8425dbeb0', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523050356, ''),
('60bc60e1897c7610649fb9cdedbbef7b', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523092301, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('119d979c60f81f21bb502b40d283f1ee', '87.250.224.74', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523047841, ''),
('5ae14451702670da9c9babfc7d44525f', '176.31.224.216', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523046836, ''),
('7faee666405a28bcd3d4ae25123ae0e9', '131.253.25.179', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b', 1523044647, ''),
('380d5a4edfe88ffc2931fff763ee2bf3', '40.77.167.49', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1523044641, ''),
('9837577d37fb0a95e9a5c4c5cbfa82f4', '186.223.126.148', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 1523041188, ''),
('b5297477328b81b7855a112db8f2066c', '40.77.167.49', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1523044631, ''),
('4b384857d131efcea39df9d258bcca9b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523049390, ''),
('487809a2575c2e77281d05624e60863b', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523089288, ''),
('d6cc7c060215a1e20a21a8c3271a0eed', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523040304, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('2d234db42199889f8e010373b49632f5', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523037093, ''),
('a275b923f46175180912a23f829938fc', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523035526, 'a:6:{s:8:\"username\";s:6:\"devops\";s:5:\"email\";s:18:\"devops@nowhere.com\";s:2:\"id\";s:1:\"5\";s:7:\"user_id\";s:1:\"5\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('d393cff68e8fc75ea75789f02d8d144b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523037621, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('d535bc74c2965d126a3876e6dddcace1', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523029137, ''),
('6be5b1617bc9bc671a0667e777ad3bc3', '151.80.34.185', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523019616, ''),
('f00394e55a25701588664e6c9a44701f', '54.218.84.25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko)', 1523019299, ''),
('a5736337655b822da01b5ab1581337d4', '54.218.84.25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko)', 1523019300, ''),
('078355c8313e254e9adfe3490d450562', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523019748, ''),
('7a21fd3ca6faacb24e042272fcf7618d', '54.183.165.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523015657, ''),
('1d14ad7afeeb924951654ec14f45063c', '54.183.165.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523015657, ''),
('14a79de3a45be8c5b57064ff07ded5f8', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523014368, ''),
('a77dfbb6c39f88b34b316060aa6e22a3', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523022880, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('851acf805c53fa62794a767d600a11bb', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523014486, ''),
('df5737904f046e2374d9db3881484419', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523015115, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9cb609cc85c2bfb3b76716176d4a78a0', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523009831, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('fab1b71fbfd3eeb1c1b3763c39014fdc', '80.12.39.139', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523005618, ''),
('84562046b9f92c8e86aed8c026cfec49', '80.12.39.139', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523037108, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('e17e29f06ab7114501f418b10de038e2', '80.12.39.139', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523005617, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('5dbbf1c7b0602d324204fad966da8969', '80.12.39.139', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523005617, ''),
('75f9a3d14ab6eeb12d294ae5b2c00607', '80.12.39.139', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523005617, ''),
('41e5530c7e043a13d847304adb049a03', '80.12.39.139', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.145)', 1523005618, ''),
('6cc9152df28bae5eb44115423016c66b', '66.249.93.45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523000169, ''),
('cb4d6576a82f410841e51b51d7529b55', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523000169, ''),
('b612b051e59add2985cc0f2a5e57888b', '37.9.113.102', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523003171, ''),
('422d14fb159ba5b4cfad29f0a3512088', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523000169, ''),
('c2e8b5f9bd7593d76a88c12c50219cde', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523000169, ''),
('bd9e8d623c9f8d3cad13a6348a71e30b', '207.46.13.158', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1523159541, ''),
('4a86a4ab7d0edbed9634cf62a0f2e9e8', '40.77.179.67', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1523159548, ''),
('0921b5d0166312026d7e2afe1840a230', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523089288, ''),
('3c2da7a05d4051ce5a2364c943342cc8', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523224218, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('73954d14bc6805805c84ee2267ecd2c6', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523323175, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9b1d993a5d82edc98ca9f805593b50c4', '92.184.96.15', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523203203, ''),
('cf262b062e48e331ef4f08b35df19376', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523201520, ''),
('d86b9a39f0988bc72492171f36fed158', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523175404, ''),
('4d779e68244f1fb917b614d2343f184a', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523175404, ''),
('f9239f8ffce6f85294fa9496fe74d6c5', '66.249.93.21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523177647, ''),
('0c67c7cef703928b39392d5362455fdc', '66.249.93.45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523177648, ''),
('1983075bed1bb92a81aaad6d675edff7', '92.184.96.15', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523198680, ''),
('49d7b197b197166e32639d8baaba1a56', '92.184.96.15', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523198777, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('b38da2ab25a8bf5f775f79e8863219fc', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523198871, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:23:\"Votre RDV est confirmé\";}'),
('2baeabb41ad3d5de63bc79799801165f', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523175404, ''),
('d8060d66f523df8c9d990652c64bb0d2', '69.58.178.56', 'Mozilla/5.0 (compatible; ips-agent)', 1523173974, ''),
('78ad19eadc18ab74b3dd448e93b81861', '92.184.96.20', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523179303, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:15:\"flash:old:error\";s:85:\"Vous êtes déjà connecté. S\'il vous plaît déconnectez-vous avant de ré-essayer.\";}'),
('7391bbb43084a18b34e291e5c27ff7fe', '69.58.178.56', 'Mozilla/5.0 (compatible; ips-agent)', 1523173973, ''),
('9126891e50f7766869820c9c807aa2ef', '69.58.178.56', 'Mozilla/5.0 (compatible; ips-agent)', 1523173970, ''),
('fdecf39644f7cdcc6f0fd03f58e2cc8d', '54.188.22.137', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', 1523171327, ''),
('d42fb81e2cb606475ac4f4d0adb02de7', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523169691, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('e3421131922c488c0033f7a057945aad', '92.184.105.155', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523169360, ''),
('e33a017d088de4e7878312145af7e868', '92.184.105.155', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523169412, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('3ac5f91b706be7f4388017dcda04023f', '92.184.105.155', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523169356, ''),
('44436cc392e006cde207b6d3312c4e71', '80.12.33.11', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523138374, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('b8d5478c80d59f76d178d7e6d8f4d985', '37.9.113.176', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523153019, ''),
('e93b74746312e95cbc17078e42b1fa44', '207.46.13.158', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1523159540, ''),
('4753862a59e322ab84104f32e9cd283d', '80.12.33.11', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523138366, ''),
('1bb05df69ccee8f7c94da339d52755c9', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523134356, ''),
('823bf1f455d7ab4f09ebd897b869e0f3', '92.184.97.120', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523133159, ''),
('39c49f952787d3ef138903694bcf054a', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523131295, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('e7b993724678eb9709a0db0e085f8a61', '80.12.34.243', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523128426, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('c6be9614fbe19281545d5185347deef5', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523126045, ''),
('7d519a154c89124d73f867211a988c9d', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523125158, ''),
('8c61a9b8fc8e778dfc51017833299889', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1523125158, ''),
('05ffc0352e06eae37d6adae2fcdd505c', '141.8.183.10', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523099290, ''),
('87e29ef1812c35754fff78422d0bef1f', '178.154.171.51', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523097294, ''),
('e5fa7b99f5164eaa49469914ad0c64a0', '66.249.66.219', 'Googlebot-Image/1.0', 1523096429, ''),
('8993bd04c434437c367f13dff57c1f0e', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523362776, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('27e8afe05d2cff0a32b734efa2cc9bcd', '66.249.66.223', 'Googlebot-Image/1.0', 1523096429, ''),
('6ac145dac8bb725db93f91ebe15ed034', '66.249.66.219', 'Googlebot-Image/1.0', 1523096429, ''),
('8bcecca0aa9a8936b79f5e37f75e8bd1', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523344541, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('b5840180ba459c3e12ed7375b95c64c9', '80.12.43.178', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523344828, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('2d00ae5093e9234c6bfb9c9a8e9f05df', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523362752, 'a:6:{s:8:\"username\";s:13:\"bilbo.higgins\";s:5:\"email\";s:24:\"bilbohiggins@nowhere.com\";s:2:\"id\";s:1:\"8\";s:7:\"user_id\";s:1:\"8\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('f9b2b23fed525c2e5397667ec1b46207', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523341912, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('972b4a154a718e1586c4e73991402230', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523355260, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('f23ebe7f63efa2a14e4704233cf0278d', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523341883, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('8f53ab8124c646c9d0e80efe7308e538', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523341779, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('e3475373e5e2d9a01066a6dcdf108a2a', '176.31.224.216', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523341670, ''),
('4c47929d2f0b036810ee059a792e65fe', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mo', 1523386809, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('05b937a59eb1ea9f88265c24de98d563', '151.80.34.185', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523340247, ''),
('d55a14aae0c1115239203204a9a432bd', '178.154.200.46', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523340526, ''),
('b9bf40b3a95d8584a6852f323c74ad4d', '37.9.113.125', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1523340619, ''),
('230769215e141d4d23b9428b53219c9d', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523383645, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('442dfb122e1f79204f380319e05db943', '54.153.25.186', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.3', 1523340756, ''),
('ccbf19b798bb6b04fb4a67ddee94b8b3', '176.31.224.216', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523336166, ''),
('252403b57515a4b66737a71e57812d17', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334724, ''),
('c1614e4f6dfebeddb02c47044f6d6d63', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523352723, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('227872a927ea5a4b70fa99367790ed0e', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334480, ''),
('bf05507c715c49d75beece1f0853d49e', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334480, ''),
('8a16a9fee0f54030eaeec59cfa8471c7', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334476, ''),
('63501c7b42d85273e673d1f18490ac3b', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334440, 'a:1:{s:11:\"redirect_to\";s:10:\"users/edit\";}'),
('d5c0c7100d86b4503fdb47d8be44673b', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334439, ''),
('69b54641eb5862960943301098ce9512', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334416, ''),
('fc7377c80df92d63b36555d8b0a3ec90', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523334394, ''),
('43762ce7b9f27c1f4002cf7e125080ee', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523331374, ''),
('4ed80cdf1fc07b5db966a9ce35e429e0', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523331374, ''),
('b614706450438b2031e0079a31957aad', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523333102, ''),
('754492eebc0356a58ddb170e5c231087', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523343066, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:50:\"<p>Compte utilisateur mis à jour avec succès</p>\";}'),
('7e865cb085f007c841a11d122470fc94', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523332679, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('81339dcb9b2c284dd31836c62621a6d6', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523328133, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('dc47b2ed2f144fd0f9604bab337a62fd', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523323327, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('5ad910386b28a6d4ff6e871eae2145fe', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523323193, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('864a500343df94ddabd484eb84ef0132', '180.76.15.17', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523320457, ''),
('50d3ff137a46e741915e0ac17f7802bb', '180.76.15.7', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523320455, ''),
('b80894cc12fccbf759682bd9469ed1d2', '66.249.66.221', 'Googlebot-Image/1.0', 1523314812, ''),
('bf82af9cbebbefb30a5476fc6c77580e', '66.249.66.219', 'Googlebot-Image/1.0', 1523314813, ''),
('e51c5b83af1de4c08f02a916b32646da', '66.249.66.223', 'Googlebot-Image/1.0', 1523314812, ''),
('134ffad7cca3e95f537478943cf768e7', '66.249.66.219', 'Googlebot-Image/1.0', 1523314812, ''),
('5b5695955bc2291df6aef91726fa4cad', '66.249.66.219', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1523314542, ''),
('0af005a0a591e363bc3e3aafaa823eb7', '66.249.66.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1523314518, ''),
('9dec9fa54caebd1cec82f77b0c0c1569', '62.210.152.248', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1523377403, ''),
('ab47f12369ef52568f5568575a69b34f', '80.12.34.245', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522772584, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('9c3bd069f8f1fb284eb21df8842288c0', '66.249.66.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1523369385, ''),
('e071b07b888268a8884c9db53fbcbd12', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523374641, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('83e5c45b9387f39f75d61b16c4f6c1a3', '66.249.66.219', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1523370087, ''),
('a8e6ac0b12e200c1ba6de69936989675', '66.249.66.219', 'Googlebot-Image/1.0', 1523369454, ''),
('0b076932807da89596cd469644f1f682', '66.249.66.219', 'Googlebot-Image/1.0', 1523369454, ''),
('719f1813d04e2202105e6da5cab32710', '66.249.66.219', 'Googlebot-Image/1.0', 1523369453, ''),
('9f6b4cb34b7c318fed2f8ce8e9e98d98', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1523370088, ''),
('dd54e093f2db5da1ea0119316c371266', '180.76.15.161', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523372114, ''),
('3e0aa3944b13e15b6b225453b13baba2', '180.76.15.26', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522767172, ''),
('66d19e2be21a79f471ca5c910944d908', '66.249.93.45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522779346, ''),
('b340fb8728d0949016709aef7418b968', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522779347, ''),
('93d218c39e5156d41d53a0e8ba1c96e4', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522787061, ''),
('0e89d5c0def85481d68401126a376b9a', '180.76.15.162', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522821105, ''),
('10aafb85685207757cfa7800fffe7e0f', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522827880, ''),
('28547a6216eda1a5966da339db14c900', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522827880, ''),
('52e20ef988b9f75183c61ef9548faecc', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522827880, ''),
('90c3e444bc4a05abc7a12c5c57488028', '80.12.34.61', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522835946, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('d55163cfeaace9871286e9faf3d98a0c', '66.249.66.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522831818, ''),
('b07590ae69218c36a3c0290d5e578a3e', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522831818, ''),
('fb907a51f463ec8ae5e388fa00c1877c', '66.249.93.47', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434380, ''),
('f47cb7264f9552660d75f0711dd555b5', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434380, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('7ae45f33bb049487e967278162707647', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434380, ''),
('b3af96e9a61b5211c16cfd4c26295c52', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434381, ''),
('bfc06c060c03f9d006fa7cd256417a0a', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523434381, ''),
('24e2e2edb07d4a4c1d4231a2b7223cea', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523435007, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('f7754cdf2af9cf097aa50bbc92b4044a', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523435234, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('d083cb045de26938831705013005c0a6', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523435227, ''),
('a8d2c93297942e9342400f44d9277a10', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523435280, ''),
('a58d92c8a132b384ecf98413d94d843c', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523435351, ''),
('5f4dfb200e500c905405926ca053e02f', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523435537, ''),
('2fdb20f524e2ef2598786664d48da1cf', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523436138, ''),
('78062d86abba93b1ca2da5578e3867a7', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523436469, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('4f701b518ab95d0d16cd76f084ec5958', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523436102, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('656c7f6d6c245efcae1fedf8865943f1', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523449782, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:12:\"Enregistré.\";}'),
('f3af6cbed8f308567c879f4bc1c9cca3', '66.249.93.22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523441873, ''),
('be0bd8824296ff7fb188754d22a922e7', '185.89.129.106', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1523437638, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('2eff84e15b67a921f15301f78c907035', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523436175, ''),
('2579f9ac80f751ab75524245ccb14d68', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523437179, ''),
('16291f163cd6e2c841357be958c90b76', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523437169, ''),
('1e3f3e76748f47ad5c7822691bfdbf87', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523436809, ''),
('dd989844c32fcb9d1697bd8b8c523d40', '158.69.25.178', 'Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)', 1523466894, ''),
('d6ac77fa85e60210af1396b92b2db39a', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523490606, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e3017e9d7854c1874ca42d7f37853a33', '62.4.15.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 1523438380, ''),
('b04d76122a616ff713e19a921d5d2ba0', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523441873, ''),
('793e648fadd0f53c55f4562dfe033f39', '66.249.93.47', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523441874, ''),
('8e6f6082dda604de48cc91dbd9bc22ab', '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523442806, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1058d2c765ddbba391d8efee42291898', '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523442707, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('6b7f8a94d986526c63c8a7b5ba35a439', '80.215.82.76', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523442467, 'a:6:{s:8:\"username\";s:13:\"bilbo.higgins\";s:5:\"email\";s:24:\"bilbohiggins@nowhere.com\";s:2:\"id\";s:1:\"8\";s:7:\"user_id\";s:1:\"8\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('b429e870d8baad58de69bd0e19f3228d', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523447645, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('b4f9d26560f82c0cc785d3091d9155d6', '185.89.129.106', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1523447738, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('07fdd184bca6e6da57c852aa85ebcf42', '185.89.129.106', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1523449919, 'a:1:{s:14:\"admin_redirect\";s:21:\"admin/doctor/edit/183\";}'),
('d902daf9a6ada1542d12674cb3ccfd5c', '80.215.84.74', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1523449945, ''),
('e502f3e5c9ef91c36360e9023f7767c8', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523456208, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('25304bdd6de2b161de6ff3cca059be63', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523453611, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('bbead0e9b08db449c38b0047ed5fd69b', '185.89.129.106', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1523453854, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('01d76dc17597b3188c5fe6fcc62e02a7', '185.89.129.106', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobi', 1523454419, 'a:6:{s:8:\"username\";s:11:\"info.mitcom\";s:5:\"email\";s:17:\"infos@mitcoms.com\";s:2:\"id\";s:2:\"19\";s:7:\"user_id\";s:2:\"19\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('00c0faa3562081d8ab9295819e7c8f31', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523454500, 'a:6:{s:8:\"username\";s:11:\"info.mitcom\";s:5:\"email\";s:17:\"infos@mitcoms.com\";s:2:\"id\";s:2:\"19\";s:7:\"user_id\";s:2:\"19\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('721fe89ce841fbbabfed3542247389e7', '185.89.129.106', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobi', 1523454964, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('36909904e52bf6e2f389215141eb7cf1', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523455681, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('94fcbecc0026afee4434c0d2721a85e7', '83.199.246.67', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523457278, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('bf864138a11c808af780bd99ae369d41', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523460734, ''),
('6d0466490553055e91db826be268d8a1', '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1523461036, ''),
('b50492452bf5e67b31697682e3beae07', '66.249.93.53', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523459101, ''),
('07e41c4cdda09d6aa7d2891bafa757fa', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523460204, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('200a0e4bacc41344237b5ae597cfd44d', '167.114.55.122', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1', 1523466531, ''),
('a8a0a44ad5025ea0bea6c2558edba63f', '180.76.15.135', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1523467785, ''),
('26c92ab0c6da05fde2c178f0f51d0670', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469463, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('3d8dd3e53dfcc06c098405688663ca84', '62.4.15.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 1523468529, ''),
('2cf2ef0a153f00c94bbc1b54010d6d1e', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469102, ''),
('3033faa4f47ce3febfeaca2ab2ee735b', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523468937, ''),
('0be12dc00a7ade61b7842156e6a6bb76', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523468937, ''),
('06133125d1bc37fa3d8b0298ac7b49ce', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523468940, ''),
('dbe38afb6a0ffcf505a9f3cffa71336a', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523468940, ''),
('8c8464764dc37d7fdaf445db71085f3c', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523468941, ''),
('3d3d6b462855e6699bab966263f90237', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523468941, ''),
('7f1cf9fbe86d78043843733392792525', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1523468942, ''),
('07e3325db2f21bcc2ad62ab950fefc4d', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523468942, ''),
('9c07a52457006a512161cd3c65dec6fe', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523468987, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('782ec03a6d9c410b991bf9c69bf1d2ff', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523468987, ''),
('397700a41a7a38f993b71313c277f5bf', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523468987, ''),
('bb10000274534e455b15e91d082e8cdd', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523468988, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('a35af5b053329ab1ea4252f5b696b7f7', '66.249.93.31', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469013, ''),
('53018559d8b1ae67077260277aeaf5aa', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469013, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('e454b986f1c8d4930a7793d903df4e93', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469102, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('72a470c7afc0a4d988dc90399a72187c', '66.249.93.30', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469191, ''),
('86a84f7108b32c55070ca9190ea1f3fa', '66.249.93.2', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469127, ''),
('5745d4e1e892b69361defef8452b543a', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469127, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('1360ff9e74b67f1d797d48e7f55d240b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469192, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('b4feec77255e1324319fa25e276fca23', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469357, ''),
('1ec9d7ebe2dd96f966ebdc0b97587565', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469357, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('1f53cc04ba82253d0c2e0b71a02c7156', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523469454, ''),
('fa951f9eabab092a920e49082a970d42', '66.249.93.30', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469405, ''),
('5b44eb0dd5ec4891c736c302f8557f8a', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469405, ''),
('9f0bf890ffb115a24872271d8fe3bc4b', '66.249.93.31', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469425, ''),
('207d45a3ae52e2971c8a3d42cafb8104', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469442, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('fc1cd3998c0ecfed8197e9809dcfec57', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469442, ''),
('6e410b4211f78ee1ccf32eb6688c4de2', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469442, ''),
('0a072720efb9ca52017b02aa16fd1383', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469442, ''),
('2de6b36133e3f93d88a77c358523a917', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469451, ''),
('9ed085ac032ff29b09c6cd2b780a3b41', '66.249.93.30', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469454, ''),
('93353d4567c1fd4390cdabcc3dcef4ed', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469454, ''),
('11d2fa0c2ce4750de4a0c65ecd5bdf04', '66.249.93.31', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469463, ''),
('9a4499b62189e5067079577922f4232b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469463, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('99036bd54c4b276be73bc5d10bc5373a', '66.249.93.30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523469480, ''),
('880e0ea07c1b9860423b7eb627ab21c7', '66.249.93.2', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523469480, ''),
('f9a4226073311a25310885a2d6138f63', '66.249.93.55', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523469480, ''),
('cbf8f0aa1c296095b7d2b17e8147ff1b', '66.249.93.51', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523469480, ''),
('b7eb5faebdb6cf26c1cb726477e939c1', '66.249.93.22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1523469480, ''),
('ae6e50e2fe618c8564933a938905be8f', '66.249.81.244', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523469480, ''),
('1ccd5167c5dea057e1056e80727118cc', '66.249.81.242', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523469480, ''),
('a186f9911fca9e273fcf18d9998530a9', '66.249.81.244', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523469480, ''),
('b399097b37d03b858d5487582eef792e', '66.249.81.246', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523469480, ''),
('800a501bf32ce12ee2b7b7b67d31bbe8', '66.249.81.250', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1523469480, ''),
('3f2eefcfce55acd6cbbacc5d9e6a1af2', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523469856, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('1ab9de4fbfc31b42895900cdfffce2ea', '66.249.93.31', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469558, ''),
('75e7bf0f6e11adda04fac459a2cddc23', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469558, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:27:\"vanessa.faletti@mitcoms.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('1149047cbce969887c63d9f7417e5eeb', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469596, ''),
('c80dc3e73b29569d2c55d0a61333fdb0', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469596, ''),
('d48016e3a5f3d50a7ac2cce8518651cb', '66.249.93.55', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469832, ''),
('ea86dfde19eab58714e8f90ff2cfcdbf', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1523469833, ''),
('93eeb63f601b443cfa494406dc9d47e6', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523469870, ''),
('33c621cd63f0cb47257702d749c020fd', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523470136, ''),
('1962e10fbe6cfcf4131db7156c39d5fa', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523471335, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:16:\"vfaletti@msn.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('6b56b01aa693bff907848bdd5abf7324', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523470565, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:16:\"vfaletti@msn.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('1574255abd3d6aa533d418758824e7f2', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523471134, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:16:\"vfaletti@msn.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('af5233e2a7fc7bf494cae856112fc63c', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523471486, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:16:\"vfaletti@msn.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('447c41e09eba0fb2bd1e1565ba55923f', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523477363, 'a:7:{s:8:\"username\";s:7:\"Faletti\";s:5:\"email\";s:16:\"vfaletti@msn.com\";s:2:\"id\";s:2:\"20\";s:7:\"user_id\";s:2:\"20\";s:8:\"group_id\";s:1:\"5\";s:5:\"group\";s:10:\"practicien\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('c38a67848a8fdc18ec272ce4c1a703ad', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523471770, 'a:6:{s:8:\"username\";s:11:\"info.mitcom\";s:5:\"email\";s:17:\"infos@mitcoms.com\";s:2:\"id\";s:2:\"19\";s:7:\"user_id\";s:2:\"19\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('967ea3f643ab2199aaa340e665d06651', '104.239.149.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1523473252, ''),
('5b1f2f8c2b141a9afb42e69499b0b630', '104.239.149.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1523473253, ''),
('515e42e3d4a4ff207c85959bed2d7c62', '178.255.80.147', 'Java/1.8.0_111', 1523476565, ''),
('6ff1a3ad07f7e0a3b0c334099ecb4810', '178.255.80.147', 'Java/1.8.0_111', 1523476566, ''),
('2915d66bfefaf2305eeacce34696c041', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523476928, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9a925e966c1723bcbf6f4e83d142670c', '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1523477037, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('40b713bd6dd1daa1b194d703745c9efb', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523482428, 'a:6:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('9226a7a18e6becb45b17c7aa581676af', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523480189, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('3b0794317bb21a0f492e273593169d07', '104.239.149.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1523483402, ''),
('8f2b53889d3fa8bfc4b4e1fd2942e955', '104.239.149.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 1523483402, ''),
('76d243737640351384bf6f1d27256cfe', '151.80.34.185', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1523491011, '');

-- --------------------------------------------------------

--
-- Structure de la table `default_comments`
--

DROP TABLE IF EXISTS `default_comments`;
CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL,
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
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_comment_blacklists`
--

DROP TABLE IF EXISTS `default_comment_blacklists`;
CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_contact_log`
--

DROP TABLE IF EXISTS `default_contact_log`;
CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_data_fields`
--

DROP TABLE IF EXISTS `default_data_fields`;
CREATE TABLE `default_data_fields` (
  `id` int(11) UNSIGNED NOT NULL,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_data_fields`
--

INSERT INTO `default_data_fields` (`id`, `field_name`, `field_slug`, `field_namespace`, `field_type`, `field_data`, `view_options`, `is_locked`) VALUES
(1, 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a363a2273696d706c65223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(2, 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a383a22616476616e636564223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(3, 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(4, 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(20, 'Ville', 'town', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(19, 'Informations personelles', 'personal_info', 'users', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b733a303a22223b733a31303a22616c6c6f775f74616773223b733a313a226e223b733a31323a22636f6e74656e745f74797065223b733a343a2274657874223b7d, NULL, 'no'),
(8, 'lang:profile_dob', 'birth_date', 'users', 'date', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(23, 'Civilité', 'gender', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a32373a22686f6d6d65203a20486f6d6d650a66656d6d65203a2046656d6d65223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a303a22223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(10, 'lang:profile_phone', 'phone', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a323a223230223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(11, 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a323a223230223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(12, 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(13, 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(21, 'Quartier', 'area_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(15, 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(571, 'phone check token', 'phone_check_token', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(22, 'Mutuelle', 'insurance', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a31393a226f7569203a204f75690a6e6f6e203a204e6f6e223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a303a22223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(24, 'Médecin habituel', 'usual_doctor_id', 'users', 'integer', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a313a2230223b7d, NULL, 'no'),
(25, 'pre html', 'pre_html', 'pages', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b733a303a22223b733a31303a22616c6c6f775f74616773223b733a313a2279223b733a31323a22636f6e74656e745f74797065223b733a343a2268746d6c223b7d, NULL, 'no'),
(26, 'post html', 'post_html', 'pages', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b733a303a22223b733a31303a22616c6c6f775f74616773223b733a313a2279223b733a31323a22636f6e74656e745f74797065223b733a343a2268746d6c223b7d, NULL, 'no'),
(506, 'Bureau', 'desk_no', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(663, 'Spécialité médicale', 'speciality', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(505, 'Phone valid', 'phone_valid', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a31383a22796573203a204f75690a6e6f203a204e6f6e223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a323a226e6f223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(662, 'Catégorie', 'doctor_cat', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a39353b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(661, 'Image docteur', 'image', 'doctor', 'image', 0x613a353a7b733a363a22666f6c646572223b693a33363b733a31323a22726573697a655f7769647468223b4e3b733a31333a22726573697a655f686569676874223b4e3b733a31303a226b6565705f726174696f223b4e3b733a31333a22616c6c6f7765645f7479706573223b4e3b7d, NULL, 'no'),
(658, 'Visites à domicile', 'homecall', 'doctor', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b4e3b733a31313a2263686f6963655f74797065223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(660, 'Longitude', 'longitude', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a333b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(659, 'Latitude', 'latitude', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a333b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(657, 'Mutuelle', 'insurance', 'doctor', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a38313a22796573203a206c616e673a676c6f62616c3a7965730a202020202020202020202020202020202020202020202020202020202020202020202020202020206e6f203a206c616e673a676c6f62616c3a6e6f223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a323a226e6f223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(656, 'Moyens de paiement', 'payment', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(655, 'Tarifs et mutuelle', 'fees', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(648, 'Quartier', 'area_name', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(649, 'Commune', 'district', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(650, 'Ville', 'town', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(651, 'Description', 'description', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(652, 'Informations d\'accès', 'access', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(653, 'Langues parlées', 'languages', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(654, 'Formation', 'diploma', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(507, 'Etage', 'floor', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(568, 'Commune', 'district', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(569, 'Nom de jeune fille', 'maiden_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(647, 'Adresse', 'address', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(646, 'Email', 'email', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3136303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(645, 'Mobile', 'mobile', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(644, 'Téléphone', 'telephone', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(643, 'Civilité', 'gender', 'doctor', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a31323a22486f6d6d650a0d46656d6d65223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a303a22223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(642, 'Fin de vacance', 'vacation_end', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(640, 'Paramètres semaine', 'week_settings', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(641, 'Début de vacance', 'vacation_start', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(639, 'Jours ouverts', 'days', 'doctor', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a3331393a2231203a206c756e64690a2020202020202020202020202020202020202020202020202020202020202020202020202020202032203a206d617264690a2020202020202020202020202020202020202020202020202020202020202020202020202020202033203a206d657263726564690a2020202020202020202020202020202020202020202020202020202020202020202020202020202034203a206a657564690a2020202020202020202020202020202020202020202020202020202020202020202020202020202035203a2076656e64726564690a2020202020202020202020202020202020202020202020202020202020202020202020202020202036203a2073616d6564690a2020202020202020202020202020202020202020202020202020202020202020202020202020202037203a2064696d616e636865223b733a31313a2263686f6963655f74797065223b733a31303a22636865636b626f786573223b733a31333a2264656661756c745f76616c7565223b733a31333a22310a0d320a0d330a0d340a0d35223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(637, 'Nom du practicien', 'name', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(638, 'RNGPS', 'rngps', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31313b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(636, 'Practicien validé', 'validated', 'doctor', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a38313a22796573203a206c616e673a676c6f62616c3a7965730a202020202020202020202020202020202020202020202020202020202020202020202020202020206e6f203a206c616e673a676c6f62616c3a6e6f223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a323a226e6f223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(664, 'Image catégorie', 'doc_cat_image', 'doctor', 'image', 0x613a353a7b733a363a22666f6c646572223b693a33363b733a31323a22726573697a655f7769647468223b4e3b733a31333a22726573697a655f686569676874223b4e3b733a31303a226b6565705f726174696f223b4e3b733a31333a22616c6c6f7765645f7479706573223b4e3b7d, NULL, 'no'),
(665, 'Catégorie parente', 'parent_cat', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a39353b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(666, 'Organisme ou groupe', 'groupe', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a39363b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(667, 'Structure', 'organisation', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a39363b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(668, 'Etablissement', 'subset', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(669, 'pro settings', 'settings_pro', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a37343a226170706f696e74656d656e7473203a205244560a666c616773203a20416c65727465730a6d65737361676573203a204d657373616765730a6c697374696e67203a2050617469656e7473223b733a31313a2263686f6963655f74797065223b733a31303a22636865636b626f786573223b733a31333a2264656661756c745f76616c7565223b733a31333a226170706f696e74656d656e7473223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(670, 'abonnement pro', 'subscription_pro', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a31383a22796573203a204f75690a6e6f203a204e6f6e223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a323a226e6f223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(671, 'abonnnement patients', 'subscription_patients', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a31383a22796573203a204f75690a6e6f203a204e6f6e223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a323a226e6f223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(672, 'doctor id', 'doctor_id', 'users', 'integer', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a313a2230223b7d, NULL, 'no');

-- --------------------------------------------------------

--
-- Structure de la table `default_data_field_assignments`
--

DROP TABLE IF EXISTS `default_data_field_assignments`;
CREATE TABLE `default_data_field_assignments` (
  `id` int(11) UNSIGNED NOT NULL,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_data_field_assignments`
--

INSERT INTO `default_data_field_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `is_required`, `is_unique`, `instructions`, `field_name`) VALUES
(1, 1, 1, 1, 'yes', 'no', NULL, NULL),
(2, 2, 2, 2, 'no', 'no', NULL, NULL),
(3, 1, 3, 3, 'yes', 'no', NULL, NULL),
(4, 1, 3, 4, 'yes', 'no', NULL, NULL),
(19, 15, 3, 19, 'no', 'no', 'Vos informations médicales', NULL),
(8, 2, 3, 8, 'yes', 'no', 'Date de naissance.', NULL),
(23, 1, 3, 23, 'yes', 'no', 'Vous êtes un homme ou une femme?', NULL),
(10, 4, 3, 10, 'no', 'no', 'Votre numéro de téléphone fixe', NULL),
(11, 5, 3, 11, 'yes', 'no', 'Votre numéro de téléphone portable', NULL),
(12, 6, 3, 12, 'no', 'no', 'Adresse ligne 1', NULL),
(13, 7, 3, 13, 'no', 'no', 'Adresse ligne 2', NULL),
(20, 10, 3, 20, 'no', 'no', 'Votre ville ou village de résidence', NULL),
(15, 16, 3, 15, 'no', 'no', NULL, NULL),
(568, 18, 3, 571, 'no', 'no', '', NULL),
(21, 8, 3, 21, 'no', 'no', 'Votre quartier de résidence si applicable', NULL),
(22, 11, 3, 22, 'no', 'no', 'Votre mutuelle d\'assurance', NULL),
(24, 14, 3, 24, 'no', 'no', 'Si vous connaissez le numéro identifiant de votre médecin, vous pouvez le renseigner ici.', NULL),
(25, 1, 2, 25, 'no', 'no', '', NULL),
(26, 2, 2, 26, 'no', 'no', '', NULL),
(502, 17, 3, 505, 'no', 'no', '', NULL),
(663, 28, 94, 666, 'no', 'no', NULL, NULL),
(662, 3, 95, 665, 'no', 'no', NULL, NULL),
(661, 2, 95, 664, 'no', 'no', NULL, NULL),
(660, 1, 95, 663, 'yes', 'yes', NULL, NULL),
(659, 27, 94, 662, 'no', 'no', NULL, NULL),
(658, 26, 94, 661, 'no', 'no', NULL, NULL),
(657, 25, 94, 660, 'no', 'no', NULL, NULL),
(656, 24, 94, 659, 'no', 'no', NULL, NULL),
(655, 23, 94, 658, 'no', 'no', NULL, NULL),
(654, 22, 94, 657, 'no', 'no', NULL, NULL),
(653, 21, 94, 656, 'no', 'no', NULL, NULL),
(652, 20, 94, 655, 'no', 'no', NULL, NULL),
(651, 19, 94, 654, 'no', 'no', NULL, NULL),
(650, 18, 94, 653, 'no', 'no', NULL, NULL),
(649, 17, 94, 652, 'no', 'no', NULL, NULL),
(648, 16, 94, 651, 'no', 'no', NULL, NULL),
(647, 15, 94, 650, 'no', 'no', NULL, NULL),
(646, 14, 94, 649, 'no', 'no', NULL, NULL),
(503, 12, 3, 506, 'no', 'no', 'Numéro de bureau ou instructitons d\'accès', NULL),
(504, 13, 3, 507, 'no', 'no', '', NULL),
(565, 9, 3, 568, 'no', 'no', '', NULL),
(566, 3, 3, 569, 'no', 'no', '', NULL),
(645, 13, 94, 648, 'no', 'no', NULL, NULL),
(644, 12, 94, 647, 'no', 'no', NULL, NULL),
(643, 11, 94, 646, 'no', 'no', NULL, NULL),
(642, 10, 94, 645, 'no', 'no', NULL, NULL),
(641, 9, 94, 644, 'no', 'no', NULL, NULL),
(640, 8, 94, 643, 'no', 'no', NULL, NULL),
(639, 7, 94, 642, 'no', 'no', NULL, NULL),
(638, 6, 94, 641, 'no', 'no', NULL, NULL),
(634, 2, 94, 637, 'yes', 'no', NULL, NULL),
(637, 5, 94, 640, 'no', 'no', NULL, NULL),
(636, 4, 94, 639, 'yes', 'no', NULL, NULL),
(635, 3, 94, 638, 'no', 'no', NULL, NULL),
(633, 1, 94, 636, 'yes', 'no', NULL, NULL),
(664, 1, 96, 667, 'no', 'no', NULL, NULL),
(665, 2, 96, 668, 'yes', 'yes', NULL, NULL),
(666, 19, 3, 669, 'no', 'no', 'Settings configuration for professional interface home', NULL),
(667, 20, 3, 670, 'no', 'no', '', NULL),
(668, 21, 3, 671, 'no', 'no', '', NULL),
(669, 22, 3, 672, 'no', 'no', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_data_streams`
--

DROP TABLE IF EXISTS `default_data_streams`;
CREATE TABLE `default_data_streams` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_data_streams`
--

INSERT INTO `default_data_streams` (`id`, `stream_name`, `stream_slug`, `stream_namespace`, `stream_prefix`, `about`, `view_options`, `title_column`, `sorting`, `permissions`, `is_hidden`, `menu_path`) VALUES
(1, 'lang:blog:blog_title', 'blog', 'blogs', NULL, NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(2, 'Default', 'def_page_fields', 'pages', NULL, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(3, 'lang:user_profile_fields_label', 'profiles', 'users', NULL, 'Profiles for users module', 0x613a313a7b693a303b733a31323a22646973706c61795f6e616d65223b7d, 'display_name', 'title', NULL, 'no', NULL),
(95, 'lang:doctor:categories', 'categories', 'doctor', 'doctor_', NULL, 0x613a323a7b693a303b733a31303a22706172656e745f636174223b693a313b733a31303a227370656369616c697479223b7d, 'speciality', 'title', NULL, 'no', NULL),
(96, 'lang:doctor:organisations', 'organisations', 'doctor', 'doctor_', NULL, 0x613a323a7b693a303b733a31323a226f7267616e69736174696f6e223b693a313b733a363a22737562736574223b7d, 'subset', 'title', NULL, 'no', NULL),
(94, 'lang:doctor:doctors', 'doctors', 'doctor', 'doctor_', NULL, 0x613a343a7b693a303b733a343a2264617973223b693a313b733a31313a226465736372697074696f6e223b693a323b733a363a2267726f757065223b693a333b733a31303a22646f63746f725f636174223b7d, NULL, 'title', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_def_page_fields`
--

DROP TABLE IF EXISTS `default_def_page_fields`;
CREATE TABLE `default_def_page_fields` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `pre_html` longtext COLLATE utf8_unicode_ci,
  `post_html` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_def_page_fields`
--

INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`, `pre_html`, `post_html`) VALUES
(2, '2017-05-18 13:39:28', '2017-05-18 15:24:16', 1, NULL, '<p>{{ contact:form name=&quot;text|required&quot; email=&quot;text|required|valid_email&quot; subject=&quot;dropdown|Rendez-vous|Question|Autre&quot; message=&quot;textarea&quot; }}</p>\r\n\r\n<div><label for=\"name\">Nom:</label>{{ name }}</div>\r\n\r\n<div><label for=\"email\">Email:</label>{{ email }}</div>\r\n\r\n<div><label for=\"subject\">Sujet:</label>{{ subject }}</div>\r\n\r\n<div><label for=\"message\">Message:</label>{{ message }}</div>\r\n{{ /contact:form }}', NULL, NULL),
(3, '2017-05-18 13:39:28', NULL, 1, NULL, '{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}', NULL, NULL),
(4, '2017-05-18 13:39:28', NULL, 1, NULL, '{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for \"{{ query }}\".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href=\"{{ url }}\">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}', NULL, NULL),
(5, '2017-05-18 13:39:28', NULL, 1, NULL, '<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>', NULL, NULL);
INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`, `pre_html`, `post_html`) VALUES
(13, '2018-03-09 23:22:20', '2018-03-10 00:04:09', 1, 1, NULL, '<div class=\"container\">\r\n\r\n      <div class=\"page-header\" id=\"banner\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-8 col-md-7 col-sm-6\">\r\n            <h1>Flatly</h1>\r\n            <p class=\"lead\">Flat and modern</p>\r\n          </div>\r\n          <div class=\"col-lg-4 col-md-5 col-sm-6\">\r\n            <div class=\"sponsor\">\r\n              <script async=\"\" type=\"text/javascript\" src=\"//cdn.carbonads.com/carbon.js?zoneid=1673&amp;serve=C6AILKT&amp;placement=bootswatchcom\" id=\"_carbonads_js\"></script><div id=\"carbonads\"><span><span class=\"carbon-wrap\"><a href=\"//srv.carbonads.net/ads/click/x/GTND423YCY7I4237CYS4YKQWFTSDCK7LCYAD5Z3JCEADKKJUCTAI42QKC6BDE2JIC6BDTK3EHJNCLSIZ?segment=placement:bootswatchcom;\" class=\"carbon-img\" target=\"_blank\"><img src=\"//assets.servedby-buysellads.com/p/manage/asset/id/35636\" alt=\"\" border=\"0\" height=\"100\" width=\"130\" style=\"max-width: 130px;\"></a><a href=\"//srv.carbonads.net/ads/click/x/GTND423YCY7I4237CYS4YKQWFTSDCK7LCYAD5Z3JCEADKKJUCTAI42QKC6BDE2JIC6BDTK3EHJNCLSIZ?segment=placement:bootswatchcom;\" class=\"carbon-text\" target=\"_blank\">Segment is the last integration you will need.</a></span><a href=\"http://carbonads.net/\" class=\"carbon-poweredby\" target=\"_blank\">ads via Carbon</a></span></div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-3 col-md-3 col-sm-4\">\r\n            <div class=\"list-group table-of-contents\">\r\n              <a class=\"list-group-item\" href=\"#navbar\">Navbar</a>\r\n              <a class=\"list-group-item\" href=\"#buttons\">Buttons</a>\r\n              <a class=\"list-group-item\" href=\"#typography\">Typography</a>\r\n              <a class=\"list-group-item\" href=\"#tables\">Tables</a>\r\n              <a class=\"list-group-item\" href=\"#forms\">Forms</a>\r\n              <a class=\"list-group-item\" href=\"#navs\">Navs</a>\r\n              <a class=\"list-group-item\" href=\"#indicators\">Indicators</a>\r\n              <a class=\"list-group-item\" href=\"#progress-bars\">Progress bars</a>\r\n              <a class=\"list-group-item\" href=\"#containers\">Containers</a>\r\n              <a class=\"list-group-item\" href=\"#dialogs\">Dialogs</a>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Navbar\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section clearfix\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"navbar\">Navbar</h1>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <nav class=\"navbar navbar-default\">\r\n                <div class=\"container-fluid\">\r\n                  <div class=\"navbar-header\">\r\n                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n                      <span class=\"sr-only\">Toggle navigation</span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                    </button>\r\n                    <a class=\"navbar-brand\" href=\"#\">Brand</a>\r\n                  </div>\r\n\r\n                  <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n                    <ul class=\"nav navbar-nav\">\r\n                      <li class=\"active\"><a href=\"#\">Link <span class=\"sr-only\">(current)</span></a></li>\r\n                      <li><a href=\"#\">Link</a></li>\r\n                      <li class=\"dropdown\">\r\n                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></a>\r\n                        <ul class=\"dropdown-menu\" role=\"menu\">\r\n                          <li><a href=\"#\">Action</a></li>\r\n                          <li><a href=\"#\">Another action</a></li>\r\n                          <li><a href=\"#\">Something else here</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">Separated link</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">One more separated link</a></li>\r\n                        </ul>\r\n                      </li>\r\n                    </ul>\r\n                    <form class=\"navbar-form navbar-left\" role=\"search\">\r\n                      <div class=\"form-group\">\r\n                        <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n                      </div>\r\n                      <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n                    </form>\r\n                    <ul class=\"nav navbar-nav navbar-right\">\r\n                      <li><a href=\"#\">Link</a></li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </nav>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <nav class=\"navbar navbar-inverse\">\r\n                <div class=\"container-fluid\">\r\n                  <div class=\"navbar-header\">\r\n                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-2\">\r\n                      <span class=\"sr-only\">Toggle navigation</span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                    </button>\r\n                    <a class=\"navbar-brand\" href=\"#\">Brand</a>\r\n                  </div>\r\n\r\n                  <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-2\">\r\n                    <ul class=\"nav navbar-nav\">\r\n                      <li class=\"active\"><a href=\"#\">Link <span class=\"sr-only\">(current)</span></a></li>\r\n                      <li><a href=\"#\">Link</a></li>\r\n                      <li class=\"dropdown\">\r\n                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></a>\r\n                        <ul class=\"dropdown-menu\" role=\"menu\">\r\n                          <li><a href=\"#\">Action</a></li>\r\n                          <li><a href=\"#\">Another action</a></li>\r\n                          <li><a href=\"#\">Something else here</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">Separated link</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">One more separated link</a></li>\r\n                        </ul>\r\n                      </li>\r\n                    </ul>\r\n                    <form class=\"navbar-form navbar-left\" role=\"search\">\r\n                      <div class=\"form-group\">\r\n                        <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n                      </div>\r\n                      <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n                    </form>\r\n                    <ul class=\"nav navbar-nav navbar-right\">\r\n                      <li><a href=\"#\">Link</a></li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </nav>\r\n            </div><!-- /example -->\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n\r\n      <!-- Buttons\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"page-header\">\r\n          <div class=\"row\">\r\n            <div class=\"col-lg-12\">\r\n              <h1 id=\"buttons\">Buttons</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-7\">\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default\">Default</a>\r\n              <a href=\"#\" class=\"btn btn-primary\">Primary</a>\r\n              <a href=\"#\" class=\"btn btn-success\">Success</a>\r\n              <a href=\"#\" class=\"btn btn-info\">Info</a>\r\n              <a href=\"#\" class=\"btn btn-warning\">Warning</a>\r\n              <a href=\"#\" class=\"btn btn-danger\">Danger</a>\r\n              <a href=\"#\" class=\"btn btn-link\">Link</a>\r\n            </p>\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default disabled\">Default</a>\r\n              <a href=\"#\" class=\"btn btn-primary disabled\">Primary</a>\r\n              <a href=\"#\" class=\"btn btn-success disabled\">Success</a>\r\n              <a href=\"#\" class=\"btn btn-info disabled\">Info</a>\r\n              <a href=\"#\" class=\"btn btn-warning disabled\">Warning</a>\r\n              <a href=\"#\" class=\"btn btn-danger disabled\">Danger</a>\r\n              <a href=\"#\" class=\"btn btn-link disabled\">Link</a>\r\n            </p>\r\n\r\n\r\n            <div style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-toolbar bs-component\" style=\"margin: 0;\">\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">Default</a>\r\n                  <a href=\"#\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-primary\">Primary</a>\r\n                  <a href=\"#\" class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-success\">Success</a>\r\n                  <a href=\"#\" class=\"btn btn-success dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-info\">Info</a>\r\n                  <a href=\"#\" class=\"btn btn-info dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-warning\">Warning</a>\r\n                  <a href=\"#\" class=\"btn btn-warning dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n              </div>\r\n            </div>\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-primary btn-lg\">Large button</a>\r\n              <a href=\"#\" class=\"btn btn-primary\">Default button</a>\r\n              <a href=\"#\" class=\"btn btn-primary btn-sm\">Small button</a>\r\n              <a href=\"#\" class=\"btn btn-primary btn-xs\">Mini button</a>\r\n            </p>\r\n\r\n          </div>\r\n          <div class=\"col-lg-5\">\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default btn-lg btn-block\">Block level button</a>\r\n            </p>\r\n\r\n\r\n            <div class=\"bs-component\" style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-group btn-group-justified\">\r\n                <a href=\"#\" class=\"btn btn-default\">Left</a>\r\n                <a href=\"#\" class=\"btn btn-default\">Middle</a>\r\n                <a href=\"#\" class=\"btn btn-default\">Right</a>\r\n              </div>\r\n            </div>\r\n\r\n            <div class=\"bs-component\" style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-toolbar\">\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">1</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">2</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">3</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">4</a>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">5</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">6</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">7</a>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">8</a>\r\n                  <div class=\"btn-group\">\r\n                    <a href=\"#\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\">\r\n                      Dropdown\r\n                      <span class=\"caret\"></span>\r\n                    </a>\r\n                    <ul class=\"dropdown-menu\">\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                     </ul>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <div class=\"btn-group-vertical\">\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n              </div>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Typography\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"typography\">Typography</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <!-- Headings -->\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h1>Heading 1</h1>\r\n              <h2>Heading 2</h2>\r\n              <h3>Heading 3</h3>\r\n              <h4>Heading 4</h4>\r\n              <h5>Heading 5</h5>\r\n              <h6>Heading 6</h6>\r\n              <p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h2>Example body text</h2>\r\n              <p>Nullam quis risus eget <a href=\"#\">urna mollis ornare</a> vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>\r\n              <p><small>This line of text is meant to be treated as fine print.</small></p>\r\n              <p>The following snippet of text is <strong>rendered as bold text</strong>.</p>\r\n              <p>The following snippet of text is <em>rendered as italicized text</em>.</p>\r\n              <p>An abbreviation of the word attribute is <abbr title=\"attribute\">attr</abbr>.</p>\r\n            </div>\r\n\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h2>Emphasis classes</h2>\r\n              <p class=\"text-muted\">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</p>\r\n              <p class=\"text-primary\">Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\r\n              <p class=\"text-warning\">Etiam porta sem malesuada magna mollis euismod.</p>\r\n              <p class=\"text-danger\">Donec ullamcorper nulla non metus auctor fringilla.</p>\r\n              <p class=\"text-success\">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>\r\n              <p class=\"text-info\">Maecenas sed diam eget risus varius blandit sit amet non magna.</p>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n        <!-- Blockquotes -->\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2 id=\"type-blockquotes\">Blockquotes</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"bs-component\">\r\n              <blockquote>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n                <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n              </blockquote>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"bs-component\">\r\n              <blockquote class=\"blockquote-reverse\">\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n                <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n              </blockquote>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Tables\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"tables\">Tables</h1>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <table class=\"table table-striped table-hover \">\r\n                <thead>\r\n                  <tr>\r\n                    <th>#</th>\r\n                    <th>Column heading</th>\r\n                    <th>Column heading</th>\r\n                    <th>Column heading</th>\r\n                  </tr>\r\n                </thead>\r\n                <tbody>\r\n                  <tr>\r\n                    <td>1</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr>\r\n                    <td>2</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"info\">\r\n                    <td>3</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"success\">\r\n                    <td>4</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"danger\">\r\n                    <td>5</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"warning\">\r\n                    <td>6</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"active\">\r\n                    <td>7</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                </tbody>\r\n              </table> \r\n            </div><!-- /example -->\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Forms\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"forms\">Forms</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"well bs-component\">\r\n              <form class=\"form-horizontal\">\r\n                <fieldset>\r\n                  <legend>Legend</legend>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"inputEmail\" class=\"col-lg-2 control-label\">Email</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <input type=\"text\" class=\"form-control\" id=\"inputEmail\" placeholder=\"Email\">\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"inputPassword\" class=\"col-lg-2 control-label\">Password</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <input type=\"password\" class=\"form-control\" id=\"inputPassword\" placeholder=\"Password\">\r\n                      <div class=\"checkbox\">\r\n                        <label>\r\n                          <input type=\"checkbox\"> Checkbox\r\n                        </label>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"textArea\" class=\"col-lg-2 control-label\">Textarea</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <textarea class=\"form-control\" rows=\"3\" id=\"textArea\"></textarea>\r\n                      <span class=\"help-block\">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label class=\"col-lg-2 control-label\">Radios</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <div class=\"radio\">\r\n                        <label>\r\n                          <input type=\"radio\" name=\"optionsRadios\" id=\"optionsRadios1\" value=\"option1\" checked=\"\">\r\n                          Option one is this\r\n                        </label>\r\n                      </div>\r\n                      <div class=\"radio\">\r\n                        <label>\r\n                          <input type=\"radio\" name=\"optionsRadios\" id=\"optionsRadios2\" value=\"option2\">\r\n                          Option two can be something else\r\n                        </label>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"select\" class=\"col-lg-2 control-label\">Selects</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <select class=\"form-control\" id=\"select\">\r\n                        <option>1</option>\r\n                        <option>2</option>\r\n                        <option>3</option>\r\n                        <option>4</option>\r\n                        <option>5</option>\r\n                      </select>\r\n                      <br>\r\n                      <select multiple=\"\" class=\"form-control\">\r\n                        <option>1</option>\r\n                        <option>2</option>\r\n                        <option>3</option>\r\n                        <option>4</option>\r\n                        <option>5</option>\r\n                      </select>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <div class=\"col-lg-10 col-lg-offset-2\">\r\n                      <button type=\"reset\" class=\"btn btn-default\">Cancel</button>\r\n                      <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\r\n                    </div>\r\n                  </div>\r\n                </fieldset>\r\n              </form>\r\n            <div id=\"source-button\" class=\"btn btn-primary btn-xs\" style=\"display: none;\">&lt; &gt;</div></div>\r\n          </div>\r\n          <div class=\"col-lg-4 col-lg-offset-1\">\r\n\r\n              <form class=\"bs-component\">\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"focusedInput\">Focused input</label>\r\n                  <input class=\"form-control\" id=\"focusedInput\" type=\"text\" value=\"This is focused...\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"disabledInput\">Disabled input</label>\r\n                  <input class=\"form-control\" id=\"disabledInput\" type=\"text\" placeholder=\"Disabled input here...\" disabled=\"\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-warning\">\r\n                  <label class=\"control-label\" for=\"inputWarning\">Input warning</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputWarning\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-error\">\r\n                  <label class=\"control-label\" for=\"inputError\">Input error</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputError\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-success\">\r\n                  <label class=\"control-label\" for=\"inputSuccess\">Input success</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputSuccess\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputLarge\">Large input</label>\r\n                  <input class=\"form-control input-lg\" type=\"text\" id=\"inputLarge\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputDefault\">Default input</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputDefault\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputSmall\">Small input</label>\r\n                  <input class=\"form-control input-sm\" type=\"text\" id=\"inputSmall\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\">Input addons</label>\r\n                  <div class=\"input-group\">\r\n                    <span class=\"input-group-addon\">$</span>\r\n                    <input type=\"text\" class=\"form-control\">\r\n                    <span class=\"input-group-btn\">\r\n                      <button class=\"btn btn-default\" type=\"button\">Button</button>\r\n                    </span>\r\n                  </div>\r\n                </div>\r\n              </form>\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Navs\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"navs\">Navs</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-tabs\">Tabs</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-tabs\">\r\n                <li class=\"\"><a href=\"#home\" data-toggle=\"tab\" aria-expanded=\"false\">Home</a></li>\r\n                <li class=\"active\"><a href=\"#profile\" data-toggle=\"tab\" aria-expanded=\"true\">Profile</a></li>\r\n                <li class=\"disabled\"><a>Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#dropdown1\" data-toggle=\"tab\">Action</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#dropdown2\" data-toggle=\"tab\">Another action</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n              <div id=\"myTabContent\" class=\"tab-content\">\r\n                <div class=\"tab-pane fade\" id=\"home\">\r\n                  <p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade active in\" id=\"profile\">\r\n                  <p>Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade\" id=\"dropdown1\">\r\n                  <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney\'s organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade\" id=\"dropdown2\">\r\n                  <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-pills\">Pills</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills\">\r\n                <li class=\"active\"><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Profile</a></li>\r\n                <li class=\"disabled\"><a href=\"#\">Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n            <br>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills nav-stacked\">\r\n                <li class=\"active\"><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Profile</a></li>\r\n                <li class=\"disabled\"><a href=\"#\">Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-breadcrumbs\">Breadcrumbs</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"breadcrumb\">\r\n                <li class=\"active\">Home</li>\r\n              </ul>\r\n\r\n              <ul class=\"breadcrumb\">\r\n                <li><a href=\"#\">Home</a></li>\r\n                <li class=\"active\">Library</li>\r\n              </ul>\r\n\r\n              <ul class=\"breadcrumb\">\r\n                <li><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Library</a></li>\r\n                <li class=\"active\">Data</li>\r\n              </ul>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"pagination\">Pagination</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"pagination\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">4</a></li>\r\n                <li><a href=\"#\">5</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pagination pagination-lg\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pagination pagination-sm\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">4</a></li>\r\n                <li><a href=\"#\">5</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"pager\">Pager</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"pager\">\r\n                <li><a href=\"#\">Previous</a></li>\r\n                <li><a href=\"#\">Next</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pager\">\r\n                <li class=\"previous disabled\"><a href=\"#\">← Older</a></li>\r\n                <li class=\"next\"><a href=\"#\">Newer →</a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Indicators\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"indicators\">Indicators</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Alerts</h2>\r\n            <div class=\"bs-component\">\r\n              <div class=\"alert alert-dismissible alert-warning\">\r\n                <button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>\r\n                <h4>Warning!</h4>\r\n                <p>Best check yo self, you\'re not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, <a href=\"#\" class=\"alert-link\">vel scelerisque nisl consectetur et</a>.</p>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2>Labels</h2>\r\n            <div class=\"bs-component\" style=\"margin-bottom: 40px;\">\r\n              <span class=\"label label-default\">Default</span>\r\n              <span class=\"label label-primary\">Primary</span>\r\n              <span class=\"label label-success\">Success</span>\r\n              <span class=\"label label-warning\">Warning</span>\r\n              <span class=\"label label-danger\">Danger</span>\r\n              <span class=\"label label-info\">Info</span>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2>Badges</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills\">\r\n                <li class=\"active\"><a href=\"#\">Home <span class=\"badge\">42</span></a></li>\r\n                <li><a href=\"#\">Profile <span class=\"badge\"></span></a></li>\r\n                <li><a href=\"#\">Messages <span class=\"badge\">3</span></a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Progress bars\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"progress-bars\">Progress bars</h1>\r\n            </div>\r\n\r\n            <h3 id=\"progress-basic\">Basic</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar\" style=\"width: 60%;\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-alternatives\">Contextual alternatives</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-info\" style=\"width: 20%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 40%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 60%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 80%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-striped\">Striped</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-info\" style=\"width: 20%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 40%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 60%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 80%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-animated\">Animated</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress progress-striped active\">\r\n                <div class=\"progress-bar\" style=\"width: 45%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-stacked\">Stacked</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 35%\"></div>\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 20%\"></div>\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 10%\"></div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Containers\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"containers\">Containers</h1>\r\n            </div>\r\n            <div class=\"bs-component\">\r\n              <div class=\"jumbotron\">\r\n                <h1>Jumbotron</h1>\r\n                <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>\r\n                <p><a class=\"btn btn-primary btn-lg\">Learn more</a></p>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>List groups</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <ul class=\"list-group\">\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">14</span>\r\n                  Cras justo odio\r\n                </li>\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">2</span>\r\n                  Dapibus ac facilisis in\r\n                </li>\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">1</span>\r\n                  Morbi leo risus\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"list-group\">\r\n                <a href=\"#\" class=\"list-group-item active\">\r\n                  Cras justo odio\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">Dapibus ac facilisis in\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">Morbi leo risus\r\n                </a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"list-group\">\r\n                <a href=\"#\" class=\"list-group-item\">\r\n                  <h4 class=\"list-group-item-heading\">List group item heading</h4>\r\n                  <p class=\"list-group-item-text\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">\r\n                  <h4 class=\"list-group-item-heading\">List group item heading</h4>\r\n                  <p class=\"list-group-item-text\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\r\n                </a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Panels</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-body\">\r\n                  Basic panel\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-heading\">Panel heading</div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n                <div class=\"panel-footer\">Panel footer</div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-primary\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel primary</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-success\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel success</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-warning\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel warning</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-danger\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel danger</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-info\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel info</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Wells</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well\">\r\n                Look, I\'m in a well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well well-sm\">\r\n                Look, I\'m in a small well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well well-lg\">\r\n                Look, I\'m in a large well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Dialogs\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"dialogs\">Dialogs</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <h2>Modals</h2>\r\n            <div class=\"bs-component\">\r\n              <div class=\"modal\">\r\n                <div class=\"modal-dialog\">\r\n                  <div class=\"modal-content\">\r\n                    <div class=\"modal-header\">\r\n                      <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n                      <h4 class=\"modal-title\">Modal title</h4>\r\n                    </div>\r\n                    <div class=\"modal-body\">\r\n                      <p>One fine body…</p>\r\n                    </div>\r\n                    <div class=\"modal-footer\">\r\n                      <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\r\n                      <button type=\"button\" class=\"btn btn-primary\">Save changes</button>\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-6\">\r\n            <h2>Popovers</h2>\r\n            <div class=\"bs-component\">\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"left\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Left</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"top\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Top</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"Vivamus\r\n              sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Bottom</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"right\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Right</button>\r\n            </div>\r\n            <h2>Tooltips</h2>\r\n            <div class=\"bs-component\">\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"left\" title=\"\" data-original-title=\"Tooltip on left\">Left</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"\" data-original-title=\"Tooltip on top\">Top</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"Tooltip on bottom\">Bottom</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"\" data-original-title=\"Tooltip on right\">Right</button>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <div id=\"source-modal\" class=\"modal fade\" style=\"display: none;\">\r\n        <div class=\"modal-dialog modal-lg\">\r\n          <div class=\"modal-content\">\r\n            <div class=\"modal-header\">\r\n              <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n              <h4 class=\"modal-title\">Source Code</h4>\r\n            </div>\r\n            <div class=\"modal-body\">\r\n              <pre>&lt;ul class=\"nav nav-tabs\"&gt;\r\n  &lt;li class=\"\"&gt;&lt;a href=\"#home\" data-toggle=\"tab\" aria-expanded=\"false\"&gt;Home&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"active\"&gt;&lt;a href=\"#profile\" data-toggle=\"tab\" aria-expanded=\"true\"&gt;Profile&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"disabled\"&gt;&lt;a&gt;Disabled&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"dropdown open\"&gt;\r\n    &lt;a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"true\"&gt;\r\n      Dropdown &lt;span class=\"caret\"&gt;&lt;/span&gt;\r\n    &lt;/a&gt;\r\n    &lt;ul class=\"dropdown-menu\"&gt;\r\n      &lt;li&gt;&lt;a href=\"#dropdown1\" data-toggle=\"tab\"&gt;Action&lt;/a&gt;&lt;/li&gt;\r\n      &lt;li class=\"divider\"&gt;&lt;/li&gt;\r\n      &lt;li&gt;&lt;a href=\"#dropdown2\" data-toggle=\"tab\"&gt;Another action&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n  &lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;div id=\"myTabContent\" class=\"tab-content\"&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"home\"&gt;\r\n    &lt;p&gt;Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade active in\" id=\"profile\"&gt;\r\n    &lt;p&gt;Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"dropdown1\"&gt;\r\n    &lt;p&gt;Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney\'s organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"dropdown2\"&gt;\r\n    &lt;p&gt;Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;</pre>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      \r\n\r\n\r\n    </div>', '');
INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`, `pre_html`, `post_html`) VALUES
(14, '2018-03-10 00:20:01', '2018-04-07 19:12:23', 1, 1, NULL, '', ''),
(15, '2018-03-19 16:04:00', '2018-03-19 17:01:12', 1, 2, '{{ doctor:listing order_by=&quot;id&quot; order=&quot;asc&quot;&nbsp; }}<br />\r\n&nbsp; {{ id }} {{ name }} {{ area_name }} {{ town }}<br />\r\n<br />\r\n&nbsp;{{ /doctor:listing }}', '', ''),
(16, '2018-03-19 16:49:57', '2018-03-19 17:00:47', 1, 3, '{{ doctor:show id={url:segments segment=&quot;2&quot;} }}<br />\r\n&nbsp; {{ id }} {{ name }} {{ area_name }} {{ town }}<br />\r\n&nbsp;{{ /doctor:show }}', '{{ url:segments segment=\"1\" }}\r\n{{ url:segments segment=\"2\" }}\r\n{{ url:segments segment=\"3\" }}', ''),
(28, '2018-04-05 14:20:35', NULL, 1, 7, NULL, NULL, NULL),
(29, '2018-04-05 14:20:54', NULL, 1, 8, NULL, NULL, NULL),
(30, '2018-04-05 14:21:09', '2018-04-05 14:35:38', 1, 9, NULL, '', ''),
(31, '2018-04-05 14:21:21', NULL, 1, 10, NULL, NULL, NULL),
(32, '2018-04-05 14:21:33', NULL, 1, 11, NULL, NULL, NULL),
(33, '2018-04-05 14:23:34', NULL, 1, 12, NULL, NULL, NULL),
(34, '2018-04-05 14:23:46', NULL, 1, 13, NULL, NULL, NULL),
(35, '2018-04-05 14:29:31', '2018-04-05 14:29:57', 1, 14, NULL, '\n{{ appointments:my_appointments futur_past=\"futur\" other_person=\"[[ if page:slug == \'mes-rdv-a-venir\' ]]non[[ elseif page:slug == \'rdv-a-venir-de-mes-proches\'  ]]oui[[ endif ]]\"  }} \n<div class=\"panel panel-default panel-success\">\n		<div class=\"panel-heading\"> \n			<h4>\n				Le\n				 {{date_day_str}}  {{date_month_str}}  \n				à  {{time_formatted}} \n			</h4>\n                    \n                         <!--\n			 [{{appointment_time}}   - \n			 doc {{doctor_id}} user {{user_id}}]\n                          -->\n		</div>\n		<div class=\"panel-body\">    \n                    <!-- img -->\n			 {{ if filename }}\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                            {{ elseif doc_speciality  }}  \n                                        <img src=\"{{ url:site }}files/large/{{ doctor:speciality_img speciality=doc_speciality  }}\" \n                                             height=\"80\" style=\"float:left;margin-right:20px;\"\n                                             class=\"img-circle\" />\n                         \n                            {{ else }} \n                            {{# default image #}}\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                            {{ endif }}\n                    <!-- img end  -->\n							\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n				 <br /> \n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \n				 <br /> \n				{{gender}}  \n				 {{first_name}}  \n				 {{last_name}}    \n                         <!--\n			Le\n			 {{appointment_date}}  \n			à\n			 {{appointment_time}}\n			  -->\n			<center class=\"\"> \n				<a class=\"btn btn-danger \" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \n			</center> 		 \n		</div>\n</div> \n{{ /appointments:my_appointments }}', ''),
(36, '2018-04-05 18:29:44', NULL, 1, 15, NULL, NULL, NULL),
(37, '2018-04-05 18:30:07', NULL, 1, 16, NULL, NULL, NULL),
(38, '2018-04-09 19:12:38', '2018-04-10 08:03:12', 1, 17, NULL, '', ''),
(27, '2018-04-05 14:18:11', '2018-04-05 14:28:54', 1, 6, NULL, '', ''),
(25, '2018-03-27 19:26:58', '2018-03-29 14:37:42', 1, 4, NULL, '<p id=\"msg\" class=\"text-center\"></p>\n<div id=\"position\" class=\"form-group text-center col-sm-6 col-sm-offset-3\">\n	<label for=\"position\">Position GPS</label>\n	<div class=\"input\">\n		<input class=\"form-control\" name=\"position\" type=\"text\" onfocus=\"this.select()\" />\n	</div>\n	<button onclick=\"geoGetPosition()\" class=\"btn btn-default\"><i class=\"glyphicon glyphicon-map-marker\"></i> Position\n	</button> \n</div> \n', ''),
(26, '2018-03-29 15:23:10', '2018-03-29 15:23:16', 1, 5, NULL, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `default_doctors_favorites`
--

DROP TABLE IF EXISTS `default_doctors_favorites`;
CREATE TABLE `default_doctors_favorites` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:00',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(3, '2018-04-08 00:00:00', '2018-04-12 00:03:19', NULL, NULL, NULL, 'Dentiste', NULL, 'ec71fe6f744f2a9'),
(4, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Etablissement de santé', NULL, NULL),
(5, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'Laboratoires', NULL, NULL),
(6, '2018-04-08 00:00:00', '2018-04-12 00:45:37', NULL, NULL, NULL, 'Médecin généraliste', NULL, '2df0bb31b8698f6'),
(7, '2018-04-08 00:00:00', '2018-04-12 00:46:18', NULL, NULL, NULL, 'Ophtalmologue', NULL, '77d974c045cec2f'),
(8, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 0, 'ORL', NULL, NULL),
(9, '2018-04-08 00:00:00', '2018-04-12 00:45:57', NULL, NULL, NULL, 'Radiologue', NULL, '072db2cc3a192e8'),
(10, '2018-04-08 00:00:00', '2018-04-12 00:46:29', NULL, NULL, NULL, 'Spécialistes femme', NULL, '3562c99c8f016a7'),
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
(23, '2018-04-08 00:00:00', '2018-04-12 00:47:23', NULL, NULL, 1, 'Chirurgien viscéral et digestif', 'Ventre', 'dummy'),
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
(1, '2018-04-08 00:00:00', '2018-04-12 00:45:19', NULL, NULL, NULL, 'Autres médécins', NULL, 'ead3bdfc1c82912');

-- --------------------------------------------------------

--
-- Structure de la table `default_doctor_doctors`
--

DROP TABLE IF EXISTS `default_doctor_doctors`;
CREATE TABLE `default_doctor_doctors` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `validated` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rngps` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` text COLLATE utf8_unicode_ci,
  `week_settings` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacation_start` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacation_end` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` text COLLATE utf8_unicode_ci,
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
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_cat` int(11) DEFAULT NULL,
  `groupe` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_doctor_doctors`
--

INSERT INTO `default_doctor_doctors` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `validated`, `name`, `rngps`, `days`, `week_settings`, `vacation_start`, `vacation_end`, `gender`, `telephone`, `mobile`, `email`, `address`, `area_name`, `district`, `town`, `description`, `access`, `languages`, `diploma`, `fees`, `payment`, `insurance`, `homecall`, `latitude`, `longitude`, `settings`, `image`, `doctor_cat`, `groupe`) VALUES
(183, '2018-04-08 00:00:00', '2018-04-11 16:31:34', NULL, NULL, 'yes', 'Dr KABA Amie', '12242356452', '1\n2\n3\n4\n5\n6\n7', '1', NULL, NULL, 'Femme', NULL, NULL, 'abalde37@yahoo.fr', NULL, NULL, 'Ratoma', 'Conakry', 'LAMMA%¨PPP', 'toto', 'peul foula', 'Diplôme médecine paris', '10000 GNF (sans mutuelle)\n1000 GNF (avec mutuelle)', 'Orange money', 'yes', '', NULL, NULL, NULL, 'dummy', 8, NULL),
(184, '2018-04-08 00:00:00', '2018-04-11 17:29:56', NULL, NULL, 'yes', 'Dr SYLLA Albert Vincent', NULL, '2\n3\n4', '1', NULL, NULL, 'Homme', NULL, '6651245365', 'abban.goura@yahoo.fr', NULL, NULL, 'Kaloum', 'Conakry', '', '', '', '', '', '', 'yes', '', NULL, NULL, NULL, 'b5775cff48f4bae', 6, NULL),
(185, '2018-04-08 00:00:00', '2018-04-11 17:20:34', NULL, NULL, 'no', 'Goïpogui Dougo', NULL, '1\n2\n3\n4\n5\n6\n7', '1', NULL, NULL, NULL, NULL, NULL, 'abdoula21@yahoo.fr', NULL, 'Matoto', 'Matam', 'Conakry', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, 'dummy', NULL, NULL),
(186, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Ngamet', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'abdoulayemouctard@gmail.com', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Patru Traian Mihai', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'abdoulke@yahoo.fr', NULL, 'Nongo Taady', 'Ratoma ', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, '2018-04-08 00:00:00', '2018-04-11 17:32:55', NULL, NULL, 'yes', 'Camara Mohamed Lamine Fatou', NULL, '1\n2\n3\n4\n5\n6', '1', NULL, NULL, NULL, NULL, NULL, 'aboubacardemba82@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, 'dummy', 8, NULL),
(189, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sow Boubacar Therno', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'aboufontaine@yahoo.fr', NULL, 'Hamdallaye', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Foromo Emmanuel Kalivogui', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'aichabjune@gmail.com', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, '2018-04-08 00:00:00', '2018-04-11 16:56:57', NULL, NULL, 'yes', 'Dr Guilavogui Seydou', NULL, '1\n3\n4\n5', '1', NULL, NULL, 'Homme', NULL, NULL, 'aissatousonaniakate@gmail.com', NULL, NULL, 'NZérékoré', 'NZérékoré', '', '', '', '', '', '', 'yes', '', NULL, NULL, NULL, 'dummy', 3, NULL),
(192, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Keita Karamoko', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'aissatoutaran@yahoo.fr', NULL, NULL, 'Coyah', 'Kindia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bongono André', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'alaintamba2013@gmail.com', NULL, NULL, 'Kissidougou', 'Kankan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Loua Howoro Alphonse', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'alfenyx@yahoo.fr', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diallo Amadou Therno', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'algassimoud@yahoo.fr', NULL, 'Hamdalaye', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Baldé Ismaela', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'alhadjibobo@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Magassouba Mohamed Lamine', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'alphamamadou52@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sebory Cissé', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'alphaoumarbarryo@yahoo.fr', NULL, 'Dabompa', 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diallo Aboubacar II', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'amadou_balde@yahoo.fr', NULL, NULL, 'Kissidougou', 'Kankan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sylla Fodé Mohamed', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'amadousamakan@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bangoura Seny Samany', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'amadousylla334@yahoo.fr', NULL, NULL, 'Fria', 'Boké', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Keita Fodé Moussa', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'amarase31@yahoo.fr', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Mohamed Seto', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'aminabe58@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'TRAORE Bakary', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'ancire76@yahoo.fr', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Mohamed Lamine', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'ansoumanecamara22@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Kébé N\'Famara', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'aofofana4@gmail.com', NULL, 'Sangarédi', 'Boké', 'Boké', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sylla Ibrahima', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'apmeliesther@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Mohamed', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'ardhobalde@gmail.com', NULL, 'Hamdallaye', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Zoumanigui Sowo', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'asb084@yahoo.fr', NULL, 'Nongo', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Touré Christian Sinata', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'astybah@gmail.com', NULL, NULL, 'NZérékoré', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bah Mohamed Lamine', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'bahkadiata86bappe@gmail.com', NULL, NULL, 'Pita', 'Pita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Mirreh Mohamed', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'baldefatima82@gmail.com', NULL, 'Lambanyi', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sanoh Ibrahima', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'boukharyibrahima@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Toure Mohamed', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'busuriu@yahoo.fr', NULL, 'Hamdalaye', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Traoré Aly', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'camaradjiba86@gmail.com', NULL, NULL, 'Siguiri', 'Kindia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'M\'BALLO Soba', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'camaradoubasitan84@gmail.com', NULL, NULL, 'Coyah', 'Kindia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sow Boubacar', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'camaram2012@yahoo.fr', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sano Abdoulaye', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'camarasekou25@gmail.com', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Béavogui Colette Gama', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cellou12000@yahoo.fr', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Mandian', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'celloudiadi@gmail.com', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Fodé Lansana', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'celloudocta@gmail.com', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Lamah Charles Mathias', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cherif52_diallo@yahoo.fr', NULL, NULL, 'Kaloum', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Condé Edy', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cherifdiallo@movartis.com', NULL, NULL, 'Coyah', 'Kindia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Kouyaté DembaLaye', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cissatoubella@gmail.com', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara MoussaDjontan', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cisselamine14@yahoo.fr', NULL, NULL, 'NZérékoré', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Doualamou Tokpa', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cisselamine85@gmail.com', NULL, 'Kamsar', 'Boké', 'Boké', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Barry Thierno Amadou', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condean@gmail.com', NULL, NULL, 'Mamou', 'Mamou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Baldé Ibrahima', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condekaba95@yahoo.fr', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diakité Aboubacar Nassagbè', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condemass@yahoo.fr', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Namory', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condenankouma@yahoo.fr', NULL, NULL, 'NZérékoré', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bah Elh Ibrahima', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condesamadou@yahoo.fr', NULL, NULL, 'Sangarédi', 'Boké', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Felemou Gnakoye', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condesarata@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sougoulé Bansoumane', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'condesolo@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Doumbouya Mohamed Cheick', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'conteibe@yhaoo.fr', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Moustapha souaré', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'csmguinea@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Kadiatou Aly Camara', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'cushing.bah@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Nansouma Oularé', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dabomamadou1@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Baldé Souleymane', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dadimalick@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Moussa Ibrahima', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dahaicha085@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Camara Dacia', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dalokadolamou@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diallo AmadouOury', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dalphao@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Condé Moussa', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'danielbamba2100@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bombily Gabriel', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'daporr2000@yahoo.ca', NULL, 'Nongo', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sonomou Lah', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Davidtheoro@yahoo.fr', NULL, 'Kountia', 'Coyah', 'Kindia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diané Bangaly', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'davsinet86@gmail.com', NULL, NULL, 'Lola', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bérété Foungbé', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dg_aboubilli@yahoo.fr', NULL, NULL, 'Kaloum', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diallo Mamadou Mouctar', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'diabdoul2000@gmail.com', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Baldé Ibrahima Sory', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'diacherif87@gmail.com', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Dore Gomo Sourou', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'diallokadiatoukolon@gmail.com', NULL, NULL, 'Lola', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sylla Mohamed Lamine', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'diallomamadoudian@gmail.com', NULL, 'Dabompa', 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Condé Mohamed Lamine', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dialloouryballa20@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Keita Moussa Bella', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'diallopediatrie@yahoo.fr', NULL, NULL, 'Guéckédou', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Kourouma Facély', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'diarayecherif2002@yahoo.fr', NULL, NULL, 'Guéckédou', 'NZérékoré', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bah Mamadou Cellou', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dibrahim10@yahoo.fr', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Bangoura Aboubacar Makhissa', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'didrissa73@gmail.com', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Sylla Sékouba', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'dinoh.camara@yahoo.fr', NULL, NULL, 'Dixinn', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Dramé Souleymane', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'djenabdiallo15@yahoo.fr', NULL, NULL, 'Matam', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diallo Amadou Oury', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'docamara2004@yahoo.fr', NULL, NULL, 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, '2018-04-08 00:00:00', '2018-04-08 00:00:00', NULL, NULL, 'no', 'Diop Mamadou Samba', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'docbahboulline@yahoo.fr', NULL, 'Nongo', 'Ratoma', 'Conakry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, '2018-04-08 00:00:00', '2018-04-11 22:21:57', NULL, NULL, 'no', 'Kanté Mory', NULL, '1\n2\n3\n4\n5\n6', '1', NULL, NULL, NULL, NULL, NULL, 'docteuramadou82@yahoo.fr', NULL, NULL, 'Siguiri', 'Kindia', '', '', '', '', '', '', 'yes', '', NULL, NULL, NULL, 'dummy', NULL, NULL),
(368, '2018-04-11 22:23:55', '2018-04-11 22:35:14', 12, 1, 'yes', 'Dr FALETTI Vanessa', NULL, '1\n2\n3\n4\n5', '2', NULL, NULL, 'Femme', NULL, '672124083', 'vfaletti@msn.com', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'no', '', NULL, NULL, NULL, 'dummy', 23, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_doctor_organisations`
--

DROP TABLE IF EXISTS `default_doctor_organisations`;
CREATE TABLE `default_doctor_organisations` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `organisation` int(11) DEFAULT NULL,
  `subset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_doctor_organisations`
--

INSERT INTO `default_doctor_organisations` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `organisation`, `subset`) VALUES
(1, '2018-04-08 19:39:56', NULL, 1, 1, NULL, 'test'),
(2, '2018-04-08 19:40:07', NULL, 1, 2, 1, 'test sousparent'),
(3, '2018-04-08 19:40:15', NULL, 1, 3, 1, 'retest sous parent'),
(4, '2018-04-08 20:00:24', NULL, 1, 4, 1, 'retest');

-- --------------------------------------------------------

--
-- Structure de la table `default_email_templates`
--

DROP TABLE IF EXISTS `default_email_templates`;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_email_templates`
--

INSERT INTO `default_email_templates` (`id`, `slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`) VALUES
(1, 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\r\n				<p>\r\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\r\n				<strong>Operating System: {{ sender_os }}<br/>\r\n				<strong>User Agent: {{ sender_agent }}</strong>\r\n				</p>\r\n				<p>{{ comment }}</p>\r\n				<p>View Comment: {{ redirect_url }}</p>', 'en', 1, 'comments'),
(2, 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', 'This message was sent via the contact form on with the following details:\r\n				<hr />\r\n				IP Address: {{ sender_ip }}\r\n				OS {{ sender_os }}\r\n				Agent {{ sender_agent }}\r\n				<hr />\r\n				{{ message }}\r\n\r\n				{{ name }},\r\n\r\n				{{ email }}', 'en', 1, 'pages'),
(3, 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\r\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\r\n				<strong>Operating System: {{ sender_os }}</strong><br/>\r\n				<strong>User Agent: {{ sender_agent }}</strong>\r\n				</p>', 'en', 1, 'users'),
(4, 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\r\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\r\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\r\n				<p>&nbsp;</p>\r\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\r\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\r\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', 1, 'users'),
(5, 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\r\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\r\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', 1, 'users'),
(6, 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\r\n				<p>Your new password is: {{ new_password }}</p>\r\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>', 'en', 1, 'users'),
(46, 'appointments-deleted-admin', 'Appointments deleted admin', 'Email envoyé à l\'admin après annulation d\'un RDV', '{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Annulation de {{user_data:display_name}} ', '<h2>Le RDV de {{user_data:display_name}} | {{appointment_data:email}} a été annulé!</h2>\n                                                    <h3>Date de RDV: {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} </h3> \n                                                    <p> \n                                                    N° RDV: {{appointment_id}} - {{ admin_url }}<br />\n                                                    <a href=\"{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}\" target=\"_blank\">\n                                                    Voir les RDV du {{appointment_data:appointment_date}}\n                                                    </a>\n                                                    <br />\n                                                    <a href=\"{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}\" target=\"_blank\">\n                                                    Voir les RDV {{user_data:display_name}}\n                                                    </a>\n                                                    <br />\n                                                    RDV pris le {{ helper:date format=\"%d %b %Y à %H:%M:%S\" timestamp={appointment_data:appointment_date} }}\n                                                    </p> \n                                                    <p> \n                                                    User ID: {{ appointment_data:user_id }}<br />\n                                                    IP Address: {{ sender_ip }}<br />\n                                                    Operating System: {{ sender_os }}<br />\n                                                    User Agent: {{ sender_agent }}<br />\n                                                    </p> ', 'fr', 0, 'appointments'),
(45, 'appointments-modified-admin', 'Appointments modified admin ', 'Email envoyé à l\'admin après modification d\'un RDV', '{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} - Modification par {{user_data:display_name}}', '<h2>Le RDV de {{user_data:display_name}}</h2>\n                                                        <h3>Date du RDV: {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}  </h3> \n                                                        <p>\n                                                        Adresse:<br /> \n                                                        {{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}<br />\n                                                        <a href=\"https://maps.google.fr/maps/search/{{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}\" target=\"_blank\">Voir sur Google</a><br />\n                                                        Contact :<br />\n                                                        <a href=\"tel:{{appointment_data:phone}}\">{{appointment_data:phone}} </a> - <a href=\"tel:{{appointment_data:mobile}}\">{{appointment_data:mobile}} </a> - <a href=\"mailto:{{appointment_data:email}}\">{{appointment_data:email}} </a><br />\n                                                        </p>  \n                                                        <p>\n                                                        Message du client<br />\n                                                        {{appointment_data:message}}\n                                                        </p> \n                                                        <p>\n                                                        User ID: {{ appointment_data:user_id }}<br />\n                                                        IP Address: {{ sender_ip }}<br />\n                                                        Operating System: {{ sender_os }}<br />\n                                                        User Agent: {{ sender_agent }}<br />\n                                                        </p>\n                                            ', 'fr', 0, 'appointments'),
(44, 'appointments-patient', 'Appointment mail for patient', 'Email au patient suite à une prise de RDV par le patient', 'Vous avez effectué une prise de RDV pour le {{ appointment_data:formatted_date}}', '<p>Bonjour {{user_data:display_name}}<br />\nVous avez effectu&eacute; une prise de RDV pour le {{ appointment_data:formatted_date}}</p>\n\n<h2>Date du RDV{{ appointment_data:formatted_date}}</h2>\n\n<h3>Heure du RDV {{ &nbsp;appointment_data:formatted_time}}</h3>\n\n<p><a href=\"{{url:site}}appointments/success/{{appointment_id}}\" target=\"_blank\">Vous pouvez voir votre RDV i&ccedil;i</a><br />\n<br />\nMerci pour votre confiance.</p>\n\n<p>User ID: {{ appointment_data:user_id }}<br />\nIP Address: {{ sender_ip }}<br />\nOperating System: {{ sender_os }}<br />\nUser Agent: {{ sender_agent }}</p>', 'fr', 0, 'appointments'),
(43, 'appointments-admin', 'Appointments admin', 'Email admin suite a prise de RDV', 'RDV le {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Patient: {{user_data:display_name}}', '<p>Un nouveau RDV pour {{user_data:display_name}} | {{appointment_data:email}}</p>\n                                                        <h2>Date de livraison {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }}</h2>\n                                                        <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>\n\n                                                        <p> \n                                                        <a href=\"https://maps.google.fr/maps/search/{{appointment_data:street}}, {{appointment_data:area_name}} {{appointment_data:town}}\" target=\"_blank\">Voir sur Google</a><br />\n                                                        Contact :<br />\n                                                        <a href=\"tel:{{appointment_data:phone}}\">{{appointment_data:phone}} </a> - <a href=\"tel:{{appointment_data:mobile}}\">{{appointment_data:mobile}} </a> - <a href=\"mailto:{{appointment_data:email}}\">{{appointment_data:email}} </a><br />\n                                                        </p>    \n                                                        <p>\n                                                        N° RDV: {{appointment_id}} {{ admin_url }}<br />\n                                                        <a href=\"{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}\" target=\"_blank\">\n                                                        Voir les RDV du {{appointment_data:appointment_date}}\n                                                        </a>\n                                                        <br />\n                                                        <a href=\"{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}\" target=\"_blank\">\n                                                        Voir les commandes de {{user_data:display_name}}\n                                                        </a>\n                                                        <br />\n                                                        RDV pris le {{ helper:date format=\"%d %b %Y à %H:%M:%S\" timestamp=appointment_data:appointment_date }}\n                                                        </p>\n                                                        <p>\n                                                        User ID: {{ appointment_data:user_id }}<br />\n                                                        IP Address: {{ sender_ip }}<br />\n                                                        Operating System: {{ sender_os }}<br />\n                                                        User Agent: {{ sender_agent }}\n                                                        </p>', 'fr', 0, 'appointments');

-- --------------------------------------------------------

--
-- Structure de la table `default_files`
--

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
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_files`
--

INSERT INTO `default_files` (`id`, `folder_id`, `user_id`, `type`, `name`, `filename`, `path`, `description`, `extension`, `mimetype`, `keywords`, `width`, `height`, `filesize`, `alt_attribute`, `download_count`, `date_added`, `sort`) VALUES
('', 1, 1, 'i', 'dentiste.jpg', '1717f2a8194f53253de0df0c7f5f998c.jpg', '{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 3, '', 0, 1520626187, 0),
('a4278245d864a56', 1, 1, 'i', 'coeur.jpg', 'f40501b53bd7d3e0f62c5086ea1ecc2b.jpg', '{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 7, '', 0, 1520626187, 0),
('c8e8886f9e65488', 1, 1, 'i', 'medecin.jpg', 'e6ef08347e274fc655f20c172baad122.jpg', '{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 5, '', 0, 1520626196, 0),
('353de3d9e958976', 1, 1, 'i', 'etablissement.jpg', '056d27356ff595697ce2352501d71633.jpg', '{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 6, '', 0, 1520626199, 0),
('25e01b2784711d9', 1, 1, 'i', 'orl.jpg', '29edb0b1c84e0ed4df17c82fe658d9d5.jpg', '{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 6, '', 0, 1520626199, 0),
('292281c45a9207c', 1, 1, 'i', 'ophtalmo.jpg', 'da81bbdd7f739e786f674638e29ba433.jpg', '{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 4, '', 0, 1520626200, 0),
('82ed2c7f7efb8a4', 1, 1, 'i', 'radio.jpg', 'c9c12e653b087854ac27bf50eac5a6cc.jpg', '{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 4, '', 0, 1520630061, 0),
('3590b30f5b17f8c', 1, 1, 'i', 'femme.jpg', '41f6ec9ed1a988081b7e137dee039c0d.jpg', '{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 6, '', 0, 1520626203, 0),
('997cd2e64fac717', 1, 1, 'i', 'stehoscope.jpg', '2591b872c7ed8b2b916540d36a2593a6.jpg', '{{ url:site }}files/large/2591b872c7ed8b2b916540d36a2593a6.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 4, '', 0, 1520626203, 0),
('472d0eb6f160961', 2, 1, 'i', 'logo.jpg', '4434f1beca9ca4e34c7329262a6e18dc.jpg', '{{ url:site }}files/large/4434f1beca9ca4e34c7329262a6e18dc.jpg', '', '.jpg', 'image/jpeg', '', 489, 128, 13, '', 0, 1520636552, 0),
('fea67cd85d808e4', 2, 1, 'i', 'logo.png', '2421d2e2031e3b446512f6e8bb6c56d0.png', '{{ url:site }}files/large/2421d2e2031e3b446512f6e8bb6c56d0.png', '', '.png', 'image/png', '', 489, 128, 28, '', 0, 1520636552, 0),
('699df7530ec4c93', 33, 1, 'i', 'lion-king-wallpaper.jpg', '4105971510792d9b4b76ce47fb3eb5e4.jpg', '{{ url:site }}files/large/4105971510792d9b4b76ce47fb3eb5e4.jpg', '', '.jpg', 'image/jpeg', '', 1024, 768, 136, '', 0, 1521461554, 0),
('59789c0711582b8', 30, 1, 'i', 'contact-placeholder.jpg', '8b37a2a2cbf9537714125a8f8476e63a.jpg', '{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg', '', '.jpg', 'image/jpeg', '', 263, 261, 4, '', 0, 1521127341, 0),
('28bf736b0c65fb4', 1, 1, 'i', 'dentiste.jpg', 'a3866e075f0030d3afccf510bc6acd3a.jpg', '{{ url:site }}files/large/a3866e075f0030d3afccf510bc6acd3a.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 3, '', 0, 1521547035, 0),
('55b8dff41b6c29b', 33, 12, 'i', 'lamah-pierre.jpg', '4e7ecbb053cfe879796c33c4cc49171d.jpg', '{{ url:site }}files/large/4e7ecbb053cfe879796c33c4cc49171d.jpg', '', '.jpg', 'image/jpeg', '', 101, 109, 10, '', 0, 1522440017, 0),
('b5775cff48f4bae', 36, 12, 'i', 'medecin-guinee.jpg', '611d1cfd3f1f461480b7e454a4a382ce.jpg', '{{ url:site }}files/large/611d1cfd3f1f461480b7e454a4a382ce.jpg', '', '.jpg', 'image/jpeg', '', 92, 89, 9, '', 0, 1523453154, 0),
('ec71fe6f744f2a9', 36, 1, 'i', 'dentiste.jpg', '134c9e4e1cb5cfa0ba7255a917993636.jpg', '{{ url:site }}files/large/134c9e4e1cb5cfa0ba7255a917993636.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 3, '', 0, 1523476999, 0),
('ead3bdfc1c82912', 36, 1, 'i', 'medecin.jpg', '65003b1e1f248d7187f6783c9e61bff5.jpg', '{{ url:site }}files/large/65003b1e1f248d7187f6783c9e61bff5.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 5, '', 0, 1523479519, 0),
('2df0bb31b8698f6', 36, 1, 'i', 'medecin.jpg', '54ae27e175615df27832a543eefcb13d.jpg', '{{ url:site }}files/large/54ae27e175615df27832a543eefcb13d.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 5, '', 0, 1523479537, 0),
('072db2cc3a192e8', 36, 1, 'i', 'radio.jpg', '511a33391da60fc3ade51e1167d1bf0c.jpg', '{{ url:site }}files/large/511a33391da60fc3ade51e1167d1bf0c.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 4, '', 0, 1523479557, 0),
('77d974c045cec2f', 36, 1, 'i', 'ophtalmo.jpg', 'bba1df096ba75debab9a165f3bc806f0.jpg', '{{ url:site }}files/large/bba1df096ba75debab9a165f3bc806f0.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 4, '', 0, 1523479578, 0),
('3562c99c8f016a7', 36, 1, 'i', 'femme.jpg', '9c2e2bac97dcd24b7eac9eb224dc504f.jpg', '{{ url:site }}files/large/9c2e2bac97dcd24b7eac9eb224dc504f.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 6, '', 0, 1523479589, 0);

-- --------------------------------------------------------

--
-- Structure de la table `default_file_folders`
--

DROP TABLE IF EXISTS `default_file_folders`;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_file_folders`
--

INSERT INTO `default_file_folders` (`id`, `parent_id`, `slug`, `name`, `location`, `remote_container`, `date_added`, `sort`, `hidden`) VALUES
(1, 0, 'icones', 'icones', 'local', '', 1520626147, 1520626147, 0),
(2, 0, 'logos', 'logos', 'local', '', 1520636515, 1520636515, 0),
(33, 0, 'doctors-module', 'Doctors module', 'local', '', 1521461442, 1521461442, 0),
(30, 0, 'divers', 'Divers', 'local', '', 1521127321, 1521127321, 0),
(34, 0, 'doctor-images', 'Doctor images', 'local', '', 1522938953, 1522938953, 0),
(35, 0, 'doctor-images-1', 'Doctor images-1', 'local', '', 1522945439, 1522945439, 0),
(36, 0, 'doctor-images-2', 'Doctor images-2', 'local', '', 1522977511, 1522977511, 0);

-- --------------------------------------------------------

--
-- Structure de la table `default_groups`
--

DROP TABLE IF EXISTS `default_groups`;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_groups`
--

INSERT INTO `default_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'user', 'User'),
(3, 'staff-medical', 'Staff médical'),
(4, 'support-technique', 'Support technique'),
(5, 'practicien', 'Practicien'),
(6, 'devops', 'Devops');

-- --------------------------------------------------------

--
-- Structure de la table `default_keywords`
--

DROP TABLE IF EXISTS `default_keywords`;
CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_keywords_applied`
--

DROP TABLE IF EXISTS `default_keywords_applied`;
CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_migrations`
--

DROP TABLE IF EXISTS `default_migrations`;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_migrations`
--

INSERT INTO `default_migrations` (`version`) VALUES
(129);

-- --------------------------------------------------------

--
-- Structure de la table `default_modules`
--

DROP TABLE IF EXISTS `default_modules`;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL,
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
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_modules`
--

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:25:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fa\";s:14:\"تنظیمات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"tw\";s:12:\"網站設定\";s:2:\"cn\";s:12:\"网站设定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fa\";s:105:\"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:118:\"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"tw\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"cn\";s:99:\"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}', 1, 0, 1, 'settings', 1, 1, 1, 1522326845),
(2, 'a:11:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";s:2:\"tw\";s:14:\"Streams 核心\";s:2:\"cn\";s:14:\"Streams 核心\";s:2:\"ar\";s:31:\"الجداول الأساسية\";s:2:\"it\";s:12:\"Streams Core\";s:2:\"fa\";s:26:\"هسته استریم ها\";s:2:\"fi\";s:13:\"Striimit ydin\";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";s:2:\"tw\";s:29:\"Streams 核心資料模組。\";s:2:\"cn\";s:29:\"Streams 核心资料模组。\";s:2:\"ar\";s:57:\"وحدة البيانات الأساسية للجداول\";s:2:\"it\";s:17:\"Core dello Stream\";s:2:\"fa\";s:48:\"ماژول مرکزی برای استریم ها\";s:2:\"fi\";s:48:\"Ydin datan hallinoiva moduuli striimejä varten.\";}', 1, 0, 0, '0', 1, 1, 1, 1522326845),
(3, 'a:21:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fa\";s:26:\"قالب های ایمیل\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"tw\";s:12:\"郵件範本\";s:2:\"cn\";s:12:\"邮件范本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}', 'templates', '1.1.1', NULL, 'a:21:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fa\";s:92:\"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"tw\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"cn\";s:61:\"新增、编辑与储存可显示动态资料的 email 范本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}', 1, 0, 1, 'structure', 1, 1, 1, 1522326845),
(4, 'a:25:{s:2:\"en\";s:7:\"Add-ons\";s:2:\"ar\";s:16:\"الإضافات\";s:2:\"br\";s:12:\"Complementos\";s:2:\"pt\";s:12:\"Complementos\";s:2:\"cs\";s:8:\"Doplňky\";s:2:\"da\";s:7:\"Add-ons\";s:2:\"de\";s:13:\"Erweiterungen\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:9:\"Agregados\";s:2:\"fa\";s:17:\"افزونه ها\";s:2:\"fi\";s:9:\"Lisäosat\";s:2:\"fr\";s:10:\"Extensions\";s:2:\"he\";s:12:\"תוספות\";s:2:\"id\";s:7:\"Pengaya\";s:2:\"it\";s:7:\"Add-ons\";s:2:\"lt\";s:7:\"Priedai\";s:2:\"nl\";s:7:\"Add-ons\";s:2:\"pl\";s:12:\"Rozszerzenia\";s:2:\"ru\";s:20:\"Дополнения\";s:2:\"sl\";s:11:\"Razširitve\";s:2:\"tw\";s:12:\"附加模組\";s:2:\"cn\";s:12:\"附加模组\";s:2:\"hu\";s:14:\"Bővítmények\";s:2:\"th\";s:27:\"ส่วนเสริม\";s:2:\"se\";s:8:\"Tillägg\";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fa\";s:93:\"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"tw\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"cn\";s:54:\"管理员可以检视目前已经安装模组的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}', 0, 0, 1, '0', 1, 1, 1, 1522326845),
(5, 'a:17:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}', 1, 1, 1, 'content', 1, 1, 1, 1522326845),
(6, 'a:25:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"fa\";s:10:\"نظرات\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"tw\";s:6:\"回應\";s:2:\"cn\";s:6:\"回应\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fa\";s:168:\"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"tw\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"cn\";s:75:\"用户和访客可以针对新闻、页面与照片等内容发表回应。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}', 0, 0, 1, 'content', 0, 1, 1, 1522326845),
(7, 'a:25:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fa\";s:18:\"تماس با ما\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"tw\";s:12:\"聯絡我們\";s:2:\"cn\";s:12:\"联络我们\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"fa\";s:239:\"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"tw\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"cn\";s:147:\"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}', 0, 0, 0, '0', 1, 1, 1, 1522326845),
(8, 'a:24:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fa\";s:13:\"فایل ها\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"tw\";s:6:\"檔案\";s:2:\"cn\";s:6:\"档案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}', 'files', '2.0.0', NULL, 'a:24:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fa\";s:79:\"مدیریت فایل های چند رسانه ای و فولدر ها سایت\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"tw\";s:33:\"管理網站中的檔案與目錄\";s:2:\"cn\";s:33:\"管理网站中的档案与目录\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}', 0, 0, 1, 'content', 1, 1, 1, 1522326845),
(9, 'a:24:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fa\";s:13:\"گروه ها\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"tw\";s:6:\"群組\";s:2:\"cn\";s:6:\"群组\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fa\";s:149:\"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"tw\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"cn\";s:45:\"用户可以依群组分类并管理其权限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}', 0, 0, 1, 'users', 1, 1, 1, 1522326845),
(10, 'a:17:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fa\";s:21:\"کلمات کلیدی\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"tw\";s:6:\"鍵詞\";s:2:\"cn\";s:6:\"键词\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fa\";s:110:\"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"tw\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"cn\";s:64:\"集中管理可用于标题与内容的键词(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}', 0, 0, 1, 'data', 1, 1, 1, 1522326845),
(11, 'a:15:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fa\";s:15:\"نگه داری\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"it\";s:12:\"Manutenzione\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"tw\";s:6:\"維護\";s:2:\"cn\";s:6:\"维护\";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"it\";s:65:\"Gestisci la cache del sito e esporta le informazioni dal database\";s:2:\"fa\";s:73:\"مدیریت کش سایت و صدور اطلاعات از دیتابیس\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"tw\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"cn\";s:45:\"经由管理介面手动删除暂存资料。\";}', 0, 0, 1, 'data', 1, 1, 1, 1522326845),
(12, 'a:25:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fa\";s:11:\"منو ها\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"tw\";s:12:\"導航選單\";s:2:\"cn\";s:12:\"导航选单\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fa\";s:68:\"مدیریت منو ها و گروه های مربوط به آنها\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"tw\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"cn\";s:72:\"管理导航选单中的连结，以及它们所隶属的导航群组。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";}', 0, 0, 1, 'structure', 1, 1, 1, 1522326845),
(13, 'a:25:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fa\";s:14:\"صفحه ها \";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"tw\";s:6:\"頁面\";s:2:\"cn\";s:6:\"页面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fa\";s:96:\"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"tw\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"cn\";s:39:\"为您的网站新增自定的页面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}', 1, 1, 1, 'content', 1, 1, 1, 1522326845),
(14, 'a:25:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fa\";s:15:\"اجازه ها\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"tw\";s:6:\"權限\";s:2:\"cn\";s:6:\"权限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fa\";s:59:\"مدیریت اجازه های گروه های کاربری\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"tw\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"cn\";s:81:\"用来控制不同类别的用户，设定其浏览特定网站内容的权限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}', 0, 0, 1, 'users', 1, 1, 1, 1522326845),
(15, 'a:24:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fa\";s:17:\"انتقال ها\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"tw\";s:6:\"轉址\";s:2:\"cn\";s:6:\"转址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"pl\";s:14:\"Przekierowania\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fa\";s:63:\"انتقال دادن یک صفحه به یک آدرس دیگر\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"tw\";s:33:\"將網址轉址、重新定向。\";s:2:\"cn\";s:33:\"将网址转址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"pl\";s:44:\"Przekierowanie z jednego adresu URL na inny.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}', 0, 0, 1, 'structure', 1, 1, 1, 1522326845),
(16, 'a:10:{s:2:\"en\";s:6:\"Search\";s:2:\"br\";s:7:\"Procura\";s:2:\"fr\";s:9:\"Recherche\";s:2:\"se\";s:4:\"Sök\";s:2:\"ar\";s:10:\"البحث\";s:2:\"tw\";s:6:\"搜尋\";s:2:\"cn\";s:6:\"搜寻\";s:2:\"it\";s:7:\"Ricerca\";s:2:\"fa\";s:10:\"جستجو\";s:2:\"fi\";s:4:\"Etsi\";}', 'search', '1.0.0', NULL, 'a:10:{s:2:\"en\";s:72:\"Search through various types of content with this modular search system.\";s:2:\"br\";s:73:\"Procure por vários tipos de conteúdo com este sistema de busca modular.\";s:2:\"fr\";s:84:\"Rechercher parmi différents types de contenus avec système de recherche modulaire.\";s:2:\"se\";s:36:\"Sök igenom olika typer av innehåll\";s:2:\"ar\";s:102:\"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.\";s:2:\"tw\";s:63:\"此模組可用以搜尋網站中不同類型的資料內容。\";s:2:\"cn\";s:63:\"此模组可用以搜寻网站中不同类型的资料内容。\";s:2:\"it\";s:71:\"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare\";s:2:\"fa\";s:115:\"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.\";s:2:\"fi\";s:76:\"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.\";}', 0, 0, 0, '0', 1, 1, 1, 1522326845),
(17, 'a:20:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fa\";s:17:\"نقشه سایت\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"tw\";s:12:\"網站地圖\";s:2:\"cn\";s:12:\"网站地图\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fa\";s:150:\"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"tw\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"cn\";s:84:\"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}', 0, 1, 0, 'content', 1, 1, 1, 1522326845),
(18, 'a:25:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fa\";s:14:\"کاربران\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"tw\";s:6:\"用戶\";s:2:\"cn\";s:6:\"用户\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}', 'users', '1.1.0', NULL, 'a:25:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fa\";s:151:\"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"tw\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"cn\";s:87:\"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}', 0, 0, 1, '0', 1, 1, 1, 1522326845),
(19, 'a:25:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fa\";s:16:\"متغییرها\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"tw\";s:12:\"系統變數\";s:2:\"cn\";s:12:\"系统变数\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";s:2:\"hu\";s:10:\"Változók\";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fa\";s:136:\"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:92:\"Gérer des variables globales pour pouvoir y accéder depuis n\'importe quel endroit du site.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"tw\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"cn\";s:45:\"管理此网站内可存取的全局变数。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}', 0, 0, 1, 'data', 1, 1, 1, 1522326845);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(20, 'a:23:{s:2:\"en\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"da\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fa\";s:13:\"ویجت ها\";s:2:\"fi\";s:9:\"Vimpaimet\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"tw\";s:9:\"小組件\";s:2:\"cn\";s:9:\"小组件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";s:2:\"ar\";s:14:\"الودجتس\";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:132:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"ودجتس\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fa\";s:76:\"مدیریت قسمت های کوچکی از سایت به طور مستقل\";s:2:\"fi\";s:81:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Vimpaimia\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"tw\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"cn\";s:103:\"可将小段的程式码透过小组件来管理。即所谓 \"Widgets\"，或称为小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}', 1, 0, 1, 'content', 1, 1, 1, 1522326845),
(21, 'a:10:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"br\";s:7:\"WYSIWYG\";s:2:\"fa\";s:7:\"WYSIWYG\";s:2:\"fr\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";s:2:\"tw\";s:7:\"WYSIWYG\";s:2:\"cn\";s:7:\"WYSIWYG\";s:2:\"ar\";s:27:\"المحرر الرسومي\";s:2:\"it\";s:7:\"WYSIWYG\";}', 'wysiwyg', '1.0.0', NULL, 'a:11:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"br\";s:64:\"Provém o editor WYSIWYG para o PyroCMS fornecido pelo CKEditor.\";s:2:\"fa\";s:73:\"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. \";s:2:\"fr\";s:63:\"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";s:2:\"tw\";s:83:\"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。\";s:2:\"cn\";s:83:\"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。\";s:2:\"ar\";s:76:\"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.\";s:2:\"it\";s:57:\"Fornisce l\'editor WYSIWYG per PtroCMS creato con CKEditor\";}', 0, 0, 0, '0', 1, 1, 1, 1522326845),
(84, 'a:2:{s:2:\"en\";s:7:\"Doctors\";s:2:\"fr\";s:8:\"Docteurs\";}', 'doctor', '0.1.24', NULL, 'a:2:{s:2:\"en\";s:12:\"Doctors list\";s:2:\"fr\";s:18:\"Liste des Docteurs\";}', 0, 1, 1, 'content', 1, 1, 0, 1523370275),
(24, 'a:2:{s:2:\"en\";s:20:\"Calendars(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'calendars', '0.1.0', NULL, 'a:2:{s:2:\"en\";s:16:\"Calendars module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', 0, 1, 1, 'content', 1, 1, 0, 1520995285),
(25, 'a:2:{s:2:\"en\";s:17:\"Orders(Commandes)\";s:2:\"fr\";s:9:\"Commandes\";}', 'orders', '0.73.08', NULL, 'a:2:{s:2:\"en\";s:13:\"Orders module\";s:2:\"fr\";s:19:\"Module de commandes\";}', 0, 1, 1, 'content', 0, 0, 0, 1523370275),
(79, 'a:1:{s:2:\"en\";s:12:\"Token module\";}', 'token', '0.5.01', NULL, 'a:1:{s:2:\"en\";s:16:\"Token management\";}', 0, 1, 1, 'content', 1, 1, 0, 1523370275),
(81, 'a:2:{s:2:\"en\";s:23:\"Appointments(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'appointments', '0.1.21', NULL, 'a:2:{s:2:\"en\";s:19:\"Appointments module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', 0, 1, 1, 'content', 1, 1, 0, 1523370275),
(53, 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'carte', '0.98', NULL, 'a:1:{s:2:\"fr\";s:28:\"Module de calendrier semaine\";}', 0, 1, 1, 'content', 0, 0, 0, 1521079824),
(70, 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'calendar', '0.1.01', NULL, 'a:1:{s:2:\"fr\";s:18:\"Calendrier semaine\";}', 0, 1, 1, 'content', 1, 1, 0, 1523370275),
(35, 'a:2:{s:2:\"en\";s:8:\"Products\";s:2:\"fr\";s:8:\"Produits\";}', 'products', '0.61.01', NULL, 'a:2:{s:2:\"en\";s:16:\"Products module.\";s:2:\"fr\";s:8:\"Produits\";}', 0, 1, 1, 'content', 0, 0, 0, 1523370275),
(59, 'a:2:{s:2:\"en\";s:6:\"Relays\";s:2:\"fr\";s:13:\"Points Relais\";}', 'relay', '1.0.5', NULL, 'a:2:{s:2:\"en\";s:11:\"Relays list\";s:2:\"fr\";s:23:\"Liste des Points Relais\";}', 0, 1, 1, 'content', 0, 0, 0, 1522326845),
(85, 'a:1:{s:2:\"fr\";s:11:\"Inscription\";}', 'inscription', '0.0.1', NULL, 'a:1:{s:2:\"fr\";s:11:\"Inscription\";}', 0, 1, 1, 'content', 1, 1, 0, 1523370280);

-- --------------------------------------------------------

--
-- Structure de la table `default_navigation_groups`
--

DROP TABLE IF EXISTS `default_navigation_groups`;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_navigation_groups`
--

INSERT INTO `default_navigation_groups` (`id`, `title`, `abbrev`) VALUES
(1, 'Header', 'header'),
(2, 'Sidebar', 'sidebar'),
(3, 'Footer', 'footer'),
(4, 'z_unused', 'z_unused'),
(5, 'Header Guest', 'header-guest'),
(6, 'Dev', 'dev');

-- --------------------------------------------------------

--
-- Structure de la table `default_navigation_links`
--

DROP TABLE IF EXISTS `default_navigation_links`;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL,
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
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_navigation_links`
--

INSERT INTO `default_navigation_links` (`id`, `title`, `parent`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `navigation_group_id`, `position`, `target`, `restricted_to`, `class`) VALUES
(2, 'Blog', 0, 'module', 0, 'blog', '', '', 4, 2, '', '0', ''),
(3, 'Contact', 0, 'page', 2, '', '', '', 3, 1, '', '0', ''),
(10, 'Connexion', NULL, 'uri', 0, '', '', 'users/login', 5, 1, '', '0', ''),
(11, 'Docteurs', 0, 'module', 0, 'doctor', '', '', 4, 1, '', '0', ''),
(12, 'Bootstrap', 0, 'page', 13, '', '', '', 6, 0, '', '0', ''),
(13, 'Dentistes', 0, 'uri', 0, '', '', 'doctor?c=dentiste', 3, 3, '', '0', ''),
(14, 'Médecins généralistes', 0, 'uri', 0, '', '', 'doctor?c=Médecins généralistes', 3, 2, '', '0', ''),
(15, 'Ophtalmologie', NULL, 'uri', 0, '', '', 'doctor?c=Ophtalmologue', 3, 4, '', '0', ''),
(16, 'Spécialistes ORL', NULL, 'uri', 0, '', '', 'doctor?c=ORL', 3, 5, '', '0', ''),
(17, 'Cardiologue', NULL, 'uri', 0, '', '', 'doctor?c=Cardiologue', 3, 6, '', '0', ''),
(18, 'Spécialistes femme', NULL, 'uri', 0, '', '', 'doctor?c=Spécialistes femme', 3, 7, '', '0', ''),
(19, 'Radiologue', NULL, 'uri', 0, '', '', 'doctor?c=Radiologue', 3, 8, '', '0', ''),
(20, 'Autres médecins', NULL, 'uri', 0, '', '', 'doctor?c=Autres médecins', 3, 9, '', '0', ''),
(21, ' Etablissements de santé', NULL, 'uri', 0, '', '', 'doctor?c= Etablissements de santé', 3, 10, '', '0', ''),
(23, 'test plugin show doctor', 0, 'page', 16, '', '', '', 6, 4, '', '0', ''),
(24, 'test plugin list doctors', 0, 'page', 15, '', '', '', 6, 6, '', '0', ''),
(30, 'Calendrier', 0, 'module', 0, 'calendar', '', '', 6, 1, '', '0', ''),
(31, 'Géolocalisation', NULL, 'page', 25, '', '', '', 6, 9, '', '0', '');

-- --------------------------------------------------------

--
-- Structure de la table `default_orders_details`
--

DROP TABLE IF EXISTS `default_orders_details`;
CREATE TABLE `default_orders_details` (
  `id` int(11) NOT NULL,
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
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_orders_list`
--

DROP TABLE IF EXISTS `default_orders_list`;
CREATE TABLE `default_orders_list` (
  `id` int(11) NOT NULL,
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
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_pages`
--

DROP TABLE IF EXISTS `default_pages`;
CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_pages`
--

INSERT INTO `default_pages` (`id`, `slug`, `class`, `title`, `uri`, `parent_id`, `type_id`, `entry_id`, `css`, `js`, `meta_title`, `meta_keywords`, `meta_robots_no_index`, `meta_robots_no_follow`, `meta_description`, `rss_enabled`, `comments_enabled`, `status`, `created_on`, `updated_on`, `restricted_to`, `is_home`, `strict_uri`, `order`) VALUES
(2, 'contact', '', 'Contact', 'contact', 0, '1', '2', '', '', '', '', 0, 0, '', 0, 0, 'live', 1495107568, 1495106656, '0', 0, 1, 1),
(3, 'search', '', 'Search', 'search', 0, '1', '3', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1495107568, 0, '', 0, 1, 2),
(4, 'results', '', 'Results', 'search/results', 3, '1', '4', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1495107568, 0, '', 0, 0, 0),
(5, '404', '', 'Page missing', '404', 0, '1', '5', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1495107568, 0, '', 0, 1, 3),
(37, 'proches-passes', '', 'Proches passés', 'rendez-vous/proches-passes', 28, '8', '37', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522938607, 0, '0', 0, 1, 6),
(13, 'bootstrap', '', 'bootstrap', 'bootstrap', 0, '1', '13', '', '', '', '', 0, 0, '', 0, 0, 'live', 1520637740, 1520640249, '0', 0, 1, 7),
(14, 'accueil-old', '', 'Accueil', 'accueil-old', 0, '3', '14', '.ico-grp { \n    max-width: 314px;\n}\n.specialite {\ndisplay: inline-block;\n    margin: 0%;\n    width: 100px;\n    text-align: center;\n    /* max-width: 33%; */\n    min-width: 85px;\n    height: 100px;\n    padding: 3%;\n    /* background: red; */\n}\ndiv.specialite:hover {\n    font-weight : bold;\n}\n#doctor-search {\n    margin: auto;\n    text-align: center;\n    max-width: 400px;\n} \n.set {\n    background-color: #dff0d8;\n    font-weight: bold;\n    color: #3c763d;\n}\ndiv.specialite p {\n    text-overflow: ellipsis;\n    text-align: center; \n    width: 100%;\n    height: 38px;\n    overflow: hidden;\n    font-size: small;\n}', '/* public vars */\nvar doctors = []; \nvar mApi = { \n    mapsUrl: \"https://maps.googleapis.com/maps/api/js?key=\",\n    key:\"AIzaSyDkUU_ti16t_PBfJ8o2-p_AciVkD8Q_2uo\",\n    geocodeUrl:\"https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=\",\n//    centLat:48.62,\n//    centLon:2.44, \n    zoom:10\n}; \n/* doctor module functions */\n/** builds locations map of doctors\n *  gets data from HTML5 data attributes in doctor\'s list\n * @returns {undefined}\n */\nfunction doctorsMap() \n{\n//    console.log(\'doctorsMap\');\n//    console.log(doctors);\n    if(typeof doctors === \'undefined\') return;\n    \n    \n    var map;\n    \n    //var elevator;\n    var myOptions = {\n        zoom: mApi.zoom,\n        center: new google.maps.LatLng(mApi.centLat ,mApi.centLon )\n        /*,\n        mapTypeId: \'terrain\'*/\n    };\n    \n    map = new google.maps.Map($(\"#map_canvas\")[0], myOptions); \n \n    for (var x = 0; x < doctors.length; x++) \n    {  \n//        var xadr;\n//        var xname; \n        console.log(\'loop:\'+x);\n        xadr = doctors[x].address;\n        xname = doctors[x].name;\n        /* geocode */\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \n        { \n            /* exit if has no values */\n            if(typeof(data) === \'undefined\') return;\n//            console.log(\'data:\'+data);\n            console.log(\'name:\'+data.results[0].formatted_address);\n            var p = data.results[0].geometry.location;\n//            console.log(\'location:\'+p);\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\n            console.log(\'loop \'+x+\' lat long:\'+latlng);\n            new google.maps.Marker({\n                position: latlng,\n                map: map,\n                title: xname\n            }); \n        });\n    }\n    /* center and zoom */\n    // map - instance of google Map v3\n    // markers - array of Markers\n    /*\n    var bounds = google.maps.reduce(function(bounds, marker) {\n        return bounds.extend(marker.getPosition());\n    }, new google.maps.LatLngBounds());\n\n    map.setCenter(bounds.getCenter());\n    map.fitBounds(bounds);\n*/\n}\n/**\n *  gets Google API JS and runs doctorMap on complete\n * @returns {undefined}\n */\nfunction loadMap() \n{\n    if($(\"#map_canvas\").length == 0) $(\'#doctors-list\').prepend(\'<div id=\"map_canvas\"></div>\');\n    /* correct height for small screens */\n//    if($( window ).height() < 400)\n//    {\n//        $(\'#map_canvas\').css(\'heigth\', 240);\n//    } \n//    console.log(\'loadMap: \'+mApi.mapsUrl + mApi.key);\n    //geocode first address for map center\n            /* geocode */\n            xadr = $(\'.doctor\').attr(\'data-id\');\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \n        { \n            /* exit if has no values */\n            if(typeof(data) === \'undefined\') return;\n            console.log(\'data:\'+data);\n            console.log(\'name:\'+data.results[0].formatted_address);\n            var p = data.results[0].geometry.location;\n            console.log(\'location:\'+p);\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\n            console.log(\'loop \'+x+\' lat long:\'+latlng); \n        });\n    \n    //\n    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);\n    $(\'#doctors-map-btn\').hide();\n    $(\'#doctors-map-btn\').after(\'<div id=\"map_canvas\"></div>\');\n    $(\'#map_canvas\').html(pg_load);\n}\n/** based on function from\n * https://stackoverflow.com/questions/6797569/get-city-name-using-geolocation\n * answered Apr 29 \'16 at 4:12 Mikhail\n * ********************************************************************************/ \nvar returned_address =\'\'; \nfunction geoGetTown() {\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\n} \nfunction geoSuccess(position) {\n    //console.log(position.coords.latitude)\n    //console.log(position.coords.longitude)\n\n    var geocoder = \'https://maps.googleapis.com/maps/api/geocode/json?latlng=\' + position.coords.latitude + \'%2C\' + position.coords.longitude + \'&language=en&key=\' + mApi.key;\n\n    $.getJSON(geocoder).done(function(location) \n    {\n//        console.log(location); \n        returned_address=location.results[0].address_components[2].long_name;\n        $(\'#doctor-search input[name=s]\').val(returned_address); \n        $(\'.searchbox-area\').addClass(\'has-success\'); \n        $(\'.searchbox-area input\').addClass(\'set\'); \n    });\n} \nfunction geoError(err) {\n    console.log(err);\n    alert(\"positioning error\");\n} \n/********************************************************************************/  \n {{if false }}\nfunction myPosition(position) {\n    var infopos = \"Position déterminée :\\n\";\n    infopos += \"Latitude : \"+position.coords.latitude +\"\\n\";\n    infopos += \"Longitude: \"+position.coords.longitude+\"\\n\";\n    infopos += \"Altitude : \"+position.coords.altitude +\"\\n\";\n    return infopos;\n}\n{{endif}}\n{{# load doctor module JS #}}\n{{# doctor:js #}}\n\n/** empties search box\n * \n * @returns {undefined}\n */\n function cleanDocSearch()\n {\n     console.log(\'clean\');\n     $(\'.searchbox-query\').removeClass(\'has-success\'); \n     $(\'#doctor-search input[name=c]\').val(\'\').removeClass(\'set\');\n    /*UX*/\n    \n    $(\'#categories\').show();\n }\n function cleanAreaSearch()\n {\n     console.log(\'clean\');\n     $(\'.searchbox-area\').removeClass(\'has-success\'); \n     $(\'#doctor-search input[name=s]\').val(\'\').removeClass(\'set\');\n    /*UX*/ \n//    $(\'.titre-auto\').hide() ;\n }\n \n \n$( document ).ready(function() \n{    \n        /*geo btn */\n        /* remove geo btn if no localisation */\n//        if(navigator.geolocation !== true) \n//        {\n//            $(\'.searchbox-locate .input-group-addon a\').addClass(\'disabled\');\n//        } else {\n            $(\'.searchbox-locate a\').removeClass(\'disabled\'); \n//        }  \n        /* UIX select all */\n        $(\'.searchbox-query input, .searchbox-area input\').on(\'focus\', function(){ this.select(); });\n        /* jquery autocomplete */\n        $( function() {\n          var medicSpecialities = [\n                  \"Dentiste\",\n                  \"Généraliste\",\n                  \"Chirurgien dentiste\",\n                  \"Médecin généraliste\",\n                  \"Pédiatre\",\n                  \"Gynécologue obstétrique ou médical\",\n                  \"Ophtalmologue\",\n                  \"Dermatologue\",\n                  \"Ostéopathe\",\n                  \"Kinésithérapeute\",\n                  \"Pédicure – Podologue\",\n                  \"Sage – femme\",\n                  \"ORL\",\n                  \"Allergologue\",\n                  \"Urologue\",\n                  \"Rhumatologue\",\n                  \"Endocrinologue\",\n                  \"Stomatologue\",\n                  \"Orthopédiste\",\n                  \"Diététicien\",\n                  \"Psychologue\",\n                  \"Neurologue\",\n                  \"Psychiatre\",\n                  \"Radiologue\",\n                  \"Cardiologue\",\n                  \"Gastro-entérologue et hépatologue\"\n          ];\n          $( \".searchbox-query input\" ).autocomplete({\n            source: medicSpecialities\n          });\n        } ); \n    //add functionality to specialities\n    $(\'.ico-grp .specialite\').each(function() {\n        $( this ).on(\'click\', function _selectType(event) \n        {\n            if(typeof(event)!==\'undefined\') event.preventDefault();\n            var cat = $(this).attr(\"data-cat\"); \n            var type = $(this).attr(\"data-type\"); \n            $(\'.searchbox-query\').addClass(\'has-success\');\n            $(\'#doctor-search input[name=c]\').val(cat).addClass(\'set\');\n            /*UX*/\n            $(\'#categories\').hide();\n            $(\'.titre-auto\').show().text(\'Choisir votre \'+cat.toLowerCase());\n            \n//            $(\'.titre-\'+type).slideDown();\n            console.log(type);\n            \n            \n//            /* https://www.taniarascia.com/smooth-scroll-to-id-with-jquery/ */\n//            $(\'html, body\').animate({\n//                    scrollTop: $(\'div.searchbox-query\').offset().top\n//            }, 500, \'linear\');\n        });\n    });\n\n});', '', '', 0, 0, '', 0, 0, 'live', 1520641201, 1523113943, '2', 1, 1, 0),
(27, 'tests', '', 'Tests', 'tests', 0, '1', '27', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923491, 1522924134, '0', 0, 1, 6),
(15, 'test-plugin-list-doctors', '', 'test plugin list doctors', 'tests/test-plugin-list-doctors', 27, '1', '15', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521475440, 1521478872, '0', 0, 1, 1),
(16, 'test-plugin-show-doctor', '', 'test plugin show doctor', 'tests/test-plugin-show-doctor', 27, '1', '16', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521478197, 1521478847, '0', 0, 0, 0),
(34, 'rdv-passes-de-mes-proches', '', 'RDV passés de mes proches', 'rendez-vous/rdv-passes-de-mes-proches', 28, '6', '34', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923826, 0, '0', 0, 1, 7),
(35, 'test-appointments', '', 'test appointments', 'tests/test-appointments', 27, '1', '35', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522924171, 1522924197, '0', 0, 1, 2),
(36, 'proches-a-venir', '', 'Proches à venir', 'rendez-vous/proches-a-venir', 28, '7', '36', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522938584, 0, '0', 0, 1, 2),
(33, 'mes-rdv-passes', '', 'Mes RDV passés', 'rendez-vous/mes-rdv-passes', 28, '6', '33', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923814, 0, '0', 0, 1, 5),
(32, 'rdv-passes', '', 'RDV passés', 'rendez-vous/rdv-passes', 28, '6', '32', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923693, 0, '0', 0, 1, 4),
(31, 'rdv-a-venir-de-mes-proches', '', 'RDV à venir de mes proches', 'rendez-vous/rdv-a-venir-de-mes-proches', 28, '5', '31', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923681, 0, '0', 0, 1, 3),
(30, 'mes-rdv-a-venir', '', 'Mes RDV à venir', 'rendez-vous/mes-rdv-a-venir', 28, '5', '30', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923669, 1522924538, '0', 0, 1, 1),
(29, 'rdv-a-venir', '', 'RDV à venir', 'rendez-vous/rdv-a-venir', 28, '5', '29', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923654, 0, '0', 0, 1, 0),
(28, 'rendez-vous', '', 'Rendez Vous', 'rendez-vous', 0, '4', '28', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923635, 0, '0', 0, 1, 8),
(25, 'geolocalisation', '', 'Géolocalisation', 'geolocalisation', 0, '1', '25', '', 'function geoGetPosition() \n{ \n	$(\'#position input\').val(\'\');\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\n} \nfunction geoSuccess(position) \n{ \n	console.log(position.coords.latitude);\n	console.log(position.coords.longitude);\n          var text = \'LAT: \' + position.coords.latitude ;\n  text += \' - LONG:  \' + position.coords.longitude ; \n	$(\'#position input\').val(text);\n} \nfunction geoError(err) \n{\n    console.log(err);\n    alert(\"positioning error\");\n}  \n \n/** On document ready, go  */      \n$( document ).ready(function() \n{      \n});', '', '', 0, 0, '', 0, 0, 'live', 1522164418, 1522319862, '0', 0, 1, 4),
(38, 'accueil-pro', '', 'accueil pro', 'accueil-pro', 0, '9', '38', '', '', '', '', 0, 0, '', 0, 0, 'live', 1523286758, 1523332992, '0', 0, 1, 1523286758),
(26, 'accueil-root', '', 'Accueil root', 'accueil-root', 0, '1', '26', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522322590, 1522322596, '0', 0, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `default_page_types`
--

DROP TABLE IF EXISTS `default_page_types`;
CREATE TABLE `default_page_types` (
  `id` int(11) NOT NULL,
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
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_page_types`
--

INSERT INTO `default_page_types` (`id`, `slug`, `title`, `description`, `stream_id`, `meta_title`, `meta_keywords`, `meta_description`, `body`, `css`, `js`, `theme_layout`, `updated_on`, `save_as_files`, `content_label`, `title_label`) VALUES
(1, 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', 2, '', NULL, '', '<h2>{{ page:title }}</h2> \r\n\r\n{{ pre_html }}\r\n{{ body }}\r\n{{ post_html }}', '', '', 'default.html', 1520641230, 'n', '', ''),
(3, 'accueil_msante', 'Accueil MSanté', 'Page d’accueil MSanté', 2, '', NULL, '', '{{ dev:empty_cache }}\n<!-- accueil msante page type -->\n{{if !custom:subdomain_value and page:is_home }} \n<div id=\"categories\"> \n    <div class=\"text-center h3 titre-rdv\"> \n        Prenez rendez vous avec votre professionnel de sant&eacute; \n    </div> \n</div>\n\n\n<div class=\"h3 text-center titre-auto\">   \n</div>\n{{# doctor:search_box #}} \n<div id=\"doctor-search\" class=\"\">\n                <!-- doctor search -->\n            <!--\n    <form method=\"get\" action=\"{{url:site}}doctor\">\n        <div class=\"form-group searchbox-query\">\n            <div class=\"input-group\">\n                <span class=\"input-group-addon\">\n                    <a class=\"\" onclick=\"cleanDocSearch()\">\n                        <i class=\"glyphicon glyphicon-remove-circle\"></i>\n                    </a>\n                </span>\n                <input type=\"text\" name=\"c\" value=\"\" placeholder=\"Domaine ou spécialité médicale\" class=\"form-control ui-autocomplete-input\" autocomplete=\"off\">\n            </div> \n        </div> \n        <div class=\"form-group searchbox-locate\"> \n                <div class=\"input-group center-block\">\n                    <a class=\"btn btn-success disabled\" onclick=\"geoGetTown()\">\n                        <i class=\"glyphicon glyphicon-map-marker\"></i> Autour de vous\n                    </a>\n                </div> \n            </div>\n        <div class=\"form-group searchbox-area\"> \n            <div class=\"input-group\">\n                <span class=\"input-group-addon\">\n                    <a class=\"\" onclick=\"cleanAreaSearch()\">\n                        <i class=\"glyphicon glyphicon-remove-circle\"></i>\n                    </a>\n                </span>\n                <input type=\"text\" name=\"s\" value=\"\" placeholder=\"Ville, quartier ou CP\" class=\"form-control\">                  \n            </div>\n        </div> \n        <div class=\"form-group searchbox-btn\"> \n                <button name=\"submitBtn\" type=\"submit\" class=\"btn btn-primary\">\n                        <i class=\"glyphicon glyphicon-search\"></i> Rechercher\n                </button> \n        </div>\n    </form>\n            -->\n</div>\n\n{{endif}}\n\n{{# dessous gabarit des pages normales, sauf titre H2  #}}\n\n{{ pre_html }}\n{{ body }}\n{{ post_html }}', '.ico-grp { \n    max-width: 314px;\n}\n.specialite {\ndisplay: inline-block;\n    margin: 0%;\n    width: 100px;\n    text-align: center;\n    /* max-width: 33%; */\n    min-width: 85px;\n    height: 100px;\n    padding: 3%;\n    /* background: red; */\n}\ndiv.specialite:hover {\n    font-weight : bold;\n}\n#doctor-search {\n    margin: auto;\n    text-align: center;\n    max-width: 400px;\n} \n.set {\n    background-color: #dff0d8;\n    font-weight: bold;\n    color: #3c763d;\n}\ndiv.specialite p {\n    text-overflow: ellipsis;\n    text-align: center; \n    width: 100%;\n    height: 38px;\n    overflow: hidden;\n    font-size: small;\n}', '/* public vars */\nvar doctors = []; \nvar mApi = { \n    mapsUrl: \"https://maps.googleapis.com/maps/api/js?key=\",\n    key:\"AIzaSyDkUU_ti16t_PBfJ8o2-p_AciVkD8Q_2uo\",\n    geocodeUrl:\"https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=\",\n//    centLat:48.62,\n//    centLon:2.44, \n    zoom:10\n}; \n/* doctor module functions */\n/** builds locations map of doctors\n *  gets data from HTML5 data attributes in doctor\'s list\n * @returns {undefined}\n */\nfunction doctorsMap() \n{\n//    console.log(\'doctorsMap\');\n//    console.log(doctors);\n    if(typeof doctors === \'undefined\') return;\n    \n    \n    var map;\n    \n    //var elevator;\n    var myOptions = {\n        zoom: mApi.zoom,\n        center: new google.maps.LatLng(mApi.centLat ,mApi.centLon )\n        /*,\n        mapTypeId: \'terrain\'*/\n    };\n    \n    map = new google.maps.Map($(\"#map_canvas\")[0], myOptions); \n \n    for (var x = 0; x < doctors.length; x++) \n    {  \n//        var xadr;\n//        var xname; \n        console.log(\'loop:\'+x);\n        xadr = doctors[x].address;\n        xname = doctors[x].name;\n        /* geocode */\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \n        { \n            /* exit if has no values */\n            if(typeof(data) === \'undefined\') return;\n//            console.log(\'data:\'+data);\n            console.log(\'name:\'+data.results[0].formatted_address);\n            var p = data.results[0].geometry.location;\n//            console.log(\'location:\'+p);\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\n            console.log(\'loop \'+x+\' lat long:\'+latlng);\n            new google.maps.Marker({\n                position: latlng,\n                map: map,\n                title: xname\n            }); \n        });\n    }\n    /* center and zoom */\n    // map - instance of google Map v3\n    // markers - array of Markers\n    /*\n    var bounds = google.maps.reduce(function(bounds, marker) {\n        return bounds.extend(marker.getPosition());\n    }, new google.maps.LatLngBounds());\n\n    map.setCenter(bounds.getCenter());\n    map.fitBounds(bounds);\n*/\n}\n/**\n *  gets Google API JS and runs doctorMap on complete\n * @returns {undefined}\n */\nfunction loadMap() \n{\n    if($(\"#map_canvas\").length == 0) $(\'#doctors-list\').prepend(\'<div id=\"map_canvas\"></div>\');\n    /* correct height for small screens */\n//    if($( window ).height() < 400)\n//    {\n//        $(\'#map_canvas\').css(\'heigth\', 240);\n//    } \n//    console.log(\'loadMap: \'+mApi.mapsUrl + mApi.key);\n    //geocode first address for map center\n            /* geocode */\n            xadr = $(\'.doctor\').attr(\'data-id\');\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \n        { \n            /* exit if has no values */\n            if(typeof(data) === \'undefined\') return;\n            console.log(\'data:\'+data);\n            console.log(\'name:\'+data.results[0].formatted_address);\n            var p = data.results[0].geometry.location;\n            console.log(\'location:\'+p);\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\n            console.log(\'loop \'+x+\' lat long:\'+latlng); \n        });\n    \n    //\n    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);\n    $(\'#doctors-map-btn\').hide();\n    $(\'#doctors-map-btn\').after(\'<div id=\"map_canvas\"></div>\');\n    $(\'#map_canvas\').html(pg_load);\n}\n/** based on function from\n * https://stackoverflow.com/questions/6797569/get-city-name-using-geolocation\n * answered Apr 29 \'16 at 4:12 Mikhail\n * ********************************************************************************/ \nvar returned_address =\'\'; \nfunction geoGetTown() {\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\n} \nfunction geoSuccess(position) {\n    //console.log(position.coords.latitude)\n    //console.log(position.coords.longitude)\n\n    var geocoder = \'https://maps.googleapis.com/maps/api/geocode/json?latlng=\' + position.coords.latitude + \'%2C\' + position.coords.longitude + \'&language=en&key=\' + mApi.key;\n\n    $.getJSON(geocoder).done(function(location) \n    {\n//        console.log(location); \n        returned_address=location.results[0].address_components[2].long_name;\n        $(\'#doctor-search input[name=s]\').val(returned_address); \n        $(\'.searchbox-area\').addClass(\'has-success\'); \n        $(\'.searchbox-area input\').addClass(\'set\'); \n    });\n} \nfunction geoError(err) {\n    console.log(err);\n    alert(\"positioning error\");\n} \n/********************************************************************************/  \n {{if false }}\nfunction myPosition(position) {\n    var infopos = \"Position déterminée :\\n\";\n    infopos += \"Latitude : \"+position.coords.latitude +\"\\n\";\n    infopos += \"Longitude: \"+position.coords.longitude+\"\\n\";\n    infopos += \"Altitude : \"+position.coords.altitude +\"\\n\";\n    return infopos;\n}\n{{endif}}\n{{# load doctor module JS #}}\n{{# doctor:js #}}\n\n/** empties search box\n * \n * @returns {undefined}\n */\n function cleanDocSearch()\n {\n     console.log(\'clean\');\n     $(\'.searchbox-query\').removeClass(\'has-success\'); \n     $(\'#doctor-search input[name=c]\').val(\'\').removeClass(\'set\');\n    /*UX*/\n    \n    $(\'#categories\').show();\n }\n function cleanAreaSearch()\n {\n     console.log(\'clean\');\n     $(\'.searchbox-area\').removeClass(\'has-success\'); \n     $(\'#doctor-search input[name=s]\').val(\'\').removeClass(\'set\');\n    /*UX*/ \n//    $(\'.titre-auto\').hide() ;\n }\n \n \n$( document ).ready(function() \n{    \n        /*geo btn */\n        /* remove geo btn if no localisation */\n//        if(navigator.geolocation !== true) \n//        {\n//            $(\'.searchbox-locate .input-group-addon a\').addClass(\'disabled\');\n//        } else {\n            $(\'.searchbox-locate a\').removeClass(\'disabled\'); \n//        }  \n        /* UIX select all */\n        $(\'.searchbox-query input, .searchbox-area input\').on(\'focus\', function(){ this.select(); });\n        /* jquery autocomplete */\n        $( function() {\n          var medicSpecialities = [\n                  \"Dentiste\",\n                  \"Généraliste\",\n                  \"Chirurgien dentiste\",\n                  \"Médecin généraliste\",\n                  \"Pédiatre\",\n                  \"Gynécologue obstétrique ou médical\",\n                  \"Ophtalmologue\",\n                  \"Dermatologue\",\n                  \"Ostéopathe\",\n                  \"Kinésithérapeute\",\n                  \"Pédicure – Podologue\",\n                  \"Sage – femme\",\n                  \"ORL\",\n                  \"Allergologue\",\n                  \"Urologue\",\n                  \"Rhumatologue\",\n                  \"Endocrinologue\",\n                  \"Stomatologue\",\n                  \"Orthopédiste\",\n                  \"Diététicien\",\n                  \"Psychologue\",\n                  \"Neurologue\",\n                  \"Psychiatre\",\n                  \"Radiologue\",\n                  \"Cardiologue\",\n                  \"Gastro-entérologue et hépatologue\"\n          ];\n          $( \".searchbox-query input\" ).autocomplete({\n            source: medicSpecialities\n          });\n        } ); \n    //add functionality to specialities\n    $(\'.ico-grp .specialite\').each(function() {\n        $( this ).on(\'click\', function _selectType(event) \n        {\n            if(typeof(event)!==\'undefined\') event.preventDefault();\n            var cat = $(this).attr(\"data-cat\"); \n            var type = $(this).attr(\"data-type\"); \n            $(\'.searchbox-query\').addClass(\'has-success\');\n            $(\'#doctor-search input[name=c]\').val(cat).addClass(\'set\');\n            /*UX*/\n            $(\'#categories\').hide();\n            $(\'.titre-auto\').show().text(\'Choisir votre \'+cat.toLowerCase());\n            \n//            $(\'.titre-\'+type).slideDown();\n            console.log(type);\n            \n            \n//            /* https://www.taniarascia.com/smooth-scroll-to-id-with-jquery/ */\n//            $(\'html, body\').animate({\n//                    scrollTop: $(\'div.searchbox-query\').offset().top\n//            }, 500, \'linear\');\n        });\n    });\n\n});\n', 'default.html', 1520641079, 'y', '', ''),
(5, 'patients_rdv_futurs', 'patients RDV futurs', 'Patients : Liste des RDV futurs', 2, '', NULL, '', '{{ dev:empty_cache }} \n{{if user:logged_in }} \n    {{if !{appointments:my_appointments_count futur_past=\"futur\" for_user=\"[[ if page:slug == \'mes-rdv-a-venir\' ]]yes[[ elseif page:slug == \'rdv-a-venir-de-mes-proches\'  ]]no[[ endif ]]\" for_name=[[custom:get_value name=\"s\"]]} }}\n        <p class=\"alert alert-warning\"> \n            Pas de RDV à venir\n        </p> \n    {{else}}\n        <p class=\"alert alert-info\"> <i class=\"close\">×</i>\n            {{ appointments:my_appointments_count futur_past=\"futur\" for_user=\"[[ if page:slug == \'mes-rdv-a-venir\' ]]yes[[ elseif page:slug == \'rdv-a-venir-de-mes-proches\'  ]]no[[ endif ]]\"  for_name=[[custom:get_value name=\"s\"]] }} \n            enregistrements\n        </p> \n        \n        {{ appointments:my_appointments futur_past=\"futur\" for_user=\"[[ if page:slug == \'mes-rdv-a-venir\' ]]yes[[ elseif page:slug == \'rdv-a-venir-de-mes-proches\'  ]]no[[ endif ]]\"  for_name=[[custom:get_value name=\"s\"]] }} \n        <div class=\"panel panel-default panel-success\">\n                        <div class=\"panel-heading\"> \n                                <h4>\n                                        Le\n                                         {{date_day_str}}  {{date_month_str}}  \n                                        à  {{time_formatted}} \n                                </h4>\n\n                                 <!--\n                                 [{{appointment_time}}   - \n                                 doc {{doctor_id}} user {{user_id}}]\n                                  -->\n                        </div>\n                        <div class=\"panel-body\">    \n                            <a href=\"{{url:site}}doctor/info/{{doc_id}}\">\n                                    <!-- img -->\n                                         {{if filename}}\n                                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                                            {{elseif doc_speciality}}  \n                                                        <img src=\"{{url:site}}files/large/{{doctor:speciality_img speciality=doc_speciality}}\" \n                                                             height=\"80\" style=\"float:left;margin-right:20px;\"\n                                                             class=\"img-circle\" /> \n                                            {{else}} \n                                            {{# default image #}}\n                                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                                        {{endif}}\n                                    <!-- img end  --> \n                            </a>\n                            <p>\n                                {{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n                                 <br /> \n                                {{doc_address}} {{doc_area}} {{doc_town}} \n                            </p>		\n\n                            <p class=\"for_user_ico\">\n                            {{if for_user == \"no\" }}\n                                RDV pour: {{first_name}} {{last_name}}\n                            {{else}}\n                                <i class=\"glyphicon glyphicon-user\"></i>\n                            {{endif}}\n                            </p>\n                            <div class=\"clearfix\"></div>\n\n                            <center class=\"\"> \n                                    <a class=\"btn btn-danger loader\" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \n                            </center> 		 \n                        </div>\n        </div> \n        {{ /appointments:my_appointments }} \n    {{endif}}\n{{else}}\n    {{ url:redirect to=\"users/login\" }}\n{{endif}}', '', '', 'default.html', 1523041873, 'y', '', ''),
(6, 'patients_rdv_passes', 'patients RDV passés', 'Patients : Liste des RDV passés', 2, '', NULL, '', '{{ dev:empty_cache }} \n{{if user:logged_in }}\n    {{if !{appointments:my_appointments_count futur_past=\"past\" for_user=\"[[ if page:slug == \'mes-rdv-passes\' ]]yes[[ elseif page:slug == \'rdv-passes-de-mes-proches\'  ]]no[[ endif ]]\" for_name=[[custom:get_value name=\"s\"]]} }}\n        <p class=\"alert alert-warning\"> \n            Pas de RDV à venir\n        </p> \n    {{else}}\n        <p class=\"alert alert-info\"> <i class=\"close\">×</i>\n            {{ appointments:my_appointments_count futur_past=\"past\" for_user=\"[[ if page:slug == \'mes-rdv-passes\' ]]yes[[ elseif page:slug == \'rdv-passes-de-mes-proches\'  ]]no[[ endif ]]\"  for_name=[[custom:get_value name=\"s\"]] }} \n            enregistrements\n        </p> \n            {{ appointments:my_appointments futur_past=\"past\" for_user=\"[[ if page:slug == \'mes-rdv-passes\' ]]yes[[ elseif page:slug == \'rdv-passes-de-mes-proches\'  ]]no[[ endif ]]\"  for_name={custom:get_value name=\"s\"}  }} \n\n            <div class=\"panel panel-default \">\n                            <div class=\"panel-heading\"> \n                                    <h4>\n                                            Le\n                                             {{date_day_str}}  {{date_month_str}}  \n                                            à  {{time_formatted}} \n                                    </h4>\n\n                                     <!--\n                                     [{{appointment_time}}   - \n                                     doc {{doctor_id}} user {{user_id}}]\n                                      -->\n                            </div>\n\n                            <div class=\"panel-body\">   \n\n                                <a href=\"{{url:site}}doctor/info/{{doc_id}}\"> \n                                    <!-- img -->\n                                         {{if filename}}\n                                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                                            {{elseif doc_speciality}}  \n                                                        <img src=\"{{url:site}}files/large/{{doctor:speciality_img speciality=doc_speciality}}\" \n                                                             height=\"80\" style=\"float:left;margin-right:20px;\"\n                                                             class=\"img-circle\" /> \n                                            {{else}} \n                                            {{# default image #}}\n                                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                                        {{endif}}\n                                    <!-- img end  --> \n                                </a>\n\n                                     <p>\n                                         {{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n                                          <br /> \n                                         {{doc_address}} {{doc_area}} {{doc_town}}   \n                                     </p>\n\n                                     <p class=\"for_user_ico\">\n                                     {{if for_user == \"no\" }}\n                                         RDV pour: {{first_name}} {{last_name}}\n                                     {{else}}\n                                         <i class=\"glyphicon glyphicon-user\"></i>\n                                     {{endif}}\n                                     </p>\n                                     <div class=\"clearfix\"></div>\n\n                                    <center class=\"\"> \n                                            <a class=\"btn btn-info loader\"  href=\"{{url:site}}calendar/doctor/{{id}}\">Reprendre ce RDV</a>			 \n                                    </center> 		 	 \n                            </div>\n            </div> \n            {{ /appointments:my_appointments }}\n    {{endif}}\n{{else}}\n    {{ url:redirect to=\"users/login\" }}\n{{endif}}', '', '', 'default.html', 1523012169, 'y', '', ''),
(7, 'patients_list_proches_futur', 'Patients list proches futur', 'Patients : liste des proches avec un RDV à venir', 2, '', NULL, '', '{{ dev:empty_cache }} \n<!-- liste proches  -->\n<h3>Liste de mes proches</h3> \n{{if !{appointments:other_persons_count futur_past=\"futur\"} }}\n    <p class=\"alert alert-warning\">Il n\'y a pas de proches ayant pris un RDV à venir</p>\n{{else}}\n    <div class=\"btn-group-vertical center-block\"> \n        {{ appointments:other_persons futur_past=\"futur\" }}     \n                    <a class=\"loader btn btn-default\" href=\"{{url:site}}rendez-vous/rdv-a-venir-de-mes-proches/?s={{ first_name }} {{ last_name }}\">\n                        {{ first_name }} {{ last_name }} \n                    </a> \n                <br/>\n         {{ /appointments:other_persons }}\n    </div> \n    <p class=\"text-muted\"> \n        {{ appointments:other_persons_count futur_past=\"futur\" }} resultats \n    </p>  \n{{endif}}\n\n ', '', '', 'default.html', 1522938508, 'y', '', ''),
(8, 'patients_list_proches_passes', 'Patients list proches passes', 'Patients : liste des proches avec un RDV passé', 2, '', NULL, '', '{{ dev:empty_cache }} \n<!-- liste proches  -->\n<h3>Liste de mes proches</h3>\n{{ appointments:other_persons_count futur_past=\"past\" }} \n{{if !{appointments:other_persons_count futur_past=\"past\"} }}\n    <p class=\"alert alert-warning\">Il n\'y a pas de proches ayant pris un RDV qui soit passés</p>\n{{else}}\n    <div class=\"btn-group-vertical center-block\">\n            {{ appointments:other_persons futur_past=\"past\" }}    \n                        <a class=\"loader btn btn-default\" href=\"{{url:site}}rendez-vous/rdv-passes-de-mes-proches/?s={{ first_name }} {{ last_name }}\">\n                            {{ first_name }} {{ last_name }} \n                        </a> \n             {{ /appointments:other_persons }}\n    </div>   \n    <p class=\"text-muted\"> \n        {{ appointments:other_persons_count futur_past=\"past\" }} resultats \n    </p>  \n{{endif}}\n ', '', '', 'default.html', 1522938540, 'y', '', ''),
(4, 'rendez_vous', 'Rendez vous', 'Affichage des RDV du patient', 2, '', NULL, '', '{{ dev:empty_cache }} \n \n{{if !{url:segments segment=\"2\"} }}\n	<!-- <h3>Rendez vous</h3>  -->\n	<ul class=\"list-group\">\n		<li class=\"list-group-item active\"><a href=\"{{url:site}}{{url:uri_string}}/rdv-a-venir\" class=\"loader btn\">RDV à venir</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/mes-rdv-a-venir\" class=\"loader btn\">Mes RDV à venir</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/proches-a-venir\" class=\"loader btn\">RDV à venir de mes proches</a></li>\n	</ul>\n	<ul class=\"list-group\">\n		<li class=\"list-group-item active\"><a href=\"{{url:site}}{{url:uri_string}}/rdv-passes\" class=\"loader btn\">RDV passés</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/mes-rdv-passes\" class=\"loader btn\">Mes RDV passés</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/proches-passes\" class=\"loader btn\">RDV passés de mes proches</a></li>\n	</ul>\n	 \n{{endif}}\n', 'div.content li.active a {\n    color: white;\n}', '', 'default.html', 1521766621, 'y', '', ''),
(9, 'pro__home', 'Pro : home', 'Accueil pour domaine pro', 2, '', NULL, '', '<!-- pro home --> \n{{ dev:empty_cache }} \n{{if user:not_logged_in }}\n            {{ url:redirect to=\"users/login\" }}\n{{else}}  \n            {{if  msante:pro_has_no_doctor_id }}\n                    <p class=\"alert alert-warning\">\n                        <a href=\"{{custom:base_domain}}/users/edit/\">Veuillez parametrer un N° d\'identifiant docteur</a> (via domaine de base, cf liste docteurs avec droits admin) <br/>\n                        <a href=\"{{custom:base_domain}}/admin/doctor/\">Vue admin docteurs</a> \n                    </p>\n            {{else}} \n            <!--  \n            <p class=\"alert alert-info\">\n                    Id docteur: {{msante:pro_doctor_id}} <a href=\"{{custom:base_domain}}/users/edit/\">(Editer via domaine de base)</a> \n                        <a href=\"{{custom:base_domain}}/admin/doctor/\">Vue admin docteurs</a> \n\n            </p>\n            -->\n            {{endif}}\n            {{if  pro_has_no_setting }}\n                    <p class=\"alert alert-warning\">\n                        <a href=\"{{custom:base_domain}}/users/edit/\">Vos paramètres d\'accueil sont vide.</a>\n                    </p>\n            {{endif}}\n\n\n            {{#custom:base_domain#}} \n\n            <div class=\"panel-group\" id=\"pro-home\">\n                {{#-------------------------------------------------------------------------------------#}}\n                {{if  {msante:pro_has_setting name=\"appointements\"} }}\n                            <!-- appointments --> \n                            <div class=\"panel panel-default\">\n                              <div class=\"panel-heading\">\n                                <h4 class=\"panel-title\">\n                                  <a data-toggle=\"collapse\" data-parent=\"#pro-home\" href=\"#collapse1\">Mes RDV</a>\n                                </h4>\n                              </div>\n                              <div id=\"collapse1\" class=\"panel-collapse collapse in\">\n                                <div class=\"panel-body\">\n\n                                    <!-- jquery datepicker calendar --> \n                                    <div class=\"calendar-wrapper\">\n                                        <div id=\"datepicker\">{{# DATEPICKER DIV #}}</div> \n                                        <div id=\"date-text\" class=\"h4\"></div> \n                                        <div id=\"date-digest\" class=\"h5\"></div> \n                                        <div id=\"date-btn\" class=\"\">\n                                            <a id=\"date-btn\" class=\"btn btn-default btn-group-justified btn-primary\" style=\"display: none\" >Voir le détail</a>    \n                                        </div> \n                                    </div> \n                                    <div id=\"mes-dispos\"><button class=\"btn btn-group-justified btn-link disabled\" >Mes disponibilités</button></div> \n\n                                </div>\n                              </div>\n                            </div>  \n                {{endif}}\n                {{#-------------------------------------------------------------------------------------#}}\n                {{if {msante:pro_has_setting name=\"flags\"} }}\n                            <!-- appointments --> \n                            <div class=\"panel panel-default\">\n                              <div class=\"panel-heading\">\n                                <h4 class=\"panel-title\">\n                                  <a data-toggle=\"collapse\" data-parent=\"#pro-home\" href=\"#collapse2\">Mes Alertes</a>\n                                </h4>\n                              </div>\n                              <div id=\"collapse2\" class=\"panel-collapse collapse\">\n                                <div class=\"panel-body\">XXX____CONTENT____XXXX</div>\n                              </div>\n                            </div>  \n                {{endif}} \n                {{#-------------------------------------------------------------------------------------#}}\n                {{if {msante:pro_has_setting name=\"messages\"} }}\n                            <!-- appointments --> \n                            <div class=\"panel panel-default\">\n                              <div class=\"panel-heading\">\n                                <h4 class=\"panel-title\">\n                                  <a data-toggle=\"collapse\" data-parent=\"#pro-home\" href=\"#collapse3\">Mes Messages</a>\n                                </h4>\n                              </div>\n                              <div id=\"collapse3\" class=\"panel-collapse collapse\">\n                                <div class=\"panel-body\">XXX____CONTENT____XXXX</div>\n                              </div>\n                            </div>  \n                {{endif}} \n                {{#-------------------------------------------------------------------------------------#}}\n                {{if {msante:pro_has_setting name=\"listing\"} }}\n                            <!-- appointments --> \n                            <div class=\"panel panel-default\">\n                              <div class=\"panel-heading\">\n                                <h4 class=\"panel-title\">\n                                  <a data-toggle=\"collapse\" data-parent=\"#pro-home\" href=\"#collapse4\">Mes Patients</a>\n                                </h4>\n                              </div>\n                              <div id=\"collapse4\" class=\"panel-collapse collapse\">\n                                <div class=\"panel-body\">XXX____CONTENT____XXXX</div>\n                              </div>\n                            </div>  \n                {{endif}}  \n                {{#-------------------------------------------------------------------------------------#}}\n            </div>\n\n\n\n\n            <p>\n                <a href=\"{{url:site}}/users/edit/\" class=\"btn btn-default btn-group-justified \">Mes paramètres d\'accueil</a>\n            </p>\n\n\n\n            <p>\n                <a href=\"{{url:site}}/users/logout/\" class=\"btn btn-default btn-group-justified \">DECONNEXION</a>\n            </p>\n\n \n{{endif}}\n\n\n\n\n\n\n\n\n{{if false }}    \n    {{ user:edit_fields }}\n\n        <p>{{ name }}: {{ value }}</p>\n\n    {{ /user:edit_fields }}\n    \n{{endif}}\n\n\n{{if FALSE}}\n  <table>\n                                <tr>\n					<th>Date</th> \n					<th>Heure</th> \n					<th>Sexe</th> \n					<th>Nom</th> \n					<th>Prénom</th> \n				</tr>\n{{ appointments:my_pro_appointments }}\n{{if FALSE}}\n<br>\n  {{appointment_date}} à {{appointment_time}}  : \n  {{gender}}  \n  {{first_name}}    {{last_name}}   \n  {{endif}}\n				<tr> \n					<td>{{short_dayname}} {{month}} </td>\n					<td>{{time_formatted}}</td>\n					<td>{{gender}}</td>\n					<td>{{first_name}}</td>\n					<td>{{last_name}}</td> \n				</tr> \n{{ /appointments:my_pro_appointments }}\n      \n  </table> \n  {{endif}}', ' \ndiv#datepicker {\n    width: 100%;\n}\n.calendar-wrapper {\n    width: 260px;\n    margin: auto;\n}\ndiv#date-text {\n    margin-top: 10px;\n}', 'function pad(pad, str, padLeft) {\n  if (typeof str === \'undefined\') \n    return pad;\n  if (padLeft) {\n    return (pad + str).slice(-pad.length);\n  } else {\n    return (str + pad).substring(0, pad.length);\n  }\n}\n\nfunction showDayAppointments(dateText)\n{\n    var url = \'calendar/fordate\'\n    ajaxDiv()\n    \n}\n\n/* uses date from datpicker for interface \n * dateText = SQL format YYYY-MM-DD\n */\nfunction setDate(dateText, dpInstance)\n{ \n    /* in case of empty date create current day date string */\n    if(typeof(dateText)===\'undefined\') \n    {\n        var x = new Date();\n        dateText = x.getFullYear()+\'-\'+pad(\'00\', x.getMonth()+1, \'pad_left\')+\'-\'+pad(\'00\', x.getDate(), \'pad_left\') ;  /* SQL format YYYY-MM-DD */\n    }\n    var d = new Date(dateText);\n    var year_no = d.getFullYear(); \n    var month_no = pad(\'00\', d.getMonth()+1, \'pad_left\');\n    var week_day_no= d.getDay(); /*  Get the weekday as a number (0-6) */\n    var day_no  = pad(\'00\', d.getDate(), \'pad_left\');   /*  Get the day as a number (1-31) */\n    var days_names = $.datepicker.regional[\'fr\'][\'dayNames\']; /* get localized day names from datpicker settings */\n    var day_name = days_names[week_day_no];\n    week_day_no = week_day_no === 0 ? 7 : week_day_no ; /* correction for sunday=0, change to 7,  do after getting day name  */\n    /* string for UI */\n    var dateStrUi = day_name+\' \'+day_no+\'/\'+month_no+\'/\'+year_no; \n    dateText = year_no+month_no+day_no; /* reconstruct date string with padded values */\n    /* UI */ \n    $(\'#date-btn a\').attr(\'href\', \'/calendar/fordate/\'+dateText).show();\n    $(\'#date-text\').html(dateStrUi);\n    $(\'#date-digest\').html(\'...\');\n    \n    ajaxDiv(\'#date-digest\', url_site+\'calendar/fordate_digest/\'+dateText);\n    \n    return dateStrUi ;\n}\n        \n/** On document ready, go  */      \n$( document ).ready(function() \n{       /* datepicker localisation */\n        $.datepicker.regional[\"fr\"] = {\n                clearText: \"Effacer\", clearStatus: \"\",\n                closeText: \"Fermer\", closeStatus: \"Fermer sans modifier\",\n                prevText: \"&lt;Préc\", prevStatus: \"Voir le mois précédent\",\n                nextText: \"Suiv&gt;\", nextStatus: \"Voir le mois suivant\",\n                currentText: \"Courant\", currentStatus: \"Voir le mois courant\",\n                monthNames: [\"Janvier\",\"Février\",\"Mars\",\"Avril\",\"Mai\",\"Juin\",\n                \"Juillet\",\"Août\",\"Septembre\",\"Octobre\",\"Novembre\",\"Décembre\"],\n                monthNamesShort: [\"Jan\",\"Fév\",\"Mar\",\"Avr\",\"Mai\",\"Jun\",\n                \"Jul\",\"Aoû\",\"Sep\",\"Oct\",\"Nov\",\"Déc\"],\n                monthStatus: \"Voir un autre mois\", yearStatus: \"Voir un autre année\",\n                weekHeader: \"Sm\", weekStatus: \"\",\n                dayNames: [\"Dimanche\",\"Lundi\",\"Mardi\",\"Mercredi\",\"Jeudi\",\"Vendredi\",\"Samedi\"],\n                dayNamesShort: [\"Dim\",\"Lun\",\"Mar\",\"Mer\",\"Jeu\",\"Ven\",\"Sam\"],\n                dayNamesMin: [\"Di\",\"Lu\",\"Ma\",\"Me\",\"Je\",\"Ve\",\"Sa\"],\n                dayStatus: \"Utiliser DD comme premier jour de la semaine\", dateStatus: \"Choisir le DD, MM d\",\n                dateFormat: \"dd/mm/yy\", firstDay: 1, \n                initStatus: \"Choisir la date\", isRTL: false\n        };\n        $.datepicker.setDefaults($.datepicker.regional[\"fr\"]); \n       /* datepicker */\n        $( \"#datepicker\" ).datepicker({  \n                    showWeek: true\n                    , weekHeader: \"S\"\n                    , dateFormat: \'yy-mm-dd\' /* iso format for JS  */\n                    , onSelect: function(dateText, inst){ setDate(dateText, inst); } \n        }); \n        /* UI show current day for start */\n        setDate();\n        $(\'#date-text\').prepend(\'Ajourd\\\'hui : \'); \n});\n\n ', 'default.html', 1523045558, 'y', '', ''),
(10, 'pro__inscription_cas_1', 'Pro : inscription cas 1', 'CAS N°1 : Le Praticien dispose d’un numéro RNGPS', 2, '', NULL, '', '<h2>{{ title }}</h2>', '', '', 'default.html', 1523045938, 'y', '', ''),
(11, 'pro__inscription_cas_2', 'Pro : inscription cas 2', 'CAS N°2 : Le Praticien n’a pas de RNGPS mais est inscrit à l’ONAMEG', 2, '', NULL, '', '<h2>{{ title }}</h2>', '', '', 'default.html', 1523045985, 'y', '', ''),
(12, 'pro__inscription_cas_3', 'Pro : inscription cas 3', 'CAS N°3 : Le Praticien n’est pas inscrit à l’ONAMEG', 2, '', NULL, '', '<h2>{{ title }}</h2>', '', '', 'default.html', 1523046017, 'y', '', ''),
(13, 'patients__home', 'Patients : Home', '', 2, '', NULL, '', '<h2>{{ title }}</h2>', '', '', 'default.html', 1523178713, 'y', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `default_permissions`
--

DROP TABLE IF EXISTS `default_permissions`;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_permissions`
--

INSERT INTO `default_permissions` (`id`, `group_id`, `module`, `roles`) VALUES
(1, 3, 'doctor', '{\"edit\":\"1\",\"create\":\"1\"}'),
(2, 3, 'appointments', NULL),
(3, 4, 'blog', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}'),
(4, 4, 'comments', NULL),
(5, 4, 'doctor', '{\"role1\":\"1\",\"role2\":\"1\",\"role3\":\"1\",\"edit\":\"1\",\"delete\":\"1\",\"create\":\"1\",\"set_location\":\"1\"}'),
(6, 4, 'addons', NULL),
(7, 4, 'files', '{\"wysiwyg\":\"1\",\"upload\":\"1\",\"download_file\":\"1\",\"edit_file\":\"1\",\"delete_file\":\"1\",\"create_folder\":\"1\",\"set_location\":\"1\",\"synchronize\":\"1\",\"edit_folder\":\"1\",\"delete_folder\":\"1\"}'),
(8, 4, 'groups', NULL),
(9, 4, 'maintenance', NULL),
(10, 4, 'templates', NULL),
(11, 4, 'keywords', NULL),
(12, 4, 'navigation', NULL),
(13, 4, 'pages', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\",\"create_types\":\"1\",\"edit_types\":\"1\",\"delete_types\":\"1\"}'),
(14, 4, 'users', '{\"admin_profile_fields\":\"1\"}'),
(15, 4, 'widgets', NULL),
(16, 5, 'appointments', NULL),
(17, 6, 'blog', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\"}'),
(18, 6, 'comments', NULL),
(19, 6, 'doctor', '{\"role1\":\"1\",\"role2\":\"1\",\"role3\":\"1\",\"edit\":\"1\",\"delete\":\"1\",\"create\":\"1\",\"set_location\":\"1\"}'),
(20, 6, 'addons', NULL),
(21, 6, 'files', '{\"wysiwyg\":\"1\",\"upload\":\"1\",\"download_file\":\"1\",\"edit_file\":\"1\",\"delete_file\":\"1\",\"create_folder\":\"1\",\"set_location\":\"1\",\"synchronize\":\"1\",\"edit_folder\":\"1\",\"delete_folder\":\"1\"}'),
(22, 6, 'groups', NULL),
(23, 6, 'maintenance', NULL),
(24, 6, 'templates', NULL),
(25, 6, 'keywords', NULL),
(26, 6, 'navigation', NULL),
(27, 6, 'pages', '{\"put_live\":\"1\",\"edit_live\":\"1\",\"delete_live\":\"1\",\"create_types\":\"1\",\"edit_types\":\"1\",\"delete_types\":\"1\"}'),
(28, 6, 'settings', NULL),
(29, 6, 'permissions', NULL),
(30, 6, 'redirects', NULL),
(31, 6, 'appointments', NULL),
(32, 6, 'token', NULL),
(33, 6, 'users', '{\"admin_profile_fields\":\"1\"}'),
(34, 6, 'variables', NULL),
(35, 6, 'widgets', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_profiles`
--

DROP TABLE IF EXISTS `default_profiles`;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) UNSIGNED DEFAULT NULL,
  `personal_info` longtext COLLATE utf8_unicode_ci,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insurance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usual_doctor_id` int(11) DEFAULT '0',
  `phone_valid` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `desk_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maiden_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_check_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings_pro` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'appointements',
  `subscription_pro` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `subscription_patients` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `doctor_id` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `birth_date`, `phone`, `mobile`, `address_line1`, `address_line2`, `postcode`, `updated_on`, `personal_info`, `town`, `area_name`, `insurance`, `gender`, `usual_doctor_id`, `phone_valid`, `desk_no`, `floor`, `district`, `maiden_name`, `phone_check_token`, `settings_pro`, `subscription_pro`, `subscription_patients`, `doctor_id`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'Administrateur', 'Radja', 'Lomas', '1978-10-20', NULL, '0678957826', NULL, NULL, NULL, 1523346087, 'Sourd de l&#39;oreille droite', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', 'femme', NULL, NULL, NULL, NULL, 'Le port', NULL, NULL, 'appointements\nflags\nmessages', 'no', 'no', NULL),
(2, '2018-03-15 00:41:01', NULL, 1, 1, 2, 'Alfred docteur test', 'Alfred', 'Mozart', '0', '678957826', '678957826', '4 allée Jacques Ibert', '91240', '91240', NULL, NULL, 'Saint Michel sur Orge', NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'no', 0),
(3, '2018-03-15 00:43:37', NULL, 1, 2, 3, 'Medical Staff', 'Sandra', 'Hitchcok', '0', '678957826', '678957826', '17 rue Gutenberg', NULL, '91070', NULL, NULL, 'Bondoufle', NULL, NULL, 'f', NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'no', 0),
(4, '2018-03-15 00:44:48', NULL, 1, 3, 4, 'Techie', 'Radja', 'Lomas', '0', '678957826', '678957826', '17 rue Gutenberg', NULL, '91070', NULL, NULL, 'Bondoufle', NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'no', 0),
(5, '2018-03-15 01:25:15', NULL, 1, 4, 5, 'devops', 'devops', 'devops', '2018-04-21', NULL, '0678957826', NULL, NULL, NULL, 1523290500, '', NULL, NULL, 'non', 'homme', 0, 'no', NULL, NULL, NULL, NULL, NULL, 'appointements\nflags\nmessages\nlisting', 'no', 'no', 14),
(8, '2018-03-25 02:10:01', NULL, NULL, 7, 8, 'bilbo.higgins', 'bilbo', 'higgins', NULL, NULL, '0163486116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'no', 0),
(17, '2018-03-28 21:07:08', NULL, NULL, 13, 17, 'radja.lomas', 'Radja', 'Lomas', '1979-08-21', NULL, '678957826', NULL, NULL, NULL, 1523333221, '', 'Bondoufle', 'quartier des acacias', NULL, 'homme', NULL, NULL, NULL, NULL, 'commune de belleville', NULL, NULL, 'appointements\nflags\nmessages\nlisting', 'no', 'no', 9),
(11, '2018-03-27 15:18:00', NULL, NULL, 10, 11, 'Barry', 'ALMAMY', 'BARRY', '2012-03-02', NULL, '665431196', NULL, NULL, NULL, 1523435038, '', NULL, NULL, 'oui', 'homme', NULL, 'no', NULL, NULL, NULL, NULL, NULL, '', 'no', 'no', 183),
(12, '2018-03-27 15:31:18', NULL, NULL, 11, 12, 'Dr Abarry', 'Barry', 'Almamy', '2001-01-01', NULL, '625464119', NULL, NULL, NULL, 1523447910, '', NULL, NULL, NULL, 'homme', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'no', 'no', NULL),
(18, '2018-04-07 18:47:27', NULL, NULL, 14, 18, 'bouba.barry', 'Bouba', 'barry', '12/12/1976', NULL, '664565425', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Monsieur', 0, 'no', NULL, NULL, NULL, NULL, NULL, 'appointements', 'no', 'no', 0),
(19, '2018-04-11 17:45:30', NULL, NULL, 15, 19, 'mitcoms', 'INFO', 'MITCOM', '1982-12-12', NULL, '665431196', NULL, NULL, NULL, 1523454400, NULL, NULL, NULL, NULL, 'homme', NULL, 'no', NULL, NULL, NULL, NULL, NULL, '', 'no', 'no', NULL),
(20, '2018-04-11 21:48:10', NULL, 12, 16, 20, 'Faletti', 'Vanessa', 'FALETTI', '1990-06-14', NULL, '672124083', NULL, NULL, NULL, 1523471086, '', NULL, NULL, 'non', 'femme', 0, 'no', NULL, NULL, NULL, NULL, NULL, 'appointements', 'no', 'no', 368);

-- --------------------------------------------------------

--
-- Structure de la table `default_redirects`
--

DROP TABLE IF EXISTS `default_redirects`;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_search_index`
--

DROP TABLE IF EXISTS `default_search_index`;
CREATE TABLE `default_search_index` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_search_index`
--

INSERT INTO `default_search_index` (`id`, `title`, `description`, `keywords`, `keyword_hash`, `module`, `entry_key`, `entry_plural`, `entry_id`, `uri`, `cp_edit_uri`, `cp_delete_uri`) VALUES
(17, 'Contact', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '2', 'contact', 'admin/pages/edit/2', 'admin/pages/delete/2'),
(3, 'Search', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '3', 'search', 'admin/pages/edit/3', 'admin/pages/delete/3'),
(4, 'Results', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '4', 'search/results', 'admin/pages/edit/4', 'admin/pages/delete/4'),
(5, 'Page missing', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5'),
(167, 'Accueil', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '14', 'accueil-old', 'admin/pages/edit/14', 'admin/pages/delete/14'),
(29, 'bootstrap', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '13', 'bootstrap', 'admin/pages/edit/13', 'admin/pages/delete/13'),
(162, 'test appointments', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '35', 'tests/test-appointments', 'admin/pages/edit/35', 'admin/pages/delete/35'),
(164, 'Proches à venir', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '36', 'rendez-vous/proches-a-venir', 'admin/pages/edit/36', 'admin/pages/delete/36'),
(160, 'Tests', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '27', 'tests', 'admin/pages/edit/27', 'admin/pages/delete/27'),
(55, 'test plugin list doctors', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '15', 'test-plugin-list-doctors', 'admin/pages/edit/15', 'admin/pages/delete/15'),
(54, 'test plugin show doctor', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '16', 'test-plugin-show-doctor', 'admin/pages/edit/16', 'admin/pages/delete/16'),
(159, 'RDV passés de mes proches', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '34', 'rdv-passes-de-mes-proches', 'admin/pages/edit/34', 'admin/pages/delete/34'),
(158, 'Mes RDV passés', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '33', 'rendez-vous/mes-rdv-passes', 'admin/pages/edit/33', 'admin/pages/delete/33'),
(157, 'RDV passés', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '32', 'rendez-vous/rdv-passes', 'admin/pages/edit/32', 'admin/pages/delete/32'),
(163, 'Mes RDV à venir', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '30', 'rendez-vous/mes-rdv-a-venir', 'admin/pages/edit/30', 'admin/pages/delete/30'),
(156, 'RDV à venir de mes proches', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '31', 'rendez-vous/rdv-a-venir-de-mes-proches', 'admin/pages/edit/31', 'admin/pages/delete/31'),
(153, 'Rendez Vous', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '28', 'rendez-vous', 'admin/pages/edit/28', 'admin/pages/delete/28'),
(154, 'RDV à venir', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '29', 'rendez-vous/rdv-a-venir', 'admin/pages/edit/29', 'admin/pages/delete/29'),
(147, 'Géolocalisation', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '25', 'geolocalisation', 'admin/pages/edit/25', 'admin/pages/delete/25'),
(150, 'Accueil root', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '26', 'accueil-root', 'admin/pages/edit/26', 'admin/pages/delete/26'),
(165, 'Proches passés', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '37', 'rendez-vous/proches-passes', 'admin/pages/edit/37', 'admin/pages/delete/37'),
(170, 'accueil pro', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '38', 'accueil-pro', 'admin/pages/edit/38', 'admin/pages/delete/38');

-- --------------------------------------------------------

--
-- Structure de la table `default_settings`
--

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
  `order` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_settings`
--

INSERT INTO `default_settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`) VALUES
('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'MSanté Portail', '', 1, 1, '', 1000),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Portail Msanté des patients', '', 0, 1, '', 999),
('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Registre des médecins et spécialiste de santé, prenez rendez vous en ligne.', '', 0, 1, '', 998),
('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'fr', 'func:get_supported_lang', 1, 1, '', 997),
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'fr', 'func:get_supported_lang', 1, 1, '', 996),
('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '1', '1=Open|0=Closed', 1, 1, '', 988),
('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '<h2>Actuellement hors-ligne pour maintenance.</h2>\n<h3>Veuillez nous excuser pour le gène occasionné.</h3>\n<h3>Merci de revenir plus tard.</h3>', '', 0, 1, '', 987),
('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', 0, 1, 'integration', 983),
('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href=\"https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US\" target=\"_blank\">Authorized Access to your Google Account</a>', 'password', '', '', '', 0, 1, 'integration', 982),
('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'radjal@free.fr', '', '', 1, 1, 'email', 979),
('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', 'admin@msante.net', '', 1, 1, 'email', 978),
('mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', 1, 1, 'email', 977),
('mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', 0, 1, 'email', 976),
('mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', 0, 1, 'email', 975),
('mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', 0, 1, 'email', 974),
('mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', 0, 1, 'email', 973),
('mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', 0, 1, 'email', 972),
('mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', 0, 1, 'email', 972),
('admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', 1, 1, '', 0),
('api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', 0, 1, 'integration', 1000),
('addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', 1, 0, '', 0),
('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'msante', 'func:get_themes', 1, 0, '', 0),
('admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', 1, 0, '', 0),
('akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', 0, 1, 'integration', 981),
('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '0', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
('moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 967),
('comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', 1, 1, 'comments', 966),
('comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', 1, 1, 'comments', 965),
('files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', 1, 1, 'files', 986),
('files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', 0, 1, 'files', 994),
('files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 993),
('files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', 0, 1, 'files', 992),
('files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', 1, 1, 'files', 991),
('files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon\'s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', 0, 1, 'files', 991),
('files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 990),
('files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', 0, 1, 'files', 989),
('files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', 1, 1, 'files', 987),
('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '2', '0=activate_by_admin|1=activate_by_email|2=no_activation', 0, 1, 'users', 961),
('registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 962),
('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
('profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', 'owner', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', 0, 1, 'users', 960),
('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\n$(\'textarea#intro.wysiwyg-simple\').ckeditor({\n	toolbar: [\n		[\'pyroimages\'],\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\n	  ],\n	extraPlugins: \'pyroimages\',\n	width: \'99%\',\n	height: 100,\n	dialog_backgroundCoverColor: \'#000\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});\n\n{{# this is the config for all wysiwyg-simple textareas #}}\n$(\'textarea.wysiwyg-simple\').ckeditor({\n	toolbar: [\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\n	  ],\n	width: \'99%\',\n	height: 100,\n	dialog_backgroundCoverColor: \'#000\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});\n\n{{# and this is the advanced editor #}}\n$(\'textarea.wysiwyg-advanced\').ckeditor({\n	toolbar: [\n		[\'Maximize\'],\n		[\'pyroimages\', \'pyrofiles\'],\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\n		[\'Link\',\'Unlink\'],\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\n	],\n	extraPlugins: \'pyroimages,pyrofiles\',\n	width: \'99%\',\n	height: 400,\n	dialog_backgroundCoverColor: \'#000\',\n	removePlugins: \'elementspath\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});', '', 1, 1, 'wysiwyg', 993),
('token_setting', 'Tokens Setting', 'A Yes or No option for the token module', 'select', '1', '1', '1=Yes|0=No', 1, 1, 'token', 0),
('jours_ouverts', 'Jours ouverts', 'Les jours d\'ouverture (Non implementé)', 'checkbox', '1', '1,2,3,4,5,6,7', '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche', 1, 1, 'calendar', 660),
('break_stop', 'Fin de la pause', 'L\'heure de fin de la pause midi. (Non implementé)', 'text', '1400', '', '', 1, 1, 'doctor', 662),
('break_start', 'Début de la pause', 'L\'heure de début de la pause midi. (Non implementé)', 'text', '1200', '', '', 1, 1, 'doctor', 662),
('closes', 'Fermeture', 'L\'heure de fermeture. (Non implementé)', 'text', '1700', '', '', 1, 1, 'doctor', 662),
('days_open', 'Jours ouverts', 'Les jours d\'ouverture (Non implementé)', 'checkbox', '1', '1,2,3,4,5', '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche', 1, 1, 'doctor', 660),
('opens', 'Ouverture', 'L\'heure d\'ouverture (Non implementé)', 'text', '0900', '', '', 1, 1, 'doctor', 662),
('url_cas_1', 'url_cas_1', 'Cas No1', 'text', '', '', '', 1, 1, 'inscription', 660),
('url_cas_2', 'url_cas_2', 'Cas No2', 'text', '', '', '', 1, 1, 'inscription', 660),
('url_cas_3', 'url_cas_3', 'Cas No3', 'text', '', '', '', 1, 1, 'inscription', 660);

-- --------------------------------------------------------

--
-- Structure de la table `default_theme_options`
--

DROP TABLE IF EXISTS `default_theme_options`;
CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_theme_options`
--

INSERT INTO `default_theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`) VALUES
(1, 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(2, 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(3, 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(4, 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(5, 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'no', 'yes=Yes|no=No', 1, 'default'),
(6, 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', 'full-width', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', 1, 'default'),
(7, 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'fabric', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', 1, 'base'),
(8, 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(9, 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', 1, 'base'),
(10, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'no', 'yes=Yes|no=No', 1, 'base'),
(28, 'show_slideshow', 'Show slideshow', 'Activates slideshow', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'bs3'),
(25, 'bootSwatch_layout', 'Theme', 'Choose the default bootstrap.css or select the bootswatch theme that you prefer', 'select', 'bootstrap', 'cosmo', 'bootstrap=Default - Bootstrap|amelia=Amelia|cerulean=Cerulean|cosmo=Cosmo|cyborg=Cyborg|flatly=Flatly|journal=Journal|readable=Readable|simplex=Simplex|slate=Slate|spacelab=Spacelab|united=United|yeti=Yeti', 1, 'bs3'),
(26, 'custom_css', 'Custom CSS', 'Custom master CSS overload', 'radio', 'no', 'yes', 'yes=Yes|no=No', 1, 'bs3'),
(27, 'disable_right_click', 'Disable right click', 'Disable right mouse click', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'bs3'),
(24, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'bs3'),
(29, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'msante'),
(30, 'bootSwatch_layout', 'Theme', 'Choose the default bootstrap.css or select the bootswatch theme that you prefer', 'select', 'bootstrap', 'bootstrap', 'bootstrap=Default - Bootstrap|amelia=Amelia|cerulean=Cerulean|cosmo=Cosmo|cyborg=Cyborg|flatly=Flatly|journal=Journal|readable=Readable|simplex=Simplex|slate=Slate|spacelab=Spacelab|united=United|yeti=Yeti', 1, 'msante'),
(31, 'custom_css', 'Custom CSS', 'Custom master CSS overload', 'radio', 'no', 'yes', 'yes=Yes|no=No', 1, 'msante'),
(32, 'disable_right_click', 'Disable right click', 'Disable right mouse click', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'msante'),
(33, 'show_slideshow', 'Show slideshow', 'Activates slideshow', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'msante');

-- --------------------------------------------------------

--
-- Structure de la table `default_tokens`
--

DROP TABLE IF EXISTS `default_tokens`;
CREATE TABLE `default_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(5) DEFAULT NULL,
  `timestamp` datetime DEFAULT '1970-01-01 00:00:01',
  `expires` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:01',
  `alive` int(1) DEFAULT NULL,
  `module` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_tokens`
--

INSERT INTO `default_tokens` (`id`, `token`, `user_id`, `ip`, `user_agent`, `counter`, `timestamp`, `expires`, `created_on`, `alive`, `module`) VALUES
(158, '241689', 12, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 3, '2018-04-11 22:08:48', NULL, '2018-04-11 22:05:47', 0, NULL),
(141, '623714', 11, '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 0, '2018-04-11 08:02:59', NULL, '2018-04-11 08:02:59', 0, NULL),
(161, '917485', 12, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 9, '2018-04-11 22:39:59', NULL, '2018-04-11 22:33:07', 0, NULL),
(162, '574261', 19, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1, '2018-04-11 22:39:16', NULL, '2018-04-11 22:38:28', 0, NULL),
(163, '685374', 12, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1, '2018-04-12 00:56:57', NULL, '2018-04-12 00:56:39', 1, NULL),
(147, '519826', 8, '80.215.82.76', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 1, '2018-04-11 14:28:28', NULL, '2018-04-11 14:28:11', 0, NULL),
(148, '926437', 11, '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 3, '2018-04-11 14:42:26', NULL, '2018-04-11 14:29:31', 0, NULL),
(149, '215987', 1, '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 2, '2018-04-11 14:33:53', NULL, '2018-04-11 14:33:28', 0, NULL),
(150, '564783', 12, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 41, '2018-04-11 17:34:37', NULL, '2018-04-11 15:36:36', 0, NULL),
(142, '249578', 11, '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 1, '2018-04-11 11:07:46', NULL, '2018-04-11 11:07:00', 0, NULL),
(146, '674213', 1, '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1, '2018-04-11 14:21:25', NULL, '2018-04-11 14:21:17', 0, NULL),
(143, '857963', 11, '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 12, '2018-04-11 11:51:47', NULL, '2018-04-11 11:10:56', 0, NULL),
(144, '346518', 5, '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', 19, '2018-04-11 12:42:17', NULL, '2018-04-11 12:11:02', 0, NULL),
(151, '635429', 11, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 5, '2018-04-11 17:29:27', NULL, '2018-04-11 15:40:18', 0, NULL),
(145, '736148', 1, '92.170.179.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', 3, '2018-04-11 12:24:58', NULL, '2018-04-11 12:12:42', 0, NULL),
(160, '962754', 12, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 5, '2018-04-11 22:26:56', NULL, '2018-04-11 22:25:24', 0, NULL),
(159, '576214', 20, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 12, '2018-04-11 22:17:03', NULL, '2018-04-11 22:09:31', 0, NULL),
(152, '831964', 0, '185.89.129.106', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobile Safari/537.36', 0, '2018-04-11 17:43:31', NULL, '2018-04-11 17:43:31', 0, NULL),
(155, '431768', 12, '80.12.27.218', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 2, '2018-04-11 19:37:13', NULL, '2018-04-11 19:36:32', 0, NULL),
(154, '782315', 12, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1, '2018-04-11 19:20:34', NULL, '2018-04-11 19:20:11', 0, NULL),
(153, '195267', 19, '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1, '2018-04-11 17:50:30', NULL, '2018-04-11 17:49:37', 0, NULL),
(157, '257618', 20, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 2, '2018-04-11 22:02:32', NULL, '2018-04-11 21:58:41', 0, NULL),
(156, '561798', 12, '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 4, '2018-04-11 21:56:22', NULL, '2018-04-11 21:52:55', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_users`
--

DROP TABLE IF EXISTS `default_users`;
CREATE TABLE `default_users` (
  `id` smallint(5) UNSIGNED NOT NULL,
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
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';

--
-- Déchargement des données de la table `default_users`
--

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'radjal@free.fr', '23f9b4179d40a8df3a1ab6f13be0a7cc89b478a9', '4cd53', 1, '', 1, '', 1495107565, 1523442806, 'admin', NULL, 'c743f478d977eeb11b41f9dfa7a57d250e13a775'),
(2, 'practicien@nowhere.com', '7db15a5af242f976d62282149602188eb0cd96ad', 'e5d396', 5, '::1', 1, NULL, 1521074461, 1521076949, 'docteur.test', NULL, '61de7be305a949a0b6a141d5bf33fcb63a04e967'),
(3, 'medstaff@nowhere.com', '757129871de30daf6040f50f828b02d8744e8c39', '0d8c10', 3, '::1', 1, NULL, 1521074617, 1521076980, 'med.staff', NULL, 'b40d2018448fd8177b1b1527d4ca244c30e29e36'),
(4, 'support@nowhere.com', '1031f9a492618d59461444aa240ee82023354704', 'd70a25', 4, '::1', 1, NULL, 1521074688, 1521077026, 'support', NULL, '3cc21520c7d43c51f8c77ae0c74417fe32250f72'),
(5, 'devops@nowhere.com', 'f2229cde76e4ca9c4a658f6f091158fea4338bee', 'b92942', 1, '::1', 1, NULL, 1521077115, 1523434261, 'devops', NULL, NULL),
(8, 'bilbohiggins@nowhere.com', 'fcb1fee8af18e0891169128bdcb6e846adc24484', '802f91', 2, '::1', 1, '', 1521943801, 1523442472, 'bilbo.higgins', NULL, NULL),
(11, 'almamy.barry@laposte.net', 'dc02fe286546eb2db66f7d4a031db7117543a5c3', '046a79', 2, '185.89.129.106', 1, '', 1522149480, 1523479401, 'almamy.barry', '2132e7727b5ec4020af5411e08bc7ecba536f9eb', 'e3f964ad6dbabd716d16c7903a2809a9471ee36b'),
(12, 'abarry78250@gmail.com', '45c871ddeca9073e3a2f9c31c6296f3cbdff4c3d', '9bf26b', 1, '92.184.96.189', 1, '', 1522150278, 1523480198, 'barry.almamy', NULL, '53b99fc465829bdc5ad37d659bc6c47ab11f39bc'),
(17, 'r.lomas@spelldesign.fr', '89f200f44a8c1c8058f6420b6e287c06ff40fd00', 'a51be1', 2, '92.170.179.46', 1, '', 1522256828, 1523460069, 'radja.lomas', NULL, NULL),
(18, 'abarry@mitcoms.com', 'a23aab3c32c7debfc92551182661c9ed6d2defbf', 'b18332', 2, '78.213.60.211', 1, '', 1523112447, 1523112749, 'bouba.barry', NULL, NULL),
(19, 'infos@mitcoms.com', '6bea5d5d239b90c031e0b14241da458a392efd7d', '9e7cec', 2, '185.89.129.106', 1, '', 1523454330, 1523471801, 'info.mitcom', NULL, NULL),
(20, 'vfaletti@msn.com', '3b90318fb378e8df01f09f465bfdb282114596a4', '701893', 5, '78.213.60.211', 1, NULL, 1523468890, 1523471834, 'Faletti', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_variables`
--

DROP TABLE IF EXISTS `default_variables`;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_widgets`
--

DROP TABLE IF EXISTS `default_widgets`;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_widget_areas`
--

DROP TABLE IF EXISTS `default_widget_areas`;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_widget_areas`
--

INSERT INTO `default_widget_areas` (`id`, `slug`, `title`) VALUES
(1, 'sidebar', 'Sidebar');

-- --------------------------------------------------------

--
-- Structure de la table `default_widget_instances`
--

DROP TABLE IF EXISTS `default_widget_instances`;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `core_settings`
--
ALTER TABLE `core_settings`
  ADD PRIMARY KEY (`slug`),
  ADD UNIQUE KEY `unique - slug` (`slug`),
  ADD KEY `index - slug` (`slug`);

--
-- Index pour la table `core_sites`
--
ALTER TABLE `core_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Unique ref` (`ref`),
  ADD UNIQUE KEY `Unique domain` (`domain`),
  ADD KEY `ref` (`ref`),
  ADD KEY `domain` (`domain`);

--
-- Index pour la table `core_users`
--
ALTER TABLE `core_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Index pour la table `default_appointments_details`
--
ALTER TABLE `default_appointments_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_appointments_list`
--
ALTER TABLE `default_appointments_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_blog`
--
ALTER TABLE `default_blog`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_blog_categories`
--
ALTER TABLE `default_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_slug` (`slug`),
  ADD UNIQUE KEY `unique_title` (`title`),
  ADD KEY `slug` (`slug`);

--
-- Index pour la table `default_ci_sessions`
--
ALTER TABLE `default_ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Index pour la table `default_comments`
--
ALTER TABLE `default_comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_comment_blacklists`
--
ALTER TABLE `default_comment_blacklists`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_contact_log`
--
ALTER TABLE `default_contact_log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_data_fields`
--
ALTER TABLE `default_data_fields`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_data_field_assignments`
--
ALTER TABLE `default_data_field_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_data_streams`
--
ALTER TABLE `default_data_streams`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_def_page_fields`
--
ALTER TABLE `default_def_page_fields`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_doctors_favorites`
--
ALTER TABLE `default_doctors_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_doctor_categories`
--
ALTER TABLE `default_doctor_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_doctor_doctors`
--
ALTER TABLE `default_doctor_doctors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_doctor_organisations`
--
ALTER TABLE `default_doctor_organisations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_email_templates`
--
ALTER TABLE `default_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_lang` (`slug`,`lang`);

--
-- Index pour la table `default_files`
--
ALTER TABLE `default_files`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_file_folders`
--
ALTER TABLE `default_file_folders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_groups`
--
ALTER TABLE `default_groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_keywords`
--
ALTER TABLE `default_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_keywords_applied`
--
ALTER TABLE `default_keywords_applied`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_modules`
--
ALTER TABLE `default_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `enabled` (`enabled`);

--
-- Index pour la table `default_navigation_groups`
--
ALTER TABLE `default_navigation_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abbrev` (`abbrev`);

--
-- Index pour la table `default_navigation_links`
--
ALTER TABLE `default_navigation_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navigation_group_id` (`navigation_group_id`);

--
-- Index pour la table `default_orders_details`
--
ALTER TABLE `default_orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_orders_list`
--
ALTER TABLE `default_orders_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_pages`
--
ALTER TABLE `default_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Index pour la table `default_page_types`
--
ALTER TABLE `default_page_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_permissions`
--
ALTER TABLE `default_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Index pour la table `default_profiles`
--
ALTER TABLE `default_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `default_redirects`
--
ALTER TABLE `default_redirects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`);

--
-- Index pour la table `default_search_index`
--
ALTER TABLE `default_search_index`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190));
ALTER TABLE `default_search_index` ADD FULLTEXT KEY `full search` (`title`,`description`,`keywords`);

--
-- Index pour la table `default_settings`
--
ALTER TABLE `default_settings`
  ADD PRIMARY KEY (`slug`),
  ADD UNIQUE KEY `unique_slug` (`slug`),
  ADD KEY `slug` (`slug`);

--
-- Index pour la table `default_theme_options`
--
ALTER TABLE `default_theme_options`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_tokens`
--
ALTER TABLE `default_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_users`
--
ALTER TABLE `default_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Index pour la table `default_variables`
--
ALTER TABLE `default_variables`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_widgets`
--
ALTER TABLE `default_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_widget_areas`
--
ALTER TABLE `default_widget_areas`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `default_widget_instances`
--
ALTER TABLE `default_widget_instances`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `core_sites`
--
ALTER TABLE `core_sites`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `core_users`
--
ALTER TABLE `core_users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `default_appointments_details`
--
ALTER TABLE `default_appointments_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_appointments_list`
--
ALTER TABLE `default_appointments_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT pour la table `default_blog`
--
ALTER TABLE `default_blog`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_blog_categories`
--
ALTER TABLE `default_blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `default_comments`
--
ALTER TABLE `default_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_comment_blacklists`
--
ALTER TABLE `default_comment_blacklists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_contact_log`
--
ALTER TABLE `default_contact_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_data_fields`
--
ALTER TABLE `default_data_fields`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=673;
--
-- AUTO_INCREMENT pour la table `default_data_field_assignments`
--
ALTER TABLE `default_data_field_assignments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=670;
--
-- AUTO_INCREMENT pour la table `default_data_streams`
--
ALTER TABLE `default_data_streams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT pour la table `default_def_page_fields`
--
ALTER TABLE `default_def_page_fields`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `default_doctors_favorites`
--
ALTER TABLE `default_doctors_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_doctor_categories`
--
ALTER TABLE `default_doctor_categories`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT pour la table `default_doctor_doctors`
--
ALTER TABLE `default_doctor_doctors`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;
--
-- AUTO_INCREMENT pour la table `default_doctor_organisations`
--
ALTER TABLE `default_doctor_organisations`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `default_email_templates`
--
ALTER TABLE `default_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT pour la table `default_file_folders`
--
ALTER TABLE `default_file_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `default_groups`
--
ALTER TABLE `default_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `default_keywords`
--
ALTER TABLE `default_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_keywords_applied`
--
ALTER TABLE `default_keywords_applied`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_modules`
--
ALTER TABLE `default_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT pour la table `default_navigation_groups`
--
ALTER TABLE `default_navigation_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `default_navigation_links`
--
ALTER TABLE `default_navigation_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT pour la table `default_orders_details`
--
ALTER TABLE `default_orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_orders_list`
--
ALTER TABLE `default_orders_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_pages`
--
ALTER TABLE `default_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `default_page_types`
--
ALTER TABLE `default_page_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `default_permissions`
--
ALTER TABLE `default_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `default_profiles`
--
ALTER TABLE `default_profiles`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `default_redirects`
--
ALTER TABLE `default_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_search_index`
--
ALTER TABLE `default_search_index`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT pour la table `default_theme_options`
--
ALTER TABLE `default_theme_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `default_tokens`
--
ALTER TABLE `default_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT pour la table `default_users`
--
ALTER TABLE `default_users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `default_variables`
--
ALTER TABLE `default_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_widgets`
--
ALTER TABLE `default_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_widget_areas`
--
ALTER TABLE `default_widget_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `default_widget_instances`
--
ALTER TABLE `default_widget_instances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

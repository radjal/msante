-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : msantenenndb.mysql.db
-- Généré le :  jeu. 05 avr. 2018 à 14:41
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
(3, 17, 3, '', 20180406, 1000, NULL, 'desailes', 'sandra', 'Roches', '01/01/1986', '', 'no', 'non', '678957826', '0678957826', 'r.lomas@spelldesign.fr', '', 'commune du port', 'paris', 'quartier des dunes', 'non', '', '', '0', '0', NULL, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '2018-04-05 14:37:58', NULL);

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
('31eaf14b3d06408a1798221ed29c2a5a', '94.242.171.87', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522319686, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('4f09490b292f2ea621b918124f12a7a0', '137.226.113.26', 'Mozilla/5.0 zgrab/0.x (compatible; Researchscan/t12sns; +http://researchscan.comsys.rwth-aachen.de)', 1522319653, ''),
('bcb0cd2bea6ec52e0db7509bd1ebf220', '94.242.171.87', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522319649, ''),
('95a0e0f4a5a1d208094429b7a8eac62e', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522347629, ''),
('43fca11f58ec23449c96d2df62c2fb3b', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522347665, ''),
('4bd846a98b6b42954c2edc8878108cf5', '94.242.171.87', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522319534, ''),
('38efa1aa9da565259d005deb2429adaa', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522341724, 'a:6:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:43:\"25 Élément(s) supprimé du dossier page_m\";}'),
('1eeb084caf4a190fccde45e894311e85', '94.242.171.87', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522318782, ''),
('1cca0f6d9558475df51990cb2ac50e9e', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522319425, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e24f2719981b1276ef7c1f71df584705', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522319287, 'a:1:{s:14:\"admin_redirect\";s:17:\"admin/maintenance\";}'),
('f1608b6535c6bf5b93e64f4434380e23', '197.149.220.160', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_1 like Mac OS X) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0 Mobile/14B7', 1522340669, ''),
('165fe2f343958b8a8eabe1f0dc080f55', '197.149.220.160', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_1 like Mac OS X) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0 Mobile/14B7', 1522317757, ''),
('c7b0f325a7387f0a23c2ae0148b29442', '197.149.220.160', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 fac', 1522317742, ''),
('07d31aee2790c6b5b06b190a1e1766cc', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522319613, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('55f042a733bceb3e2117e9c294fc3a10', '66.249.81.246', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522314399, ''),
('c965a8c9a845cb21327bc5ba73d99836', '137.226.113.26', 'Mozilla/5.0 zgrab/0.x (compatible; Researchscan/t13rl; +http://researchscan.comsys.rwth-aachen.de)', 1522316651, ''),
('989091bd7609979a5557ba9387c24521', '66.249.81.244', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522314397, ''),
('84dec84ba37cfad8c688474a621621d6', '66.249.81.242', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522314393, ''),
('2ed3eb0075bbf621af0f167dbf6942e6', '66.249.93.31', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522314394, ''),
('66729a857d9d4512590be6c0baa0328a', '80.12.43.144', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522336260, ''),
('d71c9c12920b92075e589cf3ad472175', '66.249.93.55', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522314391, ''),
('dce1e3db465dfae4e854ed78b52b2bf5', '80.12.43.144', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522313314, ''),
('fdf9eada09d2e5f61a1244459ba17cc7', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522310948, ''),
('bd6e6082c23d4dfdff2ad6181e809617', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522310946, ''),
('3574ea4c1d4f3de9e3d1937bf3e9ec55', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522310947, ''),
('e51e9ca211215bf437d10640ec676f2b', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522310942, ''),
('1fb84cdd1e1d7cc0d6c851d3ca02abf6', '178.154.200.14', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522309361, ''),
('a8aae1d838f001bdc81870e8a7f6fc7a', '66.249.93.47', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522310942, ''),
('fccbe9c031c342984bd79d8552cae7df', '92.184.104.191', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522308753, ''),
('722fd405ace96d6b8f26e22c654310ac', '80.12.39.144', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G3', 1522304151, ''),
('bd4769d97f917d540a1062f7fe93accd', '92.184.104.191', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522306902, 'a:5:{s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e72a24d183648657809373f0175276f0', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522347115, ''),
('3b70dd87a60b2e40c6109af59d385d86', '131.253.27.14', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1522344478, ''),
('2e68ea48890a6d5fe68501f576310e62', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522347305, ''),
('3898ad2b0ff8c04f28446fd734b41a21', '66.249.66.219', 'Googlebot-Image/1.0', 1522343181, ''),
('85e43d7ca2cf5f3b467b7643cdf2ed44', '157.55.39.165', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', 1522344473, ''),
('cd241af0b116de72f3b7195842f7bd1a', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522343064, ''),
('e6d649608b811397b78c3be1cb9e95b4', '66.249.66.221', 'Googlebot-Image/1.0', 1522343175, ''),
('395ba2d10ee38189e0982979cce0d148', '66.249.66.219', 'Googlebot-Image/1.0', 1522343181, ''),
('3c579f8e772b93854e9ec00576f81541', '178.154.171.42', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522354907, ''),
('175e3c826ec4d5b62ae8f817d4f3fe00', '87.250.224.74', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522354914, ''),
('18923acdd0e1477e26e06fa953d7fbac', '180.76.15.161', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522435117, ''),
('081b41eb610616c41932ff95e00e18f3', '180.76.15.32', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522435119, ''),
('3f1c5f5ac16e1e5cd3d5978e50d58737', '178.154.171.35', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522412952, ''),
('28a19ddd0db32e4072e75932f3abecef', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522431259, ''),
('7b594e6e9bf916772b27a86c8c0e934a', '197.149.221.170', 'Mozilla/5.0 (Linux; Android 5.1; Infinix-X554 Build/LMY47I; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrom', 1522423585, ''),
('1b9d877c3936b6f89566fcbe75b4d1b7', '197.149.221.111', 'Dalvik/2.1.0 (Linux; U; Android 7.0; SM-G925F Build/NRD90M)', 1522407952, ''),
('a0cd54fa7efd7c34ce0ee013eaae30b0', '197.149.221.111', 'Dalvik/2.1.0 (Linux; U; Android 7.0; SM-G925F Build/NRD90M)', 1522407970, ''),
('d423fbd4bd9e30f4a0dca2bfbbd9a8cb', '197.149.221.111', 'Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G925F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/6.', 1522420822, ''),
('92e2ede7bb65ae2bb17d412aeba8bc4e', '197.149.221.44', 'Dalvik/2.1.0 (Linux; U; Android 7.0; SM-G925F Build/NRD90M)', 1522407099, ''),
('064704dc7dc8e0d18c19992fbbc4dbd2', '197.149.221.44', 'Dalvik/2.1.0 (Linux; U; Android 7.0; SM-G925F Build/NRD90M)', 1522407490, 'a:1:{s:11:\"redirect_to\";s:20:\"apple-touch-icon.png\";}'),
('c491a66500ece6f447ff85b8c77474b6', '197.149.220.5', 'Mozilla/5.0 (Linux; Android 7.0; Infinix X572 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 ', 1522405569, ''),
('f6b897e1b062a0f04cb38ad0504eafd6', '197.149.221.44', 'Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G925F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/6.', 1522407446, ''),
('67fbecdfbd117e08ef857b91e6332528', '66.249.66.219', 'Googlebot-Image/1.0', 1522396854, ''),
('46a969ac7c1b7ef09e0cb88c43fdec33', '66.249.66.219', 'Googlebot-Image/1.0', 1522396849, ''),
('409041d00e0350aa8ab40b8c7781090c', '66.249.66.219', 'Googlebot-Image/1.0', 1522396850, ''),
('4c09054c0c90cf84e13564facfd9a980', '66.249.66.219', 'Googlebot-Image/1.0', 1522396851, ''),
('c167412f925d224abf1948be3b3c4d73', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522396744, ''),
('9f4145461cd8d0d368377cc16f8dd88c', '66.249.66.219', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522396760, ''),
('ef0597eb33f2c8bc5e7160c335415f53', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522512187, ''),
('ccc62221686e095b9046bcf3da5cb717', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522512187, ''),
('db6b30d8d4d19bfb7e93ce770f2914ef', '66.249.81.249', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522608816, ''),
('3acb38ac158608b6c6e0a735b6cadbd9', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522512187, ''),
('0886c8dccf566901111c03f7d670ec41', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522608816, ''),
('5e84c39e79d31ba0f5cacf09b5a93d8e', '66.249.66.221', 'Googlebot-Image/1.0', 1522605631, ''),
('888249b1170e33c1235948d454bb9567', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522608815, ''),
('55b00e235d05bc1b831575a3779fc2ae', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522608815, ''),
('0aa275c6fcee24b01cc637594f49fdf9', '66.249.81.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522608815, ''),
('c0c6ba541214fb2dc0580688594612e4', '66.249.66.219', 'Googlebot-Image/1.0', 1522605630, ''),
('4b9b7c8d0d2d687e9b262c3ea92c695d', '66.249.66.221', 'Googlebot-Image/1.0', 1522605630, ''),
('3dd93d03c083b89d84fdcd9924e3d8b2', '66.249.66.219', 'Googlebot-Image/1.0', 1522605631, ''),
('58e38dea560386f90b8c29d6fa576ea8', '66.249.66.219', 'Googlebot-Image/1.0', 1522605629, ''),
('381927e23fb47ed7e4c08d15ab96324b', '66.249.66.219', 'Googlebot-Image/1.0', 1522605630, ''),
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
('a4b8777476ca8f23f3cfc3f41f02878a', '66.249.66.223', 'Googlebot-Image/1.0', 1522832102, ''),
('c2ab10526bbb81d53b343422d375cea9', '66.249.66.221', 'Googlebot-Image/1.0', 1522832102, ''),
('f889386b144f5bcf383aecf0de4da6cc', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522831872, ''),
('ba4b594e5e56ca1d85898584b102559e', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522341856, ''),
('b1e2880837ecdfb98cc985afe47e8e1e', '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522924769, ''),
('41864a587e492d0c5c094e1ea3c73dd2', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522924465, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('b26068d92372cc029d0eb478ee5c7022', '92.184.97.69', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522909024, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('b675bf6fcca8e32de6f9054368eb1119', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522917248, ''),
('77f1d9f33dbba4feeed128c85e70034b', '141.8.142.24', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522920187, ''),
('077106ca9c97605644c2f5b3513d7458', '80.12.38.177', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522923732, ''),
('5fff5eec01da26266e7163193efc5ba3', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522923264, ''),
('3a9f2f64ddff6a1ffc5207909c7cd414', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522923319, ''),
('ad5a77039215b13258b177358d046885', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522924451, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:48:\"La page \"Mes RDV à venir\" a été enregistrée.\";}'),
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
('16416479f0ed4d0b004087abcc3cdde4', '95.108.181.50', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522281021, ''),
('31d1cd2078406db25e6c543f906479c3', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1522368750, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('7adc011a8829f278feccdbe48f1925e7', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1522282774, ''),
('76b77f5c3537ddd9a21fe06cd5a87929', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1522282818, ''),
('56f52ea6bdd3d17d9a5133a0f75d6b2e', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1522282818, ''),
('7fafede2d024f919d87fac2aee49f3e3', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1522282827, ''),
('8be8336d3ba186be73054d71179319c8', '178.154.200.46', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522285625, ''),
('519c65a1d8fe5f785f1fbab0dacf0a9e', '66.249.66.221', 'Googlebot-Image/1.0', 1522302915, ''),
('5060bc5a02d706a7843b5264908b4b65', '137.226.113.23', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0', 1522320347, ''),
('888cff5b75370c427c2ac11a9ba0e3cf', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522322161, ''),
('4903b07bac517ffcef3dcbc32c854efd', '62.183.84.34', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522320523, ''),
('3d95246b158769c9a402b515556b4bad', '176.31.224.216', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522320552, ''),
('558b289538dd58821c696cee16644534', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522320605, ''),
('c89d4bdcae1a8a3e9dfc09882d17556b', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522321936, ''),
('a50a802a5b19ff36f273c57562e5a9b2', '62.183.84.34', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522320821, ''),
('c2ab74cfa155038981e78c065e15aa8d', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522320867, ''),
('c518ca07606be16a50becfcd79a95f20', '62.183.84.34', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522320869, ''),
('93ddeae011b099272900752aa0d2e2c7', '66.249.93.45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522320871, ''),
('fa50f3002a60e6909ca39f25e6489e91', '62.183.84.34', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522320899, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('4b53db5309955609c968d21141228a97', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522320903, ''),
('6fed146bfbf9880f997a2a652fd8978b', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522324242, ''),
('72aeba5ff93a4b4389210805c881d5c7', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522320922, ''),
('8ca0d5b5a296197b280cb6b192d8b053', '185.68.118.183', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522321044, ''),
('c9973a30d3cf7ce53932f8980f1c166e', '151.80.34.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522321096, ''),
('40e823b9243aeb2783d89b17c6e57a65', '185.68.118.183', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522321525, ''),
('c676dace50afcab6cbcfba085e408a99', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522324532, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('93ac746b939d092e179e654b6a6c6df5', '185.68.118.183', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522321644, ''),
('8832a11ecb5992fc1ce420cf2cf56d18', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522321699, ''),
('2b85af80ffa95a3baa02bf8936449edf', '185.68.118.183', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522321700, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('745de2dbdfccc3fdee1dadef6ddc10d2', '82.151.123.200', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522321843, ''),
('8f4114d21acefc2f2a2230e91196a6b9', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522324370, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('4f650fb4d34ac1cda9f15f5503dbdd8c', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522323338, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('8c0fd0b6c648a3d5df79318c9df871ee', '82.151.123.200', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522322629, ''),
('520008868cc22c9534a69d1a9033a718', '82.151.123.200', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522322776, ''),
('37d36a0a31753cda4d325ba70be148e3', '82.151.123.200', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522322878, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('f72a704d91dbb30d620a71bfe1ce8b98', '89.179.197.100', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522323070, ''),
('8cae848321257e6aa640a59e3570f4d7', '89.179.197.100', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522323736, ''),
('4ebcb44c5c0252e08ad120b3b1d6777a', '89.179.197.100', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522323824, ''),
('77be7026ba08a345066f9d45af3f6955', '89.179.197.100', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', 1522323854, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('af9849c5e4b78fcbe358180e962ba5d0', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522330232, ''),
('0850237c71bab318af506d85e07ec11a', '80.12.43.144', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522334241, ''),
('6e8eec939928c9d0ee42368eb5c6b82d', '41.242.89.132', 'Mozilla/5.0 (Linux; Android 7.0; VTR-L09 Build/HUAWEIVTR-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.13', 1522337362, ''),
('0e7810bcf49559d4bdb530021377008b', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522357728, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('25270259b93ce82d44d5fd49ccbce0cd', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522341834, ''),
('e5f2de3416ab45228132322f47429016', '66.249.93.22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522341834, ''),
('301bc1296adf1ee081d41660471f7483', '92.184.105.65', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522344743, ''),
('88d8bfdde6e0e8e8c97d6af3ba2f46cf', '92.184.105.65', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522342268, ''),
('4f2239600d4ddf95bbc606f42ce40967', '92.184.105.65', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522342373, ''),
('b69eeaf66dfb54b1082d68bf9ae2f0eb', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522343063, ''),
('bc6ba43a46e287257eeeb56cc93783a9', '184.154.74.66', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36', 1522348088, ''),
('c09f3092d7cafeebbb86e4fcb3ed4798', '184.154.74.66', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36', 1522348090, ''),
('428c0ba3455ffc4e5c740a8915db3e9a', '66.249.66.223', 'Googlebot-Image/1.0', 1522353032, ''),
('c327c4894e25ee5e6139243eaa96ba46', '138.122.111.52', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 1522355707, ''),
('5d07ce507167105226e4225a9e883740', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522357973, ''),
('6182541ad91784cbd3e9ad92110adf17', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522357997, ''),
('409eba40b112689d7736087ecee76391', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522358125, ''),
('822248f32dd52e5d9a86cf75c10cfe53', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522358125, ''),
('5f0bc5f6a1356b7b907003311e084e74', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522358773, 'a:1:{s:17:\"flash:new:success\";s:29:\"Vous avez été déconnecté.\";}'),
('b594461770acad2698c91481dc23e2fb', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522359081, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('78f1c649fd1a2d9f5e37c66b2efb4bfe', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522358805, ''),
('088f946dc6674923d92158996945747e', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522358901, ''),
('8994465e481226775d300ed8a80f6595', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522362492, ''),
('aaaa5bf9c97232b6d0f55a24a9c7cceb', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522362488, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:15:\"flash:old:error\";s:6:\"Erreur\";}'),
('1281a645a812f828a7503ccb94c03b1f', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522362492, ''),
('0c4e5b436dc301eee8ae8cd4e10d4869', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522362614, ''),
('700f23fdf6414f37fe3d57bdfffc7552', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522439157, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('d1dcb33d30ea7d363ed751d699345576', '81.230.137.192', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', 1522408989, ''),
('1ad47d0307ac45fc938581f22bedec66', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1522379418, ''),
('a4bb7174e6bebf5a49670717f6417fee', '141.8.142.55', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522381411, ''),
('b16b023766de803dffe8b4dbe6259f52', '180.76.15.32', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522392163, ''),
('4400aff813bb54a591a3a915615f6d9a', '80.12.34.147', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522405415, ''),
('d400c9214d6c55af89c0bd5614c2a23a', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522396446, ''),
('c0ca79664d7608369012f24d65de4d03', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522394890, ''),
('bd2d374f6b0d518601f3efc99c697ae9', '80.12.34.147', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522394076, ''),
('e9fe6ac833dfafbf1dc961ff350157f1', '80.12.34.147', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522416207, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('8485ab859dfa307cf81332ed993ffbc2', '180.76.15.33', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522394165, ''),
('05948a1604d6ae412baeee24d4bb3f14', '197.149.220.242', 'Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G925F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/6.', 1522405694, ''),
('4daed67e6ee7697e215156bab8553b20', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522394890, ''),
('869db107c23bf208a1ea4ebad8175fe9', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522394890, ''),
('f489c425efb85786ac9404694741a8c5', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522394890, ''),
('9bf375ccc661fc4b98c69765c35c40a4', '66.249.93.23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522394891, ''),
('272abb2fe95a486c9f4e8f6a9c0e16de', '80.12.34.147', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522395312, ''),
('d69b826a00438f1e411d76825359c59c', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522396447, ''),
('4e07dd4eacdc5ae7429bae88dc16395b', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522396744, ''),
('208650f9c6376f4fd4b8e176bc16fa05', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522435385, ''),
('97234bcfdf87b9154389341cac0406b8', '66.249.93.42', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522435386, ''),
('de6ff9c059111ddaa6698bdb5df5a596', '66.249.93.40', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522435386, ''),
('7f7eaa17725b199ce73c5b9bc507ca4c', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522435386, ''),
('24dfd5ecc2a7be3997968f214e503e48', '66.249.81.229', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522435387, ''),
('2e1ba00d8d13e220d50353e18c6b02c4', '66.249.81.233', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522435387, ''),
('a380f9b30900a80bdaad9c94a40aa2d5', '66.249.81.231', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', 1522435388, ''),
('81bf36469b9335b8b0911c871b31ec0e', '92.184.96.91', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522435731, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('efb68dcee28d890a7e4f0702c7799730', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522435914, ''),
('5d0ed14bbfd0c4f3f39f1916fe6b84f2', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522435923, ''),
('9a628259ddbf7543b769bb7f0307ba74', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522440652, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('fca190418f41a9fcac74848d475ce00d', '162.243.162.87', 'CRAZYWEBCRAWLER 0.9.10, http://www.crazywebcrawler.com', 1522439916, ''),
('a6e849a8b7c488198e1b9a3f71b6512f', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522440469, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('b07ae75ffc28d31b50779049f92be6bb', '66.249.93.30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522441988, ''),
('6d82964ff96fe4ce901fab21a0e2a09e', '66.249.93.55', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522441988, ''),
('8c3aa338a58ac4b1e62efcd758581395', '66.249.93.2', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522441988, ''),
('b9ed3475cd7756c231e597f9afdeeea7', '168.1.128.36', '', 1522446303, ''),
('280bf6009f40c5e61b6ca5408ffcf7fc', '95.108.181.89', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522451140, ''),
('4407c0176788117498885ad366874815', '37.9.113.102', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522454720, ''),
('6881ccac2d4070bf2cc82456fd513af5', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522455139, ''),
('786cd49cc3a260a53d342e8c7a3eb917', '141.8.142.55', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522460176, ''),
('a9e90fa52b959c2062f01cad18592ca5', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1522461617, ''),
('e8c41715f255cbf778bfafabaf3c791a', '180.76.15.151', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522472647, ''),
('0b5f15c689f834c4e4dc0722d0297083', '180.76.15.30', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522474647, ''),
('ef7611b43a93bd66236ae8b5f98a6293', '80.12.37.58', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522477896, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1fc4e8d7f2efa1da24e5ea4c6c6e400e', '80.214.65.59', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522484645, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('87fa73f49f01edc0d8428746fe5cdc50', '80.12.38.148', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522490081, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('74ac4711bfbb23ce1a91b3c19b0f5242', '80.214.65.59', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522493249, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('35a371417ef46af047f223027600e2fc', '180.76.15.23', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522490393, ''),
('d17aeebabc346e2ff5dc9cd4f8718ac9', '180.76.15.150', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522490394, ''),
('a0963417e8e192930dca7fcd6364c371', '92.184.105.176', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522493367, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('a1abd0956e60fd4291b18ca6904248c8', '66.249.93.25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522492611, ''),
('1a96335f9391a1e880d893b3b77e0c39', '66.249.93.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522492611, ''),
('195de61ab58b28e38bbb03ade453f84e', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522492611, ''),
('c7f14caf8e9896aa8fd41e48b349acb0', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522492612, ''),
('fd01e62d537db6d0d7a625507d340ab0', '92.154.45.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522492736, ''),
('4e6bf6f596935df1595fc70be0b84085', '92.154.45.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522492860, ''),
('c0bcb6e70aad42f413b0efe4bbd60b13', '185.198.167.30', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', 1522493044, ''),
('3c0bfabf4c25237f64e9dff59f33ae78', '80.215.35.202', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522500749, 'a:6:{s:8:\"username\";s:11:\"radja.lomas\";s:5:\"email\";s:22:\"r.lomas@spelldesign.fr\";s:2:\"id\";s:2:\"17\";s:7:\"user_id\";s:2:\"17\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('348f231e22f4531377984d906729f145', '197.149.221.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 fac', 1522506225, ''),
('b1ab9eca0f30bd969612633f6d5afbbd', '197.149.221.244', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_1 like Mac OS X) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0 Mobile/14B7', 1522506235, ''),
('d670d79a9fcd9a3c1b390da391f7038b', '66.249.66.221', 'Googlebot-Image/1.0', 1522511311, ''),
('36df7b6ea490ab650ed3f2bb472b7106', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522518595, ''),
('dea6aab3375d890686e4d8caa38580c9', '178.255.80.147', 'Java/1.8.0_111', 1522523130, ''),
('4b747847cc477d90c5a41437270cb450', '178.255.80.147', 'Java/1.8.0_111', 1522523130, ''),
('0496e0cc77cefd218f5073567bec9772', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522532789, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('dbb96e7fe2a2019e5bc77d1fc3b4925a', '180.76.15.17', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522547007, ''),
('b62b5464c6f83387d87790fa44a13773', '180.76.15.158', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522549007, ''),
('79c4716ec97172395145aeb0a484d1be', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522570486, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('6673b20b9d346bed726c49d5e030894f', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522570600, ''),
('9f30c001c7e0c1b2963d80ed8657bd12', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522587652, ''),
('af89a5d39647ac317b88219238da77ae', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522589699, ''),
('f0678be553adc01a7c5af0a2423912e6', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522589700, ''),
('95cb8f9cbed7b61e20b2c39224bb8a21', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522589701, ''),
('9497f9633bde0b3999f97f8e82a66d67', '80.215.12.246', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522590768, ''),
('c4308ae869a211bd02b7d6ca047708d1', '158.69.25.178', 'Mozilla/5.0 (compatible; DomainSONOCrawler/0.1; +http://domainsono.com)', 1522595617, '');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('db76b7f77176f6df09a6719504ce00e1', '158.69.25.178', 'Mozilla/5.0 (compatible; DomainSONOCrawler/0.1; +http://domainsono.com)', 1522595701, ''),
('fdf9867844ff42c0bd8c862f1ccd7352', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522605388, ''),
('ca771b7c819870901ea3bdbaec80681d', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522605388, ''),
('1b4acb88072a1fac3b2fb5125f83a48a', '212.83.178.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 1522635575, ''),
('438909c824a15cb7598ccad88ea69cb0', '54.183.165.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522639779, ''),
('e0ba06a06417f6b67dfdb8b399d9f8e4', '54.183.165.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522639780, ''),
('10496f2fb7aee5b264fd7b6561323837', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522647247, ''),
('f81ae9c6fda503a7eb56d09a956826de', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522647248, ''),
('5eb59c5d7b6f374622e83f3538ab54c2', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522649494, ''),
('09f7ef05a75a6139ac34d757982acf28', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522649186, ''),
('cecaabfed3500414503cabc27e91909d', '78.213.60.211', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522649187, ''),
('28fbd7dec8002c329a8250bf63ba3049', '92.184.96.60', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522649593, ''),
('a30d4b7e16a9138e7621c99e5bdc8262', '78.213.60.211', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522649598, 'a:6:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('46ace4a920e8c3e8d5d964ef7c4d8993', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522660136, ''),
('7189a253df6b8fa25777ada5cc8373b6', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522660137, ''),
('e164f4792ffecd24750e477d46a9e6b3', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522684149, ''),
('3f55d08c1da206de83beca48d0a32f7e', '66.249.93.47', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522684149, ''),
('2103527dbf0cab2f55a74b2c4b9811ea', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522684149, ''),
('91bef1644bcd86bb6afc3fdb3dfac16a', '66.249.93.45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522684149, ''),
('f8c13c4061302a7bfbe58ae35ea0a98f', '66.249.93.24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522684150, ''),
('328125398c0e02eedabbf4ea4c4da00a', '197.149.221.202', 'Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G925F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/6.', 1522686423, ''),
('88cd30532a5231133af91423b28c4091', '180.76.15.30', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522687715, ''),
('c6a06adc19101faee9ce8574fd0fb8c9', '54.190.50.41', 'Mozilla/5.0 (X11; Linux i686 on x86_64; rv:53.0) Gecko/20100101 Firefox/53.0', 1522707954, ''),
('444544b8f41a28e8e5955362463c0645', '87.250.224.111', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522713229, ''),
('59a9de10d7f82cbb28bde50b7e80c12c', '178.154.171.35', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522732086, ''),
('ab47f12369ef52568f5568575a69b34f', '80.12.34.245', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522772584, 'a:7:{s:8:\"username\";s:12:\"barry.almamy\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('e10a708dbcfbc55726f216bed27decd0', '141.8.142.24', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522760936, ''),
('924f37fdd0df479e967dd59d3715bd03', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1522741492, ''),
('cb1cb078ff130602247308c532eda77d', '91.200.12.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1522741496, ''),
('f8d21b37b4075fae02235a6236a99555', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522758206, ''),
('75918cd3d3248dfe921ac8c5ef7107b1', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522758207, ''),
('5360a45d1aaba54fd5668207eb543c64', '66.249.93.26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522758207, ''),
('fdcfd2797bf5b17edc385231ba514ab1', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522765151, ''),
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
('b07590ae69218c36a3c0290d5e578a3e', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522831818, '');

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
(8, 'lang:profile_dob', 'birth_date', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a323a223134223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(23, 'Civilité', 'gender', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a32303a2268203a20486f6d6d650d0a66203a2046656d6d65223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a303a22223b733a31313a226d696e5f63686f69636573223b733a303a22223b733a31313a226d61785f63686f69636573223b733a303a22223b7d, NULL, 'no'),
(10, 'lang:profile_phone', 'phone', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a323a223230223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(11, 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a323a223230223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(12, 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(13, 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(21, 'Quartier', 'area_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(15, 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(22, 'Mutuelle', 'insurance', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(24, 'Médecin habituel', 'doctor_id', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(25, 'pre html', 'pre_html', 'pages', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b733a303a22223b733a31303a22616c6c6f775f74616773223b733a313a2279223b733a31323a22636f6e74656e745f74797065223b733a343a2268746d6c223b7d, NULL, 'no'),
(26, 'post html', 'post_html', 'pages', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b733a303a22223b733a31303a22616c6c6f775f74616773223b733a313a2279223b733a31323a22636f6e74656e745f74797065223b733a343a2268746d6c223b7d, NULL, 'no'),
(506, 'Bureau', 'desk_no', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(567, 'Etablissement', 'subset', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(505, 'Phone valid', 'phone_valid', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a313a2233223b733a31333a2264656661756c745f76616c7565223b733a323a226e6f223b7d, NULL, 'no'),
(566, 'Structure', 'organisation', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a38373b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(565, 'Organisme ou groupe', 'groupe', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a38373b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(564, 'Catégorie parente', 'parent_cat', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a38363b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(562, 'Catégorie', 'doctor_cat', 'doctor', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b693a38363b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(563, 'Spécialité médicale', 'speciality', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(561, 'Image docteur', 'image', 'doctor', 'image', 0x613a353a7b733a363a22666f6c646572223b693a33333b733a31323a22726573697a655f7769647468223b4e3b733a31333a22726573697a655f686569676874223b4e3b733a31303a226b6565705f726174696f223b4e3b733a31333a22616c6c6f7765645f7479706573223b4e3b7d, NULL, 'no'),
(560, 'Ville', 'town', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(559, 'Quartier', 'area_name', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(558, 'Adresse', 'address', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(557, 'Email', 'email', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(556, 'Mobile', 'mobile', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(555, 'Téléphone', 'telephone', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(553, 'RDV Max Jour(30\")', 'max_per_day', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a323b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(554, 'Description', 'description', 'doctor', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(551, 'Ouverture', 'opens', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(552, 'Fermeture', 'closes', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(550, 'Heures d\'ouverture', 'hours', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(549, 'Jours ouverts', 'days', 'doctor', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a3332353a2231203a206c756e64690d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202032203a206d617264690d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202033203a206d657263726564690d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202034203a206a657564690d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202035203a2076656e64726564690d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202036203a2073616d6564690d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202030203a2064696d616e636865223b733a31313a2263686f6963655f74797065223b733a31303a22636865636b626f786573223b733a31333a2264656661756c745f76616c7565223b733a303a22223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(548, 'Nom du practicien', 'name', 'doctor', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3230303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(507, 'Etage', 'floor', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(568, 'Commune', 'district', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b733a303a22223b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
(569, 'Nom de jeune fille', 'maiden_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no');

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
(19, 16, 3, 19, 'no', 'no', 'Vos informations médicales', NULL),
(8, 2, 3, 8, 'yes', 'no', 'Date de naissance.', NULL),
(23, 1, 3, 23, 'no', 'no', 'Vous êtes un homme ou une femme?', NULL),
(10, 4, 3, 10, 'no', 'no', 'Votre numéro de téléphone fixe', NULL),
(11, 5, 3, 11, 'yes', 'no', 'Votre numéro de téléphone portable', NULL),
(12, 6, 3, 12, 'no', 'no', 'Adresse ligne 1', NULL),
(13, 7, 3, 13, 'no', 'no', 'Adresse ligne 2', NULL),
(20, 10, 3, 20, 'no', 'no', 'Votre ville ou village de résidence', NULL),
(15, 17, 3, 15, 'no', 'no', NULL, NULL),
(21, 8, 3, 21, 'no', 'no', 'Votre quartier de résidence si applicable', NULL),
(22, 11, 3, 22, 'no', 'no', 'Votre mutuelle d\'assurance', NULL),
(24, 15, 3, 24, 'no', 'no', 'Si vous connaissez le numéro identifiant de votre médecin, vous pouvez le renseigner ici.', NULL),
(25, 1, 2, 25, 'no', 'no', '', NULL),
(26, 2, 2, 26, 'no', 'no', '', NULL),
(502, 14, 3, 505, 'no', 'no', '', NULL),
(564, 2, 87, 567, 'yes', 'yes', NULL, NULL),
(545, 1, 85, 548, 'no', 'no', NULL, NULL),
(546, 2, 85, 549, 'no', 'no', NULL, NULL),
(547, 2, 85, 550, 'no', 'no', NULL, NULL),
(548, 2, 85, 551, 'no', 'no', NULL, NULL),
(549, 3, 85, 552, 'no', 'no', NULL, NULL),
(550, 4, 85, 553, 'no', 'no', NULL, NULL),
(551, 5, 85, 554, 'no', 'no', NULL, NULL),
(552, 6, 85, 555, 'no', 'no', NULL, NULL),
(553, 7, 85, 556, 'no', 'no', NULL, NULL),
(554, 8, 85, 557, 'no', 'no', NULL, NULL),
(555, 9, 85, 558, 'yes', 'no', NULL, NULL),
(556, 10, 85, 559, 'yes', 'no', NULL, NULL),
(557, 11, 85, 560, 'yes', 'no', NULL, NULL),
(558, 12, 85, 561, 'no', 'no', NULL, NULL),
(559, 13, 85, 562, 'no', 'no', NULL, NULL),
(560, 1, 86, 563, 'yes', 'yes', NULL, NULL),
(561, 2, 86, 564, 'no', 'no', NULL, NULL),
(562, 14, 85, 565, 'no', 'no', NULL, NULL),
(563, 1, 87, 566, 'no', 'no', NULL, NULL),
(503, 12, 3, 506, 'no', 'no', 'Numéro de bureau ou instructitons d\'accès', NULL),
(504, 13, 3, 507, 'no', 'no', '', NULL),
(565, 9, 3, 568, 'no', 'no', '', NULL),
(566, 3, 3, 569, 'no', 'no', '', NULL);

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
(85, 'lang:doctor:doctors', 'doctors', 'doctor', 'doctor_', NULL, 0x613a343a7b693a303b733a343a2264617973223b693a313b733a31313a226465736372697074696f6e223b693a323b733a363a2267726f757065223b693a333b733a31303a22646f63746f725f636174223b7d, NULL, 'title', NULL, 'no', NULL),
(86, 'lang:doctor:categories', 'categories', 'doctor', 'doctor_', NULL, 0x613a323a7b693a303b733a31303a22706172656e745f636174223b693a313b733a31303a227370656369616c697479223b7d, 'speciality', 'title', NULL, 'no', NULL),
(87, 'lang:doctor:organisations', 'organisations', 'doctor', 'doctor_', NULL, 0x613a323a7b693a303b733a31323a226f7267616e69736174696f6e223b693a313b733a363a22737562736574223b7d, 'subset', 'title', NULL, 'no', NULL);

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
(14, '2018-03-10 00:20:01', '2018-03-29 22:11:46', 1, 1, NULL, '', ''),
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
(27, '2018-04-05 14:18:11', '2018-04-05 14:28:54', 1, 6, NULL, '', ''),
(25, '2018-03-27 19:26:58', '2018-03-29 14:37:42', 1, 4, NULL, '<p id=\"msg\" class=\"text-center\"></p>\n<div id=\"position\" class=\"form-group text-center col-sm-6 col-sm-offset-3\">\n	<label for=\"position\">Position GPS</label>\n	<div class=\"input\">\n		<input class=\"form-control\" name=\"position\" type=\"text\" onfocus=\"this.select()\" />\n	</div>\n	<button onclick=\"geoGetPosition()\" class=\"btn btn-default\"><i class=\"glyphicon glyphicon-map-marker\"></i> Position\n	</button> \n</div> \n', ''),
(26, '2018-03-29 15:23:10', '2018-03-29 15:23:16', 1, 5, NULL, '', '');

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
  `speciality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_cat` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_doctor_categories`
--

INSERT INTO `default_doctor_categories` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `speciality`, `parent_cat`) VALUES
(1, '2018-03-10 01:54:40', NULL, 1, 1, 'Médecins généralistes', NULL),
(2, '2018-03-10 01:54:47', '2018-03-14 22:49:06', 1, 2, 'Sage femme', 5),
(3, '2018-03-10 01:54:53', NULL, 1, 3, 'ORL', NULL),
(4, '2018-03-10 01:54:59', NULL, 1, 4, 'Cardiologue', NULL),
(5, '2018-03-10 01:55:05', NULL, 1, 5, 'Spécialistes femme', NULL),
(6, '2018-03-10 01:55:12', NULL, 1, 6, 'Dentiste', NULL),
(7, '2018-03-10 01:55:17', NULL, 1, 7, 'Radiologue', NULL),
(8, '2018-03-10 01:55:22', NULL, 1, 8, 'Autres médecins', NULL),
(9, '2018-03-10 01:55:27', NULL, 1, 9, 'Etablissements de santé', NULL),
(10, '2018-03-15 00:11:43', NULL, 1, 10, 'Chirurgien dentiste', 6),
(11, '2018-03-15 00:11:58', NULL, 1, 11, 'Pédiatre', 8),
(12, '2018-03-15 00:12:15', NULL, 1, 12, 'Gynécologue obstétrique ou médical', NULL),
(13, '2018-03-15 00:12:24', NULL, 1, 13, 'Ostéopathe', NULL),
(14, '2018-03-15 00:12:34', NULL, 1, 14, 'Pédicure – Podologue', NULL),
(15, '2018-03-15 00:31:48', NULL, 1, 15, 'Sage – femme', 5),
(16, '2018-03-15 00:31:56', NULL, 1, 16, 'Allergologue', 3),
(17, '2018-03-15 00:32:02', NULL, 1, 17, 'Urologue', NULL),
(18, '2018-03-15 00:32:09', NULL, 1, 18, 'Rhumatologue', NULL),
(19, '2018-03-15 00:32:15', NULL, 1, 19, 'Endocrinologue', NULL),
(20, '2018-03-15 00:32:26', NULL, 1, 20, 'Stomatologue', NULL),
(21, '2018-03-15 00:32:33', NULL, 1, 21, 'Orthopédiste', NULL),
(22, '2018-03-15 00:32:40', NULL, 1, 22, 'Diététicien', NULL),
(23, '2018-03-15 00:32:46', NULL, 1, 23, 'Psychologue', NULL),
(24, '2018-03-15 00:33:02', NULL, 1, 24, 'Psychiatre', NULL),
(25, '2018-03-15 00:33:19', NULL, 1, 25, 'Neurologue', NULL),
(26, '2018-03-15 00:33:30', NULL, 1, 26, 'Gastro-entérologue et hépatologue', NULL),
(27, '2018-03-15 02:53:55', NULL, 1, 27, 'Médecin du sport', NULL);

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
  `groupe` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_doctor_doctors`
--

INSERT INTO `default_doctor_doctors` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `name`, `days`, `hours`, `opens`, `closes`, `max_per_day`, `description`, `telephone`, `mobile`, `email`, `address`, `area_name`, `town`, `image`, `doctor_cat`, `groupe`) VALUES
(1, '2018-03-14 22:48:11', NULL, 1, 1, 'Radja Lomas', '0', NULL, '0800', '1600', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', '77820', 'Bondoufle', 'dummy', 1, 4),
(2, '2018-03-14 23:29:25', NULL, 1, 2, 'Lomas', '1\n2\n3\n4\n0', NULL, '0800', '1800', NULL, 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', '0678957826', '0678957826', 'email@nowhere.com', '4 allée Jacques Ibert', '189610', 'Saint Michel sur Orge', 'dummy', 3, 1),
(3, '2018-03-15 01:33:59', NULL, 1, 3, 'Bretin Jean', '1\n2\n3\n4\n5', NULL, '0900', '1800', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '10 Rue du Plessier', '77820', 'Le Châtelet-en-Brie', 'dummy', 1, NULL),
(4, '2018-03-15 01:34:44', NULL, 1, 4, 'Dodin Frédéric', '0', NULL, '0800', '1930', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '16 Allée de la Clairière,', '77820', 'Le Châtelet-en-Brie', 'dummy', 1, NULL),
(5, '2018-03-15 01:35:33', '2018-03-15 01:36:54', 1, 5, 'Quilain Marie', '0', NULL, '0900', '1930', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '16 Allée de la Clairière,', '77820', 'Le Châtelet-en-Brie', 'dummy', 1, NULL),
(6, '2018-03-15 01:36:35', NULL, 1, 6, 'SCM des Docteurs Gest et Raad', '0', NULL, '0830', '1930', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '13 Quai Maréchal Foch', '77000', 'Melun', 'dummy', 4, NULL),
(7, '2018-03-15 01:37:36', NULL, 1, 7, 'Docteur Salim Meliani', '0', NULL, '0830', '1800', NULL, 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', '0678957826', '0678957826', 'email@nowhere.com', '1 Rue des Sapins', '77210', 'Avon', 'dummy', 24, NULL),
(8, '2018-03-15 01:38:53', NULL, 1, 8, 'Docteur Allanche Laurent - Chirurgien ORL', '0', NULL, '0830', '1930', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '54 Boulevard Aristide Briand', '77000', 'Melun', 'dummy', 3, NULL),
(9, '2018-03-15 02:57:18', NULL, 1, 9, 'Docteur Guillaume Paris - Médecin du sport', '2\n3\n4', NULL, '0830', '2000', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '2A Avenue de Ségur', '75007', 'Paris', 'dummy', 27, NULL),
(10, '2018-03-15 02:58:15', NULL, 1, 10, 'CENTRE DE CONSULTATIONS MÉDICALES 24H/24 À PARIS', '1\n2\n3\n4\n5\n6\n0', NULL, '0000', '2359', NULL, 'Nullam ullamcorper semper turpis, nec suscipit risus fermentum a. Pellentesque nec vulputate augue, ultricies malesuada purus. Nullam et nibh et sapien finibus blandit. In id libero nec orci elementum sodales eu nec massa. Duis et pellentesque eros, non tempus mi. Fusce convallis vel nibh vitae porttitor.', '0678957826', '0678957826', 'email@nowhere.com', '2 Rue d\'Alexandrie', '75002', 'Paris', 'dummy', 1, NULL),
(11, '2018-03-15 02:58:44', NULL, 1, 11, 'Dr GHERRAK Sandrine - Généraliste Paris 5', '0', NULL, '0900', '1800', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '7 Rue Berthollet', '75005', 'Paris', 'dummy', 1, NULL),
(12, '2018-03-15 02:59:46', NULL, 1, 12, 'Docteur Olivier Kadoch - Gynécologue', '0', NULL, '0900', '1800', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '107 Avenue Victor Hugo', '75016', 'Paris', 'dummy', 12, NULL),
(13, '2018-03-15 03:01:24', '2018-03-28 21:10:13', 1, 13, 'Dr Ari Elhyani Dentiste Paris', '2', NULL, '0900', '1930', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '11 Avenue de l\'Opéra', '75001', 'Paris', 'dummy', 6, NULL),
(14, '2018-03-15 03:02:27', '2018-03-30 23:50:35', 1, 14, 'Dr Fabien Mauro', '1\n2\n3\n4', NULL, '09:00', '20:00', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '18 Rue de Turbigo', '75002', 'Paris', '699df7530ec4c93', 6, 1),
(15, '2018-03-31 00:00:17', '2018-03-31 00:06:06', 12, 15, 'LAMAH Simon Pière', '1\n2', '8:30', '12;30', '17:30', '15', 'Le  Cabinet est situé à Donka', '664256124', NULL, NULL, 'Route de Nézérékoré', 'Nézérékoré', 'Nézérékoré', '55b8dff41b6c29b', 1, 2);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_doctor_organisations`
--

INSERT INTO `default_doctor_organisations` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `organisation`, `subset`) VALUES
(1, '2018-03-14 14:47:35', '2018-03-15 00:14:47', 1, 1, 1, 'Privée'),
(2, '2018-03-14 14:49:59', '2018-03-14 17:43:03', 1, 2, 2, 'Publique'),
(4, '2018-03-14 15:04:27', '2018-03-14 17:37:51', 1, 3, 1, 'Clinique privée'),
(5, '2018-03-14 15:04:47', '2018-03-14 17:44:08', 1, 4, 1, 'Soins à domicile'),
(6, '2018-03-14 15:05:03', '2018-03-14 17:43:23', 1, 5, 2, 'Hopital '),
(7, '2018-03-14 15:05:15', '2018-03-14 17:43:38', 1, 6, 2, 'Dispensaire');

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
(44, 'appointments-patient', 'Appointment mail for patient', 'Email au patient suite à une prise de RDV par le patient', 'Votre RDV du {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}', '<p>Bonjour {{user_data:display_name}}\n                                                    <br/>\n                                                    Vous avez effectué une prise de RDV pour le {{ helper:date format=\"%A %e %b %Y à %R\" timestamp=appointment_data:appointment_date }}\n                                                    </p>\n\n                                                    <h2>Date du RDV{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }}</h2>\n                                                    <h3>Heure du RDV {{ appointment_data:appointment_time }}</h3>\n  \n                                                    <p>\n                                                    <a href=\"{{url:site}}appointments/view/{{appointment_id}}\" target=\"_blank\">Vous pouvez voir votre RDV içi</a><br />\n                                                    <br />\n                                                    Merci pour votre confiance.\n                                                    </p>\n                                                    <p> \n                                                    User ID: {{ appointment_data:user_id }}<br />\n                                                    IP Address: {{ sender_ip }}<br />\n                                                    Operating System: {{ sender_os }}<br />\n                                                    User Agent: {{ sender_agent }}\n                                            ', 'fr', 0, 'appointments'),
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
('55b8dff41b6c29b', 33, 12, 'i', 'lamah-pierre.jpg', '4e7ecbb053cfe879796c33c4cc49171d.jpg', '{{ url:site }}files/large/4e7ecbb053cfe879796c33c4cc49171d.jpg', '', '.jpg', 'image/jpeg', '', 101, 109, 10, '', 0, 1522440017, 0);

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
(30, 0, 'divers', 'Divers', 'local', '', 1521127321, 1521127321, 0);

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
(69, 'a:2:{s:2:\"en\";s:7:\"Doctors\";s:2:\"fr\";s:8:\"Docteurs\";}', 'doctor', '0.1.10', NULL, 'a:2:{s:2:\"en\";s:12:\"Doctors list\";s:2:\"fr\";s:18:\"Liste des Docteurs\";}', 0, 1, 1, 'content', 1, 1, 0, 1522931193),
(24, 'a:2:{s:2:\"en\";s:20:\"Calendars(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'calendars', '0.1.0', NULL, 'a:2:{s:2:\"en\";s:16:\"Calendars module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', 0, 1, 1, 'content', 1, 1, 0, 1520995285),
(25, 'a:2:{s:2:\"en\";s:17:\"Orders(Commandes)\";s:2:\"fr\";s:9:\"Commandes\";}', 'orders', '0.73.08', NULL, 'a:2:{s:2:\"en\";s:13:\"Orders module\";s:2:\"fr\";s:19:\"Module de commandes\";}', 0, 1, 1, 'content', 0, 0, 0, 1522931193),
(79, 'a:1:{s:2:\"en\";s:12:\"Token module\";}', 'token', '0.5.01', NULL, 'a:1:{s:2:\"en\";s:16:\"Token management\";}', 0, 1, 1, 'content', 1, 1, 0, 1522931193),
(81, 'a:2:{s:2:\"en\";s:23:\"Appointments(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'appointments', '0.1.21', NULL, 'a:2:{s:2:\"en\";s:19:\"Appointments module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', 0, 1, 1, 'content', 1, 1, 0, 1522931202),
(53, 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'carte', '0.98', NULL, 'a:1:{s:2:\"fr\";s:28:\"Module de calendrier semaine\";}', 0, 1, 1, 'content', 0, 0, 0, 1521079824),
(70, 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'calendar', '0.1.01', NULL, 'a:1:{s:2:\"fr\";s:18:\"Calendrier semaine\";}', 0, 1, 1, 'content', 1, 1, 0, 1522326845),
(35, 'a:2:{s:2:\"en\";s:8:\"Products\";s:2:\"fr\";s:8:\"Produits\";}', 'products', '0.61.01', NULL, 'a:2:{s:2:\"en\";s:16:\"Products module.\";s:2:\"fr\";s:8:\"Produits\";}', 0, 1, 1, 'content', 0, 0, 0, 1522931193),
(59, 'a:2:{s:2:\"en\";s:6:\"Relays\";s:2:\"fr\";s:13:\"Points Relais\";}', 'relay', '1.0.5', NULL, 'a:2:{s:2:\"en\";s:11:\"Relays list\";s:2:\"fr\";s:23:\"Liste des Points Relais\";}', 0, 1, 1, 'content', 0, 0, 0, 1522326845);

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
(13, 'bootstrap', '', 'bootstrap', 'bootstrap', 0, '1', '13', '', '', '', '', 0, 0, '', 0, 0, 'live', 1520637740, 1520640249, '0', 0, 1, 7),
(14, 'accueil-old', '', 'Accueil', 'accueil-old', 0, '3', '14', '.ico-grp {\n    margin: auto;\n    padding: 0;\n    padding-left: 0.6%;\n    max-width: 348px;\n    width: 100%;\n    /* background: blue; */\n}\n.specialite {\ndisplay: inline-block;\n    margin: 0%;\n    width: 100px;\n    text-align: center;\n    /* max-width: 33%; */\n    min-width: 85px;\n    height: 100px;\n    padding: 3%;\n    /* background: red; */\n}\ndiv.specialite:hover {\n    font-weight : bold;\n}\n#doctor-search {\n    margin: auto;\n    text-align: center;\n    max-width: 400px;\n} \n.set {\n    background-color: #dff0d8;\n    font-weight: bold;\n    color: #3c763d;\n}\ndiv.specialite p {\n    text-overflow: ellipsis;\n    text-align: center; \n    width: 100%;\n    height: 38px;\n    overflow: hidden;\n    font-size: small;\n}', '/* public vars */\nvar doctors = []; \nvar mApi = { \n    mapsUrl: \"https://maps.googleapis.com/maps/api/js?key=\",\n    key:\"AIzaSyDkUU_ti16t_PBfJ8o2-p_AciVkD8Q_2uo\",\n    geocodeUrl:\"https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=\",\n//    centLat:48.62,\n//    centLon:2.44, \n    zoom:10\n}; \n/* doctor module functions */\n/** builds locations map of doctors\n *  gets data from HTML5 data attributes in doctor\'s list\n * @returns {undefined}\n */\nfunction doctorsMap() \n{\n//    console.log(\'doctorsMap\');\n//    console.log(doctors);\n    if(typeof doctors === \'undefined\') return;\n    \n    \n    var map;\n    \n    //var elevator;\n    var myOptions = {\n        zoom: mApi.zoom,\n        center: new google.maps.LatLng(mApi.centLat ,mApi.centLon )\n        /*,\n        mapTypeId: \'terrain\'*/\n    };\n    \n    map = new google.maps.Map($(\"#map_canvas\")[0], myOptions); \n \n    for (var x = 0; x < doctors.length; x++) \n    {  \n//        var xadr;\n//        var xname; \n        console.log(\'loop:\'+x);\n        xadr = doctors[x].address;\n        xname = doctors[x].name;\n        /* geocode */\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \n        { \n            /* exit if has no values */\n            if(typeof(data) === \'undefined\') return;\n//            console.log(\'data:\'+data);\n            console.log(\'name:\'+data.results[0].formatted_address);\n            var p = data.results[0].geometry.location;\n//            console.log(\'location:\'+p);\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\n            console.log(\'loop \'+x+\' lat long:\'+latlng);\n            new google.maps.Marker({\n                position: latlng,\n                map: map,\n                title: xname\n            }); \n        });\n    }\n    /* center and zoom */\n    // map - instance of google Map v3\n    // markers - array of Markers\n    /*\n    var bounds = google.maps.reduce(function(bounds, marker) {\n        return bounds.extend(marker.getPosition());\n    }, new google.maps.LatLngBounds());\n\n    map.setCenter(bounds.getCenter());\n    map.fitBounds(bounds);\n*/\n}\n/**\n *  gets Google API JS and runs doctorMap on complete\n * @returns {undefined}\n */\nfunction loadMap() \n{\n    if($(\"#map_canvas\").length == 0) $(\'#doctors-list\').prepend(\'<div id=\"map_canvas\"></div>\');\n    /* correct height for small screens */\n//    if($( window ).height() < 400)\n//    {\n//        $(\'#map_canvas\').css(\'heigth\', 240);\n//    } \n//    console.log(\'loadMap: \'+mApi.mapsUrl + mApi.key);\n    //geocode first address for map center\n            /* geocode */\n            xadr = $(\'.doctor\').attr(\'data-id\');\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \n        { \n            /* exit if has no values */\n            if(typeof(data) === \'undefined\') return;\n            console.log(\'data:\'+data);\n            console.log(\'name:\'+data.results[0].formatted_address);\n            var p = data.results[0].geometry.location;\n            console.log(\'location:\'+p);\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\n            console.log(\'loop \'+x+\' lat long:\'+latlng); \n        });\n    \n    //\n    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);\n    $(\'#doctors-map-btn\').hide();\n    $(\'#doctors-map-btn\').after(\'<div id=\"map_canvas\"></div>\');\n    $(\'#map_canvas\').html(pg_load);\n}\n/** based on function from\n * https://stackoverflow.com/questions/6797569/get-city-name-using-geolocation\n * answered Apr 29 \'16 at 4:12 Mikhail\n * ********************************************************************************/ \nvar returned_address =\'\'; \nfunction geoGetTown() {\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\n} \nfunction geoSuccess(position) {\n    //console.log(position.coords.latitude)\n    //console.log(position.coords.longitude)\n\n    var geocoder = \'https://maps.googleapis.com/maps/api/geocode/json?latlng=\' + position.coords.latitude + \'%2C\' + position.coords.longitude + \'&language=en&key=\' + mApi.key;\n\n    $.getJSON(geocoder).done(function(location) \n    {\n//        console.log(location); \n        returned_address=location.results[0].address_components[2].long_name;\n        $(\'#doctor-search input[name=s]\').val(returned_address); \n        $(\'.searchbox-area\').addClass(\'has-success\'); \n        $(\'.searchbox-area input\').addClass(\'set\'); \n    });\n} \nfunction geoError(err) {\n    console.log(err);\n    alert(\"positioning error\");\n} \n/********************************************************************************/  \n {{if false }}\nfunction myPosition(position) {\n    var infopos = \"Position déterminée :\\n\";\n    infopos += \"Latitude : \"+position.coords.latitude +\"\\n\";\n    infopos += \"Longitude: \"+position.coords.longitude+\"\\n\";\n    infopos += \"Altitude : \"+position.coords.altitude +\"\\n\";\n    return infopos;\n}\n{{endif}}\n{{# load doctor module JS #}}\n{{# doctor:js #}}\n\n/** empties search box\n * \n * @returns {undefined}\n */\n function cleanDocSearch()\n {\n     console.log(\'clean\');\n     $(\'.searchbox-query\').removeClass(\'has-success\'); \n     $(\'#doctor-search input[name=c]\').val(\'\').removeClass(\'set\');\n    /*UX*/\n    \n    $(\'#categories\').show();\n }\n function cleanAreaSearch()\n {\n     console.log(\'clean\');\n     $(\'.searchbox-area\').removeClass(\'has-success\'); \n     $(\'#doctor-search input[name=s]\').val(\'\').removeClass(\'set\');\n    /*UX*/ \n//    $(\'.titre-auto\').hide() ;\n }\n \n \n$( document ).ready(function() \n{    \n        /*geo btn */\n        /* remove geo btn if no localisation */\n//        if(navigator.geolocation !== true) \n//        {\n//            $(\'.searchbox-locate .input-group-addon a\').addClass(\'disabled\');\n//        } else {\n            $(\'.searchbox-locate a\').removeClass(\'disabled\'); \n//        }  \n        /* UIX select all */\n        $(\'.searchbox-query input, .searchbox-area input\').on(\'focus\', function(){ this.select(); });\n        /* jquery autocomplete */\n        $( function() {\n          var medicSpecialities = [\n                  \"Dentiste\",\n                  \"Généraliste\",\n                  \"Chirurgien dentiste\",\n                  \"Médecin généraliste\",\n                  \"Pédiatre\",\n                  \"Gynécologue obstétrique ou médical\",\n                  \"Ophtalmologue\",\n                  \"Dermatologue\",\n                  \"Ostéopathe\",\n                  \"Kinésithérapeute\",\n                  \"Pédicure – Podologue\",\n                  \"Sage – femme\",\n                  \"ORL\",\n                  \"Allergologue\",\n                  \"Urologue\",\n                  \"Rhumatologue\",\n                  \"Endocrinologue\",\n                  \"Stomatologue\",\n                  \"Orthopédiste\",\n                  \"Diététicien\",\n                  \"Psychologue\",\n                  \"Neurologue\",\n                  \"Psychiatre\",\n                  \"Radiologue\",\n                  \"Cardiologue\",\n                  \"Gastro-entérologue et hépatologue\"\n          ];\n          $( \".searchbox-query input\" ).autocomplete({\n            source: medicSpecialities\n          });\n        } ); \n    //add functionality to specialities\n    $(\'.ico-grp .specialite\').each(function() {\n        $( this ).on(\'click\', function _selectType(event) \n        {\n            if(typeof(event)!==\'undefined\') event.preventDefault();\n            var cat = $(this).attr(\"data-cat\"); \n            var type = $(this).attr(\"data-type\"); \n            $(\'.searchbox-query\').addClass(\'has-success\');\n            $(\'#doctor-search input[name=c]\').val(cat).addClass(\'set\');\n            /*UX*/\n            $(\'#categories\').hide();\n            $(\'.titre-auto\').show().text(\'Choisir votre \'+cat.toLowerCase());\n            \n//            $(\'.titre-\'+type).slideDown();\n            console.log(type);\n            \n            \n//            /* https://www.taniarascia.com/smooth-scroll-to-id-with-jquery/ */\n//            $(\'html, body\').animate({\n//                    scrollTop: $(\'div.searchbox-query\').offset().top\n//            }, 500, \'linear\');\n        });\n    });\n\n});', '', '', 0, 0, '', 0, 0, 'live', 1520641201, 1522347106, '2', 1, 1, 0),
(27, 'tests', '', 'Tests', 'tests', 0, '1', '27', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923491, 1522924134, '0', 0, 1, 6),
(15, 'test-plugin-list-doctors', '', 'test plugin list doctors', 'tests/test-plugin-list-doctors', 27, '1', '15', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521475440, 1521478872, '0', 0, 1, 1),
(16, 'test-plugin-show-doctor', '', 'test plugin show doctor', 'tests/test-plugin-show-doctor', 27, '1', '16', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521478197, 1521478847, '0', 0, 0, 0),
(34, 'rdv-passes-de-mes-proches', '', 'RDV passés de mes proches', 'rendez-vous/rdv-passes-de-mes-proches', 28, '6', '34', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923826, 0, '0', 0, 1, 5),
(35, 'test-appointments', '', 'test appointments', 'tests/test-appointments', 27, '1', '35', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522924171, 1522924197, '0', 0, 1, 2),
(33, 'mes-rdv-passes', '', 'Mes RDV passés', 'rendez-vous/mes-rdv-passes', 28, '6', '33', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923814, 0, '0', 0, 1, 4),
(32, 'rdv-passes', '', 'RDV passés', 'rendez-vous/rdv-passes', 28, '6', '32', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923693, 0, '0', 0, 1, 3),
(31, 'rdv-a-venir-de-mes-proches', '', 'RDV à venir de mes proches', 'rendez-vous/rdv-a-venir-de-mes-proches', 28, '5', '31', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923681, 0, '0', 0, 1, 2),
(30, 'mes-rdv-a-venir', '', 'Mes RDV à venir', 'rendez-vous/mes-rdv-a-venir', 28, '5', '30', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923669, 1522924538, '0', 0, 1, 1),
(29, 'rdv-a-venir', '', 'RDV à venir', 'rendez-vous/rdv-a-venir', 28, '5', '29', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923654, 0, '0', 0, 1, 0),
(28, 'rendez-vous', '', 'Rendez Vous', 'rendez-vous', 0, '4', '28', '', '', '', '', 0, 0, '', 0, 0, 'live', 1522923635, 0, '0', 0, 1, 8),
(25, 'geolocalisation', '', 'Géolocalisation', 'geolocalisation', 0, '1', '25', '', 'function geoGetPosition() \n{ \n	$(\'#position input\').val(\'\');\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\n} \nfunction geoSuccess(position) \n{ \n	console.log(position.coords.latitude);\n	console.log(position.coords.longitude);\n          var text = \'LAT: \' + position.coords.latitude ;\n  text += \' - LONG:  \' + position.coords.longitude ; \n	$(\'#position input\').val(text);\n} \nfunction geoError(err) \n{\n    console.log(err);\n    alert(\"positioning error\");\n}  \n \n/** On document ready, go  */      \n$( document ).ready(function() \n{      \n});', '', '', 0, 0, '', 0, 0, 'live', 1522164418, 1522319862, '0', 0, 1, 4),
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
(5, 'patients_rdv_futurs', 'patients RDV futurs', 'Patients : Liste des RDV futurs', 2, '', NULL, '', '{{ dev:empty_cache }} \n{{if user:logged_in }}\n{{ appointments:my_appointments futur_past=\"futur\" other_person=\"[[ if page:slug == \'mes-rdv-a-venir\' ]]non[[ else if page:slug == \'rdv-a-venir-de-mes-proches\'  ]]oui[[ endif ]]\"  }} \n<div class=\"panel panel-default panel-success\">\n		<div class=\"panel-heading\"> \n			<h4>\n				Le\n				 {{date_day_str}}  {{date_month_str}}  \n				à  {{time_formatted}} \n			</h4>\n                    \n                         <!--\n			 [{{appointment_time}}   - \n			 doc {{doctor_id}} user {{user_id}}]\n                          -->\n		</div>\n		<div class=\"panel-body\">    \n                    <!-- img -->\n			 {{ if filename }}\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                            {{ elseif doc_speciality  }}  \n                                        <img src=\"{{ url:site }}files/large/{{ doctor:speciality_img speciality=doc_speciality  }}\" \n                                             height=\"80\" style=\"float:left;margin-right:20px;\"\n                                             class=\"img-circle\" />\n                         \n                            {{ else }} \n                            {{# default image #}}\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\" class=\"img-circle\" />\n                            {{ endif }}\n                    <!-- img end  -->\n							\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n				 <br /> \n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \n				 <br /> \n				{{gender}}  \n				 {{first_name}}  \n				 {{last_name}}    \n                         <!--\n			Le\n			 {{appointment_date}}  \n			à\n			 {{appointment_time}}\n			  -->\n			<center class=\"\"> \n				<a class=\"btn btn-danger \" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \n			</center> 		 \n		</div>\n</div> \n{{ /appointments:my_appointments }}\n{{else}}\n    {{ url:redirect to=\"users/login\" }}\n{{endif}}', '', '', 'default.html', 1522924499, 'y', '', ''),
(6, 'patients_rdv_passes', 'patients RDV passés', 'Patients : Liste des RDV passés', 2, '', NULL, '', '{{ dev:empty_cache }} \n{{if user:logged_in }}\n{{ appointments:my_appointments futur_past=\"past\" other_person=\"[[ if page:slug == \'mes-rdv-passes\' ]]non[[ elseif page:slug == \'rdv-passes-de-mes-proches\'  ]]oui[[ endif ]]\"  }} \n\n<div class=\"panel panel-default \">\n		<div class=\"panel-heading\"> \n			<h4>\n				Le\n				 {{date_day_str}}  {{date_month_str}}  \n				à \n			</h4>\n			 [{{appointment_time}}   - \n			 doc {{doctor_id}} user {{user_id}}]\n		</div>\n		<div class=\"panel-body\">   \n		\n			 {{ if filename }}\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n                            {{ elseif doc_speciality  }}  \n                                        <img src=\"{{ url:site }}files/large/{{ doctor:speciality_img speciality=doc_speciality  }}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n                            {{ else }} \n                            {{# default image #}}\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n                            {{ endif }}\n							\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n				 <br /> \n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \n				 <br /> \n				{{gender}}  \n				 {{first_name}}  \n				 {{last_name}}   \n				 <br /> \n			Le\n			 {{appointment_date}}  \n			à\n			 {{appointment_time}}\n			 \n			<center class=\"\"> \n				<a class=\"btn btn-info \"  href=\"{{url:site}}calendar/doctor/{{id}}\">Reprendre ce RDV</a>			 \n			</center> 		 	 \n		</div>\n</div> \n{{ /appointments:my_appointments }}\n{{else}}\n    {{ url:redirect to=\"users/login\" }}\n{{endif}}', '', '', 'default.html', 1522923616, 'y', '', ''),
(4, 'rendez_vous', 'Rendez vous', 'Affichage des RDV du patient', 2, '', NULL, '', '{{ dev:empty_cache }} \n \n{{if !{url:segments segment=\"2\"} }}\n	<!-- <h3>Rendez vous</h3>  -->\n	<ul class=\"list-group\">\n		<li class=\"list-group-item active\"><a href=\"{{url:site}}{{url:uri_string}}/rdv-a-venir\">RDV à venir</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/mes-rdv-a-venir\">Mes RDV à venir</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/rdv-a-venir-de-mes-proches\">RDV à venir de mes proches</a></li>\n	</ul>\n	<ul class=\"list-group\">\n		<li class=\"list-group-item active\"><a href=\"{{url:site}}{{url:uri_string}}/rdv-passes\">RDV passés</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/mes-rdv-passes\">Mes RDV passés</a></li>\n		<li class=\"list-group-item\"><a href=\"{{url:site}}{{url:uri_string}}/rdv-passes-de-mes-proches\">RDV passés de mes proches</a></li>\n	</ul>\n	\n{{elseif {url:segments segment=\"2\"} == \'futurs\'}} \n	<h3>\n		{{if {custom:get_value name=\"other\"} == \'yes\' }}\n			Rendez vous à venir pour mes proches\n		{{elseif {custom:get_value name=\"other\"} == \'no\'}}\n			Mes rendez-vous à venir\n		{{else}}\n			Rendez-vous à venir\n		{{endif}} \n	</h3>\n{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \n{{# panel-success or panel-default #}}\n\n{{ appointments:my_appointments futur_past=\"futur\" other_person={custom:get_value name=\"other\"} }} \n		<div class=\"panel panel-default panel-success\">\n				<div class=\"panel-heading\"> \n					<h4>\n						Le\n						 {{date_day_str}}  {{date_month_str}}  \n						à\n					</h4>\n					 [{{appointment_time}}   - \n					 doc {{doctor_id}} user {{user_id}}]\n				</div>\n				<div class=\"panel-body\">   \n				\n                                                {{ if filename }}\n                                                        <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n                                                {{ elseif doc_speciality  }} \n                                                        {{ if doc_speciality == \"Médecins généralistes\" }} \n                                                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Ophtalmologue\" }}\n                                                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"ORL\" }}\n                                                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Cardiologue\" }}\n                                                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Spécialistes femme\" }}\n                                                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Dentiste\" }}\n                                                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Radiologue\" }}\n                                                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Autres médecins\" }}\n                                                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n                                                        {{ elseif doc_speciality == \"Etablissements de santé\" }}\n                                                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \n                                                        {{ else }} \n                                                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n                                                        {{ endif }} \n                                                {{ else }} \n                                                {{# default image #}}\n                                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n                                                {{ endif }}\n									\n						{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n						 <br /> \n						{{doc_address}} {{doc_area}} {{doc_town}} <br /> \n						 <br /> \n						{{gender}}  \n						 {{first_name}}  \n						 {{last_name}}   \n						 <br /> \n					Le\n					 {{appointment_date}}  \n					à\n					 {{appointment_time}}\n					 \n					<div class=\"center-block\"> \n						<a class=\"btn btn-danger \" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \n					</div> 		 		 \n				</div>\n		</div> \n{{ /appointments:my_appointments }} \n\n{{elseif {url:segments segment=\"2\"} == \'passes\'}}  \n{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \n{{# panel-success or panel-default #}}\n\n{{ appointments:my_appointments futur_past=\"futur\" other_person={custom:get_value name=\"other\"} }} \n\n		<div class=\"panel panel-default\">\n				<div class=\"panel-heading\"> \n					<h4>\n						Le\n						 {{date_day_str}}  {{date_month_str}}  \n						à\n					</h4>\n					 [{{appointment_time}}   - \n					 doc {{doctor_id}} user {{user_id}}]\n				</div>\n				<div class=\"panel-body\">   \n				\n									{{ if filename }}\n										<img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n									{{ elseif doc_speciality  }} \n										{{ if doc_speciality == \"Médecins généralistes\" }} \n												<img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Ophtalmologue\" }}\n												<img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"ORL\" }}\n												<img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Cardiologue\" }}\n												<img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Spécialistes femme\" }}\n												<img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Dentiste\" }}\n												<img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Radiologue\" }}\n												<img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Autres médecins\" }}\n												<img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \n										{{ elseif doc_speciality == \"Etablissements de santé\" }}\n												<img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \n										{{ else }} \n												<img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n										{{ endif }} \n									{{ else }} \n									{{# default image #}}\n										<img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\n									{{ endif }}\n									\n						{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\n						 <br /> \n						{{doc_address}} {{doc_area}} {{doc_town}} <br /> \n						 <br /> \n						{{gender}}  \n						 {{first_name}}  \n						 {{last_name}}   \n						 <br /> \n					Le\n					 {{appointment_date}}  \n					à\n					 {{appointment_time}}\n							 \n					<div class=\"center-block\"> \n						<a class=\"btn btn-info \"  href=\"{{url:site}}doctor/view/{{doctor_id}}\">Reprendre ce RDV</a>			 \n					</div> 		 	 	 		 \n				</div>\n		</div> \n \n{{ /appointments:my_appointments }} \n	\n	\n{{endif}}\n', 'div.content li.active a {\n    color: white;\n}', '', 'default.html', 1521766621, 'y', '', '');

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
  `birth_date` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `doctor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_valid` varchar(3) COLLATE utf8_unicode_ci DEFAULT 'no',
  `desk_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maiden_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `birth_date`, `phone`, `mobile`, `address_line1`, `address_line2`, `postcode`, `updated_on`, `personal_info`, `town`, `area_name`, `insurance`, `gender`, `doctor_id`, `phone_valid`, `desk_no`, `floor`, `district`, `maiden_name`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'Administrateur', 'Radja', 'Lomas', '21/08/1979', NULL, '0678957826', '4 allée Jacques Ibert', NULL, NULL, 1522168817, 'Sourd de l\'oreille droite', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', 'h', NULL, NULL, NULL, NULL, 'Le port', NULL),
(2, '2018-03-15 00:41:01', NULL, 1, 1, 2, 'Alfred docteur test', 'Alfred', 'Mozart', '0', '678957826', '678957826', '4 allée Jacques Ibert', '91240', '91240', NULL, NULL, 'Saint Michel sur Orge', NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL),
(3, '2018-03-15 00:43:37', NULL, 1, 2, 3, 'Medical Staff', 'Sandra', 'Hitchcok', '0', '678957826', '678957826', '17 rue Gutenberg', NULL, '91070', NULL, NULL, 'Bondoufle', NULL, NULL, 'f', NULL, 'no', NULL, NULL, NULL, NULL),
(4, '2018-03-15 00:44:48', NULL, 1, 3, 4, 'Techie', 'Radja', 'Lomas', '0', '678957826', '678957826', '17 rue Gutenberg', NULL, '91070', NULL, NULL, 'Bondoufle', NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL),
(5, '2018-03-15 01:25:15', NULL, 1, 4, 5, 'devops', 'devops', 'devops', '0', NULL, '0678957826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL),
(8, '2018-03-25 02:10:01', NULL, NULL, 7, 8, 'bilbo.higgins', 'bilbo', 'higgins', NULL, NULL, '0163486116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL),
(17, '2018-03-28 21:07:08', NULL, NULL, 13, 17, 'radja.lomas', 'Radja', 'Lomas', '21/08/1979', NULL, '678957826', NULL, NULL, NULL, 1522924086, NULL, 'Bondoufle', 'quartier des acacias', NULL, NULL, NULL, NULL, NULL, NULL, 'commune de belleville', NULL),
(11, '2018-03-27 15:18:00', NULL, NULL, 10, 11, 'almamy.barry', 'ALMAMY', 'BARRY', '10/10/50', NULL, '665431196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL),
(12, '2018-03-27 15:31:18', NULL, NULL, 11, 12, 'Abarry', 'Barry', 'Almamy', '10/10/50', NULL, '625464119', NULL, NULL, NULL, 1522924764, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2018-03-27 16:18:55', NULL, NULL, 12, 13, 'abarry', 'Barry', 'Didier', '10/10/50', NULL, '00224625464119', NULL, NULL, NULL, 1522247925, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(152, 'Accueil', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '14', 'accueil-old', 'admin/pages/edit/14', 'admin/pages/delete/14'),
(29, 'bootstrap', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '13', 'bootstrap', 'admin/pages/edit/13', 'admin/pages/delete/13'),
(162, 'test appointments', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '35', 'tests/test-appointments', 'admin/pages/edit/35', 'admin/pages/delete/35'),
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
(150, 'Accueil root', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '26', 'accueil-root', 'admin/pages/edit/26', 'admin/pages/delete/26');

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
('jours_ouverts', 'Jours ouverts', 'Les jours d\'ouverture (Non implementé)', 'checkbox', '1', '1,2,3,4,5,6,7', '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche', 1, 1, 'calendar', 660);

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
(56, '318497', 17, '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 6, '2018-04-05 14:37:58', NULL, '2018-04-05 14:27:33', 1, NULL),
(57, '839174', 12, '80.12.38.177', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 2, '2018-04-05 14:36:26', NULL, '2018-04-05 14:35:09', 1, NULL);

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
(1, 'radjal@free.fr', '004917d3ba06af9f7edd6351c8ac0d8dc924c6ba', '4cd53', 1, '', 1, '', 1495107565, 1522908529, 'admin', NULL, 'deeb7f1920174511b416671d8a04c4342600e32a'),
(2, 'practicien@nowhere.com', '7db15a5af242f976d62282149602188eb0cd96ad', 'e5d396', 5, '::1', 1, NULL, 1521074461, 1521076949, 'docteur.test', NULL, '61de7be305a949a0b6a141d5bf33fcb63a04e967'),
(3, 'medstaff@nowhere.com', '757129871de30daf6040f50f828b02d8744e8c39', '0d8c10', 3, '::1', 1, NULL, 1521074617, 1521076980, 'med.staff', NULL, 'b40d2018448fd8177b1b1527d4ca244c30e29e36'),
(4, 'support@nowhere.com', '1031f9a492618d59461444aa240ee82023354704', 'd70a25', 4, '::1', 1, NULL, 1521074688, 1521077026, 'support', NULL, '3cc21520c7d43c51f8c77ae0c74417fe32250f72'),
(5, 'devops@nowhere.com', 'f2229cde76e4ca9c4a658f6f091158fea4338bee', 'b92942', 1, '::1', 1, NULL, 1521077115, 1522362950, 'devops', NULL, NULL),
(8, 'bilbohiggins@nowhere.com', 'fcb1fee8af18e0891169128bdcb6e846adc24484', '802f91', 2, '::1', 1, '', 1521943801, 1521945086, 'bilbo.higgins', NULL, NULL),
(11, 'almamy.barry@laposte.net', '076c08abf72175f11353ee4236bb25eb3260b050', '046a79', 2, '185.89.129.106', 1, '', 1522149480, 1522149480, 'almamy.barry', NULL, NULL),
(12, 'abarry78250@gmail.com', '2a92170d16a157124d8cfd4b2f4199109d75eea7', '9bf26b', 1, '92.184.96.189', 1, '', 1522150278, 1522924616, 'barry.almamy', NULL, '41418d5ecfa9a7f21cf9d769c107f0e9431ffe9a'),
(13, 'abarry@mitcoms.com', 'a778900ca75b87d7e8c51e1a356a5e9f20d069f8', 'ac794b', 1, '92.184.96.189', 1, '', 1522153135, 1522241836, 'barry.didier', '0', NULL),
(17, 'r.lomas@spelldesign.fr', '89f200f44a8c1c8058f6420b6e287c06ff40fd00', 'a51be1', 2, '92.170.179.46', 1, '', 1522256828, 1522923961, 'radja.lomas', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;
--
-- AUTO_INCREMENT pour la table `default_data_field_assignments`
--
ALTER TABLE `default_data_field_assignments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;
--
-- AUTO_INCREMENT pour la table `default_data_streams`
--
ALTER TABLE `default_data_streams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT pour la table `default_def_page_fields`
--
ALTER TABLE `default_def_page_fields`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `default_doctor_categories`
--
ALTER TABLE `default_doctor_categories`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `default_doctor_doctors`
--
ALTER TABLE `default_doctor_doctors`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `default_doctor_organisations`
--
ALTER TABLE `default_doctor_organisations`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `default_email_templates`
--
ALTER TABLE `default_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT pour la table `default_file_folders`
--
ALTER TABLE `default_file_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `default_page_types`
--
ALTER TABLE `default_page_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `default_permissions`
--
ALTER TABLE `default_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `default_profiles`
--
ALTER TABLE `default_profiles`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `default_redirects`
--
ALTER TABLE `default_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_search_index`
--
ALTER TABLE `default_search_index`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT pour la table `default_theme_options`
--
ALTER TABLE `default_theme_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `default_tokens`
--
ALTER TABLE `default_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT pour la table `default_users`
--
ALTER TABLE `default_users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
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

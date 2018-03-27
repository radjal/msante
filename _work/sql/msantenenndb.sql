-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : msantenenndb.mysql.db
-- Généré le :  mar. 27 mars 2018 à 20:29
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

CREATE TABLE `default_appointments_details` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT '1970-01-01 00:00:01',
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_appointments_list`
--

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
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `other_person` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `knows_doctor` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
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
  `updated_on` datetime DEFAULT '1970-01-01 00:00:01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_appointments_list`
--

INSERT INTO `default_appointments_list` (`id`, `user_id`, `doctor_id`, `appointment_status`, `appointment_date`, `appointment_time`, `message`, `maiden_name`, `first_name`, `last_name`, `gender`, `other_person`, `knows_doctor`, `phone`, `mobile`, `email`, `address`, `town`, `area_name`, `payment_type`, `payment_status`, `total_pretax`, `total_final`, `ip`, `user_agent`, `created_on`, `updated_on`) VALUES
(4, 1, 14, 'cancelled_by_patient', 20180322, 800, NULL, 'Mcbride', 'Celeste', 'Mcbride', '', 'no', 'no', '', '678957826', 'radjal@free.fr', '4 all�e Jacques Ibert, 91240', 'Saint Michel sur Orge', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', NULL, NULL),
(5, 1, 10, '', 20180320, 900, NULL, 'Paumelle', 'Radja', 'Lomas', '', 'no', 'no', '', '678957826', '', '17 rue Gutenberg', 'Bondoufle', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-19 20:01:00', NULL),
(6, 3, 11, '', 20180322, 1000, NULL, '', 'Denis', 'Quaid', '', 'no', 'no', '631618811', '678957826', '', '8 Ruelle des Roches', '', '75002', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-19 20:02:00', NULL),
(7, 4, 10, '', 20180319, 830, NULL, '', 'Daniel', 'Guilbert', '', 'no', 'no', '', '631618811', 'r.lomas@spelldesign.fr', '17 rue Gutenberg', 'Bondoufle', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-19 20:16:00', NULL),
(83, 3, 6, '', 20180315, 1330, NULL, '', 'Kylee', 'Bernard', '', 'no', 'no', '06 66 83 92 56', '1-164-918-6181', 'tellus@cursus.org', 'P.O. Box 958, 3484 Natoque Avenue', 'Dublin', 'L', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(84, 2, 9, '', 20180319, 1472, NULL, 'Sanford', 'Ethan', 'Sanford', '', 'no', 'no', '07 83 18 20 11', '1-939-328-2545', 'ipsum.nunc@mifringillami.org', 'Ap #362-3264 Risus. Rd.', 'Dutse', 'Jigawa', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(85, 2, 13, '', 20180322, 1476, NULL, 'Sanford', 'Ethan', 'Sanford', '', 'no', 'no', '06 40 36 22 07', '1-300-790-1262', 'libero.Proin@interdum.co.uk', 'Ap #362-3264 Risus. Rd.', 'Dutse', 'Jigawa', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(86, 2, 12, '', 20180324, 1526, NULL, '', 'Rana', 'Mcconnell', '', 'no', 'no', '07 77 71 19 64', '1-959-746-2953', 'augue@auctor.co.uk', '7413 Ac Rd.', 'Seattle', 'Washington', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(87, 3, 2, '', 20180327, 858, NULL, 'Sanford', 'Ethan', 'Sanford', '', 'no', 'no', '09 27 45 02 85', '1-118-871-0487', 'leo.elementum.sem@odioauctorvitae.com', 'Ap #362-3264 Risus. Rd.', 'Dutse', 'Jigawa', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(88, 3, 13, '', 20180325, 1140, NULL, '', 'Zelda', 'Howell', '', 'no', 'no', '07 24 35 60 61', '1-859-471-0690', 'eget@enimSuspendisse.edu', '2503 Placerat, Avenue', 'Pabianice', '?�dzkie', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(89, 4, 12, '', 20180323, 1354, NULL, '', 'Carson', 'Bird', '', 'no', 'no', '06 25 68 76 91', '1-527-312-6875', 'convallis.est@egetmetusIn.com', '629-1060 Id, Rd.', 'Crehen', 'Luik', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(90, 3, 13, '', 20180327, 1178, NULL, '', 'Noble', 'Medina', '', 'no', 'no', '01 60 94 05 83', '1-331-152-3581', 'pellentesque.massa@velit.ca', '1689 Lorem St.', 'Buckie', 'BA', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(91, 2, 12, '', 20180324, 1078, NULL, 'Sanford', 'Angela', 'Sanford', '', 'no', 'no', '02 36 27 26 84', '1-691-748-9291', 'at.auctor.ullamcorper@a.ca', 'P.O. Box 822, 130 Fames Rd.', 'La Valle/Wengen', 'Trentino-Alto Adige', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(92, 3, 4, '', 20180323, 1585, NULL, '', 'Walter', 'Goff', '', 'no', 'no', '06 20 19 21 11', '1-381-248-2957', 'libero.Proin.sed@nibhvulputatemauris.org', 'P.O. Box 110, 1059 Nonummy. Road', 'Sagamu', 'Ogun', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(93, 1, 10, '', 20180327, 1481, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '09 34 52 55 92', '1-349-770-2005', 'et.tristique@eros.com', 'Ap #581-8525 Nulla Street', 'Okene', 'KO', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(94, 2, 8, '', 20180323, 1669, NULL, '', 'Shaeleigh', 'Watson', '', 'no', 'no', '03 59 50 74 94', '1-801-960-9863', 'Nunc.ac.sem@faucibusutnulla.com', 'Ap #999-8166 Ipsum. St.', 'Martigues', 'PR', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(95, 4, 1, '', 20180322, 1675, NULL, '', 'Sacha', 'Emerson', '', 'no', 'no', '01 64 61 50 10', '1-557-135-3811', 'metus.In.nec@Aliquam.org', 'Ap #848-2265 Vel Rd.', 'Tarn�w', 'Ma?opolskie', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(96, 2, 9, '', 20180320, 1090, NULL, 'Sanford', 'Buffy', 'Sanford', '', 'no', 'no', '01 73 63 89 99', '1-591-901-0042', 'gravida.Aliquam.tincidunt@Integer.co.uk', 'P.O. Box 679, 3599 Nec Rd.', 'Illkirch-Graffenstaden', 'AL', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(97, 4, 8, '', 20180315, 1049, NULL, '', 'Rebecca', 'Christensen', '', 'no', 'no', '08 17 27 15 63', '1-497-258-2373', 'Etiam@Proin.co.uk', 'Ap #700-9585 Lorem St.', 'Heredia', 'Heredia', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(98, 2, 8, '', 20180325, 1408, NULL, '', 'Phoebe', 'Blankenship', '', 'no', 'no', '04 13 44 67 36', '1-201-860-8573', 'hendrerit@id.ca', 'P.O. Box 792, 571 Cras Road', 'Nanterre', '�le-de-France', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(99, 3, 1, '', 20180321, 1558, NULL, '', 'Imogene', 'Bentley', '', 'no', 'no', '04 74 48 34 87', '1-248-967-0866', 'ultrices.posuere.cubilia@lectusconvallisest.org', 'P.O. Box 680, 8757 Urna, Ave', 'Belfast', 'Ulster', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(100, 1, 1, '', 20180316, 885, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '02 21 34 43 55', '1-884-585-3238', 'lorem.Donec.elementum@DonecegestasDuis.com', '2252 Ultrices. Rd.', 'Galway', 'Connacht', '', '', '0', '0', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(101, 3, 13, '', 20180417, 1158, NULL, '', 'Randall', 'Lynn', '', 'no', 'no', '09 59 29 45 00', '1-182-608-0327', 'elit@dignissimtemporarcu.org', '8138 A, St.', 'Tambaram', 'TN', '', '', '', '', NULL, NULL, NULL, NULL),
(102, 1, 11, '', 20180412, 1269, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '04 71 64 91 18', '1-448-526-4953', 'Proin.vel@placeratvelitQuisque.co.uk', 'Ap #345-4204 Aliquam Rd.', 'Funtua', 'Katsina', '', '', '0', '0', NULL, NULL, NULL, NULL),
(103, 3, 5, '', 20180406, 1065, NULL, '', 'Blossom', 'Willis', '', 'no', 'no', '05 41 66 66 70', '1-352-118-5565', 'Mauris.vel.turpis@vulputateullamcorper.ca', '1327 Parturient St.', 'Morwell', 'VIC', '', '', '', '', NULL, NULL, NULL, NULL),
(104, 3, 2, '', 20180401, 1108, NULL, '', 'Eleanor', 'Wiley', '', 'no', 'no', '09 96 76 83 42', '1-420-602-8675', 'Fusce.aliquam@sapien.org', 'P.O. Box 203, 9453 Magna Rd.', 'Pepingen', 'Vlaams-Brabant', '', '', '', '', NULL, NULL, NULL, NULL),
(105, 3, 5, '', 20180424, 1443, NULL, '', 'Paloma', 'Humphrey', '', 'no', 'no', '01 33 33 36 02', '1-917-444-6194', 'feugiat.non.lobortis@diam.com', 'P.O. Box 257, 171 Vitae, Av.', 'Galway', 'Connacht', '', '', '', '', NULL, NULL, NULL, NULL),
(106, 4, 11, '', 20180414, 1132, NULL, '', 'Chase', 'Ortiz', '', 'no', 'no', '08 23 73 52 45', '1-485-152-2154', 'egestas.hendrerit.neque@egestas.com', '8452 Tristique Avenue', '�e?me', '?zm', '', '', '', '', NULL, NULL, NULL, NULL),
(107, 2, 3, '', 20180417, 803, NULL, '', 'Plato', 'Hester', '', 'no', 'no', '03 57 56 39 28', '1-268-923-3724', 'mauris.sagittis@aliquetProin.co.uk', 'P.O. Box 950, 6576 Mi Road', 'Dundee', 'AN', '', '', '', '', NULL, NULL, NULL, NULL),
(108, 1, 1, '', 20180423, 1020, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '01 92 89 19 61', '1-321-112-9371', 'dictum.eu@musProinvel.ca', 'Ap #158-6696 Mauris Street', '�kersberga', 'AB', '', '', '', '', NULL, NULL, NULL, NULL),
(109, 4, 14, '', 20180423, 884, NULL, '', 'Celeste', 'Mcbride', '', 'no', 'no', '05 49 31 46 87', '1-483-749-2853', 'pede@mollisneccursus.co.uk', 'Ap #806-5695 In Street', 'Sokoto', 'SO', '', '', '', '', NULL, NULL, NULL, NULL),
(110, 3, 6, '', 20180424, 1233, NULL, '', 'Beau', 'Sutton', '', 'no', 'no', '09 08 19 42 97', '1-478-568-8108', 'eget@elit.org', '878-3453 Eu Rd.', 'Hay-on-Wye', 'Brecknockshire', '', '', '', '', NULL, NULL, NULL, NULL),
(111, 1, 5, '', 20180411, 1404, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '02 61 44 97 07', '1-659-613-8086', 'eu.sem@enimCurabiturmassa.net', '386-1669 Cras Rd.', 'Lo Espejo', 'RM', '', '', '', '', NULL, NULL, NULL, NULL),
(112, 3, 14, '', 20180409, 842, NULL, '', 'Xantha', 'Mcknight', '', 'no', 'no', '07 34 54 12 43', '1-265-897-5702', 'id.sapien@nisimagnased.co.uk', 'Ap #114-4948 Imperdiet Ave', 'Bendigo', 'VIC', '', '', '', '', NULL, NULL, NULL, NULL),
(113, 3, 14, '', 20180420, 1486, NULL, '', 'Jerome', 'Rush', '', 'no', 'no', '06 59 15 04 28', '1-603-925-1391', 'vitae@leoCrasvehicula.ca', '570-1769 Morbi Avenue', 'Minturno', 'LAZ', '', '', '', '', NULL, NULL, NULL, NULL),
(114, 1, 6, 'cancelled_by_patient', 20180408, 1529, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '03 82 45 46 95', '1-493-997-5423', 'lacus.Cras.interdum@massaVestibulum.org', 'P.O. Box 713, 3485 Tristique Rd.', 'Banda', 'UP', '', '', '', '', NULL, NULL, NULL, NULL),
(115, 2, 1, '', 20180411, 1431, NULL, '', 'Velma', 'Jensen', '', 'no', 'no', '08 00 31 57 22', '1-967-579-8716', 'dignissim@netus.net', 'Ap #512-2341 Viverra. Rd.', 'Follina', 'VEN', '', '', '', '', NULL, NULL, NULL, NULL),
(116, 1, 10, '', 20180420, 1414, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '03 47 85 08 52', '1-375-190-2541', 'vel.turpis.Aliquam@Sed.co.uk', '5639 Consectetuer Avenue', 'Lim�n (Puerto Lim�n)', 'Lim�n', '', '', '', '', NULL, NULL, NULL, NULL),
(117, 1, 7, '', 20180423, 1579, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '09 15 80 61 30', '1-681-794-8217', 'Mauris.nulla.Integer@Nunc.org', 'P.O. Box 954, 6381 Iaculis Rd.', 'Schriek', 'Antwerpen', '', '', '', '', NULL, NULL, NULL, NULL),
(118, 4, 3, '', 20180428, 1683, NULL, '', 'Carlos', 'Mccoy', '', 'no', 'no', '04 64 10 27 01', '1-894-380-5453', 'nisl@elit.co.uk', '140-8924 Turpis Street', 'Omaha', 'Nebraska', '', '', '', '', NULL, NULL, NULL, NULL),
(119, 4, 14, '', 20180406, 1146, NULL, '', 'Shelley', 'Vaughn', '', 'no', 'no', '08 28 11 03 62', '1-544-509-8043', 'augue.id@suscipitestac.ca', 'Ap #794-8912 Ac Rd.', 'Flin Flon', 'Manitoba', '', '', '', '', NULL, NULL, NULL, NULL),
(120, 3, 14, '', 20180426, 949, NULL, '', 'Yoshi', 'Mosley', '', 'no', 'no', '04 45 46 35 84', '1-447-259-9367', 'justo.Proin.non@vitaealiquet.org', '255-3221 Sit Street', 'Thon', 'Namen', '', '', '', '', NULL, NULL, NULL, NULL),
(121, 4, 7, '', 20180406, 1128, NULL, '', 'Iola', 'Rodriguez', '', 'no', 'no', '02 49 80 34 33', '1-375-341-1981', 'semper.Nam@ultrices.com', '598-8498 Facilisis Street', 'Hamilton', 'North Island', '', '', '', '', NULL, NULL, NULL, NULL),
(122, 1, 9, '', 20180418, 1178, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '08 57 58 28 07', '1-431-301-7427', 'Sed.malesuada.augue@ametnulla.ca', 'Ap #351-3476 Commodo St.', 'Jauchelette', 'WB', '', '', '', '', NULL, NULL, NULL, NULL),
(123, 1, 6, '', 20180423, 1488, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '08 03 95 22 30', '1-662-977-5214', 'eu.lacus@mollisInteger.org', 'Ap #864-8314 Quis Rd.', 'Yumbel', 'VII', '', '', '', '', NULL, NULL, NULL, NULL),
(124, 4, 6, '', 20180420, 1172, NULL, '', 'Stone', 'Golden', '', 'no', 'no', '01 89 06 52 91', '1-543-447-8921', 'vel.lectus@etrutrum.net', 'Ap #290-4999 Convallis Ave', 'M�lin', 'WB', '', '', '', '', NULL, NULL, NULL, NULL),
(125, 2, 4, '', 20180426, 1397, NULL, '', 'Hyatt', 'Oliver', '', 'no', 'no', '03 48 95 42 69', '1-758-793-6610', 'Suspendisse@utodio.edu', 'Ap #580-8557 Amet Road', 'Rocca San Felice', 'Campania', '', '', '', '', NULL, NULL, NULL, NULL),
(126, 4, 2, '', 20180410, 880, NULL, '', 'Brittany', 'Mcconnell', '', 'no', 'no', '09 96 21 23 21', '1-231-305-7882', 'justo.Proin@sit.org', '491-2254 Sem St.', 'Krak�w', 'MP', '', '', '', '', NULL, NULL, NULL, NULL),
(127, 1, 13, 'cancelled_by_patient', 20180404, 1112, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '05 95 05 53 04', '1-648-886-7083', 'scelerisque@consequat.ca', 'P.O. Box 646, 7151 Dui. Road', 'Terneuzen', 'Zl', '', '', '0', '0', NULL, NULL, NULL, NULL),
(128, 4, 8, '', 20180418, 1693, NULL, '', 'Rahim', 'Roberts', '', 'no', 'no', '06 33 04 37 91', '1-249-327-6195', 'rutrum.urna.nec@augue.co.uk', '479-9449 Turpis. Av.', 'Dar?ca', 'Kocaeli', '', '', '', '', NULL, NULL, NULL, NULL),
(129, 3, 2, '', 20180401, 1285, NULL, '', 'Alexa', 'Weber', '', 'no', 'no', '05 77 35 66 58', '1-823-812-0515', 'molestie@eu.com', 'Ap #561-8811 Malesuada Av.', 'Berlin', 'Berlin', '', '', '', '', NULL, NULL, NULL, NULL),
(130, 3, 13, '', 20180419, 1299, NULL, '', 'Elliott', 'Nielsen', '', 'no', 'no', '09 30 66 24 57', '1-347-533-9505', 'placerat.Cras.dictum@blanditNam.ca', '333-8614 Nec, Road', 'Vetlanda', 'J�nk�pings l�n', '', '', '', '', NULL, NULL, NULL, NULL),
(131, 3, 11, '', 20180413, 849, NULL, '', 'Cassidy', 'Roberson', '', 'no', 'no', '02 88 89 00 24', '1-856-408-8287', 'egestas@atnisi.org', '377-449 Risus St.', 'Bauchi', 'Bauchi', '', '', '', '', NULL, NULL, NULL, NULL),
(132, 1, 13, '', 20180410, 803, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '08 68 19 62 15', '1-170-368-0918', 'Morbi.metus@diamluctuslobortis.ca', 'P.O. Box 221, 3446 Sit Rd.', 'Muno', 'LX', '', '', '0', '0', NULL, NULL, NULL, NULL),
(133, 1, 9, '', 20180415, 1241, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '08 58 37 41 38', '1-642-325-2246', 'gravida@metus.com', '974-7876 Ipsum. Rd.', 'Rostock', 'MV', '', '', '', '', NULL, NULL, NULL, NULL),
(134, 3, 2, '', 20180421, 1113, NULL, '', 'Samuel', 'Ford', '', 'no', 'no', '07 85 12 27 47', '1-164-933-7210', 'elit.Curabitur.sed@NullaaliquetProin.net', 'P.O. Box 384, 5337 Lectus St.', 'Quesada', 'A', '', '', '', '', NULL, NULL, NULL, NULL),
(135, 2, 6, '', 20180413, 1715, NULL, '', 'Barbara', 'Mccarthy', '', 'no', 'no', '08 92 90 59 87', '1-537-404-6292', 'amet.risus@egestasligulaNullam.org', '682-2952 Luctus Street', 'Bursa', 'Bur', '', '', '', '', NULL, NULL, NULL, NULL),
(136, 4, 3, '', 20180419, 1437, NULL, '', 'Chandler', 'Rios', '', 'no', 'no', '02 33 72 79 91', '1-493-896-4570', 'ipsum@nisi.net', 'Ap #569-135 Diam Rd.', 'Zoerle-Parwijs', 'Antwerpen', '', '', '', '', NULL, NULL, NULL, NULL),
(137, 2, 1, '', 20180417, 1397, NULL, '', 'Melinda', 'Cole', '', 'no', 'no', '09 79 09 98 85', '1-250-651-3173', 'magna@enim.co.uk', '352-3792 Ut Road', 'Veenendaal', 'U.', '', '', '', '', NULL, NULL, NULL, NULL),
(138, 4, 11, '', 20180406, 1070, NULL, '', 'Vance', 'Gibson', '', 'no', 'no', '02 61 25 18 55', '1-119-437-8152', 'sagittis@nonlobortis.edu', 'P.O. Box 408, 9639 Leo. Av.', 'Uttarpara-Kotrung', 'West Bengal', '', '', '', '', NULL, NULL, NULL, NULL),
(139, 3, 11, '', 20180406, 1668, NULL, '', 'Ciaran', 'Horne', '', 'no', 'no', '07 95 16 84 67', '1-428-263-0411', 'ipsum@nullaCras.ca', 'P.O. Box 831, 7030 Lorem Avenue', 'Vienna', 'Wie', '', '', '', '', NULL, NULL, NULL, NULL),
(140, 3, 11, '', 20180413, 991, NULL, '', 'Nathan', 'Hammond', '', 'no', 'no', '08 19 66 52 10', '1-694-857-3531', 'et.malesuada.fames@nequeNullamut.net', 'Ap #859-3683 Vel Rd.', 'Toowoomba', 'Queensland', '', '', '', '', NULL, NULL, NULL, NULL),
(141, 4, 4, '', 20180423, 1590, NULL, '', 'Malcolm', 'Hayden', '', 'no', 'no', '02 03 59 99 45', '1-316-390-4954', 'justo.nec@orciconsectetuer.com', '572-7518 Aliquet St.', 'Oxford County', 'Ontario', '', '', '', '', NULL, NULL, NULL, NULL),
(142, 3, 6, '', 20180411, 1532, NULL, '', 'Kaitlin', 'Sampson', '', 'no', 'no', '04 10 80 80 43', '1-420-424-4080', 'eu@orcilacus.ca', '5414 Eu, Rd.', 'Istanbul', 'Ist', '', '', '', '', NULL, NULL, NULL, NULL),
(143, 3, 9, '', 20180410, 1646, NULL, '', 'Lance', 'Gonzales', '', 'no', 'no', '06 65 70 21 97', '1-725-857-3565', 'imperdiet.non@Morbivehicula.org', '1568 Congue. Ave', 'Castell�', 'Comunitat Valenciana', '', '', '', '', NULL, NULL, NULL, NULL),
(144, 3, 2, '', 20180413, 1730, NULL, '', 'Kellie', 'Fields', '', 'no', 'no', '08 96 07 15 58', '1-705-985-2357', 'ullamcorper.nisl.arcu@variusNam.net', 'Ap #248-8340 Elit, Av.', 'Hawera', 'NI', '', '', '', '', NULL, NULL, NULL, NULL),
(145, 3, 7, '', 20180422, 1670, NULL, '', 'Sigourney', 'Mueller', '', 'no', 'no', '06 40 58 63 49', '1-368-288-0833', 'Mauris.quis@anteblandit.ca', 'Ap #467-2897 Tellus Rd.', 'Anjou', 'QC', '', '', '', '', NULL, NULL, NULL, NULL),
(146, 1, 7, 'cancelled_by_patient', 20180413, 991, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '08 32 83 78 30', '1-140-241-3386', 'non@per.ca', '180-9646 Ut St.', 'Cleveland', 'Ohio', '', '', '', '', NULL, NULL, NULL, NULL),
(147, 1, 11, '', 20180421, 1020, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '08 13 10 62 18', '1-860-479-2574', 'in.felis@magnaPraesent.com', '6752 Neque. Street', 'Alexandra', 'SI', '', '', '', '', NULL, NULL, NULL, NULL),
(148, 4, 1, '', 20180427, 1080, NULL, '', 'Kenyon', 'Barrera', '', 'no', 'no', '07 61 04 04 94', '1-504-904-5012', 'dapibus.id@sodales.org', 'Ap #949-2341 Suspendisse St.', 'Amsterdam', 'N.', '', '', '', '', NULL, NULL, NULL, NULL),
(149, 1, 7, 'cancelled_by_patient', 20180403, 899, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '01 43 54 71 75', '1-348-505-8873', 'ac.risus@lacusUt.edu', '926-3261 Id Ave', 'Oswestry', 'SA', '', '', '', '', NULL, NULL, NULL, NULL),
(150, 4, 8, '', 20180424, 1611, NULL, '', 'Peter', 'Welch', '', 'no', 'no', '09 26 51 00 61', '1-810-979-7538', 'ut.sem.Nulla@urnasuscipitnonummy.net', 'Ap #630-1913 Ipsum Avenue', 'Richmond Hill', 'ON', '', '', '', '', NULL, NULL, NULL, NULL),
(151, 3, 10, '', 20180402, 1661, NULL, '', 'Fitzgerald', 'Ashley', '', 'no', 'no', '08 80 62 34 18', '1-539-985-7553', 'in.aliquet.lobortis@Maurismagna.org', '350 Nam Avenue', 'Hamburg', 'HH', '', '', '', '', NULL, NULL, NULL, NULL),
(152, 2, 4, '', 20180403, 912, NULL, '', 'Jesse', 'Slater', '', 'no', 'no', '07 57 51 23 58', '1-221-286-4855', 'id.erat.Etiam@erosturpis.net', '8117 Pellentesque St.', 'Cambridge', 'North Island', '', '', '', '', NULL, NULL, NULL, NULL),
(153, 2, 14, '', 20180427, 1557, NULL, '', 'Adam', 'Weeks', '', 'no', 'no', '08 69 50 46 45', '1-848-835-9032', 'magna.Phasellus.dolor@auctorquis.com', '255-896 Cras Rd.', 'Osasco', 'S�o Paulo', '', '', '', '', NULL, NULL, NULL, NULL),
(154, 3, 3, '', 20180420, 1332, NULL, '', 'Carter', 'Stanley', '', 'no', 'no', '05 08 63 94 87', '1-505-637-8847', 'volutpat.nunc@metusvitae.net', '192-1444 Nulla Street', 'Hulshout', 'Antwerpen', '', '', '', '', NULL, NULL, NULL, NULL),
(155, 3, 7, '', 20180422, 1589, NULL, '', 'Bell', 'Finley', '', 'no', 'no', '05 13 73 49 85', '1-308-298-0526', 'consectetuer.euismod@Aenean.net', '4742 Felis, Road', 'San Rafael', 'Cartago', '', '', '', '', NULL, NULL, NULL, NULL),
(156, 2, 14, '', 20180409, 1139, NULL, '', 'Amena', 'Jefferson', '', 'no', 'no', '09 66 43 78 78', '1-408-349-3010', 'sapien.Aenean.massa@ligulaAeneangravida.org', 'Ap #346-4657 Eget, Ave', 'Araban', 'Gaziantep', '', '', '', '', NULL, NULL, NULL, NULL),
(157, 3, 2, '', 20180417, 1650, NULL, '', 'Jonas', 'Emerson', '', 'no', 'no', '08 58 64 53 57', '1-638-822-4952', 'amet.orci.Ut@magnamalesuada.net', '351-6475 Nec Street', 'Omaha', 'Nebraska', '', '', '', '', NULL, NULL, NULL, NULL),
(158, 3, 7, '', 20180428, 891, NULL, '', 'Harper', 'Zimmerman', '', 'no', 'no', '01 43 98 45 87', '1-953-126-2871', 'suscipit.est@elementum.edu', '708-8006 Magna Rd.', 'Hattiesburg', 'Mississippi', '', '', '', '', NULL, NULL, NULL, NULL),
(159, 2, 2, '', 20180410, 1108, NULL, '', 'Fatima', 'Lewis', '', 'no', 'no', '02 46 09 75 67', '1-604-138-7310', 'Sed@Aeneanegetmagna.co.uk', 'Ap #574-368 Nam Road', 'Pelarco', 'Maule', '', '', '', '', NULL, NULL, NULL, NULL),
(160, 2, 1, '', 20180414, 1606, NULL, '', 'Kasimir', 'Randolph', '', 'no', 'no', '07 27 70 20 04', '1-895-318-9666', 'ut@adipiscingMaurismolestie.co.uk', '545-556 Neque Ave', 'Roosendaal', 'Noord Brabant', '', '', '', '', NULL, NULL, NULL, NULL),
(161, 4, 5, '', 20180420, 1086, NULL, '', 'Zephania', 'Santiago', '', 'no', 'no', '07 28 72 18 69', '1-224-122-3126', 'id.risus@maurisrhoncusid.com', 'P.O. Box 560, 3560 Integer Rd.', 'Vienna', 'Wie', '', '', '', '', NULL, NULL, NULL, NULL),
(162, 4, 8, '', 20180404, 1392, NULL, '', 'Pascale', 'Stokes', '', 'no', 'no', '01 32 67 20 43', '1-889-725-7297', 'Praesent@elitdictum.ca', '676-5664 Penatibus Ave', 'Vienna', 'Vienna', '', '', '', '', NULL, NULL, NULL, NULL),
(163, 4, 6, '', 20180423, 964, NULL, '', 'Rigel', 'Garner', '', 'no', 'no', '09 91 04 32 52', '1-856-999-6942', 'in.magna@erat.com', '598-951 Proin Rd.', 'Pittsburgh', 'PA', '', '', '', '', NULL, NULL, NULL, NULL),
(164, 3, 11, '', 20180411, 1282, NULL, '', 'Stephen', 'Byrd', '', 'no', 'no', '03 23 71 23 82', '1-967-441-4782', 'adipiscing@porttitorinterdum.edu', '346-7647 Curabitur St.', 'Kington', 'Herefordshire', '', '', '', '', NULL, NULL, NULL, NULL),
(165, 1, 4, '', 20180419, 1391, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '03 19 71 81 97', '1-176-519-1596', 'lorem.fringilla.ornare@arcuAliquamultrices.com', '326-1183 Dis St.', 'Mar�a Pinto', 'Metropolitana de Santiago', '', '', '', '', NULL, NULL, NULL, NULL),
(166, 1, 5, '', 20180423, 1091, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '08 58 70 59 18', '1-454-683-8495', 'sed.libero@sedleoCras.edu', 'P.O. Box 666, 3767 Porttitor Av.', 'New Plymouth', 'North Island', '', '', '', '', NULL, NULL, NULL, NULL),
(167, 2, 14, '', 20180421, 1326, NULL, '', 'Brynn', 'Sweet', '', 'no', 'no', '03 61 22 33 30', '1-229-775-0526', 'lacinia@Nullatempor.net', 'P.O. Box 304, 6640 Libero Rd.', 'Wimmertingen', 'Limburg', '', '', '', '', NULL, NULL, NULL, NULL),
(168, 2, 6, '', 20180411, 953, NULL, '', 'Caesar', 'Reese', '', 'no', 'no', '03 09 59 69 13', '1-975-245-9009', 'ante.iaculis.nec@Praesent.net', '365-5388 Eu Road', 'Nuraminis', 'SAR', '', '', '', '', NULL, NULL, NULL, NULL),
(169, 1, 12, '', 20180418, 1239, NULL, 'Mcbride', 'Celeste', 'Lomas', '', 'yes', 'no', '02 34 17 45 91', '1-694-308-3955', 'ipsum.Donec.sollicitudin@sedorci.ca', 'Ap #128-9190 Molestie Avenue', 'Kalisz', 'WP', '', '', '0', '0', NULL, NULL, NULL, NULL),
(170, 2, 2, '', 20180415, 1411, NULL, '', 'Michelle', 'Henson', '', 'no', 'no', '03 35 35 08 81', '1-993-849-0250', 'interdum.Curabitur@dolorDonec.net', 'P.O. Box 616, 1423 Lacinia Rd.', 'Okigwe', 'IM', '', '', '', '', NULL, NULL, NULL, NULL),
(171, 1, 8, '', 20180413, 915, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '07 75 53 98 23', '1-535-253-7403', 'molestie.arcu.Sed@velarcu.ca', 'Ap #394-8766 Ut Av.', 'Orhangazi', 'Bur', '', '', '', '', NULL, NULL, NULL, NULL),
(172, 4, 4, '', 20180409, 1455, NULL, '', 'Brandon', 'Hamilton', '', 'no', 'no', '01 47 46 84 23', '1-521-150-5910', 'Aenean.euismod.mauris@vestibulum.com', '5081 Donec Ave', 'Galway', 'C', '', '', '', '', NULL, NULL, NULL, NULL),
(173, 2, 7, '', 20180423, 1146, NULL, '', 'Ivory', 'Aguirre', '', 'no', 'no', '03 30 58 00 52', '1-812-634-7051', 'orci.lobortis@utipsum.ca', '830-2120 Magna. Ave', 'Milena', 'Sicilia', '', '', '', '', NULL, NULL, NULL, NULL),
(174, 4, 5, '', 20180421, 1653, NULL, '', 'Camille', 'Strickland', '', 'no', 'no', '09 98 86 23 59', '1-299-368-3941', 'Nullam.ut@Fuscefermentum.edu', '5355 Dui. Avenue', 'San Rosendo', 'Biob�o', '', '', '', '', NULL, NULL, NULL, NULL),
(175, 3, 14, '', 20180401, 1529, NULL, '', 'Kamal', 'Maxwell', '', 'no', 'no', '08 74 70 14 18', '1-387-654-9130', 'Quisque.nonummy@enimcondimentum.org', 'Ap #918-6067 Eu Rd.', 'Nicoya', 'G', '', '', '', '', NULL, NULL, NULL, NULL),
(176, 3, 10, '', 20180428, 1492, NULL, '', 'Emma', 'Watts', '', 'no', 'no', '09 37 98 80 52', '1-794-498-8569', 'facilisis.vitae@habitantmorbitristique.co.uk', '7725 Magna. St.', 'Vienna', 'Wie', '', '', '', '', NULL, NULL, NULL, NULL),
(177, 3, 7, '', 20180407, 1680, NULL, '', 'Davis', 'Cohen', '', 'no', 'no', '04 18 06 53 84', '1-838-726-4079', 'nisi.a.odio@etmalesuadafames.org', 'P.O. Box 655, 8381 Nonummy Road', 'Rocca San Felice', 'CAM', '', '', '', '', NULL, NULL, NULL, NULL),
(178, 2, 1, '', 20180413, 1399, NULL, '', 'Armand', 'Roman', '', 'no', 'no', '08 32 79 72 52', '1-872-227-8989', 'eros@consequat.co.uk', 'Ap #178-7114 Ultricies Rd.', 'Vienna', 'Wie', '', '', '', '', NULL, NULL, NULL, NULL),
(179, 4, 7, '', 20180408, 992, NULL, '', 'Grant', 'Cruz', '', 'no', 'no', '01 26 91 45 66', '1-484-272-3133', 'vitae@ut.com', 'P.O. Box 348, 2831 Non Rd.', 'Morwell', 'VIC', '', '', '', '', NULL, NULL, NULL, NULL),
(180, 2, 8, '', 20180416, 982, NULL, '', 'Shana', 'Norris', '', 'no', 'no', '07 14 13 66 35', '1-886-880-0608', 'ligula.Nullam.enim@pede.org', '7509 Diam Street', 'Bellevue', 'Washington', '', '', '', '', NULL, NULL, NULL, NULL),
(181, 2, 13, '', 20180410, 1487, NULL, '', 'Fritz', 'Frank', '', 'no', 'no', '04 98 08 10 16', '1-205-376-4680', 'Nunc.lectus@imperdietnon.com', 'P.O. Box 462, 3566 Dolor. St.', 'Osasco', 'SP', '', '', '', '', NULL, NULL, NULL, NULL),
(182, 2, 5, '', 20180426, 1040, NULL, '', 'Dana', 'Mclaughlin', '', 'no', 'no', '09 94 69 66 97', '1-811-602-0596', 'sed.hendrerit@ultrices.net', 'Ap #494-7414 Ac Ave', 'Para�so', 'Cartago', '', '', '', '', NULL, NULL, NULL, NULL),
(183, 4, 13, '', 20180403, 1454, NULL, '', 'Allen', 'Schmidt', '', 'no', 'no', '09 76 43 31 87', '1-742-175-2191', 'et.arcu@Aliquamerat.com', '967-5436 Nunc Road', 'V�rnamo', 'J�nk�pings l�n', '', '', '', '', NULL, NULL, NULL, NULL),
(184, 1, 3, '', 20180424, 1109, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '09 20 53 58 02', '1-509-787-6220', 'pede.Cum@nonleoVivamus.co.uk', '537-1427 Lacinia Street', 'Cuenca', 'CM', '', '', '', '', NULL, NULL, NULL, NULL),
(185, 3, 10, '', 20180404, 1304, NULL, '', 'Jennifer', 'Cotton', '', 'no', 'no', '02 38 97 81 91', '1-672-908-2321', 'et.euismod@velitSed.co.uk', '341-4755 Amet Rd.', 'Langford', 'British Columbia', '', '', '', '', NULL, NULL, NULL, NULL),
(186, 3, 10, '', 20180405, 814, NULL, '', 'Martena', 'Gibson', '', 'no', 'no', '01 36 76 76 48', '1-317-684-4355', 'eu.eros.Nam@sit.com', '301-4462 Aliquam St.', 'Leiden', 'Zuid Holland', '', '', '', '', NULL, NULL, NULL, NULL),
(187, 1, 8, '', 20180417, 1414, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '09 79 74 90 47', '1-842-624-5721', 'nibh.Aliquam.ornare@tinciduntnunc.ca', 'Ap #807-5942 Molestie Rd.', 'Belfast', 'Ulster', '', '', '', '', NULL, NULL, NULL, NULL),
(188, 3, 7, '', 20180404, 1200, NULL, '', 'Seth', 'Drake', '', 'no', 'no', '02 29 04 63 33', '1-349-176-0928', 'consequat.nec.mollis@temporest.net', '5899 Molestie Av.', 'Hartlepool', 'DU', '', '', '', '', NULL, NULL, NULL, NULL),
(189, 1, 9, '', 20180413, 990, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '04 70 80 17 16', '1-787-874-3625', 'venenatis.lacus@egetipsumDonec.co.uk', '381-5232 Vivamus Rd.', 'Galway', 'C', '', '', '', '', NULL, NULL, NULL, NULL),
(190, 4, 6, '', 20180417, 1055, NULL, '', 'Kermit', 'Saunders', '', 'no', 'no', '07 65 36 04 83', '1-478-908-2588', 'amet@placerat.net', '791-3937 Velit Ave', 'Zamo??', 'LU', '', '', '', '', NULL, NULL, NULL, NULL),
(191, 4, 3, '', 20180418, 1692, NULL, '', 'Faith', 'Wall', '', 'no', 'no', '03 01 75 94 51', '1-669-151-8369', 'malesuada.vel@consectetuer.com', 'Ap #514-6375 Mattis Avenue', 'Wolverhampton', 'Staffordshire', '', '', '', '', NULL, NULL, NULL, NULL),
(192, 3, 4, '', 20180425, 1532, NULL, '', 'Risa', 'Blevins', '', 'no', 'no', '01 20 58 63 95', '1-901-663-4790', 'neque@Vestibulumuteros.com', 'P.O. Box 794, 7171 Eu St.', 'Manukau', 'North Island', '', '', '', '', NULL, NULL, NULL, NULL),
(193, 1, 11, 'cancelled_by_patient', 20180403, 851, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '03 38 39 67 73', '1-408-941-1787', 'Aliquam.gravida.mauris@gravidamolestiearcu.co.uk', '888-728 Magna. Ave', 'Itabuna', 'Bahia', '', '', '', '', NULL, NULL, NULL, NULL),
(194, 3, 14, '', 20180409, 1673, NULL, '', 'Burton', 'Rich', '', 'no', 'no', '07 35 98 69 01', '1-698-159-7199', 'Morbi.accumsan.laoreet@lacus.edu', '779-8816 Velit. Rd.', 'Colorado Springs', 'Colorado', '', '', '', '', NULL, NULL, NULL, NULL),
(195, 2, 12, '', 20180428, 956, NULL, '', 'Salvador', 'Garcia', '', 'no', 'no', '06 01 63 04 40', '1-834-365-8189', 'purus.Duis.elementum@arcuVestibulum.net', 'Ap #193-7030 Tincidunt Av.', 'Breda', 'Noord Brabant', '', '', '', '', NULL, NULL, NULL, NULL),
(196, 3, 5, '', 20180421, 1601, NULL, '', 'Belle', 'Gilbert', '', 'no', 'no', '02 76 33 56 20', '1-862-468-7835', 'lacinia@arcuVivamus.com', 'Ap #288-4183 Tellus. Rd.', 'Roxboro', 'QC', '', '', '', '', NULL, NULL, NULL, NULL),
(197, 1, 7, 'cancelled_by_patient', 20180406, 852, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '08 40 65 46 65', '1-732-720-9369', 'Donec.egestas.Duis@Nullam.net', 'Ap #108-8111 Lectus St.', 'C�rdoba', 'AN', '', '', '', '', NULL, NULL, NULL, NULL),
(198, 4, 10, '', 20180402, 896, NULL, '', 'Hammett', 'Wade', '', 'no', 'no', '03 56 53 93 64', '1-546-665-4586', 'eu.tellus@Curabiturutodio.co.uk', 'P.O. Box 640, 1905 Commodo St.', 'Vienna', 'Vienna', '', '', '', '', NULL, NULL, NULL, NULL),
(199, 2, 4, '', 20180409, 1693, NULL, '', 'Gavin', 'Carr', '', 'no', 'no', '09 10 19 61 33', '1-204-153-0297', 'nec.orci.Donec@semutcursus.org', 'P.O. Box 336, 6043 Libero. Road', 'Camarones', 'XV', '', '', '', '', NULL, NULL, NULL, NULL),
(200, 1, 10, '', 20180421, 1546, NULL, '', 'Radja', 'Lomas', '', 'no', 'no', '05 18 81 17 35', '1-157-227-3964', 'netus.et@velconvallisin.com', '2386 Nunc St.', 'Brest', 'Bretagne', '', '', '', '', NULL, NULL, NULL, NULL),
(201, 1, 14, '', 20180319, 840, NULL, 'Lomas', 'Radja', 'Lomas', '', 'no', 'no', '678957826', '678957826', 'radjal@free.fr', '4 allée Jacques Ibert, 91240', 'Saint Michel sur Orge', '', '', '', '0', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '2018-03-21 00:12:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_blog`
--

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
('1e633b887135302a4b5717ff7c5c7c4a', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153750, ''),
('babb46a0545dd587e6ddb907e705d4ef', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153752, ''),
('669065defccb511105e83c9920d50780', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153746, ''),
('2bd29984df61e52fcc2702644ed5a202', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153747, ''),
('1f592c26f53f657181d9fcd178dd5584', '87.250.224.116', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522153744, ''),
('484731480339d6d0edc8b7739dd5d749', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153742, ''),
('c6a95eb7bc49f4df759072b2ba958f2f', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153739, ''),
('4e2f950e537a69259c0a1054b259f9cd', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153736, ''),
('1e74036313c96d71899df2f96a0f2c76', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153731, ''),
('ef47f2505d6e8db55237638ecd1f9083', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153735, ''),
('05789e854f12ea2ab3a995dd4ca0a262', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153728, ''),
('0903477274fa0da6e30a842542c738a5', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153724, ''),
('62850cf9dae6685f82e1a5789784180b', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153726, ''),
('d994a6af238f0de11bf4f4822cc74f6c', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153723, ''),
('95874dbfb9a281b7c2b13af9f0fb8a78', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153720, ''),
('5e20edae6755bd5de96d622599c73d5c', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153721, ''),
('0a9080751f671ff945ce202fbb85dee2', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153719, ''),
('629af3dcb46217e246a1fa138a2c463f', '37.168.9.159', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522153708, ''),
('886601970809fb735346d8e5be79665c', '66.249.93.53', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153713, ''),
('2b689584eef87b00a5af0039e0866b1a', '37.168.9.159', 'Dalvik/2.1.0 (Linux; U; Android 6.0.1; D6603 Build/23.5.A.1.291)', 1522153706, ''),
('a97350ae031da0e4f302954c698e13b4', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153707, ''),
('7c8918a602ab350f08e92a0acc4b6324', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153703, ''),
('af543025f413e83de960e4682d3fb546', '92.184.96.189', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522164655, ''),
('fffe77c26ed22a12bec71ec5d7a12e3f', '66.249.93.55', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153698, ''),
('60b7a66ec892a4a43d56de0507c03123', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522167337, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('9e281451b7d114b46806480e265076f1', '92.184.96.189', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522150326, ''),
('32d36eac2dfa741994999fafb292df52', '87.250.224.116', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522150431, ''),
('28b4c35159423c98d94848ca7920f4a9', '92.184.96.189', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; G8141 Build/47.1.A.12.119)', 1522150318, ''),
('d45fc665d59d456998e0fd5ec5cad850', '92.184.96.189', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522150167, 'a:7:{s:8:\"username\";s:13:\"barry.almamy_\";s:5:\"email\";s:21:\"abarry78250@gmail.com\";s:2:\"id\";s:2:\"12\";s:7:\"user_id\";s:2:\"12\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('0d7b0c2364ed574ccfb80081017fd7eb', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522150436, 'a:7:{s:8:\"username\";s:12:\"almamy.barry\";s:5:\"email\";s:24:\"almamy.barry@laposte.net\";s:2:\"id\";s:2:\"11\";s:7:\"user_id\";s:2:\"11\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('11985e9cdbdaef1420f4f0aa1c40cd7d', '66.249.66.221', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1522121496, ''),
('ac535c46af4cde2578270b19fd06b918', '66.249.66.221', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1522121496, ''),
('1102bd700485902a19b1526e4b1cd319', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.137 Mo', 1522110803, 'a:7:{s:8:\"username\";s:12:\"radja.lomas2\";s:5:\"email\";s:16:\"r4dj4l@gmail.com\";s:2:\"id\";s:2:\"10\";s:7:\"user_id\";s:2:\"10\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:new:success\";s:21:\"Vous êtes connecté.\";}'),
('56cd46f0ac735c7d869a4a0ea295d5f9', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522110252, ''),
('9120da97c553be0c21cc664721ae5282', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522107633, ''),
('8bdce6aff0fd3e9ddb8dd3aeddb9366e', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522108516, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e66090282baa9eeaf0e6087b31e37e27', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522106783, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('0b48116ccb5da01fd51eceaf609a2f47', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522105624, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('aa99ca709044106741008cc43c853d70', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522105136, ''),
('ad6abc4701106591d3796cd69ae6822d', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522105043, ''),
('c2a2010a1d231748db04cd15283e595a', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1522105066, ''),
('bdaa0186742c2854af27464256627ba2', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522104816, ''),
('d223ad877acc8a188e2246c2188a2d42', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1522104826, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('5ab78cebf88a4cd27248c07d08147163', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522104637, ''),
('50b6ddadeed4eeeeec7f82032804511c', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522104620, ''),
('7cff3669b876fef9dd29560cda94ac84', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522104631, ''),
('1f9f09f83d2c6020d645653e9ad57e27', '66.249.66.219', 'Googlebot-Image/1.0', 1522094375, ''),
('8b601656075f80d05d1416aefc806362', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522104571, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('167e99969f53b38120fa5bc8c47acd3d', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522145830, ''),
('783698737cf25b5cf07c9da2f672f405', '54.67.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.3', 1522145838, ''),
('a1f92247a78d9cd2b017dbcabdbafce2', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522137780, ''),
('2763c996f6652b28f875cefe2e37bec0', '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522147863, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('c6f85f073db31d5e76f89c780db23be4', '180.76.15.14', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522131854, ''),
('962dbbf77c04a115c0cb9302fa4b7116', '180.76.15.29', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 1522131863, ''),
('2facc91fdb09b4eafaf989a6b3b171ff', '66.249.66.221', 'Googlebot-Image/1.0', 1522124866, ''),
('b425859dacc74e5561e258c29e7f380b', '66.249.66.223', 'Googlebot-Image/1.0', 1522131349, ''),
('7fec5998bf92a670865d3430d80c05b8', '66.249.66.221', 'Googlebot-Image/1.0', 1522131710, ''),
('294dbd564b4909cb81d808cb217063f3', '66.249.66.219', 'Googlebot-Image/1.0', 1522121965, ''),
('c49cf8bae9e4b78bc8791f44028e13f9', '66.249.66.219', 'Googlebot-Image/1.0', 1522121968, ''),
('e10319a8360f1beafa282819743e66c7', '66.249.66.221', 'Googlebot-Image/1.0', 1522122017, ''),
('620aecf9c7aa9203fc914fe3e0292166', '112.203.184.95', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 1522124277, ''),
('0641f3ef6e3cb8fb6e594089ebf486e0', '66.249.66.221', 'Googlebot-Image/1.0', 1522121925, ''),
('75ea9e79b8f86330107af0be28e0e974', '66.249.66.221', 'Googlebot-Image/1.0', 1522121927, ''),
('5ede4c78b184a2365c07a64411e3ea29', '66.249.66.219', 'Googlebot-Image/1.0', 1522121944, ''),
('053fa86577b31bcdead9d3e22c0ce563', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521551810, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('20a2fbaa9b27b7f1e31d68b8a7a6c5f0', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521551811, ''),
('34fac7193116a4ff7a105c7ce41b8d77', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521551955, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('a230c235feececa656578da684e2dac6', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', 1521552170, ''),
('1371326843de49be059dac989334dd60', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', 1521553633, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('f4eed0e53505bdf12ba22366b52f15e0', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', 1521553667, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('702ddd6fb4e982fea14fe27b4a92add3', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521555819, ''),
('690cf98a553c1999feeba4f90e56a551', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521559471, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('2d1b4321e35e029b6a9cca663a847a63', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521565265, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('40381eebbd00c195adc275df800824e1', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521592625, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('c6d08bc3ff844bfabac560ff9ada3a89', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521592631, ''),
('99a950211799c523d3ff2c551f6d16b1', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521593633, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('4598f86133ba7b9091128ff788bcac93', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521602279, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('5dc4c7d88116f45aac7d074a9c84fb3f', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521635147, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('bf7a9a108e2fe7ec82a42922951a445b', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobil', 1521636656, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1c50f69e2440aaf164525afc0cd0e1a3', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521636685, 'a:6:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:39:\"La page \"Accueil\" a été enregistrée.\";}'),
('181261494b020083fc28539353fe7a58', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobil', 1521636716, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('d725518a7169ef50a1837378fd0adde9', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Mobil', 1521636914, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('438ae64759df8f63806ec74807598fd0', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobil', 1521638040, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('4cef2743c5da70193e2ee4b86ca88460', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521651761, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('7c2906b65d589c518fda86efed34b2e7', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521682774, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('ce720354ca519e2cd9400c8fbda13d4b', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521683459, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('64db8a698896f5a473658592e8ea1799', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1521685629, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('03e4e473b6adefe4d80295d0371b5046', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521724063, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('8fb345306a4c769fa7d66a532cf0a561', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521726180, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('52cd37ec70b84ebf28bcf003b78758c6', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521726521, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('5d65a296830fc93a6861d5fbf190060d', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521735146, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('62a699b632c320c667573bd6f0ae99d9', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521738977, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('460d54536c184d625ea218ee06ef611a', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521762513, 'a:1:{s:14:\"admin_redirect\";s:18:\"admin/appointments\";}'),
('8f1320d3d87545394dc07de4393db3e1', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521756841, ''),
('8c8b43434e8f454ead2a83ec1def65b0', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1521762964, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1776c047f1309ddd3209dcd6bf2b8074', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521764769, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('39b8cee713a9c45ec1ca8d86f3a03f71', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1521765059, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('b3ce644075e6c1d6646ba52ceede6e7d', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521765626, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e0f53ad590358eae08bba1e37878e299', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1521765647, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('3f9d8e5ce14cb1cce310c0e34025e50d', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1521765648, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('b428c2da598dd78a74cef51a2072ee02', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521765868, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('71b558f8e686a4bd1b77b55b3c49f93c', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1521766083, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('122342a13c8b6fee47203898d5d5506a', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521770183, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('0451e9d435eea37f5edd099cb2988483', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521839263, ''),
('513d82453224ccd238df442a49d2f130', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521811806, ''),
('36536cf53392ce420b7fca5bc5610faf', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521935680, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('52169022552e0592a0f542b6bebfa967', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1521839604, ''),
('c6aab2c4855b0c908e8a88ccf73f1636', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521938386, ''),
('939d21ce806a463fde81138795bf8605', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobil', 1521938549, 'a:1:{s:14:\"admin_redirect\";s:18:\"admin/users/fields\";}'),
('4d12316b451245c5bffea616eea96d8d', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1521936520, ''),
('3dca5738df17bb01616e7ccc67541c10', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobil', 1521938144, ''),
('119434b4ac8c51cd30f3e81ca2094f53', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522000962, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1d64316836ff627d71674a03b832f67a', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522003943, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('70b474fd438c4359002f7c4906bbc3ab', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522003637, ''),
('3c67cabc307e74ade4540a860177a01d', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522003942, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1fcea67408aac647cde8197ae7f0d498', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521999443, 'a:6:{s:8:\"username\";s:6:\"devops\";s:5:\"email\";s:18:\"devops@nowhere.com\";s:2:\"id\";s:1:\"5\";s:7:\"user_id\";s:1:\"5\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('8a5e4b1c332cf10fb76f047ad180194f', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1521999856, ''),
('afed1d491b2a2b7becd4f7e0aec5e40c', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522003943, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('41df7d69d110d7fdbb387ea7c0c2bc7e', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522003944, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e389e2f394e233ad489c98b3f98897a1', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522003944, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('26db43cdbaab85e81e53a8c22f6b4e15', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobil', 1522005372, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('ae09e8139a912d551150c9cb3f5646a9', '::1', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safa', 1522005977, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('a121c09a1794b17c5d7db82129c6740a', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14', 1522006103, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('4ce25c1a4275c5ee115c98c9989beeb2', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A3', 1522006125, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('127ca2456bc8f629e50f037be770076c', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522006630, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('ac79f6a33dfd6bab8a403e0a2f0337a5', '::1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobi', 1522004424, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('7d68f57ff4b3624c40462b3f0b3dcd93', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522004586, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('87c91c62680a8f3b37a5e842d8e1a405', '::1', 'Mozilla/5.0 (Linux; Android 8.0.0; Pixel 2 XL Build/OPD1.170816.004) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.', 1522005276, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e96269d9dbb629d3ad4418e0d5618e7f', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522005453, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('b9247214065b4a2f598fbdb111f101b3', '::1', 'Mozilla/5.0 (Linux; Android 8.0.0; Pixel 2 XL Build/OPD1.170816.004) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.', 1522007931, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('46e4540365c43caa366fc6365530662d', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522008204, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('6ad82d7f9d7ca869d662dcddebcbdf0b', '::1', 'Mozilla/5.0 (Linux; Android 8.0.0; Pixel 2 XL Build/OPD1.170816.004) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.', 1522008257, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('26182d8b8e96a86ac907dcd466fb2012', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522008564, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('8439d5225b51ea2ff49030416623a75f', '::1', 'Mozilla/5.0 (Linux; Android 8.0.0; Pixel 2 XL Build/OPD1.170816.004) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.', 1522008571, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('e332ebe9dd28928da86e42220b673548', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522009105, 'a:6:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:31:\"Champ mis à jour avec succès.\";}'),
('c8cd2928d9849c24ebc05821bb6221ad', '::1', 'Mozilla/5.0 (Linux; Android 8.0.0; Pixel 2 XL Build/OPD1.170816.004) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.', 1522009767, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('71acf93c78dd3b62575019c2f7dcebe2', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1522010522, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('117c8d1c5f686534063f6405b8bfcc18', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522010607, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('bcd945686db7b3e0c60ba9b6f73f1c63', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1522011374, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('c6aadf5b171df71a4fda3c23ca975b41', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522012035, 'a:6:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:28:\"Le module a été installé.\";}'),
('c48cd45d760ebd48b3ac39a20925c48e', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1522012833, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('21b4bfd51150fe93559dd1c92c274a57', '::1', 'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.', 1522016724, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('3cc7d43d3ec17cd1c7c1a4563cc51f23', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522020210, ''),
('a37375fa76d77d43db8a0d4fd5fb50c3', '195.154.172.76', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1522033806, ''),
('667085bcf766be2c666678d88e88bf20', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522019884, ''),
('29eeafc93cffca13a38715079d17913c', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522019299, ''),
('61d75a89a348e7cb3e268d23ec992a02', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522020107, 'a:7:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:21:\"Vous êtes connecté.\";}'),
('5a8d2808cdbdd73609203db2faf7d4a9', '92.170.179.46', 'Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/61.0.3163.73 Mobile/13G36 Saf', 1522042471, ''),
('d8570a4aeeacf0793e66fe4a170cbdf3', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522043613, ''),
('e0e93f64113f44c77d84e52b333939a8', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522043616, ''),
('6e4f6683588be55dc7d41a71fbdcf458', '66.249.93.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522043618, ''),
('e7dddc2afa882c063f27109ced91acaf', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522046803, ''),
('80a349376658c0a835cbc141e9e15343', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522046834, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('bac41e9f43f61e4b080ce42aeca36f28', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522085387, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('1cd1e1ca8783d43f6a7f18b0aa98fd10', '80.12.27.236', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.10', 1522053730, ''),
('56b4c738f8b3a621d28eb48093695547', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522085598, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('900922a8c03b1b9a3f2614fe7cc389f5', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522075882, ''),
('bd2a0ead633a958378acf6100078160b', '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mo', 1522072599, 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('f0002b8084759a1d43be0056c7c96a3f', '78.213.60.211', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522088757, ''),
('151527f06edbbf974dfc0f8a05b99551', '141.8.142.197', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522089508, ''),
('8ad15b07cfc56716bef96ac8cd6237b2', '178.154.200.11', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1522089519, ''),
('3c260d93c9923b181bd5c2d221b17fa4', '51.255.95.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522091384, ''),
('e1b97b23af226743ecd35f9bf55dfd43', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522091781, ''),
('b8c91c5796d6546cfe2b99921c5815a4', '92.170.179.46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522091784, ''),
('e1330f7e48b81975340262df6446712c', '66.249.66.223', 'Googlebot-Image/1.0', 1522094372, ''),
('23b2a563bc936104efc531f25465ac2c', '66.249.66.223', 'Googlebot-Image/1.0', 1522094372, ''),
('717d17340744a728b79e0685a85ccc41', '66.249.93.51', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153758, ''),
('bdb89a4f630a0bdf8db744a1847c064f', '37.168.9.159', 'Mozilla/5.0 (Linux; Android 6.0.1; D6603 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109', 1522153762, ''),
('fb6f4c184b94428df668c87c16d798c8', '62.23.36.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522153976, ''),
('e7b53406ad5e030cadc12f2f03abb182', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522165909, 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),
('804774119c49f203b2544b22721ca3af', '185.89.129.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522162911, ''),
('a83e01e50c7d55310f1a4eb693d2acfe', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522167511, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),
('248c85c8dcf08cc4e135cdaee7b558e4', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522165067, ''),
('2b88c7edb67911126602cace2bc10bdc', '66.249.93.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522167110, ''),
('b8402b867854fbad13a49d891baef81e', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522167709, 'a:6:{s:8:\"username\";s:12:\"barry.didier\";s:5:\"email\";s:18:\"abarry@mitcoms.com\";s:2:\"id\";s:2:\"13\";s:7:\"user_id\";s:2:\"13\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),
('106dcb5348e5c061bde5c618612a0305', '66.249.93.60', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1522167112, ''),
('29510e6f1a1c1e97643895918e3b2963', '176.31.224.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522168120, ''),
('4c3b8553a3fe851b52bd582cfc802ca1', '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1522167515, 'a:5:{s:5:\"email\";s:14:\"radjal@free.fr\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');

-- --------------------------------------------------------

--
-- Structure de la table `default_comments`
--

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

CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_contact_log`
--

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
(570, 'date test', 'date_test', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b733a303a22223b7d, NULL, 'no'),
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
(19, 17, 3, 19, 'no', 'no', 'Vos informations médicales', NULL),
(8, 3, 3, 8, 'yes', 'no', 'Date de naissance.', NULL),
(23, 1, 3, 23, 'no', 'no', 'Vous êtes un homme ou une femme?', NULL),
(10, 5, 3, 10, 'no', 'no', 'Votre numéro de téléphone fixe', NULL),
(11, 6, 3, 11, 'yes', 'no', 'Votre numéro de téléphone portable', NULL),
(12, 7, 3, 12, 'no', 'no', 'Adresse ligne 1', NULL),
(13, 8, 3, 13, 'no', 'no', 'Adresse ligne 2', NULL),
(20, 11, 3, 20, 'no', 'no', 'Votre ville ou village de résidence', NULL),
(15, 18, 3, 15, 'no', 'no', NULL, NULL),
(567, 2, 3, 570, 'no', 'no', '', NULL),
(21, 9, 3, 21, 'no', 'no', 'Votre quartier de résidence si applicable', NULL),
(22, 12, 3, 22, 'no', 'no', 'Votre mutuelle d\'assurance', NULL),
(24, 16, 3, 24, 'no', 'no', 'Si vous connaissez le numéro identifiant de votre médecin, vous pouvez le renseigner ici.', NULL),
(25, 1, 2, 25, 'no', 'no', '', NULL),
(26, 3, 2, 26, 'no', 'no', '', NULL),
(502, 15, 3, 505, 'no', 'no', '', NULL),
(564, 2, 87, 567, 'yes', 'yes', NULL, NULL),
(545, 1, 85, 548, 'no', 'no', NULL, NULL),
(546, 2, 85, 549, 'no', 'no', NULL, NULL),
(547, 3, 85, 550, 'no', 'no', NULL, NULL),
(548, 3, 85, 551, 'no', 'no', NULL, NULL),
(549, 4, 85, 552, 'no', 'no', NULL, NULL),
(550, 5, 85, 553, 'no', 'no', NULL, NULL),
(551, 6, 85, 554, 'no', 'no', NULL, NULL),
(552, 7, 85, 555, 'no', 'no', NULL, NULL),
(553, 8, 85, 556, 'no', 'no', NULL, NULL),
(554, 9, 85, 557, 'no', 'no', NULL, NULL),
(555, 10, 85, 558, 'yes', 'no', NULL, NULL),
(556, 11, 85, 559, 'yes', 'no', NULL, NULL),
(557, 12, 85, 560, 'yes', 'no', NULL, NULL),
(558, 13, 85, 561, 'no', 'no', NULL, NULL),
(559, 14, 85, 562, 'no', 'no', NULL, NULL),
(560, 1, 86, 563, 'yes', 'yes', NULL, NULL),
(561, 2, 86, 564, 'no', 'no', NULL, NULL),
(562, 15, 85, 565, 'no', 'no', NULL, NULL),
(563, 1, 87, 566, 'no', 'no', NULL, NULL),
(503, 13, 3, 506, 'no', 'no', 'Numéro de bureau ou instructitons d\'accès', NULL),
(504, 14, 3, 507, 'no', 'no', '', NULL),
(565, 10, 3, 568, 'no', 'no', '', NULL),
(566, 4, 3, 569, 'no', 'no', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_data_streams`
--

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
(1, '2017-05-18 13:39:28', '2018-03-10 00:14:29', 1, NULL, '<div style=\"text-align: center;\"><span style=\"font-size: 26px;\">Prenez rendez vous avec votre professionnel de sant&eacute;.</span></div>\r\n', '{{ dev:empty_cache }}\r\n\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/997cd2e64fac717/80/80\" alt=\"Généraliste\"/> \r\n			<p>Médecins généralistes</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/292281c45a9207c/80/80\" alt=\"Ophtalmologue\"/> \r\n			<p>Ophtalmologue</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/25e01b2784711d9/80/80\" alt=\"ORL\"/> \r\n			<p>ORL</p>\r\n		</div>\r\n</div>\r\n		\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/a4278245d864a56/80/80\" alt=\"Cardiologie\"/> \r\n			<p>Cardiologie</p> \r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/3590b30f5b17f8c/80/80\" alt=\"Spécialistes femme\"/> \r\n			<p>Spécialistes femme</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/379ffc54d24dc2f/80/80\" alt=\"Dentiste\"/> \r\n			<p>Dentiste</p>\r\n		</div> \r\n</div>\r\n		\r\n<div class=\"ico-grp\">\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/82ed2c7f7efb8a4/80/80\" alt=\"Radiologue\"/> \r\n			<p>Radiologue</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/c8e8886f9e65488/80/80\" alt=\"Autres médecins\"/> \r\n			<p>Autres médecins</p>\r\n		</div>\r\n		<div class=\"specialite\">\r\n			<img src=\"{{ url:site }}files/thumb/353de3d9e958976/80/80\" alt=\"Etablissements de santé\"/> \r\n			<p>Etablissements de santé</p>\r\n		</div>\r\n</div>', ''),
(2, '2017-05-18 13:39:28', '2017-05-18 15:24:16', 1, NULL, '<p>{{ contact:form name=&quot;text|required&quot; email=&quot;text|required|valid_email&quot; subject=&quot;dropdown|Rendez-vous|Question|Autre&quot; message=&quot;textarea&quot; }}</p>\r\n\r\n<div><label for=\"name\">Nom:</label>{{ name }}</div>\r\n\r\n<div><label for=\"email\">Email:</label>{{ email }}</div>\r\n\r\n<div><label for=\"subject\">Sujet:</label>{{ subject }}</div>\r\n\r\n<div><label for=\"message\">Message:</label>{{ message }}</div>\r\n{{ /contact:form }}', NULL, NULL),
(3, '2017-05-18 13:39:28', NULL, 1, NULL, '{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}', NULL, NULL),
(4, '2017-05-18 13:39:28', NULL, 1, NULL, '{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for \"{{ query }}\".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href=\"{{ url }}\">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}', NULL, NULL),
(5, '2017-05-18 13:39:28', NULL, 1, NULL, '<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>', NULL, NULL),
(12, '2018-03-09 14:17:43', '2018-03-10 00:22:07', 1, 5, NULL, '', ''),
(8, '2017-05-18 13:57:03', NULL, 1, 1, NULL, NULL, NULL),
(9, '2017-05-18 13:57:31', NULL, 1, 2, NULL, NULL, NULL),
(10, '2017-05-18 14:33:22', NULL, 1, 3, 'Pour venir chez {{settings:site_name}}<br />\r\n90 Avenue Francois Mitterand<br />\r\n91200 Athis-Mons<br />\r\n<iframe allowfullscreen=\"\" frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2633.046912993283!2d2.369675615668944!3d48.70458427927276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e675f208bc94e9%3A0xe9f8f7f2e1e692fc!2s90+Avenue+Fran%C3%A7ois+Mitterrand%2C+91200+Athis-Mons!5e0!3m2!1sfr!2sfr!4v1495110775316\" style=\"border:0\" width=\"600\"></iframe> ​<br />\r\n09 83 76 63 08&nbsp;<br />\r\nbgoulin@hotmail.fr<br />\r\n<br />\r\nPar les transport Bus N&deg; 285 arr&ecirc;t Marx-Dormoy<br />\r\nPaking priv&eacute;<br />\r\n<br />\r\n​', NULL, NULL),
(11, '2017-05-18 14:35:37', NULL, 1, 4, '<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"2\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Jour</td>\r\n			<td>Heures</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lundi</td>\r\n			<td>11h-20h</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mardi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mercredi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Jeudi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vendredi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Samedi</td>\r\n			<td><span style=\"font-size: 13px;\">11h-20h</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dimanche</td>\r\n			<td>ferm&eacute;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, NULL);
INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`, `pre_html`, `post_html`) VALUES
(13, '2018-03-09 23:22:20', '2018-03-10 00:04:09', 1, 6, NULL, '<div class=\"container\">\r\n\r\n      <div class=\"page-header\" id=\"banner\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-8 col-md-7 col-sm-6\">\r\n            <h1>Flatly</h1>\r\n            <p class=\"lead\">Flat and modern</p>\r\n          </div>\r\n          <div class=\"col-lg-4 col-md-5 col-sm-6\">\r\n            <div class=\"sponsor\">\r\n              <script async=\"\" type=\"text/javascript\" src=\"//cdn.carbonads.com/carbon.js?zoneid=1673&amp;serve=C6AILKT&amp;placement=bootswatchcom\" id=\"_carbonads_js\"></script><div id=\"carbonads\"><span><span class=\"carbon-wrap\"><a href=\"//srv.carbonads.net/ads/click/x/GTND423YCY7I4237CYS4YKQWFTSDCK7LCYAD5Z3JCEADKKJUCTAI42QKC6BDE2JIC6BDTK3EHJNCLSIZ?segment=placement:bootswatchcom;\" class=\"carbon-img\" target=\"_blank\"><img src=\"//assets.servedby-buysellads.com/p/manage/asset/id/35636\" alt=\"\" border=\"0\" height=\"100\" width=\"130\" style=\"max-width: 130px;\"></a><a href=\"//srv.carbonads.net/ads/click/x/GTND423YCY7I4237CYS4YKQWFTSDCK7LCYAD5Z3JCEADKKJUCTAI42QKC6BDE2JIC6BDTK3EHJNCLSIZ?segment=placement:bootswatchcom;\" class=\"carbon-text\" target=\"_blank\">Segment is the last integration you will need.</a></span><a href=\"http://carbonads.net/\" class=\"carbon-poweredby\" target=\"_blank\">ads via Carbon</a></span></div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-3 col-md-3 col-sm-4\">\r\n            <div class=\"list-group table-of-contents\">\r\n              <a class=\"list-group-item\" href=\"#navbar\">Navbar</a>\r\n              <a class=\"list-group-item\" href=\"#buttons\">Buttons</a>\r\n              <a class=\"list-group-item\" href=\"#typography\">Typography</a>\r\n              <a class=\"list-group-item\" href=\"#tables\">Tables</a>\r\n              <a class=\"list-group-item\" href=\"#forms\">Forms</a>\r\n              <a class=\"list-group-item\" href=\"#navs\">Navs</a>\r\n              <a class=\"list-group-item\" href=\"#indicators\">Indicators</a>\r\n              <a class=\"list-group-item\" href=\"#progress-bars\">Progress bars</a>\r\n              <a class=\"list-group-item\" href=\"#containers\">Containers</a>\r\n              <a class=\"list-group-item\" href=\"#dialogs\">Dialogs</a>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Navbar\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section clearfix\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"navbar\">Navbar</h1>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <nav class=\"navbar navbar-default\">\r\n                <div class=\"container-fluid\">\r\n                  <div class=\"navbar-header\">\r\n                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n                      <span class=\"sr-only\">Toggle navigation</span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                    </button>\r\n                    <a class=\"navbar-brand\" href=\"#\">Brand</a>\r\n                  </div>\r\n\r\n                  <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n                    <ul class=\"nav navbar-nav\">\r\n                      <li class=\"active\"><a href=\"#\">Link <span class=\"sr-only\">(current)</span></a></li>\r\n                      <li><a href=\"#\">Link</a></li>\r\n                      <li class=\"dropdown\">\r\n                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></a>\r\n                        <ul class=\"dropdown-menu\" role=\"menu\">\r\n                          <li><a href=\"#\">Action</a></li>\r\n                          <li><a href=\"#\">Another action</a></li>\r\n                          <li><a href=\"#\">Something else here</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">Separated link</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">One more separated link</a></li>\r\n                        </ul>\r\n                      </li>\r\n                    </ul>\r\n                    <form class=\"navbar-form navbar-left\" role=\"search\">\r\n                      <div class=\"form-group\">\r\n                        <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n                      </div>\r\n                      <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n                    </form>\r\n                    <ul class=\"nav navbar-nav navbar-right\">\r\n                      <li><a href=\"#\">Link</a></li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </nav>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <nav class=\"navbar navbar-inverse\">\r\n                <div class=\"container-fluid\">\r\n                  <div class=\"navbar-header\">\r\n                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-2\">\r\n                      <span class=\"sr-only\">Toggle navigation</span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                      <span class=\"icon-bar\"></span>\r\n                    </button>\r\n                    <a class=\"navbar-brand\" href=\"#\">Brand</a>\r\n                  </div>\r\n\r\n                  <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-2\">\r\n                    <ul class=\"nav navbar-nav\">\r\n                      <li class=\"active\"><a href=\"#\">Link <span class=\"sr-only\">(current)</span></a></li>\r\n                      <li><a href=\"#\">Link</a></li>\r\n                      <li class=\"dropdown\">\r\n                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Dropdown <span class=\"caret\"></span></a>\r\n                        <ul class=\"dropdown-menu\" role=\"menu\">\r\n                          <li><a href=\"#\">Action</a></li>\r\n                          <li><a href=\"#\">Another action</a></li>\r\n                          <li><a href=\"#\">Something else here</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">Separated link</a></li>\r\n                          <li class=\"divider\"></li>\r\n                          <li><a href=\"#\">One more separated link</a></li>\r\n                        </ul>\r\n                      </li>\r\n                    </ul>\r\n                    <form class=\"navbar-form navbar-left\" role=\"search\">\r\n                      <div class=\"form-group\">\r\n                        <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n                      </div>\r\n                      <button type=\"submit\" class=\"btn btn-default\">Submit</button>\r\n                    </form>\r\n                    <ul class=\"nav navbar-nav navbar-right\">\r\n                      <li><a href=\"#\">Link</a></li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </nav>\r\n            </div><!-- /example -->\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n\r\n      <!-- Buttons\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"page-header\">\r\n          <div class=\"row\">\r\n            <div class=\"col-lg-12\">\r\n              <h1 id=\"buttons\">Buttons</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-7\">\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default\">Default</a>\r\n              <a href=\"#\" class=\"btn btn-primary\">Primary</a>\r\n              <a href=\"#\" class=\"btn btn-success\">Success</a>\r\n              <a href=\"#\" class=\"btn btn-info\">Info</a>\r\n              <a href=\"#\" class=\"btn btn-warning\">Warning</a>\r\n              <a href=\"#\" class=\"btn btn-danger\">Danger</a>\r\n              <a href=\"#\" class=\"btn btn-link\">Link</a>\r\n            </p>\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default disabled\">Default</a>\r\n              <a href=\"#\" class=\"btn btn-primary disabled\">Primary</a>\r\n              <a href=\"#\" class=\"btn btn-success disabled\">Success</a>\r\n              <a href=\"#\" class=\"btn btn-info disabled\">Info</a>\r\n              <a href=\"#\" class=\"btn btn-warning disabled\">Warning</a>\r\n              <a href=\"#\" class=\"btn btn-danger disabled\">Danger</a>\r\n              <a href=\"#\" class=\"btn btn-link disabled\">Link</a>\r\n            </p>\r\n\r\n\r\n            <div style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-toolbar bs-component\" style=\"margin: 0;\">\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">Default</a>\r\n                  <a href=\"#\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-primary\">Primary</a>\r\n                  <a href=\"#\" class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-success\">Success</a>\r\n                  <a href=\"#\" class=\"btn btn-success dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-info\">Info</a>\r\n                  <a href=\"#\" class=\"btn btn-info dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-warning\">Warning</a>\r\n                  <a href=\"#\" class=\"btn btn-warning dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </div>\r\n              </div>\r\n            </div>\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-primary btn-lg\">Large button</a>\r\n              <a href=\"#\" class=\"btn btn-primary\">Default button</a>\r\n              <a href=\"#\" class=\"btn btn-primary btn-sm\">Small button</a>\r\n              <a href=\"#\" class=\"btn btn-primary btn-xs\">Mini button</a>\r\n            </p>\r\n\r\n          </div>\r\n          <div class=\"col-lg-5\">\r\n\r\n            <p class=\"bs-component\">\r\n              <a href=\"#\" class=\"btn btn-default btn-lg btn-block\">Block level button</a>\r\n            </p>\r\n\r\n\r\n            <div class=\"bs-component\" style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-group btn-group-justified\">\r\n                <a href=\"#\" class=\"btn btn-default\">Left</a>\r\n                <a href=\"#\" class=\"btn btn-default\">Middle</a>\r\n                <a href=\"#\" class=\"btn btn-default\">Right</a>\r\n              </div>\r\n            </div>\r\n\r\n            <div class=\"bs-component\" style=\"margin-bottom: 15px;\">\r\n              <div class=\"btn-toolbar\">\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">1</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">2</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">3</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">4</a>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">5</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">6</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">7</a>\r\n                </div>\r\n\r\n                <div class=\"btn-group\">\r\n                  <a href=\"#\" class=\"btn btn-default\">8</a>\r\n                  <div class=\"btn-group\">\r\n                    <a href=\"#\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\">\r\n                      Dropdown\r\n                      <span class=\"caret\"></span>\r\n                    </a>\r\n                    <ul class=\"dropdown-menu\">\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                      <li><a href=\"#\">Dropdown link</a></li>\r\n                     </ul>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <div class=\"btn-group-vertical\">\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n                  <a href=\"#\" class=\"btn btn-default\">Button</a>\r\n              </div>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Typography\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"typography\">Typography</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <!-- Headings -->\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h1>Heading 1</h1>\r\n              <h2>Heading 2</h2>\r\n              <h3>Heading 3</h3>\r\n              <h4>Heading 4</h4>\r\n              <h5>Heading 5</h5>\r\n              <h6>Heading 6</h6>\r\n              <p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h2>Example body text</h2>\r\n              <p>Nullam quis risus eget <a href=\"#\">urna mollis ornare</a> vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>\r\n              <p><small>This line of text is meant to be treated as fine print.</small></p>\r\n              <p>The following snippet of text is <strong>rendered as bold text</strong>.</p>\r\n              <p>The following snippet of text is <em>rendered as italicized text</em>.</p>\r\n              <p>An abbreviation of the word attribute is <abbr title=\"attribute\">attr</abbr>.</p>\r\n            </div>\r\n\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <h2>Emphasis classes</h2>\r\n              <p class=\"text-muted\">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</p>\r\n              <p class=\"text-primary\">Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\r\n              <p class=\"text-warning\">Etiam porta sem malesuada magna mollis euismod.</p>\r\n              <p class=\"text-danger\">Donec ullamcorper nulla non metus auctor fringilla.</p>\r\n              <p class=\"text-success\">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>\r\n              <p class=\"text-info\">Maecenas sed diam eget risus varius blandit sit amet non magna.</p>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n        <!-- Blockquotes -->\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2 id=\"type-blockquotes\">Blockquotes</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"bs-component\">\r\n              <blockquote>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n                <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n              </blockquote>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"bs-component\">\r\n              <blockquote class=\"blockquote-reverse\">\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n                <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n              </blockquote>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Tables\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"tables\">Tables</h1>\r\n            </div>\r\n\r\n            <div class=\"bs-component\">\r\n              <table class=\"table table-striped table-hover \">\r\n                <thead>\r\n                  <tr>\r\n                    <th>#</th>\r\n                    <th>Column heading</th>\r\n                    <th>Column heading</th>\r\n                    <th>Column heading</th>\r\n                  </tr>\r\n                </thead>\r\n                <tbody>\r\n                  <tr>\r\n                    <td>1</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr>\r\n                    <td>2</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"info\">\r\n                    <td>3</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"success\">\r\n                    <td>4</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"danger\">\r\n                    <td>5</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"warning\">\r\n                    <td>6</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                  <tr class=\"active\">\r\n                    <td>7</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                    <td>Column content</td>\r\n                  </tr>\r\n                </tbody>\r\n              </table> \r\n            </div><!-- /example -->\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Forms\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"forms\">Forms</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"well bs-component\">\r\n              <form class=\"form-horizontal\">\r\n                <fieldset>\r\n                  <legend>Legend</legend>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"inputEmail\" class=\"col-lg-2 control-label\">Email</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <input type=\"text\" class=\"form-control\" id=\"inputEmail\" placeholder=\"Email\">\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"inputPassword\" class=\"col-lg-2 control-label\">Password</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <input type=\"password\" class=\"form-control\" id=\"inputPassword\" placeholder=\"Password\">\r\n                      <div class=\"checkbox\">\r\n                        <label>\r\n                          <input type=\"checkbox\"> Checkbox\r\n                        </label>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"textArea\" class=\"col-lg-2 control-label\">Textarea</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <textarea class=\"form-control\" rows=\"3\" id=\"textArea\"></textarea>\r\n                      <span class=\"help-block\">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label class=\"col-lg-2 control-label\">Radios</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <div class=\"radio\">\r\n                        <label>\r\n                          <input type=\"radio\" name=\"optionsRadios\" id=\"optionsRadios1\" value=\"option1\" checked=\"\">\r\n                          Option one is this\r\n                        </label>\r\n                      </div>\r\n                      <div class=\"radio\">\r\n                        <label>\r\n                          <input type=\"radio\" name=\"optionsRadios\" id=\"optionsRadios2\" value=\"option2\">\r\n                          Option two can be something else\r\n                        </label>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <label for=\"select\" class=\"col-lg-2 control-label\">Selects</label>\r\n                    <div class=\"col-lg-10\">\r\n                      <select class=\"form-control\" id=\"select\">\r\n                        <option>1</option>\r\n                        <option>2</option>\r\n                        <option>3</option>\r\n                        <option>4</option>\r\n                        <option>5</option>\r\n                      </select>\r\n                      <br>\r\n                      <select multiple=\"\" class=\"form-control\">\r\n                        <option>1</option>\r\n                        <option>2</option>\r\n                        <option>3</option>\r\n                        <option>4</option>\r\n                        <option>5</option>\r\n                      </select>\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"form-group\">\r\n                    <div class=\"col-lg-10 col-lg-offset-2\">\r\n                      <button type=\"reset\" class=\"btn btn-default\">Cancel</button>\r\n                      <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\r\n                    </div>\r\n                  </div>\r\n                </fieldset>\r\n              </form>\r\n            <div id=\"source-button\" class=\"btn btn-primary btn-xs\" style=\"display: none;\">&lt; &gt;</div></div>\r\n          </div>\r\n          <div class=\"col-lg-4 col-lg-offset-1\">\r\n\r\n              <form class=\"bs-component\">\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"focusedInput\">Focused input</label>\r\n                  <input class=\"form-control\" id=\"focusedInput\" type=\"text\" value=\"This is focused...\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"disabledInput\">Disabled input</label>\r\n                  <input class=\"form-control\" id=\"disabledInput\" type=\"text\" placeholder=\"Disabled input here...\" disabled=\"\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-warning\">\r\n                  <label class=\"control-label\" for=\"inputWarning\">Input warning</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputWarning\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-error\">\r\n                  <label class=\"control-label\" for=\"inputError\">Input error</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputError\">\r\n                </div>\r\n\r\n                <div class=\"form-group has-success\">\r\n                  <label class=\"control-label\" for=\"inputSuccess\">Input success</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputSuccess\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputLarge\">Large input</label>\r\n                  <input class=\"form-control input-lg\" type=\"text\" id=\"inputLarge\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputDefault\">Default input</label>\r\n                  <input type=\"text\" class=\"form-control\" id=\"inputDefault\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\" for=\"inputSmall\">Small input</label>\r\n                  <input class=\"form-control input-sm\" type=\"text\" id=\"inputSmall\">\r\n                </div>\r\n\r\n                <div class=\"form-group\">\r\n                  <label class=\"control-label\">Input addons</label>\r\n                  <div class=\"input-group\">\r\n                    <span class=\"input-group-addon\">$</span>\r\n                    <input type=\"text\" class=\"form-control\">\r\n                    <span class=\"input-group-btn\">\r\n                      <button class=\"btn btn-default\" type=\"button\">Button</button>\r\n                    </span>\r\n                  </div>\r\n                </div>\r\n              </form>\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Navs\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"navs\">Navs</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-tabs\">Tabs</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-tabs\">\r\n                <li class=\"\"><a href=\"#home\" data-toggle=\"tab\" aria-expanded=\"false\">Home</a></li>\r\n                <li class=\"active\"><a href=\"#profile\" data-toggle=\"tab\" aria-expanded=\"true\">Profile</a></li>\r\n                <li class=\"disabled\"><a>Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#dropdown1\" data-toggle=\"tab\">Action</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#dropdown2\" data-toggle=\"tab\">Another action</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n              <div id=\"myTabContent\" class=\"tab-content\">\r\n                <div class=\"tab-pane fade\" id=\"home\">\r\n                  <p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade active in\" id=\"profile\">\r\n                  <p>Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade\" id=\"dropdown1\">\r\n                  <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney\'s organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>\r\n                </div>\r\n                <div class=\"tab-pane fade\" id=\"dropdown2\">\r\n                  <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-pills\">Pills</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills\">\r\n                <li class=\"active\"><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Profile</a></li>\r\n                <li class=\"disabled\"><a href=\"#\">Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n            <br>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills nav-stacked\">\r\n                <li class=\"active\"><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Profile</a></li>\r\n                <li class=\"disabled\"><a href=\"#\">Disabled</a></li>\r\n                <li class=\"dropdown\">\r\n                  <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n                    Dropdown <span class=\"caret\"></span>\r\n                  </a>\r\n                  <ul class=\"dropdown-menu\">\r\n                    <li><a href=\"#\">Action</a></li>\r\n                    <li><a href=\"#\">Another action</a></li>\r\n                    <li><a href=\"#\">Something else here</a></li>\r\n                    <li class=\"divider\"></li>\r\n                    <li><a href=\"#\">Separated link</a></li>\r\n                  </ul>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"nav-breadcrumbs\">Breadcrumbs</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"breadcrumb\">\r\n                <li class=\"active\">Home</li>\r\n              </ul>\r\n\r\n              <ul class=\"breadcrumb\">\r\n                <li><a href=\"#\">Home</a></li>\r\n                <li class=\"active\">Library</li>\r\n              </ul>\r\n\r\n              <ul class=\"breadcrumb\">\r\n                <li><a href=\"#\">Home</a></li>\r\n                <li><a href=\"#\">Library</a></li>\r\n                <li class=\"active\">Data</li>\r\n              </ul>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"pagination\">Pagination</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"pagination\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">4</a></li>\r\n                <li><a href=\"#\">5</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pagination pagination-lg\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pagination pagination-sm\">\r\n                <li class=\"disabled\"><a href=\"#\">«</a></li>\r\n                <li class=\"active\"><a href=\"#\">1</a></li>\r\n                <li><a href=\"#\">2</a></li>\r\n                <li><a href=\"#\">3</a></li>\r\n                <li><a href=\"#\">4</a></li>\r\n                <li><a href=\"#\">5</a></li>\r\n                <li><a href=\"#\">»</a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2 id=\"pager\">Pager</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"pager\">\r\n                <li><a href=\"#\">Previous</a></li>\r\n                <li><a href=\"#\">Next</a></li>\r\n              </ul>\r\n\r\n              <ul class=\"pager\">\r\n                <li class=\"previous disabled\"><a href=\"#\">← Older</a></li>\r\n                <li class=\"next\"><a href=\"#\">Newer →</a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Indicators\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"indicators\">Indicators</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Alerts</h2>\r\n            <div class=\"bs-component\">\r\n              <div class=\"alert alert-dismissible alert-warning\">\r\n                <button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>\r\n                <h4>Warning!</h4>\r\n                <p>Best check yo self, you\'re not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, <a href=\"#\" class=\"alert-link\">vel scelerisque nisl consectetur et</a>.</p>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              \r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <h2>Labels</h2>\r\n            <div class=\"bs-component\" style=\"margin-bottom: 40px;\">\r\n              <span class=\"label label-default\">Default</span>\r\n              <span class=\"label label-primary\">Primary</span>\r\n              <span class=\"label label-success\">Success</span>\r\n              <span class=\"label label-warning\">Warning</span>\r\n              <span class=\"label label-danger\">Danger</span>\r\n              <span class=\"label label-info\">Info</span>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <h2>Badges</h2>\r\n            <div class=\"bs-component\">\r\n              <ul class=\"nav nav-pills\">\r\n                <li class=\"active\"><a href=\"#\">Home <span class=\"badge\">42</span></a></li>\r\n                <li><a href=\"#\">Profile <span class=\"badge\"></span></a></li>\r\n                <li><a href=\"#\">Messages <span class=\"badge\">3</span></a></li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Progress bars\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"progress-bars\">Progress bars</h1>\r\n            </div>\r\n\r\n            <h3 id=\"progress-basic\">Basic</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar\" style=\"width: 60%;\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-alternatives\">Contextual alternatives</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-info\" style=\"width: 20%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 40%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 60%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 80%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-striped\">Striped</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-info\" style=\"width: 20%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 40%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 60%\"></div>\r\n              </div>\r\n\r\n              <div class=\"progress progress-striped\">\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 80%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-animated\">Animated</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress progress-striped active\">\r\n                <div class=\"progress-bar\" style=\"width: 45%\"></div>\r\n              </div>\r\n            </div>\r\n\r\n            <h3 id=\"progress-stacked\">Stacked</h3>\r\n            <div class=\"bs-component\">\r\n              <div class=\"progress\">\r\n                <div class=\"progress-bar progress-bar-success\" style=\"width: 35%\"></div>\r\n                <div class=\"progress-bar progress-bar-warning\" style=\"width: 20%\"></div>\r\n                <div class=\"progress-bar progress-bar-danger\" style=\"width: 10%\"></div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Containers\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"containers\">Containers</h1>\r\n            </div>\r\n            <div class=\"bs-component\">\r\n              <div class=\"jumbotron\">\r\n                <h1>Jumbotron</h1>\r\n                <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>\r\n                <p><a class=\"btn btn-primary btn-lg\">Learn more</a></p>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>List groups</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <ul class=\"list-group\">\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">14</span>\r\n                  Cras justo odio\r\n                </li>\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">2</span>\r\n                  Dapibus ac facilisis in\r\n                </li>\r\n                <li class=\"list-group-item\">\r\n                  <span class=\"badge\">1</span>\r\n                  Morbi leo risus\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"list-group\">\r\n                <a href=\"#\" class=\"list-group-item active\">\r\n                  Cras justo odio\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">Dapibus ac facilisis in\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">Morbi leo risus\r\n                </a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"list-group\">\r\n                <a href=\"#\" class=\"list-group-item\">\r\n                  <h4 class=\"list-group-item-heading\">List group item heading</h4>\r\n                  <p class=\"list-group-item-text\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\r\n                </a>\r\n                <a href=\"#\" class=\"list-group-item\">\r\n                  <h4 class=\"list-group-item-heading\">List group item heading</h4>\r\n                  <p class=\"list-group-item-text\">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>\r\n                </a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Panels</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-body\">\r\n                  Basic panel\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-heading\">Panel heading</div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-default\">\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n                <div class=\"panel-footer\">Panel footer</div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-primary\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel primary</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-success\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel success</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-warning\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel warning</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"panel panel-danger\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel danger</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n\r\n              <div class=\"panel panel-info\">\r\n                <div class=\"panel-heading\">\r\n                  <h3 class=\"panel-title\">Panel info</h3>\r\n                </div>\r\n                <div class=\"panel-body\">\r\n                  Panel content\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <h2>Wells</h2>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well\">\r\n                Look, I\'m in a well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well well-sm\">\r\n                Look, I\'m in a small well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-4\">\r\n            <div class=\"bs-component\">\r\n              <div class=\"well well-lg\">\r\n                Look, I\'m in a large well!\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <!-- Dialogs\r\n      ================================================== -->\r\n      <div class=\"bs-docs-section\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-12\">\r\n            <div class=\"page-header\">\r\n              <h1 id=\"dialogs\">Dialogs</h1>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-6\">\r\n            <h2>Modals</h2>\r\n            <div class=\"bs-component\">\r\n              <div class=\"modal\">\r\n                <div class=\"modal-dialog\">\r\n                  <div class=\"modal-content\">\r\n                    <div class=\"modal-header\">\r\n                      <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n                      <h4 class=\"modal-title\">Modal title</h4>\r\n                    </div>\r\n                    <div class=\"modal-body\">\r\n                      <p>One fine body…</p>\r\n                    </div>\r\n                    <div class=\"modal-footer\">\r\n                      <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\r\n                      <button type=\"button\" class=\"btn btn-primary\">Save changes</button>\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"col-lg-6\">\r\n            <h2>Popovers</h2>\r\n            <div class=\"bs-component\">\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"left\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Left</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"top\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Top</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"Vivamus\r\n              sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Bottom</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"right\" data-content=\"Vivamus sagittis lacus vel augue laoreet rutrum faucibus.\" data-original-title=\"\" title=\"\">Right</button>\r\n            </div>\r\n            <h2>Tooltips</h2>\r\n            <div class=\"bs-component\">\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"left\" title=\"\" data-original-title=\"Tooltip on left\">Left</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"\" data-original-title=\"Tooltip on top\">Top</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"\" data-original-title=\"Tooltip on bottom\">Bottom</button>\r\n\r\n              <button type=\"button\" class=\"btn btn-default\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"\" data-original-title=\"Tooltip on right\">Right</button>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      <div id=\"source-modal\" class=\"modal fade\" style=\"display: none;\">\r\n        <div class=\"modal-dialog modal-lg\">\r\n          <div class=\"modal-content\">\r\n            <div class=\"modal-header\">\r\n              <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n              <h4 class=\"modal-title\">Source Code</h4>\r\n            </div>\r\n            <div class=\"modal-body\">\r\n              <pre>&lt;ul class=\"nav nav-tabs\"&gt;\r\n  &lt;li class=\"\"&gt;&lt;a href=\"#home\" data-toggle=\"tab\" aria-expanded=\"false\"&gt;Home&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"active\"&gt;&lt;a href=\"#profile\" data-toggle=\"tab\" aria-expanded=\"true\"&gt;Profile&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"disabled\"&gt;&lt;a&gt;Disabled&lt;/a&gt;&lt;/li&gt;\r\n  &lt;li class=\"dropdown open\"&gt;\r\n    &lt;a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"true\"&gt;\r\n      Dropdown &lt;span class=\"caret\"&gt;&lt;/span&gt;\r\n    &lt;/a&gt;\r\n    &lt;ul class=\"dropdown-menu\"&gt;\r\n      &lt;li&gt;&lt;a href=\"#dropdown1\" data-toggle=\"tab\"&gt;Action&lt;/a&gt;&lt;/li&gt;\r\n      &lt;li class=\"divider\"&gt;&lt;/li&gt;\r\n      &lt;li&gt;&lt;a href=\"#dropdown2\" data-toggle=\"tab\"&gt;Another action&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n  &lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;div id=\"myTabContent\" class=\"tab-content\"&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"home\"&gt;\r\n    &lt;p&gt;Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade active in\" id=\"profile\"&gt;\r\n    &lt;p&gt;Food truck fixie locavore, accusamus mcsweeney\'s marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"dropdown1\"&gt;\r\n    &lt;p&gt;Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney\'s organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=\"tab-pane fade\" id=\"dropdown2\"&gt;\r\n    &lt;p&gt;Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.&lt;/p&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;</pre>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n\r\n      \r\n\r\n\r\n    </div>', '');
INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`, `pre_html`, `post_html`) VALUES
(14, '2018-03-10 00:20:01', '2018-03-23 15:56:18', 1, 7, NULL, '', ''),
(15, '2018-03-19 16:04:00', '2018-03-19 17:01:12', 1, 8, '{{ doctor:listing order_by=&quot;id&quot; order=&quot;asc&quot;&nbsp; }}<br />\r\n&nbsp; {{ id }} {{ name }} {{ area_name }} {{ town }}<br />\r\n<br />\r\n&nbsp;{{ /doctor:listing }}', '', ''),
(16, '2018-03-19 16:49:57', '2018-03-19 17:00:47', 1, 9, '{{ doctor:show id={url:segments segment=&quot;2&quot;} }}<br />\r\n&nbsp; {{ id }} {{ name }} {{ area_name }} {{ town }}<br />\r\n&nbsp;{{ /doctor:show }}', '{{ url:segments segment=\"1\" }}\r\n{{ url:segments segment=\"2\" }}\r\n{{ url:segments segment=\"3\" }}', ''),
(17, '2018-03-20 02:36:25', '2018-03-20 03:49:12', 1, 10, '<br />\r\n<canvas :netbeans_generated=\"true\" height=\"400\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"1214\"></canvas><canvas :netbeans_generated=\"true\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\"></canvas><canvas :netbeans_generated=\"true\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\"></canvas>', '{{ pages:page_tree start-id=\"17\" disable-levels=\"rdv-passes|mes-rdv-passes|rdv-passes-de-mes-proches\" }}', '{{ pages:page_tree start-id=\"17\" disable-levels=\"rdv-a-venir|mes-rdv-a-venir|rdv-a-venir-de-mes-proches\" }}'),
(18, '2018-03-20 02:36:59', '2018-03-21 02:15:12', 1, 11, '<canvas :netbeans_generated=\"true\" height=\"400\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"1214\"></canvas>', '{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"futur\" other_person=\"no\" }} \r\n\r\n<div class=\"panel panel-default panel-success\">\r\n		<div class=\"panel-heading\"> \r\n			<h4>\r\n				Le\r\n				 {{date_day_str}}  {{date_month_str}}  \r\n				à\r\n			</h4>\r\n			 [{{appointment_time}}   - \r\n			 doc {{doctor_id}} user {{user_id}}]\r\n		</div>\r\n		<div class=\"panel-body\">   \r\n		\r\n							{{ if filename }}\r\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ elseif doc_speciality  }} \r\n                                {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"ORL\" }}\r\n                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                {{ else }} \r\n                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                {{ endif }} \r\n                            {{ else }} \r\n                            {{# default image #}}\r\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ endif }}\r\n							\r\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n				 <br /> \r\n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n				 <br /> \r\n				{{gender}}  \r\n				 {{first_name}}  \r\n				 {{last_name}}   \r\n				 <br /> \r\n			Le\r\n			 {{appointment_date}}  \r\n			à\r\n			 {{appointment_time}}\r\n			 \r\n			<div class=\"center-block\"> \r\n				<a class=\"btn btn-danger \" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \r\n			</div> 		 \r\n		</div>\r\n</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n', ''),
(19, '2018-03-20 02:37:22', '2018-03-21 01:57:49', 1, 12, '<canvas :netbeans_generated=\"true\" height=\"0\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\" width=\"0\"></canvas>', '{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"futur\" other_person=\"yes\" }} \r\n\r\n<div class=\"panel panel-default panel-success\">\r\n		<div class=\"panel-heading\"> \r\n			<h4>\r\n				Le\r\n				 {{date_day_str}}  {{date_month_str}}  \r\n				à\r\n			</h4>\r\n			 [{{appointment_time}}   - \r\n			 doc {{doctor_id}} user {{user_id}}]\r\n		</div>\r\n		<div class=\"panel-body\">   \r\n		\r\n							{{ if filename }}\r\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ elseif doc_speciality  }} \r\n                                {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"ORL\" }}\r\n                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                {{ else }} \r\n                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                {{ endif }} \r\n                            {{ else }} \r\n                            {{# default image #}}\r\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ endif }}\r\n							\r\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n				 <br /> \r\n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n				 <br /> \r\n				{{gender}}  \r\n				 {{first_name}}  \r\n				 {{last_name}}   \r\n				 <br /> \r\n			Le\r\n			 {{appointment_date}}  \r\n			à\r\n			 {{appointment_time}}\r\n			<div class=\"center-block\"> \r\n				<a class=\"btn btn-danger center-block\" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \r\n			</div> \r\n		</div>\r\n</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n', ''),
(20, '2018-03-20 02:38:05', '2018-03-21 03:20:27', 1, 13, '<canvas :netbeans_generated=\"true\" id=\"netbeans_glasspane\" style=\"position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;\"></canvas>', '{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"past\" other_person=\"[[ if page:slug == \'rdv-passes\' ]][[ elseif page:slug == \'rdv-passes-de-mes-proches\' ]]yes[[ else ]]no[[ endif ]]\"  }} \r\n\r\n<div class=\"panel panel-default \">\r\n		<div class=\"panel-heading\"> \r\n			<h4>\r\n				Le\r\n				 {{date_day_str}}  {{date_month_str}}  \r\n				à\r\n			</h4>\r\n			 [{{appointment_time}}   - \r\n			 doc {{doctor_id}} user {{user_id}}]\r\n		</div>\r\n		<div class=\"panel-body\">   \r\n		\r\n							{{ if filename }}\r\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ elseif doc_speciality  }} \r\n                                {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"ORL\" }}\r\n                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                {{ else }} \r\n                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                {{ endif }} \r\n                            {{ else }} \r\n                            {{# default image #}}\r\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ endif }}\r\n							\r\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n				 <br /> \r\n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n				 <br /> \r\n				{{gender}}  \r\n				 {{first_name}}  \r\n				 {{last_name}}   \r\n				 <br /> \r\n			Le\r\n			 {{appointment_date}}  \r\n			à\r\n			 {{appointment_time}}\r\n			 \r\n			<div class=\"center-block\"> \r\n				<a class=\"btn btn-info \"  href=\"{{url:site}}calendar/doctor/{{id}}\">Reprendre ce RDV</a>			 \r\n			</div> 		 	 \r\n		</div>\r\n</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n', ''),
(21, '2018-03-20 02:38:27', '2018-03-21 03:20:51', 1, 14, NULL, '{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"past\" other_person=\"[[ if page:slug == \'rdv-passes\' ]][[ elseif page:slug == \'rdv-passes-de-mes-proches\' ]]yes[[ else ]]no[[ endif ]]\"  }} \r\n\r\n<div class=\"panel panel-default \">\r\n		<div class=\"panel-heading\"> \r\n			<h4>\r\n				Le\r\n				 {{date_day_str}}  {{date_month_str}}  \r\n				à\r\n			</h4>\r\n			 [{{appointment_time}}   - \r\n			 doc {{doctor_id}} user {{user_id}}]\r\n		</div>\r\n		<div class=\"panel-body\">   \r\n		\r\n							{{ if filename }}\r\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ elseif doc_speciality  }} \r\n                                {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"ORL\" }}\r\n                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                {{ else }} \r\n                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                {{ endif }} \r\n                            {{ else }} \r\n                            {{# default image #}}\r\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ endif }}\r\n							\r\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n				 <br /> \r\n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n				 <br /> \r\n				{{gender}}  \r\n				 {{first_name}}  \r\n				 {{last_name}}   \r\n				 <br /> \r\n			Le\r\n			 {{appointment_date}}  \r\n			à\r\n			 {{appointment_time}}\r\n			 \r\n			<div class=\"center-block\"> \r\n				<a class=\"btn btn-info \"  href=\"{{url:site}}calendar/doctor/{{id}}\">Reprendre ce RDV</a>			 \r\n			</div> 		 	 \r\n		</div>\r\n</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n', ''),
(22, '2018-03-20 03:33:50', '2018-03-21 02:17:47', 1, 15, NULL, '{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"futur\"  }} \r\n\r\n<div class=\"panel panel-default panel-success\">\r\n		<div class=\"panel-heading\"> \r\n			<h4>\r\n				Le\r\n				 {{date_day_str}}  {{date_month_str}}  \r\n				à\r\n			</h4>\r\n			 [{{appointment_time}}   - \r\n			 doc {{doctor_id}} user {{user_id}}]\r\n		</div>\r\n		<div class=\"panel-body\">   \r\n		\r\n							{{ if filename }}\r\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ elseif doc_speciality  }} \r\n                                {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"ORL\" }}\r\n                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                {{ else }} \r\n                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                {{ endif }} \r\n                            {{ else }} \r\n                            {{# default image #}}\r\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ endif }}\r\n							\r\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n				 <br /> \r\n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n				 <br /> \r\n				{{gender}}  \r\n				 {{first_name}}  \r\n				 {{last_name}}   \r\n				 <br /> \r\n			Le\r\n			 {{appointment_date}}  \r\n			à\r\n			 {{appointment_time}}\r\n			 \r\n			<div class=\"center-block\"> \r\n				<a class=\"btn btn-danger \" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \r\n			</div> 		 		 \r\n		</div>\r\n</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n', ''),
(23, '2018-03-20 03:34:47', '2018-03-21 03:19:21', 1, 16, NULL, '{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"past\" other_person=\"[[ if page:slug == \'rdv-passes\' ]][[ elseif page:slug == \'rdv-passes-de-mes-proches\'  ]]yes[[ else ]]no[[ endif ]]\"  }} \r\n\r\n<div class=\"panel panel-default \">\r\n		<div class=\"panel-heading\"> \r\n			<h4>\r\n				Le\r\n				 {{date_day_str}}  {{date_month_str}}  \r\n				à\r\n			</h4>\r\n			 [{{appointment_time}}   - \r\n			 doc {{doctor_id}} user {{user_id}}]\r\n		</div>\r\n		<div class=\"panel-body\">   \r\n		\r\n							{{ if filename }}\r\n                                <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ elseif doc_speciality  }} \r\n                                {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"ORL\" }}\r\n                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                {{ else }} \r\n                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                {{ endif }} \r\n                            {{ else }} \r\n                            {{# default image #}}\r\n                                <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                            {{ endif }}\r\n							\r\n				{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n				 <br /> \r\n				{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n				 <br /> \r\n				{{gender}}  \r\n				 {{first_name}}  \r\n				 {{last_name}}   \r\n				 <br /> \r\n			Le\r\n			 {{appointment_date}}  \r\n			à\r\n			 {{appointment_time}}\r\n			 \r\n			<div class=\"center-block\"> \r\n				<a class=\"btn btn-info \"  href=\"{{url:site}}calendar/doctor/{{id}}\">Reprendre ce RDV</a>			 \r\n			</div> 		 	 \r\n		</div>\r\n</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n', ''),
(24, '2018-03-23 01:00:49', '2018-03-24 00:27:14', 1, 17, NULL, '', ''),
(25, '2018-03-27 19:26:58', '2018-03-27 20:20:22', 1, 18, NULL, '<p id=\"msg\" class=\"text-center\"></p>\n<div id=\"position\" class=\"form-group text-center col-sm-6 col-sm-offset-3\">\n	<label for=\"position\">Position</label>\n	<div class=\"input\">\n		<input class=\"form-control\" name=\"position\" type=\"text\" onfocus=\"this.select()\" />\n	</div>\n	<button onclick=\"geoGetPosition()\" class=\"btn btn-default\"><i class=\"glyphicon glyphicon-map-marker\"></i> Position\n	</button> \n</div> \n', '');

-- --------------------------------------------------------

--
-- Structure de la table `default_doctor_categories`
--

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
(13, '2018-03-15 03:01:24', '2018-03-19 11:55:32', 1, 13, 'Dr Ari Elhyani Dentiste Paris', '1\n2\n3\n4\n5', NULL, '0900', '1930', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lorem neque, cursus nec blandit vel, blandit eu libero. Phasellus orci felis, congue non tortor ut, sollicitudin fermentum metus', '0678957826', '0678957826', 'email@nowhere.com', '11 Avenue de l\'Opéra', '75001', 'Paris', 'dummy', 6, NULL),
(14, '2018-03-15 03:02:27', '2018-03-19 20:51:59', 1, 14, 'Dr Fabien Mauro', '1\n2\n3\n4\n5\n6', NULL, '0900', '2000', NULL, 'Nam sit amet semper purus. Maecenas massa ante, ultrices vulputate venenatis sit amet, consequat a mi. Nam gravida ex et hendrerit lacinia.', '0678957826', '0678957826', 'email@nowhere.com', '18 Rue de Turbigo', '75002', 'Paris', '699df7530ec4c93', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `default_doctor_organisations`
--

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
(42, 'appointments-deleted-admin', 'Appointments deleted admin', 'Email envoyé à l\'admin après annulation d\'un RDV', '{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Annulation de {{user_data:display_name}} ', '<h2>Le RDV de {{user_data:display_name}} | {{appointment_data:email}} a été annulé!</h2>\r\n                                                    <h3>Date de RDV: {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} </h3> \r\n                                                    <p> \r\n                                                    N° RDV: {{appointment_id}} - {{ admin_url }}<br />\r\n                                                    <a href=\"{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}\" target=\"_blank\">\r\n                                                    Voir les RDV du {{appointment_data:appointment_date}}\r\n                                                    </a>\r\n                                                    <br />\r\n                                                    <a href=\"{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}\" target=\"_blank\">\r\n                                                    Voir les RDV {{user_data:display_name}}\r\n                                                    </a>\r\n                                                    <br />\r\n                                                    RDV pris le {{ helper:date format=\"%d %b %Y à %H:%M:%S\" timestamp={appointment_data:appointment_date} }}\r\n                                                    </p> \r\n                                                    <p> \r\n                                                    User ID: {{ appointment_data:user_id }}<br />\r\n                                                    IP Address: {{ sender_ip }}<br />\r\n                                                    Operating System: {{ sender_os }}<br />\r\n                                                    User Agent: {{ sender_agent }}<br />\r\n                                                    </p> ', 'fr', 0, 'appointments'),
(41, 'appointments-modified-admin', 'Appointments modified admin ', 'Email envoyé à l\'admin après modification d\'un RDV', '{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} - Modification par {{user_data:display_name}}', '<h2>Le RDV de {{user_data:display_name}}</h2>\r\n                                                        <h3>Date du RDV: {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}  </h3> \r\n                                                        <p>\r\n                                                        Adresse:<br /> \r\n                                                        {{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}<br />\r\n                                                        <a href=\"https://maps.google.fr/maps/search/{{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}\" target=\"_blank\">Voir sur Google</a><br />\r\n                                                        Contact :<br />\r\n                                                        <a href=\"tel:{{appointment_data:phone}}\">{{appointment_data:phone}} </a> - <a href=\"tel:{{appointment_data:mobile}}\">{{appointment_data:mobile}} </a> - <a href=\"mailto:{{appointment_data:email}}\">{{appointment_data:email}} </a><br />\r\n                                                        </p>  \r\n                                                        <p>\r\n                                                        Message du client<br />\r\n                                                        {{appointment_data:message}}\r\n                                                        </p> \r\n                                                        <p>\r\n                                                        User ID: {{ appointment_data:user_id }}<br />\r\n                                                        IP Address: {{ sender_ip }}<br />\r\n                                                        Operating System: {{ sender_os }}<br />\r\n                                                        User Agent: {{ sender_agent }}<br />\r\n                                                        </p>\r\n                                            ', 'fr', 0, 'appointments'),
(40, 'appointments-patient', 'Appointment mail for patient', 'Email au patient suite à une prise de RDV par le patient', 'Votre RDV du {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}', '<p>Bonjour {{user_data:display_name}}\r\n                                                    <br/>\r\n                                                    Vous avez effectué une prise de RDV pour le {{ helper:date format=\"%A %e %b %Y à %R\" timestamp=appointment_data:appointment_date }}\r\n                                                    </p>\r\n\r\n                                                    <h2>Date du RDV{{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }}</h2>\r\n                                                    <h3>Heure du RDV {{ appointment_data:appointment_time }}</h3>\r\n  \r\n                                                    <p>\r\n                                                    <a href=\"{{url:site}}appointments/view/{{appointment_id}}\" target=\"_blank\">Vous pouvez voir votre RDV içi</a><br />\r\n                                                    <br />\r\n                                                    Merci pour votre confiance.\r\n                                                    </p>\r\n                                                    <p> \r\n                                                    User ID: {{ appointment_data:user_id }}<br />\r\n                                                    IP Address: {{ sender_ip }}<br />\r\n                                                    Operating System: {{ sender_os }}<br />\r\n                                                    User Agent: {{ sender_agent }}\r\n                                            ', 'fr', 0, 'appointments'),
(39, 'appointments-admin', 'Appointments admin', 'Email admin suite a prise de RDV', 'RDV le {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Patient: {{user_data:display_name}}', '<p>Un nouveau RDV pour {{user_data:display_name}} | {{appointment_data:email}}</p>\r\n                                                        <h2>Date de livraison {{ helper:date format=\"%A %e %b %Y\" timestamp=appointment_data:appointment_date }}</h2>\r\n                                                        <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>\r\n\r\n                                                        <p> \r\n                                                        <a href=\"https://maps.google.fr/maps/search/{{appointment_data:street}}, {{appointment_data:area_name}} {{appointment_data:town}}\" target=\"_blank\">Voir sur Google</a><br />\r\n                                                        Contact :<br />\r\n                                                        <a href=\"tel:{{appointment_data:phone}}\">{{appointment_data:phone}} </a> - <a href=\"tel:{{appointment_data:mobile}}\">{{appointment_data:mobile}} </a> - <a href=\"mailto:{{appointment_data:email}}\">{{appointment_data:email}} </a><br />\r\n                                                        </p>    \r\n                                                        <p>\r\n                                                        N° RDV: {{appointment_id}} {{ admin_url }}<br />\r\n                                                        <a href=\"{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}\" target=\"_blank\">\r\n                                                        Voir les RDV du {{appointment_data:appointment_date}}\r\n                                                        </a>\r\n                                                        <br />\r\n                                                        <a href=\"{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}\" target=\"_blank\">\r\n                                                        Voir les commandes de {{user_data:display_name}}\r\n                                                        </a>\r\n                                                        <br />\r\n                                                        RDV pris le {{ helper:date format=\"%d %b %Y à %H:%M:%S\" timestamp=appointment_data:appointment_date }}\r\n                                                        </p>\r\n                                                        <p>\r\n                                                        User ID: {{ appointment_data:user_id }}<br />\r\n                                                        IP Address: {{ sender_ip }}<br />\r\n                                                        Operating System: {{ sender_os }}<br />\r\n                                                        User Agent: {{ sender_agent }}\r\n                                                        </p>', 'fr', 0, 'appointments');

-- --------------------------------------------------------

--
-- Structure de la table `default_files`
--

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
('28bf736b0c65fb4', 1, 1, 'i', 'dentiste.jpg', 'a3866e075f0030d3afccf510bc6acd3a.jpg', '{{ url:site }}files/large/a3866e075f0030d3afccf510bc6acd3a.jpg', '', '.jpg', 'image/jpeg', '', 160, 160, 3, '', 0, 1521547035, 0);

-- --------------------------------------------------------

--
-- Structure de la table `default_file_folders`
--

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

CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_keywords_applied`
--

CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_migrations`
--

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
(1, 'a:25:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fa\";s:14:\"تنظیمات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"tw\";s:12:\"網站設定\";s:2:\"cn\";s:12:\"网站设定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fa\";s:105:\"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:118:\"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"tw\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"cn\";s:99:\"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}', 1, 0, 1, 'settings', 1, 1, 1, 1520614946),
(2, 'a:11:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";s:2:\"tw\";s:14:\"Streams 核心\";s:2:\"cn\";s:14:\"Streams 核心\";s:2:\"ar\";s:31:\"الجداول الأساسية\";s:2:\"it\";s:12:\"Streams Core\";s:2:\"fa\";s:26:\"هسته استریم ها\";s:2:\"fi\";s:13:\"Striimit ydin\";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";s:2:\"tw\";s:29:\"Streams 核心資料模組。\";s:2:\"cn\";s:29:\"Streams 核心资料模组。\";s:2:\"ar\";s:57:\"وحدة البيانات الأساسية للجداول\";s:2:\"it\";s:17:\"Core dello Stream\";s:2:\"fa\";s:48:\"ماژول مرکزی برای استریم ها\";s:2:\"fi\";s:48:\"Ydin datan hallinoiva moduuli striimejä varten.\";}', 1, 0, 0, '0', 1, 1, 1, 1520614946),
(3, 'a:21:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fa\";s:26:\"قالب های ایمیل\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"tw\";s:12:\"郵件範本\";s:2:\"cn\";s:12:\"邮件范本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}', 'templates', '1.1.1', NULL, 'a:21:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fa\";s:92:\"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"tw\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"cn\";s:61:\"新增、编辑与储存可显示动态资料的 email 范本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}', 1, 0, 1, 'structure', 1, 1, 1, 1520614946),
(4, 'a:25:{s:2:\"en\";s:7:\"Add-ons\";s:2:\"ar\";s:16:\"الإضافات\";s:2:\"br\";s:12:\"Complementos\";s:2:\"pt\";s:12:\"Complementos\";s:2:\"cs\";s:8:\"Doplňky\";s:2:\"da\";s:7:\"Add-ons\";s:2:\"de\";s:13:\"Erweiterungen\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:9:\"Agregados\";s:2:\"fa\";s:17:\"افزونه ها\";s:2:\"fi\";s:9:\"Lisäosat\";s:2:\"fr\";s:10:\"Extensions\";s:2:\"he\";s:12:\"תוספות\";s:2:\"id\";s:7:\"Pengaya\";s:2:\"it\";s:7:\"Add-ons\";s:2:\"lt\";s:7:\"Priedai\";s:2:\"nl\";s:7:\"Add-ons\";s:2:\"pl\";s:12:\"Rozszerzenia\";s:2:\"ru\";s:20:\"Дополнения\";s:2:\"sl\";s:11:\"Razširitve\";s:2:\"tw\";s:12:\"附加模組\";s:2:\"cn\";s:12:\"附加模组\";s:2:\"hu\";s:14:\"Bővítmények\";s:2:\"th\";s:27:\"ส่วนเสริม\";s:2:\"se\";s:8:\"Tillägg\";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fa\";s:93:\"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"tw\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"cn\";s:54:\"管理员可以检视目前已经安装模组的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}', 0, 0, 1, '0', 1, 1, 1, 1520614946),
(5, 'a:17:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}', 1, 1, 1, 'content', 1, 1, 1, 1520614946),
(6, 'a:25:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"fa\";s:10:\"نظرات\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"tw\";s:6:\"回應\";s:2:\"cn\";s:6:\"回应\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fa\";s:168:\"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"tw\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"cn\";s:75:\"用户和访客可以针对新闻、页面与照片等内容发表回应。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}', 0, 0, 1, 'content', 1, 1, 1, 1520614946),
(7, 'a:25:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fa\";s:18:\"تماس با ما\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"tw\";s:12:\"聯絡我們\";s:2:\"cn\";s:12:\"联络我们\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"fa\";s:239:\"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"tw\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"cn\";s:147:\"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}', 0, 0, 0, '0', 1, 1, 1, 1520614946),
(8, 'a:24:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fa\";s:13:\"فایل ها\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"tw\";s:6:\"檔案\";s:2:\"cn\";s:6:\"档案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}', 'files', '2.0.0', NULL, 'a:24:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fa\";s:79:\"مدیریت فایل های چند رسانه ای و فولدر ها سایت\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"tw\";s:33:\"管理網站中的檔案與目錄\";s:2:\"cn\";s:33:\"管理网站中的档案与目录\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}', 0, 0, 1, 'content', 1, 1, 1, 1520614946),
(9, 'a:24:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fa\";s:13:\"گروه ها\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"tw\";s:6:\"群組\";s:2:\"cn\";s:6:\"群组\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fa\";s:149:\"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"tw\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"cn\";s:45:\"用户可以依群组分类并管理其权限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}', 0, 0, 1, 'users', 1, 1, 1, 1520614946),
(10, 'a:17:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fa\";s:21:\"کلمات کلیدی\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"tw\";s:6:\"鍵詞\";s:2:\"cn\";s:6:\"键词\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fa\";s:110:\"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"tw\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"cn\";s:64:\"集中管理可用于标题与内容的键词(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}', 0, 0, 1, 'data', 1, 1, 1, 1520614946),
(11, 'a:15:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fa\";s:15:\"نگه داری\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"it\";s:12:\"Manutenzione\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"tw\";s:6:\"維護\";s:2:\"cn\";s:6:\"维护\";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"it\";s:65:\"Gestisci la cache del sito e esporta le informazioni dal database\";s:2:\"fa\";s:73:\"مدیریت کش سایت و صدور اطلاعات از دیتابیس\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"tw\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"cn\";s:45:\"经由管理介面手动删除暂存资料。\";}', 0, 0, 1, 'data', 1, 1, 1, 1520614946),
(12, 'a:25:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fa\";s:11:\"منو ها\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"tw\";s:12:\"導航選單\";s:2:\"cn\";s:12:\"导航选单\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fa\";s:68:\"مدیریت منو ها و گروه های مربوط به آنها\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"tw\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"cn\";s:72:\"管理导航选单中的连结，以及它们所隶属的导航群组。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";}', 0, 0, 1, 'structure', 1, 1, 1, 1520614946),
(13, 'a:25:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fa\";s:14:\"صفحه ها \";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"tw\";s:6:\"頁面\";s:2:\"cn\";s:6:\"页面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fa\";s:96:\"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"tw\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"cn\";s:39:\"为您的网站新增自定的页面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}', 1, 1, 1, 'content', 1, 1, 1, 1520614946),
(14, 'a:25:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fa\";s:15:\"اجازه ها\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"tw\";s:6:\"權限\";s:2:\"cn\";s:6:\"权限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fa\";s:59:\"مدیریت اجازه های گروه های کاربری\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"tw\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"cn\";s:81:\"用来控制不同类别的用户，设定其浏览特定网站内容的权限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}', 0, 0, 1, 'users', 1, 1, 1, 1520614946),
(15, 'a:24:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fa\";s:17:\"انتقال ها\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"tw\";s:6:\"轉址\";s:2:\"cn\";s:6:\"转址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"pl\";s:14:\"Przekierowania\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fa\";s:63:\"انتقال دادن یک صفحه به یک آدرس دیگر\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"tw\";s:33:\"將網址轉址、重新定向。\";s:2:\"cn\";s:33:\"将网址转址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"pl\";s:44:\"Przekierowanie z jednego adresu URL na inny.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}', 0, 0, 1, 'structure', 1, 1, 1, 1520614946),
(16, 'a:10:{s:2:\"en\";s:6:\"Search\";s:2:\"br\";s:7:\"Procura\";s:2:\"fr\";s:9:\"Recherche\";s:2:\"se\";s:4:\"Sök\";s:2:\"ar\";s:10:\"البحث\";s:2:\"tw\";s:6:\"搜尋\";s:2:\"cn\";s:6:\"搜寻\";s:2:\"it\";s:7:\"Ricerca\";s:2:\"fa\";s:10:\"جستجو\";s:2:\"fi\";s:4:\"Etsi\";}', 'search', '1.0.0', NULL, 'a:10:{s:2:\"en\";s:72:\"Search through various types of content with this modular search system.\";s:2:\"br\";s:73:\"Procure por vários tipos de conteúdo com este sistema de busca modular.\";s:2:\"fr\";s:84:\"Rechercher parmi différents types de contenus avec système de recherche modulaire.\";s:2:\"se\";s:36:\"Sök igenom olika typer av innehåll\";s:2:\"ar\";s:102:\"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.\";s:2:\"tw\";s:63:\"此模組可用以搜尋網站中不同類型的資料內容。\";s:2:\"cn\";s:63:\"此模组可用以搜寻网站中不同类型的资料内容。\";s:2:\"it\";s:71:\"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare\";s:2:\"fa\";s:115:\"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.\";s:2:\"fi\";s:76:\"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.\";}', 0, 0, 0, '0', 1, 1, 1, 1520614946),
(17, 'a:20:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fa\";s:17:\"نقشه سایت\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"tw\";s:12:\"網站地圖\";s:2:\"cn\";s:12:\"网站地图\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fa\";s:150:\"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"tw\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"cn\";s:84:\"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}', 0, 1, 0, 'content', 1, 1, 1, 1520614946),
(18, 'a:25:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fa\";s:14:\"کاربران\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"tw\";s:6:\"用戶\";s:2:\"cn\";s:6:\"用户\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}', 'users', '1.1.0', NULL, 'a:25:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fa\";s:151:\"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"tw\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"cn\";s:87:\"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}', 0, 0, 1, '0', 1, 1, 1, 1520614946),
(19, 'a:25:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fa\";s:16:\"متغییرها\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"tw\";s:12:\"系統變數\";s:2:\"cn\";s:12:\"系统变数\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";s:2:\"hu\";s:10:\"Változók\";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fa\";s:136:\"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:92:\"Gérer des variables globales pour pouvoir y accéder depuis n\'importe quel endroit du site.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"tw\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"cn\";s:45:\"管理此网站内可存取的全局变数。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}', 0, 0, 1, 'data', 1, 1, 1, 1520614946);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(20, 'a:23:{s:2:\"en\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"da\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fa\";s:13:\"ویجت ها\";s:2:\"fi\";s:9:\"Vimpaimet\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"tw\";s:9:\"小組件\";s:2:\"cn\";s:9:\"小组件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";s:2:\"ar\";s:14:\"الودجتس\";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:132:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"ودجتس\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fa\";s:76:\"مدیریت قسمت های کوچکی از سایت به طور مستقل\";s:2:\"fi\";s:81:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Vimpaimia\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"tw\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"cn\";s:103:\"可将小段的程式码透过小组件来管理。即所谓 \"Widgets\"，或称为小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}', 1, 0, 1, 'content', 1, 1, 1, 1520614946),
(21, 'a:10:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"br\";s:7:\"WYSIWYG\";s:2:\"fa\";s:7:\"WYSIWYG\";s:2:\"fr\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";s:2:\"tw\";s:7:\"WYSIWYG\";s:2:\"cn\";s:7:\"WYSIWYG\";s:2:\"ar\";s:27:\"المحرر الرسومي\";s:2:\"it\";s:7:\"WYSIWYG\";}', 'wysiwyg', '1.0.0', NULL, 'a:11:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"br\";s:64:\"Provém o editor WYSIWYG para o PyroCMS fornecido pelo CKEditor.\";s:2:\"fa\";s:73:\"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. \";s:2:\"fr\";s:63:\"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";s:2:\"tw\";s:83:\"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。\";s:2:\"cn\";s:83:\"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。\";s:2:\"ar\";s:76:\"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.\";s:2:\"it\";s:57:\"Fornisce l\'editor WYSIWYG per PtroCMS creato con CKEditor\";}', 0, 0, 0, '0', 1, 1, 1, 1520614946),
(69, 'a:2:{s:2:\"en\";s:7:\"Doctors\";s:2:\"fr\";s:8:\"Docteurs\";}', 'doctor', '0.1.10', NULL, 'a:2:{s:2:\"en\";s:12:\"Doctors list\";s:2:\"fr\";s:18:\"Liste des Docteurs\";}', 0, 1, 1, 'content', 1, 1, 0, 1521461438),
(24, 'a:2:{s:2:\"en\";s:20:\"Calendars(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'calendars', '0.1.0', NULL, 'a:2:{s:2:\"en\";s:16:\"Calendars module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', 0, 1, 1, 'content', 1, 1, 0, 1520995285),
(25, 'a:2:{s:2:\"en\";s:17:\"Orders(Commandes)\";s:2:\"fr\";s:9:\"Commandes\";}', 'orders', '0.73.08', NULL, 'a:2:{s:2:\"en\";s:13:\"Orders module\";s:2:\"fr\";s:19:\"Module de commandes\";}', 0, 1, 1, 'content', 0, 0, 0, 1520994630),
(79, 'a:1:{s:2:\"en\";s:12:\"Token module\";}', 'token', '0.5.01', NULL, 'a:1:{s:2:\"en\";s:16:\"Token management\";}', 0, 1, 1, 'content', 1, 1, 0, 1521961136),
(80, 'a:2:{s:2:\"en\";s:23:\"Appointments(Commandes)\";s:2:\"fr\";s:11:\"Rendez vous\";}', 'appointments', '0.1.20', NULL, 'a:2:{s:2:\"en\";s:19:\"Appointments module\";s:2:\"fr\";s:21:\"Module de rendez vous\";}', 0, 1, 1, 'content', 1, 1, 0, 1522019258),
(53, 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'carte', '0.98', NULL, 'a:1:{s:2:\"fr\";s:28:\"Module de calendrier semaine\";}', 0, 1, 1, 'content', 0, 0, 0, 1521079824),
(70, 'a:1:{s:2:\"fr\";s:9:\"Semainier\";}', 'calendar', '0.1.01', NULL, 'a:1:{s:2:\"fr\";s:18:\"Calendrier semaine\";}', 0, 1, 1, 'content', 1, 1, 0, 1521468454),
(35, 'a:2:{s:2:\"en\";s:8:\"Products\";s:2:\"fr\";s:8:\"Produits\";}', 'products', '0.61.01', NULL, 'a:2:{s:2:\"en\";s:16:\"Products module.\";s:2:\"fr\";s:8:\"Produits\";}', 0, 1, 1, 'content', 0, 0, 0, 1521027755),
(59, 'a:2:{s:2:\"en\";s:6:\"Relays\";s:2:\"fr\";s:13:\"Points Relais\";}', 'relay', '1.0.5', NULL, 'a:2:{s:2:\"en\";s:11:\"Relays list\";s:2:\"fr\";s:23:\"Liste des Points Relais\";}', 0, 1, 1, 'content', 0, 0, 0, 1521196881);

-- --------------------------------------------------------

--
-- Structure de la table `default_navigation_groups`
--

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
(1, 'Home', 0, 'page', 1, '', '', '', 4, 1, '', '0', ''),
(2, 'Blog', 0, 'module', 0, 'blog', '', '', 4, 2, '', '0', ''),
(3, 'Contact', 0, 'page', 2, '', '', '', 3, 1, '', '0', ''),
(10, 'Connexion', NULL, 'uri', 0, '', '', 'users/login', 5, 1, '', '0', ''),
(6, 'Réservation', 0, 'page', 8, '', '', '', 4, 6, '', '0', ''),
(7, 'Livre d\'Or', 0, 'page', 9, '', '', '', 4, 7, '', '0', ''),
(8, 'Accès', 0, 'page', 10, '', '', '', 4, 8, '', '0', ''),
(9, 'Horaires', 0, 'page', 11, '', '', '', 4, 9, '', '0', ''),
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
(25, 'Rendez Vous', 0, 'page', 17, '', '', '', 6, 2, '', '0', ''),
(26, 'Mes RDV à venir', 0, 'page', 18, '', '', '', 6, 3, '', '0', ''),
(27, 'RDV à venir de mes proches', 0, 'page', 19, '', '', '', 6, 5, '', '0', ''),
(28, 'Mes RDV passés', 0, 'page', 20, '', '', '', 6, 7, '', '0', ''),
(29, 'RDV passés de mes proches', 0, 'page', 21, '', '', '', 6, 8, '', '0', ''),
(30, 'Calendrier', 0, 'module', 0, 'calendar', '', '', 6, 1, '', '0', ''),
(31, 'Géolocalisation', NULL, 'page', 25, '', '', '', 6, 9, '', '0', '');

-- --------------------------------------------------------

--
-- Structure de la table `default_orders_details`
--

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
(1, 'home', '', 'Accueil', 'old_site-spa-thai/home', 12, '1', '1', '.ico-grp {\r\n    margin: auto;\r\n    width: 500px;\r\n}\r\n.specialite {\r\n    display: inline-block;\r\n    text-align: center;\r\n    margin: 10px;\r\n    width: 140px;\r\n    height: 100px;\r\n}', '', '', '', 0, 0, '', 0, 0, 'live', 1495107568, 1520640869, '0', 0, 1, 0),
(2, 'contact', '', 'Contact', 'contact', 0, '1', '2', '', '', '', '', 0, 0, '', 0, 0, 'live', 1495107568, 1495106656, '0', 0, 1, 1),
(3, 'search', '', 'Search', 'search', 0, '1', '3', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1495107568, 0, '', 0, 1, 2),
(4, 'results', '', 'Results', 'search/results', 3, '1', '4', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1495107568, 0, '', 0, 0, 0),
(5, '404', '', 'Page missing', '404', 0, '1', '5', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1495107568, 0, '', 0, 1, 3),
(12, 'old_site-spa-thai', '', 'Old_site', 'old_site-spa-thai', 0, '1', '12', '', '', '', '', 0, 0, '', 0, 0, 'draft', 1520605063, 1520641327, '0', 0, 1, 5),
(8, 'reservation', '', 'Réservation', 'old_site-spa-thai/reservation', 12, '1', '8', '', '', '', '', 0, 0, '', 0, 0, 'live', 1495101423, 0, '0', 0, 1, 4),
(9, 'livre-dor', '', 'Livre d\'Or', 'old_site-spa-thai/livre-dor', 12, '1', '9', '', '', '', '', 0, 0, '', 0, 0, 'live', 1495101451, 0, '0', 0, 1, 3),
(10, 'acces', '', 'Accès', 'old_site-spa-thai/acces', 12, '1', '10', '', '', '', '', 0, 0, '', 0, 0, 'live', 1495103602, 0, '0', 0, 1, 2),
(11, 'horaires', '', 'Horaires', 'old_site-spa-thai/horaires', 12, '1', '11', '', '', '', '', 0, 0, '', 0, 0, 'live', 1495103737, 0, '0', 0, 1, 1),
(13, 'bootstrap', '', 'bootstrap', 'bootstrap', 0, '1', '13', '', '', '', '', 0, 0, '', 0, 0, 'live', 1520637740, 1520640249, '0', 0, 1, 4),
(14, 'accueil', '', 'Accueil', 'accueil', 0, '3', '14', '', '', '', '', 0, 0, '', 0, 0, 'live', 1520641201, 1521820578, '0', 1, 1, 0),
(24, 'rdv', '', 'rdv', 'rdv', 0, '4', '24', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521766849, 1521851234, '0', 0, 0, 1521766849),
(15, 'test-plugin-list-doctors', '', 'test plugin list doctors', 'test-plugin-list-doctors', 0, '1', '15', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521475440, 1521478872, '0', 0, 1, 6),
(16, 'test-plugin-show-doctor', '', 'test plugin show doctor', 'test-plugin-show-doctor', 0, '1', '16', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521478197, 1521478847, '0', 0, 0, 7),
(17, 'rendez-vous', '', 'Rendez Vous', 'rendez-vous', 0, '1', '17', 'div.content li.active a {\r\n    color: white;\r\n}', '$( document ).ready(function() \r\n{   \r\n  \r\n  $(\'div.content ul\').addClass(\'list-group\');\r\n  $(\'div.content ul li\').addClass(\'list-group-item\');\r\n  \r\n  $(\'div.content ul li:nth-child(1)\').addClass(\'active\');\r\n});', '', '', 0, 0, '', 0, 0, 'live', 1521513385, 1521517752, '0', 0, 1, 8),
(18, 'mes-rdv-a-venir', '', 'Mes RDV à venir', 'rendez-vous/mes-rdv-a-venir', 17, '1', '18', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521513419, 1521598512, '0', 0, 1, 1),
(19, 'rdv-a-venir-de-mes-proches', '', 'RDV à venir de mes proches', 'rendez-vous/rdv-a-venir-de-mes-proches', 17, '1', '19', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521513442, 1521597469, '0', 0, 1, 2),
(20, 'mes-rdv-passes', '', 'Mes RDV passés', 'rendez-vous/mes-rdv-passes', 17, '1', '20', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521513485, 1521602427, '0', 0, 1, 4),
(21, 'rdv-passes-de-mes-proches', '', 'RDV passés de mes proches', 'rendez-vous/rdv-passes-de-mes-proches', 17, '1', '21', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521513507, 1521602451, '0', 0, 1, 5),
(22, 'rdv-a-venir', '', 'RDV à venir', 'rendez-vous/rdv-a-venir', 17, '1', '22', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521516830, 1521598667, '0', 0, 1, 0),
(23, 'rdv-passes', '', 'RDV passés', 'rendez-vous/rdv-passes', 17, '1', '23', '', '', '', '', 0, 0, '', 0, 0, 'live', 1521516887, 1521602361, '0', 0, 1, 3),
(25, 'geolocalisation', '', 'Géolocalisation', 'geolocalisation', 0, '1', '25', '', 'function geoGetPosition() \n{ \n	$(\'#position input\').val(\'\');\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\n} \nfunction geoSuccess(position) \n{ \n	console.log(position.coords.latitude)\n	console.log(position.coords.longitude)\n          var text = \'LAT: \' + position.coords.latitude ;\n  text += \' - LONG:  \' + position.coords.longitude ; \n	$(\'#position input\').val(text);\n} \nfunction geoError(err) \n{\n    console.log(err);\n    alert(\"positioning error\");\n}  \n \n/** On document ready, go  */      \n$( document ).ready(function() \n{     \n			geoGetPosition(); \n		\n\n		\n});', '', '', 0, 0, '', 0, 0, 'live', 1522164418, 1522167622, '0', 0, 1, 1522164418);

-- --------------------------------------------------------

--
-- Structure de la table `default_page_types`
--

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
(3, 'accueil_msante', 'Accueil MSanté', 'Page d’accueil MSanté', 2, '', NULL, '', '{{ dev:empty_cache }}\r\n\r\n<div id=\"categories\"> \r\n    <div class=\"text-center h3 titre-rdv\"> \r\n        Prenez rendez vous avec votre professionnel de sant&eacute; \r\n    </div>\r\n    <div class=\"row specialite-rdv\" >\r\n        <div class=\"col-lg-4 ico-grp\">\r\n                    <div class=\"specialite\" data-cat=\"Médecins généralistes\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/997cd2e64fac717/80/80\" alt=\"Généraliste\"/> \r\n                            <p>Médecins généralistes</p>\r\n                    </div>\r\n                    <div class=\"specialite\" data-cat=\"Ophtalmologue\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/292281c45a9207c/80/80\" alt=\"Ophtalmologue\"/> \r\n                            <p>Ophtalmologue</p>\r\n                    </div>\r\n                    <div class=\"specialite\" data-cat=\"ORL\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/25e01b2784711d9/80/80\" alt=\"ORL\"/> \r\n                            <p>ORL</p>\r\n                    </div>\r\n        </div>\r\n\r\n        <div class=\"col-lg-4 ico-grp\">\r\n                    <div class=\"specialite\" data-cat=\"Cardiologie\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/a4278245d864a56/80/80\" alt=\"Cardiologie\"/> \r\n                            <p>Cardiologue</p> \r\n                    </div>\r\n                    <div class=\"specialite\" data-cat=\"Spécialistes femme\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/3590b30f5b17f8c/80/80\" alt=\"Spécialistes femme\"/> \r\n                            <p>Spécialistes femme</p>\r\n                    </div>\r\n                    <div class=\"specialite\" data-cat=\"Dentiste\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/28bf736b0c65fb4/80/80\" alt=\"Dentiste\"/> \r\n                            <p>Dentiste</p>\r\n                    </div> \r\n        </div>\r\n\r\n        <div class=\"col-lg-4 ico-grp\">\r\n                    <div class=\"specialite\" data-cat=\"Radiologue\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/82ed2c7f7efb8a4/80/80\" alt=\"Radiologue\"/> \r\n                            <p>Radiologue</p>\r\n                    </div>\r\n                    <div class=\"specialite\" data-cat=\"Autres médecins\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/c8e8886f9e65488/80/80\" alt=\"Autres médecins\"/> \r\n                            <p>Autres médecins</p>\r\n                    </div>\r\n                    <div class=\"specialite\" data-cat=\"Etablissements de santé\" data-type=\"rdv\">\r\n                            <img src=\"{{ url:site }}files/thumb/353de3d9e958976/80/80\" alt=\"Etablissements de santé\"/> \r\n                            <p>Etablissements de santé</p>\r\n                    </div>\r\n        </div> \r\n        \r\n    </div>\r\n \r\n    <div class=\"text-center h3 titre-pro\"> \r\n        Contactez un professionnel\r\n    </div>\r\n\r\n    <div class=\"row specialite-pro\" >\r\n        <div class=\"col-lg-4 ico-grp\"></div>\r\n\r\n        <div class=\"col-lg-4 ico-grp\">\r\n                    <div class=\"specialite\" data-cat=\"Pharmacies\" data-type=\"pro\">\r\n                            <img src=\"{{ url:site }}files/thumb/8b37a2a2cbf9537714125a8f8476e63a.jpg/80/80\" alt=\"Généraliste\"/> \r\n                            <p>Pharmacies</p>\r\n                    </div> \r\n                    <div class=\"specialite\" data-cat=\"Laboratoires\" data-type=\"pro\">\r\n                            <img src=\"{{ url:site }}files/thumb/8b37a2a2cbf9537714125a8f8476e63a.jpg/80/80\" alt=\"Spécialistes femme\"/> \r\n                            <p>Laboratoires</p>\r\n                    </div> \r\n                    <div class=\"specialite\" data-cat=\"Numéros d\'urgences\" data-type=\"pro\">\r\n                            <img src=\"{{ url:site }}files/thumb/8b37a2a2cbf9537714125a8f8476e63a.jpg/80/80\" alt=\"Radiologue\"/> \r\n                            <p>Numéros d\'urgences</p>\r\n                    </div> \r\n        </div>\r\n\r\n        <div class=\"col-lg-4 ico-grp\"></div> \r\n        \r\n    </div>\r\n</div>\r\n\r\n\r\n<div class=\"h3 text-center titre-auto\">   \r\n</div>\r\n{{# doctor:search_box #}} \r\n<div id=\"doctor-search\" class=\"\">\r\n    <form method=\"get\" action=\"{{url:site}}doctor\">\r\n        <div class=\"form-group searchbox-query\">\r\n            <div class=\"input-group\">\r\n                <span class=\"input-group-addon\">\r\n                    <a class=\"\" onclick=\"cleanDocSearch()\">\r\n                        <i class=\"glyphicon glyphicon-remove-circle\"></i>\r\n                    </a>\r\n                </span>\r\n                <input type=\"text\" name=\"c\" value=\"\" placeholder=\"Domaine ou spécialité médicale\" class=\"form-control ui-autocomplete-input\" autocomplete=\"off\">\r\n            </div> \r\n        </div> \r\n        <div class=\"form-group searchbox-locate\"> \r\n                <div class=\"input-group center-block\">\r\n                    <a class=\"btn btn-success disabled\" onclick=\"geoGetTown()\">\r\n                        <i class=\"glyphicon glyphicon-map-marker\"></i> Autour de vous\r\n                    </a>\r\n                </div> \r\n            </div>\r\n        <div class=\"form-group searchbox-area\"> \r\n            <div class=\"input-group\">\r\n                <span class=\"input-group-addon\">\r\n                    <a class=\"\" onclick=\"cleanAreaSearch()\">\r\n                        <i class=\"glyphicon glyphicon-remove-circle\"></i>\r\n                    </a>\r\n                </span>\r\n                <input type=\"text\" name=\"s\" value=\"\" placeholder=\"Ville, quartier ou CP\" class=\"form-control\">                  \r\n            </div>\r\n        </div> \r\n        <div class=\"form-group searchbox-btn\"> \r\n                <button name=\"submitBtn\" type=\"submit\" class=\"btn btn-primary\">\r\n                        <i class=\"glyphicon glyphicon-search\"></i> Rechercher\r\n                </button> \r\n        </div>\r\n    </form>\r\n</div>\r\n\r\n\r\n{{# dessous gabarit des pages normales, sauf titre H2  #}}\r\n\r\n{{ pre_html }}\r\n{{ body }}\r\n{{ post_html }}', '.ico-grp {\r\n    margin: auto;\r\n    padding: 0;\r\n    padding-left: 0.6%;\r\n    max-width: 348px;\r\n    width: 100%;\r\n    /* background: blue; */\r\n}\r\n.specialite {\r\ndisplay: inline-block;\r\n    margin: 0%;\r\n    width: 100px;\r\n    text-align: center;\r\n    /* max-width: 33%; */\r\n    min-width: 85px;\r\n    height: 100px;\r\n    padding: 3%;\r\n    /* background: red; */\r\n}\r\ndiv.specialite:hover {\r\n    font-weight : bold;\r\n}\r\n#doctor-search {\r\n    margin: auto;\r\n    text-align: center;\r\n    max-width: 400px;\r\n} \r\n.set {\r\n    background-color: #dff0d8;\r\n    font-weight: bold;\r\n    color: #3c763d;\r\n}\r\ndiv.specialite p {\r\n    text-overflow: ellipsis;\r\n    text-align: center; \r\n    width: 100%;\r\n    height: 38px;\r\n    overflow: hidden;\r\n    font-size: small;\r\n}', '/* public vars */\r\nvar doctors = []; \r\nvar mApi = { \r\n    mapsUrl: \"https://maps.googleapis.com/maps/api/js?key=\",\r\n    key:\"AIzaSyDkUU_ti16t_PBfJ8o2-p_AciVkD8Q_2uo\",\r\n    geocodeUrl:\"https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=\",\r\n//    centLat:48.62,\r\n//    centLon:2.44, \r\n    zoom:10\r\n}; \r\n/* doctor module functions */\r\n/** builds locations map of doctors\r\n *  gets data from HTML5 data attributes in doctor\'s list\r\n * @returns {undefined}\r\n */\r\nfunction doctorsMap() \r\n{\r\n//    console.log(\'doctorsMap\');\r\n//    console.log(doctors);\r\n    if(typeof doctors === \'undefined\') return;\r\n    \r\n    \r\n    var map;\r\n    \r\n    //var elevator;\r\n    var myOptions = {\r\n        zoom: mApi.zoom,\r\n        center: new google.maps.LatLng(mApi.centLat ,mApi.centLon )\r\n        /*,\r\n        mapTypeId: \'terrain\'*/\r\n    };\r\n    \r\n    map = new google.maps.Map($(\"#map_canvas\")[0], myOptions); \r\n \r\n    for (var x = 0; x < doctors.length; x++) \r\n    {  \r\n//        var xadr;\r\n//        var xname; \r\n        console.log(\'loop:\'+x);\r\n        xadr = doctors[x].address;\r\n        xname = doctors[x].name;\r\n        /* geocode */\r\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \r\n        { \r\n            /* exit if has no values */\r\n            if(typeof(data) === \'undefined\') return;\r\n//            console.log(\'data:\'+data);\r\n            console.log(\'name:\'+data.results[0].formatted_address);\r\n            var p = data.results[0].geometry.location;\r\n//            console.log(\'location:\'+p);\r\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\r\n            console.log(\'loop \'+x+\' lat long:\'+latlng);\r\n            new google.maps.Marker({\r\n                position: latlng,\r\n                map: map,\r\n                title: xname\r\n            }); \r\n        });\r\n    }\r\n    /* center and zoom */\r\n    // map - instance of google Map v3\r\n    // markers - array of Markers\r\n    /*\r\n    var bounds = google.maps.reduce(function(bounds, marker) {\r\n        return bounds.extend(marker.getPosition());\r\n    }, new google.maps.LatLngBounds());\r\n\r\n    map.setCenter(bounds.getCenter());\r\n    map.fitBounds(bounds);\r\n*/\r\n}\r\n/**\r\n *  gets Google API JS and runs doctorMap on complete\r\n * @returns {undefined}\r\n */\r\nfunction loadMap() \r\n{\r\n    if($(\"#map_canvas\").length == 0) $(\'#doctors-list\').prepend(\'<div id=\"map_canvas\"></div>\');\r\n    /* correct height for small screens */\r\n//    if($( window ).height() < 400)\r\n//    {\r\n//        $(\'#map_canvas\').css(\'heigth\', 240);\r\n//    } \r\n//    console.log(\'loadMap: \'+mApi.mapsUrl + mApi.key);\r\n    //geocode first address for map center\r\n            /* geocode */\r\n            xadr = $(\'.doctor\').attr(\'data-id\');\r\n        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) \r\n        { \r\n            /* exit if has no values */\r\n            if(typeof(data) === \'undefined\') return;\r\n            console.log(\'data:\'+data);\r\n            console.log(\'name:\'+data.results[0].formatted_address);\r\n            var p = data.results[0].geometry.location;\r\n            console.log(\'location:\'+p);\r\n            var latlng = new google.maps.LatLng(p.lat, p.lng);\r\n            console.log(\'loop \'+x+\' lat long:\'+latlng); \r\n        });\r\n    \r\n    //\r\n    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);\r\n    $(\'#doctors-map-btn\').hide();\r\n    $(\'#doctors-map-btn\').after(\'<div id=\"map_canvas\"></div>\');\r\n    $(\'#map_canvas\').html(pg_load);\r\n}\r\n/** based on function from\r\n * https://stackoverflow.com/questions/6797569/get-city-name-using-geolocation\r\n * answered Apr 29 \'16 at 4:12 Mikhail\r\n * ********************************************************************************/ \r\nvar returned_address =\'\'; \r\nfunction geoGetTown() {\r\n    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);\r\n} \r\nfunction geoSuccess(position) {\r\n    //console.log(position.coords.latitude)\r\n    //console.log(position.coords.longitude)\r\n\r\n    var geocoder = \'https://maps.googleapis.com/maps/api/geocode/json?latlng=\' + position.coords.latitude + \'%2C\' + position.coords.longitude + \'&language=en&key=\' + mApi.key;\r\n\r\n    $.getJSON(geocoder).done(function(location) \r\n    {\r\n//        console.log(location); \r\n        returned_address=location.results[0].address_components[2].long_name;\r\n        $(\'#doctor-search input[name=s]\').val(returned_address); \r\n        $(\'.searchbox-area\').addClass(\'has-success\'); \r\n    });\r\n} \r\nfunction geoError(err) {\r\n    console.log(err);\r\n    alert(\"positioning error\");\r\n} \r\n/********************************************************************************/  \r\n {{if false }}\r\nfunction myPosition(position) {\r\n    var infopos = \"Position déterminée :\\n\";\r\n    infopos += \"Latitude : \"+position.coords.latitude +\"\\n\";\r\n    infopos += \"Longitude: \"+position.coords.longitude+\"\\n\";\r\n    infopos += \"Altitude : \"+position.coords.altitude +\"\\n\";\r\n    return infopos;\r\n}\r\n{{endif}}\r\n{{# load doctor module JS #}}\r\n{{# doctor:js #}}\r\n\r\n/** empties search box\r\n * \r\n * @returns {undefined}\r\n */\r\n function cleanDocSearch()\r\n {\r\n     console.log(\'clean\');\r\n     $(\'.searchbox-query\').removeClass(\'has-success\'); \r\n     $(\'#doctor-search input[name=c]\').val(\'\').removeClass(\'set\');\r\n    /*UX*/\r\n    \r\n    $(\'#categories\').show();\r\n }\r\n function cleanAreaSearch()\r\n {\r\n     console.log(\'clean\');\r\n     $(\'.searchbox-area\').removeClass(\'has-success\'); \r\n     $(\'#doctor-search input[name=s]\').val(\'\').removeClass(\'set\');\r\n    /*UX*/ \r\n    $(\'.titre-auto\').hide() ;\r\n }\r\n \r\n \r\n$( document ).ready(function() \r\n{    \r\n        /*geo btn */\r\n        /* remove geo btn if no localisation */\r\n//        if(navigator.geolocation !== true) \r\n//        {\r\n//            $(\'.searchbox-locate .input-group-addon a\').addClass(\'disabled\');\r\n//        } else {\r\n            $(\'.searchbox-locate a\').removeClass(\'disabled\'); \r\n//        }  \r\n        /* UIX select all */\r\n        $(\'.searchbox-query input, .searchbox-area input\').on(\'focus\', function(){ this.select(); });\r\n        /* jquery autocomplete */\r\n        $( function() {\r\n          var medicSpecialities = [\r\n                  \"Dentiste\",\r\n                  \"Généraliste\",\r\n                  \"Chirurgien dentiste\",\r\n                  \"Médecin généraliste\",\r\n                  \"Pédiatre\",\r\n                  \"Gynécologue obstétrique ou médical\",\r\n                  \"Ophtalmologue\",\r\n                  \"Dermatologue\",\r\n                  \"Ostéopathe\",\r\n                  \"Kinésithérapeute\",\r\n                  \"Pédicure – Podologue\",\r\n                  \"Sage – femme\",\r\n                  \"ORL\",\r\n                  \"Allergologue\",\r\n                  \"Urologue\",\r\n                  \"Rhumatologue\",\r\n                  \"Endocrinologue\",\r\n                  \"Stomatologue\",\r\n                  \"Orthopédiste\",\r\n                  \"Diététicien\",\r\n                  \"Psychologue\",\r\n                  \"Neurologue\",\r\n                  \"Psychiatre\",\r\n                  \"Radiologue\",\r\n                  \"Cardiologue\",\r\n                  \"Gastro-entérologue et hépatologue\"\r\n          ];\r\n          $( \".searchbox-query input\" ).autocomplete({\r\n            source: medicSpecialities\r\n          });\r\n        } ); \r\n    //add functionality to specialities\r\n    $(\'.ico-grp .specialite\').each(function() {\r\n        $( this ).on(\'click\', function _selectType(event) \r\n        {\r\n            if(typeof(event)!==\'undefined\') event.preventDefault();\r\n            var cat = $(this).attr(\"data-cat\"); \r\n            var type = $(this).attr(\"data-type\"); \r\n            $(\'.searchbox-query\').addClass(\'has-success\');\r\n            $(\'#doctor-search input[name=c]\').val(cat).addClass(\'set\');\r\n            /*UX*/\r\n            $(\'#categories\').hide();\r\n            $(\'.titre-auto\').show().text(\'Choisir votre \'+cat.toLowerCase());\r\n            \r\n//            $(\'.titre-\'+type).slideDown();\r\n            console.log(type);\r\n            \r\n            \r\n//            /* https://www.taniarascia.com/smooth-scroll-to-id-with-jquery/ */\r\n//            $(\'html, body\').animate({\r\n//                    scrollTop: $(\'div.searchbox-query\').offset().top\r\n//            }, 500, \'linear\');\r\n        });\r\n    });\r\n\r\n});\r\n', 'default.html', 1520641079, 'y', '', ''),
(4, 'rendez_vous', 'Rendez vous', 'Affichage des RDV du patient', 2, '', NULL, '', '{{ dev:empty_cache }} \r\n \r\n{{if !{url:segments segment=\"2\"} }}\r\n	<h3>Rendez vous</h3>\r\n	<ul class=\"list-group\">\r\n		<li class=\"list-group-item active\"><a href=\"{{url:site}}rdv/futurs\">RDV à venir</a></li>\r\n		<li class=\"list-group-item\"><a href=\"{{url:site}}rdv/futurs?other=no\">Mes RDV à venir</a></li>\r\n		<li class=\"list-group-item\"><a href=\"{{url:site}}rdv/futurs?other=yes\">RDV à venir de mes proches</a></li>\r\n	</ul>\r\n	<ul class=\"list-group\">\r\n		<li class=\"list-group-item active\"><a href=\"{{url:site}}rdv/passes\">RDV passés</a></li>\r\n		<li class=\"list-group-item\"><a href=\"{{url:site}}rdv/passes?other=no\">Mes RDV passés</a></li>\r\n		<li class=\"list-group-item\"><a href=\"{{url:site}}rdv/passes?other=yes\">RDV passés de mes proches</a></li>\r\n	</ul>\r\n	\r\n{{elseif {url:segments segment=\"2\"} == \'futurs\'}} \r\n	<h3>\r\n		{{if {custom:get_value name=\"other\"} == \'yes\' }}\r\n			Rendez vous à venir pour mes proches\r\n		{{elseif {custom:get_value name=\"other\"} == \'no\'}}\r\n			Mes rendez-vous à venir\r\n		{{else}}\r\n			Rendez-vous à venir\r\n		{{endif}} \r\n	</h3>\r\n{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"futur\" other_person={custom:get_value name=\"other\"} }} \r\n		<div class=\"panel panel-default panel-success\">\r\n				<div class=\"panel-heading\"> \r\n					<h4>\r\n						Le\r\n						 {{date_day_str}}  {{date_month_str}}  \r\n						à\r\n					</h4>\r\n					 [{{appointment_time}}   - \r\n					 doc {{doctor_id}} user {{user_id}}]\r\n				</div>\r\n				<div class=\"panel-body\">   \r\n				\r\n                                                {{ if filename }}\r\n                                                        <img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                                {{ elseif doc_speciality  }} \r\n                                                        {{ if doc_speciality == \"Médecins généralistes\" }} \r\n                                                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"ORL\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Cardiologue\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Dentiste\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Radiologue\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Autres médecins\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n                                                        {{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n                                                                        <img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n                                                        {{ else }} \r\n                                                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                                        {{ endif }} \r\n                                                {{ else }} \r\n                                                {{# default image #}}\r\n                                                        <img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n                                                {{ endif }}\r\n									\r\n						{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n						 <br /> \r\n						{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n						 <br /> \r\n						{{gender}}  \r\n						 {{first_name}}  \r\n						 {{last_name}}   \r\n						 <br /> \r\n					Le\r\n					 {{appointment_date}}  \r\n					à\r\n					 {{appointment_time}}\r\n					 \r\n					<div class=\"center-block\"> \r\n						<a class=\"btn btn-danger \" href=\"{{url:site}}appointments/delete/{{id}}\">Annuler ce RDV</a>			 \r\n					</div> 		 		 \r\n				</div>\r\n		</div> \r\n{{ /appointments:my_appointments }} \r\n\r\n{{elseif {url:segments segment=\"2\"} == \'passes\'}}  \r\n{{# appointments:my_appointments futur_past=\"past|futur\" other_person=\"yes|no\" #}} \r\n{{# panel-success or panel-default #}}\r\n\r\n{{ appointments:my_appointments futur_past=\"futur\" other_person={custom:get_value name=\"other\"} }} \r\n\r\n		<div class=\"panel panel-default\">\r\n				<div class=\"panel-heading\"> \r\n					<h4>\r\n						Le\r\n						 {{date_day_str}}  {{date_month_str}}  \r\n						à\r\n					</h4>\r\n					 [{{appointment_time}}   - \r\n					 doc {{doctor_id}} user {{user_id}}]\r\n				</div>\r\n				<div class=\"panel-body\">   \r\n				\r\n									{{ if filename }}\r\n										<img src=\"{{url:site}}files/large/{{filename}}\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n									{{ elseif doc_speciality  }} \r\n										{{ if doc_speciality == \"Médecins généralistes\" }} \r\n												<img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Ophtalmologue\" }}\r\n												<img src=\"{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"ORL\" }}\r\n												<img src=\"{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Cardiologue\" }}\r\n												<img src=\"{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Spécialistes femme\" }}\r\n												<img src=\"{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Dentiste\" }}\r\n												<img src=\"{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Radiologue\" }}\r\n												<img src=\"{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Autres médecins\" }}\r\n												<img src=\"{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/> \r\n										{{ elseif doc_speciality == \"Etablissements de santé\" }}\r\n												<img src=\"{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>  \r\n										{{ else }} \r\n												<img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n										{{ endif }} \r\n									{{ else }} \r\n									{{# default image #}}\r\n										<img src=\"{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg\" height=\"80\" style=\"float:left;margin-right:20px;\"/>\r\n									{{ endif }}\r\n									\r\n						{{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}\r\n						 <br /> \r\n						{{doc_address}} {{doc_area}} {{doc_town}} <br /> \r\n						 <br /> \r\n						{{gender}}  \r\n						 {{first_name}}  \r\n						 {{last_name}}   \r\n						 <br /> \r\n					Le\r\n					 {{appointment_date}}  \r\n					à\r\n					 {{appointment_time}}\r\n							 \r\n					<div class=\"center-block\"> \r\n						<a class=\"btn btn-info \"  href=\"{{url:site}}doctor/view/{{doctor_id}}\">Reprendre ce RDV</a>			 \r\n					</div> 		 	 	 		 \r\n				</div>\r\n		</div> \r\n \r\n{{ /appointments:my_appointments }} \r\n	\r\n	\r\n{{endif}}\r\n', 'div.content li.active a {\r\n    color: white;\r\n}', '', 'default.html', 1521766621, 'y', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `default_permissions`
--

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
  `maiden_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_test` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `birth_date`, `phone`, `mobile`, `address_line1`, `address_line2`, `postcode`, `updated_on`, `personal_info`, `town`, `area_name`, `insurance`, `gender`, `doctor_id`, `phone_valid`, `desk_no`, `floor`, `district`, `maiden_name`, `date_test`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'Administrateur', 'Radja', 'Lomas', '21/08/1979', NULL, '0678957826', '4 allée Jacques Ibert', NULL, NULL, 1522084164, 'Sourd de l\'oreille droite', 'Saint Michel sur Orge', 'Quartier du la pointe ', 'oui', 'h', NULL, NULL, NULL, NULL, 'Le port', NULL, NULL),
(2, '2018-03-15 00:41:01', NULL, 1, 1, 2, 'Alfred docteur test', 'Alfred', 'Mozart', '0', '678957826', '678957826', '4 allée Jacques Ibert', '91240', '91240', NULL, NULL, 'Saint Michel sur Orge', NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(3, '2018-03-15 00:43:37', NULL, 1, 2, 3, 'Medical Staff', 'Sandra', 'Hitchcok', '0', '678957826', '678957826', '17 rue Gutenberg', NULL, '91070', NULL, NULL, 'Bondoufle', NULL, NULL, 'f', NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(4, '2018-03-15 00:44:48', NULL, 1, 3, 4, 'Techie', 'Radja', 'Lomas', '0', '678957826', '678957826', '17 rue Gutenberg', NULL, '91070', NULL, NULL, 'Bondoufle', NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(5, '2018-03-15 01:25:15', NULL, 1, 4, 5, 'devops', 'devops', 'devops', '0', NULL, '0678957826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(6, '2018-03-25 01:03:02', NULL, NULL, 5, 6, 'radja.lomas', 'Radja', 'Lomas', NULL, NULL, '678957826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(7, '2018-03-25 01:57:02', NULL, NULL, 6, 7, 'radja.lomas1', 'Radja', 'Lomas', NULL, NULL, '678957826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(8, '2018-03-25 02:10:01', NULL, NULL, 7, 8, 'bilbo.higgins', 'bilbo', 'higgins', NULL, NULL, '0163486116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(9, '2018-03-25 02:30:51', NULL, NULL, 8, 9, 'another.1', 'another', '1', NULL, NULL, '678957826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(10, '2018-03-27 04:36:09', NULL, NULL, 9, 10, 'radja.lomas2', 'Radja', 'Lomas', '3245', NULL, '678957826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(11, '2018-03-27 15:18:00', NULL, NULL, 10, 11, 'almamy.barry', 'ALMAMY', 'BARRY', '10/10/50', NULL, '665431196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(12, '2018-03-27 15:31:18', NULL, NULL, 11, 12, 'barry.almamy_', 'Barry', 'Almamy', '10/10/50', NULL, '625464119', NULL, NULL, NULL, 1522165172, '', NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL),
(13, '2018-03-27 16:18:55', NULL, NULL, 12, 13, 'barry.didier', 'Barry', 'Didier', '10/10/50', NULL, '00224625464119', NULL, NULL, NULL, 1522165381, '', NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_redirects`
--

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
(129, 'Accueil', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '14', 'accueil', 'admin/pages/edit/14', 'admin/pages/delete/14'),
(29, 'bootstrap', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '13', 'bootstrap', 'admin/pages/edit/13', 'admin/pages/delete/13'),
(8, 'Réservation', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '8', 'reservation', 'admin/pages/edit/8', 'admin/pages/delete/8'),
(9, 'Livre d\'Or', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '9', 'livre-dor', 'admin/pages/edit/9', 'admin/pages/delete/9'),
(33, 'Accueil', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '1', 'home', 'admin/pages/edit/1', 'admin/pages/delete/1'),
(14, 'Accès', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '10', 'acces', 'admin/pages/edit/10', 'admin/pages/delete/10'),
(15, 'Horaires', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '11', 'horaires', 'admin/pages/edit/11', 'admin/pages/delete/11'),
(55, 'test plugin list doctors', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '15', 'test-plugin-list-doctors', 'admin/pages/edit/15', 'admin/pages/delete/15'),
(54, 'test plugin show doctor', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '16', 'test-plugin-show-doctor', 'admin/pages/edit/16', 'admin/pages/delete/16'),
(76, 'Rendez Vous', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '17', 'rendez-vous', 'admin/pages/edit/17', 'admin/pages/delete/17'),
(119, 'Mes RDV à venir', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '18', 'rendez-vous/mes-rdv-a-venir', 'admin/pages/edit/18', 'admin/pages/delete/18'),
(117, 'RDV à venir de mes proches', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '19', 'rendez-vous/rdv-a-venir-de-mes-proches', 'admin/pages/edit/19', 'admin/pages/delete/19'),
(124, 'Mes RDV passés', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '20', 'rendez-vous/mes-rdv-passes', 'admin/pages/edit/20', 'admin/pages/delete/20'),
(125, 'RDV passés de mes proches', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '21', 'rendez-vous/rdv-passes-de-mes-proches', 'admin/pages/edit/21', 'admin/pages/delete/21'),
(120, 'RDV à venir', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '22', 'rendez-vous/rdv-a-venir', 'admin/pages/edit/22', 'admin/pages/delete/22'),
(123, 'RDV passés', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '23', 'rendez-vous/rdv-passes', 'admin/pages/edit/23', 'admin/pages/delete/23'),
(130, 'rdv', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '24', 'rdv', 'admin/pages/edit/24', 'admin/pages/delete/24'),
(141, 'Géolocalisation', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '25', 'geolocalisation', 'admin/pages/edit/25', 'admin/pages/delete/25');

-- --------------------------------------------------------

--
-- Structure de la table `default_settings`
--

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
('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'MSante', '', 1, 1, '', 1000),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Annuaire des médecins', '', 0, 1, '', 999),
('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Annuaire des médecins et spécialiste de santé, prenez rendez vous en ligne.', '', 0, 1, '', 998),
('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'fr', 'func:get_supported_lang', 1, 1, '', 997),
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'fr', 'func:get_supported_lang', 1, 1, '', 996),
('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', 1, 1, '', 988),
('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', 'Ce site est actuellement hors-ligne.\r\nMerci de revenir plus tard.', '', 0, 1, '', 987),
('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', 0, 1, 'integration', 983),
('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href=\"https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US\" target=\"_blank\">Authorized Access to your Google Account</a>', 'password', '', '', '', 0, 1, 'integration', 982),
('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'radjal@free.fr', '', '', 1, 1, 'email', 979),
('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', 1, 1, 'email', 978),
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
('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
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
('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(\'textarea#intro.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'pyroimages\'],\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	extraPlugins: \'pyroimages\',\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(\'textarea.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(\'textarea.wysiwyg-advanced\').ckeditor({\r\n	toolbar: [\r\n		[\'Maximize\'],\r\n		[\'pyroimages\', \'pyrofiles\'],\r\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\r\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\r\n		[\'Link\',\'Unlink\'],\r\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\r\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\r\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\r\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	],\r\n	extraPlugins: \'pyroimages,pyrofiles\',\r\n	width: \'99%\',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	removePlugins: \'elementspath\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});', '', 1, 1, 'wysiwyg', 993),
('token_setting', 'Tokens Setting', 'A Yes or No option for the token module', 'select', '1', '1', '1=Yes|0=No', 1, 1, 'token', 0),
('jours_ouverts', 'Jours ouverts', 'Les jours d\'ouverture (Non implementé)', 'checkbox', '1', '1,2,3,4,5,6,7', '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche', 1, 1, 'calendar', 660),
('min_appointment_amount', 'Montant minimum', 'Montant minimum pour accepter un achat', 'text', '0', '', '', 0, 1, 'appointments', 0),
('off_period', 'Période de fermeture', 'Plage de date pour une période de fermeture des livraison Format: MM-JJ|MM-JJ *NOT WORKING*', 'text', '12-24|12-25', '', '', 0, 1, 'appointments', 0);

-- --------------------------------------------------------

--
-- Structure de la table `default_theme_options`
--

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
(16, '715649', 0, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 14, '2018-03-27 02:48:17', NULL, '2018-03-27 00:09:15', 0, NULL),
(17, '149376', 0, '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 0, '2018-03-27 02:59:49', NULL, '2018-03-27 02:59:49', 0, NULL),
(19, '143892', 1, '82.244.231.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 2, '2018-03-27 14:51:26', NULL, '2018-03-27 12:04:13', 1, NULL),
(18, '164897', 1, '92.170.179.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 5, '2018-03-27 03:58:12', NULL, '2018-03-27 03:41:49', 0, NULL),
(20, '962548', 0, '92.184.96.189', 'Mozilla/5.0 (Linux; Android 8.0.0; G8141 Build/47.1.A.12.119) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 5, '2018-03-27 17:50:40', NULL, '2018-03-27 15:35:09', 1, NULL),
(15, '643857', 1, '92.170.179.46', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9195 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36', 3, '2018-03-26 21:33:23', NULL, '2018-03-26 21:06:15', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_users`
--

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
(1, 'radjal@free.fr', '5e44f772e016797f89db5d19d179975c24d8ee85', '4cd53', 1, '', 1, '', 1495107565, 1522167515, 'admin', NULL, 'c0295b85cfedecb50184b72a02da225b399b7cf4'),
(2, 'practicien@nowhere.com', '7db15a5af242f976d62282149602188eb0cd96ad', 'e5d396', 5, '::1', 1, NULL, 1521074461, 1521076949, 'docteur.test', NULL, '61de7be305a949a0b6a141d5bf33fcb63a04e967'),
(3, 'medstaff@nowhere.com', '757129871de30daf6040f50f828b02d8744e8c39', '0d8c10', 3, '::1', 1, NULL, 1521074617, 1521076980, 'med.staff', NULL, 'b40d2018448fd8177b1b1527d4ca244c30e29e36'),
(4, 'support@nowhere.com', '1031f9a492618d59461444aa240ee82023354704', 'd70a25', 4, '::1', 1, NULL, 1521074688, 1521077026, 'support', NULL, '3cc21520c7d43c51f8c77ae0c74417fe32250f72'),
(5, 'devops@nowhere.com', 'f2229cde76e4ca9c4a658f6f091158fea4338bee', 'b92942', 1, '::1', 1, NULL, 1521077115, 1521964921, 'devops', NULL, NULL),
(6, 'r.lomas@spelldesign.fr', 'cbbb411ad2fdf686c2852ea88eafab1c8a7ce770', 'bd6a55', 2, '::1', 1, '', 1521939782, 1521939818, 'radja.lomas', NULL, NULL),
(7, 'another@nowhere.com', 'cbe625abed0276d71a963a3a5cd26f62867a6d27', '8f54f7', 2, '::1', 1, '', 1521943022, 1521943023, 'radja.lomas1', NULL, NULL),
(8, 'bilbohiggins@nowhere.com', 'fcb1fee8af18e0891169128bdcb6e846adc24484', '802f91', 2, '::1', 1, '', 1521943801, 1521945086, 'bilbo.higgins', NULL, NULL),
(9, 'another1@nowhere.com', 'b1faf7c85f27834db049c923085c1d2d69272a46', 'c6549b', 2, '::1', 1, '', 1521945051, 1521945052, 'another.1', NULL, NULL),
(10, 'r4dj4l@gmail.com', '374e971f7012cb19cd3b56e9620e144764a2b479', 'c91789', 2, '92.170.179.46', 1, '', 1522110968, 1522110969, 'radja.lomas2', NULL, NULL),
(11, 'almamy.barry@laposte.net', '076c08abf72175f11353ee4236bb25eb3260b050', '046a79', 2, '185.89.129.106', 1, '', 1522149480, 1522149480, 'almamy.barry', NULL, NULL),
(12, 'abarry78250@gmail.com', '1b2b5fba28f83a6a6ec2d3067a48c8149b043ccd', '9bf26b', 2, '92.184.96.189', 1, '', 1522150278, 1522150279, 'barry.almamy_', NULL, NULL),
(13, 'abarry@mitcoms.com', 'fc8f9e6a3cf03783252398466f5e56c1f771fdd6', 'ac794b', 2, '92.184.96.189', 1, '', 1522153135, 1522165400, 'barry.didier', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `default_variables`
--

CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `default_widgets`
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
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
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `default_doctor_categories`
--
ALTER TABLE `default_doctor_categories`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `default_doctor_doctors`
--
ALTER TABLE `default_doctor_doctors`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `default_doctor_organisations`
--
ALTER TABLE `default_doctor_organisations`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `default_email_templates`
--
ALTER TABLE `default_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `default_page_types`
--
ALTER TABLE `default_page_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `default_permissions`
--
ALTER TABLE `default_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `default_profiles`
--
ALTER TABLE `default_profiles`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `default_redirects`
--
ALTER TABLE `default_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `default_search_index`
--
ALTER TABLE `default_search_index`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT pour la table `default_theme_options`
--
ALTER TABLE `default_theme_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `default_tokens`
--
ALTER TABLE `default_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `default_users`
--
ALTER TABLE `default_users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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

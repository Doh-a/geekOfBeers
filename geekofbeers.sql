-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2014 at 01:05 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `geekofbeers`
--

-- --------------------------------------------------------

--
-- Table structure for table `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) COLLATE utf8_bin NOT NULL,
  `userid` int(11) NOT NULL,
  `bizrule` text COLLATE utf8_bin,
  `data` text COLLATE utf8_bin,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_bin,
  `bizrule` text COLLATE utf8_bin,
  `data` text COLLATE utf8_bin,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('Admin', 2, 'Administrateur', NULL, 'N;'),
('Biere manage', 1, 'Manage bieres', NULL, 'N;'),
('BiereCouleur.admin', 0, 'Couleur admin', NULL, 'N;'),
('BiereCouleur.create', 0, 'Couleur create', NULL, 'N;'),
('BiereCouleur.update', 0, 'Couleur update', NULL, 'N;'),
('BiereFermentation.admin', 0, 'Fermentation admin', NULL, 'N;'),
('BiereFermentation.create', 0, 'Fermentation create', NULL, 'N;'),
('BiereFermentation.update', 0, 'Fermentation update', NULL, 'N;'),
('BiereMaltage.admin', 0, 'Maltage admin', NULL, 'N;'),
('BiereMaltage.create', 0, 'Maltage create', NULL, 'N;'),
('BiereMaltage.update', 0, 'Maltage update', NULL, 'N;'),
('BiereType.admin', 0, 'Type admin', NULL, 'N;'),
('BiereType.create', 0, 'Type create', NULL, 'N;'),
('BiereType.update', 0, 'Type update', NULL, 'N;'),
('BiereType2.admin', 0, 'Type2 admin', NULL, 'N;'),
('BiereType2.create', 0, 'Type2 create', NULL, 'N;'),
('BiereType2.update', 0, 'Type2 update', NULL, 'N;'),
('biere.admin', 0, 'Admin beers', NULL, 'N;'),
('biere.create', 0, 'Create biere', NULL, 'N;'),
('biere.update', 0, 'Update biere', NULL, 'N;'),
('brasserie.admin', 0, 'Brasserie Admin', NULL, 'N;'),
('brasserie.create', 0, 'brasserie create', NULL, 'N;'),
('brasserie.update', 0, 'brasserie update', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) COLLATE utf8_bin NOT NULL,
  `child` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('Admin', 'Biere manage'),
('Biere manage', 'BiereCouleur.admin'),
('Biere manage', 'BiereCouleur.create'),
('Biere manage', 'BiereCouleur.update'),
('Biere manage', 'BiereFermentation.admin'),
('Biere manage', 'BiereFermentation.create'),
('Biere manage', 'BiereFermentation.update'),
('Biere manage', 'BiereMaltage.admin'),
('Biere manage', 'BiereMaltage.create'),
('Biere manage', 'BiereMaltage.update'),
('Biere manage', 'BiereType.admin'),
('Biere manage', 'BiereType.create'),
('Biere manage', 'BiereType.update'),
('Biere manage', 'BiereType2.admin'),
('Biere manage', 'BiereType2.create'),
('Biere manage', 'BiereType2.update'),
('Biere manage', 'biere.admin'),
('Biere manage', 'biere.create'),
('Biere manage', 'biere.update'),
('Biere manage', 'brasserie.admin'),
('Biere manage', 'brasserie.create'),
('Biere manage', 'brasserie.update');

-- --------------------------------------------------------

--
-- Table structure for table `biere`
--

CREATE TABLE IF NOT EXISTS `biere` (
  `id_biere` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nom_biere` varchar(255) COLLATE utf8_bin NOT NULL,
  `degre` float(4,2) NOT NULL DEFAULT '0.00',
  `note_communaute` float(4,2) NOT NULL DEFAULT '0.00',
  `etiquette` varchar(255) COLLATE utf8_bin NOT NULL,
  `couleur` mediumint(8) NOT NULL,
  `fermentation` mediumint(8) NOT NULL,
  `maltage` mediumint(8) NOT NULL,
  `type` mediumint(8) NOT NULL,
  `type2` mediumint(8) NOT NULL,
  `brasserie` mediumint(8) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_biere`),
  KEY `couleur` (`couleur`),
  KEY `fermentation` (`fermentation`),
  KEY `maltage` (`maltage`),
  KEY `type` (`type`),
  KEY `type2` (`type2`),
  KEY `brasserie` (`brasserie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- Dumping data for table `biere`
--

INSERT INTO `biere` (`id_biere`, `nom_biere`, `degre`, `note_communaute`, `etiquette`, `couleur`, `fermentation`, `maltage`, `type`, `type2`, `brasserie`, `updated_at`, `created_at`, `description`) VALUES
(1, 'Taras Boulba', 4.50, 3.50, 'taras_boulba.png', 1, 2, 2, 25, 0, 1, '2014-06-08 19:30:03', '0000-00-00 00:00:00', 'Blonde légère de 4,5 % d’alc., généreusement houblonnée avec le houblon aromatique le plus fin, lui conférant un caractère très rafraîchissant et un nez qui rappelle les agrumes.'),
(2, 'Jambe de bois', 0.00, 0.00, 'jambe_de_bois.png', 1, 2, 2, 25, 0, 1, '2014-06-08 16:18:54', '0000-00-00 00:00:00', ''),
(3, 'Brusseleir', 8.00, 0.00, 'brusseleir.png', 5, 1, 2, 7, 7, 1, '2014-06-08 16:19:03', '2014-06-08 14:03:45', ''),
(4, 'Delirium Tremens', 8.50, 0.00, '', 1, 2, 4, 31, 7, -1, '2014-06-18 17:10:42', '2014-06-18 17:10:42', ''),
(5, 'Maredsous triple', 10.00, 0.00, '', 1, 2, 4, 31, 2, 4, '2014-06-18 19:24:37', '2014-06-18 17:21:09', ''),
(9, 'Moinette', 8.50, 0.00, '', 1, 2, 2, 31, 7, 8, '2014-06-18 17:27:23', '2014-06-18 17:27:23', ''),
(10, 'Quintine', 8.00, 0.00, '', 1, 2, 2, 31, 7, 9, '2014-06-18 17:50:41', '2014-06-18 17:50:41', ''),
(11, 'Quintine', 8.00, 0.00, '', 1, 2, 2, 31, 7, 10, '2014-06-18 17:51:08', '2014-06-18 17:51:08', ''),
(12, 'Quintine', 8.00, 0.00, '', 1, 2, 2, 31, 7, 11, '2014-06-18 17:54:39', '2014-06-18 17:54:39', ''),
(13, 'Quintine', 8.00, 0.00, '', 1, 2, 2, 31, 7, 12, '2014-06-18 17:54:50', '2014-06-18 17:54:50', ''),
(14, 'Quintine', 8.00, 0.00, '', 1, 2, 2, 31, 7, 13, '2014-06-18 18:01:02', '2014-06-18 18:01:02', '');

-- --------------------------------------------------------

--
-- Table structure for table `biere_commentaires`
--

CREATE TABLE IF NOT EXISTS `biere_commentaires` (
  `id_biere` mediumint(9) NOT NULL,
  `id_user` mediumint(9) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id_biere`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biere_commentaires`
--

INSERT INTO `biere_commentaires` (`id_biere`, `id_user`, `commentaire`) VALUES
(1, 22, 'Cette blonde a un gout assez prononcé avec pas mal d''amertume. Un peu forte mais encore tout à fait appréciable en apéro. On retrouve ici le style habituel de la brasserie de la Senne.');

-- --------------------------------------------------------

--
-- Table structure for table `biere_couleur`
--

CREATE TABLE IF NOT EXISTS `biere_couleur` (
  `id_couleur` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nom_couleur` varchar(255) COLLATE utf8_bin NOT NULL,
  `description_couleur` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_couleur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data for table `biere_couleur`
--

INSERT INTO `biere_couleur` (`id_couleur`, `nom_couleur`, `description_couleur`) VALUES
(1, 'Blonde', ''),
(2, 'Blanche', ''),
(3, 'Ambrée', 'Ou rousse'),
(4, 'Brune', ''),
(5, 'Noire', '');

-- --------------------------------------------------------

--
-- Table structure for table `biere_fermentation`
--

CREATE TABLE IF NOT EXISTS `biere_fermentation` (
  `id_fermentation` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nom_fermentation` varchar(255) COLLATE utf8_bin NOT NULL,
  `description_fermentation` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_fermentation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `biere_fermentation`
--

INSERT INTO `biere_fermentation` (`id_fermentation`, `nom_fermentation`, `description_fermentation`) VALUES
(1, 'Basse', 'Fermentation courte, concerne principalement les Lager, Pils et Bock.'),
(2, 'Haute', 'Fermentation longue, concerne principalement les Ales, bières d''abbaye, bières spéciales...'),
(3, 'Spontanée', 'Les lambics.'),
(4, 'Mixte', 'Combin la fermentation haute, et la fermentation spontanée. Concerne les bières rouges.');

-- --------------------------------------------------------

--
-- Table structure for table `biere_maltage`
--

CREATE TABLE IF NOT EXISTS `biere_maltage` (
  `id_maltage` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nom_maltage` varchar(255) COLLATE utf8_bin NOT NULL,
  `description_maltage` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_maltage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data for table `biere_maltage`
--

INSERT INTO `biere_maltage` (`id_maltage`, `nom_maltage`, `description_maltage`) VALUES
(1, 'Sans', 'Aucun maltage présent.'),
(2, 'Simple', 'Quantité habituelle de malt/'),
(3, 'Double', 'Quantité double de malt.'),
(4, 'Triple', 'Quantité triple de malt.'),
(5, 'Quadruple', 'Quantité quadruple de malt.');

-- --------------------------------------------------------

--
-- Table structure for table `biere_type`
--

CREATE TABLE IF NOT EXISTS `biere_type` (
  `id_type` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `description_type` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=88 ;

--
-- Dumping data for table `biere_type`
--

INSERT INTO `biere_type` (`id_type`, `nom_type`, `description_type`) VALUES
(1, 'Barley Wine', ''),
(2, 'American Strong Ale', ''),
(3, 'Old Ale', ''),
(4, 'Scotch Ale', ''),
(5, 'English Strong Ale', ''),
(6, 'Double IPA', ''),
(7, 'India Pale Ale', ''),
(8, 'American Pale Ale', ''),
(9, 'Amber Ale', ''),
(10, 'American Wheat Ale', ''),
(11, 'Blonde Ale', ''),
(12, '', ''),
(13, 'Mild Ale', ''),
(14, 'American Wild Ale', ''),
(15, 'Lambic', ''),
(16, 'Faro', ''),
(17, 'Gueuze', ''),
(18, 'Fruitée', ''),
(19, 'Unblended', ''),
(20, 'Witbier', ''),
(21, 'Oud Bruin', ''),
(22, 'Saison', ''),
(23, 'Bière de garde', ''),
(24, 'Rouge des Flandres', ''),
(25, 'Belgium Pale Ale', ''),
(26, 'Belgium Dark Ale', ''),
(27, 'Bière de champagne', ''),
(28, 'Double', ''),
(29, 'Quadruple', ''),
(30, 'Belgium Strong Dark Ale', ''),
(31, 'Belgian Strong Pale Ale', ''),
(32, 'Triple', ''),
(33, 'Roggenbier', ''),
(34, 'Weissbier', ''),
(35, 'Weizenbock', ''),
(36, 'Hefeweizen', ''),
(37, 'Gose', ''),
(38, 'Dunkel Weizen', ''),
(39, 'Berliner Weisse', ''),
(40, 'Kristallweizen', ''),
(41, 'Kölsch', ''),
(42, 'Altbier', ''),
(43, 'Maibock / Helles', ''),
(44, 'Bock', ''),
(45, 'Dortmunder', ''),
(46, 'Eisbock', ''),
(47, 'Doppelbock', ''),
(48, 'Dunklerbock', ''),
(49, 'Kellerbier', ''),
(50, 'Märzen', ''),
(51, 'Schwarzbier', ''),
(52, 'Munich Lager', ''),
(53, 'Munich Helles', ''),
(54, 'Munich Dunkel', ''),
(55, 'Vienna Lager', ''),
(56, 'Rauchbier', ''),
(57, 'European Strong Lager', ''),
(58, 'European Dark Lager', ''),
(59, 'European Pale Lager', ''),
(60, 'Pilsner', ''),
(61, 'American Imperial Pilsner', ''),
(62, 'German Pilsner', ''),
(63, 'Bohemian Pilsner', ''),
(64, 'American Pilsner', ''),
(65, 'American Adjunct Lager', ''),
(66, 'Malt liquor', ''),
(67, 'Ice beer', ''),
(68, 'Dry beer', ''),
(69, 'Light beer', ''),
(70, 'Baltic Porter', ''),
(71, 'American Pale Lager', ''),
(72, 'American Dark lager', ''),
(73, 'California Common', ''),
(74, 'Cream ale', ''),
(75, 'Oatmeal stout', ''),
(76, 'Flavord stout', ''),
(77, 'Imperial Stout', ''),
(78, 'Sweet stout', ''),
(79, 'American Stout', ''),
(80, 'Foreign Stout', ''),
(81, 'Irish Stout', ''),
(82, 'English Porter', ''),
(83, 'American Porter', ''),
(84, 'Burton Pale Ale', ''),
(85, 'Premium Bitter', ''),
(86, 'English Pale Ale', ''),
(87, 'Irish ale', '');

-- --------------------------------------------------------

--
-- Table structure for table `biere_type2`
--

CREATE TABLE IF NOT EXISTS `biere_type2` (
  `id_type2` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nom_type2` varchar(255) COLLATE utf8_bin NOT NULL,
  `description_type2` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_type2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dumping data for table `biere_type2`
--

INSERT INTO `biere_type2` (`id_type2`, `nom_type2`, `description_type2`) VALUES
(1, 'Bière d''Abbaye', ''),
(2, 'Trappiste', ''),
(3, 'Bio', ''),
(4, 'Parfumée', ''),
(5, 'Bière de Noël', ''),
(6, 'Sans alcool', ''),
(7, 'Artisanale', '');

-- --------------------------------------------------------

--
-- Table structure for table `brasserie`
--

CREATE TABLE IF NOT EXISTS `brasserie` (
  `id_brasserie` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nom_brasserie` varchar(255) COLLATE utf8_bin NOT NULL,
  `description_brasserie` text COLLATE utf8_bin,
  `coords_brasserie` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin NOT NULL,
  `country` mediumint(9) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_brasserie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Dumping data for table `brasserie`
--

INSERT INTO `brasserie` (`id_brasserie`, `nom_brasserie`, `description_brasserie`, `coords_brasserie`, `img`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Brasserie de la Senne', 'Les bières de la Brasserie de la Senne sont produites par deux brasseurs bruxellois passionnés: Yvan De Baets et Bernard Leboucq.\r\nIls œuvrent dans une petite brasserie artisanale, et mettent un point d’honneur à fabriquer des bières à l’ancienne, non filtrées, non pasteurisées, exemptes de tout additif, en utilisant uniquement des matières premières nobles de première qualité. L’exigence de qualité et l’absence de compromis sont en effet une des marques de fabrique de la brasserie.\r\nCes bières, à la saveur complexe et à la personnalité bien marquée sont de véritables bières de caractère, made in Brussels.', '', 'brasseriedelasenne.png', 22, '2014-06-18 19:10:20', '0000-00-00 00:00:00'),
(2, 'Abbaye Notre-Dame de Koningshoeven', 'Brasse La Trappe. Actuellement véritable trappiste, a perdu son titre quelques temps.', '', '', 22, '2014-06-18 19:10:20', '0000-00-00 00:00:00'),
(3, 'Huyghe', '', NULL, '', 22, '2014-06-18 17:10:42', '2014-06-18 17:10:42'),
(4, 'Duvel Moortgat', '', NULL, '', 22, '2014-06-18 17:21:09', '2014-06-18 17:21:09'),
(8, 'Dupont', '', NULL, '', 22, '2014-06-18 17:27:23', '2014-06-18 17:27:23'),
(9, 'Brasserie des Légendes', '', NULL, '', 22, '2014-06-18 17:50:41', '2014-06-18 17:50:41'),
(10, 'Brasserie des Légendes', '', NULL, '', 22, '2014-06-18 17:51:08', '2014-06-18 17:51:08'),
(11, 'Brasserie des Légendes', '', NULL, '', 22, '2014-06-18 17:54:39', '2014-06-18 17:54:39'),
(12, 'Brasserie des Légendes', '', NULL, '', 22, '2014-06-18 17:54:50', '2014-06-18 17:54:50'),
(13, 'Brasserie des Légendes', '', NULL, '', 22, '2014-06-18 18:01:02', '2014-06-18 18:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `alpha_2` varchar(2) NOT NULL DEFAULT '',
  `alpha_3` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_country`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=250 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id_country`, `name`, `alpha_2`, `alpha_3`) VALUES
(1, 'Afghanistan', 'af', 'afg'),
(2, 'Aland Islands', 'ax', 'ala'),
(3, 'Albania', 'al', 'alb'),
(4, 'Algeria', 'dz', 'dza'),
(5, 'American Samoa', 'as', 'asm'),
(6, 'Andorra', 'ad', 'and'),
(7, 'Angola', 'ao', 'ago'),
(8, 'Anguilla', 'ai', 'aia'),
(9, 'Antarctica', 'aq', ''),
(10, 'Antigua and Barbuda', 'ag', 'atg'),
(11, 'Argentina', 'ar', 'arg'),
(12, 'Armenia', 'am', 'arm'),
(13, 'Aruba', 'aw', 'abw'),
(14, 'Australia', 'au', 'aus'),
(15, 'Austria', 'at', 'aut'),
(16, 'Azerbaijan', 'az', 'aze'),
(17, 'Bahamas', 'bs', 'bhs'),
(18, 'Bahrain', 'bh', 'bhr'),
(19, 'Bangladesh', 'bd', 'bgd'),
(20, 'Barbados', 'bb', 'brb'),
(21, 'Belarus', 'by', 'blr'),
(22, 'Belgium', 'be', 'bel'),
(23, 'Belize', 'bz', 'blz'),
(24, 'Benin', 'bj', 'ben'),
(25, 'Bermuda', 'bm', 'bmu'),
(26, 'Bhutan', 'bt', 'btn'),
(27, 'Bolivia, Plurinational State of', 'bo', 'bol'),
(28, 'Bonaire, Sint Eustatius and Saba', 'bq', 'bes'),
(29, 'Bosnia and Herzegovina', 'ba', 'bih'),
(30, 'Botswana', 'bw', 'bwa'),
(31, 'Bouvet Island', 'bv', ''),
(32, 'Brazil', 'br', 'bra'),
(33, 'British Indian Ocean Territory', 'io', ''),
(34, 'Brunei Darussalam', 'bn', 'brn'),
(35, 'Bulgaria', 'bg', 'bgr'),
(36, 'Burkina Faso', 'bf', 'bfa'),
(37, 'Burundi', 'bi', 'bdi'),
(38, 'Cambodia', 'kh', 'khm'),
(39, 'Cameroon', 'cm', 'cmr'),
(40, 'Canada', 'ca', 'can'),
(41, 'Cape Verde', 'cv', 'cpv'),
(42, 'Cayman Islands', 'ky', 'cym'),
(43, 'Central African Republic', 'cf', 'caf'),
(44, 'Chad', 'td', 'tcd'),
(45, 'Chile', 'cl', 'chl'),
(46, 'China', 'cn', 'chn'),
(47, 'Christmas Island', 'cx', ''),
(48, 'Cocos (Keeling) Islands', 'cc', ''),
(49, 'Colombia', 'co', 'col'),
(50, 'Comoros', 'km', 'com'),
(51, 'Congo', 'cg', 'cog'),
(52, 'Congo, The Democratic Republic of the', 'cd', 'cod'),
(53, 'Cook Islands', 'ck', 'cok'),
(54, 'Costa Rica', 'cr', 'cri'),
(55, 'Cote d''Ivoire', 'ci', 'civ'),
(56, 'Croatia', 'hr', 'hrv'),
(57, 'Cuba', 'cu', 'cub'),
(58, 'Curacao', 'cw', 'cuw'),
(59, 'Cyprus', 'cy', 'cyp'),
(60, 'Czech Republic', 'cz', 'cze'),
(61, 'Denmark', 'dk', 'dnk'),
(62, 'Djibouti', 'dj', 'dji'),
(63, 'Dominica', 'dm', 'dma'),
(64, 'Dominican Republic', 'do', 'dom'),
(65, 'Ecuador', 'ec', 'ecu'),
(66, 'Egypt', 'eg', 'egy'),
(67, 'El Salvador', 'sv', 'slv'),
(68, 'Equatorial Guinea', 'gq', 'gnq'),
(69, 'Eritrea', 'er', 'eri'),
(70, 'Estonia', 'ee', 'est'),
(71, 'Ethiopia', 'et', 'eth'),
(72, 'Falkland Islands (Malvinas)', 'fk', 'flk'),
(73, 'Faroe Islands', 'fo', 'fro'),
(74, 'Fiji', 'fj', 'fji'),
(75, 'Finland', 'fi', 'fin'),
(76, 'France', 'fr', 'fra'),
(77, 'French Guiana', 'gf', 'guf'),
(78, 'French Polynesia', 'pf', 'pyf'),
(79, 'French Southern Territories', 'tf', ''),
(80, 'Gabon', 'ga', 'gab'),
(81, 'Gambia', 'gm', 'gmb'),
(82, 'Georgia', 'ge', 'geo'),
(83, 'Germany', 'de', 'deu'),
(84, 'Ghana', 'gh', 'gha'),
(85, 'Gibraltar', 'gi', 'gib'),
(86, 'Greece', 'gr', 'grc'),
(87, 'Greenland', 'gl', 'grl'),
(88, 'Grenada', 'gd', 'grd'),
(89, 'Guadeloupe', 'gp', 'glp'),
(90, 'Guam', 'gu', 'gum'),
(91, 'Guatemala', 'gt', 'gtm'),
(92, 'Guernsey', 'gg', 'ggy'),
(93, 'Guinea', 'gn', 'gin'),
(94, 'Guinea-Bissau', 'gw', 'gnb'),
(95, 'Guyana', 'gy', 'guy'),
(96, 'Haiti', 'ht', 'hti'),
(97, 'Heard Island and McDonald Islands', 'hm', ''),
(98, 'Holy See (Vatican City State)', 'va', 'vat'),
(99, 'Honduras', 'hn', 'hnd'),
(100, 'Hong Kong', 'hk', 'hkg'),
(101, 'Hungary', 'hu', 'hun'),
(102, 'Iceland', 'is', 'isl'),
(103, 'India', 'in', 'ind'),
(104, 'Indonesia', 'id', 'idn'),
(105, 'Iran, Islamic Republic of', 'ir', 'irn'),
(106, 'Iraq', 'iq', 'irq'),
(107, 'Ireland', 'ie', 'irl'),
(108, 'Isle of Man', 'im', 'imn'),
(109, 'Israel', 'il', 'isr'),
(110, 'Italy', 'it', 'ita'),
(111, 'Jamaica', 'jm', 'jam'),
(112, 'Japan', 'jp', 'jpn'),
(113, 'Jersey', 'je', 'jey'),
(114, 'Jordan', 'jo', 'jor'),
(115, 'Kazakhstan', 'kz', 'kaz'),
(116, 'Kenya', 'ke', 'ken'),
(117, 'Kiribati', 'ki', 'kir'),
(118, 'Korea, Democratic People''s Republic of', 'kp', 'prk'),
(119, 'Korea, Republic of', 'kr', 'kor'),
(120, 'Kuwait', 'kw', 'kwt'),
(121, 'Kyrgyzstan', 'kg', 'kgz'),
(122, 'Lao People''s Democratic Republic', 'la', 'lao'),
(123, 'Latvia', 'lv', 'lva'),
(124, 'Lebanon', 'lb', 'lbn'),
(125, 'Lesotho', 'ls', 'lso'),
(126, 'Liberia', 'lr', 'lbr'),
(127, 'Libyan Arab Jamahiriya', 'ly', 'lby'),
(128, 'Liechtenstein', 'li', 'lie'),
(129, 'Lithuania', 'lt', 'ltu'),
(130, 'Luxembourg', 'lu', 'lux'),
(131, 'Macao', 'mo', 'mac'),
(132, 'Macedonia, The former Yugoslav Republic of', 'mk', 'mkd'),
(133, 'Madagascar', 'mg', 'mdg'),
(134, 'Malawi', 'mw', 'mwi'),
(135, 'Malaysia', 'my', 'mys'),
(136, 'Maldives', 'mv', 'mdv'),
(137, 'Mali', 'ml', 'mli'),
(138, 'Malta', 'mt', 'mlt'),
(139, 'Marshall Islands', 'mh', 'mhl'),
(140, 'Martinique', 'mq', 'mtq'),
(141, 'Mauritania', 'mr', 'mrt'),
(142, 'Mauritius', 'mu', 'mus'),
(143, 'Mayotte', 'yt', 'myt'),
(144, 'Mexico', 'mx', 'mex'),
(145, 'Micronesia, Federated States of', 'fm', 'fsm'),
(146, 'Moldova, Republic of', 'md', 'mda'),
(147, 'Monaco', 'mc', 'mco'),
(148, 'Mongolia', 'mn', 'mng'),
(149, 'Montenegro', 'me', 'mne'),
(150, 'Montserrat', 'ms', 'msr'),
(151, 'Morocco', 'ma', 'mar'),
(152, 'Mozambique', 'mz', 'moz'),
(153, 'Myanmar', 'mm', 'mmr'),
(154, 'Namibia', 'na', 'nam'),
(155, 'Nauru', 'nr', 'nru'),
(156, 'Nepal', 'np', 'npl'),
(157, 'Netherlands', 'nl', 'nld'),
(158, 'New Caledonia', 'nc', 'ncl'),
(159, 'New Zealand', 'nz', 'nzl'),
(160, 'Nicaragua', 'ni', 'nic'),
(161, 'Niger', 'ne', 'ner'),
(162, 'Nigeria', 'ng', 'nga'),
(163, 'Niue', 'nu', 'niu'),
(164, 'Norfolk Island', 'nf', 'nfk'),
(165, 'Northern Mariana Islands', 'mp', 'mnp'),
(166, 'Norway', 'no', 'nor'),
(167, 'Oman', 'om', 'omn'),
(168, 'Pakistan', 'pk', 'pak'),
(169, 'Palau', 'pw', 'plw'),
(170, 'Palestinian Territory, Occupied', 'ps', 'pse'),
(171, 'Panama', 'pa', 'pan'),
(172, 'Papua New Guinea', 'pg', 'png'),
(173, 'Paraguay', 'py', 'pry'),
(174, 'Peru', 'pe', 'per'),
(175, 'Philippines', 'ph', 'phl'),
(176, 'Pitcairn', 'pn', 'pcn'),
(177, 'Poland', 'pl', 'pol'),
(178, 'Portugal', 'pt', 'prt'),
(179, 'Puerto Rico', 'pr', 'pri'),
(180, 'Qatar', 'qa', 'qat'),
(181, 'Reunion', 're', 'reu'),
(182, 'Romania', 'ro', 'rou'),
(183, 'Russian Federation', 'ru', 'rus'),
(184, 'Rwanda', 'rw', 'rwa'),
(185, 'Saint Barthelemy', 'bl', 'blm'),
(186, 'Saint Helena, Ascension and Tristan Da Cunha', 'sh', 'shn'),
(187, 'Saint Kitts and Nevis', 'kn', 'kna'),
(188, 'Saint Lucia', 'lc', 'lca'),
(189, 'Saint Martin (French Part)', 'mf', 'maf'),
(190, 'Saint Pierre and Miquelon', 'pm', 'spm'),
(191, 'Saint Vincent and The Grenadines', 'vc', 'vct'),
(192, 'Samoa', 'ws', 'wsm'),
(193, 'San Marino', 'sm', 'smr'),
(194, 'Sao Tome and Principe', 'st', 'stp'),
(195, 'Saudi Arabia', 'sa', 'sau'),
(196, 'Senegal', 'sn', 'sen'),
(197, 'Serbia', 'rs', 'srb'),
(198, 'Seychelles', 'sc', 'syc'),
(199, 'Sierra Leone', 'sl', 'sle'),
(200, 'Singapore', 'sg', 'sgp'),
(201, 'Sint Maarten (Dutch Part)', 'sx', 'sxm'),
(202, 'Slovakia', 'sk', 'svk'),
(203, 'Slovenia', 'si', 'svn'),
(204, 'Solomon Islands', 'sb', 'slb'),
(205, 'Somalia', 'so', 'som'),
(206, 'South Africa', 'za', 'zaf'),
(207, 'South Georgia and The South Sandwich Islands', 'gs', ''),
(208, 'South Sudan', 'ss', 'ssd'),
(209, 'Spain', 'es', 'esp'),
(210, 'Sri Lanka', 'lk', 'lka'),
(211, 'Sudan', 'sd', 'sdn'),
(212, 'Suriname', 'sr', 'sur'),
(213, 'Svalbard and Jan Mayen', 'sj', 'sjm'),
(214, 'Swaziland', 'sz', 'swz'),
(215, 'Sweden', 'se', 'swe'),
(216, 'Switzerland', 'ch', 'che'),
(217, 'Syrian Arab Republic', 'sy', 'syr'),
(218, 'Taiwan, Province of China', 'tw', ''),
(219, 'Tajikistan', 'tj', 'tjk'),
(220, 'Tanzania, United Republic of', 'tz', 'tza'),
(221, 'Thailand', 'th', 'tha'),
(222, 'Timor-Leste', 'tl', 'tls'),
(223, 'Togo', 'tg', 'tgo'),
(224, 'Tokelau', 'tk', 'tkl'),
(225, 'Tonga', 'to', 'ton'),
(226, 'Trinidad and Tobago', 'tt', 'tto'),
(227, 'Tunisia', 'tn', 'tun'),
(228, 'Turkey', 'tr', 'tur'),
(229, 'Turkmenistan', 'tm', 'tkm'),
(230, 'Turks and Caicos Islands', 'tc', 'tca'),
(231, 'Tuvalu', 'tv', 'tuv'),
(232, 'Uganda', 'ug', 'uga'),
(233, 'Ukraine', 'ua', 'ukr'),
(234, 'United Arab Emirates', 'ae', 'are'),
(235, 'United Kingdom', 'gb', 'gbr'),
(236, 'United States', 'us', 'usa'),
(237, 'United States Minor Outlying Islands', 'um', ''),
(238, 'Uruguay', 'uy', 'ury'),
(239, 'Uzbekistan', 'uz', 'uzb'),
(240, 'Vanuatu', 'vu', 'vut'),
(241, 'Venezuela, Bolivarian Republic of', 've', 'ven'),
(242, 'Viet Nam', 'vn', 'vnm'),
(243, 'Virgin Islands, British', 'vg', 'vgb'),
(244, 'Virgin Islands, U.S.', 'vi', 'vir'),
(245, 'Wallis and Futuna', 'wf', 'wlf'),
(246, 'Western Sahara', 'eh', 'esh'),
(247, 'Yemen', 'ye', 'yem'),
(248, 'Zambia', 'zm', 'zmb'),
(249, 'Zimbabwe', 'zw', 'zwe');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_bin NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `email` varchar(128) COLLATE utf8_bin NOT NULL,
  `role` varchar(100) COLLATE utf8_bin NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `updated_at`, `created_at`) VALUES
(23, 'demo', '$1$U93.Na1.$m064VJmANMz/fmJEcfK7m0', '', '', '0000-00-00', '0000-00-00'),
(24, 'Doh-a', '$2y$08$4vmHA1cmBe0SorYiA6EZPebgKmEuN.gaCVESziP1mfEWOm86SYulu', 'etiennesainton@gmail.com', '', '2014-03-09', '2014-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `user_avatar`
--

CREATE TABLE IF NOT EXISTS `user_avatar` (
  `avatar_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`avatar_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_avatar`
--

INSERT INTO `user_avatar` (`avatar_id`, `user_id`, `start_date`) VALUES
(1, 24, '2014-06-01 16:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_biere`
--

CREATE TABLE IF NOT EXISTS `user_biere` (
  `user_biere_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_user` mediumint(9) NOT NULL,
  `id_biere` int(11) NOT NULL,
  `note_biere` float(4,2) NOT NULL,
  `classement_biere` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_biere_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_biere`
--

INSERT INTO `user_biere` (`user_biere_id`, `id_user`, `id_biere`, `note_biere`, `classement_biere`, `updated_at`, `created_at`) VALUES
(1, 22, 1, 1.50, NULL, '2014-06-08 21:29:42', '0000-00-00 00:00:00'),
(2, 23, 1, 3.00, NULL, '2014-06-08 21:29:42', '0000-00-00 00:00:00'),
(4, 24, 1, 4.00, NULL, '2014-06-08 19:50:34', '2014-06-08 19:50:34');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authassignment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

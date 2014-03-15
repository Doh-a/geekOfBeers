-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2014 at 06:46 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
  PRIMARY KEY (`id_biere`),
  KEY `couleur` (`couleur`),
  KEY `fermentation` (`fermentation`),
  KEY `maltage` (`maltage`),
  KEY `type` (`type`),
  KEY `type2` (`type2`),
  KEY `brasserie` (`brasserie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `biere`
--

INSERT INTO `biere` (`id_biere`, `nom_biere`, `degre`, `note_communaute`, `etiquette`, `couleur`, `fermentation`, `maltage`, `type`, `type2`, `brasserie`) VALUES
(1, 'Taras Boulba', 4.50, 3.50, 'taras_boulba.png', 1, 2, 2, 25, 0, 1);

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
  PRIMARY KEY (`id_brasserie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `brasserie`
--

INSERT INTO `brasserie` (`id_brasserie`, `nom_brasserie`, `description_brasserie`, `coords_brasserie`, `img`) VALUES
(1, 'Brasserie de la Senne', 'Les bières de la Brasserie de la Senne sont produites par deux brasseurs bruxellois passionnés: Yvan De Baets et Bernard Leboucq.\r\nIls œuvrent dans une petite brasserie artisanale, et mettent un point d’honneur à fabriquer des bières à l’ancienne, non filtrées, non pasteurisées, exemptes de tout additif, en utilisant uniquement des matières premières nobles de première qualité. L’exigence de qualité et l’absence de compromis sont en effet une des marques de fabrique de la brasserie.\r\nCes bières, à la saveur complexe et à la personnalité bien marquée sont de véritables bières de caractère, made in Brussels.', '', 'brasseriedelasenne.png'),
(2, 'Abbaye Notre-Dame de Koningshoeven', 'Brasse La Trappe. Actuellement véritable trappiste, a perdu son titre quelques temps.', '', '');

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
-- Table structure for table `user_biere`
--

CREATE TABLE IF NOT EXISTS `user_biere` (
  `id_user` mediumint(9) NOT NULL,
  `id_biere` int(11) NOT NULL,
  `note_biere` float(4,2) NOT NULL,
  `description_biere` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `classement_biere` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_biere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_biere`
--

INSERT INTO `user_biere` (`id_user`, `id_biere`, `note_biere`, `description_biere`, `classement_biere`) VALUES
(22, 1, 4.00, 'Cette blonde a un gout assez prononcé avec pas mal d''amertume. Un peut forte mais encore tout à fait appréciable en apéro. On retrouve ici le style habituel de la brasserie de la Senne.', NULL),
(23, 1, 3.00, NULL, NULL);

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

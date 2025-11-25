-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 25 nov. 2025 à 10:48
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `garage`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_article`
--

DROP TABLE IF EXISTS `g_article`;
CREATE TABLE IF NOT EXISTS `g_article` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_reference` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_designation` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_marque` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_quantite` int NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_article`
--

INSERT INTO `g_article` (`a_id`, `a_reference`, `a_designation`, `a_marque`, `a_quantite`) VALUES
(1, '6464646', 'filtre à air', 'VALEO', 10),
(2, '1234567', 'filtre à particules', 'BOSH', 25),
(3, '2345671', 'essuie_glaces', 'BOSH', 12),
(4, '3456712', 'Pneux routes', 'Michelin', 24),
(5, '4567123', 'bougies d\'allumages ', 'Oscaro', 35);

-- --------------------------------------------------------

--
-- Structure de la table `g_voiture`
--

DROP TABLE IF EXISTS `g_voiture`;
CREATE TABLE IF NOT EXISTS `g_voiture` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_marque` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_energie` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_fk_article` int NOT NULL,
  PRIMARY KEY (`v_id`),
  KEY `v_fk_article` (`v_fk_article`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_voiture`
--

INSERT INTO `g_voiture` (`v_id`, `v_marque`, `v_type`, `v_energie`, `v_fk_article`) VALUES
(1, 'Citroen', 'C3', 'Essence', 1),
(2, 'Kia', 'Picanto', 'Electrique', 1),
(3, 'Fiat', 'Panda', 'Essence', 3),
(4, 'Seat', 'Ibiza', 'Essence', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_voiture`
--
ALTER TABLE `g_voiture`
  ADD CONSTRAINT `g_voiture_ibfk_1` FOREIGN KEY (`v_fk_article`) REFERENCES `g_article` (`a_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

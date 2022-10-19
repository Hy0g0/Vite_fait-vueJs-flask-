-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306

-- Généré le : mar. 04 oct. 2022 à 09:18

-- Version du serveur : 8.0.30-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `JobBoard`
--

-- --------------------------------------------------------

--
-- Structure de la table `Advertisement`
--

CREATE TABLE `Advertisement` (
  `id` int NOT NULL,
  `advertisementCategory` varchar(50) NOT NULL,
  `publishedDate` date DEFAULT NULL,
  `advertisementName` varchar(255) NOT NULL,
  `advertisementDescription` varchar(255) NOT NULL,
  `salary` int NOT NULL,
  `contractType` varchar(255) NOT NULL,
  `advertisementlocation` varchar(255) NOT NULL,
  `idcompany` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Advertisement`
--

INSERT INTO `Advertisement` (`id`, `advertisementCategory`, `publishedDate`, `advertisementName`, `advertisementDescription`, `salary`, `contractType`, `advertisementlocation`, `idcompany`) VALUES
(1, '', '2022-09-29', 'test', 'test', 1234, 'test', 'test', 1),
(2, '', '2022-09-29', 'test', 'test', 1234, 'test', 'test', 1),
(3, '', '2022-09-29', 'test', 'test', 1234, 'test', 'test', 1),
(4, '', '2022-09-29', 'test', 'test', 1234, 'test', 'test', 1),
(5, '', '2022-09-29', 'test', 'test', 1234, 'test', 'test', 1),
(6, '', '2022-09-29', 'test', 'test', 1234, 'test', 'test', 1),
(12, '', '2022-09-30', 'toto', 'toto', 1234, 'toto', 'toto', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Company`
--

CREATE TABLE `Company` (
  `idcompany` int NOT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `Company`
--

INSERT INTO `Company` (`idcompany`, `companyName`, `mail`) VALUES
(1, 'empty', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `InteractionsInfos`
--

CREATE TABLE `InteractionsInfos` (

  `id` int NOT NULL,
  `actiontype` varchar(50) DEFAULT NULL,
  `advertisement` int DEFAULT NULL,
  `userid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Déchargement des données de la table `InteractionsInfos`
--

INSERT INTO `InteractionsInfos` (`id`, `actiontype`, `advertisement`, `userid`) VALUES
(1, 'post', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `iduser` int NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `company` int DEFAULT NULL,
  `mdp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`iduser`, `userName`, `userFirstName`, `isAdmin`, `mail`, `phone`, `company`, `mdp`) VALUES
(1, 'Hugo', 'Vincent', 1, 'hvincent134@gmail.com', '+33768701178', NULL, '92e48662f4f2e541b34cce1a54db5e68'),
(22, 'Fessiane', 'Medhi', 0, 'medhi@gmail.com', '+33765842265', NULL, '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Advertisement`
--
ALTER TABLE `Advertisement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcompany` (`idcompany`);

--

-- Index pour la table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`idcompany`);

--
-- Index pour la table `InteractionsInfos`
--
ALTER TABLE `InteractionsInfos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement` (`advertisement`),
  ADD KEY `userid` (`userid`);

--

-- Index pour la table `Users`
--
ALTER TABLE `Users`

  ADD PRIMARY KEY (`iduser`),
  ADD KEY `company` (`company`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Advertisement`
--
ALTER TABLE `Advertisement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--

-- AUTO_INCREMENT pour la table `Company`
--
ALTER TABLE `Company`
  MODIFY `idcompany` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `InteractionsInfos`
--
ALTER TABLE `InteractionsInfos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`

  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Advertisement`
--
ALTER TABLE `Advertisement`

  ADD CONSTRAINT `Advertisement_ibfk_1` FOREIGN KEY (`idcompany`) REFERENCES `Company` (`idcompany`);

--
-- Contraintes pour la table `InteractionsInfos`
--
ALTER TABLE `InteractionsInfos`
  ADD CONSTRAINT `InteractionsInfos_ibfk_1` FOREIGN KEY (`advertisement`) REFERENCES `Advertisement` (`id`),
  ADD CONSTRAINT `InteractionsInfos_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `Users` (`iduser`);

--
-- Contraintes pour la table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`company`) REFERENCES `Company` (`idcompany`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
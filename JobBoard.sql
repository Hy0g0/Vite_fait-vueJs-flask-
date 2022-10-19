-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : dim. 16 oct. 2022 à 19:40
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
  `advertisementDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salary` int NOT NULL,
  `contractType` varchar(255) NOT NULL,
  `advertisementlocation` varchar(255) NOT NULL,
  `idcompany` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Advertisement`
--

INSERT INTO `Advertisement` (`id`, `advertisementCategory`, `publishedDate`, `advertisementName`, `advertisementDescription`, `salary`, `contractType`, `advertisementlocation`, `idcompany`) VALUES
(24, 'Informatique', '2022-02-17', 'Développeur Node/React/Vue', 'enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu', 4527, 'CDI', 'Basse-Normandie', 17),
(25, 'Informatique', '2023-03-12', 'Développeur PHP5 H/F / Freelance', 'ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,', 1563, 'CDD', 'Nordrhein-Westphalen', 17),
(26, 'Informatique', '2022-08-08', 'Développeur Java Junior', 'nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum', 2498, 'Alternance', 'Oaxaca', 15),
(27, 'Informatique', '2022-01-14', 'Développeur React JS', 'faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,', 3685, 'Stage', 'Ulster', 17),
(28, 'Informatique', '2021-11-07', 'Développeur (se) javascript', 'ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis,', 3750, 'CDI', 'East Region', 17),
(29, 'Informatique', '2023-07-13', 'Developpeur Web H/F', 'tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,', 2632, 'CDI', 'Cajamarca', 17),
(30, 'Informatique', '2023-02-04', 'Développeur PHP/Symfony', 'senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.', 2068, 'CDD', 'Anglesey', 18),
(31, 'Informatique', '2023-09-05', 'Développeur Python Junior', 'aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl', 2316, 'Alternance', 'Lai Châu', 14),
(32, 'Informatique', '2023-06-25', 'Développeur Front-end', 'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae,', 4648, 'CDI', 'Waals-Brabant', 13),
(33, 'Informatique', '2022-02-22', 'Développeur C# .Net', 'odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean', 2377, 'Stage', 'Davao Region', 12);

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
(12, 'Quis Tristique Institute', 'ut.erat.sed@outlook.net'),
(13, 'Egestas Industries', 'condimentum.donec@aol.com'),
(14, 'Imperdiet Ornare Foundation', 'conubia.nostra@aol.couk'),
(15, 'Metus Sit PC', 'suspendisse@hotmail.couk'),
(16, 'Ut Nisi Inc.', 'diam.duis@aol.com'),
(17, 'Nullam LLC', 'enim@aol.net'),
(18, 'Ultrices Mauris Associates', 'euismod@yahoo.com'),
(19, 'Risus In PC', 'luctus.lobortis.class@yahoo.couk');

-- --------------------------------------------------------

--
-- Structure de la table `InteractionsInfos`
--

CREATE TABLE `InteractionsInfos` (
  `id` int NOT NULL,
  `msgPostuler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `advertisement` int DEFAULT NULL,
  `userid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `InteractionsInfos`
--

INSERT INTO `InteractionsInfos` (`id`, `msgPostuler`, `advertisement`, `userid`) VALUES
(52, 'dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel,', 28, 31),
(53, 'fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin', 30, 31),
(54, 'Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis', 29, 28),
(55, 'at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et', 32, 31),
(56, 'felis. Donec tempor, est ac mattis semper, dui lectus rutrum', 25, 28),
(57, 'nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem', 27, 28),
(58, 'Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam', 30, 31),
(59, 'nulla magna, malesuada vel, convallis in, cursus et, eros. Proin', 33, 32),
(60, 'erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse', 29, 29),
(61, 'lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.', 29, 30),
(62, 'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam', 32, 30),
(63, 'imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at', 31, 28),
(64, 'ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor', 31, 30),
(65, 'Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum', 32, 32),
(66, 'lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac', 27, 29);

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
(1, 'Hugo', 'Vincent', 1, 'hvincent134@gmail.com', ' 33768701178', NULL, '92e48662f4f2e541b34cce1a54db5e68'),
(24, 'Fessiane', 'Mehdi', 1, 'mehdifessiane@gmail.com', '0628933254', 13, '63a9f0ea7bb98050796b649e85481845'),
(28, 'Kirkland', 'Skyler', 0, 'ut.quam@outlook.couk', '0547554642', NULL, '63a9f0ea7bb98050796b649e85481845'),
(29, 'O\'connor', 'Roth', 0, 'mauris@hotmail.couk', '0880752347', 14, '63a9f0ea7bb98050796b649e85481845'),
(30, 'Perry', 'Kaye', 0, 'mi.duis@outlook.com', '0762637478', 16, '63a9f0ea7bb98050796b649e85481845'),
(31, 'Boone', 'Sonia', 0, 'dui.augue@outlook.net', '0603433618', 18, '63a9f0ea7bb98050796b649e85481845'),
(32, 'Dillard', 'Burton', 0, 'libero.morbi@google.edu', '0272726942', NULL, '63a9f0ea7bb98050796b649e85481845');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `Company`
--
ALTER TABLE `Company`
  MODIFY `idcompany` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `InteractionsInfos`
--
ALTER TABLE `InteractionsInfos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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

-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 12 jan. 2022 à 07:58
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `site`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(3) NOT NULL,
  `id_membre` int(3) DEFAULT NULL,
  `montant` int(3) NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `etat` enum('en cours de traitement','envoyé','livré') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_membre`, `montant`, `date_enregistrement`, `etat`) VALUES
(1, 4, 301, '2015-07-10 14:44:46', 'en cours de traitement'),
(2, 5, 499, '2022-01-11 04:25:56', 'en cours de traitement'),
(3, 5, 520, '2022-01-11 05:06:48', 'en cours de traitement');

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id_details_commande` int(3) NOT NULL,
  `id_commande` int(3) DEFAULT NULL,
  `id_produit` int(3) DEFAULT NULL,
  `quantite` int(3) NOT NULL,
  `prix` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`id_details_commande`, `id_commande`, `id_produit`, `quantite`, `prix`) VALUES
(1, 1, 2, 1, 15),
(2, 1, 6, 1, 49),
(3, 1, 8, 3, 79),
(4, 2, 1, 1, 499),
(5, 3, 4, 1, 21),
(6, 3, 1, 1, 499);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id_membre` int(3) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(32) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `civilite` enum('m','f') NOT NULL,
  `ville` varchar(20) NOT NULL,
  `code_postal` int(5) UNSIGNED ZEROFILL NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `statut` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`) VALUES
(1, 'juju', 'soleil', 'Cottet', 'Julien', 'julien.cottet@gmail.com', 'm', 'Paris', 75015, '300 rue de vaugirard', 0),
(2, 'lamarie', 'planete', 'thoyer', 'marie', 'marie.thoyer@yahoo.fr', 'f', 'Lyon', 69003, '10 rue paul bert', 0),
(3, 'fab', 'avatar13', 'grand', 'fabrice', 'fabrice.grand@gmail.com', 'm', 'Marseille', 13009, '70 rue de la république', 0),
(4, 'membre', 'membre', 'membre', 'membre', 'membre@exemple.com', 'f', 'Toulouse', 31000, '55 rue bayard', 0),
(5, 'admin', 'admin', 'admin', 'admin', 'admin@exemple.com', 'm', 'Paris', 75015, '33 rue mademoiselle', 1),
(6, 'David', 'gfgdgfd', 'fdg', 'gfdg', 'atsin2002@gmail.com', 'm', 'Lemans', 72000, '16 Boulevard Charle Nicolle', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(3) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `taille` varchar(5) NOT NULL,
  `public` enum('m','f','mixte') NOT NULL,
  `photo` varchar(250) NOT NULL,
  `prix` int(3) NOT NULL,
  `stock` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `reference`, `categorie`, `titre`, `description`, `couleur`, `taille`, `public`, `photo`, `prix`, `stock`) VALUES
(1, 'ps5', 'Console de jeux', 'PS5', 'PlayStation 5 avec lecteur Blu-ray. Une console révolutionnaire entièrement centrée sur le joueur pour des expériences encore plus immersives et connectées avec vos jeux PS5 et PS4 rétrocompatibles.\r\nTemps de chargement quasi instantanés pour les jeux PS5 (installés) grâce à un disque SSD ultra-haute vitesse, Interface utilisateur conçue pour fournir un accès immédiat à presque toutes les options du système sans quitter votre partie', 'Blanc', '390', 'mixte', 'https://m.media-amazon.com/images/I/51zylG5gxfS._AC_SL1000_.jpg', 499, 20),
(2, 'xbox', 'Console de jeux', 'Xbox Series X', 'Découvrez la toute nouvelle Xbox dernière génération, la plus puissante et la plus rapide jamais conçue avec son lecteur Blu-ray 4K\r\n4K / 8K HDR - Plongez dans des univers ultra détaillés avec une résolution native 4K HDR . Compatible avec la technologie 8K HDR en connectant votre Xbox Series X à votre téléviseur 8K pour jouer dans les meilleures conditions grâce à la mise à l\'échelle (4320p)\r\n120 FPS - La Xbox Series S permet un rendu encore plus fluide et dynamique allant jusqu’à 120 images par seconde (compatible Fortnite, Call of Duty : Warzone, Rocket League etc)\r\nDisque SSD 1To - Profitez d’un espace de stockage important pour tous vos jeux avec le disque SSD de 1 To pour des chargements rapides et des reprises de jeux instantanées', 'Noir', '', 'mixte', 'https://m.media-amazon.com/images/I/61NYGA3iDKL._AC_SL1500_.jpg', 499, 20),
(3, 'Nintendo', 'Console de jeux', 'Nintendo Switch Oled', 'La Nintendo Switch (modèle OLED) possède des dimensions proches de celles de la Nintendo Switch\r\nElle dispose d’un écran OLED plus grand aux couleurs intenses et aux contrastes élevés\r\nElle dispose aussi d’un large support ajustable pour le jeu en mode sur table, d’une nouvelle station d’accueil.', 'Noir', '', 'mixte', 'https://m.media-amazon.com/images/I/71Q54HnKxwS._AC_SL1500_.jpg', 399, 10),
(4, 'mono', 'Jeux de Societe', 'Monopoly Builder', 'UNE VARIANTE DU MONOPOLY ORDINAIRE : Ce jeu de stratégie permet aux joueurs d\'acheter des propriétés pour construire des bâtiments physiques avec les blocs de construction\r\nJEU AMUSANT POUR LA FAMILLE : Les joueurs (à partir de 8 ans) peuvent s\'affronter dans un défi amusant alors qu\'ils tentent d\'obtenir le plus de points pour gagner\r\nUN JEU STRATÉGIQUE dans lequel les joueurs récupèrent des ressources pour construire leurs tours. La compétition et les interactions sociales s\'intensifient au fur et à mesure que les joueurs empilent leurs blocs pour construire en hauteur\r\nUN JEU AMUSANT : À ce Monopoly, les joueurs ne font pas qu\'acheter des propriétés, ils construisent sur l\'île Monopoly\r\nVICTOIRE : Une fois le penthouse construit, le joueur avec le plus de points remporte la partie de Monopoly Builder', '', '', 'mixte', 'https://m.media-amazon.com/images/I/812B2bWXctL._AC_SL1500_.jpg', 21, 5),
(5, 'mm', 'Jeux de Societe', 'Mache-Mot', 'Mâche-mots enfants contre parent: jeu de société où le but est de remporter les cartes en devinant correctement les expressions. Équipe qui a le plus de cartes à la fin de la partie est déclarée gagnante.\r\nPrincipe du jeu: divisez les joueurs en équipes. Nous vous recommandons que les enfants affrontent les parents. Chaque équipe prend une pile de cartes (enfants et parents). les équipes font tour à tour deviner les expressions. L\'équipe qui a le plus de carte à la fin de la partie, gagne !\r\nDe 4 à 10 joueurs. Temps de la partie: environ 30 minutes. Âge recommandé: à partir de 8 ans.\r\nAccessoires inclus: 6 mâche-mots pour les enfants, 4 mâche-mots pour les adultes, 200 cartes recto-verso (100 pour les enfants, 100 pour les parents), sablier et les règles du jeu en français. Aucune pile n’est nécessaire.', '', '', 'mixte', 'https://m.media-amazon.com/images/I/81283++1MAL._AC_SL1500_.jpg', 27, 12),
(6, 'p4', 'Jeux de Societe', 'Puissance  4', 'LE JEU DU 4 EN LIGNE : On tente d\'aligner 4 jetons de la même couleur pour gagner.\r\nJEU PUISSANCE 4 CLASSIQUE : Qui n\'a pas de souvenir d\'enfance de Puissance 4 ? Ce jeu amusant pour toute la famille permet d\'initier les enfants d\'aujourd\'hui à l\'univers de Puissance 4. À partir de 6 ans\r\nJEU DE STRATÉGIE CAPTIVANT : Qui dominera la grille ? Dans Puissance 4, la stratégie est au cœur de la compétition. On tente d\'aligner les jetons et de bloquer son adversaire pour finalement réussir un 4 en ligne de la même couleur et gagner\r\nUN JEU AMUSANT POUR LES ENFANTS : La tradition se poursuit avec Puissance 4, un jeu classique pour les enfants. À partir de 6 ans', '', '', 'mixte', 'https://m.media-amazon.com/images/I/815vtnpD1kL._AC_SL1500_.jpg', 12, 4),
(7, 'evsp', 'Jeux de Societe', 'Enfants vs Parents', 'APPRENDRE PAR LE JEU Pourquoi le soleil fait-il? Pourquoi l\'herbe est-elle verte? Pourquoi le zèbre a-t-il des bretelles? Jeu de société éducatif dans lequel deux équipes, enfants et parents, répondent à de nombreuses questions intéressantes sur tout ce qui nous entoure', '', '', 'mixte', 'https://m.media-amazon.com/images/I/51grlmgd5NL._AC_.jpg', 12, 45),
(11, 'xboxs', 'Console de jeux', 'Xbox Series S', 'Découvrez la toute nouvelle Xbox Series S, notre Xbox la plus compacte de tous les temps, 100% Digitale, une console next-gen à un prix accessible\r\n4K HDR - Plongez dans des univers ultra détaillés avec une résolution interne 1080p HDR. Compatible avec la technologie 4K HDR en connectant votre Xbox Series S à votre téléviseur 4K pour jouer dans de meilleurs conditions grâce à la mise à l\'échelle (2160p)\r\n120 FPS - La Xbox Series S permet un rendu encore plus fluide et dynamique allant jusqu’à 120 images par seconde (compatible Fortnite, Call of Duty : Warzone, Rocket League etc)', 'Blanc', '', 'mixte', 'https://m.media-amazon.com/images/I/61-x29sqlpS._AC_SL1500_.jpg', 299, 12);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id_details_commande`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id_details_commande` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

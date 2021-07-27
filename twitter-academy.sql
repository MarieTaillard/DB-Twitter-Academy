-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 06 fév. 2018 à 10:47
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
-- Base de données :  `common-database`
--
CREATE DATABASE IF NOT EXISTS `tweet-academy` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tweet-academy`;

-- --------------------------------------------------------

--
-- Structure de la table `directmessage`
--

CREATE TABLE `directmessage` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `content` varchar(140) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int NOT NULL,
  `id_dest` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tweet` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `follow`
--

CREATE TABLE `follow` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_user_follow` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hashtag`
--

CREATE TABLE `hashtag` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hashtagontweets`
--

CREATE TABLE `hashtagontweets` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tweet` int NOT NULL,
  `id_hashtag` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='liste des hastags lié aux tweets';

-- --------------------------------------------------------

--
-- Structure de la table `reply`
--

CREATE TABLE `reply` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tweet_origin` int NOT NULL,
  `id_tweet_parent` int NOT NULL,
  `id_tweet` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `retweets`
--

CREATE TABLE `retweets` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tweet` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tweet`
--

CREATE TABLE `tweet` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `content` varchar(140) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `picture` varchar(16) DEFAULT NULL,
  `theme` enum('Blue','Red','Orange','Dark','Pink') NOT NULL DEFAULT 'Blue'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

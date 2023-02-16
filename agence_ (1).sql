-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 12:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agence_`
--
CREATE DATABASE IF NOT EXISTS `agence_` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `agence_`;

-- --------------------------------------------------------

--
-- Table structure for table `anonnce`
--

DROP TABLE IF EXISTS `anonnce`;
CREATE TABLE `anonnce` (
  `id_anonnce` int(50) NOT NULL,
  `titre_anonnce` tinytext DEFAULT NULL,
  `prix_anonnce` decimal(30,0) DEFAULT NULL,
  `adresse_anonnce` varchar(30) DEFAULT NULL,
  `type_anonnce` varchar(30) DEFAULT NULL,
  `categorie_anonnce` varchar(30) DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `date_modification` date DEFAULT NULL,
  `id_client` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id_client` int(50) NOT NULL,
  `nom_client` tinytext DEFAULT NULL,
  `prenom_client` tinytext DEFAULT NULL,
  `email_client` varchar(50) DEFAULT NULL,
  `motdepass_client` varchar(50) DEFAULT NULL,
  `telephone_client` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `url_image_principale` varchar(500) DEFAULT NULL,
  `url_image` varchar(500) DEFAULT NULL,
  `id_anonnce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anonnce`
--
ALTER TABLE `anonnce`
  ADD PRIMARY KEY (`id_anonnce`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_anonnce` (`id_anonnce`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anonnce`
--
ALTER TABLE `anonnce`
  ADD CONSTRAINT `anonnce_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`id_anonnce`) REFERENCES `anonnce` (`id_anonnce`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

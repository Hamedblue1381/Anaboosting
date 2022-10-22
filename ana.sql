-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 11:25 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ana`
--
CREATE DATABASE IF NOT EXISTS `ana` DEFAULT CHARACTER SET utf8 COLLATE utf8_persian_ci;
USE `ana`;

-- --------------------------------------------------------

--
-- Table structure for table `battlecup`
--

CREATE TABLE `battlecup` (
  `ID` int(255) NOT NULL,
  `btlcuptier` int(11) NOT NULL,
  `btlcupteam` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `username` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `steampass` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `accepted` date NOT NULL,
  `finished` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `battlecup`
--

INSERT INTO `battlecup` (`ID`, `btlcuptier`, `btlcupteam`, `username`, `steampass`, `accepted`, `finished`) VALUES
(4004, 1, 'Balanars', 'hamedbooster', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `boosters`
--

CREATE TABLE `boosters` (
  `ID` int(255) NOT NULL,
  `username` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(35) COLLATE utf8_persian_ci NOT NULL,
  `number` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `boosterstat` int(11) NOT NULL,
  `coachstat` int(11) NOT NULL,
  `calibratestat` int(11) NOT NULL,
  `battlecupstat` int(11) NOT NULL,
  `score` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `boosters`
--

INSERT INTO `boosters` (`ID`, `username`, `email`, `password`, `number`, `boosterstat`, `coachstat`, `calibratestat`, `battlecupstat`, `score`) VALUES
(8, 'hamedbooster', 'farbod.meghdad@gmail.com', '1234', '1234', 1, 1, 1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `boostmmr`
--

CREATE TABLE `boostmmr` (
  `ID` int(255) NOT NULL,
  `startmmr` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `finishmmr` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `soloparty` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `username` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `steampass` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `accepted` date NOT NULL,
  `finished` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `boostmmr`
--

INSERT INTO `boostmmr` (`ID`, `startmmr`, `finishmmr`, `role`, `soloparty`, `username`, `steampass`, `accepted`, `finished`) VALUES
(1004, '1500', '3500', 'CORE', 'solo', 'hamedbooster', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `calibrate`
--

CREATE TABLE `calibrate` (
  `ID` int(255) NOT NULL,
  `oldrank` varchar(11) COLLATE utf8_persian_ci NOT NULL,
  `new` varchar(11) COLLATE utf8_persian_ci NOT NULL,
  `username` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `steampass` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `accepted` date NOT NULL,
  `finished` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `calibrate`
--

INSERT INTO `calibrate` (`ID`, `oldrank`, `new`, `username`, `steampass`, `accepted`, `finished`) VALUES
(3004, 'its new', 'new', 'hamedbooster', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `ID` int(255) NOT NULL,
  `coachmmr` int(20) NOT NULL,
  `role` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `username` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `steampass` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `accepted` date NOT NULL,
  `finished` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`ID`, `coachmmr`, `role`, `username`, `steampass`, `accepted`, `finished`) VALUES
(2003, 3400, ' SUPPORT ', 'hamedbooster', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `finished`
--

CREATE TABLE `finished` (
  `ID` int(255) NOT NULL,
  `username` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `booster_name` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `accepted` date NOT NULL,
  `finished` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `finished`
--

INSERT INTO `finished` (`ID`, `username`, `booster_name`, `accepted`, `finished`) VALUES
(4003, 'Hamedana', 'hamedbooster', '2022-10-22', '2022-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `inprogress`
--

CREATE TABLE `inprogress` (
  `ID` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `booster_name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `accepted` date NOT NULL,
  `finished` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `steampass` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(35) COLLATE utf8_persian_ci NOT NULL,
  `number` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `user_type` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `steampass`, `password`, `number`, `user_type`) VALUES
('admin', 'admin@admin.ir', 'admin', 'admin', '1234', 1),
('hamedam', 'hamed.balanar@gmail.com', 'hamedsteam', '1234', '95689', 0),
('Hamedana', 'hamedana@ana.ir', 'hamedanasteam', '1234', '968753', 0),
('hamedbalanar', 'hamed.balanar@gmail.com', '1234', '1234', '922769', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `battlecup`
--
ALTER TABLE `battlecup`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `boosters`
--
ALTER TABLE `boosters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `boostmmr`
--
ALTER TABLE `boostmmr`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `calibrate`
--
ALTER TABLE `calibrate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `finished`
--
ALTER TABLE `finished`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inprogress`
--
ALTER TABLE `inprogress`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `battlecup`
--
ALTER TABLE `battlecup`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4005;

--
-- AUTO_INCREMENT for table `boosters`
--
ALTER TABLE `boosters`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `boostmmr`
--
ALTER TABLE `boostmmr`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `calibrate`
--
ALTER TABLE `calibrate`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3005;

--
-- AUTO_INCREMENT for table `coach`
--
ALTER TABLE `coach`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2004;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 16, 2017 at 05:12 PM
-- Server version: 5.6.30-1
-- PHP Version: 5.6.7-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mnemonics`
--

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `Sno` bigint(20) UNSIGNED NOT NULL,
  `ChapterNo` varchar(45) DEFAULT NULL,
  `ConceptToRemember` varchar(45) DEFAULT NULL,
  `Mnemonics` varchar(500) DEFAULT NULL,
  `KeyID` varchar(45) DEFAULT NULL,
  `TotalRates` varchar(45) NOT NULL DEFAULT '0',
  `NoRates` bigint(20) NOT NULL DEFAULT '0',
  `AvgRating` varchar(45) NOT NULL DEFAULT '0',
  `AddedBy` varchar(100) DEFAULT NULL,
  `Visible` varchar(45) DEFAULT NULL,
  `Deleted` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`Sno`, `ChapterNo`, `ConceptToRemember`, `Mnemonics`, `KeyID`, `TotalRates`, `NoRates`, `AvgRating`, `AddedBy`, `Visible`, `Deleted`) VALUES
(1, '1.1', 'test', 'dsbvjabduvhadbjknlm;huytdfcghvnbm,ljikuyfdhgcbmnbnklhufyudghcbnm,khkgfghc', '11601', '0', 1, '0', 'bhanuteja', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recovery`
--

CREATE TABLE `recovery` (
  `Sno` int(11) NOT NULL,
  `StudentID` varchar(45) DEFAULT NULL,
  `RecoveryHash` varchar(45) DEFAULT NULL,
  `RecoveryTimeStamp` timestamp NULL DEFAULT NULL,
  `PreviousEmail` varchar(45) DEFAULT NULL,
  `PreviousPassword` varchar(45) DEFAULT NULL,
  `PreviousRecoveryHash` varchar(45) DEFAULT NULL,
  `PreviousRecoveryTimeStamp` varchar(50) DEFAULT NULL,
  `LinkExpired` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recovery`
--

INSERT INTO `recovery` (`Sno`, `StudentID`, `RecoveryHash`, `RecoveryTimeStamp`, `PreviousEmail`, `PreviousPassword`, `PreviousRecoveryHash`, `PreviousRecoveryTimeStamp`, `LinkExpired`) VALUES
(1, 'sd1', 'ecab5ae924699f936727eb16f441f421', NULL, NULL, NULL, NULL, NULL, 1),
(2, '0987', '6ee334c3b48d8bb35ab86f687984d050', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userfavourites`
--

CREATE TABLE `userfavourites` (
  `Sno` bigint(20) UNSIGNED NOT NULL,
  `StudentID` varchar(45) NOT NULL,
  `KeyID` varchar(45) NOT NULL,
  `IsFavourite` tinyint(1) DEFAULT NULL,
  `UniqueEntry` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userfavourites`
--

INSERT INTO `userfavourites` (`Sno`, `StudentID`, `KeyID`, `IsFavourite`, `UniqueEntry`) VALUES
(1, '0987', '11601', 1, 98711601);

-- --------------------------------------------------------

--
-- Table structure for table `userkeysrelation`
--

CREATE TABLE `userkeysrelation` (
  `Sno` int(11) NOT NULL,
  `StudentID` varchar(45) DEFAULT NULL,
  `KeyID` varchar(45) DEFAULT NULL,
  `RateGiven` varchar(45) DEFAULT NULL,
  `UniqueEntry` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userkeysrelation`
--

INSERT INTO `userkeysrelation` (`Sno`, `StudentID`, `KeyID`, `RateGiven`, `UniqueEntry`) VALUES
(1, '0987', '11601', '0', '098711601');

--
-- Triggers `userkeysrelation`
--
DELIMITER $$
CREATE TRIGGER `keyid2` AFTER UPDATE ON `userkeysrelation` FOR EACH ROW UPDATE keywords SET TotalRates = (SELECT NEW.RateGiven FROM userkeysrelation)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Sno` bigint(20) UNSIGNED NOT NULL,
  `StudentID` varchar(45) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Course` varchar(45) DEFAULT NULL,
  `VerificationHash` varchar(500) DEFAULT NULL,
  `Email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `CreateTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LinkExpired` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Sno`, `StudentID`, `UserName`, `Password`, `Email`, `Course`, `VerificationHash`, `Email_verified`, `CreateTimeStamp`, `LinkExpired`) VALUES
(1, '1A0987XCP', 'alexa123', '12345678', 'alexa@gmail.com', 'CSE', NULL, 0, '2017-09-16 07:33:22', 0),
(2, '1WDF78876PC', 'ben123', 'lopkol', 'ben@gmail.com', 'CSE', NULL, 0, '2017-09-16 07:33:26', 0),
(3, '1234', 'username', 'password', 'b@b.com', 'cse', NULL, 0, '2017-09-16 07:33:29', 0),
(25, '0987', 'bhanuteja', 'password', 'bhanuteja.r07@gmail.com', 'cse', '9dc9232dad208b4da9370c271785ba8c', 1, '2017-09-16 11:13:14', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`Sno`),
  ADD UNIQUE KEY `Sno` (`Sno`),
  ADD UNIQUE KEY `ConceptToRemember` (`ConceptToRemember`),
  ADD UNIQUE KEY `KeyID` (`KeyID`);

--
-- Indexes for table `recovery`
--
ALTER TABLE `recovery`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `userfavourites`
--
ALTER TABLE `userfavourites`
  ADD UNIQUE KEY `UniqueEntry` (`UniqueEntry`),
  ADD UNIQUE KEY `Sno` (`Sno`),
  ADD UNIQUE KEY `Sno_2` (`Sno`),
  ADD UNIQUE KEY `Sno_3` (`Sno`),
  ADD UNIQUE KEY `Sno_4` (`Sno`);

--
-- Indexes for table `userkeysrelation`
--
ALTER TABLE `userkeysrelation`
  ADD PRIMARY KEY (`Sno`),
  ADD UNIQUE KEY `EntryUnique` (`UniqueEntry`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Sno`,`StudentID`),
  ADD UNIQUE KEY `StudentID_UNIQUE` (`StudentID`),
  ADD UNIQUE KEY `Sno` (`Sno`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD KEY `StudentID` (`StudentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `Sno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `recovery`
--
ALTER TABLE `recovery`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `userfavourites`
--
ALTER TABLE `userfavourites`
  MODIFY `Sno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `userkeysrelation`
--
ALTER TABLE `userkeysrelation`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Sno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2019 at 09:04 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theatron`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `aut_id` mediumint(8) UNSIGNED NOT NULL,
  `gen_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`aut_id`, `gen_name`) VALUES
(1, 'Henrik Ibsen'),
(2, 'Anton Checkov');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `char_id` int(10) UNSIGNED NOT NULL,
  `char_play_id` mediumint(8) UNSIGNED NOT NULL,
  `char_title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`char_id`, `char_play_id`, `char_title`) VALUES
(1, 2, 'Uncle Vanya'),
(2, 2, 'Astrov');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `gen_id` tinyint(3) UNSIGNED NOT NULL,
  `gen_title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`gen_id`, `gen_title`) VALUES
(3, 'Comedy'),
(1, 'Drama'),
(2, 'Tragedy');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `ppl_id` int(10) UNSIGNED NOT NULL,
  `ppl_title` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`ppl_id`, `ppl_title`) VALUES
(1, 'Κιμούλης');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `per_id` bigint(20) UNSIGNED NOT NULL,
  `per_play_id` mediumint(8) UNSIGNED NOT NULL,
  `per_theater_id` int(10) UNSIGNED NOT NULL,
  `per_director_id` int(10) UNSIGNED NOT NULL,
  `per_duration` smallint(5) UNSIGNED NOT NULL,
  `per_from_date` date NOT NULL,
  `per_to_date` date NOT NULL,
  `per_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`per_id`, `per_play_id`, `per_theater_id`, `per_director_id`, `per_duration`, `per_from_date`, `per_to_date`, `per_created_at`) VALUES
(1, 2, 2, 1, 120, '2019-01-10', '2019-03-06', '2019-01-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `plays`
--

CREATE TABLE `plays` (
  `ply_id` mediumint(8) UNSIGNED NOT NULL,
  `ply_title` varchar(40) NOT NULL,
  `ply_author_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plays`
--

INSERT INTO `plays` (`ply_id`, `ply_title`, `ply_author_id`) VALUES
(1, 'WIlduck', 1),
(2, 'Uncle Vanya', 1);

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `tht_id` int(10) UNSIGNED NOT NULL,
  `tht_name` varchar(40) NOT NULL,
  `tht_address` varchar(80) NOT NULL,
  `tht_active` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`tht_id`, `tht_name`, `tht_address`, `tht_active`) VALUES
(1, 'Χώρα', '', 1),
(2, 'Δημοτικό Πειραιά', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`aut_id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`char_id`),
  ADD KEY `char_play_id` (`char_play_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`gen_id`),
  ADD UNIQUE KEY `gen_title` (`gen_title`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`ppl_id`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`per_id`),
  ADD KEY `per_play_id` (`per_play_id`),
  ADD KEY `per_theater_id` (`per_theater_id`),
  ADD KEY `per_director_id` (`per_director_id`);

--
-- Indexes for table `plays`
--
ALTER TABLE `plays`
  ADD PRIMARY KEY (`ply_id`),
  ADD KEY `ply_author_id` (`ply_author_id`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`tht_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `aut_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `char_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `gen_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `ppl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `per_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plays`
--
ALTER TABLE `plays`
  MODIFY `ply_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `tht_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`char_play_id`) REFERENCES `plays` (`ply_id`);

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`per_director_id`) REFERENCES `people` (`ppl_id`),
  ADD CONSTRAINT `performance_ibfk_2` FOREIGN KEY (`per_play_id`) REFERENCES `plays` (`ply_id`),
  ADD CONSTRAINT `performance_ibfk_3` FOREIGN KEY (`per_theater_id`) REFERENCES `theaters` (`tht_id`);

--
-- Constraints for table `plays`
--
ALTER TABLE `plays`
  ADD CONSTRAINT `plays_ibfk_1` FOREIGN KEY (`ply_author_id`) REFERENCES `authors` (`aut_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

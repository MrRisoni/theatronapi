-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2019 at 07:12 AM
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
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `act_id` int(10) UNSIGNED NOT NULL,
  `act_character_id` int(10) UNSIGNED NOT NULL,
  `act_performance_id` bigint(20) UNSIGNED NOT NULL,
  `act_people_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`act_id`, `act_character_id`, `act_performance_id`, `act_people_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `aut_id` mediumint(8) UNSIGNED NOT NULL,
  `aut_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`aut_id`, `aut_name`) VALUES
(1, 'Henrik Ibsen'),
(2, 'Anton Checkov');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `char_id` int(10) UNSIGNED NOT NULL,
  `char_play_id` mediumint(8) UNSIGNED NOT NULL,
  `char_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`char_id`, `char_play_id`, `char_name`) VALUES
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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ord_id` int(10) UNSIGNED NOT NULL,
  `ord_performance_id` bigint(20) UNSIGNED NOT NULL,
  `ord_date` date NOT NULL,
  `ord_name` varchar(50) NOT NULL,
  `ord_surname` varchar(60) NOT NULL,
  `ord_prefix` varchar(5) NOT NULL,
  `ord_mobile` varchar(15) NOT NULL,
  `ord_email` varchar(50) NOT NULL,
  `ord_ccfees` decimal(4,2) UNSIGNED NOT NULL,
  `ord_tickets` decimal(4,2) UNSIGNED NOT NULL,
  `ord_total` decimal(4,2) UNSIGNED NOT NULL,
  `ord_void` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ord_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `itm_id` int(10) UNSIGNED NOT NULL,
  `itm_order_id` int(10) UNSIGNED NOT NULL,
  `itm_type_id` tinyint(3) UNSIGNED NOT NULL,
  `itm_zone_id` smallint(5) UNSIGNED NOT NULL,
  `itm_seatno` varchar(5) NOT NULL,
  `itm_ticket` varchar(10) NOT NULL,
  `itm_price` decimal(4,2) UNSIGNED NOT NULL,
  `itm_void` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `ppl_id` int(10) UNSIGNED NOT NULL,
  `ppl_fullname` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`ppl_id`, `ppl_fullname`) VALUES
(1, 'Κιμούλης'),
(2, 'Νούσιας');

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
(1, 2, 2, 1, 120, '2018-12-01', '2019-03-06', '2019-01-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `performance_dates`
--

CREATE TABLE `performance_dates` (
  `prd_id` int(10) UNSIGNED NOT NULL,
  `prd_performance_id` bigint(20) UNSIGNED NOT NULL,
  `prd_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'Uncle Vanya', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `pri_id` int(10) UNSIGNED NOT NULL,
  `pri_performance_id` bigint(20) UNSIGNED NOT NULL,
  `pri_zone_id` smallint(5) UNSIGNED NOT NULL,
  `pri_type_id` tinyint(3) UNSIGNED NOT NULL,
  `pri_price` decimal(4,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `typ_id` tinyint(3) UNSIGNED NOT NULL,
  `typ_title` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`typ_id`, `typ_title`) VALUES
(1, 'Κανονικό'),
(2, 'Παιδικό'),
(4, 'Συνταξιούχοι'),
(3, 'Φοιτητικό');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zon_id` smallint(5) UNSIGNED NOT NULL,
  `zon_theater_id` int(10) UNSIGNED NOT NULL,
  `zon_title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`act_id`),
  ADD KEY `act_character_id` (`act_character_id`),
  ADD KEY `act_performance_id` (`act_performance_id`),
  ADD KEY `act_people_id` (`act_people_id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `ord_performance_id` (`ord_performance_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`itm_id`),
  ADD UNIQUE KEY `itm_order_id_2` (`itm_order_id`,`itm_type_id`,`itm_zone_id`,`itm_seatno`,`itm_void`),
  ADD KEY `itm_type_id` (`itm_type_id`),
  ADD KEY `itm_zone_id` (`itm_zone_id`),
  ADD KEY `itm_order_id` (`itm_order_id`);

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
-- Indexes for table `performance_dates`
--
ALTER TABLE `performance_dates`
  ADD PRIMARY KEY (`prd_id`),
  ADD UNIQUE KEY `prd_performance_id_2` (`prd_performance_id`,`prd_date`),
  ADD KEY `prd_performance_id` (`prd_performance_id`);

--
-- Indexes for table `plays`
--
ALTER TABLE `plays`
  ADD PRIMARY KEY (`ply_id`),
  ADD KEY `ply_author_id` (`ply_author_id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`pri_id`),
  ADD KEY `pri_type_id` (`pri_type_id`),
  ADD KEY `pri_zone_id` (`pri_zone_id`),
  ADD KEY `pri_performance_id` (`pri_performance_id`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`tht_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`typ_id`),
  ADD UNIQUE KEY `typ_title` (`typ_title`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zon_id`),
  ADD UNIQUE KEY `zon_theater_id_2` (`zon_theater_id`,`zon_title`),
  ADD KEY `zon_theater_id` (`zon_theater_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `act_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `itm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `ppl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `per_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `performance_dates`
--
ALTER TABLE `performance_dates`
  MODIFY `prd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plays`
--
ALTER TABLE `plays`
  MODIFY `ply_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `pri_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `tht_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `typ_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zon_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actors`
--
ALTER TABLE `actors`
  ADD CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`act_character_id`) REFERENCES `characters` (`char_id`),
  ADD CONSTRAINT `actors_ibfk_2` FOREIGN KEY (`act_people_id`) REFERENCES `people` (`ppl_id`),
  ADD CONSTRAINT `actors_ibfk_3` FOREIGN KEY (`act_performance_id`) REFERENCES `performance` (`per_id`);

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`char_play_id`) REFERENCES `plays` (`ply_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ord_performance_id`) REFERENCES `performance` (`per_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`itm_order_id`) REFERENCES `orders` (`ord_id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`itm_type_id`) REFERENCES `types` (`typ_id`),
  ADD CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`itm_zone_id`) REFERENCES `zones` (`zon_id`);

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`per_director_id`) REFERENCES `people` (`ppl_id`),
  ADD CONSTRAINT `performance_ibfk_2` FOREIGN KEY (`per_play_id`) REFERENCES `plays` (`ply_id`),
  ADD CONSTRAINT `performance_ibfk_3` FOREIGN KEY (`per_theater_id`) REFERENCES `theaters` (`tht_id`);

--
-- Constraints for table `performance_dates`
--
ALTER TABLE `performance_dates`
  ADD CONSTRAINT `performance_dates_ibfk_1` FOREIGN KEY (`prd_performance_id`) REFERENCES `performance` (`per_id`);

--
-- Constraints for table `plays`
--
ALTER TABLE `plays`
  ADD CONSTRAINT `plays_ibfk_1` FOREIGN KEY (`ply_author_id`) REFERENCES `authors` (`aut_id`);

--
-- Constraints for table `pricing`
--
ALTER TABLE `pricing`
  ADD CONSTRAINT `pricing_ibfk_1` FOREIGN KEY (`pri_performance_id`) REFERENCES `performance` (`per_id`),
  ADD CONSTRAINT `pricing_ibfk_2` FOREIGN KEY (`pri_type_id`) REFERENCES `types` (`typ_id`),
  ADD CONSTRAINT `pricing_ibfk_3` FOREIGN KEY (`pri_zone_id`) REFERENCES `zones` (`zon_id`);

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`zon_theater_id`) REFERENCES `theaters` (`tht_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

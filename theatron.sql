-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2019 at 08:54 PM
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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_id`, `ord_performance_id`, `ord_date`, `ord_name`, `ord_surname`, `ord_prefix`, `ord_mobile`, `ord_email`, `ord_ccfees`, `ord_tickets`, `ord_total`, `ord_void`, `ord_created_at`) VALUES
(1, 1, '2019-01-07', '', '', '', '', '', '0.00', '0.00', '0.00', 0, '0000-00-00 00:00:00');

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

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`itm_id`, `itm_order_id`, `itm_type_id`, `itm_zone_id`, `itm_seatno`, `itm_ticket`, `itm_price`, `itm_void`) VALUES
(1, 1, 1, 3, 'F45', '', '0.00', 0),
(2, 1, 1, 3, 'F46', '', '0.00', 0),
(3, 1, 1, 3, 'F47', '', '0.00', 1);

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

--
-- Dumping data for table `performance_dates`
--

INSERT INTO `performance_dates` (`prd_id`, `prd_performance_id`, `prd_date`) VALUES
(1, 1, '2019-01-03'),
(3, 1, '2019-01-07');

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

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`pri_id`, `pri_performance_id`, `pri_zone_id`, `pri_type_id`, `pri_price`) VALUES
(1, 1, 1, 1, '45.00'),
(2, 1, 5, 1, '12.00'),
(3, 1, 3, 4, '15.00'),
(4, 1, 3, 3, '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `seatmap`
--

CREATE TABLE `seatmap` (
  `smp_id` int(10) UNSIGNED NOT NULL,
  `smp_rowid` smallint(5) UNSIGNED NOT NULL,
  `smp_colid` smallint(5) UNSIGNED NOT NULL,
  `smp_zoneid` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `smp_theater_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `smp_seatname` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seatmap`
--

INSERT INTO `seatmap` (`smp_id`, `smp_rowid`, `smp_colid`, `smp_zoneid`, `smp_theater_id`, `smp_seatname`) VALUES
(1, 2, 7, 1, 1, 'FXT'),
(2, 2, 8, 1, 1, 'FXT'),
(3, 2, 9, 1, 1, 'FXT'),
(4, 2, 10, 1, 1, 'FXT'),
(5, 2, 11, 1, 1, 'FXT'),
(6, 2, 12, 1, 1, 'FXT'),
(7, 2, 13, 1, 1, 'FXT'),
(8, 3, 7, 1, 1, 'FXT'),
(9, 3, 8, 1, 1, 'FXT'),
(10, 3, 9, 1, 1, 'FXT'),
(11, 3, 10, 1, 1, 'FXT'),
(12, 3, 11, 1, 1, 'FXT'),
(13, 3, 12, 1, 1, 'FXT'),
(14, 3, 13, 1, 1, 'FXT'),
(15, 5, 7, 1, 1, 'FXT'),
(16, 5, 8, 1, 1, 'FXT'),
(17, 5, 9, 1, 1, 'FXT'),
(18, 5, 10, 1, 1, 'FXT'),
(19, 5, 11, 1, 1, 'FXT'),
(20, 5, 12, 1, 1, 'FXT'),
(21, 5, 13, 1, 1, 'FXT'),
(22, 6, 7, 1, 1, 'FXT'),
(23, 6, 8, 1, 1, 'FXT'),
(24, 6, 9, 1, 1, 'FXT'),
(25, 6, 10, 1, 1, 'FXT'),
(26, 6, 11, 1, 1, 'FXT'),
(27, 6, 12, 1, 1, 'FXT'),
(28, 6, 13, 1, 1, 'FXT'),
(29, 8, 7, 1, 1, 'FXT'),
(30, 8, 8, 1, 1, 'FXT'),
(31, 8, 9, 1, 1, 'FXT'),
(32, 8, 10, 1, 1, 'FXT'),
(33, 8, 11, 1, 1, 'FXT'),
(34, 8, 12, 1, 1, 'FXT'),
(35, 8, 13, 1, 1, 'FXT'),
(36, 9, 7, 1, 1, 'FXT'),
(37, 9, 8, 1, 1, 'FXT'),
(38, 9, 9, 1, 1, 'FXT'),
(39, 9, 10, 1, 1, 'FXT'),
(40, 9, 11, 1, 1, 'FXT'),
(41, 9, 12, 1, 1, 'FXT'),
(42, 9, 13, 1, 1, 'FXT'),
(43, 10, 0, 1, 1, 'FXT'),
(44, 10, 1, 1, 1, 'FXT'),
(45, 10, 3, 1, 1, 'FXT'),
(46, 10, 4, 1, 1, 'FXT'),
(47, 10, 16, 1, 1, 'FXT'),
(48, 10, 17, 1, 1, 'FXT'),
(49, 10, 19, 1, 1, 'FXT'),
(50, 10, 20, 1, 1, 'FXT'),
(51, 11, 0, 1, 1, 'FXT'),
(52, 11, 1, 1, 1, 'FXT'),
(53, 11, 3, 1, 1, 'FXT'),
(54, 11, 4, 1, 1, 'FXT'),
(55, 11, 7, 1, 1, 'FXT'),
(56, 11, 8, 1, 1, 'FXT'),
(57, 11, 9, 1, 1, 'FXT'),
(58, 11, 11, 1, 1, 'FXT'),
(59, 11, 12, 1, 1, 'FXT'),
(60, 11, 13, 1, 1, 'FXT'),
(61, 11, 16, 1, 1, 'FXT'),
(62, 11, 17, 1, 1, 'FXT'),
(63, 11, 19, 1, 1, 'FXT'),
(64, 11, 20, 1, 1, 'FXT'),
(65, 12, 7, 1, 1, 'FXT'),
(66, 12, 8, 1, 1, 'FXT'),
(67, 12, 9, 1, 1, 'FXT'),
(68, 12, 11, 1, 1, 'FXT'),
(69, 12, 12, 1, 1, 'FXT'),
(70, 12, 13, 1, 1, 'FXT'),
(71, 13, 0, 1, 1, 'FXT'),
(72, 13, 1, 1, 1, 'FXT'),
(73, 13, 3, 1, 1, 'FXT'),
(74, 13, 4, 1, 1, 'FXT'),
(75, 13, 7, 1, 1, 'FXT'),
(76, 13, 8, 1, 1, 'FXT'),
(77, 13, 9, 1, 1, 'FXT'),
(78, 13, 11, 1, 1, 'FXT'),
(79, 13, 12, 1, 1, 'FXT'),
(80, 13, 13, 1, 1, 'FXT'),
(81, 13, 16, 1, 1, 'FXT'),
(82, 13, 17, 1, 1, 'FXT'),
(83, 13, 19, 1, 1, 'FXT'),
(84, 13, 20, 1, 1, 'FXT'),
(85, 14, 0, 1, 1, 'FXT'),
(86, 14, 1, 1, 1, 'FXT'),
(87, 14, 3, 1, 1, 'FXT'),
(88, 14, 4, 1, 1, 'FXT'),
(89, 14, 7, 1, 1, 'FXT'),
(90, 14, 8, 1, 1, 'FXT'),
(91, 14, 9, 1, 1, 'FXT'),
(92, 14, 11, 1, 1, 'FXT'),
(93, 14, 12, 1, 1, 'FXT'),
(94, 14, 13, 1, 1, 'FXT'),
(95, 14, 16, 1, 1, 'FXT'),
(96, 14, 17, 1, 1, 'FXT'),
(97, 14, 19, 1, 1, 'FXT'),
(98, 14, 20, 1, 1, 'FXT'),
(99, 15, 7, 1, 1, 'FXT'),
(100, 15, 8, 1, 1, 'FXT'),
(101, 15, 9, 1, 1, 'FXT'),
(102, 15, 11, 1, 1, 'FXT'),
(103, 15, 12, 1, 1, 'FXT'),
(104, 15, 13, 1, 1, 'FXT'),
(105, 16, 0, 1, 1, 'FXT'),
(106, 16, 1, 1, 1, 'FXT'),
(107, 16, 3, 1, 1, 'FXT'),
(108, 16, 4, 1, 1, 'FXT'),
(109, 16, 7, 1, 1, 'FXT'),
(110, 16, 8, 1, 1, 'FXT'),
(111, 16, 9, 1, 1, 'FXT'),
(112, 16, 11, 1, 1, 'FXT'),
(113, 16, 12, 1, 1, 'FXT'),
(114, 16, 13, 1, 1, 'FXT'),
(115, 16, 16, 1, 1, 'FXT'),
(116, 16, 17, 1, 1, 'FXT'),
(117, 16, 19, 1, 1, 'FXT'),
(118, 16, 20, 1, 1, 'FXT'),
(119, 17, 0, 1, 1, 'FXT'),
(120, 17, 1, 1, 1, 'FXT'),
(121, 17, 3, 1, 1, 'FXT'),
(122, 17, 4, 1, 1, 'FXT'),
(123, 17, 7, 1, 1, 'FXT'),
(124, 17, 8, 1, 1, 'FXT'),
(125, 17, 9, 1, 1, 'FXT'),
(126, 17, 11, 1, 1, 'FXT'),
(127, 17, 12, 1, 1, 'FXT'),
(128, 17, 13, 1, 1, 'FXT'),
(129, 17, 16, 1, 1, 'FXT'),
(130, 17, 17, 1, 1, 'FXT'),
(131, 17, 19, 1, 1, 'FXT'),
(132, 17, 20, 1, 1, 'FXT'),
(133, 18, 7, 1, 1, 'FXT'),
(134, 18, 8, 1, 1, 'FXT'),
(135, 18, 9, 1, 1, 'FXT'),
(136, 18, 11, 1, 1, 'FXT'),
(137, 18, 12, 1, 1, 'FXT'),
(138, 18, 13, 1, 1, 'FXT'),
(139, 19, 0, 1, 1, 'FXT'),
(140, 19, 1, 1, 1, 'FXT'),
(141, 19, 3, 1, 1, 'FXT'),
(142, 19, 4, 1, 1, 'FXT'),
(143, 19, 7, 1, 1, 'FXT'),
(144, 19, 8, 1, 1, 'FXT'),
(145, 19, 9, 1, 1, 'FXT'),
(146, 19, 11, 1, 1, 'FXT'),
(147, 19, 12, 1, 1, 'FXT'),
(148, 19, 13, 1, 1, 'FXT'),
(149, 19, 16, 1, 1, 'FXT'),
(150, 19, 17, 1, 1, 'FXT'),
(151, 19, 19, 1, 1, 'FXT'),
(152, 19, 20, 1, 1, 'FXT'),
(153, 20, 0, 1, 1, 'FXT'),
(154, 20, 1, 1, 1, 'FXT'),
(155, 20, 3, 1, 1, 'FXT'),
(156, 20, 4, 1, 1, 'FXT'),
(157, 20, 7, 1, 1, 'FXT'),
(158, 20, 8, 1, 1, 'FXT'),
(159, 20, 9, 1, 1, 'FXT'),
(160, 20, 11, 1, 1, 'FXT'),
(161, 20, 12, 1, 1, 'FXT'),
(162, 20, 13, 1, 1, 'FXT'),
(163, 20, 16, 1, 1, 'FXT'),
(164, 20, 17, 1, 1, 'FXT'),
(165, 20, 19, 1, 1, 'FXT'),
(166, 20, 20, 1, 1, 'FXT'),
(167, 21, 7, 1, 1, 'FXT'),
(168, 21, 8, 1, 1, 'FXT'),
(169, 21, 9, 1, 1, 'FXT'),
(170, 21, 11, 1, 1, 'FXT'),
(171, 21, 12, 1, 1, 'FXT'),
(172, 21, 13, 1, 1, 'FXT'),
(173, 22, 7, 1, 1, 'FXT'),
(174, 22, 8, 1, 1, 'FXT'),
(175, 22, 9, 1, 1, 'FXT'),
(176, 22, 11, 1, 1, 'FXT'),
(177, 22, 12, 1, 1, 'FXT'),
(178, 22, 13, 1, 1, 'FXT'),
(179, 23, 1, 1, 1, 'FXT'),
(180, 23, 3, 1, 1, 'FXT'),
(181, 23, 4, 1, 1, 'FXT'),
(182, 23, 7, 1, 1, 'FXT'),
(183, 23, 8, 1, 1, 'FXT'),
(184, 23, 9, 1, 1, 'FXT'),
(185, 23, 11, 1, 1, 'FXT'),
(186, 23, 12, 1, 1, 'FXT'),
(187, 23, 13, 1, 1, 'FXT'),
(188, 24, 1, 1, 1, 'FXT'),
(189, 24, 3, 1, 1, 'FXT'),
(190, 24, 4, 1, 1, 'FXT'),
(191, 24, 7, 1, 1, 'FXT'),
(192, 24, 8, 1, 1, 'FXT'),
(193, 24, 9, 1, 1, 'FXT'),
(194, 24, 11, 1, 1, 'FXT'),
(195, 24, 12, 1, 1, 'FXT'),
(196, 24, 13, 1, 1, 'FXT');

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
(1, 'ADT'),
(2, 'CHD'),
(4, 'ELD'),
(3, 'STD');

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
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zon_id`, `zon_theater_id`, `zon_title`) VALUES
(3, 1, 'Ζώνη Α'),
(1, 2, 'VIP'),
(2, 2, 'VIP Θεωρεία'),
(4, 2, 'Ζώνη Β'),
(5, 2, 'Μπαλκόνι Α'),
(6, 2, 'Μπαλκόνι Β');

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
-- Indexes for table `seatmap`
--
ALTER TABLE `seatmap`
  ADD PRIMARY KEY (`smp_id`),
  ADD UNIQUE KEY `smp_rowid` (`smp_rowid`,`smp_colid`,`smp_zoneid`,`smp_theater_id`,`smp_seatname`),
  ADD KEY `smp_zoneid` (`smp_zoneid`),
  ADD KEY `smp_theater_id` (`smp_theater_id`);

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
  MODIFY `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `itm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `prd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plays`
--
ALTER TABLE `plays`
  MODIFY `ply_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `pri_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seatmap`
--
ALTER TABLE `seatmap`
  MODIFY `smp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

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
  MODIFY `zon_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Constraints for table `seatmap`
--
ALTER TABLE `seatmap`
  ADD CONSTRAINT `seatmap_ibfk_1` FOREIGN KEY (`smp_zoneid`) REFERENCES `zones` (`zon_id`),
  ADD CONSTRAINT `seatmap_ibfk_2` FOREIGN KEY (`smp_theater_id`) REFERENCES `theaters` (`tht_id`);

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`zon_theater_id`) REFERENCES `theaters` (`tht_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

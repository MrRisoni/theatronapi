-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2019 at 06:03 PM
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
(2, 'Anton Checkov'),
(3, 'Lev Tolstoy');

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
  `itm_seatno` varchar(12) NOT NULL,
  `itm_ticket` varchar(10) NOT NULL,
  `itm_price` decimal(4,2) UNSIGNED NOT NULL,
  `itm_void` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`itm_id`, `itm_order_id`, `itm_type_id`, `itm_seatno`, `itm_ticket`, `itm_price`, `itm_void`) VALUES
(1, 1, 1, 'VIP_R23_C33', '', '0.00', 0),
(2, 1, 1, 'VIP_R23_C34', '', '0.00', 0),
(3, 1, 1, 'VIP_R23_C32', '', '0.00', 1),
(4, 1, 1, 'BALCB_R2_C34', '', '0.00', 0),
(5, 1, 1, 'BALCB_R3_C36', '', '0.00', 0),
(6, 1, 1, 'BALCB_R3_C34', '', '0.00', 0),
(7, 1, 1, 'BALCB_R3_C38', '', '0.00', 0),
(8, 1, 1, 'BALCB_R2_C32', '', '0.00', 0);

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
(2, 'Uncle Vanya', 2),
(3, 'Master and Man', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `pri_id` int(10) UNSIGNED NOT NULL,
  `pri_performance_id` bigint(20) UNSIGNED NOT NULL,
  `pri_zone_id` smallint(5) UNSIGNED NOT NULL,
  `pri_type_id` tinyint(3) UNSIGNED NOT NULL,
  `pri_price` decimal(4,2) UNSIGNED NOT NULL DEFAULT '45.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`pri_id`, `pri_performance_id`, `pri_zone_id`, `pri_type_id`, `pri_price`) VALUES
(1, 1, 1, 1, '45.00'),
(2, 1, 2, 1, '45.00'),
(3, 1, 4, 1, '45.00'),
(4, 1, 3, 1, '45.00'),
(5, 1, 5, 1, '45.00'),
(6, 1, 6, 1, '45.00'),
(7, 1, 7, 1, '45.00'),
(8, 1, 8, 1, '45.00'),
(9, 1, 8, 4, '35.00');

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
  `smp_seatname` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seatmap`
--

INSERT INTO `seatmap` (`smp_id`, `smp_rowid`, `smp_colid`, `smp_zoneid`, `smp_theater_id`, `smp_seatname`) VALUES
(1, 2, 32, 6, 1, 'BALCB_R2_C32'),
(2, 2, 33, 6, 1, 'BALCB_R2_C33'),
(3, 2, 34, 6, 1, 'BALCB_R2_C34'),
(4, 2, 35, 6, 1, 'BALCB_R2_C35'),
(5, 2, 36, 6, 1, 'BALCB_R2_C36'),
(6, 2, 37, 6, 1, 'BALCB_R2_C37'),
(7, 2, 38, 6, 1, 'BALCB_R2_C38'),
(22, 3, 32, 6, 1, 'BALCB_R3_C32'),
(23, 3, 33, 6, 1, 'BALCB_R3_C33'),
(24, 3, 34, 6, 1, 'BALCB_R3_C34'),
(25, 3, 35, 6, 1, 'BALCB_R3_C35'),
(26, 3, 36, 6, 1, 'BALCB_R3_C36'),
(27, 3, 37, 6, 1, 'BALCB_R3_C37'),
(28, 3, 38, 6, 1, 'BALCB_R3_C38'),
(64, 5, 32, 5, 1, 'BALCA_R5_C32'),
(65, 5, 33, 5, 1, 'BALCA_R5_C33'),
(66, 5, 34, 5, 1, 'BALCA_R5_C34'),
(67, 5, 35, 5, 1, 'BALCA_R5_C35'),
(68, 5, 36, 5, 1, 'BALCA_R5_C36'),
(69, 5, 37, 5, 1, 'BALCA_R5_C37'),
(70, 5, 38, 5, 1, 'BALCA_R5_C38'),
(85, 6, 32, 5, 1, 'BALCA_R6_C32'),
(86, 6, 33, 5, 1, 'BALCA_R6_C33'),
(87, 6, 34, 5, 1, 'BALCA_R6_C34'),
(88, 6, 35, 5, 1, 'BALCA_R6_C35'),
(89, 6, 36, 5, 1, 'BALCA_R6_C36'),
(90, 6, 37, 5, 1, 'BALCA_R6_C37'),
(91, 6, 38, 5, 1, 'BALCA_R6_C38'),
(127, 8, 32, 5, 1, 'BALCA_R8_C32'),
(128, 8, 33, 5, 1, 'BALCA_R8_C33'),
(129, 8, 34, 5, 1, 'BALCA_R8_C34'),
(130, 8, 35, 5, 1, 'BALCA_R8_C35'),
(131, 8, 36, 5, 1, 'BALCA_R8_C36'),
(132, 8, 37, 5, 1, 'BALCA_R8_C37'),
(133, 8, 38, 5, 1, 'BALCA_R8_C38'),
(148, 9, 32, 5, 1, 'BALCA_R9_C32'),
(149, 9, 33, 5, 1, 'BALCA_R9_C33'),
(150, 9, 34, 5, 1, 'BALCA_R9_C34'),
(151, 9, 35, 5, 1, 'BALCA_R9_C35'),
(152, 9, 36, 5, 1, 'BALCA_R9_C36'),
(153, 9, 37, 5, 1, 'BALCA_R9_C37'),
(154, 9, 38, 5, 1, 'BALCA_R9_C38'),
(162, 10, 25, 8, 1, 'BOXII_R10_C25'),
(163, 10, 26, 8, 1, 'BOXII_R10_C26'),
(165, 10, 28, 7, 1, 'BOXI_R10_C28'),
(166, 10, 29, 7, 1, 'BOXI_R10_C29'),
(178, 10, 41, 7, 1, 'BOXI_R10_C41'),
(179, 10, 42, 7, 1, 'BOXI_R10_C42'),
(181, 10, 44, 8, 1, 'BOXII_R10_C44'),
(182, 10, 45, 8, 1, 'BOXII_R10_C45'),
(183, 11, 25, 8, 1, 'BOXII_R11_C25'),
(184, 11, 26, 8, 1, 'BOXII_R11_C26'),
(186, 11, 28, 7, 1, 'BOXI_R11_C28'),
(187, 11, 29, 7, 1, 'BOXI_R11_C29'),
(190, 11, 32, 4, 1, 'ZB_R11_C32'),
(191, 11, 33, 4, 1, 'ZB_R11_C33'),
(192, 11, 34, 4, 1, 'ZB_R11_C34'),
(194, 11, 36, 4, 1, 'ZB_R11_C36'),
(195, 11, 37, 4, 1, 'ZB_R11_C37'),
(196, 11, 38, 4, 1, 'ZB_R11_C38'),
(199, 11, 41, 7, 1, 'BOXI_R11_C41'),
(200, 11, 42, 7, 1, 'BOXI_R11_C42'),
(202, 11, 44, 8, 1, 'BOXII_R11_C44'),
(203, 11, 45, 8, 1, 'BOXII_R11_C45'),
(211, 12, 32, 4, 1, 'ZB_R12_C32'),
(212, 12, 33, 4, 1, 'ZB_R12_C33'),
(213, 12, 34, 4, 1, 'ZB_R12_C34'),
(215, 12, 36, 4, 1, 'ZB_R12_C36'),
(216, 12, 37, 4, 1, 'ZB_R12_C37'),
(217, 12, 38, 4, 1, 'ZB_R12_C38'),
(225, 13, 25, 8, 1, 'BOXII_R13_C25'),
(226, 13, 26, 8, 1, 'BOXII_R13_C26'),
(228, 13, 28, 7, 1, 'BOXI_R13_C28'),
(229, 13, 29, 7, 1, 'BOXI_R13_C29'),
(232, 13, 32, 4, 1, 'ZB_R13_C32'),
(233, 13, 33, 4, 1, 'ZB_R13_C33'),
(234, 13, 34, 4, 1, 'ZB_R13_C34'),
(236, 13, 36, 4, 1, 'ZB_R13_C36'),
(237, 13, 37, 4, 1, 'ZB_R13_C37'),
(238, 13, 38, 4, 1, 'ZB_R13_C38'),
(241, 13, 41, 7, 1, 'BOXI_R13_C41'),
(242, 13, 42, 7, 1, 'BOXI_R13_C42'),
(244, 13, 44, 8, 1, 'BOXII_R13_C44'),
(245, 13, 45, 8, 1, 'BOXII_R13_C45'),
(246, 14, 25, 8, 1, 'BOXII_R14_C25'),
(247, 14, 26, 8, 1, 'BOXII_R14_C26'),
(249, 14, 28, 7, 1, 'BOXI_R14_C28'),
(250, 14, 29, 7, 1, 'BOXI_R14_C29'),
(253, 14, 32, 4, 1, 'ZB_R14_C32'),
(254, 14, 33, 4, 1, 'ZB_R14_C33'),
(255, 14, 34, 4, 1, 'ZB_R14_C34'),
(257, 14, 36, 4, 1, 'ZB_R14_C36'),
(258, 14, 37, 4, 1, 'ZB_R14_C37'),
(259, 14, 38, 4, 1, 'ZB_R14_C38'),
(262, 14, 41, 7, 1, 'BOXI_R14_C41'),
(263, 14, 42, 7, 1, 'BOXI_R14_C42'),
(265, 14, 44, 8, 1, 'BOXII_R14_C44'),
(266, 14, 45, 8, 1, 'BOXII_R14_C45'),
(274, 15, 32, 4, 1, 'ZB_R15_C32'),
(275, 15, 33, 4, 1, 'ZB_R15_C33'),
(276, 15, 34, 4, 1, 'ZB_R15_C34'),
(278, 15, 36, 4, 1, 'ZB_R15_C36'),
(279, 15, 37, 4, 1, 'ZB_R15_C37'),
(280, 15, 38, 4, 1, 'ZB_R15_C38'),
(288, 16, 25, 8, 1, 'BOXII_R16_C25'),
(289, 16, 26, 8, 1, 'BOXII_R16_C26'),
(291, 16, 28, 7, 1, 'BOXI_R16_C28'),
(292, 16, 29, 7, 1, 'BOXI_R16_C29'),
(295, 16, 32, 4, 1, 'ZB_R16_C32'),
(296, 16, 33, 4, 1, 'ZB_R16_C33'),
(297, 16, 34, 4, 1, 'ZB_R16_C34'),
(299, 16, 36, 4, 1, 'ZB_R16_C36'),
(300, 16, 37, 4, 1, 'ZB_R16_C37'),
(301, 16, 38, 4, 1, 'ZB_R16_C38'),
(304, 16, 41, 7, 1, 'BOXI_R16_C41'),
(305, 16, 42, 7, 1, 'BOXI_R16_C42'),
(307, 16, 44, 8, 1, 'BOXII_R16_C44'),
(308, 16, 45, 8, 1, 'BOXII_R16_C45'),
(309, 17, 25, 8, 1, 'BOXII_R17_C25'),
(310, 17, 26, 8, 1, 'BOXII_R17_C26'),
(312, 17, 28, 7, 1, 'BOXI_R17_C28'),
(313, 17, 29, 7, 1, 'BOXI_R17_C29'),
(316, 17, 32, 4, 1, 'ZB_R17_C32'),
(317, 17, 33, 4, 1, 'ZB_R17_C33'),
(318, 17, 34, 4, 1, 'ZB_R17_C34'),
(320, 17, 36, 4, 1, 'ZB_R17_C36'),
(321, 17, 37, 4, 1, 'ZB_R17_C37'),
(322, 17, 38, 4, 1, 'ZB_R17_C38'),
(325, 17, 41, 7, 1, 'BOXI_R17_C41'),
(326, 17, 42, 7, 1, 'BOXI_R17_C42'),
(328, 17, 44, 8, 1, 'BOXII_R17_C44'),
(329, 17, 45, 8, 1, 'BOXII_R17_C45'),
(337, 18, 32, 3, 1, 'ZA_R18_C32'),
(338, 18, 33, 3, 1, 'ZA_R18_C33'),
(339, 18, 34, 3, 1, 'ZA_R18_C34'),
(341, 18, 36, 3, 1, 'ZA_R18_C36'),
(342, 18, 37, 3, 1, 'ZA_R18_C37'),
(343, 18, 38, 3, 1, 'ZA_R18_C38'),
(351, 19, 25, 8, 1, 'BOXII_R19_C25'),
(352, 19, 26, 8, 1, 'BOXII_R19_C26'),
(354, 19, 28, 7, 1, 'BOXI_R19_C28'),
(355, 19, 29, 7, 1, 'BOXI_R19_C29'),
(358, 19, 32, 3, 1, 'ZA_R19_C32'),
(359, 19, 33, 3, 1, 'ZA_R19_C33'),
(360, 19, 34, 3, 1, 'ZA_R19_C34'),
(362, 19, 36, 3, 1, 'ZA_R19_C36'),
(363, 19, 37, 3, 1, 'ZA_R19_C37'),
(364, 19, 38, 3, 1, 'ZA_R19_C38'),
(367, 19, 41, 7, 1, 'BOXI_R19_C41'),
(368, 19, 42, 7, 1, 'BOXI_R19_C42'),
(370, 19, 44, 8, 1, 'BOXII_R19_C44'),
(371, 19, 45, 8, 1, 'BOXII_R19_C45'),
(372, 20, 25, 8, 1, 'BOXII_R20_C25'),
(373, 20, 26, 8, 1, 'BOXII_R20_C26'),
(375, 20, 28, 7, 1, 'BOXI_R20_C28'),
(376, 20, 29, 7, 1, 'BOXI_R20_C29'),
(379, 20, 32, 3, 1, 'ZA_R20_C32'),
(380, 20, 33, 3, 1, 'ZA_R20_C33'),
(381, 20, 34, 3, 1, 'ZA_R20_C34'),
(383, 20, 36, 3, 1, 'ZA_R20_C36'),
(384, 20, 37, 3, 1, 'ZA_R20_C37'),
(385, 20, 38, 3, 1, 'ZA_R20_C38'),
(388, 20, 41, 7, 1, 'BOXI_R20_C41'),
(389, 20, 42, 7, 1, 'BOXI_R20_C42'),
(391, 20, 44, 8, 1, 'BOXII_R20_C44'),
(392, 20, 45, 8, 1, 'BOXII_R20_C45'),
(400, 21, 32, 3, 1, 'ZA_R21_C32'),
(401, 21, 33, 3, 1, 'ZA_R21_C33'),
(402, 21, 34, 3, 1, 'ZA_R21_C34'),
(404, 21, 36, 3, 1, 'ZA_R21_C36'),
(405, 21, 37, 3, 1, 'ZA_R21_C37'),
(406, 21, 38, 3, 1, 'ZA_R21_C38'),
(421, 22, 32, 3, 1, 'ZA_R22_C32'),
(422, 22, 33, 3, 1, 'ZA_R22_C33'),
(423, 22, 34, 3, 1, 'ZA_R22_C34'),
(425, 22, 36, 3, 1, 'ZA_R22_C36'),
(426, 22, 37, 3, 1, 'ZA_R22_C37'),
(427, 22, 38, 3, 1, 'ZA_R22_C38'),
(471, 23, 25, 2, 1, 'VIPBox_R23_C25'),
(436, 23, 26, 2, 1, 'VIPBox_R23_C26'),
(438, 23, 28, 2, 1, 'VIPBox_R23_C28'),
(439, 23, 29, 2, 1, 'VIPBox_R23_C29'),
(442, 23, 32, 1, 1, 'VIP_R23_C32'),
(443, 23, 33, 1, 1, 'VIP_R23_C33'),
(444, 23, 34, 1, 1, 'VIP_R23_C34'),
(446, 23, 36, 1, 1, 'VIP_R23_C36'),
(447, 23, 37, 1, 1, 'VIP_R23_C37'),
(448, 23, 38, 1, 1, 'VIP_R23_C38'),
(478, 23, 41, 2, 1, 'VIPBox_R23_C41'),
(479, 23, 42, 2, 1, 'VIPBox_R23_C42'),
(480, 23, 44, 2, 1, 'VIPBox_R23_C44'),
(481, 23, 45, 2, 1, 'VIPBox_R23_C45'),
(472, 24, 25, 2, 1, 'VIPBox_R24_C25'),
(457, 24, 26, 2, 1, 'VIPBox_R24_C26'),
(459, 24, 28, 2, 1, 'VIPBox_R24_C28'),
(460, 24, 29, 2, 1, 'VIPBox_R24_C29'),
(463, 24, 32, 1, 1, 'VIP_R24_C32'),
(464, 24, 33, 1, 1, 'VIP_R24_C33'),
(465, 24, 34, 1, 1, 'VIP_R24_C34'),
(467, 24, 36, 1, 1, 'VIP_R24_C36'),
(468, 24, 37, 1, 1, 'VIP_R24_C37'),
(469, 24, 38, 1, 1, 'VIP_R24_C38'),
(474, 24, 41, 2, 1, 'VIPBox_R24_C41'),
(473, 24, 42, 2, 1, 'VIPBox_R24_C42'),
(470, 24, 44, 2, 1, 'VIPBox_R24_C44'),
(477, 24, 45, 2, 1, 'VIPBox_R24_C45');

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
(2, 'Δημοτικό Πειραιά', '', 1),
(3, 'Studio Steppe', '', 1);

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
  `zon_title` varchar(45) NOT NULL,
  `zon_csscolor` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zon_id`, `zon_theater_id`, `zon_title`, `zon_csscolor`) VALUES
(1, 2, 'VIP', 'bc18d5'),
(2, 2, 'VIP Θεωρεία', '18e1c6'),
(3, 2, 'Ζώνη Α', '4047ff'),
(4, 2, 'Ζώνη Β', '0ffa7c'),
(5, 2, 'Μπαλκόνι Α', 'facb0f'),
(6, 2, 'Μπαλκόνι Β', 'fa7c0f'),
(7, 2, 'Θεωρεια Επίπεδο Ι', '000'),
(8, 2, 'Θεωρεια Επίπεδο ΙΙ', '0099ff'),
(9, 3, 'VIP', 'cc66ff'),
(10, 3, 'Κανονικό', '3366ff');

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
  ADD UNIQUE KEY `itm_order_id_2` (`itm_order_id`,`itm_type_id`,`itm_seatno`,`itm_void`) USING BTREE,
  ADD KEY `itm_type_id` (`itm_type_id`),
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
  ADD UNIQUE KEY `pri_performance_id_2` (`pri_performance_id`,`pri_zone_id`,`pri_type_id`),
  ADD KEY `pri_type_id` (`pri_type_id`),
  ADD KEY `pri_zone_id` (`pri_zone_id`),
  ADD KEY `pri_performance_id` (`pri_performance_id`);

--
-- Indexes for table `seatmap`
--
ALTER TABLE `seatmap`
  ADD PRIMARY KEY (`smp_id`),
  ADD UNIQUE KEY `smp_rowid` (`smp_rowid`,`smp_colid`,`smp_zoneid`,`smp_theater_id`,`smp_seatname`),
  ADD UNIQUE KEY `smp_theater_id_2` (`smp_theater_id`,`smp_seatname`),
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
  MODIFY `aut_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `itm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `ply_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `pri_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seatmap`
--
ALTER TABLE `seatmap`
  MODIFY `smp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=482;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `tht_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `typ_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zon_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`itm_type_id`) REFERENCES `types` (`typ_id`);

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

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2020 at 05:31 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `act_id` int UNSIGNED NOT NULL,
  `act_character_id` int UNSIGNED NOT NULL,
  `act_performance_id` bigint UNSIGNED NOT NULL,
  `act_people_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`act_id`, `act_character_id`, `act_performance_id`, `act_people_id`) VALUES
(1, 2, 1, 1),
(2, 7, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `aut_id` mediumint UNSIGNED NOT NULL,
  `aut_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`aut_id`, `aut_name`) VALUES
(1, 'Henrik Ibsen'),
(2, 'Anton Checkov'),
(3, 'Lev Tolstoy'),
(4, 'August Strindberg'),
(5, 'William Shakespeare');

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `crd_id` int UNSIGNED NOT NULL,
  `crd_order_id` int UNSIGNED NOT NULL,
  `crd_card_type` varchar(4) NOT NULL,
  `crd_card_holder` varchar(55) NOT NULL,
  `crd_bin` varchar(6) NOT NULL,
  `crd_last` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card_details`
--

INSERT INTO `card_details` (`crd_id`, `crd_order_id`, `crd_card_type`, `crd_card_holder`, `crd_bin`, `crd_last`) VALUES
(1, 11, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(2, 12, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(3, 13, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(4, 14, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(5, 15, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(6, 16, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(7, 17, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(8, 18, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(9, 19, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(10, 20, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(11, 21, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(12, 22, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(13, 23, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(14, 24, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(15, 25, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(16, 26, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(17, 27, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(18, 28, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(19, 29, 'VIDE', 'ARTHUR MILLER', '411111', '1111'),
(20, 30, 'VIDE', 'ARTHUR MILLER', '411111', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `char_id` int UNSIGNED NOT NULL,
  `char_play_id` mediumint UNSIGNED NOT NULL,
  `char_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`char_id`, `char_play_id`, `char_name`) VALUES
(1, 2, 'Cordelia'),
(8, 2, 'Gonerill'),
(2, 2, 'King Lear'),
(7, 2, 'Lord Kent'),
(9, 2, 'Oswald'),
(10, 2, 'Regan');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `gen_id` tinyint UNSIGNED NOT NULL,
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
  `ord_id` int UNSIGNED NOT NULL,
  `ord_performance_id` bigint UNSIGNED NOT NULL,
  `ord_season_id` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `ord_date` date NOT NULL,
  `ord_perf_date_id` int UNSIGNED NOT NULL DEFAULT '1',
  `ord_name` varchar(50) NOT NULL,
  `ord_surname` varchar(60) NOT NULL,
  `ord_mobile` varchar(15) NOT NULL,
  `ord_email` varchar(50) NOT NULL,
  `ord_ccfees` decimal(8,2) UNSIGNED NOT NULL,
  `ord_tickets` decimal(8,2) UNSIGNED NOT NULL,
  `ord_total` decimal(8,2) UNSIGNED NOT NULL,
  `ord_void` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `ord_success` tinyint UNSIGNED NOT NULL,
  `ord_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_id`, `ord_performance_id`, `ord_season_id`, `ord_date`, `ord_perf_date_id`, `ord_name`, `ord_surname`, `ord_mobile`, `ord_email`, `ord_ccfees`, `ord_tickets`, `ord_total`, `ord_void`, `ord_success`, `ord_created_at`) VALUES
(1, 1, 1, '2019-01-07', 3, '', '', '', '', '0.00', '0.00', '0.00', 0, 1, '2020-07-01 10:17:58'),
(2, 1, 1, '2019-01-07', 3, '', '', '', '', '0.00', '0.00', '0.00', 0, 0, '2020-07-01 10:17:58'),
(3, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:20:00'),
(4, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:24:41'),
(5, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:26:08'),
(6, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:26:59'),
(7, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:32:29'),
(8, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:33:52'),
(9, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:36:15'),
(10, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:37:01'),
(11, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:37:45'),
(12, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:40:55'),
(13, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:42:37'),
(14, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:44:31'),
(15, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:47:33'),
(16, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 07:50:00'),
(17, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:34:44'),
(18, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:34:55'),
(19, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:47:17'),
(20, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:49:29'),
(21, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:49:59'),
(22, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:51:05'),
(23, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:55:07'),
(24, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 09:59:23'),
(25, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 13:25:39'),
(26, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 13:46:23'),
(27, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 13:47:00'),
(28, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 13:47:58'),
(29, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 13:49:05'),
(30, 1, 1, '2019-01-24', 1, 'ANTON', 'CHEKOV', '1234567890', 'test@test.gr', '2.25', '104.00', '56.00', 0, 1, '2020-07-18 13:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `itm_id` int UNSIGNED NOT NULL,
  `itm_order_id` int UNSIGNED NOT NULL,
  `itm_type_id` tinyint UNSIGNED NOT NULL,
  `itm_seatno` varchar(12) NOT NULL,
  `itm_ticket` varchar(10) NOT NULL,
  `itm_price` decimal(8,2) UNSIGNED NOT NULL,
  `itm_void` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`itm_id`, `itm_order_id`, `itm_type_id`, `itm_seatno`, `itm_ticket`, `itm_price`, `itm_void`) VALUES
(1, 1, 1, 'VIP_SDL_R1C1', '', '0.00', 0),
(2, 1, 1, 'VIP_R23_C34', '', '0.00', 0),
(3, 1, 1, 'VIP_R23_C32', '', '0.00', 1),
(4, 1, 1, 'BALCB_R2_C34', '', '0.00', 0),
(5, 1, 1, 'BALCB_R3_C36', '', '0.00', 0),
(6, 1, 1, 'BALCB_R3_C34', '', '0.00', 0),
(7, 1, 1, 'BALCB_R3_C38', '', '0.00', 0),
(8, 1, 1, 'BALCB_R2_C32', '', '0.00', 0),
(9, 2, 1, 'bababa', '', '0.00', 0),
(10, 7, 1, 'AVC', '123340002', '10.20', 1),
(11, 8, 1, 'AVC', '123340002', '10.20', 1),
(12, 9, 1, 'AVC', '123340002', '10.20', 1),
(13, 10, 1, 'AVC', '123340002', '10.20', 1),
(14, 11, 1, 'AVC', '123340002', '10.20', 1),
(15, 12, 1, 'AVC', '123340002', '10.20', 1),
(16, 13, 1, 'AVC', '123340002', '10.20', 1),
(17, 14, 1, 'AVC', '123340002', '10.20', 1),
(18, 15, 1, 'AVC', '123340002', '10.20', 1),
(19, 16, 1, 'AVC', '123340002', '10.20', 1),
(20, 17, 1, 'AVC', '123340002', '10.20', 1),
(21, 18, 1, 'AVC', '123340002', '10.20', 1),
(22, 19, 1, 'AVC', '123340002', '10.20', 1),
(23, 20, 1, 'AVC', '123340002', '10.20', 1),
(24, 21, 1, 'AVC', '123340002', '10.20', 1),
(25, 22, 1, 'AVC', '123340002', '10.20', 1),
(26, 23, 1, 'AVC', '123340002', '10.20', 1),
(27, 24, 1, 'AVC', '123340002', '10.20', 1),
(28, 25, 1, 'AVC', '123340002', '10.20', 1),
(29, 26, 1, 'AVC', '123340002', '10.20', 1),
(30, 27, 1, 'AVC', '123340002', '10.20', 1),
(31, 28, 1, 'AVC', '123340002', '10.20', 1),
(32, 29, 1, 'AVC', '123340002', '10.20', 1),
(33, 30, 1, 'AVC', '123340002', '10.20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `ppl_id` int UNSIGNED NOT NULL,
  `ppl_fullname` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`ppl_id`, `ppl_fullname`) VALUES
(1, 'Κιμούλης'),
(2, 'Νούσιας'),
(3, 'Μιχαλακόπουλο'),
(4, 'Σκιαδαρέσης'),
(5, 'Λουϊζίδου'),
(6, 'Σαπουντζής');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `per_id` bigint UNSIGNED NOT NULL,
  `per_play_id` mediumint UNSIGNED NOT NULL,
  `per_season_id` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `per_theater_id` int UNSIGNED NOT NULL,
  `per_director_id` int UNSIGNED NOT NULL,
  `per_duration` smallint UNSIGNED NOT NULL,
  `per_from_date` date NOT NULL,
  `per_to_date` date NOT NULL,
  `per_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`per_id`, `per_play_id`, `per_season_id`, `per_theater_id`, `per_director_id`, `per_duration`, `per_from_date`, `per_to_date`, `per_created_at`) VALUES
(1, 2, 1, 1, 1, 120, '2018-12-01', '2019-03-06', '2019-01-06 00:00:00'),
(2, 5, 2, 2, 3, 120, '2017-11-01', '2017-03-20', '2019-01-18 13:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `performance_dates`
--

CREATE TABLE `performance_dates` (
  `prd_id` int UNSIGNED NOT NULL,
  `prd_performance_id` bigint UNSIGNED NOT NULL,
  `prd_season_id` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `prd_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `performance_dates`
--

INSERT INTO `performance_dates` (`prd_id`, `prd_performance_id`, `prd_season_id`, `prd_date`) VALUES
(1, 1, 1, '2019-01-03'),
(3, 1, 1, '2019-01-07'),
(10, 1, 1, '2019-01-15'),
(8, 2, 1, '2018-01-17'),
(9, 2, 1, '2018-05-17'),
(4, 2, 2, '2019-01-08'),
(5, 2, 2, '2019-01-09'),
(6, 2, 2, '2019-01-10'),
(7, 2, 2, '2019-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `plays`
--

CREATE TABLE `plays` (
  `ply_id` mediumint UNSIGNED NOT NULL,
  `ply_title` varchar(40) NOT NULL,
  `ply_author_id` mediumint UNSIGNED NOT NULL,
  `ply_genre_id` tinyint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plays`
--

INSERT INTO `plays` (`ply_id`, `ply_title`, `ply_author_id`, `ply_genre_id`) VALUES
(1, 'WIlduck', 1, 1),
(2, 'King Lear', 5, 1),
(3, 'Master and Man', 3, 1),
(4, 'An Enemy of the People', 1, 1),
(5, 'Dreamplay', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `pri_id` int UNSIGNED NOT NULL,
  `pri_performance_id` bigint UNSIGNED NOT NULL,
  `pri_seasonid` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `pri_zone_id` smallint UNSIGNED NOT NULL,
  `pri_type_id` tinyint UNSIGNED NOT NULL,
  `pri_price` decimal(4,2) UNSIGNED NOT NULL DEFAULT '45.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`pri_id`, `pri_performance_id`, `pri_seasonid`, `pri_zone_id`, `pri_type_id`, `pri_price`) VALUES
(1, 2, 2, 1, 1, '35.00'),
(2, 1, 1, 1, 4, '25.00'),
(3, 1, 1, 8, 1, '45.00'),
(4, 1, 1, 2, 1, '25.00'),
(5, 1, 1, 3, 1, '25.00'),
(6, 1, 1, 4, 1, '25.00'),
(7, 1, 1, 5, 1, '25.00'),
(8, 1, 1, 6, 1, '25.00'),
(9, 1, 1, 7, 1, '25.00'),
(11, 1, 1, 2, 2, '25.00'),
(12, 1, 1, 3, 2, '25.00'),
(13, 1, 1, 4, 2, '25.00'),
(14, 1, 1, 5, 2, '25.00'),
(15, 1, 1, 6, 2, '25.00'),
(16, 1, 1, 7, 2, '25.00'),
(17, 1, 1, 8, 2, '25.00'),
(18, 1, 1, 2, 3, '25.00'),
(19, 1, 1, 3, 3, '25.00'),
(20, 1, 1, 4, 3, '25.00'),
(21, 1, 1, 5, 3, '25.00'),
(22, 1, 1, 6, 3, '25.00'),
(23, 1, 1, 7, 3, '25.00'),
(24, 1, 1, 8, 3, '25.00'),
(25, 1, 1, 2, 4, '25.00'),
(26, 1, 1, 3, 4, '25.00'),
(27, 1, 1, 4, 4, '25.00'),
(28, 1, 1, 5, 4, '25.00'),
(29, 1, 1, 6, 4, '25.00'),
(30, 1, 1, 7, 4, '25.00'),
(31, 1, 1, 8, 4, '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `seatfloor`
--

CREATE TABLE `seatfloor` (
  `scr_id` int NOT NULL,
  `scr_top` smallint NOT NULL,
  `scr_left` smallint NOT NULL,
  `scr_zone_id` smallint UNSIGNED NOT NULL,
  `scr_rowid` tinyint UNSIGNED NOT NULL,
  `scr_colid` tinyint UNSIGNED NOT NULL,
  `scr_theater_id` int UNSIGNED NOT NULL DEFAULT '1',
  `scr_seatname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seatfloor`
--

INSERT INTO `seatfloor` (`scr_id`, `scr_top`, `scr_left`, `scr_zone_id`, `scr_rowid`, `scr_colid`, `scr_theater_id`, `scr_seatname`) VALUES
(10055, 630, 450, 8, 1, 1, 1, 'VIP_SDL_R1C1'),
(10056, 630, 435, 8, 1, 2, 1, 'VIP_SDL_R1C2'),
(10057, 630, 420, 8, 1, 3, 1, 'VIP_SDL_R1C3'),
(10058, 630, 405, 8, 1, 4, 1, 'VIP_SDL_R1C4'),
(10059, 630, 390, 8, 1, 5, 1, 'VIP_SDL_R1C5'),
(10060, 630, 375, 8, 1, 6, 1, 'VIP_SDL_R1C6'),
(10061, 630, 360, 8, 1, 7, 1, 'VIP_SDL_R1C7'),
(10062, 630, 345, 8, 1, 8, 1, 'VIP_SDL_R1C8'),
(10063, 630, 330, 8, 1, 9, 1, 'VIP_SDL_R1C9'),
(10064, 630, 315, 8, 1, 10, 1, 'VIP_SDL_R1C10'),
(10065, 630, 300, 8, 1, 11, 1, 'VIP_SDL_R1C11'),
(10066, 630, 285, 8, 1, 12, 1, 'VIP_SDL_R1C12'),
(10067, 630, 270, 8, 1, 13, 1, 'VIP_SDL_R1C13'),
(10068, 630, 255, 8, 1, 14, 1, 'VIP_SDL_R1C14'),
(10069, 630, 240, 8, 1, 15, 1, 'VIP_SDL_R1C15'),
(10070, 630, 225, 8, 1, 16, 1, 'VIP_SDL_R1C16'),
(10071, 630, 210, 8, 1, 17, 1, 'VIP_SDL_R1C17'),
(10072, 630, 500, 8, 1, 1, 1, 'VIP_SDR_R1C1'),
(10073, 630, 515, 8, 1, 2, 1, 'VIP_SDR_R1C2'),
(10074, 630, 530, 8, 1, 3, 1, 'VIP_SDR_R1C3'),
(10075, 630, 545, 8, 1, 4, 1, 'VIP_SDR_R1C4'),
(10076, 630, 560, 8, 1, 5, 1, 'VIP_SDR_R1C5'),
(10077, 630, 575, 8, 1, 6, 1, 'VIP_SDR_R1C6'),
(10078, 630, 590, 8, 1, 7, 1, 'VIP_SDR_R1C7'),
(10079, 630, 605, 8, 1, 8, 1, 'VIP_SDR_R1C8'),
(10080, 630, 620, 8, 1, 9, 1, 'VIP_SDR_R1C9'),
(10081, 630, 635, 8, 1, 10, 1, 'VIP_SDR_R1C10'),
(10082, 630, 650, 8, 1, 11, 1, 'VIP_SDR_R1C11'),
(10083, 630, 665, 8, 1, 12, 1, 'VIP_SDR_R1C12'),
(10084, 630, 680, 8, 1, 13, 1, 'VIP_SDR_R1C13'),
(10085, 630, 695, 8, 1, 14, 1, 'VIP_SDR_R1C14'),
(10086, 630, 710, 8, 1, 15, 1, 'VIP_SDR_R1C15'),
(10087, 630, 725, 8, 1, 16, 1, 'VIP_SDR_R1C16'),
(10088, 630, 740, 8, 1, 17, 1, 'VIP_SDR_R1C17'),
(10089, 610, 450, 8, 2, 1, 1, 'VIP_SDL_R2C1'),
(10090, 610, 435, 8, 2, 2, 1, 'VIP_SDL_R2C2'),
(10091, 610, 420, 8, 2, 3, 1, 'VIP_SDL_R2C3'),
(10092, 610, 405, 8, 2, 4, 1, 'VIP_SDL_R2C4'),
(10093, 610, 390, 8, 2, 5, 1, 'VIP_SDL_R2C5'),
(10094, 610, 375, 8, 2, 6, 1, 'VIP_SDL_R2C6'),
(10095, 610, 360, 8, 2, 7, 1, 'VIP_SDL_R2C7'),
(10096, 610, 345, 8, 2, 8, 1, 'VIP_SDL_R2C8'),
(10097, 610, 330, 8, 2, 9, 1, 'VIP_SDL_R2C9'),
(10098, 610, 315, 8, 2, 10, 1, 'VIP_SDL_R2C10'),
(10099, 610, 300, 8, 2, 11, 1, 'VIP_SDL_R2C11'),
(10100, 610, 285, 8, 2, 12, 1, 'VIP_SDL_R2C12'),
(10101, 610, 270, 8, 2, 13, 1, 'VIP_SDL_R2C13'),
(10102, 610, 255, 8, 2, 14, 1, 'VIP_SDL_R2C14'),
(10103, 610, 240, 8, 2, 15, 1, 'VIP_SDL_R2C15'),
(10104, 610, 225, 8, 2, 16, 1, 'VIP_SDL_R2C16'),
(10105, 610, 210, 8, 2, 17, 1, 'VIP_SDL_R2C17'),
(10106, 610, 500, 8, 2, 1, 1, 'VIP_SDR_R2C1'),
(10107, 610, 515, 8, 2, 2, 1, 'VIP_SDR_R2C2'),
(10108, 610, 530, 8, 2, 3, 1, 'VIP_SDR_R2C3'),
(10109, 610, 545, 8, 2, 4, 1, 'VIP_SDR_R2C4'),
(10110, 610, 560, 8, 2, 5, 1, 'VIP_SDR_R2C5'),
(10111, 610, 575, 8, 2, 6, 1, 'VIP_SDR_R2C6'),
(10112, 610, 590, 8, 2, 7, 1, 'VIP_SDR_R2C7'),
(10113, 610, 605, 8, 2, 8, 1, 'VIP_SDR_R2C8'),
(10114, 610, 620, 8, 2, 9, 1, 'VIP_SDR_R2C9'),
(10115, 610, 635, 8, 2, 10, 1, 'VIP_SDR_R2C10'),
(10116, 610, 650, 8, 2, 11, 1, 'VIP_SDR_R2C11'),
(10117, 610, 665, 8, 2, 12, 1, 'VIP_SDR_R2C12'),
(10118, 610, 680, 8, 2, 13, 1, 'VIP_SDR_R2C13'),
(10119, 610, 695, 8, 2, 14, 1, 'VIP_SDR_R2C14'),
(10120, 610, 710, 8, 2, 15, 1, 'VIP_SDR_R2C15'),
(10121, 610, 725, 8, 2, 16, 1, 'VIP_SDR_R2C16'),
(10122, 610, 740, 8, 2, 17, 1, 'VIP_SDR_R2C17'),
(10123, 590, 450, 8, 3, 1, 1, 'VIP_SDL_R3C1'),
(10124, 590, 435, 8, 3, 2, 1, 'VIP_SDL_R3C2'),
(10125, 590, 420, 8, 3, 3, 1, 'VIP_SDL_R3C3'),
(10126, 590, 405, 8, 3, 4, 1, 'VIP_SDL_R3C4'),
(10127, 590, 390, 8, 3, 5, 1, 'VIP_SDL_R3C5'),
(10128, 590, 375, 8, 3, 6, 1, 'VIP_SDL_R3C6'),
(10129, 590, 360, 8, 3, 7, 1, 'VIP_SDL_R3C7'),
(10130, 590, 345, 8, 3, 8, 1, 'VIP_SDL_R3C8'),
(10131, 590, 330, 8, 3, 9, 1, 'VIP_SDL_R3C9'),
(10132, 590, 315, 8, 3, 10, 1, 'VIP_SDL_R3C10'),
(10133, 590, 300, 8, 3, 11, 1, 'VIP_SDL_R3C11'),
(10134, 590, 285, 8, 3, 12, 1, 'VIP_SDL_R3C12'),
(10135, 590, 270, 8, 3, 13, 1, 'VIP_SDL_R3C13'),
(10136, 590, 255, 8, 3, 14, 1, 'VIP_SDL_R3C14'),
(10137, 590, 240, 8, 3, 15, 1, 'VIP_SDL_R3C15'),
(10138, 590, 225, 8, 3, 16, 1, 'VIP_SDL_R3C16'),
(10139, 590, 210, 8, 3, 17, 1, 'VIP_SDL_R3C17'),
(10140, 590, 500, 8, 3, 1, 1, 'VIP_SDR_R3C1'),
(10141, 590, 515, 8, 3, 2, 1, 'VIP_SDR_R3C2'),
(10142, 590, 530, 8, 3, 3, 1, 'VIP_SDR_R3C3'),
(10143, 590, 545, 8, 3, 4, 1, 'VIP_SDR_R3C4'),
(10144, 590, 560, 8, 3, 5, 1, 'VIP_SDR_R3C5'),
(10145, 590, 575, 8, 3, 6, 1, 'VIP_SDR_R3C6'),
(10146, 590, 590, 8, 3, 7, 1, 'VIP_SDR_R3C7'),
(10147, 590, 605, 8, 3, 8, 1, 'VIP_SDR_R3C8'),
(10148, 590, 620, 8, 3, 9, 1, 'VIP_SDR_R3C9'),
(10149, 590, 635, 8, 3, 10, 1, 'VIP_SDR_R3C10'),
(10150, 590, 650, 8, 3, 11, 1, 'VIP_SDR_R3C11'),
(10151, 590, 665, 8, 3, 12, 1, 'VIP_SDR_R3C12'),
(10152, 590, 680, 8, 3, 13, 1, 'VIP_SDR_R3C13'),
(10153, 590, 695, 8, 3, 14, 1, 'VIP_SDR_R3C14'),
(10154, 590, 710, 8, 3, 15, 1, 'VIP_SDR_R3C15'),
(10155, 590, 725, 8, 3, 16, 1, 'VIP_SDR_R3C16'),
(10156, 590, 740, 8, 3, 17, 1, 'VIP_SDR_R3C17'),
(10157, 570, 450, 5, 4, 1, 1, 'Zone A_SDL_R4C1'),
(10158, 570, 435, 5, 4, 2, 1, 'Zone A_SDL_R4C2'),
(10159, 570, 420, 5, 4, 3, 1, 'Zone A_SDL_R4C3'),
(10160, 570, 405, 5, 4, 4, 1, 'Zone A_SDL_R4C4'),
(10161, 570, 390, 5, 4, 5, 1, 'Zone A_SDL_R4C5'),
(10162, 570, 375, 5, 4, 6, 1, 'Zone A_SDL_R4C6'),
(10163, 570, 360, 5, 4, 7, 1, 'Zone A_SDL_R4C7'),
(10164, 570, 345, 5, 4, 8, 1, 'Zone A_SDL_R4C8'),
(10165, 570, 330, 5, 4, 9, 1, 'Zone A_SDL_R4C9'),
(10166, 570, 315, 5, 4, 10, 1, 'Zone A_SDL_R4C10'),
(10167, 570, 300, 5, 4, 11, 1, 'Zone A_SDL_R4C11'),
(10168, 570, 285, 5, 4, 12, 1, 'Zone A_SDL_R4C12'),
(10169, 570, 270, 5, 4, 13, 1, 'Zone A_SDL_R4C13'),
(10170, 570, 255, 5, 4, 14, 1, 'Zone A_SDL_R4C14'),
(10171, 570, 240, 5, 4, 15, 1, 'Zone A_SDL_R4C15'),
(10172, 570, 225, 5, 4, 16, 1, 'Zone A_SDL_R4C16'),
(10173, 570, 500, 5, 4, 1, 1, 'Zone A_SDR_R4C1'),
(10174, 570, 515, 5, 4, 2, 1, 'Zone A_SDR_R4C2'),
(10175, 570, 530, 5, 4, 3, 1, 'Zone A_SDR_R4C3'),
(10176, 570, 545, 5, 4, 4, 1, 'Zone A_SDR_R4C4'),
(10177, 570, 560, 5, 4, 5, 1, 'Zone A_SDR_R4C5'),
(10178, 570, 575, 5, 4, 6, 1, 'Zone A_SDR_R4C6'),
(10179, 570, 590, 5, 4, 7, 1, 'Zone A_SDR_R4C7'),
(10180, 570, 605, 5, 4, 8, 1, 'Zone A_SDR_R4C8'),
(10181, 570, 620, 5, 4, 9, 1, 'Zone A_SDR_R4C9'),
(10182, 570, 635, 5, 4, 10, 1, 'Zone A_SDR_R4C10'),
(10183, 570, 650, 5, 4, 11, 1, 'Zone A_SDR_R4C11'),
(10184, 570, 665, 5, 4, 12, 1, 'Zone A_SDR_R4C12'),
(10185, 570, 680, 5, 4, 13, 1, 'Zone A_SDR_R4C13'),
(10186, 570, 695, 5, 4, 14, 1, 'Zone A_SDR_R4C14'),
(10187, 570, 710, 5, 4, 15, 1, 'Zone A_SDR_R4C15'),
(10188, 570, 725, 5, 4, 16, 1, 'Zone A_SDR_R4C16'),
(10189, 550, 450, 5, 5, 1, 1, 'Zone A_SDL_R5C1'),
(10190, 550, 435, 5, 5, 2, 1, 'Zone A_SDL_R5C2'),
(10191, 550, 420, 5, 5, 3, 1, 'Zone A_SDL_R5C3'),
(10192, 550, 405, 5, 5, 4, 1, 'Zone A_SDL_R5C4'),
(10193, 550, 390, 5, 5, 5, 1, 'Zone A_SDL_R5C5'),
(10194, 550, 375, 5, 5, 6, 1, 'Zone A_SDL_R5C6'),
(10195, 550, 360, 5, 5, 7, 1, 'Zone A_SDL_R5C7'),
(10196, 550, 345, 5, 5, 8, 1, 'Zone A_SDL_R5C8'),
(10197, 550, 330, 5, 5, 9, 1, 'Zone A_SDL_R5C9'),
(10198, 550, 315, 5, 5, 10, 1, 'Zone A_SDL_R5C10'),
(10199, 550, 300, 5, 5, 11, 1, 'Zone A_SDL_R5C11'),
(10200, 550, 285, 5, 5, 12, 1, 'Zone A_SDL_R5C12'),
(10201, 550, 270, 5, 5, 13, 1, 'Zone A_SDL_R5C13'),
(10202, 550, 255, 5, 5, 14, 1, 'Zone A_SDL_R5C14'),
(10203, 550, 240, 5, 5, 15, 1, 'Zone A_SDL_R5C15'),
(10204, 550, 225, 5, 5, 16, 1, 'Zone A_SDL_R5C16'),
(10205, 550, 500, 5, 5, 1, 1, 'Zone A_SDR_R5C1'),
(10206, 550, 515, 5, 5, 2, 1, 'Zone A_SDR_R5C2'),
(10207, 550, 530, 5, 5, 3, 1, 'Zone A_SDR_R5C3'),
(10208, 550, 545, 5, 5, 4, 1, 'Zone A_SDR_R5C4'),
(10209, 550, 560, 5, 5, 5, 1, 'Zone A_SDR_R5C5'),
(10210, 550, 575, 5, 5, 6, 1, 'Zone A_SDR_R5C6'),
(10211, 550, 590, 5, 5, 7, 1, 'Zone A_SDR_R5C7'),
(10212, 550, 605, 5, 5, 8, 1, 'Zone A_SDR_R5C8'),
(10213, 550, 620, 5, 5, 9, 1, 'Zone A_SDR_R5C9'),
(10214, 550, 635, 5, 5, 10, 1, 'Zone A_SDR_R5C10'),
(10215, 550, 650, 5, 5, 11, 1, 'Zone A_SDR_R5C11'),
(10216, 550, 665, 5, 5, 12, 1, 'Zone A_SDR_R5C12'),
(10217, 550, 680, 5, 5, 13, 1, 'Zone A_SDR_R5C13'),
(10218, 550, 695, 5, 5, 14, 1, 'Zone A_SDR_R5C14'),
(10219, 550, 710, 5, 5, 15, 1, 'Zone A_SDR_R5C15'),
(10220, 550, 725, 5, 5, 16, 1, 'Zone A_SDR_R5C16'),
(10221, 530, 450, 5, 6, 1, 1, 'Zone A_SDL_R6C1'),
(10222, 530, 435, 5, 6, 2, 1, 'Zone A_SDL_R6C2'),
(10223, 530, 420, 5, 6, 3, 1, 'Zone A_SDL_R6C3'),
(10224, 530, 405, 5, 6, 4, 1, 'Zone A_SDL_R6C4'),
(10225, 530, 390, 5, 6, 5, 1, 'Zone A_SDL_R6C5'),
(10226, 530, 375, 5, 6, 6, 1, 'Zone A_SDL_R6C6'),
(10227, 530, 360, 5, 6, 7, 1, 'Zone A_SDL_R6C7'),
(10228, 530, 345, 5, 6, 8, 1, 'Zone A_SDL_R6C8'),
(10229, 530, 330, 5, 6, 9, 1, 'Zone A_SDL_R6C9'),
(10230, 530, 315, 5, 6, 10, 1, 'Zone A_SDL_R6C10'),
(10231, 530, 300, 5, 6, 11, 1, 'Zone A_SDL_R6C11'),
(10232, 530, 285, 5, 6, 12, 1, 'Zone A_SDL_R6C12'),
(10233, 530, 270, 5, 6, 13, 1, 'Zone A_SDL_R6C13'),
(10234, 530, 255, 5, 6, 14, 1, 'Zone A_SDL_R6C14'),
(10235, 530, 240, 5, 6, 15, 1, 'Zone A_SDL_R6C15'),
(10236, 530, 500, 5, 6, 1, 1, 'Zone A_SDR_R6C1'),
(10237, 530, 515, 5, 6, 2, 1, 'Zone A_SDR_R6C2'),
(10238, 530, 530, 5, 6, 3, 1, 'Zone A_SDR_R6C3'),
(10239, 530, 545, 5, 6, 4, 1, 'Zone A_SDR_R6C4'),
(10240, 530, 560, 5, 6, 5, 1, 'Zone A_SDR_R6C5'),
(10241, 530, 575, 5, 6, 6, 1, 'Zone A_SDR_R6C6'),
(10242, 530, 590, 5, 6, 7, 1, 'Zone A_SDR_R6C7'),
(10243, 530, 605, 5, 6, 8, 1, 'Zone A_SDR_R6C8'),
(10244, 530, 620, 5, 6, 9, 1, 'Zone A_SDR_R6C9'),
(10245, 530, 635, 5, 6, 10, 1, 'Zone A_SDR_R6C10'),
(10246, 530, 650, 5, 6, 11, 1, 'Zone A_SDR_R6C11'),
(10247, 530, 665, 5, 6, 12, 1, 'Zone A_SDR_R6C12'),
(10248, 530, 680, 5, 6, 13, 1, 'Zone A_SDR_R6C13'),
(10249, 530, 695, 5, 6, 14, 1, 'Zone A_SDR_R6C14'),
(10250, 530, 710, 5, 6, 15, 1, 'Zone A_SDR_R6C15'),
(10251, 510, 450, 5, 7, 1, 1, 'Zone A_SDL_R7C1'),
(10252, 510, 435, 5, 7, 2, 1, 'Zone A_SDL_R7C2'),
(10253, 510, 420, 5, 7, 3, 1, 'Zone A_SDL_R7C3'),
(10254, 510, 405, 5, 7, 4, 1, 'Zone A_SDL_R7C4'),
(10255, 510, 390, 5, 7, 5, 1, 'Zone A_SDL_R7C5'),
(10256, 510, 375, 5, 7, 6, 1, 'Zone A_SDL_R7C6'),
(10257, 510, 360, 5, 7, 7, 1, 'Zone A_SDL_R7C7'),
(10258, 510, 345, 5, 7, 8, 1, 'Zone A_SDL_R7C8'),
(10259, 510, 330, 5, 7, 9, 1, 'Zone A_SDL_R7C9'),
(10260, 510, 315, 5, 7, 10, 1, 'Zone A_SDL_R7C10'),
(10261, 510, 300, 5, 7, 11, 1, 'Zone A_SDL_R7C11'),
(10262, 510, 285, 5, 7, 12, 1, 'Zone A_SDL_R7C12'),
(10263, 510, 270, 5, 7, 13, 1, 'Zone A_SDL_R7C13'),
(10264, 510, 255, 5, 7, 14, 1, 'Zone A_SDL_R7C14'),
(10265, 510, 240, 5, 7, 15, 1, 'Zone A_SDL_R7C15'),
(10266, 510, 500, 5, 7, 1, 1, 'Zone A_SDR_R7C1'),
(10267, 510, 515, 5, 7, 2, 1, 'Zone A_SDR_R7C2'),
(10268, 510, 530, 5, 7, 3, 1, 'Zone A_SDR_R7C3'),
(10269, 510, 545, 5, 7, 4, 1, 'Zone A_SDR_R7C4'),
(10270, 510, 560, 5, 7, 5, 1, 'Zone A_SDR_R7C5'),
(10271, 510, 575, 5, 7, 6, 1, 'Zone A_SDR_R7C6'),
(10272, 510, 590, 5, 7, 7, 1, 'Zone A_SDR_R7C7'),
(10273, 510, 605, 5, 7, 8, 1, 'Zone A_SDR_R7C8'),
(10274, 510, 620, 5, 7, 9, 1, 'Zone A_SDR_R7C9'),
(10275, 510, 635, 5, 7, 10, 1, 'Zone A_SDR_R7C10'),
(10276, 510, 650, 5, 7, 11, 1, 'Zone A_SDR_R7C11'),
(10277, 510, 665, 5, 7, 12, 1, 'Zone A_SDR_R7C12'),
(10278, 510, 680, 5, 7, 13, 1, 'Zone A_SDR_R7C13'),
(10279, 510, 695, 5, 7, 14, 1, 'Zone A_SDR_R7C14'),
(10280, 510, 710, 5, 7, 15, 1, 'Zone A_SDR_R7C15'),
(10281, 490, 450, 5, 8, 1, 1, 'Zone A_SDL_R8C1'),
(10282, 490, 435, 5, 8, 2, 1, 'Zone A_SDL_R8C2'),
(10283, 490, 420, 5, 8, 3, 1, 'Zone A_SDL_R8C3'),
(10284, 490, 405, 5, 8, 4, 1, 'Zone A_SDL_R8C4'),
(10285, 490, 390, 5, 8, 5, 1, 'Zone A_SDL_R8C5'),
(10286, 490, 375, 5, 8, 6, 1, 'Zone A_SDL_R8C6'),
(10287, 490, 360, 5, 8, 7, 1, 'Zone A_SDL_R8C7'),
(10288, 490, 345, 5, 8, 8, 1, 'Zone A_SDL_R8C8'),
(10289, 490, 330, 5, 8, 9, 1, 'Zone A_SDL_R8C9'),
(10290, 490, 315, 5, 8, 10, 1, 'Zone A_SDL_R8C10'),
(10291, 490, 300, 5, 8, 11, 1, 'Zone A_SDL_R8C11'),
(10292, 490, 285, 5, 8, 12, 1, 'Zone A_SDL_R8C12'),
(10293, 490, 270, 5, 8, 13, 1, 'Zone A_SDL_R8C13'),
(10294, 490, 255, 5, 8, 14, 1, 'Zone A_SDL_R8C14'),
(10295, 490, 500, 5, 8, 1, 1, 'Zone A_SDR_R8C1'),
(10296, 490, 515, 5, 8, 2, 1, 'Zone A_SDR_R8C2'),
(10297, 490, 530, 5, 8, 3, 1, 'Zone A_SDR_R8C3'),
(10298, 490, 545, 5, 8, 4, 1, 'Zone A_SDR_R8C4'),
(10299, 490, 560, 5, 8, 5, 1, 'Zone A_SDR_R8C5'),
(10300, 490, 575, 5, 8, 6, 1, 'Zone A_SDR_R8C6'),
(10301, 490, 590, 5, 8, 7, 1, 'Zone A_SDR_R8C7'),
(10302, 490, 605, 5, 8, 8, 1, 'Zone A_SDR_R8C8'),
(10303, 490, 620, 5, 8, 9, 1, 'Zone A_SDR_R8C9'),
(10304, 490, 635, 5, 8, 10, 1, 'Zone A_SDR_R8C10'),
(10305, 490, 650, 5, 8, 11, 1, 'Zone A_SDR_R8C11'),
(10306, 490, 665, 5, 8, 12, 1, 'Zone A_SDR_R8C12'),
(10307, 490, 680, 5, 8, 13, 1, 'Zone A_SDR_R8C13'),
(10308, 490, 695, 5, 8, 14, 1, 'Zone A_SDR_R8C14'),
(10309, 470, 450, 5, 9, 1, 1, 'Zone A_SDL_R9C1'),
(10310, 470, 435, 5, 9, 2, 1, 'Zone A_SDL_R9C2'),
(10311, 470, 420, 5, 9, 3, 1, 'Zone A_SDL_R9C3'),
(10312, 470, 405, 5, 9, 4, 1, 'Zone A_SDL_R9C4'),
(10313, 470, 390, 5, 9, 5, 1, 'Zone A_SDL_R9C5'),
(10314, 470, 375, 5, 9, 6, 1, 'Zone A_SDL_R9C6'),
(10315, 470, 360, 5, 9, 7, 1, 'Zone A_SDL_R9C7'),
(10316, 470, 345, 5, 9, 8, 1, 'Zone A_SDL_R9C8'),
(10317, 470, 330, 5, 9, 9, 1, 'Zone A_SDL_R9C9'),
(10318, 470, 315, 5, 9, 10, 1, 'Zone A_SDL_R9C10'),
(10319, 470, 300, 5, 9, 11, 1, 'Zone A_SDL_R9C11'),
(10320, 470, 285, 5, 9, 12, 1, 'Zone A_SDL_R9C12'),
(10321, 470, 270, 5, 9, 13, 1, 'Zone A_SDL_R9C13'),
(10322, 470, 255, 5, 9, 14, 1, 'Zone A_SDL_R9C14'),
(10323, 470, 500, 5, 9, 1, 1, 'Zone A_SDR_R9C1'),
(10324, 470, 515, 5, 9, 2, 1, 'Zone A_SDR_R9C2'),
(10325, 470, 530, 5, 9, 3, 1, 'Zone A_SDR_R9C3'),
(10326, 470, 545, 5, 9, 4, 1, 'Zone A_SDR_R9C4'),
(10327, 470, 560, 5, 9, 5, 1, 'Zone A_SDR_R9C5'),
(10328, 470, 575, 5, 9, 6, 1, 'Zone A_SDR_R9C6'),
(10329, 470, 590, 5, 9, 7, 1, 'Zone A_SDR_R9C7'),
(10330, 470, 605, 5, 9, 8, 1, 'Zone A_SDR_R9C8'),
(10331, 470, 620, 5, 9, 9, 1, 'Zone A_SDR_R9C9'),
(10332, 470, 635, 5, 9, 10, 1, 'Zone A_SDR_R9C10'),
(10333, 470, 650, 5, 9, 11, 1, 'Zone A_SDR_R9C11'),
(10334, 470, 665, 5, 9, 12, 1, 'Zone A_SDR_R9C12'),
(10335, 470, 680, 5, 9, 13, 1, 'Zone A_SDR_R9C13'),
(10336, 470, 695, 5, 9, 14, 1, 'Zone A_SDR_R9C14'),
(10337, 450, 450, 5, 10, 1, 1, 'Zone A_SDL_R10C1'),
(10338, 450, 435, 5, 10, 2, 1, 'Zone A_SDL_R10C2'),
(10339, 450, 420, 5, 10, 3, 1, 'Zone A_SDL_R10C3'),
(10340, 450, 405, 5, 10, 4, 1, 'Zone A_SDL_R10C4'),
(10341, 450, 390, 5, 10, 5, 1, 'Zone A_SDL_R10C5'),
(10342, 450, 375, 5, 10, 6, 1, 'Zone A_SDL_R10C6'),
(10343, 450, 360, 5, 10, 7, 1, 'Zone A_SDL_R10C7'),
(10344, 450, 345, 5, 10, 8, 1, 'Zone A_SDL_R10C8'),
(10345, 450, 330, 5, 10, 9, 1, 'Zone A_SDL_R10C9'),
(10346, 450, 315, 5, 10, 10, 1, 'Zone A_SDL_R10C10'),
(10347, 450, 300, 5, 10, 11, 1, 'Zone A_SDL_R10C11'),
(10348, 450, 285, 5, 10, 12, 1, 'Zone A_SDL_R10C12'),
(10349, 450, 270, 5, 10, 13, 1, 'Zone A_SDL_R10C13'),
(10350, 450, 500, 5, 10, 1, 1, 'Zone A_SDR_R10C1'),
(10351, 450, 515, 5, 10, 2, 1, 'Zone A_SDR_R10C2'),
(10352, 450, 530, 5, 10, 3, 1, 'Zone A_SDR_R10C3'),
(10353, 450, 545, 5, 10, 4, 1, 'Zone A_SDR_R10C4'),
(10354, 450, 560, 5, 10, 5, 1, 'Zone A_SDR_R10C5'),
(10355, 450, 575, 5, 10, 6, 1, 'Zone A_SDR_R10C6'),
(10356, 450, 590, 5, 10, 7, 1, 'Zone A_SDR_R10C7'),
(10357, 450, 605, 5, 10, 8, 1, 'Zone A_SDR_R10C8'),
(10358, 450, 620, 5, 10, 9, 1, 'Zone A_SDR_R10C9'),
(10359, 450, 635, 5, 10, 10, 1, 'Zone A_SDR_R10C10'),
(10360, 450, 650, 5, 10, 11, 1, 'Zone A_SDR_R10C11'),
(10361, 450, 665, 5, 10, 12, 1, 'Zone A_SDR_R10C12'),
(10362, 450, 680, 5, 10, 13, 1, 'Zone A_SDR_R10C13'),
(10363, 430, 450, 5, 11, 1, 1, 'Zone A_SDL_R11C1'),
(10364, 430, 435, 5, 11, 2, 1, 'Zone A_SDL_R11C2'),
(10365, 430, 420, 5, 11, 3, 1, 'Zone A_SDL_R11C3'),
(10366, 430, 405, 5, 11, 4, 1, 'Zone A_SDL_R11C4'),
(10367, 430, 390, 5, 11, 5, 1, 'Zone A_SDL_R11C5'),
(10368, 430, 375, 5, 11, 6, 1, 'Zone A_SDL_R11C6'),
(10369, 430, 360, 5, 11, 7, 1, 'Zone A_SDL_R11C7'),
(10370, 430, 345, 5, 11, 8, 1, 'Zone A_SDL_R11C8'),
(10371, 430, 330, 5, 11, 9, 1, 'Zone A_SDL_R11C9'),
(10372, 430, 315, 5, 11, 10, 1, 'Zone A_SDL_R11C10'),
(10373, 430, 300, 5, 11, 11, 1, 'Zone A_SDL_R11C11'),
(10374, 430, 285, 5, 11, 12, 1, 'Zone A_SDL_R11C12'),
(10375, 430, 270, 5, 11, 13, 1, 'Zone A_SDL_R11C13'),
(10376, 430, 500, 5, 11, 1, 1, 'Zone A_SDR_R11C1'),
(10377, 430, 515, 5, 11, 2, 1, 'Zone A_SDR_R11C2'),
(10378, 430, 530, 5, 11, 3, 1, 'Zone A_SDR_R11C3'),
(10379, 430, 545, 5, 11, 4, 1, 'Zone A_SDR_R11C4'),
(10380, 430, 560, 5, 11, 5, 1, 'Zone A_SDR_R11C5'),
(10381, 430, 575, 5, 11, 6, 1, 'Zone A_SDR_R11C6'),
(10382, 430, 590, 5, 11, 7, 1, 'Zone A_SDR_R11C7'),
(10383, 430, 605, 5, 11, 8, 1, 'Zone A_SDR_R11C8'),
(10384, 430, 620, 5, 11, 9, 1, 'Zone A_SDR_R11C9'),
(10385, 430, 635, 5, 11, 10, 1, 'Zone A_SDR_R11C10'),
(10386, 430, 650, 5, 11, 11, 1, 'Zone A_SDR_R11C11'),
(10387, 430, 665, 5, 11, 12, 1, 'Zone A_SDR_R11C12'),
(10388, 430, 680, 5, 11, 13, 1, 'Zone A_SDR_R11C13'),
(10389, 410, 450, 6, 12, 1, 1, 'Zone B_SDL_R12C1'),
(10390, 410, 435, 6, 12, 2, 1, 'Zone B_SDL_R12C2'),
(10391, 410, 420, 6, 12, 3, 1, 'Zone B_SDL_R12C3'),
(10392, 410, 405, 6, 12, 4, 1, 'Zone B_SDL_R12C4'),
(10393, 410, 390, 6, 12, 5, 1, 'Zone B_SDL_R12C5'),
(10394, 410, 375, 6, 12, 6, 1, 'Zone B_SDL_R12C6'),
(10395, 410, 360, 6, 12, 7, 1, 'Zone B_SDL_R12C7'),
(10396, 410, 345, 6, 12, 8, 1, 'Zone B_SDL_R12C8'),
(10397, 410, 330, 6, 12, 9, 1, 'Zone B_SDL_R12C9'),
(10398, 410, 315, 6, 12, 10, 1, 'Zone B_SDL_R12C10'),
(10399, 410, 300, 6, 12, 11, 1, 'Zone B_SDL_R12C11'),
(10400, 410, 285, 6, 12, 12, 1, 'Zone B_SDL_R12C12'),
(10401, 410, 500, 6, 12, 1, 1, 'Zone B_SDR_R12C1'),
(10402, 410, 515, 6, 12, 2, 1, 'Zone B_SDR_R12C2'),
(10403, 410, 530, 6, 12, 3, 1, 'Zone B_SDR_R12C3'),
(10404, 410, 545, 6, 12, 4, 1, 'Zone B_SDR_R12C4'),
(10405, 410, 560, 6, 12, 5, 1, 'Zone B_SDR_R12C5'),
(10406, 410, 575, 6, 12, 6, 1, 'Zone B_SDR_R12C6'),
(10407, 410, 590, 6, 12, 7, 1, 'Zone B_SDR_R12C7'),
(10408, 410, 605, 6, 12, 8, 1, 'Zone B_SDR_R12C8'),
(10409, 410, 620, 6, 12, 9, 1, 'Zone B_SDR_R12C9'),
(10410, 410, 635, 6, 12, 10, 1, 'Zone B_SDR_R12C10'),
(10411, 410, 650, 6, 12, 11, 1, 'Zone B_SDR_R12C11'),
(10412, 410, 665, 6, 12, 12, 1, 'Zone B_SDR_R12C12'),
(10413, 390, 450, 6, 13, 1, 1, 'Zone B_SDL_R13C1'),
(10414, 390, 435, 6, 13, 2, 1, 'Zone B_SDL_R13C2'),
(10415, 390, 420, 6, 13, 3, 1, 'Zone B_SDL_R13C3'),
(10416, 390, 405, 6, 13, 4, 1, 'Zone B_SDL_R13C4'),
(10417, 390, 390, 6, 13, 5, 1, 'Zone B_SDL_R13C5'),
(10418, 390, 375, 6, 13, 6, 1, 'Zone B_SDL_R13C6'),
(10419, 390, 360, 6, 13, 7, 1, 'Zone B_SDL_R13C7'),
(10420, 390, 345, 6, 13, 8, 1, 'Zone B_SDL_R13C8'),
(10421, 390, 330, 6, 13, 9, 1, 'Zone B_SDL_R13C9'),
(10422, 390, 315, 6, 13, 10, 1, 'Zone B_SDL_R13C10'),
(10423, 390, 300, 6, 13, 11, 1, 'Zone B_SDL_R13C11'),
(10424, 390, 285, 6, 13, 12, 1, 'Zone B_SDL_R13C12'),
(10425, 390, 500, 6, 13, 1, 1, 'Zone B_SDR_R13C1'),
(10426, 390, 515, 6, 13, 2, 1, 'Zone B_SDR_R13C2'),
(10427, 390, 530, 6, 13, 3, 1, 'Zone B_SDR_R13C3'),
(10428, 390, 545, 6, 13, 4, 1, 'Zone B_SDR_R13C4'),
(10429, 390, 560, 6, 13, 5, 1, 'Zone B_SDR_R13C5'),
(10430, 390, 575, 6, 13, 6, 1, 'Zone B_SDR_R13C6'),
(10431, 390, 590, 6, 13, 7, 1, 'Zone B_SDR_R13C7'),
(10432, 390, 605, 6, 13, 8, 1, 'Zone B_SDR_R13C8'),
(10433, 390, 620, 6, 13, 9, 1, 'Zone B_SDR_R13C9'),
(10434, 390, 635, 6, 13, 10, 1, 'Zone B_SDR_R13C10'),
(10435, 390, 650, 6, 13, 11, 1, 'Zone B_SDR_R13C11'),
(10436, 390, 665, 6, 13, 12, 1, 'Zone B_SDR_R13C12'),
(10437, 370, 450, 6, 14, 1, 1, 'Zone B_SDL_R14C1'),
(10438, 370, 435, 6, 14, 2, 1, 'Zone B_SDL_R14C2'),
(10439, 370, 420, 6, 14, 3, 1, 'Zone B_SDL_R14C3'),
(10440, 370, 405, 6, 14, 4, 1, 'Zone B_SDL_R14C4'),
(10441, 370, 390, 6, 14, 5, 1, 'Zone B_SDL_R14C5'),
(10442, 370, 375, 6, 14, 6, 1, 'Zone B_SDL_R14C6'),
(10443, 370, 360, 6, 14, 7, 1, 'Zone B_SDL_R14C7'),
(10444, 370, 345, 6, 14, 8, 1, 'Zone B_SDL_R14C8'),
(10445, 370, 330, 6, 14, 9, 1, 'Zone B_SDL_R14C9'),
(10446, 370, 315, 6, 14, 10, 1, 'Zone B_SDL_R14C10'),
(10447, 370, 300, 6, 14, 11, 1, 'Zone B_SDL_R14C11'),
(10448, 370, 500, 6, 14, 1, 1, 'Zone B_SDR_R14C1'),
(10449, 370, 515, 6, 14, 2, 1, 'Zone B_SDR_R14C2'),
(10450, 370, 530, 6, 14, 3, 1, 'Zone B_SDR_R14C3'),
(10451, 370, 545, 6, 14, 4, 1, 'Zone B_SDR_R14C4'),
(10452, 370, 560, 6, 14, 5, 1, 'Zone B_SDR_R14C5'),
(10453, 370, 575, 6, 14, 6, 1, 'Zone B_SDR_R14C6'),
(10454, 370, 590, 6, 14, 7, 1, 'Zone B_SDR_R14C7'),
(10455, 370, 605, 6, 14, 8, 1, 'Zone B_SDR_R14C8'),
(10456, 370, 620, 6, 14, 9, 1, 'Zone B_SDR_R14C9'),
(10457, 370, 635, 6, 14, 10, 1, 'Zone B_SDR_R14C10'),
(10458, 370, 650, 6, 14, 11, 1, 'Zone B_SDR_R14C11'),
(10459, 635, 155, 3, 0, 0, 1, 'Level I Boxes_LVL1SID0'),
(10460, 620, 155, 3, 0, 0, 1, 'Level I Boxes_LVL1SID1'),
(10461, 600, 165, 3, 0, 0, 1, 'Level I Boxes_LVL2SID0'),
(10462, 585, 165, 3, 0, 0, 1, 'Level I Boxes_LVL2SID1'),
(10463, 565, 175, 3, 0, 0, 1, 'Level I Boxes_LVL3SID0'),
(10464, 550, 175, 3, 0, 0, 1, 'Level I Boxes_LVL3SID1'),
(10465, 530, 185, 3, 0, 0, 1, 'Level I Boxes_LVL4SID0'),
(10466, 515, 185, 3, 0, 0, 1, 'Level I Boxes_LVL4SID1'),
(10467, 495, 195, 3, 0, 0, 1, 'Level I Boxes_LVL5SID0'),
(10468, 480, 195, 3, 0, 0, 1, 'Level I Boxes_LVL5SID1'),
(10469, 460, 205, 3, 0, 0, 1, 'Level I Boxes_LVL6SID0'),
(10470, 445, 205, 3, 0, 0, 1, 'Level I Boxes_LVL6SID1'),
(10471, 425, 215, 3, 0, 0, 1, 'Level I Boxes_LVL7SID0'),
(10472, 410, 215, 3, 0, 0, 1, 'Level I Boxes_LVL7SID1'),
(10473, 390, 225, 3, 0, 0, 1, 'Level I Boxes_LVL8SID0'),
(10474, 375, 225, 3, 0, 0, 1, 'Level I Boxes_LVL8SID1'),
(10475, 355, 235, 3, 0, 0, 1, 'Level I Boxes_LVL9SID0'),
(10476, 340, 235, 3, 0, 0, 1, 'Level I Boxes_LVL9SID1'),
(10477, 635, 115, 4, 0, 0, 1, 'Level II Boxes_LVL1SID0'),
(10478, 620, 115, 4, 0, 0, 1, 'Level II Boxes_LVL1SID1'),
(10479, 600, 125, 4, 0, 0, 1, 'Level II Boxes_LVL2SID0'),
(10480, 585, 125, 4, 0, 0, 1, 'Level II Boxes_LVL2SID1'),
(10481, 565, 135, 4, 0, 0, 1, 'Level II Boxes_LVL3SID0'),
(10482, 550, 135, 4, 0, 0, 1, 'Level II Boxes_LVL3SID1'),
(10483, 530, 145, 4, 0, 0, 1, 'Level II Boxes_LVL4SID0'),
(10484, 515, 145, 4, 0, 0, 1, 'Level II Boxes_LVL4SID1'),
(10485, 495, 155, 4, 0, 0, 1, 'Level II Boxes_LVL5SID0'),
(10486, 480, 155, 4, 0, 0, 1, 'Level II Boxes_LVL5SID1'),
(10487, 460, 165, 4, 0, 0, 1, 'Level II Boxes_LVL6SID0'),
(10488, 445, 165, 4, 0, 0, 1, 'Level II Boxes_LVL6SID1'),
(10489, 425, 175, 4, 0, 0, 1, 'Level II Boxes_LVL7SID0'),
(10490, 410, 175, 4, 0, 0, 1, 'Level II Boxes_LVL7SID1'),
(10491, 390, 185, 4, 0, 0, 1, 'Level II Boxes_LVL8SID0'),
(10492, 375, 185, 4, 0, 0, 1, 'Level II Boxes_LVL8SID1'),
(10493, 355, 195, 4, 0, 0, 1, 'Level II Boxes_LVL9SID0'),
(10494, 340, 195, 4, 0, 0, 1, 'Level II Boxes_LVL9SID1'),
(13387, 680, 135, 1, 1, 1, 2, 'LFSR1C1'),
(13388, 680, 150, 1, 1, 2, 2, 'LFSR1C2'),
(13389, 680, 165, 1, 1, 3, 2, 'LFSR1C3'),
(13390, 680, 180, 1, 1, 4, 2, 'LFSR1C4'),
(13391, 680, 195, 1, 1, 5, 2, 'LFSR1C5'),
(13392, 680, 210, 1, 1, 6, 2, 'LFSR1C6'),
(13393, 680, 225, 1, 1, 7, 2, 'LFSR1C7'),
(13394, 680, 240, 1, 1, 8, 2, 'LFSR1C8'),
(13395, 680, 255, 1, 1, 9, 2, 'LFSR1C9'),
(13396, 680, 270, 1, 1, 10, 2, 'LFSR1C10'),
(13397, 680, 285, 1, 1, 11, 2, 'LFSR1C11'),
(13398, 680, 300, 1, 1, 12, 2, 'LFSR1C12'),
(13399, 680, 315, 1, 1, 13, 2, 'LFSR1C13'),
(13400, 680, 330, 1, 1, 14, 2, 'LFSR1C14'),
(13401, 680, 345, 1, 1, 15, 2, 'LFSR1C15'),
(13402, 680, 360, 1, 1, 16, 2, 'LFSR1C16'),
(13403, 680, 375, 1, 1, 17, 2, 'LFSR1C17'),
(13404, 680, 440, 1, 1, 1, 2, 'RTSR1C1'),
(13405, 680, 455, 1, 1, 2, 2, 'RTSR1C2'),
(13406, 680, 470, 1, 1, 3, 2, 'RTSR1C3'),
(13407, 680, 485, 1, 1, 4, 2, 'RTSR1C4'),
(13408, 680, 500, 1, 1, 5, 2, 'RTSR1C5'),
(13409, 680, 515, 1, 1, 6, 2, 'RTSR1C6'),
(13410, 680, 530, 1, 1, 7, 2, 'RTSR1C7'),
(13411, 680, 545, 1, 1, 8, 2, 'RTSR1C8'),
(13412, 680, 560, 1, 1, 9, 2, 'RTSR1C9'),
(13413, 680, 575, 1, 1, 10, 2, 'RTSR1C10'),
(13414, 680, 590, 1, 1, 11, 2, 'RTSR1C11'),
(13415, 680, 605, 1, 1, 12, 2, 'RTSR1C12'),
(13416, 680, 620, 1, 1, 13, 2, 'RTSR1C13'),
(13417, 680, 635, 1, 1, 14, 2, 'RTSR1C14'),
(13418, 680, 650, 1, 1, 15, 2, 'RTSR1C15'),
(13419, 680, 665, 1, 1, 16, 2, 'RTSR1C16'),
(13420, 680, 680, 1, 1, 17, 2, 'RTSR1C17'),
(13421, 660, 135, 1, 2, 1, 2, 'LFSR2C1'),
(13422, 660, 150, 1, 2, 2, 2, 'LFSR2C2'),
(13423, 660, 165, 1, 2, 3, 2, 'LFSR2C3'),
(13424, 660, 180, 1, 2, 4, 2, 'LFSR2C4'),
(13425, 660, 195, 1, 2, 5, 2, 'LFSR2C5'),
(13426, 660, 210, 1, 2, 6, 2, 'LFSR2C6'),
(13427, 660, 225, 1, 2, 7, 2, 'LFSR2C7'),
(13428, 660, 240, 1, 2, 8, 2, 'LFSR2C8'),
(13429, 660, 255, 1, 2, 9, 2, 'LFSR2C9'),
(13430, 660, 270, 1, 2, 10, 2, 'LFSR2C10'),
(13431, 660, 285, 1, 2, 11, 2, 'LFSR2C11'),
(13432, 660, 300, 1, 2, 12, 2, 'LFSR2C12'),
(13433, 660, 315, 1, 2, 13, 2, 'LFSR2C13'),
(13434, 660, 330, 1, 2, 14, 2, 'LFSR2C14'),
(13435, 660, 345, 1, 2, 15, 2, 'LFSR2C15'),
(13436, 660, 360, 1, 2, 16, 2, 'LFSR2C16'),
(13437, 660, 375, 1, 2, 17, 2, 'LFSR2C17'),
(13438, 660, 440, 1, 2, 1, 2, 'RTSR2C1'),
(13439, 660, 455, 1, 2, 2, 2, 'RTSR2C2'),
(13440, 660, 470, 1, 2, 3, 2, 'RTSR2C3'),
(13441, 660, 485, 1, 2, 4, 2, 'RTSR2C4'),
(13442, 660, 500, 1, 2, 5, 2, 'RTSR2C5'),
(13443, 660, 515, 1, 2, 6, 2, 'RTSR2C6'),
(13444, 660, 530, 1, 2, 7, 2, 'RTSR2C7'),
(13445, 660, 545, 1, 2, 8, 2, 'RTSR2C8'),
(13446, 660, 560, 1, 2, 9, 2, 'RTSR2C9'),
(13447, 660, 575, 1, 2, 10, 2, 'RTSR2C10'),
(13448, 660, 590, 1, 2, 11, 2, 'RTSR2C11'),
(13449, 660, 605, 1, 2, 12, 2, 'RTSR2C12'),
(13450, 660, 620, 1, 2, 13, 2, 'RTSR2C13'),
(13451, 660, 635, 1, 2, 14, 2, 'RTSR2C14'),
(13452, 660, 650, 1, 2, 15, 2, 'RTSR2C15'),
(13453, 660, 665, 1, 2, 16, 2, 'RTSR2C16'),
(13454, 660, 680, 1, 2, 17, 2, 'RTSR2C17'),
(13455, 640, 135, 1, 3, 1, 2, 'LFSR3C1'),
(13456, 640, 150, 1, 3, 2, 2, 'LFSR3C2'),
(13457, 640, 165, 1, 3, 3, 2, 'LFSR3C3'),
(13458, 640, 180, 1, 3, 4, 2, 'LFSR3C4'),
(13459, 640, 195, 1, 3, 5, 2, 'LFSR3C5'),
(13460, 640, 210, 1, 3, 6, 2, 'LFSR3C6'),
(13461, 640, 225, 1, 3, 7, 2, 'LFSR3C7'),
(13462, 640, 240, 1, 3, 8, 2, 'LFSR3C8'),
(13463, 640, 255, 1, 3, 9, 2, 'LFSR3C9'),
(13464, 640, 270, 1, 3, 10, 2, 'LFSR3C10'),
(13465, 640, 285, 1, 3, 11, 2, 'LFSR3C11'),
(13466, 640, 300, 1, 3, 12, 2, 'LFSR3C12'),
(13467, 640, 315, 1, 3, 13, 2, 'LFSR3C13'),
(13468, 640, 330, 1, 3, 14, 2, 'LFSR3C14'),
(13469, 640, 345, 1, 3, 15, 2, 'LFSR3C15'),
(13470, 640, 360, 1, 3, 16, 2, 'LFSR3C16'),
(13471, 640, 375, 1, 3, 17, 2, 'LFSR3C17'),
(13472, 640, 440, 1, 3, 1, 2, 'RTSR3C1'),
(13473, 640, 455, 1, 3, 2, 2, 'RTSR3C2'),
(13474, 640, 470, 1, 3, 3, 2, 'RTSR3C3'),
(13475, 640, 485, 1, 3, 4, 2, 'RTSR3C4'),
(13476, 640, 500, 1, 3, 5, 2, 'RTSR3C5'),
(13477, 640, 515, 1, 3, 6, 2, 'RTSR3C6'),
(13478, 640, 530, 1, 3, 7, 2, 'RTSR3C7'),
(13479, 640, 545, 1, 3, 8, 2, 'RTSR3C8'),
(13480, 640, 560, 1, 3, 9, 2, 'RTSR3C9'),
(13481, 640, 575, 1, 3, 10, 2, 'RTSR3C10'),
(13482, 640, 590, 1, 3, 11, 2, 'RTSR3C11'),
(13483, 640, 605, 1, 3, 12, 2, 'RTSR3C12'),
(13484, 640, 620, 1, 3, 13, 2, 'RTSR3C13'),
(13485, 640, 635, 1, 3, 14, 2, 'RTSR3C14'),
(13486, 640, 650, 1, 3, 15, 2, 'RTSR3C15'),
(13487, 640, 665, 1, 3, 16, 2, 'RTSR3C16'),
(13488, 640, 680, 1, 3, 17, 2, 'RTSR3C17'),
(13489, 620, 135, 1, 4, 1, 2, 'LFSR4C1'),
(13490, 620, 150, 1, 4, 2, 2, 'LFSR4C2'),
(13491, 620, 165, 1, 4, 3, 2, 'LFSR4C3'),
(13492, 620, 180, 1, 4, 4, 2, 'LFSR4C4'),
(13493, 620, 195, 1, 4, 5, 2, 'LFSR4C5'),
(13494, 620, 210, 1, 4, 6, 2, 'LFSR4C6'),
(13495, 620, 225, 1, 4, 7, 2, 'LFSR4C7'),
(13496, 620, 240, 1, 4, 8, 2, 'LFSR4C8'),
(13497, 620, 255, 1, 4, 9, 2, 'LFSR4C9'),
(13498, 620, 270, 1, 4, 10, 2, 'LFSR4C10'),
(13499, 620, 285, 1, 4, 11, 2, 'LFSR4C11'),
(13500, 620, 300, 1, 4, 12, 2, 'LFSR4C12'),
(13501, 620, 315, 1, 4, 13, 2, 'LFSR4C13'),
(13502, 620, 330, 1, 4, 14, 2, 'LFSR4C14'),
(13503, 620, 345, 1, 4, 15, 2, 'LFSR4C15'),
(13504, 620, 360, 1, 4, 16, 2, 'LFSR4C16'),
(13505, 620, 375, 1, 4, 17, 2, 'LFSR4C17'),
(13506, 620, 440, 1, 4, 1, 2, 'RTSR4C1'),
(13507, 620, 455, 1, 4, 2, 2, 'RTSR4C2'),
(13508, 620, 470, 1, 4, 3, 2, 'RTSR4C3'),
(13509, 620, 485, 1, 4, 4, 2, 'RTSR4C4'),
(13510, 620, 500, 1, 4, 5, 2, 'RTSR4C5'),
(13511, 620, 515, 1, 4, 6, 2, 'RTSR4C6'),
(13512, 620, 530, 1, 4, 7, 2, 'RTSR4C7'),
(13513, 620, 545, 1, 4, 8, 2, 'RTSR4C8'),
(13514, 620, 560, 1, 4, 9, 2, 'RTSR4C9'),
(13515, 620, 575, 1, 4, 10, 2, 'RTSR4C10'),
(13516, 620, 590, 1, 4, 11, 2, 'RTSR4C11'),
(13517, 620, 605, 1, 4, 12, 2, 'RTSR4C12'),
(13518, 620, 620, 1, 4, 13, 2, 'RTSR4C13'),
(13519, 620, 635, 1, 4, 14, 2, 'RTSR4C14'),
(13520, 620, 650, 1, 4, 15, 2, 'RTSR4C15'),
(13521, 620, 665, 1, 4, 16, 2, 'RTSR4C16'),
(13522, 620, 680, 1, 4, 17, 2, 'RTSR4C17'),
(13523, 600, 135, 1, 5, 1, 2, 'LFSR5C1'),
(13524, 600, 150, 1, 5, 2, 2, 'LFSR5C2'),
(13525, 600, 165, 1, 5, 3, 2, 'LFSR5C3'),
(13526, 600, 180, 1, 5, 4, 2, 'LFSR5C4'),
(13527, 600, 195, 1, 5, 5, 2, 'LFSR5C5'),
(13528, 600, 210, 1, 5, 6, 2, 'LFSR5C6'),
(13529, 600, 225, 1, 5, 7, 2, 'LFSR5C7'),
(13530, 600, 240, 1, 5, 8, 2, 'LFSR5C8'),
(13531, 600, 255, 1, 5, 9, 2, 'LFSR5C9'),
(13532, 600, 270, 1, 5, 10, 2, 'LFSR5C10'),
(13533, 600, 285, 1, 5, 11, 2, 'LFSR5C11'),
(13534, 600, 300, 1, 5, 12, 2, 'LFSR5C12'),
(13535, 600, 315, 1, 5, 13, 2, 'LFSR5C13'),
(13536, 600, 330, 1, 5, 14, 2, 'LFSR5C14'),
(13537, 600, 345, 1, 5, 15, 2, 'LFSR5C15'),
(13538, 600, 360, 1, 5, 16, 2, 'LFSR5C16'),
(13539, 600, 375, 1, 5, 17, 2, 'LFSR5C17'),
(13540, 600, 440, 1, 5, 1, 2, 'RTSR5C1'),
(13541, 600, 455, 1, 5, 2, 2, 'RTSR5C2'),
(13542, 600, 470, 1, 5, 3, 2, 'RTSR5C3'),
(13543, 600, 485, 1, 5, 4, 2, 'RTSR5C4'),
(13544, 600, 500, 1, 5, 5, 2, 'RTSR5C5'),
(13545, 600, 515, 1, 5, 6, 2, 'RTSR5C6'),
(13546, 600, 530, 1, 5, 7, 2, 'RTSR5C7'),
(13547, 600, 545, 1, 5, 8, 2, 'RTSR5C8'),
(13548, 600, 560, 1, 5, 9, 2, 'RTSR5C9'),
(13549, 600, 575, 1, 5, 10, 2, 'RTSR5C10'),
(13550, 600, 590, 1, 5, 11, 2, 'RTSR5C11'),
(13551, 600, 605, 1, 5, 12, 2, 'RTSR5C12'),
(13552, 600, 620, 1, 5, 13, 2, 'RTSR5C13'),
(13553, 600, 635, 1, 5, 14, 2, 'RTSR5C14'),
(13554, 600, 650, 1, 5, 15, 2, 'RTSR5C15'),
(13555, 600, 665, 1, 5, 16, 2, 'RTSR5C16'),
(13556, 600, 680, 1, 5, 17, 2, 'RTSR5C17'),
(13557, 580, 135, 1, 6, 1, 2, 'LFSR6C1'),
(13558, 580, 150, 1, 6, 2, 2, 'LFSR6C2'),
(13559, 580, 165, 1, 6, 3, 2, 'LFSR6C3'),
(13560, 580, 180, 1, 6, 4, 2, 'LFSR6C4'),
(13561, 580, 195, 1, 6, 5, 2, 'LFSR6C5'),
(13562, 580, 210, 1, 6, 6, 2, 'LFSR6C6'),
(13563, 580, 225, 1, 6, 7, 2, 'LFSR6C7'),
(13564, 580, 240, 1, 6, 8, 2, 'LFSR6C8'),
(13565, 580, 255, 1, 6, 9, 2, 'LFSR6C9'),
(13566, 580, 270, 1, 6, 10, 2, 'LFSR6C10'),
(13567, 580, 285, 1, 6, 11, 2, 'LFSR6C11'),
(13568, 580, 300, 1, 6, 12, 2, 'LFSR6C12'),
(13569, 580, 315, 1, 6, 13, 2, 'LFSR6C13'),
(13570, 580, 330, 1, 6, 14, 2, 'LFSR6C14'),
(13571, 580, 345, 1, 6, 15, 2, 'LFSR6C15'),
(13572, 580, 360, 1, 6, 16, 2, 'LFSR6C16'),
(13573, 580, 375, 1, 6, 17, 2, 'LFSR6C17'),
(13574, 580, 440, 1, 6, 1, 2, 'RTSR6C1'),
(13575, 580, 455, 1, 6, 2, 2, 'RTSR6C2'),
(13576, 580, 470, 1, 6, 3, 2, 'RTSR6C3'),
(13577, 580, 485, 1, 6, 4, 2, 'RTSR6C4'),
(13578, 580, 500, 1, 6, 5, 2, 'RTSR6C5'),
(13579, 580, 515, 1, 6, 6, 2, 'RTSR6C6'),
(13580, 580, 530, 1, 6, 7, 2, 'RTSR6C7'),
(13581, 580, 545, 1, 6, 8, 2, 'RTSR6C8'),
(13582, 580, 560, 1, 6, 9, 2, 'RTSR6C9'),
(13583, 580, 575, 1, 6, 10, 2, 'RTSR6C10'),
(13584, 580, 590, 1, 6, 11, 2, 'RTSR6C11'),
(13585, 580, 605, 1, 6, 12, 2, 'RTSR6C12'),
(13586, 580, 620, 1, 6, 13, 2, 'RTSR6C13'),
(13587, 580, 635, 1, 6, 14, 2, 'RTSR6C14'),
(13588, 580, 650, 1, 6, 15, 2, 'RTSR6C15'),
(13589, 580, 665, 1, 6, 16, 2, 'RTSR6C16'),
(13590, 580, 680, 1, 6, 17, 2, 'RTSR6C17'),
(13591, 560, 135, 1, 7, 1, 2, 'LFSR7C1'),
(13592, 560, 150, 1, 7, 2, 2, 'LFSR7C2'),
(13593, 560, 165, 1, 7, 3, 2, 'LFSR7C3'),
(13594, 560, 180, 1, 7, 4, 2, 'LFSR7C4'),
(13595, 560, 195, 1, 7, 5, 2, 'LFSR7C5'),
(13596, 560, 210, 1, 7, 6, 2, 'LFSR7C6'),
(13597, 560, 225, 1, 7, 7, 2, 'LFSR7C7'),
(13598, 560, 240, 1, 7, 8, 2, 'LFSR7C8'),
(13599, 560, 255, 1, 7, 9, 2, 'LFSR7C9'),
(13600, 560, 270, 1, 7, 10, 2, 'LFSR7C10'),
(13601, 560, 285, 1, 7, 11, 2, 'LFSR7C11'),
(13602, 560, 300, 1, 7, 12, 2, 'LFSR7C12'),
(13603, 560, 315, 1, 7, 13, 2, 'LFSR7C13'),
(13604, 560, 330, 1, 7, 14, 2, 'LFSR7C14'),
(13605, 560, 345, 1, 7, 15, 2, 'LFSR7C15'),
(13606, 560, 360, 1, 7, 16, 2, 'LFSR7C16'),
(13607, 560, 375, 1, 7, 17, 2, 'LFSR7C17'),
(13608, 560, 440, 1, 7, 1, 2, 'RTSR7C1'),
(13609, 560, 455, 1, 7, 2, 2, 'RTSR7C2'),
(13610, 560, 470, 1, 7, 3, 2, 'RTSR7C3'),
(13611, 560, 485, 1, 7, 4, 2, 'RTSR7C4'),
(13612, 560, 500, 1, 7, 5, 2, 'RTSR7C5'),
(13613, 560, 515, 1, 7, 6, 2, 'RTSR7C6'),
(13614, 560, 530, 1, 7, 7, 2, 'RTSR7C7'),
(13615, 560, 545, 1, 7, 8, 2, 'RTSR7C8'),
(13616, 560, 560, 1, 7, 9, 2, 'RTSR7C9'),
(13617, 560, 575, 1, 7, 10, 2, 'RTSR7C10'),
(13618, 560, 590, 1, 7, 11, 2, 'RTSR7C11'),
(13619, 560, 605, 1, 7, 12, 2, 'RTSR7C12'),
(13620, 560, 620, 1, 7, 13, 2, 'RTSR7C13'),
(13621, 560, 635, 1, 7, 14, 2, 'RTSR7C14'),
(13622, 560, 650, 1, 7, 15, 2, 'RTSR7C15'),
(13623, 560, 665, 1, 7, 16, 2, 'RTSR7C16'),
(13624, 560, 680, 1, 7, 17, 2, 'RTSR7C17'),
(13625, 540, 135, 1, 8, 1, 2, 'LFSR8C1'),
(13626, 540, 150, 1, 8, 2, 2, 'LFSR8C2'),
(13627, 540, 165, 1, 8, 3, 2, 'LFSR8C3'),
(13628, 540, 180, 1, 8, 4, 2, 'LFSR8C4'),
(13629, 540, 195, 1, 8, 5, 2, 'LFSR8C5'),
(13630, 540, 210, 1, 8, 6, 2, 'LFSR8C6'),
(13631, 540, 225, 1, 8, 7, 2, 'LFSR8C7'),
(13632, 540, 240, 1, 8, 8, 2, 'LFSR8C8'),
(13633, 540, 255, 1, 8, 9, 2, 'LFSR8C9'),
(13634, 540, 270, 1, 8, 10, 2, 'LFSR8C10'),
(13635, 540, 285, 1, 8, 11, 2, 'LFSR8C11'),
(13636, 540, 300, 1, 8, 12, 2, 'LFSR8C12'),
(13637, 540, 315, 1, 8, 13, 2, 'LFSR8C13'),
(13638, 540, 330, 1, 8, 14, 2, 'LFSR8C14'),
(13639, 540, 345, 1, 8, 15, 2, 'LFSR8C15'),
(13640, 540, 360, 1, 8, 16, 2, 'LFSR8C16'),
(13641, 540, 375, 1, 8, 17, 2, 'LFSR8C17'),
(13642, 540, 440, 1, 8, 1, 2, 'RTSR8C1'),
(13643, 540, 455, 1, 8, 2, 2, 'RTSR8C2'),
(13644, 540, 470, 1, 8, 3, 2, 'RTSR8C3'),
(13645, 540, 485, 1, 8, 4, 2, 'RTSR8C4'),
(13646, 540, 500, 1, 8, 5, 2, 'RTSR8C5'),
(13647, 540, 515, 1, 8, 6, 2, 'RTSR8C6'),
(13648, 540, 530, 1, 8, 7, 2, 'RTSR8C7'),
(13649, 540, 545, 1, 8, 8, 2, 'RTSR8C8'),
(13650, 540, 560, 1, 8, 9, 2, 'RTSR8C9'),
(13651, 540, 575, 1, 8, 10, 2, 'RTSR8C10'),
(13652, 540, 590, 1, 8, 11, 2, 'RTSR8C11'),
(13653, 540, 605, 1, 8, 12, 2, 'RTSR8C12'),
(13654, 540, 620, 1, 8, 13, 2, 'RTSR8C13'),
(13655, 540, 635, 1, 8, 14, 2, 'RTSR8C14'),
(13656, 540, 650, 1, 8, 15, 2, 'RTSR8C15'),
(13657, 540, 665, 1, 8, 16, 2, 'RTSR8C16'),
(13658, 540, 680, 1, 8, 17, 2, 'RTSR8C17'),
(13659, 520, 135, 1, 9, 1, 2, 'LFSR9C1'),
(13660, 520, 150, 1, 9, 2, 2, 'LFSR9C2'),
(13661, 520, 165, 1, 9, 3, 2, 'LFSR9C3'),
(13662, 520, 180, 1, 9, 4, 2, 'LFSR9C4'),
(13663, 520, 195, 1, 9, 5, 2, 'LFSR9C5'),
(13664, 520, 210, 1, 9, 6, 2, 'LFSR9C6'),
(13665, 520, 225, 1, 9, 7, 2, 'LFSR9C7'),
(13666, 520, 240, 1, 9, 8, 2, 'LFSR9C8'),
(13667, 520, 255, 1, 9, 9, 2, 'LFSR9C9'),
(13668, 520, 270, 1, 9, 10, 2, 'LFSR9C10'),
(13669, 520, 285, 1, 9, 11, 2, 'LFSR9C11'),
(13670, 520, 300, 1, 9, 12, 2, 'LFSR9C12'),
(13671, 520, 315, 1, 9, 13, 2, 'LFSR9C13'),
(13672, 520, 330, 1, 9, 14, 2, 'LFSR9C14'),
(13673, 520, 345, 1, 9, 15, 2, 'LFSR9C15'),
(13674, 520, 360, 1, 9, 16, 2, 'LFSR9C16'),
(13675, 520, 375, 1, 9, 17, 2, 'LFSR9C17'),
(13676, 520, 440, 1, 9, 1, 2, 'RTSR9C1'),
(13677, 520, 455, 1, 9, 2, 2, 'RTSR9C2'),
(13678, 520, 470, 1, 9, 3, 2, 'RTSR9C3'),
(13679, 520, 485, 1, 9, 4, 2, 'RTSR9C4'),
(13680, 520, 500, 1, 9, 5, 2, 'RTSR9C5'),
(13681, 520, 515, 1, 9, 6, 2, 'RTSR9C6'),
(13682, 520, 530, 1, 9, 7, 2, 'RTSR9C7'),
(13683, 520, 545, 1, 9, 8, 2, 'RTSR9C8'),
(13684, 520, 560, 1, 9, 9, 2, 'RTSR9C9'),
(13685, 520, 575, 1, 9, 10, 2, 'RTSR9C10'),
(13686, 520, 590, 1, 9, 11, 2, 'RTSR9C11'),
(13687, 520, 605, 1, 9, 12, 2, 'RTSR9C12'),
(13688, 520, 620, 1, 9, 13, 2, 'RTSR9C13'),
(13689, 520, 635, 1, 9, 14, 2, 'RTSR9C14'),
(13690, 520, 650, 1, 9, 15, 2, 'RTSR9C15'),
(13691, 520, 665, 1, 9, 16, 2, 'RTSR9C16'),
(13692, 520, 680, 1, 9, 17, 2, 'RTSR9C17'),
(13693, 500, 135, 1, 10, 1, 2, 'LFSR10C1'),
(13694, 500, 150, 1, 10, 2, 2, 'LFSR10C2'),
(13695, 500, 165, 1, 10, 3, 2, 'LFSR10C3'),
(13696, 500, 180, 1, 10, 4, 2, 'LFSR10C4'),
(13697, 500, 195, 1, 10, 5, 2, 'LFSR10C5'),
(13698, 500, 210, 1, 10, 6, 2, 'LFSR10C6'),
(13699, 500, 225, 1, 10, 7, 2, 'LFSR10C7'),
(13700, 500, 240, 1, 10, 8, 2, 'LFSR10C8'),
(13701, 500, 255, 1, 10, 9, 2, 'LFSR10C9'),
(13702, 500, 270, 1, 10, 10, 2, 'LFSR10C10'),
(13703, 500, 285, 1, 10, 11, 2, 'LFSR10C11'),
(13704, 500, 300, 1, 10, 12, 2, 'LFSR10C12'),
(13705, 500, 315, 1, 10, 13, 2, 'LFSR10C13'),
(13706, 500, 330, 1, 10, 14, 2, 'LFSR10C14'),
(13707, 500, 345, 1, 10, 15, 2, 'LFSR10C15'),
(13708, 500, 360, 1, 10, 16, 2, 'LFSR10C16'),
(13709, 500, 375, 1, 10, 17, 2, 'LFSR10C17'),
(13710, 500, 440, 1, 10, 1, 2, 'RTSR10C1'),
(13711, 500, 455, 1, 10, 2, 2, 'RTSR10C2'),
(13712, 500, 470, 1, 10, 3, 2, 'RTSR10C3'),
(13713, 500, 485, 1, 10, 4, 2, 'RTSR10C4'),
(13714, 500, 500, 1, 10, 5, 2, 'RTSR10C5'),
(13715, 500, 515, 1, 10, 6, 2, 'RTSR10C6'),
(13716, 500, 530, 1, 10, 7, 2, 'RTSR10C7'),
(13717, 500, 545, 1, 10, 8, 2, 'RTSR10C8'),
(13718, 500, 560, 1, 10, 9, 2, 'RTSR10C9'),
(13719, 500, 575, 1, 10, 10, 2, 'RTSR10C10'),
(13720, 500, 590, 1, 10, 11, 2, 'RTSR10C11'),
(13721, 500, 605, 1, 10, 12, 2, 'RTSR10C12'),
(13722, 500, 620, 1, 10, 13, 2, 'RTSR10C13'),
(13723, 500, 635, 1, 10, 14, 2, 'RTSR10C14'),
(13724, 500, 650, 1, 10, 15, 2, 'RTSR10C15'),
(13725, 500, 665, 1, 10, 16, 2, 'RTSR10C16'),
(13726, 500, 680, 1, 10, 17, 2, 'RTSR10C17'),
(13727, 480, 135, 1, 11, 1, 2, 'LFSR11C1'),
(13728, 480, 150, 1, 11, 2, 2, 'LFSR11C2'),
(13729, 480, 165, 1, 11, 3, 2, 'LFSR11C3'),
(13730, 480, 180, 1, 11, 4, 2, 'LFSR11C4'),
(13731, 480, 195, 1, 11, 5, 2, 'LFSR11C5'),
(13732, 480, 210, 1, 11, 6, 2, 'LFSR11C6'),
(13733, 480, 225, 1, 11, 7, 2, 'LFSR11C7'),
(13734, 480, 240, 1, 11, 8, 2, 'LFSR11C8'),
(13735, 480, 255, 1, 11, 9, 2, 'LFSR11C9'),
(13736, 480, 270, 1, 11, 10, 2, 'LFSR11C10'),
(13737, 480, 285, 1, 11, 11, 2, 'LFSR11C11'),
(13738, 480, 300, 1, 11, 12, 2, 'LFSR11C12'),
(13739, 480, 315, 1, 11, 13, 2, 'LFSR11C13'),
(13740, 480, 330, 1, 11, 14, 2, 'LFSR11C14'),
(13741, 480, 345, 1, 11, 15, 2, 'LFSR11C15'),
(13742, 480, 360, 1, 11, 16, 2, 'LFSR11C16'),
(13743, 480, 375, 1, 11, 17, 2, 'LFSR11C17'),
(13744, 480, 440, 1, 11, 1, 2, 'RTSR11C1'),
(13745, 480, 455, 1, 11, 2, 2, 'RTSR11C2'),
(13746, 480, 470, 1, 11, 3, 2, 'RTSR11C3'),
(13747, 480, 485, 1, 11, 4, 2, 'RTSR11C4'),
(13748, 480, 500, 1, 11, 5, 2, 'RTSR11C5'),
(13749, 480, 515, 1, 11, 6, 2, 'RTSR11C6'),
(13750, 480, 530, 1, 11, 7, 2, 'RTSR11C7'),
(13751, 480, 545, 1, 11, 8, 2, 'RTSR11C8'),
(13752, 480, 560, 1, 11, 9, 2, 'RTSR11C9'),
(13753, 480, 575, 1, 11, 10, 2, 'RTSR11C10'),
(13754, 480, 590, 1, 11, 11, 2, 'RTSR11C11'),
(13755, 480, 605, 1, 11, 12, 2, 'RTSR11C12'),
(13756, 480, 620, 1, 11, 13, 2, 'RTSR11C13'),
(13757, 480, 635, 1, 11, 14, 2, 'RTSR11C14'),
(13758, 480, 650, 1, 11, 15, 2, 'RTSR11C15'),
(13759, 480, 665, 1, 11, 16, 2, 'RTSR11C16'),
(13760, 480, 680, 1, 11, 17, 2, 'RTSR11C17'),
(13761, 460, 135, 1, 12, 1, 2, 'LFSR12C1'),
(13762, 460, 150, 1, 12, 2, 2, 'LFSR12C2'),
(13763, 460, 165, 1, 12, 3, 2, 'LFSR12C3'),
(13764, 460, 180, 1, 12, 4, 2, 'LFSR12C4'),
(13765, 460, 195, 1, 12, 5, 2, 'LFSR12C5'),
(13766, 460, 210, 1, 12, 6, 2, 'LFSR12C6'),
(13767, 460, 225, 1, 12, 7, 2, 'LFSR12C7'),
(13768, 460, 240, 1, 12, 8, 2, 'LFSR12C8'),
(13769, 460, 255, 1, 12, 9, 2, 'LFSR12C9'),
(13770, 460, 270, 1, 12, 10, 2, 'LFSR12C10'),
(13771, 460, 285, 1, 12, 11, 2, 'LFSR12C11'),
(13772, 460, 300, 1, 12, 12, 2, 'LFSR12C12'),
(13773, 460, 315, 1, 12, 13, 2, 'LFSR12C13'),
(13774, 460, 330, 1, 12, 14, 2, 'LFSR12C14'),
(13775, 460, 345, 1, 12, 15, 2, 'LFSR12C15'),
(13776, 460, 360, 1, 12, 16, 2, 'LFSR12C16'),
(13777, 460, 375, 1, 12, 17, 2, 'LFSR12C17'),
(13778, 460, 440, 1, 12, 1, 2, 'RTSR12C1'),
(13779, 460, 455, 1, 12, 2, 2, 'RTSR12C2'),
(13780, 460, 470, 1, 12, 3, 2, 'RTSR12C3'),
(13781, 460, 485, 1, 12, 4, 2, 'RTSR12C4'),
(13782, 460, 500, 1, 12, 5, 2, 'RTSR12C5'),
(13783, 460, 515, 1, 12, 6, 2, 'RTSR12C6'),
(13784, 460, 530, 1, 12, 7, 2, 'RTSR12C7'),
(13785, 460, 545, 1, 12, 8, 2, 'RTSR12C8'),
(13786, 460, 560, 1, 12, 9, 2, 'RTSR12C9'),
(13787, 460, 575, 1, 12, 10, 2, 'RTSR12C10'),
(13788, 460, 590, 1, 12, 11, 2, 'RTSR12C11'),
(13789, 460, 605, 1, 12, 12, 2, 'RTSR12C12'),
(13790, 460, 620, 1, 12, 13, 2, 'RTSR12C13'),
(13791, 460, 635, 1, 12, 14, 2, 'RTSR12C14'),
(13792, 460, 650, 1, 12, 15, 2, 'RTSR12C15'),
(13793, 460, 665, 1, 12, 16, 2, 'RTSR12C16'),
(13794, 460, 680, 1, 12, 17, 2, 'RTSR12C17'),
(13795, 440, 135, 1, 13, 1, 2, 'LFSR13C1'),
(13796, 440, 150, 1, 13, 2, 2, 'LFSR13C2'),
(13797, 440, 165, 1, 13, 3, 2, 'LFSR13C3'),
(13798, 440, 180, 1, 13, 4, 2, 'LFSR13C4'),
(13799, 440, 195, 1, 13, 5, 2, 'LFSR13C5'),
(13800, 440, 210, 1, 13, 6, 2, 'LFSR13C6'),
(13801, 440, 225, 1, 13, 7, 2, 'LFSR13C7'),
(13802, 440, 240, 1, 13, 8, 2, 'LFSR13C8'),
(13803, 440, 255, 1, 13, 9, 2, 'LFSR13C9'),
(13804, 440, 270, 1, 13, 10, 2, 'LFSR13C10'),
(13805, 440, 285, 1, 13, 11, 2, 'LFSR13C11'),
(13806, 440, 300, 1, 13, 12, 2, 'LFSR13C12'),
(13807, 440, 315, 1, 13, 13, 2, 'LFSR13C13'),
(13808, 440, 330, 1, 13, 14, 2, 'LFSR13C14'),
(13809, 440, 345, 1, 13, 15, 2, 'LFSR13C15'),
(13810, 440, 360, 1, 13, 16, 2, 'LFSR13C16'),
(13811, 440, 375, 1, 13, 17, 2, 'LFSR13C17'),
(13812, 440, 440, 1, 13, 1, 2, 'RTSR13C1'),
(13813, 440, 455, 1, 13, 2, 2, 'RTSR13C2'),
(13814, 440, 470, 1, 13, 3, 2, 'RTSR13C3'),
(13815, 440, 485, 1, 13, 4, 2, 'RTSR13C4'),
(13816, 440, 500, 1, 13, 5, 2, 'RTSR13C5'),
(13817, 440, 515, 1, 13, 6, 2, 'RTSR13C6'),
(13818, 440, 530, 1, 13, 7, 2, 'RTSR13C7'),
(13819, 440, 545, 1, 13, 8, 2, 'RTSR13C8'),
(13820, 440, 560, 1, 13, 9, 2, 'RTSR13C9'),
(13821, 440, 575, 1, 13, 10, 2, 'RTSR13C10'),
(13822, 440, 590, 1, 13, 11, 2, 'RTSR13C11'),
(13823, 440, 605, 1, 13, 12, 2, 'RTSR13C12'),
(13824, 440, 620, 1, 13, 13, 2, 'RTSR13C13'),
(13825, 440, 635, 1, 13, 14, 2, 'RTSR13C14'),
(13826, 440, 650, 1, 13, 15, 2, 'RTSR13C15'),
(13827, 440, 665, 1, 13, 16, 2, 'RTSR13C16'),
(13828, 440, 680, 1, 13, 17, 2, 'RTSR13C17'),
(13829, 420, 135, 1, 14, 1, 2, 'LFSR14C1'),
(13830, 420, 150, 1, 14, 2, 2, 'LFSR14C2'),
(13831, 420, 165, 1, 14, 3, 2, 'LFSR14C3'),
(13832, 420, 180, 1, 14, 4, 2, 'LFSR14C4'),
(13833, 420, 195, 1, 14, 5, 2, 'LFSR14C5'),
(13834, 420, 210, 1, 14, 6, 2, 'LFSR14C6'),
(13835, 420, 225, 1, 14, 7, 2, 'LFSR14C7'),
(13836, 420, 240, 1, 14, 8, 2, 'LFSR14C8'),
(13837, 420, 255, 1, 14, 9, 2, 'LFSR14C9'),
(13838, 420, 270, 1, 14, 10, 2, 'LFSR14C10'),
(13839, 420, 285, 1, 14, 11, 2, 'LFSR14C11'),
(13840, 420, 300, 1, 14, 12, 2, 'LFSR14C12'),
(13841, 420, 315, 1, 14, 13, 2, 'LFSR14C13'),
(13842, 420, 330, 1, 14, 14, 2, 'LFSR14C14'),
(13843, 420, 345, 1, 14, 15, 2, 'LFSR14C15'),
(13844, 420, 360, 1, 14, 16, 2, 'LFSR14C16'),
(13845, 420, 375, 1, 14, 17, 2, 'LFSR14C17'),
(13846, 420, 440, 1, 14, 1, 2, 'RTSR14C1'),
(13847, 420, 455, 1, 14, 2, 2, 'RTSR14C2'),
(13848, 420, 470, 1, 14, 3, 2, 'RTSR14C3'),
(13849, 420, 485, 1, 14, 4, 2, 'RTSR14C4'),
(13850, 420, 500, 1, 14, 5, 2, 'RTSR14C5'),
(13851, 420, 515, 1, 14, 6, 2, 'RTSR14C6'),
(13852, 420, 530, 1, 14, 7, 2, 'RTSR14C7'),
(13853, 420, 545, 1, 14, 8, 2, 'RTSR14C8'),
(13854, 420, 560, 1, 14, 9, 2, 'RTSR14C9'),
(13855, 420, 575, 1, 14, 10, 2, 'RTSR14C10'),
(13856, 420, 590, 1, 14, 11, 2, 'RTSR14C11'),
(13857, 420, 605, 1, 14, 12, 2, 'RTSR14C12'),
(13858, 420, 620, 1, 14, 13, 2, 'RTSR14C13'),
(13859, 420, 635, 1, 14, 14, 2, 'RTSR14C14'),
(13860, 420, 650, 1, 14, 15, 2, 'RTSR14C15'),
(13861, 420, 665, 1, 14, 16, 2, 'RTSR14C16'),
(13862, 420, 680, 1, 14, 17, 2, 'RTSR14C17'),
(13863, 635, 170, 3, 0, 0, 1, 'VIP_BOX_R646_145'),
(13865, 620, 170, 3, 0, 0, 1, 'CP_620170'),
(13866, 600, 180, 3, 0, 0, 1, 'CP_600180'),
(13867, 585, 180, 3, 0, 0, 1, 'CP_585180'),
(13868, 565, 190, 3, 0, 0, 1, 'CP_565190'),
(13869, 550, 190, 3, 0, 0, 1, 'CP_550190'),
(13870, 530, 200, 3, 0, 0, 1, 'CP_530200'),
(13871, 515, 200, 3, 0, 0, 1, 'CP_515200'),
(13872, 495, 210, 3, 0, 0, 1, 'CP_495210'),
(13873, 480, 210, 3, 0, 0, 1, 'CP_480210'),
(13874, 460, 220, 3, 0, 0, 1, 'CP_460220'),
(13875, 445, 220, 3, 0, 0, 1, 'CP_445220'),
(13876, 425, 230, 3, 0, 0, 1, 'CP_425230'),
(13877, 410, 230, 3, 0, 0, 1, 'CP_410230'),
(13878, 390, 240, 3, 0, 0, 1, 'CP_390240'),
(13879, 375, 240, 3, 0, 0, 1, 'CP_375240'),
(13880, 355, 250, 3, 0, 0, 1, 'CP_355250'),
(13881, 340, 250, 3, 0, 0, 1, 'CP_340250'),
(13882, 635, 130, 4, 0, 0, 1, 'CP_635130'),
(13883, 620, 130, 4, 0, 0, 1, 'CP_620130'),
(13884, 600, 140, 4, 0, 0, 1, 'CP_600140'),
(13885, 585, 140, 4, 0, 0, 1, 'CP_585140'),
(13886, 565, 150, 4, 0, 0, 1, 'CP_565150'),
(13887, 550, 150, 4, 0, 0, 1, 'CP_550150'),
(13888, 530, 160, 4, 0, 0, 1, 'CP_530160'),
(13889, 515, 160, 4, 0, 0, 1, 'CP_515160'),
(13890, 495, 170, 4, 0, 0, 1, 'CP_495170'),
(13891, 480, 170, 4, 0, 0, 1, 'CP_480170'),
(13892, 460, 180, 4, 0, 0, 1, 'CP_460180'),
(13893, 445, 180, 4, 0, 0, 1, 'CP_445180'),
(13894, 425, 190, 4, 0, 0, 1, 'CP_425190'),
(13895, 410, 190, 4, 0, 0, 1, 'CP_410190'),
(13896, 390, 200, 4, 0, 0, 1, 'CP_390200'),
(13897, 375, 200, 4, 0, 0, 1, 'CP_375200'),
(13898, 355, 210, 4, 0, 0, 1, 'CP_355210'),
(13899, 340, 210, 4, 0, 0, 1, 'CP_340210'),
(14503, 635, 795, 3, 0, 0, 1, 'ZONECP_635795'),
(14504, 620, 795, 3, 0, 0, 1, 'ZONECP_620795'),
(14505, 600, 785, 3, 0, 0, 1, 'ZONECP_600785'),
(14506, 585, 785, 3, 0, 0, 1, 'ZONECP_585785'),
(14507, 565, 775, 3, 0, 0, 1, 'ZONECP_565775'),
(14508, 550, 775, 3, 0, 0, 1, 'ZONECP_550775'),
(14509, 530, 765, 3, 0, 0, 1, 'ZONECP_530765'),
(14510, 515, 765, 3, 0, 0, 1, 'ZONECP_515765'),
(14511, 495, 755, 3, 0, 0, 1, 'ZONECP_495755'),
(14512, 480, 755, 3, 0, 0, 1, 'ZONECP_480755'),
(14513, 460, 745, 3, 0, 0, 1, 'ZONECP_460745'),
(14514, 445, 745, 3, 0, 0, 1, 'ZONECP_445745'),
(14515, 425, 735, 3, 0, 0, 1, 'ZONECP_425735'),
(14516, 410, 735, 3, 0, 0, 1, 'ZONECP_410735'),
(14517, 390, 725, 3, 0, 0, 1, 'ZONECP_390725'),
(14518, 375, 725, 3, 0, 0, 1, 'ZONECP_375725'),
(14519, 355, 715, 3, 0, 0, 1, 'ZONECP_355715'),
(14520, 340, 715, 3, 0, 0, 1, 'ZONECP_340715'),
(14521, 635, 780, 3, 0, 0, 1, 'ZONECP_635780'),
(14522, 620, 780, 3, 0, 0, 1, 'ZONECP_620780'),
(14523, 600, 770, 3, 0, 0, 1, 'ZONECP_600770'),
(14524, 585, 770, 3, 0, 0, 1, 'ZONECP_585770'),
(14525, 565, 760, 3, 0, 0, 1, 'ZONECP_565760'),
(14526, 550, 760, 3, 0, 0, 1, 'ZONECP_550760'),
(14527, 530, 750, 3, 0, 0, 1, 'ZONECP_530750'),
(14528, 515, 750, 3, 0, 0, 1, 'ZONECP_515750'),
(14529, 495, 740, 3, 0, 0, 1, 'ZONECP_495740'),
(14530, 480, 740, 3, 0, 0, 1, 'ZONECP_480740'),
(14531, 460, 730, 3, 0, 0, 1, 'ZONECP_460730'),
(14532, 445, 730, 3, 0, 0, 1, 'ZONECP_445730'),
(14533, 425, 720, 3, 0, 0, 1, 'ZONECP_425720'),
(14534, 410, 720, 3, 0, 0, 1, 'ZONECP_410720'),
(14535, 390, 710, 3, 0, 0, 1, 'ZONECP_390710'),
(14536, 375, 710, 3, 0, 0, 1, 'ZONECP_375710'),
(14537, 355, 700, 3, 0, 0, 1, 'ZONECP_355700'),
(14538, 340, 700, 3, 0, 0, 1, 'ZONECP_340700'),
(14575, 635, 835, 4, 0, 0, 1, 'ZONECP_635835'),
(14576, 620, 835, 4, 0, 0, 1, 'ZONECP_620835'),
(14577, 600, 825, 4, 0, 0, 1, 'ZONECP_600825'),
(14578, 585, 825, 4, 0, 0, 1, 'ZONECP_585825'),
(14579, 565, 815, 4, 0, 0, 1, 'ZONECP_565815'),
(14580, 550, 815, 4, 0, 0, 1, 'ZONECP_550815'),
(14581, 530, 805, 4, 0, 0, 1, 'ZONECP_530805'),
(14582, 515, 805, 4, 0, 0, 1, 'ZONECP_515805'),
(14583, 495, 795, 4, 0, 0, 1, 'ZONECP_495795'),
(14584, 480, 795, 4, 0, 0, 1, 'ZONECP_480795'),
(14585, 460, 785, 4, 0, 0, 1, 'ZONECP_460785'),
(14586, 445, 785, 4, 0, 0, 1, 'ZONECP_445785'),
(14587, 425, 775, 4, 0, 0, 1, 'ZONECP_425775'),
(14588, 410, 775, 4, 0, 0, 1, 'ZONECP_410775'),
(14589, 390, 765, 4, 0, 0, 1, 'ZONECP_390765'),
(14590, 375, 765, 4, 0, 0, 1, 'ZONECP_375765'),
(14591, 355, 755, 4, 0, 0, 1, 'ZONECP_355755'),
(14592, 340, 755, 4, 0, 0, 1, 'ZONECP_340755'),
(14593, 635, 820, 4, 0, 0, 1, 'ZONECP_635820'),
(14594, 620, 820, 4, 0, 0, 1, 'ZONECP_620820'),
(14595, 600, 810, 4, 0, 0, 1, 'ZONECP_600810'),
(14596, 585, 810, 4, 0, 0, 1, 'ZONECP_585810'),
(14597, 565, 800, 4, 0, 0, 1, 'ZONECP_565800'),
(14598, 550, 800, 4, 0, 0, 1, 'ZONECP_550800'),
(14599, 530, 790, 4, 0, 0, 1, 'ZONECP_530790'),
(14600, 515, 790, 4, 0, 0, 1, 'ZONECP_515790'),
(14601, 495, 780, 4, 0, 0, 1, 'ZONECP_495780'),
(14602, 480, 780, 4, 0, 0, 1, 'ZONECP_480780'),
(14603, 460, 770, 4, 0, 0, 1, 'ZONECP_460770'),
(14604, 445, 770, 4, 0, 0, 1, 'ZONECP_445770'),
(14605, 425, 760, 4, 0, 0, 1, 'ZONECP_425760'),
(14606, 410, 760, 4, 0, 0, 1, 'ZONECP_410760'),
(14607, 390, 750, 4, 0, 0, 1, 'ZONECP_390750'),
(14608, 375, 750, 4, 0, 0, 1, 'ZONECP_375750'),
(14609, 355, 740, 4, 0, 0, 1, 'ZONECP_355740'),
(14610, 340, 740, 4, 0, 0, 1, 'ZONECP_340740'),
(15589, 450, 100, 7, 0, 0, 1, 'BACL_SDL_R450C100'),
(15590, 436, 106, 7, 0, 0, 1, 'BACL_SDL_R436C106'),
(15591, 422, 112, 7, 0, 0, 1, 'BACL_SDL_R422C112'),
(15592, 408, 118, 7, 0, 0, 1, 'BACL_SDL_R408C118'),
(15593, 394, 124, 7, 0, 0, 1, 'BACL_SDL_R394C124'),
(15594, 380, 130, 7, 0, 0, 1, 'BACL_SDL_R380C130'),
(15595, 366, 136, 7, 0, 0, 1, 'BACL_SDL_R366C136'),
(15596, 352, 142, 7, 0, 0, 1, 'BACL_SDL_R352C142'),
(15597, 338, 148, 7, 0, 0, 1, 'BACL_SDL_R338C148'),
(15598, 324, 154, 7, 0, 0, 1, 'BACL_SDL_R324C154'),
(15599, 310, 160, 7, 0, 0, 1, 'BACL_SDL_R310C160'),
(15600, 296, 166, 7, 0, 0, 1, 'BACL_SDL_R296C166'),
(15601, 282, 172, 7, 0, 0, 1, 'BACL_SDL_R282C172'),
(15602, 268, 178, 7, 0, 0, 1, 'BACL_SDL_R268C178'),
(15603, 254, 184, 7, 0, 0, 1, 'BACL_SDL_R254C184'),
(15604, 250, 200, 7, 0, 0, 1, 'BACL_SDL_R250C200'),
(15605, 250, 214, 7, 0, 0, 1, 'BACL_SDL_R250C214'),
(15606, 250, 228, 7, 0, 0, 1, 'BACL_SDL_R250C228'),
(15607, 250, 242, 7, 0, 0, 1, 'BACL_SDL_R250C242'),
(15608, 250, 256, 7, 0, 0, 1, 'BACL_SDL_R250C256'),
(15609, 250, 270, 7, 0, 0, 1, 'BACL_SDL_R250C270'),
(15610, 250, 284, 7, 0, 0, 1, 'BACL_SDL_R250C284'),
(15611, 250, 298, 7, 0, 0, 1, 'BACL_SDL_R250C298'),
(15612, 250, 312, 7, 0, 0, 1, 'BACL_SDL_R250C312'),
(15613, 250, 326, 7, 0, 0, 1, 'BACL_SDL_R250C326'),
(15614, 250, 340, 7, 0, 0, 1, 'BACL_SDL_R250C340'),
(15615, 250, 354, 7, 0, 0, 1, 'BACL_SDL_R250C354'),
(15616, 250, 368, 7, 0, 0, 1, 'BACL_SDL_R250C368'),
(15617, 250, 382, 7, 0, 0, 1, 'BACL_SDL_R250C382'),
(15618, 250, 396, 7, 0, 0, 1, 'BACL_SDL_R250C396'),
(15619, 250, 410, 7, 0, 0, 1, 'BACL_SDL_R250C410'),
(15620, 250, 424, 7, 0, 0, 1, 'BACL_SDL_R250C424'),
(15621, 250, 438, 7, 0, 0, 1, 'BACL_SDL_R250C438'),
(15622, 250, 452, 7, 0, 0, 1, 'BACL_SDL_R250C452'),
(15623, 250, 466, 7, 0, 0, 1, 'BACL_SDL_R250C466'),
(15624, 450, 850, 7, 0, 0, 1, 'BALCKZONECP_450850'),
(15625, 436, 844, 7, 0, 0, 1, 'BALCKZONECP_436844'),
(15626, 422, 838, 7, 0, 0, 1, 'BALCKZONECP_422838'),
(15627, 408, 832, 7, 0, 0, 1, 'BALCKZONECP_408832'),
(15628, 394, 826, 7, 0, 0, 1, 'BALCKZONECP_394826'),
(15629, 380, 820, 7, 0, 0, 1, 'BALCKZONECP_380820'),
(15630, 366, 814, 7, 0, 0, 1, 'BALCKZONECP_366814'),
(15631, 352, 808, 7, 0, 0, 1, 'BALCKZONECP_352808'),
(15632, 338, 802, 7, 0, 0, 1, 'BALCKZONECP_338802'),
(15633, 324, 796, 7, 0, 0, 1, 'BALCKZONECP_324796'),
(15634, 310, 790, 7, 0, 0, 1, 'BALCKZONECP_310790'),
(15635, 296, 784, 7, 0, 0, 1, 'BALCKZONECP_296784'),
(15636, 282, 778, 7, 0, 0, 1, 'BALCKZONECP_282778'),
(15637, 268, 772, 7, 0, 0, 1, 'BALCKZONECP_268772'),
(15638, 254, 766, 7, 0, 0, 1, 'BALCKZONECP_254766'),
(15639, 250, 750, 7, 0, 0, 1, 'BALCKZONECP_250750'),
(15640, 250, 736, 7, 0, 0, 1, 'BALCKZONECP_250736'),
(15641, 250, 722, 7, 0, 0, 1, 'BALCKZONECP_250722'),
(15642, 250, 708, 7, 0, 0, 1, 'BALCKZONECP_250708'),
(15643, 250, 694, 7, 0, 0, 1, 'BALCKZONECP_250694'),
(15644, 250, 680, 7, 0, 0, 1, 'BALCKZONECP_250680'),
(15645, 250, 666, 7, 0, 0, 1, 'BALCKZONECP_250666'),
(15646, 250, 652, 7, 0, 0, 1, 'BALCKZONECP_250652'),
(15647, 250, 638, 7, 0, 0, 1, 'BALCKZONECP_250638'),
(15648, 250, 624, 7, 0, 0, 1, 'BALCKZONECP_250624'),
(15649, 250, 610, 7, 0, 0, 1, 'BALCKZONECP_250610'),
(15650, 250, 596, 7, 0, 0, 1, 'BALCKZONECP_250596'),
(15651, 250, 582, 7, 0, 0, 1, 'BALCKZONECP_250582'),
(15652, 250, 568, 7, 0, 0, 1, 'BALCKZONECP_250568'),
(15653, 250, 554, 7, 0, 0, 1, 'BALCKZONECP_250554'),
(15654, 250, 540, 7, 0, 0, 1, 'BALCKZONECP_250540'),
(15655, 250, 526, 7, 0, 0, 1, 'BALCKZONECP_250526'),
(15656, 250, 512, 7, 0, 0, 1, 'BALCKZONECP_250512'),
(15657, 250, 498, 7, 0, 0, 1, 'BALCKZONECP_250498'),
(15658, 250, 484, 7, 0, 0, 1, 'BALCKZONECP_250484');
INSERT INTO `seatfloor` (`scr_id`, `scr_top`, `scr_left`, `scr_zone_id`, `scr_rowid`, `scr_colid`, `scr_theater_id`, `scr_seatname`) VALUES
(15659, 340, 300, 3, 0, 0, 1, 'LVL1BX_SDL_R14C11'),
(15660, 340, 315, 3, 0, 0, 1, 'LVL1BX_SDL_R14C10'),
(15661, 340, 330, 3, 0, 0, 1, 'LVL1BX_SDL_R14C9'),
(15662, 340, 345, 3, 0, 0, 1, 'LVL1BX_SDL_R14C8'),
(15663, 340, 360, 3, 0, 0, 1, 'LVL1BX_SDL_R14C7'),
(15664, 340, 375, 3, 0, 0, 1, 'LVL1BX_SDL_R14C6'),
(15665, 340, 390, 3, 0, 0, 1, 'LVL1BX_SDL_R14C5'),
(15666, 340, 405, 3, 0, 0, 1, 'LVL1BX_SDL_R14C4'),
(15667, 340, 420, 3, 0, 0, 1, 'LVL1BX_SDL_R14C3'),
(15668, 340, 435, 3, 0, 0, 1, 'LVL1BX_SDL_R14C2'),
(15669, 340, 450, 3, 0, 0, 1, 'LVL1BX_SDL_R14C1'),
(15670, 340, 500, 3, 0, 0, 1, 'LVL1BX_SDR_R14C1'),
(15671, 340, 515, 3, 0, 0, 1, 'LVL1BX_SDR_R14C2'),
(15672, 340, 530, 3, 0, 0, 1, 'LVL1BX_SDR_R14C3'),
(15673, 340, 545, 3, 0, 0, 1, 'LVL1BX_SDR_R14C4'),
(15674, 340, 560, 3, 0, 0, 1, 'LVL1BX_SDR_R14C5'),
(15675, 340, 575, 3, 0, 0, 1, 'LVL1BX_SDR_R14C6'),
(15676, 340, 590, 3, 0, 0, 1, 'LVL1BX_SDR_R14C7'),
(15677, 340, 605, 3, 0, 0, 1, 'LVL1BX_SDR_R14C8'),
(15678, 340, 620, 3, 0, 0, 1, 'LVL1BX_SDR_R14C9'),
(15679, 340, 635, 3, 0, 0, 1, 'LVL1BX_SDR_R14C10'),
(15680, 340, 650, 3, 0, 0, 1, 'LVL1BX_SDR_R14C11'),
(15681, 325, 300, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C11'),
(15682, 325, 315, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C10'),
(15683, 325, 330, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C9'),
(15684, 325, 345, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C8'),
(15685, 325, 360, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C7'),
(15686, 325, 375, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C6'),
(15687, 325, 390, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C5'),
(15688, 325, 405, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C4'),
(15689, 325, 420, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C3'),
(15690, 325, 435, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C2'),
(15691, 325, 450, 3, 0, 0, 1, 'LVL1BX2_SDL_R14C1'),
(15692, 325, 500, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C1'),
(15693, 325, 515, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C2'),
(15694, 325, 530, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C3'),
(15695, 325, 545, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C4'),
(15696, 325, 560, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C5'),
(15697, 325, 575, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C6'),
(15698, 325, 590, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C7'),
(15699, 325, 605, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C8'),
(15700, 325, 620, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C9'),
(15701, 325, 635, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C10'),
(15702, 325, 650, 3, 0, 0, 1, 'LVL1BX2_SDR_R14C11'),
(15703, 300, 300, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C11'),
(15704, 300, 315, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C10'),
(15705, 300, 330, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C9'),
(15706, 300, 345, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C8'),
(15707, 300, 360, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C7'),
(15708, 300, 375, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C6'),
(15709, 300, 390, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C5'),
(15710, 300, 405, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C4'),
(15711, 300, 420, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C3'),
(15712, 300, 435, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C2'),
(15713, 300, 450, 4, 0, 0, 1, 'LVLIIBX_SDL_R14C1'),
(15714, 300, 500, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C1'),
(15715, 300, 515, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C2'),
(15716, 300, 530, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C3'),
(15717, 300, 545, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C4'),
(15718, 300, 560, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C5'),
(15719, 300, 575, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C6'),
(15720, 300, 590, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C7'),
(15721, 300, 605, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C8'),
(15722, 300, 620, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C9'),
(15723, 300, 635, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C10'),
(15724, 300, 650, 4, 0, 0, 1, 'LVLIIBX_SDR_R14C11'),
(15726, 285, 300, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C11'),
(15727, 285, 315, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C10'),
(15728, 285, 330, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C9'),
(15729, 285, 345, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C8'),
(15730, 285, 360, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C7'),
(15731, 285, 375, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C6'),
(15732, 285, 390, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C5'),
(15733, 285, 405, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C4'),
(15734, 285, 420, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C3'),
(15735, 285, 435, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C2'),
(15736, 285, 450, 4, 0, 0, 1, 'LVLIIBX2_SDL_R14C1'),
(15737, 285, 500, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C1'),
(15738, 285, 515, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C2'),
(15739, 285, 530, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C3'),
(15740, 285, 545, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C4'),
(15741, 285, 560, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C5'),
(15742, 285, 575, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C6'),
(15743, 285, 590, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C7'),
(15744, 285, 605, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C8'),
(15745, 285, 620, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C9'),
(15746, 285, 635, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C10'),
(15747, 285, 650, 4, 0, 0, 1, 'LVLIIBX2_SDR_R14C11');

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `tht_id` int UNSIGNED NOT NULL,
  `tht_name` varchar(40) NOT NULL,
  `tht_address` varchar(80) NOT NULL,
  `tht_active` tinyint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`tht_id`, `tht_name`, `tht_address`, `tht_active`) VALUES
(1, 'Δημοτικο Θέατρο Πειραιά', '', 1),
(2, 'Θεάτρο Δημήτρης Χορν', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `typ_id` tinyint UNSIGNED NOT NULL,
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
  `zon_id` smallint UNSIGNED NOT NULL,
  `zon_theater_id` int UNSIGNED NOT NULL,
  `zon_title` varchar(45) NOT NULL,
  `zon_csscolor` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zon_id`, `zon_theater_id`, `zon_title`, `zon_csscolor`) VALUES
(1, 2, 'VIP', '70084c'),
(2, 1, 'VIP Boxes', '70084c'),
(3, 1, 'Level I Boxes', '3366ff'),
(4, 1, 'Level II Boxes', '47d1d1'),
(5, 1, 'Zone A', '66ff33'),
(6, 1, 'Zone B', 'ff6600'),
(7, 1, 'Balcony', 'ff00ff'),
(8, 1, 'VIP', '660066');

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
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD PRIMARY KEY (`crd_id`),
  ADD KEY `crd_order_id` (`crd_order_id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`char_id`),
  ADD UNIQUE KEY `char_play_id_2` (`char_play_id`,`char_name`),
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
  ADD KEY `ord_performance_id` (`ord_performance_id`),
  ADD KEY `ord_perf_date_id` (`ord_perf_date_id`);

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
  ADD UNIQUE KEY `prd_performance_id_3` (`prd_performance_id`,`prd_season_id`,`prd_date`),
  ADD KEY `prd_performance_id` (`prd_performance_id`);

--
-- Indexes for table `plays`
--
ALTER TABLE `plays`
  ADD PRIMARY KEY (`ply_id`),
  ADD KEY `ply_author_id` (`ply_author_id`),
  ADD KEY `ply_genre_id` (`ply_genre_id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`pri_id`),
  ADD UNIQUE KEY `pri_performance_id_2` (`pri_performance_id`,`pri_seasonid`,`pri_zone_id`,`pri_type_id`),
  ADD KEY `pri_type_id` (`pri_type_id`),
  ADD KEY `pri_zone_id` (`pri_zone_id`),
  ADD KEY `pri_performance_id` (`pri_performance_id`);

--
-- Indexes for table `seatfloor`
--
ALTER TABLE `seatfloor`
  ADD PRIMARY KEY (`scr_id`),
  ADD UNIQUE KEY `scr_top` (`scr_top`,`scr_left`,`scr_theater_id`),
  ADD UNIQUE KEY `scr_theater_id_2` (`scr_theater_id`,`scr_seatname`),
  ADD KEY `scr_theater_id` (`scr_theater_id`),
  ADD KEY `scr_zone_id` (`scr_zone_id`);

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
  MODIFY `act_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `aut_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card_details`
--
ALTER TABLE `card_details`
  MODIFY `crd_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `char_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `gen_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ord_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `itm_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `ppl_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `per_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `performance_dates`
--
ALTER TABLE `performance_dates`
  MODIFY `prd_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `plays`
--
ALTER TABLE `plays`
  MODIFY `ply_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `pri_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `seatfloor`
--
ALTER TABLE `seatfloor`
  MODIFY `scr_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15748;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `tht_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `typ_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zon_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Constraints for table `card_details`
--
ALTER TABLE `card_details`
  ADD CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`crd_order_id`) REFERENCES `orders` (`ord_id`);

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`char_play_id`) REFERENCES `plays` (`ply_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ord_performance_id`) REFERENCES `performance` (`per_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ord_perf_date_id`) REFERENCES `performance_dates` (`prd_id`);

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
  ADD CONSTRAINT `plays_ibfk_1` FOREIGN KEY (`ply_author_id`) REFERENCES `authors` (`aut_id`),
  ADD CONSTRAINT `plays_ibfk_2` FOREIGN KEY (`ply_genre_id`) REFERENCES `genres` (`gen_id`);

--
-- Constraints for table `pricing`
--
ALTER TABLE `pricing`
  ADD CONSTRAINT `pricing_ibfk_1` FOREIGN KEY (`pri_performance_id`) REFERENCES `performance` (`per_id`),
  ADD CONSTRAINT `pricing_ibfk_2` FOREIGN KEY (`pri_type_id`) REFERENCES `types` (`typ_id`),
  ADD CONSTRAINT `pricing_ibfk_3` FOREIGN KEY (`pri_zone_id`) REFERENCES `zones` (`zon_id`);

--
-- Constraints for table `seatfloor`
--
ALTER TABLE `seatfloor`
  ADD CONSTRAINT `seatfloor_ibfk_1` FOREIGN KEY (`scr_theater_id`) REFERENCES `theaters` (`tht_id`),
  ADD CONSTRAINT `seatfloor_ibfk_2` FOREIGN KEY (`scr_zone_id`) REFERENCES `zones` (`zon_id`);

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`zon_theater_id`) REFERENCES `theaters` (`tht_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

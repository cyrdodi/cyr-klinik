-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2020 at 08:05 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_print_billing`
--

CREATE TABLE `log_print_billing` (
  `id_log` int(11) NOT NULL,
  `no_billing` varchar(150) NOT NULL,
  `jenis_dokumen` enum('billing','kwitansi') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_print_billing`
--

INSERT INTO `log_print_billing` (`id_log`, `no_billing`, `jenis_dokumen`, `timestamp`, `user_id`) VALUES
(1, 'IBK/2011/00009', 'billing', '2020-11-18 04:08:17', 1),
(2, 'IBK/2011/00009', 'billing', '2020-11-18 04:08:30', 1),
(3, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:12', 1),
(4, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:15', 1),
(5, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:17', 1),
(6, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:20', 1),
(7, 'IBK/2011/00009', 'billing', '2020-11-18 04:12:09', 1),
(8, 'IBK/2011/00009', 'billing', '2020-11-18 04:13:56', 1),
(9, 'IBK/2011/00009', 'billing', '2020-11-18 04:13:57', 1),
(10, 'IBK/2011/00009', 'billing', '2020-11-18 04:14:00', 1),
(11, 'IBK/2011/00009', 'billing', '2020-11-18 04:14:02', 1),
(49, 'IBK/2011/00008', 'billing', '2020-11-18 05:55:27', 1),
(50, 'IBK/2011/00008', 'billing', '2020-11-18 05:55:55', 1),
(51, 'IBK/2011/00008', 'billing', '2020-11-18 05:56:11', 1),
(52, 'IBK/2011/00008', 'billing', '2020-11-18 05:56:27', 1),
(53, 'IBK/2011/00008', 'billing', '2020-11-18 05:56:43', 1),
(54, 'IBK/2011/00008', 'billing', '2020-11-18 05:57:05', 1),
(55, 'IBK/2011/00008', 'billing', '2020-11-18 06:01:57', 1),
(56, 'IBK/2011/00008', 'billing', '2020-11-18 06:05:52', 1),
(57, 'IBK/2011/00008', 'billing', '2020-11-18 06:12:50', 1),
(58, 'IBK/2011/00008', 'billing', '2020-11-18 06:13:21', 1),
(59, 'IBK/2011/00008', 'billing', '2020-11-18 06:14:28', 1),
(60, 'IBK/2011/00008', 'billing', '2020-11-18 06:15:42', 1),
(61, 'IBK/2011/00008', 'billing', '2020-11-18 06:20:10', 1),
(62, 'IBK/2011/00008', 'billing', '2020-11-18 06:20:26', 1),
(63, 'IBK/2011/00008', 'billing', '2020-11-18 06:20:57', 1),
(64, 'IBK/2011/00008', 'billing', '2020-11-18 06:21:15', 1),
(65, 'IBK/2011/00008', 'billing', '2020-11-18 06:22:13', 1),
(66, 'IBK/2011/00008', 'billing', '2020-11-18 06:26:08', 1),
(67, 'IBK/2011/00008', 'billing', '2020-11-18 06:30:11', 1),
(68, 'IBK/2011/00008', 'billing', '2020-11-18 06:30:46', 1),
(69, 'IBK/2011/00008', 'billing', '2020-11-18 06:31:25', 1),
(70, 'IBK/2011/00008', 'billing', '2020-11-18 06:32:01', 1),
(71, 'IBK/2011/00008', 'billing', '2020-11-18 06:32:43', 1),
(72, 'IBK/2011/00008', 'billing', '2020-11-18 06:33:11', 1),
(73, 'IBK/2011/00008', 'billing', '2020-11-18 06:34:17', 1),
(74, 'IBK/2011/00008', 'billing', '2020-11-18 06:35:32', 1),
(75, 'IBK/2011/00008', 'billing', '2020-11-18 06:36:59', 1),
(76, 'IBK/2011/00008', 'billing', '2020-11-18 06:41:05', 1),
(77, 'IBK/2011/00008', 'billing', '2020-11-18 06:42:50', 1),
(78, 'IBK/2011/00008', 'billing', '2020-11-18 06:48:41', 1),
(79, 'IBK/2011/00008', 'billing', '2020-11-18 06:48:57', 1),
(80, 'IBK/2011/00008', 'billing', '2020-11-18 06:51:19', 1),
(81, 'IBK/2011/00008', 'billing', '2020-11-18 06:52:04', 1),
(82, 'IBK/2011/00008', 'billing', '2020-11-18 06:52:38', 1),
(83, 'IBK/2011/00008', 'billing', '2020-11-18 06:53:22', 1),
(84, 'IBK/2011/00008', 'billing', '2020-11-18 06:53:41', 1),
(85, 'IBK/2011/00008', 'billing', '2020-11-18 06:54:38', 1),
(86, 'IBK/2011/00008', 'billing', '2020-11-18 06:55:14', 1),
(87, 'IBK/2011/00008', 'billing', '2020-11-18 06:55:40', 1),
(88, 'IBK/2011/00008', 'billing', '2020-11-18 06:58:22', 1),
(89, 'IBK/2011/00008', 'billing', '2020-11-18 06:59:50', 1),
(90, 'IBK/2011/00008', 'billing', '2020-11-18 07:00:39', 1),
(91, 'IBK/2011/00008', 'billing', '2020-11-18 07:01:01', 1),
(92, 'IBK/2011/00008', 'billing', '2020-11-18 07:01:37', 1),
(93, 'IBK/2011/00008', 'billing', '2020-11-18 07:02:52', 1),
(94, 'IBK/2011/00008', 'billing', '2020-11-18 07:03:13', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_print_billing`
--
ALTER TABLE `log_print_billing`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `no_billing` (`no_billing`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_print_billing`
--
ALTER TABLE `log_print_billing`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_print_billing`
--
ALTER TABLE `log_print_billing`
  ADD CONSTRAINT `log_print_billing_ibfk_1` FOREIGN KEY (`no_billing`) REFERENCES `billing_transaction` (`no_billing`),
  ADD CONSTRAINT `log_print_billing_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2020 at 12:51 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

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
-- Table structure for table `klinik_transaction`
--

DROP TABLE IF EXISTS `klinik_transaction`;
CREATE TABLE `klinik_transaction` (
  `id` varchar(100) NOT NULL,
  `tgl_berobat` date DEFAULT NULL,
  `cara_bayar` varchar(10) DEFAULT NULL,
  `medrek` varchar(125) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` char(4) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klinik_transaction`
--

INSERT INTO `klinik_transaction` (`id`, `tgl_berobat`, `cara_bayar`, `medrek`, `user_id`, `is_active`, `timestamp`) VALUES
('202011080001', '2020-11-08', 'p1', '000002', 1, '1', '2020-11-08 11:03:47'),
('202011080003', '2020-11-08', 'p1', '000002', 1, '0', '2020-11-08 11:03:57'),
('202011080004', '2020-11-08', 'p1', '000002', 1, '0', '2020-11-08 11:04:37'),
('202011080005', '2020-11-08', 'p1', '000002', 1, '1', '2020-11-08 11:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klinik_transaction`
--
ALTER TABLE `klinik_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_klinik_transaction_data_pasien1_idx` (`medrek`),
  ADD KEY `fk_klinik_transaction_user1_idx1` (`user_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klinik_transaction`
--
ALTER TABLE `klinik_transaction`
  ADD CONSTRAINT `fk_klinik_transaction_data_pasien1` FOREIGN KEY (`medrek`) REFERENCES `data_pasien` (`medrek`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_klinik_transaction_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

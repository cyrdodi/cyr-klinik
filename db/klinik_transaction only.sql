-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2020 at 08:06 AM
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
-- Table structure for table `klinik_transaction`
--

CREATE TABLE `klinik_transaction` (
  `id` varchar(100) NOT NULL,
  `tgl_berobat` date DEFAULT NULL,
  `cara_bayar` varchar(10) DEFAULT NULL,
  `medrek` varchar(125) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` char(4) DEFAULT NULL,
  `klinik_id` varchar(20) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klinik_transaction`
--

INSERT INTO `klinik_transaction` (`id`, `tgl_berobat`, `cara_bayar`, `medrek`, `user_id`, `status`, `klinik_id`, `timestamp`) VALUES
('202011080001', '2020-11-08', 'p1', '000002', 1, '2', 'KL001', '2020-11-08 11:03:47'),
('202011080003', '2020-11-08', 'p1', '000002', 1, '2', 'KL001', '2020-11-08 11:03:57'),
('202011080004', '2020-11-08', 'p1', '000002', 1, '2', 'KL001', '2020-11-08 11:04:37'),
('202011080005', '2020-11-08', 'p1', '000002', 1, '2', 'KL001', '2020-11-08 11:43:20'),
('2020110900006', '2020-11-09', 'p3', '000003', 1, '2', 'KL001', '2020-11-09 15:11:59'),
('2020111200007', '2020-11-12', 'p2', '000003', 1, '2', 'KL001', '2020-11-12 12:36:35'),
('2020111600008', '2020-11-16', 'p3', '000003', 1, '2', 'KL001', '2020-11-16 06:20:50'),
('2020111700009', '2020-11-17', 'p1', '000001', 1, '2', 'KL002', '2020-11-17 00:21:56'),
('2020111800010', '2020-11-18', 'p2', '000003', 1, '2', 'KL002', '2020-11-18 01:05:31'),
('2020111900011', '2020-11-19', 'p2', '000003', 1, '3', 'KL001', '2020-11-19 00:40:12'),
('2020111900012', '2020-11-19', 'p1', '000001', 1, '3', 'KL002', '2020-11-19 02:35:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klinik_transaction`
--
ALTER TABLE `klinik_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_klinik_transaction_data_pasien1_idx` (`medrek`),
  ADD KEY `fk_klinik_transaction_user1_idx1` (`user_id`),
  ADD KEY `fk_klinik_transaction_m_klinik1_idx` (`klinik_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klinik_transaction`
--
ALTER TABLE `klinik_transaction`
  ADD CONSTRAINT `fk_klinik_transaction_data_pasien1` FOREIGN KEY (`medrek`) REFERENCES `data_pasien` (`medrek`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_klinik_transaction_m_klinik1` FOREIGN KEY (`klinik_id`) REFERENCES `m_klinik` (`klinik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_klinik_transaction_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

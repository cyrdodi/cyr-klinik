-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2020 at 08:00 AM
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
-- Table structure for table `tindakan_has_klinik`
--

CREATE TABLE `tindakan_has_klinik` (
  `tindakan_id` int(11) NOT NULL,
  `klinik_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tindakan_has_klinik`
--
ALTER TABLE `tindakan_has_klinik`
  ADD PRIMARY KEY (`tindakan_id`,`klinik_id`),
  ADD KEY `fk_b_tindakan_has_m_klinik_m_klinik1_idx` (`klinik_id`),
  ADD KEY `fk_b_tindakan_has_m_klinik_b_tindakan1_idx` (`tindakan_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tindakan_has_klinik`
--
ALTER TABLE `tindakan_has_klinik`
  ADD CONSTRAINT `fk_b_tindakan_has_m_klinik_b_tindakan1` FOREIGN KEY (`tindakan_id`) REFERENCES `b_tindakan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_b_tindakan_has_m_klinik_m_klinik1` FOREIGN KEY (`klinik_id`) REFERENCES `m_klinik` (`klinik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

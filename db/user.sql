-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 02:27 PM
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `nama` varchar(125) DEFAULT NULL,
  `role_id` char(10) DEFAULT NULL,
  `is_active` char(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `role_id`, `is_active`, `timestamp`) VALUES
(1, 'admin', '$2y$10$JGCT0okRwdu2pJWxqh5Cd.FWgTzhkheBxvjwFOpFBEHXnsTIOylya', 'Admin', '1', '1', '2020-11-02 09:08:43'),
(2, 'superuser', '$2y$10$2q6u3UaajC0ZJPYzcmIPSuqhTkU/7dXMORNqsLMJLqu2Kged6BYyS', 'Super User', '2', '1', '2020-11-05 11:49:24'),
(3, '', '$2y$10$2q6u3UaajC0ZJPYzcmIPSuqhTkU/7dXMORNqsLMJLqu2Kged6BYyS', '', '1', '1', '2020-11-05 11:55:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

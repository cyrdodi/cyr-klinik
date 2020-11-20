-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2020 at 06:01 AM
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
-- Table structure for table `m_obat_jenis`
--

CREATE TABLE `m_obat_jenis` (
  `id` int(11) NOT NULL,
  `nama_jenis` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_obat_jenis`
--

INSERT INTO `m_obat_jenis` (`id`, `nama_jenis`) VALUES
(1, 'Alat Kesehatan'),
(2, 'Antiseptik'),
(3, 'Bahan Kimia'),
(4, 'Botol'),
(5, 'Gas Medis'),
(6, 'Infus'),
(7, 'Kotak'),
(8, 'Narkotika'),
(9, 'Obat Bebas'),
(10, 'Obat Bebas Terbatas'),
(11, 'Obat Benas'),
(12, 'Obat Cair'),
(13, 'Obat Injeksi'),
(14, 'Obat Kapsul'),
(15, 'Obat Keras'),
(16, 'Obat Luar'),
(17, 'Obat Nebulezer'),
(18, 'Obat Sachet'),
(19, 'Obat Salep'),
(20, 'Obat Semprot'),
(21, 'Obat Serbuk'),
(22, 'Obat Syrup'),
(23, 'Obat Tablet'),
(24, 'Obat Tetes'),
(25, 'Pelengkap'),
(26, 'Precursor'),
(27, 'Psikotropika'),
(28, 'Radiologi'),
(29, 'Reagen Lab'),
(30, 'Supp'),
(31, 'Susu');

-- --------------------------------------------------------

--
-- Table structure for table `m_obat_satuan`
--

CREATE TABLE `m_obat_satuan` (
  `id` int(11) NOT NULL,
  `nama_satuan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_obat_satuan`
--

INSERT INTO `m_obat_satuan` (`id`, `nama_satuan`) VALUES
(1, 'PCS'),
(2, 'BATANG'),
(3, 'CM'),
(4, 'SACHET'),
(5, 'ROL'),
(6, 'PASANG'),
(7, 'GRAM'),
(8, 'BOX'),
(9, 'LEMBAR'),
(10, 'METER'),
(11, 'BUNGKUS'),
(12, 'BOTOL'),
(13, 'VIAL'),
(14, 'KAPLET'),
(15, 'ML'),
(16, 'MG'),
(17, 'CC'),
(18, 'GALON'),
(19, 'KILOGRAM'),
(20, 'TUBE'),
(21, 'LITER'),
(22, 'FLS'),
(23, 'TABLET'),
(24, 'KAPSUL'),
(25, 'AMPUL'),
(26, 'SOFTBAG'),
(27, 'FLES'),
(28, 'SYRINGE'),
(29, 'STRIP'),
(30, 'KIT'),
(31, 'KALENG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_obat_jenis`
--
ALTER TABLE `m_obat_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_obat_satuan`
--
ALTER TABLE `m_obat_satuan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_obat_jenis`
--
ALTER TABLE `m_obat_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `m_obat_satuan`
--
ALTER TABLE `m_obat_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

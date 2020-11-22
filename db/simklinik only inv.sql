-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2020 at 08:21 PM
-- Server version: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

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
-- Table structure for table `m_alasan_item_out`
--

CREATE TABLE `m_alasan_item_out` (
  `id` char(4) NOT NULL,
  `alasan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='master data untuk alasan kenapa obat dikurangi dari stock ';

--
-- Dumping data for table `m_alasan_item_out`
--

INSERT INTO `m_alasan_item_out` (`id`, `alasan`) VALUES
('KDL', 'Kadaluarsa'),
('RUS', 'Rusak');

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

-- --------------------------------------------------------

--
-- Table structure for table `m_supplier`
--

CREATE TABLE `m_supplier` (
  `id_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(200) DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  `is_active` enum('TRUE','FALSE') DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_supplier`
--

INSERT INTO `m_supplier` (`id_supplier`, `nama_supplier`, `keterangan`, `is_active`, `timestamp`) VALUES
('RSM', 'RS Misi Lebak', 'Gudang RS Misi Lebak', 'TRUE', '2020-11-20 16:30:44'),
('UMU', 'Pembelian Luar', 'Pembelian umum keluar', 'TRUE', '2020-11-20 16:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `t_inventory_in`
--

CREATE TABLE `t_inventory_in` (
  `id` int(11) NOT NULL,
  `b_obat_id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `m_supplier_id` varchar(20) NOT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_inventory_in`
--

INSERT INTO `t_inventory_in` (`id`, `b_obat_id`, `tanggal`, `m_supplier_id`, `keterangan`, `jumlah`, `timestamp`) VALUES
(2, 2063, '2020-11-22', 'UMU', '-', 80, '2020-11-22 11:34:39'),
(3, 141, '2020-11-22', 'RSM', '-', 30, '2020-11-22 11:41:57'),
(4, 18, '2020-11-22', 'RSM', '3', 3, '2020-11-22 11:51:46'),
(5, 2, '2020-11-22', 'UMU', '34', 45, '2020-11-22 13:02:38'),
(6, 243, '2020-11-22', 'RSM', 'beli', 50, '2020-11-22 13:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `t_inventory_out`
--

CREATE TABLE `t_inventory_out` (
  `id` int(11) NOT NULL,
  `obat_id` int(11) NOT NULL,
  `alasan_id` char(4) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_inventory_out`
--

INSERT INTO `t_inventory_out` (`id`, `obat_id`, `alasan_id`, `tanggal`, `jumlah`, `keterangan`, `timestamp`) VALUES
(1, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:39:04'),
(2, 2063, 'RUS', '2020-11-22', 3, 'dikencingin tikus', '2020-11-22 12:55:42'),
(3, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(4, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(5, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(6, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(7, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(8, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(9, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(10, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(11, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(12, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(13, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(14, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(15, 2063, 'RUS', '2020-11-22', 4, 'dikencingin tikus', '2020-11-22 12:55:42'),
(16, 2063, 'RUS', '2020-11-22', 6, '-', '2020-11-22 13:08:38'),
(18, 2063, 'KDL', '2020-11-22', 70, '', '2020-11-22 13:12:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_alasan_item_out`
--
ALTER TABLE `m_alasan_item_out`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `t_inventory_in`
--
ALTER TABLE `t_inventory_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_inventory_b_obat1_idx` (`b_obat_id`),
  ADD KEY `fk_t_inventory_m_supplier1_idx` (`m_supplier_id`);

--
-- Indexes for table `t_inventory_out`
--
ALTER TABLE `t_inventory_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_inventory_out_b_obat1_idx` (`obat_id`),
  ADD KEY `fk_t_inventory_out_m_alasan_item_out1_idx` (`alasan_id`);

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

--
-- AUTO_INCREMENT for table `t_inventory_in`
--
ALTER TABLE `t_inventory_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_inventory_out`
--
ALTER TABLE `t_inventory_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_inventory_in`
--
ALTER TABLE `t_inventory_in`
  ADD CONSTRAINT `fk_t_inventory_b_obat1` FOREIGN KEY (`b_obat_id`) REFERENCES `b_obat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_inventory_m_supplier1` FOREIGN KEY (`m_supplier_id`) REFERENCES `m_supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_inventory_out`
--
ALTER TABLE `t_inventory_out`
  ADD CONSTRAINT `fk_t_inventory_out_b_obat1` FOREIGN KEY (`obat_id`) REFERENCES `b_obat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_inventory_out_m_alasan_item_out1` FOREIGN KEY (`alasan_id`) REFERENCES `m_alasan_item_out` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

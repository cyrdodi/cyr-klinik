-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2020 at 05:17 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `data_pasien`
--

DROP TABLE IF EXISTS `data_pasien`;
CREATE TABLE `data_pasien` (
  `medrek` varchar(125) NOT NULL,
  `nama_lengkap` varchar(256) DEFAULT NULL,
  `nik` varchar(256) DEFAULT NULL,
  `no_bpjs` varchar(256) DEFAULT NULL,
  `jk` varchar(45) DEFAULT NULL,
  `tempat_lahir` varchar(128) DEFAULT NULL,
  `tgl_lahir` varchar(128) DEFAULT NULL,
  `provinsi` varchar(128) DEFAULT NULL,
  `kabupaten` varchar(128) DEFAULT NULL,
  `kecamatan` varchar(128) DEFAULT NULL,
  `kelurahan` varchar(128) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `no_hp` varchar(128) DEFAULT NULL,
  `agama` varchar(128) DEFAULT NULL,
  `pekerjaan` varchar(128) DEFAULT NULL,
  `status_perkawinan` varchar(128) DEFAULT NULL,
  `nama_penjamin` varchar(256) DEFAULT NULL,
  `no_hp_penjamin` varchar(128) DEFAULT NULL,
  `hubungan` varchar(128) DEFAULT NULL,
  `is_active` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pasien`
--

INSERT INTO `data_pasien` (`medrek`, `nama_lengkap`, `nik`, `no_bpjs`, `jk`, `tempat_lahir`, `tgl_lahir`, `provinsi`, `kabupaten`, `kecamatan`, `kelurahan`, `alamat`, `no_hp`, `agama`, `pekerjaan`, `status_perkawinan`, `nama_penjamin`, `no_hp_penjamin`, `hubungan`, `is_active`, `timestamp`) VALUES
('000001', 'Monkey D.', '-', '-', 'l', 'East Blue', '1992-04-', 'JAWA BARAT', 'KABUPATEN INDRAMAYU', 'HAURGEULIS', 'SUKAJATI', 'East Blue', '-', 'katolik', 'Pegawai Negeri Sipil/PNS/ASN', 'belum menikah', 'Monkey D. Garp', '-', 'Kakek', '1', '2020-10-31 06:42:56'),
('000002', 'Naruto', '123', '321', 'l', 'asd', '1992-10-2', 'JAWA TIMUR', 'KABUPATEN LAMONGAN', 'KEMBANGBAHU', 'MAOR', 'sds', '34534', 'katolik', 'fdg', 'belum menikah', 'ads', '3434', 'Suami', '1', '2020-10-31 06:47:11'),
('000003', 'amin', '1312', '231', 'l', 'asdas', '2014-02-02', 'KALIMANTAN TIMUR', 'KOTA BONTANG', 'BONTANG BARAT', 'KANAAN', 'adsa', '342', 'kristen', 'sads', 'belum menikah', '132', 'sdad21', 'dsad', '1', '2020-10-31 06:49:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD PRIMARY KEY (`medrek`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

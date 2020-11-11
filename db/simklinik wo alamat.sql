-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2020 at 03:40 PM
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
-- Table structure for table `b_admin`
--

CREATE TABLE `b_admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(256) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `is_active` char(2) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_admin`
--

INSERT INTO `b_admin` (`id`, `nama`, `harga`, `is_active`, `timestamp`) VALUES
(1, 'Biaya Administrasi', 5000, '1', '2020-11-11 12:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `b_obat`
--

CREATE TABLE `b_obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(512) DEFAULT NULL,
  `satuan` varchar(128) DEFAULT NULL,
  `jenis_obat` varchar(128) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `is_active` char(8) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `b_tindakan`
--

CREATE TABLE `b_tindakan` (
  `id` int(11) NOT NULL,
  `nama_tindakan` varchar(250) DEFAULT NULL,
  `tarif` double DEFAULT NULL,
  `is_active` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_tindakan`
--

INSERT INTO `b_tindakan` (`id`, `nama_tindakan`, `tarif`, `is_active`, `timestamp`) VALUES
(1, 'Jasa visit dokter', 165000, '1', '2020-11-11 14:15:26'),
(2, 'Incisi Abces  Besar', 37000, '1', '2020-11-11 14:15:26');

-- --------------------------------------------------------

--
-- Table structure for table `cara_bayar`
--

CREATE TABLE `cara_bayar` (
  `id` varchar(11) NOT NULL,
  `pembayaran` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cara_bayar`
--

INSERT INTO `cara_bayar` (`id`, `pembayaran`) VALUES
('p1', 'BPJS Kesehatan'),
('p2', 'Asuransi lain'),
('p3', 'Umum/Pribadi');

-- --------------------------------------------------------

--
-- Table structure for table `data_pasien`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` char(11) NOT NULL,
  `nama_dokter` varchar(45) DEFAULT NULL,
  `jenis` varchar(45) DEFAULT NULL,
  `is_active` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama_dokter`, `jenis`, `is_active`, `timestamp`) VALUES
('BYD-001', 'dr.Acula', 'umum', '1', '2020-11-07 06:07:58');

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
('202011080005', '2020-11-08', 'p1', '000002', 1, '1', '2020-11-08 11:43:20'),
('2020110900006', '2020-11-09', 'p1', '000003', 1, '1', '2020-11-09 15:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `nama_admin` varchar(500) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `b_admin_id` int(11) NOT NULL,
  `klinik_transaction_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_admin`
--

INSERT INTO `t_admin` (`id`, `nama_admin`, `harga`, `timestamp`, `b_admin_id`, `klinik_transaction_id`) VALUES
(1, 'Biaya Administrasi', 5000, '2020-11-11 13:47:04', 1, '202011080001');

-- --------------------------------------------------------

--
-- Table structure for table `t_obat`
--

CREATE TABLE `t_obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(500) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `satuan` varchar(45) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `b_obat_id` int(11) NOT NULL,
  `klinik_transaction_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_tindakan`
--

CREATE TABLE `t_tindakan` (
  `id` int(11) NOT NULL,
  `nama_tindakan` varchar(500) DEFAULT NULL,
  `tarif` double DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `b_tindakan_id` int(11) NOT NULL,
  `klinik_transaction_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_tindakan`
--

INSERT INTO `t_tindakan` (`id`, `nama_tindakan`, `tarif`, `timestamp`, `b_tindakan_id`, `klinik_transaction_id`) VALUES
(1, 'Jasa visit dokter', 165000, '2020-11-11 14:28:34', 1, '202011080001'),
(2, 'Incisi Abces  Besar', 37000, '2020-11-11 14:33:12', 2, '202011080001'),
(3, 'Jasa visit dokter', 165000, '2020-11-11 14:34:22', 1, '202011080001');

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
-- Indexes for table `b_admin`
--
ALTER TABLE `b_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_obat`
--
ALTER TABLE `b_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_tindakan`
--
ALTER TABLE `b_tindakan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cara_bayar`
--
ALTER TABLE `cara_bayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD PRIMARY KEY (`medrek`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_admin_b_admin1_idx` (`b_admin_id`),
  ADD KEY `fk_t_admin_klinik_transaction1_idx` (`klinik_transaction_id`);

--
-- Indexes for table `t_obat`
--
ALTER TABLE `t_obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_obat_b_obat1_idx` (`b_obat_id`),
  ADD KEY `fk_t_obat_klinik_transaction1_idx` (`klinik_transaction_id`);

--
-- Indexes for table `t_tindakan`
--
ALTER TABLE `t_tindakan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_tindakan_b_tindakan1_idx` (`b_tindakan_id`),
  ADD KEY `fk_t_tindakan_klinik_transaction1_idx` (`klinik_transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `b_admin`
--
ALTER TABLE `b_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b_obat`
--
ALTER TABLE `b_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b_tindakan`
--
ALTER TABLE `b_tindakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_obat`
--
ALTER TABLE `t_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_tindakan`
--
ALTER TABLE `t_tindakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klinik_transaction`
--
ALTER TABLE `klinik_transaction`
  ADD CONSTRAINT `fk_klinik_transaction_data_pasien1` FOREIGN KEY (`medrek`) REFERENCES `data_pasien` (`medrek`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_klinik_transaction_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD CONSTRAINT `fk_t_admin_b_admin1` FOREIGN KEY (`b_admin_id`) REFERENCES `b_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_admin_klinik_transaction1` FOREIGN KEY (`klinik_transaction_id`) REFERENCES `klinik_transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_obat`
--
ALTER TABLE `t_obat`
  ADD CONSTRAINT `fk_t_obat_b_obat1` FOREIGN KEY (`b_obat_id`) REFERENCES `b_obat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_obat_klinik_transaction1` FOREIGN KEY (`klinik_transaction_id`) REFERENCES `klinik_transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_tindakan`
--
ALTER TABLE `t_tindakan`
  ADD CONSTRAINT `fk_t_tindakan_b_tindakan1` FOREIGN KEY (`b_tindakan_id`) REFERENCES `b_tindakan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_tindakan_klinik_transaction1` FOREIGN KEY (`klinik_transaction_id`) REFERENCES `klinik_transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

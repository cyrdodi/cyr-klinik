-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2020 at 08:20 PM
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
-- Table structure for table `billing_transaction`
--

CREATE TABLE `billing_transaction` (
  `no_billing` varchar(100) NOT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `status_pembayaran` char(4) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL,
  `total_administrasi` double DEFAULT NULL,
  `total_tindakan` double DEFAULT NULL,
  `total_obat` double DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `klinik_transaction_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_transaction`
--

INSERT INTO `billing_transaction` (`no_billing`, `tgl_pembayaran`, `status_pembayaran`, `is_active`, `total_administrasi`, `total_tindakan`, `total_obat`, `total_bayar`, `timestamp`, `klinik_transaction_id`) VALUES
('IBK-20-11-00010', '2020-11-19', '2', '1', 5000, 662000, 57030000, 57697000, '2020-11-19 00:32:16', '2020111700009'),
('IBK/2011/00001', NULL, '1', '0', 10000, 25000, 848500, NULL, '2020-11-15 11:25:54', '2020111200007'),
('IBK/2011/00002', NULL, '1', '0', 5000, 25000, 388100, 418200, '2020-11-16 03:12:50', '2020111200007'),
('IBK/2011/00003', '2020-11-16', '2', '1', 5000, 55000, 345950, 405950, '2020-11-16 03:29:50', '202011080004'),
('IBK/2011/00004', NULL, '1', '0', 5000, 16000, 14300, 35300, '2020-11-16 05:34:59', '2020110900006'),
('IBK/2011/00005', '2020-11-16', '2', '1', 5000, 25000, 388100, 418100, '2020-11-16 06:02:45', '2020111200007'),
('IBK/2011/00006', NULL, '1', '0', 5000, 2000, 98400, 105400, '2020-11-16 06:26:28', '2020111600008'),
('IBK/2011/00007', '2020-11-18', '2', '1', 5000, 2000, 98400, 105400, '2020-11-18 01:05:11', '2020111600008'),
('IBK/2011/00008', '2020-11-18', '2', '1', 5000, 17000, 326100, 348100, '2020-11-18 01:06:16', '2020111800010'),
('IBK/2011/00009', NULL, '1', '1', 5000, 2000, 225600, 232600, '2020-11-18 03:28:47', '202011080003');

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
  `stok` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `is_active` char(8) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_obat`
--

INSERT INTO `b_obat` (`id`, `nama_obat`, `satuan`, `jenis_obat`, `stok`, `harga`, `is_active`, `timestamp`) VALUES
(1, 'Xylestesin', 'PCS', 'Alat Kesehatan', 94, 15700, '1', '2020-11-12 02:15:20'),
(2, 'Abbocath No. 20', 'PCS', 'Alat Kesehatan', 145, 25500, '1', '2020-11-12 02:15:20'),
(3, 'Abbocath No.14', 'PCS', 'Alat Kesehatan', 98, 28200, '1', '2020-11-12 02:15:20'),
(4, 'Abbocath No.16', 'PCS', 'Alat Kesehatan', 56, 28200, '1', '2020-11-12 02:15:20'),
(5, 'Abbocath No.18', 'PCS', 'Alat Kesehatan', 100, 24800, '1', '2020-11-12 02:15:20'),
(6, 'Alat cukur', 'PCS', 'Alat Kesehatan', 100, 9800, '1', '2020-11-12 02:15:20'),
(7, 'Arm Sling M', 'PCS', 'Alat Kesehatan', 98, 42000, '1', '2020-11-12 02:15:20'),
(8, 'Abbocath no.24', 'PCS', 'Alat Kesehatan', 100, 10750, '1', '2020-11-12 02:15:20'),
(9, 'Abbocath No 22', 'PCS', 'Alat Kesehatan', 100, 25000, '1', '2020-11-12 02:15:20'),
(10, 'Arm Sling L', 'PCS', 'Alat Kesehatan', 94, 42000, '1', '2020-11-12 02:15:20'),
(11, 'Bisturi BB 10', 'PCS', 'Alat Kesehatan', 100, 2250, '1', '2020-11-12 02:15:20'),
(12, 'Bisturi BB 11', 'PCS', 'Alat Kesehatan', 100, 4400, '1', '2020-11-12 02:15:20'),
(13, 'Bisturi BB 12', 'PCS', 'Alat Kesehatan', 100, 2250, '1', '2020-11-12 02:15:20'),
(14, 'Bisturi BB 15', 'PCS', 'Alat Kesehatan', 100, 5500, '1', '2020-11-12 02:15:20'),
(15, 'Bisturi BB 20', 'PCS', 'Alat Kesehatan', 100, 5200, '1', '2020-11-12 02:15:20'),
(16, 'Bucal tube0,022', 'PCS', 'Alat Kesehatan', 100, 60000, '1', '2020-11-12 02:15:20'),
(17, 'Balon tensi', 'BATANG', 'Alat Kesehatan', 100, 331700, '1', '2020-11-12 02:15:20'),
(18, 'Catheter Nelaton 8', 'PCS', 'Alat Kesehatan', 103, 5300, '1', '2020-11-12 02:15:20'),
(19, 'Catheter Nelaton 10', 'PCS', 'Alat Kesehatan', 100, 5300, '1', '2020-11-12 02:15:20'),
(20, 'Catheter Nelaton 12', 'PCS', 'Alat Kesehatan', 100, 5300, '1', '2020-11-12 02:15:20'),
(21, 'Catheter Nelaton 14', 'PCS', 'Alat Kesehatan', 96, 5300, '1', '2020-11-12 02:15:20'),
(22, 'Catgut Chromic 0 (D-TREX)', 'CM', 'Alat Kesehatan', 100, 800, '1', '2020-11-12 02:15:20'),
(23, 'Catgut Chromic 1', 'CM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(24, 'Catgut Chromic 2', 'CM', 'Alat Kesehatan', 100, 400, '1', '2020-11-12 02:15:20'),
(25, 'Catgut Chromic 2/0 (D-TREX)', 'PCS', 'Alat Kesehatan', 100, 83900, '1', '2020-11-12 02:15:20'),
(26, 'Catgut Chromic 3', 'CM', 'Alat Kesehatan', 100, 350, '1', '2020-11-12 02:15:20'),
(27, 'Catgut Chromic 3/0', 'CM', 'Alat Kesehatan', 100, 250, '1', '2020-11-12 02:15:20'),
(28, 'Catgut Chromic 4', 'CM', 'Alat Kesehatan', 100, 400, '1', '2020-11-12 02:15:20'),
(29, 'Catgut Chromic 4/0', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(30, 'Condom Catheter L', 'PCS', 'Alat Kesehatan', 100, 8700, '1', '2020-11-12 02:15:20'),
(31, 'Condom Chateter M', 'PCS', 'Alat Kesehatan', 100, 8700, '1', '2020-11-12 02:15:20'),
(32, 'Cyde 0', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(33, 'Cyde 1', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(34, 'Cyde 2', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(35, 'Cyde 2/0', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(36, 'Cyde 3', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(37, 'Cyde 3/0', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(38, 'Cyde 4', 'CM', 'Alat Kesehatan', 100, 250, '1', '2020-11-12 02:15:20'),
(39, 'Cyde 4/0', 'CM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(40, 'Cromic + Nedle No 2 - 0', 'PCS', 'Alat Kesehatan', 100, 53000, '1', '2020-11-12 02:15:20'),
(41, 'Corset', 'PCS', 'Alat Kesehatan', 100, 600000, '1', '2020-11-12 02:15:20'),
(42, 'Condom fiesta', 'PCS', 'Alat Kesehatan', 100, 3500, '1', '2020-11-12 02:15:20'),
(43, 'Catgut Chromic 0', 'CM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(44, 'Catgut Chromic 2/0', 'CM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(45, 'D-tek Chromic No 0 Otot', 'PCS', 'Alat Kesehatan', 100, 134400, '1', '2020-11-12 02:15:20'),
(46, 'D-tek Chromic No 2/0 Kulit', 'PCS', 'Alat Kesehatan', 100, 94400, '1', '2020-11-12 02:15:20'),
(47, 'D-tek Chromic No 1 Otot', 'PCS', 'Alat Kesehatan', 100, 137300, '1', '2020-11-12 02:15:20'),
(48, 'D-tek Chromic No 2 otot', 'PCS', 'Alat Kesehatan', 100, 137300, '1', '2020-11-12 02:15:20'),
(49, 'Caesar Kit ', 'PCS', 'Alat Kesehatan', 100, 214500, '1', '2020-11-12 02:15:20'),
(50, 'Cannofix', 'PCS', 'Alat Kesehatan', 100, 11000, '1', '2020-11-12 02:15:20'),
(51, 'Crepe Wrap 100cm x 100cm', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(52, 'Cromic no 3/0', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(53, 'Cromic No 2/0', 'PCS', 'Alat Kesehatan', 100, 128700, '1', '2020-11-12 02:15:20'),
(54, 'Cromic no 0', 'PCS', 'Alat Kesehatan', 100, 134400, '1', '2020-11-12 02:15:20'),
(55, 'Dermalon 2-0', 'SACHET', 'Alat Kesehatan', 100, 82950, '1', '2020-11-12 02:15:20'),
(56, 'Dermalon 3-0', 'SACHET', 'Alat Kesehatan', 100, 82250, '1', '2020-11-12 02:15:20'),
(57, 'Dermalon 4-0', 'SACHET', 'Alat Kesehatan', 100, 71500, '1', '2020-11-12 02:15:20'),
(58, 'Deck Glass', 'PCS', 'Alat Kesehatan', 100, 250, '1', '2020-11-12 02:15:20'),
(59, 'D-Tek Silk No.3/0 Otot', 'SACHET', 'Alat Kesehatan', 100, 78650, '1', '2020-11-12 02:15:20'),
(60, 'D- Tek No.2/0', 'SACHET', 'Alat Kesehatan', 100, 67000, '1', '2020-11-12 02:15:20'),
(61, 'D-Tek Silk No.0 Otot', 'SACHET', 'Alat Kesehatan', 100, 82900, '1', '2020-11-12 02:15:20'),
(62, 'D-Tek Silk No.1 Kulit', 'SACHET', 'Alat Kesehatan', 100, 67000, '1', '2020-11-12 02:15:20'),
(63, 'D- Tek Nylon N0.3/0', 'SACHET', 'Alat Kesehatan', 100, 92950, '1', '2020-11-12 02:15:20'),
(64, 'D-tek Silk No 2 kulit', 'SACHET', 'Alat Kesehatan', 100, 125800, '1', '2020-11-12 02:15:20'),
(65, 'D-Tek Nylon/Dafilon No 2/0 Kulit', 'PCS', 'Alat Kesehatan', 100, 92950, '1', '2020-11-12 02:15:20'),
(66, 'D-tek Chromic No 3/0 Otot', 'SACHET', 'Alat Kesehatan', 100, 121500, '1', '2020-11-12 02:15:20'),
(67, 'D-tek Nylon/Dafilon No 3/0 Kulit', 'PCS', 'Alat Kesehatan', 100, 113000, '1', '2020-11-12 02:15:20'),
(68, 'D-tek Chromic no 2/0 otot', 'SACHET', 'Alat Kesehatan', 100, 128700, '1', '2020-11-12 02:15:20'),
(69, 'D-tek Chromic No 2/0 HR26 Otot', 'SACHET', 'Alat Kesehatan', 100, 112900, '1', '2020-11-12 02:15:20'),
(70, 'D-tek Chromic no 2/0 HR30 Otot', 'SACHET', 'Alat Kesehatan', 100, 98700, '1', '2020-11-12 02:15:20'),
(71, 'Elastis Verban 3', 'ROL', 'Alat Kesehatan', 100, 81500, '1', '2020-11-12 02:15:20'),
(72, 'Elastis Verban 4', 'ROL', 'Alat Kesehatan', 100, 96600, '1', '2020-11-12 02:15:20'),
(73, 'Elastis Verban 6', 'ROL', 'Alat Kesehatan', 100, 160200, '1', '2020-11-12 02:15:20'),
(74, 'Endotracheal King2 No 4,5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(75, 'Endotracheal king2 No. 3,5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(76, 'Endotracheal Non king2 No. 4', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(77, 'Endotracheal king2 no.3', 'ROL', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(78, 'Endotracheal Non king2 No.5', 'ROL', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(79, 'Endotracheal Non king2 No.5,5', 'ROL', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(80, 'Endotracheal Non king2 no.6', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(81, 'Endotracheal Non king2 No.7', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(82, 'Endotracheal Non king2 No.7,5', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(83, 'Endotracheal Non king2 No.8', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(84, 'Endotracheal Non king2 No.8,5', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(85, 'Endotracheal non king-king no 7', 'ROL', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(86, 'Endotracheal king2 no 7', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(87, 'Endotracheal king2 no 7,5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(88, 'Endotracheal king2 no 8', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(89, 'Endotrachael non king2 no 4,5', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(90, 'Endotracheal king2 no.4', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(91, 'Endotracheal king2 no.5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(92, 'Endotracheal king2 no.5,5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(93, 'Endotracheal king2 no.6', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(94, 'Endotracheal king2 no.6,5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(95, 'Endotrachael Non king2 no 6,5', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(96, 'Endotrachael Non king2 no 3,5', 'PCS', 'Alat Kesehatan', 100, 679250, '1', '2020-11-12 02:15:20'),
(97, 'Endotrachael King2 no 8,5', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(98, 'Feeding tube 10 NGT', 'PCS', 'Alat Kesehatan', 100, 15000, '1', '2020-11-12 02:15:20'),
(99, 'Feeding Tube 3,5 NGT', 'PCS', 'Alat Kesehatan', 100, 55000, '1', '2020-11-12 02:15:20'),
(100, 'Feeding tube 5 NGT', 'PCS', 'Alat Kesehatan', 100, 55000, '1', '2020-11-12 02:15:20'),
(101, 'Feeding tube 8 NGT', 'PCS', 'Alat Kesehatan', 100, 55000, '1', '2020-11-12 02:15:20'),
(102, 'Film Gigi / Dental X Ray', 'PCS', 'Alat Kesehatan', 100, 9450, '1', '2020-11-12 02:15:20'),
(103, 'Folley Catheter 2 way 10', 'PCS', 'Alat Kesehatan', 100, 169800, '1', '2020-11-12 02:15:20'),
(104, 'Folley Catheter 2 way 12', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(105, 'Folley catheter 2 way 14', 'PCS', 'Alat Kesehatan', 100, 188700, '1', '2020-11-12 02:15:20'),
(106, 'Folley Catheter 2 way 16', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(107, 'Folley Catheter 2 way 18', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(108, 'Folley catheter 2 way 20', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(109, 'Folley Catheter 2 way 22', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(110, 'Folley Catheter 2 way 8', 'PCS', 'Alat Kesehatan', 100, 168700, '1', '2020-11-12 02:15:20'),
(111, 'Folley Catheter 3 way 18', 'PCS', 'Alat Kesehatan', 100, 141200, '1', '2020-11-12 02:15:20'),
(112, 'Folley Catheter 3 way 20', 'PCS', 'Alat Kesehatan', 100, 138500, '1', '2020-11-12 02:15:20'),
(113, 'Folley Catheter 3 way 22', 'PCS', 'Alat Kesehatan', 100, 138500, '1', '2020-11-12 02:15:20'),
(114, 'Film USG', 'CM', 'Alat Kesehatan', 100, 290, '1', '2020-11-12 02:15:20'),
(115, 'Facemask M', 'PCS', 'Alat Kesehatan', 100, 1229800, '1', '2020-11-12 02:15:20'),
(116, 'Fackmask L', 'PCS', 'Alat Kesehatan', 100, 1229800, '1', '2020-11-12 02:15:20'),
(117, 'Filamide (Nylon) No 2/0 Kulit', 'PCS', 'Alat Kesehatan', 100, 44300, '1', '2020-11-12 02:15:20'),
(118, 'Face Mask Tie-on', 'PCS', 'Alat Kesehatan', 100, 600, '1', '2020-11-12 02:15:20'),
(119, 'Gelang bayi biru', 'PCS', 'Alat Kesehatan', 100, 2000, '1', '2020-11-12 02:15:20'),
(120, 'Gelang bayi pink', 'PCS', 'Alat Kesehatan', 100, 2000, '1', '2020-11-12 02:15:20'),
(121, 'Gypsona 4', 'ROL', 'Alat Kesehatan', 100, 51600, '1', '2020-11-12 02:15:20'),
(122, 'Gypsona 6', 'ROL', 'Alat Kesehatan', 100, 67600, '1', '2020-11-12 02:15:20'),
(123, 'Gelita Spoon', 'PCS', 'Alat Kesehatan', 100, 77000, '1', '2020-11-12 02:15:20'),
(124, 'Gypsona 3', 'ROL', 'Alat Kesehatan', 100, 36800, '1', '2020-11-12 02:15:20'),
(125, 'Hansaplas', 'PCS', 'Alat Kesehatan', 100, 550, '1', '2020-11-12 02:15:20'),
(126, 'Hand Scond karet panjang', 'PASANG', 'Alat Kesehatan', 100, 15300, '1', '2020-11-12 02:15:20'),
(127, 'Hand Scond no.6,5 steril', 'PASANG', 'Alat Kesehatan', 100, 10700, '1', '2020-11-12 02:15:20'),
(128, 'Hand Scond no.7 steril', 'PASANG', 'Alat Kesehatan', 100, 20600, '1', '2020-11-12 02:15:20'),
(129, 'Hand Scond no.7,5', 'PASANG', 'Alat Kesehatan', 100, 3900, '1', '2020-11-12 02:15:20'),
(130, 'Hand Scond no.7,5 steril', 'PASANG', 'Alat Kesehatan', 100, 20600, '1', '2020-11-12 02:15:20'),
(131, 'Hand Scond no.8', 'PASANG', 'Alat Kesehatan', 100, 3900, '1', '2020-11-12 02:15:20'),
(132, 'Hypavix besar ( 15 cm x 5 m)', 'CM', 'Alat Kesehatan', 100, 400, '1', '2020-11-12 02:15:20'),
(133, 'Hand Scond no.8 steril', 'PASANG', 'Alat Kesehatan', 100, 11800, '1', '2020-11-12 02:15:20'),
(134, 'Hypavix kecil ( 5 cm x 5 m)', 'CM', 'Alat Kesehatan', 100, 150, '1', '2020-11-12 02:15:20'),
(135, 'Hand Scond Obgyn', 'PASANG', 'Alat Kesehatan', 100, 37900, '1', '2020-11-12 02:15:20'),
(136, 'hypavix ( 5 cm x 10 m )', 'CM', 'Alat Kesehatan', 100, 114, '1', '2020-11-12 02:15:20'),
(137, 'Infuset  Macro OI.64', 'PCS', 'Alat Kesehatan', 100, 29200, '1', '2020-11-12 02:15:20'),
(138, 'Infuset  Micro OI.34', 'PCS', 'Alat Kesehatan', 100, 29200, '1', '2020-11-12 02:15:20'),
(139, 'Insyte no.24', 'PCS', 'Alat Kesehatan', 100, 35400, '1', '2020-11-12 02:15:20'),
(140, 'Insyte no 26', 'PCS', 'Alat Kesehatan', 100, 20000, '1', '2020-11-12 02:15:20'),
(141, 'Infus Pump Disposable', 'PCS', 'Alat Kesehatan', 124, 214500, '1', '2020-11-12 02:15:20'),
(142, 'Isolation Grwn', 'PCS', 'Alat Kesehatan', 100, 26000, '1', '2020-11-12 02:15:20'),
(143, 'Jarum cytoject', 'PCS', 'Alat Kesehatan', 100, 1300, '1', '2020-11-12 02:15:20'),
(144, 'Jarum Kulit no.14', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(145, 'Jarum Kulit no.15', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(146, 'Jarum Kulit no.16', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(147, 'Jarum Kulit no.6', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(148, 'Jarum Kulit no.10', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(149, 'Jarum Kulit no.11', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(150, 'Jarum kulit no.12', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(151, 'Jarum Kulit no.13', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(152, 'Jarum kulit no.18', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(153, 'Jarum kulit no.7', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(154, 'Jarum kulit No.8', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(155, 'Jarum Kulit no.9', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(156, 'Jarum no.23', 'PCS', 'Alat Kesehatan', 100, 2100, '1', '2020-11-12 02:15:20'),
(157, 'Jarum no.24', 'PCS', 'Alat Kesehatan', 100, 2100, '1', '2020-11-12 02:15:20'),
(158, 'Jarum no.26', 'PCS', 'Alat Kesehatan', 100, 1750, '1', '2020-11-12 02:15:20'),
(159, 'Jarum no.27', 'PCS', 'Alat Kesehatan', 100, 2200, '1', '2020-11-12 02:15:20'),
(160, 'Jarum otot no.14', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(161, 'Jarum Otot no.15', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(162, 'Jarum Otot no.16', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(163, 'Jarum Otot no.18', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(164, 'Jarum otot no.9', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(165, 'Jarum Otot no.10', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(166, 'Jarum Otot no.11', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(167, 'Jarum Otot no.12', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(168, 'Jarum Otot no.28', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(169, 'Jarum Otot no.7', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(170, 'Jarum Otot no.8', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(171, 'Jarum Spinal no.25', 'PCS', 'Alat Kesehatan', 100, 62900, '1', '2020-11-12 02:15:20'),
(172, 'Jarum Spinal no.27', 'PCS', 'Alat Kesehatan', 100, 75600, '1', '2020-11-12 02:15:20'),
(173, 'Jarum Otot no.5', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(174, 'Jarum Otot no.6', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(175, 'Jarum Otot no.13', 'PCS', 'Alat Kesehatan', 100, 11100, '1', '2020-11-12 02:15:20'),
(176, 'Kapas 250 gram', 'GRAM', 'Alat Kesehatan', 100, 200, '1', '2020-11-12 02:15:20'),
(177, 'Kasa gulung', 'CM', 'Alat Kesehatan', 90, 3, '1', '2020-11-12 02:15:20'),
(178, 'Kertas EKG 3 cenel', 'ROL', 'Alat Kesehatan', 100, 123900, '1', '2020-11-12 02:15:20'),
(179, 'Kapas 500 gram', 'GRAM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(180, 'Kertas EKG 12 cenel', 'ROL', 'Alat Kesehatan', 100, 246400, '1', '2020-11-12 02:15:20'),
(181, 'Kasa steril ', 'BOX', 'Alat Kesehatan', 100, 7700, '1', '2020-11-12 02:15:20'),
(182, 'Kendil Bayi', 'PCS', 'Alat Kesehatan', 100, 25000, '1', '2020-11-12 02:15:20'),
(183, 'Kertas EKG kotak', 'ROL', 'Alat Kesehatan', 100, 50, '1', '2020-11-12 02:15:20'),
(184, 'Kertas lakmus ', 'LEMBAR', 'Alat Kesehatan', 100, 1950, '1', '2020-11-12 02:15:20'),
(185, 'Kertas EKG 6 cenel', 'ROL', 'Alat Kesehatan', 100, 214500, '1', '2020-11-12 02:15:20'),
(186, 'Laminaria L', 'PCS', 'Alat Kesehatan', 100, 212300, '1', '2020-11-12 02:15:20'),
(187, 'Leukopore 4', 'CM', 'Alat Kesehatan', 100, 25, '1', '2020-11-12 02:15:20'),
(188, 'Leukodur 4', 'ROL', 'Alat Kesehatan', 100, 27900, '1', '2020-11-12 02:15:20'),
(189, 'Leukodur 6', 'ROL', 'Alat Kesehatan', 100, 41000, '1', '2020-11-12 02:15:20'),
(190, 'Laryngeal Mask No 1', 'PCS', 'Alat Kesehatan', 100, 703600, '1', '2020-11-12 02:15:20'),
(191, 'Laryngeal Mask No 2', 'PCS', 'Alat Kesehatan', 100, 703600, '1', '2020-11-12 02:15:20'),
(192, 'Laryngeal Mask No 3', 'PCS', 'Alat Kesehatan', 100, 703600, '1', '2020-11-12 02:15:20'),
(193, 'Laryngeal Mask No 4', 'PCS', 'Alat Kesehatan', 100, 703600, '1', '2020-11-12 02:15:20'),
(194, 'Laryngeal Mask No 5', 'PCS', 'Alat Kesehatan', 100, 703600, '1', '2020-11-12 02:15:20'),
(195, 'Laminaria S', 'PCS', 'Alat Kesehatan', 100, 157300, '1', '2020-11-12 02:15:20'),
(196, 'Laryngeal mask No 2,5', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(197, 'Laryngeal Mask No 1,5', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(198, 'Lampu Laryngoscope', 'PCS', 'Alat Kesehatan', 100, 35750, '1', '2020-11-12 02:15:20'),
(199, 'Mancet anak', 'PCS', 'Alat Kesehatan', 100, 107250, '1', '2020-11-12 02:15:20'),
(200, 'Mancet Dewasa', 'PCS', 'Alat Kesehatan', 100, 729300, '1', '2020-11-12 02:15:20'),
(201, 'Masker Unigloves', 'PCS', 'Alat Kesehatan', 100, 2000, '1', '2020-11-12 02:15:20'),
(202, 'Mayo tube no.0', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(203, 'Mayo tube no.1', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(204, 'Mayo tube no.2', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(205, 'Mayo tube no.3', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(206, 'Micropore / Plester Putih Kecil', 'CM', 'Alat Kesehatan', 100, 27, '1', '2020-11-12 02:15:20'),
(207, 'Mayo tube no.4', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(208, 'Mayo tube no.5', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(209, 'Mayo tube no.6', 'PCS', 'Alat Kesehatan', 100, 251700, '1', '2020-11-12 02:15:20'),
(210, 'Medigloves L Powder Mint', 'PASANG', 'Alat Kesehatan', 100, 1300, '1', '2020-11-12 02:15:20'),
(211, 'Medigloves S Powder Mint', 'PASANG', 'Alat Kesehatan', 100, 1300, '1', '2020-11-12 02:15:20'),
(212, 'Medigloves L', 'PASANG', 'Alat Kesehatan', 100, 1800, '1', '2020-11-12 02:15:20'),
(213, 'Medigloves M', 'PASANG', 'Alat Kesehatan', 100, 1800, '1', '2020-11-12 02:15:20'),
(214, 'Medigloves S', 'PASANG', 'Alat Kesehatan', 100, 1800, '1', '2020-11-12 02:15:20'),
(215, 'Molicare L', 'PCS', 'Alat Kesehatan', 100, 12500, '1', '2020-11-12 02:15:20'),
(216, 'Molicare L-XL', 'PCS', 'Alat Kesehatan', 100, 9400, '1', '2020-11-12 02:15:20'),
(217, 'Molicare M', 'PCS', 'Alat Kesehatan', 100, 11500, '1', '2020-11-12 02:15:20'),
(218, 'Molicare ML', 'PCS', 'Alat Kesehatan', 100, 8700, '1', '2020-11-12 02:15:20'),
(219, 'Molicare S', 'PCS', 'Alat Kesehatan', 100, 6800, '1', '2020-11-12 02:15:20'),
(220, 'Molicare XL', 'PCS', 'Alat Kesehatan', 100, 11800, '1', '2020-11-12 02:15:20'),
(221, 'Molinea', 'PCS', 'Alat Kesehatan', 100, 13600, '1', '2020-11-12 02:15:20'),
(222, 'Monosof 2-0', 'PCS', 'Alat Kesehatan', 100, 70100, '1', '2020-11-12 02:15:20'),
(223, 'Mayo tube no.6,5', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(224, 'Mayo tube no.8', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(225, 'Mayo tube no 00', 'PCS', 'Alat Kesehatan', 100, 21450, '1', '2020-11-12 02:15:20'),
(226, 'Meditrec Dewasa', 'PCS', 'Alat Kesehatan', 100, 6200, '1', '2020-11-12 02:15:20'),
(227, 'Monosof 4-0', 'PCS', 'Alat Kesehatan', 100, 70000, '1', '2020-11-12 02:15:20'),
(228, 'Molicare XXL', 'PCS', 'Alat Kesehatan', 100, 16000, '1', '2020-11-12 02:15:20'),
(229, 'Masker O2 N Rebreathing Dewasa', 'PCS', 'Alat Kesehatan', 100, 70800, '1', '2020-11-12 02:15:20'),
(230, 'Micropore/plester putih Sedang', 'CM', 'Alat Kesehatan', 100, 54, '1', '2020-11-12 02:15:20'),
(231, 'Meditrec Anak ', 'PCS', 'Alat Kesehatan', 100, 2200, '1', '2020-11-12 02:15:20'),
(232, 'Masker O2 n Rebreathing anak', 'PCS', 'Alat Kesehatan', 100, 31500, '1', '2020-11-12 02:15:20'),
(233, 'Nellaton Catheter no.14', 'PCS', 'Alat Kesehatan', 100, 7300, '1', '2020-11-12 02:15:20'),
(234, 'Nellaton Catheter no.16', 'PCS', 'Alat Kesehatan', 100, 7300, '1', '2020-11-12 02:15:20'),
(235, 'Needle Micro fine', 'PCS', 'Alat Kesehatan', 100, 12900, '1', '2020-11-12 02:15:20'),
(236, 'Niti round 0,14 Upper', 'PCS', 'Alat Kesehatan', 100, 68200, '1', '2020-11-12 02:15:20'),
(237, 'Niti round 0,14 Lower', 'PCS', 'Alat Kesehatan', 100, 68200, '1', '2020-11-12 02:15:20'),
(238, 'Otsucath no.22', 'PCS', 'Alat Kesehatan', 100, 35000, '1', '2020-11-12 02:15:20'),
(239, 'Otsucath no.24', 'PCS', 'Alat Kesehatan', 100, 34300, '1', '2020-11-12 02:15:20'),
(240, 'Otsucath no.26', 'PCS', 'Alat Kesehatan', 100, 28600, '1', '2020-11-12 02:15:20'),
(241, 'Polymem 10 x 10 cm', 'CM', 'Alat Kesehatan', 100, 2150, '1', '2020-11-12 02:15:20'),
(242, 'Polymen 10,8cm x 10,8cm', 'CM', 'Alat Kesehatan', 100, 2700, '1', '2020-11-12 02:15:20'),
(243, 'Plester besar 1625H', 'CM', 'Alat Kesehatan', 150, 100, '1', '2020-11-12 02:15:20'),
(244, 'Plester kecil 1621H', 'CM', 'Alat Kesehatan', 100, 41, '1', '2020-11-12 02:15:20'),
(245, 'Plester sedang 1622H', 'CM', 'Alat Kesehatan', 100, 77, '1', '2020-11-12 02:15:20'),
(246, 'Polisorb 3/0', 'SACHET', 'Alat Kesehatan', 100, 132900, '1', '2020-11-12 02:15:20'),
(247, 'Polisorb 2/0', 'SACHET', 'Alat Kesehatan', 100, 132900, '1', '2020-11-12 02:15:20'),
(248, 'Pompa mamae', 'PCS', 'Alat Kesehatan', 100, 25000, '1', '2020-11-12 02:15:20'),
(249, 'D-tek Poliglycolic acid 3/0 Otot', 'SACHET', 'Alat Kesehatan', 100, 178750, '1', '2020-11-12 02:15:20'),
(250, 'D-tek Poliglycolic acid 2/0 Otot', 'SACHET', 'Alat Kesehatan', 100, 150150, '1', '2020-11-12 02:15:20'),
(251, 'D-tek Poliglycolic acid No.0 Otot', 'SACHET', 'Alat Kesehatan', 100, 143000, '1', '2020-11-12 02:15:20'),
(252, 'D-tek Poliglycolic acid 1 Otot', 'SACHET', 'Alat Kesehatan', 100, 178700, '1', '2020-11-12 02:15:20'),
(253, 'D-tek Poliglycolic acid 2 Otot', 'SACHET', 'Alat Kesehatan', 100, 210200, '1', '2020-11-12 02:15:20'),
(254, 'Pot Salep 20cc', 'PCS', 'Alat Kesehatan', 100, 1500, '1', '2020-11-12 02:15:20'),
(255, 'Plesterin', 'PCS', 'Alat Kesehatan', 100, 1100, '1', '2020-11-12 02:15:20'),
(256, 'Popoc Celana ', 'PCS', 'Alat Kesehatan', 100, 10000, '1', '2020-11-12 02:15:20'),
(257, 'Popoc Celana perekat', 'PCS', 'Alat Kesehatan', 100, 9300, '1', '2020-11-12 02:15:20'),
(258, 'Pot Salep 10cc', 'PCS', 'Alat Kesehatan', 100, 715, '1', '2020-11-12 02:15:20'),
(259, 'Pouch Kasa 5', 'PCS', 'Alat Kesehatan', 100, 15000, '1', '2020-11-12 02:15:20'),
(260, 'Pouch Steril 30cm x 100m', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(261, 'Pouch Kasa 10 ', 'PCS', 'Alat Kesehatan', 100, 27200, '1', '2020-11-12 02:15:20'),
(262, 'Pouch Kasa 20 ', 'PCS', 'Alat Kesehatan', 100, 40800, '1', '2020-11-12 02:15:20'),
(263, 'Qualtrus (PGA) No 3-0 Otot', 'PCS', 'Alat Kesehatan', 100, 82000, '1', '2020-11-12 02:15:20'),
(264, 'Slang O2 anak', 'PCS', 'Alat Kesehatan', 100, 23600, '1', '2020-11-12 02:15:20'),
(265, 'Slang O2 Bayi', 'PCS', 'Alat Kesehatan', 100, 27000, '1', '2020-11-12 02:15:20'),
(266, 'Slang O2 dewasa', 'PCS', 'Alat Kesehatan', 100, 35900, '1', '2020-11-12 02:15:20'),
(267, 'Sleem Baby', 'PCS', 'Alat Kesehatan', 100, 35700, '1', '2020-11-12 02:15:20'),
(268, 'Soft band 4', 'ROL', 'Alat Kesehatan', 100, 36800, '1', '2020-11-12 02:15:20'),
(269, 'Soft band 6', 'ROL', 'Alat Kesehatan', 100, 51600, '1', '2020-11-12 02:15:20'),
(270, 'Spuit 3 ml', 'PCS', 'Alat Kesehatan', 100, 4600, '1', '2020-11-12 02:15:20'),
(271, 'Spuit 5 ml', 'PCS', 'Alat Kesehatan', 100, 5200, '1', '2020-11-12 02:15:20'),
(272, 'Spuit 1 ml', 'PCS', 'Alat Kesehatan', 100, 5300, '1', '2020-11-12 02:15:20'),
(273, 'Spuit Insulin 1 ml', 'PCS', 'Alat Kesehatan', 100, 3800, '1', '2020-11-12 02:15:20'),
(274, 'Spuit 10 ml', 'PCS', 'Alat Kesehatan', 100, 5700, '1', '2020-11-12 02:15:20'),
(275, 'Spuit 20 ml', 'PCS', 'Alat Kesehatan', 100, 7300, '1', '2020-11-12 02:15:20'),
(276, 'Spuit 60 ml', 'PCS', 'Alat Kesehatan', 100, 21900, '1', '2020-11-12 02:15:20'),
(277, 'Spuit 50 ml', 'PCS', 'Alat Kesehatan', 100, 17200, '1', '2020-11-12 02:15:20'),
(278, 'Stomach tube 12', 'PCS', 'Alat Kesehatan', 100, 48000, '1', '2020-11-12 02:15:20'),
(279, 'Stomach tube 14', 'PCS', 'Alat Kesehatan', 100, 48000, '1', '2020-11-12 02:15:20'),
(280, 'Stomach tube 16', 'PCS', 'Alat Kesehatan', 100, 35750, '1', '2020-11-12 02:15:20'),
(281, 'Stomach tube 18', 'PCS', 'Alat Kesehatan', 100, 48000, '1', '2020-11-12 02:15:20'),
(282, 'Stomach tube 20', 'PCS', 'Alat Kesehatan', 100, 35900, '1', '2020-11-12 02:15:20'),
(283, 'Softex', 'PCS', 'Alat Kesehatan', 100, 4000, '1', '2020-11-12 02:15:20'),
(284, 'Slang Masker O2  Dewasa', 'PCS', 'Alat Kesehatan', 100, 47200, '1', '2020-11-12 02:15:20'),
(285, 'Slang Masker O2 Anak', 'PCS', 'Alat Kesehatan', 100, 47200, '1', '2020-11-12 02:15:20'),
(286, 'Spongostan', 'PCS', 'Alat Kesehatan', 100, 58500, '1', '2020-11-12 02:15:20'),
(287, 'Sucction Catheter no.10', 'PCS', 'Alat Kesehatan', 100, 13500, '1', '2020-11-12 02:15:20'),
(288, 'Sucction Catheter no.12', 'PCS', 'Alat Kesehatan', 100, 13500, '1', '2020-11-12 02:15:20'),
(289, 'Sucction Catheter no.14', 'PCS', 'Alat Kesehatan', 100, 13500, '1', '2020-11-12 02:15:20'),
(290, 'Sucction Catheter no.16', 'PCS', 'Alat Kesehatan', 100, 11700, '1', '2020-11-12 02:15:20'),
(291, 'Sucction Catheter no.6', 'PCS', 'Alat Kesehatan', 100, 11700, '1', '2020-11-12 02:15:20'),
(292, 'Sucction Catheter no.8', 'PCS', 'Alat Kesehatan', 100, 11700, '1', '2020-11-12 02:15:20'),
(293, 'Spatel kayu', 'PCS', 'Alat Kesehatan', 100, 1000, '1', '2020-11-12 02:15:20'),
(294, 'Spalk Jari', 'PCS', 'Alat Kesehatan', 100, 150, '1', '2020-11-12 02:15:20'),
(295, 'Spalk Kecil ', 'PCS', 'Alat Kesehatan', 100, 650, '1', '2020-11-12 02:15:20'),
(296, 'Spalk Sedang ', 'PCS', 'Alat Kesehatan', 100, 3400, '1', '2020-11-12 02:15:20'),
(297, 'Spalk Besar ', 'PCS', 'Alat Kesehatan', 100, 5050, '1', '2020-11-12 02:15:20'),
(298, 'Silk Black No.0', 'CM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(299, 'Silk black 2/0', 'CM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(300, 'Silk Black 3/0', 'CM', 'Alat Kesehatan', 100, 300, '1', '2020-11-12 02:15:20'),
(301, 'Saliva ejector ', 'PCS', 'Alat Kesehatan', 100, 650, '1', '2020-11-12 02:15:20'),
(302, 'D-tek Silk no 2/0 kulit', 'SACHET', 'Alat Kesehatan', 100, 90000, '1', '2020-11-12 02:15:20'),
(303, 'Silk 2', 'CM', 'Alat Kesehatan', 100, 250, '1', '2020-11-12 02:15:20'),
(304, 'Sacro Lumber', 'PASANG', 'Alat Kesehatan', 100, 600000, '1', '2020-11-12 02:15:20'),
(305, 'Stomach tube 8', 'PCS', 'Alat Kesehatan', 100, 40750, '1', '2020-11-12 02:15:20'),
(306, 'Stomach tube 10', 'PCS', 'Alat Kesehatan', 100, 35900, '1', '2020-11-12 02:15:20'),
(307, 'stuing', 'PCS', 'Alat Kesehatan', 100, 50000, '1', '2020-11-12 02:15:20'),
(308, 'Stetoscope', 'BOX', 'Alat Kesehatan', 100, 500500, '1', '2020-11-12 02:15:20'),
(309, 'Laminaria M', 'PCS', 'Alat Kesehatan', 100, 17700, '1', '2020-11-12 02:15:20'),
(310, 'Silk No. 1', 'PCS', 'Alat Kesehatan', 100, 67000, '1', '2020-11-12 02:15:20'),
(311, 'Silk No. 0', 'PCS', 'Alat Kesehatan', 100, 82900, '1', '2020-11-12 02:15:20'),
(312, 'Silk No. 2/0', 'PCS', 'Alat Kesehatan', 100, 90000, '1', '2020-11-12 02:15:20'),
(313, 'Slang Masker O2 bayi', 'PCS', 'Alat Kesehatan', 100, 39300, '1', '2020-11-12 02:15:20'),
(314, 'Arm Sling S', 'PCS', 'Alat Kesehatan', 100, 30000, '1', '2020-11-12 02:15:20'),
(315, 'Apron 75x130/025', 'PCS', 'Alat Kesehatan', 100, 3100, '1', '2020-11-12 02:15:20'),
(316, 'Certofix DUO V720', 'PCS', 'Alat Kesehatan', 100, 773900, '1', '2020-11-12 02:15:20'),
(317, 'Catgut Chromic No 3/0 Otot', 'CM', 'Alat Kesehatan', 100, 63200, '1', '2020-11-12 02:15:20'),
(318, 'Catgut Chromic No 0 otot', 'CM', 'Alat Kesehatan', 100, 52700, '1', '2020-11-12 02:15:20'),
(319, 'Catgut Chromic No 2/0 Otot', 'CM', 'Alat Kesehatan', 100, 54500, '1', '2020-11-12 02:15:20'),
(320, 'D-tek Silk 4/0 Otot', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(321, 'Electro Surgical Blades pensil', 'PCS', 'Alat Kesehatan', 100, 61700, '1', '2020-11-12 02:15:20'),
(322, 'Extention Tube 75cm ET2527', 'PCS', 'Alat Kesehatan', 100, 24000, '1', '2020-11-12 02:15:20'),
(323, 'Extention Tube 150 mm', 'PCS', 'Alat Kesehatan', 100, 54300, '1', '2020-11-12 02:15:20'),
(324, 'Filasilk (Silk) no 0', 'PCS', 'Alat Kesehatan', 100, 90400, '1', '2020-11-12 02:15:20'),
(325, 'Filamide (Nylon) No 4-0 Kulit', 'PCS', 'Alat Kesehatan', 100, 47000, '1', '2020-11-12 02:15:20'),
(326, 'Filamide (Nylon) No 3/0 Kulit', 'PCS', 'Alat Kesehatan', 100, 97300, '1', '2020-11-12 02:15:20'),
(327, 'Filasilk (Silk) No 2/0 Kulit', 'PCS', 'Alat Kesehatan', 100, 57400, '1', '2020-11-12 02:15:20'),
(328, 'Filasilk (Silk) No 1 Otot', 'PCS', 'Alat Kesehatan', 100, 40000, '1', '2020-11-12 02:15:20'),
(329, 'Filaprop No 4-0', 'PCS', 'Alat Kesehatan', 100, 168000, '1', '2020-11-12 02:15:20'),
(330, 'Filaprop No 3/0 Otot', 'PCS', 'Alat Kesehatan', 100, 125100, '1', '2020-11-12 02:15:20'),
(331, 'Jarum Spinal no 22', 'PCS', 'Alat Kesehatan', 100, 62900, '1', '2020-11-12 02:15:20'),
(332, 'Micropore/Plester putih Besar', 'CM', 'Alat Kesehatan', 100, 109, '1', '2020-11-12 02:15:20'),
(333, 'Megasorb (PGA) No 2/0 Otot', 'PCS', 'Alat Kesehatan', 100, 123000, '1', '2020-11-12 02:15:20'),
(334, 'Megasorb (PGA) No 1 Otot', 'PCS', 'Alat Kesehatan', 100, 197500, '1', '2020-11-12 02:15:20'),
(335, 'Mitsu (PGA) No 1 Otot ', 'PCS', 'Alat Kesehatan', 100, 72200, '1', '2020-11-12 02:15:20'),
(336, 'Megasorb (PGA) No 2 Otot', 'PCS', 'Alat Kesehatan', 100, 68200, '1', '2020-11-12 02:15:20'),
(337, 'Merisoft Cromic No 1 otot', 'CM', 'Alat Kesehatan', 100, 49200, '1', '2020-11-12 02:15:20'),
(338, 'Mersilk (Silk) No 0 Otot', 'CM', 'Alat Kesehatan', 100, 91200, '1', '2020-11-12 02:15:20'),
(339, 'Mitsu (PGA) No 0 Otot', 'PCS', 'Alat Kesehatan', 100, 79100, '1', '2020-11-12 02:15:20'),
(340, 'Megasorb (PGA) No 3/0 Otot', 'PCS', 'Alat Kesehatan', 100, 130200, '1', '2020-11-12 02:15:20'),
(341, 'Megasorb (PGA) No 0 otot', 'PCS', 'Alat Kesehatan', 100, 181200, '1', '2020-11-12 02:15:20'),
(342, 'Mayo Tube no 000', 'PCS', 'Alat Kesehatan', 100, 21450, '1', '2020-11-12 02:15:20'),
(343, 'Non Women Clip Cap', 'PCS', 'Alat Kesehatan', 100, 650, '1', '2020-11-12 02:15:20'),
(344, 'Oxymeter', 'PCS', 'Alat Kesehatan', 100, 858000, '1', '2020-11-12 02:15:20'),
(345, 'Pen Light', 'BATANG', 'Alat Kesehatan', 100, 178750, '1', '2020-11-12 02:15:20'),
(346, 'Pouches Strerilization Flat 200x30', 'ROL', 'Alat Kesehatan', 100, 2752750, '1', '2020-11-12 02:15:20'),
(347, 'Pouches Strerilization Flat 200x10', 'ROL', 'Alat Kesehatan', 100, 950950, '1', '2020-11-12 02:15:20'),
(348, 'Qualtrus (PGA) No 0 Otot', 'PCS', 'Alat Kesehatan', 100, 70400, '1', '2020-11-12 02:15:20'),
(349, 'Qualtrus (PGA) No 2/0 Otot', 'PCS', 'Alat Kesehatan', 100, 78400, '1', '2020-11-12 02:15:20'),
(350, 'Spuit AGD', 'PCS', 'Alat Kesehatan', 100, 31500, '1', '2020-11-12 02:15:20'),
(351, 'Slang Nebulezer Anak', 'PCS', 'Alat Kesehatan', 100, 26000, '1', '2020-11-12 02:15:20'),
(352, 'Slang Nebulezer Dewasa', 'PCS', 'Alat Kesehatan', 95, 45500, '1', '2020-11-12 02:15:20'),
(353, 'Slang Handpiece', 'METER', 'Alat Kesehatan', 100, 286000, '1', '2020-11-12 02:15:20'),
(354, 'Vicryl (PGA) No 0 Otot', 'CM', 'Alat Kesehatan', 100, 138200, '1', '2020-11-12 02:15:20'),
(355, 'Vicryl (PGA) No 2 Otot', 'CM', 'Alat Kesehatan', 100, 49900, '1', '2020-11-12 02:15:20'),
(356, 'Vicryl (PGA) no 3/0 Otot', 'PCS', 'Alat Kesehatan', 100, 169900, '1', '2020-11-12 02:15:20'),
(357, 'Wound dressing 10x35 cm', 'PCS', 'Alat Kesehatan', 66, 33000, '1', '2020-11-12 02:15:20'),
(358, 'Winner Transpraent Film Dreassing 6x7', 'PCS', 'Alat Kesehatan', 96, 4100, '1', '2020-11-12 02:15:20'),
(359, 'Winner Transparent Film Dresing 6x7 With Notch', 'PCS', 'Alat Kesehatan', 100, 4300, '1', '2020-11-12 02:15:20'),
(360, 'Winner Adhesive Wound Dresing 5cm x 5m', 'CM', 'Alat Kesehatan', 100, 57, '1', '2020-11-12 02:15:20'),
(361, 'Winner Adhesive Wound Dresing 10cm x 5m', 'CM', 'Alat Kesehatan', 100, 100, '1', '2020-11-12 02:15:20'),
(362, 'Winner sterilization pouch 30x100', 'ROL', 'Alat Kesehatan', 100, 1859000, '1', '2020-11-12 02:15:20'),
(363, 'Winner Crepe Wrap 100 cm x 100 cm 60 GSM', 'BOX', 'Alat Kesehatan', 100, 1573000, '1', '2020-11-12 02:15:20'),
(364, 'Wash Gloves', 'BUNGKUS', 'Alat Kesehatan', 100, 9300, '1', '2020-11-12 02:15:20'),
(365, 'Winner Streilizatin Pouch 10x100 cm', 'ROL', 'Alat Kesehatan', 100, 479000, '1', '2020-11-12 02:15:20'),
(366, 'Thermometer digital', 'PCS', 'Alat Kesehatan', 100, 715000, '1', '2020-11-12 02:15:20'),
(367, 'Thermometer safety', 'PCS', 'Alat Kesehatan', 100, 32300, '1', '2020-11-12 02:15:20'),
(368, 'Transfusi Shet', 'PCS', 'Alat Kesehatan', 100, 33500, '1', '2020-11-12 02:15:20'),
(369, 'Three - Way Stopcock', 'PCS', 'Alat Kesehatan', 100, 19800, '1', '2020-11-12 02:15:20'),
(370, 'Urinal Plastik', 'PCS', 'Alat Kesehatan', 100, 21500, '1', '2020-11-12 02:15:20'),
(371, 'Urine Bag', 'PCS', 'Alat Kesehatan', 100, 14300, '1', '2020-11-12 02:15:20'),
(372, 'Umbiliical/ jepit tali pusar', 'PCS', 'Alat Kesehatan', 100, 2800, '1', '2020-11-12 02:15:20'),
(373, 'Verban 10 cm', 'PCS', 'Alat Kesehatan', 100, 6100, '1', '2020-11-12 02:15:20'),
(374, 'Verban 5 cm', 'PCS', 'Alat Kesehatan', 100, 2400, '1', '2020-11-12 02:15:20'),
(375, 'Vasco Sarung Tangan Steril No.7', 'PASANG', 'Alat Kesehatan', 100, 12200, '1', '2020-11-12 02:15:20'),
(376, 'Vasco Sarung Tangan No.7.5', 'PASANG', 'Alat Kesehatan', 100, 12200, '1', '2020-11-12 02:15:20'),
(377, 'Vicryl (PGA) No 1 Otot', 'PCS', 'Alat Kesehatan', 100, 72000, '1', '2020-11-12 02:15:20'),
(378, 'Vicryl (PGA) No 2/0', 'PCS', 'Alat Kesehatan', 100, 102000, '1', '2020-11-12 02:15:20'),
(379, 'Venplon no 22', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(380, 'Venplon no 20 ', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(381, 'Venplon no 18', 'PCS', 'Alat Kesehatan', 100, 32200, '1', '2020-11-12 02:15:20'),
(382, 'Wing Needle 23', 'PCS', 'Alat Kesehatan', 100, 18600, '1', '2020-11-12 02:15:20'),
(383, 'Wing Needle 25', 'PCS', 'Alat Kesehatan', 100, 9450, '1', '2020-11-12 02:15:20'),
(384, 'Wing Needle 27', 'PCS', 'Alat Kesehatan', 100, 24300, '1', '2020-11-12 02:15:20'),
(385, 'WWZ', 'PCS', 'Alat Kesehatan', 100, 71500, '1', '2020-11-12 02:15:20'),
(386, 'Wing Needle 24', 'PCS', 'Alat Kesehatan', 100, 9450, '1', '2020-11-12 02:15:20'),
(387, 'Wundres B 10 x 10', 'PCS', 'Alat Kesehatan', 100, 80100, '1', '2020-11-12 02:15:20'),
(388, 'Wing Needle 26', 'PCS', 'Alat Kesehatan', 100, 9450, '1', '2020-11-12 02:15:20'),
(389, 'Wundres B 10 x 20', 'PCS', 'Alat Kesehatan', 100, 143000, '1', '2020-11-12 02:15:20'),
(390, 'Wundres  F 10 x 10', 'PCS', 'Alat Kesehatan', 100, 178800, '1', '2020-11-12 02:15:20'),
(391, 'Wundres F 5  x 20', 'PCS', 'Alat Kesehatan', 100, 200200, '1', '2020-11-12 02:15:20'),
(392, 'Wundres N 10 x 10', 'PCS', 'Alat Kesehatan', 100, 91700, '1', '2020-11-12 02:15:20'),
(393, 'Wundres N 10 x 20', 'PCS', 'Alat Kesehatan', 100, 164500, '1', '2020-11-12 02:15:20'),
(394, 'Winner Wovenclipca', 'PCS', 'Alat Kesehatan', 100, 650, '1', '2020-11-12 02:15:20'),
(395, 'Diazole inf', 'BOTOL', 'Alat Kesehatan', 100, 18500, '1', '2020-11-12 02:15:20'),
(396, 'Kalender', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(397, 'Lancet', 'PCS', 'Alat Kesehatan', 100, 500, '1', '2020-11-12 02:15:20'),
(398, 'Accu Chek Strip', 'PCS', 'Alat Kesehatan', 100, 10850, '1', '2020-11-12 02:15:20'),
(399, 'Accu Chek Lancet', 'PCS', 'Alat Kesehatan', 100, 1500, '1', '2020-11-12 02:15:20'),
(400, 'Accu Chek Performa', 'PCS', 'Alat Kesehatan', 100, 12500, '1', '2020-11-12 02:15:20'),
(401, 'Buffer PH 7', 'BOTOL', 'Alat Kesehatan', 100, 637000, '1', '2020-11-12 02:15:20'),
(402, 'Dengue Tripleline', 'PCS', 'Alat Kesehatan', 100, 196600, '1', '2020-11-12 02:15:20'),
(403, 'Giemsa 500 ml', 'BOTOL', 'Alat Kesehatan', 100, 1365000, '1', '2020-11-12 02:15:20'),
(404, 'Hbs Ag Proven', 'PCS', 'Alat Kesehatan', 100, 25700, '1', '2020-11-12 02:15:20'),
(405, 'Metanol 2.5 Ltr', 'BOTOL', 'Alat Kesehatan', 100, 611000, '1', '2020-11-12 02:15:20'),
(406, 'vacuete needle', 'PCS', 'Alat Kesehatan', 100, 4700, '1', '2020-11-12 02:15:20'),
(407, 'Needle Holder', 'PCS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(408, 'Obyek Glass', 'PCS', 'Alat Kesehatan', 100, 700, '1', '2020-11-12 02:15:20'),
(409, 'Otsucath no.18', 'PCS', 'Alat Kesehatan', 100, 35000, '1', '2020-11-12 02:15:20'),
(410, 'Otsucath no.20', 'PCS', 'Alat Kesehatan', 100, 35000, '1', '2020-11-12 02:15:20'),
(411, 'Otsucath no.16', 'PCS', 'Alat Kesehatan', 100, 31500, '1', '2020-11-12 02:15:20'),
(412, 'Occult Blood', 'LEMBAR', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(413, 'Pastik', 'PCS', 'Alat Kesehatan', 100, 500, '1', '2020-11-12 02:15:20'),
(414, 'Pipet tetes', 'PCS', 'Alat Kesehatan', 100, 3000, '1', '2020-11-12 02:15:20'),
(415, 'Bocal Urine', 'PCS', 'Alat Kesehatan', 100, 1500, '1', '2020-11-12 02:15:20'),
(416, 'PP Test', 'PCS', 'Alat Kesehatan', 100, 4500, '1', '2020-11-12 02:15:20'),
(417, 'Pipette Led', 'PCS', 'Alat Kesehatan', 100, 64350, '1', '2020-11-12 02:15:20'),
(418, 'Vacuete EDTA 3 ml', 'PCS', 'Alat Kesehatan', 100, 3400, '1', '2020-11-12 02:15:20'),
(419, 'Vacuete Na Citrate 2 ml', 'PCS', 'Alat Kesehatan', 100, 3100, '1', '2020-11-12 02:15:20'),
(420, 'Vacuete plain / SST II', 'PCS', 'Alat Kesehatan', 100, 4300, '1', '2020-11-12 02:15:20'),
(421, 'Vacuete EDTA anak', 'PCS', 'Alat Kesehatan', 100, 7000, '1', '2020-11-12 02:15:20'),
(422, 'Aclam syr', 'BOTOL', 'Alat Kesehatan', 100, 82200, '1', '2020-11-12 02:15:20'),
(423, 'Apialys Drops', 'BOTOL', 'Alat Kesehatan', 100, 57200, '1', '2020-11-12 02:15:20'),
(424, 'Biozim inj', 'VIAL', 'Alat Kesehatan', 100, 350350, '1', '2020-11-12 02:15:20'),
(425, 'Durogesic', 'PCS', 'Alat Kesehatan', 100, 274000, '1', '2020-11-12 02:15:20'),
(426, 'Lasal exspektoran', 'BOTOL', 'Alat Kesehatan', 100, 53600, '1', '2020-11-12 02:15:20'),
(427, 'Laprosin syr', 'BOTOL', 'Alat Kesehatan', 100, 120000, '1', '2020-11-12 02:15:20'),
(428, 'Apialys syr', 'BOTOL', 'Alat Kesehatan', 100, 47200, '1', '2020-11-12 02:15:20'),
(429, 'Lasal syr', 'BOTOL', 'Alat Kesehatan', 100, 37200, '1', '2020-11-12 02:15:20'),
(430, 'Nylon 2/0', 'CM', 'Alat Kesehatan', 100, 6600, '1', '2020-11-12 02:15:20'),
(431, 'Nylon 3/0', 'PCS', 'Alat Kesehatan', 100, 78700, '1', '2020-11-12 02:15:20'),
(432, 'Resochin ', 'KAPLET', 'Alat Kesehatan', 100, 550, '1', '2020-11-12 02:15:20'),
(433, 'Silk 1', 'CM', 'Alat Kesehatan', 100, 260, '1', '2020-11-12 02:15:20'),
(434, 'Paket mandi anak', 'BUNGKUS', 'Alat Kesehatan', 100, 0, '1', '2020-11-12 02:15:20'),
(435, 'Developer Automatic', 'BOTOL', 'Alat Kesehatan', 100, 2965000, '1', '2020-11-12 02:15:20'),
(436, 'Fixer Automatic', 'BOTOL', 'Alat Kesehatan', 100, 3043000, '1', '2020-11-12 02:15:20'),
(437, 'Bratamed Antiseptik', 'ML', 'Antiseptik', 100, 52, '1', '2020-11-12 02:15:20'),
(438, 'Alkohol 96 %', 'ML', 'BAHAN KIMIA', 100, 116, '1', '2020-11-12 02:15:20'),
(439, 'Alkohol 70 %', 'ML', 'BAHAN KIMIA', 100, 70, '1', '2020-11-12 02:15:20'),
(440, 'Asam Salisilat', 'MG', 'BAHAN KIMIA', 100, 150, '1', '2020-11-12 02:15:20'),
(441, 'Borax gliserin', 'ML', 'BAHAN KIMIA', 100, 5000, '1', '2020-11-12 02:15:20'),
(442, 'Formalin cair', 'ML', 'BAHAN KIMIA', 100, 71, '1', '2020-11-12 02:15:20'),
(443, 'Garam Inggris', 'MG', 'BAHAN KIMIA', 100, 155, '1', '2020-11-12 02:15:20'),
(444, 'H2O2 50 %', 'ML', 'BAHAN KIMIA', 100, 40, '1', '2020-11-12 02:15:20'),
(445, 'H2O2 1 %', 'ML', 'BAHAN KIMIA', 100, 20, '1', '2020-11-12 02:15:20'),
(446, 'H2O2 1 % / 100ml', 'CC', 'BAHAN KIMIA', 100, 2000, '1', '2020-11-12 02:15:20'),
(447, 'H2O2 3 %', 'ML', 'BAHAN KIMIA', 100, 35, '1', '2020-11-12 02:15:20'),
(448, 'H2O2 3 % 30 ml + Pipet', 'ML', 'BAHAN KIMIA', 100, 3500, '1', '2020-11-12 02:15:20'),
(449, 'Odex', 'GALON', 'BAHAN KIMIA', 100, 1620000, '1', '2020-11-12 02:15:20'),
(450, 'Ozyme', 'GALON', 'BAHAN KIMIA', 100, 2759900, '1', '2020-11-12 02:15:20'),
(451, 'Parafin', 'ML', 'BAHAN KIMIA', 100, 100, '1', '2020-11-12 02:15:20'),
(452, 'Rivanol / ml25', 'ML', 'BAHAN KIMIA', 100, 25, '1', '2020-11-12 02:15:20'),
(453, 'Sublimat / ml', 'ML', 'BAHAN KIMIA', 100, 25, '1', '2020-11-12 02:15:20'),
(454, 'Vaselin', 'GRAM', 'BAHAN KIMIA', 100, 300, '1', '2020-11-12 02:15:20'),
(455, 'Wash Bensin', 'BOTOL', 'BAHAN KIMIA', 100, 57200, '1', '2020-11-12 02:15:20'),
(456, 'Xylocaain Jelly 30 g', 'GRAM', 'BAHAN KIMIA', 100, 2400, '1', '2020-11-12 02:15:20'),
(457, 'Cafein ', 'MG', 'BAHAN KIMIA', 100, 10, '1', '2020-11-12 02:15:20'),
(458, 'Minotrol 16', 'VIAL', 'BAHAN KIMIA', 100, 722095, '1', '2020-11-12 02:15:20'),
(459, 'Moldano', 'KILOGRAM', 'Botol', 100, 0, '1', '2020-11-12 02:15:20'),
(460, 'Spectrum A 3,5', 'TUBE', 'Botol', 100, 0, '1', '2020-11-12 02:15:20'),
(461, 'Septrum C2', 'TUBE', 'Botol', 100, 0, '1', '2020-11-12 02:15:20'),
(462, 'Spectrum C3', 'TUBE', 'Botol', 100, 0, '1', '2020-11-12 02:15:20'),
(463, 'Aceton', 'LITER', 'Botol', 100, 0, '1', '2020-11-12 02:15:20'),
(464, 'Sucralfat syr', 'BOTOL', 'Botol', 100, 18100, '1', '2020-11-12 02:15:20'),
(465, 'Bufect Syr', 'BOTOL', 'Botol', 100, 20900, '1', '2020-11-12 02:15:20'),
(466, 'Bufect Forte', 'BOTOL', 'Botol', 100, 29300, '1', '2020-11-12 02:15:20'),
(467, 'Cerini Syr', 'BOTOL', 'Botol', 100, 56900, '1', '2020-11-12 02:15:20'),
(468, 'Cefila syr', 'BOTOL', 'Botol', 100, 130500, '1', '2020-11-12 02:15:20'),
(469, 'Povidon 30 ml', 'BOTOL', 'Botol', 100, 4800, '1', '2020-11-12 02:15:20'),
(470, 'Tiriz Drops', 'BOTOL', 'Botol', 100, 92950, '1', '2020-11-12 02:15:20'),
(471, 'TB Vit syr 225 ml', 'BOTOL', 'Botol', 100, 55000, '1', '2020-11-12 02:15:20'),
(472, 'Wida KN 1', 'BOTOL', 'Botol', 100, 18600, '1', '2020-11-12 02:15:20'),
(473, 'Wida KN 2', 'BOTOL', 'Botol', 100, 18600, '1', '2020-11-12 02:15:20'),
(474, 'Wida  D5 -1/4 NS', 'BOTOL', 'Botol', 100, 20200, '1', '2020-11-12 02:15:20'),
(475, 'Wida KDN-1', 'BOTOL', 'Botol', 100, 21200, '1', '2020-11-12 02:15:20'),
(476, 'Wida KDN-2', 'BOTOL', 'Botol', 100, 21200, '1', '2020-11-12 02:15:20'),
(477, 'Widahes 130', 'BOTOL', 'Botol', 100, 236400, '1', '2020-11-12 02:15:20'),
(478, 'Widahes 200', 'BOTOL', 'Botol', 100, 223800, '1', '2020-11-12 02:15:20'),
(479, 'Nitrogen( N2O )', 'LITER', 'Gas Medis', 100, 1000, '1', '2020-11-12 02:15:20'),
(480, 'OXYGEN', 'LITER', 'GAS MEDIS', 100, 55, '1', '2020-11-12 02:15:20'),
(481, 'Oxygen VGL', 'LITER', 'GAS MEDIS', 100, 55, '1', '2020-11-12 02:15:20'),
(482, 'Dextros 500 Widatra', 'BOTOL', 'INFUS', 100, 16800, '1', '2020-11-12 02:15:20'),
(483, 'Nacl 500 Widatra', 'BOTOL', 'INFUS', 100, 20000, '1', '2020-11-12 02:15:20'),
(484, 'Paracetamol inf', 'BOTOL', 'INFUS', 96, 64350, '1', '2020-11-12 02:15:20'),
(485, 'Ringerfundin ', 'BOTOL', 'INFUS', 100, 14300, '1', '2020-11-12 02:15:20'),
(486, 'Aquades Sanbe 2000 ML', 'ML', 'INFUS', 100, 19, '1', '2020-11-12 02:15:20'),
(487, 'Benutrion VE inf', 'FLS', 'INFUS', 100, 160000, '1', '2020-11-12 02:15:20'),
(488, 'Floxaris Inf', 'BOTOL', 'INFUS', 100, 429000, '1', '2020-11-12 02:15:20'),
(489, 'Gelafusal inf', 'PCS', 'INFUS', 100, 351384, '1', '2020-11-12 02:15:20'),
(490, 'Gelofusin inf', 'BOTOL', 'INFUS', 100, 130000, '1', '2020-11-12 02:15:20'),
(491, 'Infusan Tridex', 'BOTOL', 'INFUS', 100, 30800, '1', '2020-11-12 02:15:20'),
(492, 'Infusan Sanbe Hest 130', 'BOTOL', 'INFUS', 100, 300000, '1', '2020-11-12 02:15:20'),
(493, 'Infusan D5 1/2 NS DP', 'BOTOL', 'INFUS', 100, 27200, '1', '2020-11-12 02:15:20'),
(494, 'Infusan D5 1/4 NS', 'BOTOL', 'INFUS', 100, 26800, '1', '2020-11-12 02:15:20'),
(495, 'Infusan NS 500 Sanbe', 'BOTOL', 'INFUS', 100, 26600, '1', '2020-11-12 02:15:20'),
(496, 'Infusan D5 1/2 NS SP', 'BOTOL', 'INFUS', 100, 26800, '1', '2020-11-12 02:15:20'),
(497, 'Nacl 100 cc B-braun', 'BOTOL', 'INFUS', 100, 11450, '1', '2020-11-12 02:15:20'),
(498, 'Nutriflex Infus', 'BOTOL', 'INFUS', 100, 611200, '1', '2020-11-12 02:15:20'),
(499, 'Renosan  Infus', 'BOTOL', 'INFUS', 100, 360200, '1', '2020-11-12 02:15:20'),
(500, 'Wida Bes', 'BOTOL', 'INFUS', 100, 12500, '1', '2020-11-12 02:15:20'),
(501, 'Widahes Bes', 'BOTOL', 'INFUS', 100, 250250, '1', '2020-11-12 02:15:20'),
(502, 'Gips Super putih', 'KILOGRAM', 'Kotak', 100, 0, '1', '2020-11-12 02:15:20'),
(503, 'Suction catheter', 'PCS', 'Kotak', 100, 11500, '1', '2020-11-12 02:15:20'),
(504, 'Selang Suction Silicon', 'METER', 'Kotak', 100, 262700, '1', '2020-11-12 02:15:20'),
(505, 'Codein 10', 'TABLET', 'Narkotika', 100, 900, '1', '2020-11-12 02:15:20'),
(506, 'Codein 20', 'TABLET', 'Narkotika', 100, 1700, '1', '2020-11-12 02:15:20'),
(507, 'Codipront syr', 'BOTOL', 'Narkotika', 100, 60600, '1', '2020-11-12 02:15:20'),
(508, 'Codipront Cum Expect', 'BOTOL', 'Narkotika', 100, 66100, '1', '2020-11-12 02:15:20'),
(509, 'Codipront cap', 'KAPSUL', 'Narkotika', 100, 10300, '1', '2020-11-12 02:15:20'),
(510, 'MST Continus', 'TABLET', 'Narkotika', 100, 20300, '1', '2020-11-12 02:15:20'),
(511, 'Morphine injeks', 'AMPUL', 'Narkotika', 100, 13700, '1', '2020-11-12 02:15:20'),
(512, 'Pethidin HCL', 'AMPUL', 'Narkotika', 100, 17500, '1', '2020-11-12 02:15:20'),
(513, 'Fentanyl', 'AMPUL', 'Narkotika', 100, 63800, '1', '2020-11-12 02:15:20'),
(514, 'Melidox Tab', 'TABLET', 'Narkotika', 100, 1400, '1', '2020-11-12 02:15:20'),
(515, 'Proclozam ', 'TABLET', 'Narkotika', 100, 2500, '1', '2020-11-12 02:15:20'),
(516, 'Wound dressing 10x25 cm', 'LEMBAR', 'Obat Bebas', 100, 42900, '1', '2020-11-12 02:15:20'),
(517, 'Hexadol 120 ml', 'BOTOL', 'Obat Bebas', 100, 22900, '1', '2020-11-12 02:15:20'),
(518, 'Ferriz Drop', 'BOTOL', 'Obat Bebas', 100, 35750, '1', '2020-11-12 02:15:20'),
(519, 'Antasida Doen', 'TABLET', 'Obat Bebas', 100, 400, '1', '2020-11-12 02:15:20'),
(520, 'Bicarbonas Natrium', 'TABLET', 'Obat Bebas', 100, 300, '1', '2020-11-12 02:15:20'),
(521, 'Cartos', 'TUBE', 'Obat Bebas', 100, 100100, '1', '2020-11-12 02:15:20'),
(522, 'OBH Combi', 'BOTOL', 'Obat Bebas ', 100, 17200, '1', '2020-11-12 02:15:20'),
(523, 'OBH Oplos', 'BOTOL', 'Obat Bebas ', 100, 8400, '1', '2020-11-12 02:15:20'),
(524, 'Paracetamol syr', 'BOTOL', 'Obat Bebas', 98, 7150, '1', '2020-11-12 02:15:20'),
(525, 'Vitamin C', 'TABLET', 'Obat Bebas', 100, 200, '1', '2020-11-12 02:15:20'),
(526, 'THIAMIN', 'KAPLET', 'Obat Bebas', 100, 100, '1', '2020-11-12 02:15:20'),
(527, 'Onic', 'TABLET', 'Obat Bebas', 100, 11000, '1', '2020-11-12 02:15:20'),
(528, 'Aloclair plus', 'TUBE', 'Obat Bebas', 100, 110100, '1', '2020-11-12 02:15:20'),
(529, 'Amvar', 'KAPLET', 'Obat Bebas ', 100, 8800, '1', '2020-11-12 02:15:20'),
(530, 'Aloclair plus Oralinse', 'BOTOL', 'Obat Bebas', 100, 114400, '1', '2020-11-12 02:15:20'),
(531, 'Acetin', 'TUBE', 'Obat Bebas', 100, 120300, '1', '2020-11-12 02:15:20'),
(532, 'Bio ATP', 'TABLET', 'Obat Bebas', 100, 3200, '1', '2020-11-12 02:15:20'),
(533, 'Biodiar', 'TABLET', 'Obat Bebas', 100, 1900, '1', '2020-11-12 02:15:20'),
(534, 'Biosanbe', 'TABLET', 'Obat Bebas', 100, 1400, '1', '2020-11-12 02:15:20'),
(535, 'Bonepatit', 'TABLET', 'Obat Bebas', 100, 9000, '1', '2020-11-12 02:15:20'),
(536, 'Bio Curliv', 'TABLET', 'Obat Bebas', 100, 8600, '1', '2020-11-12 02:15:20'),
(537, 'BioCal-95', 'TABLET', 'Obat Bebas ', 100, 6300, '1', '2020-11-12 02:15:20'),
(538, 'Bratamed hand antiseptic', 'ML', 'Obat Bebas', 100, 200, '1', '2020-11-12 02:15:20'),
(539, 'Caladine Lation 60 cc', 'BOTOL', 'Obat Bebas', 100, 14300, '1', '2020-11-12 02:15:20'),
(540, 'Caladine Powder 60 gr', 'BOTOL', 'Obat Bebas', 100, 8900, '1', '2020-11-12 02:15:20'),
(541, 'Carbol Gliserin', 'ML', 'Obat Bebas', 100, 125, '1', '2020-11-12 02:15:20'),
(542, 'Caldece', 'TUBE', 'Obat Bebas', 100, 42400, '1', '2020-11-12 02:15:20'),
(543, 'Calmin AF', 'TABLET', 'Obat Bebas', 100, 1450, '1', '2020-11-12 02:15:20'),
(544, 'Caladin powder 100 gr', 'BOTOL', 'Obat Bebas', 100, 12800, '1', '2020-11-12 02:15:20'),
(545, 'Cinula', 'KAPLET', 'Obat Bebas', 100, 6450, '1', '2020-11-12 02:15:20'),
(546, 'Caladin lation 95 gr', 'BOTOL', 'Obat Bebas', 100, 17200, '1', '2020-11-12 02:15:20'),
(547, 'Curvit CL Emulsion', 'BOTOL', 'Obat Bebas', 100, 64350, '1', '2020-11-12 02:15:20'),
(548, 'Curcuma', 'TABLET', 'Obat Bebas', 100, 1300, '1', '2020-11-12 02:15:20'),
(549, 'Dermakel 19G', 'PCS', 'Obat Bebas', 100, 143000, '1', '2020-11-12 02:15:20'),
(550, 'Dehaf', 'TABLET', 'Obat Bebas ', 100, 4300, '1', '2020-11-12 02:15:20'),
(551, 'Elkana sirup', 'BOTOL', 'Obat Bebas', 100, 33000, '1', '2020-11-12 02:15:20'),
(552, 'Elkana CL Emulsi', 'BOTOL', 'Obat Bebas', 100, 73100, '1', '2020-11-12 02:15:20'),
(553, 'Equal Sachet', 'SACHET', 'Obat Bebas', 100, 500, '1', '2020-11-12 02:15:20'),
(554, 'Enercore', 'TABLET', 'Obat Bebas', 100, 25750, '1', '2020-11-12 02:15:20'),
(555, 'Epiven', 'TABLET', 'Obat Bebas', 100, 14850, '1', '2020-11-12 02:15:20'),
(556, 'Equal tab', 'TABLET', 'Obat Bebas', 100, 250, '1', '2020-11-12 02:15:20'),
(557, 'Fluconazol tab', 'KAPLET', 'Obat Bebas', 100, 36700, '1', '2020-11-12 02:15:20'),
(558, 'Folaplus', 'KAPLET', 'Obat Bebas', 100, 1350, '1', '2020-11-12 02:15:20'),
(559, 'Ferospat', 'TUBE', 'Obat Bebas', 100, 85800, '1', '2020-11-12 02:15:20'),
(560, 'Formuno extra', 'TUBE', 'Obat Bebas', 97, 136000, '1', '2020-11-12 02:15:20');
INSERT INTO `b_obat` (`id`, `nama_obat`, `satuan`, `jenis_obat`, `stok`, `harga`, `is_active`, `timestamp`) VALUES
(561, 'Ferriz syr', 'BOTOL', 'Obat Bebas', 100, 37700, '1', '2020-11-12 02:15:20'),
(562, 'Ferro-k', 'BOTOL', 'Obat Bebas', 100, 50000, '1', '2020-11-12 02:15:20'),
(563, 'Gestamag', 'BOTOL', 'Obat Bebas', 100, 28600, '1', '2020-11-12 02:15:20'),
(564, 'Hepa-Q', 'KAPSUL', 'Obat Bebas', 100, 6400, '1', '2020-11-12 02:15:20'),
(565, 'Hexadol 60 ml', 'BOTOL', 'Obat Bebas', 100, 14300, '1', '2020-11-12 02:15:20'),
(566, 'Hexadol Mint 100 ml', 'BOTOL', 'Obat Bebas', 100, 34300, '1', '2020-11-12 02:15:20'),
(567, 'Hemiseal', 'BOTOL', 'Obat Bebas', 100, 121550, '1', '2020-11-12 02:15:20'),
(568, 'Im Boost Force', 'TABLET', 'Obat Bebas', 100, 7900, '1', '2020-11-12 02:15:20'),
(569, 'Im Boost Force 60 ml', 'BOTOL', 'Obat Bebas', 100, 64350, '1', '2020-11-12 02:15:20'),
(570, 'Imunos sirup', 'BOTOL', 'Obat Bebas', 100, 90000, '1', '2020-11-12 02:15:20'),
(571, 'Imunos Kap', 'TABLET', 'Obat Bebas', 100, 10500, '1', '2020-11-12 02:15:20'),
(572, 'Joinfit', 'TUBE', 'Obat Bebas', 100, 86500, '1', '2020-11-12 02:15:20'),
(573, 'Kalipar ', 'KAPSUL', 'Obat Bebas', 100, 2900, '1', '2020-11-12 02:15:20'),
(574, 'Lanagogum', 'KAPSUL', 'Obat Bebas', 100, 5400, '1', '2020-11-12 02:15:20'),
(575, 'Lanakeloid 10 g', 'TUBE', 'Obat Bebas', 100, 143000, '1', '2020-11-12 02:15:20'),
(576, 'Lapalos Cream', 'TUBE', 'Obat Bebas', 100, 28600, '1', '2020-11-12 02:15:20'),
(577, 'Laxadine', 'BOTOL', 'Obat Bebas', 100, 50000, '1', '2020-11-12 02:15:20'),
(578, 'Lipofood', 'KAPSUL', 'Obat Bebas', 100, 7500, '1', '2020-11-12 02:15:20'),
(579, 'lactulax syrup', 'BOTOL', 'Obat Bebas', 100, 47200, '1', '2020-11-12 02:15:20'),
(580, 'L-Bio sachet', 'SACHET', 'Obat Bebas', 100, 10000, '1', '2020-11-12 02:15:20'),
(581, 'L-Core', 'SACHET', 'Obat Bebas', 100, 31500, '1', '2020-11-12 02:15:20'),
(582, 'Lesipar', 'KAPSUL', 'Obat Bebas', 100, 5000, '1', '2020-11-12 02:15:20'),
(583, 'Lesichol 600', 'KAPSUL', 'Obat Bebas', 100, 25700, '1', '2020-11-12 02:15:20'),
(584, 'Memoran', 'TABLET', 'Obat Bebas', 100, 9500, '1', '2020-11-12 02:15:20'),
(585, 'Maltofer Fol', 'TABLET', 'Obat Bebas', 100, 3700, '1', '2020-11-12 02:15:20'),
(586, 'Mecola', 'TABLET', 'Obat Bebas', 100, 5700, '1', '2020-11-12 02:15:20'),
(587, 'Mederma 20 gr', 'TUBE', 'Obat Bebas', 100, 243100, '1', '2020-11-12 02:15:20'),
(588, 'Mediflex 30 mg', 'TUBE', 'Obat Bebas', 100, 100100, '1', '2020-11-12 02:15:20'),
(589, 'Microlax Gel', 'TUBE', 'Obat Bebas', 100, 28600, '1', '2020-11-12 02:15:20'),
(590, 'Minoscrub', 'ML', 'Obat Bebas', 100, 300, '1', '2020-11-12 02:15:20'),
(591, 'Mucosolvan 60 ml', 'BOTOL', 'Obat Bebas ', 100, 14300, '1', '2020-11-12 02:15:20'),
(592, 'Mycoral 5 gram', 'TUBE', 'Obat Bebas', 100, 14300, '1', '2020-11-12 02:15:20'),
(593, 'Mucosta tab', 'TABLET', 'Obat Bebas', 100, 6000, '1', '2020-11-12 02:15:20'),
(594, 'Minosep 60', 'BOTOL', 'Obat Bebas', 100, 15700, '1', '2020-11-12 02:15:20'),
(595, 'Metolon inj', 'AMPUL', 'Obat Bebas', 100, 10800, '1', '2020-11-12 02:15:20'),
(596, 'Neo Iodine', 'BOTOL', 'Obat Bebas', 100, 17200, '1', '2020-11-12 02:15:20'),
(597, 'Opilax syr', 'BOTOL', 'Obat Bebas', 100, 67200, '1', '2020-11-12 02:15:20'),
(598, 'Opsite besar 25 x 10 cm', 'LEMBAR', 'Obat Bebas', 100, 78650, '1', '2020-11-12 02:15:20'),
(599, 'Opsite Kecil 6,5 x 5 cm', 'LEMBAR', 'Obat Bebas', 100, 32900, '1', '2020-11-12 02:15:20'),
(600, 'Opsite Sedang 15,5 x 8 cm', 'LEMBAR', 'Obat Bebas', 100, 39300, '1', '2020-11-12 02:15:20'),
(601, 'Osteocal Plus', 'TABLET', 'Obat Bebas', 100, 1600, '1', '2020-11-12 02:15:20'),
(602, 'Osteokom', 'TABLET', 'Obat Bebas', 100, 8600, '1', '2020-11-12 02:15:20'),
(603, 'Oscal 0,25', 'KAPSUL', 'Obat Bebas ', 100, 9000, '1', '2020-11-12 02:15:20'),
(604, 'Ostrimix', 'TABLET', 'Obat Bebas', 100, 12850, '1', '2020-11-12 02:15:20'),
(605, 'Opsite 9,5 x 8,5 cm', 'LEMBAR', 'Obat Bebas', 100, 32200, '1', '2020-11-12 02:15:20'),
(606, 'OBH flus', 'BOTOL', 'Obat Bebas ', 100, 8400, '1', '2020-11-12 02:15:20'),
(607, 'Pro TB 2 Kid', 'TABLET', 'Obat Bebas', 100, 4000, '1', '2020-11-12 02:15:20'),
(608, 'Pro TB 2', 'TABLET', 'Obat Bebas', 100, 8700, '1', '2020-11-12 02:15:20'),
(609, 'Pro TB 3 Kid', 'TABLET', 'Obat Bebas', 100, 5700, '1', '2020-11-12 02:15:20'),
(610, 'Pro TB 4', 'TABLET', 'Obat Bebas', 100, 6600, '1', '2020-11-12 02:15:20'),
(611, 'Prenatin Plus', 'TABLET', 'Obat Bebas', 100, 750, '1', '2020-11-12 02:15:20'),
(612, 'PSIDII 60 ml', 'BOTOL', 'Obat Bebas', 100, 47200, '1', '2020-11-12 02:15:20'),
(613, 'PSIDII tab', 'KAPSUL', 'Obat Bebas', 100, 6050, '1', '2020-11-12 02:15:20'),
(614, 'Osteor Cream', 'TUBE', 'Obat Bebas', 100, 171600, '1', '2020-11-12 02:15:20'),
(615, 'Probiokid', 'SACHET', 'Obat Bebas', 100, 19600, '1', '2020-11-12 02:15:20'),
(616, 'Strovac', 'KAPSUL', 'Obat Bebas', 100, 19500, '1', '2020-11-12 02:15:20'),
(617, 'Salicyl Talk', 'BOTOL', 'Obat Bebas', 100, 18500, '1', '2020-11-12 02:15:20'),
(618, 'Sanmol 120 mg', 'TUBE', 'Obat Bebas', 100, 26400, '1', '2020-11-12 02:15:20'),
(619, 'Sanmol 500 mg', 'TUBE', 'Obat Bebas', 100, 31500, '1', '2020-11-12 02:15:20'),
(620, 'Sanmag syr', 'BOTOL', 'Obat Bebas', 100, 35750, '1', '2020-11-12 02:15:20'),
(621, 'Sanmol drops', 'BOTOL', 'Obat Bebas', 100, 22450, '1', '2020-11-12 02:15:20'),
(622, 'Sanmol sirup', 'BOTOL', 'Obat Bebas', 100, 16700, '1', '2020-11-12 02:15:20'),
(623, 'Septadine Gargle 200 ml', 'BOTOL', 'Obat Bebas', 100, 15800, '1', '2020-11-12 02:15:20'),
(624, 'Sanmol Tab', 'TABLET', 'Obat Bebas', 100, 400, '1', '2020-11-12 02:15:20'),
(625, 'Sanbe Kids', 'BOTOL', 'Obat Bebas', 100, 54200, '1', '2020-11-12 02:15:20'),
(626, 'Syncore', 'SACHET', 'Obat Bebas', 100, 39200, '1', '2020-11-12 02:15:20'),
(627, 'Tantum Verde 120 ml', 'BOTOL', 'Obat Bebas', 100, 50000, '1', '2020-11-12 02:15:20'),
(628, 'Xanvit', 'BOTOL', 'Obat Bebas ', 100, 12200, '1', '2020-11-12 02:15:20'),
(629, 'Xylocain Jelly 6 mg', 'TUBE', 'Obat Bebas Terbatas', 100, 118600, '1', '2020-11-12 02:15:20'),
(630, 'Oralit', 'BUNGKUS', 'Obat Bebas Terbatas', 100, 1050, '1', '2020-11-12 02:15:20'),
(631, 'CTM', 'TABLET', 'Obat Bebas Terbatas', 100, 150, '1', '2020-11-12 02:15:20'),
(632, 'Ketokonazole Crem ', 'TUBE', 'Obat Bebas Terbatas', 100, 10000, '1', '2020-11-12 02:15:20'),
(633, 'Meropenem', 'VIAL', 'Obat Bebas Terbatas', 100, 286000, '1', '2020-11-12 02:15:20'),
(634, 'Paracetamol drops', 'BOTOL', 'Obat Bebas Terbatas', 100, 11700, '1', '2020-11-12 02:15:20'),
(635, 'Paracetamol', 'TABLET', 'Obat Bebas Terbatas', 100, 300, '1', '2020-11-12 02:15:20'),
(636, 'Sertraline 50 mg', 'TABLET', 'Obat Bebas Terbatas', 100, 9500, '1', '2020-11-12 02:15:20'),
(637, 'Triamcinolone', 'TABLET', 'Obat Bebas Terbatas', 100, 900, '1', '2020-11-12 02:15:20'),
(638, 'Thiampenicole', 'TABLET', 'Obat Bebas Terbatas', 100, 1600, '1', '2020-11-12 02:15:20'),
(639, 'Vitamin B 12', 'TABLET', 'Obat Bebas Terbatas', 100, 200, '1', '2020-11-12 02:15:20'),
(640, 'Vitamin B 6', 'TABLET', 'Obat Bebas Terbatas', 100, 250, '1', '2020-11-12 02:15:20'),
(641, 'Vitamin B Kompleks', 'TABLET', 'Obat Bebas Terbatas', 100, 100, '1', '2020-11-12 02:15:20'),
(642, 'Vitamin K', 'TABLET', 'Obat Bebas Terbatas', 100, 750, '1', '2020-11-12 02:15:20'),
(643, 'Vitamin B1', 'TABLET', 'Obat Bebas Terbatas', 100, 100, '1', '2020-11-12 02:15:20'),
(644, 'Astatin', 'TABLET', 'Obat Bebas Terbatas', 100, 7150, '1', '2020-11-12 02:15:20'),
(645, 'Bestalin', 'TABLET', 'Obat Bebas Terbatas', 100, 5700, '1', '2020-11-12 02:15:20'),
(646, 'Benacol 60 ml', 'BOTOL', 'Obat Bebas Terbatas', 100, 16400, '1', '2020-11-12 02:15:20'),
(647, 'Biobran tab', 'TABLET', 'Obat Bebas Terbatas', 100, 15000, '1', '2020-11-12 02:15:20'),
(648, 'Cohistan 60 ml', 'BOTOL', 'Obat Bebas Terbatas', 100, 19000, '1', '2020-11-12 02:15:20'),
(649, 'Comtusi 60 ml', 'BOTOL', 'Obat Bebas Terbatas', 100, 50200, '1', '2020-11-12 02:15:20'),
(650, 'CAL - 95', 'KAPLET', 'Obat Bebas Terbatas', 100, 7400, '1', '2020-11-12 02:15:20'),
(651, 'Cernevit', 'VIAL', 'Obat Bebas Terbatas', 100, 264550, '1', '2020-11-12 02:15:20'),
(652, 'Cohistan 100 ml', 'BOTOL', 'Obat Bebas Terbatas', 100, 31400, '1', '2020-11-12 02:15:20'),
(653, 'Dimenhydrinate 50 mg', 'TABLET', 'Obat Bebas Terbatas', 100, 500, '1', '2020-11-12 02:15:20'),
(654, 'Dansera', 'TABLET', 'Obat Bebas Terbatas', 100, 7150, '1', '2020-11-12 02:15:20'),
(655, 'Dialac', 'SACHET', 'Obat Bebas Terbatas', 100, 6900, '1', '2020-11-12 02:15:20'),
(656, 'Dulcolax Supp 10 mg', 'PCS', 'Obat Bebas Terbatas', 100, 25000, '1', '2020-11-12 02:15:20'),
(657, 'Dulcolax Supp.5 mg', 'PCS', 'Obat Bebas Terbatas', 100, 18600, '1', '2020-11-12 02:15:20'),
(658, 'Elkana tab', 'TABLET', 'Obat Bebas Terbatas', 100, 1200, '1', '2020-11-12 02:15:20'),
(659, 'Erdomex kap', 'TABLET', 'Obat Bebas Terbatas', 100, 5700, '1', '2020-11-12 02:15:20'),
(660, 'Fundamin - E', 'TABLET', 'Obat Bebas Terbatas', 100, 1050, '1', '2020-11-12 02:15:20'),
(661, 'Fexofed', 'TABLET', 'Obat Bebas Terbatas', 100, 5400, '1', '2020-11-12 02:15:20'),
(662, 'FG Troches', 'TABLET', 'Obat Bebas Terbatas', 100, 1400, '1', '2020-11-12 02:15:20'),
(663, 'Forneuro', 'TABLET', 'Obat Bebas Terbatas', 100, 6500, '1', '2020-11-12 02:15:20'),
(664, 'Fleet Enema', 'BOTOL', 'Obat Bebas Terbatas', 100, 135400, '1', '2020-11-12 02:15:20'),
(665, 'Folavit tab 400 mg', 'TABLET', 'Obat Bebas Terbatas', 100, 1300, '1', '2020-11-12 02:15:20'),
(666, 'folavit  tab 1000', 'TABLET', 'Obat Bebas Terbatas', 100, 2700, '1', '2020-11-12 02:15:20'),
(667, 'Flavin', 'TABLET', 'Obat Bebas Terbatas', 100, 2850, '1', '2020-11-12 02:15:20'),
(668, 'Fucoidan tab', 'KAPSUL', 'Obat Bebas Terbatas', 100, 15000, '1', '2020-11-12 02:15:20'),
(669, 'Fudan ', 'KAPSUL', 'Obat Bebas Terbatas', 100, 15400, '1', '2020-11-12 02:15:20'),
(670, 'Farsorbid 10 mg', 'KAPLET', 'Obat Bebas Terbatas', 100, 600, '1', '2020-11-12 02:15:20'),
(671, 'Glucan tab', 'TABLET', 'Obat Bebas Terbatas', 100, 9300, '1', '2020-11-12 02:15:20'),
(672, 'Grafola-DHA', 'KAPSUL', 'Obat Bebas Terbatas', 100, 5000, '1', '2020-11-12 02:15:20'),
(673, 'GCM forte', 'SACHET', 'Obat Bebas Terbatas', 100, 18600, '1', '2020-11-12 02:15:20'),
(674, 'Hi-Bone', 'KAPLET', 'Obat Bebas Terbatas', 100, 6300, '1', '2020-11-12 02:15:20'),
(675, 'Ibukal', 'BOTOL', 'Obat Bebas Terbatas', 100, 18600, '1', '2020-11-12 02:15:20'),
(676, 'Ketorolac 30 mg', 'AMPUL', 'Obat Bebas Terbatas', 100, 20800, '1', '2020-11-12 02:15:20'),
(677, 'Ketocid ', 'TABLET', 'Obat Bebas Terbatas', 100, 9650, '1', '2020-11-12 02:15:20'),
(678, 'Levofloxacin Inf', 'BOTOL', 'Obat Bebas Terbatas', 100, 114400, '1', '2020-11-12 02:15:20'),
(679, 'Levocin infus', 'sofbag', 'Obat Bebas Terbatas', 100, 431700, '1', '2020-11-12 02:15:20'),
(680, 'Lacto-B', 'SACHET', 'Obat Bebas Terbatas', 100, 8400, '1', '2020-11-12 02:15:20'),
(681, 'Mezatrin', 'TABLET', 'Obat Bebas Terbatas', 100, 42900, '1', '2020-11-12 02:15:20'),
(682, 'Ostobon', 'SACHET', 'Obat Bebas Terbatas', 100, 10000, '1', '2020-11-12 02:15:20'),
(683, 'Osteor plus', 'TABLET', 'Obat Bebas Terbatas', 100, 10000, '1', '2020-11-12 02:15:20'),
(684, 'Osfit DHA', 'KAPSUL', 'Obat Bebas Terbatas', 100, 6200, '1', '2020-11-12 02:15:20'),
(685, 'Proliva', 'KAPLET', 'Obat Bebas Terbatas', 100, 10050, '1', '2020-11-12 02:15:20'),
(686, 'Profen', 'BOTOL', 'Obat Bebas Terbatas', 100, 22900, '1', '2020-11-12 02:15:20'),
(687, 'Prodermal 10 gr Cream', 'TUBE', 'Obat Bebas Terbatas', 100, 24350, '1', '2020-11-12 02:15:20'),
(688, 'Panloc', 'VIAL', 'Obat Bebas Terbatas', 100, 214500, '1', '2020-11-12 02:15:20'),
(689, 'Pranza', 'VIAL', 'Obat Bebas Terbatas', 100, 194500, '1', '2020-11-12 02:15:20'),
(690, 'Propepsa syr', 'BOTOL', 'Obat Bebas Terbatas', 100, 71500, '1', '2020-11-12 02:15:20'),
(691, 'Prosinal syr', 'BOTOL', 'Obat Bebas Terbatas', 100, 28600, '1', '2020-11-12 02:15:20'),
(692, 'Rhetoflam Gel', 'TUBE', 'Obat Bebas Terbatas', 100, 40300, '1', '2020-11-12 02:15:20'),
(693, 'Renvol gel', 'TUBE', 'Obat Bebas Terbatas', 100, 28600, '1', '2020-11-12 02:15:20'),
(694, 'Sagestam Cream 10 gr', 'TUBE', 'Obat Bebas Terbatas', 100, 17600, '1', '2020-11-12 02:15:20'),
(695, 'Sanadryl DMP', 'BOTOL', 'Obat Bebas Terbatas', 100, 17200, '1', '2020-11-12 02:15:20'),
(696, 'Sanadryl Ekspektorant', 'BOTOL', 'Obat Bebas Terbatas', 100, 14200, '1', '2020-11-12 02:15:20'),
(697, 'Silex', 'BOTOL', 'Obat Bebas Terbatas', 100, 53600, '1', '2020-11-12 02:15:20'),
(698, 'Simzen kap', 'TABLET', 'Obat Bebas Terbatas', 100, 4300, '1', '2020-11-12 02:15:20'),
(699, 'Simcobal ', 'TABLET', 'Obat Bebas Terbatas', 100, 2600, '1', '2020-11-12 02:15:20'),
(700, 'Simdrol tab', 'TABLET', 'Obat Bebas Terbatas', 100, 3600, '1', '2020-11-12 02:15:20'),
(701, 'Stolax Supp', 'BUNGKUS', 'Obat bebas terbatas', 100, 9400, '1', '2020-11-12 02:15:20'),
(702, 'Santesar tab', 'TABLET', 'Obat Bebas Terbatas', 100, 11800, '1', '2020-11-12 02:15:20'),
(703, 'Sancoidan Kapsul', 'KAPSUL', 'Obat Bebas Terbatas', 100, 21450, '1', '2020-11-12 02:15:20'),
(704, 'Trombophob 20 gr', 'TUBE', 'Obat Bebas Terbatas', 100, 78650, '1', '2020-11-12 02:15:20'),
(705, 'TVOR Tab', 'TABLET', 'Obat Bebas Terbatas', 100, 3600, '1', '2020-11-12 02:15:20'),
(706, 'Trolit', 'SACHET', 'Obat Bebas Terbatas', 100, 16600, '1', '2020-11-12 02:15:20'),
(707, 'Theophyllin', 'MG', 'Obat Bebas Terbatas', 100, 1, '1', '2020-11-12 02:15:20'),
(708, 'Tetagam', 'AMPUL', 'Obat Bebas Terbatas', 100, 268800, '1', '2020-11-12 02:15:20'),
(709, 'Tramifen tab', 'TABLET', 'Obat Bebas Terbatas', 100, 10000, '1', '2020-11-12 02:15:20'),
(710, 'Trajenta', 'TABLET', 'Obat Bebas Terbatas', 100, 18100, '1', '2020-11-12 02:15:20'),
(711, 'Tisacef kap', 'KAPSUL', 'Obat Bebas Terbatas', 100, 14300, '1', '2020-11-12 02:15:20'),
(712, 'Ultracet', 'TABLET', 'Obat Bebas Terbatas', 100, 9500, '1', '2020-11-12 02:15:20'),
(713, 'Unicitamol syr', 'BOTOL', 'Obat Bebas Terbatas', 100, 2900, '1', '2020-11-12 02:15:20'),
(714, 'Ventolin Nebules', 'BOTOL', 'Obat Bebas Terbatas', 100, 13900, '1', '2020-11-12 02:15:20'),
(715, 'Vestein', 'BOTOL', 'Obat Bebas Terbatas', 100, 70400, '1', '2020-11-12 02:15:20'),
(716, 'Ventolin Inhaler', 'BOTOL', 'Obat Bebas Terbatas', 100, 134800, '1', '2020-11-12 02:15:20'),
(717, 'Nacl OGB', 'BOTOL', 'Obat Bebas Terbatas', 100, 12350, '1', '2020-11-12 02:15:20'),
(718, 'Zinkid 100 ml', 'BOTOL', 'Obat Bebas Terbatas', 100, 39300, '1', '2020-11-12 02:15:20'),
(719, 'Zemindo syr', 'BOTOL', 'Obat Bebas Terbatas', 100, 46500, '1', '2020-11-12 02:15:20'),
(720, 'Bactigras', 'CM', 'Obat Benas', 100, 0, '1', '2020-11-12 02:15:20'),
(721, 'Ethylchloride 100 ml', 'ML', 'Obat Benas', 100, 2200, '1', '2020-11-12 02:15:20'),
(722, 'Lomatule', 'CM', 'Obat Benas', 100, 300, '1', '2020-11-12 02:15:20'),
(723, 'Daryant-tulle', 'LEMBAR', 'Obat Benas', 100, 32200, '1', '2020-11-12 02:15:20'),
(724, 'Salbutamol Syr', 'BOTOL', 'Obat Cair', 100, 22200, '1', '2020-11-12 02:15:20'),
(725, 'Ataroc syr', 'BOTOL', 'Obat Cair', 100, 66500, '1', '2020-11-12 02:15:20'),
(726, 'Eterfix infus', 'BOTOL', 'Obat Cair', 100, 65000, '1', '2020-11-12 02:15:20'),
(727, 'Edorisan Drop', 'BOTOL', 'Obat Cair', 100, 92200, '1', '2020-11-12 02:15:20'),
(728, 'LAPICEF SYRUP 125 MG/5ML', 'BOTOL', 'Obat Cair', 100, 65800, '1', '2020-11-12 02:15:20'),
(729, 'Wida D5-1/2 NS', 'BOTOL', 'Obat Cair', 100, 20200, '1', '2020-11-12 02:15:20'),
(730, 'Zircum syr', 'BOTOL', 'Obat Cair', 100, 42900, '1', '2020-11-12 02:15:20'),
(731, 'Ceftien', 'VIAL', 'Obat Injeksi', 100, 257400, '1', '2020-11-12 02:15:20'),
(732, 'Anti Bisa Ular (ABU)', 'VIAL', 'Obat Injeksi', 100, 1001000, '1', '2020-11-12 02:15:20'),
(733, 'Ampicilin Inj', 'AMPUL', 'Obat Injeksi', 100, 158400, '1', '2020-11-12 02:15:20'),
(734, 'Amoxilin Inj', 'VIAL', 'Obat Injeksi', 100, 12150, '1', '2020-11-12 02:15:20'),
(735, 'Amiodarone HCL', 'VIAL', 'Obat Injeksi', 100, 12100, '1', '2020-11-12 02:15:20'),
(736, 'Bupivacain Hcl', 'AMPUL', 'Obat Injeksi', 100, 31000, '1', '2020-11-12 02:15:20'),
(737, 'Ceftizoxime', 'VIAL', 'Obat Injeksi', 100, 143000, '1', '2020-11-12 02:15:20'),
(738, 'Ceftazidime inj', 'VIAL', 'Obat Injeksi', 100, 59300, '1', '2020-11-12 02:15:20'),
(739, 'Cefoperazone', 'VIAL', 'Obat Injeksi', 100, 185900, '1', '2020-11-12 02:15:20'),
(740, 'Carbazochroe inj', 'AMPUL', 'Obat Injeksi', 100, 17000, '1', '2020-11-12 02:15:20'),
(741, 'Calcium Gluconate Inj', 'AMPUL', 'Obat Injeksi', 100, 17200, '1', '2020-11-12 02:15:20'),
(742, 'Dobutamin inj', 'VIAL', 'Obat Injeksi', 100, 100100, '1', '2020-11-12 02:15:20'),
(743, 'Dexketoprofen inj', 'AMPUL', 'Obat Injeksi', 100, 32900, '1', '2020-11-12 02:15:20'),
(744, 'Ketamin inj', 'ML', 'Obat Injeksi', 100, 8900, '1', '2020-11-12 02:15:20'),
(745, 'Metoclopramide HCL', 'VIAL', 'Obat Injeksi', 100, 10000, '1', '2020-11-12 02:15:20'),
(746, 'Nicardipine inj', 'AMPUL', 'Obat Injeksi', 100, 185900, '1', '2020-11-12 02:15:20'),
(747, 'Pytominadion Inj', 'VIAL', 'Obat Injeksi', 100, 8100, '1', '2020-11-12 02:15:20'),
(748, 'Vitamin B Komplex Inj', 'AMPUL', 'Obat Injeksi', 100, 13200, '1', '2020-11-12 02:15:20'),
(749, 'Doburan Injeksi 50 Mg', 'AMPUL', 'Obat Injeksi', 100, 41000, '1', '2020-11-12 02:15:20'),
(750, 'Actrapid Novolet', 'VIAL', 'Obat Injeksi', 100, 188150, '1', '2020-11-12 02:15:20'),
(751, 'Asam traneksamat inj', 'AMPUL', 'Obat Injeksi', 100, 11000, '1', '2020-11-12 02:15:20'),
(752, 'Anbacim inj', 'VIAL', 'Obat Injeksi', 100, 109700, '1', '2020-11-12 02:15:20'),
(753, 'Bestram inj 100 mg', 'AMPUL', 'Obat Injeksi', 100, 19300, '1', '2020-11-12 02:15:20'),
(754, 'Buscopan', 'AMPUL', 'Obat Injeksi', 100, 20000, '1', '2020-11-12 02:15:20'),
(755, 'Bricasma Inj', 'AMPUL', 'Obat Injeksi', 100, 27200, '1', '2020-11-12 02:15:20'),
(756, 'Bledstop inj ', 'AMPUL', 'Obat Injeksi', 100, 10500, '1', '2020-11-12 02:15:20'),
(757, 'Bactirom Inj', 'VIAL', 'Obat Injeksi', 100, 424000, '1', '2020-11-12 02:15:20'),
(758, 'Cebactam', 'VIAL', 'Obat Injeksi', 100, 294100, '1', '2020-11-12 02:15:20'),
(759, 'CEFTUM', 'VIAL', 'Obat Injeksi', 100, 271700, '1', '2020-11-12 02:15:20'),
(760, 'Carsive inj', 'AMPUL', 'Obat Injeksi', 100, 243100, '1', '2020-11-12 02:15:20'),
(761, 'Cepraz inj', 'VIAL', 'Obat Injeksi', 100, 214500, '1', '2020-11-12 02:15:20'),
(762, 'Cinam inj', 'VIAL', 'Obat Injeksi', 100, 204200, '1', '2020-11-12 02:15:20'),
(763, 'Decadryl inj', 'CC', 'Obat Injeksi', 100, 900, '1', '2020-11-12 02:15:20'),
(764, 'Dopamin ', 'AMPUL', 'Obat Injeksi', 100, 106000, '1', '2020-11-12 02:15:20'),
(765, 'Damaben Inj', 'AMPUL', 'Obat Injeksi', 100, 13200, '1', '2020-11-12 02:15:20'),
(766, 'Dofacef Inj', 'VIAL', 'Obat Injeksi', 100, 78400, '1', '2020-11-12 02:15:20'),
(767, 'Esola inj', 'VIAL', 'Obat Injeksi', 100, 235950, '1', '2020-11-12 02:15:20'),
(768, 'Fozran 8 mg', 'AMPUL', 'Obat Injeksi', 100, 40000, '1', '2020-11-12 02:15:20'),
(769, 'Farsik inj', 'AMPUL', 'Obat Injeksi', 100, 9300, '1', '2020-11-12 02:15:20'),
(770, 'Ferbulin inj', 'AMPUL', 'Obat Injeksi', 100, 10000, '1', '2020-11-12 02:15:20'),
(771, 'Granon 1 gr', 'AMPUL', 'Obat Injeksi', 100, 67950, '1', '2020-11-12 02:15:20'),
(772, 'Granon 3 gr', 'AMPUL', 'Obat Injeksi', 100, 157300, '1', '2020-11-12 02:15:20'),
(773, 'Furosemid inj', 'AMPUL', 'Obat Injeksi', 100, 6500, '1', '2020-11-12 02:15:20'),
(774, 'Hidonac', 'BOTOL', 'Obat Injeksi', 100, 421850, '1', '2020-11-12 02:15:20'),
(775, 'Hepatitis b recombinan', 'VIAL', 'Obat Injeksi', 100, 94700, '1', '2020-11-12 02:15:20'),
(776, 'Induxin inj', 'AMPUL', 'Obat Injeksi', 100, 11450, '1', '2020-11-12 02:15:20'),
(777, 'Ivanes inj', 'ML', 'Obat Injeksi', 100, 30250, '1', '2020-11-12 02:15:20'),
(778, 'Ketopain inj', 'AMPUL', 'Obat Injeksi', 100, 50050, '1', '2020-11-12 02:15:20'),
(779, 'KTM inj', 'ML', 'Obat Injeksi', 100, 30000, '1', '2020-11-12 02:15:20'),
(780, 'Indop 200 inj', 'VIAL', 'Obat Injeksi', 100, 24710, '1', '2020-11-12 02:15:20'),
(781, 'Laroscorbin', 'VIAL', 'Obat Injeksi', 100, 17000, '1', '2020-11-12 02:15:20'),
(782, 'Lapixime inj', 'VIAL', 'Obat Injeksi', 100, 214500, '1', '2020-11-12 02:15:20'),
(783, 'Lantus Solastar', 'VIAL', 'Obat Injeksi', 100, 120000, '1', '2020-11-12 02:15:20'),
(784, 'Lantidex Inj ', 'AMPUL', 'Obat Injeksi', 100, 60000, '1', '2020-11-12 02:15:20'),
(785, 'Novomix', 'FLS', 'Obat Injeksi', 100, 208100, '1', '2020-11-12 02:15:20'),
(786, 'Neuciti inj', 'AMPUL', 'Obat Injeksi', 100, 90000, '1', '2020-11-12 02:15:20'),
(787, 'Novellmycin Inj', 'VIAL', 'Obat Injeksi', 100, 235950, '1', '2020-11-12 02:15:20'),
(788, 'Oxytocin', 'AMPUL', 'Obat Injeksi', 100, 3500, '1', '2020-11-12 02:15:20'),
(789, 'Omeprazol inj', 'VIAL', 'Obat Injeksi', 100, 114400, '1', '2020-11-12 02:15:20'),
(790, 'Opigran 1', 'AMPUL', 'Obat Injeksi', 100, 72900, '1', '2020-11-12 02:15:20'),
(791, 'Opigran 3', 'AMPUL', 'Obat Injeksi', 100, 154400, '1', '2020-11-12 02:15:20'),
(792, 'ODR inj', 'AMPUL', 'Obat Injeksi', 100, 45800, '1', '2020-11-12 02:15:20'),
(793, 'Ottogenta inj', 'AMPUL', 'Obat Injeksi', 100, 14300, '1', '2020-11-12 02:15:20'),
(794, 'Pumpisel inj', 'VIAL', 'Obat Injeksi', 100, 211700, '1', '2020-11-12 02:15:20'),
(795, 'Piralen inj', 'AMPUL', 'Obat Injeksi', 100, 11450, '1', '2020-11-12 02:15:20'),
(796, 'Proterin Inj', 'AMPUL', 'Obat Injeksi', 100, 41300, '1', '2020-11-12 02:15:20'),
(797, 'Reculax inj ', 'AMPUL', 'Obat Injeksi', 100, 268800, '1', '2020-11-12 02:15:20'),
(798, 'Remopain', 'AMPUL', 'Obat Injeksi', 100, 55700, '1', '2020-11-12 02:15:20'),
(799, 'Roxemid inj', 'AMPUL', 'Obat Injeksi', 100, 12900, '1', '2020-11-12 02:15:20'),
(800, 'Rativol inj ', 'AMPUL', 'Obat Injeksi', 100, 52300, '1', '2020-11-12 02:15:20'),
(801, 'Spashi', 'AMPUL', 'Obat Injeksi', 100, 11400, '1', '2020-11-12 02:15:20'),
(802, 'SNMC', 'AMPUL', 'Obat Injeksi', 100, 150200, '1', '2020-11-12 02:15:20'),
(803, 'Sedacum inj', 'VIAL', 'Obat Injeksi', 100, 44800, '1', '2020-11-12 02:15:20'),
(804, 'Sohobion inj', 'AMPUL', 'Obat Injeksi', 100, 4600, '1', '2020-11-12 02:15:20'),
(805, 'Sodime', 'VIAL', 'Obat Injeksi', 100, 250250, '1', '2020-11-12 02:15:20'),
(806, 'Sotatic inj', 'AMPUL', 'Obat Injeksi', 100, 6500, '1', '2020-11-12 02:15:20'),
(807, 'Sansulin Dispopem', 'BATANG', 'Obat Injeksi', 100, 257400, '1', '2020-11-12 02:15:20'),
(808, 'Tofedex inj', 'AMPUL', 'Obat Injeksi', 100, 64350, '1', '2020-11-12 02:15:20'),
(809, 'Topazol inj', 'VIAL', 'Obat Injeksi', 100, 210200, '1', '2020-11-12 02:15:20'),
(810, 'Torpain inj', 'AMPUL', 'Obat Injeksi', 100, 42900, '1', '2020-11-12 02:15:20'),
(811, 'Ulvice 1000 mg', 'AMPUL', 'Obat Injeksi', 100, 37600, '1', '2020-11-12 02:15:20'),
(812, 'Vitadion inj', 'AMPUL', 'Obat Injeksi', 100, 16600, '1', '2020-11-12 02:15:20'),
(813, 'Velutine ', 'VIAL', 'Obat Injeksi', 100, 14800, '1', '2020-11-12 02:15:20'),
(814, 'Viccillin Inj', 'VIAL', 'Obat Injeksi', 100, 112750, '1', '2020-11-12 02:15:20'),
(815, 'Zolacap Inj', 'AMPUL', 'Obat Injeksi', 100, 165300, '1', '2020-11-12 02:15:20'),
(816, 'Cefixim 200 mg', 'KAPSUL', 'Obat Kapsul', 100, 6000, '1', '2020-11-12 02:15:20'),
(817, 'Pronyci', 'KAPSUL', 'Obat Kapsul', 100, 300, '1', '2020-11-12 02:15:20'),
(818, 'Acid Salicyl', 'GRAM', 'Obat Kapsul', 100, 450, '1', '2020-11-12 02:15:20'),
(819, 'Acilaz kap', 'KAPSUL', 'Obat Kapsul', 100, 19700, '1', '2020-11-12 02:15:20'),
(820, 'Albuforce Kapsul', 'KAPSUL', 'Obat Kapsul', 100, 7900, '1', '2020-11-12 02:15:20'),
(821, 'Ambeven ', 'KAPSUL', 'Obat Kapsul', 100, 1800, '1', '2020-11-12 02:15:20'),
(822, 'ARTRODAR DIACEREIN', 'KAPSUL', 'Obat Kapsul', 100, 11500, '1', '2020-11-12 02:15:20'),
(823, 'CaCO3', 'GRAM', 'Obat Kapsul', 100, 1000, '1', '2020-11-12 02:15:20'),
(824, 'Cefila 100 mg', 'KAPSUL', 'Obat Kapsul', 100, 27900, '1', '2020-11-12 02:15:20'),
(825, 'Cytodrox', 'KAPSUL', 'Obat Kapsul', 100, 13600, '1', '2020-11-12 02:15:20'),
(826, 'Cormega capsul', 'KAPSUL', 'Obat Kapsul', 100, 15700, '1', '2020-11-12 02:15:20'),
(827, 'Dismeno tab', 'KAPSUL', 'Obat Kapsul', 100, 5700, '1', '2020-11-12 02:15:20'),
(828, 'Dogmatil', 'KAPSUL', 'Obat Kapsul', 100, 4700, '1', '2020-11-12 02:15:20'),
(829, 'Durvikmet', 'TABLET', 'Obat Kapsul', 100, 8900, '1', '2020-11-12 02:15:20'),
(830, 'Ewoma kap', 'KAPSUL', 'Obat Kapsul', 100, 8600, '1', '2020-11-12 02:15:20'),
(831, 'Etagemycetin kapsul', 'KAPSUL', 'Obat Kapsul', 100, 600, '1', '2020-11-12 02:15:20'),
(832, 'Folamil genio', 'KAPSUL', 'Obat Kapsul', 100, 5000, '1', '2020-11-12 02:15:20'),
(833, 'Folic Acid', 'TABLET', 'Obat Kapsul', 100, 150, '1', '2020-11-12 02:15:20'),
(834, 'Gabapentin ', 'KAPSUL', 'Obat Kapsul', 100, 5900, '1', '2020-11-12 02:15:20'),
(835, 'Gastrolan kapsul', 'KAPSUL', 'Obat Kapsul', 100, 15700, '1', '2020-11-12 02:15:20'),
(836, 'Gabasant capsul', 'KAPSUL', 'Obat Kapsul', 100, 12500, '1', '2020-11-12 02:15:20'),
(837, 'Heparmin Kapsul', 'KAPSUL', 'Obat Kapsul', 100, 7600, '1', '2020-11-12 02:15:20'),
(838, 'Vitamam 1 kapsul', 'KAPSUL', 'Obat Kapsul', 100, 4300, '1', '2020-11-12 02:15:20'),
(839, 'Vitamam 2 kapsul', 'KAPSUL', 'Obat Kapsul', 100, 4600, '1', '2020-11-12 02:15:20'),
(840, 'Vitamam 3 kapsul', 'KAPSUL', 'Obat Kapsul', 100, 4600, '1', '2020-11-12 02:15:20'),
(841, 'Lancid', 'KAPSUL', 'Obat Kapsul', 100, 17900, '1', '2020-11-12 02:15:20'),
(842, 'Lapicef kapsul', 'KAPSUL', 'Obat Kapsul', 100, 15000, '1', '2020-11-12 02:15:20'),
(843, 'L-bio kapsul', 'KAPSUL', 'Obat Kapsul', 100, 10000, '1', '2020-11-12 02:15:20'),
(844, 'Lasgan kapsul', 'KAPSUL', 'Obat Kapsul', 100, 20000, '1', '2020-11-12 02:15:20'),
(845, 'Neugain kap', 'KAPSUL', 'Obat Kapsul', 100, 12800, '1', '2020-11-12 02:15:20'),
(846, 'Orasic kapsul', 'KAPSUL', 'Obat Kapsul', 100, 5000, '1', '2020-11-12 02:15:20'),
(847, 'Opiclam 150', 'KAPSUL', 'Obat Kapsul', 100, 5300, '1', '2020-11-12 02:15:20'),
(848, 'Opipentin 300', 'KAPSUL', 'Obat Kapsul', 100, 13300, '1', '2020-11-12 02:15:20'),
(849, 'Promavit', 'KAPSUL', 'Obat Kapsul', 100, 2150, '1', '2020-11-12 02:15:20'),
(850, 'Probiostim', 'KAPSUL', 'Obat Kapsul', 100, 15000, '1', '2020-11-12 02:15:20'),
(851, 'Prolacta DHA', 'KAPSUL', 'Obat Kapsul', 100, 7150, '1', '2020-11-12 02:15:20'),
(852, 'Solans', 'KAPSUL', 'Obat Kapsul', 100, 15750, '1', '2020-11-12 02:15:20'),
(853, 'Utrogestan 200 mg', 'KAPSUL', 'Obat Kapsul', 100, 31500, '1', '2020-11-12 02:15:20'),
(854, 'Vipalbumin  kapsul', 'KAPSUL', 'Obat Kapsul', 100, 7900, '1', '2020-11-12 02:15:20'),
(855, 'Vestein Kapsul', 'KAPSUL', 'Obat Kapsul', 100, 6000, '1', '2020-11-12 02:15:20'),
(856, 'Valbum 500 mg', 'KAPSUL', 'Obat Kapsul', 100, 7300, '1', '2020-11-12 02:15:20'),
(857, 'Neurosantin Kapsul', 'KAPSUL', 'Obat Kapsul', 100, 8800, '1', '2020-11-12 02:15:20'),
(858, 'Acyclovir 200', 'TABLET', 'Obat Keras', 100, 750, '1', '2020-11-12 02:15:20'),
(859, 'Acyclovir 400', 'TABLET', 'Obat Keras', 100, 1200, '1', '2020-11-12 02:15:20'),
(860, 'Adalat 10', 'TABLET', 'Obat Keras', 100, 3500, '1', '2020-11-12 02:15:20'),
(861, 'Adalat 5', 'TABLET', 'Obat Keras', 100, 2050, '1', '2020-11-12 02:15:20'),
(862, 'Analtram', 'TABLET', 'Obat Keras', 100, 12900, '1', '2020-11-12 02:15:20'),
(863, 'Aminofluid', 'FLS', 'Obat Keras', 100, 173000, '1', '2020-11-12 02:15:20'),
(864, 'Adalat oros ', 'TABLET', 'Obat Keras', 100, 11200, '1', '2020-11-12 02:15:20'),
(865, 'Lactrin kap', 'TABLET', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(866, 'Proneuron ', 'TABLET', 'Obat Keras', 100, 1600, '1', '2020-11-12 02:15:20'),
(867, 'Sincronik', 'TABLET', 'Obat Keras', 100, 10000, '1', '2020-11-12 02:15:20'),
(868, 'Ulcetra', 'TABLET', 'Obat Keras', 100, 10000, '1', '2020-11-12 02:15:20'),
(869, 'Sagestam ED', 'BOTOL', 'Obat keras', 100, 41250, '1', '2020-11-12 02:15:20'),
(870, 'Tarivid ', 'BOTOL', 'Obat keras', 100, 110100, '1', '2020-11-12 02:15:20'),
(871, 'Ambroxol syr', 'BOTOL', 'Obat Keras', 100, 10000, '1', '2020-11-12 02:15:20'),
(872, 'Allopurinol 100', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(873, 'Ambroxol 30 mg Tab   ', 'TABLET', 'Obat Keras', 100, 450, '1', '2020-11-12 02:15:20'),
(874, 'Aminophylin injek', 'AMPUL', 'Obat Keras', 100, 10000, '1', '2020-11-12 02:15:20'),
(875, 'Aminophylin Tab', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(876, 'Amoxilin dry sirup', 'BOTOL', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(877, 'Amoxycillin 500', 'TABLET', 'Obat Keras', 100, 1000, '1', '2020-11-12 02:15:20'),
(878, 'Antalgin', 'TABLET', 'Obat Keras', 100, 150, '1', '2020-11-12 02:15:20'),
(879, 'Aquadest 1000 ml', 'ML', 'Obat Keras', 100, 51, '1', '2020-11-12 02:15:20'),
(880, 'Aquadest 25 ml', 'BOTOL', 'Obat Keras', 100, 9000, '1', '2020-11-12 02:15:20'),
(881, 'Asam Mefenamat', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(882, 'Atropin Sulfate', 'AMPUL', 'Obat Keras', 100, 3400, '1', '2020-11-12 02:15:20'),
(883, 'ATS 1500 SI', 'AMPUL', 'Obat Keras', 100, 214500, '1', '2020-11-12 02:15:20'),
(884, 'ATS 20000 SI', 'AMPUL', 'Obat Keras', 100, 933450, '1', '2020-11-12 02:15:20'),
(885, 'Adan Dispo', 'AMPUL', 'Obat Keras', 100, 660000, '1', '2020-11-12 02:15:20'),
(886, 'Amlodipin 5 mg', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(887, 'Bisoprolol', 'TABLET', 'Obat Keras', 100, 3200, '1', '2020-11-12 02:15:20'),
(888, 'Ca Glukonas', 'AMPUL', 'Obat Keras', 100, 31400, '1', '2020-11-12 02:15:20'),
(889, 'Calcii Laktat', 'TABLET', 'Obat Keras', 100, 100, '1', '2020-11-12 02:15:20'),
(890, 'Captopril 12,5', 'TABLET', 'Obat Keras', 100, 150, '1', '2020-11-12 02:15:20'),
(891, 'Captopril 25', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(892, 'Cefadroxil syr 125 mg', 'BOTOL', 'Obat Keras', 100, 12800, '1', '2020-11-12 02:15:20'),
(893, 'Cefixime 100 mg', 'KAPSUL', 'Obat Keras', 100, 3750, '1', '2020-11-12 02:15:20'),
(894, 'Cefotaxim', 'VIAL', 'Obat Keras', 100, 57200, '1', '2020-11-12 02:15:20'),
(895, 'Ceftriaxone inj', 'VIAL', 'Obat Keras', 100, 50050, '1', '2020-11-12 02:15:20'),
(896, 'Cetirizine', 'TABLET', 'Obat Keras', 100, 600, '1', '2020-11-12 02:15:20'),
(897, 'Ciprofloksazin inf', 'BOTOL', 'Obat Keras', 100, 74100, '1', '2020-11-12 02:15:20'),
(898, 'Ciprofloksazin tab 500 mg ', 'TABLET', 'Obat Keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(899, 'Claneksi inj', 'VIAL', 'Obat Keras', 100, 133700, '1', '2020-11-12 02:15:20'),
(900, 'Clindamycin 150', 'KAPSUL', 'Obat Keras', 100, 950, '1', '2020-11-12 02:15:20'),
(901, 'Cefixime Syr', 'BOTOL', 'Obat Keras', 100, 47200, '1', '2020-11-12 02:15:20'),
(902, 'Cotrimoksazole Forte', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(903, 'Cefadroxil 500', 'KAPSUL', 'Obat Keras', 100, 1500, '1', '2020-11-12 02:15:20'),
(904, 'Clindamycin 300', 'KAPSUL', 'Obat Keras', 100, 1900, '1', '2020-11-12 02:15:20'),
(905, 'Clonidine', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(906, 'Co-Amoxiclav', 'tablet', 'Obat Keras', 100, 7505, '1', '2020-11-12 02:15:20'),
(907, 'Cefadroxil syr 250 mg', 'BOTOL', 'Obat Keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(908, 'Calsium Gluconas', 'AMPUL', 'Obat keras', 100, 18000, '1', '2020-11-12 02:15:20'),
(909, 'Dexamethasone Tab', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(910, 'Dextrometorphan', 'TABLET', 'Obat Keras', 100, 250, '1', '2020-11-12 02:15:20'),
(911, 'Dextrose 10 %', 'BOTOL', 'Obat Keras', 100, 16800, '1', '2020-11-12 02:15:20'),
(912, 'Dextrose 40% 25 CC', 'BOTOL', 'Obat Keras', 100, 13000, '1', '2020-11-12 02:15:20'),
(913, 'Dextrose 5 %+ 0,225% / D5 - 1/4NS', 'BOTOL', 'Obat Keras', 100, 21900, '1', '2020-11-12 02:15:20'),
(914, 'Dextrose 5% + 0,45% / D5 - 1/2NS', 'BOTOL', 'Obat Keras', 100, 21900, '1', '2020-11-12 02:15:20'),
(915, 'Dextrose 5%+0,9% / D5-NS', 'BOTOL', 'Obat Keras', 100, 15400, '1', '2020-11-12 02:15:20'),
(916, 'Dextrose 5% 100 cc', 'BOTOL', 'Obat Keras', 100, 19700, '1', '2020-11-12 02:15:20'),
(917, 'Dextrose 5% 500cc', 'BOTOL', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(918, 'Digoksin', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(919, 'Diphenhydramine Hcl', 'AMPUL', 'Obat Keras', 100, 9250, '1', '2020-11-12 02:15:20'),
(920, 'Epinephrine', 'AMPUL', 'Obat Keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(921, 'Erytromycin', 'TABLET', 'Obat Keras', 100, 1000, '1', '2020-11-12 02:15:20'),
(922, 'Etambutol', 'TABLET', 'Obat keras', 100, 900, '1', '2020-11-12 02:15:20'),
(923, 'Eperisone Hydrochloride', 'TABLET', 'Obat Keras', 100, 2000, '1', '2020-11-12 02:15:20'),
(924, 'Formalin', 'TABLET', 'Obat Keras', 100, 1300, '1', '2020-11-12 02:15:20'),
(925, 'Furosemide tab', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(926, 'Fluconazole inf', 'BOTOL', 'Obat Keras', 100, 150150, '1', '2020-11-12 02:15:20'),
(927, 'Fenofibrate 200 mg', 'KAPSUL', 'Obat Keras', 100, 6100, '1', '2020-11-12 02:15:20'),
(928, 'Gentamycin Salep ', 'TUBE', 'Obat keras', 100, 4700, '1', '2020-11-12 02:15:20'),
(929, 'Gentamycin TM', 'BOTOL', 'Obat keras', 100, 4400, '1', '2020-11-12 02:15:20'),
(930, 'Glibenklamide', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(931, 'Glyceril Guaiacolat', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(932, 'Gentamicin inj', 'AMPUL', 'Obat Keras', 100, 28600, '1', '2020-11-12 02:15:20'),
(933, 'HCT', 'TABLET', 'Obat Keras', 100, 350, '1', '2020-11-12 02:15:20'),
(934, 'Hidrocortison 1%', 'TUBE', 'Obat keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(935, 'Hidrocortison 2,5 %', 'TUBE', 'Obat keras', 100, 11400, '1', '2020-11-12 02:15:20'),
(936, 'Isoniazide 300 mg', 'TABLET', 'Obat Keras', 100, 600, '1', '2020-11-12 02:15:20'),
(937, 'Isosorbite Dinitrate', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(938, 'Isoniazide 100 mg', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(939, 'Ibuprofen tablet', 'TABLET', 'Obat Keras', 100, 400, '1', '2020-11-12 02:15:20'),
(940, 'Ketorolac tab', 'TABLET', 'Obat Keras', 100, 4000, '1', '2020-11-12 02:15:20'),
(941, 'Kalium Diklofenak', 'TABLET', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(942, 'Kanamycin 1 g', 'VIAL', 'Obat Keras', 100, 15900, '1', '2020-11-12 02:15:20'),
(943, 'Ketokonazole tab', 'TABLET', 'Obat Keras', 100, 1000, '1', '2020-11-12 02:15:20'),
(944, 'Ketoprofen Tablet', 'TABLET', 'Obat Keras', 100, 1600, '1', '2020-11-12 02:15:20'),
(945, 'Ketoprofen Inj', 'AMPUL', 'Obat Keras', 100, 8800, '1', '2020-11-12 02:15:20'),
(946, 'Lanzoprazol', 'KAPSUL', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(947, 'Lidocain', 'AMPUL', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(948, 'Lincomycin 500', 'KAPSUL', 'Obat Keras', 100, 2500, '1', '2020-11-12 02:15:20'),
(949, 'Loratadine', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(950, 'Manitol 20%', 'BOTOL', 'Obat Keras', 100, 60500, '1', '2020-11-12 02:15:20'),
(951, 'Meloxicam 7,5', 'TABLET', 'Obat Keras', 100, 1300, '1', '2020-11-12 02:15:20'),
(952, 'Metformin', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(953, 'Methylprednisolone 4 mg', 'TABLET', 'Obat Keras', 100, 700, '1', '2020-11-12 02:15:20'),
(954, 'Metrix 1 mg', 'TABLET', 'Obat Keras', 100, 3500, '1', '2020-11-12 02:15:20'),
(955, 'Metrix 2 mg', 'TABLET', 'Obat Keras', 100, 5700, '1', '2020-11-12 02:15:20'),
(956, 'Metrix 3 mg', 'TABLET', 'Obat Keras', 100, 8000, '1', '2020-11-12 02:15:20'),
(957, 'Metrix 4 mg', 'TABLET', 'Obat Keras', 100, 9300, '1', '2020-11-12 02:15:20'),
(958, 'Metronidazol inf', 'BOTOL', 'Obat Keras', 100, 71500, '1', '2020-11-12 02:15:20'),
(959, 'Metronidazole tab', 'TABLET', 'Obat Keras', 100, 350, '1', '2020-11-12 02:15:20'),
(960, 'Metoclopramide', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(961, 'Methylerghometrine inj', 'AMPUL', 'Obat Keras', 100, 7800, '1', '2020-11-12 02:15:20'),
(962, 'NaCl 100 cc', 'BOTOL', 'Obat Keras', 100, 19700, '1', '2020-11-12 02:15:20'),
(963, 'NaCl 500 Otsu', 'BOTOL', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(964, 'Natrium Diklofenak 50 mg', 'TABLET', 'Obat Keras', 100, 700, '1', '2020-11-12 02:15:20'),
(965, 'Natrium Diklofenak 25 mg', 'TABLET', 'Obat Keras', 100, 600, '1', '2020-11-12 02:15:20'),
(966, 'Norephineprine Inj', 'VIAL', 'Obat Keras', 100, 85800, '1', '2020-11-12 02:15:20'),
(967, 'Ofloxacin 400 mg', 'TABLET', 'Obat Keras', 100, 1200, '1', '2020-11-12 02:15:20'),
(968, 'Omeprazole tab', 'TABLET', 'Obat Keras', 100, 800, '1', '2020-11-12 02:15:20'),
(969, 'Ondancetron tab 4 mg', 'TABLET', 'Obat Keras', 100, 1800, '1', '2020-11-12 02:15:20'),
(970, 'Ofloxacin 200 mg', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(971, 'Osflex LG', 'VIAL', 'Obat Keras', 100, 605000, '1', '2020-11-12 02:15:20'),
(972, 'Piracetam 400 mg', 'TABLET', 'Obat Keras', 100, 900, '1', '2020-11-12 02:15:20'),
(973, 'Piracetam 800 mg', 'TABLET', 'Obat Keras', 100, 1450, '1', '2020-11-12 02:15:20'),
(974, 'Piracetam 1 gr', 'AMPUL', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(975, 'Piracetam 3 g', 'AMPUL', 'Obat Keras', 100, 26800, '1', '2020-11-12 02:15:20'),
(976, 'Piracetam 1200 mg', 'TABLET', 'Obat Keras', 100, 2200, '1', '2020-11-12 02:15:20'),
(977, 'Primaquine Tab', 'TABLET', 'Obat Keras', 100, 400, '1', '2020-11-12 02:15:20'),
(978, 'Piroksikam 10', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(979, 'Prednison', 'TABLET', 'Obat Keras', 100, 350, '1', '2020-11-12 02:15:20'),
(980, 'Procain HCL', 'AMPUL', 'Obat Keras', 100, 5900, '1', '2020-11-12 02:15:20'),
(981, 'Propanolol 10 mg', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(982, 'PTU', 'TABLET', 'Obat Keras', 100, 700, '1', '2020-11-12 02:15:20'),
(983, 'Pyrantel', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(984, 'Pyrazinamide', 'TABLET', 'Obat Keras', 100, 600, '1', '2020-11-12 02:15:20'),
(985, 'Ottozole inj', 'VIAL', 'Obat Keras', 100, 196600, '1', '2020-11-12 02:15:20'),
(986, 'Penitoin', 'KAPSUL', 'Obat Keras', 100, 946, '1', '2020-11-12 02:15:20'),
(987, 'Pantoprazol tab 20 mg', 'TABLET', 'Obat Keras', 100, 11400, '1', '2020-11-12 02:15:20'),
(988, 'Pantoprazol tab 40 mg', 'TABLET', 'Obat Keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(989, 'Penitoin inj', 'AMPUL', 'Obat Keras', 100, 46500, '1', '2020-11-12 02:15:20'),
(990, 'Ranitidine inj', 'AMPUL', 'Obat Keras', 100, 9150, '1', '2020-11-12 02:15:20'),
(991, 'Ranitidine tab 150', 'TABLET', 'Obat Keras', 100, 350, '1', '2020-11-12 02:15:20'),
(992, 'Rifampicin 300', 'KAPSUL', 'Obat Keras', 100, 1600, '1', '2020-11-12 02:15:20'),
(993, 'Rifampicin 450', 'TABLET', 'Obat Keras', 100, 2400, '1', '2020-11-12 02:15:20'),
(994, 'Rifampicin 600', 'TABLET', 'Obat Keras', 100, 2900, '1', '2020-11-12 02:15:20'),
(995, 'Ringer Laktate', 'BOTOL', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(996, 'Salbutamol 4 mg', 'TABLET', 'Obat Keras', 100, 250, '1', '2020-11-12 02:15:20'),
(997, 'Streptomycin 1 g', 'VIAL', 'Obat Keras', 100, 11700, '1', '2020-11-12 02:15:20'),
(998, 'Salbutamol 2 mg', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(999, 'Tetracycline kapsul', 'KAPSUL', 'Obat Keras', 100, 1500, '1', '2020-11-12 02:15:20'),
(1000, 'Trihexyphenidyl HCL', 'TABLET', 'Obat Keras', 100, 200, '1', '2020-11-12 02:15:20'),
(1001, 'Thiamphenicol Syr', 'BOTOL', 'Obat Keras', 100, 9000, '1', '2020-11-12 02:15:20'),
(1002, 'Vitamin C Inj.', 'AMPUL', 'Obat Keras', 100, 18600, '1', '2020-11-12 02:15:20'),
(1003, 'Vitamin K Inj.', 'AMPUL', 'Obat Keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(1004, 'Ondancetron tab 8 mg ', 'TABLET', 'Obat Keras', 100, 7150, '1', '2020-11-12 02:15:20'),
(1005, 'Antihemoroid Supp', 'PCS', 'Obat Keras', 100, 4300, '1', '2020-11-12 02:15:20'),
(1006, 'Alinamin F', 'AMPUL', 'Obat Keras', 100, 24300, '1', '2020-11-12 02:15:20'),
(1007, 'Alinamin F Tab', 'TABLET', 'Obat Keras', 100, 1260, '1', '2020-11-12 02:15:20'),
(1008, 'Alloris', 'TABLET', 'Obat Keras', 100, 6600, '1', '2020-11-12 02:15:20'),
(1009, 'Aminofusin Pead', 'BOTOL', 'Obat Keras', 100, 84400, '1', '2020-11-12 02:15:20'),
(1010, 'Aminovel', 'BOTOL', 'Obat Keras', 100, 103000, '1', '2020-11-12 02:15:20'),
(1011, 'Amiparen', 'BOTOL', 'Obat Keras', 100, 108850, '1', '2020-11-12 02:15:20'),
(1012, 'Amoxan 500', 'KAPSUL', 'Obat Keras', 100, 4600, '1', '2020-11-12 02:15:20'),
(1013, 'Amoxsan 1 g', 'VIAL', 'Obat Keras', 100, 32000, '1', '2020-11-12 02:15:20'),
(1014, 'Amoxsan Drops', 'BOTOL', 'Obat Keras', 100, 32000, '1', '2020-11-12 02:15:20'),
(1015, 'Amoxsan Forte 250', 'BOTOL', 'Obat Keras', 100, 45800, '1', '2020-11-12 02:15:20'),
(1016, 'Amoxsan Sirup', 'BOTOL', 'Obat Keras', 100, 32200, '1', '2020-11-12 02:15:20'),
(1017, 'Angioten', 'TABLET', 'Obat Keras', 100, 14600, '1', '2020-11-12 02:15:20'),
(1018, 'Anvomer B6', 'TABLET', 'Obat Keras', 100, 3100, '1', '2020-11-12 02:15:20'),
(1019, 'Arcapec', 'TABLET', 'Obat Keras', 100, 1500, '1', '2020-11-12 02:15:20'),
(1020, 'Ardium', 'TABLET', 'Obat Keras', 100, 10200, '1', '2020-11-12 02:15:20'),
(1021, 'Avamys', 'BOTOL', 'Obat keras', 100, 185900, '1', '2020-11-12 02:15:20'),
(1022, 'Ascardia 160', 'TABLET', 'Obat Keras', 100, 2240, '1', '2020-11-12 02:15:20'),
(1023, 'Ascardia 80', 'TABLET', 'Obat Keras', 100, 2240, '1', '2020-11-12 02:15:20'),
(1024, 'Asering', 'BOTOL', 'Obat Keras', 100, 25200, '1', '2020-11-12 02:15:20'),
(1025, 'Aspar K', 'TABLET', 'Obat Keras', 100, 3500, '1', '2020-11-12 02:15:20'),
(1026, 'Aspilets thrombo', 'TABLET', 'Obat Keras', 100, 1300, '1', '2020-11-12 02:15:20'),
(1027, 'Asthin Force', 'KAPSUL', 'Obat Keras', 100, 9300, '1', '2020-11-12 02:15:20'),
(1028, 'Artrilox 15', 'TABLET', 'Obat Keras', 100, 9100, '1', '2020-11-12 02:15:20'),
(1029, 'Artrilox 7,5', 'TABLET', 'Obat Keras', 100, 5500, '1', '2020-11-12 02:15:20'),
(1030, 'Anerocid ', 'KAPSUL', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1031, 'Azol', 'TABLET', 'Obat Keras', 100, 20850, '1', '2020-11-12 02:15:20'),
(1032, 'Alpentin 300 mg', 'TABLET', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1033, 'Aminoral kaplet', 'TABLET', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1034, 'Atrodar', 'TABLET', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1035, 'Aminoleban', 'BOTOL', 'Obat Keras', 100, 267400, '1', '2020-11-12 02:15:20'),
(1036, 'Atorsan', 'TABLET', 'Obat Keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(1037, 'Argesid', 'TABLET', 'Obat Keras', 100, 1300, '1', '2020-11-12 02:15:20'),
(1038, 'Astadiab', 'TABLET', 'Obat Keras', 100, 11400, '1', '2020-11-12 02:15:20'),
(1039, 'Anbiolid', 'TABLET', 'Obat Keras', 100, 7900, '1', '2020-11-12 02:15:20'),
(1040, 'Arixtra', 'AMPUL', 'Obat Keras', 100, 455950, '1', '2020-11-12 02:15:20'),
(1041, 'Astacor', 'KAPSUL', 'Obat Keras', 100, 11450, '1', '2020-11-12 02:15:20'),
(1042, 'Artoflam', 'KAPSUL', 'Obat Keras', 100, 7900, '1', '2020-11-12 02:15:20'),
(1043, 'Azomax 500', 'TABLET', 'Obat Keras', 100, 40700, '1', '2020-11-12 02:15:20'),
(1044, 'Alovell 70 mg', 'TABLET', 'Obat Keras', 100, 121550, '1', '2020-11-12 02:15:20'),
(1045, 'Azomax syr', 'BOTOL', 'Obat Keras', 100, 114400, '1', '2020-11-12 02:15:20'),
(1046, 'Antiplat', 'KAPLET', 'Obat Keras', 100, 8300, '1', '2020-11-12 02:15:20'),
(1047, 'Astria ', 'KAPSUL', 'Obat Keras', 100, 12200, '1', '2020-11-12 02:15:20'),
(1048, 'Amaryl 1 mg', 'TABLET', 'Obat Keras', 100, 3900, '1', '2020-11-12 02:15:20'),
(1049, 'Amaryl 2 mg', 'TABLET', 'Obat Keras', 100, 6900, '1', '2020-11-12 02:15:20'),
(1050, 'Amaryl 3 mg', 'TABLET', 'Obat Keras', 100, 9200, '1', '2020-11-12 02:15:20'),
(1051, 'Amaryl 4 mg', 'TABLET', 'Obat Keras', 100, 10450, '1', '2020-11-12 02:15:20'),
(1052, 'Amaryl M 250 mg', 'TABLET', 'Obat Keras', 100, 3900, '1', '2020-11-12 02:15:20'),
(1053, 'Amaryl M 500 mg', 'TABLET', 'Obat Keras', 100, 6900, '1', '2020-11-12 02:15:20'),
(1054, 'Amiclav', 'TABLET', 'Obat Keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(1055, 'Acran inj', 'AMPUL', 'Obat Keras', 100, 29800, '1', '2020-11-12 02:15:20'),
(1056, 'Bacbutinh Forte', 'TABLET', 'Obat Keras', 100, 2800, '1', '2020-11-12 02:15:20'),
(1057, 'Baquinor Forte', 'TABLET', 'Obat Keras', 100, 19400, '1', '2020-11-12 02:15:20'),
(1058, 'Baquinor inf', 'BOTOL', 'Obat Keras', 100, 331400, '1', '2020-11-12 02:15:20'),
(1059, 'Becom C', 'TABLET', 'Obat Keras', 100, 20400, '1', '2020-11-12 02:15:20'),
(1060, 'Becom Zet', 'TABLET', 'Obat Keras', 100, 2700, '1', '2020-11-12 02:15:20'),
(1061, 'Becombion Forte', 'TABLET', 'Obat Keras', 100, 900, '1', '2020-11-12 02:15:20'),
(1062, 'Benoson G', 'TUBE', 'Obat keras', 100, 81900, '1', '2020-11-12 02:15:20'),
(1063, 'Benoson M', 'TUBE', 'Obat keras', 100, 84500, '1', '2020-11-12 02:15:20'),
(1064, 'Benoson N 5 gr', 'TUBE', 'Obat keras', 100, 20800, '1', '2020-11-12 02:15:20'),
(1065, 'Biocef', 'VIAL', 'Obat Keras', 100, 228800, '1', '2020-11-12 02:15:20'),
(1066, 'Biodasin', 'KAPSUL', 'Obat Keras', 100, 8150, '1', '2020-11-12 02:15:20'),
(1067, 'Biolincom Botol', 'BOTOL', 'Obat Keras', 100, 71500, '1', '2020-11-12 02:15:20'),
(1068, 'Bioplacenton', 'TUBE', 'Obat keras', 100, 20700, '1', '2020-11-12 02:15:20'),
(1069, 'Biothicol sirup', 'BOTOL', 'Obat Keras', 100, 29900, '1', '2020-11-12 02:15:20'),
(1070, 'Biothicol tab', 'KAPSUL', 'Obat Keras', 100, 5200, '1', '2020-11-12 02:15:20'),
(1071, 'Bioxon', 'VIAL', 'Obat Keras', 100, 300300, '1', '2020-11-12 02:15:20'),
(1072, 'Borraginol N cream', 'TUBE', 'Obat keras', 100, 80700, '1', '2020-11-12 02:15:20'),
(1073, 'Borraginol N Supp.', 'PCS', 'Obat keras', 100, 12700, '1', '2020-11-12 02:15:20'),
(1074, 'Borraginol S cream', 'TUBE', 'Obat keras', 100, 108700, '1', '2020-11-12 02:15:20'),
(1075, 'Borraginol S Suppositoria', 'PCS', 'Obat keras', 100, 15200, '1', '2020-11-12 02:15:20'),
(1076, 'Brainact Inj.', 'AMPUL', 'Obat Keras', 100, 95200, '1', '2020-11-12 02:15:20'),
(1077, 'Brainact tab 500', 'TABLET', 'Obat Keras', 100, 17900, '1', '2020-11-12 02:15:20'),
(1078, 'Broadced', 'VIAL', 'Obat Keras', 100, 278850, '1', '2020-11-12 02:15:20'),
(1079, 'Bisolvon', 'VIAL', 'Obat Keras', 100, 55650, '1', '2020-11-12 02:15:20'),
(1080, 'Bronchophylin Elixir', 'BOTOL', 'Obat Keras', 100, 23600, '1', '2020-11-12 02:15:20'),
(1081, 'Bronchopront', 'BOTOL', 'Obat Keras', 100, 69200, '1', '2020-11-12 02:15:20'),
(1082, 'Burnazin', 'TUBE', 'Obat keras', 100, 75800, '1', '2020-11-12 02:15:20'),
(1083, 'Brainact Sachet', 'SACHET', 'Obat Keras', 100, 27200, '1', '2020-11-12 02:15:20'),
(1084, 'Bactoderm Cream', 'TUBE', 'Obat keras', 100, 47000, '1', '2020-11-12 02:15:20'),
(1085, 'Biolincom ', 'KAPSUL', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1086, 'Bisolvon solution', 'ML', 'Obat Keras', 100, 1800, '1', '2020-11-12 02:15:20'),
(1087, 'Benoson N 15 gr', 'TUBE', 'Obat keras', 100, 25000, '1', '2020-11-12 02:15:20'),
(1088, 'Benodon inj', 'VIAL', 'Obat Keras', 100, 10700, '1', '2020-11-12 02:15:20'),
(1089, 'Clofritis tab', 'TABLET', 'Obat Keras', 100, 2400, '1', '2020-11-12 02:15:20'),
(1090, 'Cetirizin Drops', 'BOX', 'Obat keras', 100, 35800, '1', '2020-11-12 02:15:20'),
(1091, 'Cefila - 200', 'KAPSUL', 'Obat Keras', 100, 42900, '1', '2020-11-12 02:15:20'),
(1092, 'Catapres', 'AMPUL', 'Obat Keras', 100, 56900, '1', '2020-11-12 02:15:20'),
(1093, 'Catapres 150', 'TABLET', 'Obat Keras', 100, 5100, '1', '2020-11-12 02:15:20'),
(1094, 'Catapres 75', 'TABLET', 'Obat Keras', 100, 3900, '1', '2020-11-12 02:15:20'),
(1095, 'Cedantron tab', 'TABLET', 'Obat Keras', 100, 31500, '1', '2020-11-12 02:15:20'),
(1096, 'Cedantron 4', 'AMPUL', 'Obat Keras', 100, 41475, '1', '2020-11-12 02:15:20'),
(1097, 'Cedantron 8', 'AMPUL', 'Obat Keras', 100, 85800, '1', '2020-11-12 02:15:20'),
(1098, 'Cedocard 5', 'TABLET', 'Obat Keras', 100, 1650, '1', '2020-11-12 02:15:20'),
(1099, 'Cefat syr ', 'BOTOL', 'Obat Keras', 100, 61300, '1', '2020-11-12 02:15:20'),
(1100, 'Cefat tab 500 ', 'KAPSUL', 'Obat Keras', 100, 14500, '1', '2020-11-12 02:15:20'),
(1101, 'Cefspan tab 100', 'KAPSUL', 'Obat Keras', 100, 32900, '1', '2020-11-12 02:15:20'),
(1102, 'Celebrex 200', 'KAPSUL', 'Obat Keras', 100, 16200, '1', '2020-11-12 02:15:20'),
(1103, 'Celestamin syr 60 ml', 'BOTOL', 'Obat Keras', 100, 78650, '1', '2020-11-12 02:15:20'),
(1104, 'Cendo Xitrol salp', 'TUBE', 'Obat keras', 100, 54300, '1', '2020-11-12 02:15:20'),
(1105, 'Cendo Xitrol ED', 'BOTOL', 'Obat keras', 100, 47200, '1', '2020-11-12 02:15:20'),
(1106, 'Cerini', 'TABLET', 'Obat Keras', 100, 4900, '1', '2020-11-12 02:15:20'),
(1107, 'Cetalgin T', 'TABLET', 'Obat Keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(1108, 'Cholestate 10', 'TABLET', 'Obat Keras', 100, 5700, '1', '2020-11-12 02:15:20'),
(1109, 'Cholvastin', 'TABLET', 'Obat Keras', 100, 14200, '1', '2020-11-12 02:15:20'),
(1110, 'Cinolon Cream', 'TUBE', 'Obat keras', 100, 23400, '1', '2020-11-12 02:15:20'),
(1111, 'Cinolon N', 'TUBE', 'Obat keras', 100, 26400, '1', '2020-11-12 02:15:20'),
(1112, 'Combiven', 'PCS', 'Obat keras', 100, 16100, '1', '2020-11-12 02:15:20'),
(1113, 'Claneksi 500', 'TABLET', 'Obat Keras', 100, 16800, '1', '2020-11-12 02:15:20'),
(1114, 'Claneksi Forte', 'BOTOL', 'Obat Keras', 100, 100600, '1', '2020-11-12 02:15:20'),
(1115, 'Colsancetine inj', 'VIAL', 'Obat Keras', 100, 20000, '1', '2020-11-12 02:15:20'),
(1116, 'Colsancetine sirup', 'BOTOL', 'Obat Keras', 100, 15400, '1', '2020-11-12 02:15:20'),
(1117, 'Comafusin Hepar', 'BOTOL', 'Obat Keras', 100, 245900, '1', '2020-11-12 02:15:20'),
(1118, 'Compraz', 'KAPSUL', 'Obat Keras', 100, 18000, '1', '2020-11-12 02:15:20'),
(1119, 'Comtusi strawberi', 'BOTOL', 'Obat Keras', 100, 50200, '1', '2020-11-12 02:15:20'),
(1120, 'Comtusi 100 ml', 'BOTOL', 'Obat Keras', 100, 75200, '1', '2020-11-12 02:15:20'),
(1121, 'Cortidex tab', 'TABLET', 'Obat Keras', 100, 400, '1', '2020-11-12 02:15:20'),
(1122, 'Cravit', 'TABLET', 'Obat Keras', 100, 52900, '1', '2020-11-12 02:15:20'),
(1123, 'Cravox inf 500 mg', 'BOTOL', 'Obat Keras', 100, 378950, '1', '2020-11-12 02:15:20'),
(1124, 'Cravox tab 500 mg', 'TABLET', 'Obat Keras', 100, 53600, '1', '2020-11-12 02:15:20'),
(1125, 'Camidryl inj', 'VIAL', 'Obat Keras', 100, 6400, '1', '2020-11-12 02:15:20'),
(1126, 'Criax', 'VIAL', 'Obat Keras', 100, 264550, '1', '2020-11-12 02:15:20'),
(1127, 'Cyclofem', 'VIAL', 'Obat Keras', 100, 13000, '1', '2020-11-12 02:15:20'),
(1128, 'Crome Amp', 'AMPUL', 'Obat Keras', 100, 28600, '1', '2020-11-12 02:15:20'),
(1129, 'CPG', 'TABLET', 'Obat Keras', 100, 21450, '1', '2020-11-12 02:15:20'),
(1130, 'Crome tab', 'TABLET', 'Obat keras', 100, 2900, '1', '2020-11-12 02:15:20'),
(1131, 'Cefspan syr', 'BOTOL', 'Obat Keras', 100, 131600, '1', '2020-11-12 02:15:20'),
(1132, 'Cefxon', 'VIAL', 'Obat Keras', 100, 300300, '1', '2020-11-12 02:15:20'),
(1133, 'Claneksi sirup', 'BOTOL', 'Obat Keras', 100, 75800, '1', '2020-11-12 02:15:20'),
(1134, 'Cortidex inj', 'AMPUL', 'Obat Keras', 100, 8900, '1', '2020-11-12 02:15:20'),
(1135, 'Cardisan 5 mg', 'TABLET', 'Obat Keras', 100, 8300, '1', '2020-11-12 02:15:20'),
(1136, 'Cetafloxo tab', 'TABLET', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(1137, 'Celestamin 30 ml', 'BOTOL', 'Obat Keras', 100, 45700, '1', '2020-11-12 02:15:20'),
(1138, 'Cetafloxo infus', 'BOTOL', 'Obat Keras', 100, 257400, '1', '2020-11-12 02:15:20');
INSERT INTO `b_obat` (`id`, `nama_obat`, `satuan`, `jenis_obat`, `stok`, `harga`, `is_active`, `timestamp`) VALUES
(1139, 'Cinogenta crem', 'TUBE', 'Obat keras', 100, 50000, '1', '2020-11-12 02:15:20'),
(1140, 'Cefratam', 'VIAL', 'Obat Keras', 100, 214500, '1', '2020-11-12 02:15:20'),
(1141, 'Citicoline 500 inj', 'AMPUL', 'Obat Keras', 100, 40000, '1', '2020-11-12 02:15:20'),
(1142, 'Cravox inf 750 mg', 'BOTOL', 'Obat Keras', 100, 486200, '1', '2020-11-12 02:15:20'),
(1143, 'Desolex crem', 'TUBE', 'Obat Keras', 100, 29600, '1', '2020-11-12 02:15:20'),
(1144, 'Desolex -N Crem', 'TUBE', 'Obat Keras', 100, 37000, '1', '2020-11-12 02:15:20'),
(1145, 'Dextran', 'FLES', 'Obat Keras', 100, 99600, '1', '2020-11-12 02:15:20'),
(1146, 'Diabex', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(1147, 'Difloxin', 'TABLET', 'Obat Keras', 100, 47200, '1', '2020-11-12 02:15:20'),
(1148, 'Dilantin', 'KAPSUL', 'Obat Keras', 100, 5000, '1', '2020-11-12 02:15:20'),
(1149, 'Disflatyl', 'TABLET', 'Obat Keras', 100, 750, '1', '2020-11-12 02:15:20'),
(1150, 'Divask 10', 'TABLET', 'Obat Keras', 100, 15000, '1', '2020-11-12 02:15:20'),
(1151, 'Divask 5', 'TABLET', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1152, 'Dobuject', 'AMPUL', 'Obat Keras', 100, 190200, '1', '2020-11-12 02:15:20'),
(1153, 'Dopac', 'AMPUL', 'Obat Keras', 100, 60000, '1', '2020-11-12 02:15:20'),
(1154, 'Dramamine', 'TABLET', 'Obat Keras', 100, 2700, '1', '2020-11-12 02:15:20'),
(1155, 'Duvadilan', 'AMPUL', 'Obat Keras', 100, 33400, '1', '2020-11-12 02:15:20'),
(1156, 'Duvadilan Tab', 'TABLET', 'Obat Keras', 100, 7000, '1', '2020-11-12 02:15:20'),
(1157, 'Domperidon', 'TABLET', 'Obat Keras', 100, 600, '1', '2020-11-12 02:15:20'),
(1158, 'Decain 4 ml', 'VIAL', 'Obat Keras', 100, 77250, '1', '2020-11-12 02:15:20'),
(1159, 'Dumin 125 mg', 'PCS', 'Obat keras', 100, 17100, '1', '2020-11-12 02:15:20'),
(1160, 'dumin 250 mg', 'PCS', 'Obat keras', 100, 22300, '1', '2020-11-12 02:15:20'),
(1161, 'Dentacid', 'TABLET', 'Obat Keras', 100, 1600, '1', '2020-11-12 02:15:20'),
(1162, 'Dopamet tab', 'TABLET', 'Obat Keras', 100, 2600, '1', '2020-11-12 02:15:20'),
(1163, 'Dexaflox 400 mg', 'TABLET', 'Obat Keras', 100, 34350, '1', '2020-11-12 02:15:20'),
(1164, 'Dexametason inj', 'AMPUL', 'Obat Keras', 100, 3600, '1', '2020-11-12 02:15:20'),
(1165, 'Debostin tab', 'TABLET', 'Obat Keras', 100, 20000, '1', '2020-11-12 02:15:20'),
(1166, 'Degrade', 'TABLET', 'Obat Keras', 100, 9300, '1', '2020-11-12 02:15:20'),
(1167, 'Dextafen ', 'TABLET', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(1168, 'Diaformin xr', 'KAPSUL', 'Obat Keras', 100, 2600, '1', '2020-11-12 02:15:20'),
(1169, 'Encephabol', 'TABLET', 'Obat Keras', 100, 3650, '1', '2020-11-12 02:15:20'),
(1170, 'Encephabol Sirup', 'BOTOL', 'Obat Keras', 100, 80250, '1', '2020-11-12 02:15:20'),
(1171, 'Epexol tab', 'TABLET', 'Obat Keras', 100, 1200, '1', '2020-11-12 02:15:20'),
(1172, 'Epexol sirup', 'BOTOL', 'Obat Keras', 100, 24700, '1', '2020-11-12 02:15:20'),
(1173, 'Edotin', 'TABLET', 'Obat Keras', 100, 5250, '1', '2020-11-12 02:15:20'),
(1174, 'Eprinoc', 'TABLET', 'Obat Keras', 100, 4900, '1', '2020-11-12 02:15:20'),
(1175, 'Ergotika 1 mg', 'TABLET', 'Obat Keras', 100, 1800, '1', '2020-11-12 02:15:20'),
(1176, 'Ergotika 4,5 mg', 'TABLET', 'Obat Keras', 100, 8400, '1', '2020-11-12 02:15:20'),
(1177, 'Erysanbe 500', 'TABLET', 'Obat Keras', 100, 3800, '1', '2020-11-12 02:15:20'),
(1178, 'Erysanbe sirup', 'BOTOL', 'Obat Keras', 100, 31700, '1', '2020-11-12 02:15:20'),
(1179, 'Euphyllin retard mite', 'TABLET', 'Obat keras', 100, 4720, '1', '2020-11-12 02:15:20'),
(1180, 'Exaflam', 'TABLET', 'Obat keras', 100, 2600, '1', '2020-11-12 02:15:20'),
(1181, 'Epexol Drop', 'BOTOL', 'Obat keras', 100, 53700, '1', '2020-11-12 02:15:20'),
(1182, 'Extrace inj', 'AMPUL', 'Obat Keras', 100, 11500, '1', '2020-11-12 02:15:20'),
(1183, 'Eflagen 25 mg', 'TABLET', 'Obat Keras', 100, 1800, '1', '2020-11-12 02:15:20'),
(1184, 'Eflagen 50 mg', 'TABLET', 'Obat Keras', 100, 2900, '1', '2020-11-12 02:15:20'),
(1185, 'Esofer inj', 'VIAL', 'Obat Keras', 100, 193050, '1', '2020-11-12 02:15:20'),
(1186, 'Esomax inj', 'VIAL', 'Obat Keras', 100, 214500, '1', '2020-11-12 02:15:20'),
(1187, 'Famocid', 'TABLET', 'Obat keras', 100, 5200, '1', '2020-11-12 02:15:20'),
(1188, 'Fansidar', 'TABLET', 'Obat keras', 100, 14300, '1', '2020-11-12 02:15:20'),
(1189, 'Farsix Tab', 'TABLET', 'Obat keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(1190, 'Fludexin', 'TABLET', 'Obat Keras', 100, 800, '1', '2020-11-12 02:15:20'),
(1191, 'Fludexin Sirup', 'BOTOL', 'Obat Keras', 100, 30000, '1', '2020-11-12 02:15:20'),
(1192, 'Fluimucil', 'TABLET', 'Obat Keras', 100, 4300, '1', '2020-11-12 02:15:20'),
(1193, 'Forbetes 850', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(1194, 'Fordesia', 'TABLET', 'Obat Keras', 100, 31400, '1', '2020-11-12 02:15:20'),
(1195, 'Forres', 'TABLET', 'Obat Keras', 100, 6300, '1', '2020-11-12 02:15:20'),
(1196, 'Fosmycin', 'VIAL', 'Obat Keras', 100, 250250, '1', '2020-11-12 02:15:20'),
(1197, 'Frego', 'TABLET', 'Obat Keras', 100, 8300, '1', '2020-11-12 02:15:20'),
(1198, 'Forbetes 500', 'TABLET', 'Obat Keras', 100, 1300, '1', '2020-11-12 02:15:20'),
(1199, 'Formuno', 'TABLET', 'Obat Keras', 100, 9700, '1', '2020-11-12 02:15:20'),
(1200, 'Flamicort', 'ML', 'Obat Keras', 100, 32300, '1', '2020-11-12 02:15:20'),
(1201, 'Fucotrap', 'KAPSUL', 'Obat Keras', 100, 11900, '1', '2020-11-12 02:15:20'),
(1202, 'Flucadex', 'BOTOL', 'Obat Keras', 100, 7000, '1', '2020-11-12 02:15:20'),
(1203, 'Fozran 4 mg', 'AMPUL', 'Obat Keras', 100, 25750, '1', '2020-11-12 02:15:20'),
(1204, 'Flagyl forte', 'TABLET', 'Obat Keras', 100, 7800, '1', '2020-11-12 02:15:20'),
(1205, 'Furamin inj', 'AMPUL', 'Obat Keras', 100, 16800, '1', '2020-11-12 02:15:20'),
(1206, 'Genalten Crem', 'TUBE', 'Obat keras', 100, 2900, '1', '2020-11-12 02:15:20'),
(1207, 'Glucophage 500', 'TABLET', 'Obat Keras', 100, 1350, '1', '2020-11-12 02:15:20'),
(1208, 'Glukotika', 'TABLET', 'Obat Keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(1209, 'Glurenorm', 'TABLET', 'Obat Keras', 100, 3700, '1', '2020-11-12 02:15:20'),
(1210, 'Glukobay', 'TABLET', 'Obat Keras', 100, 2300, '1', '2020-11-12 02:15:20'),
(1211, 'Govotil 2 mg', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(1212, 'Goflek', 'TABLET', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1213, 'Farmadol inf', 'BOTOL', 'Obat Keras', 100, 78650, '1', '2020-11-12 02:15:20'),
(1214, 'Gastrofer', 'VIAL', 'Obat Keras', 100, 164450, '1', '2020-11-12 02:15:20'),
(1215, 'Glutrop', 'TABLET', 'Obat Keras', 100, 14200, '1', '2020-11-12 02:15:20'),
(1216, 'Glubose 100 mg', 'TABLET', 'Obat Keras', 100, 2200, '1', '2020-11-12 02:15:20'),
(1217, 'Ganin', 'KAPSUL', 'Obat Keras', 100, 11750, '1', '2020-11-12 02:15:20'),
(1218, 'Gliaride 2', 'KAPSUL', 'Obat Keras', 100, 5700, '1', '2020-11-12 02:15:20'),
(1219, 'Gliaride 3', 'KAPSUL', 'Obat Keras', 100, 7100, '1', '2020-11-12 02:15:20'),
(1220, 'Glucopahage XR 750 mg', 'TABLET', 'Obat Keras', 100, 2900, '1', '2020-11-12 02:15:20'),
(1221, 'Glucophage XR 1000 mg', 'TABLET', 'Obat Keras', 100, 4100, '1', '2020-11-12 02:15:20'),
(1222, 'Harnal tab 0,2 mg', 'TABLET', 'Obat Keras', 100, 21100, '1', '2020-11-12 02:15:20'),
(1223, 'Heptasan', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(1224, 'Herbesser 100', 'KAPSUL', 'Obat Keras', 100, 10450, '1', '2020-11-12 02:15:20'),
(1225, 'Herbesser 30', 'TABLET', 'Obat Keras', 100, 3550, '1', '2020-11-12 02:15:20'),
(1226, 'Histapan', 'TABLET', 'Obat Keras', 100, 950, '1', '2020-11-12 02:15:20'),
(1227, 'Hidrea Cap', 'KAPSUL', 'Obat Keras', 100, 21000, '1', '2020-11-12 02:15:20'),
(1228, 'Spiriva + Handihaler', 'PCS', 'Obat Keras', 100, 264500, '1', '2020-11-12 02:15:20'),
(1229, 'Histrine tab', 'TABLET', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(1230, 'Hufralgin tab', 'TABLET', 'Obat Keras', 100, 600, '1', '2020-11-12 02:15:20'),
(1231, 'Hexymer 2', 'TABLET', 'Obat Keras', 100, 1500, '1', '2020-11-12 02:15:20'),
(1232, 'Ikaneuron 5000 inj', 'AMPUL', 'Obat Keras', 100, 6500, '1', '2020-11-12 02:15:20'),
(1233, 'Iliadin Spray 0,5 mg', 'BOTOL', 'Obat keras', 100, 75000, '1', '2020-11-12 02:15:20'),
(1234, 'Infeld Gel', 'TUBE', 'Obat keras', 100, 24800, '1', '2020-11-12 02:15:20'),
(1235, 'Infusan D5 500 Sanbe', 'FLS', 'Obat Keras', 100, 26600, '1', '2020-11-12 02:15:20'),
(1236, 'Inpepsa', 'BOTOL', 'Obat Keras', 100, 65800, '1', '2020-11-12 02:15:20'),
(1237, 'Ikaphen', 'KAPSUL', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(1238, 'Indoralit', 'SACHET', 'Obat Keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(1239, 'Itramol', 'BOTOL', 'Obat Keras', 100, 3000, '1', '2020-11-12 02:15:20'),
(1240, 'Infusan RL Sanbe', 'FLS', 'Obat Keras', 100, 25600, '1', '2020-11-12 02:15:20'),
(1241, 'Infusan D5 100 Sanbe', 'FLS', 'Obat Keras', 100, 23700, '1', '2020-11-12 02:15:20'),
(1242, 'Infusan NS 100 Sanbe', 'FLS', 'Obat Keras', 100, 24300, '1', '2020-11-12 02:15:20'),
(1243, 'Infusan Ring-As', 'FLS', 'Obat Keras', 100, 31600, '1', '2020-11-12 02:15:20'),
(1244, 'Infusan Futrolit', 'BOTOL', 'Obat Keras', 100, 83700, '1', '2020-11-12 02:15:20'),
(1245, 'Inodex inj', 'AMPUL', 'Obat Keras', 100, 131600, '1', '2020-11-12 02:15:20'),
(1246, 'INH ciba 300', 'TABLET', 'Obat Keras', 100, 1000, '1', '2020-11-12 02:15:20'),
(1247, 'INH 400 mg', 'TABLET', 'Obat Keras', 100, 1000, '1', '2020-11-12 02:15:20'),
(1248, 'KAEN 3 B', 'FLS', 'Obat Keras', 100, 23500, '1', '2020-11-12 02:15:20'),
(1249, 'KAEN I B', 'BOTOL', 'Obat Keras', 100, 26450, '1', '2020-11-12 02:15:20'),
(1250, 'KAEN MG 3', 'BOTOL', 'Obat Keras', 100, 21150, '1', '2020-11-12 02:15:20'),
(1251, 'Kaflam 25 mg', 'TABLET', 'Obat Keras', 100, 2600, '1', '2020-11-12 02:15:20'),
(1252, 'Kaflam 50 mg', 'TABLET', 'Obat Keras', 100, 4800, '1', '2020-11-12 02:15:20'),
(1253, 'Kalfoxim', 'VIAL', 'Obat Keras', 100, 200200, '1', '2020-11-12 02:15:20'),
(1254, 'Kalmeco 500', 'KAPSUL', 'Obat Keras', 100, 4000, '1', '2020-11-12 02:15:20'),
(1255, 'Kalmethasone inj', 'AMPUL', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1256, 'Kalnex tab', 'TABLET', 'Obat Keras', 100, 4600, '1', '2020-11-12 02:15:20'),
(1257, 'Kalnex inj 500 mg', 'AMPUL', 'Obat Keras', 100, 18900, '1', '2020-11-12 02:15:20'),
(1258, 'Kaltrofen tab ', 'TABLET', 'Obat Keras', 100, 6400, '1', '2020-11-12 02:15:20'),
(1259, 'Kaltrofen inj 50', 'AMPUL', 'Obat Keras', 100, 35750, '1', '2020-11-12 02:15:20'),
(1260, 'Kaltrofen Supp', 'PCS', 'Obat keras', 100, 17800, '1', '2020-11-12 02:15:20'),
(1261, 'Kenacort A', 'CC', 'Obat Keras', 100, 18500, '1', '2020-11-12 02:15:20'),
(1262, 'Kenalog in Orabase', 'TUBE', 'Obat keras', 100, 78000, '1', '2020-11-12 02:15:20'),
(1263, 'Ketosteril', 'KAPSUL', 'Obat Keras', 100, 13500, '1', '2020-11-12 02:15:20'),
(1264, 'Ketricin Oralbase 0,1 %', 'TUBE', 'Obat keras', 100, 33600, '1', '2020-11-12 02:15:20'),
(1265, 'Kloderma 10 g', 'TUBE', 'Obat keras', 100, 39300, '1', '2020-11-12 02:15:20'),
(1266, 'Kolkatriol 0,25 mg', 'TABLET', 'Obat Keras', 100, 8400, '1', '2020-11-12 02:15:20'),
(1267, 'KSR', 'TABLET', 'Obat Keras', 100, 5800, '1', '2020-11-12 02:15:20'),
(1268, 'Kalmoxilin 500', 'TABLET', 'Obat Keras', 100, 3900, '1', '2020-11-12 02:15:20'),
(1269, 'Ketesse', 'TABLET', 'Obat Keras', 100, 11400, '1', '2020-11-12 02:15:20'),
(1270, 'Kemicetin Tetes Telinga', 'BOTOL', 'Obat keras', 100, 11750, '1', '2020-11-12 02:15:20'),
(1271, 'Kalmicetin Salep Kulit', 'TUBE', 'Obat keras', 100, 13400, '1', '2020-11-12 02:15:20'),
(1272, 'Kemicetin Salep mata', 'TUBE', 'Obat keras', 100, 4300, '1', '2020-11-12 02:15:20'),
(1273, 'Ketesse inj', 'AMPUL', 'Obat Keras', 100, 67200, '1', '2020-11-12 02:15:20'),
(1274, 'kutoin inj', 'AMPUL', 'Obat Keras', 100, 18600, '1', '2020-11-12 02:15:20'),
(1275, 'Kalkurenal drof', 'BOTOL', 'Obat Keras', 100, 188500, '1', '2020-11-12 02:15:20'),
(1276, 'Laprosin tablet', 'TABLET', 'Obat Keras', 100, 12800, '1', '2020-11-12 02:15:20'),
(1277, 'Lametik inj', 'AMPUL', 'Obat Keras', 100, 42900, '1', '2020-11-12 02:15:20'),
(1278, 'Lifen ', 'KAPSUL', 'Obat Keras', 100, 15750, '1', '2020-11-12 02:15:20'),
(1279, 'Losartan', 'TABLET', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(1280, 'Laktafit', 'TABLET', 'Obat Keras', 100, 3500, '1', '2020-11-12 02:15:20'),
(1281, 'Lameson 8', 'TABLET', 'Obat Keras', 100, 7900, '1', '2020-11-12 02:15:20'),
(1282, 'Lancef', 'VIAL', 'Obat Keras', 100, 193000, '1', '2020-11-12 02:15:20'),
(1283, 'Lanturol', 'KAPSUL', 'Obat Keras', 100, 6800, '1', '2020-11-12 02:15:20'),
(1284, 'Lapibal inj', 'AMPUL', 'Obat Keras', 100, 35750, '1', '2020-11-12 02:15:20'),
(1285, 'Lapraz', 'KAPSUL', 'Obat Keras', 100, 16700, '1', '2020-11-12 02:15:20'),
(1286, 'Lasix Inj.', 'AMPUL', 'Obat Keras', 100, 19700, '1', '2020-11-12 02:15:20'),
(1287, 'Levemir', 'SYRINGE', 'Obat Keras', 100, 223500, '1', '2020-11-12 02:15:20'),
(1288, 'Lasix tab', 'TABLET', 'Obat Keras', 100, 5800, '1', '2020-11-12 02:15:20'),
(1289, 'Letonal 100', 'TABLET', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(1290, 'Letonal 25', 'TABLET', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(1291, 'Levopront syr', 'BOTOL', 'Obat Keras', 100, 85800, '1', '2020-11-12 02:15:20'),
(1292, 'Lexa', 'TABLET', 'Obat Keras', 100, 51000, '1', '2020-11-12 02:15:20'),
(1293, 'Lodia', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(1294, 'Lutenyl', 'TABLET', 'Obat Keras', 100, 18200, '1', '2020-11-12 02:15:20'),
(1295, 'Lynoral', 'TABLET', 'Obat Keras', 100, 1950, '1', '2020-11-12 02:15:20'),
(1296, 'Lameson inj 125 mg', 'VIAL', 'Obat Keras', 100, 135850, '1', '2020-11-12 02:15:20'),
(1297, 'Lameson 4 mg ', 'TABLET', 'Obat Keras', 100, 4800, '1', '2020-11-12 02:15:20'),
(1298, 'Levofloksasin tab', 'TABLET', 'Obat Keras', 100, 1700, '1', '2020-11-12 02:15:20'),
(1299, 'Lantipain inj', 'AMPUL', 'Obat Keras', 100, 52900, '1', '2020-11-12 02:15:20'),
(1300, 'L Q 500', 'TABLET', 'Obat Keras', 100, 42900, '1', '2020-11-12 02:15:20'),
(1301, 'LDLOX', 'KAPSUL', 'Obat Keras', 100, 11000, '1', '2020-11-12 02:15:20'),
(1302, 'Lapibal  tab 500', 'KAPSUL', 'Obat Keras', 100, 3300, '1', '2020-11-12 02:15:20'),
(1303, 'Lametic tab', 'TABLET', 'Obat Keras', 100, 37200, '1', '2020-11-12 02:15:20'),
(1304, 'Lanpepsa Syr', 'BOTOL', 'Obat Keras', 100, 82200, '1', '2020-11-12 02:15:20'),
(1305, 'Magtral', 'BOTOL', 'Obat Keras', 100, 42900, '1', '2020-11-12 02:15:20'),
(1306, 'Medicort crem', 'TUBE', 'Obat Keras', 100, 71900, '1', '2020-11-12 02:15:20'),
(1307, 'Magnesium sulfat 40%', 'BOTOL', 'Obat Keras', 100, 8400, '1', '2020-11-12 02:15:20'),
(1308, 'Maintate', 'TABLET', 'Obat Keras', 100, 9400, '1', '2020-11-12 02:15:20'),
(1309, 'Meiact 200', 'TABLET', 'Obat Keras', 100, 25000, '1', '2020-11-12 02:15:20'),
(1310, 'Martos 10', 'BOTOL', 'Obat Keras', 100, 112000, '1', '2020-11-12 02:15:20'),
(1311, 'Mediamer B 6', 'TABLET', 'Obat Keras', 100, 2300, '1', '2020-11-12 02:15:20'),
(1312, 'Medixon 4 mg', 'TABLET', 'Obat Keras', 100, 3300, '1', '2020-11-12 02:15:20'),
(1313, 'Medixon 125 mg', 'VIAL', 'Obat Keras', 100, 107250, '1', '2020-11-12 02:15:20'),
(1314, 'Mefinal 500', 'TABLET', 'Obat Keras', 100, 1900, '1', '2020-11-12 02:15:20'),
(1315, 'Megabal', 'KAPSUL', 'Obat Keras', 100, 2300, '1', '2020-11-12 02:15:20'),
(1316, 'Meloxicam 15 mg', 'TABLET', 'Obat Keras', 100, 1950, '1', '2020-11-12 02:15:20'),
(1317, 'Mensipox', 'TABLET', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(1318, 'Merofen', 'VIAL', 'Obat Keras', 100, 657800, '1', '2020-11-12 02:15:20'),
(1319, 'Mertigo', 'TABLET', 'Obat Keras', 100, 4200, '1', '2020-11-12 02:15:20'),
(1320, 'Methergin injek', 'AMPUL', 'Obat Keras', 100, 11600, '1', '2020-11-12 02:15:20'),
(1321, 'Meylon', 'FLS', 'Obat Keras', 100, 15700, '1', '2020-11-12 02:15:20'),
(1322, 'Microgynon', 'STRIP', 'Obat Keras', 100, 13500, '1', '2020-11-12 02:15:20'),
(1323, 'Mucosolvan tab 8 mg', 'TABLET', 'Obat Keras', 100, 350, '1', '2020-11-12 02:15:20'),
(1324, 'Metvell', 'TABLET', 'Obat Keras', 100, 3200, '1', '2020-11-12 02:15:20'),
(1325, 'Musin', 'BOTOL', 'Obat Keras', 100, 71500, '1', '2020-11-12 02:15:20'),
(1326, 'Mycoral', 'TABLET', 'Obat Keras', 100, 4900, '1', '2020-11-12 02:15:20'),
(1327, 'Myonep', 'TABLET', 'Obat Keras', 100, 6800, '1', '2020-11-12 02:15:20'),
(1328, 'Myores', 'TABLET', 'Obat Keras', 100, 7150, '1', '2020-11-12 02:15:20'),
(1329, 'Mecox 7.5', 'TABLET', 'Obat Keras', 100, 7500, '1', '2020-11-12 02:15:20'),
(1330, 'Mecox 15 mg', 'TABLET', 'Obat Keras', 100, 12200, '1', '2020-11-12 02:15:20'),
(1331, 'Metherinal tab', 'TABLET', 'Obat Keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(1332, 'Medixon 16 mg', 'TABLET', 'Obat Keras', 100, 6950, '1', '2020-11-12 02:15:20'),
(1333, 'Metvell inj', 'AMPUL', 'Obat Keras', 100, 107250, '1', '2020-11-12 02:15:20'),
(1334, 'methylprednisolon inj 125 mg', 'VIAL', 'Obat Keras', 100, 64350, '1', '2020-11-12 02:15:20'),
(1335, 'Mosardal inf 500', 'BOTOL', 'Obat Keras', 100, 321750, '1', '2020-11-12 02:15:20'),
(1336, 'Mosardal tab', 'TABLET', 'Obat Keras', 100, 41500, '1', '2020-11-12 02:15:20'),
(1337, 'Merosan', 'VIAL', 'Obat Keras', 100, 769500, '1', '2020-11-12 02:15:20'),
(1338, 'Methylprednisolone 8 mg', 'TABLET', 'Obat Keras', 100, 900, '1', '2020-11-12 02:15:20'),
(1339, 'Miprostol', 'TABLET', 'Obat Keras', 100, 27500, '1', '2020-11-12 02:15:20'),
(1340, 'Magnesium Sulfate 20%', 'BOTOL', 'Obat Keras', 100, 4300, '1', '2020-11-12 02:15:20'),
(1341, 'Marcain Inj', 'VIAL', 'Obat Keras', 100, 168200, '1', '2020-11-12 02:15:20'),
(1342, 'Neulin PS', 'KAPSUL', 'Obat Keras', 100, 15700, '1', '2020-11-12 02:15:20'),
(1343, 'Nalgestan', 'TABLET', 'Obat Keras', 100, 1150, '1', '2020-11-12 02:15:20'),
(1344, 'Neo K', 'AMPUL', 'Obat Keras', 100, 17600, '1', '2020-11-12 02:15:20'),
(1345, 'Nepatic', 'KAPSUL', 'Obat Keras', 100, 14000, '1', '2020-11-12 02:15:20'),
(1346, 'Neurosanbe inj', 'AMPUL', 'Obat Keras', 100, 7800, '1', '2020-11-12 02:15:20'),
(1347, 'Neurosanbe Tablet', 'TABLET', 'Obat Keras', 100, 3300, '1', '2020-11-12 02:15:20'),
(1348, 'Neurotam inj 1 g', 'AMPUL', 'Obat Keras', 100, 22900, '1', '2020-11-12 02:15:20'),
(1349, 'Neurotam 100 ml', 'BOTOL', 'Obat Keras', 100, 75800, '1', '2020-11-12 02:15:20'),
(1350, 'Neurotam inf 12 g ', 'BOTOL', 'Obat Keras', 100, 293150, '1', '2020-11-12 02:15:20'),
(1351, 'Neurotam tab 1200', 'KAPSUL', 'Obat Keras', 100, 7400, '1', '2020-11-12 02:15:20'),
(1352, 'Neurotam inj 3 gram', 'AMPUL', 'Obat Keras', 100, 78650, '1', '2020-11-12 02:15:20'),
(1353, 'Neurotam tab 400', 'KAPSUL', 'Obat Keras', 100, 2450, '1', '2020-11-12 02:15:20'),
(1354, 'Neurotam tab 800', 'KAPSUL', 'Obat Keras', 100, 5200, '1', '2020-11-12 02:15:20'),
(1355, 'New Diatabs', 'TABLET', 'Obat Keras', 100, 700, '1', '2020-11-12 02:15:20'),
(1356, 'Nipe Drop', 'BOTOL', 'Obat Keras', 100, 64700, '1', '2020-11-12 02:15:20'),
(1357, 'Nipedipine 10', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(1358, 'Nonflamin', 'KAPSUL', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(1359, 'Norelut', 'TABLET', 'Obat Keras', 100, 5400, '1', '2020-11-12 02:15:20'),
(1360, 'Novalgin', 'AMPUL', 'Obat Keras', 100, 11450, '1', '2020-11-12 02:15:20'),
(1361, 'Nogren', 'TABLET', 'Obat Keras', 100, 1700, '1', '2020-11-12 02:15:20'),
(1362, 'Novorapid', 'SYRINGE', 'Obat Keras', 100, 240350, '1', '2020-11-12 02:15:20'),
(1363, 'Normoten 5 mg', 'TABLET', 'Obat Keras', 100, 7450, '1', '2020-11-12 02:15:20'),
(1364, 'Novexib', 'KAPSUL', 'Obat Keras', 100, 11850, '1', '2020-11-12 02:15:20'),
(1365, 'Nystin drop', 'BOTOL', 'Obat Keras', 100, 53600, '1', '2020-11-12 02:15:20'),
(1366, 'Nichomycin tab', 'TABLET', 'Obat Keras', 100, 900, '1', '2020-11-12 02:15:20'),
(1367, 'Nilavid', 'TABLET', 'Obat Keras', 100, 13350, '1', '2020-11-12 02:15:20'),
(1368, 'Norit', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(1369, 'Nichoviton', 'KAPSUL', 'Obat Keras', 100, 2000, '1', '2020-11-12 02:15:20'),
(1370, 'Norages', 'AMPUL', 'Obat Keras', 100, 13800, '1', '2020-11-12 02:15:20'),
(1371, 'Noveron inj', 'VIAL', 'Obat Keras', 100, 145200, '1', '2020-11-12 02:15:20'),
(1372, 'Neulin Inj 12,5 %', 'AMPUL', 'Obat Keras', 100, 128700, '1', '2020-11-12 02:15:20'),
(1373, 'Noprostol tab', 'TABLET', 'Obat Keras', 100, 13500, '1', '2020-11-12 02:15:20'),
(1374, 'Norfion Inj', 'AMPUL', 'Obat Keras', 100, 36500, '1', '2020-11-12 02:15:20'),
(1375, 'Ocuson', 'TABLET', 'Obat Keras', 100, 1900, '1', '2020-11-12 02:15:20'),
(1376, 'OMZ', 'VIAL', 'Obat Keras', 100, 157300, '1', '2020-11-12 02:15:20'),
(1377, 'Opixime tab', 'KAPSUL', 'Obat Keras', 100, 25700, '1', '2020-11-12 02:15:20'),
(1378, 'Ossoral 200', 'TABLET', 'Obat Keras', 100, 1600, '1', '2020-11-12 02:15:20'),
(1379, 'Ostelox 15 mg', 'TABLET', 'Obat Keras', 100, 13100, '1', '2020-11-12 02:15:20'),
(1380, 'Ostelox 7,5 mg', 'TABLET', 'Obat Keras', 100, 8000, '1', '2020-11-12 02:15:20'),
(1381, 'Otolin tetes telinga', 'BOTOL', 'Obat keras', 100, 30700, '1', '2020-11-12 02:15:20'),
(1382, 'Ottopain tetes telinga', 'BOTOL', 'Obat keras', 100, 80000, '1', '2020-11-12 02:15:20'),
(1383, 'Osteonat', 'TABLET', 'Obat Keras', 100, 14600, '1', '2020-11-12 02:15:20'),
(1384, 'Osteocal', 'TABLET', 'Obat Keras', 100, 1250, '1', '2020-11-12 02:15:20'),
(1385, 'Ondancetron inj 4 mg', 'AMPUL', 'Obat Keras', 100, 11450, '1', '2020-11-12 02:15:20'),
(1386, 'Opixime syr', 'BOTOL', 'Obat Keras', 100, 107250, '1', '2020-11-12 02:15:20'),
(1387, 'ODR Sirup', 'BOTOL', 'Obat Keras', 100, 131500, '1', '2020-11-12 02:15:20'),
(1388, 'Pirotop ointment', 'TUBE', 'Obat Keras', 100, 83400, '1', '2020-11-12 02:15:20'),
(1389, 'Pan Amin G', 'BOTOL', 'Obat Keras', 100, 70000, '1', '2020-11-12 02:15:20'),
(1390, 'Paradryl', 'CC', 'Obat Keras', 100, 650, '1', '2020-11-12 02:15:20'),
(1391, 'Paramidon', 'CC', 'Obat Keras', 100, 650, '1', '2020-11-12 02:15:20'),
(1392, 'Ondancetron inj 8 ml', 'AMPUL', 'Obat Keras', 100, 20800, '1', '2020-11-12 02:15:20'),
(1393, 'P.P.D / Tes Mantuk', 'STRIP', 'Obat Keras', 100, 58200, '1', '2020-11-12 02:15:20'),
(1394, 'Pumpitor Inj', 'AMPUL', 'Obat Keras', 100, 214500, '1', '2020-11-12 02:15:20'),
(1395, 'Pehacain', 'AMPUL', 'Obat Keras', 100, 4900, '1', '2020-11-12 02:15:20'),
(1396, 'Pehadoxin 100', 'TABLET', 'Obat Keras', 100, 500, '1', '2020-11-12 02:15:20'),
(1397, 'Pehadoxin Forte', 'TABLET', 'Obat Keras', 100, 850, '1', '2020-11-12 02:15:20'),
(1398, 'Pelastin', 'BOTOL', 'Obat Keras', 100, 423300, '1', '2020-11-12 02:15:20'),
(1399, 'Plavos', 'TABLET', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(1400, 'Plasbumin 25%', 'BOTOL', 'Obat Keras', 100, 2266550, '1', '2020-11-12 02:15:20'),
(1401, 'Plasminex Inj.', 'AMPUL', 'Obat Keras', 100, 17800, '1', '2020-11-12 02:15:20'),
(1402, 'Plasminex Tab', 'TABLET', 'Obat Keras', 100, 3900, '1', '2020-11-12 02:15:20'),
(1403, 'KCL', 'AMPUL', 'Obat Keras', 100, 8600, '1', '2020-11-12 02:15:20'),
(1404, 'Pregnolin', 'TABLET', 'Obat Keras', 100, 4900, '1', '2020-11-12 02:15:20'),
(1405, 'Prenamia', 'KAPSUL', 'Obat Keras', 100, 1700, '1', '2020-11-12 02:15:20'),
(1406, 'Plasmin ', 'TABLET', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(1407, 'Profilas', 'KAPSUL', 'Obat Keras', 100, 4700, '1', '2020-11-12 02:15:20'),
(1408, 'Profertil', 'TABLET', 'Obat Keras', 100, 15750, '1', '2020-11-12 02:15:20'),
(1409, 'Prolic 150', 'KAPSUL', 'Obat Keras', 100, 5000, '1', '2020-11-12 02:15:20'),
(1410, 'Prolic 300', 'KAPSUL', 'Obat Keras', 100, 10300, '1', '2020-11-12 02:15:20'),
(1411, 'Pronalges Supp', 'FLS', 'Obat keras', 100, 15700, '1', '2020-11-12 02:15:20'),
(1412, 'Propyretic Supp 160', 'PCS', 'Obat keras', 100, 9500, '1', '2020-11-12 02:15:20'),
(1413, 'Propyretic Supp 80', 'PCS', 'Obat keras', 100, 8900, '1', '2020-11-12 02:15:20'),
(1414, 'Pulmicort Respules 1 mg', 'BOTOL', 'Obat keras', 100, 28000, '1', '2020-11-12 02:15:20'),
(1415, 'Pumpitor tab', 'TABLET', 'Obat Keras', 100, 19300, '1', '2020-11-12 02:15:20'),
(1416, 'Prostacom', 'TABLET', 'Obat Keras', 100, 11550, '1', '2020-11-12 02:15:20'),
(1417, 'Provamed', 'TABLET', 'Obat Keras', 100, 6400, '1', '2020-11-12 02:15:20'),
(1418, 'Promeno', 'KAPSUL', 'Obat Keras', 100, 2200, '1', '2020-11-12 02:15:20'),
(1419, 'Pytominadion', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(1420, 'Pitogin inj', 'AMPUL', 'Obat Keras', 100, 8450, '1', '2020-11-12 02:15:20'),
(1421, 'Puricemia 300', 'TABLET', 'Obat Keras', 100, 4000, '1', '2020-11-12 02:15:20'),
(1422, 'Panso', 'VIAL', 'Obat Keras', 100, 185900, '1', '2020-11-12 02:15:20'),
(1423, 'Prohelic', 'KAPSUL', 'Obat Keras', 100, 5000, '1', '2020-11-12 02:15:20'),
(1424, 'Patral', 'TABLET', 'Obat Keras', 100, 10000, '1', '2020-11-12 02:15:20'),
(1425, 'Pantoprazole inj', 'VIAL', 'Obat Keras', 100, 114400, '1', '2020-11-12 02:15:20'),
(1426, 'Pletaal tab', 'TABLET', 'Obat Keras', 100, 10250, '1', '2020-11-12 02:15:20'),
(1427, 'Permyo', 'TABLET', 'Obat Keras', 100, 5400, '1', '2020-11-12 02:15:20'),
(1428, 'Premaston tablet', 'TABLET', 'Obat Keras', 100, 5400, '1', '2020-11-12 02:15:20'),
(1429, 'Quanacain injeksi', 'VIAL', 'Obat Keras', 100, 71500, '1', '2020-11-12 02:15:20'),
(1430, 'Ranicho syr', 'BOTOL', 'Obat Keras', 100, 63500, '1', '2020-11-12 02:15:20'),
(1431, 'Rantin inj', 'AMPUL', 'Obat Keras', 100, 27200, '1', '2020-11-12 02:15:20'),
(1432, 'Rantin  tab 150', 'TABLET', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(1433, 'Renax', 'KAPSUL', 'Obat Keras', 100, 9800, '1', '2020-11-12 02:15:20'),
(1434, 'Renvol 50 mg', 'TABLET', 'Obat Keras', 100, 2100, '1', '2020-11-12 02:15:20'),
(1435, 'Reotal SR 400', 'KAPSUL', 'Obat Keras', 100, 10600, '1', '2020-11-12 02:15:20'),
(1436, 'Reotal 300', 'AMPUL', 'Obat Keras', 100, 61500, '1', '2020-11-12 02:15:20'),
(1437, 'Retaphyl SR', 'KAPLET', 'Obat Keras', 100, 2800, '1', '2020-11-12 02:15:20'),
(1438, 'Rhinathiol', 'KAPSUL', 'Obat Keras', 100, 2450, '1', '2020-11-12 02:15:20'),
(1439, 'Rocer tab 20 mg', 'KAPSUL', 'Obat Keras', 100, 17200, '1', '2020-11-12 02:15:20'),
(1440, 'Ryzen', 'TABLET', 'Obat Keras', 100, 7300, '1', '2020-11-12 02:15:20'),
(1441, 'Recolfar', 'TABLET', 'Obat Keras', 100, 6150, '1', '2020-11-12 02:15:20'),
(1442, 'Recustein tab', 'KAPSUL', 'Obat Keras', 100, 7150, '1', '2020-11-12 02:15:20'),
(1443, 'Redacid ', 'KAPSUL', 'Obat Keras', 100, 10700, '1', '2020-11-12 02:15:20'),
(1444, 'Renvol 25 mg', 'TABLET', 'Obat Keras', 100, 1000, '1', '2020-11-12 02:15:20'),
(1445, 'Recain inj', 'AMPUL', 'Obat Keras', 100, 71500, '1', '2020-11-12 02:15:20'),
(1446, 'Regivell inj', 'VIAL', 'Obat Keras', 100, 118600, '1', '2020-11-12 02:15:20'),
(1447, 'Rhinos Neo Drop', 'BOTOL', 'Obat Keras', 100, 61500, '1', '2020-11-12 02:15:20'),
(1448, 'Sporetik 200mg kap', 'KAPLET', 'Obat Keras', 100, 40800, '1', '2020-11-12 02:15:20'),
(1449, 'Recofol', 'AMPUL', 'Obat Keras', 100, 145200, '1', '2020-11-12 02:15:20'),
(1450, 'Sibital inj', 'AMPUL', 'Obat Keras', 100, 22000, '1', '2020-11-12 02:15:20'),
(1451, 'Sagestam Amp', 'AMPUL', 'Obat Keras', 100, 13900, '1', '2020-11-12 02:15:20'),
(1452, 'Sanexon 4 mg', 'TABLET', 'Obat Keras', 100, 3200, '1', '2020-11-12 02:15:20'),
(1453, 'Sanlin 500', 'KAPSUL', 'Obat Keras', 100, 1200, '1', '2020-11-12 02:15:20'),
(1454, 'Sanprima syr', 'BOTOL', 'Obat Keras', 100, 36600, '1', '2020-11-12 02:15:20'),
(1455, 'Sanprima Tab', 'TABLET', 'Obat Keras', 100, 1400, '1', '2020-11-12 02:15:20'),
(1456, 'Sanprima Forte', 'TABLET', 'Obat Keras', 100, 2800, '1', '2020-11-12 02:15:20'),
(1457, 'Scabimite 10 g', 'TUBE', 'Obat keras', 100, 66000, '1', '2020-11-12 02:15:20'),
(1458, 'Scabimit 30 g', 'TUBE', 'Obat keras', 100, 99400, '1', '2020-11-12 02:15:20'),
(1459, 'Simvastatin 10', 'TABLET', 'Obat Keras', 100, 700, '1', '2020-11-12 02:15:20'),
(1460, 'Simvastatin 20', 'TABLET', 'Obat Keras', 100, 1450, '1', '2020-11-12 02:15:20'),
(1461, 'Sintocynon', 'AMPUL', 'Obat Keras', 100, 17900, '1', '2020-11-12 02:15:20'),
(1462, 'Sistenol', 'TABLET', 'Obat Keras', 100, 3000, '1', '2020-11-12 02:15:20'),
(1463, 'Socef', 'VIAL', 'Obat Keras', 100, 235950, '1', '2020-11-12 02:15:20'),
(1464, 'Socid', 'KAPSUL', 'Obat Keras', 100, 15500, '1', '2020-11-12 02:15:20'),
(1465, 'Soholin', 'AMPUL', 'Obat Keras', 100, 51500, '1', '2020-11-12 02:15:20'),
(1466, 'Somerol', 'VIAL', 'Obat Keras', 100, 103125, '1', '2020-11-12 02:15:20'),
(1467, 'Spasminal', 'TABLET', 'Obat Keras', 100, 1100, '1', '2020-11-12 02:15:20'),
(1468, 'Spasmolit', 'TABLET', 'Obat Keras', 100, 3200, '1', '2020-11-12 02:15:20'),
(1469, 'Spasmomen', 'TABLET', 'Obat Keras', 100, 8900, '1', '2020-11-12 02:15:20'),
(1470, 'Spiradan', 'TABLET', 'Obat Keras', 100, 6900, '1', '2020-11-12 02:15:20'),
(1471, 'Spiramycin 500', 'TABLET', 'Obat Keras', 100, 2200, '1', '2020-11-12 02:15:20'),
(1472, 'Spiropent', 'TABLET', 'Obat Keras', 100, 5900, '1', '2020-11-12 02:15:20'),
(1473, 'Sporetic 100 mg kap', 'KAPSUL', 'Obat Keras', 100, 28200, '1', '2020-11-12 02:15:20'),
(1474, 'Sporetic Sirup', 'BOTOL', 'Obat Keras', 100, 119300, '1', '2020-11-12 02:15:20'),
(1475, 'Stileran', 'TABLET', 'Obat Keras', 100, 1200, '1', '2020-11-12 02:15:20'),
(1476, 'Sulcolon', 'KAPSUL', 'Obat Keras', 100, 9750, '1', '2020-11-12 02:15:20'),
(1477, 'Stobled ', 'KAPSUL', 'Obat Keras', 100, 9900, '1', '2020-11-12 02:15:20'),
(1478, 'Stugeron', 'TABLET', 'Obat Keras', 100, 3100, '1', '2020-11-12 02:15:20'),
(1479, 'Sangobion', 'TABLET', 'Obat Keras', 100, 1500, '1', '2020-11-12 02:15:20'),
(1480, 'Salin 3%', 'BOTOL', 'Obat Keras', 100, 36200, '1', '2020-11-12 02:15:20'),
(1481, 'Rocer inj', 'VIAL', 'Obat Keras', 100, 178750, '1', '2020-11-12 02:15:20'),
(1482, 'Soclaf', 'VIAL', 'Obat Keras', 100, 178750, '1', '2020-11-12 02:15:20'),
(1483, 'Roculax', 'VIAL', 'Obat Keras', 100, 293150, '1', '2020-11-12 02:15:20'),
(1484, 'Sanmol infus', 'BOTOL', 'Obat Keras', 100, 87300, '1', '2020-11-12 02:15:20'),
(1485, 'Sofik', 'TABLET', 'Obat Keras', 100, 24800, '1', '2020-11-12 02:15:20'),
(1486, 'Spiriva refill', 'kapsul', 'Obat Keras', 100, 25300, '1', '2020-11-12 02:15:20'),
(1487, 'Sibro', 'TUBE', 'Obat keras', 100, 99750, '1', '2020-11-12 02:15:20'),
(1488, 'Simextam inj', 'VIAL', 'Obat Keras', 100, 243100, '1', '2020-11-12 02:15:20'),
(1489, 'Suprasma', 'BOTOL', 'Obat keras', 100, 100100, '1', '2020-11-12 02:15:20'),
(1490, 'Scopamin plus', 'TABLET', 'Obat Keras', 100, 3600, '1', '2020-11-12 02:15:20'),
(1491, 'Scopamin tablet', 'TABLET', 'Obat Keras', 100, 2500, '1', '2020-11-12 02:15:20'),
(1492, 'Santagesik inj', 'AMPUL', 'Obat Keras', 100, 13300, '1', '2020-11-12 02:15:20'),
(1493, 'Supramox ', 'BOTOL', 'Obat Keras', 100, 19400, '1', '2020-11-12 02:15:20'),
(1494, 'Topicare Cleanser', 'TUBE', 'Obat Keras', 100, 78650, '1', '2020-11-12 02:15:20'),
(1495, 'Topicare Ceramide Crem', 'TUBE', 'Obat Keras', 100, 178800, '1', '2020-11-12 02:15:20'),
(1496, 'Tiriz kaplet', 'TABLET', 'Obat Keras', 100, 5500, '1', '2020-11-12 02:15:20'),
(1497, 'Tironem Inj', 'VIAL', 'Obat Keras', 100, 643500, '1', '2020-11-12 02:15:20'),
(1498, 'Tanapres 5', 'TABLET', 'Obat Keras', 100, 13400, '1', '2020-11-12 02:15:20'),
(1499, 'Tanapres 10', 'TABLET', 'Obat Keras', 100, 17800, '1', '2020-11-12 02:15:20'),
(1500, 'Tribestan', 'TABLET', 'Obat Keras', 100, 13700, '1', '2020-11-12 02:15:20'),
(1501, 'Taxegram', 'VIAL', 'Obat Keras', 100, 204000, '1', '2020-11-12 02:15:20'),
(1502, 'TB ZET', 'TABLET', 'Obat Keras', 100, 2150, '1', '2020-11-12 02:15:20'),
(1503, 'Tensivask 10', 'TABLET', 'Obat Keras', 100, 13600, '1', '2020-11-12 02:15:20'),
(1504, 'Tensivask 5', 'TABLET', 'Obat Keras', 100, 7450, '1', '2020-11-12 02:15:20'),
(1505, 'Terfacef', 'VIAL', 'Obat Keras', 100, 301600, '1', '2020-11-12 02:15:20'),
(1506, 'Tiaryt', 'TABLET', 'Obat Keras', 100, 5600, '1', '2020-11-12 02:15:20'),
(1507, 'Toramine inj', 'AMPUL', 'Obat Keras', 100, 54300, '1', '2020-11-12 02:15:20'),
(1508, 'Tradosik', 'KAPSUL', 'Obat Keras', 100, 5700, '1', '2020-11-12 02:15:20'),
(1509, 'Trichodazol  inf', 'BOTOL', 'Obat Keras', 100, 127600, '1', '2020-11-12 02:15:20'),
(1510, 'Trichodazol Tab', 'TABLET', 'Obat Keras', 100, 2400, '1', '2020-11-12 02:15:20'),
(1511, 'Triclovem', 'VIAL', 'Obat Keras', 100, 12500, '1', '2020-11-12 02:15:20'),
(1512, 'Trovensis 8 mg', 'TABLET', 'Obat Keras', 100, 24600, '1', '2020-11-12 02:15:20'),
(1513, 'Tropifer', 'TABLET', 'Obat Keras', 100, 1750, '1', '2020-11-12 02:15:20'),
(1514, 'Teosal', 'TABLET', 'Obat Keras', 100, 300, '1', '2020-11-12 02:15:20'),
(1515, 'Trovensis inj 8 mg', 'VIAL', 'Obat Keras', 100, 98300, '1', '2020-11-12 02:15:20'),
(1516, 'Truvas 10', 'TABLET', 'Obat Keras', 100, 18350, '1', '2020-11-12 02:15:20'),
(1517, 'Truvas 20', 'TABLET', 'Obat Keras', 100, 17400, '1', '2020-11-12 02:15:20'),
(1518, 'Trilac inj', 'ML', 'Obat Keras', 100, 28600, '1', '2020-11-12 02:15:20'),
(1519, 'Triofusin 500', 'BOTOL', 'Obat Keras', 100, 110100, '1', '2020-11-12 02:15:20'),
(1520, 'Tradosik inj', 'AMPUL', 'Obat Keras', 100, 28700, '1', '2020-11-12 02:15:20'),
(1521, 'Tensinop 5', 'TABLET', 'Obat Keras', 100, 3900, '1', '2020-11-12 02:15:20'),
(1522, 'Tensinop 10', 'TABLET', 'Obat Keras', 100, 6300, '1', '2020-11-12 02:15:20'),
(1523, 'Termisil cream', 'TUBE', 'Obat keras', 100, 69000, '1', '2020-11-12 02:15:20'),
(1524, 'Tofedex tab', 'TABLET', 'Obat Keras', 100, 9400, '1', '2020-11-12 02:15:20'),
(1525, 'Trifalgin tab', 'TABLET', 'Obat Keras', 100, 800, '1', '2020-11-12 02:15:20'),
(1526, 'Trizedon', 'KAPLET', 'Obat keras', 100, 4700, '1', '2020-11-12 02:15:20'),
(1527, 'Trovensis inj 4 mg', 'VIAL', 'Obat Keras', 100, 48300, '1', '2020-11-12 02:15:20'),
(1528, 'Ulsafat Susp 100 ml', 'BOTOL', 'Obat keras', 100, 59800, '1', '2020-11-12 02:15:20'),
(1529, 'Unalium 10 mg', 'TABLET', 'Obat Keras', 100, 7150, '1', '2020-11-12 02:15:20'),
(1530, 'Unalium 5 mg', 'TABLET', 'Obat Keras', 100, 5600, '1', '2020-11-12 02:15:20'),
(1531, 'Urdahex', 'KAPSUL', 'Obat Keras', 100, 12400, '1', '2020-11-12 02:15:20'),
(1532, 'Urispas', 'TABLET', 'Obat Keras', 100, 7500, '1', '2020-11-12 02:15:20'),
(1533, 'Urotractin', 'KAPSUL', 'Obat Keras', 100, 4700, '1', '2020-11-12 02:15:20'),
(1534, 'Ulceranin inj', 'AMPUL', 'Obat Keras', 100, 26450, '1', '2020-11-12 02:15:20'),
(1535, 'Vagistin Ovula', 'PCS', 'Obat keras', 100, 19600, '1', '2020-11-12 02:15:20'),
(1536, 'Vectrine syr', 'BOTOL', 'Obat keras', 100, 72400, '1', '2020-11-12 02:15:20'),
(1537, 'Vectrine Tab', 'TABLET', 'Obat Keras', 100, 6000, '1', '2020-11-12 02:15:20'),
(1538, 'Vometa tab', 'TABLET', 'Obat Keras', 100, 5800, '1', '2020-11-12 02:15:20'),
(1539, 'Vometa Drops', 'BOTOL', 'Obat keras', 100, 54300, '1', '2020-11-12 02:15:20'),
(1540, 'Vosedon', 'TABLET', 'Obat Keras', 100, 3300, '1', '2020-11-12 02:15:20'),
(1541, 'Vosedon Susp.', 'BOTOL', 'Obat keras', 100, 41600, '1', '2020-11-12 02:15:20'),
(1542, 'Vomecho', 'TABLET', 'Obat Keras', 100, 3150, '1', '2020-11-12 02:15:20'),
(1543, 'Vometraz 4mg inj', 'VIAL', 'Obat Keras', 100, 34600, '1', '2020-11-12 02:15:20'),
(1544, 'Vertigosan ', 'TABLET', 'Obat Keras', 100, 3700, '1', '2020-11-12 02:15:20'),
(1545, 'Vometron inj', 'VIAL', 'Obat Keras', 100, 35750, '1', '2020-11-12 02:15:20'),
(1546, 'Vometa syr', 'BOTOL', 'Obat keras', 100, 56100, '1', '2020-11-12 02:15:20'),
(1547, 'Vomceran inj', 'VIAL', 'Obat Keras', 100, 21450, '1', '2020-11-12 02:15:20'),
(1548, 'Wiacid inj', 'AMPUL', 'Obat Keras', 100, 28000, '1', '2020-11-12 02:15:20'),
(1549, 'Wiacid tab 150', 'TABLET', 'Obat Keras', 100, 6600, '1', '2020-11-12 02:15:20'),
(1550, 'Widrox', 'TABLET', 'Obat Keras', 100, 11750, '1', '2020-11-12 02:15:20'),
(1551, 'Zegavit', 'TABLET', 'Obat Keras', 100, 3300, '1', '2020-11-12 02:15:20'),
(1552, 'Zicho', 'TABLET', 'Obat Keras', 100, 32200, '1', '2020-11-12 02:15:20'),
(1553, 'Zidifec', 'VIAL', 'Obat Keras', 100, 372500, '1', '2020-11-12 02:15:20'),
(1554, 'Zistic', 'TABLET', 'Obat Keras', 100, 35750, '1', '2020-11-12 02:15:20'),
(1555, 'Zumafib', 'TABLET', 'Obat Keras', 100, 12700, '1', '2020-11-12 02:15:20'),
(1556, 'Zinkid', 'TABLET', 'Obat Keras', 100, 3600, '1', '2020-11-12 02:15:20'),
(1557, 'Zitanid 2 mg', 'TABLET', 'Obat Keras', 100, 7900, '1', '2020-11-12 02:15:20'),
(1558, 'Zincare', 'TABLET', 'Obat Keras', 100, 2800, '1', '2020-11-12 02:15:20'),
(1559, 'SUSU C2JOY', 'SACHET', 'Obat Keras', 100, 15600, '1', '2020-11-12 02:15:20'),
(1560, 'Xilon 4 mg', 'KAPLET', 'Obat Keras', 100, 3700, '1', '2020-11-12 02:15:20'),
(1561, 'Povidon Solut 60 ml', 'BOTOL', 'Obat Luar', 100, 7150, '1', '2020-11-12 02:15:20'),
(1562, 'Gentamicin salep mata', 'TUBE', 'Obat Luar', 100, 4900, '1', '2020-11-12 02:15:20'),
(1563, 'Miconazole Krim', 'TUBE', 'Obat Luar', 100, 4800, '1', '2020-11-12 02:15:20'),
(1564, 'Betametason', 'TUBE', 'Obat Luar', 100, 3308, '1', '2020-11-12 02:15:20'),
(1565, 'Bactoderm oint 10 gr', 'TUBE', 'Obat Luar', 100, 81500, '1', '2020-11-12 02:15:20'),
(1566, 'Betadin Obat Kumur ', 'BOTOL', 'Obat Luar', 100, 14300, '1', '2020-11-12 02:15:20'),
(1567, 'Cendo Fenicol', 'TUBE', 'Obat Luar', 100, 23400, '1', '2020-11-12 02:15:20'),
(1568, 'Hallothane', 'BOTOL', 'Obat Luar', 100, 5050, '1', '2020-11-12 02:15:20'),
(1569, 'Kloderma oint', 'Tube', 'Obat Luar', 100, 39300, '1', '2020-11-12 02:15:20'),
(1570, 'Ketomed Crem ', 'TUBE', 'Obat Luar', 100, 34000, '1', '2020-11-12 02:15:20'),
(1571, 'Ketomed SS 60 ml', 'BOTOL', 'Obat Luar', 100, 52000, '1', '2020-11-12 02:15:20'),
(1572, 'Lasal Com', 'PCS', 'Obat Luar', 100, 15700, '1', '2020-11-12 02:15:20'),
(1573, 'Myco-Z', 'GRAM', 'Obat Luar', 100, 9750, '1', '2020-11-12 02:15:20'),
(1574, 'Medscab', 'TUBE', 'Obat Luar', 100, 85000, '1', '2020-11-12 02:15:20'),
(1575, 'Mebo Ointment', 'TUBE', 'Obat Luar', 100, 113700, '1', '2020-11-12 02:15:20'),
(1576, 'Povidone Solut', 'ML', 'Obat Luar', 100, 85, '1', '2020-11-12 02:15:20'),
(1577, 'Pamol Sup 125', 'PCS', 'Obat Luar', 100, 5850, '1', '2020-11-12 02:15:20'),
(1578, 'Pamol Sup 250', 'PCS', 'Obat Luar', 100, 9750, '1', '2020-11-12 02:15:20'),
(1579, 'Phocagel gel', 'TUBE', 'Obat Luar', 100, 235950, '1', '2020-11-12 02:15:20'),
(1580, 'Rivanol', 'BOTOL', 'Obat Luar', 100, 12900, '1', '2020-11-12 02:15:20'),
(1581, 'Sojourn', 'ML', 'Obat Luar', 100, 15000, '1', '2020-11-12 02:15:20'),
(1582, 'Sevodex 250 ml', 'ML', 'Obat Luar', 100, 15400, '1', '2020-11-12 02:15:20'),
(1583, 'Symbicort turb 160/120 DOSE', 'BOTOL', 'Obat Luar', 100, 615800, '1', '2020-11-12 02:15:20'),
(1584, 'Symbicort turb 80', 'BOTOL', 'Obat Luar', 100, 227500, '1', '2020-11-12 02:15:20'),
(1585, 'Skincol', 'TUBE', 'Obat Luar', 100, 178750, '1', '2020-11-12 02:15:20'),
(1586, 'Sagalon Cream', 'TUBE', 'Obat Luar', 100, 47600, '1', '2020-11-12 02:15:20'),
(1587, 'Soralen Solution', 'BOTOL', 'Obat Luar', 100, 70800, '1', '2020-11-12 02:15:20'),
(1588, 'Bricasma Turbuhaler 100 Dose', 'AMPUL', 'Obat Nebulezer', 100, 147300, '1', '2020-11-12 02:15:20'),
(1589, 'Lasal Nebu', 'VIAL', 'Obat Nebulezer', 100, 11450, '1', '2020-11-12 02:15:20'),
(1590, 'SYMBICORT TURB 160/60 DOSE', 'BOTOL', 'Obat Nebulezer', 100, 378600, '1', '2020-11-12 02:15:20'),
(1591, 'Fluimucil sachet', 'SACHET', 'Obat Sachet', 100, 7150, '1', '2020-11-12 02:15:20'),
(1592, 'Vipalbumin plus', 'SACHET', 'Obat Sachet', 100, 78650, '1', '2020-11-12 02:15:20'),
(1593, 'Acyclovir salep', 'TUBE', 'Obat Salep', 100, 5000, '1', '2020-11-12 02:15:20'),
(1594, 'Clorampenicol Salep', 'TUBE', 'Obat Salep', 100, 11000, '1', '2020-11-12 02:15:20'),
(1595, 'Erlamycetin salep mata', 'TUBE', 'Obat Salep', 100, 6500, '1', '2020-11-12 02:15:20'),
(1596, 'Erlamycetin tetes telinga', 'TUBE', 'Obat Salep', 100, 10700, '1', '2020-11-12 02:15:20'),
(1597, 'Oxytetracycline', 'TUBE', 'Obat Salep', 100, 2700, '1', '2020-11-12 02:15:20'),
(1598, 'Salep 24', 'TUBE', 'Obat Salep', 100, 5000, '1', '2020-11-12 02:15:20'),
(1599, 'Chloramfecort cream', 'TUBE', 'Obat Salep', 100, 14900, '1', '2020-11-12 02:15:20'),
(1600, 'Dermakel gel 50 mg', 'TUBE', 'Obat Salep', 100, 286000, '1', '2020-11-12 02:15:20'),
(1601, 'Erlamicetin ', 'TUBE', 'Obat Salep', 100, 6500, '1', '2020-11-12 02:15:20'),
(1602, 'Flexamine', 'TUBE', 'Obat Salep', 100, 78650, '1', '2020-11-12 02:15:20'),
(1603, 'Obucort Swinghaler', 'BOTOL', 'Obat Semprot', 100, 205600, '1', '2020-11-12 02:15:20'),
(1604, 'Seretide diskus', 'BOTOL', 'Obat Semprot', 97, 237800, '1', '2020-11-12 02:15:20'),
(1605, 'Kalium Permanganat/PK/300 cc', 'MG', 'Obat Serbuk', 100, 3500, '1', '2020-11-12 02:15:20'),
(1606, 'Talk', 'GRAM', 'Obat Serbuk', 100, 10, '1', '2020-11-12 02:15:20'),
(1607, 'Antasida doen syr', 'BOTOL', 'Obat Syrup', 100, 14900, '1', '2020-11-12 02:15:20'),
(1608, 'Azitromycin Syr', 'BOTOL', 'Obat Syrup', 100, 92950, '1', '2020-11-12 02:15:20'),
(1609, 'Cloramphenicol syr', 'BOTOL', 'Obat Syrup', 100, 7000, '1', '2020-11-12 02:15:20'),
(1610, 'Cotrimoxazol Syr ', 'BOTOL', 'Obat Syrup', 100, 8600, '1', '2020-11-12 02:15:20'),
(1611, 'Cetirizin Syr', 'botol', 'Obat Syrup', 100, 11300, '1', '2020-11-12 02:15:20'),
(1612, 'Camidryl Exp', 'BOTOL', 'Obat Syrup', 100, 12000, '1', '2020-11-12 02:15:20'),
(1613, 'Erytromycin Syr', 'BOTOL', 'Obat Syrup', 100, 12200, '1', '2020-11-12 02:15:20'),
(1614, 'Ibuprofen Syr 100 ml', 'BOTOL', 'Obat Syrup', 100, 5400, '1', '2020-11-12 02:15:20'),
(1615, 'Kaominal Syr', 'BOTOL', 'Obat Syrup', 100, 18000, '1', '2020-11-12 02:15:20'),
(1616, 'IbuProfen 200 ml', 'BOTOL', 'Obat Syrup', 100, 6000, '1', '2020-11-12 02:15:20'),
(1617, 'Mecobalamin Injek', 'AMPUL', 'Obat Syrup', 100, 28600, '1', '2020-11-12 02:15:20'),
(1618, 'Metoclopramid Syr', 'BOTOL', 'Obat Syrup', 100, 6000, '1', '2020-11-12 02:15:20'),
(1619, 'Nystatin Drop', 'botol', 'Obat Syrup', 100, 31500, '1', '2020-11-12 02:15:20'),
(1620, 'Molafate Syr', 'BOTOL', 'Obat Syrup', 100, 26400, '1', '2020-11-12 02:15:20'),
(1621, 'Alco drop', 'BOTOL', 'Obat Syrup', 100, 90100, '1', '2020-11-12 02:15:20'),
(1622, 'Apecur Syr', 'BOTOL', 'Obat Syrup', 100, 47200, '1', '2020-11-12 02:15:20'),
(1623, 'asam valproat', 'BOTOL', 'Obat Syrup', 100, 96000, '1', '2020-11-12 02:15:20'),
(1624, 'Aclam Forte Syr', 'BOTOL', 'Obat Syrup', 100, 110100, '1', '2020-11-12 02:15:20'),
(1625, 'Bellamox 125 mg', 'BOTOL', 'Obat Syrup', 100, 73000, '1', '2020-11-12 02:15:20'),
(1626, 'Bellamox syr forte 250 mg', 'BOTOL', 'Obat Syrup', 100, 107300, '1', '2020-11-12 02:15:20'),
(1627, 'Biosanbe Drop', 'BOTOL', 'Obat Syrup', 100, 42900, '1', '2020-11-12 02:15:20'),
(1628, 'Colergis syr ', 'BOTOL', 'Obat Syrup', 100, 54300, '1', '2020-11-12 02:15:20'),
(1629, 'Constantia drop', 'BOTOL', 'Obat Syrup', 100, 42900, '1', '2020-11-12 02:15:20'),
(1630, 'Curcuma Syr 200 ml', 'BOTOL', 'Obat Syrup', 100, 19500, '1', '2020-11-12 02:15:20'),
(1631, 'Dehidralyte', 'BOTOL', 'Obat Syrup', 100, 21450, '1', '2020-11-12 02:15:20'),
(1632, 'Desdin syr', 'BOTOL', 'Obat Syrup', 100, 107250, '1', '2020-11-12 02:15:20'),
(1633, 'Episan suspensi', 'BOTOL', 'Obat Syrup', 100, 69900, '1', '2020-11-12 02:15:20'),
(1634, 'Erdomex syr', 'BOTOL', 'Obat Syrup', 100, 57200, '1', '2020-11-12 02:15:20'),
(1635, 'Fucoidan syr', 'BOTOL', 'Obat Syrup', 100, 107250, '1', '2020-11-12 02:15:20'),
(1636, 'Flagyl syr', 'BOTOL', 'Obat Syrup', 100, 70200, '1', '2020-11-12 02:15:20'),
(1637, 'Ferro-K Drop', 'BOTOL', 'Obat Syrup', 100, 40700, '1', '2020-11-12 02:15:20'),
(1638, 'Hufabethamin syr', 'BOTOL', 'Obat Syrup', 100, 8000, '1', '2020-11-12 02:15:20'),
(1639, 'Hufanoxil', 'BOTOL', 'Obat Syrup', 100, 3300, '1', '2020-11-12 02:15:20'),
(1640, 'Helixim syr', 'BOTOL', 'Obat Syrup', 100, 13600, '1', '2020-11-12 02:15:20'),
(1641, 'Hecosan syr', 'BOTOL', 'Obat Syrup', 100, 71500, '1', '2020-11-12 02:15:20'),
(1642, 'Isprinol syr', 'BOTOL', 'Obat Syrup', 100, 116200, '1', '2020-11-12 02:15:20'),
(1643, 'Iprox syr', 'BOTOL', 'Obat Syrup', 100, 64350, '1', '2020-11-12 02:15:20'),
(1644, 'Kamolas forte', 'BOTOL', 'Obat Syrup', 100, 27200, '1', '2020-11-12 02:15:20'),
(1645, 'Kandistatin drop', 'BOTOL', 'Obat Syrup', 100, 68000, '1', '2020-11-12 02:15:20'),
(1646, 'Lacophen syr', 'BOTOL', 'Obat Syrup', 100, 35750, '1', '2020-11-12 02:15:20'),
(1647, 'L-Zinc syr', 'BOTOL', 'Obat Syrup', 100, 47200, '1', '2020-11-12 02:15:20'),
(1648, 'Lapicef Drops', 'BOTOL', 'Obat Syrup', 100, 81700, '1', '2020-11-12 02:15:20'),
(1649, 'Mucogard suspensi', 'BOTOL', 'Obat Syrup', 100, 42900, '1', '2020-11-12 02:15:20'),
(1650, 'Maxiprinol syr', 'BOTOL', 'Obat Syrup', 100, 107250, '1', '2020-11-12 02:15:20'),
(1651, 'Monell syr', 'BOTOL', 'Obat Syrup', 100, 60800, '1', '2020-11-12 02:15:20'),
(1652, 'Monell Drops', 'BOTOL', 'Obat Syrup', 100, 60800, '1', '2020-11-12 02:15:20'),
(1653, 'Nymiko Drop', 'BOTOL', 'Obat Syrup', 100, 47000, '1', '2020-11-12 02:15:20'),
(1654, 'Norages Syr', 'BOTOL', 'Obat Syrup', 100, 44300, '1', '2020-11-12 02:15:20'),
(1655, 'Novadiar syr', 'BOTOL', 'Obat Syrup', 100, 11500, '1', '2020-11-12 02:15:20'),
(1656, 'Orafropen', 'BOTOL', 'Obat Syrup', 100, 7150, '1', '2020-11-12 02:15:20'),
(1657, 'Opicef syr', 'BOTOL', 'Obat Syrup', 100, 60100, '1', '2020-11-12 02:15:20'),
(1658, 'Opicef Forte', 'BOTOL', 'Obat Syrup', 100, 97250, '1', '2020-11-12 02:15:20'),
(1659, 'Ottopan syr', 'BOTOL', 'Obat Syrup', 100, 24300, '1', '2020-11-12 02:15:20'),
(1660, 'Ottopan Drop', 'BOTOL', 'Obat Syrup', 100, 32900, '1', '2020-11-12 02:15:20'),
(1661, 'Orezinc syr', 'BOTOL', 'Obat Syrup', 100, 46000, '1', '2020-11-12 02:15:20'),
(1662, 'Proceles Syr', 'BOTOL', 'Obat Syrup', 100, 55000, '1', '2020-11-12 02:15:20'),
(1663, 'Proza syr', 'BOTOL', 'Obat Syrup', 100, 114400, '1', '2020-11-12 02:15:20'),
(1664, 'Phenacold exp', 'BOTOL', 'Obat Syrup', 100, 13300, '1', '2020-11-12 02:15:20'),
(1665, 'Rovadin syr', 'BOTOL', 'Obat Syrup', 100, 65800, '1', '2020-11-12 02:15:20'),
(1666, 'Ranivell syr', 'BOTOL', 'Obat Syrup', 100, 78650, '1', '2020-11-12 02:15:20'),
(1667, 'Rhinos Junior', 'BOTOL', 'Obat Syrup', 100, 42900, '1', '2020-11-12 02:15:20'),
(1668, 'Sim-DHA', 'BOTOL', 'Obat Syrup', 100, 62900, '1', '2020-11-12 02:15:20'),
(1669, 'San-B-Plex ', 'BOTOL', 'Obat Syrup', 100, 26500, '1', '2020-11-12 02:15:20'),
(1670, 'Simzen Drops', 'BOTOL', 'Obat Syrup', 100, 78650, '1', '2020-11-12 02:15:20'),
(1671, 'Salbron syr', 'BOTOL', 'Obat Syrup', 100, 30000, '1', '2020-11-12 02:15:20'),
(1672, 'Trogyl syr', 'BOTOL', 'Obat Syrup', 100, 59700, '1', '2020-11-12 02:15:20'),
(1673, 'TB Rif Syr', 'BOTOL', 'Obat Syrup', 100, 135850, '1', '2020-11-12 02:15:20'),
(1674, 'TB Vit Syr 120 ml', 'BOTOL', 'Obat Syrup', 100, 42900, '1', '2020-11-12 02:15:20'),
(1675, 'Valeptik syr', 'BOTOL', 'Obat Syrup', 100, 114400, '1', '2020-11-12 02:15:20'),
(1676, 'Vostrin Syr', 'BOTOL', 'Obat Syrup', 100, 53700, '1', '2020-11-12 02:15:20'),
(1677, 'Vellepsy Syrup', 'BOTOL', 'Obat Syrup', 100, 119800, '1', '2020-11-12 02:15:20'),
(1678, 'Vosea Syr', 'BOTOL', 'Obat Syrup', 100, 6400, '1', '2020-11-12 02:15:20'),
(1679, 'Xepamol Drops', 'BOTOL', 'Obat Syrup', 100, 31500, '1', '2020-11-12 02:15:20'),
(1680, 'Xepamol Syrup', 'BOTOL', 'Obat Syrup', 100, 31500, '1', '2020-11-12 02:15:20'),
(1681, 'Xepafen Tablet', 'TABLET', 'Obat Syrup', 100, 700, '1', '2020-11-12 02:15:20'),
(1682, 'Xepaprim Syr', 'BOTOL', 'Obat Syrup', 100, 30000, '1', '2020-11-12 02:15:20'),
(1683, 'Zamel syr', 'BOTOL', 'Obat Syrup', 100, 53600, '1', '2020-11-12 02:15:20'),
(1684, 'Zamel Drop', 'BOTOL', 'Obat Syrup', 100, 56500, '1', '2020-11-12 02:15:20'),
(1685, 'Ikalep Syr', 'BOTOL', 'Obat Syrup', 100, 100100, '1', '2020-11-12 02:15:20'),
(1686, 'Zincpro syr', 'BOTOL', 'Obat Syrup', 100, 45700, '1', '2020-11-12 02:15:20'),
(1687, 'Amoxcilin', 'TABLET', 'Obat Tablet', 100, 280, '1', '2020-11-12 02:15:20'),
(1688, 'Amlodipine 10 mg', 'TABLET', 'Obat Tablet', 100, 2200, '1', '2020-11-12 02:15:20'),
(1689, 'Asam Folat ', 'TABLET', 'Obat Tablet', 100, 250, '1', '2020-11-12 02:15:20'),
(1690, 'Allopurinol 300', 'TABLET', 'Obat Tablet', 100, 700, '1', '2020-11-12 02:15:20'),
(1691, 'Aceytylcyteine', 'TABLET', 'Obat Tablet', 100, 1400, '1', '2020-11-12 02:15:20'),
(1692, 'Ampicilin', 'TABLET', 'Obat Tablet', 100, 400, '1', '2020-11-12 02:15:20'),
(1693, 'Betahistin', 'TABLET', 'Obat Tablet', 100, 1200, '1', '2020-11-12 02:15:20'),
(1694, 'Clopidogrel ', 'TABLET', 'Obat Tablet', 100, 14300, '1', '2020-11-12 02:15:20'),
(1695, 'Cloramphenicol tab', 'TABLET', 'Obat Tablet', 100, 600, '1', '2020-11-12 02:15:20'),
(1696, 'Candecartan 8mg', 'TABLET', 'Obat Tablet', 100, 7150, '1', '2020-11-12 02:15:20'),
(1697, 'Cotrimoxazole Peat', 'TABLET', 'Obat Tablet', 100, 500, '1', '2020-11-12 02:15:20'),
(1698, 'Cilostazol Tablet', 'TABLET', 'Obat Tablet', 100, 13600, '1', '2020-11-12 02:15:20'),
(1699, 'Candecartan 16 mg', 'TABLET', 'Obat Tablet', 100, 10100, '1', '2020-11-12 02:15:20'),
(1700, 'Dexketoprofen tab', 'TABLET', 'Obat Tablet', 100, 4300, '1', '2020-11-12 02:15:20'),
(1701, 'Donepezil ', 'TABLET', 'Obat Tablet', 100, 8500, '1', '2020-11-12 02:15:20'),
(1702, 'Domperidon Syr', 'BOTOL', 'Obat Tablet', 100, 20000, '1', '2020-11-12 02:15:20'),
(1703, 'Diltiazem', 'TABLET', 'Obat Tablet', 100, 125, '1', '2020-11-12 02:15:20'),
(1704, 'Doxycyline', 'TABLET', 'Obat Tablet', 100, 850, '1', '2020-11-12 02:15:20'),
(1705, 'Flunarizin tab', 'TABLET', 'Obat Tablet', 100, 2900, '1', '2020-11-12 02:15:20'),
(1706, 'Gemfibrozil', 'TABLET', 'Obat Tablet', 100, 400, '1', '2020-11-12 02:15:20'),
(1707, 'Griseofulvin 125 mg', 'TABLET', 'Obat Tablet', 100, 2200, '1', '2020-11-12 02:15:20'),
(1708, 'Gliquidon ', 'TABLET', 'Obat Tablet', 100, 1700, '1', '2020-11-12 02:15:20'),
(1709, 'Glimeperid 1mg', 'TABLET', 'Obat Tablet', 100, 1350, '1', '2020-11-12 02:15:20'),
(1710, 'Glimeperid 2mg', 'TABLET', 'Obat Tablet', 100, 1900, '1', '2020-11-12 02:15:20'),
(1711, 'Glimeperid 4mg', 'TABLET', 'Obat Tablet', 100, 3200, '1', '2020-11-12 02:15:20'),
(1712, 'Griseofulvin 500 mg', 'TABLET', 'Obat Tablet', 100, 1000, '1', '2020-11-12 02:15:20'),
(1713, 'GOM', 'TABLET', 'Obat Tablet', 100, 6000, '1', '2020-11-12 02:15:20'),
(1714, 'Glimeperid 3mg', 'TABLET', 'Obat Tablet', 100, 2100, '1', '2020-11-12 02:15:20'),
(1715, 'Lisinopril Tab', 'TABLET', 'Obat Tablet', 100, 700, '1', '2020-11-12 02:15:20'),
(1716, 'Methylerghometrine tablet', 'TABLET', 'Obat Tablet', 100, 1000, '1', '2020-11-12 02:15:20'),
(1717, 'Misoprostol tablet', 'TABLET', 'Obat Tablet', 100, 7150, '1', '2020-11-12 02:15:20'),
(1718, 'Metamizole Tab', 'TABLET', 'Obat Tablet', 100, 300, '1', '2020-11-12 02:15:20'),
(1719, 'Mecobalamin Tablet', 'TABLET', 'Obat Tablet', 100, 1000, '1', '2020-11-12 02:15:20'),
(1720, 'Metronidazol Syr', 'BOTOL', 'Obat Tablet', 100, 8400, '1', '2020-11-12 02:15:20'),
(1721, 'Pregabalin', 'TABLET', 'Obat Tablet', 100, 10000, '1', '2020-11-12 02:15:20'),
(1722, 'Propanolol 40mg', 'TABLET', 'Obat Tablet', 100, 500, '1', '2020-11-12 02:15:20'),
(1723, 'Diaform', 'TABLET', 'Obat Tablet', 100, 300, '1', '2020-11-12 02:15:20'),
(1724, 'Prokalk Tablet', 'TABLET', 'Obat Tablet', 100, 300, '1', '2020-11-12 02:15:20'),
(1725, 'Corsagrif ', 'TABLET', 'Obat Tablet', 100, 800, '1', '2020-11-12 02:15:20'),
(1726, 'Hupagrif', 'TABLET', 'Obat Tablet', 100, 500, '1', '2020-11-12 02:15:20');
INSERT INTO `b_obat` (`id`, `nama_obat`, `satuan`, `jenis_obat`, `stok`, `harga`, `is_active`, `timestamp`) VALUES
(1727, 'Kompolax Sirup', 'BOTOL', 'Obat Tablet', 100, 13000, '1', '2020-11-12 02:15:20'),
(1728, 'Baby Cought Syr', 'TABLET', 'Obat Tablet', 100, 7500, '1', '2020-11-12 02:15:20'),
(1729, 'Neurodex', 'TABLET', 'Obat Tablet', 100, 850, '1', '2020-11-12 02:15:20'),
(1730, 'Aspilet ', 'TABLET', 'Obat Tablet', 100, 6600, '1', '2020-11-12 02:15:20'),
(1731, 'Simarc', 'TABLET', 'Obat Tablet', 100, 1800, '1', '2020-11-12 02:15:20'),
(1732, 'Curcuma Syr', 'BOTOL', 'Obat Tablet', 100, 15000, '1', '2020-11-12 02:15:20'),
(1733, 'Zink syr', 'BOTOL', 'Obat Tablet', 100, 17100, '1', '2020-11-12 02:15:20'),
(1734, 'Bromhexine Hcl', 'TABLET', 'Obat Tablet', 100, 200, '1', '2020-11-12 02:15:20'),
(1735, 'Ramipril ', 'TABLET', 'Obat Tablet', 100, 1400, '1', '2020-11-12 02:15:20'),
(1736, 'Spinorolacton 25mg', 'TABLET', 'Obat Tablet', 100, 1200, '1', '2020-11-12 02:15:20'),
(1737, 'Spinorolacton 100mg', 'TABLET', 'Obat Tablet', 100, 1000, '1', '2020-11-12 02:15:20'),
(1738, 'Sulfazazine', 'TABLET', 'Obat Tablet', 100, 2600, '1', '2020-11-12 02:15:20'),
(1739, 'Tablet Tambah Darah (Fe+asam Folat)', 'TABLET', 'Obat Tablet', 100, 700, '1', '2020-11-12 02:15:20'),
(1740, 'Tamsulosin SR', 'TABLET', 'Obat Tablet', 100, 6200, '1', '2020-11-12 02:15:20'),
(1741, 'Ursodeoxycholic Acid', 'TABLET', 'Obat Tablet', 100, 8000, '1', '2020-11-12 02:15:20'),
(1742, 'Zink Tab', 'TABLET', 'Obat Tablet', 100, 600, '1', '2020-11-12 02:15:20'),
(1743, 'Asam Traneksamat 500 mg', 'TABLET', 'Obat Tablet', 100, 2500, '1', '2020-11-12 02:15:20'),
(1744, 'Ataroc', 'TABLET', 'Obat Tablet', 100, 3800, '1', '2020-11-12 02:15:20'),
(1745, 'Alif tab', 'TABLET', 'Obat Tablet', 100, 1800, '1', '2020-11-12 02:15:20'),
(1746, 'Alpara ', 'TABLET', 'Obat Tablet', 100, 1100, '1', '2020-11-12 02:15:20'),
(1747, 'Asifast', 'KAPLET', 'Obat Tablet', 100, 2000, '1', '2020-11-12 02:15:20'),
(1748, 'Albendazole ', 'TABLET', 'Obat Tablet', 100, 1800, '1', '2020-11-12 02:15:20'),
(1749, 'Aclam tablet', 'TABLET', 'Obat Tablet', 100, 20400, '1', '2020-11-12 02:15:20'),
(1750, 'A-B Vask 5mg', 'TABLET', 'Obat Tablet', 100, 8200, '1', '2020-11-12 02:15:20'),
(1751, 'Aricept Evess', 'TABLET', 'Obat Tablet', 100, 32400, '1', '2020-11-12 02:15:20'),
(1752, 'Amiodarone Tab', 'TABLET', 'Obat Tablet', 100, 10600, '1', '2020-11-12 02:15:20'),
(1753, 'Barzepin', 'TABLET', 'Obat Tablet', 100, 10000, '1', '2020-11-12 02:15:20'),
(1754, 'Bledstop tablet', 'TABLET', 'Obat Tablet', 100, 800, '1', '2020-11-12 02:15:20'),
(1755, 'Concor', 'TABLET', 'Obat Tablet', 100, 800, '1', '2020-11-12 02:15:20'),
(1756, 'Citicoline tab 500 mg', 'TABLET', 'Obat Tablet', 100, 9500, '1', '2020-11-12 02:15:20'),
(1757, 'Citicolin tab 1000 mg', 'TABLET', 'Obat Tablet', 100, 17200, '1', '2020-11-12 02:15:20'),
(1758, 'Citicoline 250 inj', 'AMPUL', 'Obat Tablet', 100, 19500, '1', '2020-11-12 02:15:20'),
(1759, 'Canderin 8 tab', 'TABLET', 'Obat Tablet', 100, 8600, '1', '2020-11-12 02:15:20'),
(1760, 'Cataflam Fast 50 mg', 'SACHET', 'Obat Tablet', 100, 10500, '1', '2020-11-12 02:15:20'),
(1761, 'Cataflam Disp 50 mg', 'TABLET', 'Obat Tablet', 100, 7300, '1', '2020-11-12 02:15:20'),
(1762, 'Calos (caco3)', 'TABLET', 'Obat Tablet', 100, 1100, '1', '2020-11-12 02:15:20'),
(1763, 'Combantrin', 'TABLET', 'Obat Tablet', 96, 7400, '1', '2020-11-12 02:15:20'),
(1764, 'Ciflon Tablet', 'TABLET', 'Obat Tablet', 100, 12100, '1', '2020-11-12 02:15:20'),
(1765, 'Degrium 5 mg', 'TABLET', 'Obat Tablet', 100, 7550, '1', '2020-11-12 02:15:20'),
(1766, 'Diklovit tablet', 'TABLET', 'Obat Tablet', 100, 3700, '1', '2020-11-12 02:15:20'),
(1767, 'Dorium Kaplet', 'KAPLET', 'Obat Tablet', 100, 4700, '1', '2020-11-12 02:15:20'),
(1768, 'Ezygard forte', 'TABLET', 'Obat Tablet', 100, 7100, '1', '2020-11-12 02:15:20'),
(1769, 'Ericap', 'TABLET', 'Obat Tablet', 100, 6650, '1', '2020-11-12 02:15:20'),
(1770, 'Etabion tab', 'TABLET', 'Obat Tablet', 100, 500, '1', '2020-11-12 02:15:20'),
(1771, 'Euthyrox ', 'TABLET', 'Obat Tablet', 100, 1300, '1', '2020-11-12 02:15:20'),
(1772, 'Floksid', 'TABLET', 'Obat Tablet', 100, 15750, '1', '2020-11-12 02:15:20'),
(1773, 'Fastor', 'TABLET', 'Obat Tablet', 100, 17800, '1', '2020-11-12 02:15:20'),
(1774, 'Folamet ', 'TABLET', 'Obat Tablet', 100, 210, '1', '2020-11-12 02:15:20'),
(1775, 'Folavicap 1000', 'TABLET', 'Obat Tablet', 100, 2400, '1', '2020-11-12 02:15:20'),
(1776, 'Folavicap 400 ', 'TABLET', 'Obat Tablet', 100, 1200, '1', '2020-11-12 02:15:20'),
(1777, 'Fycompa 2 mg', 'TABLET', 'Obat Tablet', 100, 20300, '1', '2020-11-12 02:15:20'),
(1778, 'Fycompa 4 mg', 'TABLET', 'Obat Tablet', 100, 30500, '1', '2020-11-12 02:15:20'),
(1779, 'Glumin xr ', 'TABLET', 'Obat Tablet', 100, 2450, '1', '2020-11-12 02:15:20'),
(1780, 'Glicab tablet', 'TABLET', 'Obat Tablet', 100, 1900, '1', '2020-11-12 02:15:20'),
(1781, 'Glamarol 2 mg', 'TABLET', 'Obat Tablet', 100, 5700, '1', '2020-11-12 02:15:20'),
(1782, 'Granopi Tablet', 'TABLET', 'Obat Tablet', 100, 28600, '1', '2020-11-12 02:15:20'),
(1783, 'Glinov Kapsul', 'KAPSUL', 'Obat Tablet', 100, 11150, '1', '2020-11-12 02:15:20'),
(1784, 'Hyperil', 'TABLET', 'Obat Tablet', 100, 10000, '1', '2020-11-12 02:15:20'),
(1785, 'Haloperidol Tablet', 'TABLET', 'Obat Tablet', 100, 100, '1', '2020-11-12 02:15:20'),
(1786, 'Imuran', 'TABLET', 'Obat Tablet', 100, 8750, '1', '2020-11-12 02:15:20'),
(1787, 'Irvel', 'TABLET', 'Obat Tablet', 100, 15750, '1', '2020-11-12 02:15:20'),
(1788, 'Ikaneuron 5000 tab', 'TABLET', 'Obat Tablet', 100, 2900, '1', '2020-11-12 02:15:20'),
(1789, 'Ikaneuron tablet', 'TABLET', 'Obat Tablet', 100, 1900, '1', '2020-11-12 02:15:20'),
(1790, 'Immuno One Tablet', 'TABLET', 'Obat Tablet', 100, 17300, '1', '2020-11-12 02:15:20'),
(1791, 'Lycoxy', 'KAPLET', 'Obat Tablet', 100, 6100, '1', '2020-11-12 02:15:20'),
(1792, 'Lapiflox kaplet', 'KAPLET', 'Obat Tablet', 100, 18600, '1', '2020-11-12 02:15:20'),
(1793, 'Lapifed Tablet', 'TABLET', 'Obat Tablet', 100, 3600, '1', '2020-11-12 02:15:20'),
(1794, 'Levopar Tablet', 'TABLET', 'Obat Tablet', 100, 2200, '1', '2020-11-12 02:15:20'),
(1795, 'Leparson Tablet', 'TABLET', 'Obat Tablet', 100, 2800, '1', '2020-11-12 02:15:20'),
(1796, 'LIbrozym tab', 'TABLET', 'Obat Tablet', 100, 1400, '1', '2020-11-12 02:15:20'),
(1797, 'Loperamid tab', 'TABLET', 'Obat Tablet', 100, 400, '1', '2020-11-12 02:15:20'),
(1798, 'Metifer 500 caps', 'TABLET', 'Obat Tablet', 100, 2300, '1', '2020-11-12 02:15:20'),
(1799, 'Methergin tab', 'TABLET', 'Obat Tablet', 100, 4400, '1', '2020-11-12 02:15:20'),
(1800, 'Mipros', 'TABLET', 'Obat Tablet', 100, 11900, '1', '2020-11-12 02:15:20'),
(1801, 'Medixon tab 8 mg', 'TABLET', 'Obat Tablet', 100, 5300, '1', '2020-11-12 02:15:20'),
(1802, 'Moxic Tablet', 'TABLET', 'Obat Tablet', 100, 7800, '1', '2020-11-12 02:15:20'),
(1803, 'Maxcef ', 'TABLET', 'Obat Tablet', 100, 13600, '1', '2020-11-12 02:15:20'),
(1804, 'Norflam', 'TABLET', 'Obat Tablet', 100, 4300, '1', '2020-11-12 02:15:20'),
(1805, 'Natto tab', 'KAPSUL', 'Obat Tablet', 100, 12800, '1', '2020-11-12 02:15:20'),
(1806, 'Opicef kapsul', 'KAPSUL', 'Obat Tablet', 100, 13600, '1', '2020-11-12 02:15:20'),
(1807, 'Opicort Tablet', 'TABLET', 'Obat Tablet', 100, 4600, '1', '2020-11-12 02:15:20'),
(1808, 'Proliver', 'KAPLET', 'Obat Tablet', 100, 7150, '1', '2020-11-12 02:15:20'),
(1809, 'Prenatin DF', 'TABLET', 'Obat Tablet', 88, 3600, '1', '2020-11-12 02:15:20'),
(1810, 'preabor', 'KAPLET', 'Obat Tablet', 100, 4900, '1', '2020-11-12 02:15:20'),
(1811, 'PRO TB', 'TABLET', 'Obat Tablet', 100, 7100, '1', '2020-11-12 02:15:20'),
(1812, 'Pepzol tablet', 'TABLET', 'Obat Tablet', 100, 18600, '1', '2020-11-12 02:15:20'),
(1813, 'Proris', 'TABLET', 'Obat Tablet', 100, 1400, '1', '2020-11-12 02:15:20'),
(1814, 'Paratusin ', 'TABLET', 'Obat Tablet', 100, 1300, '1', '2020-11-12 02:15:20'),
(1815, 'Prostam SR', 'TABLET', 'Obat Tablet', 100, 16900, '1', '2020-11-12 02:15:20'),
(1816, 'Proterin Tablet', 'TABLET', 'Obat Tablet', 100, 6400, '1', '2020-11-12 02:15:20'),
(1817, 'Rofiden tab', 'TABLET', 'Obat Tablet', 100, 5000, '1', '2020-11-12 02:15:20'),
(1818, 'Rimstar tab', 'TABLET', 'Obat Tablet', 100, 8100, '1', '2020-11-12 02:15:20'),
(1819, 'Rimactazid tab', 'TABLET', 'Obat Tablet', 100, 12400, '1', '2020-11-12 02:15:20'),
(1820, 'Rifamtibi 450', 'TABLET', 'Obat Tablet', 100, 6200, '1', '2020-11-12 02:15:20'),
(1821, 'Rosufer', 'TABLET', 'Obat Tablet', 100, 14000, '1', '2020-11-12 02:15:20'),
(1822, 'Rebamid', 'TABLET', 'Obat Tablet', 100, 4900, '1', '2020-11-12 02:15:20'),
(1823, 'Rifastar tablet', 'TABLET', 'Obat Tablet', 100, 5200, '1', '2020-11-12 02:15:20'),
(1824, 'Rifan H ', 'KAPLET', 'Obat Tablet', 100, 3000, '1', '2020-11-12 02:15:20'),
(1825, 'Regumen Tablet', 'TABLET', 'Obat Tablet', 100, 5400, '1', '2020-11-12 02:15:20'),
(1826, 'Respira ', 'TABLET', 'Obat Tablet', 100, 42900, '1', '2020-11-12 02:15:20'),
(1827, 'Rostin Tablet', 'TABLET', 'Obat Tablet', 100, 17200, '1', '2020-11-12 02:15:20'),
(1828, 'Stamotens 5', 'TABLET', 'Obat Tablet', 100, 7900, '1', '2020-11-12 02:15:20'),
(1829, 'Sandepril ', 'TABLET', 'Obat Tablet', 100, 11400, '1', '2020-11-12 02:15:20'),
(1830, 'Stator', 'TABLET', 'Obat Tablet', 100, 21450, '1', '2020-11-12 02:15:20'),
(1831, 'Stamotens 10', 'TABLET', 'Obat Tablet', 100, 13600, '1', '2020-11-12 02:15:20'),
(1832, 'Sohobion 5000', 'TABLET', 'Obat Tablet', 100, 1500, '1', '2020-11-12 02:15:20'),
(1833, 'Simclovix tablet', 'TABLET', 'Obat Tablet', 100, 16400, '1', '2020-11-12 02:15:20'),
(1834, 'Simciti kapsul', 'KAPSUL', 'Obat Tablet', 100, 11400, '1', '2020-11-12 02:15:20'),
(1835, 'TB Vit 6', 'TABLET', 'Obat Tablet', 100, 1200, '1', '2020-11-12 02:15:20'),
(1836, 'Triptagic', 'TABLET', 'Obat Tablet', 100, 59900, '1', '2020-11-12 02:15:20'),
(1837, 'Azithromycin', 'TABLET', 'Obat Tablet', 100, 14300, '1', '2020-11-12 02:15:20'),
(1838, 'Gliformin kaplet', 'TABLET', 'Obat Tablet', 100, 1800, '1', '2020-11-12 02:15:20'),
(1839, 'Therodel', 'KAPLET', 'Obat Tablet', 100, 19500, '1', '2020-11-12 02:15:20'),
(1840, 'Toramin Tablet', 'TABLET', 'Obat Tablet', 100, 7150, '1', '2020-11-12 02:15:20'),
(1841, 'Trilac Tablet', 'TABLET', 'Obat Tablet', 100, 5100, '1', '2020-11-12 02:15:20'),
(1842, 'TEQUINOL', 'KAPLET', 'Obat Tablet', 100, 17200, '1', '2020-11-12 02:15:20'),
(1843, 'Ultravita Kaplet', 'KAPLET', 'Obat Tablet', 100, 3300, '1', '2020-11-12 02:15:20'),
(1844, 'Urief tablet', 'TABLET', 'Obat Tablet', 100, 9000, '1', '2020-11-12 02:15:20'),
(1845, 'Utrogestan 100 mg', 'TABLET', 'Obat Tablet', 100, 17200, '1', '2020-11-12 02:15:20'),
(1846, 'Vomerin', 'TABLET', 'Obat Tablet', 100, 4600, '1', '2020-11-12 02:15:20'),
(1847, 'Vercure tablet', 'TABLET', 'Obat Tablet', 100, 2000, '1', '2020-11-12 02:15:20'),
(1848, 'Vosea tablet', 'TABLET', 'Obat Tablet', 100, 300, '1', '2020-11-12 02:15:20'),
(1849, 'Xiety tab', 'TABLET', 'Obat Tablet', 100, 5150, '1', '2020-11-12 02:15:20'),
(1850, 'Zitrolin ', 'KAPLET', 'Obat Tablet', 100, 47200, '1', '2020-11-12 02:15:20'),
(1851, 'Zegren tablet', 'TABLET', 'Obat Tablet', 100, 1900, '1', '2020-11-12 02:15:20'),
(1852, 'Folac Tablet', 'TABLET', 'Obat Tablet', 100, 1400, '1', '2020-11-12 02:15:20'),
(1853, 'Clorampenicol tts mata', 'TUBE', 'Obat Tetes', 100, 10000, '1', '2020-11-12 02:15:20'),
(1854, 'Erlamicetin tetets mata', 'TUBE', 'Obat Tetes', 100, 20000, '1', '2020-11-12 02:15:20'),
(1855, 'Albotil', 'BOTOL', 'Obat Tetes', 100, 50050, '1', '2020-11-12 02:15:20'),
(1856, 'Breathy Drops', 'BOTOL', 'Obat Tetes', 100, 53600, '1', '2020-11-12 02:15:20'),
(1857, 'Cendo pantocain', 'ML', 'Obat Tetes', 100, 11400, '1', '2020-11-12 02:15:20'),
(1858, 'Cendo pantocain botol', 'BOTOL', 'Obat Tetes', 100, 57200, '1', '2020-11-12 02:15:20'),
(1859, 'Dulcolax Tablet', 'TABLET', 'Obat Tetes', 100, 2000, '1', '2020-11-12 02:15:20'),
(1860, 'Isotic Adretor', 'BOTOL', 'Obat Tetes', 100, 28900, '1', '2020-11-12 02:15:20'),
(1861, 'Kertas puyer press', 'SACHET', 'PELENGKAP', 100, 250, '1', '2020-11-12 02:15:20'),
(1862, 'KMS', 'PCS', 'PELENGKAP', 100, 10000, '1', '2020-11-12 02:15:20'),
(1863, 'AQUA DM', 'LITER', 'PELENGKAP', 100, 3900, '1', '2020-11-12 02:15:20'),
(1864, 'Aqua sonic gel', 'ML', 'PELENGKAP', 100, 400, '1', '2020-11-12 02:15:20'),
(1865, 'Capsul kosong no.0', 'PCS', 'PELENGKAP', 100, 57, '1', '2020-11-12 02:15:20'),
(1866, 'Capsul kosong no.00', 'PCS', 'PELENGKAP', 100, 100, '1', '2020-11-12 02:15:20'),
(1867, 'Capsul kosong no.1', 'PCS', 'PELENGKAP', 100, 50, '1', '2020-11-12 02:15:20'),
(1868, 'Capsul kosong no.2', 'PCS', 'PELENGKAP', 100, 50, '1', '2020-11-12 02:15:20'),
(1869, 'Capsul kosong n0.3', 'PCS', 'PELENGKAP', 100, 50, '1', '2020-11-12 02:15:20'),
(1870, 'Kertas Puyer', 'LEMBAR', 'PELENGKAP', 100, 50, '1', '2020-11-12 02:15:20'),
(1871, 'Blue Tip', 'PCS', 'PELENGKAP', 100, 1200, '1', '2020-11-12 02:15:20'),
(1872, 'Kartu golongan darah', 'PCS', 'PELENGKAP', 100, 700, '1', '2020-11-12 02:15:20'),
(1873, 'Lampu halogen osra 6 v 10 W', 'PCS', 'PELENGKAP', 100, 0, '1', '2020-11-12 02:15:20'),
(1874, 'Lampu Photometer Ependrop', 'PCS', 'PELENGKAP', 100, 0, '1', '2020-11-12 02:15:20'),
(1875, 'Micro Led', 'PCS', 'PELENGKAP', 100, 58500, '1', '2020-11-12 02:15:20'),
(1876, 'Sikat tabung', 'PCS', 'PELENGKAP', 100, 28600, '1', '2020-11-12 02:15:20'),
(1877, 'Sample Cups', 'PCS', 'PELENGKAP', 100, 1800, '1', '2020-11-12 02:15:20'),
(1878, 'Tabung Reaksi', 'PCS', 'PELENGKAP', 100, 568750, '1', '2020-11-12 02:15:20'),
(1879, 'Tabung Reaksi Besar', 'PCS', 'PELENGKAP', 100, 0, '1', '2020-11-12 02:15:20'),
(1880, 'Tabung reaksi kecil', 'PCS', 'PELENGKAP', 100, 4125, '1', '2020-11-12 02:15:20'),
(1881, 'Tabung Westergen', 'PCS', 'PELENGKAP', 100, 22000, '1', '2020-11-12 02:15:20'),
(1882, 'Thermal paper 3.5 Diagon', 'ROL', 'PELENGKAP', 100, 71500, '1', '2020-11-12 02:15:20'),
(1883, 'Thermal paper No.8', 'ROL', 'PELENGKAP', 100, 43000, '1', '2020-11-12 02:15:20'),
(1884, 'Tabung Pyrex', 'PCS', 'PELENGKAP', 100, 14950, '1', '2020-11-12 02:15:20'),
(1885, 'Yellow Tip', 'PCS', 'PELENGKAP', 100, 650, '1', '2020-11-12 02:15:20'),
(1886, 'Macro Leb', 'PCS', 'PELENGKAP', 100, 58500, '1', '2020-11-12 02:15:20'),
(1887, 'Gel USG', 'ML', 'PELENGKAP', 100, 85, '1', '2020-11-12 02:15:20'),
(1888, 'Gel USG TUBE', 'BOTOL', 'PELENGKAP', 100, 35750, '1', '2020-11-12 02:15:20'),
(1889, 'Spiritus', 'LITER', 'PELENGKAP', 100, 64900, '1', '2020-11-12 02:15:20'),
(1890, 'Paket Mandi C', 'BUNGKUS', 'PELENGKAP', 100, 0, '1', '2020-11-12 02:15:20'),
(1891, 'Ephedrin HCL', 'AMPUL', 'Precusor', 100, 76450, '1', '2020-11-12 02:15:20'),
(1892, 'Aldisa SR', 'TABLET', 'Precusor', 100, 7700, '1', '2020-11-12 02:15:20'),
(1893, 'Cytotec', 'TABLET', 'Precusor', 100, 23000, '1', '2020-11-12 02:15:20'),
(1894, 'Lapifed syr', 'BOTOL', 'Precusor', 100, 34300, '1', '2020-11-12 02:15:20'),
(1895, 'Pospargin tab', 'TABLET', 'Precusor', 100, 900, '1', '2020-11-12 02:15:20'),
(1896, 'Pospargin inj', 'AMPUL', 'Precusor', 100, 8250, '1', '2020-11-12 02:15:20'),
(1897, 'Rhinos SR', 'KAPSUL', 'Precusor', 100, 6450, '1', '2020-11-12 02:15:20'),
(1898, 'Rhinofed tab', 'TABLET', 'Precusor', 100, 2200, '1', '2020-11-12 02:15:20'),
(1899, 'Rhinofed sirup', 'BOTOL', 'Precusor', 100, 35750, '1', '2020-11-12 02:15:20'),
(1900, 'Tramadol', 'KAPSUL', 'Precusor', 100, 2000, '1', '2020-11-12 02:15:20'),
(1901, 'Tremenza tab', 'TABLET', 'Precusor', 100, 2300, '1', '2020-11-12 02:15:20'),
(1902, 'Tremenza Sirup', 'BOTOL', 'Precusor', 100, 29300, '1', '2020-11-12 02:15:20'),
(1903, 'Tramadol Ampul', 'AMPUL', 'Precusor', 100, 20000, '1', '2020-11-12 02:15:20'),
(1904, 'Valium', 'AMPUL', 'Precusor', 100, 37900, '1', '2020-11-12 02:15:20'),
(1905, 'Amitriptiline', 'TABLET', 'Psikotropika', 100, 1050, '1', '2020-11-12 02:15:20'),
(1906, 'Alprazolam 0.5 mg', 'BOX', 'Psikotropika', 100, 800, '1', '2020-11-12 02:15:20'),
(1907, 'Carbamazepine', 'TABLET', 'Psikotropika', 100, 1200, '1', '2020-11-12 02:15:20'),
(1908, 'Chlorpromazin 100', 'TABLET', 'Psikotropika', 100, 1500, '1', '2020-11-12 02:15:20'),
(1909, 'Chlorpromazin 25', 'TABLET', 'Psikotropika', 100, 300, '1', '2020-11-12 02:15:20'),
(1910, 'Clobazam', 'TABLET', 'Psikotropika', 100, 1300, '1', '2020-11-12 02:15:20'),
(1911, 'Diazepam 5mg', 'TABLET', 'Psikotropika', 100, 200, '1', '2020-11-12 02:15:20'),
(1912, 'Phenobarbital tablet', 'TABLET', 'Psikotropika', 100, 350, '1', '2020-11-12 02:15:20'),
(1913, 'Phenobarbital inj', 'AMPUL', 'Psikotropika', 100, 8600, '1', '2020-11-12 02:15:20'),
(1914, 'Risperidone 2 mg', 'TABLET', 'Psikotropika', 100, 3900, '1', '2020-11-12 02:15:20'),
(1915, 'Diazepam 2mg', 'TABLET', 'Psikotropika', 100, 200, '1', '2020-11-12 02:15:20'),
(1916, 'Eosin ', 'BOTOL', 'Psikotropika', 100, 528000, '1', '2020-11-12 02:15:20'),
(1917, 'Ez cleaner BC3', 'KIT', 'Psikotropika', 100, 1820000, '1', '2020-11-12 02:15:20'),
(1918, 'Alganax 0,25 mg', 'TABLET', 'Psikotropika', 100, 2700, '1', '2020-11-12 02:15:20'),
(1919, 'Alganax 0,50 mg', 'TABLET', 'Psikotropika', 100, 4700, '1', '2020-11-12 02:15:20'),
(1920, 'Analsik', 'TABLET', 'Psikotropika', 100, 2200, '1', '2020-11-12 02:15:20'),
(1921, 'Arkine', 'TABLET', 'Psikotropika', 100, 1000, '1', '2020-11-12 02:15:20'),
(1922, 'Atarax 0.5 mg', 'TABLET', 'Psikotropika', 100, 1900, '1', '2020-11-12 02:15:20'),
(1923, 'Braxidin', 'TABLET', 'Psikotropika', 100, 1600, '1', '2020-11-12 02:15:20'),
(1924, 'Bellapen', 'KAPLET', 'Psikotropika', 100, 1800, '1', '2020-11-12 02:15:20'),
(1925, 'Bamgetol', 'TABLET', 'Psikotropika', 100, 2500, '1', '2020-11-12 02:15:20'),
(1926, 'Danalgin', 'TABLET', 'Psikotropika', 100, 1400, '1', '2020-11-12 02:15:20'),
(1927, 'Ditalin', 'TABLET', 'Psikotropika', 100, 2150, '1', '2020-11-12 02:15:20'),
(1928, 'Esilgan 1 mg', 'TABLET', 'Psikotropika', 100, 4600, '1', '2020-11-12 02:15:20'),
(1929, 'Esilgan 2 mg', 'TABLET', 'Psikotropika', 100, 6400, '1', '2020-11-12 02:15:20'),
(1930, 'Enzyplex', 'TABLET', 'Psikotropika', 100, 1100, '1', '2020-11-12 02:15:20'),
(1931, 'Kalxetin kapsul', 'KAPSUL', 'Psikotropika', 100, 8200, '1', '2020-11-12 02:15:20'),
(1932, 'Librax tab', 'TABLET', 'Psikotropika', 100, 3000, '1', '2020-11-12 02:15:20'),
(1933, 'Pridesia', 'TABLET', 'Psikotropika', 100, 2700, '1', '2020-11-12 02:15:20'),
(1934, 'Potensik', 'KAPLET', 'Psikotropika', 100, 1450, '1', '2020-11-12 02:15:20'),
(1935, 'Phental inj', 'AMPUL', 'Psikotropika', 100, 11800, '1', '2020-11-12 02:15:20'),
(1936, 'Sanmag Tab', 'TABLET', 'Psikotropika', 100, 1300, '1', '2020-11-12 02:15:20'),
(1937, 'Stesolid 10 mg', 'TUBE', 'Psikotropika', 100, 114400, '1', '2020-11-12 02:15:20'),
(1938, 'Stesolid 5 mg', 'TUBE', 'Psikotropika', 100, 107250, '1', '2020-11-12 02:15:20'),
(1939, 'Stesolid', 'AMPUL', 'Psikotropika', 100, 14900, '1', '2020-11-12 02:15:20'),
(1940, 'Valisanbe 2', 'TABLET', 'Psikotropika', 100, 300, '1', '2020-11-12 02:15:20'),
(1941, 'Valisanbe 5', 'TABLET', 'Psikotropika', 100, 550, '1', '2020-11-12 02:15:20'),
(1942, 'Vitazym tab', 'TABLET', 'Psikotropika', 100, 1000, '1', '2020-11-12 02:15:20'),
(1943, 'Valisanbe Inj.', 'VIAL', 'Psikotropika', 100, 25700, '1', '2020-11-12 02:15:20'),
(1944, 'Valdimex 5 mg', 'TABLET', 'Psikotropika', 100, 1600, '1', '2020-11-12 02:15:20'),
(1945, 'Valdimex inj', 'AMPUL', 'Psikotropika', 100, 15700, '1', '2020-11-12 02:15:20'),
(1946, 'Zypraz 0.25 mg', 'TABLET', 'Psikotropika', 100, 1650, '1', '2020-11-12 02:15:20'),
(1947, 'Zypraz 0.5 mg', 'TABLET', 'Psikotropika', 100, 3100, '1', '2020-11-12 02:15:20'),
(1948, 'Cassette + Screen 24 x 30', 'PCS', 'Radiologi', 100, 5376250, '1', '2020-11-12 02:15:20'),
(1949, 'Developer Powder', 'BOX', 'Radiologi', 100, 643500, '1', '2020-11-12 02:15:20'),
(1950, 'Film Fuji DI HL 20 X 25', 'PCS', 'Radiologi', 100, 17100, '1', '2020-11-12 02:15:20'),
(1951, 'Film Fuji DI HL 35 X 43', 'PCS', 'Radiologi', 100, 45800, '1', '2020-11-12 02:15:20'),
(1952, 'Film 18 x 24', 'PCS', 'Radiologi', 100, 16700, '1', '2020-11-12 02:15:20'),
(1953, 'Film 24 x 30', 'PCS', 'Radiologi', 100, 21200, '1', '2020-11-12 02:15:20'),
(1954, 'Film 30 x 40', 'PCS', 'Radiologi', 100, 31900, '1', '2020-11-12 02:15:20'),
(1955, 'Film 35 x 35', 'PCS', 'Radiologi', 100, 42200, '1', '2020-11-12 02:15:20'),
(1956, 'Fixir Powder', 'PCS', 'Radiologi', 100, 631000, '1', '2020-11-12 02:15:20'),
(1957, 'Prodigy Test Strip', 'PCS', 'Reagen Lab', 100, 6700, '1', '2020-11-12 02:15:20'),
(1958, 'GDS', 'KIT', 'Reagen Lab', 100, 0, '1', '2020-11-12 02:15:20'),
(1959, 'Lancet Device', 'PCS', 'Reagen Lab', 100, 65000, '1', '2020-11-12 02:15:20'),
(1960, 'Albumin', 'KIT', 'Reagen Lab', 100, 3217500, '1', '2020-11-12 02:15:20'),
(1961, 'Bilirubin', 'KIT', 'Reagen Lab', 100, 1009950, '1', '2020-11-12 02:15:20'),
(1962, 'Buffer PH 7.2 ', 'BOTOL', 'Reagen Lab', 100, 169000, '1', '2020-11-12 02:15:20'),
(1963, 'B-Z cleaner Dirui', 'KIT', 'Reagen Lab', 100, 1820000, '1', '2020-11-12 02:15:20'),
(1964, 'B-Z Cleaner Diagon', 'KIT', 'Reagen Lab', 100, 1820000, '1', '2020-11-12 02:15:20'),
(1965, 'Biochemistri Control Serum', 'KIT', 'Reagen Lab', 100, 3575000, '1', '2020-11-12 02:15:20'),
(1966, 'BF Detergent 500ml/botol', 'KIT', 'Reagen Lab', 100, 7260000, '1', '2020-11-12 02:15:20'),
(1967, 'Bilirubin Direct', 'KIT', 'Reagen Lab', 100, 3360500, '1', '2020-11-12 02:15:20'),
(1968, 'Cholesterol', 'KIT', 'Reagen Lab', 100, 1340600, '1', '2020-11-12 02:15:20'),
(1969, 'Clenaer diagon', 'KIT', 'Reagen Lab', 100, 845000, '1', '2020-11-12 02:15:20'),
(1970, 'Control Hematologi 6500', 'FLES', 'Reagen Lab', 100, 4004000, '1', '2020-11-12 02:15:20'),
(1971, 'Creatinin', 'KIT', 'Reagen Lab', 100, 1322750, '1', '2020-11-12 02:15:20'),
(1972, 'Control Hematoligi Dirui 3000', 'KIT', 'Reagen Lab', 100, 1040000, '1', '2020-11-12 02:15:20'),
(1973, 'Cleancer dirui', 'KIT', 'Reagen Lab', 100, 1430000, '1', '2020-11-12 02:15:20'),
(1974, 'Cleancer 3600', 'KIT', 'Reagen Lab', 100, 4290000, '1', '2020-11-12 02:15:20'),
(1975, 'Callbrator', 'KIT', 'Reagen Lab', 100, 357000, '1', '2020-11-12 02:15:20'),
(1976, 'CBC ST Plus Normal 2.5 ml', 'KIT', 'Reagen Lab', 100, 1430000, '1', '2020-11-12 02:15:20'),
(1977, 'Dalf Urysa 10 L / Uri Tes', 'PCS', 'Reagen Lab', 100, 5750, '1', '2020-11-12 02:15:20'),
(1978, 'Dengue NS 1', 'PCS', 'Reagen Lab', 100, 195600, '1', '2020-11-12 02:15:20'),
(1979, 'Diluent 3000', 'BOTOL', 'Reagen Lab', 100, 1755000, '1', '2020-11-12 02:15:20'),
(1980, 'Lyse Dirui 3000', 'KIT', 'Reagen Lab', 100, 4030000, '1', '2020-11-12 02:15:20'),
(1981, 'Detergent BF', 'KIT', 'Reagen Lab', 100, 7865000, '1', '2020-11-12 02:15:20'),
(1982, 'Diluen BF 6000', 'KIT', 'Reagen Lab', 100, 3168000, '1', '2020-11-12 02:15:20'),
(1983, 'Diluen 3600', 'KIT', 'Reagen Lab', 100, 3146000, '1', '2020-11-12 02:15:20'),
(1984, 'Reagent Pack Elektrolite', 'KIT', 'Reagen Lab', 100, 7800000, '1', '2020-11-12 02:15:20'),
(1985, 'Glucose ', 'KIT', 'Reagen Lab', 100, 1251250, '1', '2020-11-12 02:15:20'),
(1986, 'Golongan darah anti A', 'BOTOL', 'Reagen Lab', 100, 227500, '1', '2020-11-12 02:15:20'),
(1987, 'Golongan darah anti AB', 'BOTOL', 'Reagen Lab', 100, 227500, '1', '2020-11-12 02:15:20'),
(1988, 'Golongan darah anti B', 'BOTOL', 'Reagen Lab', 100, 227500, '1', '2020-11-12 02:15:20'),
(1989, 'Golongan darah anti D', 'BOTOL', 'Reagen Lab', 100, 292500, '1', '2020-11-12 02:15:20'),
(1990, 'Haemoglobin', 'KIT', 'Reagen Lab', 100, 825000, '1', '2020-11-12 02:15:20'),
(1991, 'HDL-Cholesterol', 'KIT', 'Reagen Lab', 100, 1993000, '1', '2020-11-12 02:15:20'),
(1992, 'HbA1c', 'KIT', 'Reagen Lab', 100, 3076600, '1', '2020-11-12 02:15:20'),
(1993, 'Lyse Hemolysin', 'KIT', 'Reagen Lab', 100, 3300000, '1', '2020-11-12 02:15:20'),
(1994, 'I-Chamber', 'BOX', 'Reagen Lab', 100, 1144000, '1', '2020-11-12 02:15:20'),
(1995, 'Kisi', 'KIT', 'Reagen Lab', 100, 3575000, '1', '2020-11-12 02:15:20'),
(1996, 'lyse Diagon', 'KIT', 'Reagen Lab', 100, 4030000, '1', '2020-11-12 02:15:20'),
(1997, 'Lyse BF SLS  500 ml', 'KIT', 'Reagen Lab', 100, 6864000, '1', '2020-11-12 02:15:20'),
(1998, 'Lyse BF FDT 500 ml', 'KIT', 'Reagen Lab', 100, 3300000, '1', '2020-11-12 02:15:20'),
(1999, 'Lyse BF FDO 5 L', 'KIT', 'Reagen Lab', 100, 16500000, '1', '2020-11-12 02:15:20'),
(2000, 'Liquit', 'KIT', 'Reagen Lab', 100, 2359500, '1', '2020-11-12 02:15:20'),
(2001, 'Lyse 3600', 'KIT', 'Reagen Lab', 100, 4862000, '1', '2020-11-12 02:15:20'),
(2002, 'Probe Clener Dirui', 'KIT', 'Reagen Lab', 100, 1105000, '1', '2020-11-12 02:15:20'),
(2003, 'Probe Clener Diagon', 'KIT', 'Reagen Lab', 100, 1215500, '1', '2020-11-12 02:15:20'),
(2004, 'Rinse Dirui', 'KIT', 'Reagen Lab', 100, 929500, '1', '2020-11-12 02:15:20'),
(2005, 'Rinse Diagon', 'KIT', 'Reagen Lab', 100, 845000, '1', '2020-11-12 02:15:20'),
(2006, 'Reagen AGD', 'KIT', 'Reagen Lab', 100, 4633200, '1', '2020-11-12 02:15:20'),
(2007, 'Rotor', 'KIT', 'Reagen Lab', 100, 589800, '1', '2020-11-12 02:15:20'),
(2008, 'Reagent Pack Elektrolytes Analyzer', 'KIT', 'Reagen Lab', 100, 3146000, '1', '2020-11-12 02:15:20'),
(2009, 'SGOT', 'KIT', 'Reagen Lab', 100, 1773200, '1', '2020-11-12 02:15:20'),
(2010, 'SGPT', 'KIT', 'Reagen Lab', 100, 1773200, '1', '2020-11-12 02:15:20'),
(2011, 'Special Wash / Additve F ', 'KIT', 'Reagen Lab', 100, 1340600, '1', '2020-11-12 02:15:20'),
(2012, 'Therma paper no 11', 'ROL', 'Reagen Lab', 100, 234000, '1', '2020-11-12 02:15:20'),
(2013, 'Total Protein', 'KIT', 'Reagen Lab', 100, 2145000, '1', '2020-11-12 02:15:20'),
(2014, 'Trigliseride', 'KIT', 'Reagen Lab', 100, 2935000, '1', '2020-11-12 02:15:20'),
(2015, 'Tabung Westergeen', 'PCS', 'Reagen Lab', 100, 67900, '1', '2020-11-12 02:15:20'),
(2016, 'Therma Roll 3.5 Dirui', 'ROL', 'Reagen Lab', 100, 71500, '1', '2020-11-12 02:15:20'),
(2017, 'Urea', 'KIT', 'Reagen Lab', 100, 3333300, '1', '2020-11-12 02:15:20'),
(2018, 'Thermal paper no 5,7 cm', 'ROL', 'Reagen Lab', 100, 71500, '1', '2020-11-12 02:15:20'),
(2019, 'Uric Acid', 'KIT', 'Reagen Lab', 100, 3789500, '1', '2020-11-12 02:15:20'),
(2020, 'Urea R1,3,STD 1000', 'KIT', 'Reagen Lab', 100, 2711600, '1', '2020-11-12 02:15:20'),
(2021, 'Urea R2 Buffer 1000', 'KIT', 'Reagen Lab', 100, 1152900, '1', '2020-11-12 02:15:20'),
(2022, 'Verify 10 P', 'BOTOL', 'Reagen Lab', 100, 429000, '1', '2020-11-12 02:15:20'),
(2023, 'Widal HA', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2024, 'Widal HB', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2025, 'Widal HC', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2026, 'Widal OA', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2027, 'Widal OB', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2028, 'Widal OC', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2029, 'Widal HD', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2030, 'Widal OD', 'BOTOL', 'Reagen Lab', 100, 195000, '1', '2020-11-12 02:15:20'),
(2031, 'Wash Additive/ Washing Soluction', 'KIT', 'Reagen Lab', 100, 1581900, '1', '2020-11-12 02:15:20'),
(2032, 'Washing Solution', 'KIT', 'Reagen Lab', 100, 5094300, '1', '2020-11-12 02:15:20'),
(2033, 'Ziehl Neelsen', 'BOTOL', 'Reagen Lab', 100, 471900, '1', '2020-11-12 02:15:20'),
(2034, 'Humatrol N', 'KIT', 'Reagen Lab', 100, 1804600, '1', '2020-11-12 02:15:20'),
(2035, 'HCG Strip', 'KIT', 'Reagen Lab', 100, 290000, '1', '2020-11-12 02:15:20'),
(2036, 'Pyrexin Supp 80 ', 'TUBE', 'Supp', 100, 10000, '1', '2020-11-12 02:15:20'),
(2037, 'Pyrexin Supp 160', 'TUBE', 'Supp', 100, 10000, '1', '2020-11-12 02:15:20'),
(2038, 'SUSU bebelove1 0-6 bulan 200gr', 'BOX', 'Susu', 100, 43900, '1', '2020-11-12 02:15:20'),
(2039, 'SUSU bebelove Gold 1', 'BOX', 'Susu', 100, 88300, '1', '2020-11-12 02:15:20'),
(2040, 'SUSU Lactogen premature', 'BOX', 'Susu', 100, 87200, '1', '2020-11-12 02:15:20'),
(2041, 'Susu Morinaga NL 33 - 350 gr', 'KALENG', 'Susu', 100, 109200, '1', '2020-11-12 02:15:20'),
(2042, 'Susu Nan PRO 1 12x400gr', 'KALENG', 'Susu', 100, 214300, '1', '2020-11-12 02:15:20'),
(2043, 'Pan-enteral', 'SACHET', 'Susu', 100, 18300, '1', '2020-11-12 02:15:20'),
(2044, 'Proten', 'SACHET', 'Susu', 100, 8600, '1', '2020-11-12 02:15:20'),
(2045, 'Susu BMT P-HP 400 GR', 'KALENG', 'Susu', 100, 187100, '1', '2020-11-12 02:15:20'),
(2046, 'Susu BMT Soya 300 mg', 'KALENG', 'Susu', 100, 116700, '1', '2020-11-12 02:15:20'),
(2047, 'Susu Chil Kid P-HP 400 gr', 'KALENG', 'Susu', 100, 170600, '1', '2020-11-12 02:15:20'),
(2048, 'Susu Chil Kid Soya 300 gr', 'KALENG', 'Susu', 100, 104800, '1', '2020-11-12 02:15:20'),
(2049, 'Susu Chil Mil P-HP 400 gr', 'KALENG', 'Susu', 100, 178800, '1', '2020-11-12 02:15:20'),
(2050, 'Susu Lactogen Happynutri 135g', 'BOX', 'Susu', 100, 19500, '1', '2020-11-12 02:15:20'),
(2051, 'Susu Lactogen LLF 150g', 'BOX', 'Susu', 100, 33300, '1', '2020-11-12 02:15:20'),
(2052, 'Susu Chil Mil Soya 300 gr', 'KALENG', 'Susu', 100, 113900, '1', '2020-11-12 02:15:20'),
(2053, 'Susu Prenan B NW026 400g', 'KALENG', 'Susu', 100, 91800, '1', '2020-11-12 02:15:20'),
(2054, 'Susu SGM Ananda 0-6 Bulan 150gr', 'BOX', 'Susu', 100, 11700, '1', '2020-11-12 02:15:20'),
(2055, 'Susu Danstart Excelnutri', 'BOX', 'Susu', 100, 14800, '1', '2020-11-12 02:15:20'),
(2056, 'Susu Frisian Baby 0-6 Bulan', 'BOX', 'Susu', 100, 27400, '1', '2020-11-12 02:15:20'),
(2057, 'Susu Frisian Baby 6-12 Bulan', 'BOX', 'Susu', 100, 27000, '1', '2020-11-12 02:15:20'),
(2058, 'Susu SGM Ananda Soya 0-6 200gr', 'BOX', 'Susu', 100, 37600, '1', '2020-11-12 02:15:20'),
(2059, 'Susu SGM Gain 0-12 Bulan 200gr', 'BOX', 'Susu', 100, 42000, '1', '2020-11-12 02:15:20'),
(2060, 'Susu SGM PH Pro 0-6 Bulan 200gr', 'BOX', 'Susu', 100, 48700, '1', '2020-11-12 02:15:20'),
(2061, 'Susu SGM 6-12 Bulan 150gr', 'BOX', 'Susu', 100, 11700, '1', '2020-11-12 02:15:20'),
(2062, 'Sendal Swallow', 'PASANG', 'Botol', 0, 30000, '1', '2020-11-20 13:40:42'),
(2063, 'Ganja', 'BATANG', 'Psikotropika', 0, 150000, '1', '2020-11-20 13:53:59'),
(2064, NULL, NULL, NULL, 0, NULL, '1', '2020-11-22 00:54:03'),
(2065, NULL, NULL, NULL, 0, NULL, '1', '2020-11-22 00:55:12'),
(2066, '&lt;div style=&quot;background-color:red;width:100%&quot;&gt;Hello World&lt;/div&gt;', 'PCS', 'Alat Kesehatan', 0, 333, '1', '2020-11-22 00:57:28'),
(2067, '<div xss=removed>Hello World</div>', 'PCS', 'Alat Kesehatan', 0, 4545, '1', '2020-11-22 00:58:10'),
(2068, 'dfds', 'PCS', 'Alat Kesehatan', 0, 34, '1', '2020-11-22 01:09:05'),
(2069, '[removed]alert&#40;\'Kena Hacked\'&#41;;[removed]', 'PCS', 'Alat Kesehatan', 0, 34, '1', '2020-11-22 01:10:22'),
(2070, '[removed]alert&#40;\'Kena Hacked\'&#41;;[removed]', 'PCS', 'Alat Kesehatan', 0, 253, '1', '2020-11-22 01:10:48'),
(2071, '<script>alert(\'Kena Hacked\');</script>', 'PCS', 'Alat Kesehatan', 0, 464, '1', '2020-11-22 01:13:37'),
(2072, 'solicidin\'; DROP TABLE b_obat;--', 'PCS', 'Alat Kesehatan', 0, 34, '1', '2020-11-22 02:52:30'),
(2073, 'solicidin\'); DROP TABLE b_obat;--', 'PCS', 'Alat Kesehatan', 0, 343, '1', '2020-11-22 02:53:25'),
(2074, 'fdsf', 'PCS', 'Alat Kesehatan', 0, 0, '1', '2020-11-22 03:04:27');

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
(67, 'Pemeriksaan Dokter', 2000, '1', '0000-00-00 00:00:00'),
(68, 'Buka IUD ', 50000, '1', '0000-00-00 00:00:00'),
(69, 'Corpal  telinga 1', 15000, '1', '0000-00-00 00:00:00'),
(70, 'Corpal  telinga 2', 15000, '1', '0000-00-00 00:00:00'),
(71, 'Ganti Verban  Besar', 20000, '1', '0000-00-00 00:00:00'),
(72, 'Ganti Verban  Besar Hypafix', 20000, '1', '0000-00-00 00:00:00'),
(73, 'Ganti Verban kecil', 10000, '1', '0000-00-00 00:00:00'),
(74, 'Ganti Verban kecil hypafix', 10000, '1', '0000-00-00 00:00:00'),
(75, 'Ganti Verban sedang', 15000, '1', '0000-00-00 00:00:00'),
(76, 'Ganti Verban sedang hypafix', 15000, '1', '0000-00-00 00:00:00'),
(77, 'Imunisasi BCG', 5000, '1', '0000-00-00 00:00:00'),
(78, 'Imunisasi DPT', 5000, '1', '0000-00-00 00:00:00'),
(79, 'Imunisasi polio', 5000, '1', '0000-00-00 00:00:00'),
(80, 'Injeksi IC 1x', 5000, '1', '0000-00-00 00:00:00'),
(81, 'Injeksi IC 2x', 10000, '1', '0000-00-00 00:00:00'),
(82, 'Injeksi IM 3 1x', 5000, '1', '0000-00-00 00:00:00'),
(83, 'Injeksi IM 3 2x', 10000, '1', '0000-00-00 00:00:00'),
(84, 'Injeksi IM 5 1x', 5000, '1', '0000-00-00 00:00:00'),
(85, 'Injeksi IM 5 2x', 10000, '1', '0000-00-00 00:00:00'),
(86, 'Injeksi IV 3  Langsung 1x ', 7000, '1', '0000-00-00 00:00:00'),
(87, 'Injeksi IV 3  Langsung 2x ', 14000, '1', '0000-00-00 00:00:00'),
(88, 'Injeksi IV 5  Langsung 1x ', 7000, '1', '0000-00-00 00:00:00'),
(89, 'Injeksi IV 5  Langsung 2x ', 14000, '1', '0000-00-00 00:00:00'),
(90, 'Injeksi SC 1x', 5000, '1', '0000-00-00 00:00:00'),
(91, 'Injeksi SC 2x', 10000, '1', '0000-00-00 00:00:00'),
(92, 'Irigasi Mata 1', 7000, '1', '0000-00-00 00:00:00'),
(93, 'Irigasi Mata 2', 14000, '1', '0000-00-00 00:00:00'),
(94, 'Irigasi Telinga 1', 7000, '1', '0000-00-00 00:00:00'),
(95, 'Irigasi Telinga 2', 14000, '1', '0000-00-00 00:00:00'),
(96, 'Memasang Catheter 10', 15000, '1', '0000-00-00 00:00:00'),
(97, 'Memasang Catheter 12', 15000, '1', '0000-00-00 00:00:00'),
(98, 'Memasang Catheter 14', 15000, '1', '0000-00-00 00:00:00'),
(99, 'Memasang Catheter 16', 15000, '1', '0000-00-00 00:00:00'),
(100, 'Memasang Catheter 18', 15000, '1', '0000-00-00 00:00:00'),
(101, 'Memasang Catheter 20', 15000, '1', '0000-00-00 00:00:00'),
(102, 'Memasang Catheter 22', 15000, '1', '0000-00-00 00:00:00'),
(103, 'Memasang Catheter 3 way 16', 15000, '1', '0000-00-00 00:00:00'),
(104, 'Memasang Catheter 3 way 18', 15000, '1', '0000-00-00 00:00:00'),
(105, 'Membuka Chateter', 7000, '1', '0000-00-00 00:00:00'),
(106, 'Membuka jahitan 1', 5000, '1', '0000-00-00 00:00:00'),
(107, 'Membuka jahitan 2', 10000, '1', '0000-00-00 00:00:00'),
(108, 'Membuka jahitan 3', 15000, '1', '0000-00-00 00:00:00'),
(109, 'Membuka jahitan 4', 20000, '1', '0000-00-00 00:00:00'),
(110, 'Membuka jahitan 5', 25000, '1', '0000-00-00 00:00:00'),
(111, 'Membuka jahitan 6', 30000, '1', '0000-00-00 00:00:00'),
(112, 'Membuka jahitan 7', 35000, '1', '0000-00-00 00:00:00'),
(113, 'Nebulizer 1 Birotex', 30000, '1', '0000-00-00 00:00:00'),
(114, 'Nebulizer 1 combipen', 30000, '1', '0000-00-00 00:00:00'),
(115, 'Nebulizer 1 Puven', 30000, '1', '0000-00-00 00:00:00'),
(116, 'Nebulizer 1 ventolin', 30000, '1', '0000-00-00 00:00:00'),
(117, 'Nebulizer 1 ventolin anak', 30000, '1', '0000-00-00 00:00:00'),
(118, 'Pasang Inplan Bidan', 41000, '1', '0000-00-00 00:00:00'),
(119, 'Pasang IUD oleh Bidan', 70000, '1', '0000-00-00 00:00:00'),
(120, 'Pemberian Obat Suppositoria', 5000, '1', '0000-00-00 00:00:00'),
(121, 'Pencabutan inplan Bidan', 40000, '1', '0000-00-00 00:00:00'),
(122, 'Pengambilan Cerumen 1', 15000, '1', '0000-00-00 00:00:00'),
(123, 'Pengambilan Cerumen 2', 30000, '1', '0000-00-00 00:00:00'),
(124, 'Periksa Dalam', 15000, '1', '0000-00-00 00:00:00'),
(125, 'Periksa kehamilan oleh bidan', 10000, '1', '0000-00-00 00:00:00'),
(126, 'Spooling  telinga', 15000, '1', '0000-00-00 00:00:00'),
(127, 'Suntik KB 1', 5000, '1', '0000-00-00 00:00:00'),
(128, 'Suntik KB 2', 5000, '1', '0000-00-00 00:00:00'),
(129, 'Tes Mantoux', 5000, '1', '0000-00-00 00:00:00'),
(130, 'Tindik telinga', 20000, '1', '0000-00-00 00:00:00');

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
('000001', 'Monkey D.', '-', '-', 'l', 'East Blue', '1992-04-22', 'JAWA BARAT', 'KABUPATEN INDRAMAYU', 'HAURGEULIS', 'SUKAJATI', 'East Blue', '-', 'katolik', 'Pegawai Negeri Sipil/PNS/ASN', 'belum menikah', 'Monkey D. Garp', '-', 'Kakek', '1', '2020-10-31 06:42:56'),
('000002', 'Naruto', '123', '321', 'l', 'asd', '1992-10-22', 'JAWA TIMUR', 'KABUPATEN LAMONGAN', 'KEMBANGBAHU', 'MAOR', 'sds', '34534', 'katolik', 'fdg', 'belum menikah', 'ads', '3434', 'Suami', '1', '2020-10-31 06:47:11'),
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
('2020111900012', '2020-11-19', 'p1', '000001', 1, '3', 'KL002', '2020-11-19 02:35:52'),
('2020111900013', '2020-11-19', 'p1', '000001', 1, '1', 'KL002', '2020-11-19 10:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `log_print_billing`
--

CREATE TABLE `log_print_billing` (
  `id_log` int(11) NOT NULL,
  `no_billing` varchar(150) NOT NULL,
  `jenis_dokumen` enum('billing','kwitansi') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `penerima` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_print_billing`
--

INSERT INTO `log_print_billing` (`id_log`, `no_billing`, `jenis_dokumen`, `timestamp`, `user_id`, `penerima`) VALUES
(1, 'IBK/2011/00009', 'billing', '2020-11-18 04:08:17', 1, NULL),
(2, 'IBK/2011/00009', 'billing', '2020-11-18 04:08:30', 1, NULL),
(3, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:12', 1, NULL),
(4, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:15', 1, NULL),
(5, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:17', 1, NULL),
(6, 'IBK/2011/00009', 'billing', '2020-11-18 04:09:20', 1, NULL),
(7, 'IBK/2011/00009', 'billing', '2020-11-18 04:12:09', 1, NULL),
(8, 'IBK/2011/00009', 'billing', '2020-11-18 04:13:56', 1, NULL),
(9, 'IBK/2011/00009', 'billing', '2020-11-18 04:13:57', 1, NULL),
(10, 'IBK/2011/00009', 'billing', '2020-11-18 04:14:00', 1, NULL),
(11, 'IBK/2011/00009', 'billing', '2020-11-18 04:14:02', 1, NULL),
(49, 'IBK/2011/00008', 'billing', '2020-11-18 05:55:27', 1, NULL),
(50, 'IBK/2011/00008', 'billing', '2020-11-18 05:55:55', 1, NULL),
(51, 'IBK/2011/00008', 'billing', '2020-11-18 05:56:11', 1, NULL),
(52, 'IBK/2011/00008', 'billing', '2020-11-18 05:56:27', 1, NULL),
(53, 'IBK/2011/00008', 'billing', '2020-11-18 05:56:43', 1, NULL),
(54, 'IBK/2011/00008', 'billing', '2020-11-18 05:57:05', 1, NULL),
(55, 'IBK/2011/00008', 'billing', '2020-11-18 06:01:57', 1, NULL),
(56, 'IBK/2011/00008', 'billing', '2020-11-18 06:05:52', 1, NULL),
(57, 'IBK/2011/00008', 'billing', '2020-11-18 06:12:50', 1, NULL),
(58, 'IBK/2011/00008', 'billing', '2020-11-18 06:13:21', 1, NULL),
(59, 'IBK/2011/00008', 'billing', '2020-11-18 06:14:28', 1, NULL),
(60, 'IBK/2011/00008', 'billing', '2020-11-18 06:15:42', 1, NULL),
(61, 'IBK/2011/00008', 'billing', '2020-11-18 06:20:10', 1, NULL),
(62, 'IBK/2011/00008', 'billing', '2020-11-18 06:20:26', 1, NULL),
(63, 'IBK/2011/00008', 'billing', '2020-11-18 06:20:57', 1, NULL),
(64, 'IBK/2011/00008', 'billing', '2020-11-18 06:21:15', 1, NULL),
(65, 'IBK/2011/00008', 'billing', '2020-11-18 06:22:13', 1, NULL),
(66, 'IBK/2011/00008', 'billing', '2020-11-18 06:26:08', 1, NULL),
(67, 'IBK/2011/00008', 'billing', '2020-11-18 06:30:11', 1, NULL),
(68, 'IBK/2011/00008', 'billing', '2020-11-18 06:30:46', 1, NULL),
(69, 'IBK/2011/00008', 'billing', '2020-11-18 06:31:25', 1, NULL),
(70, 'IBK/2011/00008', 'billing', '2020-11-18 06:32:01', 1, NULL),
(71, 'IBK/2011/00008', 'billing', '2020-11-18 06:32:43', 1, NULL),
(72, 'IBK/2011/00008', 'billing', '2020-11-18 06:33:11', 1, NULL),
(73, 'IBK/2011/00008', 'billing', '2020-11-18 06:34:17', 1, NULL),
(74, 'IBK/2011/00008', 'billing', '2020-11-18 06:35:32', 1, NULL),
(75, 'IBK/2011/00008', 'billing', '2020-11-18 06:36:59', 1, NULL),
(76, 'IBK/2011/00008', 'billing', '2020-11-18 06:41:05', 1, NULL),
(77, 'IBK/2011/00008', 'billing', '2020-11-18 06:42:50', 1, NULL),
(78, 'IBK/2011/00008', 'billing', '2020-11-18 06:48:41', 1, NULL),
(79, 'IBK/2011/00008', 'billing', '2020-11-18 06:48:57', 1, NULL),
(80, 'IBK/2011/00008', 'billing', '2020-11-18 06:51:19', 1, NULL),
(81, 'IBK/2011/00008', 'billing', '2020-11-18 06:52:04', 1, NULL),
(82, 'IBK/2011/00008', 'billing', '2020-11-18 06:52:38', 1, NULL),
(83, 'IBK/2011/00008', 'billing', '2020-11-18 06:53:22', 1, NULL),
(84, 'IBK/2011/00008', 'billing', '2020-11-18 06:53:41', 1, NULL),
(85, 'IBK/2011/00008', 'billing', '2020-11-18 06:54:38', 1, NULL),
(86, 'IBK/2011/00008', 'billing', '2020-11-18 06:55:14', 1, NULL),
(87, 'IBK/2011/00008', 'billing', '2020-11-18 06:55:40', 1, NULL),
(88, 'IBK/2011/00008', 'billing', '2020-11-18 06:58:22', 1, NULL),
(89, 'IBK/2011/00008', 'billing', '2020-11-18 06:59:50', 1, NULL),
(90, 'IBK/2011/00008', 'billing', '2020-11-18 07:00:39', 1, NULL),
(91, 'IBK/2011/00008', 'billing', '2020-11-18 07:01:01', 1, NULL),
(92, 'IBK/2011/00008', 'billing', '2020-11-18 07:01:37', 1, NULL),
(93, 'IBK/2011/00008', 'billing', '2020-11-18 07:02:52', 1, NULL),
(94, 'IBK/2011/00008', 'billing', '2020-11-18 07:03:13', 1, NULL),
(95, 'IBK/2011/00006', 'billing', '2020-11-18 08:35:38', 1, NULL),
(96, 'IBK/2011/00005', 'billing', '2020-11-18 08:36:03', 1, NULL),
(97, 'IBK/2011/00005', 'billing', '2020-11-18 09:17:24', 1, NULL),
(98, 'IBK/2011/00005', 'billing', '2020-11-18 09:26:54', 1, NULL),
(99, 'IBK/2011/00005', 'kwitansi', '2020-11-18 09:28:18', 1, NULL),
(100, 'IBK/2011/00005', 'kwitansi', '2020-11-18 09:29:09', 1, NULL),
(101, 'IBK/2011/00005', 'billing', '2020-11-18 09:32:44', 1, NULL),
(102, 'IBK/2011/00005', 'kwitansi', '2020-11-18 09:48:38', 1, 'Abidin'),
(103, 'IBK/2011/00005', 'kwitansi', '2020-11-18 09:49:01', 1, 'Udin'),
(104, 'IBK/2011/00005', 'kwitansi', '2020-11-18 10:00:26', 1, 'andi wijaya'),
(105, 'IBK/2011/00005', 'billing', '2020-11-18 10:03:24', 1, ''),
(106, 'IBK/2011/00005', 'billing', '2020-11-18 10:36:05', 1, ''),
(107, 'IBK/2011/00005', 'kwitansi', '2020-11-18 10:38:44', 1, 'Erina'),
(108, 'IBK/2011/00005', 'kwitansi', '2020-11-18 10:39:19', 1, 'Jumriah Sanusi'),
(109, '', 'kwitansi', '2020-11-18 10:57:10', 1, 'arial'),
(110, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:00:00', 1, 'asiap'),
(111, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:00:20', 1, 'asiap'),
(112, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:04:42', 1, 'Subasa'),
(113, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:06:32', 1, 'siman'),
(114, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:07:07', 1, 'smina'),
(115, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:07:33', 1, 'sdsd'),
(116, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:08:24', 1, 'dfdf'),
(117, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:09:34', 1, 'ree'),
(118, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:10:45', 1, 'dsfsdf'),
(119, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:11:23', 1, ''),
(120, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:12:39', 1, 'tererer'),
(121, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:14:03', 1, 'tersds'),
(122, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:17:22', 1, 'Amin Saipudin'),
(123, 'IBK/2011/00005', 'billing', '2020-11-18 11:18:48', 1, ''),
(124, 'IBK/2011/00005', 'billing', '2020-11-18 11:23:28', 1, ''),
(125, 'IBK/2011/00005', 'billing', '2020-11-18 11:27:04', 1, ''),
(126, 'IBK/2011/00005', 'billing', '2020-11-18 11:28:05', 1, ''),
(127, 'IBK/2011/00005', 'billing', '2020-11-18 11:28:27', 1, ''),
(128, 'IBK/2011/00005', 'billing', '2020-11-18 11:28:51', 1, ''),
(129, 'IBK/2011/00005', 'billing', '2020-11-18 11:29:09', 1, ''),
(130, 'IBK/2011/00005', 'billing', '2020-11-18 11:29:51', 1, ''),
(131, 'IBK/2011/00005', 'billing', '2020-11-18 11:33:35', 1, ''),
(132, 'IBK/2011/00005', 'billing', '2020-11-18 11:39:13', 1, ''),
(133, 'IBK/2011/00005', 'billing', '2020-11-18 11:40:56', 1, ''),
(134, 'IBK/2011/00005', 'billing', '2020-11-18 11:41:23', 1, ''),
(135, 'IBK/2011/00005', 'billing', '2020-11-18 11:42:58', 1, ''),
(136, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:48:03', 1, ''),
(137, 'IBK/2011/00005', 'billing', '2020-11-18 11:51:42', 1, ''),
(138, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:52:54', 1, ''),
(139, 'IBK/2011/00005', 'kwitansi', '2020-11-18 11:58:17', 1, 'Amin Saipudin'),
(140, 'IBK/2011/00005', 'kwitansi', '2020-11-18 12:16:33', 1, 'amin'),
(141, 'IBK/2011/00005', 'kwitansi', '2020-11-18 12:23:33', 1, 'amin'),
(142, 'IBK-20-11-00002', 'billing', '2020-11-18 12:35:42', 1, ''),
(143, 'IBK-20-11-00002', 'billing', '2020-11-18 12:36:14', 1, ''),
(144, 'IBK-20-11-00002', 'kwitansi', '2020-11-18 12:36:42', 1, 'Monkey D.'),
(145, 'IBK/2011/00005', 'kwitansi', '2020-11-19 00:18:34', 1, 'amin'),
(146, 'IBK/2011/00005', 'billing', '2020-11-19 00:18:59', 1, ''),
(147, 'IBK/2011/00005', 'billing', '2020-11-19 00:21:23', 1, ''),
(148, 'IBK/2011/00005', 'billing', '2020-11-19 00:22:10', 1, ''),
(149, 'IBK-20-11-00010', 'kwitansi', '2020-11-19 00:32:36', 1, 'Monkey D.'),
(150, 'IBK-20-11-00010', 'billing', '2020-11-19 00:33:09', 1, '');

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
-- Table structure for table `m_klinik`
--

CREATE TABLE `m_klinik` (
  `klinik_id` varchar(20) NOT NULL,
  `nama_klinik` varchar(250) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_klinik`
--

INSERT INTO `m_klinik` (`klinik_id`, `nama_klinik`, `timestamp`) VALUES
('KL001', 'Klinik Umum', '2020-11-19 02:31:27'),
('KL002', 'Klinik Kulit & Kelamin', '2020-11-19 02:31:27');

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
-- Table structure for table `m_status_pembayaran`
--

CREATE TABLE `m_status_pembayaran` (
  `id` int(11) NOT NULL,
  `nama_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_status_pembayaran`
--

INSERT INTO `m_status_pembayaran` (`id`, `nama_status`) VALUES
(1, 'Belum Dibayar'),
(2, 'Lunas');

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
-- Table structure for table `pemeriksaan_klinik`
--

CREATE TABLE `pemeriksaan_klinik` (
  `klinik_transaction_id` varchar(100) NOT NULL,
  `diagnosa` varchar(45) DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `suhu_tubuh` char(5) DEFAULT NULL,
  `tensi` varchar(45) DEFAULT NULL,
  `tinggi` varchar(45) DEFAULT NULL,
  `berat` varchar(45) DEFAULT NULL,
  `keluhan` varchar(500) DEFAULT NULL,
  `pemeriksaan` varchar(450) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `dokter_id` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemeriksaan_klinik`
--

INSERT INTO `pemeriksaan_klinik` (`klinik_transaction_id`, `diagnosa`, `keterangan`, `suhu_tubuh`, `tensi`, `tinggi`, `berat`, `keluhan`, `pemeriksaan`, `timestamp`, `dokter_id`) VALUES
('202011080004', 's2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-15 08:38:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'Antrean'),
(2, 'Selesai'),
(3, 'Batal');

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
(1, 'Biaya Administrasi', 5000, '2020-11-11 13:47:04', 1, '202011080001'),
(2, 'Biaya Administrasi', 5000, '2020-11-12 10:01:41', 1, '202011080005'),
(7, 'Biaya Administrasi', 5000, '2020-11-12 11:44:17', 1, '2020110900006'),
(8, 'Biaya Administrasi', 5000, '2020-11-12 12:43:35', 1, '2020111200007'),
(10, 'Biaya Administrasi', 5000, '2020-11-16 03:29:01', 1, '202011080004'),
(11, 'Biaya Administrasi', 5000, '2020-11-16 06:19:40', 1, '202011080003'),
(12, 'Biaya Administrasi', 5000, '2020-11-16 06:26:14', 1, '2020111600008'),
(13, 'Biaya Administrasi', 5000, '2020-11-18 01:05:37', 1, '2020111800010'),
(14, 'Biaya Administrasi', 5000, '2020-11-19 00:23:32', 1, '2020111700009');

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

--
-- Dumping data for table `t_obat`
--

INSERT INTO `t_obat` (`id`, `nama_obat`, `harga`, `satuan`, `jumlah`, `timestamp`, `b_obat_id`, `klinik_transaction_id`) VALUES
(11, 'Paracetamol inf', 64350, 'BOTOL', 3, '2020-11-12 05:50:05', 484, '202011080005'),
(16, 'Abbocath No.14', 28200, 'PCS', 2, '2020-11-12 09:11:02', 3, '202011080005'),
(18, 'Kasa gulung', 3, 'CM', 10, '2020-11-12 10:46:06', 177, '202011080005'),
(20, 'Wound dressing 10x35 cm', 33000, 'PCS', 34, '2020-11-12 11:25:39', 357, '202011080005'),
(21, 'Paracetamol syr', 7150, 'BOTOL', 2, '2020-11-12 11:44:33', 524, '2020110900006'),
(22, 'Slang Nebulezer Dewasa', 45500, 'PCS', 5, '2020-11-12 12:43:55', 352, '2020111200007'),
(23, 'Xylestesin', 15700, 'PCS', 1, '2020-11-15 06:17:32', 1, '2020111200007'),
(26, 'Prenatin DF', 3600, 'TABLET', 3, '2020-11-15 06:17:52', 1809, '2020111200007'),
(27, 'Xylestesin', 15700, 'PCS', 5, '2020-11-15 06:17:58', 1, '2020111200007'),
(28, 'Catheter Nelaton 14', 5300, 'PCS', 4, '2020-11-15 06:18:07', 21, '2020111200007'),
(29, 'Winner Transpraent Film Dreassing 6x7', 4100, 'PCS', 4, '2020-11-15 06:18:12', 358, '2020111200007'),
(30, 'Prenatin DF', 3600, 'TABLET', 5, '2020-11-15 06:18:20', 1809, '2020111200007'),
(31, 'Paracetamol inf', 64350, 'BOTOL', 1, '2020-11-16 03:29:28', 484, '202011080004'),
(32, 'Combantrin', 7400, 'TABLET', 4, '2020-11-16 03:29:35', 1763, '202011080004'),
(33, 'Arm Sling L', 42000, 'PCS', 6, '2020-11-16 03:29:42', 10, '202011080004'),
(34, 'Arm Sling M', 42000, 'PCS', 2, '2020-11-16 06:26:03', 7, '2020111600008'),
(35, 'Prenatin DF', 3600, 'TABLET', 4, '2020-11-16 06:26:08', 1809, '2020111600008'),
(36, 'Abbocath No.14', 28200, 'PCS', 7, '2020-11-18 01:05:54', 3, '2020111800010'),
(37, 'Paracetamol inf', 64350, 'BOTOL', 2, '2020-11-18 01:06:01', 484, '2020111800010'),
(38, 'Abbocath No.14', 28200, 'PCS', 8, '2020-11-18 03:28:41', 3, '202011080003'),
(39, 'Catgut Chromic 2/0 (D-TREX)', 83900, 'PCS', 100, '2020-11-19 00:31:23', 25, '2020111700009'),
(40, 'Dopamin ', 106000, 'AMPUL', 100, '2020-11-19 00:31:41', 764, '2020111700009'),
(41, 'Susu SGM PH Pro 0-6 Bulan 200gr', 48700, 'BOX', 100, '2020-11-19 00:31:50', 2060, '2020111700009'),
(42, 'Balon tensi', 331700, 'BATANG', 100, '2020-11-19 00:31:59', 17, '2020111700009');

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
(14, 'Pemeriksaan Dokter', 2000, '2020-11-12 10:07:29', 67, '202011080005'),
(15, 'Spooling  telinga', 15000, '2020-11-12 10:10:13', 126, '202011080005'),
(17, 'Pemeriksaan Dokter', 2000, '2020-11-12 11:44:22', 67, '2020110900006'),
(18, 'Injeksi IM 5 1x', 5000, '2020-11-12 12:43:44', 84, '2020111200007'),
(19, 'Pemeriksaan Dokter', 2000, '2020-11-14 12:18:22', 67, '202011080001'),
(20, 'Irigasi Telinga 2', 14000, '2020-11-14 17:34:55', 95, '2020110900006'),
(21, 'Imunisasi BCG', 5000, '2020-11-15 06:18:32', 77, '2020111200007'),
(22, 'Memasang Catheter 10', 15000, '2020-11-15 06:18:35', 96, '2020111200007'),
(23, 'Corpal  telinga 1', 15000, '2020-11-16 03:29:08', 69, '202011080004'),
(24, 'Periksa Dalam', 15000, '2020-11-16 03:29:13', 124, '202011080004'),
(25, 'Membuka jahitan 5', 25000, '2020-11-16 03:29:17', 110, '202011080004'),
(26, 'Pemeriksaan Dokter', 2000, '2020-11-16 06:19:43', 67, '202011080003'),
(27, 'Pemeriksaan Dokter', 2000, '2020-11-16 06:26:18', 67, '2020111600008'),
(28, 'Pemeriksaan Dokter', 2000, '2020-11-18 01:05:43', 67, '2020111800010'),
(29, 'Corpal  telinga 2', 15000, '2020-11-18 01:05:46', 70, '2020111800010'),
(30, 'Pemeriksaan Dokter', 2000, '2020-11-19 00:23:37', 67, '2020111700009'),
(31, 'Buka IUD ', 50000, '2020-11-19 00:23:40', 68, '2020111700009'),
(32, 'Corpal  telinga 1', 15000, '2020-11-19 00:23:43', 69, '2020111700009'),
(33, 'Corpal  telinga 2', 15000, '2020-11-19 00:23:47', 70, '2020111700009'),
(34, 'Ganti Verban  Besar', 20000, '2020-11-19 00:23:51', 71, '2020111700009'),
(35, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:24:13', 119, '2020111700009'),
(36, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:24:19', 119, '2020111700009'),
(37, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:24:28', 119, '2020111700009'),
(38, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:24:42', 119, '2020111700009'),
(39, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:24:47', 119, '2020111700009'),
(40, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:24:55', 119, '2020111700009'),
(41, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:25:08', 119, '2020111700009'),
(42, 'Pasang IUD oleh Bidan', 70000, '2020-11-19 00:31:08', 119, '2020111700009');

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
(3, 'admins', '$2y$10$JGCT0okRwdu2pJWxqh5Cd.FWgTzhkheBxvjwFOpFBEHXnsTIOylya', '<script>alert(\'Kena Hacked\');</script>', '1', '1', '2020-11-05 11:55:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_transaction`
--
ALTER TABLE `billing_transaction`
  ADD PRIMARY KEY (`no_billing`),
  ADD KEY `fk_kuitansi_transaction_klinik_transaction1_idx` (`klinik_transaction_id`);

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
  ADD KEY `fk_klinik_transaction_user1_idx1` (`user_id`),
  ADD KEY `fk_klinik_transaction_m_klinik1_idx` (`klinik_id`);

--
-- Indexes for table `log_print_billing`
--
ALTER TABLE `log_print_billing`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `no_billing` (`no_billing`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `m_alasan_item_out`
--
ALTER TABLE `m_alasan_item_out`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_klinik`
--
ALTER TABLE `m_klinik`
  ADD PRIMARY KEY (`klinik_id`);

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
-- Indexes for table `m_status_pembayaran`
--
ALTER TABLE `m_status_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `pemeriksaan_klinik`
--
ALTER TABLE `pemeriksaan_klinik`
  ADD PRIMARY KEY (`klinik_transaction_id`),
  ADD UNIQUE KEY `klinik_transaction_id_UNIQUE` (`klinik_transaction_id`),
  ADD KEY `fk_data_medis_klinik_transaction1_idx` (`klinik_transaction_id`),
  ADD KEY `fk_pemeriksaan_klinik_dokter1_idx` (`dokter_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2075;

--
-- AUTO_INCREMENT for table `b_tindakan`
--
ALTER TABLE `b_tindakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `log_print_billing`
--
ALTER TABLE `log_print_billing`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

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
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- AUTO_INCREMENT for table `t_obat`
--
ALTER TABLE `t_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `t_tindakan`
--
ALTER TABLE `t_tindakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_transaction`
--
ALTER TABLE `billing_transaction`
  ADD CONSTRAINT `fk_kuitansi_transaction_klinik_transaction1` FOREIGN KEY (`klinik_transaction_id`) REFERENCES `klinik_transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `klinik_transaction`
--
ALTER TABLE `klinik_transaction`
  ADD CONSTRAINT `fk_klinik_transaction_data_pasien1` FOREIGN KEY (`medrek`) REFERENCES `data_pasien` (`medrek`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_klinik_transaction_m_klinik1` FOREIGN KEY (`klinik_id`) REFERENCES `m_klinik` (`klinik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_klinik_transaction_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pemeriksaan_klinik`
--
ALTER TABLE `pemeriksaan_klinik`
  ADD CONSTRAINT `fk_data_medis_klinik_transaction1` FOREIGN KEY (`klinik_transaction_id`) REFERENCES `klinik_transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD CONSTRAINT `fk_t_admin_b_admin1` FOREIGN KEY (`b_admin_id`) REFERENCES `b_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_admin_klinik_transaction1` FOREIGN KEY (`klinik_transaction_id`) REFERENCES `klinik_transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

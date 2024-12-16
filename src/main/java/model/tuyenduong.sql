-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 13, 2024 at 03:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `btap`
--

-- --------------------------------------------------------

--
-- Table structure for table `tuyenduong`
--

CREATE TABLE `tuyenduong` (
  `ma_tuyen_duong` int(11) NOT NULL,
  `diem_xuat_phat` varchar(32) NOT NULL,
  `diem_ket_thuc` varchar(32) NOT NULL,
  `khoang_cach` int(11) NOT NULL,
  `gia_ve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tuyenduong`
--

INSERT INTO `tuyenduong` (`ma_tuyen_duong`, `diem_xuat_phat`, `diem_ket_thuc`, `khoang_cach`, `gia_ve`) VALUES
(1, 'Quang Nam', 'Da Nang', 50, 100),
(2, 'Quang Nam', 'Quang Ngai', 70, 120),
(7, 'Quang Nam', 'Hue', 20, 40),
(8, 'Quang Nam', 'Gia Lai', 60, 60),
(9, 'Quang Tri', 'Gia Lai', 70, 130),
(10, 'Binh Thuan', 'Khanh Hoa', 52, 80),
(11, 'Gia Lai', 'Ninh Thuan', 52, 55),
(12, 'Khanh Hoa', 'Phu Yen', 40, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tuyenduong`
--
ALTER TABLE `tuyenduong`
  ADD PRIMARY KEY (`ma_tuyen_duong`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tuyenduong`
--
ALTER TABLE `tuyenduong`
  MODIFY `ma_tuyen_duong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

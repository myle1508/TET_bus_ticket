-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 13, 2024 at 03:37 AM
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
-- Table structure for table `lichtrinh`
--

CREATE TABLE `lichtrinh` (
  `ma_lich_trinh` int(11) NOT NULL,
  `ma_tuyen_duong` int(11) NOT NULL,
  `thoi_gian_xuat_phat` datetime NOT NULL,
  `danh_sach_ghe` varchar(54) NOT NULL,
  `so_ghe_trong` int(11) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lichtrinh`
--

INSERT INTO `lichtrinh` (`ma_lich_trinh`, `ma_tuyen_duong`, `thoi_gian_xuat_phat`, `danh_sach_ghe`, `so_ghe_trong`, `trang_thai`) VALUES
(1, 1, '2024-12-14 01:00:00', '20', 15, 1),
(2, 2, '2024-12-25 03:53:00', '0011', 2, 1),
(3, 8, '2024-12-10 03:56:00', '0011', 8, 0),
(4, 7, '2024-12-25 16:08:00', '001111', 2, 1),
(5, 10, '2024-12-28 04:21:00', '001111', 11, 0),
(6, 8, '2024-12-24 07:01:00', '1110011', 4, 1),
(7, 2, '2025-01-01 00:41:00', '1110011', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lichtrinh`
--
ALTER TABLE `lichtrinh`
  ADD PRIMARY KEY (`ma_lich_trinh`),
  ADD KEY `ma_tuyen_duong` (`ma_tuyen_duong`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lichtrinh`
--
ALTER TABLE `lichtrinh`
  MODIFY `ma_lich_trinh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lichtrinh`
--
ALTER TABLE `lichtrinh`
  ADD CONSTRAINT `lichtrinh_ibfk_1` FOREIGN KEY (`ma_tuyen_duong`) REFERENCES `tuyenduong` (`ma_tuyen_duong`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

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
-- Table structure for table `ve`
--

CREATE TABLE `ve` (
  `ma_ve` int(11) NOT NULL,
  `ma_nguoi_dung` int(11) NOT NULL,
  `ma_lich_trinh` int(11) NOT NULL,
  `so_ghe` int(11) NOT NULL,
  `trang_thai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ve`
--

INSERT INTO `ve` (`ma_ve`, `ma_nguoi_dung`, `ma_lich_trinh`, `so_ghe`, `trang_thai`) VALUES
(1, 3, 1, 4, 1),
(2, 3, 4, 5, 1),
(3, 2, 6, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ve`
--
ALTER TABLE `ve`
  ADD PRIMARY KEY (`ma_ve`),
  ADD KEY `ma_lich_trinh` (`ma_lich_trinh`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ve`
--
ALTER TABLE `ve`
  MODIFY `ma_ve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ve`
--
ALTER TABLE `ve`
  ADD CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`ma_lich_trinh`) REFERENCES `lichtrinh` (`ma_lich_trinh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoidung` (`ma_nguoi_dung`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

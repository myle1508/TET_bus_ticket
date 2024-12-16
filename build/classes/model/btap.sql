-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 07, 2024 at 02:33 AM
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
  `trang_thai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ma_nguoi_dung` int(11) NOT NULL,
  `ten_dang_nhap` varchar(32) NOT NULL,
  `mat_khau` varchar(32) NOT NULL,
  `ho_ten` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `so_dien_thoai` varchar(16) NOT NULL,
  `vai_tro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `lichtrinh`
--
ALTER TABLE `lichtrinh`
  ADD PRIMARY KEY (`ma_lich_trinh`),
  ADD KEY `ma_tuyen_duong` (`ma_tuyen_duong`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ma_nguoi_dung`);

--
-- Indexes for table `tuyenduong`
--
ALTER TABLE `tuyenduong`
  ADD PRIMARY KEY (`ma_tuyen_duong`);

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
-- AUTO_INCREMENT for table `lichtrinh`
--
ALTER TABLE `lichtrinh`
  MODIFY `ma_lich_trinh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `ma_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tuyenduong`
--
ALTER TABLE `tuyenduong`
  MODIFY `ma_tuyen_duong` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ve`
--
ALTER TABLE `ve`
  MODIFY `ma_ve` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lichtrinh`
--
ALTER TABLE `lichtrinh`
  ADD CONSTRAINT `lichtrinh_ibfk_1` FOREIGN KEY (`ma_tuyen_duong`) REFERENCES `tuyenduong` (`ma_tuyen_duong`) ON DELETE CASCADE ON UPDATE CASCADE;

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

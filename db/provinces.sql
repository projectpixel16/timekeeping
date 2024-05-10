-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 02:39 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hris_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `province_name`, `created_at`, `updated_at`) VALUES
(1, 'Abra', NULL, NULL),
(2, 'Agusan del Norte', NULL, NULL),
(3, 'Agusan del Sur', NULL, NULL),
(4, 'Aklan', NULL, NULL),
(5, 'Albay', NULL, NULL),
(6, 'Antique', NULL, NULL),
(7, 'Apayao', NULL, NULL),
(8, 'Aurora', NULL, NULL),
(9, 'Basilan', NULL, NULL),
(10, 'Bataan', NULL, NULL),
(11, 'Batanes', NULL, NULL),
(12, 'Batangas', NULL, NULL),
(13, 'Benguet', NULL, NULL),
(14, 'Biliran', NULL, NULL),
(15, 'Bohol', NULL, NULL),
(16, 'Bukidnon', NULL, NULL),
(17, 'Bulacan', NULL, NULL),
(18, 'Cagayan', NULL, NULL),
(19, 'Camarines Norte', NULL, NULL),
(20, 'Camarines Sur', NULL, NULL),
(21, 'Camiguin', NULL, NULL),
(22, 'Capiz', NULL, NULL),
(23, 'Catanduanes', NULL, NULL),
(24, 'Cavite', NULL, NULL),
(25, 'Cebu', NULL, NULL),
(26, 'Compostela Valley', NULL, NULL),
(27, 'Cotabato', NULL, NULL),
(28, 'Davao del Norte', NULL, NULL),
(29, 'Davao del Sur', NULL, NULL),
(30, 'Davao Oriental', NULL, NULL),
(31, 'Eastern Samar', NULL, NULL),
(32, 'Guimaras', NULL, NULL),
(33, 'Ifugao', NULL, NULL),
(34, 'Ilocos Norte', NULL, NULL),
(35, 'Ilocos Sur', NULL, NULL),
(36, 'Iloilo', NULL, NULL),
(37, 'Isabela', NULL, NULL),
(38, 'Kalinga', NULL, NULL),
(39, 'La Union', NULL, NULL),
(40, 'Laguna', NULL, NULL),
(41, 'Lanao del Norte', NULL, NULL),
(42, 'Lanao del Sur', NULL, NULL),
(43, 'Leyte', NULL, NULL),
(44, 'Maguindanao', NULL, NULL),
(45, 'Marinduque', NULL, NULL),
(46, 'Masbate', NULL, NULL),
(47, 'Metro Manila', NULL, NULL),
(48, 'Misamis Occidental', NULL, NULL),
(49, 'Misamis Oriental', NULL, NULL),
(50, 'Mountain Province', NULL, NULL),
(51, 'Negros Occidental', NULL, NULL),
(52, 'Negros Oriental', NULL, NULL),
(53, 'Northern Samar', NULL, NULL),
(54, 'Nueva Ecija', NULL, NULL),
(55, 'Nueva Vizcaya', NULL, NULL),
(56, 'Occidental Mindoro', NULL, NULL),
(57, 'Oriental Mindoro', NULL, NULL),
(58, 'Palawan', NULL, NULL),
(59, 'Pampanga', NULL, NULL),
(60, 'Pangasinan', NULL, NULL),
(61, 'Quezon', NULL, NULL),
(62, 'Quirino', NULL, NULL),
(63, 'Rizal', NULL, NULL),
(64, 'Romblon', NULL, NULL),
(65, 'Samar', NULL, NULL),
(66, 'Sarangani', NULL, NULL),
(67, 'Siquijor', NULL, NULL),
(68, 'Sorsogon', NULL, NULL),
(69, 'South Cotabato', NULL, NULL),
(70, 'Southern Leyte', NULL, NULL),
(71, 'Sultan Kudarat', NULL, NULL),
(72, 'Sulu', NULL, NULL),
(73, 'Surigao del Norte', NULL, NULL),
(74, 'Surigao del Sur', NULL, NULL),
(75, 'Tarlac', NULL, NULL),
(76, 'Tawi-Tawi', NULL, NULL),
(77, 'Zambales', NULL, NULL),
(78, 'Zamboanga del Norte', NULL, NULL),
(79, 'Zamboanga del Sur', NULL, NULL),
(80, 'Zamboanga Sibugay', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

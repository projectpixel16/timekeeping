-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 04:46 AM
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
-- Database: `db_warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `backorder_details`
--

CREATE TABLE `backorder_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `backorder_head_id` int(11) NOT NULL DEFAULT 0,
  `detail_no` int(11) DEFAULT NULL,
  `pr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `department_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `enduse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `purpose_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_id` int(11) NOT NULL DEFAULT 0,
  `inspected_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backorder_head`
--

CREATE TABLE `backorder_head` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `backorder_date` date DEFAULT NULL,
  `mrecf_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `si_or` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pcf` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `saved` int(11) NOT NULL DEFAULT 0,
  `closed` int(11) NOT NULL DEFAULT 0,
  `draft` int(11) NOT NULL DEFAULT 0,
  `prepared_by` int(11) NOT NULL DEFAULT 0,
  `prepared_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepared_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by` int(11) NOT NULL DEFAULT 0,
  `received_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledged_by` int(11) NOT NULL DEFAULT 0,
  `acknowledged_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledged_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by` int(11) NOT NULL DEFAULT 0,
  `noted_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backorder_items`
--

CREATE TABLE `backorder_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `backorder_head_id` int(11) NOT NULL DEFAULT 0,
  `backorder_details_id` int(11) NOT NULL DEFAULT 0,
  `receive_items_id` int(11) NOT NULL DEFAULT 0,
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pn_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `supplier_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catalog_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_status_id` int(11) NOT NULL DEFAULT 0,
  `item_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_quantity` double NOT NULL DEFAULT 0,
  `unit_cost` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `selling_price` double NOT NULL DEFAULT 0,
  `pr_replenish` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrow_details`
--

CREATE TABLE `borrow_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `borrow_head_id` int(11) NOT NULL DEFAULT 0,
  `borrowed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrowed_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `avail_qty` double NOT NULL DEFAULT 0,
  `quantity` double NOT NULL DEFAULT 0,
  `replenished_qty` double NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `department_id` int(11) NOT NULL DEFAULT 0,
  `department_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_id` int(11) NOT NULL DEFAULT 0,
  `enduse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_id` int(11) NOT NULL DEFAULT 0,
  `purpose_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrow_head`
--

CREATE TABLE `borrow_head` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mbr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrow_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrow_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrowed_by_user` int(10) UNSIGNED NOT NULL,
  `borrowed_by_user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `saved` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prepared_by` int(11) NOT NULL DEFAULT 0,
  `prepared_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepared_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT 0,
  `requested_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by` int(11) NOT NULL DEFAULT 0,
  `noted_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` int(11) NOT NULL DEFAULT 0,
  `approved_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by` int(11) NOT NULL DEFAULT 0,
  `reviewed_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bo_series`
--

CREATE TABLE `bo_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `composite_items`
--

CREATE TABLE `composite_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `compose_item_id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `identifier` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `composite_items`
--

INSERT INTO `composite_items` (`id`, `item_id`, `compose_item_id`, `variant_id`, `quantity`, `identifier`, `created_at`, `updated_at`) VALUES
(1, 24, 22, 3, 1, 0, '2024-04-23 00:57:54', '2024-04-23 00:57:54'),
(2, 24, 23, 17, 1, 0, '2024-04-23 00:57:54', '2024-04-23 00:57:54'),
(3, 24, 21, 15, 1, 0, '2024-04-23 00:57:54', '2024-04-23 00:57:54'),
(4, 28, 25, 0, 1, 0, '2024-04-23 01:23:12', '2024-04-23 01:23:12'),
(5, 28, 26, 0, 1, 0, '2024-04-23 01:23:12', '2024-04-23 01:23:12'),
(6, 28, 27, 0, 1, 0, '2024-04-23 01:23:12', '2024-04-23 01:23:12'),
(7, 29, 22, 3, 0, 0, '2024-04-23 02:42:58', '2024-04-23 02:44:17'),
(8, 29, 23, 18, 1, 0, '2024-04-23 02:42:58', '2024-04-23 02:42:58'),
(9, 29, 21, 15, 1, 0, '2024-04-23 02:42:58', '2024-04-23 02:42:58'),
(10, 30, 25, 0, 0, 0, '2024-04-23 03:06:57', '2024-04-23 03:13:32'),
(11, 30, 26, 0, 1, 0, '2024-04-23 03:06:57', '2024-04-23 03:06:57'),
(12, 30, 27, 0, 1, 0, '2024-04-23 03:06:57', '2024-04-23 03:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `created_at`, `updated_at`) VALUES
(1, 'Department-50', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'Department-25', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'Department-15', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'Department-26', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'Department-38', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, '2~Department-25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enduses`
--

CREATE TABLE `enduses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enduse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enduses`
--

INSERT INTO `enduses` (`id`, `enduse_name`, `created_at`, `updated_at`) VALUES
(1, 'Harvey Glover V', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'Dave Kshlerin', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'Estrella Ratke', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'Carrie Konopelski II', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'Prof. Leola Volkman', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, 'Prof. Emil Lakin DVM', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, 'Prof. Granville Hansen', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, 'Reba Frami', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, 'Anahi Reichel', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, 'Greg Stehr', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(11, '2~Dave Kshlerin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'Group-41', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'Group-13', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'Group-36', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'Group-23', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'Group-21', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `issuance_head`
--

CREATE TABLE `issuance_head` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_head_id` int(10) UNSIGNED NOT NULL,
  `mreqf_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mif_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mgp_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuance_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuance_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `department_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_id` int(10) UNSIGNED NOT NULL,
  `purpose_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_id` int(10) UNSIGNED NOT NULL,
  `enduse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `prepared_by` int(11) NOT NULL DEFAULT 0,
  `prepared_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepared_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by` int(11) NOT NULL DEFAULT 0,
  `received_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `released_by` int(11) NOT NULL DEFAULT 0,
  `released_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `released_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by` int(11) NOT NULL DEFAULT 0,
  `noted_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT 0,
  `requested_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` int(11) NOT NULL DEFAULT 0,
  `approved_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended_by` int(11) NOT NULL DEFAULT 0,
  `recommended_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_by` int(11) NOT NULL DEFAULT 0,
  `inspected_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_by_pos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by_gp` int(11) NOT NULL DEFAULT 0,
  `noted_by_name_gp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by_pos_gp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issuance_head`
--

INSERT INTO `issuance_head` (`id`, `request_head_id`, `mreqf_no`, `mif_no`, `mgp_no`, `pr_no`, `issuance_date`, `issuance_time`, `department_id`, `department_name`, `purpose_id`, `purpose_name`, `enduse_id`, `enduse_name`, `remarks`, `user_id`, `saved`, `prepared_by`, `prepared_by_name`, `prepared_by_pos`, `received_by`, `received_by_name`, `received_by_pos`, `released_by`, `released_by_name`, `released_by_pos`, `noted_by`, `noted_name`, `noted_pos`, `contractor`, `contractor_name`, `requested_by`, `requested_by_name`, `requested_by_pos`, `approved_by`, `approved_by_name`, `approved_by_pos`, `recommended_by`, `recommended_by_name`, `recommended_by_pos`, `inspected_by`, `inspected_by_name`, `inspected_by_pos`, `noted_by_gp`, `noted_by_name_gp`, `noted_by_pos_gp`, `created_at`, `updated_at`) VALUES
(1, 1, 'MREQF-2024-04-0001', 'MIF-2024-04-0001', NULL, 'WH Stocks', '2024-04-23', '09:05:02', 1, 'Department-50', 7, 'Dolor ipsa cupiditate vitae beatae. Aut voluptas quidem exercitationem corporis itaque.', 9, 'Anahi Reichel', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(2, 3, 'MREQF-2024-04-0003', 'MIF-2024-04-0002', NULL, 'WH Stocks', '2024-04-23', '09:24:07', 3, 'Department-15', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 9, 'Anahi Reichel', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(3, 4, 'MREQF-2024-04-0004', 'MIF-2024-04-0003', NULL, 'pr8', '2024-04-23', '10:39:34', 3, 'Department-15', 1, 'Similique eius sint ea dolore quidem eos enim officia. At tempore omnis qui consequatur numquam animi facilis.', 2, 'Dave Kshlerin', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(4, 5, 'MREQF-2024-04-0005', 'MIF-2024-04-0004', NULL, 'WH Stocks', '2024-04-23', '10:43:55', 4, 'Department-26', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 9, 'Anahi Reichel', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(5, 6, 'MREQF-2024-04-0006', 'MIF-2024-04-0005', NULL, 'WH Stocks', '2024-04-23', '11:03:41', 3, 'Department-15', 8, 'Et hic est veritatis quae. Voluptates ea impedit consectetur doloribus. Aut ut cupiditate sit perferendis cumque sunt ut.', 11, '2~Dave Kshlerin', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(6, 7, 'MREQF-2024-04-0007', 'MIF-2024-04-0006', NULL, 'WH Stocks', '2024-04-23', '11:08:19', 3, 'Department-15', 2, 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit.', 9, 'Anahi Reichel', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(7, 8, 'MREQF-2024-04-0008', 'MIF-2024-04-0007', NULL, 'WH Stocks', '2024-04-23', '11:13:25', 2, 'Department-25', 8, 'Et hic est veritatis quae. Voluptates ea impedit consectetur doloribus. Aut ut cupiditate sit perferendis cumque sunt ut.', 2, 'Dave Kshlerin', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(8, 9, 'MREQF-2024-04-0009', 'MIF-2024-04-0008', NULL, 'WH Stocks', '2024-04-23', '11:32:25', 5, 'Department-38', 5, 'Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis.', 6, 'Prof. Emil Lakin DVM', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(9, 10, 'MREQF-2024-04-0010', 'MIF-2024-04-0009', NULL, 'pr19', '2024-04-24', '08:52:42', 4, 'Department-26', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 2, 'Dave Kshlerin', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(10, 15, 'MREQF-2024-04-0015', 'MIF-2024-04-0010', NULL, 'pr22', '2024-04-24', '10:25:47', 4, 'Department-26', 2, 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit.', 1, 'Harvey Glover V', NULL, 1, 0, 1, 'Dr. Russ Dickinson I', 'null', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issuance_items`
--

CREATE TABLE `issuance_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `issuance_head_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `composite_item_id` int(11) NOT NULL DEFAULT 0,
  `request_items_id` int(10) UNSIGNED NOT NULL,
  `inventory_balance` double NOT NULL DEFAULT 0,
  `request_qty` double NOT NULL DEFAULT 0,
  `issued_qty` int(11) DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `unit_cost` double NOT NULL DEFAULT 0,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issuance_items`
--

INSERT INTO `issuance_items` (`id`, `issuance_head_id`, `item_id`, `item_description`, `variant_id`, `composite_item_id`, `request_items_id`, `inventory_balance`, `request_qty`, `issued_qty`, `shipping_cost`, `unit_cost`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 24, 'PC', 0, 0, 1, 1, 1, 1, 0, 20000, '', '2024-04-23 01:05:18', '2024-04-23 01:05:18'),
(2, 2, 28, 'compo', 0, 0, 3, 9, 1, 1, 0, 0, '', '2024-04-23 01:24:17', '2024-04-23 01:24:17'),
(3, 3, 15, 'ea', 11, 0, 4, 10, 2, 2, 76, 879, '', '2024-04-23 02:39:52', '2024-04-23 02:39:52'),
(4, 4, 29, 'PC2', 3, 7, 5, 88, 1, 1, 0, 100, '', '2024-04-23 02:44:17', '2024-04-23 02:44:17'),
(5, 5, 29, 'PC2', 0, 0, 6, 1, 1, 1, 0, 0, '', '2024-04-23 03:03:51', '2024-04-23 03:03:51'),
(6, 6, 30, 'compo', 0, 10, 7, 8, 1, 1, 0, 0, '', '2024-04-23 03:08:40', '2024-04-23 03:08:40'),
(7, 7, 30, 'compo', 0, 10, 8, 8, 1, 1, 0, 0, '', '2024-04-23 03:13:32', '2024-04-23 03:13:32'),
(8, 8, 25, 'begbal1', 0, 0, 9, 8, 1, 1, 0, 0, '', '2024-04-23 03:32:33', '2024-04-23 03:32:33'),
(9, 9, 22, 'Keyboard', 20, 0, 10, 98, 10, 10, 85, 1600, '', '2024-04-24 00:52:59', '2024-04-24 00:52:59'),
(10, 10, 23, 'Monitor', 18, 0, 13, 88, 5, 5, 90, 1000, '', '2024-04-24 02:26:30', '2024-04-24 02:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` int(11) DEFAULT 0,
  `item_sub_category_id` int(11) DEFAULT 0,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT 0,
  `location_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT 0,
  `warehouse_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT 0,
  `group_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rack_id` int(10) UNSIGNED DEFAULT 0,
  `rack_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moq` int(11) DEFAULT 0,
  `image1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `running_balance` int(11) DEFAULT 0,
  `composite_flag` int(11) DEFAULT 0,
  `variant_flag` int(11) DEFAULT 0,
  `novariant_flag` int(11) NOT NULL DEFAULT 0,
  `draft` int(11) NOT NULL DEFAULT 0,
  `begbal` int(11) NOT NULL DEFAULT 0,
  `copy_qty` double NOT NULL DEFAULT 0,
  `composite_cost` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pn_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_category_id`, `item_sub_category_id`, `item_description`, `location_id`, `location_description`, `warehouse_id`, `warehouse_description`, `group_id`, `group_description`, `rack_id`, `rack_description`, `uom`, `moq`, `image1`, `image2`, `image3`, `running_balance`, `composite_flag`, `variant_flag`, `novariant_flag`, `draft`, `begbal`, `copy_qty`, `composite_cost`, `created_at`, `updated_at`, `pn_no`) VALUES
(1, 2, 7, 'impedit', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 02:10:22', NULL),
(2, 1, 7, 'dolorum', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(3, 1, 9, 'dolor', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(4, 3, 10, 'sint', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(5, 1, 10, 'est', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:57:54', NULL),
(6, 2, 8, 'non', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:57:22', NULL),
(7, 1, 3, 'doloremque', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(8, 2, 4, 'dolorum', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(9, 4, 6, 'quibusdam', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:56:05', NULL),
(10, 2, 5, 'sint', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(11, 3, 7, 'ut', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(12, 5, 7, 'autem', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(13, 5, 10, 'et', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:54:25', NULL),
(14, 2, 7, 'id', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(15, 2, 4, 'ea', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 8, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-23 02:39:52', NULL),
(16, 1, 4, 'qui', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:58:35', NULL),
(17, 4, 8, 'recusandae', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 10, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:53:07', NULL),
(18, 3, 8, 'libero', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(19, 4, 7, 'qui', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(20, 2, 8, 'eius', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:11:12', '2024-04-22 01:11:12', NULL),
(21, 2, 5, 'Mouse', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 38, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:16:16', '2024-04-23 02:42:58', 'subcat-prefix-38_1001'),
(22, 2, 7, 'Keyboard', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 88, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 01:49:48', '2024-04-24 00:52:59', 'subcat-prefix-18_1001'),
(23, 2, 5, 'Monitor', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 83, 0, 1, 0, 0, 0, 0, 0, '2024-04-22 06:59:19', '2024-04-24 02:26:30', 'subcat-prefix-38_1002'),
(24, 2, 5, 'PC', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, 0, 20000, '2024-04-23 00:57:54', '2024-04-23 01:05:18', 'subcat-prefix-38_1003'),
(25, 2, 5, 'begbal1', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 7, 0, 0, 0, 0, 10, 0, 0, '2024-04-23 01:22:35', '2024-04-23 03:32:33', 'subcat-prefix-38_1004'),
(26, 5, 1, 'begbal2', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 8, 0, 0, 0, 0, 10, 0, 0, '2024-04-23 01:22:42', '2024-04-23 03:06:57', 'subcat-prefix-37_1001'),
(27, 1, 2, 'begbal3', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 8, 0, 0, 0, 0, 10, 0, 0, '2024-04-23 01:22:50', '2024-04-23 03:06:57', 'subcat-prefix-10_1001'),
(28, 3, 9, 'compo_begbal', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, '2024-04-23 01:23:12', '2024-04-23 01:23:12', 'subcat-prefix-10_1002'),
(29, 2, 6, 'PC2', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, 0, 0, '2024-04-23 02:42:58', '2024-04-23 03:03:51', 'subcat-prefix-27_1001'),
(30, 2, 6, 'compo_begbal2', 0, '', 0, '', 0, '', 0, '', NULL, 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, '2024-04-23 03:06:57', '2024-04-23 03:06:57', 'subcat-prefix-27_1002');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `category_code`, `prefix`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'code-27', 'prefix-27', 'soluta', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'code-35', 'prefix-31', 'excepturi', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'code-23', 'prefix-36', 'quis', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'code-49', 'prefix-32', 'ipsam', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'code-46', 'prefix-14', 'quia', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `item_statuses`
--

CREATE TABLE `item_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `modes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_statuses`
--

INSERT INTO `item_statuses` (`id`, `status`, `created_at`, `updated_at`, `modes`) VALUES
(3, 'New', '2024-04-22 01:11:11', '2024-04-22 01:13:36', 'add'),
(6, 'Secondhand', '2024-04-22 01:11:11', '2024-04-22 01:14:09', 'add'),
(8, 'Expired', '2024-04-22 01:11:11', '2024-04-22 01:14:29', 'deduct'),
(9, 'Repaired', '2024-04-22 01:11:11', '2024-04-22 01:14:19', 'add'),
(10, 'Lost', '2024-04-22 01:11:11', '2024-04-22 01:14:42', 'deduct'),
(11, 'Damaged', '2024-04-22 01:13:59', '2024-04-22 01:13:59', 'deduct');

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_categories`
--

CREATE TABLE `item_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `subcat_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcat_prefix` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcat_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_sub_categories`
--

INSERT INTO `item_sub_categories` (`id`, `item_category_id`, `subcat_code`, `subcat_prefix`, `subcat_name`, `created_at`, `updated_at`) VALUES
(1, 5, 'subcat-code-41', 'subcat-prefix-37', 'nihil', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 1, 'subcat-code-42', 'subcat-prefix-10', 'ratione', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 3, 'subcat-code-43', 'subcat-prefix-15', 'amet', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 4, 'subcat-code-12', 'subcat-prefix-24', 'hic', '2024-04-22 01:11:12', '2024-04-22 01:11:12'),
(5, 2, 'subcat-code-49', 'subcat-prefix-38', 'et', '2024-04-22 01:11:12', '2024-04-22 01:11:12'),
(6, 2, 'subcat-code-36', 'subcat-prefix-27', 'ipsam', '2024-04-22 01:11:12', '2024-04-22 01:11:12'),
(7, 2, 'subcat-code-41', 'subcat-prefix-18', 'occaecati', '2024-04-22 01:11:12', '2024-04-22 01:11:12'),
(8, 4, 'subcat-code-33', 'subcat-prefix-47', 'qui', '2024-04-22 01:11:12', '2024-04-22 01:11:12'),
(9, 3, 'subcat-code-48', 'subcat-prefix-10', 'libero', '2024-04-22 01:11:12', '2024-04-22 01:11:12'),
(10, 4, 'subcat-code-14', 'subcat-prefix-13', 'quia', '2024-04-22 01:11:12', '2024-04-22 01:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location_name`, `created_at`, `updated_at`) VALUES
(1, '62794 Green Forges Apt. 184\nAmericamouth, IA 31040', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, '898 Fisher Ford Apt. 577\nKeeblerport, GA 21903-5682', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, '57094 Kaela Glen Suite 193\nAlishafurt, KS 08132', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, '45741 Leannon Rue\nMayashire, NE 99238-8168', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, '93491 Lavern Villages Suite 391\nMonahanhaven, MO 95059', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, '5645 D\'Amore Valleys Suite 531\nLake Imaniberg, MO 43761-9737', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, '819 Lindsay Mountain\nLake Brennan, MN 22344', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, '2967 Gerhold Spur\nNorth Gretchenstad, WV 48062', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, '4096 Auer Point Suite 957\nGayleton, VT 33302-8526', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, '796 Bashirian Stream\nHammesborough, NC 62204', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `mbr_series`
--

CREATE TABLE `mbr_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mgp_series`
--

CREATE TABLE `mgp_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mif_series`
--

CREATE TABLE `mif_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mif_series`
--

INSERT INTO `mif_series` (`id`, `year`, `series`, `created_at`, `updated_at`) VALUES
(1, 2024, 1, '2024-04-23 01:05:18', '2024-04-23 01:05:18'),
(2, 2024, 2, '2024-04-23 01:24:17', '2024-04-23 01:24:17'),
(3, 2024, 3, '2024-04-23 02:39:52', '2024-04-23 02:39:52'),
(4, 2024, 4, '2024-04-23 02:44:17', '2024-04-23 02:44:17'),
(5, 2024, 5, '2024-04-23 03:03:51', '2024-04-23 03:03:51'),
(6, 2024, 6, '2024-04-23 03:08:40', '2024-04-23 03:08:40'),
(7, 2024, 7, '2024-04-23 03:13:32', '2024-04-23 03:13:32'),
(8, 2024, 8, '2024-04-23 03:32:33', '2024-04-23 03:32:33'),
(9, 2024, 9, '2024-04-24 00:52:59', '2024-04-24 00:52:59'),
(10, 2024, 10, '2024-04-24 02:26:30', '2024-04-24 02:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_04_033636_create_groups_table', 1),
(6, '2023_10_04_052756_create_enduses_table', 1),
(7, '2023_10_04_052843_create_warehouses_table', 1),
(8, '2023_10_04_052859_create_locations_table', 1),
(9, '2023_10_04_052907_create_racks_table', 1),
(10, '2023_10_04_052936_create_item_statuses_table', 1),
(11, '2023_10_04_052948_create_restock_reasons_table', 1),
(12, '2023_10_05_005701_create_uoms_table', 1),
(13, '2023_10_05_005730_create_suppliers_table', 1),
(14, '2023_10_05_010921_create_item_categories_table', 1),
(15, '2023_10_05_011117_create_purposes_table', 1),
(16, '2023_10_05_011425_create_departments_table', 1),
(17, '2023_10_05_011511_create_item_sub_categories_table', 1),
(18, '2023_10_05_014339_add_columns_to_users_table', 1),
(19, '2023_10_20_015315_add_columns_to_users_table', 1),
(20, '2023_10_20_031107_make_email_nullable_in_users_table', 1),
(21, '2023_10_20_031135_make_password_nullable_in_users_table', 1),
(22, '2023_10_24_011545_add_columns_to_users_table', 1),
(23, '2023_10_26_013708_add_columns_to_users_table', 1),
(24, '2023_10_26_024412_create_items_table', 1),
(25, '2023_10_26_060900_create_composite_items_table', 1),
(26, '2023_10_26_061144_create_variants_table', 1),
(27, '2023_10_26_063249_create_no_variant_table', 1),
(28, '2023_10_26_065332_create_receive_head_table', 1),
(29, '2023_10_26_074534_create_receive_details_table', 1),
(30, '2023_10_26_075554_create_receive_items_table', 1),
(31, '2023_10_27_010256_add_columns_to_items_table', 1),
(32, '2023_10_27_013351_create_request_head_table', 1),
(33, '2023_10_27_014022_create_request_items_table', 1),
(34, '2023_10_27_014313_create_issuance_head_table', 1),
(35, '2023_10_27_020453_create_issuance_items_table', 1),
(36, '2023_10_31_022756_create_mrec_series_table', 1),
(37, '2023_10_31_060439_rename_mrec_no_column', 1),
(38, '2023_11_03_060703_add_column_to_receive_details_table', 1),
(39, '2023_11_03_060856_add_column_to_receive_head_table', 1),
(40, '2023_11_03_074147_change_columns_in_items_table', 1),
(41, '2023_11_08_022934_change_columns_in_items_table', 1),
(42, '2023_11_13_022306_change_column_to_variants_table', 1),
(43, '2023_11_13_022700_change_column_to_variants_table', 1),
(44, '2023_11_15_010605_change_column_to_receive_details_table', 1),
(45, '2023_11_15_014342_change_column_to_items_table', 1),
(46, '2023_11_15_025924_add_columns_to_item_statuses_table', 1),
(47, '2023_11_16_011328_add_column_to_receive_items_table', 1),
(48, '2023_11_16_011452_change__column_to_receive_items_table', 1),
(49, '2023_11_16_011952_change_column_to_receive_items_table', 1),
(50, '2023_11_17_012801_add_column_in_receive_items_table', 1),
(51, '2023_11_21_014242_add_columns_to_items_table', 1),
(52, '2023_11_22_010147_create_mreqf_series_table', 1),
(53, '2023_11_22_013259_add_columns_to_request_head_table', 1),
(54, '2023_11_24_141754_add_column_to_receive_head_table', 1),
(55, '2023_12_05_012535_create_pr_items_table', 1),
(56, '2023_12_06_014632_change_variants_table', 1),
(57, '2023_12_06_021012_change_column_in_variants_table', 1),
(58, '2023_12_06_031620_add_column_to_receive_items_table', 1),
(59, '2023_12_07_060920_create_mif_series_table', 1),
(60, '2023_12_07_064519_add_column_to_request_head_table', 1),
(61, '2023_12_07_065500_add_column_to_request_items_table', 1),
(62, '2023_12_15_015741_add_column_to_issuance_head_table', 1),
(63, '2024_01_10_030558_add_columns_to_no_variant_table', 1),
(64, '2024_01_10_054131_add_columns_to_variants_table', 1),
(65, '2024_01_10_054202_add_columns_to_composite_items_table', 1),
(66, '2024_01_17_022804_add_column_to_issaunce_items_table', 1),
(67, '2024_01_17_024821_add_column_to_issuance_items_table', 1),
(68, '2024_01_18_011926_change_columns_in_no_variant_table', 1),
(69, '2024_01_18_011939_change_columns_in_pr_items_table', 1),
(70, '2024_01_25_014919_add_columns_to_receive_head_table', 1),
(71, '2024_01_29_020209_create_pn_series_table', 1),
(72, '2024_02_01_065403_add_columns_to_variants_table', 1),
(73, '2024_02_06_063901_add_columns_to_issuance_head_table', 1),
(74, '2024_02_08_011826_add_columns_to_issuance_head_table', 1),
(75, '2024_02_08_013031_add-columns_in_request_head', 1),
(76, '2024_02_08_014145_add_columns_to_receive_head_table', 1),
(77, '2024_02_08_061225_add_columns_to_issuance_head_table', 1),
(78, '2024_02_08_062134_create_mgp_series_table', 1),
(79, '2024_02_08_062517_add_columns_to_issuance_head_table', 1),
(80, '2024_02_13_022302_add_columns_in_variants_table', 1),
(81, '2024_02_13_024058_add_prepared_by_to_request_head', 1),
(82, '2024_02_14_064040_add_columns_to_items_table', 1),
(83, '2024_02_16_013449_add_columns_to_variants_table', 1),
(84, '2024_02_19_014427_create_restock_head_table', 1),
(85, '2024_02_19_020557_create_restock_details_table', 1),
(86, '2024_02_19_021737_create_mrs_series_table', 1),
(87, '2024_02_19_031547_create_mbr_series_table', 1),
(88, '2024_02_19_033818_add_columns_to_pr_items_table', 1),
(89, '2024_02_19_055335_create_bo_series_table', 1),
(90, '2024_02_19_055609_add_columns_to_pr_items_table', 1),
(91, '2024_02_19_063256_add_columns_to_pr_items_table', 1),
(92, '2024_02_19_063413_create_borrow_head_table', 1),
(93, '2024_02_19_063501_create_borrow_details_table', 1),
(94, '2024_02_19_064316_add_column_to_borrow_head_table', 1),
(95, '2024_02_20_025434_create_variants_balance_table', 1),
(96, '2024_02_21_021546_add_columns_to_receive_items_table', 1),
(97, '2024_02_21_021735_add_columns_to_pr_items_table', 1),
(98, '2024_02_21_023312_create_backorder_head', 1),
(99, '2024_02_21_024402_create_backorder_details', 1),
(100, '2024_02_21_025522_create_backorder_items', 1),
(101, '2024_02_22_072057_add_columns_to_composite_items_table', 1),
(102, '2024_02_23_075110_change_column_in_backorder_head', 1),
(103, '2024_02_23_075311_add_column_in_backorder_details', 1),
(104, '2024_02_28_142932_add_columns_to_restock_details_table', 1),
(105, '2024_02_29_015144_change_column_in_backorder_head', 1),
(106, '2024_02_29_015239_change_column_in_backorder_items', 1),
(107, '2024_02_29_060151_add_column_to_backorder_head', 1),
(108, '2024_02_29_105138_add_columns_to_restock_head_table', 1),
(109, '2024_03_06_140524_change_column_in_backorder_head', 1),
(110, '2024_03_08_142927_change_column_in_borrow_head', 1),
(111, '2024_03_08_143231_change_columns_in_borrow_details', 1),
(112, '2024_03_09_143807_add_columns_to_restock_head_table', 1),
(113, '2024_03_11_104000_add_columns_to_borrow_head', 1),
(114, '2024_03_11_150410_change_columns_in_request_head', 1),
(115, '2024_03_12_092507_change_column_in_backorder_head', 1),
(116, '2024_03_13_144526_add_column_to_request_items', 1),
(117, '2024_03_13_145252_add_columns_to_borrow_details_table', 1),
(118, '2024_03_19_143659_add_columns_to_items_table', 1),
(119, '2024_03_21_140102_add_column_in_request_head', 1),
(120, '2024_03_22_091939_add_column_in_issuance_items_table', 1),
(121, '2024_03_22_143902_add_columns_in_receive_items_table', 1),
(122, '2024_03_23_091739_add_columns_to_variants_table', 1),
(123, '2024_03_25_131412_create_reminders_table', 1),
(124, '2024_03_26_142538_change_columns_in_restock_head_table', 1),
(125, '2024_04_01_133417_add_columns_to_restock_head_table', 1),
(126, '2024_04_02_100815_add_column_to_issuance_head_table', 1),
(127, '2024_04_03_100529_add_column_to_receive_items_table', 1),
(128, '2024_04_04_112900_add_columns_to_backorder_items_table', 1),
(129, '2024_04_15_093251_add_columns_to_variants_table', 1),
(130, '2024_04_15_100334_add_columns_to_items_table', 1),
(131, '2024_04_17_144537_add_column_to_receive_items_table', 1),
(132, '2024_04_18_135721_add_columns_to_request_items_table', 1),
(133, '2024_04_18_145140_add_columns_to_issuance_items_table', 1),
(134, '2024_04_19_093633_add_column_to_backorder_items', 2),
(135, '2024_04_22_144901_add_column_to_variants_table', 2),
(136, '2024_04_23_100334_add_columns_to_issuance_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mrec_series`
--

CREATE TABLE `mrec_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mrec_series`
--

INSERT INTO `mrec_series` (`id`, `year`, `series`, `created_at`, `updated_at`) VALUES
(1, 2024, 1, '2024-04-22 01:16:36', '2024-04-22 01:16:36'),
(2, 2024, 2, '2024-04-22 01:49:55', '2024-04-22 01:49:55'),
(3, 2024, 3, '2024-04-22 01:51:35', '2024-04-22 01:51:35'),
(4, 2024, 4, '2024-04-22 01:52:09', '2024-04-22 01:52:09'),
(5, 2024, 5, '2024-04-22 01:52:48', '2024-04-22 01:52:48'),
(6, 2024, 6, '2024-04-22 01:53:18', '2024-04-22 01:53:18'),
(7, 2024, 7, '2024-04-22 01:54:01', '2024-04-22 01:54:01'),
(8, 2024, 8, '2024-04-22 01:55:39', '2024-04-22 01:55:39'),
(9, 2024, 9, '2024-04-22 01:56:13', '2024-04-22 01:56:13'),
(10, 2024, 10, '2024-04-22 01:56:53', '2024-04-22 01:56:53'),
(11, 2024, 11, '2024-04-22 01:57:30', '2024-04-22 01:57:30'),
(12, 2024, 12, '2024-04-22 01:58:05', '2024-04-22 01:58:05'),
(13, 2024, 13, '2024-04-22 02:09:40', '2024-04-22 02:09:40'),
(14, 2024, 14, '2024-04-22 06:59:52', '2024-04-22 06:59:52'),
(15, 2024, 15, '2024-04-22 07:00:45', '2024-04-22 07:00:45'),
(16, 2024, 16, '2024-04-22 07:06:13', '2024-04-22 07:06:13'),
(17, 2024, 17, '2024-04-22 07:06:58', '2024-04-22 07:06:58'),
(18, 2024, 18, '2024-04-23 00:43:15', '2024-04-23 00:43:15'),
(19, 2024, 19, '2024-04-24 00:51:12', '2024-04-24 00:51:12'),
(20, 2024, 20, '2024-04-24 01:47:37', '2024-04-24 01:47:37'),
(21, 2024, 21, '2024-04-24 01:59:28', '2024-04-24 01:59:28'),
(22, 2024, 22, '2024-04-24 02:10:39', '2024-04-24 02:10:39'),
(23, 2024, 23, '2024-04-24 02:22:39', '2024-04-24 02:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `mreqf_series`
--

CREATE TABLE `mreqf_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mreqf_series`
--

INSERT INTO `mreqf_series` (`id`, `year`, `series`, `created_at`, `updated_at`) VALUES
(1, 2024, 1, '2024-04-23 00:58:45', '2024-04-23 00:58:45'),
(2, 2024, 2, '2024-04-23 01:00:59', '2024-04-23 01:00:59'),
(3, 2024, 3, '2024-04-23 01:23:25', '2024-04-23 01:23:25'),
(4, 2024, 4, '2024-04-23 02:37:57', '2024-04-23 02:37:57'),
(5, 2024, 5, '2024-04-23 02:43:22', '2024-04-23 02:43:22'),
(6, 2024, 6, '2024-04-23 02:47:06', '2024-04-23 02:47:06'),
(7, 2024, 7, '2024-04-23 03:07:21', '2024-04-23 03:07:21'),
(8, 2024, 8, '2024-04-23 03:13:08', '2024-04-23 03:13:08'),
(9, 2024, 9, '2024-04-23 03:20:59', '2024-04-23 03:20:59'),
(10, 2024, 10, '2024-04-24 00:52:03', '2024-04-24 00:52:03'),
(11, 2024, 11, '2024-04-24 00:52:30', '2024-04-24 00:52:30'),
(12, 2024, 12, '2024-04-24 01:48:13', '2024-04-24 01:48:13'),
(13, 2024, 13, '2024-04-24 02:00:00', '2024-04-24 02:00:00'),
(14, 2024, 14, '2024-04-24 02:23:34', '2024-04-24 02:23:34'),
(15, 2024, 15, '2024-04-24 02:25:29', '2024-04-24 02:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `mrs_series`
--

CREATE TABLE `mrs_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mrs_series`
--

INSERT INTO `mrs_series` (`id`, `year`, `series`, `created_at`, `updated_at`) VALUES
(1, 2024, 1, '2024-04-23 00:44:16', '2024-04-23 00:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `no_variant`
--

CREATE TABLE `no_variant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `serial_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `unit_cost` double NOT NULL DEFAULT 0,
  `selling_price` double NOT NULL DEFAULT 0,
  `item_status_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `identifier` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', 'e42ea7006b3e7d8ca2e4e4ae143d7757c8c56a8f3a12b14ea79edab486c2b202', '[\"*\"]', NULL, NULL, '2024-04-22 01:11:40', '2024-04-22 01:11:40'),
(2, 'App\\Models\\User', 1, 'MyApp', '2b6e6ab897367c64077ebf752ee5e1b76b5ca2c35d50e6852c35e3f7f019442f', '[\"*\"]', NULL, NULL, '2024-04-22 06:59:42', '2024-04-22 06:59:42'),
(3, 'App\\Models\\User', 1, 'MyApp', 'f85ab1988ad0f970f8f309538c225a4f929ee126027988e9ff02744d883ba4b8', '[\"*\"]', NULL, NULL, '2024-04-23 00:43:07', '2024-04-23 00:43:07'),
(4, 'App\\Models\\User', 1, 'MyApp', 'c51761d8a1682f7e87fd7d6a7cced32a333ff8ac27a03447f7c8c2a089849d1c', '[\"*\"]', NULL, NULL, '2024-04-24 00:39:48', '2024-04-24 00:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `pn_series`
--

CREATE TABLE `pn_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcat_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pn_series`
--

INSERT INTO `pn_series` (`id`, `subcat_prefix`, `series`, `created_at`, `updated_at`) VALUES
(1, 'subcat-prefix-38', 1001, '2024-04-22 01:16:16', '2024-04-22 01:16:16'),
(2, 'subcat-prefix-18', 1001, '2024-04-22 01:49:48', '2024-04-22 01:49:48'),
(3, 'subcat-prefix-38', 1002, '2024-04-22 06:59:19', '2024-04-22 06:59:19'),
(4, 'subcat-prefix-38', 1003, '2024-04-23 00:57:54', '2024-04-23 00:57:54'),
(5, 'subcat-prefix-38', 1004, '2024-04-23 01:22:35', '2024-04-23 01:22:35'),
(6, 'subcat-prefix-37', 1001, '2024-04-23 01:22:42', '2024-04-23 01:22:42'),
(7, 'subcat-prefix-10', 1001, '2024-04-23 01:22:50', '2024-04-23 01:22:50'),
(8, 'subcat-prefix-10', 1002, '2024-04-23 01:23:12', '2024-04-23 01:23:12'),
(9, 'subcat-prefix-27', 1001, '2024-04-23 02:42:58', '2024-04-23 02:42:58'),
(10, 'subcat-prefix-27', 1002, '2024-04-23 03:06:57', '2024-04-23 03:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `pr_items`
--

CREATE TABLE `pr_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `begbal` double NOT NULL DEFAULT 0,
  `composite_qty` double NOT NULL DEFAULT 0,
  `receive_qty` double NOT NULL DEFAULT 0,
  `issuance_qty` double NOT NULL DEFAULT 0,
  `restock_qty` double NOT NULL DEFAULT 0,
  `transfer_qty` double NOT NULL DEFAULT 0,
  `damage_qty` double NOT NULL DEFAULT 0,
  `borrow_deduct` double NOT NULL DEFAULT 0,
  `replenish_add` double NOT NULL DEFAULT 0,
  `borrow_add` double NOT NULL DEFAULT 0,
  `replenish_deduct` double NOT NULL DEFAULT 0,
  `backorder_qty` double NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pr_items`
--

INSERT INTO `pr_items` (`id`, `pr_no`, `item_id`, `begbal`, `composite_qty`, `receive_qty`, `issuance_qty`, `restock_qty`, `transfer_qty`, `damage_qty`, `borrow_deduct`, `replenish_add`, `borrow_add`, `replenish_deduct`, `backorder_qty`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'WH Stocks', 21, 10, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-22 01:16:16', '2024-04-23 03:03:51'),
(2, 'pr1', 21, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:17:10', '2024-04-22 01:17:10'),
(3, 'WH Stocks', 22, 10, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-22 01:49:48', '2024-04-23 02:44:17'),
(4, 'pr2', 22, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:50:21', '2024-04-22 01:50:21'),
(5, 'pr3', 22, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:51:58', '2024-04-22 01:51:58'),
(6, 'pr4', 22, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, '2024-04-22 01:52:37', '2024-04-22 01:52:37'),
(7, 'pr5', 17, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:53:07', '2024-04-22 01:53:07'),
(8, 'pr6', 21, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:53:54', '2024-04-22 01:53:54'),
(9, 'pr7', 13, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:54:25', '2024-04-22 01:54:25'),
(10, 'pr7', 9, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:56:05', '2024-04-22 01:56:05'),
(11, 'pr8', 15, 0, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-22 01:56:44', '2024-04-23 02:39:52'),
(12, 'pr9', 6, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:57:22', '2024-04-22 01:57:22'),
(13, 'pr10', 5, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:57:54', '2024-04-22 01:57:54'),
(14, 'pr11', 16, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:58:35', '2024-04-22 01:58:35'),
(15, 'pr12', 21, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 02:10:22', '2024-04-22 02:10:22'),
(16, 'pr13', 1, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 02:10:22', '2024-04-22 02:10:22'),
(17, 'WH Stocks', 23, 10, 0, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 18, '2024-04-22 06:59:19', '2024-04-23 03:03:51'),
(18, 'pr14', 23, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 07:00:18', '2024-04-22 07:00:18'),
(19, 'pr15', 23, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 07:01:14', '2024-04-22 07:01:14'),
(20, 'pr16', 23, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 07:06:42', '2024-04-22 07:06:42'),
(21, 'pr17', 23, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 07:07:20', '2024-04-22 07:07:20'),
(22, 'pr18', 23, 0, 0, 10, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, '2024-04-23 00:43:48', '2024-04-23 00:44:24'),
(23, 'WH Stocks', 24, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-23 00:57:54', '2024-04-23 01:05:18'),
(24, 'WH Stocks', 25, 10, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 7, '2024-04-23 01:22:35', '2024-04-23 03:32:33'),
(25, 'WH Stocks', 26, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-23 01:22:42', '2024-04-23 03:06:57'),
(26, 'WH Stocks', 27, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-23 01:22:50', '2024-04-23 03:06:57'),
(27, 'WH Stocks', 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-04-23 01:23:12', '2024-04-23 01:23:12'),
(28, 'WH Stocks', 29, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-23 02:42:58', '2024-04-23 03:03:51'),
(29, 'WH Stocks', 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-04-23 03:06:57', '2024-04-23 03:06:57'),
(30, 'pr19', 22, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-24 00:51:51', '2024-04-24 00:52:59'),
(31, 'pr20', 23, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-24 01:48:05', '2024-04-24 01:48:05'),
(32, 'pr21', 23, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-24 01:59:51', '2024-04-24 01:59:51'),
(33, 'pr22', 23, 0, 0, 10, 5, 0, 0, 0, 0, 0, 0, 0, 0, 5, '2024-04-24 02:23:00', '2024-04-24 02:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `purposes`
--

CREATE TABLE `purposes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purpose_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purposes`
--

INSERT INTO `purposes` (`id`, `purpose_name`, `created_at`, `updated_at`) VALUES
(1, 'Similique eius sint ea dolore quidem eos enim officia. At tempore omnis qui consequatur numquam animi facilis.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, 'Fugit iste est quis veritatis consequuntur maiores. Aut molestias ut et sed. Laudantium et fugiat rerum ipsum natus.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, 'Dolor ipsa cupiditate vitae beatae. Aut voluptas quidem exercitationem corporis itaque.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, 'Et hic est veritatis quae. Voluptates ea impedit consectetur doloribus. Aut ut cupiditate sit perferendis cumque sunt ut.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, 'Rerum dolorem ut architecto. Atque sed qui in a alias ut voluptate.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, 'Ipsum amet veritatis odit rem sit. Vel atque sunt unde harum recusandae. Quod quaerat vitae optio rem laboriosam dolor ut.', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(11, '5~Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `racks`
--

CREATE TABLE `racks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rack_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `racks`
--

INSERT INTO `racks` (`id`, `rack_name`, `created_at`, `updated_at`) VALUES
(1, 'molestiae', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'velit', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'tempora', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'et', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'commodi', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, 'rerum', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, 'ullam', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, 'dolorum', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, 'ut', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, 'nesciunt', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `receive_details`
--

CREATE TABLE `receive_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receive_head_id` int(10) UNSIGNED NOT NULL,
  `detail_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receive_details`
--

INSERT INTO `receive_details` (`id`, `receive_head_id`, `detail_no`, `pr_no`, `department_id`, `department_name`, `enduse_id`, `enduse_name`, `purpose_id`, `purpose_name`, `inspected_id`, `inspected_name`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'pr1', '3', 'Department-15 ', '4', 'Carrie Konopelski II ', '2', 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit. ', '1', 'Dr. Russ Dickinson I', NULL, NULL),
(2, 2, '1', 'pr2', '2', 'Department-25 ', '3', 'Estrella Ratke ', '4', 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat. ', '1', 'Dr. Russ Dickinson I', NULL, NULL),
(3, 3, '1', 'pr3', '4', 'Department-26 ', '3', 'Estrella Ratke ', '5', 'Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis. ', '2', 'Milford Kulas', NULL, NULL),
(4, 4, '1', 'pr4', '3', 'Department-15 ', '2', 'Dave Kshlerin ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '3', 'Gerda Wilderman', NULL, NULL),
(5, 5, '1', 'pr5', '3', 'Department-15 ', '2', 'Dave Kshlerin ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '2', 'Milford Kulas', NULL, NULL),
(6, 6, '1', 'pr6', '3', 'Department-15 ', '1', 'Harvey Glover V ', '4', 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat. ', '2', 'Milford Kulas', NULL, NULL),
(7, 7, '1', 'pr7', '2', 'Department-25 ', '2', 'Dave Kshlerin ', '5', 'Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis. ', '1', 'Dr. Russ Dickinson I', NULL, NULL),
(8, 8, '1', 'pr7', '6', '2~Department-25', '11', '2~Dave Kshlerin', '11', '5~Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis.', '1', 'Dr. Russ Dickinson I', NULL, NULL),
(9, 9, '1', 'pr8', '3', 'Department-15 ', '2', 'Dave Kshlerin ', '1', 'Similique eius sint ea dolore quidem eos enim officia. At tempore omnis qui consequatur numquam animi facilis. ', '2', 'Milford Kulas', NULL, NULL),
(10, 10, '1', 'pr9', '5', 'Department-38 ', '2', 'Dave Kshlerin ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '5', 'Mateo Williamson', NULL, NULL),
(11, 11, '1', 'pr10', '3', 'Department-15 ', '5', 'Prof. Leola Volkman ', '2', 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit. ', '2', 'Milford Kulas', NULL, NULL),
(12, 12, '1', 'pr11', '3', 'Department-15 ', '2', 'Dave Kshlerin ', '4', 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat. ', '2', 'Milford Kulas', NULL, NULL),
(13, 13, '1', 'pr12', '2', 'Department-25 ', '3', 'Estrella Ratke ', '2', 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit. ', '1', 'Dr. Russ Dickinson I', NULL, NULL),
(14, 13, '2', 'pr13', '5', 'Department-38 ', '3', 'Estrella Ratke ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '2', 'Milford Kulas', NULL, NULL),
(15, 14, '1', 'pr14', '3', 'Department-15 ', '5', 'Prof. Leola Volkman ', '1', 'Similique eius sint ea dolore quidem eos enim officia. At tempore omnis qui consequatur numquam animi facilis. ', '7', 'Alec Powlowski', NULL, NULL),
(16, 15, '1', 'pr15', '3', 'Department-15 ', '4', 'Carrie Konopelski II ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '1', 'Dr. Russ Dickinson I', NULL, NULL),
(17, 16, '1', 'pr16', '3', 'Department-15 ', '3', 'Estrella Ratke ', '5', 'Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis. ', '2', 'Milford Kulas', NULL, NULL),
(18, 17, '1', 'pr17', '3', 'Department-15 ', '3', 'Estrella Ratke ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '2', 'Milford Kulas', NULL, NULL),
(19, 18, '1', 'pr18', '2', 'Department-25 ', '2', 'Dave Kshlerin ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '3', 'Gerda Wilderman', NULL, NULL),
(20, 19, '1', 'pr19', '4', 'Department-26 ', '2', 'Dave Kshlerin ', '4', 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat. ', '2', 'Milford Kulas', NULL, NULL),
(21, 20, '1', 'pr20', '3', 'Department-15 ', '2', 'Dave Kshlerin ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '4', 'Terry Mueller Sr.', NULL, NULL),
(22, 21, '1', 'pr21', '4', 'Department-26 ', '2', 'Dave Kshlerin ', '3', 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi. ', '2', 'Milford Kulas', NULL, NULL),
(23, 23, '1', 'pr22', '4', 'Department-26 ', '1', 'Harvey Glover V ', '2', 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit. ', '3', 'Gerda Wilderman', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receive_head`
--

CREATE TABLE `receive_head` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receive_date` date DEFAULT NULL,
  `mrecf_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `si_or` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pcf` int(11) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `prepared_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepared_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepared_by` int(11) NOT NULL DEFAULT 0,
  `noted_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by` int(11) NOT NULL DEFAULT 0,
  `noted_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledged_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledged_by` int(11) NOT NULL DEFAULT 0,
  `acknowledged_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by` int(11) NOT NULL DEFAULT 0,
  `receive_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` int(11) NOT NULL DEFAULT 0,
  `draft` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receive_head`
--

INSERT INTO `receive_head` (`id`, `receive_date`, `mrecf_no`, `dr_no`, `po_no`, `si_or`, `pcf`, `user_id`, `saved`, `prepared_by_name`, `prepared_position`, `prepared_by`, `noted_name`, `noted_by`, `noted_position`, `acknowledged_by_name`, `acknowledged_by`, `acknowledged_position`, `received_by_name`, `received_by`, `receive_position`, `delivered_by`, `closed`, `draft`, `created_at`, `updated_at`) VALUES
(1, '2024-04-22', 'MRIF-2024-04-0001', '345345', '5345', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:17:10'),
(2, '2024-04-22', 'MRIF-2024-04-0002', 'sdf345', 'gfdg', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:50:21'),
(3, '2024-04-22', 'MRIF-2024-04-0003', 'dad', 'dfgdfg', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:51:58'),
(4, '2024-04-22', 'MRIF-2024-04-0004', '23435', '234234', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:52:37'),
(5, '2024-04-22', 'MRIF-2024-04-0005', '346479', '12325', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:53:07'),
(6, '2024-04-22', 'MRIF-2024-04-0006', '7844', '123', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:53:54'),
(7, '2024-04-22', 'MRIF-2024-04-0007', '435232', '4234', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:54:25'),
(8, '2024-04-22', 'MRIF-2024-04-0008', 'dr345', '5535', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:56:05'),
(9, '2024-04-22', 'MRIF-2024-04-0009', '97895', '6865', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:56:44'),
(10, '2024-04-22', 'MRIF-2024-04-0010', 'k5635', '23556', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:57:22'),
(11, '2024-04-22', 'MRIF-2024-04-0011', '34356', '78968', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:57:54'),
(12, '2024-04-22', 'MRIF-2024-04-0012', 'asj4924', '8234lk2j', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 01:58:35'),
(13, '2024-04-22', 'MRIF-2024-04-0013', 'dfgdfg', '3345', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 02:10:22'),
(14, '2024-04-22', 'MRIF-2024-04-0014', 'dr34235', 'po34234', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 07:00:18'),
(15, '2024-04-22', 'MRIF-2024-04-0015', 'dfdfg', '45345', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 07:01:14'),
(16, '2024-04-22', 'MRIF-2024-04-0016', 'sdfsd', 'fsdf', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 07:06:42'),
(17, '2024-04-22', 'MRIF-2024-04-0017', 'dr24223', 'dfgdfg', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-22 07:07:20'),
(18, '2024-04-23', 'MRIF-2024-04-0018', 'ssdgg', 'sdfsdfsdf', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-23 00:43:48'),
(19, '2024-04-24', 'MRIF-2024-04-0019', 'dr16', 'po16', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-24 00:51:51'),
(20, '2024-04-24', 'MRIF-2024-04-0020', 'dr20', 'po20', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-24 01:48:05'),
(21, '2024-04-24', 'MRIF-2024-04-0021', 'dr21', 'po21', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-24 01:59:51'),
(22, '2024-04-24', 'MRIF-2024-04-0022', 'dr22', 'po22', NULL, 0, 1, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, NULL, '2024-04-24 02:10:39'),
(23, '2024-04-24', 'MRIF-2024-04-0023', 'dr22', 'po22', NULL, 0, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, '2024-04-24 02:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `receive_items`
--

CREATE TABLE `receive_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receive_head_id` int(11) NOT NULL DEFAULT 0,
  `receive_details_id` int(11) NOT NULL DEFAULT 0,
  `variant_id` int(11) DEFAULT 0,
  `item_no` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pn_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `supplier_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catalog_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_status_id` int(11) NOT NULL DEFAULT 0,
  `item_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_quantity` double NOT NULL DEFAULT 0,
  `rec_quantity` double NOT NULL DEFAULT 0,
  `borrow_qty` double NOT NULL DEFAULT 0,
  `unit_cost` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `selling_price` double NOT NULL DEFAULT 0,
  `pr_replenish` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prno_replenish` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receive_items`
--

INSERT INTO `receive_items` (`id`, `receive_head_id`, `receive_details_id`, `variant_id`, `item_no`, `item_id`, `item_description`, `pn_no`, `supplier_id`, `supplier_name`, `brand`, `color`, `size`, `catalog_no`, `serial_no`, `barcode`, `location`, `item_status_id`, `item_status`, `uom`, `exp_quantity`, `rec_quantity`, `borrow_qty`, `unit_cost`, `shipping_cost`, `selling_price`, `pr_replenish`, `prno_replenish`, `expiry_date`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, 21, 'Mouse', 'subcat-prefix-38_1001', 2, 'Ibrahim Barrows', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 90, 0, '', NULL, '', '', '2024-04-22 01:17:07', '2024-04-22 01:17:10'),
(2, 2, 2, 4, 1, 22, 'Keyboard', 'subcat-prefix-18_1001', 10, 'June Cremin', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 800, 90, 0, '', NULL, '', '', '2024-04-22 01:50:19', '2024-04-22 01:50:21'),
(3, 3, 3, 5, 1, 22, 'Keyboard', 'subcat-prefix-18_1001', 14, 'Prof. Modesto Champlin', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 150, 50, 0, '', NULL, '', '', '2024-04-22 01:51:56', '2024-04-22 01:51:58'),
(4, 4, 4, 6, 1, 22, 'Keyboard', 'subcat-prefix-18_1001', 1, 'Joe Sanford', '', '', '', '', '', NULL, '', 3, 'New', '', 60, 60, 0, 600, 90, 0, '', NULL, '', '', '2024-04-22 01:52:34', '2024-04-22 01:52:37'),
(5, 5, 5, 7, 1, 17, 'recusandae', 'null', 13, 'Mrs. Kaci McKenzie', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 178, 15, 0, '', NULL, '', '', '2024-04-22 01:53:06', '2024-04-22 01:53:07'),
(6, 6, 6, 8, 1, 21, 'Mouse', 'subcat-prefix-38_1001', 13, 'Mrs. Kaci McKenzie', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 234, 99, 0, '', NULL, '', '', '2024-04-22 01:53:51', '2024-04-22 01:53:54'),
(7, 7, 7, 9, 1, 13, 'et', 'null', 13, 'Mrs. Kaci McKenzie', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 90, 0, '', NULL, '', '', '2024-04-22 01:54:23', '2024-04-22 01:54:25'),
(8, 8, 8, 10, 1, 9, 'quibusdam', 'null', 7, 'Miss Kiara Tillman', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 80, 0, '', NULL, '', '', '2024-04-22 01:56:03', '2024-04-22 01:56:05'),
(9, 9, 9, 11, 1, 15, 'ea', 'null', 13, 'Mrs. Kaci McKenzie', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 879, 76, 0, '', NULL, '', '', '2024-04-22 01:56:42', '2024-04-22 01:56:44'),
(10, 10, 10, 12, 1, 6, 'non', 'null', 1, 'Joe Sanford', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 12938, 324, 0, '', NULL, '', '', '2024-04-22 01:57:20', '2024-04-22 01:57:22'),
(11, 11, 11, 13, 1, 5, 'est', 'null', 14, 'Prof. Modesto Champlin', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 90, 0, '', NULL, '', '', '2024-04-22 01:57:52', '2024-04-22 01:57:54'),
(12, 12, 12, 14, 1, 16, 'qui', 'null', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 10, 100, 0, '', NULL, '', '', '2024-04-22 01:58:33', '2024-04-22 01:58:35'),
(13, 13, 13, 15, 1, 21, 'Mouse', 'subcat-prefix-38_1001', 14, 'Prof. Modesto Champlin', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 10, 90, 0, '', NULL, '', '', '2024-04-22 02:09:58', '2024-04-22 02:10:22'),
(14, 13, 14, 16, 1, 1, 'impedit', 'null', 14, 'Prof. Modesto Champlin', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 80, 0, '', NULL, '', '', '2024-04-22 02:10:19', '2024-04-22 02:10:22'),
(15, 14, 15, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 90, 0, '', NULL, '', '', '2024-04-22 07:00:15', '2024-04-22 07:00:18'),
(16, 15, 16, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 150, 80, 0, '', NULL, '', '', '2024-04-22 07:01:12', '2024-04-22 07:01:14'),
(17, 16, 17, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 170, 90, 0, '', NULL, '', '', '2024-04-22 07:06:40', '2024-04-22 07:06:42'),
(18, 17, 18, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 100, 60, 0, '', NULL, '', '', '2024-04-22 07:07:18', '2024-04-22 07:07:20'),
(19, 18, 19, 19, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 11, 'Dr. Pansy Reichert', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 900, 100, 0, '', NULL, '', '', '2024-04-23 00:43:46', '2024-04-23 00:43:48'),
(20, 19, 20, 20, 1, 22, 'Keyboard', 'subcat-prefix-18_1001', 13, 'Mrs. Kaci McKenzie', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 1600, 85, 0, '', NULL, '', '', '2024-04-24 00:51:48', '2024-04-24 00:51:51'),
(21, 20, 21, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 1000, 80, 0, '', NULL, '', '', '2024-04-24 01:48:03', '2024-04-24 01:48:05'),
(22, 21, 22, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 1000, 80, 0, '', NULL, '', '', '2024-04-24 01:59:47', '2024-04-24 01:59:51'),
(23, 23, 23, 18, 1, 23, 'Monitor', 'subcat-prefix-38_1002', 12, 'Mrs. Juliet Hoeger V', '', '', '', '', '', NULL, '', 3, 'New', '', 10, 10, 0, 1000, 90, 0, '', NULL, '', '', '2024-04-24 02:22:58', '2024-04-24 02:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reminder_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_to_notify_id` int(11) NOT NULL DEFAULT 0,
  `person_to_notify_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by_id` int(11) NOT NULL DEFAULT 0,
  `added_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `done` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_head`
--

CREATE TABLE `request_head` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mreqf_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pr_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) NOT NULL DEFAULT 0,
  `department_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_id` int(11) NOT NULL DEFAULT 0,
  `purpose_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_id` int(11) NOT NULL DEFAULT 0,
  `enduse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrow_from_pr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `close` int(11) DEFAULT 0,
  `saved` int(11) NOT NULL DEFAULT 0,
  `draft` int(11) NOT NULL DEFAULT 0,
  `borrowed_id` int(11) NOT NULL DEFAULT 0,
  `prepared_by` int(11) NOT NULL DEFAULT 0,
  `prepared_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepared_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT 0,
  `requested_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by` int(11) NOT NULL DEFAULT 0,
  `noted_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` int(11) NOT NULL DEFAULT 0,
  `approved_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by` int(11) NOT NULL DEFAULT 0,
  `reviewed_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_head`
--

INSERT INTO `request_head` (`id`, `request_date`, `request_time`, `mreqf_no`, `request_type`, `pr_no`, `department_id`, `department_name`, `purpose_id`, `purpose_name`, `enduse_id`, `enduse_name`, `borrow_from_pr`, `remarks`, `user_id`, `close`, `saved`, `draft`, `borrowed_id`, `prepared_by`, `prepared_by_name`, `prepared_by_position`, `requested_by`, `requested_by_name`, `requested_by_position`, `noted_by`, `noted_by_name`, `noted_by_position`, `approved_by`, `approved_by_name`, `approved_by_position`, `reviewed_by`, `reviewed_by_name`, `reviewed_by_position`, `created_at`, `updated_at`) VALUES
(1, '2024-04-23', '08:58:08', 'MREQF-2024-04-0001', 'WH Stocks', 'WH Stocks', 1, 'Department-50', 7, 'Dolor ipsa cupiditate vitae beatae. Aut voluptas quidem exercitationem corporis itaque.', 9, 'Anahi Reichel', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 01:05:18'),
(2, '2024-04-23', '08:59:56', 'MREQF-2024-04-0002', 'WH Stocks', 'WH Stocks', 6, '2~Department-25', 6, 'Fugit iste est quis veritatis consequuntur maiores. Aut molestias ut et sed. Laudantium et fugiat rerum ipsum natus.', 4, 'Carrie Konopelski II', NULL, '', 1, 0, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 01:03:08'),
(3, '2024-04-23', '09:23:18', 'MREQF-2024-04-0003', 'WH Stocks', 'WH Stocks', 3, 'Department-15', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 9, 'Anahi Reichel', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 01:24:17'),
(4, '2024-04-23', '10:37:49', 'MREQF-2024-04-0004', 'With PR', 'pr8', 3, 'Department-15', 1, 'Similique eius sint ea dolore quidem eos enim officia. At tempore omnis qui consequatur numquam animi facilis.', 2, 'Dave Kshlerin', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 02:39:52'),
(5, '2024-04-23', '10:43:17', 'MREQF-2024-04-0005', 'WH Stocks', 'WH Stocks', 4, 'Department-26', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 9, 'Anahi Reichel', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 02:44:17'),
(6, '2024-04-23', '10:47:01', 'MREQF-2024-04-0006', 'WH Stocks', 'WH Stocks', 3, 'Department-15', 8, 'Et hic est veritatis quae. Voluptates ea impedit consectetur doloribus. Aut ut cupiditate sit perferendis cumque sunt ut.', 11, '2~Dave Kshlerin', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 03:03:51'),
(7, '2024-04-23', '11:07:15', 'MREQF-2024-04-0007', 'WH Stocks', 'WH Stocks', 3, 'Department-15', 2, 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit.', 9, 'Anahi Reichel', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 03:08:40'),
(8, '2024-04-23', '11:13:03', 'MREQF-2024-04-0008', 'WH Stocks', 'WH Stocks', 2, 'Department-25', 8, 'Et hic est veritatis quae. Voluptates ea impedit consectetur doloribus. Aut ut cupiditate sit perferendis cumque sunt ut.', 2, 'Dave Kshlerin', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 03:13:32'),
(9, '2024-04-23', '11:20:53', 'MREQF-2024-04-0009', 'WH Stocks', 'WH Stocks', 5, 'Department-38', 5, 'Omnis molestiae ex sit quam error vel. Dolor exercitationem libero nobis reiciendis.', 6, 'Prof. Emil Lakin DVM', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-23 03:32:33'),
(10, '2024-04-24', '08:51:57', 'MREQF-2024-04-0010', 'With PR', 'pr19', 4, 'Department-26', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 2, 'Dave Kshlerin', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-24 00:52:59'),
(11, '2024-04-24', '08:52:24', 'MREQF-2024-04-0011', 'With PR', 'pr19', 4, 'Department-26', 4, 'Cupiditate dolores quo iste odio quia totam veritatis. Deleniti et eveniet vero id. Laboriosam aut adipisci molestiae nemo fugiat.', 2, 'Dave Kshlerin', NULL, '', 1, 0, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-24 00:52:36'),
(12, '2024-04-24', '09:48:07', 'MREQF-2024-04-0012', 'With PR', 'pr20', 3, 'Department-15', 3, 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi.', 2, 'Dave Kshlerin', NULL, '', 1, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(13, '2024-04-24', '09:59:55', 'MREQF-2024-04-0013', 'With PR', 'pr21', 4, 'Department-26', 3, 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi.', 2, 'Dave Kshlerin', NULL, '', 1, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(14, '2024-04-24', '10:23:26', 'MREQF-2024-04-0014', 'With PR', 'pr22', 4, 'Department-26', 2, 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit.', 1, 'Harvey Glover V', NULL, '', 1, 0, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-24 02:25:16'),
(15, '2024-04-24', '10:25:23', 'MREQF-2024-04-0015', 'With PR', 'pr22', 4, 'Department-26', 2, 'Labore aperiam quisquam temporibus necessitatibus sapiente quis. Sit numquam nulla unde nemo ut possimus. Quae optio velit ab dolores aspernatur officiis sit.', 1, 'Harvey Glover V', NULL, '', 1, 1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-04-24 02:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `request_items`
--

CREATE TABLE `request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_head_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `composite_id` int(11) NOT NULL DEFAULT 0,
  `quantity` double NOT NULL DEFAULT 0,
  `unit_cost` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `issued_qty` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_items`
--

INSERT INTO `request_items` (`id`, `request_head_id`, `item_id`, `item_description`, `variant_id`, `composite_id`, `quantity`, `unit_cost`, `shipping_cost`, `issued_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 24, 'PC', 0, 0, 1, 20000, 0, 1, '2024-04-23 00:59:33', '2024-04-23 01:05:18'),
(2, 2, 24, 'PC', 3, 1, 1, 100, 0, 0, '2024-04-23 01:03:08', '2024-04-23 01:03:08'),
(3, 3, 28, 'compo', 0, 4, 1, 0, 0, 1, '2024-04-23 01:24:02', '2024-04-23 01:24:17'),
(4, 4, 15, 'ea', 11, 0, 2, 879, 76, 2, '2024-04-23 02:38:02', '2024-04-23 02:39:52'),
(5, 5, 29, 'PC2', 3, 7, 1, 100, 0, 1, '2024-04-23 02:43:49', '2024-04-23 02:44:17'),
(6, 6, 29, 'PC2', 0, 0, 1, 0, 0, 1, '2024-04-23 02:47:23', '2024-04-23 03:03:51'),
(7, 7, 30, 'compo', 0, 10, 1, 0, 0, 1, '2024-04-23 03:07:35', '2024-04-23 03:08:40'),
(8, 8, 30, 'compo', 0, 10, 1, 0, 0, 1, '2024-04-23 03:13:20', '2024-04-23 03:13:32'),
(9, 9, 25, 'begbal1', 0, 0, 1, 0, 0, 1, '2024-04-23 03:21:07', '2024-04-23 03:32:33'),
(10, 10, 22, 'Keyboard', 20, 0, 10, 1600, 85, 10, '2024-04-24 00:52:11', '2024-04-24 00:52:59'),
(11, 11, 22, 'Keyboard', 20, 0, 10, 1600, 85, 0, '2024-04-24 00:52:36', '2024-04-24 00:52:36'),
(12, 14, 23, 'Monitor', 18, 0, 10, 1000, 90, 0, '2024-04-24 02:25:16', '2024-04-24 02:25:16'),
(13, 15, 23, 'Monitor', 18, 0, 5, 1000, 90, 5, '2024-04-24 02:25:39', '2024-04-24 02:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `restock_details`
--

CREATE TABLE `restock_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restock_head_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `receive_items_id` int(10) UNSIGNED NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `reason_id` int(11) NOT NULL DEFAULT 0,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restock_details`
--

INSERT INTO `restock_details` (`id`, `restock_head_id`, `item_id`, `item_description`, `variant_id`, `receive_items_id`, `quantity`, `reason_id`, `reason`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 'Monitor', 19, 19, 10, 4, 'debitis', '', '2024-04-23 00:44:24', '2024-04-23 00:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `restock_head`
--

CREATE TABLE `restock_head` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source_pr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrs_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) NOT NULL DEFAULT 0,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enduse_id` int(11) NOT NULL DEFAULT 0,
  `enduse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose_id` int(11) NOT NULL DEFAULT 0,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `returned_by` int(11) NOT NULL DEFAULT 0,
  `returned_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `returned_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledged_by` int(11) NOT NULL DEFAULT 0,
  `acknowledged_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledged_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_by` int(11) NOT NULL DEFAULT 0,
  `inspected_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspected_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by` int(11) NOT NULL DEFAULT 0,
  `noted_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted_by_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `saved` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restock_head`
--

INSERT INTO `restock_head` (`id`, `source_pr`, `destination`, `mrs_no`, `department_id`, `department`, `enduse_id`, `enduse`, `purpose_id`, `purpose`, `date`, `time`, `returned_by`, `returned_by_name`, `returned_by_position`, `acknowledged_by`, `acknowledged_by_name`, `acknowledged_by_position`, `inspected_by`, `inspected_by_name`, `inspected_by_position`, `noted_by`, `noted_by_name`, `noted_by_position`, `user_id`, `saved`, `created_at`, `updated_at`) VALUES
(1, 'pr18', 'Warehouse Stock', 'MRS-2024-04-0001', 2, 'Department-25', 2, 'Dave Kshlerin', 3, 'Magni quam et nam possimus qui et sit. Dolores aut nemo saepe. Est fugit est aliquam modi.', '2024-04-23', '08:43:52', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, '2024-04-23 00:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `restock_reasons`
--

CREATE TABLE `restock_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restock_reasons`
--

INSERT INTO `restock_reasons` (`id`, `reason`, `created_at`, `updated_at`) VALUES
(1, 'qui', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'dolor', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'harum', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'debitis', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'aut', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, 'omnis', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, 'eveniet', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, 'aut', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, 'sit', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, 'qui', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `address`, `contact_person`, `contact_number`, `email`, `terms`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Joe Sanford', '4691 Witting Grove Apt. 048\nWest Broderick, TX 82829', 'Dr. Tania Bechtelar IV', '773.668.2096', 'lschaden@greenfelder.com', 'Veritatis dolores ducimus aliquid dolores beatae. Est voluptate animi magnam non. Eum fuga et quo quia eum voluptates deleniti.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'Ibrahim Barrows', '838 Luettgen Isle\nSouth Myrticechester, NH 20809-4775', 'Lorenzo Stanton', '+1.272.218.5212', 'dorris17@becker.com', 'Voluptates cum minima earum aut. Perferendis officiis natus nihil ea eos.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'Blanche White', '86178 Olson Spur Apt. 968\nEast Christiantown, NY 28499', 'Neil Kertzmann', '707-741-8245', 'zhickle@baumbach.com', 'Et voluptas et eos deleniti rerum. Eum voluptas cupiditate nostrum facere ipsam consequatur. Enim aperiam eos tenetur et.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'Gonzalo Dicki DDS', '67156 Gregoria River Suite 700\nJasenland, WA 30200-9001', 'Opal Herman', '+14254375613', 'uprohaska@yahoo.com', 'Accusantium provident officia sequi hic nobis quia et aut. Nisi autem consectetur aut et sunt.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'Bianka Gutkowski', '3842 Lindgren Mills\nWintheiserhaven, NH 86437-5495', 'Mr. Deion Kris DDS', '909-238-7633', 'oroberts@yost.org', 'Officia et nihil atque nihil et sit vel quia. Dolores veniam esse iste voluptatibus labore nisi molestiae. Non labore alias delectus architecto fugiat et.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, 'Emmanuelle Nicolas', '9855 Viva Inlet Suite 929\nNorth Drew, NH 34353', 'Ona Torp', '832.804.2226', 'baumbach.brooks@prosacco.com', 'Quae voluptas dignissimos voluptatem vitae debitis natus. Harum numquam ducimus ullam itaque.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, 'Miss Kiara Tillman', '512 Oberbrunner Islands Apt. 749\nTillmanport, NJ 38880', 'Zachery Cormier', '+14586862980', 'qrau@gmail.com', 'Non omnis aut quos amet. Eius deleniti est iusto nobis. Voluptatibus aliquam accusantium commodi in harum recusandae.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, 'Donald Rosenbaum', '55704 Georgianna Inlet\nEbertmouth, NE 49535-9958', 'Annabelle Hettinger', '1-330-681-2604', 'walter.doris@hotmail.com', 'Quia odit ut aliquam et asperiores vel exercitationem quis. Commodi sit excepturi nihil quo perspiciatis id illo.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, 'Dr. Ernest Hettinger III', '2481 Quitzon Trafficway\nBradyville, WV 40699', 'Moriah Stehr', '+1-540-758-0390', 'ibergnaum@green.com', 'Sed voluptatem quia incidunt sit quo facere. Accusamus autem similique magni neque est.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, 'June Cremin', '61382 Margie Coves Apt. 695\nRunolfsdottirmouth, WV 10947-9975', 'Mr. Orion Hills', '+1 (573) 410-6031', 'else.schroeder@hotmail.com', 'Rerum voluptatem consequatur assumenda quibusdam tempore ut sunt. Adipisci itaque illo soluta eum. Magnam quae adipisci non culpa voluptas cum.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(11, 'Dr. Pansy Reichert', '73934 Ebba Lights Suite 946\nNew Rafael, IN 39486', 'Jasen Simonis', '+1.539.777.9998', 'darlene.mraz@yahoo.com', 'Alias quo voluptatum sed illo voluptates quibusdam dolores quia. Dolor quia ex error voluptas eaque aliquam. Vero soluta maxime aut sit.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(12, 'Mrs. Juliet Hoeger V', '42397 Eileen Rue\nLake Amirafurt, VA 80972-4690', 'Mr. Garret Robel Jr.', '1-260-268-1497', 'eboehm@rowe.org', 'Sequi illum atque in. Animi dolore mollitia illo adipisci eos.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(13, 'Mrs. Kaci McKenzie', '6024 Jakubowski Run Apt. 663\nLake Madisynberg, DC 66981-1929', 'Lilly Vandervort DDS', '347-484-9798', 'pwatsica@hotmail.com', 'Debitis eveniet perferendis eum facilis. Corporis architecto quo illum odit. Odit repellat doloribus quod quis eveniet dolore.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(14, 'Prof. Modesto Champlin', '1204 Susanna Trace\nNorth Sydnie, WA 56134', 'Simone Brakus Sr.', '850-785-2069', 'izaiah45@gmail.com', 'Magnam nam animi dolorem. Voluptates fugit reprehenderit provident sint aspernatur. Necessitatibus ratione quis aliquam eum asperiores iure architecto.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(15, 'Gretchen Carroll', '2747 Susie Manors Apt. 344\nSouth Cletachester, MO 54028-5997', 'Prof. Sierra Murray', '+1 (430) 761-5220', 'hillard.hermann@gmail.com', 'Aut voluptate quisquam aut iure debitis earum. Dolorum unde facere sit eaque autem quia illum.', 1, '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `uoms`
--

CREATE TABLE `uoms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoms`
--

INSERT INTO `uoms` (`id`, `unit_name`, `created_at`, `updated_at`) VALUES
(1, 'uom -7', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'uom -1', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'uom -5', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'uom -5', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'uom -2', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(11) NOT NULL DEFAULT 0,
  `temp_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_password` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `department_id`, `position`, `contact_no`, `access`, `temp_password`, `change_password`) VALUES
(1, 'Dr. Russ Dickinson I', 'jdare@example.org', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tlBMnAIffU', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(2, 'Milford Kulas', 'oconner.amos@example.com', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GiGIzy7ypf', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(3, 'Gerda Wilderman', 'kenneth.hamill@example.org', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EbNcJ5sM3O', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(4, 'Terry Mueller Sr.', 'qkreiger@example.org', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'N6EupD49zL', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(5, 'Mateo Williamson', 'izaiah48@example.net', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QwytYv246h', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(6, 'Eudora Romaguera', 'karli.christiansen@example.net', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HmQbb0V2KM', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(7, 'Alec Powlowski', 'olson.madeline@example.com', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LfuYLi8xUD', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(8, 'Damien Hintz', 'alejandra18@example.net', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GYwUmsUcIa', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(9, 'Prof. Richie Beer I', 'reilly.breanne@example.com', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JLuLHfGKBS', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(10, 'Rachelle Prosacco', 'willa.gibson@example.net', '2024-04-22 01:11:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'O4WB5sdH8Y', '2024-04-22 01:11:11', '2024-04-22 01:11:11', 0, NULL, NULL, 0, NULL, 0),
(11, 'Mr. Isai Hudson', 'jimmy.graham@example.com', '2024-04-22 01:11:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qkYD2GPVd9', '2024-04-22 01:11:12', '2024-04-22 01:11:12', 0, NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catalog_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `serial_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `unit_cost` double NOT NULL DEFAULT 0,
  `average_cost` double NOT NULL DEFAULT 0,
  `item_status_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `identifier` int(11) NOT NULL DEFAULT 0,
  `uom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_flag` int(11) DEFAULT 0,
  `composite_flag` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `item_id`, `supplier_id`, `supplier_name`, `catalog_no`, `brand`, `serial_no`, `barcode`, `expiration`, `quantity`, `shipping_cost`, `unit_cost`, `average_cost`, `item_status_id`, `identifier`, `uom`, `color`, `size`, `receive_flag`, `composite_flag`, `created_at`, `updated_at`) VALUES
(1, 21, 1, 'Joe Sanford', '', '', '', '', '', 10, 0, 100, 0, 3, 0, 'pcs', '', '', 0, 0, '2024-04-22 01:16:16', '2024-04-22 01:16:16'),
(2, 21, 2, 'Ibrahim Barrows', '', '', '', NULL, '', 10, 0, 0, 100, 3, 0, '', '', '', 1, 0, NULL, NULL),
(3, 22, 15, 'Gretchen Carroll', '', '', '', '', '', 8, 0, 100, 0, 3, 0, 'pcs', '', '', 0, 1, '2024-04-22 01:49:48', '2024-04-23 02:42:58'),
(4, 22, 10, 'June Cremin', '', '', '', NULL, '', 10, 0, 0, 800, 3, 0, '', '', '', 1, 0, NULL, NULL),
(5, 22, 14, 'Prof. Modesto Champlin', '', '', '', NULL, '', 10, 0, 0, 150, 3, 0, '', '', '', 1, 0, NULL, NULL),
(6, 22, 1, 'Joe Sanford', '', '', '', NULL, '', 60, 0, 0, 600, 3, 0, '', '', '', 1, 0, NULL, NULL),
(7, 17, 13, 'Mrs. Kaci McKenzie', '', '', '', NULL, '', 10, 0, 0, 178, 3, 0, '', '', '', 1, 0, NULL, NULL),
(8, 21, 13, 'Mrs. Kaci McKenzie', '', '', '', NULL, '', 10, 0, 0, 234, 3, 0, '', '', '', 1, 0, NULL, NULL),
(9, 13, 13, 'Mrs. Kaci McKenzie', '', '', '', NULL, '', 10, 0, 0, 100, 3, 0, '', '', '', 1, 0, NULL, NULL),
(10, 9, 7, 'Miss Kiara Tillman', '', '', '', NULL, '', 10, 0, 0, 100, 3, 0, '', '', '', 1, 0, NULL, NULL),
(11, 15, 13, 'Mrs. Kaci McKenzie', '', '', '', NULL, '', 8, 0, 0, 879, 3, 0, '', '', '', 1, 0, NULL, '2024-04-23 02:39:52'),
(12, 6, 1, 'Joe Sanford', '', '', '', NULL, '', 10, 0, 0, 12938, 3, 0, '', '', '', 1, 0, NULL, NULL),
(13, 5, 14, 'Prof. Modesto Champlin', '', '', '', NULL, '', 10, 0, 0, 100, 3, 0, '', '', '', 1, 0, NULL, NULL),
(14, 16, 12, 'Mrs. Juliet Hoeger V', '', '', '', NULL, '', 10, 0, 0, 10, 3, 0, '', '', '', 1, 0, NULL, NULL),
(15, 21, 14, 'Prof. Modesto Champlin', '', '', '', NULL, '', 8, 0, 0, 10, 3, 0, '', '', '', 1, 1, NULL, '2024-04-23 02:42:58'),
(16, 1, 14, 'Prof. Modesto Champlin', '', '', '', NULL, '', 10, 0, 0, 100, 3, 0, '', '', '', 1, 0, NULL, NULL),
(17, 23, 1, 'Joe Sanford', '', '', '', '', '', 9, 0, 100, 0, 3, 0, 'pcs', '', '', 0, 1, '2024-04-22 06:59:19', '2024-04-23 00:57:54'),
(18, 23, 12, 'Mrs. Juliet Hoeger V', '', '', '', NULL, '', 64, 90, 1000, 974.6875, 3, 0, '', '', '', 1, 1, NULL, '2024-04-24 02:26:30'),
(19, 23, 11, 'Dr. Pansy Reichert', '', '', '', NULL, '', 0, 100, 900, 1000, 3, 0, '', '', '', 1, 0, NULL, '2024-04-23 00:44:24'),
(20, 22, 13, 'Mrs. Kaci McKenzie', '', '', '', NULL, '', 0, 85, 1600, 1685, 3, 0, '', '', '', 1, 0, NULL, '2024-04-24 00:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `variants_balance`
--

CREATE TABLE `variants_balance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` double UNSIGNED NOT NULL DEFAULT 0,
  `variant_id` double UNSIGNED NOT NULL DEFAULT 0,
  `whstocks_qty` double NOT NULL DEFAULT 0 COMMENT 'add',
  `composite_qty` double NOT NULL DEFAULT 0 COMMENT 'deduct',
  `receive_qty` double NOT NULL DEFAULT 0 COMMENT 'add',
  `issuance_qty` double NOT NULL DEFAULT 0 COMMENT 'deduct',
  `restock_qty` double NOT NULL DEFAULT 0 COMMENT 'add',
  `transfer_qty` double NOT NULL DEFAULT 0 COMMENT 'deduct',
  `damage_qty` double NOT NULL DEFAULT 0 COMMENT 'deduct',
  `borrow_deduct` double NOT NULL DEFAULT 0 COMMENT 'deduct',
  `replenish_add` double NOT NULL DEFAULT 0 COMMENT 'add',
  `borrow_add` double NOT NULL DEFAULT 0 COMMENT 'add',
  `replenish_deduct` double NOT NULL DEFAULT 0 COMMENT 'deduct',
  `backorder_qty` double NOT NULL DEFAULT 0 COMMENT 'add',
  `balance` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants_balance`
--

INSERT INTO `variants_balance` (`id`, `item_id`, `variant_id`, `whstocks_qty`, `composite_qty`, `receive_qty`, `issuance_qty`, `restock_qty`, `transfer_qty`, `damage_qty`, `borrow_deduct`, `replenish_add`, `borrow_add`, `replenish_deduct`, `backorder_qty`, `balance`, `created_at`, `updated_at`) VALUES
(1, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:16:16', '2024-04-22 01:16:16'),
(2, 21, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:16:16', '2024-04-22 01:16:16'),
(3, 21, 2, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:17:10', '2024-04-22 01:17:10'),
(4, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-22 01:49:48', '2024-04-22 01:49:48'),
(5, 22, 3, 10, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-22 01:49:48', '2024-04-23 02:44:17'),
(6, 22, 4, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:50:21', '2024-04-22 01:50:21'),
(7, 22, 5, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:51:58', '2024-04-22 01:51:58'),
(8, 22, 6, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, '2024-04-22 01:52:37', '2024-04-22 01:52:37'),
(9, 17, 7, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:53:07', '2024-04-22 01:53:07'),
(10, 21, 8, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:53:54', '2024-04-22 01:53:54'),
(11, 13, 9, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:54:25', '2024-04-22 01:54:25'),
(12, 9, 10, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:56:05', '2024-04-22 01:56:05'),
(13, 15, 11, 0, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-22 01:56:44', '2024-04-23 02:39:52'),
(14, 6, 12, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:57:22', '2024-04-22 01:57:22'),
(15, 5, 13, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:57:54', '2024-04-22 01:57:54'),
(16, 16, 14, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 01:58:35', '2024-04-22 01:58:35'),
(17, 21, 15, 0, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-22 02:10:22', '2024-04-23 03:03:51'),
(18, 1, 16, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 02:10:22', '2024-04-22 02:10:22'),
(19, 23, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 10, '2024-04-22 06:59:19', '2024-04-23 00:44:24'),
(20, 23, 17, 10, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, '2024-04-22 06:59:19', '2024-04-23 01:05:18'),
(21, 23, 18, 0, 0, 20, 6, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2024-04-22 07:00:18', '2024-04-24 02:26:30'),
(22, 23, 19, 0, 0, 10, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, '2024-04-23 00:43:48', '2024-04-23 00:44:24'),
(23, 24, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-23 00:57:54', '2024-04-23 01:05:18'),
(24, 25, 0, 10, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, '2024-04-23 01:22:35', '2024-04-23 03:32:33'),
(25, 26, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-23 01:22:42', '2024-04-23 03:06:57'),
(26, 27, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2024-04-23 01:22:50', '2024-04-23 03:06:57'),
(27, 28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-04-23 01:23:12', '2024-04-23 01:23:12'),
(28, 29, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-23 02:42:58', '2024-04-23 03:03:51'),
(29, 30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-04-23 03:06:57', '2024-04-23 03:06:57'),
(30, 22, 20, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-24 00:51:51', '2024-04-24 00:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `warehouse_name`, `created_at`, `updated_at`) VALUES
(1, 'rerum', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(2, 'inventore', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(3, 'nam', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(4, 'velit', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(5, 'et', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(6, 'quidem', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(7, 'molestias', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(8, 'qui', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(9, 'veniam', '2024-04-22 01:11:11', '2024-04-22 01:11:11'),
(10, 'quidem', '2024-04-22 01:11:11', '2024-04-22 01:11:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backorder_details`
--
ALTER TABLE `backorder_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backorder_head`
--
ALTER TABLE `backorder_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backorder_items`
--
ALTER TABLE `backorder_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrow_details`
--
ALTER TABLE `borrow_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrow_head`
--
ALTER TABLE `borrow_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bo_series`
--
ALTER TABLE `bo_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `composite_items`
--
ALTER TABLE `composite_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enduses`
--
ALTER TABLE `enduses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issuance_head`
--
ALTER TABLE `issuance_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issuance_items`
--
ALTER TABLE `issuance_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_statuses`
--
ALTER TABLE `item_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_sub_categories`
--
ALTER TABLE `item_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mbr_series`
--
ALTER TABLE `mbr_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mgp_series`
--
ALTER TABLE `mgp_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mif_series`
--
ALTER TABLE `mif_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mrec_series`
--
ALTER TABLE `mrec_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mreqf_series`
--
ALTER TABLE `mreqf_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mrs_series`
--
ALTER TABLE `mrs_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `no_variant`
--
ALTER TABLE `no_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pn_series`
--
ALTER TABLE `pn_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pr_items`
--
ALTER TABLE `pr_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purposes`
--
ALTER TABLE `purposes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `racks`
--
ALTER TABLE `racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_details`
--
ALTER TABLE `receive_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_head`
--
ALTER TABLE `receive_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_items`
--
ALTER TABLE `receive_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_head`
--
ALTER TABLE `request_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_items`
--
ALTER TABLE `request_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restock_details`
--
ALTER TABLE `restock_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restock_head`
--
ALTER TABLE `restock_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restock_reasons`
--
ALTER TABLE `restock_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uoms`
--
ALTER TABLE `uoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants_balance`
--
ALTER TABLE `variants_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backorder_details`
--
ALTER TABLE `backorder_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backorder_head`
--
ALTER TABLE `backorder_head`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backorder_items`
--
ALTER TABLE `backorder_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `borrow_details`
--
ALTER TABLE `borrow_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `borrow_head`
--
ALTER TABLE `borrow_head`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bo_series`
--
ALTER TABLE `bo_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `composite_items`
--
ALTER TABLE `composite_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enduses`
--
ALTER TABLE `enduses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `issuance_head`
--
ALTER TABLE `issuance_head`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `issuance_items`
--
ALTER TABLE `issuance_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_statuses`
--
ALTER TABLE `item_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `item_sub_categories`
--
ALTER TABLE `item_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mbr_series`
--
ALTER TABLE `mbr_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mgp_series`
--
ALTER TABLE `mgp_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mif_series`
--
ALTER TABLE `mif_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `mrec_series`
--
ALTER TABLE `mrec_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mreqf_series`
--
ALTER TABLE `mreqf_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mrs_series`
--
ALTER TABLE `mrs_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `no_variant`
--
ALTER TABLE `no_variant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pn_series`
--
ALTER TABLE `pn_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pr_items`
--
ALTER TABLE `pr_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `purposes`
--
ALTER TABLE `purposes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `racks`
--
ALTER TABLE `racks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `receive_details`
--
ALTER TABLE `receive_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `receive_head`
--
ALTER TABLE `receive_head`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `receive_items`
--
ALTER TABLE `receive_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_head`
--
ALTER TABLE `request_head`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `restock_details`
--
ALTER TABLE `restock_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restock_head`
--
ALTER TABLE `restock_head`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restock_reasons`
--
ALTER TABLE `restock_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `uoms`
--
ALTER TABLE `uoms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `variants_balance`
--
ALTER TABLE `variants_balance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

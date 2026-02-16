-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2026 at 06:10 AM
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
-- Database: `faculty_dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `admin_comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_experiences`
--

CREATE TABLE `faculty_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `college_name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `from_year` year(4) NOT NULL,
  `to_year` year(4) NOT NULL,
  `experience_certificate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty_experiences`
--

INSERT INTO `faculty_experiences` (`id`, `user_id`, `college_name`, `designation`, `from_year`, `to_year`, `experience_certificate`, `created_at`, `updated_at`, `status`) VALUES
(5, 6, 'Svec', 'Assistant Professor', '2022', '2025', 'faculty/T-002/03_Previous_Experience/Svec_2022.pdf', '2026-01-28 11:44:17', '2026-01-29 03:56:49', 'Approved'),
(8, 8, 'sasi engineering colllege', 'assistant professor', '2015', '2024', 'faculty/T-004/03_Experience/sasi_engineering_colllege_2015_2024.pdf', '2026-01-29 04:27:07', '2026-02-01 13:01:31', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_profiles`
--

CREATE TABLE `faculty_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty_profiles`
--

INSERT INTO `faculty_profiles` (`id`, `user_id`, `dob`, `gender`, `phone`, `department`, `joining_date`, `created_at`, `updated_at`) VALUES
(1, 3, '1990-01-01', 'Female', '000000000', 'Artificial Intelligence and Machine Learning', '2010-01-01', '2025-12-29 03:21:13', '2026-01-28 22:50:46'),
(3, 6, NULL, 'Male', '+914405067625', 'Electronics and Communication Engineering', NULL, '2026-01-26 01:04:27', '2026-01-28 11:41:22'),
(4, 7, NULL, NULL, NULL, NULL, NULL, '2026-01-28 22:53:13', '2026-01-28 22:53:13'),
(5, 8, '1980-09-29', 'Male', '9876543210', 'Artificial Intelligence and Machine Learning', NULL, '2026-01-29 04:23:22', '2026-01-29 04:24:29'),
(6, 11, NULL, NULL, NULL, 'Mechanical Engineering', NULL, '2026-02-01 12:30:35', '2026-02-01 12:31:15'),
(7, 12, NULL, NULL, NULL, NULL, NULL, '2026-02-01 12:37:05', '2026-02-01 12:37:05'),
(8, 13, '1111-11-11', 'Male', '1234567890', 'Computer Science Engineering', NULL, '2026-02-05 02:49:39', '2026-02-05 02:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_qualifications`
--

CREATE TABLE `faculty_qualifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `degree` varchar(255) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `university` varchar(255) NOT NULL,
  `from_year` year(4) NOT NULL,
  `to_year` year(4) NOT NULL,
  `certificate_type` varchar(255) NOT NULL,
  `certificate_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty_qualifications`
--

INSERT INTO `faculty_qualifications` (`id`, `user_id`, `degree`, `specialization`, `university`, `from_year`, `to_year`, `certificate_type`, `certificate_path`, `created_at`, `updated_at`, `status`) VALUES
(8, 6, 'SSC', NULL, 'AP SSC', '2000', '2014', 'Marks Memo', 'qualifications/v621hxp68Y3LimJhDF8LRRyz0GbIAxo2K9aR8qR1.pdf', '2026-01-28 11:41:56', '2026-01-29 03:57:00', 'Rejected'),
(10, 3, 'SSC', NULL, 'AP SSC', '2000', '2014', 'Marks Memo', 'faculty/T-001/02_Academic_Qualifications/SSC_Marks_Memo.pdf', '2026-01-29 03:25:55', '2026-02-01 23:52:28', 'Approved'),
(11, 8, 'SSC', NULL, 'AP SSC', '1980', '1995', 'Degree', 'faculty/T-004/02_Academic_Qualifications/SSC_Degree.pdf', '2026-01-29 04:26:13', '2026-01-29 04:28:39', 'Approved'),
(12, 3, 'Inter', NULL, 'Ap Intermediate Board', '2014', '2016', 'Marks Memo', 'faculty/T-001/02_Academic_Qualifications/Inter_Marks_Memo.pdf', '2026-02-01 14:30:42', '2026-02-01 14:30:42', 'Pending'),
(13, 3, 'Inter', NULL, 'Sri Vasavi Engineering College', '2016', '2020', 'Marks Memo', 'faculty/T-001/02_Academic_Qualifications/Inter_Marks_Memo.pdf', '2026-02-01 14:35:25', '2026-02-01 14:35:25', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_26_063726_add_role_to_users_table', 2),
(10, '2025_12_29_043838_add_teacher_id_to_users_table', 3),
(11, '2025_12_26_065811_create_documents_table', 4),
(12, '2025_12_29_072537_add_force_password_change_to_users', 5),
(13, '2025_12_29_084341_create_faculty_profiles_table', 6),
(14, '2025_12_29_085235_create_faculty_qualifications_table', 7),
(15, '2025_12_29_085739_add_duration_to_faculty_qualifications', 8),
(16, '2025_12_29_090905_remove_year_from_faculty_qualifications', 9),
(17, '2025_12_30_091220_create_faculty_experiences_table', 10),
(18, '2026_01_20_090607_create_personal_access_tokens_table', 11),
(19, '2026_01_20_173125_create_personal_access_tokens_table', 1),
(20, '2026_01_23_092936_add_department_and_joining_date_to_faculty_profiles', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'react-token', '709233d499426e5e2cb772af43cbcc5b9f290e4718be784b35e47c825a61562d', '[\"*\"]', '2026-01-20 03:56:02', NULL, '2026-01-20 03:54:13', '2026-01-20 03:56:02'),
(2, 'App\\Models\\User', 3, 'react-token', '6612308d1f56e6b37761def52b4c1f3f22cce0a2c855f0b19467c9817fe0a43d', '[\"*\"]', '2026-01-20 04:04:58', NULL, '2026-01-20 03:56:13', '2026-01-20 04:04:58'),
(3, 'App\\Models\\User', 3, 'react-token', 'd7808aa4058a89ffd9e87cbecbaa5b5c0e5b57090472c8f77b8c451b7d3e989f', '[\"*\"]', NULL, NULL, '2026-01-20 04:18:26', '2026-01-20 04:18:26'),
(4, 'App\\Models\\User', 3, 'react-token', 'b142183ddf62e0e854f03ab6a7d48f0fed1340856845289cc71eca52479944c8', '[\"*\"]', NULL, NULL, '2026-01-20 04:19:32', '2026-01-20 04:19:32'),
(5, 'App\\Models\\User', 1, 'react-token', '31fefb84f536e32d7f256efea3202ccb37fb7afa04b2bad93188e6bb804f91ab', '[\"*\"]', NULL, NULL, '2026-01-20 04:20:53', '2026-01-20 04:20:53'),
(6, 'App\\Models\\User', 3, 'react-token', 'f82a404d608216bda2bf7221555651eb28cef0a697504c40ba5d1351f2bd0562', '[\"*\"]', NULL, NULL, '2026-01-20 04:21:56', '2026-01-20 04:21:56'),
(7, 'App\\Models\\User', 1, 'react-token', '37c82d4b4a28b9f541b78bea48b0d049476d6759cb468345bf87fac8ccab5126', '[\"*\"]', NULL, NULL, '2026-01-20 04:22:36', '2026-01-20 04:22:36'),
(8, 'App\\Models\\User', 1, 'react-token', 'd1a454ddff18188633e45f7c430f98c75276221b9b54ba01becb9ccf27f17276', '[\"*\"]', NULL, NULL, '2026-01-20 04:23:57', '2026-01-20 04:23:57'),
(9, 'App\\Models\\User', 1, 'react-token', '03df2d4ba3dc510e0e47933e1311085e752e9d2bc600bd9bf3afb2372507ff5f', '[\"*\"]', NULL, NULL, '2026-01-20 04:25:20', '2026-01-20 04:25:20'),
(10, 'App\\Models\\User', 3, 'react-token', 'd95b4e2508f9f52b8b5dfd07e669fa20f0158a19a80151cdf17e8d7e966f4568', '[\"*\"]', NULL, NULL, '2026-01-20 04:25:55', '2026-01-20 04:25:55'),
(11, 'App\\Models\\User', 1, 'react-token', '3221847df34d27a05ff53dfd5a4fa542adf101521f3d1002769831c8c942bb07', '[\"*\"]', NULL, NULL, '2026-01-20 04:27:37', '2026-01-20 04:27:37'),
(12, 'App\\Models\\User', 1, 'react-token', 'effc7848559e3f43b66a3278b14842c1c0ff843bb2a94bc7994a759549510a07', '[\"*\"]', NULL, NULL, '2026-01-20 04:27:58', '2026-01-20 04:27:58'),
(13, 'App\\Models\\User', 3, 'react-token', 'd186b9999e2e8b4f85e79f0af1fba1c4120b6e8a264671056a51e73e3a8f464e', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:26', '2026-01-20 10:31:26'),
(14, 'App\\Models\\User', 3, 'react-token', '7a13b636052274cb71662827043fe732f3a91c53bc648434617dc1ec57fd518c', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:28', '2026-01-20 10:31:28'),
(15, 'App\\Models\\User', 3, 'react-token', '3d134978b5742d54cde1c75251dc88290c05e40242b79c3c28bab8fa34f7bff4', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:29', '2026-01-20 10:31:29'),
(16, 'App\\Models\\User', 3, 'react-token', 'd3722ed09f7fe5b3c68b8d67d097160d643582bd4b266410e707c1bcc0084506', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:29', '2026-01-20 10:31:29'),
(17, 'App\\Models\\User', 3, 'react-token', '18d0615fcfc1cee04750f75f0a743497bfa3397f739bdbec583977155eb30dc7', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:30', '2026-01-20 10:31:30'),
(18, 'App\\Models\\User', 3, 'react-token', '52c2f6e1d11cf764ed89c91539edc320b38daba09a698f0834576e2c853c1509', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:30', '2026-01-20 10:31:30'),
(19, 'App\\Models\\User', 3, 'react-token', '907f79e951087fd71ef03ece6d2d14eaab240c95552eeaacb844e5a1c5004c35', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:31', '2026-01-20 10:31:31'),
(20, 'App\\Models\\User', 3, 'react-token', 'd294cf2dbf14b52b215da984c69c87ffeeaaed064cb9f897726bc61f0caef499', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:31', '2026-01-20 10:31:31'),
(21, 'App\\Models\\User', 3, 'react-token', 'bb06b5fd50274bb4a55a4b915220967b22134adffc8c54aed590803a58bc8893', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:31', '2026-01-20 10:31:31'),
(22, 'App\\Models\\User', 3, 'react-token', '48e571d1ee7c3cce5cca345f4ca4b4b10a2b836d5901fe7e331987a5de285435', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:32', '2026-01-20 10:31:32'),
(23, 'App\\Models\\User', 3, 'react-token', '603eecdac797fc2507ba740bc880a0d1d93c4bb17c93fa0faf327cfdb1e5ad62', '[\"*\"]', NULL, NULL, '2026-01-20 10:31:32', '2026-01-20 10:31:32'),
(24, 'App\\Models\\User', 1, 'react-token', '73927b880a78640d37989d1297413f667279ac80de2e2be726845a91553df0a6', '[\"*\"]', NULL, NULL, '2026-01-20 10:32:47', '2026-01-20 10:32:47'),
(25, 'App\\Models\\User', 1, 'react-token', '66dcaefe9cc983602d15541a1f37aafe9bb6ba5a6d91f11d87f9f362e75339fd', '[\"*\"]', NULL, NULL, '2026-01-20 10:33:07', '2026-01-20 10:33:07'),
(26, 'App\\Models\\User', 3, 'react-token', 'acea4a32d0083dbfdbe90838751ebade0911cfa77342df2870043f9b2afe98ec', '[\"*\"]', NULL, NULL, '2026-01-20 10:39:50', '2026-01-20 10:39:50'),
(27, 'App\\Models\\User', 3, 'react-token', '4ec5a3b337078c759cd55344aca67161476fa2e356ec6004c5a4d06da7374cc7', '[\"*\"]', NULL, NULL, '2026-01-20 10:44:35', '2026-01-20 10:44:35'),
(28, 'App\\Models\\User', 1, 'react-token', '99059cabd54e836c2b07b6f4c0a681b47b82a0d4bdf647d9abd40ff7b7d0c243', '[\"*\"]', NULL, NULL, '2026-01-20 10:45:14', '2026-01-20 10:45:14'),
(29, 'App\\Models\\User', 1, 'react-token', 'd8de819fbec9203214d5bc823d56e0addd0918e33cd8b6c7bad0280cb2ee4187', '[\"*\"]', NULL, NULL, '2026-01-20 10:47:29', '2026-01-20 10:47:29'),
(30, 'App\\Models\\User', 1, 'react-token', '440faa8361c76dbe9245756cd2303af13cc68ccc307fc5d940d11d68ae6406ce', '[\"*\"]', NULL, NULL, '2026-01-20 10:49:58', '2026-01-20 10:49:58'),
(31, 'App\\Models\\User', 3, 'react-token', 'a731c6dae113d97cd18ebe6772c97c948baefc4e0a99e33b7b6e5f74009de717', '[\"*\"]', NULL, NULL, '2026-01-20 10:50:18', '2026-01-20 10:50:18'),
(32, 'App\\Models\\User', 1, 'react-token', 'bec77cc1282620eeea12f30b5fe01def29b0fdcdb01fe237f7bcdec34de26917', '[\"*\"]', NULL, NULL, '2026-01-20 10:59:44', '2026-01-20 10:59:44'),
(33, 'App\\Models\\User', 3, 'react-token', '3d1f477be9da3494ecb2d4c8eaede978d7a61ad1b3a036efd455483ce79738dc', '[\"*\"]', NULL, NULL, '2026-01-20 11:00:02', '2026-01-20 11:00:02'),
(34, 'App\\Models\\User', 1, 'react-token', '2a426769be120c2c978bde2a1e7655baa943e7783c3c6eaf2e1f18224aba9915', '[\"*\"]', '2026-01-20 12:04:00', NULL, '2026-01-20 11:11:37', '2026-01-20 12:04:00'),
(35, 'App\\Models\\User', 3, 'react-token', '34ce520740b78a7b4bf9425d1d76df1b2e22a3e97307a60be048842723275a07', '[\"*\"]', '2026-01-20 12:01:29', NULL, '2026-01-20 12:00:07', '2026-01-20 12:01:29'),
(36, 'App\\Models\\User', 1, 'react-token', '3a49524b82379a4404c34b677127723e8606501f0c8e49d7b9a607cf77fa1b79', '[\"*\"]', '2026-01-20 12:04:25', NULL, '2026-01-20 12:04:20', '2026-01-20 12:04:25'),
(37, 'App\\Models\\User', 1, 'react-token', '9bbf6c148b65667b2354542691876a2fcaaf8b82399a0f9d1e6e22536c1e8f55', '[\"*\"]', '2026-01-21 23:26:57', NULL, '2026-01-21 23:07:17', '2026-01-21 23:26:57'),
(38, 'App\\Models\\User', 1, 'react-token', '39005246adde134664c89f01edb3bf5c468ee9a3878fc66acd06dc07abf9e22e', '[\"*\"]', NULL, NULL, '2026-01-22 22:54:38', '2026-01-22 22:54:38'),
(39, 'App\\Models\\User', 1, 'react-token', 'fae90aab635a0e6e6cdf8286794400d155ed44fb38e681d64a93086424b15207', '[\"*\"]', '2026-01-22 23:30:34', NULL, '2026-01-22 22:55:01', '2026-01-22 23:30:34'),
(40, 'App\\Models\\User', 1, 'react-token', '575e818694eea4fe55720c9512a76cec04bd519d568308ebe3ce9f9ef5e7893f', '[\"*\"]', '2026-01-26 01:05:18', NULL, '2026-01-23 03:19:48', '2026-01-26 01:05:18'),
(41, 'App\\Models\\User', 3, 'react-token', 'df1628f153f6779b4c125a0a47284cd2eb41279e75525d76a61578f64d43f2f8', '[\"*\"]', NULL, NULL, '2026-01-26 01:06:27', '2026-01-26 01:06:27'),
(42, 'App\\Models\\User', 3, 'react-token', '6f41087a45ebbf0609c89b463ae34791fa3d0ac6ed72d42cbdab7edc884e27c0', '[\"*\"]', NULL, NULL, '2026-01-26 05:04:40', '2026-01-26 05:04:40'),
(43, 'App\\Models\\User', 3, 'react-token', '91a83cf82d0a1adc8242bd40b504e76ca86447a34915c35aad438252a8d35260', '[\"*\"]', NULL, NULL, '2026-01-26 05:04:47', '2026-01-26 05:04:47'),
(44, 'App\\Models\\User', 3, 'react-token', 'a9a5e2355bfba8a1766416c4f07ad53745e48da7aad9491396e8dcf829594d1d', '[\"*\"]', NULL, NULL, '2026-01-26 05:04:49', '2026-01-26 05:04:49'),
(45, 'App\\Models\\User', 3, 'react-token', '16b45e440136e11314d4881d78399fedeab676820bd5c05269004779da83702c', '[\"*\"]', NULL, NULL, '2026-01-26 05:04:51', '2026-01-26 05:04:51'),
(46, 'App\\Models\\User', 3, 'react-token', '364253d78777de495cd9cd22e335330011919a06c53698e79e0b28b57b60ca04', '[\"*\"]', NULL, NULL, '2026-01-26 05:04:53', '2026-01-26 05:04:53'),
(47, 'App\\Models\\User', 3, 'react-token', '9a4f9c3b92d77a56a9cedba5af356e3e8baab596a3e398655ae13b0d7af6b892', '[\"*\"]', NULL, NULL, '2026-01-26 05:04:55', '2026-01-26 05:04:55'),
(48, 'App\\Models\\User', 6, 'react-token', '0c73f35fae577bdef79e8d71e163f8a321a02d00f87e460cb52aa4e224ac9f40', '[\"*\"]', NULL, NULL, '2026-01-26 05:05:14', '2026-01-26 05:05:14'),
(49, 'App\\Models\\User', 6, 'react-token', '47d57df2d244aa1efd3fa34fcbb27b43d283ca6b7a59c2c53a46a89f752cf8b0', '[\"*\"]', NULL, NULL, '2026-01-26 05:05:17', '2026-01-26 05:05:17'),
(50, 'App\\Models\\User', 3, 'react-token', 'c551bdc6088561b428e99f56767b2b9940ce39108107221af7d72e6aae793dbc', '[\"*\"]', NULL, NULL, '2026-01-26 05:13:05', '2026-01-26 05:13:05'),
(51, 'App\\Models\\User', 3, 'react-token', '5b3d33e561c0bd735d18d737274bfd3ec2336ba8e0edb6c591cb6fd154989a1a', '[\"*\"]', NULL, NULL, '2026-01-26 05:13:09', '2026-01-26 05:13:09'),
(52, 'App\\Models\\User', 3, 'react-token', '5263139685247e2858d82cb46f46b09ef60a284ba691fd0126a8f44b2aeea069', '[\"*\"]', NULL, NULL, '2026-01-26 05:13:14', '2026-01-26 05:13:14'),
(53, 'App\\Models\\User', 3, 'react-token', 'bf4cc102dacd95ad2247d1ae24fc5c82172bcd4dad5499271cb4b3c6f66bf7de', '[\"*\"]', '2026-01-28 03:24:22', NULL, '2026-01-26 05:13:17', '2026-01-28 03:24:22'),
(54, 'App\\Models\\User', 1, 'react-token', '0b006dbcb9528d2dca4abd82eccd931a2d5c6cd476edd1cdf34b5c231f5bfc87', '[\"*\"]', '2026-01-28 03:25:09', NULL, '2026-01-28 03:24:36', '2026-01-28 03:25:09'),
(55, 'App\\Models\\User', 3, 'react-token', '98d6a8cb927e5e666874347509e9fec8d2571c0a167d6d0d4d9946bcba6021a9', '[\"*\"]', '2026-01-28 04:15:00', NULL, '2026-01-28 03:27:35', '2026-01-28 04:15:00'),
(56, 'App\\Models\\User', 3, 'react-token', '3fb2d9497c10d52a2b41f4ad9bdc3be10d9e90e2bf97f608c509e7cf86efdf37', '[\"*\"]', '2026-01-28 04:15:31', NULL, '2026-01-28 04:15:29', '2026-01-28 04:15:31'),
(57, 'App\\Models\\User', 1, 'react-token', 'd11cc4260b0d4ef8f06c2b93003ea706fe4bcb70a78f3f9e4713371907e7a191', '[\"*\"]', '2026-01-28 04:20:13', NULL, '2026-01-28 04:20:05', '2026-01-28 04:20:13'),
(58, 'App\\Models\\User', 3, 'react-token', 'f0bb6e9d35ed32bd003f45867573120ca3dd4fc14760f9f53040c041371e932f', '[\"*\"]', '2026-01-28 04:21:01', NULL, '2026-01-28 04:20:51', '2026-01-28 04:21:01'),
(59, 'App\\Models\\User', 3, 'react-token', '093df64f816e7ea838859ee794d803e7b4fd790a3b3293a85d3ce2aff00ab94a', '[\"*\"]', '2026-01-28 04:37:40', NULL, '2026-01-28 04:35:10', '2026-01-28 04:37:40'),
(60, 'App\\Models\\User', 3, 'react-token', 'cb9ccfb1fa8ba1aee87b9b51c681b6919a1788ecc7ebcd4284eba65274b2cac4', '[\"*\"]', '2026-01-28 11:40:00', NULL, '2026-01-28 11:37:58', '2026-01-28 11:40:00'),
(61, 'App\\Models\\User', 6, 'react-token', '504ddf892b9fc5207de3f0da717005a60f5272da4049ca42f3770112758b35ef', '[\"*\"]', '2026-01-28 11:46:52', NULL, '2026-01-28 11:41:04', '2026-01-28 11:46:52'),
(62, 'App\\Models\\User', 1, 'react-token', '66868a2f09feca8bb14a50485e96b55b7379b624618af035282a519580b9a8cc', '[\"*\"]', '2026-01-28 11:47:59', NULL, '2026-01-28 11:47:08', '2026-01-28 11:47:59'),
(63, 'App\\Models\\User', 3, 'react-token', '6eb71b684b7046f97e6b3f7ebb6523f377d08dcd92581f8b8fa9384989695350', '[\"*\"]', '2026-01-28 11:59:50', NULL, '2026-01-28 11:51:13', '2026-01-28 11:59:50'),
(64, 'App\\Models\\User', 6, 'react-token', '19c1ee9b4ca095a672cbffb4c984a19c15ae1bf6e7590b21b952f274b0b582a8', '[\"*\"]', '2026-01-28 12:04:16', NULL, '2026-01-28 12:00:07', '2026-01-28 12:04:16'),
(65, 'App\\Models\\User', 3, 'react-token', '7038a2dafd3605338ad04420c549458dc09c33b57b9d413fe41b0f40ea969691', '[\"*\"]', '2026-01-28 12:24:08', NULL, '2026-01-28 12:04:40', '2026-01-28 12:24:08'),
(66, 'App\\Models\\User', 1, 'react-token', '5453d3f47b8155afe287ffe32c7c98037cf7deac2253e239c04018430dbaceba', '[\"*\"]', '2026-01-28 12:35:00', NULL, '2026-01-28 12:30:32', '2026-01-28 12:35:00'),
(67, 'App\\Models\\User', 3, 'react-token', 'ee0c66d5a6e2203789422c6a198e655656f958329f9c72c9a15825aaca168cef', '[\"*\"]', '2026-01-28 12:43:06', NULL, '2026-01-28 12:36:19', '2026-01-28 12:43:06'),
(68, 'App\\Models\\User', 3, 'react-token', '741ba67da567993a4fd5374607f683bf7551db62922f43d6a00692db7cdf2f11', '[\"*\"]', '2026-01-28 12:56:02', NULL, '2026-01-28 12:55:59', '2026-01-28 12:56:02'),
(69, 'App\\Models\\User', 3, 'react-token', 'f55baf7f511247c123143124185020ed781fddbc3af23e9a03a791ec953708ed', '[\"*\"]', '2026-01-28 13:18:44', NULL, '2026-01-28 12:56:16', '2026-01-28 13:18:44'),
(70, 'App\\Models\\User', 3, 'react-token', 'c08e79c7b5b6eed2071add210234260fe1000d8da1d94ccdbc6368b23d3c64c4', '[\"*\"]', '2026-01-28 13:19:55', NULL, '2026-01-28 13:18:51', '2026-01-28 13:19:55'),
(71, 'App\\Models\\User', 3, 'react-token', 'a44ebab68fc7e8f6b3a85a870777e7e505f693cd2463f3600e71fa487d9a7241', '[\"*\"]', '2026-01-28 13:20:03', NULL, '2026-01-28 13:20:03', '2026-01-28 13:20:03'),
(72, 'App\\Models\\User', 1, 'react-token', 'edcb92da429ed65a0938551e62f8a6408dd38dea241c8f6001bae6f231354488', '[\"*\"]', '2026-01-28 13:30:29', NULL, '2026-01-28 13:29:23', '2026-01-28 13:30:29'),
(73, 'App\\Models\\User', 1, 'react-token', '2eb42704cf7f0586d935c430a6cef3c82d1af09a44ef60666060eca12f6807d8', '[\"*\"]', '2026-01-28 13:37:10', NULL, '2026-01-28 13:37:07', '2026-01-28 13:37:10'),
(74, 'App\\Models\\User', 1, 'react-token', '30f3fc648edc02ca5a471e4dee81d86844660f6dc3b76c9336797a8fb180b2e2', '[\"*\"]', '2026-01-28 13:43:05', NULL, '2026-01-28 13:43:00', '2026-01-28 13:43:05'),
(75, 'App\\Models\\User', 1, 'react-token', '07d60c5ae800f47006cf98b18430305dff7810433e82f46a86dae8c70a798f48', '[\"*\"]', '2026-01-28 13:46:55', NULL, '2026-01-28 13:46:49', '2026-01-28 13:46:55'),
(76, 'App\\Models\\User', 1, 'react-token', 'fa29c3b58ff350179b6f9ec2ba6bb1a203d63513d4077c1054058d48c9f03fc1', '[\"*\"]', '2026-01-28 14:00:13', NULL, '2026-01-28 13:57:59', '2026-01-28 14:00:13'),
(77, 'App\\Models\\User', 1, 'react-token', '0ffc22543fc42273b50c4de01892ea0f2d3e3f74f6e75c21b35a0850a3079c78', '[\"*\"]', '2026-01-28 14:06:20', NULL, '2026-01-28 14:05:57', '2026-01-28 14:06:20'),
(78, 'App\\Models\\User', 1, 'react-token', 'bb062694d2b6dfec001e233d850bc537e64d60c89fba0973f0245d2f48f966c3', '[\"*\"]', '2026-01-28 22:49:27', NULL, '2026-01-28 22:48:21', '2026-01-28 22:49:27'),
(79, 'App\\Models\\User', 3, 'react-token', '738a2d17d04f69963095805234f4bd5bfcd4d5d62209ed8eac1b040675c37c14', '[\"*\"]', '2026-01-28 22:52:11', NULL, '2026-01-28 22:49:51', '2026-01-28 22:52:11'),
(80, 'App\\Models\\User', 3, 'react-token', 'fdd091b5e80335be542a6b31ab8b4d74e75b479af38171483341af9bea5b1c44', '[\"*\"]', '2026-01-28 22:52:37', NULL, '2026-01-28 22:52:36', '2026-01-28 22:52:37'),
(81, 'App\\Models\\User', 1, 'react-token', '19e9626811fd81b73d8c8a244f3eca66bdc7f6685edacf51d28ad6726553e39d', '[\"*\"]', '2026-01-28 22:53:57', NULL, '2026-01-28 22:52:46', '2026-01-28 22:53:57'),
(82, 'App\\Models\\User', 1, 'react-token', '263c3ecc9014c5b04fd21b891f5ad5ddee58a962fdb60accada39173a3bfb36d', '[\"*\"]', '2026-01-28 23:02:22', NULL, '2026-01-28 23:02:16', '2026-01-28 23:02:22'),
(83, 'App\\Models\\User', 1, 'react-token', 'f2479c400f50f9d8b8b12db0f01b7b37e196bf0fa9b2c7e2583758de29b1ffe1', '[\"*\"]', '2026-01-28 23:19:12', NULL, '2026-01-28 23:14:12', '2026-01-28 23:19:12'),
(84, 'App\\Models\\User', 1, 'react-token', 'a2df1efb9ce945327976411cc67fa1e0aa90d0119c9daf9764c6e267e756e61c', '[\"*\"]', '2026-01-29 03:13:52', NULL, '2026-01-29 03:13:43', '2026-01-29 03:13:52'),
(85, 'App\\Models\\User', 1, 'react-token', '01204de4fc059ac9a9b5d378182b289d73ce75b66286015fcf8c4b1c09d38af0', '[\"*\"]', '2026-01-29 03:22:46', NULL, '2026-01-29 03:22:05', '2026-01-29 03:22:46'),
(86, 'App\\Models\\User', 3, 'react-token', '39e937b9ee65ba8002971a5537bfbdb41a26d568e52dab9aca90f7a66ebb895a', '[\"*\"]', '2026-01-29 03:24:34', NULL, '2026-01-29 03:23:05', '2026-01-29 03:24:34'),
(87, 'App\\Models\\User', 7, 'react-token', '609e16cb3dec2e68f7557030517a6adb66eb363cb0f83a32a332fdf30f17411f', '[\"*\"]', '2026-01-29 03:25:00', NULL, '2026-01-29 03:24:46', '2026-01-29 03:25:00'),
(88, 'App\\Models\\User', 3, 'react-token', '50e750a63abfc69d799b7e0a013d3c3f1b1fd2d7f82b31f7a9bdad17cffa3ac9', '[\"*\"]', '2026-01-29 03:28:26', NULL, '2026-01-29 03:25:14', '2026-01-29 03:28:26'),
(89, 'App\\Models\\User', 1, 'react-token', '868a483814e7e5aea6f4051f509745ccfb667da8364def6b4df022f7abe673f8', '[\"*\"]', '2026-01-29 03:29:34', NULL, '2026-01-29 03:28:39', '2026-01-29 03:29:34'),
(90, 'App\\Models\\User', 1, 'react-token', '3708fd77d02e767f0924874ab009320f788d9cdcae2b0f6be125cd7f58f4145a', '[\"*\"]', '2026-01-29 03:35:46', NULL, '2026-01-29 03:35:10', '2026-01-29 03:35:46'),
(91, 'App\\Models\\User', 1, 'react-token', '8c2bb3903fe33827168cd4220be018b3a368aa9541fc3a10ebde33da4ce2ea1c', '[\"*\"]', '2026-01-29 03:44:16', NULL, '2026-01-29 03:42:56', '2026-01-29 03:44:16'),
(92, 'App\\Models\\User', 1, 'react-token', 'efe048340591b5eb4b99a3b5a205b7dbad3c876e912010e38aaaaa45352ecbfa', '[\"*\"]', '2026-01-29 03:46:30', NULL, '2026-01-29 03:44:49', '2026-01-29 03:46:30'),
(93, 'App\\Models\\User', 1, 'react-token', 'a979386a6c7df56803dc9851851689822062761ce1f7a73313ba39e943d4935b', '[\"*\"]', '2026-01-29 03:49:33', NULL, '2026-01-29 03:49:07', '2026-01-29 03:49:33'),
(94, 'App\\Models\\User', 1, 'react-token', 'ae5d160f1c2f2119dce476ad138bb04c3ae2472e9f74553c2c9af11c66d8a7ca', '[\"*\"]', '2026-01-29 03:57:12', NULL, '2026-01-29 03:54:53', '2026-01-29 03:57:12'),
(95, 'App\\Models\\User', 1, 'react-token', 'fc072a6eee07d44a4fc09675aad9acdde42f1c2dde65fddd85a5f64601c9d015', '[\"*\"]', '2026-01-29 04:08:53', NULL, '2026-01-29 04:07:12', '2026-01-29 04:08:53'),
(96, 'App\\Models\\User', 1, 'react-token', 'fbd5bcb1b2cc8f580ca9ddb1cce5edba7de6034f6a71b2c516901bc90c968638', '[\"*\"]', '2026-01-29 04:13:16', NULL, '2026-01-29 04:13:02', '2026-01-29 04:13:16'),
(97, 'App\\Models\\User', 1, 'react-token', '3b1abd83e7118f6d128744f8230713219024e27afb362b68622af2f40b09c2b5', '[\"*\"]', '2026-01-29 04:19:48', NULL, '2026-01-29 04:19:17', '2026-01-29 04:19:48'),
(98, 'App\\Models\\User', 3, 'react-token', '73c91c8aa47588b4dfbe121c346b307b5ca4bc67a308ed669902e774912cbd01', '[\"*\"]', '2026-01-29 04:21:42', NULL, '2026-01-29 04:21:07', '2026-01-29 04:21:42'),
(99, 'App\\Models\\User', 1, 'react-token', '97f7c71f6b011e833f705e56080b4e09c80222c777232dd7ff570829150a6f4c', '[\"*\"]', '2026-01-29 04:23:24', NULL, '2026-01-29 04:22:03', '2026-01-29 04:23:24'),
(100, 'App\\Models\\User', 8, 'react-token', '60454d28e91e1771c3cdd147b4ebd487fb777a33c70e8dc61a052f758e88582a', '[\"*\"]', '2026-01-29 04:27:19', NULL, '2026-01-29 04:23:41', '2026-01-29 04:27:19'),
(101, 'App\\Models\\User', 1, 'react-token', 'befba04c271ada22bf5eefbf2b2438ebce19e4f196cdc7bbd82694de4ff16fb0', '[\"*\"]', '2026-01-29 04:30:55', NULL, '2026-01-29 04:27:29', '2026-01-29 04:30:55'),
(102, 'App\\Models\\User', 3, 'react-token', '2e8669ed2aa89d1dcf75ea3490f0a3e7b84ca72b4d5c3fe661defbe87683fde6', '[\"*\"]', '2026-01-29 04:51:36', NULL, '2026-01-29 04:47:06', '2026-01-29 04:51:36'),
(103, 'App\\Models\\User', 3, 'react-token', '680c36afa7417fe8b2b4e7a5b36e1ede97ae6cbdac19daf4134ab972597a5174', '[\"*\"]', '2026-01-29 04:52:13', NULL, '2026-01-29 04:51:50', '2026-01-29 04:52:13'),
(104, 'App\\Models\\User', 1, 'react-token', '3fc68b7e6d4322583f2b09b1b73f1b2605723c04931c6249338c7091964b2fb9', '[\"*\"]', '2026-01-29 04:52:26', NULL, '2026-01-29 04:52:25', '2026-01-29 04:52:26'),
(105, 'App\\Models\\User', 3, 'react-token', '4f10ae77c6bfa0fea99afcf547f965c430ce84a018fa374a257ab75df9958e6c', '[\"*\"]', '2026-01-29 04:54:23', NULL, '2026-01-29 04:52:39', '2026-01-29 04:54:23'),
(106, 'App\\Models\\User', 1, 'react-token', 'b313d0a7d38bb2490158aec7b1c5ac824c9b6ac1fd2626070077e455cd0d300a', '[\"*\"]', '2026-01-29 23:49:35', NULL, '2026-01-29 23:34:23', '2026-01-29 23:49:35'),
(107, 'App\\Models\\User', 3, 'react-token', '21715c3df98b86cc13cb52bf4e01276aa98845e9bb98b635d0ffe578d7dd6930', '[\"*\"]', '2026-01-29 23:50:27', NULL, '2026-01-29 23:49:49', '2026-01-29 23:50:27'),
(108, 'App\\Models\\User', 1, 'react-token', 'd4d728c53005d373b8e4dbe28980b124a1613fd2654b4bdd44880b8ddd046e63', '[\"*\"]', '2026-01-29 23:51:28', NULL, '2026-01-29 23:51:24', '2026-01-29 23:51:28'),
(109, 'App\\Models\\User', 3, 'react-token', 'e5cfc1b2510bbb2b5cdea97fbdfa24b38b880239f1d39b34561a6c6e3c68340c', '[\"*\"]', '2026-01-29 23:52:42', NULL, '2026-01-29 23:52:26', '2026-01-29 23:52:42'),
(110, 'App\\Models\\User', 1, 'react-token', 'b3ca9fb48bb5d80b6ff73e0ef2ed8389579e6d15a65e4d1cb9c46f0e1087ad8e', '[\"*\"]', '2026-01-30 00:02:32', NULL, '2026-01-30 00:01:46', '2026-01-30 00:02:32'),
(111, 'App\\Models\\User', 1, 'react-token', 'd71ad0ad275ee0830be935558ca1741741330189d87875c7d520eff5e4a1bb8a', '[\"*\"]', '2026-01-30 00:03:01', NULL, '2026-01-30 00:03:00', '2026-01-30 00:03:01'),
(112, 'App\\Models\\User', 3, 'react-token', '8663d6a710bb69b84433e8d25617c568947e825f1f75cfbf2f62f19d984054ff', '[\"*\"]', '2026-01-30 00:05:36', NULL, '2026-01-30 00:03:25', '2026-01-30 00:05:36'),
(113, 'App\\Models\\User', 10, 'react-token', '6ab11e1ff4ded4a7482996daa0dafa70b9144b6d449b7a88002e5cd3d078d8c7', '[\"*\"]', '2026-01-30 00:17:59', NULL, '2026-01-30 00:17:50', '2026-01-30 00:17:59'),
(114, 'App\\Models\\User', 1, 'react-token', '59664ffacd47580ff7815f03974faca73afe2be8308367432a359da2c24fa5d3', '[\"*\"]', '2026-01-30 03:02:56', NULL, '2026-01-30 03:02:15', '2026-01-30 03:02:56'),
(115, 'App\\Models\\User', 3, 'react-token', 'f922998670937c24151994fbfaca2bef3cedd9aaa8df6233b1d06e9e3052029f', '[\"*\"]', '2026-01-30 03:05:10', NULL, '2026-01-30 03:04:44', '2026-01-30 03:05:10'),
(116, 'App\\Models\\User', 1, 'react-token', 'b0641503e8915c449a859b127d0ead447630b5f9a62c60c79aaaf9834410ab00', '[\"*\"]', '2026-01-30 03:40:31', NULL, '2026-01-30 03:39:07', '2026-01-30 03:40:31'),
(117, 'App\\Models\\User', 1, 'react-token', '77eeae1e8172d17c7ca4d14f70f29ade22d0047f998441c0482901b6c494cde3', '[\"*\"]', '2026-02-01 09:29:54', NULL, '2026-02-01 09:29:36', '2026-02-01 09:29:54'),
(118, 'App\\Models\\User', 3, 'react-token', '70cad7abcd55fc14c2e76fd5be7182902db24b2898a856b0c7a31a9b2f9db26c', '[\"*\"]', '2026-02-01 09:31:54', NULL, '2026-02-01 09:30:45', '2026-02-01 09:31:54'),
(119, 'App\\Models\\User', 1, 'react-token', '4e0a3ec25e05e48b8666ea0025271a2fa0e0db779e1b45ccbad34bc65aeecd80', '[\"*\"]', '2026-02-01 09:49:06', NULL, '2026-02-01 09:48:50', '2026-02-01 09:49:06'),
(120, 'App\\Models\\User', 1, 'react-token', '25d6f5f88811e4eefd512735f08481e2fc6b6f58d77dc84929a826e7cdcab09a', '[\"*\"]', '2026-02-01 10:24:56', NULL, '2026-02-01 10:22:19', '2026-02-01 10:24:56'),
(121, 'App\\Models\\User', 1, 'react-token', '898c56d28f09565eb569dc53da6cb873ca8e3778a31284c087367068b7b1b851', '[\"*\"]', '2026-02-01 10:40:03', NULL, '2026-02-01 10:36:53', '2026-02-01 10:40:03'),
(122, 'App\\Models\\User', 3, 'react-token', '1830aeb744bb4d1b9281b751f93a66b163019f0c764a52db736f6f8c8a12c673', '[\"*\"]', '2026-02-01 10:43:15', NULL, '2026-02-01 10:40:23', '2026-02-01 10:43:15'),
(123, 'App\\Models\\User', 1, 'react-token', 'fa6c1f7f7dadce1c98d9536b22da1a18a47b2296fea42cfae22992c79ee98f8d', '[\"*\"]', '2026-02-01 11:22:21', NULL, '2026-02-01 11:21:07', '2026-02-01 11:22:21'),
(124, 'App\\Models\\User', 1, 'react-token', 'ce258373c4bd3ef3532e0ec1923365ad7cdaca610fd23a63743d985ab0418fd8', '[\"*\"]', '2026-02-01 12:05:10', NULL, '2026-02-01 12:00:42', '2026-02-01 12:05:10'),
(125, 'App\\Models\\User', 3, 'react-token', '4ff34b683555e7390652550f864c12e2250837e785fd9eb12d8c40842d6d59ca', '[\"*\"]', '2026-02-01 12:11:35', NULL, '2026-02-01 12:05:19', '2026-02-01 12:11:35'),
(126, 'App\\Models\\User', 3, 'react-token', '61c9bb93aecce9243cd64aec76bed359be4f7999d0e67ce9ec0a8736a2429eec', '[\"*\"]', '2026-02-01 12:19:01', NULL, '2026-02-01 12:15:04', '2026-02-01 12:19:01'),
(127, 'App\\Models\\User', 1, 'react-token', '90d1eeb1035e767e175d4518ded7be3cdaa4571364a46bcd24a5e950046e972c', '[\"*\"]', '2026-02-01 12:20:44', NULL, '2026-02-01 12:19:33', '2026-02-01 12:20:44'),
(128, 'App\\Models\\User', 1, 'react-token', '9eeb8b20755ac6abbcc7e50ff58ae6c88e3542c24370428e261d598efe340cba', '[\"*\"]', '2026-02-01 12:24:08', NULL, '2026-02-01 12:23:36', '2026-02-01 12:24:08'),
(129, 'App\\Models\\User', 1, 'react-token', '244cdbb63b31a57074741dc7006deed50e1da46e17b2307386a9e00d6f853081', '[\"*\"]', '2026-02-01 12:30:53', NULL, '2026-02-01 12:30:49', '2026-02-01 12:30:53'),
(130, 'App\\Models\\User', 11, 'react-token', '00829cea0cebd673cf274dd7c710e41b23ccb942ce41955d08bee46d4cef910c', '[\"*\"]', '2026-02-01 12:31:31', NULL, '2026-02-01 12:31:07', '2026-02-01 12:31:31'),
(131, 'App\\Models\\User', 12, 'react-token', '696e2d759f7d52a58f043102d2468a2671695445de8d3f3f7c3ad3f4bac0e831', '[\"*\"]', '2026-02-01 12:37:41', NULL, '2026-02-01 12:37:19', '2026-02-01 12:37:41'),
(132, 'App\\Models\\User', 1, 'react-token', '6ce0f94b037e3836fa84a3256db52504b93514399816c19bafd497b9f7db6929', '[\"*\"]', '2026-02-01 13:15:41', NULL, '2026-02-01 12:38:01', '2026-02-01 13:15:41'),
(133, 'App\\Models\\User', 3, 'react-token', '80286a7ba353fdedefbc40781b7ea5ef8b1659cac80c4a282e27098e64da5f27', '[\"*\"]', '2026-02-01 13:22:19', NULL, '2026-02-01 13:16:05', '2026-02-01 13:22:19'),
(134, 'App\\Models\\User', 1, 'react-token', 'c2c9c68b1df6f4873bc20a173fd2dbf0bebd2ee4afa0006a8535b5af23c56024', '[\"*\"]', '2026-02-01 13:46:12', NULL, '2026-02-01 13:22:27', '2026-02-01 13:46:12'),
(135, 'App\\Models\\User', 3, 'react-token', 'b78bab0e6f2213e82f7f8e9cb4911908ede373311431687149d42071365805fb', '[\"*\"]', '2026-02-01 13:47:21', NULL, '2026-02-01 13:46:32', '2026-02-01 13:47:21'),
(136, 'App\\Models\\User', 1, 'react-token', 'b79acc2f6cf68db51709d7d3681567dfb9c0f6828a75bcd93f88e95278809f60', '[\"*\"]', '2026-02-01 13:52:53', NULL, '2026-02-01 13:48:01', '2026-02-01 13:52:53'),
(137, 'App\\Models\\User', 3, 'react-token', '47f62450972b53910a2556289bbba916405ac0d3cc5b9f7f00913dd95b92f702', '[\"*\"]', '2026-02-01 14:45:10', NULL, '2026-02-01 13:53:08', '2026-02-01 14:45:10'),
(138, 'App\\Models\\User', 1, 'react-token', 'b4cca527fa7d776aa520778a5db4e5bf6a146fd0280609f3032aa223763f718f', '[\"*\"]', '2026-02-01 23:50:25', NULL, '2026-02-01 23:48:44', '2026-02-01 23:50:25'),
(139, 'App\\Models\\User', 1, 'react-token', 'b6dbba5bf5486a676b1c7ac5246a874b6cecc8ea4c5c0cac52c2585d40c9d0c1', '[\"*\"]', '2026-02-01 23:52:58', NULL, '2026-02-01 23:51:13', '2026-02-01 23:52:58'),
(140, 'App\\Models\\User', 3, 'react-token', '596a4fbbd184f6345ddacf2e4983904dcaca73a81926873941cd4f093cbd43bc', '[\"*\"]', '2026-02-02 00:22:04', NULL, '2026-02-01 23:53:40', '2026-02-02 00:22:04'),
(141, 'App\\Models\\User', 1, 'react-token', 'd2f8a3e53a6142ca446eda6b62afe93801e4db5248cef0baffd6a29b1bfdf61a', '[\"*\"]', '2026-02-02 01:05:13', NULL, '2026-02-02 01:05:00', '2026-02-02 01:05:13'),
(142, 'App\\Models\\User', 3, 'react-token', 'f85c8e99e96e60d9f7a793561a549600848f803f1fb72e1e4f696be2ec7eb56e', '[\"*\"]', '2026-02-02 01:56:31', NULL, '2026-02-02 01:55:54', '2026-02-02 01:56:31'),
(143, 'App\\Models\\User', 1, 'react-token', '80c5190917ef89ed564435449ab24b65b02b2387c965d8dcdc46c31a02c9cd6d', '[\"*\"]', '2026-02-02 02:06:01', NULL, '2026-02-02 02:04:15', '2026-02-02 02:06:01'),
(144, 'App\\Models\\User', 1, 'react-token', 'c7d9c9fa0797fb7b2178890bcd06d436d80b22c91f844fa0bc61b028a3cae0e6', '[\"*\"]', '2026-02-02 02:24:40', NULL, '2026-02-02 02:10:15', '2026-02-02 02:24:40'),
(145, 'App\\Models\\User', 3, 'react-token', 'd92d21c04d16d06b9391ecff10777843a719ce1c28ecfb82b6793ff9823cbfd8', '[\"*\"]', '2026-02-02 02:26:25', NULL, '2026-02-02 02:25:00', '2026-02-02 02:26:25'),
(146, 'App\\Models\\User', 1, 'react-token', 'e5a1d2459064e58e550835f30f3fcb49edd9671f3e32a4153ceb62466cb0dccc', '[\"*\"]', '2026-02-02 02:32:51', NULL, '2026-02-02 02:26:34', '2026-02-02 02:32:51'),
(147, 'App\\Models\\User', 1, 'react-token', 'bdb53887ad7ba162f863f1d72242f503fbc25635c22aed8066a0475cdd88068f', '[\"*\"]', '2026-02-02 02:35:56', NULL, '2026-02-02 02:35:22', '2026-02-02 02:35:56'),
(148, 'App\\Models\\User', 3, 'react-token', 'b176e3d0e5f94354f78a4991cfb3584b1044913902d5f3952eb3fe784cc021e7', '[\"*\"]', '2026-02-02 02:40:53', NULL, '2026-02-02 02:37:03', '2026-02-02 02:40:53'),
(149, 'App\\Models\\User', 1, 'react-token', '75d8bf6aa88b4e07bba5f1ddc8e5cc637cf0966456217396d101057643a3c023', '[\"*\"]', '2026-02-02 02:46:32', NULL, '2026-02-02 02:41:06', '2026-02-02 02:46:32'),
(150, 'App\\Models\\User', 1, 'react-token', '994af1be3f7b67255fa82dce2898663b1cbc84b9d05b1972299a2b733e3690ab', '[\"*\"]', '2026-02-02 03:06:06', NULL, '2026-02-02 02:46:55', '2026-02-02 03:06:06'),
(151, 'App\\Models\\User', 1, 'react-token', '1195f16e6c4c2a9314a3e75b1a4f3df9fd9bfed7ffebfbe375bc3cc399b15246', '[\"*\"]', '2026-02-02 03:06:24', NULL, '2026-02-02 03:06:16', '2026-02-02 03:06:24'),
(152, 'App\\Models\\User', 3, 'react-token', '43ef444500d90231a785560d633257385b6cdc3b744fe479e83c33650983f302', '[\"*\"]', '2026-02-03 10:58:09', NULL, '2026-02-02 03:06:33', '2026-02-03 10:58:09'),
(153, 'App\\Models\\User', 1, 'react-token', '826501c83f966785b380a3d3ed63eaebb9502071f84768e3dd13364832c47fe5', '[\"*\"]', '2026-02-03 11:27:09', NULL, '2026-02-03 10:58:21', '2026-02-03 11:27:09'),
(154, 'App\\Models\\User', 3, 'react-token', 'e33e7e84facf9b3fdcc63407df51a59ea38741db4f855126059349f035933d49', '[\"*\"]', '2026-02-03 11:59:17', NULL, '2026-02-03 11:27:24', '2026-02-03 11:59:17'),
(155, 'App\\Models\\User', 1, 'react-token', 'c21df6e2d614fcac55982220e5301fda1f1ecf1d655a2c4b923ca4b83b7ccfaa', '[\"*\"]', '2026-02-05 02:49:00', NULL, '2026-02-05 02:48:54', '2026-02-05 02:49:00'),
(156, 'App\\Models\\User', 13, 'react-token', '00627c536672dc86c1bf239d35ba29e463d48714a703156573c0005a8ec65b89', '[\"*\"]', '2026-02-05 02:51:40', NULL, '2026-02-05 02:49:51', '2026-02-05 02:51:40'),
(157, 'App\\Models\\User', 1, 'react-token', '71ccf3eac80bbc40ed1c91af6cca7018b6d0b631b2c4f7a6c29bb6cb1204eade', '[\"*\"]', '2026-02-05 02:52:31', NULL, '2026-02-05 02:51:59', '2026-02-05 02:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fQTjUNGHYAVZq49vZN5psN1tzgOlzAt51Or6DM8N', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTHdOYmE4eklVb2hsMUc2T25PU1lHNW5GVjdUaGhkem5HOGljNXppMSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZmFjdWx0eSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1769057289),
('HxbIXg00Yh8LNe1cMKBunuVocPhVxIkByGehuT5V', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaDE5VFE0aVZuWEI2T3ZtVm8xSlRGdXVMZmw4bXBtODlyQUpITzgyNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYWN1bHR5L215LWRvY3VtZW50cyI7czo1OiJyb3V0ZSI7Tjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1768903238),
('IoCIr469v978c1mdZrrBJJYaT67qsFBqfU8o9qMe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUFnTkhqcjBWVG5lcVJLbmRWUURTa1p1THBTTXV0Qk4xcVg1VTBidCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768982482),
('nn2LhDfKLmGk6rUv4l7Ss93GQ6ICV5u2ke7bnsak', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieUJSWG1qUzBNSlZRcFZBWXZ2ZFlZNTFON25PQmNQc08yTm9hb29tSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9mYWN1bHR5LzMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1769056150),
('sOqwcWvJWqqW8PSG8bJEsvmEQ145OBs3OE0Z41Y1', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOE03amlIcktCaU95VGNoNUZZT2p4RFAzeHFUZW8xanlGdGtsanRXcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYWN1bHR5L215LWRvY3VtZW50cyI7czo1OiJyb3V0ZSI7Tjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1768984534),
('U7FA7m7Qh90rAKNNCEfIrF0xlWLxWzGXm2YQf6QC', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaXdKSlNmTHdsSGI5WnBJYlJIaHRITlNPbzFKMklBTEpaNWQzTXYwMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYWN1bHR5L2V4cGVyaWVuY2UiO3M6NToicm91dGUiO3M6MTg6ImZhY3VsdHkuZXhwZXJpZW5jZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1768970262),
('uxitT9CHGmT6rF6Nl1bn2z4MATiPKZMfKYAFwUNk', NULL, '127.0.0.1', 'PostmanRuntime/7.51.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1VlNHVuT2x2d0UxQUhSUzFHbFhKYllpcERKNHhPRXhOUFN5VGd6WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768929986);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'faculty',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `faculty_id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'T-000', 'Admin', 'admin@college.com', NULL, '$2y$12$Uet8VLTu9oOFfjOKgAWYLeb.Ey5UngLkVF5HL.S3sbSFve0OdteFu', 'admin', NULL, '2025-12-26 01:09:12', '2025-12-26 01:09:12'),
(3, 'T-001', 'Faculty1', 'faculty1@college.com', NULL, '$2y$12$P7ZlbS8J2iALMxxe25zd4.EDdwJvPO5tzgdtsDJsHcHARhQWDLKv6', 'faculty', NULL, '2025-12-28 23:50:40', '2026-01-28 22:52:12'),
(6, 'T-002', 'faculty2', 'faculty2@gmail.om', NULL, '$2y$12$qbUtTu3NQFAknmKm54j2yeEhncUsxblyZolL/qVuq0nBv1W70Op2u', 'faculty', NULL, '2026-01-26 01:04:27', '2026-01-26 01:04:27'),
(7, 'T-003', 'faculty3', 'faculty3@gmail.om', NULL, '$2y$12$dP3zn8tdJxwCEb9AzD6EMOlD0UzV4BZEqdFeobnr6oFEXLWoXRixK', 'faculty', NULL, '2026-01-28 22:53:13', '2026-01-28 22:53:13'),
(8, 'T-004', 'faculty4', 'faculty4@gmail.om', NULL, '$2y$12$6gm.o4s2.zy94N9zhztCkeOfN1KdBQdFcwVx/O/1Y8zNfCh6t42FS', 'faculty', NULL, '2026-01-29 04:23:22', '2026-01-29 04:23:22'),
(10, 'T-100', 'admin1', 'admin1@gmail.com', NULL, '$2y$12$0j9HAL3TKs7uPq0sz.3WfeZfmuRp4wtp1SPXjK8svhxJBhsjaQjNa', 'admin', NULL, NULL, NULL),
(11, 'T-005', 'faculty5', 'faculty5@gmail.com', NULL, '$2y$12$Cchz2cuQWcv.lvRV16ZIBeZONjfzk03B3cIlGFvQN/QyeGb2dyXTW', 'faculty', NULL, '2026-02-01 12:30:35', '2026-02-01 12:30:35'),
(12, 'T-006', 'faculty6', 'faculty6@gmail.com', NULL, '$2y$12$AnPLKggrIZPlMdNOUi2SlenlJ1Smrh1Q.KMdJ.i7G47IGRtcr31LO', 'faculty', NULL, '2026-02-01 12:37:05', '2026-02-01 12:37:05'),
(13, 't-cse-1', 'datta', 'atri@gmail.com', NULL, '$2y$12$ml9CyRFBD6zWC32X4uuHh.0ZM5jFtCZ7R.cY3KrXWJ3jt2aM1ZvYu', 'faculty', NULL, '2026-02-05 02:49:39', '2026-02-05 02:49:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_faculty_id_foreign` (`faculty_id`);

--
-- Indexes for table `faculty_experiences`
--
ALTER TABLE `faculty_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_experiences_user_id_foreign` (`user_id`);

--
-- Indexes for table `faculty_profiles`
--
ALTER TABLE `faculty_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculty_profiles_user_id_unique` (`user_id`);

--
-- Indexes for table `faculty_qualifications`
--
ALTER TABLE `faculty_qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_qualifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faculty_experiences`
--
ALTER TABLE `faculty_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faculty_profiles`
--
ALTER TABLE `faculty_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faculty_qualifications`
--
ALTER TABLE `faculty_qualifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faculty_experiences`
--
ALTER TABLE `faculty_experiences`
  ADD CONSTRAINT `faculty_experiences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faculty_profiles`
--
ALTER TABLE `faculty_profiles`
  ADD CONSTRAINT `faculty_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faculty_qualifications`
--
ALTER TABLE `faculty_qualifications`
  ADD CONSTRAINT `faculty_qualifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

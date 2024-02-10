-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2024 at 01:27 PM
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
-- Database: `project_aicta`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `code` char(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `head` varchar(255) NOT NULL,
  `branch_category_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `till_date` date NOT NULL,
  `address` text NOT NULL,
  `corresponding_address` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `country_id`, `state_id`, `city_id`, `code`, `name`, `head`, `branch_category_id`, `phone`, `till_date`, `address`, `corresponding_address`, `email`, `profile_image`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 2, 'WBN20240209001', 'West Vinod Nagar', 'IACT Education ', 1, '9810018664', '2024-02-24', 'D 306, West Vinod Nagar, Delhi 110092', 'IACT Education Pvt. Ltd.  Corporate Identity Number : U80903DL2012PTC243983Corp Office: D - 306 307, 03rd Floor, West Vinod Nagar, I. P. Extension, Delhi 110092 ', 'WBN2020051162@gmail.com', NULL, 'WBN2020051162', 1, '2024-02-09 08:14:30', '2024-02-09 08:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `branch_categories`
--

CREATE TABLE `branch_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_categories`
--

INSERT INTO `branch_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Authorised Training Center', 1, '2024-02-09 08:11:16', '2024-02-09 08:11:16'),
(2, 'Training Center', 1, '2024-02-09 08:11:16', '2024-02-09 08:11:16'),
(3, 'Learning Center', 1, '2024-02-09 08:11:16', '2024-02-09 08:11:16');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_code` char(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `city_code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 28, 'BKR', 'Bokaro', 1, '2024-02-09 08:03:24', '2024-02-09 08:03:24'),
(2, 7, 'WBN', 'West Vinod Nagar', 1, '2024-02-09 08:13:04', '2024-02-09 08:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` char(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'IN', 'India', 1, '2024-02-09 07:56:09', '2024-02-09 07:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `eligibility` varchar(255) NOT NULL,
  `course_duration` int(11) NOT NULL,
  `duration_id` bigint(20) UNSIGNED NOT NULL,
  `course_category_id` bigint(20) UNSIGNED NOT NULL,
  `course_type_id` bigint(20) UNSIGNED NOT NULL,
  `other_details` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `course_code`, `total_fee`, `eligibility`, `course_duration`, `duration_id`, `course_category_id`, `course_type_id`, `other_details`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Diploma in Computer Application', 'DCA', 10000.00, '10th & 10+2', 3, 2, 4, 2, NULL, 1, '2024-02-09 08:08:50', '2024-02-09 08:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Programming & Web Designing', 1, '2024-02-09 08:05:34', '2024-02-09 08:05:34'),
(2, 'Vocational', 1, '2024-02-09 08:05:37', '2024-02-09 08:05:37'),
(3, 'Hardware & Networking	', 1, '2024-02-09 08:05:41', '2024-02-09 08:05:41'),
(4, 'Computer Application	', 1, '2024-02-09 08:05:44', '2024-02-09 08:05:44'),
(5, 'Financial Accounting	', 1, '2024-02-09 08:05:48', '2024-02-09 08:05:48'),
(6, 'Multi-media And Graphic Design	', 1, '2024-02-09 08:05:52', '2024-02-09 08:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `course_statuses`
--

CREATE TABLE `course_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_statuses`
--

INSERT INTO `course_statuses` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Running', 1, '2024-02-10 06:01:03', '2024-02-10 06:01:03'),
(2, 'Complete', 1, '2024-02-10 06:09:18', '2024-02-10 06:09:18'),
(3, 'Dropout', 1, '2024-02-10 06:09:31', '2024-02-10 06:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `course_types`
--

CREATE TABLE `course_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_types`
--

INSERT INTO `course_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Career Programs', 1, '2024-02-09 08:06:42', '2024-02-09 08:06:42'),
(2, 'Professional Course', 1, '2024-02-09 08:06:47', '2024-02-09 08:06:47'),
(3, 'Short-Term Programs', 1, '2024-02-09 08:06:52', '2024-02-09 08:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `durations`
--

CREATE TABLE `durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `durations`
--

INSERT INTO `durations` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Days', 1, '2024-02-09 08:07:04', '2024-02-09 08:07:04'),
(2, 'Months', 1, '2024-02-09 08:07:09', '2024-02-09 08:07:09'),
(3, 'Year', 1, '2024-02-09 08:07:14', '2024-02-09 08:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `exporter` varchar(255) NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `import_id` bigint(20) UNSIGNED NOT NULL,
  `validation_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Male', 1, '2024-02-09 08:14:48', '2024-02-09 08:14:48'),
(2, 'Female', 1, '2024-02-09 08:14:54', '2024-02-09 08:14:54'),
(3, 'Transgender', 1, '2024-02-09 08:15:13', '2024-02-09 08:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `importer` varchar(255) NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `completed_at`, `file_name`, `file_path`, `importer`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2024-02-09 08:00:56', 'state.csv', 'E:\\git\\aicta\\storage\\app\\livewire-tmp/wrrqhwyn259cxrI1HEShlRd6eaXlE9-metac3RhdGUuY3N2-.csv', 'App\\Filament\\Imports\\StateImporter', 36, 36, 36, 1, '2024-02-09 08:00:55', '2024-02-09 08:00:56'),
(2, '2024-02-09 08:11:16', 'branch_cat_mst.csv', 'E:\\git\\aicta\\storage\\app\\livewire-tmp/azEBB5AQ4eLpnGOTnyu5FTJWxZlr2O-metaYnJhbmNoX2NhdF9tc3QuY3N2-.csv', 'App\\Filament\\Imports\\BranchCategoryImporter', 3, 3, 3, 1, '2024-02-09 08:11:15', '2024-02-09 08:11:16');

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

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9b4b7e67-ac7e-49ac-8a28-b68cd8130da1', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:2619:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:1;s:9:\"relations\";a:1:{i:0;s:4:\"user\";}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}}s:8:\"function\";s:2174:\"function () use ($import) {\n                    $import->touch(\'completed_at\');\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title(__(\'filament-actions::import.notifications.completed.title\'))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Filament\\Support\\format_number($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import])),\n                            ]),\n                        )\n                        ->sendToDatabase($import->user);\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000b110000000000000000\";}\";s:4:\"hash\";s:44:\"608glmw2cwYr0/84+1qhNGIsj+n/2Z+5gUDRzHEqI8Q=\";}}}}', NULL, 1707485455, 1707485456),
('9b4b8219-f8be-45df-9078-b55e97c0fdc1', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:2619:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:2;s:9:\"relations\";a:1:{i:0;s:4:\"user\";}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}}s:8:\"function\";s:2174:\"function () use ($import) {\n                    $import->touch(\'completed_at\');\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title(__(\'filament-actions::import.notifications.completed.title\'))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Filament\\Support\\format_number($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import])),\n                            ]),\n                        )\n                        ->sendToDatabase($import->user);\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"000000000000099f0000000000000000\";}\";s:4:\"hash\";s:44:\"ZrPpy/ByElERGCHiB/tEMwjkD7CT/N6dFRLIarOVbhk=\";}}}}', NULL, 1707486075, 1707486076);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_31_112900_create_countries_table', 1),
(6, '2024_01_31_112923_create_states_table', 1),
(7, '2024_01_31_112931_create_cities_table', 1),
(8, '2024_01_31_113000_create_students_table', 1),
(9, '2024_02_02_101400_create_course_categories_table', 1),
(10, '2024_02_03_154641_create_durations_table', 1),
(11, '2024_02_04_075124_create_course_types_table', 1),
(12, '2024_02_04_075631_create_courses_table', 1),
(13, '2024_02_06_061120_create_branch_categories_table', 1),
(14, '2024_02_06_062505_create_branches_table', 1),
(15, '2024_02_07_072658_create_imports_table', 1),
(16, '2024_02_07_072659_create_exports_table', 1),
(17, '2024_02_07_072700_create_failed_import_rows_table', 1),
(18, '2024_02_07_072855_create_job_batches_table', 1),
(19, '2024_02_07_072900_create_notifications_table', 1),
(20, '2024_02_08_111948_create_permission_tables', 1),
(21, '2024_02_09_160418_create_genders_table', 1),
(22, '2024_02_09_140954_create_student_education_table', 2),
(24, '2024_02_10_074416_create_student_data_table', 3),
(25, '2024_02_10_081855_create_students_table', 4),
(26, '2024_02_10_101202_create_student_statuses_table', 5),
(28, '2024_02_10_111741_create_course_statuses_table', 6),
(29, '2024_02_10_112353_create_students_table', 7),
(30, '2024_02_10_71202_create_student_statuses_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('65d48aa9-0bc4-4487-b997-78c2b58a5909', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 1, '{\"actions\":[],\"body\":\"Your state import has completed and 36 rows imported.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-check-circle\",\"iconColor\":\"success\",\"status\":\"success\",\"title\":\"Import completed\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', NULL, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
('70fc7756-4b95-4ce4-974b-c36238fe390e', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 1, '{\"actions\":[],\"body\":\"Your branch category import has completed and 3 rows imported.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-check-circle\",\"iconColor\":\"success\",\"status\":\"success\",\"title\":\"Import completed\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', NULL, '2024-02-09 08:11:16', '2024-02-09 08:11:16');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jammu And Kashmir', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(2, 1, 'Himachal Pradesh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(3, 1, 'Punjab', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(4, 1, 'Chandigarh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(5, 1, 'Uttarakhand', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(6, 1, 'Haryana', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(7, 1, 'Delhi', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(8, 1, 'Rajasthan', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(9, 1, 'Uttar Pradesh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(10, 1, 'Bihar', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(11, 1, 'Sikkim', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(12, 1, 'Arunachal Pradesh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(13, 1, 'Nagaland', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(14, 1, 'Manipur', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(15, 1, 'Mizoram', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(16, 1, 'Tripura', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(17, 1, 'Meghalaya', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(18, 1, 'Assam', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(19, 1, 'West Bengal', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(20, 1, 'Jharkhand', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(21, 1, 'Odisha', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(22, 1, 'Chhattisgarh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(23, 1, 'Madhya Pradesh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(24, 1, 'Gujarat', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(27, 1, 'Maharashtra', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(28, 1, 'Andhra Pradesh', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(29, 1, 'Karnataka', 1, '2024-02-09 08:00:55', '2024-02-09 08:00:55'),
(30, 1, 'Goa', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(31, 1, 'Lakshadweep', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(32, 1, 'Kerala', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(33, 1, 'Tamil Nadu', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(34, 1, 'Puducherry', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(35, 1, 'Andaman And Nicobar Islands', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(36, 1, 'Telangana', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(37, 1, 'Ladakh', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56'),
(38, 1, 'The Dadra And Nagar Haveli And Daman And Diu', 1, '2024-02-09 08:00:56', '2024-02-09 08:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_admission` timestamp NOT NULL DEFAULT current_timestamp(),
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `enrollment` varchar(255) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `course` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_occupation` varchar(255) NOT NULL,
  `student_dob` date NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `student_whatsapp_phone` varchar(255) NOT NULL,
  `course_status_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `date_admission`, `branch_id`, `enrollment`, `course_id`, `course`, `name`, `father_name`, `father_occupation`, `student_dob`, `gender_id`, `phone`, `profile_image`, `address1`, `address2`, `country_id`, `state_id`, `city_id`, `email`, `student_whatsapp_phone`, `course_status_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '2024-02-09 18:30:00', 1, 'WBN20240209001', 1, 'Diploma in Computer Application', 'Haley Dorsey', 'Hashim English', 'Accusamus nobis eligendi incidunt assumenda tempor saepe vero molestiae iure perspiciatis ducimus ut', '2024-02-10', 2, '7322145916', NULL, 'New Delhi', 'Soluta facere molest', 1, 7, 2, 'wyzuned@gmail.com', '2482825704', 3, 1, '2024-02-10 06:15:31', '2024-02-10 06:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `student_data`
--

CREATE TABLE `student_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `board_university` varchar(255) DEFAULT NULL,
  `year_of_passing` varchar(255) DEFAULT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_education`
--

CREATE TABLE `student_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_education`
--

INSERT INTO `student_education` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, '10th', 1, '2024-02-10 01:50:04', '2024-02-10 01:50:04'),
(2, '10 + 2', 1, '2024-02-10 01:50:16', '2024-02-10 01:50:16'),
(3, 'Graduation', 1, '2024-02-10 01:50:18', '2024-02-10 01:50:18'),
(4, 'Other', 1, '2024-02-10 01:50:23', '2024-02-10 01:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `student_statuses`
--

CREATE TABLE `student_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$.zchKsO6oz1dfeUt2YcKAe3B/hM.pIiEerD08SZ.YbuhLgKiPYoEC', NULL, '2024-02-09 07:35:20', '2024-02-10 04:34:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_email_unique` (`email`),
  ADD KEY `branches_country_id_foreign` (`country_id`),
  ADD KEY `branches_state_id_foreign` (`state_id`),
  ADD KEY `branches_city_id_foreign` (`city_id`),
  ADD KEY `branches_branch_category_id_foreign` (`branch_category_id`);

--
-- Indexes for table `branch_categories`
--
ALTER TABLE `branch_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_duration_id_foreign` (`duration_id`),
  ADD KEY `courses_course_category_id_foreign` (`course_category_id`),
  ADD KEY `courses_course_type_id_foreign` (`course_type_id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_statuses`
--
ALTER TABLE `course_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_types`
--
ALTER TABLE `course_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `durations`
--
ALTER TABLE `durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_branch_id_foreign` (`branch_id`),
  ADD KEY `students_course_id_foreign` (`course_id`),
  ADD KEY `students_gender_id_foreign` (`gender_id`),
  ADD KEY `students_country_id_foreign` (`country_id`),
  ADD KEY `students_state_id_foreign` (`state_id`),
  ADD KEY `students_city_id_foreign` (`city_id`),
  ADD KEY `students_course_status_id_foreign` (`course_status_id`);

--
-- Indexes for table `student_data`
--
ALTER TABLE `student_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_data_student_id_foreign` (`student_id`);

--
-- Indexes for table `student_education`
--
ALTER TABLE `student_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_statuses`
--
ALTER TABLE `student_statuses`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branch_categories`
--
ALTER TABLE `branch_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_statuses`
--
ALTER TABLE `course_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_types`
--
ALTER TABLE `course_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `durations`
--
ALTER TABLE `durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_data`
--
ALTER TABLE `student_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_education`
--
ALTER TABLE `student_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_statuses`
--
ALTER TABLE `student_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_branch_category_id_foreign` FOREIGN KEY (`branch_category_id`) REFERENCES `branch_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_course_type_id_foreign` FOREIGN KEY (`course_type_id`) REFERENCES `course_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_duration_id_foreign` FOREIGN KEY (`duration_id`) REFERENCES `durations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_course_status_id_foreign` FOREIGN KEY (`course_status_id`) REFERENCES `course_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_data`
--
ALTER TABLE `student_data`
  ADD CONSTRAINT `student_data_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

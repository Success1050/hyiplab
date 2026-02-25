-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2025 at 11:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyiplab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '670e24b499f5a1728980148.png', '$2a$12$Meusi9KcVuPlT3F91wJfpO2tOSvchvrMoqZOeDFyNT56HQnOw.zRa', '0eBne74heIW62MfnrZWtJKOIMHDbOuFuJh4C60cg1AFNbg9aEVDVAxOLUNZv', NULL, '2024-10-15 02:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `cron_schedule_id` int(11) NOT NULL DEFAULT 0,
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Interest Cron', 'interest_cron', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"interest\"]', NULL, 1, '2024-07-30 09:08:36', '2024-07-30 09:03:36', 1, 1, '2023-06-21 23:29:14', '2024-07-30 03:03:36'),
(2, 'Rank Cron', 'rank_cron', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"rank\"]', NULL, 1, '2024-07-30 09:08:36', '2024-07-30 09:03:36', 1, 1, '2023-06-22 06:04:49', '2024-07-30 03:03:36'),
(3, 'Schedule Invest', 'schedule_invest', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"investSchedule\"]', NULL, 1, '2024-07-30 09:08:36', '2024-07-30 09:03:36', 1, 1, '2023-06-22 06:10:31', '2024-07-30 03:03:36'),
(5, 'Staking Invest', 'staking_invest', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"staking\"]', NULL, 1, '2024-07-30 09:08:36', '2024-07-30 09:03:36', 1, 1, '2023-06-22 12:10:31', '2024-07-30 03:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cron_job_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedules`
--

CREATE TABLE `cron_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_schedules`
--

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 Minutes', 300, 1, '2023-06-21 08:14:52', '2023-06-21 08:14:52'),
(2, '10 Minutes', 600, 1, '2023-06-21 23:28:22', '2023-06-21 23:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amount` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `compound_times` int(11) NOT NULL DEFAULT 0,
  `payment_try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `is_web` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'This will be 1 if the request is from NextJs application',
  `admin_feedback` varchar(255) DEFAULT NULL,
  `success_url` varchar(255) DEFAULT NULL,
  `failed_url` varchar(255) DEFAULT NULL,
  `last_cron` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_app` tinyint(1) NOT NULL DEFAULT 0,
  `token` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-09-25 00:58:09'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2022-10-06 03:02:22'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-10-06 03:02:25'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.png', 0, NULL, '2022-09-25 01:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `seo_content` longtext DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"hyip\",\"bitcoin\",\"investment\",\"hyip business\",\"hyip script\",\"best hyip\",\"buy hyip script\",\"advanced hyip script\",\"hyip software\",\"hight yield investment program\",\"Hyip manager\",\"hyip manager script\",\"cheap hyip script\",\"realable hyip\",\"secure hyip script\",\"php hyip script\",\"new hyip script\",\"hyip program\"],\"description\":\"HYIPLab - Complete HYIP Investment System . Most Advanced HYIP Investment System Script in codecanyon.\\\\\\\\n\\\\\\\\nhyip, bitcoin, investment,  hyip business, hyip script, best hyip, buy hyip script, advanced hyip script, hyip software, high yield investment program, hyip manager, hyip manager script, cheap hyip script, reliable hyip, secure hyip script, php hyip script, new hyip script, hyip program\",\"social_title\":\"HYIPLab - Complete HYIP Investment System\",\"social_description\":\"HYIPLab - Complete HYIP Investment System . Most Advanced HYIP Investment System Script in codecanyon.\",\"image\":\"66a889353d5841722321205.jpg\"}', NULL, 'global', '', '2020-07-04 23:42:52', '2024-07-30 00:33:26'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        What information do we collect?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We gather data from you\\r\\n        when you register on our site, submit a request, buy any services, react to an overview, or round out a\\r\\n        structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be\\r\\n        approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site\\r\\n        anonymously.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        How do we protect your information?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">All provided\\r\\n        delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social\\r\\n        security numbers, financials, and so on) won\'t be put away on our workers.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        Do we disclose any information to outside parties?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We don\'t sell, exchange,\\r\\n        or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders\\r\\n        who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep\\r\\n        this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law,\\r\\n        implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        Children\'s Online Privacy Protection Act Compliance<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We are consistent with\\r\\n        the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody\\r\\n        under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in\\r\\n        any event 13 years of age or more established.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        Changes to our Privacy Policy<\\/h3>\\r\\n    <p class=\\\"font-18\\\">If we decide to change\\r\\n        our privacy policy, we will post those changes on this page.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        How long we retain your information?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">At the point when you\\r\\n        register for our site, we cycle and keep your information we have about you however long you don\'t erase the\\r\\n        record or withdraw yourself (subject to laws and guidelines).<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3 class=\\\"mb-3\\\">\\r\\n        What we don\\u2019t do with your data<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We don\'t and will never\\r\\n        share, unveil, sell, or in any case give your information to different organizations for the promoting of their\\r\\n        items or administrations.<\\/p>\\r\\n<\\/div>\",\"status\":1}', NULL, 'global', NULL, '2020-07-04 23:42:52', '2022-09-24 01:10:22'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"text-center\\\"><h3 class=\\\"mb-3\\\">What information do we collect?<\\/h3>\\r\\n<p class=\\\"font-18\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', NULL, 'global', NULL, '2020-07-04 23:42:52', '2022-09-20 06:32:48'),
(206, 'about.content', '{\"has_image\":\"1\",\"heading_w\":\"About\",\"heading_c\":\"Us\",\"button_name\":\"More Info\",\"button_link\":\"about\",\"content\":\"We are an international financial company engaged in investment activities, which are related to trading on financial markets and cryptocurrency exchanges performed by qualified professional traders.\\r\\n\\r\\nOur goal is to provide our investors with a reliable source of high income, while minimizing any possible risks and offering a high-quality service, allowing us to automate and simplify the relations between the investors and the trustees. We work towards increasing your profit margin by profitable investment. We look forward to you being part of our community.\",\"image\":\"631d85749f9311662879092.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:26:58', '2022-10-06 09:09:33'),
(207, 'banner.content', '{\"has_image\":\"1\",\"heading_w\":\"Invest for Future in Stable Platform\",\"heading_c\":\"and Make Fast Money\",\"sub_heading\":\"Invest in an Industry Leader, Professional, and Reliable Company. We provide you with the most necessary features that will make your experience better. Not only we guarantee the fastest and the most exciting returns on your investments, but we also guarantee the security of your investment.\",\"button_name\":\"Sign Up\",\"button_link\":\"user\\/register\",\"image\":\"631c9810cbce71662818320.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:28:40', '2022-09-22 04:48:35'),
(208, 'blog.content', '{\"heading\":\"Our Latest News\",\"sub_heading\":\"you will get each update about our system and the world market in this area. Keep checking our Latest News to be in touch.\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:28:58', '2022-09-10 12:28:58'),
(210, 'blog.content', '{\"heading\":\"Our Latest News\",\"sub_heading\":\"you will get each update about our system and the world market in this area. Keep checking our Latest News to be in touch.\"}', NULL, 'neo_dark', NULL, '2022-09-10 12:30:04', '2022-09-10 12:32:20'),
(216, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About Us\",\"content\":\"We are an international financial company engaged in investment activities, which are related to trading on financial markets and cryptocurrency exchanges performed by qualified professional traders.\\r\\n\\r\\nOur goal is to provide our investors with a reliable source of high income, while minimizing any possible risks and offering a high-quality service, allowing us to automate and simplify the relations between the investors and the trustees. We work towards increasing your profit margin by profitable investment. We look forward to you being part of our community.\",\"image\":\"631d8591816a01662879121.png\"}', NULL, 'neo_dark', NULL, '2022-09-10 12:41:00', '2022-09-11 05:22:01'),
(217, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Invest for Future in Stable Platform and Make Fast Money\",\"button_name\":\"Sign Up\",\"button_link\":\"user\\/register\",\"button_two_name\":\"Sign In\",\"button_two_link\":\"user\\/login\",\"sub_heading\":\"Invest in an Industry Leader, Professional, and Reliable Company. We provide you with the most necessary features that will make your experience better. Not only we guarantee the fastest and the most exciting returns on your investments, but we also guarantee the security of your investment.\",\"image\":\"631d8664f2ab11662879332.png\"}', NULL, 'neo_dark', NULL, '2022-09-10 12:52:54', '2022-09-14 09:13:01'),
(218, 'calculation.content', '{\"heading_w\":\"Profit\",\"heading_c\":\"Calculator\",\"sub_heading\":\"You must know the calculation before investing in any plan, so you never make mistakes. Check the calculation and you will get as our calculator says.\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:54:00', '2022-09-10 12:54:00'),
(219, 'calculation.content', '{\"has_image\":\"1\",\"heading\":\"Profit Calculator\",\"sub_heading\":\"You must know the calculation before investing in any plan, so you never make mistakes. Check the calculation and you will get as our calculator says.\",\"image\":\"633ef22566efe1665069605.png\"}', NULL, 'neo_dark', NULL, '2022-09-10 12:54:11', '2022-10-06 09:20:05'),
(220, 'contact.content', '{\"has_image\":\"1\",\"heading\":\"Contact With Us\",\"sub_heading\":\"If you have any questions or queries that are not answered on our website, please feel free to contact us. We will try to respond to you as soon as possible. Thank you so much.\",\"image\":\"631c9e4f1666c1662819919.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:55:19', '2022-09-10 12:55:19'),
(221, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+01234 5678 9000\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:55:45', '2022-09-10 12:55:46'),
(222, 'contact.element', '{\"icon\":\"<i class=\\\"far fa-envelope-open\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"demo@example.com\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:56:00', '2022-09-10 12:56:01'),
(223, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"3015 Suit pagla road, Singapore\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:56:30', '2022-09-10 12:56:30'),
(224, 'contact.content', '{\"title\":null,\"subtitle\":null}', NULL, 'invester', NULL, '2022-09-10 12:57:59', '2022-09-10 12:57:59'),
(225, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+01234 5678 9000\"}', NULL, 'invester', NULL, '2022-09-10 12:57:59', '2022-09-10 12:57:59'),
(226, 'contact.element', '{\"icon\":\"<i class=\\\"far fa-envelope-open\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"demo@example.com\"}', NULL, 'invester', NULL, '2022-09-10 12:57:59', '2022-09-10 12:57:59'),
(227, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"3015 Suit pagla road, Singapore\"}', NULL, 'invester', NULL, '2022-09-10 12:57:59', '2022-09-10 12:57:59'),
(228, 'cta.content', '{\"has_image\":\"1\",\"heading\":\"Get Started Today With Us\",\"sub_heading\":\"This is a Revolutionary Money Making Platform! Invest for Future in Stable Platform and Make Fast Money. Not only we guarantee the fastest and the most exciting returns on your investments, but we also guarantee the security of your investment.\",\"button_name\":\"Join Us\",\"button_url\":\"user\\/register\",\"image\":\"631c9f3d446e11662820157.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 12:59:17', '2022-10-05 05:35:38'),
(229, 'faq.content', '{\"heading_w\":\"Frequently Asked\",\"heading_c\":\"Questions\",\"sub_heading\":\"We answer some of your Frequently Asked Questions regarding our platform. If you have a query that is not answered here, Please contact us.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:00:01', '2022-09-10 13:00:01'),
(230, 'faq.element', '{\"question\":\"When can I deposit\\/withdraw from my Investment account?\",\"answer\":\"Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\\r\\n\\r\\n                                Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:00:23', '2022-09-10 13:00:23'),
(231, 'faq.element', '{\"question\":\"How do I check my account balance?\",\"answer\":\"You can see this anytime on your accounts dashboard. You can see this anytime on your accounts dashboard.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:00:39', '2022-09-10 13:00:39'),
(232, 'faq.element', '{\"question\":\"I forgot my password, what should I do?\",\"answer\":\"Visit the password reset page, type in your email address and click the `Reset` button. Visit the password reset page, type in your email address and click the `Reset` button.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:00:54', '2022-09-10 13:00:54'),
(233, 'faq.element', '{\"question\":\"How will I know that the withdrawal has been successful?\",\"answer\":\"You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you. You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:01:07', '2022-09-10 13:01:07'),
(234, 'faq.element', '{\"question\":\"How much can I withdraw?\",\"answer\":\"You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions. You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:01:21', '2022-09-10 13:01:22'),
(235, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"We answer some of your Frequently Asked Questions regarding our platform. If you have a query that is not answered here, Please contact us.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:01:37', '2022-09-11 05:33:28'),
(236, 'faq.element', '{\"question\":\"When can I deposit\\/withdraw from my Investment account?\",\"answer\":\"Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\\r\\n\\r\\n                                Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:01:37', '2022-09-10 13:01:37'),
(237, 'faq.element', '{\"question\":\"How do I check my account balance?\",\"answer\":\"You can see this anytime on your accounts dashboard. You can see this anytime on your accounts dashboard.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:01:37', '2022-09-10 13:01:37'),
(238, 'faq.element', '{\"question\":\"I forgot my password, what should I do?\",\"answer\":\"Visit the password reset page, type in your email address and click the `Reset` button. Visit the password reset page, type in your email address and click the `Reset` button.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:01:37', '2022-09-10 13:01:37'),
(239, 'faq.element', '{\"question\":\"How will I know that the withdrawal has been successful?\",\"answer\":\"You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you. You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:01:37', '2022-09-10 13:01:37'),
(240, 'faq.element', '{\"question\":\"How much can I withdraw?\",\"answer\":\"You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:01:37', '2022-09-12 06:09:13'),
(241, 'faq.content', '{\"title\":null}', NULL, 'invester', NULL, '2022-09-10 13:01:55', '2022-09-10 13:01:55'),
(242, 'faq.element', '{\"question\":\"When can I deposit\\/withdraw from my Investment account?\",\"answer\":\"Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\\r\\n\\r\\n                                Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\"}', NULL, 'invester', NULL, '2022-09-10 13:01:55', '2022-09-10 13:01:55'),
(243, 'faq.element', '{\"question\":\"How do I check my account balance?\",\"answer\":\"You can see this anytime on your accounts dashboard. You can see this anytime on your accounts dashboard.\"}', NULL, 'invester', NULL, '2022-09-10 13:01:55', '2022-09-10 13:01:55'),
(244, 'faq.element', '{\"question\":\"I forgot my password, what should I do?\",\"answer\":\"Visit the password reset page, type in your email address and click the `Reset` button. Visit the password reset page, type in your email address and click the `Reset` button.\"}', NULL, 'invester', NULL, '2022-09-10 13:01:55', '2022-09-10 13:01:55'),
(245, 'faq.element', '{\"question\":\"How will I know that the withdrawal has been successful?\",\"answer\":\"You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you. You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you.\"}', NULL, 'invester', NULL, '2022-09-10 13:01:55', '2022-09-10 13:01:55'),
(246, 'faq.element', '{\"question\":\"How much can I withdraw?\",\"answer\":\"You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions. You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions.\"}', NULL, 'invester', NULL, '2022-09-10 13:01:55', '2022-09-10 13:01:55'),
(247, 'footer.content', '{\"has_image\":\"1\",\"image\":\"631ca001534431662820353.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:02:33', '2022-09-10 13:02:33'),
(248, 'how_work.content', '{\"has_image\":\"1\",\"heading_w_1\":\"How\",\"heading_c\":\"Hyiplab\",\"heading_w_2\":\"Works\",\"sub_heading\":\"Get involved in our tremendous platform and Invest. We will utilize your money and give you profit in your wallet automatically.\",\"image\":\"631ca042137ab1662820418.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:03:38', '2022-09-10 13:03:38'),
(249, 'how_work.element', '{\"title\":\"Create Account\",\"icon\":\"<i class=\\\"lar la-user\\\"><\\/i>\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:03:57', '2022-09-10 13:03:57'),
(250, 'how_work.element', '{\"title\":\"Invest To Plan\",\"icon\":\"<i class=\\\"las la-clipboard-list\\\"><\\/i>\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:04:20', '2022-09-10 13:04:20'),
(251, 'how_work.element', '{\"title\":\"Get Profit\",\"icon\":\"<i class=\\\"las la-wallet\\\"><\\/i>\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:04:30', '2022-09-10 13:04:31'),
(252, 'how_work.content', '{\"heading\":\"How it Works\",\"sub_heading\":\"Get involved in our tremendous platform and Invest. We will utilize your money and give you profit in your wallet automatically.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:04:48', '2022-09-11 06:28:04'),
(253, 'how_work.element', '{\"icon\":\"<i class=\\\"lar la-user\\\"><\\/i>\",\"title\":\"Create Account\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:04:48', '2022-09-10 13:04:48'),
(254, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-clipboard-list\\\"><\\/i>\",\"title\":\"Invest To Plan\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:04:48', '2022-09-10 13:04:48'),
(255, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-wallet\\\"><\\/i>\",\"title\":\"Get Profit\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:04:48', '2022-09-10 13:04:48'),
(256, 'login.content', '{\"has_image\":\"1\",\"heading_w\":\"Welcome To\",\"heading_c\":\"Hyiplab\",\"sub_heading\":\"Lorem ipsum dolor, sit amet consectetur adipisicing elit. Minus distinctio deserunt impedit similique debitis voluptatum enim.\",\"section_bg\":\"631ca0dc080a31662820572.jpg\",\"card_bg\":\"631ca0dc2ed1a1662820572.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:06:11', '2022-09-10 13:06:12'),
(257, 'login.content', '{\"has_image\":\"1\",\"image\":\"631d951c9ede11662883100.png\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:06:47', '2022-09-11 06:28:20'),
(258, 'plan.content', '{\"heading_w\":\"Investment\",\"heading_c\":\"Plans\",\"sub_heading\":\"To make a solid investment, you have to know where you are investing. Find a plan which is best for you.\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:07:18', '2022-09-10 13:07:18'),
(259, 'plan.content', '{\"heading\":\"Investment Plans\",\"sub_heading\":\"To make a solid investment, you have to know where you are investing. Find a plan which is best for you.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:07:51', '2022-09-11 06:28:53'),
(260, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p>\"}', NULL, 'bit_gold', 'privacy-policy', '2022-09-10 13:08:33', '2022-09-10 13:08:33'),
(261, 'policy_pages.element', '{\"title\":\"Terms and Service\",\"details\":\"<h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 style=\\\"margin-bottom:10px;font-weight:600;line-height:24px;font-size:24px;font-family:DauphinPlain;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;\\\"><font color=\\\"#ffffff\\\">What is Lorem Ipsum?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;color:rgb(255,255,255);background-color:rgb(16,17,19);padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"font-weight:bolder;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/font><\\/p>\"}', NULL, 'bit_gold', 'terms-and-service', '2022-09-10 13:08:46', '2022-09-10 13:08:46');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(262, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\"}', NULL, 'neo_dark', 'privacy-policy', '2022-09-10 13:08:56', '2022-09-25 00:51:34'),
(263, 'policy_pages.element', '{\"title\":\"Terms and Service\",\"details\":\"<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\"}', NULL, 'neo_dark', 'terms-and-service', '2022-09-10 13:08:56', '2022-10-06 02:59:37'),
(266, 'register.content', '{\"has_image\":\"1\",\"heading_w\":\"Welcome To\",\"heading_c\":\"Hyiplab\",\"sub_heading\":\"Lorem ipsum dolor, sit amet consectetur adipisicing elit. Minus distinctio deserunt impedit similique debitis voluptatum enim.\",\"section_bg\":\"631ca1b63bca31662820790.jpg\",\"card_bg\":\"631ca1b664ebf1662820790.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:09:50', '2022-09-10 13:09:50'),
(267, 'social_icon.element', '{\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/facebook.com\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:10:11', '2022-10-05 05:37:49'),
(268, 'social_icon.element', '{\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:10:21', '2022-10-05 05:37:56'),
(269, 'social_icon.element', '{\"icon\":\"<i class=\\\"fab fa-pinterest-p\\\"><\\/i>\",\"url\":\"https:\\/\\/www.pinterest.com\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:10:44', '2022-10-05 05:38:23'),
(270, 'social_icon.element', '{\"icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:11:07', '2022-10-05 05:38:40'),
(271, 'subscribe.content', '{\"has_image\":\"1\",\"heading\":\"Subscribe Our Newsletter\",\"image\":\"631ca2753add11662820981.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-10 13:13:01', '2022-09-10 13:13:01'),
(272, 'subscribe.content', '{\"heading\":\"Subscribe Our Newsletter\",\"sub_heading\":\"once you subscribe to our newsletter, we will send our promo offers and news to your email. No worry, we will not send spam.\"}', NULL, 'neo_dark', NULL, '2022-09-10 13:13:14', '2022-09-11 06:29:18'),
(273, 'team.content', '{\"has_image\":\"1\",\"heading_w\":\"Our Expert\",\"heading_c\":\"Team Members\",\"sub_heading\":\"We have a great team including developers, designers, and Traders. The Team always working hard to give you the maximum profit.\",\"image\":\"631d7cee5a6e31662876910.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:45:10', '2022-09-11 04:45:10'),
(274, 'team.element', '{\"has_image\":\"1\",\"name\":\"Callie Mcdowell\",\"designation\":\"CEO\",\"image\":\"657d818d080191702723981.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:46:07', '2023-12-16 10:53:01'),
(275, 'team.element', '{\"has_image\":\"1\",\"name\":\"Marcia Weeks\",\"designation\":\"CTO\",\"image\":\"657d819332e691702723987.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:46:22', '2023-12-16 10:53:07'),
(276, 'team.element', '{\"has_image\":\"1\",\"name\":\"Sage Bray\",\"designation\":\"Marketing Head\",\"image\":\"657d819a4998e1702723994.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:46:37', '2023-12-16 10:53:14'),
(277, 'team.element', '{\"has_image\":\"1\",\"name\":\"Cyrus Briggs\",\"designation\":\"Developer\",\"image\":\"657d81a101e5b1702724001.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:46:56', '2023-12-16 10:53:21'),
(278, 'team.element', '{\"has_image\":\"1\",\"name\":\"Colette Mccarty\",\"designation\":\"UX Expert\",\"image\":\"657d81a7c9e6c1702724007.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:47:11', '2023-12-16 10:53:27'),
(279, 'team.element', '{\"has_image\":\"1\",\"name\":\"Alden Odom\",\"designation\":\"SEO Expert\",\"image\":\"657d81ae978281702724014.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:47:45', '2023-12-16 10:53:34'),
(280, 'team.element', '{\"has_image\":\"1\",\"name\":\"Tanek Gilmore\",\"designation\":\"SEO Expert\",\"image\":\"657d81b5168fc1702724021.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:48:10', '2023-12-16 10:53:41'),
(281, 'team.element', '{\"has_image\":\"1\",\"name\":\"Upton Blair\",\"designation\":\"Manager\",\"image\":\"657d81bbc2fb81702724027.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:48:31', '2023-12-16 10:53:47'),
(282, 'testimonial.content', '{\"has_image\":\"1\",\"heading_w\":\"What Users Say\",\"heading_c\":\"About Us\",\"sub_heading\":\"We are doing really good at this market and here are the words we loved to get from a few of our users.\",\"image\":\"631d7ddd2fe6c1662877149.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:49:09', '2022-09-11 04:49:09'),
(283, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Melodie Ferguson\",\"designation\":\"User from India\",\"quote\":\"I have invested with this platform and gotten my money in my account. This is legit and safe. Great doing business with them.\",\"image\":\"657d824b639671702724171.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:50:35', '2023-12-16 10:56:11'),
(284, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Samantha Levy\",\"designation\":\"User From USA\",\"quote\":\"Legit....and legit. Although the payment was processed manually, I have received my first payment within a very short time., I think nice for invest at this site.\",\"image\":\"657d82528bd081702724178.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:51:06', '2023-12-16 10:56:18'),
(285, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Geoffrey Crawford\",\"designation\":\"User From Nigeria\",\"quote\":\"I have invested with this platform and gotten my money in my account. This is legit and safe. Great doing business with them.\",\"image\":\"657d8259909b51702724185.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:51:35', '2023-12-16 10:56:25'),
(286, 'top_investor.content', '{\"heading_w\":\"Our Top\",\"heading_c\":\"Investors\",\"sub_heading\":\"Here are the investor leaders who have made the maximum investment with our system.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:52:12', '2022-09-11 04:52:12'),
(287, 'transaction.content', '{\"heading_w\":\"Our Latest\",\"heading_c\":\"Transaction\",\"sub_heading\":\"Here is the log of the most recent transactions including withdraw and deposit made by our users.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:52:30', '2022-09-26 05:24:24'),
(288, 'we_accept.content', '{\"heading_w\":\"Payment We\",\"heading_c\":\"Accept\",\"sub_heading\":\"We accept all major cryptocurrencies and fiat payment methods to make your investment process easier with our platform.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:52:48', '2022-09-11 04:52:48'),
(289, 'why_choose.content', '{\"has_image\":\"1\",\"heading_w\":\"Why Choose\",\"heading_c\":\"Hyiplab\",\"sub_heading\":\"Our goal is to provide our investors with a reliable source of high income, while minimizing any possible risks and offering a high-quality service.\",\"image\":\"631d7ee5c26801662877413.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:53:20', '2022-09-11 04:53:34'),
(290, 'why_choose.element', '{\"title\":\"Legal Company\",\"icon\":\"<i class=\\\"las la-copy\\\"><\\/i>\",\"content\":\"Our company conducts absolutely legal activities in the legal field. We are certified to operate investment business, we are legal and safe.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:53:56', '2022-09-11 04:53:56'),
(291, 'why_choose.element', '{\"title\":\"High reliability\",\"icon\":\"<i class=\\\"las la-lock\\\"><\\/i>\",\"content\":\"We are trusted by a huge number of people. We are working hard constantly to improve the level of our security system and minimize possible risks.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:54:12', '2022-09-11 04:54:12'),
(292, 'why_choose.element', '{\"title\":\"Anonymity\",\"icon\":\"<i class=\\\"las la-user-lock\\\"><\\/i>\",\"content\":\"Anonymity and using cryptocurrency as a payment instrument. In the era of electronic money \\u2013 this is one of the most convenient ways of cooperation.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:54:29', '2022-09-11 04:54:29'),
(293, 'why_choose.element', '{\"title\":\"Quick Withdrawal\",\"icon\":\"<i class=\\\"las la-shipping-fast\\\"><\\/i>\",\"content\":\"Our all retreats are treated spontaneously once requested. There are high maximum limits. The minimum withdrawal amount is only $10 .\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:55:10', '2022-09-11 04:55:10'),
(294, 'why_choose.element', '{\"title\":\"Referral Program\",\"icon\":\"<i class=\\\"las la-link\\\"><\\/i>\",\"content\":\"We are offering a certain level of referral income through our referral program. you can increase your income by simply refer a few people.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:55:26', '2022-09-11 04:55:26'),
(295, 'why_choose.element', '{\"title\":\"24\\/7 Support\",\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\",\"content\":\"We provide 24\\/7 customer support through e-mail and telegram. Our support representatives are periodically available to elucidate any difficulty.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:57:21', '2022-09-11 04:57:21'),
(296, 'why_choose.element', '{\"title\":\"Dedicated Server\",\"icon\":\"<i class=\\\"las la-server\\\"><\\/i>\",\"content\":\"We are using a dedicated server for the website which allows us exclusive use of the resources of the entire server.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:57:39', '2022-09-11 04:57:39'),
(297, 'why_choose.element', '{\"title\":\"SSL Secured\",\"icon\":\"<i class=\\\"lab la-expeditedssl\\\"><\\/i>\",\"content\":\"Comodo Essential-SSL Security encryption confirms that the presented content is genuine and legitimate.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:57:57', '2022-09-11 04:58:20'),
(298, 'why_choose.element', '{\"title\":\"DDOS Protection\",\"icon\":\"<i class=\\\"las la-shield-alt\\\"><\\/i>\",\"content\":\"We are using one of the most experienced, professional, and trusted DDoS Protection and mitigation provider.\"}', NULL, 'bit_gold', NULL, '2022-09-11 04:58:40', '2022-09-11 04:58:40'),
(299, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"631d82f525a611662878453.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-11 05:10:53', '2022-09-11 05:10:53'),
(300, 'contact.content', '{\"heading\":\"Contact With Us\",\"sub_heading\":\"If you have any questions or queries that are not answered on our website, please feel free to contact us. We will try to respond to you as soon as possible. Thank you so much.\",\"map_api_key\":\"AIzaSyCo_pcAdFNbTDCAvMwAD19oRTuEmb9M50c\",\"latitude\":\"19.1368977\",\"longitude\":\"72.893736\",\"title\":\"Hello With Us\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:28:18', '2022-09-15 06:15:05'),
(301, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+01234 5678 9000\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:28:18', '2022-09-11 05:28:18'),
(302, 'contact.element', '{\"icon\":\"<i class=\\\"far fa-envelope-open\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"demo@example.com\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:28:18', '2022-09-11 05:28:18'),
(303, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"3015 Suit pagla road, Singapore\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:28:18', '2022-09-11 05:28:18'),
(304, 'counter.element', '{\"title\":\"Investment\",\"counter_digit\":\"4k+\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:32:24', '2022-09-11 05:32:24'),
(305, 'counter.element', '{\"title\":\"Withdraw\",\"counter_digit\":\"$160k+\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:32:38', '2022-09-11 05:32:38'),
(306, 'counter.element', '{\"title\":\"Deposit\",\"counter_digit\":\"$250K+\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:32:47', '2022-09-11 05:32:47'),
(307, 'counter.element', '{\"title\":\"Users\",\"counter_digit\":\"5K+\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:32:55', '2022-09-11 05:32:55'),
(308, 'why_choose.content', '{\"heading\":\"Features - Why Choose Us\",\"sub_heading\":\"Our goal is to provide our investors with a reliable source of high income, while minimizing any possible risks and offering a high-quality service.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:41'),
(309, 'why_choose.element', '{\"title\":\"Legal Company\",\"icon\":\"<i class=\\\"las la-copy\\\"><\\/i>\",\"content\":\"Our company conducts absolutely legal activities in the legal field. We are certified to operate investment business, we are legal and safe.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(310, 'why_choose.element', '{\"title\":\"High reliability\",\"icon\":\"<i class=\\\"las la-lock\\\"><\\/i>\",\"content\":\"We are trusted by a huge number of people. We are working hard constantly to improve the level of our security system and minimize possible risks.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(311, 'why_choose.element', '{\"title\":\"Anonymity\",\"icon\":\"<i class=\\\"las la-user-lock\\\"><\\/i>\",\"content\":\"Anonymity and using cryptocurrency as a payment instrument. In the era of electronic money \\u2013 this is one of the most convenient ways of cooperation.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(312, 'why_choose.element', '{\"title\":\"Quick Withdrawal\",\"icon\":\"<i class=\\\"las la-shipping-fast\\\"><\\/i>\",\"content\":\"Our all retreats are treated spontaneously once requested. There are high maximum limits. The minimum withdrawal amount is only $10 .\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(313, 'why_choose.element', '{\"title\":\"Referral Program\",\"icon\":\"<i class=\\\"las la-link\\\"><\\/i>\",\"content\":\"We are offering a certain level of referral income through our referral program. you can increase your income by simply refer a few people.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(314, 'why_choose.element', '{\"title\":\"24\\/7 Support\",\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\",\"content\":\"We provide 24\\/7 customer support through e-mail and telegram. Our support representatives are periodically available to elucidate any difficulty.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(315, 'why_choose.element', '{\"title\":\"Dedicated Server\",\"icon\":\"<i class=\\\"las la-server\\\"><\\/i>\",\"content\":\"We are using a dedicated server for the website which allows us exclusive use of the resources of the entire server.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(316, 'why_choose.element', '{\"title\":\"SSL Secured\",\"icon\":\"<i class=\\\"lab la-expeditedssl\\\"><\\/i>\",\"content\":\"Comodo Essential-SSL Security encryption confirms that the presented content is genuine and legitimate.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(317, 'why_choose.element', '{\"title\":\"DDOS Protection\",\"icon\":\"<i class=\\\"las la-shield-alt\\\"><\\/i>\",\"content\":\"We are using one of the most experienced, professional, and trusted DDoS Protection and mitigation provider.\"}', NULL, 'neo_dark', NULL, '2022-09-11 05:35:34', '2022-09-11 05:35:34'),
(318, 'footer.content', '{\"content\":\"This is a Revolutionary Money Making Platform! Invest for Future in Stable Platform and Make Fast Money. Not only we guarantee the fastest and the most exciting returns on your investments, but we also guarantee the security of your investment.\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:27:44', '2022-09-11 06:27:44'),
(319, 'register.content', '{\"has_image\":\"1\",\"image\":\"631d95465ec641662883142.png\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:02', '2022-09-11 06:29:02'),
(320, 'team.content', '{\"heading\":\"Our Expert Team\",\"sub_heading\":\"We have a great team including developers, designers, and Traders. The Team always working hard to give you the maximum profit.\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:34', '2022-09-11 06:30:08'),
(321, 'team.element', '{\"has_image\":\"1\",\"name\":\"Callie Mcdowell\",\"designation\":\"CEO\",\"image\":\"631d958f6449f1662883215.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:34', '2022-09-11 06:30:15'),
(322, 'team.element', '{\"has_image\":\"1\",\"name\":\"Marcia Weeks\",\"designation\":\"CTO\",\"image\":\"631d9596177f91662883222.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:34', '2022-09-11 06:30:22'),
(323, 'team.element', '{\"has_image\":\"1\",\"name\":\"Sage Bray\",\"designation\":\"Marketing Head\",\"image\":\"631d959daf20c1662883229.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:35', '2022-09-11 06:30:29'),
(324, 'team.element', '{\"has_image\":\"1\",\"name\":\"Cyrus Briggs\",\"designation\":\"Developer\",\"image\":\"631d95a8c1e0e1662883240.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:35', '2022-09-11 06:30:40'),
(325, 'team.element', '{\"has_image\":\"1\",\"name\":\"Colette Mccarty\",\"designation\":\"UX Expert\",\"image\":\"631d95b194e561662883249.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:35', '2022-09-11 06:30:49'),
(326, 'team.element', '{\"has_image\":\"1\",\"name\":\"Alden Odom\",\"designation\":\"SEO Expert\",\"image\":\"631d95ba2bec21662883258.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:35', '2022-09-11 06:30:58'),
(327, 'team.element', '{\"has_image\":\"1\",\"name\":\"Tanek Gilmore\",\"designation\":\"SEO Expert\",\"image\":\"631d95c577a5f1662883269.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:35', '2022-09-11 06:31:09'),
(328, 'team.element', '{\"has_image\":\"1\",\"name\":\"Upton Blair\",\"designation\":\"Manager\",\"image\":\"631d95df9760a1662883295.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:29:35', '2022-09-11 06:31:35'),
(329, 'testimonial.content', '{\"heading\":\"What Users Say\",\"sub_heading\":\"We are doing really good at this market and here are the words we loved to get from a few of our users.\"}', NULL, 'neo_dark', NULL, '2022-09-11 06:31:52', '2022-09-11 07:27:07'),
(330, 'testimonial.element', '{\"has_image\":\"1\",\"author\":\"John Doe\",\"designation\":\"User from India\",\"quote\":\"I have invested with this platform and gotten my money in my account. This is legit and safe. Great doing business with them.\",\"image\":\"66a88dff7c5651722322431.jpg\"}', NULL, 'neo_dark', '', '2022-09-11 06:31:52', '2024-07-30 00:53:51'),
(331, 'testimonial.element', '{\"has_image\":\"1\",\"author\":\"Rodduka Bruch\",\"designation\":\"User From USA\",\"quote\":\"Legit....and legit. Although the payment was processed manually, I have received my first payment within a very short time., I think nice for invest at this site.\",\"image\":\"66a88dfa23ec01722322426.jpg\"}', NULL, 'neo_dark', '', '2022-09-11 06:31:52', '2024-07-30 00:53:46'),
(332, 'testimonial.element', '{\"has_image\":\"1\",\"author\":\"Putran Datta\",\"designation\":\"User From Nigeria\",\"quote\":\"I have invested with this platform and gotten my money in my account. This is legit and safe. Great doing business with them.\",\"image\":\"66a88df49e49b1722322420.jpg\"}', NULL, 'neo_dark', '', '2022-09-11 06:31:52', '2024-07-30 00:53:40'),
(333, 'top_investor.content', '{\"heading\":\"Our Top Investors\",\"sub_heading\":\"Here are the investor leaders who have made the maximum investment with our system.\"}', NULL, 'neo_dark', NULL, '2022-09-11 07:27:12', '2022-09-11 07:27:33'),
(334, 'transaction.content', '{\"heading\":\"Our Latest Transaction\",\"sub_heading\":\"Here is the log of the most recent transactions including withdraw and deposit made by our users.\"}', NULL, 'neo_dark', NULL, '2022-09-11 07:27:56', '2022-09-11 07:28:38'),
(335, 'we_accept.content', '{\"heading\":\"Payment We Accept\",\"sub_heading\":\"We accept all major cryptocurrencies and fiat payment methods to make your investment process easier with our platform.\"}', NULL, 'neo_dark', NULL, '2022-09-11 07:28:45', '2022-09-26 08:17:06'),
(337, 'footer.content', '{\"content\":\"Lorem, ipsum dolor sit amet consectetur adipisicing elit. A ut aspernatur nesciunt dolores dolorem corrupti explicabo voluptate placeat impedit eveniet. Placeat soluta modi, dolor dolores iure eaque blanditiis labore temporibus cum magni rem accusantium eveniet? Quis suscipit\"}', NULL, 'invester', NULL, '2022-09-18 13:22:57', '2022-09-18 13:41:21'),
(338, 'authentication.content', '{\"register_title\":\"Create an Account\",\"register_subtitle\":\"You can create account using email or username and the registration is fully free\",\"login_title\":\"Login to your account\",\"login_subtitle\":\"You can sign in to your account using email or username\"}', NULL, 'invester', NULL, '2022-09-19 12:04:09', '2022-09-20 06:54:45'),
(340, 'preloader.content', '{\"has_image\":\"1\",\"image_one\":\"632ebf9b581241664008091.png\",\"image_two\":\"632ebf9b5e2681664008091.png\"}', NULL, 'bit_gold', NULL, '2022-09-24 01:30:47', '2022-09-24 02:28:11'),
(341, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"63319095f3d411664192661.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-25 00:18:19', '2022-09-26 05:44:22'),
(343, 'transaction.element', '{\"trx_type\":\"deposit\",\"name\":\"Benjamin Santos\",\"date\":\"2022-09-21\",\"amount\":\"120\",\"gateway\":\"Bank Wire\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:24:52', '2023-12-16 10:55:16'),
(344, 'transaction.element', '{\"trx_type\":\"withdraw\",\"name\":\"Hilda Baird\",\"date\":\"2022-09-21\",\"amount\":\"365\",\"gateway\":\"Mobile Banking\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:25:31', '2022-09-26 05:25:31'),
(345, 'transaction.element', '{\"trx_type\":\"deposit\",\"name\":\"Glenna Mcdowell\",\"date\":\"2022-09-21\",\"amount\":\"325\",\"gateway\":\"Coin Transfer\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:26:10', '2023-12-16 10:55:20'),
(346, 'transaction.element', '{\"trx_type\":\"withdraw\",\"name\":\"Ruth Herman\",\"date\":\"2022-09-21\",\"amount\":\"412\",\"gateway\":\"Bank Transfer\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:27:05', '2022-09-26 05:27:05'),
(347, 'transaction.element', '{\"trx_type\":\"deposit\",\"name\":\"Eve Hawkins\",\"date\":\"2022-09-21\",\"amount\":\"245\",\"gateway\":\"Mobile Banking\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:27:47', '2023-12-16 10:55:32'),
(348, 'transaction.element', '{\"trx_type\":\"withdraw\",\"name\":\"Raphael Rush\",\"date\":\"2022-09-21\",\"amount\":\"365\",\"gateway\":\"Bank Wire\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:28:23', '2022-09-26 05:28:23'),
(349, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331909d64be71664192669.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:44:29', '2022-09-26 05:44:29'),
(350, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190a588df71664192677.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:44:37', '2022-09-26 05:44:37'),
(351, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190ad89c261664192685.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:44:45', '2022-09-26 05:44:45'),
(352, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190b56702e1664192693.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:44:53', '2022-09-26 05:44:53'),
(353, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190beae8061664192702.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:45:02', '2022-09-26 05:45:02'),
(354, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190c81d2361664192712.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:45:12', '2022-09-26 05:45:12'),
(355, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190d1715f71664192721.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:45:21', '2022-09-26 05:45:21'),
(356, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190dadd0f81664192730.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:45:30', '2022-09-26 05:45:30'),
(357, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190e5aa7371664192741.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:45:41', '2022-09-26 05:45:41'),
(358, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633190f8ef6061664192760.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:46:00', '2022-09-26 05:46:01'),
(359, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"63319103114611664192771.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:46:11', '2022-09-26 05:46:11'),
(360, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331910d5ef4e1664192781.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:46:21', '2022-09-26 05:46:21'),
(361, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633191199cfcb1664192793.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:46:33', '2022-09-26 05:46:33'),
(362, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"633191261ce231664192806.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:46:46', '2022-09-26 05:46:46'),
(363, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331912f34a631664192815.jpg\"}', NULL, 'bit_gold', NULL, '2022-09-26 05:46:55', '2022-09-26 05:46:55'),
(364, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia established  fact\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"657d8132db1a61702723890.jpg\"}', NULL, 'bit_gold', 'voluptatum-est-expedita-officia-established--fact', '2022-09-26 05:48:34', '2023-12-16 10:51:31'),
(365, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"amet quisquam ut vitae debitis iste.\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"657d81381d3241702723896.jpg\"}', NULL, 'bit_gold', 'amet-quisquam-ut-vitae-debitis-iste', '2022-09-26 05:49:18', '2023-12-16 10:51:36'),
(366, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"It is a long established fact that a reade\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"657d813c9c0bc1702723900.jpg\"}', NULL, 'bit_gold', 'it-is-a-long-established-fact-that-a-reade', '2022-09-26 05:49:45', '2023-12-16 10:51:40'),
(367, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia, eos\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"657d8140b2ae11702723904.jpg\"}', NULL, 'bit_gold', 'voluptatum-est-expedita-officia-eos', '2022-09-26 08:06:07', '2023-12-16 10:51:44'),
(368, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia, eos\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"657d8144dee1d1702723908.jpg\"}', NULL, 'bit_gold', 'voluptatum-est-expedita-officia-eos', '2022-09-26 08:06:32', '2023-12-16 10:51:49'),
(369, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia, eos\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"657d814913f061702723913.jpg\"}', NULL, 'bit_gold', 'voluptatum-est-expedita-officia-eos', '2022-09-26 08:06:50', '2023-12-16 10:51:53'),
(370, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia established  fact\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"66a88d68e5c671722322280.jpg\"}', NULL, 'neo_dark', 'voluptatum-est-expedita-officia-established-fact6', '2022-09-26 08:12:59', '2024-07-30 00:51:21'),
(371, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"amet quisquam ut vitae debitis iste.\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"66a88d5e4d9bb1722322270.jpg\"}', NULL, 'neo_dark', 'amet-quisquam-ut-vitae-debitis-iste5', '2022-09-26 08:12:59', '2024-07-30 00:51:10');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(372, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"It is a long established fact that a reade\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"66a88d53496c61722322259.jpg\"}', NULL, 'neo_dark', 'it-is-a-long-established-fact-that-a-reade4', '2022-09-26 08:12:59', '2024-07-30 00:50:59'),
(373, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia, eos\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"66a88d46b9b141722322246.jpg\"}', NULL, 'neo_dark', 'voluptatum-est-expedita-officia-eos3', '2022-09-26 08:12:59', '2024-07-30 00:50:46'),
(374, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia, eos\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"66a88d3c353d91722322236.jpg\"}', NULL, 'neo_dark', 'voluptatum-est-expedita-officia-eos2', '2022-09-26 08:12:59', '2024-07-30 00:50:36'),
(375, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Voluptatum est expedita officia, eos\",\"description\":\"<span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\\u00a0It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span><br \\/>\",\"image\":\"66a88d31ace3d1722322225.jpg\"}', NULL, 'neo_dark', 'voluptatum-est-expedita-officia-eos1', '2022-09-26 08:12:59', '2024-07-30 00:50:25'),
(376, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b469adf241664201833.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:16:59', '2022-09-26 08:17:13'),
(377, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b478b064e1664201848.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:16:59', '2022-09-26 08:17:28'),
(378, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b48013ebe1664201856.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:16:59', '2022-09-26 08:17:36'),
(379, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b48911ad11664201865.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:16:59', '2022-09-26 08:17:45'),
(380, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4911a65a1664201873.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:16:59', '2022-09-26 08:17:53'),
(381, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b49a692c51664201882.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:16:59', '2022-09-26 08:18:02'),
(382, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4a689e2d1664201894.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:18:14'),
(383, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4b7930091664201911.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:18:31'),
(384, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4d1812581664201937.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:18:57'),
(385, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4d8316831664201944.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:19:04'),
(386, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4e1215b71664201953.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:19:13'),
(387, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b4e9889851664201961.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:19:21'),
(388, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b501a44a51664201985.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:19:45'),
(389, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b50c0cff01664201996.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:19:56'),
(390, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b51535bce1664202005.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:20:05'),
(391, 'we_accept.element', '{\"has_image\":\"1\",\"image\":\"6331b5235e83d1664202019.jpg\"}', NULL, 'neo_dark', NULL, '2022-09-26 08:17:00', '2022-09-26 08:20:19'),
(394, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\"}', NULL, 'invester', 'privacy-policy', '2022-09-26 08:22:15', '2022-09-26 08:22:15'),
(395, 'policy_pages.element', '{\"title\":\"Terms and Service\",\"details\":\"<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\\r\\n<p><br \\/>\\r\\n<\\/p>\\r\\n<h2>What is Lorem Ipsum?\\r\\n<\\/h2>\\r\\n<p><span>Lorem Ipsum<\\/span>\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the\\r\\n        industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\\r\\n        it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic\\r\\n        typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\\r\\n        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\\r\\n        including versions of Lorem Ipsum.\\r\\n<\\/p>\"}', NULL, 'invester', 'terms-and-service', '2022-09-26 08:22:15', '2022-10-06 02:58:09'),
(396, 'how_it_work.content', '{\"title\":\"How HYIPLab Work\",\"subtitle\":\"To start with <span class=\\\"fw-bold\\\"><i>HYIPLab<\\/i><\\/span> you should know that how the system works. Please follow the below process to know that how the system works.\"}', NULL, 'invester', NULL, '2022-09-27 00:50:50', '2022-09-27 00:50:50'),
(397, 'how_it_work.element', '{\"has_image\":\"1\",\"title\":\"Create Account\",\"content\":\"Create an account providing your valid information\",\"image\":\"63329f02251e21664261890.png\"}', NULL, 'invester', NULL, '2022-09-27 00:58:10', '2022-09-27 00:58:10'),
(398, 'how_it_work.element', '{\"has_image\":\"1\",\"title\":\"Add Fund\",\"content\":\"Make deposit using our supported payment gateway\",\"image\":\"63329f26c36421664261926.png\"}', NULL, 'invester', NULL, '2022-09-27 00:58:46', '2022-09-27 00:58:46'),
(399, 'how_it_work.element', '{\"has_image\":\"1\",\"title\":\"Invest to Plan\",\"content\":\"Make investment to get profit from our system\",\"image\":\"63329f4740b7e1664261959.png\"}', NULL, 'invester', NULL, '2022-09-27 00:59:19', '2022-09-27 00:59:19'),
(400, 'how_it_work.element', '{\"has_image\":\"1\",\"title\":\"Withdraw Profit\",\"content\":\"Withdraw your profit which you\'ve got from the investment\",\"image\":\"63329f7b3bf561664262011.png\"}', NULL, 'invester', NULL, '2022-09-27 01:00:11', '2022-09-27 01:00:11'),
(401, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"David Doe\",\"designation\":\"User from England\",\"quote\":\"Legit....and legit. Although the payment was processed manually, I have received my first payment within a very short time., I think nice for invest at this site.\",\"image\":\"657d8260991ca1702724192.jpg\"}', NULL, 'bit_gold', NULL, '2022-10-06 07:50:53', '2023-12-16 10:56:32'),
(411, 'preloader.content', '{\"has_image\":\"1\",\"image_one\":\"633efa583f0551665071704.png\",\"image_two\":\"633efa584317d1665071704.png\"}', NULL, 'neo_dark', NULL, '2022-10-06 09:55:04', '2022-10-06 09:55:04'),
(412, 'user_ranking.content', '{\"heading_w\":\"User Ranking\",\"heading_c\":\"Bonus\",\"sub_heading\":\"You can get bonus for investing or Interest.\"}', NULL, 'bit_gold', NULL, '2023-02-06 07:48:56', '2023-02-06 07:48:56'),
(413, 'user_ranking.content', '{\"heading\":\"User Ranking Bonus\",\"sub_heading\":\"You can get bonus for investing or Interest.\"}', NULL, 'neo_dark', NULL, '2023-02-06 23:51:09', '2023-02-06 23:51:35'),
(414, 'user_ranking.content', '{\"title\":\"User Ranking Bonus\",\"subtitle\":\"You can get bonus for investing or Interest.\"}', NULL, 'invester', NULL, '2023-02-07 00:15:49', '2023-02-07 00:15:49'),
(415, 'ranking.content', '{\"heading_w\":\"User\",\"heading_c\":\"Ranking\",\"sub_heading\":\"You can get a bonus to fulfill the requirement.\"}', NULL, 'bit_gold', NULL, '2023-03-11 01:25:36', '2023-03-11 02:56:24'),
(416, 'ranking.content', '{\"heading\":\"User Ranking\",\"sub_heading\":\"You can get a bonus to fulfill the requirement.\"}', NULL, 'invester', NULL, '2023-03-11 02:47:58', '2023-03-11 02:52:08'),
(417, 'ranking.content', '{\"heading\":\"User Ranking\",\"sub_heading\":\"You can get a bonus to fulfill the requirement.\"}', NULL, 'neo_dark', NULL, '2023-03-11 02:55:55', '2023-03-11 02:55:55'),
(418, 'transaction.element', '{\"trx_type\":\"deposit\",\"name\":\"Raphael Rush\",\"date\":\"2022-09-21\",\"amount\":\"365 USD\",\"gateway\":\"Paypal\"}', NULL, 'bit_gold', NULL, '2023-12-16 10:54:59', '2023-12-16 10:54:59'),
(419, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Registration unavailable: Please check back later for updates. Thank you for your patience.\",\"button_name\":\"Go Home\",\"button_url\":\"#\",\"image\":\"668f7440c14351720677440.png\"}', NULL, 'bit_gold', '', '2024-07-10 17:57:20', '2024-07-10 17:57:22'),
(420, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Registration unavailable: Please check back later for updates. Thank you for your patience.\",\"button_name\":\"Go Home\",\"button_url\":\"#\",\"image\":\"668f877bcaac91720682363.png\"}', NULL, 'invester', '', '2024-07-10 19:19:23', '2024-07-10 19:19:23'),
(421, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Registration unavailable: Please check back later for updates. Thank you for your patience.\",\"button_name\":\"Go Home\",\"button_url\":\"#\",\"image\":\"668f8796803891720682390.png\"}', NULL, 'neo_dark', '', '2024-07-10 19:19:50', '2024-07-10 19:19:50'),
(422, 'kyc.content', '{\"required\":\"Please submit the required KYC information to verify yourself. Otherwise, you couldn\'t make any withdrawal requests to the system.\",\"pending\":\"Your submitted KYC information is pending for admin approval. Please wait till that.\",\"reject\":\"Your KYC document has been rejected. Please resubmit the document for further review.\"}', NULL, 'bit_gold', '', '2024-07-12 18:25:32', '2024-07-12 18:25:32'),
(423, 'kyc.content', '{\"required\":\"Please submit the required KYC information to verify yourself. Otherwise, you couldn\'t make any withdrawal requests to the system.\",\"pending\":\"Your submitted KYC information is pending for admin approval. Please wait till that.\",\"reject\":\"Your KYC document has been rejected. Please resubmit the document for further review.\"}', NULL, 'invester', '', '2024-07-12 19:07:34', '2024-07-12 19:07:34'),
(424, 'kyc.content', '{\"required\":\"Please submit the required KYC information to verify yourself. Otherwise, you couldn\'t make any withdrawal requests to the system.\",\"pending\":\"Your submitted KYC information is pending for admin approval. Please wait till that.\",\"reject\":\"Your KYC document has been rejected. Please resubmit the document for further review.\"}', NULL, 'neo_dark', '', '2024-07-12 19:09:12', '2024-07-12 19:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', NULL, 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"PAYPAL_EMAIL_PLACEHOLDER\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', NULL, 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"PERFECT_MONEY_PASSPHRASE\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', NULL, 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_STRIPE_SECRET_KEY\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_STRIPE_PUBLISHABLE_KEY\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', NULL, 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', NULL, 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"PAYTM_MERCHANT_KEY\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', NULL, 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"PAYEER_SECRET_KEY\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 0, 107, 'PayStack', 'Paystack', NULL, 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_PAYSTACK_PUBLIC_KEY\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_PAYSTACK_SECRET_KEY\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', NULL, 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', NULL, 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_RAZORPAY_KEY_ID\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"RAZORPAY_KEY_SECRET\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', NULL, 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_STRIPE_SECRET_KEY\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_STRIPE_PUBLISHABLE_KEY\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', NULL, 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"INSTAMOJO_API_KEY\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"INSTAMOJO_AUTH_TOKEN\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"INSTAMOJO_SALT\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"XPUB_CODE_PLACEHOLDER\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', NULL, 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', NULL, 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"COINBASE_API_KEY\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"COINBASE_SECRET\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', NULL, 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"PAYPAL_CLIENT_ID\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"PAYPAL_CLIENT_SECRET\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', NULL, 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_STRIPE_SECRET_KEY\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_STRIPE_PUBLISHABLE_KEY\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_STRIPE_WEBHOOK_SECRET\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', NULL, 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', NULL, 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', NULL, 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(44, 0, 120, 'Authorize.net', 'Authorize', NULL, 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"3Vee5S2F\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-15 09:27:31'),
(46, 0, 121, 'NMI', 'NMI', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-09-10 05:30:15'),
(49, 0, 122, 'BTCPay', 'BTCPay', NULL, 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL),
(50, 0, 123, 'Now payments hosted', 'NowPaymentsHosted', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 10:42:09'),
(51, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 1, '', NULL, NULL, '2023-02-14 10:42:09'),
(56, 0, 124, '2Checkout', 'TwoCheckout', NULL, 1, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"253248016872\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"eQM)ID@&vG84u!O*g[p+\"}}', '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}', 0, '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}', NULL, NULL, '2023-04-29 03:21:58'),
(57, 0, 125, 'Checkout', 'Checkout', NULL, 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"------\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2023-05-06 01:43:01'),
(59, 0, 510, 'Binance', 'Binance', NULL, 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"tsu3tjiq0oqfbtmlbevoeraxhfbp3brejnm9txhjxcp4to29ujvakvfl1ibsn3ja\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"jzngq4t04ltw8d4iqpi7admfl8tvnpehxnmi34id1zvfaenbwwvsvw7llw3zdko8\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"231129033\"}}', '{\"BTC\":\"Bitcoin\",\"USD\":\"USD\",\"BNB\":\"BNB\"}', 1, '{\"cron\":{\"title\": \"Cron Job URL\",\"value\":\"ipn.Binance\"}}', NULL, NULL, '2023-02-14 05:08:04'),
(60, 0, 126, 'SslCommerz', 'SslCommerz', NULL, 1, '{\"store_id\": {\"title\": \"Store ID\",\"global\": true,\"value\": \"---------\"},\"store_password\": {\"title\": \"Store Password\",\"global\": true,\"value\": \"----------\"}}', '{\"BDT\":\"BDT\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"SGD\":\"SGD\",\"INR\":\"INR\",\"MYR\":\"MYR\"}', 0, NULL, NULL, NULL, '2023-05-06 07:43:01'),
(61, 0, 127, 'Aamarpay', 'Aamarpay', NULL, 1, '{\"store_id\": {\"title\": \"Store ID\",\"global\": true,\"value\": \"---------\"},\"signature_key\": {\"title\": \"Signature Key\",\"global\": true,\"value\": \"----------\"}}', '{\"BDT\":\"BDT\"}', 0, NULL, NULL, NULL, '2023-05-06 07:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_from_name` varchar(255) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_template` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `push_title` varchar(255) DEFAULT NULL,
  `push_template` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `secondary_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT 1,
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `metamask_login` tinyint(1) NOT NULL DEFAULT 0,
  `active_template` varchar(40) DEFAULT NULL,
  `socialite_credentials` text DEFAULT NULL,
  `system_customized` tinyint(1) NOT NULL DEFAULT 0,
  `paginate_number` int(11) NOT NULL DEFAULT 0,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `deposit_commission` tinyint(1) NOT NULL DEFAULT 1,
  `invest_commission` tinyint(1) NOT NULL DEFAULT 1,
  `invest_return_commission` tinyint(1) NOT NULL DEFAULT 1,
  `signup_bonus_amount` decimal(11,2) DEFAULT 0.00,
  `signup_bonus_control` tinyint(1) NOT NULL DEFAULT 0,
  `promotional_tool` tinyint(1) NOT NULL DEFAULT 0,
  `firebase_config` text DEFAULT NULL,
  `firebase_template` text DEFAULT NULL,
  `push_notify` tinyint(1) NOT NULL DEFAULT 0,
  `off_day` text DEFAULT NULL,
  `last_cron` datetime DEFAULT NULL,
  `available_version` varchar(40) DEFAULT '1.0',
  `b_transfer` int(11) NOT NULL DEFAULT 0 COMMENT 'Balance Transfer Status',
  `f_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Fixed Charge',
  `p_charge` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Percent Charge',
  `user_ranking` tinyint(1) NOT NULL DEFAULT 0,
  `schedule_invest` tinyint(1) NOT NULL DEFAULT 0,
  `holiday_withdraw` tinyint(1) NOT NULL DEFAULT 0,
  `staking_option` tinyint(1) NOT NULL DEFAULT 0,
  `staking_min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `staking_max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `pool_option` tinyint(1) NOT NULL DEFAULT 0,
  `multi_language` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `spa` tinyint(1) NOT NULL DEFAULT 0,
  `spa_url` varchar(255) DEFAULT NULL COMMENT 'single page app link',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `pn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `metamask_login`, `active_template`, `socialite_credentials`, `system_customized`, `paginate_number`, `currency_format`, `deposit_commission`, `invest_commission`, `invest_return_commission`, `signup_bonus_amount`, `signup_bonus_control`, `promotional_tool`, `firebase_config`, `firebase_template`, `push_notify`, `off_day`, `last_cron`, `available_version`, `b_transfer`, `f_charge`, `p_charge`, `user_ranking`, `schedule_invest`, `holiday_withdraw`, `staking_option`, `staking_min_amount`, `staking_max_amount`, `pool_option`, `multi_language`, `spa`, `spa_url`, `created_at`, `updated_at`) VALUES
(1, 'HYIPLab', 'USD', '$', 'info@viserlab.com', 'Viserlab', '<html>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<title>\r\n</title>\r\n<style type=\"text/css\">\r\n	.ReadMsgBody {\r\n		width: 100%;\r\n		background-color: #ffffff;\r\n	}\r\n	.ExternalClass {\r\n		width: 100%;\r\n		background-color: #ffffff;\r\n	}\r\n	.ExternalClass,\r\n	.ExternalClass p,\r\n	.ExternalClass span,\r\n	.ExternalClass font,\r\n	.ExternalClass td,\r\n	.ExternalClass div {\r\n		line-height: 100%;\r\n	}\r\n	html {\r\n		width: 100%;\r\n	}\r\n	body {\r\n		-webkit-text-size-adjust: none;\r\n		-ms-text-size-adjust: none;\r\n		margin: 0;\r\n		padding: 0;\r\n	}\r\n	table {\r\n		border-spacing: 0;\r\n		table-layout: fixed;\r\n		margin: 0 auto;\r\n		border-collapse: collapse;\r\n	}\r\n	table table table {\r\n		table-layout: auto;\r\n	}\r\n	.yshortcuts a {\r\n		border-bottom: none !important;\r\n	}\r\n	img:hover {\r\n		opacity: 0.9 !important;\r\n	}\r\n	a {\r\n		color: #0087ff;\r\n		text-decoration: none;\r\n	}\r\n	.textbutton a {\r\n		font-family: \"open sans\", arial, sans-serif !important;\r\n	}\r\n	.btn-link a {\r\n		color: #ffffff !important;\r\n	}\r\n	@media only screen and (max-width: 480px) {\r\n		body {\r\n			width: auto !important;\r\n		}\r\n		*[class=\"table-inner\"] {\r\n			width: 90% !important;\r\n			text-align: center !important;\r\n		}\r\n		*[class=\"table-full\"] {\r\n			width: 100% !important;\r\n			text-align: center !important;\r\n		} /* image */\r\n		img[class=\"img1\"] {\r\n			width: 100% !important;\r\n			height: auto !important;\r\n		}\r\n	}\r\n\r\n</style>\r\n<table bgcolor=\"#030442\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td height=\"50\">\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr>\r\n							<td align=\"center\" width=\"600\">\r\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n									<tbody>\r\n										<tr>\r\n											<td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n												<table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n													<tbody>\r\n														<tr>\r\n															<td height=\"20\">\r\n															</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">\r\n															This is a System Generated Email</td>\r\n														</tr>\r\n														<tr>\r\n															<td height=\"20\">\r\n															</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n									<tbody>\r\n										<tr>\r\n											<td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n													<tbody>\r\n														<tr>\r\n															<td height=\"35\">\r\n															</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n																<a href=\"#\">\r\n																	<img style=\"display:block; line-height:0px; font-size:0px; border:0px; width: 240px;\" width=\"240px\" src=\"https://viserlab.com/assets/images/logoIcon/logo-dark.png\" alt=\"img\">\r\n																</a>\r\n															</td>\r\n														</tr>\r\n														<tr>\r\n															<td height=\"40\"></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\" style=\"font-family: Open Sans, Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">\r\n															Hello {{fullname}} ({{username}}) </td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n																<table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n																	<tbody>\r\n																		<tr>\r\n																			<td height=\"20\" style=\" border-bottom:3px solid #0087ff;\">\r\n																			</td>\r\n																		</tr>\r\n																	</tbody>\r\n																</table>\r\n															</td>\r\n														</tr>\r\n														<tr>\r\n															<td height=\"30\"></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"left\" style=\"font-family: Open sans, Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">\r\n															{{message}}</td>\r\n														</tr>\r\n														<tr>\r\n															<td height=\"60\"></td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n										</tr>\r\n										<tr>\r\n											<td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n													<tbody>\r\n														<tr>\r\n															<td height=\"10\"></td>\r\n														</tr>\r\n														<tr>\r\n															<td class=\"preference-link\" align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n																© 2024 <a href=\"#\">{{site_name}}</a> &nbsp;. All Rights Reserved. </td>\r\n														</tr>\r\n														<tr>\r\n															<td height=\"10\"></td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"60\"></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</html>', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', NULL, NULL, 'cba352', '', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 'bit_gold', '{\"google\":{\"client_id\":\"------------\",\"client_secret\":\"-------------\",\"status\":1},\"facebook\":{\"client_id\":\"------\",\"client_secret\":\"------\",\"status\":1},\"linkedin\":{\"client_id\":\"-----\",\"client_secret\":\"-----\",\"status\":1}}', 0, 0, 0, 0, 0, 0, 5.00, 0, 1, NULL, NULL, 0, NULL, '2024-07-30 09:03:36', '5.2', 1, 5.00000000, 1.00, 1, 1, 0, 0, 1.00000000, 10000.00000000, 0, 1, 0, NULL, NULL, '2025-02-27 04:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invests`
--

CREATE TABLE `invests` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT 0,
  `plan_id` int(10) UNSIGNED DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `initial_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `interest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `initial_interest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `net_interest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `should_pay` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `paid` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `period` int(11) DEFAULT 0,
  `hours` varchar(40) NOT NULL,
  `time_name` varchar(40) NOT NULL,
  `return_rec_time` int(11) NOT NULL DEFAULT 0,
  `next_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_time` timestamp NULL DEFAULT NULL,
  `compound_times` int(11) NOT NULL DEFAULT 0,
  `rem_compound_times` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Closed\r\n1: Running\r\n2: Canceled',
  `capital_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = YES & 0 = NO',
  `capital_back` tinyint(1) NOT NULL DEFAULT 0,
  `hold_capital` tinyint(1) NOT NULL DEFAULT 0,
  `trx` varchar(40) DEFAULT NULL,
  `wallet_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `image` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `image`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '660b94fa876ac1712035066.png', '2020-07-06 03:47:55', '2022-04-09 03:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `push_title` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `push_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `email_sent_from_name` varchar(40) DEFAULT NULL,
  `email_sent_from_address` varchar(40) DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_sent_from` varchar(40) DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT 0,
  `firebase_status` tinyint(1) NOT NULL DEFAULT 0,
  `firebase_body` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `firebase_status`, `firebase_body`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', NULL, '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 0, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', NULL, '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', NULL, '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', NULL, '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 0, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', NULL, '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', NULL, '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', NULL, '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', NULL, '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', NULL, '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', NULL, '{\"code\":\"Email verification code\"}', 1, NULL, NULL, 0, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', NULL, '---', 'Your phone verification code is: {{code}}', NULL, '{\"code\":\"SMS Verification Code\"}', 0, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{subject}}', '{{message}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 1, 0, NULL, '2019-09-14 13:14:22', '2024-07-30 03:03:21'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, NULL, NULL, '[]', 1, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected', 'KYC has been rejected', NULL, NULL, NULL, NULL, '{\"reason\":\"Rejection Reason\"}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL),
(18, 'INTEREST', 'Interest', 'Interest added to your balance', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">You got&nbsp;<span style=\"font-size: 1rem; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{amount}} {{site_currency}}</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">&nbsp;interest.</span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Interest:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Plan Name: {{plan_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'You got {{amount}} {{site_currency}} interest. Plan: {{plan_name}}. Trx: {{trx}}', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\r\n    \"amount\": \"Amount inserted by the user\",\r\n    \"plan_name\": \"Plan name\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-09-22 06:43:09'),
(19, 'INVESTMENT', 'Investment', 'Investment successfully completed', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;investment successfully completed.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Investment:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Wallet type: {{wallet_type}}</span><br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Plan name: {{plan_name}}</span><br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Interest: {{interest_amount}} {{site_currency}}</span></div><div style=\"font-family: Montserrat, sans-serif;\">Duration: {{time}}</div><div style=\"font-family: Montserrat, sans-serif;\">Every {{time_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your {{amount}} {{site_currency}} investment successfully completed. Plan name: {{plan_name}}. Trx: {{trx}}', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\r\n    \"amount\": \"Amount inserted by the user\",\r\n    \"plan_name\": \"Plan name\",\r\n    \"interest_amount\": \"Interest amount\",\r\n    \"time\": \"Plan duration\",\r\n    \"time_name\": \"Interest duration\",\r\n    \"wallet_type\": \"Invest wallet\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-09-22 06:26:23'),
(20, 'REFERRAL_COMMISSION', 'Referral Commission', 'Referral Commission', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">You got&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;referral commission.</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your referral commission:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">{{type}} referral commission</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Transaction Number : {{trx}}</span><br></div><div style=\"font-family: Montserrat, sans-serif;\">{{level}} level referral commission.</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your got {{amount}} {{site_currency}} referral commission from {{ref_username}}.', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\r\n    \"amount\": \"Amount inserted by the user\",\r\n    \"plan_name\": \"Plan name\",\r\n    \"level\": \"Which level referral commission\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-09-22 03:43:49'),
(21, 'REFERRAL_JOIN', 'Referral Join', 'Referral Join', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">@{{ref_username}} has been joined by your referral link.</div>', '{{ref_user_name}} ({{ref_username}}) has been joined by your referral link.', NULL, '{\r\n    \"ref_user_name\": \"Referral user full name\",\r\n    \"ref_username\": \"Referral user username\"\r\n}', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-09-22 05:05:46'),
(22, 'BALANCE_TRANSFER', 'Balance Transfer', 'Balance Transfer', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;transferred successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Transfer:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"\"><font face=\"Montserrat, sans-serif\">Wallet type: {{wallet_type}}</font></div><div style=\"\"><font face=\"Montserrat, sans-serif\">Transfer to: {{user_fullname}} (</font><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif; font-size: 1rem; text-align: var(--bs-body-text-align);\">{{username}})</span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your {{amount}} {{site_currency}} transferred successfully. Transfer to: {{user_fullname}} ({{username}})', NULL, '{\r\n{\r\n    \"trx\": \"Transaction number for the interest\",\r\n    \"amount\": \"Amount inserted by the user\",\r\n    \"wallet_type\": \"Wallet type\",\r\n    \"charge\": \"Charge amount\",\r\n    \"user_fullname\": \"Transfer user full name\",\r\n    \"username\": \"Transfer user username\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}\r\n    \"amount\": \"Amount inserted by the user\",\r\n    \"charge\": \"Charge amount\",\r\n    \"user_fullname\": \"Transfer user full name\",\r\n    \"username\": \"Transfer user username\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}\r\n', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-09-22 05:09:03'),
(23, 'BALANCE_RECEIVE', 'Balance Receive', 'Balance Receive', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">You received&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;from {{sender}}.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Received Money:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Wallet_type: {{wallet_type}}</div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your {{amount}} {{site_currency}} transferred successfully. Transfer to: {{user_fullname}} ({{username}})', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\r\n    \"amount\": \"Amount inserted by the user\",\r\n    \"sender\": \"Sender username\",\r\n    \"wallet_type\": \"Wallet type\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}\r\n', 1, NULL, NULL, 1, NULL, 0, 0, NULL, '2021-11-03 12:00:00', '2022-09-20 09:03:25'),
(24, 'INSUFFICIENT_BALANCE', 'Schedule Investment Failed', 'Schedule Investment Failed', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your scheduled investment failed due to insufficient balance.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Details of your scheduled investment.</div><div style=\"font-family: Montserrat, sans-serif;\">Invest Amount: {{invest_amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Wallet: {{wallet}}</div><div style=\"font-family: Montserrat, sans-serif;\">Plan Name: {{plan_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Your Balance: {{balance}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Next Schedule: {{next_schedule}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please keep your balance for the next scheduled date.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your scheduled investment failed due to insufficient balance.', NULL, '{\r\n    \"invest_amount\": \"Invest amount\",\r\n    \"wallet\": \"Wallet type\",\r\n    \"plan_name\": \"Plan name\",\r\n    \"balance\": \"User balance\",\r\n    \"next_schedule\": \"Next invest schedule\"\r\n}', 1, NULL, NULL, 0, NULL, 0, 0, 'Your scheduled investment failed due to insufficient balance.', '2021-11-03 12:00:00', '2023-06-21 03:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `seo_content` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.bit_gold.', '[\"about\",\"plan\",\"why_choose\",\"calculation\",\"how_work\",\"faq\",\"testimonial\",\"team\",\"transaction\",\"top_investor\",\"cta\",\"we_accept\",\"ranking\",\"blog\",\"subscribe\"]', NULL, 1, '2020-07-11 06:23:58', '2023-06-21 06:27:07'),
(4, 'Blog', 'blogs', 'templates.bit_gold.', NULL, NULL, 1, '2020-10-22 01:14:43', '2022-09-10 04:36:20'),
(5, 'Contact', 'contact', 'templates.bit_gold.', NULL, NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(19, 'Plans', 'plans', 'templates.bit_gold.', NULL, NULL, 1, '2022-05-18 09:37:02', '2022-05-18 09:38:21'),
(20, 'Home', '/', 'templates.neo_dark.', '[\"about\",\"faq\",\"why_choose\",\"plan\",\"subscribe\",\"testimonial\",\"top_investor\",\"transaction\",\"calculation\",\"ranking\",\"how_work\",\"blog\"]', NULL, 1, '2022-06-06 08:34:19', '2023-06-21 06:22:47'),
(21, 'Plan', 'plans', 'templates.neo_dark.', NULL, NULL, 1, '2022-06-11 08:26:40', '2022-06-11 08:27:13'),
(22, 'About', 'about', 'templates.neo_dark.', '[\"how_work\",\"about\",\"counter\",\"team\",\"we_accept\"]', NULL, 0, '2022-06-11 08:55:56', '2022-06-11 09:06:05'),
(23, 'Blogs', 'blogs', 'templates.neo_dark.', NULL, NULL, 1, '2022-06-11 09:34:38', '2022-06-11 09:34:38'),
(24, 'About', 'about', 'templates.bit_gold.', '[\"how_work\",\"about\",\"faq\",\"cta\"]', NULL, 0, '2022-08-25 04:50:42', '2022-08-25 04:52:26'),
(25, 'Home', '/', 'templates.invester.', NULL, NULL, 1, '2022-09-20 07:12:38', '2022-09-20 07:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
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
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `time_setting_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(40) NOT NULL,
  `minimum` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `maximum` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `interest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `interest_type` tinyint(1) DEFAULT 0 COMMENT '1 = ''%'' / 0 =''currency''',
  `repeat_time` varchar(40) DEFAULT NULL,
  `lifetime` tinyint(1) DEFAULT 0,
  `capital_back` tinyint(1) DEFAULT 0,
  `compound_interest` tinyint(1) NOT NULL DEFAULT 0,
  `hold_capital` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pools`
--

CREATE TABLE `pools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `invested_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `interest_range` varchar(40) DEFAULT NULL,
  `share_interest` tinyint(4) NOT NULL DEFAULT 0,
  `interest` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pool_invests`
--

CREATE TABLE `pool_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pool_id` int(10) UNSIGNED NOT NULL,
  `invest_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: Running\r\n2: Completed\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_tools`
--

CREATE TABLE `promotion_tools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commission_type` varchar(40) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_invests`
--

CREATE TABLE `schedule_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wallet` varchar(40) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `schedule_times` int(11) NOT NULL DEFAULT 0,
  `rem_schedule_times` int(11) NOT NULL DEFAULT 0,
  `interval_hours` int(11) NOT NULL DEFAULT 0,
  `compound_times` int(11) NOT NULL DEFAULT 0,
  `next_invest` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stakings`
--

CREATE TABLE `stakings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `days` int(11) NOT NULL,
  `interest_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staking_invests`
--

CREATE TABLE `staking_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staking_id` int(11) NOT NULL DEFAULT 0,
  `invest_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `interest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `end_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Running\r\n2: Completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_settings`
--

CREATE TABLE `time_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Disable\r\n1: Enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invest_id` int(11) NOT NULL DEFAULT 0,
  `staking_invest_id` int(10) NOT NULL DEFAULT 0,
  `pool_invest_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `wallet_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(40) DEFAULT NULL,
  `update_log` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `dial_code` varchar(40) DEFAULT NULL,
  `wallet` varchar(255) DEFAULT NULL,
  `message` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deposit_wallet` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `interest_wallet` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `total_invests` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `team_invests` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `user_ranking_id` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `kyc_data` text DEFAULT NULL,
  `kyc_rejection_reason` varchar(255) DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `provider` varchar(40) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `last_rank_update` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_rankings`
--

CREATE TABLE `user_rankings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `minimum_invest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `min_referral_invest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `min_referral` int(11) NOT NULL DEFAULT 0,
  `bonus` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT 0.00,
  `currency` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invests`
--
ALTER TABLE `invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pools`
--
ALTER TABLE `pools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pool_invests`
--
ALTER TABLE `pool_invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_tools`
--
ALTER TABLE `promotion_tools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_invests`
--
ALTER TABLE `schedule_invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stakings`
--
ALTER TABLE `stakings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staking_invests`
--
ALTER TABLE `staking_invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_settings`
--
ALTER TABLE `time_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rankings`
--
ALTER TABLE `user_rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invests`
--
ALTER TABLE `invests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pools`
--
ALTER TABLE `pools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pool_invests`
--
ALTER TABLE `pool_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_tools`
--
ALTER TABLE `promotion_tools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_invests`
--
ALTER TABLE `schedule_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stakings`
--
ALTER TABLE `stakings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staking_invests`
--
ALTER TABLE `staking_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_settings`
--
ALTER TABLE `time_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_rankings`
--
ALTER TABLE `user_rankings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


ALTER TABLE `deposits` CHANGE `admin_feedback` `admin_feedback` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;

INSERT INTO `gateways` (`form_id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(0, 129, 'bKash', 'BKash', '67e1432683b5a1742816038.png', 1, '{\"username\":{\"title\":\"Username\",\"global\":true,\"value\":\"01770618567\"},\"password\":{\"title\":\"Password\",\"global\":true,\"value\":\"D7DaC<*E*eG\"},\"app_key\":{\"title\":\"App Key\",\"global\":true,\"value\":\"0vWQuCRGiUX7EPVjQDr0EUAYtc\"},\"app_secret\":{\"title\":\"App Secret\",\"global\":true,\"value\":\"jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx\"}}', '{\"BDT\":\"BDT\"}', 0, NULL, NULL, NULL, '2025-03-16 03:58:31');

ALTER TABLE `general_settings` ADD `config_progress` TEXT NULL DEFAULT NULL AFTER `currency_format`;

UPDATE `gateways` SET `supported_currencies` = '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\",\"ARS\":\"ARS\",\"BRL\":\"BRL\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"MXN\":\"MXN\",\"PEN\":\"PEN\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"BOB\":\"BOB\"}' WHERE `gateways`.`id` = 36;


INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(NULL, 'HOME', '/', 'templates.hyip_dark.', '[\"plan\",\"referral\",\"about\",\"why_choose\",\"testimonial\",\"work_process\",\"top_investor\",\"faq\",\"blog\"]', NULL, 1, '2025-06-21 06:18:25', '2025-06-21 06:37:10'),
(NULL, 'Blog', 'blogs', 'templates.hyip_dark.', NULL, NULL, 1, '2025-06-21 06:18:25', '2025-06-21 06:18:25'),
(NULL, 'Contact', 'contact', 'templates.hyip_dark.', NULL, NULL, 1, '2025-06-21 06:18:25', '2025-06-21 06:18:25'),
(NULL, 'Plans', 'plans', 'templates.hyip_dark.', NULL, NULL, 1, '2025-06-21 06:18:25', '2025-06-21 06:18:25'),
(NULL, 'About', 'about', 'templates.hyip_dark.', '[\"referral\",\"about\",\"why_choose\",\"testimonial\",\"faq\"]', NULL, 0, '2025-06-21 06:18:25', '2025-06-23 00:18:17');

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(NULL, 'footer.content', '{\"has_image\":\"1\",\"description\":\"Hyiplab is your trusted platform for smart investments and high-yield returns. We provide a secure and user-friendly experience, helping you grow your wealth effortlessly.\",\"image\":\"6857a3a7f049d1750573991.png\"}', NULL, 'hyip_dark', '', '2025-06-22 00:33:11', '2025-06-22 00:33:13'),
(NULL, 'social_icon.element', '{\"icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', NULL, 'hyip_dark', '', '2025-06-22 00:36:00', '2025-06-22 00:36:00'),
(NULL, 'social_icon.element', '{\"icon\":\"<i class=\\\"fab fa-pinterest-p\\\"><\\/i>\",\"url\":\"https:\\/\\/www.pinterest.com\"}', NULL, 'hyip_dark', '', '2025-06-22 00:36:09', '2025-06-22 00:36:09'),
(NULL, 'social_icon.element', '{\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}', NULL, 'hyip_dark', '', '2025-06-22 00:36:16', '2025-06-22 00:36:16'),
(NULL, 'social_icon.element', '{\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/facebook.com\"}', NULL, 'hyip_dark', '', '2025-06-22 00:36:23', '2025-06-22 00:36:23'),
(NULL, 'policy_pages.element', '{\"title\":\"Terms and Service\",\"details\":\"<h3>Introduction<\\/h3><p>This Privacy Policy describes how we collects, uses, and discloses information, including personal information, in connection with your use of our website.<\\/p><br \\/><h3>Information We Collect<\\/h3><p>We collect two main types of information on the Website:<\\/p><ul><li><p><span style=\\\"font-weight:bolder;\\\">Personal Information:\\u00a0<\\/span>This includes data that can identify you as an individual, such as your name, email address, phone number, or mailing address. We only collect this information when you voluntarily provide it to us, like signing up for a newsletter, contacting us through a form, or making a purchase.<\\/p><\\/li><li><p><span style=\\\"font-weight:bolder;\\\">Non-Personal Information:\\u00a0<\\/span>This data cannot be used to identify you directly. It includes details like your browser type, device type, operating system, IP address, browsing activity, and usage statistics. We collect this information automatically through cookies and other tracking technologies.<\\/p><\\/li><\\/ul><br \\/><h3>How We Use Information<\\/h3><p>The information we collect allows us to:<\\/p><ul><li>Operate and maintain the Website effectively.<\\/li><li>Send you newsletters or marketing communications, but only with your consent.<\\/li><li>Respond to your inquiries and fulfill your requests.<\\/li><li>Improve the Website and your user experience.<\\/li><li>Personalize your experience on the Website based on your browsing habits.<\\/li><li>Analyze how the Website is used to improve our services.<\\/li><li>Comply with legal and regulatory requirements.<\\/li><\\/ul><br \\/><h3>Sharing of Information<\\/h3><p>We may share your information with trusted third-party service providers who assist us in operating the Website and delivering our services. These providers are obligated by contract to keep your information confidential and use it only for the specific purposes we disclose it for.<\\/p><p>We will never share your personal information with any third parties for marketing purposes without your explicit consent.<\\/p><br \\/><h3>Data Retention<\\/h3><p>We retain your personal information only for as long as necessary to fulfill the purposes it was collected for. We may retain it for longer periods only if required or permitted by law.<\\/p><br \\/><h3>Security Measures<\\/h3><p>We take reasonable precautions to protect your information from unauthorized access, disclosure, alteration, or destruction. However, complete security cannot be guaranteed for any website or internet transmission.<\\/p><br \\/><h3>Changes to this Privacy Policy<\\/h3><p>We may update this Privacy Policy periodically. We will notify you of any changes by posting the revised policy on the Website. We recommend reviewing this policy regularly to stay informed of any updates.<\\/p><p><span style=\\\"font-weight:bolder;\\\">Remember:<\\/span>\\u00a0This is a sample policy and may need adjustments to comply with specific laws and reflect your website\'s unique data practices. Consider consulting with a legal professional to ensure your policy is fully compliant.<\\/p>\"}', NULL, 'hyip_dark', 'terms-and-service', '2025-06-22 00:54:05', '2025-06-22 00:54:05'),
(NULL, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\"><h3>What information do we collect?<\\/h3><p class=\\\"font-18\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3>How do we protect your information?<\\/h3><p class=\\\"font-18\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3>Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3>Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3>Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\"><h3>How long we retain your information?<\\/h3><p class=\\\"font-18\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\"><h3>What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'hyip_dark', 'privacy-policy', '2025-06-22 00:54:18', '2025-06-22 00:54:18'),
(NULL, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"3015 Suit pagla road, Singapore\"}', NULL, 'hyip_dark', '', '2025-06-22 00:57:09', '2025-06-22 00:57:09'),
(NULL, 'contact.element', '{\"icon\":\"<i class=\\\"far fa-envelope-open\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"demo@example.com\"}', NULL, 'hyip_dark', '', '2025-06-22 00:57:22', '2025-06-22 00:57:22'),
(NULL, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+01234 5678 9000\"}', NULL, 'hyip_dark', '', '2025-06-22 00:57:30', '2025-06-22 00:57:30'),
(NULL, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Maximize Your Profits with Trusted HYIP Investments\",\"subheading\":\"HYIP INVESTMENT\",\"description\":\"Hyiplab is an investment company, whose team is working on making money\",\"counter_one_text\":\"Reflate Commission\",\"counter_one_number\":\"20\",\"counter_one_number_end\":\"100\",\"counter_one_text_suffix\":\"%\",\"counter_two_text\":\"Average Investment\",\"counter_two_number\":\"46\",\"counter_two_number_end\":\"50\",\"counter_two_text_suffix\":\"M\",\"background_image\":\"6857bf5d989a31750581085.png\",\"left_image\":\"6857bf5e39aff1750581086.png\",\"right_image\":\"6857bf5e614321750581086.png\",\"counter_one_icon\":\"68610002b9b351751187458.png\",\"counter_two_icon\":\"6857c7cf59a1f1750583247.png\"}', NULL, 'hyip_dark', '', '2025-06-22 01:34:37', '2025-06-29 02:57:38'),
(NULL, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"6857c9546f5e01750583636.png\"}', NULL, 'hyip_dark', '', '2025-06-22 03:13:56', '2025-06-22 03:13:56'),
(NULL, 'plan.content', '{\"heading\":\"Investment Plan\",\"subheading\":\"We offer best hyip investment plan for your more profit!\"}', NULL, 'hyip_dark', '', '2025-06-22 03:53:05', '2025-06-22 03:53:05'),
(NULL, 'referral.content', '{\"has_image\":\"1\",\"heading\":\"Referral\",\"heading_c\":\"Commission\",\"subheading\":\"We offer best hyip investment plan for your more profit!\",\"number\":\"15%\",\"button_text\":\"DETAILS\",\"button_url\":\"\\/\",\"counter_one_text\":\"Registered user\",\"counter_one_number\":\"20\",\"counter_one_number_end\":\"50\",\"counter_one_text_suffix\":\"k\",\"counter_two_text\":\"Total Investment\",\"counter_two_number\":\"46\",\"counter_two_number_end\":\"90\",\"counter_two_text_suffix\":\"m\",\"counter_one_icon\":\"6857dd9aa29ee1750588826.png\",\"counter_two_icon\":\"6857dd9ae20bf1750588826.png\"}', NULL, 'hyip_dark', '', '2025-06-22 04:25:43', '2025-06-22 04:53:59'),
(NULL, 'about.content', '{\"has_image\":\"1\",\"heading\":\"We offer best hyip investment plan for your more profit!\",\"subheading\":\"A High-Yield Investment Program (HYIP) is a fraudulent investment scheme that promises exceptionally high returns with little or no risk to investors. These programs are typically unregistered and operated by unlicensed individuals, often\",\"button_text\":\"KNOW ABOUT MORE\",\"button_url\":\"blogs\",\"right_side_heading\":\"3 Level of referral Commission\",\"image\":\"6857e19d8e5481750589853.png\"}', NULL, 'hyip_dark', '', '2025-06-22 04:57:33', '2025-06-22 05:06:12'),
(NULL, 'about.element', '{\"heading\":\"Level 01\",\"subheading\":\"From 0.5% to 0.9%\"}', NULL, 'hyip_dark', '', '2025-06-22 05:04:31', '2025-06-22 05:04:31'),
(NULL, 'about.element', '{\"heading\":\"Level 02\",\"subheading\":\"From 0.5% to 0.9%\"}', NULL, 'hyip_dark', '', '2025-06-22 05:04:39', '2025-06-22 05:04:39'),
(NULL, 'about.element', '{\"heading\":\"Level 03\",\"subheading\":\"From 0.5% to 0.9%\"}', NULL, 'hyip_dark', '', '2025-06-22 05:04:45', '2025-06-22 05:04:45'),
(NULL, 'why_choose.content', '{\"has_image\":\"1\",\"heading\":\"Why Should Choose Us\",\"subheading\":\"Hyiplab is an investment company, whose team is working on making money\",\"image\":\"6857ec75210561750592629.png\"}', NULL, 'hyip_dark', '', '2025-06-22 05:43:49', '2025-06-22 05:43:50'),
(NULL, 'why_choose.element', '{\"title\":\"Money Security\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:26', '2025-06-22 05:46:26'),
(NULL, 'why_choose.element', '{\"title\":\"First Withdraw\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:30', '2025-06-22 05:46:30'),
(NULL, 'why_choose.element', '{\"title\":\"Profitable Plan\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:35', '2025-06-22 05:46:35'),
(NULL, 'why_choose.element', '{\"title\":\"Automated Earn\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:39', '2025-06-22 05:46:39'),
(NULL, 'why_choose.element', '{\"title\":\"Profitable Plan\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:43', '2025-06-22 05:46:43'),
(NULL, 'why_choose.element', '{\"title\":\"SSL Certificate\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:46', '2025-06-22 05:46:46'),
(NULL, 'why_choose.element', '{\"title\":\"Money Security\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:50', '2025-06-22 05:46:50'),
(NULL, 'why_choose.element', '{\"title\":\"Fixed Rates\"}', NULL, 'hyip_dark', '', '2025-06-22 05:46:53', '2025-06-22 05:46:53'),
(NULL, 'why_choose.element', '{\"title\":\"Reliable Transfers\"}', NULL, 'hyip_dark', '', '2025-06-22 05:47:00', '2025-06-22 05:47:00'),
(NULL, 'testimonial.content', '{\"heading\":\"People What Say About Us\",\"subheading\":\"We offer best hyip investment plan for your more profit!\"}', NULL, 'hyip_dark', '', '2025-06-22 05:54:53', '2025-06-22 05:54:53'),
(NULL, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"David Doe\",\"designation\":\"User from England\",\"rating\":\"5\",\"quote\":\"Legit....and legit. Although the payment was processed manually, I have received my first payment within a very short time., I think nice for invest at this site.\",\"image\":\"6857ef39ce3bd1750593337.png\"}', NULL, 'hyip_dark', '', '2025-06-22 05:55:37', '2025-06-22 05:55:58'),
(NULL, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Geoffrey Crawford\",\"designation\":\"User From Nigeria\",\"rating\":\"4\",\"quote\":\"I have invested with this platform and gotten my money in my account. This is legit and safe. Great doing business with them.\",\"image\":\"6857ef654c3371750593381.png\"}', NULL, 'hyip_dark', '', '2025-06-22 05:56:21', '2025-06-22 05:56:21'),
(NULL, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Samantha Levy\",\"designation\":\"User From USA\",\"rating\":\"4.5\",\"quote\":\"Legit....and legit. Although the payment was processed manually, I have received my first payment within a very short time., I think nice for invest at this site.\",\"image\":\"6857ef79ee8471750593401.png\"}', NULL, 'hyip_dark', '', '2025-06-22 05:56:41', '2025-06-22 05:57:17'),
(NULL, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Melodie Ferguson\",\"designation\":\"User from India\",\"rating\":\"5\",\"quote\":\"I have invested with this platform and gotten my money in my account. This is legit and safe. Great doing business with them.\",\"image\":\"6857ef8c6c7701750593420.png\"}', NULL, 'hyip_dark', '', '2025-06-22 05:57:00', '2025-06-22 05:57:00'),
(NULL, 'work_process.content', '{\"has_image\":\"1\",\"heading\":\"Easy Work Process for Investment Money\",\"step_1\":\"Make Registration\",\"step_2\":\"Deposit Money\",\"step_3\":\"Choose Best Plan\",\"step_4\":\"Withdraw Money\",\"right_side_heading\":\"We Accept Payment Gateway\",\"background_image\":\"6857f53f0ae971750594879.png\",\"image\":\"6857f488b3aa01750594696.png\",\"right_side_image\":\"6857fdb08a2781750597040.png\"}', NULL, 'hyip_dark', '', '2025-06-22 06:14:33', '2025-06-22 06:57:20'),
(NULL, 'top_investor.content', '{\"heading\":\"Our Top Investor\",\"subheading\":\"We offer best hyip investment plan for your more profit!\"}', NULL, 'hyip_dark', '', '2025-06-22 07:27:07', '2025-06-22 07:27:07'),
(NULL, 'faq.element', '{\"question\":\"How much can I withdraw?\",\"answer\":\"You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions. You can withdraw the full amount of your account balance minus the funds that are used currently for supporting opened positions.\"}', NULL, 'hyip_dark', '', '2025-06-22 07:50:24', '2025-06-22 07:50:24'),
(NULL, 'faq.element', '{\"question\":\"How will I know that the withdrawal has been successful?\",\"answer\":\"You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you. You will get an automatic notification once we send the funds and you can always check your transactions or account balance. Your chosen payment system dictates how long it will take for the funds to reach you.\"}', NULL, 'hyip_dark', '', '2025-06-22 07:50:30', '2025-06-22 07:50:30'),
(NULL, 'faq.element', '{\"question\":\"I forgot my password, what should I do?\",\"answer\":\"Visit the password reset page, type in your email address and click the `Reset` button. Visit the password reset page, type in your email address and click the `Reset` button.\"}', NULL, 'hyip_dark', '', '2025-06-22 07:50:35', '2025-06-22 07:50:35'),
(NULL, 'faq.element', '{\"question\":\"How do I check my account balance?\",\"answer\":\"You can see this anytime on your accounts dashboard. You can see this anytime on your accounts dashboard.\"}', NULL, 'hyip_dark', '', '2025-06-22 07:50:41', '2025-06-22 07:50:41'),
(NULL, 'faq.element', '{\"question\":\"When can I deposit\\/withdraw from my Investment account?\",\"answer\":\"Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\\r\\n\\r\\n                                Deposit and withdrawal are available for at any time. Be sure, that your funds are not used in any ongoing trade before the withdrawal. The available amount is shown in your dashboard on the main page of Investing platform.\"}', NULL, 'hyip_dark', '', '2025-06-22 07:50:48', '2025-06-22 07:50:48'),
(NULL, 'faq.content', '{\"has_image\":\"1\",\"heading\":\"Some Question about Us\",\"subheading\":\"We offer best hyip investment plan for your more profit!\",\"background_image\":\"68580a68cb1ac1750600296.png\",\"image\":\"68580a68e63bc1750600296.png\"}', NULL, 'hyip_dark', '', '2025-06-22 07:51:00', '2025-06-22 07:51:37'),
(NULL, 'blog.content', '{\"heading\":\"Our Latest News\",\"subheading\":\"We offer best hyip investment plan for your more profit!\"}', NULL, 'hyip_dark', '', '2025-06-22 07:57:35', '2025-06-22 07:57:35'),
(NULL, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Top Strategies to Maximize Your Profits with HYIP Investments\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"image\":\"68580eaedb1871750601390.png\"}', NULL, 'hyip_dark', 'top-strategies-to-maximize-your-profits-with-hyip-investments', '2025-06-22 08:09:50', '2025-06-29 06:58:18'),
(NULL, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"How High-Yield Investment Programs (HYIP) Work: A Beginner\\u2019s Guide\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"image\":\"68580f0be79041750601483.png\"}', NULL, 'hyip_dark', 'how-high-yield-investment-programs-hyip-work-a-beginners-guide', '2025-06-22 08:11:23', '2025-06-29 06:57:25'),
(NULL, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Smart Investment Tips to Succeed in the HYIP Market\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"image\":\"68580f1b9ad6d1750601499.png\"}', NULL, 'hyip_dark', 'smart-investment-tips-to-succeed-in-the-hyip-market', '2025-06-22 08:11:39', '2025-06-29 06:58:31'),
(NULL, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Understanding HYIP Risks and Effective Ways to Manage Them\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"image\":\"68580f2a375a41750601514.png\"}', NULL, 'hyip_dark', 'understanding-hyip-risks-and-effective-ways-to-manage-them', '2025-06-22 08:11:54', '2025-06-29 06:58:36'),
(NULL, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Why HYIP Can Be a Profitable Choice for Investors\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"image\":\"68580f3ae89951750601530.png\"}', NULL, 'hyip_dark', 'why-hyip-can-be-a-profitable-choice-for-investors', '2025-06-22 08:12:10', '2025-06-29 06:58:46'),
(NULL, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"A Complete Guide to ROI and Earnings in HYIP Investments\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"image\":\"68580f52263441750601554.png\"}', NULL, 'hyip_dark', 'a-complete-guide-to-roi-and-earnings-in-hyip-investments', '2025-06-22 08:12:34', '2025-06-29 06:58:13'),
(NULL, 'contact.content', '{\"has_image\":\"1\",\"heading\":\"DROP YOUR MESSAGES\",\"subheading\":\"Contact With Us\",\"image\":\"6858f6d04f0081750660816.png\"}', NULL, 'hyip_dark', '', '2025-06-23 00:32:45', '2025-06-23 00:40:18'),
(NULL, 'login.content', '{\"has_image\":\"1\",\"heading\":\"Login Your Account\",\"subheading\":\"LOGIN ACCOUNT\",\"image\":\"685932fbdfc5c1750676219.png\"}', NULL, 'hyip_dark', '', '2025-06-23 04:56:59', '2025-06-23 04:57:01'),
(NULL, 'registration.content', '{\"has_image\":\"1\",\"heading\":\"Register New Account\",\"subheading\":\"New ACCOUNT\",\"image\":\"685a6598328321750754712.png\"}', NULL, 'hyip_dark', '', '2025-06-24 02:45:12', '2025-06-24 02:45:14'),
(NULL, 'user_breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"685a7e477e1271750761031.png\"}', NULL, 'hyip_dark', '', '2025-06-24 04:30:31', '2025-06-24 04:30:33'),
(NULL, 'user_support_email.content', '{\"email\":\"hello@example.com\"}', NULL, 'hyip_dark', '', '2025-06-24 06:10:26', '2025-06-24 06:10:26'),
(NULL, 'kyc.content', '{\"required\":\"Please submit the required KYC information to verify yourself. Otherwise, you couldn\'t make any withdrawal requests to the system.\",\"pending\":\"Your submitted KYC information is pending for admin approval. Please wait till that.\",\"reject\":\"Your KYC document has been rejected. Please resubmit the document for further review.\"}', NULL, 'hyip_dark', '', '2025-06-25 04:25:00', '2025-06-25 04:25:00'),
(NULL, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Registration unavailable: Please check back later for updates. Thank you for your patience.\",\"button_name\":\"Go Home\",\"button_url\":\"\\/\",\"image\":\"685d1c85b403b1750932613.png\"}', NULL, 'hyip_dark', '', '2025-06-26 04:10:00', '2025-06-26 04:10:28');






-- 5.7 update sql
UPDATE `gateways` SET `supported_currencies` = '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}' WHERE `gateways`.`alias` = 'Coinpayments';


DELETE FROM `gateway_currencies` WHERE `gateway_currencies`.`gateway_alias` = 'Coinpayments' AND `gateway_currencies`.`currency` = 'USDT';


DELETE FROM `deposits` WHERE `deposits`.`method_code` = 503 AND `deposits`.`method_currency` = 'USDT';

UPDATE `gateways` SET `supported_currencies` = '{\"USD\":\"USD\",\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"KES\":\"KES\",\"	\nZAR\":\"	\nZAR\",\"XOF\":\"XOF\"}' WHERE `gateways`.`id` = 7;

UPDATE `gateways` SET `supported_currencies` = '{\"USD\":\"USD\",\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"KES\":\"KES\",\"ZAR\":\"ZAR\",\"XOF\":\"XOF\"}' WHERE `gateways`.`code` = 107 AND `gateways`.`alias` = "Paystack";



INSERT INTO `frontends` (`data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
('blog.content', '{\"heading\":\"Our Latest Blog Post\",\"subheading\":\"Explore fresh articles about HYIP growth!\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:45:26', '2025-10-26 02:41:13'),
('blog.element', '{\"has_image\":[\"1\"],\"title\":\"A Complete Guide to ROI and Earnings in HYIP Investments\",\"description\":\"<p>Understanding ROI (Return on Investment) and earnings is essential for anyone investing in High-Yield Investment Programs (HYIPs). Proper knowledge helps investors plan better, manage risks, and maximize profits. This guide explains how ROI works in HYIP investments and how you can calculate and optimize your earnings.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">What is ROI in HYIP Investments?<\\/font><\\/h3> <p>ROI, or Return on Investment, measures the profit generated relative to the amount invested. In HYIP programs, ROI is often expressed as a percentage over a specific period, such as daily, weekly, or monthly returns. Calculating ROI helps investors understand the potential profitability of their investment.<\\/p><p><br \\/><\\/p> <h4>How to Calculate ROI<\\/h4> <p>ROI can be calculated using the formula:<br \\/> <em>ROI (%) = (Profit \\/ Investment Amount) \\u00d7 100<\\/em><\\/p> <p>For example, if you invest $100 in a HYIP plan and earn $10 in profits, your ROI would be 10%. Understanding this helps you compare different plans and choose the most profitable options.<\\/p><p><br \\/><\\/p> <h4>Types of Earnings in HYIPs<\\/h4> <p>HYIP earnings can come in various forms: <\\/p> <ul> <li><strong>Daily or Weekly Returns:<\\/strong> Fixed or variable profits based on the investment plan.<\\/li> <li><strong>Referral Bonuses:<\\/strong> Extra income earned by inviting new investors to the platform.<\\/li> <li><strong>Compounded Earnings:<\\/strong> Profits reinvested to generate additional returns over time.<\\/li> <\\/ul> <p>Combining these earning streams can significantly increase overall profitability.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Strategies to Maximize ROI<\\/font><\\/h3> <h4>Diversify Your Investments<\\/h4> <p>Spreading your capital across multiple HYIP plans reduces risk and increases the chance of consistent ROI. Different plans have different durations and returns, so diversification balances potential losses and gains.<\\/p><p><br \\/><\\/p> <h4>Choose the Right Investment Plans<\\/h4> <p>Select plans that match your risk tolerance and financial goals. Short-term high-return plans can boost profits quickly but are riskier, while long-term plans offer more stability. A balanced approach helps maximize ROI while managing risks.<\\/p><p><br \\/><\\/p> <h4>Reinvest Your Profits<\\/h4> <p>Reinvesting earnings can significantly increase your overall ROI through compounding. However, ensure that you retain a portion of your profits to safeguard against platform risks or unforeseen losses.<\\/p><p><br \\/><\\/p> <h4>Track and Monitor Your Earnings<\\/h4> <p>Regularly monitoring your HYIP investments allows you to make timely adjustments. Tracking ROI helps identify underperforming plans and optimize your investment strategy for better earnings.<\\/p><p><br \\/><\\/p> <h4>Be Cautious of Overpromised Returns<\\/h4> <p>While high ROI is attractive, extremely high promises often indicate high risk or scams. Prioritize platforms with verified results and moderate, consistent returns to protect your investment while still earning profits.<\\/p>\",\"image\":\"68fcb8882edb01761392776.png\"}', NULL, 'crypto_hyip', 'a-complete-guide-to-roi-and-earnings-in-hyip-investments', '2025-10-25 05:46:16', '2025-10-26 03:18:36'),
('blog.element', '{\"has_image\":[\"1\"],\"title\":\"Why HYIP Can Be a Profitable Choice for Investors\",\"description\":\"<p>High-Yield Investment Programs (HYIPs) are often seen as high-risk ventures, but they can also be highly profitable when approached carefully. Understanding why HYIPs can deliver impressive returns helps investors make informed decisions. This guide explores the main reasons HYIPs can be a profitable choice for investors.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Attractive Returns in Short Periods<\\/font><\\/h3> <p>HYIPs typically offer much higher returns compared to traditional investment options like savings accounts, stocks, or bonds. Some programs promise daily, weekly, or monthly profits that can significantly increase your capital in a short time. For investors seeking fast growth, HYIPs can be an appealing option.<\\/p><p><br \\/><\\/p> <h4>Variety of Investment Plans<\\/h4> <p>HYIP platforms usually provide multiple investment plans with different durations and rates of return. Investors can choose plans based on their risk tolerance and financial goals. This flexibility allows for both short-term high-yield gains and moderate long-term profits.<\\/p><p><br \\/><\\/p> <h4>Compounding Opportunities<\\/h4> <p>Many HYIPs allow reinvestment of profits, which can create compounding growth. By reinvesting earnings, investors can gradually increase their returns over time, making their capital work harder and maximizing profit potential.<\\/p><p><br \\/><\\/p> <h4>Accessibility and Low Entry Barriers<\\/h4> <p>HYIPs often have low minimum investment requirements, making them accessible to a wide range of investors. Even beginners can start with small amounts and gradually scale their investments as they gain confidence and experience.<\\/p><p><br \\/><\\/p> <h4>Potential Passive Income<\\/h4> <p>With the right strategy, HYIPs can provide a source of passive income. Investors who carefully choose plans and reinvest profits can generate regular earnings without active trading, allowing money to grow steadily over time.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Factors That Influence Profitability<\\/font><\\/h3> <h4>Platform Reliability<\\/h4> <p>Profitable returns depend on the trustworthiness of the HYIP platform. Platforms with a solid reputation, verified payment proofs, and positive user feedback increase the likelihood of sustained profits.<\\/p><p><br \\/><\\/p> <h4>Smart Investment Strategy<\\/h4> <p>Maximizing profits requires strategy. Diversifying investments, starting small, and setting realistic goals all contribute to better outcomes. Combining multiple plans and monitoring performance helps investors achieve consistent gains.<\\/p><p><br \\/><\\/p> <h4>Market Timing<\\/h4> <p>HYIP returns can sometimes depend on underlying markets or new investor inflows. Being aware of market trends and platform activity can help investors make timely decisions, improving profitability while reducing risk exposure.<\\/p>\",\"image\":\"68fcb8c23277d1761392834.png\"}', NULL, 'crypto_hyip', 'why-hyip-can-be-a-profitable-choice-for-investors', '2025-10-25 05:47:14', '2025-10-26 03:17:51'),
('blog.element', '{\"has_image\":[\"1\"],\"title\":\"Understanding HYIP Risks and Effective Ways to Manage Them\",\"description\":\"<p>High-Yield Investment Programs (HYIPs) can offer attractive returns, but they are also associated with significant risks. Understanding these risks and knowing how to manage them is crucial for anyone looking to invest safely. This guide will help you identify common HYIP risks and provide strategies to minimize potential losses.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Common Risks in HYIP Investments<\\/font><\\/h3> <p>HYIPs are high-risk investment platforms. Some of the most common risks include scams, platform closure, and unsustainable high returns. Many HYIPs operate like Ponzi schemes, relying on new investors\\u2019 deposits to pay earlier participants, which makes them vulnerable if investor inflow slows down.<\\/p><p><br \\/><\\/p> <h4>Fraud and Scam Risks<\\/h4> <p>Some HYIPs are outright scams designed to disappear with investors\\u2019 money. To reduce this risk, always research the platform thoroughly. Check reviews, payment proofs, and user feedback. Avoid platforms with no clear transparency or questionable history.<\\/p><p><br \\/><\\/p> <h4>Market Volatility<\\/h4> <p>HYIP returns often depend on the cryptocurrency or investment markets. Market fluctuations can impact the platform\\u2019s ability to pay promised returns. Be prepared for changes in payouts and understand that high returns come with higher volatility.<\\/p><p><br \\/><\\/p> <h4>Platform and Technical Risks<\\/h4> <p>Technical issues such as server downtime, withdrawal failures, or hacking incidents can affect your investments. Ensure the platform has proper security measures, backup systems, and reliable customer support to handle such events.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Effective Ways to Manage HYIP Risks<\\/font><\\/h3> <h4>Diversify Your Investments<\\/h4> <p>Spread your capital across multiple HYIP programs or plans instead of investing everything in one. Diversification reduces the impact if a single plan fails, helping you maintain steady returns and protect your principal.<\\/p><p><br \\/><\\/p> <h4>Start Small and Scale Gradually<\\/h4> <p>Investing small amounts initially allows you to test the platform and gain experience without risking significant funds. Once you feel confident about a plan\\u2019s reliability, you can gradually increase your investment.<\\/p><p><br \\/><\\/p> <h4>Set Profit and Loss Limits<\\/h4> <p>Decide in advance the maximum amount you are willing to invest and the profit targets you want to achieve. Similarly, set limits on potential losses to avoid emotional decisions during market fluctuations.<\\/p><p><br \\/><\\/p> <h4>Stay Informed<\\/h4> <p>Regularly monitor HYIP platforms, market trends, and community updates. Staying informed helps you identify risks early, make adjustments, and avoid platforms showing warning signs of instability.<\\/p><p><br \\/><\\/p> <h4>Withdraw Profits Regularly<\\/h4> <p>Don\\u2019t leave all your profits in the HYIP program. Regular withdrawals help secure your earnings and reduce the risk of losing accumulated profits if the platform suddenly fails.<\\/p>\",\"image\":\"68fcb8f1e3d141761392881.png\"}', NULL, 'crypto_hyip', 'understanding-hyip-risks-and-effective-ways-to-manage-them', '2025-10-25 05:48:01', '2025-10-26 03:16:18'),
('blog.element', '{\"has_image\":[\"1\"],\"title\":\"Smart Investment Tips to Succeed in the HYIP Market\",\"description\":\"<p>The HYIP (High-Yield Investment Program) market offers the potential for high returns, but it also comes with high risks. Success in this space requires knowledge, strategy, and careful planning. Here are some smart investment tips to help you navigate the HYIP market and maximize your profits safely.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Do Thorough Research<\\/font><\\/h3> <p>Before investing in any HYIP platform, research is crucial. Check the platform\\u2019s history, user reviews, and reputation in the investment community. Verify whether the platform provides transparency, such as payment proofs and clear contact information. Knowledge is your first line of defense against scams.<\\/p><p><br \\/><\\/p> <h4>Start with Small Investments<\\/h4> <p>Even if a platform looks promising, begin with small amounts. This allows you to test the platform, understand its workings, and minimize potential losses. Starting small also gives you the flexibility to diversify across multiple HYIP plans.<\\/p><p><br \\/><\\/p> <h4>Diversify Your Investments<\\/h4> <p>Putting all your money into one plan is risky. Instead, spread your investments across several programs with varying returns and durations. Diversification reduces the impact of a single plan underperforming and improves your chances of steady profits.<\\/p><p><br \\/><\\/p> <h4>Set Clear Profit Goals<\\/h4> <p>Establish realistic profit goals before investing. Avoid chasing overly high returns that seem too good to be true. Clear goals help maintain discipline, prevent emotional decisions, and keep your investment strategy on track.<\\/p><p><br \\/><\\/p> <h4>Reinvest Wisely<\\/h4> <p>Reinvesting your profits can accelerate growth, but do it carefully. Consider keeping a portion of your earnings aside while reinvesting the rest. This strategy protects your capital while still taking advantage of compounding profits.<\\/p><p><br \\/><\\/p> <h4>Monitor Your Investments Regularly<\\/h4> <p>HYIP programs can change rapidly, and market conditions can fluctuate. Keep an eye on your investments to react promptly if a plan starts underperforming. Monitoring ensures you can withdraw profits or adjust strategies in time to avoid losses.<\\/p><p><br \\/><\\/p> <h4>Avoid High-Risk Plans Blindly<\\/h4> <p>Plans offering extremely high daily returns may look tempting, but they carry significant risk. Focus on plans with moderate, consistent returns and avoid putting large amounts into risky schemes. Balance is key to long-term success.<\\/p><p><br \\/><\\/p> <h4>Keep Learning and Staying Updated<\\/h4> <p>The HYIP and crypto markets are constantly evolving. Stay informed about new investment trends, security measures, and platform updates. The more knowledge you have, the better decisions you can make to increase profits and reduce risks.<\\/p><p><br \\/><\\/p> <h4>Conclusion<\\/h4> <p>Succeeding in the HYIP market is about smart planning, research, and disciplined investing. Start small, diversify your portfolio, set realistic goals, monitor your investments, and keep learning. By following these tips, you can navigate the HYIP market safely while maximizing your earning potential.<\\/p>\",\"image\":\"68fcb91b3a16e1761392923.png\"}', NULL, 'crypto_hyip', 'smart-investment-tips-to-succeed-in-the-hyip-market', '2025-10-25 05:48:43', '2025-10-26 03:15:23'),
('blog.element', '{\"has_image\":[\"1\"],\"title\":\"How High-Yield Investment Programs (HYIP) Work: A Beginner\\u2019s Guide\",\"description\":\"<p>High-Yield Investment Programs (HYIPs) are investment platforms promising unusually high returns in a short period. While the profits can be tempting, understanding how HYIPs work is crucial before investing. This guide will help beginners understand the basic mechanics of HYIP investments and how to approach them safely.<\\/p><p><br \\/><\\/p> <h3><font size=\\\"5\\\">Understanding HYIP Basics<\\/font><\\/h3> <p>HYIPs operate by pooling money from investors and promising high returns. The profits are usually generated from new investors\\u2019 deposits or underlying investment activities. These programs often advertise daily, weekly, or monthly returns that are much higher than traditional investment avenues.<\\/p><p><br \\/><\\/p> <h4>How Returns Are Calculated<\\/h4> <p>HYIP returns are typically calculated based on the investment plan you choose. Some plans offer fixed daily percentages, while others provide variable returns depending on the platform\\u2019s performance. Understanding the calculation helps investors estimate potential profits and risks.<\\/p><p><br \\/><\\/p> <h4>The Role of New Investors<\\/h4> <p>Many HYIPs rely on funds from new investors to pay existing participants. This is why the platform\\u2019s growth and continuous inflow of new capital are crucial for sustaining payouts. It\\u2019s important to be cautious and invest only what you can afford to lose.<\\/p><p><br \\/><\\/p> <h4>Investment Plans and Durations<\\/h4> <p>HYIP platforms usually offer multiple plans with different durations and returns. Short-term plans might offer higher daily returns but are riskier, while long-term plans provide more stable but moderate profits. Choosing the right plan depends on your risk tolerance and investment goals.<\\/p><p><br \\/><\\/p> <h4>Security and Transparency<\\/h4> <p>Before investing, check the platform\\u2019s transparency. Look for information about company registration, team members, and payment proofs. A legitimate HYIP should provide clear details about how investments are managed.<\\/p><p><br \\/><\\/p> <h4>Risks Associated with HYIPs<\\/h4> <p>HYIPs are high-risk investments. Many programs fail or turn out to be scams. Investors should be aware of potential losses and avoid putting in money they cannot afford to lose. Diversifying your investments and starting small can help manage these risks.<\\/p><p><br \\/><\\/p> <h4>Tips for Beginners<\\/h4> <p>1. Research the platform thoroughly before investing.<br \\/> 2. Start with small amounts to understand how the program works.<br \\/> 3. Keep track of your investments and profits regularly.<br \\/> 4. Avoid chasing extremely high returns without understanding the risks.<\\/p>\",\"image\":\"68fcb94d0380a1761392973.png\"}', NULL, 'crypto_hyip', 'how-high-yield-investment-programs-hyip-work-a-beginners-guide', '2025-10-25 05:49:33', '2025-10-26 03:14:32'),
('blog.element', '{\"has_image\":[\"1\"],\"title\":\"Top Strategies to Maximize Your Profits with HYIP Investments\",\"description\":\"<p>High Yield Investment Programs (HYIPs) can be an exciting way to grow your money, but they come with high risks. To make the most out of your investment and minimize potential losses, it\\u2019s important to follow proven strategies. Here are the top strategies to help you maximize your profits.<\\/p><p><br \\/><\\/p><h3><font size=\\\"5\\\">Start with Small Investments<\\/font><\\/h3>\\r\\n<p>When you are new to HYIPs, it\\u2019s best to start with a small amount of money. This approach allows you to learn how the platform works without risking your entire capital. Small investments also give you flexibility to experiment with different plans and understand which ones generate the best returns.<\\/p><p><br \\/><\\/p><h4>Diversify Your Investments<\\/h4>\\r\\n<p>Putting all your money into a single HYIP plan can be risky. Instead, spread your investments across multiple programs or plans. Diversification helps reduce risk because even if one plan underperforms, others can compensate with their returns. Think of it as not putting all your eggs in one basket.<\\/p><p><br \\/><\\/p><h4>Study the HYIP Platform<\\/h4>\\r\\n<p>Before investing, research the HYIP platform thoroughly. Check its history, user reviews, and reputation in the investment community. A legitimate platform with a proven track record reduces the chance of scams and increases the probability of earning steady profits.<\\/p><p><br \\/><\\/p><h4>Set Realistic Profit Goals<\\/h4>\\r\\n<p>It\\u2019s important to set achievable targets for your investments. Don\\u2019t expect overnight wealth; instead, focus on steady growth over time. Setting realistic goals helps you make smarter decisions, avoid emotional trading, and stay disciplined.<\\/p><p><br \\/><\\/p><h4>Reinvest Profits Wisely<\\/h4>\\r\\n<p>One of the best ways to grow your capital is to reinvest your profits. However, do this wisely\\u2014reinvesting everything might increase your risk. Consider keeping a portion of your profits aside while reinvesting the rest to maximize your long-term gains.<\\/p><p><br \\/><\\/p><h4>Monitor Your Investments Regularly<\\/h4>\\r\\n<p>HYIP plans can change, and market conditions fluctuate. Regularly monitoring your investments allows you to react quickly if a plan starts underperforming. Keeping an eye on your portfolio helps you withdraw profits when needed and adjust your strategy accordingly.<\\/p><p><br \\/><\\/p><h4>Avoid Over-Reliance on High Returns<\\/h4>\\r\\n<p>High returns often come with high risk. While it may be tempting to choose plans promising 200%\\u2013300% profits, they are more likely to be risky or even scams. Balance your portfolio with plans offering moderate but stable returns for safer long-term growth.<\\/p><p><br \\/><\\/p><h4>Keep Learning and Updating Your Knowledge<\\/h4>\\r\\n<p>The HYIP and cryptocurrency markets evolve quickly. Stay updated with new investment opportunities, strategies, and market trends. The more informed you are, the better decisions you can make to maximize your profits.<\\/p>\",\"image\":\"68fcb9791e4c01761393017.png\"}', NULL, 'crypto_hyip', 'top-strategies-to-maximize-your-profits-with-hyip-investments', '2025-10-25 05:50:17', '2025-10-26 03:12:18'),
('breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"68fcb9b9306341761393081.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:51:21', '2025-10-25 05:51:21'),
('calculator.content', '{\"heading\":\"Investment Returns Calculator\",\"subheading\":\"Easily estimate your potential investment growth over time with our Investment Returns Calculator\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:51:42', '2025-10-25 05:51:42'),
('contact.content', '{\"has_image\":\"1\",\"heading\":\"Drop your messages\",\"subheading\":\"Get in touch with us\",\"image\":\"68fcba0911d2b1761393161.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:52:41', '2025-10-25 05:52:41'),
('contact.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+01234 5678 9000\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:53:02', '2025-10-25 05:53:02'),
('contact.element', '{\"icon\":\"<i class=\\\"lar la-envelope\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"demo@example.com\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:53:28', '2025-10-25 05:53:28'),
('contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"3015 Suit pagla road, Singapore\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:53:54', '2025-10-25 05:53:54'),
('cta.content', '{\"has_image\":\"1\",\"heading\":\"Referral Commission\",\"subheading\":\"Earn commission for every successful referral!\",\"count_digit\":\"0.1%\",\"count_text\":\"Promotional tool\",\"button_text\":\"REFERRALS\",\"button_url\":\"\\/user\\/referrals\",\"image\":\"68fcbaa2ac6fd1761393314.png\",\"shape\":\"68fcbaa2c99441761393314.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:55:14', '2025-10-26 04:04:29'),
('faq.content', '{\"has_image\":\"1\",\"heading\":\"Frequently Asked Question\",\"subheading\":\"Your top HYIP questions answered here!\",\"image\":\"68fcbabd0f39f1761393341.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:55:41', '2025-10-26 02:40:17'),
('faq.element', '{\"question\":\"What is a trading bot, and should I use one?\",\"answer\":\"A trading bot is software that automatically buys and sells cryptocurrencies based on pre-set rules or market signals. It can save time and execute trades faster than humans. However, while bots can help, they carry risks and don\\u2019t guarantee profits. Use them cautiously and start with small amounts.\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:55:53', '2025-10-26 02:56:31'),
('faq.element', '{\"question\":\"Is crypto trading legal in my country?\",\"answer\":\"The legality of cryptocurrency trading depends on your country\\u2019s regulations. Some countries fully allow it, others have restrictions, and a few have banned it entirely. Always check your local laws before trading to ensure compliance.\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:56:02', '2025-10-26 02:56:11'),
('faq.element', '{\"question\":\"How do I start trading?\",\"answer\":\"First, create an account on a cryptocurrency or HYIP platform. Then, deposit funds, select a trading plan or cryptocurrency, and begin buying and selling based on market trends. Start with small amounts to learn before investing more.\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:56:12', '2025-10-26 02:55:48'),
('faq.element', '{\"question\":\"What is cryptocurrency trading?\",\"answer\":\"Cryptocurrency trading is the process of buying and selling digital currencies, like Bitcoin, Ethereum, and others, with the aim of making a profit. Traders can exchange cryptocurrencies for other digital coins or for traditional currency, taking advantage of price fluctuations in the market.\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:56:23', '2025-10-26 02:55:09'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Announcements & Market Updates\",\"description\":\"Sometimes includes market news to appear legitimate\",\"image\":\"68fcbb0ba4be31761393419.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:56:59', '2025-10-25 05:56:59'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Referral & Affiliate Program\",\"description\":\"Multi-level commission system to incentivize user referrals\",\"image\":\"68fcbb1c841ac1761393436.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:57:16', '2025-10-25 05:57:16'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Auto-Trading Bots or Signals\",\"description\":\"Automated trading using pre-programmed strategies or signal\",\"image\":\"68fcbb2bd1ca11761393451.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:57:31', '2025-10-25 05:57:31'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Investment Plans \\/ Packages\",\"description\":\"Option to reinvest earnings automatically (compounding feature)\",\"image\":\"68fcbb4a529491761393482.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:58:02', '2025-10-25 05:58:02'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Dashboard & Earnings Tracker\",\"description\":\"Visual stats: active investments, total earned, pending withdrawals\",\"image\":\"68fcbb6062d2e1761393504.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:58:24', '2025-10-25 05:58:24'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Instant or Scheduled Payouts\",\"description\":\"Option to reinvest earnings automatically (compounding feature)\",\"image\":\"68fcbb76efff31761393526.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:58:46', '2025-10-25 05:58:47'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Real-Time Trading & ROI Calculation\",\"description\":\"Alculates potential profit based on current ROI percentages\",\"image\":\"68fcbb8a0208a1761393546.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:59:06', '2025-10-25 05:59:06'),
('feature.element', '{\"has_image\":\"1\",\"title\":\"Secure Wallet Integration\",\"description\":\"Connects with crypto wallets (e.g., MetaMask, Trust Wallet)\",\"image\":\"68fcbb9b70c961761393563.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 05:59:23', '2025-10-25 05:59:23'),
('footer.content', '{\"has_image\":\"1\",\"description\":\"Hyiplab is your trusted platform for smart investments and high-yield returns. We provide a secure and user-friendly experience, helping you grow your wealth effortlessly.\",\"left_image\":\"68fcbbc8d6a931761393608.png\",\"right_image\":\"68fcbbc8dedb61761393608.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:00:08', '2025-10-25 06:00:09'),
('how_it_work.content', '{\"heading\":\"How It Works\",\"subheading\":\"A simple step process explaining how user can sign up account form withdraw money\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:00:47', '2025-10-25 06:00:47'),
('how_it_work.element', '{\"title\":\"Make Registration\",\"description\":\"Create new account for hyip investment\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:01:05', '2025-10-25 06:01:05'),
('how_it_work.element', '{\"title\":\"Deposit Money\",\"description\":\"Securely deposit money for HYIP plans\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:01:15', '2025-10-26 01:26:15'),
('how_it_work.element', '{\"title\":\"Choose Best Plan\",\"description\":\"Pick a plan that fits your investment goals\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:01:37', '2025-10-26 01:26:51'),
('how_it_work.element', '{\"title\":\"Withdraw Money\",\"description\":\"Withdraw profits from your investment\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:01:45', '2025-10-26 01:27:33'),
('kyc.content', '{\"required\":\"Complete KYC to unlock the full potential of our platform! KYC helps us verify your identity and keep things secure. It is quick and easy just follow the on-screen instructions. Get started with KYC verification now!\",\"pending\":\"Your KYC verification is currently pending and under review. This process typically takes 24-48 hours. Please ensure your submitted documents are clear and match the details provided during registration. You will receive a notification once verification is complete. Thank you for your patience.\",\"reject\":\"We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards.\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:02:05', '2025-10-25 06:02:05'),
('latest_transaction.content', '{\"heading\":\"Our Latest Transaction\",\"subheading\":\"Here is the log of the most recent transactions including withdraw and deposit made by our users.\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:02:31', '2025-10-25 06:02:31'),
('login.content', '{\"has_image\":\"1\",\"heading\":\"Login Your Account\",\"image\":\"68fcbc6d96ad91761393773.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:02:53', '2025-10-25 06:02:53'),
('plan.content', '{\"heading\":\"Investment Plan\",\"subheading\":\"We offer best high yield investment plan for your more profit!\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:03:04', '2025-10-25 06:03:04'),
('policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\">\\r\\n    <h3>What information do we collect?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We gather data from you when you\\r\\n        register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the\\r\\n        point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter\\r\\n        your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3>How do we protect your information?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">All provided delicate\\/credit data is\\r\\n        sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials,\\r\\n        and so on) won\'t be put away on our workers.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3>Do we disclose any information to outside\\r\\n        parties?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We don\'t sell, exchange, or in any case\\r\\n        move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in\\r\\n        working our site, leading our business, or adjusting you, since those gatherings consent to keep this data\\r\\n        private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our\\r\\n        site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3>Children\'s Online Privacy Protection Act\\r\\n        Compliance<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We are consistent with the prerequisites\\r\\n        of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old.\\r\\n        Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of\\r\\n        age or more established.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3>Changes to our Privacy Policy<\\/h3>\\r\\n    <p class=\\\"font-18\\\">If we decide to change our privacy\\r\\n        policy, we will post those changes on this page.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3>How long we retain your information?<\\/h3>\\r\\n    <p class=\\\"font-18\\\">At the point when you register for our\\r\\n        site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw\\r\\n        yourself (subject to laws and guidelines).<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"mb-5\\\">\\r\\n    <h3>What we don\\u2019t do with your data<\\/h3>\\r\\n    <p class=\\\"font-18\\\">We don\'t and will never share, unveil,\\r\\n        sell, or in any case give your information to different organizations for the promoting of their items or\\r\\n        administrations.<\\/p>\\r\\n<\\/div>\"}', NULL, 'crypto_hyip', 'privacy-policy', '2025-10-25 06:03:28', '2025-10-25 06:03:28'),
('policy_pages.element', '{\"title\":\"Terms and Service\",\"details\":\"<h3>Introduction<\\/h3>\\r\\n        <p>\\r\\n            This Privacy Policy describes how we collects, uses, and discloses information, including personal information, in connection with your use of our website.\\r\\n        <\\/p>\\r\\n        <br \\/>\\r\\n        <h3>Information We Collect<\\/h3>\\r\\n        <p>We collect two main types of information on the Website:<\\/p>\\r\\n        <ul>\\r\\n            <li><p><strong>Personal Information: <\\/strong>This includes data that can identify you as an individual, such as your name, email address, phone number, or mailing address. We only collect this information when you voluntarily provide it to us, like signing up for a newsletter, contacting us through a form, or making a purchase.<\\/p><\\/li>\\r\\n            <li><p><strong>Non-Personal Information: <\\/strong>This data cannot be used to identify you directly. It includes details like your browser type, device type, operating system, IP address, browsing activity, and usage statistics. We collect this information automatically through cookies and other tracking technologies.<\\/p><\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h3>How We Use Information<\\/h3>\\r\\n        <p>The information we collect allows us to:<\\/p>\\r\\n        <ul>\\r\\n            <li>Operate and maintain the Website effectively.<\\/li>\\r\\n            <li>Send you newsletters or marketing communications, but only with your consent.<\\/li>\\r\\n            <li>Respond to your inquiries and fulfill your requests.<\\/li>\\r\\n            <li>Improve the Website and your user experience.<\\/li>\\r\\n            <li>Personalize your experience on the Website based on your browsing habits.<\\/li>\\r\\n            <li>Analyze how the Website is used to improve our services.<\\/li>\\r\\n            <li>Comply with legal and regulatory requirements.<\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h3>Sharing of Information<\\/h3>\\r\\n        <p>We may share your information with trusted third-party service providers who assist us in operating the Website and delivering our services. These providers are obligated by contract to keep your information confidential and use it only for the specific purposes we disclose it for.<\\/p>\\r\\n        <p>We will never share your personal information with any third parties for marketing purposes without your explicit consent.<\\/p>\\r\\n        <br \\/>\\r\\n        <h3>Data Retention<\\/h3>\\r\\n        <p>We retain your personal information only for as long as necessary to fulfill the purposes it was collected for. We may retain it for longer periods only if required or permitted by law.<\\/p>\\r\\n        <br \\/>\\r\\n        <h3>Security Measures<\\/h3>\\r\\n        <p>We take reasonable precautions to protect your information from unauthorized access, disclosure, alteration, or destruction. However, complete security cannot be guaranteed for any website or internet transmission.<\\/p>\\r\\n        <br \\/>\\r\\n        <h3>Changes to this Privacy Policy<\\/h3>\\r\\n        <p>We may update this Privacy Policy periodically. We will notify you of any changes by posting the revised policy on the Website. We recommend reviewing this policy regularly to stay informed of any updates.<\\/p>\\r\\n        <p><strong>Remember:<\\/strong>  This is a sample policy and may need adjustments to comply with specific laws and reflect your website\'s unique data practices. Consider consulting with a legal professional to ensure your policy is fully compliant.<\\/p>\"}', NULL, 'crypto_hyip', 'terms-and-service', '2025-10-25 06:03:53', '2025-10-25 06:03:53'),
('ranking.content', '{\"heading\":\"User Ranking\",\"subheading\":\"We offer best hyip investment plan for your more profit!\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:04:08', '2025-10-25 06:04:08'),
('register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Registration unavailable: Please check back later for updates. Thank you for your patience.\",\"button_name\":\"Go Home\",\"button_url\":\"\\/\",\"image\":\"68fcbcd52f82f1761393877.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:04:37', '2025-10-25 06:04:37'),
('registration.content', '{\"has_image\":\"1\",\"heading\":\"Register New Account\",\"image\":\"68fcbced59a951761393901.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:05:01', '2025-10-25 06:05:01'),
('social_icon.element', '{\"icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:05:20', '2025-10-25 06:07:19'),
('social_icon.element', '{\"icon\":\"<i class=\\\"fab fa-pinterest-p\\\"><\\/i>\",\"url\":\"https:\\/\\/www.pinterest.com\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:05:31', '2025-10-25 06:07:06'),
('social_icon.element', '{\"icon\":\"<i class=\\\"fa-brands fa-x-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:05:41', '2025-10-26 03:21:08'),
('social_icon.element', '{\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/facebook.com\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:05:55', '2025-10-25 06:06:38'),
('testimonial.content', '{\"heading\":\"What Say Happy Investor\",\"subheading\":\"Satisfied investors sharing their profitable journey!\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:07:51', '2025-10-26 01:36:21'),
('testimonial.element', '{\"has_image\":\"1\",\"name\":\"Jenny Wilson\",\"designation\":\"Form Italy\",\"rating\":\"4.5\",\"quote\":\"Invested $100 and received 3 payouts as promised. So far, everything is smooth. I reinvested the profit to test higher returns. Hoping the program stays stable!\\\"\",\"image\":\"68fcbdc1123e01761394113.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:08:33', '2025-10-25 06:08:33'),
('testimonial.element', '{\"has_image\":\"1\",\"name\":\"Martin Hook\",\"designation\":\"From USA\",\"rating\":\"4.5\",\"quote\":\"Invested $100 and received 3 payouts as promised. So far, everything is smooth. I reinvested the profit to test highe returns. Hoping the program stays stable!\\\"\",\"image\":\"68fcbddcaa3711761394140.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:09:00', '2025-10-25 06:09:00'),
('testimonial.element', '{\"has_image\":\"1\",\"name\":\"Sophia Romano\",\"designation\":\"From Italy\",\"rating\":\"5\",\"quote\":\"Invested $100 and received 3 payouts as promised. So far, everything is smooth. I reinvested the profit to test higher returns. Hoping the program stays stable!\\\"\",\"image\":\"68fcbdf1238611761394161.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:09:21', '2025-10-25 06:09:21'),
('testimonial.element', '{\"has_image\":\"1\",\"name\":\"Martin Hook\",\"designation\":\"From USA\",\"rating\":\"4.5\",\"quote\":\"Invested $100 and received 3 payouts as promised. So far, everything is smooth. I reinvested the profit to test higher returns. Hoping the program stays stable!\\\"\",\"image\":\"68fcbe1214d331761394194.jpg\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:09:54', '2025-10-25 06:09:54'),
('top_investor.content', '{\"heading\":\"Our Top Investor\",\"subheading\":\"Top performers in HYIP investment success!\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:10:13', '2025-10-26 02:32:03'),
('why_choose.content', '{\"has_image\":\"1\",\"heading\":\"The Future of Profitable Crypto Trading Starts\",\"subheading\":\"Guiding your crypto journey with expertise. Our team of technology and finance professionals leverages Lara to deliver efficient and reliable solutions.\",\"first_counter_text\":\"Total Visitor\",\"first_counter_prefix\":\"9\",\"first_counter_digit\":\"60\",\"second_counter_text\":\"Total Investor\",\"second_counter_prefix\":\"$\",\"second_counter_digit\":\"12478\",\"image\":\"68fcbe5463d531761394260.png\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:11:00', '2025-10-26 06:13:50'),
('why_choose.element', '{\"icon\":\"<i class=\\\"fas fa-shield-alt\\\"><\\/i>\",\"title\":\"Deep market analysis and insights\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:11:19', '2025-10-25 06:11:19'),
('why_choose.element', '{\"icon\":\"<i class=\\\"fas fa-shield-alt\\\"><\\/i>\",\"title\":\"Intuitive interfaces that cater\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:11:29', '2025-10-25 06:11:29'),
('why_choose.element', '{\"icon\":\"<i class=\\\"fas fa-shield-alt\\\"><\\/i>\",\"title\":\"Leveraging Lara\'s advanced\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:11:39', '2025-10-25 06:11:39'),
('why_choose.element', '{\"icon\":\"<i class=\\\"fas fa-shield-alt\\\"><\\/i>\",\"title\":\"Unlimited Trading\"}', NULL, 'crypto_hyip', '', '2025-10-25 06:11:49', '2025-10-25 06:11:49'),
('top_investor.element', '{\"name\":\"James Carter\",\"designation\":\"Investor\",\"amount\":\"1000000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:45:26', '2025-10-26 01:45:26'),
('top_investor.element', '{\"name\":\"Sophia Malik\",\"designation\":\"Investor\",\"amount\":\"1200000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:45:58', '2025-10-26 01:45:58'),
('top_investor.element', '{\"name\":\"David Kim\",\"designation\":\"Investor\",\"amount\":\"1500000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:46:20', '2025-10-26 01:46:20'),
('top_investor.element', '{\"name\":\"Ariana Lopez\",\"designation\":\"Investor\",\"amount\":\"1650000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:46:46', '2025-10-26 01:46:46'),
('top_investor.element', '{\"name\":\"Michael Zhang\",\"designation\":\"Investor\",\"amount\":\"1700000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:47:10', '2025-10-26 01:47:10'),
('top_investor.element', '{\"name\":\"Emma Wilson\",\"designation\":\"Investor\",\"amount\":\"1900000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:47:27', '2025-10-26 01:47:27'),
('top_investor.element', '{\"name\":\"Oliver Khan\",\"designation\":\"Investor\",\"amount\":\"2500000\"}', NULL, 'crypto_hyip', '', '2025-10-26 01:47:46', '2025-10-26 01:47:46');



INSERT INTO `pages` (`name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
('HOME', '/', 'templates.crypto_hyip.', '[\"calculator\",\"why_choose\",\"plan\",\"how_it_work\",\"feature\",\"testimonial\",\"top_investor\",\"latest_transaction\",\"cta\",\"ranking\",\"faq\",\"blog\"]', NULL, 1, '2025-08-16 04:58:40', '2025-08-16 05:24:13'),
('Blog', 'blogs', 'templates.crypto_hyip.', NULL, NULL, 1, '2025-08-16 04:58:40', '2025-08-16 04:58:40'),
('Contact', 'contact', 'templates.crypto_hyip.', NULL, NULL, 1, '2025-08-16 04:58:40', '2025-08-16 04:58:40'),
('Plans', 'plans', 'templates.crypto_hyip.', NULL, NULL, 1, '2025-08-16 04:58:41', '2025-08-16 04:58:41'),
('About', 'about', 'templates.crypto_hyip.', '[\"why_choose\",\"how_it_work\",\"feature\",\"testimonial\",\"faq\",\"blog\"]', NULL, 0, '2025-08-16 04:58:41', '2025-08-19 07:58:49');

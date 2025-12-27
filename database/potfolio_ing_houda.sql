-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 12:13 AM
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
-- Database: `potfolio_ing_houda`
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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('hudata-dev-cache-contact@administra.site|127.0.0.1', 'i:1;', 1764351029),
('hudata-dev-cache-contact@administra.site|127.0.0.1:timer', 'i:1764351029;', 1764351029),
('hudata-dev-cache-contact@hudatadev.fr|127.0.0.1', 'i:1;', 1764351155),
('hudata-dev-cache-contact@hudatadev.fr|127.0.0.1:timer', 'i:1764351155;', 1764351155);

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
-- Table structure for table `home_page_section`
--

CREATE TABLE `home_page_section` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_key` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_section`
--

INSERT INTO `home_page_section` (`id`, `section_key`, `content`, `created_at`, `updated_at`) VALUES
(1, 'hero', NULL, NULL, NULL),
(2, 'services', '\"{\\\"title\\\":\\\"Nos services\\\",\\\"subtitle\\\":null,\\\"services_ids\\\":[\\\"1\\\",\\\"2\\\",\\\"3\\\",\\\"4\\\",\\\"5\\\"]}\"', NULL, '2025-11-28 18:40:18'),
(3, 'whyChooseUs', NULL, NULL, NULL),
(4, 'testimonials', NULL, NULL, NULL),
(5, 'aboutus', NULL, NULL, NULL),
(6, 'ParallaxStats', '\"{\\\"title\\\":\\\"Notre priorit\\u00e9\\\",\\\"description\\\":\\\"La satisfaction de nos clients est au c\\u0153ur de notre mission.\\\",\\\"badge\\\":\\\"null\\\",\\\"stats\\\":[{\\\"value\\\":\\\"+50\\\",\\\"label\\\":\\\"projects\\\"},{\\\"value\\\":\\\"98%\\\",\\\"label\\\":\\\"Clients satisfaits\\\"}],\\\"image\\\":\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/uploads\\/homepage\\/s0rMBHBvwqznnvWE7OWLmwQVhVjAAU5ylJVIpGXZ.jpg\\\"}\"', NULL, '2025-11-28 17:05:15'),
(7, 'projects', '\"{\\\"title\\\":\\\"Travaux R\\u00e9cents\\\",\\\"subtitle\\\":\\\"Des solutions digitales modernes pour des besoins r\\u00e9els\\\",\\\"project_ids\\\":[\\\"2\\\",\\\"1\\\"]}\"', NULL, '2025-11-28 16:58:28');

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
(4, '2025_07_30_225132_create_home_page_section', 1),
(5, '2025_08_18_234634_create_settings_table', 1),
(6, '2025_08_19_210608_create_services_table', 1),
(7, '2025_08_19_210648_create_projects_table', 1),
(8, '2025_08_19_210837_create_project_images_table', 1),
(9, '2025_09_15_121743_create-pages-table', 1),
(10, '2025_09_15_124809_alter_projects_content_column', 1),
(11, '2025_09_23_150016_alter_table_service', 1),
(12, '2025_09_23_150106_alter_table_project', 1),
(13, '2025_09_23_150233_alter_table_page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `link` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `slug`, `description`, `content`, `location`, `date`, `link`, `created_at`, `updated_at`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(1, 'Site Web Professionnel – Services Administratifs', 'site-web-professionnel-services-administratifs', 'Développement complet d’un site web moderne pour une entreprise spécialisée dans les services administratifs.\r\nTechnologies utilisées : Laravel, Vue 3, Inertia.js et Tailwind CSS.', NULL, 'Pantin, France', '2025-07-10', 'https://administra.site/', '2025-11-28 16:45:22', '2025-11-28 20:05:56', 'Développement site web services administratifs – Laravel Vue Inertia', 'Réalisation d’un site web professionnel pour une entreprise administrative. Développement moderne en Laravel, Vue 3, Inertia et Tailwind. Design responsive et SEO optimisé.', 'site web administratif, laravel vue, inertia js, développement web, auto-entreprise, création de site'),
(2, 'Site Web Entreprise – FSD Bâtimentt', 'site-web-entreprise-fsd-batimentt', 'Création d’un site web complet pour une entreprise de services de bâtiment (rénovation, travaux, dépannage).\r\nTechnologies utilisées : Laravel, Vue 3, Inertia.js, Tailwind CSS.', NULL, 'Paris, France', '2025-10-01', 'https://fsdbatiment.fr/', '2025-11-28 16:48:23', '2025-11-28 20:04:56', 'Création site web entreprise bâtiment – Laravel Vue 3', 'Développement d’un site professionnel pour FSD Bâtiment. Site responsive, moderne, optimisé SEO et administrable via Laravel + Vue 3 + Inertia + Tailwind CSS.', 'site bâtiment, création site entreprise, laravel vue inertia, fsd bâtiment, portfolio web, développement frontend backend');

-- --------------------------------------------------------

--
-- Table structure for table `project_images`
--

CREATE TABLE `project_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_images`
--

INSERT INTO `project_images` (`id`, `project_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'projects/rI6HQ5AbxLf587sLnSK0cixRqF9TLncnDp8IT8Fh.png', '2025-11-28 16:45:25', '2025-11-28 16:45:25'),
(2, 2, 'projects/v6LpUKbYB2WvRNTjgNFYntkwWqzobaac7ZTaYzQj.png', '2025-11-28 16:48:23', '2025-11-28 16:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `description`, `long_description`, `icon`, `background_image`, `created_at`, `updated_at`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(1, 'Développement Web Sur Mesure', 'developpement-web-sur-mesure', 'Création de sites et applications web personnalisés, performants et adaptés à vos besoins.', '<p>Je conçois et développe des sites web sur mesure en utilisant des technologies modernes telles que</p><p><strong>Laravel</strong>, <strong>Vue.js</strong>, <strong>Inertia.js</strong> et <strong>Tailwind CSS</strong>.</p><p>Chaque projet est pensé pour offrir performance, sécurité et une expérience utilisateur fluide.</p><p><br></p><p><br></p><p><br></p><p><br></p><p>Du cahier des charges jusqu’à la mise en ligne, je réalise un développement entièrement personnalisé</p><p>afin de répondre précisément aux besoins de votre activité.</p><p><br></p><p><br></p><p><br></p>', NULL, NULL, '2025-11-28 17:10:52', '2025-11-28 18:26:12', 'Développement web sur mesure – Création de sites et applications professionnelles', 'Développement web personnalisé avec Laravel, Vue.js, Inertia et Tailwind. Sites performants, modernes et adaptés à vos besoins.', 'développement web sur mesure, application web, site personnalisé, laravel, vue js, développeur full stack'),
(2, 'Gestion & Administration de Serveurs', 'gestion-administration-de-serveurs', 'Configuration, optimisation et maintenance de serveurs pour garantir sécurité et performance.', '<p>J’assure la configuration, la gestion et la maintenance de vos serveurs Linux ou VPS afin de garantir une</p><p>disponibilité maximale, une sécurité optimale et des performances élevées.</p><p><br></p><p><br></p><p><br></p><p><br></p><p>Mes services incluent : installations, migrations, sécurisation, monitoring, optimisation, mise en ligne</p><p>de projets et résolution d’incidents.</p><p><br></p><p><br></p><p><br></p>', NULL, NULL, '2025-11-28 17:10:52', '2025-11-28 18:26:12', 'Gestion de serveurs – Administration Linux et VPS', 'Service professionnel d’administration de serveurs : installation, optimisation, sécurité et maintenance.', 'gestion serveurs, administration Linux, VPS, hébergement web, sécurité serveur'),
(3, 'Maintenance & Support Technique', 'maintenance-support-technique', 'Suivi technique, mises à jour, correctifs et amélioration continue de vos projets web.', '<p>Je propose un service complet de maintenance afin d’assurer la stabilité, la sécurité et l\'évolution</p><p>continue de vos sites web et applications. Cela inclut les mises à jour régulières, les correctifs,</p><p>l\'ajout de fonctionnalités et l’optimisation des performances.</p><p><br></p><p><br></p><p><br></p>', NULL, NULL, '2025-11-28 17:10:52', '2025-11-28 18:26:12', 'Maintenance web professionnelle – Support technique et mises à jour', 'Maintenance, optimisation et suivi technique de sites et applications web pour garantir sécurité et performance.', 'maintenance web, support technique, mise à jour site, optimisation, développeur web'),
(4, 'Optimisation SEO & Performance Web', 'optimisation-seo-performance-web', 'Amélioration du référencement, de la vitesse et de la performance globale de vos sites web.', '<p>J’optimise vos sites web pour améliorer leur <strong>SEO</strong>, leur positionnement sur Google et leur</p><p>performance technique. Cela inclut l’optimisation du code, des images, du chargement, du référencement</p><p>on-page et de la structure.</p><p><br></p><p><br></p><p><br></p><p><br></p><p>Objectif : un site plus rapide, mieux classé et offrant une meilleure expérience utilisateur.</p><p><br></p><p><br></p><p><br></p>', NULL, NULL, '2025-11-28 17:14:51', '2025-11-28 18:26:12', 'Optimisation SEO et performance – Amélioration vitesse & référencement', 'Optimisation technique du SEO, amélioration du temps de chargement et des performances web pour un meilleur classement Google.', 'seo, optimisation site web, vitesse site, référencement google, performance web'),
(5, 'Intégration & Déploiement (CI/CD – DevOps)', 'integration-deploiement-cicd-devops', 'Automatisation du déploiement, intégration continue et mise en production sécurisée.', '<p>Je mets en place des pipelines <strong>CI/CD</strong> pour automatiser les tests, le déploiement et la mise</p><p>en production de vos projets. Cela garantit une livraison rapide, fiable et sans interruption.</p><p><br></p><p><br></p><p>J’assure également l’optimisation de vos environnements de développement, la gestion des versions,</p><p>l’intégration Git et le déploiement sur des serveurs ou services cloud (VPS, Docker, etc.).</p><p><br></p><p><br></p><p><br></p>', NULL, NULL, '2025-11-28 17:14:51', '2025-11-28 18:26:12', 'CI/CD & DevOps – Automatisation du déploiement', 'Mise en place de pipelines CI/CD, intégration continue, tests automatisés et déploiement professionnel.', 'devops, ci/cd, déploiement automatisé, docker, intégration continue, ingénieur web');

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
('lWyjMqOZE2aJsZXbYT7TjsDUHwSkaE1kdctTaWYy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEJpMFk0dUF0dFd5amdBMTJmNUdOT2szUUpsNHJxcko4N0NQWUlsTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763737001),
('tLTpcFNLLsi4BYz3M45TByLkNiiniryuETk5ZJbT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGRmdnlzVTR2NlJXcFRvbFM0MTNuRm1TRmpCWmJHQlZScXFsRHl3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763813374),
('VFZ68QxeHDabFliLvWWPnI36O4aZSQd0xWjEqrfh', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaUNxTXBaeERPSnpKZTVtcmhuMlh5TzZrNUx5YUcwaXNRMXFkeDZvbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1764597154),
('WwiC8wva2pDPlOseYLdfVywwBq4AONrxO7GUJkVP', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZHBuSW12ZHR3dVpaMGJ2V3kxMUl3aHVxcDhQU0xCb3c2cnNQaFI5USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9qZWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1764364629);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
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
(1, 'Admin', 'contact@hudata-dev.fr', NULL, '$2y$12$uT7TfZxR73nxhaK7jPtJ.ux/X.LdmbcDAV74G1AuKct8ya8FvDcKu', 'PGJe9UunZzWF46WwUMh4p6uMCqdYzcPXnHb2ruM8JblKUvKUrVoPEkSfsIms', NULL, NULL);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_page_section`
--
ALTER TABLE `home_page_section`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_page_section_section_key_unique` (`section_key`);

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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_slug_unique` (`slug`);

--
-- Indexes for table `project_images`
--
ALTER TABLE `project_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_images_project_id_foreign` (`project_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_page_section`
--
ALTER TABLE `home_page_section`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_images`
--
ALTER TABLE `project_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
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
-- Constraints for table `project_images`
--
ALTER TABLE `project_images`
  ADD CONSTRAINT `project_images_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

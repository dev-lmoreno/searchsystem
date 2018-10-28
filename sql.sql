-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.23 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para search
CREATE DATABASE IF NOT EXISTS `search` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `search`;

-- Copiando estrutura para tabela search.bussinesses
CREATE TABLE IF NOT EXISTS `bussinesses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bussinesses_city_id_foreign` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.bussinesses: 0 rows
/*!40000 ALTER TABLE `bussinesses` DISABLE KEYS */;
INSERT IGNORE INTO `bussinesses` (`id`, `city_id`, `title`, `phone`, `address`, `zipcode`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'MSTECH', '14 3235-5500', 'R. Joaquim Anacleto Bueno', '17047281', 'Develop solutions for a real improvement in the day-to-day life of Brazilian schools, through projects and products that put technology at the service of education. For more than 15 years, this is the great mission and daily challenge of MSTECH.', 1, '2018-10-27 21:54:36', '2018-10-27 21:54:36'),
	(2, 1, 'SERVIMED', '0800 709 9954', 'R. Araujo Leitte', '17022589', 'To start saving, be more of a Servimed Customer.', 1, '2018-10-27 21:59:21', '2018-10-27 21:59:21'),
	(3, 3, 'Sesc', '14 32159874', 'R. Araujo gomes', '17012-060', 'Health and Happy is all', 1, '2018-10-27 22:00:23', '2018-10-27 22:00:23'),
	(4, 2, 'Mac Donald\'s', '14 33334589', 'R. Duque de caxias', '17352-080', 'Mac is better than bk', 1, '2018-10-27 22:01:21', '2018-10-27 22:01:21'),
	(5, 1, 'Burguer King', '14 998745631', 'R. Burguer king', '17012-789', 'Bk is better than mac', 1, '2018-10-27 22:02:00', '2018-10-27 22:02:00'),
	(6, 3, 'Subway', '31 98765432', 'R. subway', '39012-060', 'subway is better than all', 1, '2018-10-27 22:03:16', '2018-10-27 22:03:16'),
	(7, 2, 'Nike', '14 35789654', 'R. nike', '17569-060', 'Nike', 1, '2018-10-27 22:04:28', '2018-10-27 22:04:28'),
	(8, 1, 'Adidas', '14 32234157', 'R Adiiidas', '17014-753', 'Adidas', 1, '2018-10-27 22:05:19', '2018-10-27 22:05:19'),
	(9, 3, 'Microsoft', '14 99999999', 'R. Microsoft', '15963-569', 'Microsft is better than Apple', 1, '2018-10-27 22:06:48', '2018-10-27 22:06:48'),
	(10, 1, 'Apple', '14 987456321', 'R. Apple', '14785-326', 'Apple is better than miscrosoft', 1, '2018-10-27 22:07:40', '2018-10-27 22:07:40');
/*!40000 ALTER TABLE `bussinesses` ENABLE KEYS */;

-- Copiando estrutura para tabela search.bussiness_categories
CREATE TABLE IF NOT EXISTS `bussiness_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `bussiness_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bussiness_categories_category_id_foreign` (`category_id`),
  KEY `bussiness_categories_bussiness_id_foreign` (`bussiness_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.bussiness_categories: 0 rows
/*!40000 ALTER TABLE `bussiness_categories` DISABLE KEYS */;
INSERT IGNORE INTO `bussiness_categories` (`id`, `category_id`, `bussiness_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2018-10-27 21:54:36', '2018-10-27 21:54:36'),
	(2, 8, 1, '2018-10-27 21:54:36', '2018-10-27 21:54:36'),
	(3, 1, 2, '2018-10-27 21:59:21', '2018-10-27 21:59:21'),
	(4, 5, 2, '2018-10-27 21:59:21', '2018-10-27 21:59:21'),
	(5, 2, 3, '2018-10-27 22:00:23', '2018-10-27 22:00:23'),
	(6, 4, 4, '2018-10-27 22:01:21', '2018-10-27 22:01:21'),
	(7, 4, 5, '2018-10-27 22:02:00', '2018-10-27 22:02:00'),
	(8, 8, 5, '2018-10-27 22:02:00', '2018-10-27 22:02:00'),
	(9, 1, 6, '2018-10-27 22:03:16', '2018-10-27 22:03:16'),
	(10, 2, 6, '2018-10-27 22:03:16', '2018-10-27 22:03:16'),
	(11, 3, 6, '2018-10-27 22:03:16', '2018-10-27 22:03:16'),
	(12, 4, 6, '2018-10-27 22:03:16', '2018-10-27 22:03:16'),
	(13, 5, 7, '2018-10-27 22:04:28', '2018-10-27 22:04:28'),
	(14, 6, 7, '2018-10-27 22:04:28', '2018-10-27 22:04:28'),
	(15, 2, 8, '2018-10-27 22:05:19', '2018-10-27 22:05:19'),
	(16, 3, 8, '2018-10-27 22:05:19', '2018-10-27 22:05:19'),
	(17, 4, 8, '2018-10-27 22:05:19', '2018-10-27 22:05:19'),
	(18, 3, 9, '2018-10-27 22:06:48', '2018-10-27 22:06:48'),
	(19, 8, 9, '2018-10-27 22:06:48', '2018-10-27 22:06:48'),
	(20, 3, 10, '2018-10-27 22:07:40', '2018-10-27 22:07:40'),
	(21, 8, 10, '2018-10-27 22:07:40', '2018-10-27 22:07:40');
/*!40000 ALTER TABLE `bussiness_categories` ENABLE KEYS */;

-- Copiando estrutura para tabela search.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.categories: 0 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Auto', 'Auto', '2018-10-27 18:52:18', '2018-10-27 18:52:18'),
	(2, 'Beauty and Fitness', 'Beauty and Fitness', '2018-10-27 18:52:18', '2018-10-27 18:52:18'),
	(3, 'Entertainment', 'Entertainment', '2018-10-27 18:52:38', '2018-10-27 18:52:38'),
	(4, 'Food and Dining', 'Food and Dining', '2018-10-27 18:52:38', '2018-10-27 18:52:38'),
	(5, 'Health', 'Health', '2018-10-27 18:52:38', '2018-10-27 18:52:38'),
	(6, 'Sports', 'Sports', '2018-10-27 18:52:38', '2018-10-27 18:52:38'),
	(7, 'Travel', 'Travel', '2018-10-27 18:52:38', '2018-10-27 18:52:38'),
	(8, 'Technology', 'Technology', '2018-10-27 18:54:00', '2018-10-27 18:54:01');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela search.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_state_id_foreign` (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.cities: 0 rows
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT IGNORE INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
	(1, 'Bauru', 1, '2018-10-27 18:46:01', '2018-10-27 18:46:02'),
	(2, 'Lençois Paulista', 1, '2018-10-27 18:46:20', '2018-10-27 18:46:20'),
	(3, 'Belo Horizonte', 2, '2018-10-27 18:46:30', '2018-10-27 18:46:30');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Copiando estrutura para tabela search.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.migrations: 7 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2018_10_26_134903_create_categories_table', 1),
	(4, '2018_10_27_021245_create_states_table', 1),
	(5, '2018_10_27_021259_create_cities_table', 1),
	(6, '2018_10_27_021508_create_bussiness_table', 1),
	(7, '2018_10_27_032054_create_bussiness_categories_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela search.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.password_resets: 0 rows
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela search.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.states: 0 rows
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT IGNORE INTO `states` (`id`, `name`, `uf`, `created_at`, `updated_at`) VALUES
	(1, 'São Paulo', 'SP', '2018-10-27 18:45:31', '2018-10-27 18:45:32'),
	(2, 'Minas Gerais', 'MG', '2018-10-27 18:45:48', '2018-10-27 18:45:48');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;

-- Copiando estrutura para tabela search.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela search.users: 0 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@admin.com.br', NULL, '$2y$10$2gcn5AFHUdJNSVFd0twi8ewzV5P8nB0yW4vI85iYXg94cCWl6KJDa', NULL, '2018-10-27 21:46:56', '2018-10-27 21:46:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

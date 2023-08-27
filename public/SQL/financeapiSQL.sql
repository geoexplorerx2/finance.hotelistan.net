-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 14 juil. 2023 à 11:07
-- Version du serveur : 5.7.42
-- Version de PHP : 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotelistan_financeapi`
--

-- --------------------------------------------------------

--
-- Structure de la table `annual_leaves`
--

CREATE TABLE `annual_leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `personnel_id` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `annual_leave_type_id` int(10) UNSIGNED DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `annual_leave_reports`
--

CREATE TABLE `annual_leave_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_leave_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `annual_leave_types`
--

CREATE TABLE `annual_leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annual_leave_types`
--

INSERT INTO `annual_leave_types` (`id`, `name`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Hasta', NULL, 1, NULL, '2022-07-19 12:19:26', '2022-11-06 20:49:04'),
(2, 'Normal', NULL, 1, NULL, '2022-07-19 12:19:26', '2022-11-06 20:49:04'),
(3, 'deneme', 'name', 3, '2023-01-17 06:35:55', '2023-01-17 06:34:39', '2023-01-17 06:35:55'),
(4, 'test', 'test', 4, '2023-01-25 05:16:09', '2023-01-25 05:16:02', '2023-01-25 05:16:09'),
(5, 'YILLIK İZİN', NULL, 9, NULL, '2023-02-10 06:41:23', '2023-02-10 06:41:23');

-- --------------------------------------------------------

--
-- Structure de la table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `check_registration`
--

CREATE TABLE `check_registration` (
  `id` int(10) UNSIGNED NOT NULL,
  `personnel_card_id` int(10) UNSIGNED DEFAULT NULL,
  `start_hour` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_hour` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cheques`
--

CREATE TABLE `cheques` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `cheques_statuses_id` int(10) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheques`
--

INSERT INTO `cheques` (`id`, `bank_name`, `expiry_date`, `issue_date`, `cheque_no`, `amount`, `currency`, `company_id`, `cheques_statuses_id`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'GARANTİ', '2023-02-01', '2023-01-11', '8511313', '88500', 'USD', 4, 2, 'ORION OTEL 01.11.2022-31.10.2023 KİRA DÖNEMİ İÇİN VERİLEN ÇEK', 10, NULL, '2023-01-11 08:09:56', '2023-01-11 08:20:45'),
(2, 'GARANTİ', '2023-02-01', '2023-01-11', '8511314', '157500', 'USD', 4, 2, 'ORION OTEL 01.11.2022-31.10.2023 KİRA DÖNEMİ İÇİN VERİLEN HATIR ÇEKİ', 10, NULL, '2023-01-11 08:11:14', '2023-01-11 08:20:57'),
(3, 'GARANTİ', '2023-05-01', '2023-01-11', '8511311', '88500', 'USD', 4, 2, 'ORION OTEL 01.11.2022-31.10.2023 KİRA DÖNEMİ İÇİN VERİLEN USD ÇEK', 10, NULL, '2023-01-11 08:16:50', '2023-01-11 08:20:13'),
(4, 'GARANTİ', '2023-05-01', '2023-01-11', '8511315', '157500', 'USD', 4, 2, 'ORION OTEL 01.11.2022-31.10.2023 KİRA DÖNEMİ İÇİN VERİLEN HATIR ÇEKİ', 10, NULL, '2023-01-11 08:18:03', '2023-01-11 08:18:03'),
(5, 'GARANTİ', '2023-08-01', '2023-01-11', '8511312', '88500', 'USD', 4, 2, 'ORION OTEL 01.11.2022-31.10.2023 KİRA DÖNEMİ İÇİN VERİLEN ÇEK', 10, NULL, '2023-01-11 08:19:38', '2023-01-11 08:21:10'),
(6, 'GARANTİ', '2023-08-01', '2023-01-11', '8511316', '157500', 'USD', 4, 2, 'ORION OTEL 01.11.2023-31.10.2023 KİRA DÖNEMİ İÇİN VERİLEN HATIR ÇEKİ', 10, NULL, '2023-01-11 08:22:15', '2023-01-11 08:22:15'),
(7, 'Ziraat Bankası', '2023-03-15', '2023-01-11', '98456', '442500', 'EUR', 6, 2, 'Denk Turizm\'e  verilen Teminat çeki. Vadesinde nakit ödenerek çek geri alınacak', 10, NULL, '2023-01-11 08:53:48', '2023-01-11 08:53:48'),
(8, 'Ziraat Bankası', '2023-06-16', '2023-01-11', '98455', '442500', 'EUR', 6, 2, 'Denk Turizm\'e verilen Teminat çeki. Vadesinde nakit ödenerek geri alınacak.', 10, NULL, '2023-01-11 08:55:52', '2023-01-11 08:56:36'),
(9, 'Ziraat Bankası', '2023-09-15', '2023-01-11', '98454', '442500', 'EUR', 6, 2, 'Denk Turizm\'e verilen Teminat çeki. Vadesinde nakit ödenerek geri alınacak.', 10, NULL, '2023-01-11 08:58:06', '2023-01-11 08:58:06'),
(10, 'Ziraat Bankası', '2023-09-15', '2023-01-11', '98454', '442500', 'EUR', 6, 2, 'Denk Turizm\'e verilen Teminat çeki. Vadesinde nakit ödenerek geri alınacak.', 10, '2023-01-11 08:58:36', '2023-01-11 08:58:08', '2023-01-11 08:58:36'),
(11, 'Ziraat Bankası', '2023-12-15', '2023-01-11', '98457', '442500', 'EUR', 6, 2, 'Denk Turizm\'e verilen Teminat çeki. Vadesinde nakit ödenerek geri alınacak.', 10, NULL, '2023-01-11 08:59:40', '2023-01-11 08:59:40'),
(12, 'AKBANK', '2023-02-16', '2023-01-18', 'Z1034095', '203299.05', 'TL', 7, 2, 'Prime Otel Kasap Cari kapama için verilen', 10, NULL, '2023-01-18 08:52:49', '2023-01-18 08:52:49'),
(13, 'AKBANK', '2023-02-23', '2023-01-18', '1034094', '129500', 'TL', 8, 2, 'Renk Dek. Cari Hesaba mahsuben verilen çek', 10, NULL, '2023-01-18 10:20:44', '2023-01-18 10:20:44'),
(14, 'AKBANK', '2023-03-28', '2023-01-18', '1034096', '322600', 'TL', 9, 2, 'ERT mekanik verilen çek', 10, NULL, '2023-01-18 10:30:27', '2023-01-18 10:30:27');

-- --------------------------------------------------------

--
-- Structure de la table `cheques_statuses`
--

CREATE TABLE `cheques_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheques_statuses`
--

INSERT INTO `cheques_statuses` (`id`, `name`, `color`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ödendi', '#2BFF00FF', NULL, 3, NULL, '2022-12-15 09:51:15', '2022-12-20 12:32:30'),
(2, 'Ödenmedi', '#FF170FFF', NULL, 10, NULL, '2023-01-11 08:03:37', '2023-01-11 08:03:37'),
(3, 'Alınan Çekler', '#0043FFFF', 'Firmalardan alınan çekler', 10, NULL, '2023-01-11 09:05:52', '2023-01-11 09:05:52'),
(4, 'Ciro', '#1C8385FF', 'Cirolanan çekler', 10, NULL, '2023-01-11 09:06:33', '2023-01-11 09:06:33'),
(5, 'Cheque Status', '#FFFFFFF', 'test update', 3, NULL, '2023-05-30 08:56:12', '2023-05-30 08:57:02');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_iban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type_id` int(10) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `name`, `bank_name`, `bank_iban`, `person_name`, `phone_number`, `expiry_date`, `payment_type_id`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Nova Gold', 'Garanti', 'TR543654645', 'Mehmet', '0543534543', '20', 1, NULL, 3, NULL, '2022-12-26 09:57:29', '2022-12-26 09:57:29'),
(4, 'Farshad', 'AKBank', 'TR789652335690000250038', 'Farshad', '00905438991066', '05/25', 5265595, NULL, 10, NULL, '2023-01-11 07:42:08', '2023-05-05 09:32:53'),
(5, 'Sargın Metal Demir Çelik San. ve Tic. Ltd. Şti.', 'Ziraat Bankası', 'TR44 0001 0007 4960 9857 4350 01', 'Ahmet', '05427207770', 'Peşin', 1, 'Crystal SPA-Çelik Konstrüksiyon İşleri', 10, NULL, '2023-01-11 08:32:59', '2023-01-11 08:32:59'),
(6, 'Denk Turizm İnş. Yat. ve Tic. A.Ş.', 'Denizbank', 'TR89 0013 4000 0021 8516 7000 17', 'Murat Bey', '0212 604 15 00', 'Peşin', 1, 'Prime Otel Mülk Sahibi', 10, NULL, '2023-01-11 08:51:39', '2023-01-11 08:51:39'),
(7, 'Etse Gıda Hayvancılık Turizm San. Tic. Ltd. Şt.', 'Ziraat Bankası', 'TR69 0001 0017 9694 6907 2850 03', 'Erkan Yıldırım', '05326104921', '45', 1, 'Prime Otel Kasap', 10, NULL, '2023-01-18 08:51:18', '2023-01-18 08:51:18'),
(8, 'Renk Dekorasyon İnşaat ve Turizm San. Tic. Ltd. Şti.', 'Ziraat Bankası', 'TR11 1111 1111 1111 1111 1111 11', 'Fatih ŞENER', '02123243450', '30', 1, NULL, 10, NULL, '2023-01-18 10:18:46', '2023-01-18 10:18:46'),
(9, 'ERT Mekanik Turizm Müh. Tic. Ltd. Şti.', 'Garanti', 'TR130006200031100006294523', 'Ali Eralp ERGÜN', '02126120216', '30', 1, NULL, 10, NULL, '2023-01-18 10:29:23', '2023-01-24 10:39:00'),
(10, 'Petrol Ofisi A.Ş.', 'Akbank', 'TR420004600787888000041417', NULL, NULL, NULL, 1, NULL, 8, NULL, '2023-01-24 11:08:42', '2023-01-24 11:08:42'),
(11, 'Akbank T.A.Ş.', 'AKBANK', 'TR600004600133888000220069', 'Hatica NURAY', '05300331702', '0', 1, 'Kredi Ödemeleri için yapılan kayıt', 10, NULL, '2023-01-24 11:58:11', '2023-01-24 11:58:11'),
(12, 'Petrol Ofisi A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(13, 'Saydan Otelcilik Ve Turizm Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(14, 'Mengerler Tic. Türk A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(15, 'Qunomedical GmbH', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(16, 'Hotel Linkage Inc.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(17, 'Nazım Atakan Wings K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(18, 'Alj Finans A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(19, 'Mercedes-Benz Finansman A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(20, 'Hakan Yersal', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(21, 'Varna Ofis', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(22, 'Hakan Gülen', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(23, 'Hotelistan Ziraat Bnk. K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(24, 'Ercan Erbay (Sabiha Karşılama)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(25, 'Ziraat Bnk. Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(26, 'Tav İşletme Hiz. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(27, 'Havva Dilek Çelik', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(28, 'DR. LU SRLS', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(29, 'Emre Aydemir', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(30, 'Personel Maaş Hacizleri', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(31, 'Alisha UK Limited', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(32, 'Allianz Yaşam Ve Emeklilik A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(33, 'Personel Maaş Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(34, 'Personel Elden Maaş Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(35, 'Vodafone Telekomünikasyon A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(36, 'Hotelistan Garanti Bnk. M&S K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(37, 'Garanti Bankası Taşıt Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(38, 'Garanti Bankası Taşıt Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(39, 'Mehmet Güngör Ykb K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(40, 'Hasan Örnek', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(41, 'Özgür Ali Atakan', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(42, 'Listana Turz. İnş. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(43, 'Hotelistan Turizm Otelcilik İtalya Şubesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(44, 'Top VIP Design (Erkan Demir)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(45, 'Alice Kdv1', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(46, 'Alice Stopaj', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(47, 'Alice Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(48, 'Hotelistan Stopaj', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(49, 'Hotelistan Kdv1', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(50, 'Hotelistan Kdv2', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(51, 'Hotelistan Merkez Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(52, 'Hotelistan Şube-1 Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(53, 'Hotelistan Şube-2 Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(54, 'Hotelistan Şube-3 Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(55, 'Hotelistan Şube-4 Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(56, 'Hilton Bomonti Otel (Bomonti Ulus.Kong. ve Turz. Yat. Tic. A.Ş. Bomonti Şb.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(57, 'Expedia Lodging Partner Services Sarl', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(58, 'Hotelistan 2016-2017 Kur. Verg. Matrah Art. Taksidi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(59, 'TÜRSAB - Türkiye Seyahat Acentaları Birliği', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(60, 'Ezgi Oto (Kadir Çelik)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(61, 'Detlef Baur', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(62, 'Mehmet Güngör', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(63, 'Salih Can Sönmez', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(64, 'Personel Maaş Avansı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(65, 'Hotelistan Ykb K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(66, 'Nazım Atakan Ykb K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(67, 'Emlak Konut Kredi Ödemesi (Özgür Ali Atakan)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(68, 'Erdal Tezcan (Özgür Ali Atakan)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(69, 'Swift Komisyonu', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(70, 'E Uluslararası Fuar Tanıtım Hizm. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(71, 'Garanti Bankası Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(72, 'Gamze Atakan Bonus K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(73, 'Hotelistan Garanti Bnk. Bonus Business K. Kartı (4031)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(74, 'TIM Company UG', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(75, 'Hakkı Atakan Teb Kredi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(76, 'İski', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(77, 'Özgür Ali Atakan GSS Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(78, 'Aksoy Otomotiv San.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(79, 'Labina Bilişim İnternet ve Bilgisayar Hiz. San ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(80, 'Sodexo Avantaj Ve Ödüllendirme Hiz. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(81, 'Sercen Bilişim ve İletişim Sis. San. Tic. Ltd. Şti. (Arvento Takip Cihaz temini)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(82, 'Demirtaş Oto. Dış Tic. Paz. ve Yat. Tur. Ltd. Şti. (Lastik)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(83, 'Hotelistan Turizm Otelcilik İspanya Şubesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(84, 'Hotelistan Kur. Ver. Matrah Art. Taksiti', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(85, 'Kiralık Tekneler Denden Denizcilik San. ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(86, 'Holiday Inn Şişli Otel', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(87, 'Ümit Okan Atakan M&S K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(88, 'Personel İhbar Tazminatı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(89, 'Sami Mutlu Wings K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(90, 'Revinate Inc.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(91, 'CK Boğaziçi Elektrik A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(92, 'Alice Trf. Ceza Yapılandırma Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(93, 'Ümit Okan Atakan', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(94, 'Kenan Burak Finansbank K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(95, 'İst. Kervansaray Otel. ve Turz. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(96, 'TAXDRY SRLS Italy (Italya muhasebe)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(97, 'Fadime Çetinkaya (Mesut Çetinkaya)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(98, 'Hakkı Gökhan Atakan', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(99, 'Av. Sadettin Arda Özenç', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(100, 'Hakan Koç', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(101, 'Akdeniz Pe-tur Turz. Sey. Acen. Ve Tic. A.Ş. (Biletbank)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(102, 'Nuriye Alp (Emlak Danışmanı)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(103, 'Emre Akdeniz (inglizce rehber)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(104, 'Hakkı Atakan Wings Kredi Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(105, 'Hayri Erdoğdu (Rehber)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(106, 'Aykaç Gayrimenkul Yatırım İnşaat Sanayi ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(107, 'Hases Otomotiv Yatırım ve Pazarlama A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(108, 'Vodafone Telekomünikasyon A.Ş.(Alice Turizm)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(109, 'Turkcell İletişim Hizmetleri A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(110, 'Agrie Ahmad Bartmann', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(111, 'Alice Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(112, 'Volkan Çayır', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(113, 'Çırağan Sarayı Ve İşl. Gel. İnş. Ve Tur. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(114, 'Özdemir Fırın Oto Boya Servisi - Salim Özdemir', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(115, 'Personel Kıdem Tazminatı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(116, 'Üroakademi Sağlık Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(117, 'Merfa Haberleşme ve Bilg.Hiz.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(118, 'Protel Bilgisayar A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(119, 'Alice Geçici Vergi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(120, 'Pma Bilişim Ve Tic Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(121, 'Hotelistan Geçici Vergi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(122, 'İstanbul Gaz Dağıtım San.ve Tic.A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(123, 'Şaban Aykaç - Aykaç 171/A-B Blok İş Merkezi Bina Yönetimi (Aidat hesabı)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(124, 'Bertuğbey İnşaat Turz. Ve Teks. Tic. A.Ş. İstanbul Şubesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(125, 'Mayko Endüstriyel Day. Tük. Ürünleri San. Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(126, 'Nazım Atakan Hsbc K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(127, 'Aratravel S.R.L. Tour Operator', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(128, 'Hotelistan Akbank K. Kartı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(129, 'Yücel Çay - Sigorta', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(130, 'Bes Lastik ve Otomotiv Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(131, 'Atakan Otomotiv (Alice)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(132, 'Guia De Prensa', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(133, 'Emlak Vergisi (Özgür Ali Atakan)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(134, 'Universal Dil Hizmetleri ve Yayıncılık Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(135, 'Instituto Bilingue Jean Piaget A.C.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(136, 'Yaşaroğlu Turizm A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(137, 'Ert Mekanik Mühendislik Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(138, 'Vodafone Net İletişim Hizmetleri A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(139, 'Powerful Elektronik ve Enerji Sis.San. Ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(140, 'Kültür ve Turizm Bakanlığı Merkez Saymanlık Müdürlüğü', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(141, 'Motorlu Taşıtlar Vergisi (Hotelistan)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(142, 'Promostar Promosyon Ürünleri İthalat İhracat San.ve Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(143, 'ASY Turizm Organizasyon Bilişim Tic. Yunus Tiryaki', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(144, 'Lider Ortak Sağ.Güv.Birimi San.Tic. Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(145, 'Baybora Halıcılık Kuyumculuk ve Turz. Tic. Ltd. Şti. (Cappadocia Cave Suites Hotel)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(146, 'Hande Bilen (Rehber)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(147, 'Coşkun Altın Taşımacılık Turizm Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(148, 'Kenan Çolak - Grup Oto Servis Hizmetleri', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(149, 'Fuat Keleş - Afm Bilişim', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(150, 'Suat Serap Semiz - Voyager Balloons', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(151, 'Bedir Tur. Tic. İnş. San. İç ve Dış Paz. Ltd. Şti. (Rock Valley Turizm Cappadocia)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(152, 'Umut Hasan Ergül', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(153, 'Erol Kaş (Şoför)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(154, 'Yılmaz Koltuk Dizayn Sanayi ve Ticaret Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(155, 'TiQuest Management GbR', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(156, 'İbrahim Burak Aslanoğlu - Aslanoğlu Yeminli Mali Müşavirlik', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(157, 'Personele Verilen Borç', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(158, 'Cengiz Altuntaş Rehberlik - Emine Seda Altuntaş', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(159, 'Personelin Kullanılmayan İzin Ücreti Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(160, 'Simon Trollmann', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(161, 'Filmika - Opificio Dell Immagine Scrl', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(162, 'Agora Vox', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(163, 'My Travel Seyahat Turz.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(164, 'Lara Saleh (Lübnan Yapım şirketi, şahsi hesap)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(165, 'Ömer Günyaz (acrorun.com)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(166, 'Black and Yellow SARL', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(167, 'Ar-Ge Bilişim - Faruk Karakaya', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(168, 'Vega Ahşap Mobilya Dekorasyon San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(169, 'Hotelistan Kurumlar Vergisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(170, 'Alice Kurumlar Vergisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(171, 'Ali Rıza Serkan Dalkılıç (İng.Rehber)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(172, 'Elly Consultancy Services Ltd.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(173, 'Ersu Yurt otomotiv inş. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(174, 'A TEAM Internet Venture AG', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(175, 'Kaan Havacılık San. ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(176, 'Güller Emlak - Muzaffer Öget', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(177, 'Mehmet Tüfekçi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(178, 'Şaban Tüfekçi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(179, 'Ersa Mobilya Sanayi ve Ticaret Anonim Şirketi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(180, 'T.C. Ulaştırma Bakanlığı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(181, 'CIGA HOTELS ESPAÑA S.L (W HOTEL BARCELONA)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(182, 'Dsk Dramburg Rechtsanwalte PartG mbB', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(183, 'Madeleine Schneider-Weiffenbach', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(184, 'Venco Havalandırma Yedek Parça Mak. San. ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(185, 'CMLKK Otopark İşletme Hizmetleri A.Ş. (İGA Meet&Greet)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(186, 'GOATEK Teknoloji ve Yazılım Çözümleri Ltd Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(187, 'Twinkle Aydınlatma - Turgay Eraslan', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(188, 'Yusuf Ziya Keskin Otomotiv San.ve Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(189, 'Polatlar Motorlu Taş. Yed. Parça Tur. ve Taş. San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(190, 'İstanbul Ticaret Odası', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(191, 'Shestachenko Igor Yurevich (BroDude)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(192, 'Big Manitou', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(193, 'Kar Oto Klima - Murat Gökteke', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(194, 'Oto Kaya San. ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(195, 'Vip Bodrum Transfer Turizm Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(196, 'Özgür Ali Atakan Wings K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(197, 'Alice Otomotiv Gıda San.T urz. Teks. Eğt. Bilgi İşl. İth. İhr. Ltd.Şti. Maslak Şb.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(198, 'Altıparmak Eksoz Katalizatör Konvektör Montaj Servisi - Abdurrahman Altıparmak', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(199, 'Başaran Oto - Nami Başaran', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(200, 'Sümela Nakliyat Hafr. İnş. Turz. Tem. Ve Yem. Hiz. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(201, 'Atlas Oto Klima - Sait Akın', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(202, 'Diario ABC, S.L.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(203, 'Alice Kdv2', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(204, 'San Bilgisayar Tic. Tur. İth. ve İhr. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(205, 'Aykaç Apartmanı Yöneticiliği', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(206, 'Koç Üniversitesi Hastanesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(207, 'Galeria Victor Lope SL', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(208, 'Laptop Parça Bilişim Teknolojileri Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(209, 'Athletia Sports GmbH', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(210, 'Turkuvaz Reklam Paz.Dan. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(211, 'Promus Private Ltd - Gili Lankanfushi Maldives', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(212, 'Devre Bilgisayar Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(213, 'Ema Bilgisayar Notebook Servis ve Yedek Parça - Mustafa Aydenk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(214, 'Aykaç 171/A-B Blok Merkezi Bina Yönetimi (Aidat hesabı)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(215, 'Ticaret Bakanlığı İdari Para Cezası', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(217, 'Eser Çapar İbrahim Khalfa Mohamed Elghwail Ortaklığı (The Roomy Hotel Şişli)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(218, 'Bayraktarlar Aksaray Motorlu Araçlar San. Ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(219, 'Bayraktarlar Merkon Orta Anadolu Motorlu Araçlar Tic. Ve San. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(220, 'Şişli Sosyal Güvenlik Merkezi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(221, 'Atilla Uzuner - Ahi Otomotiv', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(222, 'Hüseyin Sezgin', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(223, 'Uğur Bey - VIP Design', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(224, 'Şiraz Turizm Taşımacılık İç ve Dış Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(225, 'Esbalboa Soluciones Financieras S.L.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(226, 'Kariyer Net Elk.Yay.ve İlet.Hizm.A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(227, 'Güllay Sevigen', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(228, 'Damga Vergisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(229, 'Mehmet Özyılmaz - Huzur Oto Kaporta Boya Mekanik Komple Bakım', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(230, 'Ziraat Bnk. Taşıt Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(231, 'Upfluence', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(232, 'Bv Dijital Web Medya Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(233, 'Hotelistan Turizm Katkı Payı Beyannamesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(234, 'The Loook Consultancy', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(235, 'Shayan Garcia', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(236, 'Mercedes-Benz Türk A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(237, 'Göksu Güzellik Merk. İnsan Kay. Özel Eğt. Mesleki Yet. Sınav Ve Belg. Merk. Yön. Dan. Turz. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(238, 'Garanti Bankası İhtiyaç Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(239, 'Hotelistan Şube-5 Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(240, 'Dekosit Yapı Dekorasyon & Bölme Sistemler Metin Aksu', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(241, 'Pms Otomotiv Lastik Hed. Eşya Paz. Dış Tic. San. Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(242, 'Mavi Dünya Otomotiv - Necmettin Altun', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(243, 'Türkiye Seyahat Acentaları Birliği İktisadi İşletmesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(244, 'Hrs Gmbh', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(245, 'Form Abc Matbaacılık ve Reklam Hiz. San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(246, 'Sun Ağız ve Diş Sağlığı Hizmetleri Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(247, 'Altınboynuz Spor Kulübü - Fırat Fırat', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(248, 'Vega Ajans Tan. Org. Hiz. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(249, 'Parkur Etkinlik Turz. Ve Org. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(250, 'Manay CPA, Inc.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(251, 'Teknoraks Teknoloji Market San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(252, 'Aşn 24 Ulaşım Hiz. Oto. İnş. Turizm San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(253, 'Türkkan Otomotiv Pazarlama Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(254, 'Hanife Sayan - Sayan Reklam', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(255, 'Ykb Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(256, 'Ykb Kredi Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(257, 'Taya Yolcu Hizmetleri A.Ş. (İGA Meet&Greet)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(258, 'Project 11 Limited', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(259, 'International MGT Group (UK) Ltd', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(260, 'Mehmet Pulat', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(261, 'Türkkep Kayıtlı Elektronik Posta Hiz. San. ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(262, 'İmdata Bilişim Teknolojileri ve Ticaret Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(263, 'Orhun Bilişim Sistemleri Tel.Gün.Bil.ve Dan.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(264, 'ÇSGB Çalışma İzin Harcı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(265, 'İş Bankası Teminatlı BCH Kredisi Dönem Sonu Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(266, 'İstanbul Mikro Cerrahi Sağlık Hizmetleri A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(267, 'Komtek İletişim Teknolojileri San.ve Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(268, 'F1 Medya Yayın Yapım Reklam Matbaacılık San.ve Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(269, 'Günay Güney (Rusça Rehber)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(270, 'Muzaffer Burcak Portsmouth', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(271, 'Ziraat Bnk. İşe Devam Destek Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(272, 'Hotelistan Garanti Bnk. Bonus Business K. Kartı (4015)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(273, 'Dide KAYA (Universal Dil Hizmetleri şahsi hesap)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(274, 'Vakıfbank İşe Devam Destek Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(275, 'Tektür Madencilik Kimya İnşaat Sanayi ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(276, 'Hizmet İhracatçıları Birliği', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(277, 'Fine Otel Turizm İşletmecilik A.Ş (Rixos Premium Göcek)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(278, 'Doku Tıp Merkezi Kredi Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(279, 'Vergi Gecikme Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(280, 'Ziraat Bnk. BCH Kredisi Dönem Sonu Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(281, 'Serdar Genç', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(282, 'Sapuppo Rosario (İtalya\'da avukat / Danışman firma)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(283, 'Benz Otomotiv - Mustafa Çağlar', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(284, 'Mehmet Şakir Karadibek (Rehber)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(285, 'Notaio Giandomenico Vulcano', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(286, 'Studio Cosmai', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(287, 'Ziraat Bnk. İşletme Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(288, 'Ataform Tekstil Albaraka Bnk. Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(289, 'Ataform Tekstil Garanti Bnk. Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(290, 'Akseren Halı ve Yer Döş. San ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(291, 'Hedef Kırtasiye Elekt.Bilg.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(292, 'Satılmılş Arı - Nam Promosyon Rekl.Matbaa Teks.Medi.Malz.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(293, 'Royalcert Belgelendirme ve Gözetim Hizmetleri A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(294, 'Şişli Mal Müdürlüğü', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(295, 'Arvento Mobil Sistemler A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(296, 'Hotelistan Vakıfbank K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(297, 'Trafik Cezası Ödemesi (Nakil Vasıtaları V.D.)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(298, 'Ataform Tekstil Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(299, 'Viator Limited London GBR', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(300, 'Kadıköy Gelişim Tıp Ortak Sağlık Güv.Birimi San.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(301, 'MiamiShared Virtual Office', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(302, 'Esma Ceceli', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(303, 'Özel Usulsüzlük Cezası', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(304, 'Kiğılı Giyim Ticaret A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(305, 'Clıckon Dijital Pazarlama ve Reklam Hizm. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(306, 'Garanti BBVA Emeklilik', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(307, 'Referans Ofis Mobilyaları İnş. San. ve Tic. Ltd. Şti', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(308, 'K-FLY (Kevin Sieger)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(309, 'İstanbul 34. İcra Dairesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(310, 'Nicolas Boulez - I.H.L.F', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(311, 'Ozisik PLLC', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(312, 'Ajans Medya Yayıncılık ve Ticaret A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(313, 'Aksel Demir - And Tercüme', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(314, 'Ümit Okan Atakan Bonus K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(315, 'Türsab İktisadi İşletmesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(316, 'Parma Calcio 1913 S.r.l.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(317, 'İstanbul Anadolu 4. İcra Dairesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(318, 'Dr. Serkan Aygın Klinik Saç Ekim Sağlık Ve Güzellik Hizm. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(319, 'Halkbank Turizm Destek Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(320, 'Youssef Kdami', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(321, 'Hotelistan Halkbank K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(322, 'JSC Business News Media', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(323, 'Sos Event Katarzyna Boszko', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(324, 'Marketing Point 360 Sp. z o.o.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(325, 'Hülya Çetinkaya', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(326, 'Universal Yeminli Mali Müşavirlik A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(327, 'Attaş Alarko Turistik Tesisler A. Ş. Hillside Beach Club', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(328, 'Murat Şahin - Eray Otomotiv', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(329, 'Shestachenko Igor Yurevich (DoubleDay)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(330, 'Komsomolskaya Pravda Publishing House (AO)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(331, 'Mod Tasarım A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(332, 'Peranet Bilgi Teknolojileri Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(333, 'AloTech İletişim Teknolojileri A. Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(334, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(335, 'Ziraat Bnk. BCH Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(336, 'Vakıfbank Çıpa Opex İşletme Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(337, 'Kredi Gecikme Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(338, 'RIC ReviewLTD', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(339, 'Cns Organizasyon Teknoloji iç ve Dış Tic.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(340, 'A Tercüme Dil Hizmetleri Turizm ve Danış.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(341, 'Neu/ Petit Fute Export', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(342, 'TÜV Saarland Holding GmbH', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(343, 'Group Medya ve Bilgi Tekn.Tic.A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(344, 'France Net Infos', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(345, 'TTM Telekom Services', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(346, 'Betmus Oto Şeyhmus Çakan', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(347, 'Sgk Gecikme Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(348, 'Universalis Ecza Deposu San.ve Tic.A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(349, 'Pusula Zaman Kontrol Sistemleri Sanayi ve Dış Ticaret Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(350, 'Ortaklardan Alacaklar Af Tutarı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(351, 'Alice Kur. Ver. Matrah Art. Taksiti', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(352, 'Daloğlu Danışmanlık Ve Sağ. Turz. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(353, 'Hotelistan Vergi Yapılandırma Taksiti', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(354, 'Alice Vergi Yapılandırma Taksiti', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(355, 'Hotelistan Merkez Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(356, 'Hotelistan Şube-1 Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(357, 'Hotelistan Şube-2 Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(358, 'Hotelistan Şube-3 Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(359, 'Hotelistan Şube-4 Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(360, 'Hotelistan Şube-5 Sgk Yapılandırma', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(361, 'Aksu Temizlik Hiz. İnş. Ve Mak. San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(362, 'Fatih Demirtaş', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(363, 'İnternasyonel Turizm Taşımacılık Gıda Teks.İnş.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(364, 'Hüseyin Çınar', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(365, 'Medistanbul Sağlık Hizmetleri Anonim Şirketi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(366, 'Aidat Gecikme Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(367, 'Doku Estetik Ve Sağlık Hizm. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(368, 'Ziraat Bnk. Turizm Destek Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(369, 'Akbank T.A.Ş. Taşıt Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(370, 'Batuhan Aydoğdu', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(371, 'FlyMedica Sp. z o.o.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(372, 'Ykb Taşıt Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(373, 'Gknlar Otomotiv ve İnş.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(374, 'Mandarin Oriental Hyde Park Limited', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(375, 'Nathan Figueroa', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(376, 'Gknlar Kdv', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(377, 'Gknlar Stopaj', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(378, 'Gknlar Geçici Vergi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(379, 'Gknlar Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(380, 'Doğan Sayan', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(381, 'Hotelistan Global Travel Services LLC', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(382, 'IW Group Services (UK) Ltd', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(383, 'Güney Özcan - Win Bilişim', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(384, 'Mandarin Oriental Jumeirah Dubai', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(385, 'Dentfiks Kdv1', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(386, 'Dentfiks Kdv2', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(387, 'Dentfiks Stopaj', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(388, 'Dentfiks Geçici Vergi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(389, 'Dentfiks Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(390, 'Turkfluencer Marketing Agency OÜ', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(391, 'Güven Dijital Medya Yayıncılık Grup Matbaa Reklam Kırt.ve San.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(392, 'Akbank İşlek Kredi Dönem Sonu Faizi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(393, 'Th Bilişim Hizmetleri San.Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(394, 'Iumira Travel Network Sa De Cv', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(395, 'Cesa Bilişim Teknolojileri San. Ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(396, 'Olcay Yapı Malz.Tic.İnş.ve Taah.A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(397, 'Aysan Elektrik San.ve Dış Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(398, 'Belek Mimarlık İnş. İç ve Dış Tic.San.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(399, 'Kortas Yapı Malz. İnş. Tur.Nak.Taah.San. ve Tic.Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(400, 'Bego Diş Malzemeleri A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(401, 'Fortel İletişim Teknolojileri San.ve Tic.A.ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(402, 'Megagen İmplant A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(403, 'Hürhan İş Merkezi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(404, 'Travel Compositor,S.L.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(405, 'Sedat Belgüzar', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(406, 'Beauty Consulting 24 S.r.l.s', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(407, 'Mike Leon Grosch', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(408, 'Sami Mutlu M&S K. Kartı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(409, 'İmdat Kit', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(410, 'Dentfiks Kurumlar Vergisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(411, 'Gknlar Kurumlar Vergisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(412, 'Recar Elektrikli Araçlar Sanayi Ve Ticaret A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(413, 'Alice Otomotiv Ziraat Bnk. K. Kartı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(414, 'Alice Otomotiv Ykb K. Kartı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(415, 'Temos International Gmbh', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(416, 'Vergi Ziyaı Cezası', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(417, 'Hanife Erdoğdu (Hotelistan Sancaktepe Şb. Kira Ödemesi)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(418, 'Simpa Ticari ve Sınai Ürünler Pazarlama ve İmalat A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(419, 'Enerjisa İstanbul Anadolu Yakası Elektrik Perakende Satış A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(420, 'Şişli Vergi Dairesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(421, 'Aydom Obezite ve Metabolik Cerrahi Sağlık Hizmetleri Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(422, 'GOP Avrasya Hastanesi - Elden Ödeme', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(423, 'Gknlar Garanti Bnk. K. Kartı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(424, 'TTNet A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(425, 'Arpanu Kdv1', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(426, 'Arpanu Kdv2', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(427, 'Arpanu Stopaj', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(428, 'Arpanu Geçici Vergi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(429, 'Arpanu Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(430, 'Arpanu Kurumlar Vergisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(431, 'Arpanu Garanti Bnk. K. Kartı Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(432, 'Akbank Filo Kasko Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(433, 'Alice Ykb K. Kartı Ödemesi (0808)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(434, 'Alice Ykb K. Kartı Ödemesi (6015)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(435, 'Alice Ziraat K. Kartı Ödemesi (1127)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(436, 'İstanbul Anadolu 1. İcra Dairesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(437, 'Maurice Laaß', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(438, 'Hotel Chateau De La Messardiere', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(439, 'İstanbul 37. İcra Dairesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(440, 'Ali Yağız Pesok', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(441, 'Ozge Tukle', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(442, 'Alice Garanti Bankası Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(443, 'Shay Rokach (LIRLUR SEGMENT MARKETING)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(444, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(445, 'Teb Finansman A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(446, 'Işık Gün İth.İhr. ve Pazarlama Ltd.Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(447, 'Orfin Finansman A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(448, 'Halkbank Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(449, 'Akbank T.A.Ş. Taksitli Ticari Kredi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(450, 'Zer Plus Geçici Vergi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(451, 'Go Fuarcılık Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(452, 'Hotelistan Bağcılar Şb. Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(453, 'Vakıfbank Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(454, 'Dentfiks Axess Busıness K. Kartı Ödemesi (5866)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(455, 'Dentfiks Ziraat K. Kartı Ödemesi (5756)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(456, 'Türkiye Sigorta A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(457, 'Ali Nahit Bozatlı', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(458, 'Filor Avocats', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(459, 'İş Bankası Teminatlı BCH Kredisi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(460, 'Arpanu Turizm Oto. Eğt. Bilg. İŞlem ve Kuy. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(461, 'Hotelistan Şişli 1. Şube Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(462, 'Hotelistan Şişli 2. Şube Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(463, 'Hotelistan Şube-6 Sgk', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(464, 'CARE Verlag GmbH', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(465, 'Akbank Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(466, 'Tevfik Kuruoğlu', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(467, 'S.A.R.L. GROUPE JLV', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(468, 'AX STOULS', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(469, 'Yılmazlar Banyo Merkezi San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(470, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(471, 'Kent Pasajı C Blok Yönetim', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(472, 'Öztürk Genel Gıda Malzemeleri A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(473, 'Etse Gıda Hayvancılık Turizm Sanayi Ticaret Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(474, 'Renk Dekorasyon İnş. Turz. San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(475, 'Arpanu France SAS', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(476, 'Denk Turizm İnş. Yat. ve Tic. A.Ş.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(477, 'Aksunğur Mobilya-Hayrettin Aksunğur', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(478, 'Murano Cam ve Mobilya San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(479, 'Ert Mekanik Havalandırma Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(480, 'Lava Dora Temizlik Hizm. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(481, 'Rodos Temizlik Gıda İnş. San. ve Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(482, 'Arpanu - Akbank Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(483, 'Denk Turizm Personel Tazminat Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(484, 'Mutlu Çiftliği Gıda San. Tic. Ltd. Şti.', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(485, 'Dentfiks Kira', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(486, 'Hakkı Gökhan Atakan Denizbank Bonus Kredi Kartı (6387)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(487, 'Varna Ofis', 'Varna Ofis', 'TR1111111', 'Varna Ofis', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL),
(488, 'Garanti 2sı Çek Ödemesi', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL),
(489, 'Farshad', 'AKBank', 'TR789652335690000250036', 'Farshad', '00905438991063', '05/25', 5265595, NULL, 0, NULL, '2023-05-05 05:19:05', '2023-05-05 05:19:05');
INSERT INTO `companies` (`id`, `name`, `bank_name`, `bank_iban`, `person_name`, `phone_number`, `expiry_date`, `payment_type_id`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(490, 'Farshad', 'AKBank', 'TR789652335690000250036', 'Farshad', '00905438991063', '05/25', 5265595, NULL, 0, NULL, '2023-05-05 05:26:31', '2023-05-05 05:26:31'),
(491, 'Farshad', 'AKBank', 'TR789652335690000250036', 'Farshad', '00905438991063', '05/25', 5265595, NULL, 0, NULL, '2023-05-05 05:26:56', '2023-05-05 05:26:56'),
(492, 'Farshad', 'AKBank', 'TR789652335690000250038', 'Farshad', '00905438991066', '05/25', 5265595, NULL, 3, NULL, '2023-05-05 06:33:52', '2023-05-05 06:33:52'),
(493, 'Farshad', 'AKBank', 'TR789652335690000250038', 'Farshad', '00905438991066', '05/25', 5265595, NULL, 3, NULL, '2023-05-05 06:37:43', '2023-05-05 06:37:43');

-- --------------------------------------------------------

--
-- Structure de la table `company_types`
--

CREATE TABLE `company_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `company_types`
--

INSERT INTO `company_types` (`id`, `name`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'A.S', 'it\'s important', 3, '2023-05-30 09:01:10', '2023-05-30 08:59:47', '2023-05-30 09:01:10');

-- --------------------------------------------------------

--
-- Structure de la table `credit_cards`
--

CREATE TABLE `credit_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvv` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `credit_cards`
--

INSERT INTO `credit_cards` (`id`, `name`, `number`, `expiry_date`, `cvv`, `currency`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Farshdf', '9842378270417289', '2024/04/10', '244', 'USD', 'it\'s important', 3, '2023-05-30 08:58:41', '2023-05-30 08:57:35', '2023-05-30 08:58:41');

-- --------------------------------------------------------

--
-- Structure de la table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departments`
--

INSERT INTO `departments` (`id`, `name`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Yazılım', NULL, 3, NULL, '2023-01-30 16:23:14', '2023-01-30 16:23:14');

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_surname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_iban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liability`
--

CREATE TABLE `liability` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personnel_card_id` int(10) UNSIGNED DEFAULT NULL,
  `signature_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_06_30_171953_create_suppliers', 1),
(5, '2021_06_30_171954_create_companies', 1),
(6, '2021_07_01_065534_create_annual_leave_types', 1),
(7, '2021_07_01_065534_create_payment_types', 1),
(8, '2021_07_01_065535_create_cheques_statuses', 1),
(9, '2021_07_01_065535_create_payment_requests_categories', 1),
(10, '2021_07_01_065535_create_payment_requests_statuses', 1),
(11, '2021_07_01_065535_create_purchasing_requests_statuses', 1),
(12, '2021_07_01_065536_create_bills', 1),
(13, '2021_07_01_065536_create_cheques', 1),
(14, '2021_07_01_065536_create_credit_cards', 1),
(15, '2021_07_01_065536_create_employees', 1),
(16, '2021_07_05_092919_create_payment_requests', 1),
(17, '2021_07_05_092919_create_personnel_cards', 1),
(18, '2021_07_05_145128_create_annual_leave_reports', 1),
(19, '2021_07_05_145128_create_annual_leaves', 1),
(20, '2021_07_05_145128_create_check_registration', 1),
(21, '2021_07_05_145128_create_liability', 1),
(22, '2021_07_05_145128_create_payment_requests_files', 1),
(23, '2021_07_05_145128_create_personnel_files', 1),
(24, '2021_07_05_145128_create_personnel_photos', 1),
(25, '2021_07_05_145128_create_trial_period', 1),
(26, '2021_10_15_185352_create_permission_tables', 1),
(28, '2022_11_16_121424_purchasing_offers', 1),
(29, '2022_11_16_121449_purchasing_files', 1),
(30, '2021_07_01_065534_create_departments', 2),
(31, '2021_07_01_065534_create_company_types', 3),
(35, '2022_11_16_121422_purchasing_requests', 4),
(36, '2019_12_14_000001_create_personal_access_tokens_table', 5);

-- --------------------------------------------------------

--
-- Structure de la table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(5, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('murat.yucel@hotelistan.com', '51594', '2023-05-31 05:41:16'),
('adnane.sougmi@hotelistan.com', '15914', '2023-05-31 09:33:03'),
('serkan.agca@hotelistan.com', '51764', '2023-06-23 05:59:02');

-- --------------------------------------------------------

--
-- Structure de la table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_time` timestamp NULL DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_request_status_id` int(10) UNSIGNED NOT NULL,
  `payment_request_category_id` int(10) UNSIGNED NOT NULL,
  `pay_company_id` int(10) UNSIGNED NOT NULL,
  `paid_company_id` int(10) UNSIGNED NOT NULL,
  `document_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_date` date DEFAULT NULL,
  `payment_type_id` int(10) UNSIGNED NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `answer_note` longtext COLLATE utf8mb4_unicode_ci,
  `is_suitable` int(11) DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `answered_user_id` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_requests`
--

INSERT INTO `payment_requests` (`id`, `post_time`, `expiry_date`, `payment_amount`, `payment_amount_currency`, `payment_request_status_id`, `payment_request_category_id`, `pay_company_id`, `paid_company_id`, `document_no`, `document_date`, `payment_type_id`, `invoice_date`, `answer_note`, `is_suitable`, `note`, `user_id`, `answered_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, '2023-03-07', '1200', 'EUR', 1, 3, 49, 2, '346565', '2023-03-08', 1, '2023-03-15', NULL, NULL, NULL, 3, NULL, NULL, '2023-03-07 11:12:56', '2023-03-07 11:12:56'),
(2, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mart 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(3, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mart 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(4, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Nisan 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(5, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Nisan 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(6, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mayıs 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(7, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mayıs 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(8, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Haziran 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(9, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Haziran 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(10, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Temmuz 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(11, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Temmuz 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(12, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ağustos 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(13, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ağustos 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(14, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Eylül 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(15, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Eylül 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(16, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ekim 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(17, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ekim 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(18, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kasım 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(19, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kasım 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(20, NULL, NULL, '18998', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aralık 2023 Ofis Kira Bedeli (2 ofis: D8-D10)', 1, NULL, NULL, NULL, NULL),
(21, NULL, NULL, '4500', 'TL', 1, 1, 214, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aralık 2023 Ofis Aidat Bedeli (3 ofis: D8-D9-D10)', 1, NULL, NULL, NULL, NULL),
(22, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Mart 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(23, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Nisan 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(24, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Mayıs 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(25, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Haziran 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(26, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Temmuz 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(27, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Ağustos 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(28, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Eylül 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(29, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Ekim 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(30, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Kasım 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(31, NULL, NULL, '19834', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Maslak Şb. Aralık 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(32, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Mart 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(33, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Nisan 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(34, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Mayıs 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(35, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Haziran 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(36, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Temmuz 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(37, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Ağustos 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(38, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Eylül 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(39, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Ekim 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(40, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Kasım 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(41, NULL, NULL, '6500', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasımpaşa Ofis Aralık 2023 kira bedeli', 1, NULL, NULL, NULL, NULL),
(42, NULL, NULL, '1243', 'TL', 1, 1, 33, 2, NULL, NULL, 3, NULL, NULL, NULL, 'Mart 2020 Maaş Ödemesi / Merkez Personeli Mubeen Imad Abdula Al-Mulay banka hs. bilgileri olmadığı ve ptt kapalı olduğu için ödenemedi', 1, NULL, NULL, NULL, NULL),
(43, NULL, NULL, '36944', 'TL', 1, 1, 271, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1021 - 30.Taksit (Salıpazarı Şb. Hs. No:1058)', 1, NULL, NULL, NULL, NULL),
(44, NULL, NULL, '36944', 'TL', 1, 1, 271, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1021 - 31.Taksit (Salıpazarı Şb. Hs. No:1058) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(45, NULL, NULL, '3900', 'TL', 1, 1, 487, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ssk ödemesi için', 1, NULL, NULL, NULL, NULL),
(46, NULL, NULL, '35763', 'TL', 1, 1, 274, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No: 6500416957 - 28. Taksit', 1, NULL, NULL, NULL, NULL),
(47, NULL, NULL, '35763', 'TL', 1, 1, 274, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No: 6500416957 - 29. Taksit', 1, NULL, NULL, NULL, NULL),
(48, NULL, NULL, '35763', 'TL', 1, 1, 274, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No: 6500416957 - 30. Taksit', 1, NULL, NULL, NULL, NULL),
(49, NULL, NULL, '35763', 'TL', 1, 1, 274, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No: 6500416957 - 31. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(50, NULL, NULL, '2000', 'TL', 1, 1, 298, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Maske Alımı', 1, NULL, NULL, NULL, NULL),
(51, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 18. Taksit', 1, NULL, NULL, NULL, NULL),
(52, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 19. Taksit', 1, NULL, NULL, NULL, NULL),
(53, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 20. Taksit', 1, NULL, NULL, NULL, NULL),
(54, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 21. Taksit', 1, NULL, NULL, NULL, NULL),
(55, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 22. Taksit', 1, NULL, NULL, NULL, NULL),
(56, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 23. Taksit', 1, NULL, NULL, NULL, NULL),
(57, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 24. Taksit', 1, NULL, NULL, NULL, NULL),
(58, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 25. Taksit', 1, NULL, NULL, NULL, NULL),
(59, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 26. Taksit', 1, NULL, NULL, NULL, NULL),
(60, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 27. Taksit', 1, NULL, NULL, NULL, NULL),
(61, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 28. Taksit', 1, NULL, NULL, NULL, NULL),
(62, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 29. Taksit', 1, NULL, NULL, NULL, NULL),
(63, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 30. Taksit', 1, NULL, NULL, NULL, NULL),
(64, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 31. Taksit', 1, NULL, NULL, NULL, NULL),
(65, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 32. Taksit', 1, NULL, NULL, NULL, NULL),
(66, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 33. Taksit', 1, NULL, NULL, NULL, NULL),
(67, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 34. Taksit', 1, NULL, NULL, NULL, NULL),
(68, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 35. Taksit', 1, NULL, NULL, NULL, NULL),
(69, NULL, NULL, '60858', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 36. Taksit', 1, NULL, NULL, NULL, NULL),
(70, NULL, NULL, '60857', 'TL', 1, 1, 319, 2, NULL, NULL, 2, NULL, NULL, NULL, 'K9000921 No.lu Kredi 37. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(71, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Mart 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(72, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Nisan 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(73, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Mayıs 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(74, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Haziran 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(75, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Temmuz 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(76, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Ağustos 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(77, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Eylül 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(78, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Ekim 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(79, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Kasım 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(80, NULL, NULL, '21476', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice - Kete Restoran Aralık 2023 kira Bedeli - Aykaç Gayrimenkul', 1, NULL, NULL, NULL, NULL),
(81, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mart 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(82, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Nisan 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(83, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mayıs 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(84, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Haziran 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(85, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Temmuz 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(86, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ağustos 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(87, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Eylül 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(88, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ekim 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(89, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kasım 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(90, NULL, NULL, '6490', 'TL', 1, 1, 106, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aralık 2023 No:9 Kira Bedeli Kdv Dahil (5500 tl + Kdv )', 1, NULL, NULL, NULL, NULL),
(91, NULL, NULL, '133709', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2021 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(92, NULL, NULL, '7314', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2021 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(93, NULL, NULL, '5622', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2021 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(94, NULL, NULL, '46864', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2021 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(95, NULL, NULL, '38289', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2021 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(96, NULL, NULL, '149741', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2021 Dönemi - Son Ödeme 30/07', 1, NULL, NULL, NULL, NULL),
(97, NULL, NULL, '9386', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2021 Dönemi - Son Ödeme 30/07', 1, NULL, NULL, NULL, NULL),
(98, NULL, NULL, '10435', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2021 Dönemi - Son Ödeme 30/07', 1, NULL, NULL, NULL, NULL),
(99, NULL, NULL, '48627', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2021 Dönemi - Son Ödeme 30/07', 1, NULL, NULL, NULL, NULL),
(100, NULL, NULL, '41454', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2021 Dönemi - Son Ödeme 30/07', 1, NULL, NULL, NULL, NULL),
(101, NULL, NULL, '137983', 'TL', 1, 1, 355, 2, NULL, NULL, 2, NULL, NULL, NULL, '2020-2021 Yılı Borç Yapılandırma / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(102, NULL, NULL, '18720', 'TL', 1, 1, 356, 2, NULL, NULL, 2, NULL, NULL, NULL, '2020-2021 Yılı Borç Yapılandırma / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(103, NULL, NULL, '11330', 'TL', 1, 1, 357, 2, NULL, NULL, 2, NULL, NULL, NULL, '2020-2021 Yılı Borç Yapılandırma / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(104, NULL, NULL, '7740', 'TL', 1, 1, 358, 2, NULL, NULL, 2, NULL, NULL, NULL, '2020-2021 Yılı Borç Yapılandırma / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(105, NULL, NULL, '58904', 'TL', 1, 1, 359, 2, NULL, NULL, 2, NULL, NULL, NULL, '2020-2021 Yılı Borç Yapılandırma / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(106, NULL, NULL, '43630', 'TL', 1, 1, 360, 2, NULL, NULL, 2, NULL, NULL, NULL, '2020-2021 Yılı Borç Yapılandırma / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(107, NULL, NULL, '257177', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2021 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(108, NULL, NULL, '26031', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2021 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(109, NULL, NULL, '30856', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2021 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(110, NULL, NULL, '108320', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2021 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(111, NULL, NULL, '73253', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2021 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(112, NULL, NULL, '285689', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2021 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(113, NULL, NULL, '25995', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2021 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(114, NULL, NULL, '30377', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2021 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(115, NULL, NULL, '101801', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2021 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(116, NULL, NULL, '70411', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2021 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(117, NULL, NULL, '309684', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(118, NULL, NULL, '43255', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(119, NULL, NULL, '25123', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(120, NULL, NULL, '29836', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(121, NULL, NULL, '98213', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(122, NULL, NULL, '72546', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(123, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 16.Taksit', 1, NULL, NULL, NULL, NULL),
(124, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 17.Taksit', 1, NULL, NULL, NULL, NULL),
(125, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 18.Taksit', 1, NULL, NULL, NULL, NULL),
(126, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 19.Taksit', 1, NULL, NULL, NULL, NULL),
(127, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 20.Taksit', 1, NULL, NULL, NULL, NULL),
(128, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 21.Taksit', 1, NULL, NULL, NULL, NULL),
(129, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 22.Taksit', 1, NULL, NULL, NULL, NULL),
(130, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 23.Taksit', 1, NULL, NULL, NULL, NULL),
(131, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 24.Taksit', 1, NULL, NULL, NULL, NULL),
(132, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 25.Taksit', 1, NULL, NULL, NULL, NULL),
(133, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 26.Taksit', 1, NULL, NULL, NULL, NULL),
(134, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 27.Taksit', 1, NULL, NULL, NULL, NULL),
(135, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 28.Taksit', 1, NULL, NULL, NULL, NULL),
(136, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 29.Taksit', 1, NULL, NULL, NULL, NULL),
(137, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 30.Taksit', 1, NULL, NULL, NULL, NULL),
(138, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 31.Taksit', 1, NULL, NULL, NULL, NULL),
(139, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 32.Taksit', 1, NULL, NULL, NULL, NULL),
(140, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 33.Taksit', 1, NULL, NULL, NULL, NULL),
(141, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 34.Taksit', 1, NULL, NULL, NULL, NULL),
(142, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 35.Taksit', 1, NULL, NULL, NULL, NULL),
(143, NULL, NULL, '17387', 'TL', 1, 1, 368, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi Hesap No:1067 - 36.Taksit', 1, NULL, NULL, NULL, NULL),
(144, NULL, NULL, '344066', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2021 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(145, NULL, NULL, '45745', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2021 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(146, NULL, NULL, '27491', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2021 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(147, NULL, NULL, '32461', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2021 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(148, NULL, NULL, '97235', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2021 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(149, NULL, NULL, '71590', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2021 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(150, NULL, NULL, '380', 'TL', 1, 1, 377, 2, NULL, NULL, 1, NULL, NULL, NULL, '09/2021 Dönemi - Son ödeme 26/10', 1, NULL, NULL, NULL, NULL),
(151, NULL, NULL, '1', 'TL', 1, 1, 379, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2021 Dönemi - Son ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(152, NULL, NULL, '340234', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2021 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(153, NULL, NULL, '37977', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2021 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(154, NULL, NULL, '27506', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2021 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(155, NULL, NULL, '31984', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2021 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(156, NULL, NULL, '107269', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2021 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(157, NULL, NULL, '73210', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2021 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(158, NULL, NULL, '210741', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 26/01', 1, NULL, NULL, NULL, NULL),
(159, NULL, NULL, '57755', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(160, NULL, NULL, '371532', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(161, NULL, NULL, '34968', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(162, NULL, NULL, '29426', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(163, NULL, NULL, '34221', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(164, NULL, NULL, '110715', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(165, NULL, NULL, '81693', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2021 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(166, NULL, NULL, '231685', 'TL', 1, 1, 50, 2, NULL, NULL, 1, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 26/02', 1, NULL, NULL, NULL, NULL),
(167, NULL, NULL, '86376', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 26/02', 1, NULL, NULL, NULL, NULL),
(168, NULL, NULL, '59809', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02', 1, NULL, NULL, NULL, NULL),
(169, NULL, NULL, '431795', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02 - İndirimsiz 434.420,95 tl', 1, NULL, NULL, NULL, NULL),
(170, NULL, NULL, '51978', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02 - İndirimsiz 52.383,27 tl', 1, NULL, NULL, NULL, NULL),
(171, NULL, NULL, '42162', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02 - İndirimsiz 42.429,59 tl', 1, NULL, NULL, NULL, NULL),
(172, NULL, NULL, '50705', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02 - İndirimsiz 50.835,13 tl', 1, NULL, NULL, NULL, NULL),
(173, NULL, NULL, '160033', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02 - İndirimsiz 161.118,16 tl', 1, NULL, NULL, NULL, NULL),
(174, NULL, NULL, '105524', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '01/2022 Dönemi - Son Ödeme 28/02 - İndirimsiz 105.869,62 tl', 1, NULL, NULL, NULL, NULL),
(175, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 12. Taksit', 1, NULL, NULL, NULL, NULL),
(176, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 13. Taksit', 1, NULL, NULL, NULL, NULL),
(177, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 14. Taksit', 1, NULL, NULL, NULL, NULL),
(178, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 15. Taksit', 1, NULL, NULL, NULL, NULL),
(179, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 16. Taksit', 1, NULL, NULL, NULL, NULL),
(180, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 17. Taksit', 1, NULL, NULL, NULL, NULL),
(181, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 18. Taksit', 1, NULL, NULL, NULL, NULL),
(182, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 19. Taksit', 1, NULL, NULL, NULL, NULL),
(183, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 20. Taksit', 1, NULL, NULL, NULL, NULL),
(184, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 21. Taksit', 1, NULL, NULL, NULL, NULL),
(185, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 22. Taksit', 1, NULL, NULL, NULL, NULL),
(186, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 23. Taksit', 1, NULL, NULL, NULL, NULL),
(187, NULL, NULL, '48675', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17721270-8-1 / 24. Taksit / Son taksit', 1, NULL, NULL, NULL, NULL),
(188, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 11. Taksit', 1, NULL, NULL, NULL, NULL),
(189, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 12. Taksit', 1, NULL, NULL, NULL, NULL),
(190, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 13. Taksit', 1, NULL, NULL, NULL, NULL),
(191, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 14. Taksit', 1, NULL, NULL, NULL, NULL),
(192, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 15. Taksit', 1, NULL, NULL, NULL, NULL),
(193, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 16. Taksit', 1, NULL, NULL, NULL, NULL),
(194, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 17. Taksit', 1, NULL, NULL, NULL, NULL),
(195, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 18. Taksit', 1, NULL, NULL, NULL, NULL),
(196, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 19. Taksit', 1, NULL, NULL, NULL, NULL),
(197, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 20. Taksit', 1, NULL, NULL, NULL, NULL),
(198, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 21. Taksit', 1, NULL, NULL, NULL, NULL),
(199, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 22. Taksit', 1, NULL, NULL, NULL, NULL),
(200, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 23. Taksit', 1, NULL, NULL, NULL, NULL),
(201, NULL, NULL, '120372', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17996181-11-1 / 24. Taksit / Son taksit', 1, NULL, NULL, NULL, NULL),
(202, NULL, NULL, '252034', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 26/03', 1, NULL, NULL, NULL, NULL),
(203, NULL, NULL, '8754', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi Düzeltme Beyanı - Son Ödeme 26/03', 1, NULL, NULL, NULL, NULL),
(204, NULL, NULL, '81579', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 26/03', 1, NULL, NULL, NULL, NULL),
(205, NULL, NULL, '55873', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(206, NULL, NULL, '418020', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(207, NULL, NULL, '55639', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(208, NULL, NULL, '42227', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(209, NULL, NULL, '47514', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(210, NULL, NULL, '172738', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(211, NULL, NULL, '106056', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '02/2022 Dönemi - Son Ödeme 31/03', 1, NULL, NULL, NULL, NULL),
(212, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 11. Taksit', 1, NULL, NULL, NULL, NULL),
(213, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 12. Taksit', 1, NULL, NULL, NULL, NULL),
(214, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 13. Taksit', 1, NULL, NULL, NULL, NULL),
(215, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 14. Taksit', 1, NULL, NULL, NULL, NULL),
(216, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 15. Taksit', 1, NULL, NULL, NULL, NULL),
(217, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 16. Taksit', 1, NULL, NULL, NULL, NULL),
(218, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 17. Taksit', 1, NULL, NULL, NULL, NULL),
(219, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 18. Taksit', 1, NULL, NULL, NULL, NULL),
(220, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 19. Taksit', 1, NULL, NULL, NULL, NULL),
(221, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 20. Taksit', 1, NULL, NULL, NULL, NULL),
(222, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 21. Taksit', 1, NULL, NULL, NULL, NULL),
(223, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 22. Taksit', 1, NULL, NULL, NULL, NULL),
(224, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 23. Taksit', 1, NULL, NULL, NULL, NULL),
(225, NULL, NULL, '34734', 'TL', 1, 1, 369, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 18040953-13-1 / 24. Taksit / Son taksit', 1, NULL, NULL, NULL, NULL),
(226, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 11. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(227, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 12. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(228, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 13. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(229, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 14. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(230, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 15. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(231, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 16. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(232, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 17. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(233, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 18. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(234, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 19. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(235, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 20. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(236, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 21. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(237, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 22. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(238, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 23. Taksit Ödemesi (34 FBR 407)', 1, NULL, NULL, NULL, NULL),
(239, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027277 - 24. Taksit Ödemesi (34 FBR 407) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(240, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 11. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(241, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 12. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(242, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 13. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(243, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 14. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(244, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 15. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(245, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 16. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(246, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 17. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(247, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 18. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(248, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 19. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(249, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 20. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(250, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 21. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(251, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 22. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(252, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 23. Taksit Ödemesi (34 FBY 797)', 1, NULL, NULL, NULL, NULL),
(253, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027292 - 24. Taksit Ödemesi (34 FBY 797) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(254, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 11. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(255, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 12. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(256, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 13. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(257, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 14. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(258, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 15. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(259, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 16. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(260, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 17. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(261, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 18. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(262, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 19. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(263, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 20. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(264, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 21. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(265, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 22. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(266, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 23. Taksit Ödemesi (34 FBY 806)', 1, NULL, NULL, NULL, NULL),
(267, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027291 - 24. Taksit Ödemesi (34 FBY 806) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(268, NULL, NULL, '17567', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 A1027238- 12. Taksit Ödemesi (34 EBY 205) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(269, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 11. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(270, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 12. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(271, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 13. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(272, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 14. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(273, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 15. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(274, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 16. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(275, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 17. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(276, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 18. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(277, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 19. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(278, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 20. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(279, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 21. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(280, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 22. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(281, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 23. Taksit Ödemesi (34 FBY 794)', 1, NULL, NULL, NULL, NULL),
(282, NULL, NULL, '29819', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027294 - 24. Taksit Ödemesi (34 FBY 794) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(283, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 11. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(284, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 12. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(285, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 13. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(286, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 14. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(287, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 15. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(288, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 16. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(289, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 17. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(290, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 18. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(291, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 19. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(292, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 20. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(293, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 21. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(294, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 22. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(295, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 23. Taksit Ödemesi (34 FBR 928)', 1, NULL, NULL, NULL, NULL),
(296, NULL, NULL, '31666', 'TL', 1, 1, 372, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi No: 124 P6027276 - 24. Taksit Ödemesi (34 FBR 928) / Son Taksit', 1, NULL, NULL, NULL, NULL),
(297, NULL, NULL, '15800', 'TL', 1, 1, 373, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kira Bedeli: 3.006,95 tl + k.kartı ödemesi 12.770,00 tl için Gknlar hesabına göndermemiz gerekmektedir.', 1, NULL, NULL, NULL, NULL),
(298, NULL, NULL, '216113', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 26/04', 1, NULL, NULL, NULL, NULL),
(299, NULL, NULL, '96132', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 26/04', 1, NULL, NULL, NULL, NULL),
(300, NULL, NULL, '140083', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(301, NULL, NULL, '408175', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(302, NULL, NULL, '65738', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(303, NULL, NULL, '41300', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(304, NULL, NULL, '49127', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(305, NULL, NULL, '185195', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(306, NULL, NULL, '109862', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '03/2022 Dönemi - Son Ödeme 30/04', 1, NULL, NULL, NULL, NULL),
(307, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 11. Taksit', 1, NULL, NULL, NULL, NULL),
(308, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 12. Taksit', 1, NULL, NULL, NULL, NULL),
(309, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 13. Taksit', 1, NULL, NULL, NULL, NULL),
(310, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 14. Taksit', 1, NULL, NULL, NULL, NULL),
(311, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 15. Taksit', 1, NULL, NULL, NULL, NULL),
(312, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 16. Taksit', 1, NULL, NULL, NULL, NULL),
(313, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 17. Taksit', 1, NULL, NULL, NULL, NULL),
(314, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 18. Taksit', 1, NULL, NULL, NULL, NULL),
(315, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 19. Taksit', 1, NULL, NULL, NULL, NULL),
(316, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 20. Taksit', 1, NULL, NULL, NULL, NULL),
(317, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 21. Taksit', 1, NULL, NULL, NULL, NULL),
(318, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 22. Taksit', 1, NULL, NULL, NULL, NULL),
(319, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 23. Taksit', 1, NULL, NULL, NULL, NULL),
(320, NULL, NULL, '72175', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22012389 34FCM711 24. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(321, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 9. Taksit', 1, NULL, NULL, NULL, NULL),
(322, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 10. Taksit', 1, NULL, NULL, NULL, NULL),
(323, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 11. Taksit', 1, NULL, NULL, NULL, NULL),
(324, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 12. Taksit', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payment_requests` (`id`, `post_time`, `expiry_date`, `payment_amount`, `payment_amount_currency`, `payment_request_status_id`, `payment_request_category_id`, `pay_company_id`, `paid_company_id`, `document_no`, `document_date`, `payment_type_id`, `invoice_date`, `answer_note`, `is_suitable`, `note`, `user_id`, `answered_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(325, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 13. Taksit', 1, NULL, NULL, NULL, NULL),
(326, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 14. Taksit', 1, NULL, NULL, NULL, NULL),
(327, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 15. Taksit', 1, NULL, NULL, NULL, NULL),
(328, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 16. Taksit', 1, NULL, NULL, NULL, NULL),
(329, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 17. Taksit', 1, NULL, NULL, NULL, NULL),
(330, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 18. Taksit', 1, NULL, NULL, NULL, NULL),
(331, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 19. Taksit', 1, NULL, NULL, NULL, NULL),
(332, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 20. Taksit', 1, NULL, NULL, NULL, NULL),
(333, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 21. Taksit', 1, NULL, NULL, NULL, NULL),
(334, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 22. Taksit', 1, NULL, NULL, NULL, NULL),
(335, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 23. Taksit', 1, NULL, NULL, NULL, NULL),
(336, NULL, NULL, '43452', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22016116 34FKC371 24. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(337, NULL, NULL, '58410', 'TL', 1, 1, 418, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hür Han A Blok Kat 7 15.02.2023-15.05.2023 Dönemi Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(338, NULL, NULL, '14160', 'TL', 1, 1, 418, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hür Han B Blok Kat 5 - Mart 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(339, NULL, NULL, '14160', 'TL', 1, 1, 418, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hür Han B Blok Kat 5 - Nisan 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(340, NULL, NULL, '14160', 'TL', 1, 1, 418, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hür Han B Blok Kat 5 - Mayıs 2023 Kira Ödemesi', 1, NULL, NULL, NULL, NULL),
(341, NULL, NULL, '114232', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 26/05', 1, NULL, NULL, NULL, NULL),
(342, NULL, NULL, '407498', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 26/05', 1, NULL, NULL, NULL, NULL),
(343, NULL, NULL, '56609', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(344, NULL, NULL, '424686', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(345, NULL, NULL, '56062', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(346, NULL, NULL, '43342', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(347, NULL, NULL, '52763', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(348, NULL, NULL, '189019', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(349, NULL, NULL, '109885', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '04/2022 Dönemi - Son Ödeme 31/05', 1, NULL, NULL, NULL, NULL),
(350, NULL, NULL, '100000', 'TL', 1, 1, 420, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Vergi dairesinde yapılan görüşmeye istinaden peşin ödeme yapılacağı sözü verilmiştir.', 1, NULL, NULL, NULL, NULL),
(351, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 9. Taksit', 1, NULL, NULL, NULL, NULL),
(352, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 10. Taksit', 1, NULL, NULL, NULL, NULL),
(353, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 11. Taksit', 1, NULL, NULL, NULL, NULL),
(354, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 12. Taksit', 1, NULL, NULL, NULL, NULL),
(355, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 13. Taksit', 1, NULL, NULL, NULL, NULL),
(356, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 14. Taksit', 1, NULL, NULL, NULL, NULL),
(357, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 15. Taksit', 1, NULL, NULL, NULL, NULL),
(358, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 16. Taksit', 1, NULL, NULL, NULL, NULL),
(359, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 17. Taksit', 1, NULL, NULL, NULL, NULL),
(360, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 18. Taksit', 1, NULL, NULL, NULL, NULL),
(361, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 19. Taksit', 1, NULL, NULL, NULL, NULL),
(362, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 20. Taksit', 1, NULL, NULL, NULL, NULL),
(363, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 21. Taksit', 1, NULL, NULL, NULL, NULL),
(364, NULL, NULL, '10150', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 22. Taksit', 1, NULL, NULL, NULL, NULL),
(365, NULL, NULL, '10151', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ykb 124 A1028035 Bireysel Taşıt Kredisi - 23. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(366, NULL, NULL, '29842', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 1. Taksit', 1, NULL, NULL, NULL, NULL),
(367, NULL, NULL, '29842', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 2. Taksit', 1, NULL, NULL, NULL, NULL),
(368, NULL, NULL, '29842', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 3. Taksit', 1, NULL, NULL, NULL, NULL),
(369, NULL, NULL, '29842', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 4. Taksit', 1, NULL, NULL, NULL, NULL),
(370, NULL, NULL, '29842', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 5. Taksit', 1, NULL, NULL, NULL, NULL),
(371, NULL, NULL, '29842', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 6. Taksit', 1, NULL, NULL, NULL, NULL),
(372, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 7. Taksit', 1, NULL, NULL, NULL, NULL),
(373, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 8. Taksit', 1, NULL, NULL, NULL, NULL),
(374, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 9. Taksit', 1, NULL, NULL, NULL, NULL),
(375, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 10. Taksit', 1, NULL, NULL, NULL, NULL),
(376, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 11. Taksit', 1, NULL, NULL, NULL, NULL),
(377, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 12. Taksit', 1, NULL, NULL, NULL, NULL),
(378, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 13. Taksit', 1, NULL, NULL, NULL, NULL),
(379, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 14. Taksit', 1, NULL, NULL, NULL, NULL),
(380, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 15. Taksit', 1, NULL, NULL, NULL, NULL),
(381, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 16. Taksit', 1, NULL, NULL, NULL, NULL),
(382, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 17. Taksit', 1, NULL, NULL, NULL, NULL),
(383, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 18. Taksit', 1, NULL, NULL, NULL, NULL),
(384, NULL, NULL, '32830', 'TL', 1, 1, 41, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Bey Adına Ataform Tekstil\'in Çektiği Bireysel Kredi - 19. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(385, NULL, NULL, '8114', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 26/06', 1, NULL, NULL, NULL, NULL),
(386, NULL, NULL, '2420', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(387, NULL, NULL, '14058', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(388, NULL, NULL, '14403', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(389, NULL, NULL, '435134', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 26/06', 1, NULL, NULL, NULL, NULL),
(390, NULL, NULL, '180578', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 26/06', 1, NULL, NULL, NULL, NULL),
(391, NULL, NULL, '15135', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi Ek Beyanname - Son Ödeme 26/06', 1, NULL, NULL, NULL, NULL),
(392, NULL, NULL, '92093', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(393, NULL, NULL, '13135', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(394, NULL, NULL, '125559', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(395, NULL, NULL, '475175', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(396, NULL, NULL, '63689', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(397, NULL, NULL, '54672', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(398, NULL, NULL, '63399', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(399, NULL, NULL, '212253', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(400, NULL, NULL, '129213', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '05/2022 Dönemi - Son Ödeme 30/06', 1, NULL, NULL, NULL, NULL),
(401, NULL, NULL, '45312', 'TL', 1, 1, 432, 2, NULL, NULL, 2, NULL, NULL, NULL, '51 Ad.Araç Filo Kasko 8.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(402, NULL, NULL, '45312', 'TL', 1, 1, 432, 2, NULL, NULL, 2, NULL, NULL, NULL, '51 Ad.Araç Filo Kasko 9.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(403, NULL, NULL, '45312', 'TL', 1, 1, 432, 2, NULL, NULL, 2, NULL, NULL, NULL, '51 Ad.Araç Filo Kasko 10.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(404, NULL, NULL, '106', 'TL', 1, 1, 138, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(405, NULL, NULL, '10', 'TL', 1, 1, 138, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(406, NULL, NULL, '8982', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 26/07', 1, NULL, NULL, NULL, NULL),
(407, NULL, NULL, '2959', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(408, NULL, NULL, '16388', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(409, NULL, NULL, '22322', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(410, NULL, NULL, '633472', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 26/07', 1, NULL, NULL, NULL, NULL),
(411, NULL, NULL, '55036', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi Düzeltme Beyanı - Son Ödeme 26/07', 1, NULL, NULL, NULL, NULL),
(412, NULL, NULL, '184343', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 26/07', 1, NULL, NULL, NULL, NULL),
(413, NULL, NULL, '102762', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(414, NULL, NULL, '14238', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(415, NULL, NULL, '142858', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(416, NULL, NULL, '488164', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(417, NULL, NULL, '67309', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(418, NULL, NULL, '46640', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(419, NULL, NULL, '45630', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(420, NULL, NULL, '186397', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(421, NULL, NULL, '119972', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '06/2022 Dönemi - Son Ödeme 31/07', 1, NULL, NULL, NULL, NULL),
(422, NULL, NULL, '26590', 'TL', 1, 1, 203, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 26/08', 1, NULL, NULL, NULL, NULL),
(423, NULL, NULL, '11555', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 26/08', 1, NULL, NULL, NULL, NULL),
(424, NULL, NULL, '2858', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(425, NULL, NULL, '23725', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(426, NULL, NULL, '25204', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(427, NULL, NULL, '559403', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 26/08', 1, NULL, NULL, NULL, NULL),
(428, NULL, NULL, '268899', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 26/08', 1, NULL, NULL, NULL, NULL),
(429, NULL, NULL, '128417', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(430, NULL, NULL, '580105', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(431, NULL, NULL, '16662', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(432, NULL, NULL, '170754', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(433, NULL, NULL, '87870', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(434, NULL, NULL, '75713', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(435, NULL, NULL, '61825', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(436, NULL, NULL, '262276', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(437, NULL, NULL, '180341', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022 Dönemi - Son Ödeme 31/08', 1, NULL, NULL, NULL, NULL),
(438, NULL, NULL, '3300', 'TL', 1, 1, 188, 2, NULL, NULL, 2, NULL, NULL, NULL, '34BNR050 2 adet lastik alımı', 1, NULL, NULL, NULL, NULL),
(439, NULL, NULL, '7400', 'TL', 1, 1, 188, 2, NULL, NULL, 2, NULL, NULL, NULL, '34FBR407 4 Adet Lastik Alımı', 1, NULL, NULL, NULL, NULL),
(440, NULL, NULL, '10000', 'TL', 1, 1, 188, 2, NULL, NULL, 2, NULL, NULL, NULL, '34ZH9312 4 Adet Lastik Alımı', 1, NULL, NULL, NULL, NULL),
(441, NULL, NULL, '919522', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 26/09', 1, NULL, NULL, NULL, NULL),
(442, NULL, NULL, '237573', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 26/09', 1, NULL, NULL, NULL, NULL),
(443, NULL, NULL, '160614', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(444, NULL, NULL, '626823', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(445, NULL, NULL, '16349', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(446, NULL, NULL, '168248', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(447, NULL, NULL, '46468', 'TL', 1, 1, 462, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09 - Hür Han K:5', 1, NULL, NULL, NULL, NULL),
(448, NULL, NULL, '79772', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(449, NULL, NULL, '74885', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(450, NULL, NULL, '61451', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(451, NULL, NULL, '226560', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(452, NULL, NULL, '156528', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09', 1, NULL, NULL, NULL, NULL),
(453, NULL, NULL, '11258', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 26/09', 1, NULL, NULL, NULL, NULL),
(454, NULL, NULL, '2732', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(455, NULL, NULL, '24045', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(456, NULL, NULL, '25851', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '08/2022 Dönemi - Son Ödeme 30/09 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(457, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 5.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(458, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 6.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(459, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 7.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(460, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 8.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(461, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 9.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(462, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 10.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(463, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 11.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(464, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 12.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(465, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 13.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(466, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 14.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(467, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 15.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(468, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 16.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(469, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 17.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(470, NULL, NULL, '96028', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1812569 3 Ad.Reno Megane 18.Taksit 34FVA709-34FVA703-34FVA686', 1, NULL, NULL, NULL, NULL),
(471, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(472, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(473, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(474, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(475, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(476, NULL, NULL, '15000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(477, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(478, NULL, NULL, '10000000', 'TL', 1, 1, 488, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anb Turizm Yatırım İnşaat ve Ticaret A.Ş.', 1, NULL, NULL, NULL, NULL),
(479, NULL, NULL, '11408', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 26/10', 1, NULL, NULL, NULL, NULL),
(480, NULL, NULL, '5455', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(481, NULL, NULL, '23903', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(482, NULL, NULL, '25196', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(483, NULL, NULL, '255904', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 26/10', 1, NULL, NULL, NULL, NULL),
(484, NULL, NULL, '667731', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(485, NULL, NULL, '20903', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(486, NULL, NULL, '139266', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(487, NULL, NULL, '97832', 'TL', 1, 1, 462, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10 - Hür Han K:5', 1, NULL, NULL, NULL, NULL),
(488, NULL, NULL, '77856', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(489, NULL, NULL, '73047', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(490, NULL, NULL, '60521', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(491, NULL, NULL, '233917', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(492, NULL, NULL, '142036', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '09/2022 Dönemi - Son Ödeme 31/10', 1, NULL, NULL, NULL, NULL),
(493, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(494, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(495, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(496, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(497, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(498, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(499, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(500, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(501, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(502, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(503, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(504, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(505, NULL, NULL, '36371', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(506, NULL, NULL, '37182', 'TL', 1, 1, 445, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:220053169 Arpanu Turizm Peugeot Minibüs Araç Kredisi', 1, NULL, NULL, NULL, NULL),
(507, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 4.Taksit', 1, NULL, NULL, NULL, NULL),
(508, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 5.Taksit', 1, NULL, NULL, NULL, NULL),
(509, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:18143871 Ad.Reno Clio 6.Taksit', 1, NULL, NULL, NULL, NULL),
(510, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 7.Taksit', 1, NULL, NULL, NULL, NULL),
(511, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 8.Taksit', 1, NULL, NULL, NULL, NULL),
(512, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 9.Taksit', 1, NULL, NULL, NULL, NULL),
(513, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 10.Taksit', 1, NULL, NULL, NULL, NULL),
(514, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 11.Taksit', 1, NULL, NULL, NULL, NULL),
(515, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 12.Taksit', 1, NULL, NULL, NULL, NULL),
(516, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 13.Taksit', 1, NULL, NULL, NULL, NULL),
(517, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 14.Taksit', 1, NULL, NULL, NULL, NULL),
(518, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 15.Taksit', 1, NULL, NULL, NULL, NULL),
(519, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 16.Taksit', 1, NULL, NULL, NULL, NULL),
(520, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 17.Taksit', 1, NULL, NULL, NULL, NULL),
(521, NULL, NULL, '29652', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:1814387 1 Ad.Reno Clio 18.Taksit', 1, NULL, NULL, NULL, NULL),
(522, NULL, NULL, '24323', 'TL', 1, 1, 423, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(523, NULL, NULL, '65835', 'TL', 1, 1, 420, 2, NULL, NULL, 1, NULL, NULL, NULL, '02/11/2022 tarihli tecil ve taksitlendirme dilekçemize istinaden 3. Taksit', 1, NULL, NULL, NULL, NULL),
(524, NULL, NULL, '65835', 'TL', 1, 1, 420, 2, NULL, NULL, 1, NULL, NULL, NULL, '02/11/2022 tarihli tecil ve taksitlendirme dilekçemize istinaden 4. Taksit', 1, NULL, NULL, NULL, NULL),
(525, NULL, NULL, '65835', 'TL', 1, 1, 420, 2, NULL, NULL, 1, NULL, NULL, NULL, '02/11/2022 tarihli tecil ve taksitlendirme dilekçemize istinaden 5. Taksit', 1, NULL, NULL, NULL, NULL),
(526, NULL, NULL, '65835', 'TL', 1, 1, 420, 2, NULL, NULL, 1, NULL, NULL, NULL, '02/11/2022 tarihli tecil ve taksitlendirme dilekçemize istinaden 6. Taksit', 1, NULL, NULL, NULL, NULL),
(527, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 4. Taksit', 1, NULL, NULL, NULL, NULL),
(528, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 5. Taksit', 1, NULL, NULL, NULL, NULL),
(529, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 6. Taksit', 1, NULL, NULL, NULL, NULL),
(530, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 7. Taksit', 1, NULL, NULL, NULL, NULL),
(531, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 8. Taksit', 1, NULL, NULL, NULL, NULL),
(532, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 9. Taksit', 1, NULL, NULL, NULL, NULL),
(533, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 10. Taksit', 1, NULL, NULL, NULL, NULL),
(534, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 11. Taksit', 1, NULL, NULL, NULL, NULL),
(535, NULL, NULL, '1697316', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 17455447-7-6 / 12. Taksit', 1, NULL, NULL, NULL, NULL),
(536, NULL, NULL, '136', 'TL', 1, 1, 450, 2, NULL, NULL, 2, NULL, NULL, NULL, '07/2022-09/2022 Dönemi - Son Ödeme 17/11', 1, NULL, NULL, NULL, NULL),
(537, NULL, NULL, '1472429', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 26/11', 1, NULL, NULL, NULL, NULL),
(538, NULL, NULL, '329897', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 26/11', 1, NULL, NULL, NULL, NULL),
(539, NULL, NULL, '149522', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(540, NULL, NULL, '723638', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(541, NULL, NULL, '28934', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(542, NULL, NULL, '164545', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(543, NULL, NULL, '126923', 'TL', 1, 1, 462, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11 - Hür Han K:5', 1, NULL, NULL, NULL, NULL),
(544, NULL, NULL, '79413', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(545, NULL, NULL, '87722', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(546, NULL, NULL, '65225', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(547, NULL, NULL, '257821', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(548, NULL, NULL, '155436', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(549, NULL, NULL, '12806', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 26/11', 1, NULL, NULL, NULL, NULL),
(550, NULL, NULL, '18073', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(551, NULL, NULL, '24265', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(552, NULL, NULL, '20678', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(553, NULL, NULL, '163914', 'TL', 1, 1, 386, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 26/11', 1, NULL, NULL, NULL, NULL),
(554, NULL, NULL, '16373', 'TL', 1, 1, 387, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 26/11', 1, NULL, NULL, NULL, NULL),
(555, NULL, NULL, '36678', 'TL', 1, 1, 389, 2, NULL, NULL, 2, NULL, NULL, NULL, '10/2022 Dönemi - Son Ödeme 30/11', 1, NULL, NULL, NULL, NULL),
(556, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 3.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(557, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 4.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(558, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 4.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(559, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 6.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(560, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 7.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(561, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 8.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(562, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 9.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(563, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 10.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(564, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 11.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(565, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 12.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(566, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 13.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(567, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 14.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(568, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 15.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(569, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 16.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(570, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 17.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(571, NULL, NULL, '30777', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Renault Clio Kredi 18.Taksit Ödemesi Kredi No: 1814957', 1, NULL, NULL, NULL, NULL),
(572, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(573, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(574, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(575, NULL, NULL, '150000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Mühendislik Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(576, NULL, NULL, '300000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(577, NULL, NULL, '325000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(578, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(579, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(580, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(581, NULL, NULL, '300000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(582, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(583, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(584, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(585, NULL, NULL, '300000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(586, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(587, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(588, NULL, NULL, '500000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(589, NULL, NULL, '300000', 'TL', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ali Nahit Bozatlı - Şeker ailesine kiraya istineden Ali Bozatlı\'ya verilen çekler', 1, NULL, NULL, NULL, NULL),
(590, NULL, NULL, '253618', 'TL', 1, 1, 386, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 26/12', 1, NULL, NULL, NULL, NULL),
(591, NULL, NULL, '17239', 'TL', 1, 1, 387, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 26/12', 1, NULL, NULL, NULL, NULL),
(592, NULL, NULL, '57178', 'TL', 1, 1, 389, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(593, NULL, NULL, '15850', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 26/12', 1, NULL, NULL, NULL, NULL),
(594, NULL, NULL, '24606', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(595, NULL, NULL, '24328', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(596, NULL, NULL, '25515', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(597, NULL, NULL, '662999', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 28/12', 1, NULL, NULL, NULL, NULL),
(598, NULL, NULL, '216278', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(599, NULL, NULL, '360001', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 26/12', 1, NULL, NULL, NULL, NULL),
(600, NULL, NULL, '710293', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(601, NULL, NULL, '27758', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(602, NULL, NULL, '192243', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(603, NULL, NULL, '118045', 'TL', 1, 1, 462, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12 - Hür Han K:5', 1, NULL, NULL, NULL, NULL),
(604, NULL, NULL, '204102', 'TL', 1, 1, 452, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(605, NULL, NULL, '81963', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(606, NULL, NULL, '91885', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(607, NULL, NULL, '62175', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(608, NULL, NULL, '258215', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(609, NULL, NULL, '151874', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(610, NULL, NULL, '37279', 'TL', 1, 1, 463, 2, NULL, NULL, 2, NULL, NULL, NULL, '11/2022 Dönemi - Son Ödeme 31/12', 1, NULL, NULL, NULL, NULL),
(611, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 2. Taksit', 1, NULL, NULL, NULL, NULL),
(612, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 3. Taksit', 1, NULL, NULL, NULL, NULL),
(613, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 4. Taksit', 1, NULL, NULL, NULL, NULL),
(614, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 5. Taksit', 1, NULL, NULL, NULL, NULL),
(615, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 6. Taksit', 1, NULL, NULL, NULL, NULL),
(616, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 7. Taksit', 1, NULL, NULL, NULL, NULL),
(617, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 8. Taksit', 1, NULL, NULL, NULL, NULL),
(618, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 9. Taksit', 1, NULL, NULL, NULL, NULL),
(619, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 10. Taksit', 1, NULL, NULL, NULL, NULL),
(620, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 11. Taksit', 1, NULL, NULL, NULL, NULL),
(621, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 12. Taksit', 1, NULL, NULL, NULL, NULL),
(622, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 13. Taksit', 1, NULL, NULL, NULL, NULL),
(623, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 14. Taksit', 1, NULL, NULL, NULL, NULL),
(624, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 15. Taksit', 1, NULL, NULL, NULL, NULL),
(625, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 16. Taksit', 1, NULL, NULL, NULL, NULL),
(626, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 17. Taksit', 1, NULL, NULL, NULL, NULL),
(627, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 18. Taksit', 1, NULL, NULL, NULL, NULL),
(628, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 19. Taksit', 1, NULL, NULL, NULL, NULL),
(629, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 20. Taksit', 1, NULL, NULL, NULL, NULL),
(630, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 21. Taksit', 1, NULL, NULL, NULL, NULL),
(631, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 22. Taksit', 1, NULL, NULL, NULL, NULL),
(632, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 23. Taksit', 1, NULL, NULL, NULL, NULL),
(633, NULL, NULL, '52419', 'TL', 1, 1, 19, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sözleşme No:22025434 34GDG789 24. Taksit / Son Taksit', 1, NULL, NULL, NULL, NULL),
(634, NULL, NULL, '248', 'TL', 1, 1, 138, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(635, NULL, NULL, '725000', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hilton Bomonti Otel (Bomonti Ulus.Kong. ve Turz. Yat. Tic. A.Ş. Bomonti Şb.', 1, NULL, NULL, NULL, NULL),
(636, NULL, NULL, '129004', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Renk Dekorasyon İnş. Turz. San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(637, NULL, NULL, '70154', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Rodos Temizlik Gıda İnş. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(638, NULL, NULL, '469344', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar A.Ş.', 1, NULL, NULL, NULL, NULL),
(639, NULL, NULL, '319977', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Öztürk Genel Gıda Malzemeleri A.Ş.', 1, NULL, NULL, NULL, NULL);
INSERT INTO `payment_requests` (`id`, `post_time`, `expiry_date`, `payment_amount`, `payment_amount_currency`, `payment_request_status_id`, `payment_request_category_id`, `pay_company_id`, `paid_company_id`, `document_no`, `document_date`, `payment_type_id`, `invoice_date`, `answer_note`, `is_suitable`, `note`, `user_id`, `answered_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(640, NULL, NULL, '300000', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tevfik Kuruoğlu', 1, NULL, NULL, NULL, NULL),
(641, NULL, NULL, '150000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Otomotiv Gıda', 1, NULL, NULL, NULL, NULL),
(642, NULL, NULL, '149593', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Sim Teknoloji Hiz. San. Tic. Ltd.Şti.\'ne cari hesaba istinaden kesildi.', 1, NULL, NULL, NULL, NULL),
(643, NULL, NULL, '500000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Lava Dora Temizlik Hizm. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(644, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aksunğur Mobilya-Hayrettin Aksunğur', 1, NULL, NULL, NULL, NULL),
(645, NULL, NULL, '1000000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(646, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Masum Erkal', 1, NULL, NULL, NULL, NULL),
(647, NULL, NULL, '1000000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(648, NULL, NULL, '500000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Lava Dora Temizlik Hizm. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(649, NULL, NULL, '62737', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'İduğ Petrol Ürünleri Otomotiv Yed. Parça San. Tic. A.Ş', 1, NULL, NULL, NULL, NULL),
(650, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aksunğur Mobilya-Hayrettin Aksunğur', 1, NULL, NULL, NULL, NULL),
(651, NULL, NULL, '862075', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Yılmazlar Banyo Merkezi San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(652, NULL, NULL, '3500000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(653, NULL, NULL, '122130', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(654, NULL, NULL, '644315', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(655, NULL, NULL, '650000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(656, NULL, NULL, '650000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(657, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aksunğur Mobilya-Hayrettin Aksunğur', 1, NULL, NULL, NULL, NULL),
(658, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Masum Erkal', 1, NULL, NULL, NULL, NULL),
(659, NULL, NULL, '862075', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Yılmazlar Banyo Merkezi San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(660, NULL, NULL, '4000000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(661, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aksunğur Mobilya-Hayrettin Aksunğur', 1, NULL, NULL, NULL, NULL),
(662, NULL, NULL, '200000', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Aksunğur Mobilya-Hayrettin Aksunğur', 1, NULL, NULL, NULL, NULL),
(663, NULL, NULL, '862075', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Yılmazlar Banyo Merkezi San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(664, NULL, NULL, '862075', 'TL', 1, 1, 448, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Yılmazlar Banyo Merkezi San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(665, NULL, NULL, '280614', 'TL', 1, 1, 386, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 28/01', 1, NULL, NULL, NULL, NULL),
(666, NULL, NULL, '17878', 'TL', 1, 1, 387, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 26/01', 1, NULL, NULL, NULL, NULL),
(667, NULL, NULL, '59829', 'TL', 1, 1, 389, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(668, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(669, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(670, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(671, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(672, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(673, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(674, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(675, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(676, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(677, NULL, NULL, '1100', 'TL', 1, 1, 471, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aidat', 1, NULL, NULL, NULL, NULL),
(678, NULL, NULL, '322600', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Mühendislik Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(679, NULL, NULL, '2000000', 'TL', 1, 1, 465, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Turizm Oto. Eğt. Bilg. İşlem ve Kuy. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(680, NULL, NULL, '219530', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Murano Cam ve Mobilya San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(681, NULL, NULL, '159000', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Mutlu Çiftliği Gıda San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(682, NULL, NULL, '417500', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Murano Cam ve Mobilya San. Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(683, NULL, NULL, '326800', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(684, NULL, NULL, '326800', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(685, NULL, NULL, '326800', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(686, NULL, NULL, '326800', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(687, NULL, NULL, '326800', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(688, NULL, NULL, '326800', 'TL', 1, 1, 453, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Havalandırma Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(689, NULL, NULL, '17646', 'TL', 1, 1, 46, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 26/01', 1, NULL, NULL, NULL, NULL),
(690, NULL, NULL, '32337', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01 - Şişli Şb.', 1, NULL, NULL, NULL, NULL),
(691, NULL, NULL, '20001', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01 - Maslak Şb.', 1, NULL, NULL, NULL, NULL),
(692, NULL, NULL, '24621', 'TL', 1, 1, 47, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01 - Beyoğlu Şb.', 1, NULL, NULL, NULL, NULL),
(693, NULL, NULL, '435992', 'TL', 1, 1, 48, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 26/01', 1, NULL, NULL, NULL, NULL),
(694, NULL, NULL, '2137137', 'TL', 1, 1, 50, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 28/01', 1, NULL, NULL, NULL, NULL),
(695, NULL, NULL, '238049', 'TL', 1, 1, 233, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(696, NULL, NULL, '724763', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(697, NULL, NULL, '27966', 'TL', 1, 1, 51, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01 - İlave İşyeri D:10', 1, NULL, NULL, NULL, NULL),
(698, NULL, NULL, '197215', 'TL', 1, 1, 461, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01 - Hür Han K:7', 1, NULL, NULL, NULL, NULL),
(699, NULL, NULL, '112960', 'TL', 1, 1, 462, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01 - Hür Han K:5', 1, NULL, NULL, NULL, NULL),
(700, NULL, NULL, '317360', 'TL', 1, 1, 452, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(701, NULL, NULL, '88922', 'TL', 1, 1, 52, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(702, NULL, NULL, '107491', 'TL', 1, 1, 53, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(703, NULL, NULL, '66119', 'TL', 1, 1, 54, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(704, NULL, NULL, '276673', 'TL', 1, 1, 55, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(705, NULL, NULL, '167016', 'TL', 1, 1, 239, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(706, NULL, NULL, '69328', 'TL', 1, 1, 463, 2, NULL, NULL, 2, NULL, NULL, NULL, '12/2022 Dönemi - Son Ödeme 31/01', 1, NULL, NULL, NULL, NULL),
(707, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 1. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(708, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 2. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(709, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 3. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(710, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 4. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(711, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 5. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(712, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 6. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(713, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 7. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(714, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 8. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(715, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 9. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(716, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 10. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(717, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 11. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(718, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 12. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(719, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 13. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(720, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 14. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(721, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 15. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(722, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 16. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(723, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 17. Taksit Ödemesi Kredi No:1819106', 1, NULL, NULL, NULL, NULL),
(724, NULL, NULL, '29766', 'TL', 1, 1, 447, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizm Talıant Araç Kredisi 18. Taksit Ödemesi Kredi No:1819106 // Son Taksit', 1, NULL, NULL, NULL, NULL),
(725, NULL, NULL, '100000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizme yazıldı / Ali Bey\'in şahsına ciro yapıldı', 1, NULL, NULL, NULL, NULL),
(726, NULL, NULL, '200000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizme yazıldı / Ali Bey\'in şahsına ciro yapıldı', 1, NULL, NULL, NULL, NULL),
(727, NULL, NULL, '100000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizme yazıldı / Ali Bey\'in şahsına ciro yapıldı', 1, NULL, NULL, NULL, NULL),
(728, NULL, NULL, '400000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizme yazıldı / Ali Bey\'in şahsına ciro yapıldı', 1, NULL, NULL, NULL, NULL),
(729, NULL, NULL, '400000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Turizme yazıldı / Ali Bey\'in şahsına ciro yapıldı', 1, NULL, NULL, NULL, NULL),
(730, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '3.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(731, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '4.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(732, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '5.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(733, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '6.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(734, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '7.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(735, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '8.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(736, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '9.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(737, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '10.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(738, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '11.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(739, NULL, NULL, '192751', 'TL', 1, 1, 483, 2, NULL, NULL, 2, NULL, NULL, NULL, '12.Taksit Ödemesi', 1, NULL, NULL, NULL, NULL),
(740, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(741, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(742, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(743, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(744, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(745, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(746, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(747, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(748, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(749, NULL, NULL, '55000', 'TL', 1, 1, 485, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şerafettin Edip Yılancıoğlu', 1, NULL, NULL, NULL, NULL),
(750, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 1. Taksit', 1, NULL, NULL, NULL, NULL),
(751, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 2. Taksit', 1, NULL, NULL, NULL, NULL),
(752, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 3. Taksit', 1, NULL, NULL, NULL, NULL),
(753, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 4. Taksit', 1, NULL, NULL, NULL, NULL),
(754, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 5. Taksit', 1, NULL, NULL, NULL, NULL),
(755, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 6. Taksit', 1, NULL, NULL, NULL, NULL),
(756, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 7. Taksit', 1, NULL, NULL, NULL, NULL),
(757, NULL, NULL, '1068253', 'TL', 1, 1, 449, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Kredi H.No: 21590662-17-1 / 8. Taksit', 1, NULL, NULL, NULL, NULL),
(758, NULL, NULL, '207', 'TL', 1, 1, 423, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Son Ödeme: 08/02', 1, NULL, NULL, NULL, NULL),
(759, NULL, NULL, '778010', 'TL', 1, 1, 455, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Son Ödeme: 13/02', 1, NULL, NULL, NULL, NULL),
(760, NULL, NULL, '850000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(761, NULL, NULL, '950000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(762, NULL, NULL, '900000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(763, NULL, NULL, '850000', 'TL', 1, 1, 482, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Tsosa Yapı İnş. Gıda Oto Teks. San. ve Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(764, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Şubat 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(765, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Şubat 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(766, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Mart 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(767, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Mart 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(768, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Nisan 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(769, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Nisan 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(770, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Mayıs 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(771, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Mayıs 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(772, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Haziran 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(773, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Haziran 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(774, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Temmuz 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(775, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Temmuz 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(776, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Ağustos 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(777, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Ağustos 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(778, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Eylül 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(779, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Eylül 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(780, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Ekim 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(781, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Ekim 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(782, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Kasım 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(783, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Kasım 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(784, NULL, NULL, '3626', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hotelistan Aralık 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(785, NULL, NULL, '5374', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Hotelistan Aralık 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(786, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Şubat 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(787, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Şubat 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(788, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Mart 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(789, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Mart 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(790, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Nisan 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(791, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Nisan 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(792, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Mayıs 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(793, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Mayıs 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(794, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Haziran 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(795, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Haziran 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(796, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Temmuz 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(797, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Temmuz 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(798, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Ağustos 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(799, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Ağustos 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(800, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Eylül 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(801, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Eylül 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(802, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Ekim 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(803, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Ekim 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(804, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Kasım 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(805, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Kasım 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(806, NULL, NULL, '2450', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Alice Aralık 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(807, NULL, NULL, '1550', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Alice Aralık 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(808, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Şubat 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(809, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Şubat 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(810, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Mart 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(811, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Mart 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(812, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Nisan 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(813, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Nisan 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(814, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Mayıs 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(815, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Mayıs 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(816, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Haziran 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(817, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Haziran 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(818, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Temmuz 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(819, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Temmuz 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(820, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Ağustos 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(821, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Ağustos 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(822, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Eylül 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(823, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Eylül 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(824, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Ekim 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(825, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Ekim 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(826, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Kasım 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(827, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Kasım 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(828, NULL, NULL, '2401', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Arpanu Aralık 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(829, NULL, NULL, '1469', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Arpanu Aralık 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(830, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Şubat 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(831, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Şubat 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(832, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Mart 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(833, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Mart 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(834, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Nisan 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(835, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Nisan 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(836, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Mayıs 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(837, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Mayıs 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(838, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Haziran 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(839, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Haziran 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(840, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Temmuz 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(841, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Temmuz 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(842, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Ağustos 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(843, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Ağustos 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(844, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Eylül 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(845, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Eylül 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(846, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Ekim 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(847, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Ekim 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(848, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Kasım 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(849, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Kasım 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(850, NULL, NULL, '1715', 'TL', 1, 1, 20, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Dentfiks Aralık 2023 Resmi Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(851, NULL, NULL, '785', 'TL', 1, 1, 22, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Dentfiks Aralık 2023 Elden Smmm Maaş Ödemesi', 1, NULL, NULL, NULL, NULL),
(852, NULL, NULL, '2024', 'TL', 1, 1, 79, 2, NULL, NULL, 2, NULL, NULL, NULL, 'cPanel Lisansı - SH10510 (18/02/2023 - 17/03/2023) 1301.50 TL+Sunucu Yönetim Hizmeti - SH10510 (18/02/2023 - 17/03/2023) 225.00 TL+K. W. Bayi Giriş (18/02/2023 - 17/03/2023) 189.25 TL', 1, NULL, NULL, NULL, NULL),
(853, NULL, NULL, '55432', 'TL', 1, 1, 39, 2, NULL, NULL, 1, NULL, NULL, NULL, 'Son ödeme 17/02', 1, NULL, NULL, NULL, NULL),
(854, NULL, NULL, '84', 'TL', 1, 1, 138, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(855, NULL, NULL, '5000', 'TL', 1, 1, 272, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Son Ödeme 20/02', 1, NULL, NULL, NULL, NULL),
(856, NULL, NULL, '5111', 'TL', 1, 1, 403, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hürhan A Blok Kat:7 Su ve Doğalgaz Ocak', 1, NULL, NULL, NULL, NULL),
(857, NULL, NULL, '3524', 'TL', 1, 1, 403, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hürhan B Blok Kat:5 Su ve Doğalgaz Ocak', 1, NULL, NULL, NULL, NULL),
(858, NULL, NULL, '3000', 'TL', 1, 1, 403, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Hürhan B Blok 5 aylık otopark', 1, NULL, NULL, NULL, NULL),
(859, NULL, NULL, '235000', 'TL', 1, 1, 64, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şubat 2023 Maaşlarına İstinaden', 1, NULL, NULL, NULL, NULL),
(860, NULL, NULL, '359900', 'TL', 1, 1, 421, 2, NULL, NULL, 2, NULL, NULL, NULL, '8 Şubat / 14 Şubat Hastalar', 1, NULL, NULL, NULL, NULL),
(861, NULL, NULL, '4200', 'TL', 1, 1, 422, 2, NULL, NULL, 1, NULL, NULL, NULL, '15 Şubat Hastalar', 1, NULL, NULL, NULL, NULL),
(877, NULL, NULL, '308.40', 'USD', 1, 1, 57, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Şube-4 Faturası / tadilattan dolayı müşterilerin başka otellere yerleştirildiği için ceza kesildi', 1, NULL, NULL, NULL, NULL),
(878, NULL, NULL, '2500.00', 'USD', 1, 1, 166, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Lübnan Tanıtım Gideri - klinik için', 1, NULL, NULL, NULL, NULL),
(879, NULL, NULL, '250.00', 'USD', 1, 1, 250, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Registration/Report Filing, Annual Registration - Florida', 1, NULL, NULL, NULL, NULL),
(880, NULL, NULL, '3000.00', 'USD', 1, 1, 375, 2, NULL, NULL, 2, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, NULL),
(881, NULL, NULL, '88500.00', 'USD', 1, 1, 95, 2, NULL, NULL, 4, NULL, NULL, NULL, 'Şube6 - Orion Otel (Goldenpark) 01.11.2022-31.10.2023 Dönemi Kira Ödemesine İstinaden kesildi (01.05.2023 Vadeli Garanti Bnk. çeki)', 1, NULL, NULL, NULL, NULL),
(882, NULL, NULL, '157500.00', 'USD', 1, 1, 95, 2, NULL, NULL, 4, NULL, NULL, NULL, 'Şube6 - Orion Otel (Goldenpark) 01.11.2022-31.10.2023 Dönemi Kira Ödemesine İstinaden kesildi 01.05.2023 vadeli (Garanti Bank. Hatır çeki olarak verildi.)', 1, NULL, NULL, NULL, NULL),
(883, NULL, NULL, '88500.00', 'USD', 1, 1, 95, 2, NULL, NULL, 4, NULL, NULL, NULL, 'Şube6 - Orion Otel (Goldenpark) 01.11.2022-31.10.2023 Dönemi Kira Ödemesine İstinaden kesildi (01.08.2023 Vadeli Garanti Bnk. çeki)', 1, NULL, NULL, NULL, NULL),
(884, NULL, NULL, '157500.00', 'USD', 1, 1, 95, 2, NULL, NULL, 4, NULL, NULL, NULL, 'Şube6 - Orion Otel (Goldenpark) 01.11.2022-31.10.2023 Dönemi Kira Ödemesine İstinaden kesildi 01.08.2023 vadeli (Garanti Bank. Hatır çeki olarak verildi.)', 1, NULL, NULL, NULL, NULL),
(885, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(886, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(887, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(888, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(889, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(890, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(891, NULL, NULL, '2100.00', 'USD', 1, 1, 118, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Protel Bilgisayar Senet Ödemesi', 1, NULL, NULL, NULL, NULL),
(892, NULL, NULL, '5500.00', 'EUR', 1, 1, 235, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Reklam Faturası', 1, NULL, NULL, NULL, NULL),
(893, NULL, NULL, '16730.00', 'EUR', 1, 1, 404, 2, NULL, NULL, 2, NULL, NULL, NULL, 'TRAVEL C çevrimiçi satış platformu yazılım lisans sözleşmesi 3. taksit', 1, NULL, NULL, NULL, NULL),
(894, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(895, NULL, NULL, '39192.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Mühendislik Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(896, NULL, NULL, '39192.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Mühendislik Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(897, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(898, NULL, NULL, '39192.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Ert Mekanik Mühendislik Tic. Ltd. Şti.', 1, NULL, NULL, NULL, NULL),
(899, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(900, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(901, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(902, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(903, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(904, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(905, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(906, NULL, NULL, '37972.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Anıl Zemin Market San. ve Tic.Ltd.Şti.', 1, NULL, NULL, NULL, NULL),
(907, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(908, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(909, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(910, NULL, NULL, '442500.00', 'EUR', 1, 1, 25, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Denk Turizm İnş. Yat. ve Tic. A.Ş. (Teminat çeki vadesi Gelince Nakit Ödenecek Çek Geri Alınacak)', 1, NULL, NULL, NULL, NULL),
(911, NULL, NULL, '1050.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel 3. Şahıs Mali Sorumluluk Sigortası 3.Taksit Poliçe No:531643030', 1, NULL, NULL, NULL, NULL),
(912, NULL, NULL, '1809.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel İşveren Mali Sorumluluk Sigortası 3.Taksit Poliçe No:5316433030/0', 1, NULL, NULL, NULL, NULL),
(913, NULL, NULL, '1050.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel 3. Şahıs Mali Sorumluluk Sigortası 4.Taksit Poliçe No:531643030', 1, NULL, NULL, NULL, NULL),
(914, NULL, NULL, '1809.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel İşveren Mali Sorumluluk Sigortası 4.Taksit Poliçe No:5316433030/0', 1, NULL, NULL, NULL, NULL),
(915, NULL, NULL, '1050.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel 3. Şahıs Mali Sorumluluk Sigortası 5.Taksit Poliçe No:531643030', 1, NULL, NULL, NULL, NULL),
(916, NULL, NULL, '1809.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel İşveren Mali Sorumluluk Sigortası 5.Taksit Poliçe No:5316433030/0', 1, NULL, NULL, NULL, NULL),
(917, NULL, NULL, '1050.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel 3. Şahıs Mali Sorumluluk Sigortası 6.Taksit Poliçe No:531643030', 1, NULL, NULL, NULL, NULL),
(918, NULL, NULL, '1050.00', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel 3. Şahıs Mali Sorumluluk Sigortası 7.Taksit Poliçe No:531643030', 1, NULL, NULL, NULL, NULL),
(919, NULL, NULL, '3509.24', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel Otel Paket Sigortası 3. Taksit Poliçe No:530870971', 1, NULL, NULL, NULL, NULL),
(920, NULL, '2024-05-11', '100', 'TL', 1, 1, 2, 4, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'test note', 3, NULL, '2023-07-12 09:54:26', NULL, '2023-07-12 09:54:26'),
(921, NULL, '2024-05-11', '100', 'TL', 1, 1, 2, 4, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'test note', 12, NULL, '2023-07-12 09:56:55', NULL, '2023-07-12 09:56:55'),
(922, NULL, NULL, '3509.24', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel Otel Paket Sigortası 6. Taksit Poliçe No:530870971', 1, NULL, NULL, NULL, NULL),
(923, NULL, NULL, '3509.24', 'EUR', 1, 1, 456, 2, NULL, NULL, 2, NULL, NULL, NULL, 'Prime Otel Otel Paket Sigortası 7. Taksit Poliçe No:530870971', 1, NULL, NULL, NULL, NULL),
(924, NULL, NULL, '2000.00', 'EUR', 1, 1, 390, 2, NULL, NULL, 2, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, NULL),
(925, NULL, NULL, '66501.88', 'EUR', 1, 1, 74, 2, NULL, NULL, 2, NULL, NULL, NULL, '', 1, NULL, '2023-05-29 10:55:19', NULL, '2023-05-29 10:55:19'),
(926, NULL, '2024-05-11', '100', 'TL', 1, 1, 2, 4, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'test note', 1, NULL, NULL, '2023-05-31 05:15:52', '2023-05-31 05:15:52'),
(929, NULL, '2024-05-11', '100', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'test note', 12, NULL, NULL, '2023-05-31 10:05:31', '2023-05-31 10:05:31'),
(930, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-05 10:26:08', '2023-07-05 10:26:08'),
(931, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-06 11:27:18', '2023-07-06 11:27:18'),
(932, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-06 11:27:29', '2023-07-06 11:27:29'),
(933, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-06 11:27:38', '2023-07-06 11:27:38'),
(934, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 06:01:46', '2023-07-12 06:01:46'),
(935, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 06:03:10', '2023-07-12 06:03:10'),
(936, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 06:03:13', '2023-07-12 06:03:13'),
(937, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 06:03:14', '2023-07-12 06:03:14'),
(938, NULL, '2024-05-11', '100', 'TL', 1, 1, 2, 4, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'test note', 12, NULL, '2023-07-12 10:22:15', '2023-07-12 06:03:15', '2023-07-12 10:22:15'),
(939, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, '2023-07-12 09:57:32', '2023-07-12 06:03:23', '2023-07-12 09:57:32'),
(940, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 10:21:08', '2023-07-12 10:21:08'),
(941, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 10:21:09', '2023-07-12 10:21:09'),
(942, NULL, '2024-05-11', '4444', 'TL', 1, 1, 4, 5, '1', '2023-05-11', 1, '2023-05-11', NULL, NULL, 'qwqwqwqwq', 12, NULL, NULL, '2023-07-12 10:21:11', '2023-07-12 10:21:11');

-- --------------------------------------------------------

--
-- Structure de la table `payment_requests_categories`
--

CREATE TABLE `payment_requests_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_requests_categories`
--

INSERT INTO `payment_requests_categories` (`id`, `name`, `color`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Test', '#0043FFFF', 'test category', 3, NULL, '2022-12-15 05:10:57', '2022-12-15 05:32:10'),
(2, 'deneme', '#A6FFA3FF', 'Deneme Kategori', 3, NULL, '2022-12-15 05:32:32', '2022-12-15 05:32:32'),
(3, 'Yakıt Giderleri', '#0043FFFF', NULL, 10, NULL, '2023-01-24 11:12:18', '2023-01-24 11:12:18'),
(4, 'Akbank T.A.Ş. Taksitli Ticari Kredi', '#0043FFFF', 'Kredi H.No: 17455447-7-6', 8, NULL, '2023-01-24 11:52:10', '2023-01-24 11:52:10'),
(5, 'benjamin', '#fff', 'white', 3, '2023-05-30 08:55:40', '2023-05-30 08:53:54', '2023-05-30 08:55:40');

-- --------------------------------------------------------

--
-- Structure de la table `payment_requests_files`
--

CREATE TABLE `payment_requests_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_request_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_requests_files`
--

INSERT INTO `payment_requests_files` (`id`, `name`, `path`, `payment_request_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'test', 'fVkhMEj4pLZWdst7eRP6CA6EZ5JII2KXon8oAA6P.jpg', NULL, 0, '2023-01-11 08:39:55', '2023-01-11 08:39:55'),
(2, NULL, 'Pm5HRj6Omq0GqTzch3ivaD6k3SnSqE0pUiOZ3UOW.mov', 930, 0, '2023-07-12 05:56:46', '2023-07-12 05:56:46');

-- --------------------------------------------------------

--
-- Structure de la table `payment_requests_statuses`
--

CREATE TABLE `payment_requests_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_requests_statuses`
--

INSERT INTO `payment_requests_statuses` (`id`, `name`, `color`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ödenmedi', '#F64E60', NULL, 3, NULL, '2022-07-18 19:15:00', '2023-01-30 16:19:59'),
(2, 'Ödendi', '#1BC5BD', NULL, 1, NULL, '2022-08-22 16:32:17', '2022-11-23 16:00:37'),
(3, 'Sonra Ödenecek', '#0043FFFF', NULL, 1, NULL, '2022-08-22 16:32:23', '2022-08-22 16:32:23'),
(4, 'Onaya Gönderildi', '#FF7B00FF', NULL, 1, NULL, '2022-08-22 17:27:26', '2022-08-22 17:34:57');

-- --------------------------------------------------------

--
-- Structure de la table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Nakit', NULL, 1, NULL, '2022-07-20 00:19:26', '2022-11-07 08:49:04'),
(2, 'Banka', NULL, 3, NULL, '2023-04-14 06:17:54', '2023-04-14 06:17:54'),
(3, 'PTT', NULL, 3, NULL, '2023-04-14 06:18:05', '2023-04-14 06:18:05'),
(4, 'Çek', NULL, 3, NULL, '2023-04-14 06:18:05', '2023-04-14 06:18:05'),
(5, 'testing', 'it\'s important', 3, '2023-05-30 09:07:46', '2023-05-30 09:05:18', '2023-05-30 09:07:46');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'takvimi göster', 'web', NULL, NULL),
(2, 'kullanıcıları göster', 'web', NULL, NULL),
(3, 'kullanıcı oluştur', 'web', NULL, NULL),
(4, 'kullanıcıları düzenle', 'web', NULL, NULL),
(5, 'kullanıcıları sil', 'web', NULL, NULL),
(6, 'rolleri göster', 'web', NULL, NULL),
(7, 'roller oluşturmak', 'web', NULL, NULL),
(8, 'rolleri düzenle', 'web', NULL, NULL),
(9, 'raporları göster', 'web', NULL, NULL),
(10, 'şirketleri göster', 'web', NULL, NULL),
(11, 'şirketler oluşturmak', 'web', NULL, NULL),
(12, 'şirketleri düzenle', 'web', NULL, NULL),
(13, 'şirketleri sil', 'web', NULL, NULL),
(14, 'ödeme talebini göster', 'web', NULL, NULL),
(15, 'ödeme talebi oluştur', 'web', NULL, NULL),
(16, 'istenen ödeme talebini göster', 'web', NULL, NULL),
(17, 'tamamlanan ödeme talebini göster', 'web', NULL, NULL),
(18, 'ödeme isteği sonrası', 'web', NULL, NULL),
(19, 'ödeme talebini düzenle', 'web', NULL, NULL),
(20, 'ödeme isteğini sil', 'web', NULL, NULL),
(21, 'ödeme talebi durumunu göster', 'web', NULL, NULL),
(22, 'ödeme talebi durumu oluştur', 'web', NULL, NULL),
(23, 'ödeme talebi durumunu düzenle', 'web', NULL, NULL),
(24, 'ödeme isteği durumunu sil', 'web', NULL, NULL),
(25, 'ödeme türlerini göster', 'web', NULL, NULL),
(26, 'ödeme türleri oluştur', 'web', NULL, NULL),
(27, 'ödeme türlerini düzenle', 'web', NULL, NULL),
(28, 'ödeme türlerini sil', 'web', NULL, NULL),
(56, 'bekleyen ödeme talebini göster', 'web', NULL, NULL),
(57, 'rolleri sil', 'web', NULL, NULL),
(58, 'rolleri kopyala', 'web', NULL, NULL),
(59, 'personel ozluk karti goster', 'web', NULL, NULL),
(60, 'puantaj kayit goster', 'web', NULL, NULL),
(61, 'yillik izin takip goster', 'web', NULL, NULL),
(62, 'ozluk evraklari goster', 'web', NULL, NULL),
(63, 'deneme sureleri goster', 'web', NULL, NULL),
(64, 'zimmet goster', 'web', NULL, NULL),
(65, 'cek durumu goster', 'web', NULL, NULL),
(66, 'cek durumu duzenle', 'web', NULL, NULL),
(67, 'cek durumu sil', 'web', NULL, NULL),
(68, 'cek durumu ekle', 'web', NULL, NULL),
(69, 'cekleri goster', 'web', NULL, NULL),
(70, 'cekleri duzenle', 'web', NULL, NULL),
(71, 'cekleri sil', 'web', NULL, NULL),
(72, 'cek takvimi goster', 'web', NULL, NULL),
(73, 'cek olustur', 'web', NULL, NULL),
(74, 'personel ozluk karti olustur', 'web', NULL, NULL),
(75, 'personel ozluk karti duzenle', 'web', NULL, NULL),
(76, 'personel ozluk karti sil', 'web', NULL, NULL),
(77, 'puantaj kayit olustur', 'web', NULL, NULL),
(78, 'puantaj kayit duzenle', 'web', NULL, NULL),
(79, 'puantaj kayit sil', 'web', NULL, NULL),
(80, 'yillik izin takip olustur', 'web', NULL, NULL),
(81, 'yillik izin takip duzenle', 'web', NULL, NULL),
(82, 'yillik izin takip sil', 'web', NULL, NULL),
(83, 'deneme sureleri olustur', 'web', NULL, NULL),
(84, 'deneme sureleri duzenle', 'web', NULL, NULL),
(85, 'deneme sureleri sil', 'web', NULL, NULL),
(86, 'zimmet olustur', 'web', NULL, NULL),
(87, 'zimmet duzenle', 'web', NULL, NULL),
(88, 'zimmet sil', 'web', NULL, NULL),
(89, 'cevaplanmayan talebini göster', 'web', NULL, NULL),
(90, 'satin alma talebini göster', 'web', NULL, NULL),
(91, 'satin alma talebini olustur', 'web', NULL, NULL),
(92, 'tamamlan talebini göster', 'web', NULL, NULL),
(93, 'onaya goderilen talebini göster', 'web', NULL, NULL),
(94, 'satin alma talebini duzenle', 'web', NULL, NULL),
(95, 'satin alma talebini sil', 'web', NULL, NULL),
(96, 'kredi kartlari goster', 'web', NULL, NULL),
(97, 'kredi kartlari duzenle', 'web', NULL, NULL),
(98, 'kredi kartlari olustur', 'web', NULL, NULL),
(99, 'kredi kartlari sil', 'web', NULL, NULL),
(100, 'personelleri goster', 'web', NULL, NULL),
(101, 'personelleri duzenle', 'web', NULL, NULL),
(102, 'personelleri olustur', 'web', NULL, NULL),
(103, 'personelleri sil', 'web', NULL, NULL),
(104, 'senetleri goster', 'web', NULL, NULL),
(105, 'senetleri olustur', 'web', NULL, NULL),
(106, 'senetleri duzenle', 'web', NULL, NULL),
(107, 'senetleri sil', 'web', NULL, NULL),
(108, 'tedarikciler goster', 'web', NULL, NULL),
(109, 'tedarikciler duzenle', 'web', NULL, NULL),
(110, 'tedarikciler olustur', 'web', NULL, NULL),
(111, 'tedarikciler sil', 'web', NULL, NULL),
(112, 'yillik izin turlerini goster', 'web', NULL, NULL),
(113, 'yillik izin turlerini duzenle', 'web', NULL, NULL),
(114, 'yillik izin turlerini olustur', 'web', NULL, NULL),
(115, 'yillik izin turlerini sil', 'web', NULL, NULL),
(116, 'odeme kategorileri goster', 'web', NULL, NULL),
(117, 'odeme kategorileri duzenle', 'web', NULL, NULL),
(118, 'odeme kategorileri sil', 'web', NULL, NULL),
(119, 'odeme kategorileri olustur', 'web', NULL, NULL),
(120, 'departman olustur', 'web', NULL, NULL),
(121, 'departman duzenle', 'web', NULL, NULL),
(122, 'departman goster', 'web', NULL, NULL),
(123, 'departman sil', 'web', NULL, NULL),
(124, 'firma turu sil', 'web', NULL, NULL),
(125, 'firma turu goster', 'web', NULL, NULL),
(126, 'firma turu duzenle', 'web', NULL, NULL),
(127, 'firma turu olustur', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'apitoken', 'fae8e3cdf6ea9430f2b5f0dcfeb47736010cb12f81ce489378c605ad722a2c20', '[\"*\"]', NULL, '2023-05-05 06:30:36', '2023-05-05 06:30:36'),
(2, 'App\\Models\\User', 3, 'apitoken', '2f109b81e2bdcbca3759c776d7ebb45bdf46d78d9942cee55d18cd4148e48966', '[\"*\"]', NULL, '2023-05-05 06:36:50', '2023-05-05 06:36:50'),
(3, 'App\\Models\\User', 3, 'apitoken', 'a3fafe75a00b7283d151bd6a993b78176770dc6fe951f8a79d0da85d400436d1', '[\"*\"]', NULL, '2023-05-05 09:18:23', '2023-05-05 09:18:23'),
(4, 'App\\Models\\User', 3, 'apitoken', '4e64f87f33b139bb85d55d754abd16c9e7cce180930b9a000a81a4436061514a', '[\"*\"]', NULL, '2023-05-05 09:26:13', '2023-05-05 09:26:13'),
(5, 'App\\Models\\User', 3, 'apitoken', 'ef04650de036cfffa4bf4edfe9da97a863748ae9115ce8a65f4c06123234397c', '[\"*\"]', '2023-05-29 06:56:48', '2023-05-29 06:45:34', '2023-05-29 06:56:48'),
(7, 'App\\Models\\User', 3, 'apitoken', 'd5de566d09c54c1311087a193c3951918b4d5e677f2293e9f962b65631d341ef', '[\"*\"]', '2023-05-30 04:30:11', '2023-05-29 10:00:24', '2023-05-30 04:30:11'),
(8, 'App\\Models\\User', 3, 'apitoken', '6c8ea8c5a3b495543f0ec1184fd44c8def46ace8c518715098e91dc51a1d9e5a', '[\"*\"]', '2023-05-30 05:21:25', '2023-05-30 05:20:08', '2023-05-30 05:21:25'),
(9, 'App\\Models\\User', 3, 'apitoken', 'db4042fbd7561e8e0b0eb04b17ca64808b8d324f3694160caddbf5510ece7a47', '[\"*\"]', '2023-05-31 05:09:33', '2023-05-30 06:08:48', '2023-05-31 05:09:33'),
(10, 'App\\Models\\User', 1, 'apitoken', '9762b58515daea8d4968a42dbddfb76938847a0afbb65e8f435dfa41a165c7b7', '[\"*\"]', NULL, '2023-05-30 10:26:19', '2023-05-30 10:26:19'),
(11, 'App\\Models\\User', 1, 'apitoken', '649bd42ebe8d9cd6dacf8c653166f1736fb459b5b63da6f606fd8ca458e1b3c0', '[\"*\"]', '2023-05-30 10:34:06', '2023-05-30 10:33:23', '2023-05-30 10:34:06'),
(12, 'App\\Models\\User', 1, 'apitoken', '16e3b46c17b752e627ea44ae1a433b38f3d1be12030038634239b964ef8651bf', '[\"*\"]', NULL, '2023-05-30 10:53:25', '2023-05-30 10:53:25'),
(13, 'App\\Models\\User', 12, 'apitoken', 'd51b5ba61cb14639f547d68c54f8607de45585d8d4a681f4558508174ad1010a', '[\"*\"]', NULL, '2023-05-30 10:56:16', '2023-05-30 10:56:16'),
(14, 'App\\Models\\User', 1, 'apitoken', '6cac35544fea67dbd580fbd2ad116916ea8499127b041c2d91b7634a9de1ee8f', '[\"*\"]', NULL, '2023-05-30 10:57:02', '2023-05-30 10:57:02'),
(15, 'App\\Models\\User', 12, 'apitoken', '05cb120e784232d1ce6d25e3aa5ae6372e0245c61d70018348192439a9997df6', '[\"*\"]', NULL, '2023-05-30 10:59:02', '2023-05-30 10:59:02'),
(16, 'App\\Models\\User', 12, 'apitoken', '84aa873626270c15b1f82a61e7263c943c2a3c7d7c46d1c9e25a83d2532e40a9', '[\"*\"]', NULL, '2023-05-30 11:01:00', '2023-05-30 11:01:00'),
(17, 'App\\Models\\User', 1, 'apitoken', '370203046c4d3adbb2f4b12a9be0de19314c2799cb8db9b042bad0019afac900', '[\"*\"]', '2023-05-31 05:54:18', '2023-05-31 05:11:40', '2023-05-31 05:54:18'),
(18, 'App\\Models\\User', 11, 'apitoken', 'ca541c8882203d5716767a0ef4d284161d5722e729b0f8dc23e29b71a365aa64', '[\"*\"]', '2023-05-31 05:41:10', '2023-05-31 05:35:42', '2023-05-31 05:41:10'),
(19, 'App\\Models\\User', 1, 'apitoken', 'd3548654a21cc7349f70eae647da72fb54968abd48511930d47676946c24971a', '[\"*\"]', '2023-05-31 09:31:09', '2023-05-31 06:40:58', '2023-05-31 09:31:09'),
(20, 'App\\Models\\User', 12, 'apitoken', '37d573d9208d0e3fbedd46f9dd592ae04a480dfef7c596f6a4bb78bce2cf96e2', '[\"*\"]', NULL, '2023-05-31 08:44:16', '2023-05-31 08:44:16'),
(21, 'App\\Models\\User', 12, 'apitoken', '5121ea76ad68b8243cf462b11782dcd4c616d56de4029380a089b7fdf1378bc1', '[\"*\"]', '2023-05-31 09:50:12', '2023-05-31 09:31:42', '2023-05-31 09:50:12'),
(22, 'App\\Models\\User', 12, 'apitoken', 'ed1e23703281b97bd020cd005b58136170583ee13d3797482e52bcef75601889', '[\"*\"]', '2023-05-31 10:05:31', '2023-05-31 09:51:05', '2023-05-31 10:05:31'),
(23, 'App\\Models\\User', 3, 'apitoken', '083f96e2d99c94f5f1f8a8a1aa2eb9dbe92fc97fce5c44910ed2cddf5e38af97', '[\"*\"]', '2023-06-01 08:39:31', '2023-06-01 05:08:11', '2023-06-01 08:39:31'),
(24, 'App\\Models\\User', 3, 'apitoken', '918cc6680ccb0998bdc8d5b59d7a5696865090828a1bf75deb0ee5406f28d09b', '[\"*\"]', '2023-06-01 11:54:49', '2023-06-01 10:20:59', '2023-06-01 11:54:49'),
(25, 'App\\Models\\User', 12, 'apitoken', '777e3f2cc9d634e2f5f2b3a9ae773418a9f846d3cbf3b0948413b7503ee5f59e', '[\"*\"]', NULL, '2023-06-02 05:14:56', '2023-06-02 05:14:56'),
(26, 'App\\Models\\User', 12, 'apitoken', '8a3c704cd572c58bf3aa0ab4bc51e0c52e3c0450a2bcad7fa7ded9ea541e65e4', '[\"*\"]', NULL, '2023-06-02 09:15:02', '2023-06-02 09:15:02'),
(27, 'App\\Models\\User', 12, 'apitoken', '981ce122310c4e0217d91d36a0bc90729b58974b2c8584f8854465a7fee7a2bd', '[\"*\"]', NULL, '2023-06-02 09:17:37', '2023-06-02 09:17:37'),
(28, 'App\\Models\\User', 12, 'apitoken', '48779b63ce45dcf95e7f8b2f1bb23ffc3d0e22d646496c6c61fd1d065a649ad2', '[\"*\"]', NULL, '2023-06-02 09:27:00', '2023-06-02 09:27:00'),
(29, 'App\\Models\\User', 12, 'apitoken', '0ce2f683f934b8af4cbcf45b6a01b9028b41008f55ba0306c3ba330c6d524de2', '[\"*\"]', NULL, '2023-06-02 09:27:02', '2023-06-02 09:27:02'),
(30, 'App\\Models\\User', 12, 'apitoken', '70bf22ac80b8710ac3927b2c9795d1782e6be22e260fcc1b8dba71ee4bf11782', '[\"*\"]', NULL, '2023-06-02 09:27:09', '2023-06-02 09:27:09'),
(31, 'App\\Models\\User', 12, 'apitoken', '69e2321f2abc39a67b69f9a1352f14d757bd11a25024163c5bf73001c331d31d', '[\"*\"]', NULL, '2023-06-02 09:27:14', '2023-06-02 09:27:14'),
(32, 'App\\Models\\User', 12, 'apitoken', 'bdf4161dfed62aacc89ac2ab25be38dbf4c8bd9f8616d477c7cbe41856b7842d', '[\"*\"]', NULL, '2023-06-02 09:27:34', '2023-06-02 09:27:34'),
(33, 'App\\Models\\User', 12, 'apitoken', '655a2fc33328fa6884de5d79e7cac6c4b172ac83170218ffd96ca1f86f0d8471', '[\"*\"]', NULL, '2023-06-02 09:27:47', '2023-06-02 09:27:47'),
(34, 'App\\Models\\User', 12, 'apitoken', '56d21dadba6389991cba6cebb24e83629a679e47d5ec4f568c6a2b6215778b9a', '[\"*\"]', NULL, '2023-06-02 09:27:49', '2023-06-02 09:27:49'),
(35, 'App\\Models\\User', 12, 'apitoken', '645384d3d1921d55320f816b3505d4a8f65d6cd9a8562df3c79d108914d8aeec', '[\"*\"]', NULL, '2023-06-02 09:27:59', '2023-06-02 09:27:59'),
(36, 'App\\Models\\User', 12, 'apitoken', '9c17f0ed8fca3d42faf804359f137343f8f449dad3c04740c8c7d0a5db230113', '[\"*\"]', NULL, '2023-06-02 09:28:39', '2023-06-02 09:28:39'),
(37, 'App\\Models\\User', 12, 'apitoken', '64d3f65b182854f9b9b2e0b5b277eafdb608feb285aed66363feb8b267c55e05', '[\"*\"]', NULL, '2023-06-02 09:29:36', '2023-06-02 09:29:36'),
(38, 'App\\Models\\User', 12, 'apitoken', '1bc33e1961f97f00e6e043cbc631ac462b037f7648abd5b4466dd432f9494566', '[\"*\"]', NULL, '2023-06-02 09:31:49', '2023-06-02 09:31:49'),
(39, 'App\\Models\\User', 12, 'apitoken', '3289ad8c25d85afdda01af2731fa4f858fdda904fe8d7a747b242d9e33badaec', '[\"*\"]', NULL, '2023-06-02 09:31:55', '2023-06-02 09:31:55'),
(40, 'App\\Models\\User', 12, 'apitoken', '20d20bd51cae5ce5e46cc39c88640d7066e8ee5f3c7095222a8ff1a1c62818fc', '[\"*\"]', NULL, '2023-06-02 09:31:57', '2023-06-02 09:31:57'),
(41, 'App\\Models\\User', 12, 'apitoken', '76a488d2e457ba832d325477874e7caf7759ef5a64eafa1b43262a8669c094a5', '[\"*\"]', NULL, '2023-06-02 09:32:05', '2023-06-02 09:32:05'),
(42, 'App\\Models\\User', 12, 'apitoken', 'a56a28164b79a27e5947e9874584a5bcb43f5c546b3c52e6c9e463a12527d521', '[\"*\"]', NULL, '2023-06-02 09:32:27', '2023-06-02 09:32:27'),
(43, 'App\\Models\\User', 12, 'apitoken', 'd63bbd9ca52a3c1012f54e70f1f6a6caeb9755b0b1225bf9bf785005bc3fd74b', '[\"*\"]', NULL, '2023-06-02 09:32:29', '2023-06-02 09:32:29'),
(44, 'App\\Models\\User', 12, 'apitoken', '0b45fce597d2a0bebb37cccd6fe6dd14cb05f3c909683c8c0da432f7be9cd368', '[\"*\"]', NULL, '2023-06-02 09:32:38', '2023-06-02 09:32:38'),
(45, 'App\\Models\\User', 12, 'apitoken', '59236a4dae8c8c4648c6d7cead72c08bd7001e096c47240d43bd78e8f6c5a8ec', '[\"*\"]', NULL, '2023-06-02 09:32:40', '2023-06-02 09:32:40'),
(46, 'App\\Models\\User', 12, 'apitoken', '879469edabfdea5414ce23c89f63cbd0395fb1da5b26ca919cb2b931b3e84049', '[\"*\"]', NULL, '2023-06-02 09:32:48', '2023-06-02 09:32:48'),
(47, 'App\\Models\\User', 12, 'apitoken', 'b2300694300cde41686c2e4b3b3109bb51b203cec306061e258ec5f65d3a9e80', '[\"*\"]', NULL, '2023-06-02 09:32:57', '2023-06-02 09:32:57'),
(48, 'App\\Models\\User', 12, 'apitoken', 'f0de28b1c67405ca16629abb58c631a8dd13fca0e9dc487bba0ab957948e76bf', '[\"*\"]', NULL, '2023-06-02 09:32:59', '2023-06-02 09:32:59'),
(49, 'App\\Models\\User', 12, 'apitoken', 'b2d4c64b43455d00d2caf34b7b80493e7b8ef66f404b8d06dd4b5f8f94d16f06', '[\"*\"]', NULL, '2023-06-02 09:33:23', '2023-06-02 09:33:23'),
(50, 'App\\Models\\User', 12, 'apitoken', '665e3739e83369ed8667345b6848117f2d58a4bf32d117b0a7de79e233969689', '[\"*\"]', NULL, '2023-06-02 09:33:26', '2023-06-02 09:33:26'),
(51, 'App\\Models\\User', 12, 'apitoken', 'caae7d0ac76d2887ee84afba56ef8cbcdae6a640c45d4f05b35cb83498c8bb20', '[\"*\"]', NULL, '2023-06-02 09:33:48', '2023-06-02 09:33:48'),
(52, 'App\\Models\\User', 12, 'apitoken', '6b7dce88ce2c5075a06b5c7920472d5d88fc80166e923f5712aa9b0a0b4b3384', '[\"*\"]', NULL, '2023-06-02 09:37:12', '2023-06-02 09:37:12'),
(53, 'App\\Models\\User', 12, 'apitoken', '382a816f9eacc241e59770d5ce7798403e696dd28ca0ac9da117d52d00c8257c', '[\"*\"]', NULL, '2023-06-02 09:40:58', '2023-06-02 09:40:58'),
(54, 'App\\Models\\User', 12, 'apitoken', '70ea8185553df89d445181d69a2c77a0544331a83f04ac6115c4d811d373d482', '[\"*\"]', NULL, '2023-06-02 09:50:05', '2023-06-02 09:50:05'),
(55, 'App\\Models\\User', 12, 'apitoken', '2b2b65726e922fe29956e730aeefaa9c9a633ef3a914fa2c86c96e4422af059a', '[\"*\"]', NULL, '2023-06-02 10:00:20', '2023-06-02 10:00:20'),
(56, 'App\\Models\\User', 12, 'apitoken', 'c7cc0eb578ca6d299ffc8be2ea231ab1405cb960c43e125bc8fa787cf5dc02a5', '[\"*\"]', NULL, '2023-06-02 10:00:28', '2023-06-02 10:00:28'),
(57, 'App\\Models\\User', 12, 'apitoken', '2e1bf2d9ea70eadad599415fbebdf6ea2eb7bfb0f7e7b9a686afd034a2d43d4d', '[\"*\"]', NULL, '2023-06-02 10:02:17', '2023-06-02 10:02:17'),
(58, 'App\\Models\\User', 12, 'apitoken', 'dfe0f8f304c654f20a7c995c8e14197efa7b3dd55cff9ff23d97333236a93df1', '[\"*\"]', NULL, '2023-06-05 04:15:52', '2023-06-05 04:15:52'),
(59, 'App\\Models\\User', 12, 'apitoken', 'f3511b304b112f91939785bdc1ddfd538cc341973b937e1a41c4ee8c0e079ffe', '[\"*\"]', NULL, '2023-06-05 04:16:01', '2023-06-05 04:16:01'),
(60, 'App\\Models\\User', 12, 'apitoken', '24fa464717b3765de8765280f11edad7f0eaad1f3e25551c853168c24414a2a5', '[\"*\"]', NULL, '2023-06-05 04:18:49', '2023-06-05 04:18:49'),
(61, 'App\\Models\\User', 12, 'apitoken', '4452e023cce78ef633ac49a6e4d87b4769a3ef54bdd57b4ca5ca2159e59a8fb6', '[\"*\"]', NULL, '2023-06-05 04:25:25', '2023-06-05 04:25:25'),
(62, 'App\\Models\\User', 12, 'apitoken', 'cd0547f3cfcaa35b1150ff8f947f7a21dc760557281642f1fa3c21985caf9906', '[\"*\"]', NULL, '2023-06-05 05:52:00', '2023-06-05 05:52:00'),
(63, 'App\\Models\\User', 12, 'apitoken', '66d9ec44d6ba8a76cf12d000a49279ae117a4dfa299f75f968580067a5dfc5bd', '[\"*\"]', NULL, '2023-06-05 05:52:06', '2023-06-05 05:52:06'),
(64, 'App\\Models\\User', 12, 'apitoken', '0b04582ec34ebcb1470a8273b22da824b57b952ffa977b38f90960930fa0eda9', '[\"*\"]', NULL, '2023-06-05 05:52:18', '2023-06-05 05:52:18'),
(65, 'App\\Models\\User', 12, 'apitoken', '9409aec44239e5b08228b35a4d02cb16aa1413a003d05e567af668a58a8e3dc1', '[\"*\"]', NULL, '2023-06-05 05:53:57', '2023-06-05 05:53:57'),
(66, 'App\\Models\\User', 12, 'apitoken', '69c0385209c994fa23df408f46adf3a792f9c131ef9ff8766485dd9464218572', '[\"*\"]', NULL, '2023-06-05 05:54:04', '2023-06-05 05:54:04'),
(67, 'App\\Models\\User', 12, 'apitoken', '8294461ef6061de1273a3c315944b40776cabd4116ddf9be980d66e6492c9304', '[\"*\"]', NULL, '2023-06-05 06:12:13', '2023-06-05 06:12:13'),
(68, 'App\\Models\\User', 12, 'apitoken', '4cd73738e5d2b7bde6371717cb509b78508687459ee6cf8228667ce5c7d43479', '[\"*\"]', NULL, '2023-06-05 08:46:32', '2023-06-05 08:46:32'),
(69, 'App\\Models\\User', 12, 'apitoken', 'bb6b8b79302bcb1a1826b14f04df9a66eeef9ad2cec62d2936ac7784b0fdac45', '[\"*\"]', NULL, '2023-06-05 08:47:35', '2023-06-05 08:47:35'),
(70, 'App\\Models\\User', 12, 'apitoken', 'e666228054ba4e1af5a8bbdfdd0cc20da8e90221660fa2da924b1f6c59f043cb', '[\"*\"]', NULL, '2023-06-05 08:54:16', '2023-06-05 08:54:16'),
(71, 'App\\Models\\User', 12, 'apitoken', '5c49a5ff87ca1784e72c78f80a957801d3fa3a99cf5165d9c0929613076d59e4', '[\"*\"]', NULL, '2023-06-05 09:10:38', '2023-06-05 09:10:38'),
(72, 'App\\Models\\User', 12, 'apitoken', 'd13fe155e24d3b2c9b3bd1a95e5eeb7e615fc74d7534b4c5bfa8424d45260be8', '[\"*\"]', NULL, '2023-06-05 09:26:40', '2023-06-05 09:26:40'),
(73, 'App\\Models\\User', 12, 'apitoken', 'f55dbdc34c5fbbf593d73238f439a258227569d92a2089b4b916776f1b8b561f', '[\"*\"]', NULL, '2023-06-05 09:34:22', '2023-06-05 09:34:22'),
(74, 'App\\Models\\User', 12, 'apitoken', '45e7f748ff3187c758d90cee74024779667ca2abb1e1beb5306e901f78d79352', '[\"*\"]', NULL, '2023-06-05 09:42:02', '2023-06-05 09:42:02'),
(75, 'App\\Models\\User', 12, 'apitoken', 'd70007504844e601881be8052d3fedea17982920e0d24afa675f6b0e9cddcbf4', '[\"*\"]', NULL, '2023-06-05 09:58:33', '2023-06-05 09:58:33'),
(76, 'App\\Models\\User', 12, 'apitoken', 'd6ee9af3276e691657fe02f940d04e506dae6c64cef194d7b1cb27dfa630a8b1', '[\"*\"]', NULL, '2023-06-05 10:32:17', '2023-06-05 10:32:17'),
(77, 'App\\Models\\User', 12, 'apitoken', 'baa1e7106ffd77ee9503097c748ea6aac4ad8bd9819ed991881a0e69ba692651', '[\"*\"]', NULL, '2023-06-05 11:14:28', '2023-06-05 11:14:28'),
(78, 'App\\Models\\User', 12, 'apitoken', '7a0911fb0a1250d318d382a7fe57c06fe1abad126f506f8543f77d8d963c4d06', '[\"*\"]', NULL, '2023-06-05 11:14:32', '2023-06-05 11:14:32'),
(79, 'App\\Models\\User', 12, 'apitoken', '2ec02cd43108e36222f384137bf1ed676de2a535092ab3203e8b3bbeafeeda8c', '[\"*\"]', NULL, '2023-06-05 11:14:49', '2023-06-05 11:14:49'),
(80, 'App\\Models\\User', 12, 'apitoken', '27b32f5433fb1df8a002dae815e45b0aafd1fabbeddb61f2a1e3612a26877d8c', '[\"*\"]', NULL, '2023-06-05 11:15:06', '2023-06-05 11:15:06'),
(81, 'App\\Models\\User', 12, 'apitoken', '0c59d59d2f2288397dcec9839c7929b634a4f7a81ce1888d8217f8822bf163f2', '[\"*\"]', NULL, '2023-06-05 11:15:11', '2023-06-05 11:15:11'),
(82, 'App\\Models\\User', 12, 'apitoken', '13f03cab985fc11405953f36b7e59168a8f68f55fc1f3b755acc79b520a519e2', '[\"*\"]', NULL, '2023-06-05 11:16:04', '2023-06-05 11:16:04'),
(83, 'App\\Models\\User', 12, 'apitoken', '588deb1ef3b1bebe7eba7f282e1180293f88b40923a31094c9b931ad1ed5b9d8', '[\"*\"]', NULL, '2023-06-05 11:16:18', '2023-06-05 11:16:18'),
(84, 'App\\Models\\User', 12, 'apitoken', '88993dc45680ec17b4e28ef26e0da7cf751dbcc4b343dfb8d24a0347197b926e', '[\"*\"]', NULL, '2023-06-05 11:16:24', '2023-06-05 11:16:24'),
(85, 'App\\Models\\User', 12, 'apitoken', '77f05f48d2ab9eaab14666bf0f2a1237ce0d1fe0864f4270523b4fed00d3e6c5', '[\"*\"]', NULL, '2023-06-05 11:16:32', '2023-06-05 11:16:32'),
(86, 'App\\Models\\User', 12, 'apitoken', '990e724db8811f9e3bafa34f07d53231a424b21722a4d1cded27041c6813abc1', '[\"*\"]', NULL, '2023-06-05 11:16:39', '2023-06-05 11:16:39'),
(87, 'App\\Models\\User', 12, 'apitoken', '33d9b195e8fb46cd58424591adb289c718d0bf675a1bc6ab7a1e32c53077b31f', '[\"*\"]', NULL, '2023-06-05 11:16:43', '2023-06-05 11:16:43'),
(88, 'App\\Models\\User', 12, 'apitoken', 'a5a8f4fdf2021aeb55d9370788de37f7f51c859728e5399468e7e802359c68bf', '[\"*\"]', NULL, '2023-06-05 11:16:47', '2023-06-05 11:16:47'),
(89, 'App\\Models\\User', 12, 'apitoken', '6dab54acd6f540b3dd5293597fab2e200eb7a2e6a33ab371197be0050a543ace', '[\"*\"]', NULL, '2023-06-05 11:17:36', '2023-06-05 11:17:36'),
(90, 'App\\Models\\User', 12, 'apitoken', 'bab122442410dcc602803f6d3838ad3744c90b4660661b9cda400e0fb88fe164', '[\"*\"]', NULL, '2023-06-05 11:18:44', '2023-06-05 11:18:44'),
(91, 'App\\Models\\User', 12, 'apitoken', 'a79a5dc75b577debdfd4e37e165394485fd0e9615d8f37a2e160bec11531363f', '[\"*\"]', NULL, '2023-06-05 11:21:12', '2023-06-05 11:21:12'),
(92, 'App\\Models\\User', 12, 'apitoken', '31abc3112d009301fd3ab040322ee9c2f739e4f85bde30b1111b6e22d63176e7', '[\"*\"]', NULL, '2023-06-05 11:21:34', '2023-06-05 11:21:34'),
(93, 'App\\Models\\User', 12, 'apitoken', '94ebf0d6cbc4412d8f8e8238f3976511d414202b5ee064d5b793f74a64670574', '[\"*\"]', NULL, '2023-06-05 11:21:58', '2023-06-05 11:21:58'),
(94, 'App\\Models\\User', 12, 'apitoken', '6a00d8714917219540200e60f83d54e9e738c99d63ac2c23890abcf5a4cdd5dd', '[\"*\"]', NULL, '2023-06-05 11:27:08', '2023-06-05 11:27:08'),
(95, 'App\\Models\\User', 12, 'apitoken', '3827d85f5bc10f9bfaa5c9a975037ee9fc9d3bf331ef95ee00a6a9be8dfaf2da', '[\"*\"]', NULL, '2023-06-05 11:27:21', '2023-06-05 11:27:21'),
(96, 'App\\Models\\User', 12, 'apitoken', '1efd2037fe00a3a0856a87ad0bf5e9f5b17660dff7a9baa1e168f9cae339627c', '[\"*\"]', NULL, '2023-06-05 11:54:51', '2023-06-05 11:54:51'),
(97, 'App\\Models\\User', 12, 'apitoken', 'b8616d86b94feb41493b76851398e773ce603aa3810f2918647ca1e5ef5331fb', '[\"*\"]', NULL, '2023-06-06 06:37:27', '2023-06-06 06:37:27'),
(98, 'App\\Models\\User', 12, 'apitoken', '88a26ad595ce7823c5034739f9a83c381492f062aa1d83484b518ba0ad096902', '[\"*\"]', NULL, '2023-06-06 07:36:10', '2023-06-06 07:36:10'),
(99, 'App\\Models\\User', 12, 'apitoken', '38e23454ee85bd0bea8f4d2c633406a55eed45609258c1aad17bc5bd2da3cc60', '[\"*\"]', NULL, '2023-06-06 10:49:30', '2023-06-06 10:49:30'),
(100, 'App\\Models\\User', 12, 'apitoken', 'ab5a08a35838341e4c161158e7783f711342692ec74d32b9819a64260ab09939', '[\"*\"]', NULL, '2023-06-06 10:55:05', '2023-06-06 10:55:05'),
(101, 'App\\Models\\User', 12, 'apitoken', '97c62641b2760fdc70b4a6f7c11079ab987f403389c76eeee8283e6d13453b74', '[\"*\"]', NULL, '2023-06-06 10:58:00', '2023-06-06 10:58:00'),
(102, 'App\\Models\\User', 12, 'apitoken', '459518dcef60c53f462512def6f16584a7dfeba574eb6fc499014f36a1ed03e7', '[\"*\"]', NULL, '2023-06-06 10:59:17', '2023-06-06 10:59:17'),
(103, 'App\\Models\\User', 12, 'apitoken', '0f76a316dbc5ceb5d50d6375f0244e6c3ac517b10f7e496012544c17347a6ad5', '[\"*\"]', NULL, '2023-06-07 06:20:15', '2023-06-07 06:20:15'),
(104, 'App\\Models\\User', 12, 'apitoken', '7147b5cff12ba7564ec14c54be4b6a902dc742363fa246e9a8e11ddf6e0bcaf8', '[\"*\"]', NULL, '2023-06-07 09:23:58', '2023-06-07 09:23:58'),
(105, 'App\\Models\\User', 12, 'apitoken', 'fcfc7b39e0ab5d435b7bf80f2f1c90f2f21ad09d30f297efb5ca91f4eba7b29e', '[\"*\"]', NULL, '2023-06-07 09:26:41', '2023-06-07 09:26:41'),
(106, 'App\\Models\\User', 12, 'apitoken', 'f8f655e837d73cd5b32f55198540298c2e3d407f7c6151b5865c57dbaf893799', '[\"*\"]', NULL, '2023-06-07 09:26:41', '2023-06-07 09:26:41'),
(107, 'App\\Models\\User', 12, 'apitoken', 'eac317914590e09ac095021f047811c6554f68d5683865d5ddbf4dba01b2bd8f', '[\"*\"]', NULL, '2023-06-07 09:26:42', '2023-06-07 09:26:42'),
(108, 'App\\Models\\User', 12, 'apitoken', '761d5cf6c514072dac0a41b3b1424a0c4d19f38bc4d56dd52c7d1d6334c3810a', '[\"*\"]', NULL, '2023-06-07 09:26:43', '2023-06-07 09:26:43'),
(109, 'App\\Models\\User', 12, 'apitoken', '0d5eecbe57ff85f6dee3e37bd7d20206ef52052198a78b575b588c8c6330b1c4', '[\"*\"]', NULL, '2023-06-07 09:29:35', '2023-06-07 09:29:35'),
(110, 'App\\Models\\User', 12, 'apitoken', 'c4231918025dcbfddbee6c78c68c873aed4a1263fe201dd400c10876cea29b0b', '[\"*\"]', NULL, '2023-06-07 09:29:47', '2023-06-07 09:29:47'),
(111, 'App\\Models\\User', 12, 'apitoken', '6ad84e898f424f23eed77b3354662f05096194188cbfb6f5b1bfcdd39d66c21d', '[\"*\"]', NULL, '2023-06-07 09:29:47', '2023-06-07 09:29:47'),
(112, 'App\\Models\\User', 12, 'apitoken', 'd933d2fce9025d4821e52cce21dee2599d57558b12bd51bc6b47118222be3495', '[\"*\"]', NULL, '2023-06-07 09:29:47', '2023-06-07 09:29:47'),
(113, 'App\\Models\\User', 12, 'apitoken', '28986b3a02cbbea23dc465110305e0a94c5e030755bc456ca23a97f0d9a05d2b', '[\"*\"]', NULL, '2023-06-07 09:29:57', '2023-06-07 09:29:57'),
(114, 'App\\Models\\User', 12, 'apitoken', '98e75b02a436991511ee64595f1dc878cbcd717826cb5029dd787e7b2f82d38b', '[\"*\"]', NULL, '2023-06-07 09:29:57', '2023-06-07 09:29:57'),
(115, 'App\\Models\\User', 12, 'apitoken', 'c29887c5d20268e3bfb9bb46bf185b5e960d1b514186910cd1ded2eaf87b5c36', '[\"*\"]', NULL, '2023-06-07 09:29:57', '2023-06-07 09:29:57'),
(116, 'App\\Models\\User', 12, 'apitoken', '7ffc067957b7b6f331db4f053b3f1ed7d2e692acb7c0ebef6d01aeb727f60f1c', '[\"*\"]', NULL, '2023-06-07 09:29:57', '2023-06-07 09:29:57'),
(117, 'App\\Models\\User', 12, 'apitoken', '1cb1a1f3f928d30941c0adc05a6a1c364225c5842997595f192b181f0f37a381', '[\"*\"]', NULL, '2023-06-07 09:30:29', '2023-06-07 09:30:29'),
(118, 'App\\Models\\User', 12, 'apitoken', '8e6a863eea944371b2f11e7b1588853b756d2c040879e73a63c349fa2b5e1ea5', '[\"*\"]', NULL, '2023-06-07 09:30:29', '2023-06-07 09:30:29'),
(119, 'App\\Models\\User', 12, 'apitoken', '9499d6b0756fec8a4ffbab7a0bb8f572c9a4a3632c22adca511bf32cfdaf601d', '[\"*\"]', NULL, '2023-06-07 09:30:30', '2023-06-07 09:30:30'),
(120, 'App\\Models\\User', 12, 'apitoken', '5f8d1d195b0b7eae25e67bcb591c59f440165836f647b644d03bd50042a5433e', '[\"*\"]', NULL, '2023-06-07 09:30:50', '2023-06-07 09:30:50'),
(121, 'App\\Models\\User', 12, 'apitoken', 'e8caad691d3dbb84e982a57b737952ee327ef20236ac5f3dd7d74bc2710ed38f', '[\"*\"]', NULL, '2023-06-07 09:30:50', '2023-06-07 09:30:50'),
(122, 'App\\Models\\User', 12, 'apitoken', '751958d12f4a0f32ac97bb95cf57390228d80ddf159549086e97d69e7100969e', '[\"*\"]', NULL, '2023-06-07 09:31:23', '2023-06-07 09:31:23'),
(123, 'App\\Models\\User', 12, 'apitoken', 'e054170b52a4c495ba8bff563ee03a7d7aeac1cb20df8af74586d17bfcdd00e6', '[\"*\"]', NULL, '2023-06-07 09:31:48', '2023-06-07 09:31:48'),
(124, 'App\\Models\\User', 12, 'apitoken', 'af2065070076fbece45cfc3f69ef90f680098003efd878a3f6ff64b5b7cb4946', '[\"*\"]', NULL, '2023-06-07 09:33:00', '2023-06-07 09:33:00'),
(125, 'App\\Models\\User', 12, 'apitoken', '29717151a945fb9de2b6c5efcd61ddde7a3e80a8397e7262c370762b84fc1785', '[\"*\"]', NULL, '2023-06-07 09:33:16', '2023-06-07 09:33:16'),
(126, 'App\\Models\\User', 12, 'apitoken', 'bb3076394f22257cc86a35ade088fedc7121e13cbac8ba960f5183d72f1a9220', '[\"*\"]', NULL, '2023-06-07 09:33:27', '2023-06-07 09:33:27'),
(127, 'App\\Models\\User', 12, 'apitoken', '34a84ed94bba21045c11a8cd99fad9b153fe01a9617b7ab06af9e454c0926473', '[\"*\"]', NULL, '2023-06-07 09:35:56', '2023-06-07 09:35:56'),
(128, 'App\\Models\\User', 12, 'apitoken', '558706c65f9d74d5aa04fcc17df567bf1425fb7a802ceb429c78b9a9352bd181', '[\"*\"]', NULL, '2023-06-07 09:38:24', '2023-06-07 09:38:24'),
(129, 'App\\Models\\User', 12, 'apitoken', 'f1d942cd76d8d2cdbfa2b18070dcf5f81c8e1a21c1ab6c0826bccc911f56dbc5', '[\"*\"]', NULL, '2023-06-07 11:05:55', '2023-06-07 11:05:55'),
(130, 'App\\Models\\User', 12, 'apitoken', '6903afe252d1f43dfc8b4e319148985d5c1cd527e47c56f3753e3340b12d6e05', '[\"*\"]', NULL, '2023-06-07 11:25:25', '2023-06-07 11:25:25'),
(131, 'App\\Models\\User', 12, 'apitoken', 'c66de24edcf204c3c2e3d2966d35f8de8070f6f4d4856e4823b6635aa01c0be9', '[\"*\"]', NULL, '2023-06-07 11:25:49', '2023-06-07 11:25:49'),
(132, 'App\\Models\\User', 12, 'apitoken', 'b4ef3b617e03b50cfeeaee686b6d572ce0491dcd75c0a78a72096cda880a3d31', '[\"*\"]', NULL, '2023-06-07 11:26:17', '2023-06-07 11:26:17'),
(133, 'App\\Models\\User', 12, 'apitoken', '28de5d826ded881b14d47b294b5844e0df3a89315af09ad00afaea4b178d21a5', '[\"*\"]', NULL, '2023-06-07 11:27:01', '2023-06-07 11:27:01'),
(134, 'App\\Models\\User', 12, 'apitoken', 'a0cb47066eba4e63e5e6b0b8d686f94a7b965e5f2745a43710cee01a51b6ea65', '[\"*\"]', NULL, '2023-06-07 11:27:13', '2023-06-07 11:27:13'),
(135, 'App\\Models\\User', 12, 'apitoken', '37970992c2c9611055c1df6e43eda1b71b9e8d042ceb85afb67db46eeae15d44', '[\"*\"]', NULL, '2023-06-07 11:36:06', '2023-06-07 11:36:06'),
(136, 'App\\Models\\User', 12, 'apitoken', '4d737dc07a3ad09ad8e33371fce7ff7d7a53963514649799afa57919e0050407', '[\"*\"]', NULL, '2023-06-07 11:49:48', '2023-06-07 11:49:48'),
(137, 'App\\Models\\User', 12, 'apitoken', '597b88d7722f6b988c76c7cca2d0a914a949a9e7d944536ed054f46413359f5d', '[\"*\"]', NULL, '2023-06-07 11:50:49', '2023-06-07 11:50:49'),
(138, 'App\\Models\\User', 12, 'apitoken', 'e79dda76f1e70051e2920289ad24fde538815c56d4c5f1888c5f7c5365f16b01', '[\"*\"]', NULL, '2023-06-07 11:53:18', '2023-06-07 11:53:18'),
(139, 'App\\Models\\User', 12, 'apitoken', 'fb6076ecf12de2203985d346dbeec40fb25facb1a842a3c0c4a5c62ec3f30008', '[\"*\"]', NULL, '2023-06-08 06:20:07', '2023-06-08 06:20:07'),
(140, 'App\\Models\\User', 12, 'apitoken', '9426868b15b149bf2411fcbf3d90591f0087cf904cf5c1b69e6f8709894fbe32', '[\"*\"]', NULL, '2023-06-08 06:34:06', '2023-06-08 06:34:06'),
(141, 'App\\Models\\User', 12, 'apitoken', 'c69697c5bb32dbf8b864c35fefa1a9dc50fbd24ed2e8990746ed5efa4574522a', '[\"*\"]', NULL, '2023-06-08 06:34:58', '2023-06-08 06:34:58'),
(142, 'App\\Models\\User', 12, 'apitoken', 'cfdb0e8e76938f36638732b866e2b2e501a3ba29a38976e287308608b8e3775a', '[\"*\"]', NULL, '2023-06-08 06:37:16', '2023-06-08 06:37:16'),
(143, 'App\\Models\\User', 12, 'apitoken', 'fdc356661c7c215cf50044d95124946a22c01b145aec6bb1ec6ead62e46eee92', '[\"*\"]', NULL, '2023-06-08 06:48:31', '2023-06-08 06:48:31'),
(147, 'App\\Models\\User', 12, 'apitoken', '89e8dd2ddc45d2830057188f75d0f49167d96059c8ac6c8ae19fc9c29fbddfce', '[\"*\"]', NULL, '2023-06-08 11:53:11', '2023-06-08 11:53:11'),
(148, 'App\\Models\\User', 12, 'apitoken', 'a3368250808a8deb15551acce8778265bf03082aae2b3e3bbe2a39c455500c36', '[\"*\"]', NULL, '2023-06-08 11:56:58', '2023-06-08 11:56:58'),
(149, 'App\\Models\\User', 12, 'apitoken', '95c4886ec8f99789b59741ed6db7aed33d075bca62fabc4a120a0724144866fd', '[\"*\"]', NULL, '2023-06-12 04:39:16', '2023-06-12 04:39:16'),
(153, 'App\\Models\\User', 12, 'apitoken', 'a938562d11a50569acc397492e1533364856a48c0a9f74f84bfc6284d9ba6d6b', '[\"*\"]', NULL, '2023-06-15 07:04:38', '2023-06-15 07:04:38'),
(157, 'App\\Models\\User', 12, 'apitoken', '2020f34a256107ae2047ec55153351d83bd218bf829f990a227c5a7250e96aa3', '[\"*\"]', NULL, '2023-06-15 10:04:10', '2023-06-15 10:04:10'),
(158, 'App\\Models\\User', 12, 'apitoken', '7b338d994534499dec28180118859b2cbc932f32e51223ca5dd563bffa9440d0', '[\"*\"]', '2023-06-23 07:55:25', '2023-06-15 10:04:20', '2023-06-23 07:55:25'),
(160, 'App\\Models\\User', 12, 'apitoken', '8829e1680fd747ea7d1a1427fb82c19f05ea561b6578b62dd495c58870b946b7', '[\"*\"]', '2023-06-19 08:18:52', '2023-06-15 11:34:04', '2023-06-19 08:18:52'),
(161, 'App\\Models\\User', 12, 'apitoken', '977679e2acf150d7dedfa42ea3d217a6ca392f35adc04bf07c37f8ad35ecdb80', '[\"*\"]', '2023-06-16 08:10:09', '2023-06-16 08:09:46', '2023-06-16 08:10:09'),
(162, 'App\\Models\\User', 3, 'apitoken', '8387e54e47f60ad7f7fb2df0aefa3fa367a6e221f9caba8d8a30798b14a7e6b0', '[\"*\"]', '2023-06-19 05:40:04', '2023-06-19 05:39:59', '2023-06-19 05:40:04'),
(163, 'App\\Models\\User', 12, 'apitoken', 'a876131dd685256ef05707c6bc13a1dbb667ae740584d26946f807c4db515f93', '[\"*\"]', '2023-07-03 07:10:18', '2023-06-19 10:01:00', '2023-07-03 07:10:18'),
(164, 'App\\Models\\User', 12, 'apitoken', '4d84236af07e211753b3b7917fe3f75373038d9354232c5c815479af22402e29', '[\"*\"]', '2023-07-14 05:03:46', '2023-06-21 07:34:14', '2023-07-14 05:03:46'),
(165, 'App\\Models\\User', 12, 'apitoken', '0b196115d8d2db129e97060015ef57a990abefbe9f7cd297ce894984ce56b32c', '[\"*\"]', '2023-07-03 09:42:59', '2023-06-23 08:04:47', '2023-07-03 09:42:59'),
(166, 'App\\Models\\User', 12, 'apitoken', '8617d018d55d65c9aced01f8009374558f4acc7a662abdfe8a0d7a7a5d551361', '[\"*\"]', NULL, '2023-06-23 08:27:44', '2023-06-23 08:27:44'),
(167, 'App\\Models\\User', 12, 'apitoken', '737a931122ee7d4d777560b780a24a1617aec4f477b70c55e31eeb46085ea5c4', '[\"*\"]', NULL, '2023-06-23 08:32:05', '2023-06-23 08:32:05'),
(168, 'App\\Models\\User', 12, 'apitoken', '8636db3bc7d0dbeeaa0382eb1c9e8c7a579ad2eff253645befc90bdc23fe59d5', '[\"*\"]', NULL, '2023-06-23 08:37:02', '2023-06-23 08:37:02'),
(169, 'App\\Models\\User', 12, 'apitoken', '0636e7852caa8edc23f18117f361762899b81d6c06e95172009c20eca973d388', '[\"*\"]', NULL, '2023-06-23 08:38:01', '2023-06-23 08:38:01'),
(170, 'App\\Models\\User', 12, 'apitoken', '5505a0c272d2b2159f0a8b9337c5dc12a574d3ac2f30e62ae6135a37426a7705', '[\"*\"]', '2023-06-23 08:40:58', '2023-06-23 08:39:38', '2023-06-23 08:40:58'),
(174, 'App\\Models\\User', 12, 'apitoken', '453be59b7de8bcfdc98b4124dc7d68d10e1bd7c94e40cd1766344147c6edb074', '[\"*\"]', '2023-07-05 10:26:08', '2023-07-03 09:02:33', '2023-07-05 10:26:08'),
(176, 'App\\Models\\User', 12, 'apitoken', 'aa7ba3db3843c46f0bace99a8028b6f8cc3d38ea8f25049f23ac007468ef5002', '[\"*\"]', '2023-07-14 05:06:35', '2023-07-04 05:09:35', '2023-07-14 05:06:35'),
(177, 'App\\Models\\User', 12, 'apitoken', 'ccae79e2c1cbc0eeb965c8e61728bbd446f20e13ca850570ea07e0f1f9f09b28', '[\"*\"]', '2023-07-05 10:28:32', '2023-07-05 10:27:08', '2023-07-05 10:28:32'),
(178, 'App\\Models\\User', 12, 'apitoken', '4c5f376f09d0c12177ef40529f6c1e6049c21bc40005af71d32e452be8fbf769', '[\"*\"]', '2023-07-06 11:32:28', '2023-07-06 10:18:26', '2023-07-06 11:32:28'),
(179, 'App\\Models\\User', 12, 'apitoken', '6675efad056876baca88718704e7ee63b967d378d4186f15700a910cb115b2f9', '[\"*\"]', '2023-07-14 05:03:52', '2023-07-12 05:54:30', '2023-07-14 05:03:52'),
(180, 'App\\Models\\User', 3, 'apitoken', '75d10094eeb2b0cd2db7edfcf0a1a968196a0716bda34dacb7bb0fc014e7b17b', '[\"*\"]', '2023-07-12 07:48:46', '2023-07-12 06:52:04', '2023-07-12 07:48:46'),
(181, 'App\\Models\\User', 3, 'apitoken', '53e5b4d6a0686025143fc816f271268173ab48527d97a12d69e83d1a80a3a95f', '[\"*\"]', '2023-07-13 08:59:59', '2023-07-12 09:20:24', '2023-07-13 08:59:59'),
(182, 'App\\Models\\User', 3, 'apitoken', 'e8d78b18abf26301f6bdfd5b01c44d55a0ef00a59eeaee59c18bf1de2ed27d67', '[\"*\"]', '2023-07-13 09:13:00', '2023-07-13 09:07:24', '2023-07-13 09:13:00');

-- --------------------------------------------------------

--
-- Structure de la table `personnel_cards`
--

CREATE TABLE `personnel_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `education` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_iban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnel_cards`
--

INSERT INTO `personnel_cards` (`id`, `name_surname`, `birth_date`, `phone`, `email`, `department`, `title`, `start_date`, `education`, `bank_name`, `bank_iban`, `salary`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Enes Demir', '2022-12-23', '5364507221', 'enes.demir@hotelistan.com', 'Software Development', 'Head Of Software Development', '2022-12-23', 'a', 'a', 'a', '1000', 'test', 3, '2022-12-23 04:34:31', '2022-12-23 02:24:20', '2022-12-23 04:34:31'),
(2, 'Enes Demir', '2022-12-23', '5364507222', 'enes.demir@hotelistan.com', 'Software Development', 'Head of Software Development', '2022-12-23', 'a', 'a', 'a', '5500', 'test', 3, '2023-01-17 05:53:32', '2022-12-23 04:33:14', '2023-01-17 05:53:32'),
(3, 'RAFET ACAR', '1977-02-22', '5302624322', 'rafet.acar@hotmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-12-16', 'ilköğretim', 'AKBANK', 'TR040004600133888000236306', '0', NULL, 9, NULL, '2022-12-28 10:15:49', '2023-02-08 11:52:13'),
(4, 'HASAN ALBAYRAK', '1975-12-03', '5442374140', 'hasan.albayrak@gmail.com', 'LOJİSTİK', 'SOFÖR', '2022-12-08', 'LİSE', 'AKBANK', 'TR260004600133888000235813', '0', NULL, 9, NULL, '2022-12-28 10:18:51', '2022-12-28 11:56:29'),
(5, 'ÖMER KALE', '1983-07-23', '5419035881', 'ömer.kale@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-12-05', 'LİSE', 'AKBANK', 'TR580004600133888000235334', '0', NULL, 9, NULL, '2022-12-28 10:22:15', '2022-12-28 10:22:15'),
(6, 'ABDUSELAM ÖZKAN', '1987-04-11', '5426812157', 'abduselam.özkan@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-12-05', 'LİSE', 'AKBANK', 'TTR520004600133888000235345', '0', NULL, 9, NULL, '2022-12-28 10:45:40', '2022-12-28 10:45:40'),
(7, 'MESUT ADIGÜZEL', '1997-01-08', '5532613520', 'mesut.adıgüzel@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-12-01', 'LİSE', 'AKBANK', 'TR170004600133888000234811', '0', NULL, 9, NULL, '2022-12-28 11:10:07', '2022-12-28 11:10:07'),
(8, 'KADİR AYTAN', '1994-10-10', '5306350344', 'kadir.aytan@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-11-24', 'LİSE', 'AKBANK', 'TR980004600133888000234517', '0', NULL, 9, NULL, '2022-12-28 11:13:37', '2022-12-28 11:13:37'),
(9, 'YILMAZ TAŞTEKİN', '2000-05-16', '5330259021', 'yılmaz.taştekin@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-11-22', 'LİSE', 'AKBANK', 'TR530004600133888000234842', '0', NULL, 9, NULL, '2022-12-28 11:16:34', '2022-12-28 11:16:34'),
(10, 'MUSTAFA AYDIN', '1987-06-10', '5533338753', 'mustafa.aydın@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-11-18', 'LİSE', 'AKBANK', 'TR160004600133888000233665', '0', NULL, 9, NULL, '2022-12-28 11:19:28', '2022-12-28 11:19:28'),
(11, 'MEHMET ALTUNER', '1990-04-12', '5075229201', 'mehmet.altuner@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-11-14', 'LİSE', 'AKBANK', 'TR520004600133888000234375', '0', NULL, 9, NULL, '2022-12-28 11:55:19', '2022-12-28 11:55:19'),
(12, 'MURAT ÖZTÜRK', '1977-09-01', '5321758248', 'murat.öztürk@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2017-04-05', 'ilköğretim', 'AKBANK', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 05:25:30', '2023-01-11 05:25:30'),
(13, 'YUSUF ZİYA SEYMEN', '1968-04-28', '5315522535', 'yusufziya.seymen@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-09-19', 'LİSE', 'GARANTİ', 'TR77 0006 2000 5440 0006 6146 34', '0', NULL, 9, NULL, '2023-01-11 05:27:59', '2023-01-11 05:27:59'),
(14, 'AHMET KAYA', '1997-12-22', '5380597274', 'ahmet.kaya@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-09-17', 'LİSE', 'GARANTİ', 'TR53 0006 2001 4830 0006 6920 45', '0', NULL, 9, NULL, '2023-01-11 05:31:20', '2023-01-11 05:31:20'),
(15, 'KENAN ÖZ', '1976-04-08', '5528431770', 'kenan.öz@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-08-05', 'LİSE', '0', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 05:35:56', '2023-01-11 05:35:56'),
(16, 'ŞERAFETTİN MUTLU', '1986-05-10', '5557037987', 'şerafettin.mutlu@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-09-07', 'LİSE', '0', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 05:39:49', '2023-01-11 05:39:49'),
(17, 'ŞAHİN GÜNEŞ', '1999-05-15', '5393649797', 'şahin.güneş@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-08-25', 'LİSE', 'GARANTİ', 'TR54 0006 2000 0130 0006 8706 79', '0', NULL, 9, NULL, '2023-01-11 05:42:14', '2023-01-11 05:42:14'),
(18, 'RAMAZAN TEKİN', '1990-04-02', '5524057157', 'ramazann.tekin@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-10-26', 'LİSANS', 'AKBANK', 'TR22 0004 6001 3388 8000 2337 51', '0', NULL, 9, NULL, '2023-01-11 05:46:42', '2023-01-30 16:42:47'),
(19, 'HASAN ARSLAN', '1982-09-09', '5412031296', 'hasan.arslan@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2016-12-06', 'LİSE', '0', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 07:51:20', '2023-01-11 07:51:20'),
(20, 'KAMURAN ŞEN', '1977-12-30', '5058190056', 'kamuran.şen@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-06-05', 'LİSE', '0', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 08:13:07', '2023-01-11 08:13:07'),
(21, 'ONUR ULU', '1977-03-16', '5327701681', 'onur.ulu@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2016-03-01', 'BİLİNMİYOR', '0', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 08:54:50', '2023-01-11 08:54:50'),
(22, 'SERHAT ÇEPERLİ', '1992-09-24', '5449753475', 'serhat.çeperli@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-09-24', 'BİLİNMİYOR', 'GARANTİ', 'TR55 0006 2000 0190 0006 6631 48', '0', NULL, 9, NULL, '2023-01-11 08:59:13', '2023-01-11 08:59:13'),
(23, 'VEYSEL GÜNEŞ', '1976-10-01', '5379871108', 'veysel.güneş@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2017-11-02', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 09:07:44', '2023-01-11 09:07:44'),
(24, 'ABDULLAH ŞİMŞEK', '1980-08-27', '5302049191', 'abdullah.şimşek@hotelistan.com', 'OPERASYON-VİPSER', 'OPERASYON ELEMANI', '2020-01-17', 'BİLİNMİYOR', 'GARANTİ', 'TR57 0006 2000 0670 0006 6860 55', '0', NULL, 9, NULL, '2023-01-11 09:10:41', '2023-01-11 09:22:52'),
(25, 'BÜLENT YILDIRIM', '1977-09-15', '5324432000', 'bülent.yıldırım@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2020-01-27', 'ORTAOKUL', 'GARANTİ', 'TR28 0006 2000 6500 0006 6754 17', '0', NULL, 9, NULL, '2023-01-11 09:16:42', '2023-01-11 09:16:42'),
(26, 'HÜSEYİN APUHAN', '1992-12-21', '5316488716', 'huseyin.apuhan@hotelistan.com', 'OPERASYON-VİPSER', 'OPERASYON ELEMANI', '2020-10-12', 'ÖNLİSANS', 'QBN FİNANSBANK', 'TR45 0011 1000 0000 0084 3569 12', '0', NULL, 9, NULL, '2023-01-11 09:22:25', '2023-01-11 09:23:22'),
(27, 'MEVLÜT YÖNET', '1980-08-04', '5536192788', 'mevlüt.yönet@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2020-01-13', 'LİSE', 'GARANTİ', 'TR96 0006 2000 5780 0006 6674 72', '0', NULL, 9, NULL, '2023-01-11 09:30:40', '2023-01-11 09:30:40'),
(28, 'YILMAZ ŞENGÜN', '1969-05-29', '5322816709', 'yılmaz.şengün@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2023-01-11', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 09:34:21', '2023-01-11 09:34:21'),
(29, 'EKREM GÜNDOĞDU', '1980-05-27', '5333853544', 'ekrem.gündoğdu@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-01-10', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 10:00:29', '2023-01-11 10:00:29'),
(30, 'VEDAT KUNDAK', '1979-02-22', '5457410971', 'vedat.kundak@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-09-15', 'ilköğretim', 'GARANTİ', 'TR60 0006 2001 2340 0006 6907 39', '0', NULL, 9, NULL, '2023-01-11 10:07:03', '2023-01-11 10:07:03'),
(31, 'SERDAR CÖMERT', '1975-12-19', '5426206722', 'serdar.cömert@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2019-12-02', 'BİLİNMİYOR', 'GARANTİ', 'TR25 0006 2000 2510 0006 6512 84', '0', NULL, 9, NULL, '2023-01-11 11:07:30', '2023-01-11 11:07:30'),
(32, 'SERKAN SÖNMEZ', '1971-09-27', '5443444852', 'serkan.sönmez@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2017-11-16', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 11:39:52', '2023-01-11 11:39:52'),
(33, 'SEDAT TUNÇ', '1986-03-06', '0000000000', 'sedat.tunç@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-12-07', 'LİSANS', 'YAPIKREDİ', 'TR74 0006 7010 0000 0055 9537 0130 16', '0', NULL, 9, NULL, '2023-01-11 11:45:31', '2023-01-11 11:45:31'),
(34, 'BERAT ÇALIŞIR', '1999-10-31', '5313984333', 'berat.çalışır@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-07-18', 'LİSE', 'BİLİNMİYOR', 'TR28 0006 2000 3950 0006 6399 29', '0', NULL, 9, NULL, '2023-01-11 11:56:27', '2023-01-11 11:56:27'),
(35, 'NECMETTİN KARADENİZ', '1976-10-10', '5373030064', 'necmettin.karadeniz@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2017-10-02', 'İLKOKUL', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 12:00:14', '2023-01-11 12:00:14'),
(36, 'SERDAR GENÇ', '1978-10-14', '5435271837', 'serdar.genç@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-12-28', 'İLKOKUL', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 12:02:21', '2023-01-24 09:53:37'),
(37, 'ŞAKİR ÖZEN', '1972-01-01', '0000000000', 'şakir.özen@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-04-27', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 12:06:05', '2023-01-11 12:06:05'),
(38, 'ŞÜKRÜ SEVER', '1970-04-17', '5332087186', 'şükrü.sever@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2020-09-25', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 12:09:36', '2023-01-11 12:09:36'),
(39, 'ZAFER TEMUR', '1983-06-17', '5349845767', 'zafer.temur@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-05-31', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-11 12:12:22', '2023-01-11 12:12:22'),
(40, 'AKAY GENÇ', '1982-09-09', '0000000000', 'akay.genç@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-05-21', 'ORTAOKUL', 'GARANTİ', 'TR84 0006 2000 5200 0006 2934 34', '0', NULL, 9, NULL, '2023-01-12 05:25:25', '2023-01-24 09:53:51'),
(41, 'EROL KAŞ', '1982-01-01', '5439164900', 'erol.kaş@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2018-03-07', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 05:30:33', '2023-01-12 05:30:33'),
(42, 'SADIK KALAYCI', '1984-06-15', '5315403717', 'sadık.kalaycı@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-03-12', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 05:37:01', '2023-01-12 05:37:01'),
(43, 'RECEP UZUN', '1986-03-26', '5419181010', 'recep.uzun@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-11-10', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 07:49:09', '2023-01-12 07:49:09'),
(44, 'BÜLENT ECEVİT', '1972-08-29', '5334957313', 'bülenr.ecevit@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-09-20', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 07:51:16', '2023-01-12 07:51:16'),
(45, 'EROL ESKİCİ', '1971-01-28', '5495355252', 'erol.eskici@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-09-24', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 07:54:57', '2023-01-12 07:54:57'),
(46, 'GÜRKAN ÖZER', '1975-02-14', '5362126457', 'gürkan.özer@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2023-01-12', 'İLKOKUL', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 07:57:33', '2023-01-12 07:57:33'),
(47, 'SERKAN AYGÜN', '1988-06-28', '5303862837', 'serkan.aygün@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-06-13', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 09:17:42', '2023-01-12 09:17:42'),
(48, 'AYKUT TAŞHAN', '1989-11-05', '5426993754', 'aykut.taşhan@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-11-29', 'ORTAOKUL', 'GARANTİ', 'TR05 0006 2001 1150 0006 6608 96', '0', NULL, 9, NULL, '2023-01-12 09:25:31', '2023-01-12 09:25:31'),
(49, 'ADNAN KAYA', '1977-05-04', '5322028578', 'adnan.kaya@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-05-06', 'ORTAOKUL', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 09:28:07', '2023-01-12 09:28:07'),
(50, 'ABDULKERİM AKGÜL', '1995-11-03', '0000000000', 'abdulkerim.akgül@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2021-12-04', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 09:33:02', '2023-01-12 09:33:02'),
(51, 'EMRE YENGÜL', '1974-03-09', '5363325700', 'emreyengul@hotmail.com', 'LOJİSTİK', 'ŞOFÖR', '2021-12-14', 'ORTAOKUL', 'GARANTİ', 'TR55 0006 2000 7520 0006 6211 68', '0', NULL, 9, NULL, '2023-01-12 09:36:16', '2023-01-12 09:36:16'),
(52, 'ERKAN AKSU', '1978-01-25', '5366050568', 'erkan.aksu@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-04-13', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 09:41:53', '2023-01-12 09:41:53'),
(53, 'EROL YILMAZ', '1972-08-20', '5457637849', 'erol.yılmaz@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-05-06', 'ORTAOKUL', 'GARANTİ', 'TR50 0006 2000 3570 0006 8825 14', '0', NULL, 9, NULL, '2023-01-12 09:45:19', '2023-01-12 09:45:19'),
(54, 'KAZIM KAYA', '1970-02-20', '5358132456', 'kazım.kaya@hotelistan.com', 'LOJİSTİK', 'ŞOFÖR', '2022-04-01', 'ORTAOKUL', 'GARANTİ', 'TR41 0006 2000 7010 0006 8825 08', '0', NULL, 9, NULL, '2023-01-12 09:48:33', '2023-01-12 09:48:33'),
(55, 'ŞABAN SEFER', '1975-03-13', '5309915839', 'şabansefer43@gmail.com', 'LOJİSTİK', 'ŞOFÖR', '2022-05-06', 'İLKOKUL', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 10:00:41', '2023-01-12 10:00:41'),
(56, 'ARMIN ARZANI', '1985-08-30', '5347131719', 'arminarzanii@gmail.com', 'MİSAFİR İLİŞKİLERİ', 'MİSAFİR İLŞKİLERİ GÖREVLİSİ-TERCÜMAN', '2022-03-30', 'ÖNLİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 11:01:22', '2023-02-08 11:51:50'),
(57, 'ANDERA MÜLDÜR', '1990-09-01', '0000000000', 'andera.müldür@hotelistan.com', 'MİSAFİR İLİŞKİLERİ', 'TERCÜMAN', '2016-03-01', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 11:04:21', '2023-01-12 11:04:21'),
(58, 'AŞKIN SUAK', '1990-03-06', '5443400340', 'askın.suak@hotelistan.com', 'YAZILIM', 'YAZILIM DESTEK UZMANI', '2021-02-03', 'LİSE', 'BİLİNMİYOR', 'TR09 0006 2000 3570 0006 6318 28', '0', '0', 9, NULL, '2023-01-12 11:08:11', '2023-01-12 11:08:11'),
(59, 'ALEN BASIL SHAMOON', '1994-06-02', '5346379740', 'alen.basıl@hotelistan.com', 'MİSAFİR İLİŞKİLERİ', 'MİSAFİR İLİŞKİLERİ UZMANI-TERCÜMAN', '2019-12-23', 'BİLİNMİYOR', 'GARANTİ', 'TR89 0006 4000 0011 0511 9438 43', '0', NULL, 9, NULL, '2023-01-12 11:13:03', '2023-01-12 11:13:03'),
(60, 'AHMET EMRE AKÇA', '1994-08-29', '5357692495', 'emreakca94@gmail.com', 'MİSAFİR İLİŞKİLERİ', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ-TERCÜMAN', '2022-04-30', 'LİSANS', 'GARANTİ', 'TR04 0006 2001 0850 0006 6530 13', '0', 'SERKAN AYGIN', 9, NULL, '2023-01-12 11:18:46', '2023-01-24 09:54:05'),
(61, 'ANGELİKA HEİLANDER', '1988-11-15', '5330902472', 'angelika.heilander@hotelistan.com', 'OPERASYON ELEMANI-TURIZM', 'OPERASYON ELEMANI', '2016-03-01', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-12 11:23:10', '2023-01-12 11:23:10'),
(62, 'ALAAEDDIN SABOUNI', '2001-04-29', '0000000000', 'alaaeddın.saounı@hotelistan.com', 'MİSAFİR İLİŞKİLERİ', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ', '2022-07-02', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-13 10:50:13', '2023-01-13 10:50:13'),
(63, 'ANACELIA SANCHEZ IZQUIERDO', '1992-10-17', '5437944994', 'anacelia.sandez@hotelistan.com', 'MİSAFİR İLİŞKİLERİ', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ', '2022-09-08', 'LİSANS', 'ZİRAAT BANKASI', 'TR14 0001 0017 6586 3376 8350 01', '0', NULL, 9, NULL, '2023-01-13 11:47:03', '2023-01-13 11:47:03'),
(64, 'AGATA WIELGOLASKA', '1981-10-26', '5397862567', 'agata.wıelgolaska@hotelistan.com', 'CONTENT', 'CONTENT WRİTER', '2021-02-11', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-13 12:10:03', '2023-01-13 12:10:03'),
(65, 'ALEV UÇAR', '1991-09-24', '5319350454', 'alev.ucar@hotelistan.com', 'PAZARLAMA', 'PERFORMANCE MARKETİNG MENAGER', '2022-10-05', 'ÖNLİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-23 04:49:51', '2023-01-23 04:49:51'),
(66, 'AYNUR DENİZ AKSU', '1999-06-24', '5414363011', 'dnizaksu@gmail.com', 'OPERASYON', 'HEMŞİRE', '2022-09-03', 'LİSE', 'GARANTİ', 'TR65 0006 2000 3730 0006 8949 68', '0', NULL, 9, NULL, '2023-01-23 04:53:23', '2023-01-23 04:53:23'),
(67, 'AHMET ÇOBAN', '1991-10-17', '5387124837', 'ahmet6_91@hotmail.com', 'SATIŞ', 'SATIŞ DANIŞMANI', '2021-09-06', 'LİSANS', 'GARANTİ', 'TR59 0006 2000 7760 0006 6085 60', '0', NULL, 9, NULL, '2023-01-23 04:56:59', '2023-01-23 04:56:59'),
(68, 'ALP EREN AYDEMİR', '1998-07-03', '5380269284', 'alperenaydmr@gmail.com', 'İT', 'BİLGİ İŞLEM DESTEK UZMANI', '2022-06-04', 'LİSANS', 'GARANTİ', 'TR16 0006 2000 7720 0006 6230 31', '0', NULL, 9, NULL, '2023-01-23 05:02:21', '2023-01-23 05:02:21'),
(69, 'ADBURRAHMAN BAŞTUĞ', '1993-08-30', '5367357511', 'abdurrahmanbastuğ@gmail.com', 'PRODÜKSİYON', 'FOTOĞRAF VE VİDEO ÇEKİMCİSİ', '2022-08-16', 'LİSANS', 'GARANTİ', 'TR63 0006 2000 7010 0006 8829 85', '0', NULL, 9, NULL, '2023-01-23 05:07:28', '2023-01-23 05:07:28'),
(70, 'BURCU BÜŞRA SEZGİN', '1989-07-28', '5523398907', 'burcu.busra.sezgin@gmail.com', 'OPERASYON', 'TERCÜMAN -İTALYANCA', '2022-08-27', 'YÜKSEK LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', 'SERKAN ŞEN', 9, NULL, '2023-01-23 08:17:48', '2023-01-23 08:17:48'),
(71, 'BÜŞRA PARLAK BİZİMYER', '1993-03-03', '5538606732', 'parlakbusraa@gmail.com', 'DENETİM', 'İÇ DENTÇİ', '2022-10-21', 'LİSE', 'AKBANK', 'TR17 0004 6001 3388 8000 2336 47', '0', NULL, 9, NULL, '2023-01-23 08:21:10', '2023-01-23 08:21:10'),
(72, 'BUSE DEERİN', '2004-07-28', '5459543676', 'Busenurderin@gmail.com', 'OPERASYON', 'TERCÜMAN-İNGİLİZCE', '2022-10-03', 'LİSE', 'GARANTİ', 'TR98 0006 2000 6030 0006 6591 63', '0', 'ALİ BEY EKİP', 9, NULL, '2023-01-23 08:36:41', '2023-01-23 08:36:41'),
(73, 'BUSE NUR YENİGÜN', '2000-12-19', '5468792694', 'buseynigun@gmail.com', 'SOSYAL MEDYA', 'SOSYAL MEDYA UZMANI', '2022-09-02', 'LİSANS', 'GARANTİ', 'TR94 0006 2000 3570 0006 8916', '0', NULL, 9, NULL, '2023-01-23 08:41:55', '2023-01-23 08:41:55'),
(74, 'BERKE SERİM', '1995-09-26', '5306970531', 'berkeserim@gmail.com', 'OPERASYON', 'TERCÜMAN', '2022-09-26', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-23 09:02:26', '2023-01-23 09:02:26'),
(75, 'BUSE AYRANCI', '1993-03-06', '5467191775', 'buseayrancı@outlook.com', 'FİNANS', 'FİNANS ELEMANI', '2022-09-14', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-01-23 09:08:27', '2023-01-23 09:08:27'),
(76, 'BATIN CAN', '1997-02-28', '5553753514', 'batincn@gmail.com', 'PRODÜKSİYON', 'GÖRÜNTÜ YÖNETMENİ', '2022-08-16', 'LİSANS', 'BİLİNMİYOR', 'TR60 0006 2000 0670 0006 6445 82', '0', NULL, 9, NULL, '2023-01-23 09:22:00', '2023-01-23 09:22:00'),
(77, 'BAHADDİN AYDIN', '1996-10-02', '5548412996', 'aydnbahaddın@gmail.com', 'PRODÜKSİYON', 'KURGU YÖNETMENİ', '2022-08-16', 'LİSE', 'GARANTİ', 'TR66 0006 2000 5890 0006 6521 46', '0', NULL, 9, NULL, '2023-01-23 09:46:49', '2023-01-23 09:46:49'),
(78, 'BETÜL DİNÇ', '1996-04-02', '5304905939', 'betul0109@gmail.com', 'SATIŞ', 'SATIŞ GÖREVLİSİ', '2022-07-01', 'LİSE', 'GARANTİ', 'TR750006200074600006641014', '0', NULL, 9, NULL, '2023-02-13 05:50:41', '2023-02-13 05:50:41'),
(79, 'BELLA SERT', '2000-06-03', '5464277723', 'tachbelle@gmail.com', 'OPERASYON', 'TERCÜMAN', '2022-06-02', 'LİSANS', 'GARANTİ', 'TR06 0006 2000 7410 0006 6664 34', '0', NULL, 9, NULL, '2023-02-13 05:56:59', '2023-02-13 05:56:59'),
(80, 'BURAK AKSOY', '1996-12-25', '5436991110', 'burak.aksoy@hotelistan.com', 'SATIŞ', 'SATIŞ GÖREVLİSİ', '2026-06-27', 'LİSE', '0', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-13 06:49:22', '2023-02-13 06:49:22'),
(81, 'BERKAY KARAYİĞİT', '1998-08-19', '5356981061', 'berkaykarayiğit@gmail.com', 'İÇERİK', 'METİN YAZARI', '2023-01-23', 'LİSANS', 'AKBANK', 'TR820004600133888000238297', '0', NULL, 9, NULL, '2023-02-13 07:11:54', '2023-02-13 07:11:54'),
(82, 'BAHAR İNCİ', '2001-07-13', '5378895655', 'baharinci111@gmail.com', 'OPERASYON', 'TERCÜMAN-ALMANCA', '2022-08-15', 'ÖNLİSANS', '00', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-13 07:16:53', '2023-02-13 07:16:53'),
(83, 'BANU AYDINAY', '1994-01-17', '5442342360', 'banuaydınay@gmail.com', 'OPERASYON-DOKU', 'TERCÜMAN', '2019-08-02', 'LİSANS', '0', '0000000000000000000000', '0', 'SERKAN ŞEN', 9, NULL, '2023-02-13 07:21:19', '2023-02-13 07:21:19'),
(84, 'BURCU YOKUŞ', '1990-08-23', '5417933613', 'burcumi90@icloud.com', 'OPERASYON-DOKU', 'TERCÜMAN', '2021-09-22', 'LİSANS', 'GARANTİ', 'TR600006200107500006673686', '0', 'SERKAN ŞEN', 9, NULL, '2023-02-13 07:27:48', '2023-02-13 07:27:48'),
(85, 'BESİANA HOXHA', '1994-06-17', '0000000000', 'besiana.hoxha@hotelistan.com', 'SATIŞ-SERKAN AYGIN', 'SATIŞ MÜDÜRÜ', '2017-12-14', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', 'SERKAN AYGIN', 9, NULL, '2023-02-13 07:32:21', '2023-02-13 07:32:21'),
(86, 'BARAN AĞ', '1997-04-13', '5063861960', 'baran.ağ@hotelistan.com', 'İÇERİK', 'METİN YAZARI', '2022-09-19', 'LİSANS', 'GARANTİ', 'TR760006200015200006877930', '0', '0', 9, NULL, '2023-02-13 07:39:30', '2023-02-13 07:39:30'),
(87, 'BAHAR BURCU BOZKURT ALTUNER', '1981-04-22', '5358294837', 'bahbur@hotmail.com', 'İNSAN KAYNAKLARI', 'İNSAN KAYNAKLARI UZMANI', '2021-12-13', 'LİSE', 'GARANTİ', 'TR650006200034000006685322', '0', NULL, 9, NULL, '2023-02-13 07:44:09', '2023-02-13 07:44:09'),
(88, 'BENGİSU KATRE ÇALIŞKAN', '1998-03-22', '5336632363', 'bengisukatrecalışkann@gmail.com', 'OPERASYON', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ', '2021-08-02', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-13 08:50:22', '2023-02-13 08:50:22'),
(89, 'BATUHAN VAROLSUN', '1992-10-29', '0000000000', 'batuhn.varlsn@hotelistan.com', 'MUHASEBE', 'MUHASEBE UZMANI', '2018-10-22', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-13 09:20:01', '2023-02-13 09:20:01'),
(90, 'BEDRİ TAŞ', '1993-05-01', '5300852294', 'taşbedri1@gmail.com', 'İÇ DENETİM', 'İÇ DENETİM UZMAN YARDIMCISI', '2022-06-08', 'ÖNLİSANS', 'GARANTİ', 'TR090006200128100006652816', '0', NULL, 9, NULL, '2023-02-13 09:28:31', '2023-02-13 09:28:31'),
(91, 'CANBERK TOKMAK', '1996-08-12', '5354089965', 'canberkk@hotmail.com', 'SATIŞ', 'SATIŞ GÖREVLİSİ', '2023-02-01', 'LİSE', 'AKBANK', 'TR47 0004 6001 3388 8000 2386 36', '0', 'ARPANU SATIŞ', 9, NULL, '2023-02-13 09:35:10', '2023-02-13 09:35:10'),
(92, 'ÇİĞDEM USEN', '1984-08-21', '0000000000', 'çigdem.usen@hotelistan.com', 'OPERASYON-DOKU', 'TERCÜMAN', '2021-01-25', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', 'DOKU', 9, NULL, '2023-02-13 09:46:46', '2023-02-13 09:46:46'),
(93, 'CANSEL DEMİRCİ', '2000-04-03', '5356371962', 'cansel.demirci@hotelistan.com', 'TASARIM', 'GRAFİK TASARIMCI', '2022-03-07', 'ÖNLİSANS', 'GARANTİ', 'TR160006200070100006882764', '0', NULL, 9, NULL, '2023-02-13 10:54:43', '2023-02-13 10:54:43'),
(94, 'CAN GÜLTEKİN', '1989-07-04', '5312816942', 'cangultekin_89@gmail.com', 'MİSAFİR İLİŞKİLERİ', 'DANIŞMA MEMURU', '2022-02-21', 'LİSE', 'BİLİNMİYOR', 'TR2200062000701000068963', '0', NULL, 9, NULL, '2023-02-15 10:11:18', '2023-02-15 10:11:18'),
(95, 'CEMİLE ALTUNTAŞ', '1999-09-22', '5436941930', 'cemile.altunttaş@hotelistan.com', 'E-TİCARET', 'E-TİCARET UZMAN YARDIMCISI', '2022-09-13', 'Üniversite', 'GARANTİ', 'TR100006200075000006853430', '0', NULL, 9, NULL, '2023-02-15 11:14:11', '2023-02-15 11:14:11'),
(96, 'CANBERK ALTUNDAL', '1989-03-17', '5528851540', 'altundalcanberk@gmail.com', 'OPERASYON-SERKAN AYGIN', 'TERCÜMAN', '2022-10-03', 'LİSANS', 'GARANTİ', 'TR180006200015200006877034', '0', NULL, 9, NULL, '2023-02-15 11:34:37', '2023-02-15 11:34:37'),
(97, 'CEYLAN MUTLU', '1997-03-20', '5419018246', 'ceylan.mutlu@live.com', 'E-TİCARET', 'E-TİCARET UZMANI', '2022-01-20', 'LİSANS', 'GARANTİ', 'TR050006200074400006880613', '0', NULL, 9, NULL, '2023-02-15 11:49:43', '2023-02-15 11:49:43'),
(98, 'ESMA SENA ÇAYAN', '1998-10-28', '5319737863', 'eskabasakal1@gmail.com', 'İÇERİK', 'SEO METİN YAZARI', '2022-02-21', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 03:18:08', '2023-02-16 03:18:08'),
(99, 'EDA KIZILTAN', '1994-05-09', '5374612434', 'eda.kiziltan1994@gmail.com', 'OPERASYON', 'TERCÜMAN', '2022-08-01', 'LİSANS', 'BİLİNMİYOR', 'TR930006200035700006884359', '0', NULL, 9, NULL, '2023-02-16 03:27:25', '2023-02-16 03:27:25'),
(100, 'ERSİN AKIN', '1979-10-22', '5075547154', 'ersin.akın@hotelistan.com', 'MİMARLIK', 'TEKNİK SERVİS ELEMANI', '2021-09-06', 'İLKOKUL', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 03:37:11', '2023-02-16 03:37:11'),
(101, 'EZGİ TUĞRUL', '2000-10-08', '5452387458', 'ezgi_ygrl@hotmail.com', 'OPERASYON-DOKU', 'TERCÜMAN', '2022-04-15', 'LİSANS', 'GARANTİ', 'TR730006200127800006674959', '0', NULL, 9, NULL, '2023-02-16 03:42:01', '2023-02-16 03:42:01'),
(102, 'EZGİ KOCA', '1989-05-24', '0000000000', 'ezgi.koca@hotelistan.com', 'HALKLA İLİŞKİLER', 'YÖNETİCİ', '2019-11-18', 'ÖNLİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 03:52:19', '2023-02-16 03:52:19'),
(103, 'EMİNE OSMANPAZARI', '1992-03-18', '5465448892', 'emineosmnpzr@hotmail.com', 'SATIŞ-DOKU', 'SATIŞ GÖREVLİSİ', '2018-10-06', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 03:56:55', '2023-02-16 03:56:55'),
(104, 'ENES ENSAR KELEŞOĞLU', '1993-07-04', '5465784094', 'enesensar.keleşoğlu@hotelistan.com', 'OPERASYON', 'OPERASYON ELEMANI', '2019-07-08', 'ÖNLİSANS', 'ZİRAAT BANKASI', 'TR050001000318586410315001', '0', NULL, 9, NULL, '2023-02-16 04:00:31', '2023-02-16 04:00:31'),
(105, 'ESRA ÇOBAN', '1987-03-23', '5339623338', 'esra.çoban@hotelistan', 'OPERASYON', 'TERCÜMAN', '2022-02-12', 'ÖNLİSANS', 'GARANTİ', 'TR520006200035700006623682', '0', NULL, 9, NULL, '2023-02-16 04:05:21', '2023-02-16 04:05:21'),
(106, 'ERHAN KALYONCU', '2000-09-08', '5452886287', 'erhankalyoncu@outlook.com', 'OPERASYON-SERKAN AYGIN', 'TERCÜMAN', '2022-06-17', 'LİSANS', 'GARANTİ', 'TR030006200076900006887702', '0', NULL, 9, NULL, '2023-02-16 04:09:00', '2023-02-16 04:09:00'),
(107, 'EMRE GÖKMEN', '1994-06-03', '5334077618', 'egokmen0306@gmail.com', 'PERFORMANCE MARKETİNG', 'REKLAMCI', '2023-01-02', 'ÖNLİSANS', 'AKBANK', 'TR520004600133888000239225', '0', NULL, 9, NULL, '2023-02-16 07:52:59', '2023-02-16 07:52:59'),
(108, 'EMİNE KÜBRA SAĞIZLI', '1996-03-30', '5533544474', 'kubra.sagızlı@hotelistan.com', 'SATIN ALMA', 'SATINA ALMA UZMANI', '2023-01-04', 'LİSANS', 'AKBANK', 'TR190004600133888000237200', '0', NULL, 9, NULL, '2023-02-16 08:00:48', '2023-02-16 08:00:48'),
(109, 'ELENORA LUPANO', '1987-09-21', '0000000000', 'elenora.lupano@gmail.com', 'MİSAFİR İLİŞKİLERİ', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ', '2022-08-10', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 08:12:44', '2023-02-16 08:12:44'),
(110, 'ESRA NUR ÜNSAL', '1999-01-03', '5417189413', 'esranur.unsal@hotelistan.com', 'İNSAN KAYNAKLARI', 'İŞE ALIM PERSONELİ', '2022-11-24', 'LİSANS', 'AKBANK', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 08:27:35', '2023-02-16 08:27:35'),
(111, 'EDANUR ERDEMİR', '2000-06-23', '5454565582', 'edaerdemirxx@gmail.com', 'OPERASYON', 'TERCÜMAN', '2022-11-01', 'LİSANS', 'AKBANK', 'TR590004600133888000234346', '0', NULL, 9, NULL, '2023-02-16 08:56:38', '2023-02-16 08:56:38'),
(112, 'EREL PEZÜK', '2022-11-01', '5362713673', 'erel.pezük@hotelistan.com', 'PERFORMANCE MARKETİNG', 'REKLAMCI', '1990-06-10', 'LİSANS', 'AKBANK', 'TR850004600133888000233878', '0', NULL, 9, NULL, '2023-02-16 09:01:38', '2023-02-16 09:01:38'),
(113, 'ERDİM BARBAROS', '1995-05-22', '5308315415', 'erdim.barbaros@hotmail.com', 'SATIŞ', 'SATIŞ GÖREVLİSİ', '2022-10-03', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 09:40:00', '2023-02-16 09:40:00'),
(114, 'EMEL YAĞAN', '2001-01-15', '5469022677', 'emel.yagan19@gmail.com', 'İNSAN KAYNAKLARI', 'İSNAN KAYNAKLARI ELEMANI', '2022-10-10', 'ÖNLİSANS', 'GARANTİ', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 09:43:21', '2023-02-16 09:43:21'),
(115, 'ENES DEMİR', '2002-01-07', '5364507222', 'enes.demir@hotelistan.com', 'IT/YAZILIM', 'YAZILIM TAKIM LİDERİ', '2022-08-16', 'LİSE', 'AKBANK', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 09:47:26', '2023-02-16 09:47:26'),
(116, 'CANBERK TOKMAK', '1996-08-12', '5354089965', 'canberkk@hotmail.com', 'SATIŞ', 'SATIŞ GÖREVLİSİ', '2023-02-01', 'LİSE', 'AKBANK', 'TR470004600133888000238636', '0', NULL, 9, NULL, '2023-02-16 11:22:13', '2023-02-16 11:22:13'),
(117, 'ÇİĞDEM USEN', '1984-08-21', '5331670205', 'çigdem.usen@hotelistan.com', 'OPERASYON-DOKU', 'TERCÜMAN', '2021-01-25', 'LİSE', 'GARANTİ', 'TR250006200035700006644344', '0', 'DOKU', 9, NULL, '2023-02-16 11:29:03', '2023-02-16 11:29:29'),
(118, 'FATMA KARAKÖY', '2000-05-30', '5529417773', 'fatmazeybek16@icloud.com', 'OPERASYON', 'OPERASYON ELEMANI', '2023-01-16', 'LİSANS', 'AKBANK', 'TR91 0004 6001 3388 8000 2379 41', '0', NULL, 9, NULL, '2023-02-16 11:52:09', '2023-02-16 11:52:09'),
(119, 'fATIMA-EZZEHRA AMZINE', '1996-02-17', '5375700851', 'fatima.ezzehra@hotelistan.com', 'OPERASYON-DOKU', 'TERCÜMAN', '2021-02-11', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 11:56:00', '2023-02-16 11:56:00'),
(120, 'FALAK SHER', '1989-11-01', '5524817278', 'falak.sher@hotelistan.com', 'OPERASYON', 'TERCÜMAN', '2022-06-08', 'YÜKSEK LİSANS', 'ALBARAKA', 'TR31002030000875995301', '0', NULL, 9, NULL, '2023-02-16 12:00:01', '2023-02-16 12:00:01'),
(121, 'FARSHAD NABIZADE', '1993-01-24', '5438991063', 'farsha.nabızade@hotelistan.com', 'YAZILIM', 'YAZILIM GELİŞTİRİCİSİ', '2022-11-28', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 12:03:42', '2023-02-16 12:03:42'),
(122, 'FABIO BALADEZ', '1978-10-23', '5070931230', 'fabiobaladez@gmail.com', 'SATIŞ', 'SATIŞ GÖREVLİSİ', '2022-09-08', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 12:17:19', '2023-02-16 12:17:19'),
(123, 'FERİTCAN ERTAN', '2000-07-05', '5356324303', 'feritcan@gmail.com', 'OPERASYON', 'TERCÜMAN', '2022-03-26', 'LİSE', 'GARANTİ', 'TR760006200070100006882557', '0', NULL, 9, NULL, '2023-02-16 12:20:30', '2023-02-16 12:20:30'),
(124, 'FIRAT PETEK', '1991-03-16', '5519079697', 'firat.petek22@gmail.com', 'SATIN ALMA', 'SATIN ALMA UZMANI', '2022-05-16', 'LİSANS', 'GARANTİ', 'TR470006200015200006882720', '0', NULL, 9, NULL, '2023-02-16 12:24:11', '2023-02-16 12:24:11'),
(125, 'FIRAT TÜRKOĞLU', '2022-10-12', '5333818862', 'fırat.turkoglu@hotelistan.com', 'PAZARLAMA', 'PAZARLAMA MÜDÜRÜ', '2022-05-09', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-16 12:29:03', '2023-02-16 12:29:03'),
(126, 'TAMER BELER', '1977-09-01', '5321136296', 'tamer.beler@hotelistan.com', 'PAZARLAMA', 'PAZARLAMA MÜDÜRÜ', '2022-12-17', 'LİSANS', 'GARANTİ', 'TR970006200006800006651477', '0', NULL, 9, NULL, '2023-02-22 04:53:30', '2023-02-22 04:53:30'),
(127, 'TAMER OLABİ', '1994-03-20', '5382571058', 'tamer.olabi@hotelistan.com', 'SATIŞ', 'SEYEHAT ACENTASI SATIŞ GÖREVLİSİ', '2021-11-08', 'LİSE', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 04:22:22', '2023-02-27 04:22:22'),
(128, 'TUĞÇE UZUN', '1988-08-27', '5345974784', 'tuğçe.uzun@hotelistan.com', 'OPERASYON-SERKAN AYGIN', 'TERCÜMAN', '2018-02-27', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', 'SERKAN AYGIN', 9, NULL, '2023-02-27 04:26:24', '2023-02-27 04:26:55'),
(129, 'TUĞBA ŞAHİN', '1984-08-23', '5346837767', 'tugba.sahin@hotelistan.com', 'OPERASYON', 'SOSYAL MEDYA UZMANI', '2022-10-05', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 05:17:34', '2023-02-27 05:17:34'),
(130, 'TOLUNAY', '1996-11-16', '5469022670', 'tolunay.nısancı@hotelistan.com', 'NİŞANCI', 'SATIŞ SUPERVIZOR', '2022-08-01', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 05:26:51', '2023-02-27 05:26:51'),
(131, 'TACDİN KORKMAZ', '1999-05-02', '5433653564', 'tacdın.korkmaz@hotelistan.com', 'İÇ DENETİM', 'İÇ DENETİM UZMAN YARDIMCISI', '2022-09-27', 'LİSANS', 'GARANTİ', 'TR770006200006800006884346', '0', NULL, 9, NULL, '2023-02-27 05:31:30', '2023-02-27 05:31:30'),
(132, 'TAŞKIN TAŞSIN', '1993-08-05', '5428263654', 'taskın.tassın@hotelistan.com', 'OPERASYON-SERKAN AYGIN', 'TERCÜMAN', '2020-11-27', 'ÖNLİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 05:34:33', '2023-02-27 05:34:33'),
(133, 'HATİCE TUĞÇE ÖZER BAŞYURT', '1995-05-05', '5399386463', 'tugcehaticeozer@gmail.com', 'OPERASYON', 'DİYETİSYEN', '2022-02-08', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 05:37:43', '2023-02-27 05:37:43'),
(134, 'UMİT OKAN ATAKAN', '1980-02-07', '0000000000', 'umıt.atakan@hotelistan.com', 'OPERASYON', 'OPERASYON ELEMANI', '2016-02-29', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 05:50:11', '2023-02-27 05:50:11'),
(135, 'HANI GHANEM YAKO', '1997-01-01', '5433297123', 'hanı.yako@hotelistan.com', 'OPERASYON', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ', '2020-12-05', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-27 06:18:42', '2023-02-27 06:18:42'),
(136, 'İSMAİL UÇAR ÖZDEMİR', '1994-02-28', '5321671710', 'iucarozdemır@gmail.com', 'SATIŞ', 'SATIŞ SUPERVIZÖR', '2021-12-20', 'LİSANS', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-28 05:47:27', '2023-02-28 05:47:27'),
(137, 'IŞIK ARDA YARDIMSEVER', '1999-09-27', '5546539741', 'arda.yardımsever@hotelistan.com', 'İÇERİK', 'METİN YAZARI', '2023-01-23', 'LİSANS', 'AKBANK', 'TR030004600133888000238167', '0', NULL, 9, NULL, '2023-02-28 05:51:00', '2023-02-28 05:51:00'),
(138, 'HUSSAM ASAD ALI', '1968-07-15', '5385803532', 'husam.asad@hotelistan.com', 'OPERASYON', 'TERCÜMAN-ARAPÇA', '2020-02-03', 'BİLİNMİYOR', 'GARANTİ', 'TR210006200035700006644028', '0', NULL, 9, NULL, '2023-02-28 06:25:39', '2023-02-28 06:25:39'),
(139, 'HAKI SHEU', '1978-04-17', '5467768717', 'hakı.sheu@hotelistan.com', 'OPERASYON', 'MİSAFİR İLİŞKİLERİ GÖREVLİSİ', '2021-09-09', 'BİLİNMİYOR', 'BİLİNMİYOR', '0000000000000000000000', '0', NULL, 9, NULL, '2023-02-28 06:29:11', '2023-02-28 06:29:11');

-- --------------------------------------------------------

--
-- Structure de la table `personnel_files`
--

CREATE TABLE `personnel_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personnel_card_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnel_photos`
--

CREATE TABLE `personnel_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personnel_card_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `purchasing_files`
--

CREATE TABLE `purchasing_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchasing_request_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchasing_files`
--

INSERT INTO `purchasing_files` (`id`, `name`, `path`, `purchasing_request_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'mbt20006-0341', 'mbt20006-0341.pdf', 1, 3, NULL, '2023-06-01 08:39:31', '2023-06-01 08:39:31');

-- --------------------------------------------------------

--
-- Structure de la table `purchasing_offers`
--

CREATE TABLE `purchasing_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchasing_id` int(10) UNSIGNED DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `assisgned_user_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `purchasing_requests`
--

CREATE TABLE `purchasing_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchasing_request_status_id` int(10) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchasing_requests`
--

INSERT INTO `purchasing_requests` (`id`, `product_title`, `product_url`, `purchasing_request_status_id`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'https://hepsiburada.com', 1, NULL, 3, NULL, '2023-02-01 09:37:46', '2023-02-01 09:37:46'),
(2, 'tst', 'https://hepsiburada.com', 1, 'test', 3, NULL, '2023-06-01 04:51:05', '2023-06-01 04:51:05'),
(5, 'test', 'https://localhost', 1, 'this is describtion', 3, NULL, '2023-06-01 08:17:11', '2023-06-01 08:17:11'),
(6, 'test', 'https://localhost', 1, 'this is describtion', 3, NULL, '2023-06-01 08:32:39', '2023-06-01 08:32:39'),
(7, 'test', 'https://localhost', 1, 'this is describtion', 3, NULL, '2023-06-01 08:33:38', '2023-06-01 08:33:38'),
(8, 'test', 'https://localhost', 1, 'this is describtion', 3, NULL, '2023-06-01 08:34:07', '2023-06-01 08:34:07'),
(9, 'test', 'https://localhost', 1, 'this is describtion', 3, NULL, '2023-06-01 08:39:31', '2023-06-01 08:39:31');

-- --------------------------------------------------------

--
-- Structure de la table `purchasing_requests_statuses`
--

CREATE TABLE `purchasing_requests_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchasing_requests_statuses`
--

INSERT INTO `purchasing_requests_statuses` (`id`, `name`, `color`, `note`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cevaplanmadı', '#F64E60', NULL, 3, NULL, '2022-07-19 04:15:00', '2022-11-24 02:00:39'),
(2, 'Tamamlandı', '#1BC5BD', NULL, 1, NULL, '2022-08-23 01:32:17', '2022-11-24 01:00:37'),
(3, 'Sonra Tamamlanacak', '#0043FFFF', NULL, 1, NULL, '2022-08-23 01:32:23', '2022-08-23 01:32:23'),
(4, 'Onaya Gönderildi', '#FF7B00FF', NULL, 1, NULL, '2022-08-23 02:27:26', '2022-08-23 02:34:57');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, NULL),
(2, 'Ceo', 'web', NULL, NULL),
(3, 'Finance Admin', 'web', NULL, NULL),
(4, 'Finance Person', 'web', NULL, NULL),
(5, 'Human Resources Admin', 'web', NULL, NULL),
(6, 'Human Resources Person', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(56, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(89, 3),
(90, 3),
(92, 3),
(93, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(56, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4),
(73, 4),
(96, 4),
(97, 4),
(98, 4),
(99, 4),
(104, 4),
(105, 4),
(106, 4),
(107, 4),
(120, 4),
(121, 4),
(122, 4),
(123, 4),
(124, 4),
(125, 4),
(126, 4),
(127, 4),
(59, 5),
(60, 5),
(61, 5),
(62, 5),
(63, 5),
(64, 5),
(74, 5),
(75, 5),
(76, 5),
(77, 5),
(78, 5),
(79, 5),
(80, 5),
(81, 5),
(82, 5),
(83, 5),
(84, 5),
(85, 5),
(86, 5),
(87, 5),
(88, 5),
(112, 5),
(113, 5),
(114, 5),
(115, 5),
(59, 6),
(60, 6),
(61, 6),
(62, 6),
(63, 6),
(64, 6);

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trial_period`
--

CREATE TABLE `trial_period` (
  `id` int(10) UNSIGNED NOT NULL,
  `personnel_card_id` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `last_seen`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adnane SOUGMI', 'adnane.sougmi@hotelistan.com', NULL, '$2y$10$8mi1tPZA/P.6K0yHRoIqQOKVlIwm0NKXdF5lcYINsxBIBraaXiIPq', '2023-05-30 12:09:12', 'XM7arx6vwqmjiyqNYwb47zmnIlQ3yWiyIfHBXj24ctiK9rp7it8vjjhzbylp', '2022-10-31 15:09:31', '2023-05-31 06:40:45'),
(2, 'Rıdvan Demiroğlu', 'ridvan.demiroglu@hotelistan.com', NULL, '$2y$10$396cOFcCvK2efuYkciXQxOwcv/Zeo.voNfdi7wEevBKemC2t.xECa', '2023-02-02 07:52:26', 'cGsopRST9Nl4uzAomTjSMgzkRPto2SjY2WWl35VtEIXwUi479Wm7bdP0djKk', '2022-08-22 16:36:23', '2023-02-02 07:52:26'),
(3, 'Enes Demir', 'enes.demir@hotelistan.com', NULL, '$2y$10$cGSfOR7dm6i6QbdpMJ9Zuutw.gnmu9vcmIfEC.lWh29P9dVPs4Oe.', '2023-07-12 11:02:51', 'sEb1jN6LM1bOGina6xoQD4Ul1JqQnVMeoRxmQNY6zQDtrL65e5yjNmii6q6z', '2022-10-31 15:09:31', '2023-07-12 11:02:51'),
(7, 'İbrahim İleru', 'ibrahim.i@hotelistan.com', NULL, '$2y$10$VhTP3PNQCgUSJKhE1OrDo.BPDgY6FrQzQ6MAR2ph.Z9JxwazKCD4W', NULL, NULL, '2022-12-18 23:25:07', '2022-12-18 23:25:07'),
(8, 'Buse Ayrancı', 'buse.ayranci@hotelistan.com', NULL, '$2y$10$e4oeGG.RQVowkt7WU3LTAevCg2oopZy6.Qd1YVa3rxa4vQsojTIcu', '2023-01-30 09:47:19', 'icuqeRJEvEzy44MQjkpeziQQIZx4laRU4JvcYBZa3LYb91rx2m8ZQ29laaRG', '2022-12-18 23:25:22', '2023-02-02 07:45:33'),
(9, 'Burcu Bozkurt', 'burcu.bozkurt@hotelistan.com', NULL, '$2y$10$Li8Tri3SqfQfg1nV5T1tT.qhLTyotN3C2iNkxA8UQgeGMK4YVxE5S', '2023-02-28 06:29:16', 'haG6BZOrTpsOnMU515KhpWKHeGmvmFU2orSK8yEmSIgrBh5QdC5CZwq7JgX1', '2022-12-26 11:37:15', '2023-02-28 06:29:16'),
(10, 'Ömer Gündoğdu', 'omer.gundogdu@hotelistan.com', NULL, '$2y$10$wBkjSA4VZVbU2x4BU0gAJujobUkSGLeH3YUhjGVZJuBQdRgsi5Hm2', '2023-01-26 03:29:50', 'XPq3QAk9OaRZpZoLtt9icYJKTUJQtgiKLckelkyoi7zEaQX7ejitWbSjv2Od', '2023-01-09 11:58:02', '2023-01-26 03:29:50'),
(11, 'Murat Yücel', 'murat.yucel@hotelistan.com', NULL, '$2y$10$f1WBE0og6mDaoP7t61cM/.vo3ZDfsSxynR1mWBm3HyIO26ijllu3C', '2023-05-02 05:35:43', 'J38Epmh3dWVdDuaaKw9SOzBS35d8RxGtW1ZbnGOU49FlNmnZfrp4FtBdSWeq', '2023-05-02 05:30:04', '2023-05-02 05:35:43'),
(12, 'Serkan Ağca', 'serkan.agca@hotelistan.com', NULL, '$2y$10$Cf.NcaM05g0uZrok/zorTe7PGWSIA9U2HfYAawB0oYhQ5Kzw7V7BW', NULL, NULL, '2023-05-30 10:55:16', '2023-05-30 10:55:16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annual_leaves_personnel_id_foreign` (`personnel_id`),
  ADD KEY `annual_leaves_annual_leave_type_id_foreign` (`annual_leave_type_id`);

--
-- Index pour la table `annual_leave_reports`
--
ALTER TABLE `annual_leave_reports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `annual_leave_types`
--
ALTER TABLE `annual_leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_company_id_foreign` (`company_id`);

--
-- Index pour la table `check_registration`
--
ALTER TABLE `check_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `check_registration_personnel_card_id_foreign` (`personnel_card_id`);

--
-- Index pour la table `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cheques_company_id_foreign` (`company_id`),
  ADD KEY `cheques_cheques_statuses_id_foreign` (`cheques_statuses_id`);

--
-- Index pour la table `cheques_statuses`
--
ALTER TABLE `cheques_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `company_types`
--
ALTER TABLE `company_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_company_id_foreign` (`company_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `liability`
--
ALTER TABLE `liability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liability_personnel_card_id_foreign` (`personnel_card_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Index pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_requests_payment_request_status_id_foreign` (`payment_request_status_id`),
  ADD KEY `payment_requests_payment_request_category_id_foreign` (`payment_request_category_id`),
  ADD KEY `payment_requests_pay_company_id_foreign` (`pay_company_id`),
  ADD KEY `payment_requests_paid_company_id_foreign` (`paid_company_id`),
  ADD KEY `payment_requests_payment_type_id_foreign` (`payment_type_id`);

--
-- Index pour la table `payment_requests_categories`
--
ALTER TABLE `payment_requests_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment_requests_files`
--
ALTER TABLE `payment_requests_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_requests_files_payment_request_id_foreign` (`payment_request_id`);

--
-- Index pour la table `payment_requests_statuses`
--
ALTER TABLE `payment_requests_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `personnel_cards`
--
ALTER TABLE `personnel_cards`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personnel_files`
--
ALTER TABLE `personnel_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personnel_files_personnel_card_id_foreign` (`personnel_card_id`);

--
-- Index pour la table `personnel_photos`
--
ALTER TABLE `personnel_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personnel_photos_personnel_card_id_foreign` (`personnel_card_id`);

--
-- Index pour la table `purchasing_files`
--
ALTER TABLE `purchasing_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchasing_files_purchasing_request_id_foreign` (`purchasing_request_id`);

--
-- Index pour la table `purchasing_offers`
--
ALTER TABLE `purchasing_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchasing_offers_purchasing_id_foreign` (`purchasing_id`);

--
-- Index pour la table `purchasing_requests`
--
ALTER TABLE `purchasing_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchasing_requests_purchasing_request_status_id_foreign` (`purchasing_request_status_id`);

--
-- Index pour la table `purchasing_requests_statuses`
--
ALTER TABLE `purchasing_requests_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Index pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trial_period`
--
ALTER TABLE `trial_period`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trial_period_personnel_card_id_foreign` (`personnel_card_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `annual_leave_reports`
--
ALTER TABLE `annual_leave_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `annual_leave_types`
--
ALTER TABLE `annual_leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `check_registration`
--
ALTER TABLE `check_registration`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cheques`
--
ALTER TABLE `cheques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `cheques_statuses`
--
ALTER TABLE `cheques_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT pour la table `company_types`
--
ALTER TABLE `company_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `credit_cards`
--
ALTER TABLE `credit_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `liability`
--
ALTER TABLE `liability`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=943;

--
-- AUTO_INCREMENT pour la table `payment_requests_categories`
--
ALTER TABLE `payment_requests_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `payment_requests_files`
--
ALTER TABLE `payment_requests_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `payment_requests_statuses`
--
ALTER TABLE `payment_requests_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT pour la table `personnel_cards`
--
ALTER TABLE `personnel_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT pour la table `personnel_files`
--
ALTER TABLE `personnel_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnel_photos`
--
ALTER TABLE `personnel_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `purchasing_files`
--
ALTER TABLE `purchasing_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `purchasing_offers`
--
ALTER TABLE `purchasing_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `purchasing_requests`
--
ALTER TABLE `purchasing_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `purchasing_requests_statuses`
--
ALTER TABLE `purchasing_requests_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trial_period`
--
ALTER TABLE `trial_period`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  ADD CONSTRAINT `annual_leaves_annual_leave_type_id_foreign` FOREIGN KEY (`annual_leave_type_id`) REFERENCES `annual_leave_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `annual_leaves_personnel_id_foreign` FOREIGN KEY (`personnel_id`) REFERENCES `personnel_cards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `check_registration`
--
ALTER TABLE `check_registration`
  ADD CONSTRAINT `check_registration_personnel_card_id_foreign` FOREIGN KEY (`personnel_card_id`) REFERENCES `personnel_cards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `cheques_cheques_statuses_id_foreign` FOREIGN KEY (`cheques_statuses_id`) REFERENCES `cheques_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cheques_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `liability`
--
ALTER TABLE `liability`
  ADD CONSTRAINT `liability_personnel_card_id_foreign` FOREIGN KEY (`personnel_card_id`) REFERENCES `personnel_cards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD CONSTRAINT `payment_requests_paid_company_id_foreign` FOREIGN KEY (`paid_company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_requests_pay_company_id_foreign` FOREIGN KEY (`pay_company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_requests_payment_request_category_id_foreign` FOREIGN KEY (`payment_request_category_id`) REFERENCES `payment_requests_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_requests_payment_request_status_id_foreign` FOREIGN KEY (`payment_request_status_id`) REFERENCES `payment_requests_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_requests_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `payment_requests_files`
--
ALTER TABLE `payment_requests_files`
  ADD CONSTRAINT `payment_requests_files_payment_request_id_foreign` FOREIGN KEY (`payment_request_id`) REFERENCES `payment_requests` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `personnel_files`
--
ALTER TABLE `personnel_files`
  ADD CONSTRAINT `personnel_files_personnel_card_id_foreign` FOREIGN KEY (`personnel_card_id`) REFERENCES `personnel_cards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `personnel_photos`
--
ALTER TABLE `personnel_photos`
  ADD CONSTRAINT `personnel_photos_personnel_card_id_foreign` FOREIGN KEY (`personnel_card_id`) REFERENCES `personnel_cards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchasing_files`
--
ALTER TABLE `purchasing_files`
  ADD CONSTRAINT `purchasing_files_purchasing_request_id_foreign` FOREIGN KEY (`purchasing_request_id`) REFERENCES `purchasing_requests` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchasing_offers`
--
ALTER TABLE `purchasing_offers`
  ADD CONSTRAINT `purchasing_offers_purchasing_id_foreign` FOREIGN KEY (`purchasing_id`) REFERENCES `purchasing_requests` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchasing_requests`
--
ALTER TABLE `purchasing_requests`
  ADD CONSTRAINT `purchasing_requests_purchasing_request_status_id_foreign` FOREIGN KEY (`purchasing_request_status_id`) REFERENCES `purchasing_requests_statuses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `trial_period`
--
ALTER TABLE `trial_period`
  ADD CONSTRAINT `trial_period_personnel_card_id_foreign` FOREIGN KEY (`personnel_card_id`) REFERENCES `personnel_cards` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2020 at 06:49 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_trans`
--

CREATE TABLE `detail_trans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_trans` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_jenis` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `qty` double NOT NULL,
  `subtotal` int(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `detail_trans`
--

INSERT INTO `detail_trans` (`id`, `id_trans`, `id_jenis`, `qty`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, '1', '2', 3, 12000, '2020-02-21 00:42:33', '2020-02-25 22:18:05'),
(2, '1', '4', 1.5, 4500, '2020-02-24 23:18:02', '2020-02-24 23:18:02'),
(3, '1', '4', 2, 6000, '2020-02-24 23:18:35', '2020-02-24 23:18:35'),
(4, '2', '1', 1, 3000, '2020-02-24 23:27:59', '2020-02-24 23:27:59'),
(5, '2', '2', 2, 8000, '2020-02-24 23:28:11', '2020-02-24 23:28:11'),
(6, '2', '4', 3, 9000, '2020-02-24 23:28:22', '2020-02-24 23:28:22'),
(7, '4', '1', 4, 12000, '2020-02-26 00:01:39', '2020-02-26 00:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuci`
--

CREATE TABLE `jenis_cuci` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jenis` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `harga_per_kilo` int(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jenis_cuci`
--

INSERT INTO `jenis_cuci` (`id`, `nama_jenis`, `harga_per_kilo`, `created_at`, `updated_at`) VALUES
(1, 'Cuci Kering', 3000, '2020-02-16 23:42:25', '2020-02-16 23:42:25'),
(2, 'Cuci Kering Setrika', 4000, '2020-02-16 23:42:52', '2020-02-16 23:42:52'),
(4, 'Setrika', 3000, '2020-02-16 23:43:09', '2020-02-16 23:43:09'),
(5, 'Bedcover', 15000, '2020-02-16 23:43:27', '2020-02-16 23:43:27'),
(8, 'Baru', 666, '2020-03-23 00:48:26', '2020-03-23 00:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_02_14_073840_create_petugas_table', 1),
(4, '2020_02_14_074608_create_jenis_cuci_table', 1),
(5, '2020_02_14_074905_create_pelanggan_table', 1),
(6, '2020_02_14_075038_create_transaksi_table', 1),
(7, '2020_02_14_075310_create_detail_trans_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES
(1, 'Pelanggan 1', 'Jl Danau Ranau', '081358845507', '2020-02-16 20:45:08', '2020-02-16 20:45:08'),
(2, 'Pelanggan 2', 'Jl Danau Ranau 2', '081358123456', '2020-02-16 20:45:36', '2020-02-16 20:45:36'),
(3, 'Sudah diganti', 'Jl Baru', '0897665', '2020-02-16 20:45:56', '2020-02-25 23:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_petugas` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `nama_petugas`, `telp`, `username`, `password`, `level`, `created_at`, `updated_at`) VALUES
(1, 'heni', '081938312866', 'heniyunar', '$2y$10$fIqzkAHu4rEjLIfjmMxdX.uJ1LYTwdhWAJN34/N2FhGwFS1f4EbL2', 'admin', '2020-02-16 20:21:05', '2020-02-16 20:21:05'),
(2, 'Laras', '08987654321', 'larasati', '$2y$10$ONbmVPngqkVmb3UwX1yl0.8AeISqbOIBGyfmlcq5CJscPkn9HML4m', 'petugas', '2020-02-17 00:01:00', '2020-02-17 00:01:00'),
(5, 'viola', '081338978460', 'viola', 'momopapus', 'admin', '2020-02-25 23:51:46', '2020-03-23 00:24:17'),
(6, 'Vio baru', '098765432', 'angrybirds', '$2y$10$b6onUhPVLssmrNvFib9auOnNfJ3ZBDMh.Bj8EolclrDP/lv/6eYx.', 'admin', '2020-03-23 00:29:09', '2020-03-23 00:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pelanggan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_petugas` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pelanggan`, `id_petugas`, `tgl_transaksi`, `tgl_selesai`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '2020-02-17', '2020-02-20', '2020-02-17 00:58:31', '2020-02-17 00:58:31'),
(2, '2', '1', '2020-02-05', '2020-02-07', '2020-02-17 01:03:49', '2020-02-17 01:03:49'),
(4, '1', '1', '2020-02-26', '2020-02-29', '2020-02-26 00:00:01', '2020-02-26 00:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_trans`
--
ALTER TABLE `detail_trans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
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
-- AUTO_INCREMENT for table `detail_trans`
--
ALTER TABLE `detail_trans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 30. 22:15
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `motorcyclerental`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jobStatus` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `device_switches`
--

CREATE TABLE `device_switches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tools_id` bigint(20) UNSIGNED NOT NULL,
  `loans_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rentalDate` date NOT NULL,
  `returnDate` date NOT NULL,
  `gaveDown` tinyint(1) NOT NULL DEFAULT 0,
  `orders_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `motorcycles_id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `command` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '2025_01_31_191638_create_motorcycles_table', 1),
(4, '2025_01_31_191730_create_tools_table', 1),
(5, '2025_01_31_191757_create_device_switches_table', 1),
(6, '2025_01_31_191810_create_loans_table', 1),
(7, '2025_01_31_191826_add_forign_key_to_device_switch_table', 1),
(8, '2025_01_31_191835_add_forign_key_to_loads_table', 1),
(9, '2025_01_31_193230_create_admins_table', 1),
(10, '2025_01_31_193319_create_logs_table', 1),
(11, '2025_01_31_193400_add_forign_key_to_logs_table', 1),
(12, '2025_02_12_130203_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `motorcycles`
--

CREATE TABLE `motorcycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(20) NOT NULL,
  `type` varchar(100) NOT NULL,
  `licencePlate` varchar(7) NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `gearbox` varchar(25) NOT NULL,
  `fuel` varchar(1) NOT NULL,
  `powerLe` double NOT NULL,
  `powerkW` double NOT NULL,
  `engineSize` double NOT NULL,
  `drivingLicence` varchar(4) NOT NULL,
  `places` tinyint(3) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `deposit` int(10) UNSIGNED NOT NULL,
  `trafficDate` date NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'placeholder.png',
  `isInService` tinyint(1) NOT NULL DEFAULT 0,
  `problamComment` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `motorcycles`
--

INSERT INTO `motorcycles` (`id`, `brand`, `type`, `licencePlate`, `year`, `gearbox`, `fuel`, `powerLe`, `powerkW`, `engineSize`, `drivingLicence`, `places`, `price`, `deposit`, `trafficDate`, `location`, `image`, `isInService`, `problamComment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aprilia', 'Caponord 1200', 'VPM-327', 2015, 'Manualis (6 fokozatu)', 'B', 125, 91.2, 1197, 'A2', 2, 32767, 145800, '2028-03-15', '1044 Budapest, Megyeri út 20.', 'Caponord1200.jpg', 0, NULL, NULL, NULL, NULL),
(2, 'Aprilia', 'Mana 850', 'KYQ-873', 2012, 'Automata', 'B', 75.1, 54.8, 839.3, 'A2', 2, 20700, 62100, '2025-07-20', '1096 Budapest, Haller utca 89.', 'Mana850.jpg', 0, NULL, NULL, NULL, NULL),
(3, 'Aprilia', 'RS 125', 'GZR-419', 2006, 'Manuális (6 fokozatu)', 'B', 28.2, 20.6, 124.8, 'A2', 2, 32767, 99300, '2026-11-08', '1126 Budapest, Böszörményi út 38.', 'RS125.jpg', 0, NULL, NULL, NULL, NULL),
(4, 'Aprilia', 'RSV4 Factory', 'PNB-672', 2010, 'Manualis (6 fokozatu)', 'B', 177.6, 129.6, 999.6, 'A2', 2, 32767, 133200, '2027-04-01', '1126 Budapest, Böszörményi út 38.', 'RSV4Factory.jpg', 0, NULL, NULL, NULL, NULL),
(5, 'Aprilia', 'SR 160', 'ZFB-830', 2021, 'Automata', 'B', 10.8, 7.9, 160, 'A2', 2, 24800, 74400, '2028-12-18', '1103 Budapest, Gyömrői út 50.', 'SR160.jpg', 0, NULL, NULL, NULL, NULL),
(6, 'Aprilia', 'Tuono 125', 'WLS-456', 2017, 'Manualis (6 fokozatu)', 'B', 15, 10.9, 124.8, 'A2', 2, 31100, 93300, '2029-09-30', '1195 Budapest, Ady Endre út 134.', 'Tuono125.jpg', 0, NULL, NULL, NULL, NULL),
(7, 'Aprilia', 'Tuono 660', 'TXN-258', 2023, 'Manualis (6 fokozatu)', 'B', 95, 69.3, 660, 'A2', 2, 32767, 147900, '2028-05-22', '1161 Budapest, Rákosi út 88.', 'Tuono660.jpg', 0, NULL, NULL, NULL, NULL),
(8, 'BMW', 'C 400 GT', 'VUK-739', 2020, 'Automata', 'B', 34, 24.8, 350, 'A2', 2, 32767, 99300, '2025-10-10', '1096 Budapest, Haller utca 89.', 'C400GT.jpg', 0, NULL, NULL, NULL, NULL),
(9, 'BMW', 'C Evolution', 'QRG-590', 2020, 'Automata', 'E', 48, 35, 450, 'A2', 2, 32767, 101700, '2026-02-28', '1211 Budapest, Szállító utca 6.', 'CEvolution.jpg', 0, NULL, NULL, NULL, NULL),
(10, 'BMW', 'Concept 101', 'DJB-831', 2022, 'Manualis (6 fokozatu)', 'B', 158.2, 115.5, 1649, 'A2', 2, 32767, 145200, '2027-08-14', '1064 Budapest, Podmaniczky utca 63.', 'Concept101.jpg', 0, NULL, NULL, NULL, NULL),
(11, 'BMW', 'F 800 ST', 'MRN-472', 2010, 'Manualis (6 fokozatu)', 'B', 83.8, 61.2, 798, 'A2', 2, 28400, 85200, '2028-01-09', '1148 Budapest, Fogarasi út 45.', 'F800ST.jpg', 0, NULL, NULL, NULL, NULL),
(12, 'BMW', 'G 310 R', 'HXB-594', 2019, 'Manualis (6 fokozatu)', 'B', 34, 24.8, 313, 'A2', 2, 32767, 126300, '2029-05-19', '1151 Budapest, Károlyi Sándor út 76.', 'G310R.jpg', 0, NULL, NULL, NULL, NULL),
(13, 'BMW', 'K 100 RS', 'FRY-293', 1991, 'Manualis (5 fokozatu)', 'B', 100, 73, 987, 'A2', 2, 15700, 47100, '2025-02-11', '1185 Budapest, Üllői út 780.', 'K100RS.jpg', 0, NULL, NULL, NULL, NULL),
(14, 'BMW', 'K 1200 RS', 'LSA-815', 2000, 'Manualis (6 fokozatu)', 'B', 130, 94.9, 1171, 'A2', 2, 32767, 114600, '2025-12-27', '1173 Budapest, Pesti út 237.', 'K1200RS.jpg', 0, NULL, NULL, NULL, NULL),
(15, 'BMW', 'M 1000 RR', 'RZX-476', 2022, 'Manualis (6 fokozatu)', 'B', 205, 149.6, 999, 'A2', 2, 31400, 94200, '2026-04-16', '1044 Budapest, Megyeri út 20.', 'M1000RR.jpg', 0, NULL, NULL, NULL, NULL),
(16, 'BMW', 'R 100 RS', 'NQF-580', 1982, 'Manualis (5 fokozatu)', 'B', 70, 51.1, 979, 'A2', 2, 32767, 112200, '2027-11-25', '1205 Budapest, Kossuth Lajos utca 120.', 'R100RS.jpg', 0, NULL, NULL, NULL, NULL),
(17, 'BMW', 'R 1100 RS', 'TGM-634', 2001, 'Manualis (5 fokozatu)', 'B', 90, 65.7, 1085, 'A2', 2, 23100, 69300, '2028-06-02', '1205 Budapest, Kossuth Lajos utca 120.', 'R1100RS.jpg', 0, NULL, NULL, NULL, NULL),
(18, 'BMW', 'S 1000 R', 'PKC-981', 2016, 'Manualis (6 fokozatu)', 'B', 160, 116.8, 999, 'A2', 2, 20800, 62400, '2029-03-21', '1037 Budapest, Bojtár utca 43.', 'S1000R.jpg', 0, NULL, NULL, NULL, NULL),
(19, 'BMW', 'S 1000 XR', 'FZP-736', 2016, 'Manualis (6 fokozatu)', 'B', 158.2, 115.5, 999, 'A2', 2, 32767, 123000, '2028-10-18', '1037 Budapest, Bojtár utca 43.', 'S1000XR.jpg', 0, NULL, NULL, NULL, NULL),
(20, 'Ducati', '1199 Panigale', 'LKV-915', 2013, 'Manualis (6 fokozatu)', 'B', 191.8, 140, 1198, 'A2', 2, 32300, 96900, '2025-03-11', '1195 Budapest, Ady Endre út 134.', '1199Panigale.jpg', 0, NULL, NULL, NULL, NULL),
(21, 'Ducati', '748 R', 'DMS-158', 2001, 'Manualis (6 fokozatu)', 'B', 106, 77.4, 748, 'A2', 2, 32767, 102900, '2026-07-23', '1012 Budapest, Logodi utca 34.', '748R.jpg', 0, NULL, NULL, NULL, NULL),
(22, 'Ducati', 'Hyperstrada', 'SVY-382', 2014, 'Manualis (6 fokozatu)', 'B', 110, 80.3, 821.1, 'A2', 2, 27900, 83700, '2027-09-07', '1117 Budapest, Szerémi út 67.', 'Hyperstrada.jpg', 0, NULL, NULL, NULL, NULL),
(23, 'Ducati', 'Monster SR2 1000', 'QRT-547', 2006, 'Manualis (6 fokozatu)', 'B', 93.9, 68.5, 992, 'A2', 2, 32767, 105900, '2028-05-15', '1044 Budapest, Megyeri út 20.', 'MonsterSR21000.jpg', 0, NULL, NULL, NULL, NULL),
(24, 'Ducati', 'Multistrada 1200', 'VXZ-290', 2017, 'Manualis (6 fokozatu)', 'B', 160, 116.8, 1198.4, 'A2', 2, 32767, 129600, '2029-10-29', '1117 Budapest, Szerémi út 67.', 'Multistrada1200.jpg', 0, NULL, NULL, NULL, NULL),
(25, 'Ducati', 'Panigale V4', 'NFD-617', 2020, 'Manualis (6 fokozatu)', 'B', 214, 156.2, 1103, 'A2', 2, 32767, 112500, '2028-02-14', '1148 Budapest, Fogarasi út 45.', 'PanigaleV4.jpg', 0, NULL, NULL, NULL, NULL),
(26, 'Ducati', 'Scrambler Classic', 'BXK-329', 2017, 'Manualis (6 fokozatu)', 'B', 75, 54.7, 803, 'A2', 2, 24500, 73500, '2025-06-18', '1161 Budapest, Rákosi út 88.', 'ScramblerClassic.jpg', 0, NULL, NULL, NULL, NULL),
(27, 'Ducati', 'Scrambler Icon', 'MQL-875', 2015, 'Manualis (6 fokozatu)', 'B', 75, 54.7, 803, 'A2', 2, 30300, 90900, '2026-09-13', '1239 Budapest, Haraszti út 42.', 'ScramblerIcon.jpg', 0, NULL, NULL, NULL, NULL),
(28, 'Ducati', 'ST3', 'WZG-142', 2005, 'Manualis (6 fokozatu)', 'B', 102, 74.5, 992, 'A2', 2, 32767, 147000, '2027-01-20', '1173 Budapest, Pesti út 237.', 'ST3.jpg', 0, NULL, NULL, NULL, NULL),
(29, 'Ducati', 'Superleggera 1199', 'PFC-693', 2014, 'Manualis (6 fokozatu)', 'B', 200, 146, 1198.4, 'A2', 2, 21900, 65700, '2028-08-06', '1077 Budapest, Rottenbiller utca 25.', 'Superleggera1199.jpg', 0, NULL, NULL, NULL, NULL),
(30, 'Harley-Davidson', 'Dyna Low Rider', 'KJR-714', 2015, 'Manualis (6 fokozatu)', 'B', 75.1, 54.8, 1690, 'A2', 2, 32767, 147900, '2029-12-10', '1151 Budapest, Károlyi Sándor út 76.', 'DynaLowRider.jpg', 0, NULL, NULL, NULL, NULL),
(31, 'Harley-Davidson', 'Electra Glide Ultra Classic', 'YZD-268', 2018, 'Manualis (6 fokozatu)', 'B', 90, 65.7, 1753.5, 'A2', 2, 32600, 97800, '2028-04-30', '1126 Budapest, Böszörményi út 38.', 'ElectraGlideUltraClassic.jpg', 0, NULL, NULL, NULL, NULL),
(32, 'Harley-Davidson', 'FXDR 114', 'CQV-301', 2020, 'Manualis (6 fokozatu)', 'B', 100, 73, 1868, 'A2', 2, 27200, 81600, '2025-11-22', '1126 Budapest, Böszörményi út 38.', 'FXDR114.jpg', 0, NULL, NULL, NULL, NULL),
(33, 'Harley-Davidson', 'Softail Heritage Classic 114', 'JTL-529', 2020, 'Manualis (6 fokozatu)', 'B', 94, 68.6, 1868, 'A2', 2, 32767, 102900, '2026-05-27', '1037 Budapest, Bojtár utca 43.', 'SoftailHeritageClassic114.jpg', 0, NULL, NULL, NULL, NULL),
(34, 'Harley-Davidson', 'Softail Deluxe', 'GNB-874', 2018, 'Manualis (6 fokozatu)', 'B', 86, 62.8, 1745, 'A2', 2, 25600, 76800, '2027-03-08', '1037 Budapest, Bojtár utca 43.', 'SoftailDeluxe.jpg', 0, NULL, NULL, NULL, NULL),
(35, 'Harley-Davidson', 'CVO Limited', 'ZSP-156', 2018, 'Manualis (6 fokozatu)', 'B', 105, 76.6, 1923, 'A2', 2, 32767, 145200, '2028-09-17', '1051 Budapest, Bajcsy-Zsilinszky út 24.', 'CVOLimited.jpg', 0, NULL, NULL, NULL, NULL),
(36, 'Harley-Davidson', 'XR1200', 'RLV-970', 2010, 'Manualis (5 fokozatu)', 'B', 90, 65.7, 1202, 'A2', 2, 32767, 143700, '2029-02-05', '1239 Budapest, Haraszti út 42.', 'XR1200.jpg', 0, NULL, NULL, NULL, NULL),
(37, 'Harley-Davidson', 'V-Rod Muscle', 'HBX-324', 2015, 'Manualis (6 fokozatu)', 'B', 119.4, 87.1, 1247, 'A2', 2, 30900, 92700, '2028-01-26', '1205 Budapest, Kossuth Lajos utca 120. ', 'V-RodMuscle.jpg', 0, NULL, NULL, NULL, NULL),
(38, 'Honda', '400X', 'XQR-580', 2016, 'Manualis (6 fokozatu)', 'B', 45.6, 33.3, 399, 'A2', 2, 29700, 89100, '2025-04-05', '1223 Budapest, Nagytétényi út 190.', '400X.jpg', 0, NULL, NULL, NULL, NULL),
(39, 'Honda', 'Ace 125', 'PLS-193', 2022, 'Manualis (4 fokozatu)', 'B', 8.5, 6.2, 124.1, 'A2', 2, 20000, 60000, '2026-08-11', '1161 Budapest, Rákosi út 88.', 'Ace125.jpg', 0, NULL, NULL, NULL, NULL),
(40, 'Honda', 'Activa', 'FJC-618', 2011, 'Automata', 'B', 8, 5.8, 109, 'A2', 2, 15100, 45300, '2027-10-12', '1195 Budapest, Ady Endre út 134.', 'Activa.jpg', 0, NULL, NULL, NULL, NULL),
(41, 'Honda', 'ADV 160', 'VWY-267', 2023, 'Automata', 'B', 15.8, 11.5, 157, 'A2', 2, 32767, 112200, '2028-07-21', '1103 Budapest, Gyömrői út 50.', 'ADV160.jpg', 0, NULL, NULL, NULL, NULL),
(42, 'Honda', 'Air Blade 160', 'KGL-951', 2023, 'Automata', 'B', 15, 11, 157, 'A2', 2, 32767, 109500, '2029-11-04', '1185 Budapest, Üllői út 780.', 'AirBlade160.jpg', 0, NULL, NULL, NULL, NULL),
(43, 'Honda', 'ANF 125i Innova', 'LYT-428', 2007, 'Manualis (4 fokozatu)', 'B', 9, 6.6, 124.9, 'A2', 2, 31200, 93600, '2028-08-29', '1211 Budapest, Szállító utca 6.', 'ANF125iInnova.jpg', 0, NULL, NULL, NULL, NULL),
(44, 'Honda', 'CB 1000 R', 'RXB-723', 2022, 'Manualis (6 fokozatu)', 'B', 143.5, 104.7, 998, 'A2', 2, 32767, 142200, '2025-01-07', '1205 Budapest, Kossuth Lajos utca 120.', 'CB1000R.jpg', 0, NULL, NULL, NULL, NULL),
(45, 'Honda', 'CB 125 F', 'QHN-853', 2023, 'Manualis (5 fokozatu)', 'B', 10.7, 7.8, 123.9, 'A2', 2, 32767, 109200, '2026-06-15', '1117 Budapest, Szerémi út 67.', 'CB125F.jpg', 0, NULL, NULL, NULL, NULL),
(46, 'Honda', 'CB 200 X', 'NFW-291', 2022, 'Manualis (5 fokozatu)', 'B', 17, 12.4, 184, 'A2', 2, 32767, 146100, '2027-12-09', '1087 Budapest, Könyves Kálmán körút 52.', 'CB200X.jpg', 0, NULL, NULL, NULL, NULL),
(47, 'Honda', 'CB 500 X', 'TQD-536', 2021, 'Manualis (6 fokozatu)', 'B', 46.4, 33.9, 471, 'A2', 2, 21800, 65400, '2028-03-30', '1239 Budapest, Haraszti út 42.', 'CB500X.jpg', 0, NULL, NULL, NULL, NULL),
(48, 'Honda', 'CB 650 R Fenix', 'PKY-801', 2021, 'Manualis (6 fokozatu)', 'B', 93.9, 68.5, 649, 'A2', 2, 28000, 84000, '2029-09-15', '1051 Budapest, Bajcsy-Zsilinszky út 24.', 'CB650RFenix.jpg', 0, NULL, NULL, NULL, NULL),
(49, 'Honda', 'CB 900 F Hornet', 'MSA-397', 2003, 'Manualis (6 fokozatu)', 'B', 110, 80.3, 919, 'A2', 2, 30600, 91800, '2028-06-16', '1173 Budapest, Pesti út 237.', 'CB900FHornet.jpg', 0, NULL, NULL, NULL, NULL),
(50, 'Honda', 'CB Shine', 'HZQ-625', 2013, 'Manualis (4 fokozatu)', 'B', 10.3, 7.5, 124.6, 'A2', 2, 32767, 141600, '2025-08-02', '1151 Budapest, Károlyi Sándor út 76.', 'CBShine.jpg', 0, NULL, NULL, NULL, NULL),
(51, 'Honda', 'CB Twister', 'FLX-752', 2013, 'Manualis (4 fokozatu)', 'B', 9, 6.6, 109, 'A2', 2, 32767, 147600, '2026-12-03', '1126 Budapest, Böszörményi út 38.', 'CBTwister.jpg', 0, NULL, NULL, NULL, NULL),
(52, 'Honda', 'CBF Stunner', 'ZWV-436', 2011, 'Manualis (5 fokozatu)', 'B', 11, 8, 124.7, 'A2', 2, 32767, 126000, '2028-04-14', '1037 Budapest, Bojtár utca 43.', 'CBFStunner.jpg', 0, NULL, NULL, NULL, NULL),
(53, 'Honda', 'CBR 150 R', 'YKP-583', 2017, 'Manualis (6 fokozatu)', 'B', 16.9, 12.3, 149.6, 'A2', 2, 32767, 110100, '2029-06-25', '1064 Budapest, Podmaniczky utca 63.', 'CBR150R.jpg', 0, NULL, NULL, NULL, NULL),
(54, 'Honda', 'CBR 400 R', 'TGS-917', 2014, 'Manualis (6 fokozatu)', 'B', 46, 33.6, 399, 'A2', 2, 32767, 123000, '2028-11-24', '1126 Budapest, Böszörményi út 38.', 'CBR400R.jpg', 0, NULL, NULL, NULL, NULL),
(55, 'Honda', 'CBR 600 RR', 'LRF-108', 2016, 'Manualis (6 fokozatu)', 'B', 118, 86.1, 599, 'A2', 2, 32500, 97500, '2025-05-19', '1044 Budapest, Megyeri út 20.', 'CBR600RR.jpg', 0, NULL, NULL, NULL, NULL),
(56, 'Honda', 'CD 110 Dream', 'PNZ-476', 2023, 'Manualis (4 fokozatu)', 'B', 8.7, 6.3, 109.1, 'A2', 2, 27100, 81300, '2026-10-31', '1151 Budapest, Károlyi Sándor út 76.', 'CD110Dream.jpg', 0, NULL, NULL, NULL, NULL),
(57, 'Honda', 'CG 125', 'VKM-245', 2022, 'Manualis (4 fokozatu)', 'B', 11, 8, 124, 'A1/B', 2, 16100, 48300, '2027-06-19', '1161 Budapest, Rákosi út 88.', 'CG125.jpg', 0, NULL, NULL, NULL, NULL),
(58, 'Honda', 'Click 125', 'GRX-792', 2023, 'Automata', 'B', 11, 8, 125, 'A1/B', 2, 18000, 54000, '2028-12-21', '1185 Budapest, Üllői út 780.', 'Click125.jpg', 0, NULL, NULL, NULL, NULL),
(59, 'Honda', 'CMX 500 Rebel', 'JKW-521', 2018, 'Manualis (6 fokozatu)', 'B', 46.9, 34.3, 471, 'A2', 2, 20000, 60000, '2029-07-07', '1138 Budapest, Váci út 152.', 'CMX500Rebel.jpg', 0, NULL, NULL, NULL, NULL),
(60, 'Honda', 'VFR 800 X Crossrunner', 'SBD-870', 2015, 'Manualis (6 fokozatu)', 'B', 107, 78.1, 782, 'A2', 2, 32767, 127800, '2028-12-29', '1077 Budapest, Rottenbiller utca 25.', 'VFR800XCrossrunner.jpg', 0, NULL, NULL, NULL, NULL),
(61, 'Honda', 'Crosstourer Highlander', 'NXZ-413', 2014, 'Manualis (6 fokozatu)', 'B', 127.4, 93, 1237, 'A2', 2, 20500, 61500, '2025-02-04', '1103 Budapest, Gyömrői út 50.', 'CrosstourerHighlander.jpg', 0, NULL, NULL, NULL, NULL),
(62, 'Honda', 'Deauville', 'DQR-658', 2006, 'Manualis (5 fokozatu)', 'B', 64.8, 47.3, 680, 'A2', 2, 32767, 101400, '2026-03-02', '1151 Budapest, Károlyi Sándor út 76.', 'Deauville.jpg', 0, NULL, NULL, NULL, NULL),
(63, 'Honda', 'Dio', 'LMF-283', 2014, 'Automata', 'B', 8, 5.8, 109, 'A1/B', 2, 16600, 49800, '2027-08-28', '1161 Budapest, Rákosi út 88.', 'Dio.jpg', 0, NULL, NULL, NULL, NULL),
(64, 'Honda', 'Dream Neo', 'FYC-916', 2014, 'Manualis (4 fokozatu)', 'B', 8.3, 6, 109, 'A1/B', 2, 16300, 48900, '2028-10-08', '1117 Budapest, Szerémi út 67.', 'DreamNeo.jpg', 0, NULL, NULL, NULL, NULL),
(65, 'Honda', 'EVO 6', 'ZWH-543', 2014, 'Manualis (5 fokozatu)', 'B', 150, 109.5, 1832, 'A2', 2, 30400, 91200, '2029-04-12', '1185 Budapest, Üllői út 780.', 'EVO6.jpg', 0, NULL, NULL, NULL, NULL),
(66, 'Honda', 'Gold Wing Tour', 'TNL-798', 2022, 'Manualis (6 fokozatu)', 'B', 124.7, 91, 1833, 'A2', 2, 32767, 110700, '2028-09-14', '1148 Budapest, Fogarasi út 45.', 'GoldWingTour.jpg', 0, NULL, NULL, NULL, NULL),
(67, 'Honda', 'Integra', 'PCK-251', 2018, 'Manualis (6 fokozatu)', 'B', 54, 39.4, 745, 'A2', 2, 32767, 119400, '2025-07-01', '1173 Budapest, Pesti út 237.', 'Integra.jpg', 0, NULL, NULL, NULL, NULL),
(68, 'Honda', 'Jazz 250', 'QDM-738', 2002, 'Automata', 'B', 19.3, 14.1, 249, 'A2', 2, 32767, 104700, '2026-01-12', '1173 Budapest, Pesti út 237.', 'Jazz250.jpg', 0, NULL, NULL, NULL, NULL),
(69, 'Honda', 'Lead 125', 'GVX-493', 2015, 'Automata', 'B', 11.3, 8.3, 124.9, 'A2', 2, 32767, 117600, '2027-04-26', '1051 Budapest, Bajcsy-Zsilinszky út 24.', 'Lead125.jpg', 0, NULL, NULL, NULL, NULL),
(70, 'Honda', 'MSX 125', 'LRB-187', 2019, 'Manualis (4 fokozatu)', 'B', 9.7, 7.1, 124.9, 'A1/B', 2, 15800, 47400, '2028-05-29', '1185 Budapest, Üllői út 780.', 'MSX125.jpg', 0, NULL, NULL, NULL, NULL),
(71, 'Honda', 'NSC 110 Vision', 'HKY-632', 2013, 'Automata', 'B', 8.3, 6.1, 108, 'A1/B', 2, 16300, 48900, '2029-10-20', '1087 Budapest, Könyves Kálmán körút 52.', 'NSC110Vision.jpg', 0, NULL, NULL, NULL, NULL),
(72, 'Honda', 'PCX 125', 'MTJ-428', 2019, 'Automata', 'B', 12.1, 8.8, 125, 'A2', 2, 32767, 137700, '2028-03-19', '1096 Budapest, Haller utca 89.', 'PCX125.jpg', 0, NULL, NULL, NULL, NULL),
(73, 'Honda', 'Stunner', 'FRZ-915', 2014, 'Manualis (5 fokozatu)', 'B', 11.6, 8.5, 124.7, 'A2', 2, 31400, 94200, '2025-09-23', '1096 Budapest, Haller utca 89.', 'Stunner.jpg', 0, NULL, NULL, NULL, NULL),
(74, 'Honda', 'Unicorn', 'VCM-578', 2022, 'Manualis (5 fokozatu)', 'B', 12.7, 9.3, 162.7, 'A2', 2, 30200, 90600, '2026-07-30', '1151 Budapest, Károlyi Sándor út 76.', 'Unicorn.jpg', 0, NULL, NULL, NULL, NULL),
(75, 'Honda', 'Wave 110i', 'PKR-846', 2017, 'Manualis (4 fokozatu)', 'B', 8.4, 6.1, 109.1, 'A1/B', 2, 15100, 45300, '2027-11-15', '1126 Budapest, Böszörményi út 38.', 'Wave110i.jpg', 0, NULL, NULL, NULL, NULL),
(76, 'Honda', 'X Blade', 'YSD-314', 2022, 'Manualis (5 fokozatu)', 'B', 13.7, 10, 162.7, 'A2', 2, 26600, 79800, '2028-06-09', '1151 Budapest, Károlyi Sándor út 76.', 'XBlade.jpg', 0, NULL, NULL, NULL, NULL),
(77, 'Super Soco', 'CPX', 'GZV-509', 2023, 'Automata', 'E', 5.4, 3.9, 146.4, 'A1/B', 2, 17100, 51300, '2029-01-14', '1126 Budapest, Böszörményi út 38.', 'CPX.jpg', 0, NULL, NULL, NULL, NULL),
(78, 'Super Soco', 'TC Titan', 'JLW-839', 2022, 'Automata', 'E', 24.1, 17.6, 243.2, 'A2', 2, 32767, 140400, '2028-05-28', '1037 Budapest, Bojtár utca 43.', 'TCTitan.jpg', 0, NULL, NULL, NULL, NULL),
(79, 'Yamaha', 'Aerox 155', 'QWF-760', 2022, 'Automata', 'B', 14.8, 10.8, 155, 'A2', 2, 26200, 78600, '2025-10-06', '1239 Budapest, Haraszti út 42.', 'Aerox155.jpg', 0, NULL, NULL, NULL, NULL),
(80, 'Yamaha', 'Cygnus Alpha', 'NLM-182', 2018, 'Automata', 'B', 7.2, 5.3, 113, 'A1/B', 2, 17400, 52200, '2026-04-08', '1195 Budapest, Ady Endre út 134.', 'CygnusAlpha.jpg', 0, NULL, NULL, NULL, NULL),
(81, 'Yamaha', 'Fazer', 'SHP-649', 2028, 'Manualis (5 fokozatu)', 'B', 14, 10.2, 153, 'A2', 2, 32767, 111000, '2027-03-18', '1077 Budapest, Rottenbiller utca 25.', 'Fazer.jpg', 0, NULL, NULL, NULL, NULL),
(82, 'Yamaha', 'Fazer 8', 'FQX-329', 2013, 'Manualis (6 fokozatu)', 'B', 104.7, 76.4, 779, 'A2', 2, 24600, 73800, '2028-02-07', '1012 Budapest, Logodi utca 34.', 'Fazer8.jpg', 0, NULL, NULL, NULL, NULL),
(83, 'Yamaha', 'Fino 125', 'RLJ-470', 2023, 'Automata', 'B', 9.4, 6.9, 125, 'A1/B', 2, 18200, 54600, '2029-08-03', '1195 Budapest, Ady Endre út 134.', 'Fino125.jpg', 0, NULL, NULL, NULL, NULL),
(84, 'Yamaha', 'EGO Avantiz', 'TXW-953', 2020, 'Manualis (6 fokozatu)', 'B', 9.4, 6.9, 124, 'A1/B', 2, 16100, 48300, '2028-02-25', '1051 Budapest, Bajcsy-Zsilinszky út 24.', 'EGOAvantiz.jpg', 0, NULL, NULL, NULL, NULL),
(85, 'Yamaha', 'EGO Solariz', 'BZC-218', 2020, 'Manualis (6 fokozatu)', 'B', 9.4, 6.9, 125, 'A1/B', 2, 18900, 56700, '2025-03-31', '1117 Budapest, Szerémi út 67.', 'EGOSolariz.jpg', 0, NULL, NULL, NULL, NULL),
(86, 'Yamaha', 'FJ-09', 'MHF-475', 2016, 'Manualis (6 fokozatu)', 'B', 115, 83.9, 847, 'A2', 2, 32767, 108600, '2026-09-04', '1239 Budapest, Haraszti út 42.', 'FJ-09.jpg', 0, NULL, NULL, NULL, NULL),
(87, 'Yamaha', 'Freego S', 'VNZ-684', 2021, 'Automata', 'B', 9.4, 6.9, 125, 'A1/B', 2, 19800, 59400, '2027-12-22', '1096 Budapest, Haller utca 89.', 'FreegoS.jpg', 0, NULL, NULL, NULL, NULL),
(88, 'Yamaha', 'Gladiator', 'KSW-371', 2007, 'Manualis (6 fokozatu)', 'B', 10.7, 7.8, 123.7, 'A1/B', 2, 16700, 50100, '2028-11-18', '1087 Budapest, Könyves Kálmán körút 52.', 'Gladiator.jpg', 0, NULL, NULL, NULL, NULL),
(89, 'Suzuki', 'Address', 'PLH-890', 2018, 'Automata', 'B', 9.3, 6.8, 113, 'A2', 2, 22400, 67200, '2029-05-06', '1103 Budapest, Gyömrői út 50.', 'Address.jpg', 0, NULL, NULL, NULL, NULL),
(90, 'Suzuki', 'B-King', 'FRV-209', 2012, 'Manualis (6 fokozatu)', 'B', 181, 132.1, 1340, 'A2', 2, 28300, 84900, '2028-01-15', '1051 Budapest, Bajcsy-Zsilinszky út 24.', 'B-King.jpg', 0, NULL, NULL, NULL, NULL),
(91, 'Suzuki', 'Boulevard S40', 'DNY-742', 2021, 'Manualis (5 fokozatu)', 'B', 56, 43.6, 652, 'A2', 2, 22200, 66600, '2025-06-27', '1223 Budapest, Nagytétényi út 190.', 'BoulevardS40.jpg', 0, NULL, NULL, NULL, NULL),
(92, 'Suzuki', 'Gixxer 250', 'ZWQ-658', 2028, 'Manualis (6 fokozatu)', 'B', 26.5, 19.3, 249, 'A2', 2, 22200, 66600, '2026-12-20', '1044 Budapest, Megyeri út 20.', 'Gixxer250.jpg', 0, NULL, NULL, NULL, NULL),
(93, 'Suzuki', 'Hayate EP', 'PTL-303', 2018, 'Manualis (4 fokozatu)', 'B', 8.7, 6.4, 113, 'A1/B', 2, 16600, 49800, '2027-07-01', '1161 Budapest, Rákosi út 88.', 'HayateEP.jpg', 0, NULL, NULL, NULL, NULL),
(94, 'Suzuki', 'Intruder Classic 400', 'VXJ-940', 2015, 'Manualis (5 fokozatu)', 'B', 33, 24.1, 399, 'A2', 2, 32767, 102600, '2028-09-12', '1151 Budapest, Károlyi Sándor út 76.', 'IntruderClassic400.jpg', 0, NULL, NULL, NULL, NULL),
(95, 'Suzuki', 'Katana', 'LBF-217', 2022, 'Manualis (6 fokozatu)', 'B', 152, 110.9, 999, 'A2', 2, 20200, 60600, '2029-03-08', '1012 Budapest, Logodi utca 34.', 'Katana.jpg', 0, NULL, NULL, NULL, NULL),
(96, 'Suzuki', 'Shooter 115 FI', 'HMX-679', 2018, 'Manualis (4 fokozatu)', 'B', 9.3, 6.8, 113, 'A1/B', 2, 16400, 49200, '2028-10-02', '1021 Budapest, Hűvösvölgyi út 136.', 'Shooter115FI.jpg', 0, NULL, NULL, NULL, NULL),
(97, 'Suzuki', 'Skywave 650 LX', 'QRJ-501', 2005, 'Manualis (5 fokozatu)', 'B', 49.6, 36.2, 638, 'A2', 2, 32767, 110700, '2025-12-14', '1211 Budapest, Szállító utca 6.', 'Skywave650LX.jpg', 0, NULL, NULL, NULL, NULL),
(98, 'Suzuki', 'Slingshot Plus', 'FYC-318', 2017, 'Manualis (5 fokozatu)', 'B', 14.8, 10.8, 124, 'A2', 2, 25400, 76200, '2026-02-07', '1117 Budapest, Szerémi út 67.', 'SlingshotPlus.jpg', 0, NULL, NULL, NULL, NULL),
(99, 'Suzuki', 'V-Strom 1050DE Adventure', 'GYD-764', 2028, 'Manualis (6 fokozatu)', 'B', 100, 73, 1037, 'A2', 2, 28100, 84300, '2027-05-05', '1223 Budapest, Nagytétényi út 190.', 'V-Strom1050DEAdventure.jpg', 0, NULL, NULL, NULL, NULL),
(100, 'Peugeot', 'Belville 125 RS', 'MSK-201', 2019, 'Automata', 'B', 11, 8, 125, 'A1/B', 2, 17900, 53700, '2028-08-16', '1185 Budapest, Üllői út 780.', 'Belville125RS.jpg', 0, NULL, NULL, NULL, NULL),
(101, 'Peugeot', 'Citystar 125 RS', 'PKX-928', 2019, 'Automata', 'B', 14.2, 10.4, 124.8, 'A2', 2, 32767, 116100, '2029-07-30', '1185 Budapest, Üllői út 780.', 'Citystar125RS.jpg', 0, NULL, NULL, NULL, NULL),
(102, 'Peugeot', 'Geopolis 125 Premium', 'ZWJ-563', 2008, 'Automata', 'B', 15, 10.9, 124.8, 'A2', 2, 20400, 61200, '2027-06-08', '1148 Budapest, Fogarasi út 45.', 'Geopolis125Premium.jpg', 0, NULL, NULL, NULL, NULL),
(103, 'Peugeot', 'Kisbee 50 RS', 'LSH-429', 2021, 'Automata', 'B', 3.6, 2.6, 49.9, 'A1/B', 2, 16500, 49500, '2025-11-30', '1096 Budapest, Haller utca 89.', 'Kisbee50RS.jpg', 0, NULL, NULL, NULL, NULL),
(104, 'Peugeot', 'Speedfight 50', 'KTV-832', 2023, 'Automata', 'B', 3, 2.2, 49.9, 'A1/B', 2, 18500, 55500, '2026-03-23', '1096 Budapest, Haller utca 89.', 'Speedfight50.jpg', 0, NULL, NULL, NULL, NULL),
(105, 'Peugeot', 'Streetzone 50', 'NPJ-187', 2024, 'Automata', 'B', 3.5, 2.6, 49.9, 'A1/B', 2, 25600, 76800, '2027-09-26', '1103 Budapest, Gyömrői út 50.', 'Streetzone50.jpg', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tools`
--

CREATE TABLE `tools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `toolName` varchar(80) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `tools`
--

INSERT INTO `tools` (`id`, `toolName`, `size`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sisak', 'S', NULL, NULL, NULL),
(2, 'Sisak', 'M', NULL, NULL, NULL),
(3, 'Sisak', 'L', NULL, NULL, NULL),
(4, 'Sisak', 'XL', NULL, NULL, NULL),
(5, 'Sisak', '2XL', NULL, NULL, NULL),
(6, 'Protektoros Ruha', 'S', NULL, NULL, NULL),
(7, 'Protektoros Ruha', 'M', NULL, NULL, NULL),
(8, 'Protektoros Ruha', 'L', NULL, NULL, NULL),
(9, 'Protektoros Ruha', 'XL', NULL, NULL, NULL),
(10, 'Protektoros Ruha', '2XL', NULL, NULL, NULL),
(11, 'Cipő', '39', NULL, NULL, NULL),
(12, 'Cipő', '40', NULL, NULL, NULL),
(13, 'Cipő', '41', NULL, NULL, NULL),
(14, 'Cipő', '42', NULL, NULL, NULL),
(15, 'Cipő', '43', NULL, NULL, NULL),
(16, 'Cipő', '44', NULL, NULL, NULL),
(17, 'Cipő', '45', NULL, NULL, NULL),
(18, 'Cipő', '46', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `drivingLicenceNumber` varchar(255) NOT NULL,
  `drivingLicenceType` varchar(255) NOT NULL,
  `drivingLicenceImage` varchar(255) NOT NULL,
  `drivingLicenceImageBack` varchar(255) NOT NULL,
  `drivingLicenceReal` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phoneNumber`, `drivingLicenceNumber`, `drivingLicenceType`, `drivingLicenceImage`, `drivingLicenceImageBack`, `drivingLicenceReal`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test User', 'test@gmail.com', '2025-04-30 18:14:41', '$2y$12$b/hrKTMwxwlMF9S6KRGQKuyQL3E1AzoA9Yi0oHxCPBJb4UL59VyDK', '06202222222', 'NE2321', 'B1', 'placeholder.jpg', 'placeholder.jpg', 1, 'iZyIqBpoDG', '2025-04-30 18:14:41', '2025-04-30 18:14:41', NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `device_switches`
--
ALTER TABLE `device_switches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_switches_tools_id_foreign` (`tools_id`),
  ADD KEY `device_switches_loans_id_foreign` (`loans_id`);

--
-- A tábla indexei `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_motorcycles_id_foreign` (`motorcycles_id`),
  ADD KEY `loans_users_id_foreign` (`users_id`);

--
-- A tábla indexei `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_admin_id_foreign` (`admin_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `motorcycles`
--
ALTER TABLE `motorcycles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `motorcycles_licenceplate_unique` (`licencePlate`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_drivinglicencenumber_unique` (`drivingLicenceNumber`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `device_switches`
--
ALTER TABLE `device_switches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `motorcycles`
--
ALTER TABLE `motorcycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tools`
--
ALTER TABLE `tools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `device_switches`
--
ALTER TABLE `device_switches`
  ADD CONSTRAINT `device_switches_loans_id_foreign` FOREIGN KEY (`loans_id`) REFERENCES `loans` (`id`),
  ADD CONSTRAINT `device_switches_tools_id_foreign` FOREIGN KEY (`tools_id`) REFERENCES `tools` (`id`);

--
-- Megkötések a táblához `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_motorcycles_id_foreign` FOREIGN KEY (`motorcycles_id`) REFERENCES `motorcycles` (`id`),
  ADD CONSTRAINT `loans_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

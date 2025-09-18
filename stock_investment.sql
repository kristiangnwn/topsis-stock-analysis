-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Bulan Mei 2025 pada 05.52
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock_investment`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `analysis_results`
--

CREATE TABLE `analysis_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tickers` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `result` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_output` text DEFAULT NULL,
  `risk_profile` varchar(50) DEFAULT 'Balanced',
  `raw_data` longtext DEFAULT NULL,
  `preprocessed_data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `analysis_results`
--

INSERT INTO `analysis_results` (`id`, `user_id`, `tickers`, `start_date`, `end_date`, `result`, `created_at`, `log_output`, `risk_profile`, `raw_data`, `preprocessed_data`) VALUES
(1, 2, 'AAPL,MSFT,GOOGL,AMZN,TSLA,META,NVDA,NFLX,PYPL,ADBE', '2024-05-01', '2024-06-01', '[{\'Ticker\': \'AAPL\', \'Preference Value\': 1.0}, {\'Ticker\': \'ADBE\', \'Preference Value\': 0.8901563343409521}, {\'Ticker\': \'META\', \'Preference Value\': 0.8091912198737609}, {\'Ticker\': \'NFLX\', \'Preference Value\': 0.7388018527886422}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.6792497448169242}, {\'Ticker\': \'AMZN\', \'Preference Value\': 0.5527332597860171}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.5188818832161638}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.21344196914810515}, {\'Ticker\': \'PYPL\', \'Preference Value\': 0.19917707156146633}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.0}]', '2024-06-09 17:06:20', NULL, 'Balanced', NULL, NULL),
(2, 2, 'GOOG,INTC,MLGO', '2024-06-01', '2024-06-12', '[{\'Ticker\': \'INTC\', \'Preference Value\': 1.0}, {\'Ticker\': \'GOOG\', \'Preference Value\': 0.6832075082484067}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.0}]', '2024-06-14 15:09:57', NULL, 'Balanced', NULL, NULL),
(3, 2, 'GOOG,INTC,MLGO', '2024-06-01', '2024-06-05', '[{\'Ticker\': \'GOOG\', \'Preference Value\': nan}, {\'Ticker\': \'GOOG\', \'Preference Value\': nan}, {\'Ticker\': \'GOOG\', \'Preference Value\': nan}]', '2024-06-15 01:55:49', NULL, 'Balanced', NULL, NULL),
(4, 2, 'GOOG,INTC,MLGO', '2024-06-01', '2024-06-08', '[{\'Ticker\': \'INTC\', \'Preference Value\': 1.0}, {\'Ticker\': \'GOOG\', \'Preference Value\': 0.10433426492865984}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.0}]', '2024-06-15 01:56:04', NULL, 'Balanced', NULL, NULL),
(5, 1, 'AAPL,MSFT,GOOGL,AMZN,TSLA,META,NVDA,NFLX,PYPL,ADBE', '2024-05-01', '2024-06-01', '[{\'Ticker\': \'AAPL\', \'Preference Value\': 1.0}, {\'Ticker\': \'ADBE\', \'Preference Value\': 0.8881310182457081}, {\'Ticker\': \'META\', \'Preference Value\': 0.8073501222060988}, {\'Ticker\': \'NFLX\', \'Preference Value\': 0.7371209107461311}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.6777043005843272}, {\'Ticker\': \'AMZN\', \'Preference Value\': 0.5514756761720205}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.5177025732905194}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.21295636873285917}, {\'Ticker\': \'PYPL\', \'Preference Value\': 0.19872392780388487}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.0}]', '2024-06-15 02:27:19', NULL, 'Balanced', NULL, NULL),
(6, 3, 'AAPL,MSFT,GOOGL,AMZN,TSLA,META,NVDA,NFLX,PYPL,ADBE', '2024-06-17', '2024-06-28', '[{\'Ticker\': \'NFLX\', \'Preference Value\': 1.0}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.8206259972777354}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.6814431096065597}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.6485654363781554}, {\'Ticker\': \'PYPL\', \'Preference Value\': 0.6271241791254425}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.4850203651954572}, {\'Ticker\': \'META\', \'Preference Value\': 0.44492774399195767}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.204395434194022}, {\'Ticker\': \'AMZN\', \'Preference Value\': 0.11280227696624126}, {\'Ticker\': \'ADBE\', \'Preference Value\': 0.0}]', '2024-06-30 04:27:45', NULL, 'Balanced', NULL, NULL),
(7, 4, 'GOOG,INTC,MLGO', '2024-10-01', '2024-10-10', '[{\'Ticker\': \'GOOG\', \'Preference Value\': 1.0}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.08907459768709682}, {\'Ticker\': \'INTC\', \'Preference Value\': 0.0}]', '2024-10-14 07:40:08', NULL, 'Balanced', NULL, NULL),
(8, 4, 'GOOG,INTC,MLGO', '2024-09-30', '2024-10-11', '[{\'Ticker\': \'GOOG\', \'Preference Value\': 1.0}, {\'Ticker\': \'INTC\', \'Preference Value\': 0.7061416408863653}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.0}]', '2024-10-14 08:29:47', NULL, 'Balanced', NULL, NULL),
(9, 4, 'GOOG,INTC,MLGO', '2024-10-01', '2024-10-12', '[{\'Ticker\': \'GOOG\', \'Preference Value\': 1.0}, {\'Ticker\': \'INTC\', \'Preference Value\': 0.4279435123446504}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.0}]', '2024-10-14 08:45:51', NULL, 'Balanced', NULL, NULL),
(10, 4, 'GOOG,INTC,MLGO', '2024-10-01', '2024-10-04', '[{\'Ticker\': \'MLGO\', \'Preference Value\': 1.0}, {\'Ticker\': \'INTC\', \'Preference Value\': 0.44409505334182564}, {\'Ticker\': \'GOOG\', \'Preference Value\': 0.0}]', '2024-10-14 09:00:25', NULL, 'Balanced', NULL, NULL),
(11, 4, 'GOOG,INTC,MLGO', '2024-10-01', '2024-10-12', '[{\'Ticker\': \'GOOG\', \'Preference Value\': 1.0}, {\'Ticker\': \'INTC\', \'Preference Value\': 0.4279435123446504}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.0}]', '2024-10-14 09:01:12', NULL, 'Balanced', NULL, NULL),
(12, 4, 'AAPL,MSFT,GOOGL,AMZN,TSLA,META,NVDA,NFLX,PYPL,ADBE', '2024-10-01', '2024-10-08', '[{\'Ticker\': \'ADBE\', \'Preference Value\': nan}]', '2024-10-14 09:30:57', NULL, 'Balanced', NULL, NULL),
(13, 4, 'AAPL,MSFT,GOOGL,AMZN,TSLA,META,NVDA,NFLX,PYPL,ADBE', '2024-10-01', '2024-10-08', '[{\'Ticker\': \'AAPL\', \'Preference Value\': 1.0}, {\'Ticker\': \'ADBE\', \'Preference Value\': 0.9336382199567356}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.8580703689105303}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.5894387861753733}, {\'Ticker\': \'AMZN\', \'Preference Value\': 0.4617614151337034}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.3557185809293533}, {\'Ticker\': \'META\', \'Preference Value\': 0.1677858799263247}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.12900823789349103}, {\'Ticker\': \'NFLX\', \'Preference Value\': 0.125263888281533}, {\'Ticker\': \'PYPL\', \'Preference Value\': 0.0}]', '2024-10-14 09:30:57', NULL, 'Balanced', NULL, NULL),
(14, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-09-01', '2024-10-24', '[{\'Ticker\': \'AMZN\', \'Preference Value\': 1.0}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.5424652487552218}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.36500762144593263}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.12059434453139907}, {\'Ticker\': \'GME\', \'Preference Value\': 0.0}]', '2024-10-26 07:52:33', NULL, 'Balanced', NULL, NULL),
(15, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-08-01', '2024-08-29', '[{\'Ticker\': \'GME\', \'Preference Value\': 1.0}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.6067050654620424}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.402957034525844}, {\'Ticker\': \'AMZN\', \'Preference Value\': 0.062404597921635274}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.0}]', '2024-10-26 08:11:46', NULL, 'Balanced', NULL, NULL),
(16, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-10-01', '2024-10-24', '[{\'Ticker\': \'AMZN\', \'Preference Value\': 1.0}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.9990804925052998}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.9071857164426375}, {\'Ticker\': \'GME\', \'Preference Value\': 0.09945131650302373}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.0}]', '2024-10-26 08:14:15', NULL, 'Balanced', NULL, NULL),
(17, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-10-01', '2024-10-25', '[{\'Ticker\': \'AMZN\', \'Preference Value\': 1.0}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.9806017758170585}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.8576169636629639}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.05825221918175047}, {\'Ticker\': \'GME\', \'Preference Value\': 0.0}]', '2024-10-26 08:14:31', NULL, 'Balanced', NULL, NULL),
(18, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-10-01', '2024-10-23', '[{\'Ticker\': \'AMZN\', \'Preference Value\': 1.0}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.8463117234543491}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.8168835725934741}, {\'Ticker\': \'GME\', \'Preference Value\': 0.31986650325025573}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.0}]', '2024-10-26 08:14:42', NULL, 'Balanced', NULL, NULL),
(19, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-10-01', '2024-10-23', '[{\'Ticker\': \'AMZN\', \'Preference Value\': 1.0}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.8463117234543491}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.8168835725934741}, {\'Ticker\': \'GME\', \'Preference Value\': 0.31986650325025573}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.0}]', '2024-10-26 08:14:47', NULL, 'Balanced', NULL, NULL),
(20, 5, 'PINS,GME,NVDA,TSLA,AMZN', '2024-10-01', '2024-10-11', '[{\'Ticker\': \'AMZN\', \'Preference Value\': 1.0}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.7835170207578812}, {\'Ticker\': \'PINS\', \'Preference Value\': 0.40229483969206675}, {\'Ticker\': \'GME\', \'Preference Value\': 0.37108875405455954}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.0}]', '2024-10-26 08:15:07', NULL, 'Balanced', NULL, NULL),
(21, 4, 'GOOG,INTC,MLGO', '2024-12-01', '2024-12-11', '[{\'Ticker\': \'INTC\', \'Preference Value\': 1.0}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.9564296290431702}, {\'Ticker\': \'GOOG\', \'Preference Value\': 0.0}]', '2024-12-12 07:31:48', NULL, 'Balanced', NULL, NULL),
(22, 4, 'AAPL,MSFT,GOOGL,AMZN,TSLA,META,NVDA,NFLX,PYPL,ADBE', '2024-12-01', '2024-12-11', '[{\'Ticker\': \'PYPL\', \'Preference Value\': 1.0}, {\'Ticker\': \'META\', \'Preference Value\': 0.9022170046931842}, {\'Ticker\': \'AMZN\', \'Preference Value\': 0.7778283495675163}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.7486988759337919}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.7165867323048365}, {\'Ticker\': \'ADBE\', \'Preference Value\': 0.7094730866182387}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.5784201171458803}, {\'Ticker\': \'TSLA\', \'Preference Value\': 0.4575983399843609}, {\'Ticker\': \'NFLX\', \'Preference Value\': 0.3615257282796743}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.0}]', '2024-12-12 07:39:13', NULL, 'Balanced', NULL, NULL),
(23, 4, 'AAPL,MSFT,GOOGL', '2024-12-01', '2024-12-15', '[{\'Ticker\': \'AAPL\', \'Preference Value\': 1.0, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.9402343517574037, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.0, \'Risk Profile\': \'Balanced\'}]', '2024-12-16 04:44:33', NULL, 'Balanced', NULL, NULL),
(24, 4, 'AAPL,MSFT,GOOGL', '2024-12-01', '2024-12-15', '[{\'Ticker\': \'MSFT\', \'Preference Value\': 1.0, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.913655950635859, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.0, \'Risk Profile\': \'High Risk High Reward\'}]', '2024-12-16 04:45:04', NULL, 'Balanced', NULL, NULL),
(25, 4, 'AAPL,MSFT,GOOGL', '2024-12-01', '2024-12-15', '[{\'Ticker\': \'MSFT\', \'Preference Value\': nan, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': nan, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': nan, \'Risk Profile\': \'High Risk High Reward\'}]', '2024-12-16 05:06:10', NULL, 'Balanced', NULL, NULL),
(26, 4, 'GOOG,INTC,MLGO', '2024-12-01', '2024-12-06', '[{\'Ticker\': \'INTC\', \'Preference Value\': 1.0, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'GOOG\', \'Preference Value\': 0.0739201374986384, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'MLGO\', \'Preference Value\': 0.0, \'Risk Profile\': \'Balanced\'}]', '2024-12-18 08:48:52', NULL, 'Balanced', NULL, NULL),
(27, 4, 'GOOG,INTC,MLGO', '2024-12-01', '2024-12-14', '[{\'Ticker\': \'MLGO\', \'Preference Value\': 1.0, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'GOOG\', \'Preference Value\': 0.665191308760254, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'INTC\', \'Preference Value\': 0.0, \'Risk Profile\': \'Balanced\'}]', '2024-12-18 08:49:04', NULL, 'Balanced', NULL, NULL),
(28, 6, 'AAPL,MSFT,GOOGL', '2024-12-01', '2024-12-15', '[{\'Ticker\': \'AAPL\', \'Preference Value\': 1.0, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.9402343517574037, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.0, \'Risk Profile\': \'Balanced\'}]', '2024-12-20 16:07:07', NULL, 'Balanced', NULL, NULL),
(29, 6, 'AAPL,MSFT,GOOGL', '2024-12-01', '2024-12-15', '[{\'Ticker\': \'AAPL\', \'Preference Value\': 1.0, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.9402343517574037, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.0, \'Risk Profile\': \'Balanced\'}]', '2024-12-20 16:07:35', NULL, 'Balanced', NULL, NULL),
(30, 7, 'AAPL,MSFT,GOOGL,NVDA,META', '2025-05-01', '2025-05-09', '[{\'Ticker\': \'META\', \'Preference Value\': 1.0, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.8725952912894959, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.6584925578283239, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.6499716117709285, \'Risk Profile\': \'Balanced\'}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.0, \'Risk Profile\': \'Balanced\'}]', '2025-05-11 03:05:37', NULL, 'Balanced', NULL, NULL),
(31, 7, 'AAPL,MSFT,GOOGL', '2025-05-01', '2025-05-09', '[{\'Ticker\': \'GOOGL\', \'Preference Value\': 1.0, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.8060715412388288, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.0, \'Risk Profile\': \'High Risk High Reward\'}]', '2025-05-11 05:56:18', NULL, 'Balanced', NULL, NULL),
(32, 7, 'MSFT,GOOGL,NVDA', '2025-05-01', '2025-05-08', '[{\'Ticker\': \'MSFT\', \'Preference Value\': 1.0, \'Risk Profile\': \'Low Risk Low Reward\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.2825149935746809, \'Risk Profile\': \'Low Risk Low Reward\'}, {\'Ticker\': \'NVDA\', \'Preference Value\': 0.0, \'Risk Profile\': \'Low Risk Low Reward\'}]', '2025-05-11 06:07:26', NULL, 'Balanced', NULL, NULL),
(33, 7, 'MSFT,GOOGL,META', '2025-05-01', '2025-05-08', '[{\'Ticker\': \'META\', \'Preference Value\': 1.0, \'Risk Profile\': \'Low Risk Low Reward\'}, {\'Ticker\': \'MSFT\', \'Preference Value\': 0.9829851635453167, \'Risk Profile\': \'Low Risk Low Reward\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.0, \'Risk Profile\': \'Low Risk Low Reward\'}]', '2025-05-11 06:25:10', 'Tahap 1: Pengumpulan Data\nData yang diambil:\n              MSFT   GOOGL    META\ndate                              \n2025-05-08  438.17  154.28  598.01\n2025-05-07  433.35  151.38  596.81\n2025-05-06  433.31  163.23  587.31\n2025-05-05  436.17  164.21  599.27\n2025-05-02  435.28  164.03  597.02\n\nTahap 2: Preproses Data\nData yang telah dipreproses:\n                MSFT     GOOGL      META\ndate                                    \n2025-05-08  1.000000  0.226033  0.953437\n2025-05-07  0.622553  0.000000  0.909091\n2025-05-06  0.619421  0.923617  0.558019\n2025-05-05  0.843383  1.000000  1.000000\n2025-05-02  0.773688  0.985970  0.916851\n\nTahap 3: Analisis TOPSIS\nLangkah 1: Menghitung Rata-Rata\nRata-rata dari data dipreprocessing:\nMSFT     0.643174\nGOOGL    0.651468\nMETA     0.722900\ndtype: float64\n\nLangkah 2: Menghitung Bobot Relatif\nProfil Risiko: Low Risk - Bobot berdasarkan stabilitas\nBobot yang digunakan:\nMSFT     0.123630\nGOOGL    0.099353\nMETA     0.110350\ndtype: float64\n\nLangkah 3: Menghitung Data yang Dibobotkan\nData yang sudah dibobotkan:\nMSFT     0.079516\nGOOGL    0.064726\nMETA     0.079772\ndtype: float64\n\nLangkah 4: Menentukan Solusi Ideal Positif dan Negatif\nSolusi Ideal Positif:\n0.0797717377555501\nSolusi Ideal Negatif:\n0.06472561449018745\n\nLangkah 5: Menghitung Jarak ke Solusi Ideal\nJarak ke Solusi Ideal Positif:\nMSFT     0.000256\nGOOGL    0.015046\nMETA     0.000000\ndtype: float64\nJarak ke Solusi Ideal Negatif:\nMSFT     0.014790\nGOOGL    0.000000\nMETA     0.015046\ndtype: float64\n\nLangkah 6: Menghitung Nilai Preferensi\nNilai Preferensi:\nMSFT     0.982985\nGOOGL    0.000000\nMETA     1.000000\ndtype: float64\n\nLangkah 7: Mengurutkan Hasil Analisis TOPSIS\nIndeks yang diurutkan berdasarkan nilai preferensi:\nMETA     2\nGOOGL    0\nMSFT     1\ndtype: int64\n\nHasil Analisis TOPSIS:\n      Ticker  Preference Value         Risk Profile\nMETA    META          1.000000  Low Risk Low Reward\nMSFT    MSFT          0.982985  Low Risk Low Reward\nGOOGL  GOOGL          0.000000  Low Risk Low Reward\nHasil TOPSIS:\n      Ticker  Preference Value         Risk Profile\nMETA    META          1.000000  Low Risk Low Reward\nMSFT    MSFT          0.982985  Low Risk Low Reward\nGOOGL  GOOGL          0.000000  Low Risk Low Reward\n', 'Balanced', NULL, NULL),
(34, 7, 'AAPL,MSFT,GOOGL', '2025-05-01', '2025-05-06', '[{\'Ticker\': \'MSFT\', \'Preference Value\': 1.0, \'Risk Profile\': \'Low Risk Low Reward\'}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.0, \'Risk Profile\': \'Low Risk Low Reward\'}]', '2025-05-11 12:46:06', 'Tahap 1: Pengumpulan Data\nData yang diambil:\n              AAPL    MSFT\ndate                      \n2025-05-06  198.51  433.31\n2025-05-05  198.89  436.17\n2025-05-02  205.35  435.28\n2025-05-01  213.32  425.40\n\nTahap 2: Preproses Data\nData yang telah dipreproses:\n                AAPL      MSFT\ndate                          \n2025-05-06  0.000000  0.734448\n2025-05-05  0.025658  1.000000\n2025-05-02  0.461850  0.917363\n2025-05-01  1.000000  0.000000\n\nTahap 3: Analisis TOPSIS\nLangkah 1: Menghitung Rata-Rata\nRata-rata dari data dipreprocessing:\nAAPL    0.371877\nMSFT    0.662953\ndtype: float64\n\nLangkah 2: Menghitung Bobot Relatif\nProfil Risiko: Low Risk - Bobot berdasarkan stabilitas\nBobot yang digunakan:\nAAPL    0.246314\nMSFT    0.253686\ndtype: float64\n\nLangkah 3: Menghitung Data yang Dibobotkan\nData yang sudah dibobotkan:\nAAPL    0.091598\nMSFT    0.168182\ndtype: float64\n\nLangkah 4: Menentukan Solusi Ideal Positif dan Negatif\nSolusi Ideal Positif:\n0.1681820389364948\nSolusi Ideal Negatif:\n0.09159840727082369\n\nLangkah 5: Menghitung Jarak ke Solusi Ideal\nJarak ke Solusi Ideal Positif:\nAAPL    0.076584\nMSFT    0.000000\ndtype: float64\nJarak ke Solusi Ideal Negatif:\nAAPL    0.000000\nMSFT    0.076584\ndtype: float64\n\nLangkah 6: Menghitung Nilai Preferensi\nNilai Preferensi:\nAAPL    0.0\nMSFT    1.0\ndtype: float64\n\nLangkah 7: Mengurutkan Hasil Analisis TOPSIS\nIndeks yang diurutkan berdasarkan nilai preferensi:\nMSFT    1\nAAPL    0\ndtype: int64\n\nHasil Analisis TOPSIS:\n     Ticker  Preference Value         Risk Profile\nMSFT   MSFT               1.0  Low Risk Low Reward\nAAPL   AAPL               0.0  Low Risk Low Reward\nHasil TOPSIS:\n     Ticker  Preference Value         Risk Profile\nMSFT   MSFT               1.0  Low Risk Low Reward\nAAPL   AAPL               0.0  Low Risk Low Reward\n', 'Balanced', NULL, NULL),
(35, 7, 'AAPL,MSFT,GOOGL', '2025-05-01', '2025-05-08', '[{\'Ticker\': \'MSFT\', \'Preference Value\': 0.6005570492239689, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.591535418477477, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.3799216446578306, \'Risk Profile\': \'High Risk High Reward\'}]', '2025-05-12 14:29:01', 'Tahap 1: Pengumpulan Data\nData Mentah yang Diperoleh:\n              AAPL    MSFT   GOOGL\ndate                              \n2025-05-08  197.49  438.17  154.28\n2025-05-07  196.25  433.35  151.38\n2025-05-06  198.51  433.31  163.23\n2025-05-05  198.89  436.17  164.21\n2025-05-02  205.35  435.28  164.03\n\nTahap 2: Preproses (Normalisasi Data)\n                AAPL      MSFT     GOOGL\ndate                                    \n2025-05-08  0.072642  1.000000  0.226033\n2025-05-07  0.000000  0.622553  0.000000\n2025-05-06  0.132396  0.619421  0.923617\n2025-05-05  0.154657  0.843383  1.000000\n2025-05-02  0.533099  0.773688  0.985970\n\nTahap 3: Analisis Metode TOPSIS\nLangkah 1: Normalisasi Data\n                AAPL      MSFT     GOOGL\ndate                                    \n2025-05-08  0.072642  1.000000  0.226033\n2025-05-07  0.000000  0.622553  0.000000\n2025-05-06  0.132396  0.619421  0.923617\n2025-05-05  0.154657  0.843383  1.000000\n2025-05-02  0.533099  0.773688  0.985970\n\nLangkah 2: Hitung Bobot berdasarkan Profil Risiko\nProfil Risiko: High Risk (Bobot Volatilitas)\nBobot yang digunakan: [0.39666341 0.26812658 0.33521001]\n\nLangkah 3: Hitung Matriks Ternormalisasi Tertimbang\n                AAPL      MSFT     GOOGL\ndate                                    \n2025-05-08  0.028814  0.268127  0.075768\n2025-05-07  0.000000  0.166923  0.000000\n2025-05-06  0.052517  0.166083  0.309606\n2025-05-05  0.061347  0.226133  0.335210\n2025-05-02  0.211461  0.207446  0.330507\n\nLangkah 4: Solusi Ideal Positif dan Negatif\nSolusi Ideal Positif: AAPL     0.396663\nMSFT     0.268127\nGOOGL    0.335210\ndtype: float64\nSolusi Ideal Negatif: AAPL     0.0\nMSFT     0.0\nGOOGL    0.0\ndtype: float64\n\nLangkah 5: Hitung Jarak ke Solusi Ideal\nJarak ke Positif: AAPL     0.746879\nMSFT     0.313037\nGOOGL    0.431432\ndtype: float64\nJarak ke Negatif: AAPL     0.457613\nMSFT     0.470647\nGOOGL    0.624797\ndtype: float64\n\nLangkah 6: Hitung Nilai Preferensi\nNilai Preferensi: AAPL     0.379922\nMSFT     0.600557\nGOOGL    0.591535\ndtype: float64\n\nLangkah 7: Urutkan Hasil\n\nHasil Akhir TOPSIS:\n      Ticker  Preference Value           Risk Profile\nMSFT    MSFT          0.600557  High Risk High Reward\nGOOGL  GOOGL          0.591535  High Risk High Reward\nAAPL    AAPL          0.379922  High Risk High Reward\n      Ticker  Preference Value           Risk Profile\nMSFT    MSFT          0.600557  High Risk High Reward\nGOOGL  GOOGL          0.591535  High Risk High Reward\nAAPL    AAPL          0.379922  High Risk High Reward\n', 'High Risk High Reward', '[{\'date\': Timestamp(\'2025-05-08 00:00:00\'), \'AAPL\': 197.49, \'MSFT\': 438.17, \'GOOGL\': 154.28}, {\'date\': Timestamp(\'2025-05-07 00:00:00\'), \'AAPL\': 196.25, \'MSFT\': 433.35, \'GOOGL\': 151.38}, {\'date\': Timestamp(\'2025-05-06 00:00:00\'), \'AAPL\': 198.51, \'MSFT\': 433.31, \'GOOGL\': 163.23}, {\'date\': Timestamp(\'2025-05-05 00:00:00\'), \'AAPL\': 198.89, \'MSFT\': 436.17, \'GOOGL\': 164.21}, {\'date\': Timestamp(\'2025-05-02 00:00:00\'), \'AAPL\': 205.35, \'MSFT\': 435.28, \'GOOGL\': 164.03}, {\'date\': Timestamp(\'2025-05-01 00:00:00\'), \'AAPL\': 213.32, \'MSFT\': 425.4, \'GOOGL\': 161.3}]', '[{\'date\': Timestamp(\'2025-05-08 00:00:00\'), \'AAPL\': 0.07264206209724719, \'MSFT\': 1.0, \'GOOGL\': 0.22603273577552632}, {\'date\': Timestamp(\'2025-05-07 00:00:00\'), \'AAPL\': 0.0, \'MSFT\': 0.6225528582615522, \'GOOGL\': 0.0}, {\'date\': Timestamp(\'2025-05-06 00:00:00\'), \'AAPL\': 0.1323960164030458, \'MSFT\': 0.6194205168363353, \'GOOGL\': 0.9236165237724071}, {\'date\': Timestamp(\'2025-05-05 00:00:00\'), \'AAPL\': 0.15465729349736307, \'MSFT\': 0.843382928739233, \'GOOGL\': 1.0}, {\'date\': Timestamp(\'2025-05-02 00:00:00\'), \'AAPL\': 0.5330990041007615, \'MSFT\': 0.7736883320281884, \'GOOGL\': 0.9859703819173806}, {\'date\': Timestamp(\'2025-05-01 00:00:00\'), \'AAPL\': 1.0, \'MSFT\': 0.0, \'GOOGL\': 0.7731878409976622}]'),
(36, 7, 'AAPL,MSFT,GOOGL', '2025-05-01', '2025-05-08', '[{\'Ticker\': \'MSFT\', \'Preference Value\': 0.6005570492239689, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'GOOGL\', \'Preference Value\': 0.591535418477477, \'Risk Profile\': \'High Risk High Reward\'}, {\'Ticker\': \'AAPL\', \'Preference Value\': 0.3799216446578306, \'Risk Profile\': \'High Risk High Reward\'}]', '2025-05-12 14:39:12', 'Tahap 1: Pengumpulan Data\nData Mentah yang Diperoleh:\n              AAPL    MSFT   GOOGL\ndate                              \n2025-05-08  197.49  438.17  154.28\n2025-05-07  196.25  433.35  151.38\n2025-05-06  198.51  433.31  163.23\n2025-05-05  198.89  436.17  164.21\n2025-05-02  205.35  435.28  164.03\n\nTahap 2: Preproses (Normalisasi Data)\n                AAPL      MSFT     GOOGL\ndate                                    \n2025-05-08  0.072642  1.000000  0.226033\n2025-05-07  0.000000  0.622553  0.000000\n2025-05-06  0.132396  0.619421  0.923617\n2025-05-05  0.154657  0.843383  1.000000\n2025-05-02  0.533099  0.773688  0.985970\n\nTahap 3: Analisis Metode TOPSIS\nLangkah 1: Normalisasi Data\n                AAPL      MSFT     GOOGL\ndate                                    \n2025-05-08  0.072642  1.000000  0.226033\n2025-05-07  0.000000  0.622553  0.000000\n2025-05-06  0.132396  0.619421  0.923617\n2025-05-05  0.154657  0.843383  1.000000\n2025-05-02  0.533099  0.773688  0.985970\n\nLangkah 2: Hitung Bobot berdasarkan Profil Risiko\nProfil Risiko: High Risk (Bobot Volatilitas)\nBobot yang digunakan: [0.39666341 0.26812658 0.33521001]\n\nLangkah 3: Hitung Matriks Ternormalisasi Tertimbang\n                AAPL      MSFT     GOOGL\ndate                                    \n2025-05-08  0.028814  0.268127  0.075768\n2025-05-07  0.000000  0.166923  0.000000\n2025-05-06  0.052517  0.166083  0.309606\n2025-05-05  0.061347  0.226133  0.335210\n2025-05-02  0.211461  0.207446  0.330507\n\nLangkah 4: Solusi Ideal Positif dan Negatif\nSolusi Ideal Positif: AAPL     0.396663\nMSFT     0.268127\nGOOGL    0.335210\ndtype: float64\nSolusi Ideal Negatif: AAPL     0.0\nMSFT     0.0\nGOOGL    0.0\ndtype: float64\n\nLangkah 5: Hitung Jarak ke Solusi Ideal\nJarak ke Positif: AAPL     0.746879\nMSFT     0.313037\nGOOGL    0.431432\ndtype: float64\nJarak ke Negatif: AAPL     0.457613\nMSFT     0.470647\nGOOGL    0.624797\ndtype: float64\n\nLangkah 6: Hitung Nilai Preferensi\nNilai Preferensi: AAPL     0.379922\nMSFT     0.600557\nGOOGL    0.591535\ndtype: float64\n\nLangkah 7: Urutkan Hasil\n\nHasil Akhir TOPSIS:\n      Ticker  Preference Value           Risk Profile\nMSFT    MSFT          0.600557  High Risk High Reward\nGOOGL  GOOGL          0.591535  High Risk High Reward\nAAPL    AAPL          0.379922  High Risk High Reward\n      Ticker  Preference Value           Risk Profile\nMSFT    MSFT          0.600557  High Risk High Reward\nGOOGL  GOOGL          0.591535  High Risk High Reward\nAAPL    AAPL          0.379922  High Risk High Reward\n', 'High Risk High Reward', '[{\'date\': Timestamp(\'2025-05-08 00:00:00\'), \'AAPL\': 197.49, \'MSFT\': 438.17, \'GOOGL\': 154.28}, {\'date\': Timestamp(\'2025-05-07 00:00:00\'), \'AAPL\': 196.25, \'MSFT\': 433.35, \'GOOGL\': 151.38}, {\'date\': Timestamp(\'2025-05-06 00:00:00\'), \'AAPL\': 198.51, \'MSFT\': 433.31, \'GOOGL\': 163.23}, {\'date\': Timestamp(\'2025-05-05 00:00:00\'), \'AAPL\': 198.89, \'MSFT\': 436.17, \'GOOGL\': 164.21}, {\'date\': Timestamp(\'2025-05-02 00:00:00\'), \'AAPL\': 205.35, \'MSFT\': 435.28, \'GOOGL\': 164.03}, {\'date\': Timestamp(\'2025-05-01 00:00:00\'), \'AAPL\': 213.32, \'MSFT\': 425.4, \'GOOGL\': 161.3}]', '[{\'date\': Timestamp(\'2025-05-08 00:00:00\'), \'AAPL\': 0.07264206209724719, \'MSFT\': 1.0, \'GOOGL\': 0.22603273577552632}, {\'date\': Timestamp(\'2025-05-07 00:00:00\'), \'AAPL\': 0.0, \'MSFT\': 0.6225528582615522, \'GOOGL\': 0.0}, {\'date\': Timestamp(\'2025-05-06 00:00:00\'), \'AAPL\': 0.1323960164030458, \'MSFT\': 0.6194205168363353, \'GOOGL\': 0.9236165237724071}, {\'date\': Timestamp(\'2025-05-05 00:00:00\'), \'AAPL\': 0.15465729349736307, \'MSFT\': 0.843382928739233, \'GOOGL\': 1.0}, {\'date\': Timestamp(\'2025-05-02 00:00:00\'), \'AAPL\': 0.5330990041007615, \'MSFT\': 0.7736883320281884, \'GOOGL\': 0.9859703819173806}, {\'date\': Timestamp(\'2025-05-01 00:00:00\'), \'AAPL\': 1.0, \'MSFT\': 0.0, \'GOOGL\': 0.7731878409976622}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email_notifications` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `created_at`, `email_notifications`) VALUES
(1, 'kris', 'kris@gmail.com', 'scrypt:32768:8:1$qfRtOaHT6oV0KkXz$a69efb545e3e2148bbc89e83b3ddc0f852c76ad30dce7c2b5a57e7df1a5a5f07da57982a0b7fb17be1b3445e97003ab2163d1d0a2dc1287aded79337d13d361a', '2024-06-09 16:54:35', 0),
(2, 'vin', 'vin@gmail.com', 'scrypt:32768:8:1$FTXLdlzxpZ0Q2Szm$673d5a5602b8b1c95f2ded13f055f3e6569d99fb4aa6fd60f663f218e0322ed9d6805c71e7be1e63140a4d3340bebc8f014b28c6e982aaab6c4799e31d4b84e6', '2024-06-09 16:59:59', 0),
(3, 'adriyan', 'adriyan@gmail.com', 'scrypt:32768:8:1$tiYbJzNqkDbUU7R6$f39ce9eb63b70ab3c412bc4f34b6d2942b9996637b55ef4d9677d947c7b0e8833f5609e7fe414ed013cccfab5d849385728ee0d69bf092dc78f337f8ef5a7cf6', '2024-06-30 04:26:21', 0),
(4, 'tian', 'penasehatkaisar@gmail.com', 'scrypt:32768:8:1$zYHz6rGBUUnykrJe$49fae0d8863c7157fdf2f9113121956b82978feb2b80e1a224dffd37ffbf2144244813c5c7b1094cf9afa6370bb35a7e4e75fe7d7f0e10a35f301f33322d0d65', '2024-10-14 07:36:40', 1),
(5, 'supardi', 'supardi9861@gmail.com', 'scrypt:32768:8:1$IciDWNlDebfdFnGV$66d7a59bb4b6f2ba2b1b675949ce739ba34de8a94b5c07302135c60b43d6fce5ace4f911ff810bc5a27a673546e06c2a20cd276758a668433629fc4db69608ce', '2024-10-26 07:49:29', 0),
(6, 'gunawan', 'gunawan123@gmail.com', 'scrypt:32768:8:1$sGRyX4WPwqCSxmcx$c3409f52b23f6f4eba7f28507d8fd436564eeeb5f44d2f7885d587c2c1d6ffb3d712aac6cd697504eaf671accbb686f87fe17c51b8266753ed85c793c541bdf3', '2024-12-20 16:03:18', 1),
(7, 'julpan', 'julpan@gmail.com', 'scrypt:32768:8:1$Do7ILLdS1ULi9IeY$d46ff1c1d6f26dd3537ca4216b02319d8b461973cf1ba4304b7bc8a0d3e131e5139ed9b7a28c50bd12b8169872a3fcea5a6558a1a27b22870258ed442d4d5049', '2025-05-09 06:20:16', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_logs`
--

INSERT INTO `user_logs` (`id`, `user_id`, `activity`, `timestamp`) VALUES
(1, 2, 'Accessed home', '2024-06-09 10:03:38'),
(2, 2, 'Accessed analysis', '2024-06-09 10:04:22'),
(3, 2, 'Accessed analysis', '2024-06-09 10:06:15'),
(4, 2, 'Accessed recommendation', '2024-06-09 10:06:20'),
(5, 2, 'Accessed home', '2024-06-14 08:09:24'),
(6, 2, 'Accessed analysis', '2024-06-14 08:09:30'),
(7, 2, 'Accessed analysis', '2024-06-14 08:09:47'),
(8, 2, 'Accessed recommendation', '2024-06-14 08:09:57'),
(9, 2, 'Accessed setting', '2024-06-14 08:10:29'),
(10, 2, 'Accessed logout', '2024-06-14 08:10:44'),
(11, 2, 'Accessed home', '2024-06-14 18:50:35'),
(12, 2, 'Accessed home', '2024-06-14 18:55:26'),
(13, 2, 'Accessed analysis', '2024-06-14 18:55:29'),
(14, 2, 'Accessed analysis', '2024-06-14 18:55:42'),
(15, 2, 'Accessed recommendation', '2024-06-14 18:55:49'),
(16, 2, 'Accessed analysis', '2024-06-14 18:55:58'),
(17, 2, 'Accessed analysis', '2024-06-14 18:56:03'),
(18, 2, 'Accessed recommendation', '2024-06-14 18:56:04'),
(19, 1, 'Accessed home', '2024-06-14 19:26:55'),
(20, 1, 'Accessed analysis', '2024-06-14 19:26:59'),
(21, 1, 'Accessed analysis', '2024-06-14 19:27:15'),
(22, 1, 'Accessed recommendation', '2024-06-14 19:27:19'),
(23, 1, 'Accessed home', '2024-06-14 19:32:21'),
(24, 1, 'Accessed home', '2024-06-14 19:32:40'),
(25, 3, 'Accessed home', '2024-06-29 21:26:42'),
(26, 3, 'Accessed analysis', '2024-06-29 21:26:50'),
(27, 3, 'Accessed analysis', '2024-06-29 21:27:33'),
(28, 3, 'Accessed recommendation', '2024-06-29 21:27:45'),
(29, 3, 'Accessed setting', '2024-06-29 21:29:22'),
(30, 4, 'Accessed home', '2024-10-14 00:36:52'),
(31, 4, 'Accessed analysis', '2024-10-14 00:36:58'),
(32, 4, 'Accessed analysis', '2024-10-14 00:37:21'),
(33, 4, 'Accessed analysis', '2024-10-14 00:37:25'),
(34, 4, 'Accessed analysis', '2024-10-14 00:40:04'),
(35, 4, 'Accessed recommendation', '2024-10-14 00:40:08'),
(36, 4, 'Accessed setting', '2024-10-14 00:41:05'),
(37, 4, 'Accessed home', '2024-10-14 00:41:25'),
(38, 4, 'Accessed recommendation', '2024-10-14 00:41:54'),
(39, 4, 'Accessed home', '2024-10-14 00:43:36'),
(40, 4, 'Accessed home', '2024-10-14 01:28:04'),
(41, 4, 'Accessed analysis', '2024-10-14 01:28:31'),
(42, 4, 'Accessed home', '2024-10-14 01:29:18'),
(43, 4, 'Accessed analysis', '2024-10-14 01:29:26'),
(44, 4, 'Accessed analysis', '2024-10-14 01:29:43'),
(45, 4, 'Accessed recommendation', '2024-10-14 01:29:47'),
(46, 4, 'Accessed home', '2024-10-14 01:29:58'),
(47, 4, 'Accessed home', '2024-10-14 01:30:57'),
(48, 4, 'Accessed home', '2024-10-14 01:33:12'),
(49, 4, 'Accessed setting', '2024-10-14 01:34:26'),
(50, 4, 'Accessed analysis', '2024-10-14 01:45:38'),
(51, 4, 'Accessed analysis', '2024-10-14 01:45:50'),
(52, 4, 'Accessed recommendation', '2024-10-14 01:45:51'),
(53, 4, 'Accessed setting', '2024-10-14 01:45:56'),
(54, 4, 'Accessed setting', '2024-10-14 01:46:12'),
(55, 4, 'Accessed recommendation', '2024-10-14 01:51:55'),
(56, 4, 'Accessed analysis', '2024-10-14 01:59:14'),
(57, 4, 'Accessed home', '2024-10-14 01:59:18'),
(58, 4, 'Accessed home', '2024-10-14 01:59:42'),
(59, 4, 'Accessed setting', '2024-10-14 01:59:46'),
(60, 4, 'Accessed home', '2024-10-14 02:00:15'),
(61, 4, 'Accessed analysis', '2024-10-14 02:00:17'),
(62, 4, 'Accessed analysis', '2024-10-14 02:00:24'),
(63, 4, 'Accessed recommendation', '2024-10-14 02:00:25'),
(64, 4, 'Accessed analysis', '2024-10-14 02:00:29'),
(65, 4, 'Accessed analysis', '2024-10-14 02:01:12'),
(66, 4, 'Accessed recommendation', '2024-10-14 02:01:12'),
(67, 4, 'Accessed recommendation', '2024-10-14 02:02:48'),
(68, 4, 'Accessed recommendation', '2024-10-14 02:06:18'),
(69, 4, 'Accessed analysis', '2024-10-14 02:10:08'),
(70, 4, 'Accessed recommendation', '2024-10-14 02:10:09'),
(71, 4, 'Accessed analysis', '2024-10-14 02:10:11'),
(72, 4, 'Accessed recommendation', '2024-10-14 02:10:13'),
(73, 4, 'Accessed recommendation', '2024-10-14 02:11:42'),
(74, 4, 'Accessed recommendation', '2024-10-14 02:15:37'),
(75, 4, 'Accessed recommendation', '2024-10-14 02:30:11'),
(76, 4, 'Accessed output', '2024-10-14 02:30:16'),
(77, 4, 'Accessed recommendation', '2024-10-14 02:30:21'),
(78, 4, 'Accessed output', '2024-10-14 02:30:24'),
(79, 4, 'Accessed analysis', '2024-10-14 02:30:45'),
(80, 4, 'Accessed analysis', '2024-10-14 02:30:54'),
(81, 4, 'Accessed analysis', '2024-10-14 02:30:57'),
(82, 4, 'Accessed recommendation', '2024-10-14 02:30:57'),
(83, 4, 'Accessed output', '2024-10-14 02:31:00'),
(84, 4, 'Accessed recommendation', '2024-10-14 02:31:01'),
(85, 4, 'Accessed recommendation', '2024-10-14 02:33:30'),
(86, 4, 'Accessed recommendation', '2024-10-14 02:35:19'),
(87, 4, 'Accessed analysis', '2024-10-14 02:35:28'),
(88, 4, 'Accessed recommendation', '2024-10-14 02:35:31'),
(89, 4, 'Accessed analysis', '2024-10-14 02:35:33'),
(90, 4, 'Accessed recommendation', '2024-10-14 02:35:35'),
(91, 4, 'Accessed analysis', '2024-10-14 02:35:37'),
(92, 4, 'Accessed recommendation', '2024-10-14 02:35:41'),
(93, 4, 'Accessed analysis', '2024-10-14 02:35:42'),
(94, 4, 'Accessed home', '2024-10-14 02:35:45'),
(95, 4, 'Accessed analysis', '2024-10-14 02:35:46'),
(96, 4, 'Accessed recommendation', '2024-10-14 02:35:46'),
(97, 4, 'Accessed setting', '2024-10-14 02:35:47'),
(98, 4, 'Accessed analysis', '2024-10-14 02:35:48'),
(99, 4, 'Accessed analysis', '2024-10-14 02:39:16'),
(100, 5, 'Accessed home', '2024-10-26 00:50:41'),
(101, 5, 'Accessed analysis', '2024-10-26 00:51:11'),
(102, 5, 'Accessed analysis', '2024-10-26 00:52:28'),
(103, 5, 'Accessed recommendation', '2024-10-26 00:52:33'),
(104, 5, 'Accessed recommendation', '2024-10-26 01:11:14'),
(105, 5, 'Accessed analysis', '2024-10-26 01:11:19'),
(106, 5, 'Accessed analysis', '2024-10-26 01:11:45'),
(107, 5, 'Accessed recommendation', '2024-10-26 01:11:46'),
(108, 5, 'Accessed analysis', '2024-10-26 01:13:52'),
(109, 5, 'Accessed analysis', '2024-10-26 01:14:14'),
(110, 5, 'Accessed recommendation', '2024-10-26 01:14:15'),
(111, 5, 'Accessed analysis', '2024-10-26 01:14:20'),
(112, 5, 'Accessed analysis', '2024-10-26 01:14:30'),
(113, 5, 'Accessed recommendation', '2024-10-26 01:14:31'),
(114, 5, 'Accessed analysis', '2024-10-26 01:14:35'),
(115, 5, 'Accessed analysis', '2024-10-26 01:14:41'),
(116, 5, 'Accessed recommendation', '2024-10-26 01:14:42'),
(117, 5, 'Accessed analysis', '2024-10-26 01:14:45'),
(118, 5, 'Accessed analysis', '2024-10-26 01:14:47'),
(119, 5, 'Accessed recommendation', '2024-10-26 01:14:47'),
(120, 5, 'Accessed analysis', '2024-10-26 01:15:06'),
(121, 5, 'Accessed recommendation', '2024-10-26 01:15:07'),
(122, 4, 'Accessed home', '2024-12-12 00:30:59'),
(123, 4, 'Accessed analysis', '2024-12-12 00:31:10'),
(124, 4, 'Accessed analysis', '2024-12-12 00:31:39'),
(125, 4, 'Accessed recommendation', '2024-12-12 00:31:48'),
(126, 4, 'Accessed output', '2024-12-12 00:32:03'),
(127, 4, 'Accessed recommendation', '2024-12-12 00:32:09'),
(128, 4, 'Accessed output', '2024-12-12 00:32:15'),
(129, 4, 'Accessed recommendation', '2024-12-12 00:32:25'),
(130, 4, 'Accessed output', '2024-12-12 00:32:29'),
(131, 4, 'Accessed recommendation', '2024-12-12 00:32:30'),
(132, 4, 'Accessed about', '2024-12-12 00:32:33'),
(133, 4, 'Accessed about', '2024-12-12 00:35:55'),
(134, 4, 'Accessed output', '2024-12-12 00:36:00'),
(135, 4, 'Accessed recommendation', '2024-12-12 00:36:03'),
(136, 4, 'Accessed output', '2024-12-12 00:36:10'),
(137, 4, 'Accessed analysis', '2024-12-12 00:37:10'),
(138, 4, 'Accessed recommendation', '2024-12-12 00:37:12'),
(139, 4, 'Accessed output', '2024-12-12 00:37:14'),
(140, 4, 'Accessed recommendation', '2024-12-12 00:37:16'),
(141, 4, 'Accessed recommendation', '2024-12-12 00:37:54'),
(142, 4, 'Accessed output', '2024-12-12 00:38:03'),
(143, 4, 'Accessed recommendation', '2024-12-12 00:38:07'),
(144, 4, 'Accessed analysis', '2024-12-12 00:38:15'),
(145, 4, 'Accessed recommendation', '2024-12-12 00:38:18'),
(146, 4, 'Accessed analysis', '2024-12-12 00:38:20'),
(147, 4, 'Accessed home', '2024-12-12 00:38:29'),
(148, 4, 'Accessed analysis', '2024-12-12 00:38:52'),
(149, 4, 'Accessed analysis', '2024-12-12 00:39:10'),
(150, 4, 'Accessed recommendation', '2024-12-12 00:39:13'),
(151, 4, 'Accessed output', '2024-12-12 00:39:18'),
(152, 4, 'Accessed about', '2024-12-12 00:39:25'),
(153, 4, 'Accessed setting', '2024-12-12 00:39:31'),
(154, 4, 'Accessed home', '2024-12-15 21:20:17'),
(155, 4, 'Accessed setting', '2024-12-15 21:20:22'),
(156, 4, 'Accessed setting', '2024-12-15 21:21:56'),
(157, 4, 'Updated account settings', '2024-12-15 21:21:56'),
(158, 4, 'Accessed setting', '2024-12-15 21:21:56'),
(159, 4, 'Accessed about', '2024-12-15 21:22:05'),
(160, 4, 'Accessed output', '2024-12-15 21:22:10'),
(161, 4, 'Accessed analysis', '2024-12-15 21:22:23'),
(162, 4, 'Accessed home', '2024-12-15 21:22:26'),
(163, 4, 'Accessed analysis', '2024-12-15 21:22:28'),
(164, 4, 'Accessed home', '2024-12-15 21:22:33'),
(165, 4, 'Accessed home', '2024-12-15 21:24:46'),
(166, 4, 'Accessed analysis', '2024-12-15 21:25:06'),
(167, 4, 'Accessed analysis', '2024-12-15 21:35:26'),
(168, 4, 'Accessed analysis', '2024-12-15 21:36:03'),
(169, 4, 'Accessed analysis', '2024-12-15 21:36:15'),
(170, 4, 'Accessed analysis', '2024-12-15 21:44:19'),
(171, 4, 'Accessed analysis', '2024-12-15 21:44:31'),
(172, 4, 'Accessed recommendation', '2024-12-15 21:44:33'),
(173, 4, 'Accessed output', '2024-12-15 21:44:39'),
(174, 4, 'Accessed recommendation', '2024-12-15 21:44:50'),
(175, 4, 'Accessed analysis', '2024-12-15 21:44:52'),
(176, 4, 'Accessed analysis', '2024-12-15 21:45:04'),
(177, 4, 'Accessed recommendation', '2024-12-15 21:45:04'),
(178, 4, 'Accessed output', '2024-12-15 21:45:11'),
(179, 4, 'Accessed recommendation', '2024-12-15 21:45:23'),
(180, 4, 'Accessed output', '2024-12-15 21:45:38'),
(181, 4, 'Accessed recommendation', '2024-12-15 21:46:41'),
(182, 4, 'Accessed output', '2024-12-15 21:46:52'),
(183, 4, 'Accessed recommendation', '2024-12-15 21:58:30'),
(184, 4, 'Accessed analysis', '2024-12-15 22:05:57'),
(185, 4, 'Accessed analysis', '2024-12-15 22:06:09'),
(186, 4, 'Accessed recommendation', '2024-12-15 22:06:10'),
(187, 4, 'Accessed home', '2024-12-18 01:47:30'),
(188, 4, 'Accessed analysis', '2024-12-18 01:47:34'),
(189, 4, 'Accessed analysis', '2024-12-18 01:48:46'),
(190, 4, 'Accessed recommendation', '2024-12-18 01:48:52'),
(191, 4, 'Accessed analysis', '2024-12-18 01:48:59'),
(192, 4, 'Accessed analysis', '2024-12-18 01:49:03'),
(193, 4, 'Accessed recommendation', '2024-12-18 01:49:04'),
(194, 4, 'Accessed output', '2024-12-18 01:49:52'),
(195, 4, 'Accessed about', '2024-12-18 01:50:40'),
(196, 4, 'Accessed setting', '2024-12-18 01:53:46'),
(197, 4, 'Accessed home', '2024-12-20 08:52:32'),
(198, 4, 'Accessed logout', '2024-12-20 08:53:12'),
(199, 6, 'Accessed home', '2024-12-20 09:04:13'),
(200, 6, 'Accessed analysis', '2024-12-20 09:05:17'),
(201, 6, 'Accessed analysis', '2024-12-20 09:07:02'),
(202, 6, 'Accessed recommendation', '2024-12-20 09:07:07'),
(203, 6, 'Accessed analysis', '2024-12-20 09:07:11'),
(204, 6, 'Accessed analysis', '2024-12-20 09:07:35'),
(205, 6, 'Accessed recommendation', '2024-12-20 09:07:35'),
(206, 6, 'Accessed analysis', '2024-12-20 09:08:23'),
(207, 6, 'Accessed output', '2024-12-20 09:08:32'),
(208, 6, 'Accessed about', '2024-12-20 09:14:33'),
(209, 6, 'Accessed setting', '2024-12-20 09:15:29'),
(210, 6, 'Accessed setting', '2024-12-20 09:18:33'),
(211, 6, 'Updated account settings', '2024-12-20 09:18:33'),
(212, 6, 'Accessed setting', '2024-12-20 09:18:33'),
(213, 4, 'Accessed home', '2025-05-08 22:29:30'),
(214, 4, 'Accessed recommendation', '2025-05-08 22:29:35'),
(215, 4, 'Accessed analysis', '2025-05-08 22:29:48'),
(216, 4, 'Accessed analysis', '2025-05-08 22:30:13'),
(217, 4, 'Accessed analysis', '2025-05-08 22:30:15'),
(218, 4, 'Accessed analysis', '2025-05-08 22:30:35'),
(219, 4, 'Accessed analysis', '2025-05-08 22:30:37'),
(220, 4, 'Accessed analysis', '2025-05-08 22:30:58'),
(221, 4, 'Accessed analysis', '2025-05-08 22:31:00'),
(222, 4, 'Accessed analysis', '2025-05-08 22:31:29'),
(223, 4, 'Accessed analysis', '2025-05-08 22:31:31'),
(224, 4, 'Accessed output', '2025-05-08 22:31:34'),
(225, 4, 'Accessed recommendation', '2025-05-08 22:31:37'),
(226, 4, 'Accessed analysis', '2025-05-08 22:31:39'),
(227, 4, 'Accessed analysis', '2025-05-08 22:31:40'),
(228, 4, 'Accessed setting', '2025-05-08 22:34:08'),
(229, 4, 'Accessed about', '2025-05-08 22:34:12'),
(230, 4, 'Accessed output', '2025-05-08 22:34:25'),
(231, 4, 'Accessed recommendation', '2025-05-08 22:34:29'),
(232, 4, 'Accessed analysis', '2025-05-08 22:34:31'),
(233, 4, 'Accessed logout', '2025-05-08 22:35:53'),
(234, 4, 'Accessed home', '2025-05-08 22:36:05'),
(235, 4, 'Accessed analysis', '2025-05-08 22:36:08'),
(236, 4, 'Accessed analysis', '2025-05-08 22:36:31'),
(237, 4, 'Accessed analysis', '2025-05-08 22:36:36'),
(238, 4, 'Accessed analysis', '2025-05-08 22:43:08'),
(239, 4, 'Accessed analysis', '2025-05-08 22:43:30'),
(240, 4, 'Accessed analysis', '2025-05-08 22:43:33'),
(241, 4, 'Accessed analysis', '2025-05-08 22:53:43'),
(242, 4, 'Accessed analysis', '2025-05-08 22:54:03'),
(243, 4, 'Accessed analysis', '2025-05-08 22:54:08'),
(244, 7, 'Accessed home', '2025-05-08 23:20:27'),
(245, 7, 'Accessed analysis', '2025-05-08 23:20:32'),
(246, 7, 'Accessed analysis', '2025-05-08 23:21:09'),
(247, 7, 'Accessed analysis', '2025-05-08 23:21:19'),
(248, 7, 'Accessed analysis', '2025-05-08 23:34:29'),
(249, 7, 'Accessed analysis', '2025-05-08 23:35:05'),
(250, 7, 'Accessed analysis', '2025-05-08 23:35:09'),
(251, 7, 'Accessed analysis', '2025-05-08 23:51:35'),
(252, 7, 'Accessed analysis', '2025-05-08 23:52:02'),
(253, 7, 'Accessed analysis', '2025-05-08 23:52:06'),
(254, 7, 'Accessed analysis', '2025-05-08 23:52:59'),
(255, 7, 'Accessed analysis', '2025-05-08 23:53:03'),
(256, 7, 'Accessed analysis', '2025-05-09 00:04:32'),
(257, 7, 'Accessed analysis', '2025-05-09 00:05:01'),
(258, 7, 'Accessed analysis', '2025-05-09 00:05:05'),
(259, 7, 'Accessed analysis', '2025-05-09 00:05:36'),
(260, 7, 'Accessed analysis', '2025-05-09 00:05:39'),
(261, 7, 'Accessed home', '2025-05-10 19:59:20'),
(262, 7, 'Accessed analysis', '2025-05-10 19:59:22'),
(263, 7, 'Accessed analysis', '2025-05-10 19:59:36'),
(264, 7, 'Accessed analysis', '2025-05-10 19:59:40'),
(265, 7, 'Accessed analysis', '2025-05-10 20:04:13'),
(266, 7, 'Accessed analysis', '2025-05-10 20:04:25'),
(267, 7, 'Accessed recommendation', '2025-05-10 20:05:37'),
(268, 7, 'Accessed output', '2025-05-10 20:07:40'),
(269, 7, 'Accessed recommendation', '2025-05-10 20:09:09'),
(270, 7, 'Accessed analysis', '2025-05-10 20:13:39'),
(271, 7, 'Accessed home', '2025-05-10 22:55:10'),
(272, 7, 'Accessed analysis', '2025-05-10 22:55:13'),
(273, 7, 'Accessed analysis', '2025-05-10 22:55:31'),
(274, 7, 'Accessed recommendation', '2025-05-10 22:56:18'),
(275, 7, 'Accessed output', '2025-05-10 22:59:01'),
(276, 7, 'Accessed analysis', '2025-05-10 23:06:11'),
(277, 7, 'Accessed analysis', '2025-05-10 23:06:41'),
(278, 7, 'Accessed recommendation', '2025-05-10 23:07:26'),
(279, 7, 'Accessed output', '2025-05-10 23:09:16'),
(280, 7, 'Accessed analysis', '2025-05-10 23:23:53'),
(281, 7, 'Accessed analysis', '2025-05-10 23:24:24'),
(282, 7, 'Accessed recommendation', '2025-05-10 23:25:10'),
(283, 7, 'Accessed home', '2025-05-11 05:45:10'),
(284, 7, 'Accessed analysis', '2025-05-11 05:45:12'),
(285, 7, 'Accessed analysis', '2025-05-11 05:45:35'),
(286, 7, 'Accessed recommendation', '2025-05-11 05:46:06'),
(287, 7, 'Accessed analysis', '2025-05-11 06:00:14'),
(288, 7, 'Accessed analysis', '2025-05-11 06:00:45'),
(289, 7, 'Accessed analysis', '2025-05-11 06:00:48'),
(290, 7, 'Accessed analysis', '2025-05-11 06:05:33'),
(291, 7, 'Accessed analysis', '2025-05-11 06:05:35'),
(292, 7, 'Accessed home', '2025-05-11 20:07:43'),
(293, 7, 'Accessed recommendation', '2025-05-11 20:07:48'),
(294, 7, 'Accessed analysis', '2025-05-11 20:07:51'),
(295, 7, 'Accessed analysis', '2025-05-11 20:08:10'),
(296, 7, 'Accessed analysis', '2025-05-11 20:08:12'),
(297, 7, 'Accessed home', '2025-05-11 20:49:50'),
(298, 7, 'Accessed home', '2025-05-11 20:50:28'),
(299, 7, 'Accessed home', '2025-05-11 20:52:51'),
(300, 7, 'Accessed analysis', '2025-05-11 20:53:13'),
(301, 7, 'Accessed home', '2025-05-11 20:53:27'),
(302, 7, 'Accessed about', '2025-05-11 20:53:29'),
(303, 7, 'Accessed setting', '2025-05-11 20:53:37'),
(304, 7, 'Accessed output', '2025-05-11 20:53:58'),
(305, 7, 'Accessed recommendation', '2025-05-11 20:54:13'),
(306, 7, 'Accessed home', '2025-05-11 20:55:08'),
(307, 7, 'Accessed logout', '2025-05-11 20:55:14'),
(308, 7, 'Accessed home', '2025-05-11 21:01:52'),
(309, 7, 'Accessed analysis', '2025-05-11 21:01:57'),
(310, 7, 'Accessed output', '2025-05-11 21:02:02'),
(311, 7, 'Accessed home', '2025-05-12 02:49:21'),
(312, 7, 'Accessed analysis', '2025-05-12 02:49:35'),
(313, 7, 'Accessed recommendation', '2025-05-12 02:49:52'),
(314, 7, 'Accessed None', '2025-05-12 02:49:52'),
(315, 7, 'Accessed output', '2025-05-12 02:49:58'),
(316, 7, 'Accessed home', '2025-05-12 02:52:07'),
(317, 7, 'Accessed home', '2025-05-12 03:12:36'),
(318, 7, 'Accessed login', '2025-05-12 03:12:45'),
(319, 7, 'Accessed logout', '2025-05-12 03:12:52'),
(320, 7, 'Accessed home', '2025-05-12 03:14:19'),
(321, 7, 'Accessed home', '2025-05-12 07:09:00'),
(322, 7, 'Accessed register', '2025-05-12 07:09:05'),
(323, 7, 'Accessed login', '2025-05-12 07:09:40'),
(324, 7, 'Accessed home', '2025-05-12 07:09:40'),
(325, 7, 'Accessed setting', '2025-05-12 07:09:41'),
(326, 7, 'Accessed home', '2025-05-12 07:09:49'),
(327, 7, 'Accessed analysis', '2025-05-12 07:09:51'),
(328, 7, 'Accessed home', '2025-05-12 07:09:53'),
(329, 7, 'Accessed analysis', '2025-05-12 07:09:57'),
(330, 7, 'Accessed output', '2025-05-12 07:10:00'),
(331, 7, 'Accessed about', '2025-05-12 07:10:03'),
(332, 7, 'Accessed logout', '2025-05-12 07:10:32'),
(333, 7, 'Accessed home', '2025-05-12 07:27:15'),
(334, 7, 'Accessed analysis', '2025-05-12 07:27:18'),
(335, 7, 'Accessed analysis', '2025-05-12 07:28:17'),
(336, 7, 'Accessed recommendation', '2025-05-12 07:29:01'),
(337, 7, 'Accessed None', '2025-05-12 07:29:01'),
(338, 7, 'Accessed analysis', '2025-05-12 07:37:32'),
(339, 7, 'Accessed analysis', '2025-05-12 07:37:51'),
(340, 7, 'Accessed recommendation', '2025-05-12 07:39:13'),
(341, 7, 'Accessed analysis', '2025-05-12 07:51:52'),
(342, 7, 'Accessed analysis', '2025-05-12 07:51:56'),
(343, 7, 'Accessed home', '2025-05-15 20:48:03'),
(344, 7, 'Accessed analysis', '2025-05-15 20:48:16'),
(345, 7, 'Accessed analysis', '2025-05-15 20:48:32');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `analysis_results`
--
ALTER TABLE `analysis_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `analysis_results`
--
ALTER TABLE `analysis_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `analysis_results`
--
ALTER TABLE `analysis_results`
  ADD CONSTRAINT `analysis_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2022 at 07:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musicando`
--

-- --------------------------------------------------------

--
-- Table structure for table `albumes`
--

CREATE TABLE `albumes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `albumes`
--

INSERT INTO `albumes` (`id`, `nombre`, `duracion`) VALUES
(1, 'Confesiones de Infierno', 2400),
(2, 'Kind of Blue', 3300);

-- --------------------------------------------------------

--
-- Table structure for table `artistas`
--

CREATE TABLE `artistas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artistas`
--

INSERT INTO `artistas` (`id`, `nombre`, `apellido`) VALUES
(1, 'Charly', 'García'),
(2, 'Miles', 'Davis');

-- --------------------------------------------------------

--
-- Table structure for table `canciones`
--

CREATE TABLE `canciones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `genero_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `artista_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `canciones`
--

INSERT INTO `canciones` (`id`, `titulo`, `duracion`, `created_at`, `updated_at`, `genero_id`, `album_id`, `artista_id`) VALUES
(1, 'Cuando ya me empiece a quedar solo', 217, '2022-12-07 20:53:15', NULL, 1, 1, 1),
(2, 'Bienvenidos al tren', 214, '2022-12-03 00:44:33', '2022-12-03 00:44:33', 1, 1, 1),
(3, 'Un hada, un cisne', 386, '2022-12-03 00:45:18', '2022-12-03 00:45:18', 1, 1, 1),
(4, 'Confesiones de invierno', 326, '2022-12-03 00:46:04', '2022-12-03 00:46:04', 1, 1, 1),
(5, 'Rasguña las piedras', 334, '2022-12-03 00:46:46', '2022-12-03 00:46:46', 1, 1, 1),
(6, 'Lunes otra vez', 330, '2022-12-03 01:01:58', '2022-12-03 01:01:58', 1, 1, 1),
(7, 'Aprendizaje', 365, '2022-12-03 01:02:49', '2022-12-03 01:02:49', 1, 1, 1),
(8, 'Mr. Jones, o Pequeña semblanza de una ', 104, '2022-12-03 01:03:58', '2022-12-03 01:03:58', 1, 1, 1),
(10, 'So What', 567, '2022-12-07 21:20:58', NULL, 2, 2, 2),
(11, 'Freddie Freeloader', 591, '2022-12-07 21:21:12', NULL, 2, 2, 2),
(12, 'Blue in Green', 339, '2022-12-07 21:21:33', NULL, 2, 2, 2),
(13, 'All Blues', 697, '2022-12-07 21:25:17', NULL, 2, 2, 2),
(14, 'Flamenco Sketches', 567, '2022-12-07 21:25:32', NULL, 2, 2, 2),
(15, 'On Green Dolphin Street', 591, '2022-12-07 21:25:47', NULL, 2, 2, 2),
(16, 'Fran-Dance', 351, '2022-12-07 21:27:23', NULL, 2, 2, 2),
(17, 'Stella By Starlight ', 284, '2022-12-07 21:27:43', '2022-12-07 21:29:06', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `generos`
--

INSERT INTO `generos` (`id`, `name`) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Metal'),
(4, 'Alternative & Punk'),
(5, 'Rock And Roll'),
(6, 'Blues'),
(7, 'Latin'),
(8, 'Reggae'),
(9, 'Pop'),
(10, 'Soundtrack'),
(11, 'Bossa Nova'),
(12, 'Easy Listening'),
(13, 'Heavy Metal'),
(14, 'R&B/Soul'),
(15, 'Electronica/Dance'),
(16, 'World'),
(17, 'Hip Hop/Rap'),
(18, 'Science Fiction'),
(19, 'TV Shows'),
(20, 'Sci Fi & Fantasy'),
(21, 'Drama'),
(22, 'Comedy'),
(23, 'Alternative'),
(24, 'Classical'),
(25, 'Opera');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albumes`
--
ALTER TABLE `albumes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canciones_generos_idx` (`genero_id`),
  ADD KEY `canciones_albumes_idx` (`album_id`),
  ADD KEY `canciones_artistas_idx` (`artista_id`);

--
-- Indexes for table `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `canciones_albumes` FOREIGN KEY (`album_id`) REFERENCES `albumes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `canciones_artistas` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `canciones_generos` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

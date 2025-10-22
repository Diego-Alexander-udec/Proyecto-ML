-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2025 a las 04:38:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flask_login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'cualquiera', '$2b$12$cpMRVSuXkykiRXSZZbUuWulPy5CMD7OxPFPiamup.UuWu2caaXqZG', '2025-10-15 19:11:02'),
(2, 'cuenta', '$2b$12$bbrgoZTmj2wMX5tKBy08i.0zeyr7ZUYaMObrTa8KR0idi9Kw646w6', '2025-10-15 19:11:27'),
(3, 'formulario', '$2b$12$7ir0ppfWW2O3WoGiVM2W3.pWtrg3xy70bm41hfR2oerWwRLlfy2JS', '2025-10-15 19:12:08'),
(4, 'CuentaPrueba', '$2b$12$5K5uFybyJm0Cp1cRtsgbxesEKB8fBzsduKYO2vakLalaGUrGbtsLK', '2025-10-17 05:17:59'),
(5, 'samuel', '$2b$12$bA7pb2oqZ3dMAzP32XAf0ukbFUklgg9e1gz.hiy7J2pj5/rNAa0MG', '2025-10-21 23:27:11'),
(8, 'felipe', '$2b$12$cQw/8YS6Jkx0Bt.31AmC.uBkjJmXdPn0.DIxeVCgBbIBTUhtSzfde', '2025-10-22 00:04:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

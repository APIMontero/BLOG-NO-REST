-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-10-2021 a las 00:46:45
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog_viajes`
--
CREATE DATABASE IF NOT EXISTS `blog_viajes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `blog_viajes`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

DROP TABLE IF EXISTS `autores`;
CREATE TABLE `autores` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `pseudonimo` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `autores`
--

TRUNCATE TABLE `autores`;
--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `email`, `contrasena`, `pseudonimo`, `avatar`) VALUES
(1, 'luis@email.com', '123123', 'luis2000', NULL),
(2, 'ana@email.com', '123123', 'a55555', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE `publicaciones` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `resumen` varchar(255) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `votos` int DEFAULT '0',
  `fecha_hora` timestamp NULL DEFAULT NULL,
  `autor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `publicaciones`
--

TRUNCATE TABLE `publicaciones`;
--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `titulo`, `resumen`, `contenido`, `foto`, `votos`, `fecha_hora`, `autor_id`) VALUES
(1, 'Roma', 'Buen viaje a Roma', 'Contenido', NULL, 0, '2018-09-10 01:08:27', 1),
(2, 'Grecia', 'Buen viaje a Grecia', 'Contenido</p>', NULL, 0, '2018-09-11 01:08:27', 1),
(3, 'Paris', 'Buen viaje a Paris', 'Contenido', NULL, 0, '2018-09-12 01:08:27', 1),
(4, 'Costa Rica', 'Buen viaje a Costa Rica', 'Contenido', NULL, 0, '2018-09-13 01:08:27', 2),
(5, 'Mar de Plata', 'Buen viaje a Mar de Plata', 'Contenido', NULL, 0, '2018-09-14 01:08:27', 2),
(6, 'Guadalajara', 'Buen viaje a Guadalajara', 'Contenido', NULL, 0, '2018-09-15 01:08:27', 2),
(7, 'China', 'Buen viaje a China', 'Contenido', NULL, 2, '2018-09-16 01:08:27', 2),
(8, 'Viña del mar', 'Ciudad Bella Y Sana', 'La ciudad cuenta con varias vistas: Campo, Urbanidad, cerros, playas, piscinas, gimnasios, y un sin fin de lugares de esparcimiento y ocio.\r\nAdemás cuenta con servicios públicos y privados de salud.\r\nAdemás, como dato, tiene muchas instituciones de educac', 'https://admin.freetour.com/images/tours/6429/vina-del-mar-walking-tour-18.jpg', 100, '2021-09-18 14:21:07', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_publicaciones_autores_idx` (`autor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `fk_publicaciones_autores` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

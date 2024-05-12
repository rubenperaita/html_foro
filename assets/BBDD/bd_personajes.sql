-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2024 a las 22:13:34
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_personajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `per_id` int(11) NOT NULL,
  `per_nombre` varchar(50) NOT NULL,
  `per_descripcion` varchar(100) NOT NULL,
  `per_foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`per_id`, `per_nombre`, `per_descripcion`, `per_foto`) VALUES
(1, 'Bold lady', '', 'AVATARZ - Bold lady.png'),
(2, 'Brown hair person', '', 'AVATARZ - Brown hair person.png'),
(3, 'Lady with squared eyeglasses', '', 'AVATARZ - Lady with squared eyeglasses.png'),
(4, 'Long hair male', '', 'AVATARZ - Long hair male.png'),
(5, 'Older person', '', 'AVATARZ - Older person.png'),
(6, 'Sheik', '', 'AVATARZ - Sheik.png'),
(7, 'Steve Jobs', '', 'AVATARZ - Steve Jobs.png'),
(8, 'Tomas', '', 'AVATARZ - Tomas.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`per_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

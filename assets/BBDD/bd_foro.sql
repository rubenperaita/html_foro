-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2024 a las 22:56:43
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
-- Base de datos: `bd_foro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `men_id` int(11) NOT NULL,
  `men_mensaje` mediumtext NOT NULL,
  `men_tema_id` int(11) NOT NULL,
  `men_usu_id` int(11) NOT NULL,
  `men_fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`men_id`, `men_mensaje`, `men_tema_id`, `men_usu_id`, `men_fecha_hora`) VALUES
(1, 'Adornar la web', 2, 1, '2024-01-09 17:59:27'),
(2, 'Si no lo pillas, es cuestión de práctica', 2, 2, '2024-01-09 17:59:27'),
(3, 'Prueba', 2, 1, '2024-01-09 18:23:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palas_padel`
--

CREATE TABLE `palas_padel` (
  `p_id` int(100) NOT NULL,
  `p_nombre` varchar(50) NOT NULL,
  `p_precio` int(10) NOT NULL,
  `p_foto` varchar(50) NOT NULL,
  `p_descrip` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `palas_padel`
--

INSERT INTO `palas_padel` (`p_id`, `p_nombre`, `p_precio`, `p_foto`, `p_descrip`) VALUES
(1, 'ADIDAS CROSS IT 2024', 300, 'ADIDAS_CROSS_IT_2024.jpeg', 'Pala con forma de diamante y balance alto Adidas Cross IT, para jugadores de pádel profesionales o de nivel avanzado. Su núcleo es de goma EVA High Memory y sus planos de Carbon Aluminized 15K cuentan'),
(2, 'ADIDAS METALBONE 3.3 2024', 380, 'ADIDAS_METALBONE_3.3_2024.jpeg', 'Adidas Metalbone 3.3, pala de diamante oversize de Ale Galán. Diseñada para jugadores de alto rendimiento. Modelo de pala de la colección 2024.'),
(3, 'RS RIALTO PRO 95081', 370, 'RS_RIALTO_PRO_95081.jpeg', 'Pala Rs Rialto Pro para jugadores de cualquier nivel. Innovación y tecnologías avanzadas, para destacar en la pista. Equilibrio ideal entre potencia y control.'),
(4, 'HEAD EXTREME ONE 2023', 250, 'head_extreme_one.jpeg', 'Head Extreme One 2023, pala de pádel para jugadores avanzados o profesionales. Pala de alta gama en forma de diamante sin troqueles con un peso más ligero. Fabricada con carbono 12K y núcleo Power Foam.'),
(5, 'VIBOR-A TITAN 2024', 544, 'VIBOR_A_TITAN_2024.jpeg', 'Vibor-A Titan 2024, pala de pádel con forma híbrida y balance medio para jugadores de nivel alto o competición. Con núcleo EVA multicapa y planos de Carbono tricapa 12K y Biaxial 3K.'),
(6, 'BABOLAT TECHNICAL VIPER JUAN LEBRON 2024', 380, 'BABOLAT_TECHNICAL_VIPER_JUAN_LEBRON_2024.jpeg', 'Una de las palas Babolat más espectaculares del mercado y que dará mucho que hablar, tanto por su espectacular diseño y estética, como por sus prestaciones en pista. Ideal para esos jugadores atacantes que buscan una potencia explosiva, con gran manejabilidad.'),
(7, 'HEAD ULTIMATE POWER II WITH CB AMARILLO VERDE', 180, 'HEAD_ULTIMATE_POWER_II.jpeg', 'Pala de pádel diseñada con materiales de carbono que la hacen resistente y con manejabilidad total.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `tema_id` int(11) NOT NULL,
  `tema_tema` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`tema_id`, `tema_tema`) VALUES
(1, 'HTML'),
(2, 'CSS'),
(3, 'Javascript'),
(4, 'PHP'),
(5, 'Java'),
(7, 'Oracle'),
(9, 'derecho penal'),
(13, 'derecho penal2'),
(14, 'derecho penal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_alias` varchar(50) NOT NULL,
  `usu_password` varchar(256) NOT NULL,
  `usu_foto` varchar(50) NOT NULL,
  `usu_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nombre`, `usu_alias`, `usu_password`, `usu_foto`, `usu_admin`) VALUES
(1, 'administrador', 'administrador', '91f5167c34c400758115c2a6826ec2e3', 'u01.gif', 1),
(2, 'usuario', 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', 'u02.gif', 0),
(3, 'Pepe', 'pepe', '926e27eecdbc7a18858b3798ba99bddd', 'anonimo.png', 0),
(7, 'Pepe2', 'pepe2', '926e27eecdbc7a18858b3798ba99bddd', 'anonimo.png', 0),
(8, 'Juana', 'juana', 'a94652aa97c7211ba8954dd15a3cf838', 'u03.gif', 0),
(9, 'ruben', 'ruben', '32252792b9dccf239f5a5bd8e778dbc2', 'u02.gif', 0),
(15, 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', 'u02.gif', 0),
(16, '', '', 'd41d8cd98f00b204e9800998ecf8427e', 'u02.gif', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`men_id`),
  ADD KEY `men_tema_id` (`men_tema_id`),
  ADD KEY `men_usu_id` (`men_usu_id`);

--
-- Indices de la tabla `palas_padel`
--
ALTER TABLE `palas_padel`
  ADD PRIMARY KEY (`p_id`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`tema_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `usu_alias` (`usu_alias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `men_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `palas_padel`
--
ALTER TABLE `palas_padel`
  MODIFY `p_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `tema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`men_usu_id`) REFERENCES `usuarios` (`usu_id`),
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`men_tema_id`) REFERENCES `temas` (`tema_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

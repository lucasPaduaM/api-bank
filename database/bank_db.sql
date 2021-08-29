-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2021 a las 22:48:42
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bank_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiro`
--

CREATE TABLE `retiro` (
  `idRetiro` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `retiro`
--

INSERT INTO `retiro` (`idRetiro`, `idUsuario`, `monto`, `fecha`) VALUES
(1, 1, 900, NULL),
(2, 1, 900, NULL),
(3, 1, 900, NULL),
(4, 1, 900, '2021-08-29 16:34:55'),
(5, 1, 100, '2021-08-29 16:55:05'),
(6, 1, 100, '2021-08-29 17:18:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE `transferencia` (
  `idTransferencia` int(11) NOT NULL,
  `idUsuarioOrigen` int(11) DEFAULT NULL,
  `idUsuarioDestino` int(11) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transferencia`
--

INSERT INTO `transferencia` (`idTransferencia`, `idUsuarioOrigen`, `idUsuarioDestino`, `monto`, `descripcion`, `fecha`) VALUES
(1, 1, 2, 200, 'un regalito', NULL),
(2, 1, 2, 200, 'un regalito', NULL),
(3, 1, 2, 200, 'un regalito', NULL),
(4, NULL, NULL, 100, NULL, NULL),
(5, 1, 2, 200, 'prueba', '2021-08-29 16:43:04'),
(6, 1, 2, 200, 'prueba', '2021-08-29 16:44:32'),
(7, 1, 2, 20000, 'prueba', '2021-08-29 16:47:41'),
(8, 1, 2, 20000, 'prueba', '2021-08-29 16:48:49'),
(9, 1, 2, 20000, 'prueba', '2021-08-29 16:48:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `email`, `saldo`) VALUES
(1, 'prueba', 'prueba@test.com', 900),
(2, 'lucas', 'lucas@test.com', 1000),
(3, NULL, NULL, NULL),
(4, NULL, NULL, NULL),
(5, NULL, NULL, 200),
(6, NULL, NULL, -200),
(7, NULL, NULL, 100),
(8, NULL, NULL, -100),
(9, NULL, NULL, -100),
(10, NULL, NULL, -100),
(11, NULL, NULL, -900),
(12, NULL, NULL, -900),
(13, NULL, NULL, -900),
(14, NULL, NULL, -900),
(15, NULL, NULL, -900),
(16, NULL, NULL, -900);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD PRIMARY KEY (`idRetiro`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`idTransferencia`),
  ADD KEY `idUsuarioOrigen` (`idUsuarioOrigen`),
  ADD KEY `idUsuarioDestino` (`idUsuarioDestino`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `retiro`
--
ALTER TABLE `retiro`
  MODIFY `idRetiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `idTransferencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD CONSTRAINT `retiro_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `transferencia_ibfk_1` FOREIGN KEY (`idUsuarioOrigen`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `transferencia_ibfk_2` FOREIGN KEY (`idUsuarioDestino`) REFERENCES `usuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

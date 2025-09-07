-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: fdb1034.awardspace.net
-- Tiempo de generación: 07-09-2025 a las 04:51:41
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `4667276_accesoeditorial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso_empleados`
--

CREATE TABLE `acceso_empleados` (
  `id_acceso` int NOT NULL,
  `id_empleado` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `hora_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `acceso_empleados`
--

INSERT INTO `acceso_empleados` (`id_acceso`, `id_empleado`, `nombre`, `hora_registro`) VALUES
(1, 2, 'Andrea Zelda Solís Torres', '2025-09-06 20:14:02'),
(2, 7, 'Samuel Salvador Rascón Juárez', '2025-09-06 21:24:53'),
(3, 6, 'Itzel Carolina Chavez Romero', '2025-09-06 21:28:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso_visitantes`
--

CREATE TABLE `acceso_visitantes` (
  `id_visita` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `motivo` text NOT NULL,
  `hora_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `acceso_visitantes`
--

INSERT INTO `acceso_visitantes` (`id_visita`, `nombre`, `motivo`, `hora_registro`) VALUES
(1, 'Brayan', 'otros', '2025-09-06 20:14:22'),
(2, 'Odalys', 'otros', '2025-09-06 20:59:07'),
(3, 'Krampen', 'otros', '2025-09-06 21:25:35'),
(4, 'Itzel', 'otros', '2025-09-06 21:26:27'),
(5, 'Carla', 'Entregar manuscrito o trabajo para publicación', '2025-09-06 22:46:37'),
(6, 'Madeline', 'Entrevista de trabajo o pasantía', '2025-09-06 22:47:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `clave_acceso` char(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `clave_acceso`, `nombre`, `correo`, `telefono`) VALUES
(1, '250023', 'Evelin Isabel Salazar Palacios', 'Isabel@gmail.com', '656-643-8946'),
(2, '232323', 'Andrea Zelda Solís Torres', 'Zeldita@hotmail.com', '656-653-0245'),
(3, '242046', 'Naomy Alvarado', 'Nano@gmail.com', '656-362-9017'),
(4, '250030', 'Zahira Gabriela Garcia Acosta', 'Zahir2020@gmail.com', '656-342-5324'),
(5, '243948', 'Fabián Betance Jiménez', 'emanuel@gmail.com', '656-233-0325'),
(6, '253828', 'Itzel Carolina Chavez Romero', 'Itzel_Chavez@outlook.com', '656-434-6325'),
(7, '243920', 'Samuel Salvador Rascón Juárez', 'Samuel@hotmailcom', '656-824-5370');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso_empleados`
--
ALTER TABLE `acceso_empleados`
  ADD PRIMARY KEY (`id_acceso`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `acceso_visitantes`
--
ALTER TABLE `acceso_visitantes`
  ADD PRIMARY KEY (`id_visita`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `clave_acceso` (`clave_acceso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso_empleados`
--
ALTER TABLE `acceso_empleados`
  MODIFY `id_acceso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acceso_visitantes`
--
ALTER TABLE `acceso_visitantes`
  MODIFY `id_visita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso_empleados`
--
ALTER TABLE `acceso_empleados`
  ADD CONSTRAINT `acceso_empleados_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

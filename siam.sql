-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-10-2019 a las 05:14:52
-- Versión del servidor: 10.3.13-MariaDB
-- Versión de PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siam`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listausuarios` ()  SELECT u.Usuario, d.PrimerNombre, d.PrimerApellido, d.Correo, u.Clave
FROM USUARIOS AS u INNER JOIN DATOSPERSONALES AS d ON u.Usuario = d.Cedula$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `reporte_vehiculos` (`Id_vehiculo` VARCHAR(6), `Placa` VARCHAR(6)) RETURNS VARCHAR(250) CHARSET latin1 BEGIN
DECLARE message VARCHAR(250);
SET message = "El Vehiculo";
RETURN CONCAT(message, " ", Id, " ", Placa, " ",  "se ha programado Exitosamente");
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `id` int(11) NOT NULL,
  `id_vehiculo` varchar(10) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `modelo` int(4) NOT NULL,
  `fecha_matricula` date NOT NULL,
  `estado` enum('Disponible','No disponible') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`id`, `id_vehiculo`, `placa`, `modelo`, `fecha_matricula`, `estado`) VALUES
(1, 'TZ100', 'TAZ374', 2014, '2013-09-02', 'Disponible'),
(2, 'TZ101', 'TAZ375', 2014, '2013-09-02', 'Disponible'),
(3, 'TZ102', 'TAZ376', 2014, '2013-09-02', 'Disponible'),
(4, 'TZ104', 'WCM809', 2014, '2013-08-12', 'Disponible'),
(5, 'TZ105', 'WCM810', 2014, '2013-08-13', 'Disponible'),
(6, 'TZ106', 'WCM811', 2014, '2013-08-13', 'Disponible'),
(7, 'TZ107', 'WCM814', 2014, '2013-08-13', 'Disponible'),
(8, 'TZ108', 'WCM818', 2014, '2013-08-14', 'Disponible'),
(9, 'TZ109', 'WCM822', 2014, '2013-08-12', 'Disponible'),
(10, 'TZ110', 'WCM827', 2014, '2013-08-12', 'Disponible'),
(11, 'TZ111', 'WCM830', 2014, '2013-08-13', 'Disponible'),
(12, 'TZ112', 'WDD950', 2014, '2013-09-11', 'Disponible'),
(13, 'TZ113', 'WEU982', 2014, '2014-02-06', 'Disponible'),
(14, 'TZ114', 'WEU983', 2014, '2014-02-06', 'Disponible'),
(15, 'TZ115', 'WEU984', 2014, '2014-02-12', 'Disponible'),
(16, 'TZ116', 'WEU985', 2014, '2014-02-06', 'Disponible'),
(17, 'TZ117', 'WEU986', 2014, '2014-02-06', 'Disponible'),
(18, 'TZ118', 'WEU987', 2014, '2014-02-06', 'Disponible'),
(19, 'TZ119', 'WCL328', 2014, '2013-07-24', 'Disponible'),
(22, 'TZ120', 'WCM372', 2014, '2013-07-24', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id` int(10) NOT NULL,
  `id_vehiculo` varchar(6) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `novedad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`id`, `id_vehiculo`, `placa`, `novedad`) VALUES
(1, 'TZ101', 'TAZ375', 'MOVIL PRESENTA FALLA EN EL CONTROL DE LUCES DIRECCIONALES'),
(7, 'TZ102', 'TAZ376', 'ESTO ES UNA PRUEBA'),
(9, 'TZ102', 'TAZ376', 'ESto es una prueba de innner join'),
(10, 'TZ100', 'TAZ374', 'PRUEBA DE INNER JOIN'),
(11, 'TZ100', 'TAZ374', 'EL VEHICULO PRESENTA FALLAS EN EL MOTOR.'),
(12, 'TZ120', 'WCM372', 'NO TIENE MOTOR'),
(13, 'TZ200', 'SDJASS', 'NINGUNAGA');

--
-- Disparadores `mantenimiento`
--
DELIMITER $$
CREATE TRIGGER `NovedadVehiculo` AFTER INSERT ON `mantenimiento` FOR EACH ROW INSERT INTO reporte_vehiculos (id_vehiculo, placa, novedad, fecha) VALUES (new.id_vehiculo, new.placa, new.novedad, now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_vehiculos`
--

CREATE TABLE `reporte_vehiculos` (
  `id` int(11) NOT NULL,
  `id_vehiculo` varchar(6) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `novedad` varchar(100) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reporte_vehiculos`
--

INSERT INTO `reporte_vehiculos` (`id`, `id_vehiculo`, `placa`, `novedad`, `fecha`) VALUES
(1, 'TZ101', 'TAZ375', 'MOVIL PRESENTA FALLA EN EL CONTROL DE LUCES DIRECCIONALES', '2019-08-11 02:44:33'),
(11, 'TZ100', 'TAZ374', 'EL VEHICULO PRESENTA FALLAS EN EL MOTOR.', '2019-10-06 16:51:32'),
(12, 'TZ120', 'WCM372', 'NO TIENE MOTOR', '2019-10-06 16:56:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id` int(11) NOT NULL,
  `id_item` int(10) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id`, `id_item`, `cantidad`, `descripcion`, `tipo`) VALUES
(2, 848374, 5, 'Motores diesel', 'Motor'),
(5, 283832, 100, 'LLANTAS PARA EL MOTOR ', 'AMD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos_solicitados`
--

CREATE TABLE `repuestos_solicitados` (
  `id` int(10) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `repuestos_solicitados`
--

INSERT INTO `repuestos_solicitados` (`id`, `cantidad`, `descripcion`, `tipo`, `fecha`) VALUES
(2, 100, 'Motores', 'Prueba', '2019-10-06 20:43:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitar`
--

CREATE TABLE `solicitar` (
  `id` int(10) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitar`
--

INSERT INTO `solicitar` (`id`, `cantidad`, `descripcion`, `tipo`) VALUES
(1, 5, 'LLantas para los vehiculos', 'AMD'),
(2, 100, 'Motores', 'Prueba'),
(3, 2, 'dsafjj', 'sÑLLnatas');

--
-- Disparadores `solicitar`
--
DELIMITER $$
CREATE TRIGGER `SolicitarRepuestos` AFTER INSERT ON `solicitar` FOR EACH ROW INSERT INTO repuestos_solicitados(cantidad, descripcion, tipo, fecha) VALUES (new.cantidad, new.descripcion, new.tipo, now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(2) DEFAULT NULL,
  `genero` enum('Femenino','Masculino') DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `nombres`, `apellidos`, `edad`, `genero`, `correo`, `contrasena`) VALUES
(1, '1075280720', 'Daniel Fernando', 'Perdomo Romero', 25, 'Masculino', 'dfperdomo3@misena.edu.co', 'aa47f8215c6f30a0dcdb2a36a9f4168e'),
(2, '1094975475', 'Johan', 'Rodriguez Peña', 20, 'Masculino', 'jarodriguez3200@misena.edu.co', '7fedcb034ecf9df4be8c1ea13362053b'),
(3, '1022923428', 'Andrea', 'Navarrete Camacho', 33, 'Femenino', 'andreitaibel463@gmail.com', '1c42f9c1ca2f65441465b43cd9339d6c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `id_vehiculo` varchar(10) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `modelo` int(4) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `chasis` varchar(100) NOT NULL,
  `motor` int(11) NOT NULL,
  `fecha_matricula` date NOT NULL,
  `fin_vida_util` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `id_vehiculo`, `placa`, `modelo`, `marca`, `chasis`, `motor`, `fecha_matricula`, `fin_vida_util`) VALUES
(1, 'TZ100', 'TAZ374', 2014, 'BLUEBIRD', '1BDYNCPA2EF302783', 73530496, '2013-09-02', '2025-09-02'),
(2, 'TZ101', 'TAZ375', 2014, 'BLUEBIRD', '1BDYNCPA2EF302752', 73527678, '2013-09-02', '2025-09-02'),
(3, 'TZ102', 'TAZ376', 2014, 'BLUEBIRD', '1BDYNCPA4EF302753', 73526716, '2013-09-02', '2025-09-02'),
(4, 'TZ119', 'WCL328', 2014, 'BLUEBIRD', '1BDYNCPA4EF301599', 73518622, '2013-07-24', '2025-07-24'),
(5, 'TZ120', 'WCM372', 2014, 'BLUEBIRD', '1BDYNCPA0EF301602', 73518619, '2013-07-24', '2025-07-24'),
(6, 'TZ104', 'WCM809', 2014, 'BLUEBIRD', '1BDYNCPA6EF302771', 73528060, '2013-08-12', '2025-08-12'),
(7, 'TZ105', 'WCM810', 2014, 'BLUEBIRD', '1BDYNCPA8EF302772', 73529404, '2013-08-13', '2025-08-13'),
(8, 'TZ106', 'WCM811', 2014, 'BLUEBIRD', '1BDYNCPA6EF302754', 73526706, '2013-08-13', '2025-08-13'),
(9, 'TZ107', 'WCM814', 2014, 'BLUEBIRD', '1BDYNCPA5EF302762', 73528054, '2013-08-13', '2025-08-13'),
(10, 'TZ108', 'WCM818', 2014, 'BLUEBIRD', '1BDYNCPA6EF302768', 73528058, '2013-08-14', '2025-08-14'),
(11, 'TZ109', 'WCM822', 2014, 'BLUEBIRD', '1BDYNCPAXEF302773', 73529407, '2013-08-12', '2025-08-12'),
(12, 'TZ110', 'WCM827', 2014, 'BLUEBIRD', '1BDYNCPA8EF302786', 73530232, '2013-08-12', '2025-08-12'),
(13, 'TZ111', 'WCM830', 2014, 'BLUEBIRD', '1BDYNCPA7EF302780', 73528042, '2013-08-13', '2025-08-13'),
(14, 'TZ112', 'WDD950', 2014, 'BLUEBIRD', '1BDYNCPA0EF302751', 73527679, '2013-09-11', '2025-09-11'),
(15, 'TZ113', 'WEU982', 2014, 'BLUEBIRD', '1BDYNCPA6FF305896', 73591995, '2014-02-06', '2026-02-06'),
(16, 'TZ114', 'WEU983', 2014, 'BLUEBIRD', '1BDYNCPA8FF305897', 73591567, '2014-02-06', '2026-02-06'),
(17, 'TZ115', 'WEU984', 2014, 'BLUEBIRD', '1BDYNCPAXFF305898', 73591986, '2014-02-12', '2026-02-12'),
(18, 'TZ116', 'WEU985', 2014, 'BLUEBIRD', '1BDYNCPAXFF305903', 73592479, '2014-02-06', '2026-02-06'),
(19, 'TZ117', 'WEU986', 2014, 'BLUEBIRD', '1BDYNCPA1FF305904', 73592473, '2014-02-06', '2026-02-06'),
(20, 'TZ118', 'WEU987', 2014, 'BLUEBIRD', '1BDYNCPA7FF305910', 73591569, '2014-02-06', '2026-02-06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_disponibilidad_vehiculos` (`placa`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_vehiculos`
--
ALTER TABLE `reporte_vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repuestos_solicitados`
--
ALTER TABLE `repuestos_solicitados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitar`
--
ALTER TABLE `solicitar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cedula` (`cedula`),
  ADD UNIQUE KEY `uk_correo` (`correo`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_placa` (`placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reporte_vehiculos`
--
ALTER TABLE `reporte_vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `repuestos_solicitados`
--
ALTER TABLE `repuestos_solicitados`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitar`
--
ALTER TABLE `solicitar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD CONSTRAINT `fk_disponibilidad_vehiculos` FOREIGN KEY (`Placa`) REFERENCES `vehiculos` (`Placa`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_vehiculos_dispo` FOREIGN KEY (`placa`) REFERENCES `disponibilidad` (`placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

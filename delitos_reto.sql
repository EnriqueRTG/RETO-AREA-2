-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-06-2024 a las 19:34:15
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delitos_reto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas_comunitarias`
--

DROP TABLE IF EXISTS `areas_comunitarias`;
CREATE TABLE IF NOT EXISTS `areas_comunitarias` (
  `Id_area_com` int NOT NULL AUTO_INCREMENT,
  `Nombre_area_com` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `Poblacion` int DEFAULT NULL,
  `Ingresos_medios` float DEFAULT NULL,
  `Ind_latinos` float DEFAULT NULL,
  `Ind_negros` float DEFAULT NULL,
  `Ind_blancos` float DEFAULT NULL,
  `Ind_asiaticos` float DEFAULT NULL,
  `Ind_otros` float DEFAULT NULL,
  PRIMARY KEY (`Id_area_com`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areas_comunitarias`
--

INSERT INTO `areas_comunitarias` (`Id_area_com`, `Nombre_area_com`, `Anio`, `Poblacion`, `Ingresos_medios`, `Ind_latinos`, `Ind_negros`, `Ind_blancos`, `Ind_asiaticos`, `Ind_otros`) VALUES
(1, 'Área 1', 2020, 54991, 25000, 5.6, 10.2, 78.8, 3.8, 1.6),
(2, 'Área 2', 2018, 71942, 37000, 33.6, 12.2, 8.8, 35.8, 9.6),
(3, 'Área 3', 2012, 56362, 15000, 25.6, 20.2, 38.8, 10.3, 5.1),
(4, 'Área 4', 2022, 39493, 48000, 39.4, 23.2, 18.4, 6.8, 12.2),
(5, 'Área 5', 2023, 0, 12000, 22.6, 15.2, 48.8, 6.5, 6.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisarias`
--

DROP TABLE IF EXISTS `comisarias`;
CREATE TABLE IF NOT EXISTS `comisarias` (
  `Id_comisaria` int NOT NULL AUTO_INCREMENT,
  `Nombre_comisaria` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Id_area_com` int NOT NULL,
  `Direccion_com` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefono_com` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Latitud_com` float DEFAULT NULL,
  `Longitud_com` float DEFAULT NULL,
  PRIMARY KEY (`Id_comisaria`),
  KEY `fk_Id_area_com_comisaria` (`Id_area_com`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comisarias`
--

INSERT INTO `comisarias` (`Id_comisaria`, `Nombre_comisaria`, `Id_area_com`, `Direccion_com`, `Telefono_com`, `Latitud_com`, `Longitud_com`) VALUES
(1, 'Near_North', 1, 'Direccion 1', '98765421', 41.8151, -87.67),
(2, 'Town_Hall', 2, 'Direccion 2', '98765422', 41.9474, -87.7167),
(3, 'Lincoln', 3, 'Direccion 3', '98765423', 41.9795, -87.6584),
(4, 'Distrito_Morgan_Park', 4, 'Direccion 4', '98765424', 41.6914, -87.6685),
(5, 'Rogers_Park', 5, 'Direccion 5', '98765425', 41.9998, -87.6713);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delitos`
--

DROP TABLE IF EXISTS `delitos`;
CREATE TABLE IF NOT EXISTS `delitos` (
  `Id_delito` int NOT NULL AUTO_INCREMENT,
  `Num_caso` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Arrestado` tinyint(1) DEFAULT NULL,
  `Id_area_com` int NOT NULL,
  `Cuadra` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Latitud_del` float DEFAULT NULL,
  `Longitud_del` float DEFAULT NULL,
  PRIMARY KEY (`Id_delito`),
  KEY `fk_Id_area_com_delitos` (`Id_area_com`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `delitos`
--

INSERT INTO `delitos` (`Id_delito`, `Num_caso`, `Descripcion`, `Arrestado`, `Id_area_com`, `Cuadra`, `Latitud_del`, `Longitud_del`) VALUES
(1, 'HY411648', 'Maltrato doméstico', 0, 1, '043XX S WOOD ST', 41.8151, -87.67),
(2, 'HY411648', 'Maltrato doméstico', 0, 2, '043XX S WOOD ST', 41.8151, -87.67),
(3, 'HY411595', 'Tráfico de drogas', 1, 3, '035XX W BARRY AVE', 41.9374, -87.7167),
(4, 'HY411435', 'Robo en casa', 0, 4, '082XX S LOOMIS BLVD', 41.7444, -87.6584),
(5, 'HY411662', 'Robo por valor menor a 500$', 0, 5, '071XX S PULASKI RD', 41.7636, -87.7223);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitales`
--

DROP TABLE IF EXISTS `hospitales`;
CREATE TABLE IF NOT EXISTS `hospitales` (
  `Id_hospital` int NOT NULL AUTO_INCREMENT,
  `Nombre_hospital` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Id_area_com` int NOT NULL,
  `Direccion_hospt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefono_hospt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Latitud_hospt` float(8,6) DEFAULT NULL,
  `Longitud_hospt` float(8,6) DEFAULT NULL,
  PRIMARY KEY (`Id_hospital`),
  KEY `fk_Id_area_com_hospitales` (`Id_area_com`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `hospitales`
--

INSERT INTO `hospitales` (`Id_hospital`, `Nombre_hospital`, `Id_area_com`, `Direccion_hospt`, `Telefono_hospt`, `Latitud_hospt`, `Longitud_hospt`) VALUES
(1, 'Hospital1', 1, 'Direccion 1', '1234567890', 41.815128, -87.670036),
(2, 'Hospital2', 2, 'Direccion 2', '1234567891', 41.605118, 87.500000),
(3, 'Hospital3', 3, 'Direccion 3', '1234567892', -70.815117, -80.669998),
(4, 'Hospital4', 4, 'Direccion 4', '1234567893', -90.815117, 1.670000);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comisarias`
--
ALTER TABLE `comisarias`
  ADD CONSTRAINT `fk_Id_area_com_comisaria` FOREIGN KEY (`Id_area_com`) REFERENCES `areas_comunitarias` (`Id_area_com`);

--
-- Filtros para la tabla `delitos`
--
ALTER TABLE `delitos`
  ADD CONSTRAINT `fk_Id_area_com_delitos` FOREIGN KEY (`Id_area_com`) REFERENCES `areas_comunitarias` (`Id_area_com`);

--
-- Filtros para la tabla `hospitales`
--
ALTER TABLE `hospitales`
  ADD CONSTRAINT `fk_Id_area_com_hospitales` FOREIGN KEY (`Id_area_com`) REFERENCES `areas_comunitarias` (`Id_area_com`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

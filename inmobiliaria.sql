-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2024 a las 17:28:03
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
-- Base de datos: `inmobiliaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`nombre`, `apellido`, `correo`, `contrasena`) VALUES
('Ana', 'Sánchez', 'ana.sanchez@example.com', 'secreta321'),
('Carlos', 'Rodríguez', 'carlos.rodriguez@example.com', '123abc'),
('Daniel', 'Gómez', 'daniel.gomez@example.com', 'def456'),
('dayana', 'ochoa', 'ASD@AS.COM', '123'),
('Elena', 'Pérez', 'elena.perez@example.com', 'ghi789'),
('Juan', 'Pérez', 'juan.perez@example.com', 'contraseña123'),
('Laura', 'Díaz', 'laura.diaz@example.com', '456def'),
('Luis', 'Martínez', 'luis.martinez@example.com', 'pass789'),
('María', 'González', 'maria.gonzalez@example.com', 'clave456'),
('Pedro', 'Hernández', 'pedro.hernandez@example.com', '789ghi'),
('Sofía', 'López', 'sofia.lopez@example.com', 'abc123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `estadoCivil` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` int(50) NOT NULL,
  `administradorFk` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nombre`, `contrasena`, `estadoCivil`, `direccion`, `correo`, `apellido`, `telefono`, `administradorFk`) VALUES
('Carmen', 'clave456', 'soltero', 'Calle 56 #12-34', 'carmen@example.com', 'López', 2147483647, 'María'),
('daya', '123', 'casado', '7487', 'ASD@AS.COM', 'rojas', 484, 'dayana'),
('Diego', 'abc123', 'divorciado', 'Calle 78 #23-45', 'diego@example.com', 'García', 2147483647, 'Luis'),
('Eva', '456def', 'casado', 'Carrera 56 #12-90', 'eva@example.com', 'Gómez', 2147483647, 'Pedro'),
('Hugo', '789ghi', 'divorciado', 'Calle 78 #45-67', 'hugo@example.com', 'López', 2147483647, 'Sofía'),
('Javier', '123abc', 'soltero', 'Calle 34 #67-89', 'javier@example.com', 'Hernández', 2147483647, 'Laura'),
('Manuel', 'pass123', 'casado', 'Carrera 123 #45-67', 'manuel@example.com', 'Gómez', 2147483647, 'Juan'),
('Marcos', 'contraseña123', 'casado', 'Carrera 12 #34-56', 'marcos@example.com', 'Pérez', 2147483647, 'Elena'),
('Marta', 'ghi789', 'soltero', 'Carrera 12 #89-01', 'marta@example.com', 'Rodríguez', 2147483647, 'Carlos'),
('Natalia', 'def456', 'casado', 'Avenida 90 #56-78', 'natalia@example.com', 'Pérez', 2147483647, 'Ana'),
('Sara', 'secreta321', 'soltero', 'Avenida 90 #12-34', 'sara@example.com', 'Díaz', 2147483647, 'Daniel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiador`
--

CREATE TABLE `fiador` (
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` int(50) NOT NULL,
  `clienteFk` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fiador`
--

INSERT INTO `fiador` (`nombre`, `apellido`, `correo`, `telefono`, `clienteFk`) VALUES
('Alejandro', 'Fernández', 'alejandro@example.com', 2147483647, 'Manuel'),
('Cristina', 'Díaz', 'cristina@example.com', 2147483647, 'Sara'),
('dayana', '232', 'yo@hotmail.com', 234, 'daya'),
('Jorge', 'Gómez', 'jorge@example.com', 2147483647, 'Natalia'),
('Laura', 'López', 'laura@example.com', 2147483647, 'Eva'),
('Lucía', 'García', 'lucia@example.com', 2147483647, 'Marta'),
('Luisa', 'Martín', 'luisa@example.com', 2147483647, 'Diego'),
('Marina', 'Ruiz', 'marina@example.com', 2147483647, 'Carmen'),
('Mario', 'Hernández', 'mario@example.com', 2147483647, 'Javier'),
('Pablo', 'Sánchez', 'pablo@example.com', 2147483647, 'Hugo'),
('Rosa', 'González', 'rosa@example.com', 2147483647, 'Marcos'),
('wqeeq', 'wqewq', 'qwewq@w.com', 23, 'daya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `precio` int(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `imagen` varchar(300) NOT NULL,
  `administradorFk` varchar(50) DEFAULT NULL,
  `clienteFk` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`nombre`, `tipo`, `direccion`, `precio`, `area`, `estado`, `imagen`, `administradorFk`, `clienteFk`) VALUES
('Apartamento Moderno', 'Atico', 'Calle 20 #15-18', 320000000, '150 m2', 1, 'atico-estilo-loft7-1582040033.jpg', 'Ana', NULL),
('Apartamento Sofisticado', 'Atico', 'Carrera 18 #22-25', 340000000, '170 m2', 1, 'atico-estilo-loft7-1582040033.jpg', 'Carlos', 'daya'),
('asdas', 'Estudio', 'asd', 13, 'asd', 0, 'eyJidWNrZXQiOiJzdGF0aWN3Iiwia2V5IjoiaW5tdWVibGVzXC9nX3ZlbnRhX2FwYXJ0YW1lbnRvXzNfYWxjb2Jhc19lXzE3MDYxMjIzMDEtMzg4NV8xNTIxLmpwZWciLCJlZGl0cyI6eyJub3JtYWxpc2UiOnRydWUsInJvdGF0ZSI6MCwicmVzaXplIjp7IndpZH.jpg', NULL, NULL),
('asdasd', 'Estudio', 'asd', 13, 'asd', 0, 'eyJidWNrZXQiOiJzdGF0aWN3Iiwia2V5IjoiaW5tdWVibGVzXC9nX3ZlbnRhX2FwYXJ0YW1lbnRvXzNfYWxjb2Jhc19lXzE3MDYxMjIzMDEtMzg4NV8xNTIxLmpwZWciLCJlZGl0cyI6eyJub3JtYWxpc2UiOnRydWUsInJvdGF0ZSI6MCwicmVzaXplIjp7IndpZH.jpg', 'dayana', 'daya'),
('Casa Elegante', 'Chalet', 'Carrera 10 #25-30', 450000000, '300 m2', 1, 'casas-prefabricadas-tipo-chalet-madera.jpg', 'Elena', NULL),
('Chalet Acogedor', 'Chalet', 'Calle 25 #40-35', 550000000, '350 m2', 1, 'casas-prefabricadas-tipo-chalet-madera.jpg', 'Juan', NULL),
('Chalet Familiar', 'Chalet', 'Carrera 12 #35-45', 600000000, '400 m2', 1, 'casas-prefabricadas-tipo-chalet-madera.jpg', 'Laura', 'daya'),
('Duplex Espacioso', 'Duplex', 'Avenida Circunvalar #10-15', 380000000, '200 m2', 1, 'duplex_5499038_20211118164832.jpg', 'Luis', NULL),
('Duplex Moderno', 'Duplex', 'Avenida Principal #5-20', 420000000, '250 m2', 1, 'duplex_5499038_20211118164832.jpg', 'María', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `administradorFk` (`administradorFk`);

--
-- Indices de la tabla `fiador`
--
ALTER TABLE `fiador`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `clienteFk` (`clienteFk`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `administradorFk` (`administradorFk`),
  ADD KEY `clienteFk` (`clienteFk`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`administradorFk`) REFERENCES `administrador` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fiador`
--
ALTER TABLE `fiador`
  ADD CONSTRAINT `fiador_ibfk_1` FOREIGN KEY (`clienteFk`) REFERENCES `cliente` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`clienteFk`) REFERENCES `cliente` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inmueble_ibfk_2` FOREIGN KEY (`administradorFk`) REFERENCES `administrador` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

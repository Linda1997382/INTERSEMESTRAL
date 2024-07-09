-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2024 a las 00:18:16
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
-- Base de datos: `libreria`
--
CREATE DATABASE IF NOT EXISTS `libreria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `libreria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Nacionalidad` varchar(100) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`ID`, `Nombre`, `Nacionalidad`, `FechaNacimiento`, `Biografia`) VALUES
(1, 'Karl Heinrich Marx', ' alemán de origen judío.u200b', '1818-05-05', 'Karl Heinrich Marxu200bu200bu200b, que del alemán se traduce al castellano como Carlos Enrique Marx, fue un filósofo, economista, sociólogo, historiador, u200b periodista, intelectual y político comunista alemán de origen judío.u200b'),
(2, 'Jane Austen', 'Britanica', '1775-12-16', 'Una de las escritoras reconocidas de la literatura inglesa del siglo XVIII y XIX. Su obra incluye novelas como Orgullo y Prejuicio, Mansfield Park y Emma, obras que destacan por su sutileza y por su aguda observación de las relaciones humanas.\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorcategoria`
--

CREATE TABLE `autorcategoria` (
  `AutorID` int(11) NOT NULL,
  `CategoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bestseller`
--

CREATE TABLE `bestseller` (
  `LibroID` int(11) NOT NULL,
  `FechaLogro` date DEFAULT NULL,
  `VentasAcumuladas` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `UsuarioID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID`, `Nombre`) VALUES
(25, 'Arte y fotografía'),
(17, 'Autobiografía'),
(8, 'Aventura'),
(16, 'Biografía'),
(24, 'Ciencia'),
(27, 'Cocina y gastronomía'),
(3, 'Comedia'),
(18, 'Drama'),
(30, 'Educación'),
(15, 'Ensayo'),
(4, 'Fantasía'),
(22, 'Filosofía'),
(9, 'Histórica'),
(19, 'Humor'),
(20, 'Infantil'),
(21, 'Juvenil'),
(11, 'Literatura clásica'),
(12, 'Literatura contemporánea'),
(5, 'Misterio'),
(29, 'Negocios y finanzas'),
(2, 'No ficción'),
(14, 'Poesía'),
(10, 'Policial'),
(1, 'Politica'),
(23, 'Religión'),
(7, 'Romance'),
(28, 'Salud y bienestar'),
(6, 'Suspense'),
(13, 'Terror'),
(26, 'Viajes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Sede` varchar(100) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`ID`, `Nombre`, `Sede`, `Fundacion`, `Descripcion`) VALUES
(1, 'Editores Mexicanos Unidos, S.A.', 'Mexico', '1964-05-05', 'A lo largo de 60 años de labor editorial, Editores Mexicanos Unidos ha trabajado para brindar al público hispanoparlante una aproximación a las letras universales, atractiva y accesible, a través de sus sellos editoriales. Bajo esta inspiración nos proponemos recoger en nuestro catálogo literario aquellas obras que consideramos indispensables en el largo y fascinante camino como lectores. Cuenta con un amplio catálogo de interés para el profesor, los niños, la familia, el hogar y los adolescentes.'),
(3, '1212', '1221', '2024-06-05', '2121'),
(4, '123', '213', '2024-06-19', '7218721\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `ID` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `AutorID` int(11) DEFAULT NULL,
  `EditorialID` int(11) DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `CategoriaID` int(11) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  `Link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`ID`, `Titulo`, `AutorID`, `EditorialID`, `Precio`, `Descripcion`, `CategoriaID`, `Imagen`, `Link`) VALUES
(9, 'El capital', 1, 1, 100.00, 'libro sobre capital', 1, 'https://resources.sanborns.com.mx/imagenes-sanborns-ii/1200/9786071411310.jpg?scale=500&qlty=75', 'https://www.marxists.org/espanol/m-e/capital/karl-marx-el-capital-tomo-i-editorial-progreso.pdf'),
(10, 'Orgullo y Prejuicio', 2, 1, 210.00, 'Orgullo y prejuicio narra las aventuras y desventuras amorosas de las hermanas Bennet.', 7, 'https://resources.sanborns.com.mx/imagenes-sanborns-ii/1200/9786071417541.jpg?scale=500&qlty=75', 'aaaaa.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `librocategoria`
--

CREATE TABLE `librocategoria` (
  `LibroID` int(11) NOT NULL,
  `CategoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libroeditorial`
--

CREATE TABLE `libroeditorial` (
  `LibroID` int(11) NOT NULL,
  `EditorialID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `librorecomendado`
--

CREATE TABLE `librorecomendado` (
  `LibroID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`ID`, `Nombre`) VALUES
(2, 'Paypal'),
(3, 'PayPal'),
(1, 'TarjetaDeCredito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypal`
--

CREATE TABLE `paypal` (
  `ID` int(11) NOT NULL,
  `Correopaypal` varchar(255) DEFAULT NULL,
  `MetodoPagoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paypal`
--

INSERT INTO `paypal` (`ID`, `Correopaypal`, `MetodoPagoID`) VALUES
(1, 'juan.perez@example.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegio`
--

CREATE TABLE `privilegio` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `privilegio`
--

INSERT INTO `privilegio` (`ID`, `Nombre`) VALUES
(2, 'Administrador'),
(1, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetacredito`
--

CREATE TABLE `tarjetacredito` (
  `ID` int(11) NOT NULL,
  `Titular` varchar(255) DEFAULT NULL,
  `CVV` int(11) DEFAULT NULL,
  `NumeroDeTarjeta` varchar(255) DEFAULT NULL,
  `MM_AA` varchar(5) DEFAULT NULL,
  `MetodoPagoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjetacredito`
--

INSERT INTO `tarjetacredito` (`ID`, `Titular`, `CVV`, `NumeroDeTarjeta`, `MM_AA`, `MetodoPagoID`) VALUES
(1, 'Juan Perez', 123, '4111111111111111', '12/25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `privilegio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `Nombre`, `Email`, `Password`, `privilegio_id`) VALUES
(1, 'Linda', 'linda.acostacaudana04@gmail.com', '$2b$10$E2OmSxcIIcQP2MU7OvuGfuoWGUrGTqk0bqvLae07SuRye2y.23kSG', 1),
(6, 'lucin', 'lu@lu.lu', '$2b$10$lhFsIVU0d5v6gMD.zYla6uH1ZWqaNCWbFMP6J3XoMh6BzdrvMe1RK', 2),
(7, 'linda', 'linda@l.l', '$2b$10$kk1cvUfmj3un4gbQ4fZK0.mCP6d69L0W70MzPBFm8KrtSL/RYsXSm', 2),
(8, 'lepe', 'lepe@le.le', '$2b$10$egIHkl5Ywua2QRbLjG9OMucqvxqwFfaHA7XbNoUOYvzZZC9kaiCV.', 1),
(9, 'Linda', 'linda.igotbuddy@gmail.com', '$2b$10$bOvcl2blfyFjNnkxXeNnVO2PBbcQb6dwSr0HbXY8i1yXIUpD760MC', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `ID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventadetalle`
--

CREATE TABLE `ventadetalle` (
  `VentaID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `ventadetalle`
--
DELIMITER $$
CREATE TRIGGER `actualizarVentasAcumuladas` AFTER INSERT ON `ventadetalle` FOR EACH ROW BEGIN
    UPDATE bestseller
    SET VentasAcumuladas = VentasAcumuladas + NEW.Cantidad
    WHERE LibroID = NEW.LibroID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `UsuarioID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL,
  `FechaAgregado` date NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_autor_nombre` (`Nombre`);

--
-- Indices de la tabla `autorcategoria`
--
ALTER TABLE `autorcategoria`
  ADD PRIMARY KEY (`AutorID`,`CategoriaID`),
  ADD KEY `CategoriaID` (`CategoriaID`);

--
-- Indices de la tabla `bestseller`
--
ALTER TABLE `bestseller`
  ADD PRIMARY KEY (`LibroID`),
  ADD KEY `idx_bestseller_fechaLogro` (`FechaLogro`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`UsuarioID`,`LibroID`),
  ADD KEY `LibroID` (`LibroID`),
  ADD KEY `idx_carrito_cantidad` (`Cantidad`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_categoria_nombre` (`Nombre`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_editorial_nombre` (`Nombre`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AutorID` (`AutorID`),
  ADD KEY `EditorialID` (`EditorialID`),
  ADD KEY `CategoriaID` (`CategoriaID`),
  ADD KEY `idx_libro_titulo` (`Titulo`);

--
-- Indices de la tabla `librocategoria`
--
ALTER TABLE `librocategoria`
  ADD PRIMARY KEY (`LibroID`,`CategoriaID`),
  ADD KEY `CategoriaID` (`CategoriaID`),
  ADD KEY `idx_librocategoria_libroID` (`LibroID`);

--
-- Indices de la tabla `libroeditorial`
--
ALTER TABLE `libroeditorial`
  ADD PRIMARY KEY (`LibroID`,`EditorialID`),
  ADD KEY `EditorialID` (`EditorialID`);

--
-- Indices de la tabla `librorecomendado`
--
ALTER TABLE `librorecomendado`
  ADD PRIMARY KEY (`LibroID`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_metodopago_nombre` (`Nombre`);

--
-- Indices de la tabla `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MetodoPagoID` (`MetodoPagoID`);

--
-- Indices de la tabla `privilegio`
--
ALTER TABLE `privilegio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_privilegio_nombre` (`Nombre`);

--
-- Indices de la tabla `tarjetacredito`
--
ALTER TABLE `tarjetacredito`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MetodoPagoID` (`MetodoPagoID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_usuario_email` (`Email`),
  ADD KEY `fk_privilegio` (`privilegio_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `idx_venta_fecha` (`Fecha`);

--
-- Indices de la tabla `ventadetalle`
--
ALTER TABLE `ventadetalle`
  ADD PRIMARY KEY (`VentaID`,`LibroID`),
  ADD KEY `LibroID` (`LibroID`),
  ADD KEY `idx_ventadetalle_precio` (`Precio`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`UsuarioID`,`LibroID`),
  ADD KEY `idx_FechaAgregado` (`FechaAgregado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `privilegio`
--
ALTER TABLE `privilegio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autorcategoria`
--
ALTER TABLE `autorcategoria`
  ADD CONSTRAINT `autorcategoria_ibfk_1` FOREIGN KEY (`AutorID`) REFERENCES `autor` (`ID`),
  ADD CONSTRAINT `autorcategoria_ibfk_2` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`ID`);

--
-- Filtros para la tabla `bestseller`
--
ALTER TABLE `bestseller`
  ADD CONSTRAINT `bestseller_ibfk_1` FOREIGN KEY (`LibroID`) REFERENCES `libro` (`ID`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libro` (`ID`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`AutorID`) REFERENCES `autor` (`ID`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`EditorialID`) REFERENCES `editorial` (`ID`),
  ADD CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`ID`);

--
-- Filtros para la tabla `librocategoria`
--
ALTER TABLE `librocategoria`
  ADD CONSTRAINT `librocategoria_ibfk_1` FOREIGN KEY (`LibroID`) REFERENCES `libro` (`ID`),
  ADD CONSTRAINT `librocategoria_ibfk_2` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`ID`);

--
-- Filtros para la tabla `libroeditorial`
--
ALTER TABLE `libroeditorial`
  ADD CONSTRAINT `libroeditorial_ibfk_1` FOREIGN KEY (`LibroID`) REFERENCES `libro` (`ID`),
  ADD CONSTRAINT `libroeditorial_ibfk_2` FOREIGN KEY (`EditorialID`) REFERENCES `editorial` (`ID`);

--
-- Filtros para la tabla `librorecomendado`
--
ALTER TABLE `librorecomendado`
  ADD CONSTRAINT `librorecomendado_ibfk_1` FOREIGN KEY (`LibroID`) REFERENCES `libro` (`ID`);

--
-- Filtros para la tabla `paypal`
--
ALTER TABLE `paypal`
  ADD CONSTRAINT `paypal_ibfk_1` FOREIGN KEY (`MetodoPagoID`) REFERENCES `metodopago` (`ID`);

--
-- Filtros para la tabla `tarjetacredito`
--
ALTER TABLE `tarjetacredito`
  ADD CONSTRAINT `tarjetacredito_ibfk_1` FOREIGN KEY (`MetodoPagoID`) REFERENCES `metodopago` (`ID`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_privilegio` FOREIGN KEY (`privilegio_id`) REFERENCES `privilegio` (`ID`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`ID`);

--
-- Filtros para la tabla `ventadetalle`
--
ALTER TABLE `ventadetalle`
  ADD CONSTRAINT `ventadetalle_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `venta` (`ID`),
  ADD CONSTRAINT `ventadetalle_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libro` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

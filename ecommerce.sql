-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2024 a las 23:21:50
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
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'FUTBOL', '20240819064157.jpg', 1),
(2, 'BASQUET', '20240819064219.jpg', 1),
(3, 'CICLISMO', '20240819064237.jpg', 1),
(4, 'SKATE', '20240819064253.jpg', 1),
(5, 'VOLEY', '20240819064309.jpg', 1),
(6, 'RUGBY', '20240819064324.jpg', 1),
(7, 'PATIN', '20240819064348.jpg', 1),
(8, 'ESCALADA', '20240819064435.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `host_smtp` varchar(100) NOT NULL,
  `user_smtp` varchar(100) NOT NULL,
  `pass_smtp` varchar(100) NOT NULL,
  `puerto_smtp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'Carrito de compras', '1122334455', 'elias@gmail.com', 'Argentina', 'smtp.gmail.com', 'elias@gmail.com', 'ikhnyjislfpyzhgj', 111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `cantidad`, `precio`, `producto`, `id_producto`, `id_venta`) VALUES
(1, 1, 290000.00, 'Pelota Voley', 5, 1),
(2, 1, 290000.00, 'Pelota Voley', 5, 2),
(3, 1, 380000.00, 'Pelota', 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ventas` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Casco Bicicleta', 'Casco Bicicleta 25 Ventilaciones Alpine Skate Con Regulación Color Negro/gris Talle 54-61cm', 13500.00, 30, 0, '20240819071858.jpg', 1, 3),
(2, 'Mountain bike', 'Mountain bike Fire Bird Eco R29 21v frenos de disco mecánico color negro/verde', 346000.00, 10, 0, '20240819071743.jpg', 1, 3),
(3, 'Pelota Basquet', 'Pelota De Basquet Basket Molten N*7 Gr7 Vulcanizada - Bsfit. Color Naranja', 43000.00, 80, 0, '20240819071352.jpg', 1, 2),
(4, 'Red voley', 'Red De Voley 3,50 Mts Tensor De Soga Banda Superior Color Blanco', 15000.00, 0, 0, '20240819071229.jpg', 0, 5),
(5, 'Pelota Voley', 'Pelota Voley Molten', 290000.00, 23, 2, '20240819071115.jpg', 1, 5),
(6, 'Pelota', 'Pelota Mundial Qatar 2022', 380000.00, 39, 1, '20240819071006.jpg', 1, 1),
(7, 'Skateboard Pokemon', 'Skateboard Santa Cruz x Pokemon', 500000.00, 10, 0, '20240819070754.jpg', 1, 4),
(8, 'Patines azules', 'Patines azules', 80000.00, 20, 0, '20240819072537.jpg', 1, 7),
(9, 'Aro de basquet', 'Aro de basquet', 15000.00, 40, 0, '20240819073507.jpg', 1, 2),
(10, 'Balón de rugby', 'Balón de rugby', 20000.00, 41, 0, '20240819073714.jpg', 1, 6),
(11, 'Casco de rugby', 'Casco de rugby', 159000.00, 40, 0, '20240819073845.jpg', 0, 6),
(12, 'Mosqueton', 'Mosqueton con seguro', 16000.00, 79, 0, '20240819074004.jpg', 1, 8),
(13, 'Zapatillas De Escalada', 'Zapatillas De Escalada Tenaya Arai', 175000.00, 45, 0, '20240819074329.jpg', 0, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'ana.info1999@gmail.com', 'admin', 'ADMINISTRADOR', '$2y$10$YJPEpg7HtOh4dkGwyi2HeeZokS6oJcwi4ttaav/pSDecXaXyuFIGi', 'PERÚ', 1, NULL, 0, NULL, 1),
(5, 'info@gmail.com', 'Ana Lopez', NULL, '$2y$10$IU0DrPBACYGug8YsXmKZyONddMoPawVy0XoRqSmW90Tqh7GEHfHD.', NULL, 2, NULL, 0, NULL, 1),
(6, 'yuli@gmail.com', 'Yuli Lopez', NULL, '$2y$10$1Q3quBslnwBhbuQ1QLJlPOfe92s57H94769tfr2G.YYUL.a8BC132', NULL, 2, NULL, 0, NULL, 1),
(7, 'yuliasencios@gmail.com', 'Yuli Asencios', NULL, '$2y$10$m68Aty7PfV8Rr5uak01byOoh6tZJucKn7W8Vx4UuLPRZGNhzMmqcu', NULL, 2, NULL, 0, NULL, 0),
(8, 'yampier19es@gmail.com', 'oscar', NULL, '$2y$10$DznN1c/FoYXtE4.5FzCWNuoOdj88splT9B66GJLvw5jTaSH3CueEi', NULL, 2, NULL, 0, NULL, 1),
(9, 'andresramos@gmail.com', 'admin', 'administrador', '$2y$10$v6q6YmQkvXgUrWYJB2f5/eK9wYsNC2HZwyyEt7cAL5XTvOBZO8tWC', 'bolivia', 1, NULL, 0, NULL, 1),
(10, 'virgo13alexa@gmail.com', 'Andrea', NULL, '$2y$10$nslhkvepnIn3.X6wn32Yy.lm9IEUTQRqQGbseDrE/YFdJrH/QjZJ2', NULL, 2, NULL, 0, NULL, 1),
(11, 'elias@gmail.com', 'elias', 'administrador', '$2y$10$By7oSjspvgPebQ0hn4TD6eTorrVhUIpnxGNxR1CLoBLTrx94gbEiq', NULL, 1, NULL, 0, NULL, 1),
(12, 'admin123@gmail.com', 'elias', NULL, '$2y$10$Q51VZXKHB0dlseYGeGBNeOdXFLmtgKl31QMpv/ufW2LOQsNmRvVD2', NULL, 2, NULL, 0, NULL, 1),
(13, 'elias889@gmail.com', 'elias', NULL, '$2y$10$GRdSxQ0SR6JKB7P5gQ3CSeT.dIwuZEcuQYM/4.iHZp3VEJEsQQN36', NULL, 2, NULL, 0, NULL, 1),
(14, 'ayalaleandro@gmail.como', 'Leandro', NULL, '$2y$10$IKVvbr/g8sWU1v0MxdcIVeWs4unDrsbhCd7qdaPmkDqX9hYOq4zJa', NULL, 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) NOT NULL DEFAULT 1,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `total`, `pago`, `nombre`, `apellido`, `direccion`, `telefono`, `ciudad`, `pais`, `cod`, `envio`, `fecha`, `proceso`, `tipo`, `estado`, `id_usuario`) VALUES
(1, NULL, 290000.00, 222.00, 'elias ', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '2024-08-19 15:51:23', 1, 2, 1, 1),
(2, NULL, 290000.00, 290000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '2024-08-19 15:52:27', 1, 2, 1, 1),
(3, NULL, 380000.00, 380000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '2024-08-19 15:54:33', 1, 2, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

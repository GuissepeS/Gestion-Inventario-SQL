-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sis_inventario
DROP DATABASE IF EXISTS `sis_inventario`;
CREATE DATABASE IF NOT EXISTS `sis_inventario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sis_inventario`;

-- Volcando estructura para tabla sis_inventario.almacenes
DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE IF NOT EXISTS `almacenes` (
  `id_almacen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `direccion` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.almacenes: ~2 rows (aproximadamente)
DELETE FROM `almacenes`;
INSERT INTO `almacenes` (`id_almacen`, `nombre`, `direccion`, `estado`) VALUES
	(1, 'Almacén Central', 'Av. Industrial 100, Lima', 1),
	(2, 'Sucursal Arequipa', 'Calle Comercio 200, Arequipa', 1);

-- Volcando estructura para tabla sis_inventario.categorias
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `descripción` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.categorias: ~4 rows (aproximadamente)
DELETE FROM `categorias`;
INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripción`, `estado`) VALUES
	(1, 'Electronica', 'Productos electronicos', 1),
	(2, 'Ropa', 'Vestimenta para todas las edades', 1),
	(3, 'Hogar', 'Articulos para el hogar', 1),
	(4, 'Deportes', 'Productos deportivos y de ejercicio', 1);

-- Volcando estructura para tabla sis_inventario.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `telefono` varchar(20) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `direccion` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.clientes: ~4 rows (aproximadamente)
DELETE FROM `clientes`;
INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`, `email`, `direccion`, `estado`) VALUES
	(1, 'Juan Pérez', '999888777', 'juan.perez@email.com', 'Av. Siempre Viva 123, Lima', 1),
	(2, 'María Gómez', '988777666', 'maria.gomez@email.com', 'Calle Primavera 456, Arequipa', 1),
	(3, 'Carlos Rivera', '977666555', 'carlos.rivera@email.com', 'Jr. Los Andes 789, Cusco', 1),
	(4, 'Luis Torres', '987654321', 'luis.torres@email.com', 'Av. Principal 456, Lima', 1);

-- Volcando estructura para tabla sis_inventario.compras
DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL DEFAULT 0,
  `fecha_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` enum('pendiente','completada','cancelada') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.compras: ~2 rows (aproximadamente)
DELETE FROM `compras`;
INSERT INTO `compras` (`id_compra`, `id_proveedor`, `fecha_compra`, `total`, `estado`) VALUES
	(1, 1, '2025-01-15 05:00:00', 5000.00, 'completada'),
	(2, 2, '2025-01-18 05:00:00', 1200.00, 'pendiente');

-- Volcando estructura para tabla sis_inventario.detalle_compras
DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE IF NOT EXISTS `detalle_compras` (
  `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NOT NULL DEFAULT 0,
  `id_producto` int(11) NOT NULL DEFAULT 0,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_producto` (`id_producto`),
  KEY `id_orden_compra` (`id_compra`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.detalle_compras: ~3 rows (aproximadamente)
DELETE FROM `detalle_compras`;
INSERT INTO `detalle_compras` (`id_detalle_compra`, `id_compra`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
	(1, 1, 1, 5, 2000.00, 10000.00),
	(2, 1, 3, 10, 150.00, 1500.00),
	(3, 2, 2, 20, 25.00, 500.00);

-- Volcando estructura para tabla sis_inventario.detalle_ventas
DROP TABLE IF EXISTS `detalle_ventas`;
CREATE TABLE IF NOT EXISTS `detalle_ventas` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL DEFAULT 0,
  `id_producto` int(11) NOT NULL DEFAULT 0,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.detalle_ventas: ~2 rows (aproximadamente)
DELETE FROM `detalle_ventas`;
INSERT INTO `detalle_ventas` (`id_detalle_venta`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
	(1, 1, 2, 2, 45.00, 90.00),
	(2, 2, 4, 1, 180.00, 180.00);

-- Volcando estructura para tabla sis_inventario.devoluciones
DROP TABLE IF EXISTS `devoluciones`;
CREATE TABLE IF NOT EXISTS `devoluciones` (
  `id_devolucion` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT 0,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `tipo_devolucion` enum('cliente','proveedor') NOT NULL,
  `motivo` text NOT NULL,
  `fecha_devolucion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_devolucion`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.devoluciones: ~0 rows (aproximadamente)
DELETE FROM `devoluciones`;

-- Volcando estructura para tabla sis_inventario.historial_precios
DROP TABLE IF EXISTS `historial_precios`;
CREATE TABLE IF NOT EXISTS `historial_precios` (
  `id_historial_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT 0,
  `precio_anterior` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_nuevo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha_cambio` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_historial_precio`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.historial_precios: ~0 rows (aproximadamente)
DELETE FROM `historial_precios`;

-- Volcando estructura para tabla sis_inventario.inventario
DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL,
  `cantidad_actual` int(11) NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_inventario`),
  KEY `id_almacen` (`id_almacen`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.inventario: ~3 rows (aproximadamente)
DELETE FROM `inventario`;
INSERT INTO `inventario` (`id_inventario`, `id_producto`, `id_almacen`, `cantidad_actual`, `fecha_actualizacion`) VALUES
	(1, 1, 1, 30, '2025-01-31 06:58:00'),
	(2, 2, 2, 47, '2025-01-31 07:12:29'),
	(3, 3, 1, 15, '2025-01-31 06:58:00');

-- Volcando estructura para tabla sis_inventario.metodos_pagos
DROP TABLE IF EXISTS `metodos_pagos`;
CREATE TABLE IF NOT EXISTS `metodos_pagos` (
  `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.metodos_pagos: ~3 rows (aproximadamente)
DELETE FROM `metodos_pagos`;
INSERT INTO `metodos_pagos` (`id_metodo_pago`, `nombre`, `descripcion`) VALUES
	(1, 'Efectivo', 'Pago en efectivo en tienda'),
	(2, 'Tarjeta de Crédito', 'Pago con tarjeta VISA, Mastercard'),
	(3, 'Transferencia Bancaria', 'Pago mediante depósito bancario');

-- Volcando estructura para tabla sis_inventario.movimientos_inventario
DROP TABLE IF EXISTS `movimientos_inventario`;
CREATE TABLE IF NOT EXISTS `movimientos_inventario` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp(),
  `motivo` text NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.movimientos_inventario: ~3 rows (aproximadamente)
DELETE FROM `movimientos_inventario`;
INSERT INTO `movimientos_inventario` (`id_movimiento`, `id_producto`, `tipo_movimiento`, `cantidad`, `fecha_movimiento`, `motivo`) VALUES
	(1, 1, 'entrada', 10, '2025-01-10 05:00:00', 'Compra de proveedor'),
	(2, 2, 'salida', 5, '2025-01-15 05:00:00', 'Venta a cliente'),
	(3, 3, 'entrada', 8, '2025-01-20 05:00:00', 'Recepción de mercancía');

-- Volcando estructura para tabla sis_inventario.productos
DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `descripcion` text NOT NULL,
  `id_categoria` int(11) NOT NULL DEFAULT 0,
  `precio_compra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock_minimo` int(11) NOT NULL DEFAULT 0,
  `stock_maximo` int(11) NOT NULL DEFAULT 0,
  `id_proveedor` int(11) NOT NULL DEFAULT 0,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.productos: ~4 rows (aproximadamente)
DELETE FROM `productos`;
INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `id_categoria`, `precio_compra`, `precio_venta`, `stock_minimo`, `stock_maximo`, `id_proveedor`, `estado`, `fecha_creacion`) VALUES
	(1, 'Laptop Dell Inspiron', 'Laptop de 15 pulgadas con 8GB RAM', 1, 2000.00, 2500.00, 5, 50, 1, 1, '2025-01-31 06:49:59'),
	(2, 'Camiseta Deportiva', 'Camiseta transpirable para hacer ejercicio', 2, 25.00, 45.00, 10, 100, 2, 1, '2025-01-31 06:49:59'),
	(3, 'Silla de Oficina', 'Silla ergonómica con respaldo ajustable', 3, 150.00, 250.00, 5, 30, 3, 1, '2025-01-31 06:49:59'),
	(4, 'Mancuernas 10kg', 'Par de mancuernas de hierro', 4, 100.00, 180.00, 5, 20, 3, 1, '2025-01-31 06:49:59');

-- Volcando estructura para tabla sis_inventario.proveedores
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) NOT NULL DEFAULT '0',
  `ruc` varchar(20) NOT NULL DEFAULT '0',
  `direccion` text NOT NULL,
  `telefono` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `ruc` (`ruc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.proveedores: ~4 rows (aproximadamente)
DELETE FROM `proveedores`;
INSERT INTO `proveedores` (`id_proveedor`, `razon_social`, `ruc`, `direccion`, `telefono`, `email`, `estado`) VALUES
	(1, 'TechSupply', '4587120369541', 'Av. Tecnologica 153, Lima', '987452163', 'contacto@techsupply.com', 1),
	(2, 'ModaExpress', '7534126984123', 'Calle Central 756, Trujillo', '921453687', 'ventas@modaexpress.com', 1),
	(3, 'HogarPerfecto', '7532148523690', 'Av. Los Alamos 123, Piura', '902103741', 'hogar@perfecto.com', 1),
	(4, 'PesaGym', '3541020360075', 'Calle Toronto 002, Tumbes', '900753148', 'fitness@pesagym.com', 1);

-- Volcando estructura para tabla sis_inventario.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.roles: ~3 rows (aproximadamente)
DELETE FROM `roles`;
INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`) VALUES
	(1, 'Administrador', ''),
	(2, 'Almacenero', ''),
	(3, 'Vendedor', '');

-- Volcando estructura para tabla sis_inventario.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '0',
  `id_rol` int(11) NOT NULL DEFAULT 0,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.usuarios: ~3 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`, `id_rol`, `estado`, `fecha_creacion`) VALUES
	(1, 'Smith', 'smith@gmail.com', 'smith', 1, 1, '2025-01-31 06:34:41'),
	(2, 'Juan', 'juancito@hotmail.com', 'josue', 2, 1, '2025-01-31 06:36:44'),
	(3, 'Maria', 'mari123@gmail.com', 'maricita', 3, 1, '2025-01-31 06:39:47');

-- Volcando estructura para tabla sis_inventario.ventas
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL DEFAULT 0,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_metodo_pago` int(11) NOT NULL DEFAULT 0,
  `estado` enum('pendiente','pagada','anulada') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_metodo_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_inventario.ventas: ~2 rows (aproximadamente)
DELETE FROM `ventas`;
INSERT INTO `ventas` (`id_venta`, `id_cliente`, `fecha_venta`, `total`, `id_metodo_pago`, `estado`) VALUES
	(1, 1, '2025-01-20 05:00:00', 500.00, 1, 'pagada'),
	(2, 2, '2025-01-22 05:00:00', 750.00, 2, 'pendiente');

-- Volcando estructura para vista sis_inventario.vista_compras_proveedores
DROP VIEW IF EXISTS `vista_compras_proveedores`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_compras_proveedores` (
	`id_compra` INT(11) NOT NULL,
	`proveedor` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`producto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cantidad` INT(11) NOT NULL,
	`precio_unitario` DECIMAL(10,2) NOT NULL,
	`subtotal` DECIMAL(10,2) NOT NULL,
	`fecha_compra` TIMESTAMP NOT NULL,
	`estado` ENUM('pendiente','completada','cancelada') NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista sis_inventario.vista_productos_stock
DROP VIEW IF EXISTS `vista_productos_stock`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_productos_stock` (
	`id_producto` INT(11) NOT NULL,
	`producto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`categoria` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`stock_disponible` INT(11) NOT NULL,
	`proveedor` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista sis_inventario.vista_ventas_detalles
DROP VIEW IF EXISTS `vista_ventas_detalles`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_ventas_detalles` (
	`id_venta` INT(11) NOT NULL,
	`cliente` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`producto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cantidad` INT(11) NOT NULL,
	`precio_unitario` DECIMAL(10,2) NOT NULL,
	`subtotal` DECIMAL(10,2) NOT NULL,
	`fecha_venta` TIMESTAMP NOT NULL,
	`metodo_pago` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`estado` ENUM('pendiente','pagada','anulada') NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento sis_inventario.actualizar_stock
DROP PROCEDURE IF EXISTS `actualizar_stock`;
DELIMITER //
CREATE PROCEDURE `actualizar_stock`(
    IN p_id_producto INT,
    IN p_cantidad_vendida INT
)
BEGIN
    UPDATE inventario
    SET cantidad_actual = cantidad_actual - p_cantidad_vendida
    WHERE id_producto = p_id_producto;
END//
DELIMITER ;

-- Volcando estructura para procedimiento sis_inventario.insertar_cliente
DROP PROCEDURE IF EXISTS `insertar_cliente`;
DELIMITER //
CREATE PROCEDURE `insertar_cliente`(
    IN p_nombre VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_direccion TEXT
)
BEGIN
    INSERT INTO clientes (nombre, telefono, email, direccion, estado) 
    VALUES (p_nombre, p_telefono, p_email, p_direccion, 1);
END//
DELIMITER ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_compras_proveedores`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_compras_proveedores` AS SELECT 
    c.id_compra,
    pr.razon_social AS proveedor,
    p.nombre AS producto,
    dc.cantidad,
    dc.precio_unitario,
    dc.subtotal,
    c.fecha_compra,
    c.estado
FROM compras c
JOIN proveedores pr ON c.id_proveedor = pr.id_proveedor
JOIN detalle_compras dc ON c.id_compra = dc.id_compra
JOIN productos p ON dc.id_producto = p.id_producto ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_productos_stock`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_productos_stock` AS SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    i.cantidad_actual AS stock_disponible,
    pr.razon_social AS proveedor
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
JOIN inventario i ON p.id_producto = i.id_producto
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor
WHERE i.cantidad_actual > 0 ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_ventas_detalles`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_ventas_detalles` AS SELECT 
    v.id_venta,
    c.nombre AS cliente,
    p.nombre AS producto,
    dv.cantidad,
    dv.precio_unitario,
    dv.subtotal,
    v.fecha_venta,
    mp.nombre AS metodo_pago,
    v.estado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
JOIN productos p ON dv.id_producto = p.id_producto
JOIN metodos_pagos mp ON v.id_metodo_pago = mp.id_metodo_pago ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

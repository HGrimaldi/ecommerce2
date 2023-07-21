-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2023 a las 03:08:04
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

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
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrador', '1', 1677807726),
('DemoRol', '2', 1677807737);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/clientes/*', 2, NULL, NULL, NULL, 1685377159, 1685377159),
('/compras/*', 2, NULL, NULL, NULL, 1684893597, 1684893597),
('/compras/compras/view', 2, NULL, NULL, NULL, 1685826451, 1685826451),
('/compras/proveedores/*', 2, NULL, NULL, NULL, 1683336636, 1683336636),
('/debug/*', 2, NULL, NULL, NULL, 1677807204, 1677807204),
('/gii/*', 2, NULL, NULL, NULL, 1677807211, 1677807211),
('/gridview/*', 2, NULL, NULL, NULL, 1677807174, 1677807174),
('/ordenes/*', 2, NULL, NULL, NULL, 1686256334, 1686256334),
('/productos/categorias/*', 2, NULL, NULL, NULL, 1682216083, 1682216083),
('/productos/marcas/*', 2, NULL, NULL, NULL, 1681526290, 1681526290),
('/productos/productos/*', 2, NULL, NULL, NULL, 1682216107, 1682216107),
('/productos/sub-categorias/*', 2, NULL, NULL, NULL, 1682216092, 1682216092),
('/rbac/*', 2, NULL, NULL, NULL, 1677807195, 1677807195),
('/site/*', 2, NULL, NULL, NULL, 1677807256, 1677807256),
('/usuarios/*', 2, NULL, NULL, NULL, 1677807263, 1677807263),
('Administrador', 1, 'Rol de Administrador del sistema', NULL, NULL, 1677807604, 1677807684),
('DemoRol', 1, 'Rol para demosntacion', NULL, NULL, 1677807665, 1677807665),
('PermisoAdmin', 2, 'Este es el permiso para el administrador', NULL, NULL, 1677807368, 1677807368),
('PermisoDemo', 2, 'Este es un permiso para DEmostracion', NULL, NULL, 1677807505, 1677807505);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Administrador', '/compras/*'),
('Administrador', '/ordenes/*'),
('Administrador', 'PermisoAdmin'),
('DemoRol', 'PermisoDemo'),
('PermisoAdmin', '/clientes/*'),
('PermisoAdmin', '/compras/*'),
('PermisoAdmin', '/compras/proveedores/*'),
('PermisoAdmin', '/debug/*'),
('PermisoAdmin', '/gii/*'),
('PermisoAdmin', '/gridview/*'),
('PermisoAdmin', '/productos/categorias/*'),
('PermisoAdmin', '/productos/marcas/*'),
('PermisoAdmin', '/productos/productos/*'),
('PermisoAdmin', '/productos/sub-categorias/*'),
('PermisoAdmin', '/rbac/*'),
('PermisoAdmin', '/site/*'),
('PermisoAdmin', '/usuarios/*'),
('PermisoDemo', '/gridview/*'),
('PermisoDemo', '/productos/marcas/*'),
('PermisoDemo', '/site/*');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `id_registro` int(11) NOT NULL,
  `controlador` varchar(25) NOT NULL,
  `accion` varchar(25) NOT NULL,
  `data_original` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_original`)),
  `data_modificada` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_modificada`)),
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(1, 1, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/paebGYEuxIqSPddKag9jMYRbe-D-V_NW.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-19 19:37:39\", \"fecha_mod\": \"2023-04-19 19:37:39\", \"descripcion\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-19 19:37:39'),
(2, 2, 'marcas', 'create', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/ZXWjOIfROfoMNn9cyccip660xR-xT5pj.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', NULL, 1, '2023-04-22 14:25:54'),
(3, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 14:43:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 14:43:26'),
(4, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/5j1uOPuPZRDC2GKlQBz0m-9bhxG5V-dd.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 15:26:00\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 15:26:00'),
(5, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 17:07:01\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 17:07:01'),
(6, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 17:07:23\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 17:07:23'),
(7, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 17:07:30\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 17:07:30'),
(8, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:10\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 19:15:10'),
(9, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:10\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-04-22 19:15:57'),
(10, 2, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 14:43:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-22 19:19:24'),
(11, 2, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:19:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:19:24'),
(12, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:15:57'),
(13, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 1\\n}\"', 1, '2023-04-22 19:20:00'),
(14, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:20:00\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-22 19:20:03'),
(15, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:20:03\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 19:28:33'),
(16, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:28:38\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:28:38'),
(17, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:19:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 19:30:28'),
(18, 2, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:30:41\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:30:41'),
(19, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:28:38\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 19:32:51'),
(20, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:32:51\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:33:06'),
(21, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/gmRCncyjJjzf9vnGn_P9CDKEYxZlsxml.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:53:33\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/gmRCncyjJjzf9vnGn_P9CDKEYxZlsxml.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:55:14'),
(22, 6, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 6,\\n    \\\"nombre\\\": \\\"SAMSUNG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/5xM1drUxNFPMTphqf5_9UijHb9JdMNy_.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:59:09\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 20:12:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/5xM1drUxNFPMTphqf5_9UijHb9JdMNy_.webp\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:55:41'),
(23, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/YGFF3pZmpaAS0t-AR5f_CruEO9NXF99Q.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:57:30\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/YGFF3pZmpaAS0t-AR5f_CruEO9NXF99Q.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:56:50'),
(24, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:56:50\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:56:59'),
(25, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/WjjeYPyfeF6JxyZOSpJ7DDu6UHGn2QhC.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:56:59\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/WjjeYPyfeF6JxyZOSpJ7DDu6UHGn2QhC.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:57:10'),
(26, 3, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 3,\\n    \\\"nombre\\\": \\\"Microsoft\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/_4UInbmqWatnZKSptJhF52mYeK4a-W4x.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-12 19:57:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-20 20:08:05\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/_4UInbmqWatnZKSptJhF52mYeK4a-W4x.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:57:25'),
(27, 3, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 3,\\n    \\\"nombre\\\": \\\"Microsoft\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-12 19:57:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:57:25\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:57:35'),
(28, 4, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 4,\\n    \\\"nombre\\\": \\\"LG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/a94XiV9-sNGZpYGPdNwNrnXY5rCyHD7C.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-13 19:58:18\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:58:18\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/a94XiV9-sNGZpYGPdNwNrnXY5rCyHD7C.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:57:54'),
(29, 4, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 4,\\n    \\\"nombre\\\": \\\"LG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-13 19:58:18\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:57:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:58:02'),
(30, 5, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 5,\\n    \\\"nombre\\\": \\\"Apple\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/-Aw4nPg0nQztNz0woYWLB0EDUijPD4mx.jpeg\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/-Aw4nPg0nQztNz0woYWLB0EDUijPD4mx.jpeg\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:58:17'),
(31, 5, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 5,\\n    \\\"nombre\\\": \\\"Apple\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/-Aw4nPg0nQztNz0woYWLB0EDUijPD4mx.jpeg\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:58:17\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-04-22 20:58:24'),
(32, 5, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 5,\\n    \\\"nombre\\\": \\\"Apple\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/-Aw4nPg0nQztNz0woYWLB0EDUijPD4mx.jpeg\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:58:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:58:31'),
(33, 5, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 5,\\n    \\\"nombre\\\": \\\"Apple\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:58:31\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:58:40'),
(34, 1, 'categorias', 'update', '\"{\\n    \\\"id_categoria\\\": 1,\\n    \\\"nombre\\\": \\\"Tecnolog\\\\u00eda\\\",\\n    \\\"descripcion\\\": \\\"<h5><font style=\\\\\\\"background-color: rgb(255, 255, 0);\\\\\\\" color=\\\\\\\"#000000\\\\\\\">The standard Lorem Ipsum passage, used since the 1500s<\\\\/font><\\\\/h5><p>\\\\\\\"Lorem\\\\r\\\\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\\\r\\\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat.\\\\\\\"<\\\\/p><p><\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-09 19:09:17\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-11 02:34:33\\\",\\n    \\\"id_usuario_mod\\\": 2,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"nombre\\\": \\\"Tecnolog\\\\u00eda\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 20:59:29'),
(35, 2, 'categorias', 'delete', '\"{\\n    \\\"id_categoria\\\": 2,\\n    \\\"nombre\\\": \\\"Hogar\\\",\\n    \\\"descripcion\\\": \\\"\\\\\\\"Lorem\\\\r\\\\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\\\r\\\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat.\\\\\\\"<br><p><\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-09 19:11:56\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-09 19:16:58\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-22 21:02:57'),
(36, 2, 'categorias', 'update', '\"{\\n    \\\"id_categoria\\\": 2,\\n    \\\"nombre\\\": \\\"Hogar\\\",\\n    \\\"descripcion\\\": \\\"\\\\\\\"Lorem\\\\r\\\\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\\\r\\\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat.\\\\\\\"<br><p><\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-09 19:11:56\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 21:02:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 21:03:14'),
(37, 2, 'categorias', 'update', '\"{\\n    \\\"id_categoria\\\": 2,\\n    \\\"nombre\\\": \\\"Hogar\\\",\\n    \\\"descripcion\\\": \\\"\\\\\\\"Lorem\\\\r\\\\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\\\r\\\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat.\\\\\\\"<br><p><\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-09 19:11:56\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 21:03:14\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-04-23 14:13:48'),
(38, 2, 'categorias', 'update', '\"{\\n    \\\"id_categoria\\\": 2,\\n    \\\"nombre\\\": \\\"Hogar\\\",\\n    \\\"descripcion\\\": \\\"\\\\\\\"Lorem\\\\r\\\\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\\\r\\\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat.\\\\\\\"<br><p><\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-09 19:11:56\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 14:13:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-23 14:13:56'),
(39, 5, 'categorias', 'create', '\"{\\n    \\\"id_categoria\\\": 5,\\n    \\\"nombre\\\": \\\"Limpieza\\\",\\n    \\\"descripcion\\\": \\\"<h5 style=\\\\\\\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41);\\\\\\\"><font color=\\\\\\\"#000000\\\\\\\" style=\\\\\\\"background-color: rgb(255, 255, 0);\\\\\\\">The standard Lorem Ipsum passage, used since the 1500s<\\\\/font><\\\\/h5><p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\\\\\\\"<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 14:15:33\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 14:15:33\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-04-23 14:15:33'),
(40, 9, 'sub-categorias', 'delete', '\"{\\n    \\\"id_sub_categoria\\\": 9,\\n    \\\"id_categoria\\\": 3,\\n    \\\"nombre\\\": \\\"Refrigeradoras\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 01:42:26\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-11 01:42:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-23 14:50:47'),
(41, 9, 'sub-categorias', 'update', '\"{\\n    \\\"id_sub_categoria\\\": 9,\\n    \\\"id_categoria\\\": \\\"3\\\",\\n    \\\"nombre\\\": \\\"Refrigeradoras\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 01:42:26\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 14:50:47\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"3\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-23 15:06:09'),
(42, 2, 'sub-categorias', 'delete', '\"{\\n    \\\"id_sub_categoria\\\": 2,\\n    \\\"id_categoria\\\": 1,\\n    \\\"nombre\\\": \\\"Video Juegos\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 01:42:26\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-11 01:42:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-23 15:11:23'),
(43, 2, 'sub-categorias', 'update', '\"{\\n    \\\"id_sub_categoria\\\": 2,\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"nombre\\\": \\\"Video Juegos\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 01:42:26\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 15:11:23\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-23 15:11:57'),
(44, 1, 'productos', 'create', '\"{\\n    \\\"id_producto\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo Switch\\\",\\n    \\\"sku\\\": \\\"1223345678\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"2\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:40:28\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:40:28\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-04-23 16:40:28'),
(45, 1, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo Switch\\\",\\n    \\\"sku\\\": \\\"1223345678\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500.00\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:40:28\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:40:28\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-04-23 16:40:48'),
(46, 2, 'productos', 'create', '\"{\\n    \\\"id_producto\\\": 2,\\n    \\\"nombre\\\": \\\"PlayStation\\\",\\n    \\\"sku\\\": \\\"1223345679\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"2\\\",\\n    \\\"id_marca\\\": \\\"2\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:41:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:41:55\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-04-23 16:41:55'),
(47, 1, 'productos', 'delete', '\"{\\n    \\\"id_producto\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo Switch\\\",\\n    \\\"sku\\\": \\\"1223345678\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 1,\\n    \\\"id_marca\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:40:28\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:40:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-23 16:40:48'),
(48, 2, 'productos', 'delete', '\"{\\n    \\\"id_producto\\\": 2,\\n    \\\"nombre\\\": \\\"PlayStation\\\",\\n    \\\"sku\\\": \\\"1223345679\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 2,\\n    \\\"id_marca\\\": 2,\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:41:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:41:55\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-23 16:43:21'),
(49, 1, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo Switch\\\",\\n    \\\"sku\\\": \\\"1223345678\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500.00\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:40:28\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:40:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-23 16:45:22'),
(50, 3, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 3,\\n    \\\"nombre\\\": \\\"Microsoft\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/s2NNpVwEbcT58t8UEVQOCwwUMjrPEZzz.jpg\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-12 19:57:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 20:57:35\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/s2NNpVwEbcT58t8UEVQOCwwUMjrPEZzz.jpg\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 19:14:13');
INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(51, 5, 'categorias', 'delete', '\"{\\n    \\\"id_categoria\\\": 5,\\n    \\\"nombre\\\": \\\"Limpieza\\\",\\n    \\\"descripcion\\\": \\\"<h5 style=\\\\\\\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41);\\\\\\\"><font color=\\\\\\\"#000000\\\\\\\" style=\\\\\\\"background-color: rgb(255, 255, 0);\\\\\\\">The standard Lorem Ipsum passage, used since the 1500s<\\\\/font><\\\\/h5><p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\\\\\\\"<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 14:15:33\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 14:15:33\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-05-05 20:01:32'),
(52, 1, 'proveedores', 'create', '\"{\\n    \\\"id_proveedor\\\": 1,\\n    \\\"codigo\\\": \\\"1234567\\\",\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p><span style=\\\\\\\"background-color: rgba(0, 0, 0, 0.05);\\\\\\\">\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<\\\\/span><br><\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"telefono\\\": \\\"22336-3444\\\",\\n    \\\"email\\\": \\\"nintendo@nintendo.com\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-05-05 20:21:27\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-05 20:21:27\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-05-05 20:21:27'),
(53, 1, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 1,\\n    \\\"codigo\\\": \\\"1234567\\\",\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p><span style=\\\\\\\"background-color: rgba(0, 0, 0, 0.05);\\\\\\\">\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<\\\\/span><br><\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"telefono\\\": \\\"22336-3444\\\",\\n    \\\"email\\\": \\\"nintendo@nintendo.com\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-05-05 20:21:27\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"fecha_mod\\\": 2023,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-05-05 20:27:52'),
(54, 1, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 1,\\n    \\\"codigo\\\": \\\"1234567\\\",\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p><span style=\\\\\\\"background-color: rgba(0, 0, 0, 0.05);\\\\\\\">\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<\\\\/span><br><\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"telefono\\\": \\\"22336-3444\\\",\\n    \\\"email\\\": \\\"nintendo@nintendo.com\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-05-05 20:21:27\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"fecha_mod\\\": 2023,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-05 20:28:06'),
(55, 1, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 1,\\n    \\\"codigo\\\": \\\"1234567\\\",\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p><span style=\\\\\\\"background-color: rgba(0, 0, 0, 0.05);\\\\\\\">\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<\\\\/span><br><\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"213\\\",\\n    \\\"telefono\\\": \\\"22336-3444\\\",\\n    \\\"email\\\": \\\"nintendo@nintendo.com\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-05-05 20:21:27\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"fecha_mod\\\": 2023,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"213\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-06 20:58:12'),
(56, 3, 'productos', 'create', '\"{\\n    \\\"id_producto\\\": 3,\\n    \\\"nombre\\\": \\\"Super Mario Bros U\\\",\\n    \\\"sku\\\": \\\"773727112\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"56\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"2\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-11 20:15:36\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-11 20:15:36\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-05-11 20:15:36'),
(57, 2, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 2,\\n    \\\"nombre\\\": \\\"PlayStation\\\",\\n    \\\"sku\\\": \\\"1223345679\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"500.00\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"2\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-23 16:41:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-23 16:43:21\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"2\\\",\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-05-11 20:36:47'),
(58, 4, 'productos', 'create', '\"{\\n    \\\"id_producto\\\": 4,\\n    \\\"nombre\\\": \\\"Mario Kart 8\\\",\\n    \\\"sku\\\": \\\"1223345672\\\",\\n    \\\"descripcion\\\": \\\"<p><span style=\\\\\\\"white-space: pre; white-space: normal;\\\\\\\">\\\\t<\\\\/span><\\\\/p><p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"60\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"2\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-11 20:38:24\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-11 20:38:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-05-11 20:38:24'),
(59, 4, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 4,\\n    \\\"nombre\\\": \\\"Mario Kart 8\\\",\\n    \\\"sku\\\": \\\"1223345672\\\",\\n    \\\"descripcion\\\": \\\"<p><span style=\\\\\\\"white-space: pre; white-space: normal;\\\\\\\">\\\\t<\\\\/span><\\\\/p><p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"60.00\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-11 20:38:24\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-11 20:38:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-11 20:39:30'),
(60, 1, 'productos', 'update', '{\n    \"id_producto\": 1,\n    \"nombre\": \"Nintendo Switch\",\n    \"sku\": \"1223345678\",\n    \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<br><\\/p>\",\n    \"precio\": \"500.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-04-23 16:40:28\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-04-23 16:45:22\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 15:58:47'),
(61, 1, 'productos', 'update', '{\n    \"id_producto\": 1,\n    \"nombre\": \"Nintendo Switch\",\n    \"sku\": \"1223345678\",\n    \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<br><\\/p>\",\n    \"precio\": \"500.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-04-23 16:40:28\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-23 15:58:47\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 15:59:26'),
(62, 2, 'productos', 'update', '{\n    \"id_producto\": 2,\n    \"nombre\": \"PlayStation\",\n    \"sku\": \"1223345679\",\n    \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<br><\\/p>\",\n    \"precio\": \"500.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"2\",\n    \"fecha_ing\": \"2023-04-23 16:41:55\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-11 20:36:47\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"2\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 16:05:56'),
(63, 4, 'productos', 'delete', '{\n    \"id_producto\": 4,\n    \"nombre\": \"Mario Kart 8\",\n    \"sku\": \"1223345672\",\n    \"descripcion\": \"<p><span style=\\\"white-space: pre; white-space: normal;\\\">\\t<\\/span><\\/p><p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<\\/p>\",\n    \"precio\": \"60.00\",\n    \"id_categoria\": 1,\n    \"id_sub_categoria\": 1,\n    \"id_marca\": 1,\n    \"fecha_ing\": \"2023-05-11 20:38:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-11 20:39:30\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 1\n}', '{\n    \"estado\": 0\n}', 1, '2023-05-23 16:06:41'),
(64, 3, 'productos', 'update', '{\n    \"id_producto\": 3,\n    \"nombre\": \"Super Mario Bros U\",\n    \"sku\": \"773727112\",\n    \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"<\\/p>\",\n    \"precio\": \"56.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-05-11 20:15:36\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-11 20:15:36\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 16:10:06'),
(65, 4, 'productos', 'update', '{\n    \"id_producto\": 4,\n    \"nombre\": \"Mario Kart 8\",\n    \"sku\": \"1223345672\",\n    \"descripcion\": \"<p><span style=\\\"white-space: pre; white-space: normal;\\\">\\t<\\/span><\\/p><p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<\\/p>\",\n    \"precio\": \"60.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-05-11 20:38:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-23 16:06:41\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 16:12:20'),
(66, 4, 'productos', 'update', '{\n    \"id_producto\": 4,\n    \"nombre\": \"Mario Kart 8\",\n    \"sku\": \"1223345672\",\n    \"descripcion\": \"<p><span style=\\\"white-space: pre; white-space: normal;\\\">\\t<\\/span><\\/p><p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<\\/p>\",\n    \"precio\": \"60.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-05-11 20:38:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-23 16:12:20\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 16:12:46'),
(67, 2, 'proveedores', 'create', '{\n    \"id_proveedor\": 2,\n    \"codigo\": \"PDV-234\",\n    \"nombre\": \"Proveedor2\",\n    \"descripcion\": \"<p>Proveedor2<br><\\/p>\",\n    \"id_departamento\": \"12\",\n    \"id_municipio\": \"79\",\n    \"telefono\": \"34567890\",\n    \"email\": \"preveedor2@gmail.com\",\n    \"id_usuario_ing\": 1,\n    \"fecha_ing\": \"2023-05-23 21:19:09\",\n    \"id_usuario_mod\": 1,\n    \"fecha_mod\": \"2023-05-23 21:19:09\",\n    \"estado\": \"1\"\n}', NULL, 1, '2023-05-23 21:19:09'),
(68, 2, 'proveedores', 'update', '{\n    \"id_proveedor\": 2,\n    \"codigo\": \"PDV-234\",\n    \"nombre\": \"Proveedor2.0\",\n    \"descripcion\": \"<p>Proveedor2<br><\\/p>\",\n    \"id_departamento\": \"12\",\n    \"id_municipio\": \"81\",\n    \"telefono\": \"34567890\",\n    \"email\": \"preveedor2@gmail.com\",\n    \"id_usuario_ing\": 1,\n    \"fecha_ing\": \"2023-05-23 21:19:09\",\n    \"id_usuario_mod\": 1,\n    \"fecha_mod\": 2023,\n    \"estado\": \"1\"\n}', '{\n    \"nombre\": \"Proveedor2.0\",\n    \"id_departamento\": \"12\",\n    \"id_municipio\": \"81\",\n    \"estado\": \"1\"\n}', 1, '2023-05-23 21:24:57'),
(69, 10, 'sub-categorias', 'create', '{\n    \"id_sub_categoria\": 10,\n    \"id_categoria\": \"1\",\n    \"nombre\": \"Telefono Samsung\",\n    \"descripcion\": \"<p>Telefono Samsung<br><\\/p>\",\n    \"fecha_ing\": \"2023-05-24 08:30:00\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-24 08:30:00\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-05-24 08:30:00'),
(70, 5, 'productos', 'create', '{\n    \"id_producto\": 5,\n    \"nombre\": \"Galaxy S23 Ultra \",\n    \"sku\": \"sm-23\",\n    \"descripcion\": \"<p>Galaxy S23 Ultra&nbsp; color verde<br><\\/p>\",\n    \"precio\": \"1200\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"10\",\n    \"id_marca\": \"6\",\n    \"fecha_ing\": \"2023-05-24 08:30:47\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-24 08:30:47\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-05-24 08:30:47'),
(71, 5, 'productos', 'update', '{\n    \"id_producto\": 5,\n    \"nombre\": \"Galaxy S23 Ultra \",\n    \"sku\": \"sm-23\",\n    \"descripcion\": \"<p>Galaxy S23 Ultra&nbsp; color verde<br><\\/p>\",\n    \"precio\": \"1200.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"6\",\n    \"fecha_ing\": \"2023-05-24 08:30:47\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-24 08:30:47\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"6\",\n    \"estado\": \"1\"\n}', 1, '2023-05-24 08:31:21'),
(72, 2, 'compras', 'create', '{\n    \"id_compras\": 2,\n    \"codigo\": \"CMPR-00001\",\n    \"num_factura\": \"0001\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-19\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>contado<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 10:13:38\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 10:13:38\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 10:13:38'),
(73, 3, 'compras', 'create', '{\n    \"id_compras\": 3,\n    \"codigo\": \"CMPR-00002\",\n    \"num_factura\": \"0002\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"1\",\n    \"fecha\": \"2023-5-24\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Credito<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 11:29:50\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:29:50\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 11:29:50'),
(74, 4, 'compras', 'create', '{\n    \"id_compras\": 4,\n    \"codigo\": \"CMPR-00003\",\n    \"num_factura\": \"0002\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-18\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Contado esta<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 11:31:37\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:31:37\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 11:31:37'),
(75, 5, 'compras', 'create', '{\n    \"id_compras\": 5,\n    \"codigo\": \"CMPR-00003\",\n    \"num_factura\": \"0003\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-23\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Con<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 11:34:40\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:34:40\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 11:34:40'),
(76, 6, 'compras', 'create', '{\n    \"id_compras\": 6,\n    \"codigo\": \"CMPR-00004\",\n    \"num_factura\": \"0004\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-23\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>er<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 11:43:50\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:43:50\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 11:43:50'),
(77, 7, 'compras', 'create', '{\n    \"id_compras\": 7,\n    \"codigo\": \"CMPR-00005\",\n    \"num_factura\": \"0006\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-23\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>cop<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 11:45:04\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:45:04\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 11:45:04'),
(78, 8, 'compras', 'create', '{\n    \"id_compras\": 8,\n    \"codigo\": \"CMPR-00006\",\n    \"num_factura\": \"5678\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-20\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>er<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 11:46:20\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:46:20\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 11:46:20'),
(79, 1, 'det-compras', 'create', '{\n    \"id_det_compra\": 1,\n    \"id_compras\": \"8\",\n    \"id_producto\": \"5\",\n    \"cantidad\": \"1\",\n    \"costo\": \"1200\",\n    \"descuento\": \"10\",\n    \"uuid\": \"bed0d27c-c494-4ce0-8a59-c0e1a4694846\",\n    \"fecha_ing\": \"2023-05-25 11:46:30\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 11:46:30\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-05-25 11:46:30'),
(80, 9, 'compras', 'create', '{\n    \"id_compras\": 9,\n    \"codigo\": \"CMPR-00007\",\n    \"num_factura\": \"3456\",\n    \"id_proveedor\": \"2\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>contado<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 12:03:15\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 12:03:15\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 12:03:15'),
(81, 2, 'det-compras', 'create', '{\n    \"id_det_compra\": 2,\n    \"id_compras\": \"9\",\n    \"id_producto\": \"2\",\n    \"cantidad\": \"1\",\n    \"costo\": \"200\",\n    \"descuento\": \"100\",\n    \"uuid\": \"0e8354e4-6878-4d8b-b417-430f00c796d4\",\n    \"fecha_ing\": \"2023-05-25 12:06:35\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 12:06:35\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-05-25 12:06:35'),
(82, 3, 'det-compras', 'create', '{\n    \"id_det_compra\": 3,\n    \"id_compras\": \"9\",\n    \"id_producto\": \"1\",\n    \"cantidad\": \"10\",\n    \"costo\": \"500\",\n    \"descuento\": \"10\",\n    \"uuid\": \"21ffc10e-70bf-48b4-a1e5-de8a97ac9c32\",\n    \"fecha_ing\": \"2023-05-25 12:08:13\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 12:08:13\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-05-25 12:08:13'),
(83, 10, 'compras', 'create', '{\n    \"id_compras\": 10,\n    \"codigo\": \"CMPR-00008\",\n    \"num_factura\": \"0007\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-5-24\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Otra compra<\\/p>\",\n    \"fecha_ing\": \"2023-05-25 18:53:27\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-25 18:53:27\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-05-25 18:53:27'),
(84, 4, 'det-compras', 'create', '{\n    \"id_det_compra\": 4,\n    \"id_compras\": \"3\",\n    \"id_producto\": \"2\",\n    \"cantidad\": \"10\",\n    \"costo\": \"400\",\n    \"descuento\": \"10\",\n    \"uuid\": \"64882c51-4282-4c7b-b8ef-25706e9c1f4c\",\n    \"fecha_ing\": \"2023-05-29 19:26:09\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-29 19:26:09\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-05-29 19:26:09'),
(85, 5, 'det-compras', 'create', '{\n    \"id_det_compra\": 5,\n    \"id_compras\": \"3\",\n    \"id_producto\": \"5\",\n    \"cantidad\": \"5\",\n    \"costo\": \"1200\",\n    \"descuento\": \"5\",\n    \"uuid\": \"9b1a609f-2d8c-4060-bd5d-69dee1314a13\",\n    \"fecha_ing\": \"2023-05-29 20:16:28\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-29 20:16:28\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-05-29 20:16:28'),
(86, 1, 'clientes', 'create', '{\n    \"id_cliente\": 1,\n    \"nombre\": \"Carlos \",\n    \"apellido\": \"Grimaldi\",\n    \"telefono\": \"23457890\",\n    \"email\": \"Carlos@gmail.com\",\n    \"fecha_ing\": \"2023-06-01 09:01:55\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 09:01:55\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-01 09:01:55'),
(87, 2, 'clientes', 'create', '{\n    \"id_cliente\": 2,\n    \"nombre\": \"Ernesto\",\n    \"apellido\": \"Martinez\",\n    \"telefono\": \"12345678\",\n    \"email\": \"Ernesto@gmail.com\",\n    \"fecha_ing\": \"2023-06-01 09:13:14\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 09:13:14\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-01 09:13:14'),
(88, 2, 'clientes', 'update', '{\n    \"id_cliente\": 2,\n    \"nombre\": \"Ernesto\",\n    \"apellido\": \"Martinez\",\n    \"telefono\": \"12345678\",\n    \"email\": \"Ernesto@gmail.com\",\n    \"fecha_ing\": \"2023-06-01 09:13:14\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 09:13:14\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"0\"\n}', '{\n    \"estado\": \"0\"\n}', 1, '2023-06-01 09:13:22'),
(89, 1, 'direcciones', 'create', '{\n    \"id_direcci\\u00f3n\": 1,\n    \"id_cliente\": \"1\",\n    \"contacto\": \"carlos\",\n    \"tel\\u00e9fono\": \"34568765\",\n    \"direcci\\u00f3n\": \"<p>Colonia Chaparrastique<\\/p>\",\n    \"id_municipio\": \"81\",\n    \"id_departamento\": \"12\",\n    \"principal\": \"1\",\n    \"fecha_ing\": \"2023-06-01 13:07:36\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 13:07:36\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-01 13:07:36'),
(90, 2, 'direcciones', 'create', '{\n    \"id_direcci\\u00f3n\": 2,\n    \"id_cliente\": \"2\",\n    \"contacto\": \"ernesto\",\n    \"tel\\u00e9fono\": \"23459876\",\n    \"direcci\\u00f3n\": \"<p>Colonia La Precita<\\/p>\",\n    \"id_municipio\": \"81\",\n    \"id_departamento\": \"12\",\n    \"principal\": \"1\",\n    \"fecha_ing\": \"2023-06-01 14:38:44\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 14:38:44\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-01 14:38:44'),
(91, 2, 'direcciones', 'update', '{\n    \"id_direcci\\u00f3n\": 2,\n    \"id_cliente\": \"2\",\n    \"contacto\": \"ernesto\",\n    \"tel\\u00e9fono\": \"23459876\",\n    \"direcci\\u00f3n\": \"<p>Colonia La Precita #1<\\/p>\",\n    \"id_municipio\": \"81\",\n    \"id_departamento\": \"12\",\n    \"principal\": \"1\",\n    \"fecha_ing\": \"2023-06-01 14:38:44\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 14:39:00\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-01 14:39:00'),
(92, 3, 'direcciones', 'create', '{\n    \"id_direcci\\u00f3n\": 3,\n    \"id_cliente\": \"2\",\n    \"contacto\": \"ernesto\",\n    \"tel\\u00e9fono\": \"76593409\",\n    \"direcci\\u00f3n\": \"<p>Colonia la precita<\\/p>\",\n    \"id_municipio\": \"81\",\n    \"id_departamento\": \"12\",\n    \"principal\": \"1\",\n    \"fecha_ing\": \"2023-06-01 14:40:15\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 14:40:15\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-01 14:40:15'),
(93, 1, 'clientes', 'update', '{\n    \"id_cliente\": 1,\n    \"nombre\": \"Carlos \",\n    \"apellido\": \"Grimaldi\",\n    \"telefono\": \"23457890\",\n    \"email\": \"Carlos@gmail.com\",\n    \"fecha_ing\": \"2023-06-01 09:01:55\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-01 09:01:55\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"0\"\n}', '{\n    \"estado\": \"0\"\n}', 1, '2023-06-02 20:07:34'),
(94, 1, 'clientes', 'update', '{\n    \"id_cliente\": 1,\n    \"nombre\": \"Carlos \",\n    \"apellido\": \"Grimaldi\",\n    \"telefono\": \"23457890\",\n    \"email\": \"Carlos@gmail.com\",\n    \"fecha_ing\": \"2023-06-01 09:01:55\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-02 20:07:34\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"estado\": \"1\"\n}', 1, '2023-06-02 20:07:40'),
(95, 11, 'compras', 'create', '{\n    \"id_compras\": 11,\n    \"codigo\": \"CMPR-00008\",\n    \"num_factura\": \"0008\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-6-02\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra al contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-03 13:40:49\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-03 13:40:49\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-03 13:40:49'),
(96, 12, 'compras', 'create', '{\n    \"id_compras\": 12,\n    \"codigo\": \"CMPR-00009\",\n    \"num_factura\": \"0008\",\n    \"id_proveedor\": \"2\",\n    \"tipo_compra\": \"1\",\n    \"fecha\": \"2023-6-01\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra al credito<\\/p>\",\n    \"fecha_ing\": \"2023-06-03 13:45:12\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-03 13:45:12\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-03 13:45:12'),
(97, 6, 'det-compras', 'create', '{\n    \"id_det_compra\": 6,\n    \"id_compras\": \"12\",\n    \"id_producto\": \"1\",\n    \"cantidad\": \"2\",\n    \"costo\": \"500\",\n    \"descuento\": \"10\",\n    \"uuid\": \"792c7654-e1a5-4335-93a5-26c5cd1bdad4\",\n    \"fecha_ing\": \"2023-06-03 13:45:30\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-03 13:45:30\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-03 13:45:30'),
(98, 7, 'det-compras', 'create', '{\n    \"id_det_compra\": 7,\n    \"id_compras\": \"7\",\n    \"id_producto\": \"5\",\n    \"cantidad\": \"1\",\n    \"costo\": \"1200\",\n    \"descuento\": \"10\",\n    \"uuid\": \"d6384f72-3e0b-410a-bfbd-85821542d880\",\n    \"fecha_ing\": \"2023-06-05 11:08:32\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-05 11:08:32\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-05 11:08:32'),
(99, 7, 'compras', 'inventario', '{\n    \"id_compras\": 7,\n    \"codigo\": \"CMPR-00005\",\n    \"num_factura\": \"0006\",\n    \"id_proveedor\": 1,\n    \"tipo_compra\": 0,\n    \"fecha\": \"2023-05-23\",\n    \"anulado\": 0,\n    \"comentario\": \"Contado&nbsp;\",\n    \"fecha_ing\": \"2023-05-25 11:45:04\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-05 11:16:49\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', '{\n    \"estado\": 1\n}', 1, '2023-06-05 11:16:54'),
(100, 1, 'ordenes', 'create', '{\n    \"id_orden\": 1,\n    \"codigo\": \"002\",\n    \"id_cliente\": \"2\",\n    \"id_direccion\": \"3\",\n    \"fecha\": \"2023-6-08\",\n    \"anulado\": 0,\n    \"fecha_ing\": \"2023-06-08 14:38:29\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-08 14:38:29\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-08 14:38:29'),
(101, 13, 'compras', 'create', '{\n    \"id_compras\": 13,\n    \"codigo\": \"CMPR-00010\",\n    \"num_factura\": \"0009\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-6-08\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Venta de contado nintendo<\\/p>\",\n    \"fecha_ing\": \"2023-06-08 14:42:14\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-08 14:42:14\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-08 14:42:14'),
(102, 1, 'direcciones', 'update', '{\n    \"id_direccion\": 1,\n    \"id_cliente\": \"1\",\n    \"contacto\": \"carlos romero\",\n    \"tel\\u00e9fono\": \"34568765\",\n    \"direcion\": \"<p>Colonia Chaparrastique<\\/p>\",\n    \"id_municipio\": \"81\",\n    \"id_departamento\": \"12\",\n    \"principal\": \"1\",\n    \"fecha_ing\": \"2023-06-01 13:07:36\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-08 20:35:40\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-08 20:35:40'),
(103, 8, 'compras', 'inventario', '{\n    \"id_compras\": 8,\n    \"codigo\": \"CMPR-00006\",\n    \"num_factura\": \"5678\",\n    \"id_proveedor\": 1,\n    \"tipo_compra\": 0,\n    \"fecha\": \"2023-05-20\",\n    \"anulado\": 0,\n    \"comentario\": \"Venta Contado\",\n    \"fecha_ing\": \"2023-05-25 11:46:20\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-06 19:34:56\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', '{\n    \"estado\": 1\n}', 1, '2023-06-09 09:21:41'),
(104, 7, 'marcas', 'create', '{\n    \"id_marca\": 7,\n    \"nombre\": \"Steam\",\n    \"descripcion\": \"<p>Consola Steam Deck<\\/p>\",\n    \"imagen\": \"\\/marcas\\/6X6LWXLnPa77cNltMZiTj-yvEbKOAtyo.jpg\",\n    \"fecha_ing\": \"2023-06-09 09:36:21\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:36:21\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:36:21'),
(105, 6, 'productos', 'create', '{\n    \"id_producto\": 6,\n    \"nombre\": \"Steam Deck\",\n    \"sku\": \"dec-001\",\n    \"descripcion\": \"Video juego Steam\",\n    \"precio\": \"900\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"2\",\n    \"id_marca\": \"7\",\n    \"fecha_ing\": \"2023-06-09 09:37:16\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:37:16\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:37:16'),
(106, 6, 'productos', 'update', '{\n    \"id_producto\": 6,\n    \"nombre\": \"Steam Deck\",\n    \"sku\": \"dec-001\",\n    \"descripcion\": \"Video juego Steam\",\n    \"precio\": \"900.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"7\",\n    \"fecha_ing\": \"2023-06-09 09:37:16\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:37:16\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"7\",\n    \"estado\": \"1\"\n}', 1, '2023-06-09 09:40:53'),
(107, 7, 'productos', 'create', '{\n    \"id_producto\": 7,\n    \"nombre\": \"PlayStation Vita\",\n    \"sku\": \"vita-001\",\n    \"descripcion\": \"<p>Video juego vita<\\/p>\",\n    \"precio\": \"150\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"2\",\n    \"id_marca\": \"2\",\n    \"fecha_ing\": \"2023-06-09 09:42:56\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:42:56\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:42:56'),
(108, 7, 'productos', 'update', '{\n    \"id_producto\": 7,\n    \"nombre\": \"PlayStation Vita\",\n    \"sku\": \"vita-001\",\n    \"descripcion\": \"<p>Video juego vita<\\/p>\",\n    \"precio\": \"150.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"2\",\n    \"fecha_ing\": \"2023-06-09 09:42:56\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:42:56\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"2\",\n    \"estado\": \"1\"\n}', 1, '2023-06-09 09:43:30'),
(109, 4, 'productos', 'update', '{\n    \"id_producto\": 4,\n    \"nombre\": \"Mario Kart 8\",\n    \"sku\": \"1223345672\",\n    \"descripcion\": \"<p><span style=\\\"white-space: pre; white-space: normal;\\\">\\t<\\/span><\\/p><p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<\\/p>\",\n    \"precio\": \"60.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-05-11 20:38:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-23 16:12:46\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-06-09 09:44:43'),
(110, 8, 'marcas', 'create', '{\n    \"id_marca\": 8,\n    \"nombre\": \"Microsoft\",\n    \"descripcion\": \"<p>Microsoft<br><\\/p>\",\n    \"imagen\": \"\\/marcas\\/msq3IIGFsItAdj-o7FRIcJKQdMBb5AAI.png\",\n    \"fecha_ing\": \"2023-06-09 09:46:31\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:46:31\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:46:31'),
(111, 8, 'productos', 'create', '{\n    \"id_producto\": 8,\n    \"nombre\": \"Xbox Series X\",\n    \"sku\": \"xbox-001\",\n    \"descripcion\": \"<p>Video juego xbox serie x<\\/p>\",\n    \"precio\": \"700\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"2\",\n    \"id_marca\": \"3\",\n    \"fecha_ing\": \"2023-06-09 09:47:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:47:24\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:47:24'),
(112, 8, 'productos', 'update', '{\n    \"id_producto\": 8,\n    \"nombre\": \"Xbox Series X\",\n    \"sku\": \"xbox-001\",\n    \"descripcion\": \"<p>Video juego xbox serie x<\\/p>\",\n    \"precio\": \"700.00\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"3\",\n    \"fecha_ing\": \"2023-06-09 09:47:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:47:24\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"3\",\n    \"estado\": \"1\"\n}', 1, '2023-06-09 09:48:29'),
(113, 2, 'productos', 'update', '{\n    \"id_producto\": 2,\n    \"nombre\": \"PlayStation\",\n    \"sku\": \"1223345679\",\n    \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<br><\\/p>\",\n    \"precio\": \"750\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"2\",\n    \"fecha_ing\": \"2023-04-23 16:41:55\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-23 16:05:56\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"precio\": \"750\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"2\",\n    \"estado\": \"1\"\n}', 1, '2023-06-09 09:48:54'),
(114, 1, 'productos', 'update', '{\n    \"id_producto\": 1,\n    \"nombre\": \"Nintendo Switch\",\n    \"sku\": \"1223345678\",\n    \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<br><\\/p>\",\n    \"precio\": \"450\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"fecha_ing\": \"2023-04-23 16:40:28\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-05-23 15:59:26\",\n    \"id_usuario_mod\": 1,\n    \"estado\": \"1\"\n}', '{\n    \"precio\": \"450\",\n    \"id_categoria\": \"1\",\n    \"id_sub_categoria\": \"1\",\n    \"id_marca\": \"1\",\n    \"estado\": \"1\"\n}', 1, '2023-06-09 09:49:19'),
(115, 3, 'proveedores', 'create', '{\n    \"id_proveedor\": 3,\n    \"codigo\": \"0002\",\n    \"nombre\": \"Sony\",\n    \"descripcion\": \"<p>Proveedor de productos Sony<\\/p>\",\n    \"id_departamento\": \"6\",\n    \"id_municipio\": \"204\",\n    \"telefono\": \"77414567\",\n    \"email\": \"Sony@gmail.com\",\n    \"id_usuario_ing\": 1,\n    \"fecha_ing\": \"2023-06-09 09:50:59\",\n    \"id_usuario_mod\": 1,\n    \"fecha_mod\": \"2023-06-09 09:50:59\",\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:50:59'),
(116, 4, 'proveedores', 'create', '{\n    \"id_proveedor\": 4,\n    \"codigo\": \"0003\",\n    \"nombre\": \"Microsoft\",\n    \"descripcion\": \"<p>Proveedor Microsoft<\\/p>\",\n    \"id_departamento\": \"5\",\n    \"id_municipio\": \"129\",\n    \"telefono\": \"34569087\",\n    \"email\": \"Microsoft@gmial.com\",\n    \"id_usuario_ing\": 1,\n    \"fecha_ing\": \"2023-06-09 09:51:49\",\n    \"id_usuario_mod\": 1,\n    \"fecha_mod\": \"2023-06-09 09:51:49\",\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:51:49'),
(117, 5, 'proveedores', 'create', '{\n    \"id_proveedor\": 5,\n    \"codigo\": \"0004\",\n    \"nombre\": \"Steam \",\n    \"descripcion\": \"<p>Proveedor Steam<\\/p>\",\n    \"id_departamento\": \"12\",\n    \"id_municipio\": \"81\",\n    \"telefono\": \"34569876\",\n    \"email\": \"Steam@gmail.com\",\n    \"id_usuario_ing\": 1,\n    \"fecha_ing\": \"2023-06-09 09:52:43\",\n    \"id_usuario_mod\": 1,\n    \"fecha_mod\": \"2023-06-09 09:52:43\",\n    \"estado\": \"1\"\n}', NULL, 1, '2023-06-09 09:52:43'),
(118, 14, 'compras', 'create', '{\n    \"id_compras\": 14,\n    \"codigo\": \"CMPR-00011\",\n    \"num_factura\": \"0010\",\n    \"id_proveedor\": \"1\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-6-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra al contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-09 09:53:41\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:53:41\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-09 09:53:41'),
(119, 8, 'det-compras', 'create', '{\n    \"id_det_compra\": 8,\n    \"id_compras\": \"14\",\n    \"id_producto\": \"1\",\n    \"cantidad\": \"25\",\n    \"costo\": \"350\",\n    \"descuento\": \"10\",\n    \"uuid\": \"ad680891-4350-49f0-9094-9140bdc0b76e\",\n    \"fecha_ing\": \"2023-06-09 09:54:18\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:54:18\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 09:54:18'),
(120, 9, 'det-compras', 'create', '{\n    \"id_det_compra\": 9,\n    \"id_compras\": \"14\",\n    \"id_producto\": \"2\",\n    \"cantidad\": \"20\",\n    \"costo\": \"650\",\n    \"descuento\": \"10\",\n    \"uuid\": \"159ec62a-d986-478f-ac17-0d5b2e0bb585\",\n    \"fecha_ing\": \"2023-06-09 09:55:47\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:55:47\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 09:55:47'),
(121, 10, 'det-compras', 'create', '{\n    \"id_det_compra\": 10,\n    \"id_compras\": \"14\",\n    \"id_producto\": \"1\",\n    \"cantidad\": \"25\",\n    \"costo\": \"350\",\n    \"descuento\": \"10\",\n    \"uuid\": \"de6ce6c7-96c9-4158-811f-f05aebf9712a\",\n    \"fecha_ing\": \"2023-06-09 09:59:15\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:59:15\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 09:59:15'),
(122, 11, 'det-compras', 'create', '{\n    \"id_det_compra\": 11,\n    \"id_compras\": \"14\",\n    \"id_producto\": \"8\",\n    \"cantidad\": \"30\",\n    \"costo\": \"600\",\n    \"descuento\": \"10\",\n    \"uuid\": \"ea1805f5-a0d4-4aec-b282-196463b6c91f\",\n    \"fecha_ing\": \"2023-06-09 09:59:43\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:59:43\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 09:59:43'),
(123, 12, 'det-compras', 'create', '{\n    \"id_det_compra\": 12,\n    \"id_compras\": \"14\",\n    \"id_producto\": \"2\",\n    \"cantidad\": \"20\",\n    \"costo\": \"650\",\n    \"descuento\": \"10\",\n    \"uuid\": \"57a04387-45c9-44eb-8f61-03a38ed92455\",\n    \"fecha_ing\": \"2023-06-09 10:00:07\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:00:07\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:00:07'),
(124, 14, 'compras', 'inventario', '{\n    \"id_compras\": 14,\n    \"codigo\": \"CMPR-00011\",\n    \"num_factura\": \"0010\",\n    \"id_proveedor\": 1,\n    \"tipo_compra\": 0,\n    \"fecha\": \"2023-06-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra al contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-09 09:53:41\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 09:53:41\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', '{\n    \"estado\": 1\n}', 1, '2023-06-09 10:00:29'),
(125, 15, 'compras', 'create', '{\n    \"id_compras\": 15,\n    \"codigo\": \"CMPR-00012\",\n    \"num_factura\": \"0011\",\n    \"id_proveedor\": \"3\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-6-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra realizada al contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-09 10:01:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:01:24\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-09 10:01:24'),
(126, 13, 'det-compras', 'create', '{\n    \"id_det_compra\": 13,\n    \"id_compras\": \"15\",\n    \"id_producto\": \"1\",\n    \"cantidad\": \"10\",\n    \"costo\": \"350\",\n    \"descuento\": \"10\",\n    \"uuid\": \"2c7fbe57-05cb-4e72-96b4-85c42f23a16f\",\n    \"fecha_ing\": \"2023-06-09 10:01:41\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:01:41\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:01:41'),
(127, 14, 'det-compras', 'create', '{\n    \"id_det_compra\": 14,\n    \"id_compras\": \"15\",\n    \"id_producto\": \"7\",\n    \"cantidad\": \"5\",\n    \"costo\": \"100\",\n    \"descuento\": \"10\",\n    \"uuid\": \"77c46316-c687-4a1d-bd7f-a17de568d569\",\n    \"fecha_ing\": \"2023-06-09 10:02:02\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:02:02\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:02:02');
INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(128, 15, 'det-compras', 'create', '{\n    \"id_det_compra\": 15,\n    \"id_compras\": \"15\",\n    \"id_producto\": \"6\",\n    \"cantidad\": \"40\",\n    \"costo\": \"600\",\n    \"descuento\": \"10\",\n    \"uuid\": \"46e41ba6-5a15-4a73-9244-be465d8426e5\",\n    \"fecha_ing\": \"2023-06-09 10:02:23\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:02:23\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:02:23'),
(129, 15, 'compras', 'inventario', '{\n    \"id_compras\": 15,\n    \"codigo\": \"CMPR-00012\",\n    \"num_factura\": \"0011\",\n    \"id_proveedor\": 3,\n    \"tipo_compra\": 0,\n    \"fecha\": \"2023-06-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra realizada al contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-09 10:01:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:01:24\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', '{\n    \"estado\": 1\n}', 1, '2023-06-09 10:02:29'),
(130, 16, 'compras', 'create', '{\n    \"id_compras\": 16,\n    \"codigo\": \"CMPR-00013\",\n    \"num_factura\": \"0012\",\n    \"id_proveedor\": \"4\",\n    \"tipo_compra\": \"0\",\n    \"fecha\": \"2023-6-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra de contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-09 10:02:54\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:02:54\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', NULL, 1, '2023-06-09 10:02:54'),
(131, 16, 'det-compras', 'create', '{\n    \"id_det_compra\": 16,\n    \"id_compras\": \"16\",\n    \"id_producto\": \"2\",\n    \"cantidad\": \"35\",\n    \"costo\": \"650\",\n    \"descuento\": \"10\",\n    \"uuid\": \"6f22fac4-cdc1-46c4-a6fe-d8f717b86fa3\",\n    \"fecha_ing\": \"2023-06-09 10:03:25\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:03:25\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:03:25'),
(132, 17, 'det-compras', 'create', '{\n    \"id_det_compra\": 17,\n    \"id_compras\": \"16\",\n    \"id_producto\": \"8\",\n    \"cantidad\": \"29\",\n    \"costo\": \"600\",\n    \"descuento\": \"10\",\n    \"uuid\": \"b3014b8c-79de-42e5-a64c-7d8cc43efe9d\",\n    \"fecha_ing\": \"2023-06-09 10:03:49\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:03:49\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:03:49'),
(133, 18, 'det-compras', 'create', '{\n    \"id_det_compra\": 18,\n    \"id_compras\": \"16\",\n    \"id_producto\": \"7\",\n    \"cantidad\": \"10\",\n    \"costo\": \"100\",\n    \"descuento\": \"10\",\n    \"uuid\": \"9290fd6f-b305-4f72-899e-9db8bc8f02d7\",\n    \"fecha_ing\": \"2023-06-09 10:04:05\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:04:05\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:04:05'),
(134, 19, 'det-compras', 'create', '{\n    \"id_det_compra\": 19,\n    \"id_compras\": \"16\",\n    \"id_producto\": \"6\",\n    \"cantidad\": \"5\",\n    \"costo\": \"600\",\n    \"descuento\": \"10\",\n    \"uuid\": \"d0d574a7-b2d2-4b9e-9060-5a0f875eef46\",\n    \"fecha_ing\": \"2023-06-09 10:04:24\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:04:24\",\n    \"id_usuario_mod\": 1\n}', NULL, 1, '2023-06-09 10:04:24'),
(135, 16, 'compras', 'inventario', '{\n    \"id_compras\": 16,\n    \"codigo\": \"CMPR-00013\",\n    \"num_factura\": \"0012\",\n    \"id_proveedor\": 4,\n    \"tipo_compra\": 0,\n    \"fecha\": \"2023-06-09\",\n    \"anulado\": 0,\n    \"comentario\": \"<p>Compra de contado<\\/p>\",\n    \"fecha_ing\": \"2023-06-09 10:02:54\",\n    \"id_usuario_ing\": 1,\n    \"fecha_mod\": \"2023-06-09 10:02:54\",\n    \"id_usuario_mod\": 1,\n    \"estado\": 0\n}', '{\n    \"estado\": 1\n}', 1, '2023-06-09 10:04:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

CREATE TABLE `tbl_categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id_categoria`, `nombre`, `descripcion`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Tecnología', '<h5><font style=\"background-color: rgb(255, 255, 0);\" color=\"#000000\">The standard Lorem Ipsum passage, used since the 1500s</font></h5><p>\"Lorem\r\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.\"</p><p></p>', '2023-04-09 19:09:17', 1, '2023-04-22 20:59:29', 1, 1),
(2, 'Hogar', '\"Lorem\r\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.\"<br><p></p>', '2023-04-09 19:11:56', 1, '2023-04-23 14:13:56', 1, 1),
(3, 'Linea Blanca', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-10 23:03:55', 1, '2023-04-10 23:03:55', 1, 1),
(4, 'Juguetes', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-10 23:38:58', 1, '2023-04-10 23:38:58', 1, 1),
(5, 'Limpieza', '<h5 style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41);\"><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">The standard Lorem Ipsum passage, used since the 1500s</font></h5><p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\"</p>', '2023-04-23 14:15:33', 1, '2023-05-05 20:01:32', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`id_cliente`, `nombre`, `apellido`, `telefono`, `email`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Carlos ', 'Grimaldi', '23457890', 'Carlos@gmail.com', '2023-06-01 09:01:55', 1, '2023-06-02 20:07:40', 1, 1),
(2, 'Ernesto', 'Martinez', '12345678', 'Ernesto@gmail.com', '2023-06-01 09:13:14', 1, '2023-06-01 09:13:22', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compras`
--

CREATE TABLE `tbl_compras` (
  `id_compras` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `num_factura` varchar(8) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `tipo_compra` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `anulado` tinyint(1) NOT NULL DEFAULT 0,
  `comentario` text DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_compras`
--

INSERT INTO `tbl_compras` (`id_compras`, `codigo`, `num_factura`, `id_proveedor`, `tipo_compra`, `fecha`, `anulado`, `comentario`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(3, 'CMPR-00002', '0002', 1, 1, '2023-05-24', 0, '<p>Credito</p>', '2023-05-25 11:29:50', 1, '2023-06-02 20:26:25', 1, 1),
(5, 'CMPR-00003', '0003', 1, 0, '2023-05-23', 0, '<p>Contado</p>', '2023-05-25 11:34:40', 1, '2023-06-02 19:24:13', 1, 1),
(6, 'CMPR-00004', '0004', 1, 0, '2023-05-23', 0, '<p>er</p>', '2023-05-25 11:43:50', 1, '2023-06-02 19:21:26', 1, 1),
(7, 'CMPR-00005', '0006', 1, 0, '2023-05-23', 0, 'Contado&nbsp;', '2023-05-25 11:45:04', 1, '2023-06-05 11:16:54', 1, 1),
(8, 'CMPR-00006', '5678', 1, 0, '2023-05-20', 0, 'Venta Contado', '2023-05-25 11:46:20', 1, '2023-06-09 09:21:41', 1, 1),
(9, 'CMPR-00007', '3456', 2, 0, '2023-05-09', 0, '<p>contado edit 1</p>', '2023-05-25 12:03:15', 1, '2023-05-29 19:22:27', 1, 0),
(11, 'CMPR-00008', '0008', 1, 0, '2023-06-02', 0, '<p>Compra al contado</p>', '2023-06-03 13:40:49', 1, '2023-06-03 13:40:49', 1, 0),
(12, 'CMPR-00009', '0008', 2, 1, '2023-06-01', 0, '<p>Compra al credito</p>', '2023-06-03 13:45:12', 1, '2023-06-03 13:45:12', 1, 0),
(13, 'CMPR-00010', '0009', 1, 0, '2023-06-08', 0, '<p>Venta de contado nintendo</p>', '2023-06-08 14:42:14', 1, '2023-06-08 14:42:14', 1, 0),
(14, 'CMPR-00011', '0010', 1, 0, '2023-06-09', 0, '<p>Compra al contado</p>', '2023-06-09 09:53:41', 1, '2023-06-09 10:00:29', 1, 1),
(15, 'CMPR-00012', '0011', 3, 0, '2023-06-09', 0, '<p>Compra realizada al contado</p>', '2023-06-09 10:01:24', 1, '2023-06-09 10:02:29', 1, 1),
(16, 'CMPR-00013', '0012', 4, 0, '2023-06-09', 0, '<p>Compra de contado</p>', '2023-06-09 10:02:54', 1, '2023-06-09 10:04:29', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `codigo` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`id_departamento`, `nombre`, `codigo`) VALUES
(1, 'AHUACHAPAN', 'AH'),
(2, 'SANTA ANA', 'SA'),
(3, 'SONSONATE', 'SO'),
(4, 'CHALATENANGO', 'CH'),
(5, 'LA LIBERTAD', 'LL'),
(6, 'SAN SALVADOR', 'SS'),
(7, 'CUSCATLAN', 'CU'),
(8, 'LA PAZ', 'LP'),
(9, 'CABAÑAS', 'CA'),
(10, 'SAN VICENTE', 'SV'),
(11, 'USULUTAN', 'US'),
(12, 'SAN MIGUEL', 'SM'),
(13, 'MORAZAN', 'MO'),
(14, 'LA UNION', 'LU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_det_compras`
--

CREATE TABLE `tbl_det_compras` (
  `id_det_compra` int(11) NOT NULL,
  `id_compras` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `uuid` varchar(38) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_det_compras`
--

INSERT INTO `tbl_det_compras` (`id_det_compra`, `id_compras`, `id_producto`, `cantidad`, `costo`, `descuento`, `uuid`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`) VALUES
(1, 8, 5, 1, 1200.00, 10.00, 'bed0d27c-c494-4ce0-8a59-c0e1a4694846', '2023-05-25 11:46:30', 1, '2023-05-25 11:46:30', 1),
(2, 9, 2, 1, 200.00, 100.00, '0e8354e4-6878-4d8b-b417-430f00c796d4', '2023-05-25 12:06:35', 1, '2023-05-25 12:06:35', 1),
(3, 9, 1, 10, 500.00, 10.00, '21ffc10e-70bf-48b4-a1e5-de8a97ac9c32', '2023-05-25 12:08:13', 1, '2023-05-25 12:08:13', 1),
(4, 3, 2, 35, 649.99, 10.00, '64882c51-4282-4c7b-b8ef-25706e9c1f4c', '2023-05-29 19:26:09', 1, '2023-05-29 20:44:45', 1),
(5, 3, 5, 10, 1200.00, 5.00, '9b1a609f-2d8c-4060-bd5d-69dee1314a13', '2023-05-29 20:16:28', 1, '2023-05-29 20:26:06', 1),
(6, 12, 1, 2, 500.00, 10.00, '792c7654-e1a5-4335-93a5-26c5cd1bdad4', '2023-06-03 13:45:30', 1, '2023-06-03 13:45:30', 1),
(7, 7, 5, 1, 1200.00, 10.00, 'd6384f72-3e0b-410a-bfbd-85821542d880', '2023-06-05 11:08:32', 1, '2023-06-05 11:08:32', 1),
(10, 14, 1, 25, 350.00, 10.00, 'de6ce6c7-96c9-4158-811f-f05aebf9712a', '2023-06-09 09:59:15', 1, '2023-06-09 09:59:15', 1),
(11, 14, 8, 30, 600.00, 10.00, 'ea1805f5-a0d4-4aec-b282-196463b6c91f', '2023-06-09 09:59:43', 1, '2023-06-09 09:59:43', 1),
(12, 14, 2, 20, 650.00, 10.00, '57a04387-45c9-44eb-8f61-03a38ed92455', '2023-06-09 10:00:07', 1, '2023-06-09 10:00:07', 1),
(13, 15, 1, 10, 350.00, 10.00, '2c7fbe57-05cb-4e72-96b4-85c42f23a16f', '2023-06-09 10:01:41', 1, '2023-06-09 10:01:41', 1),
(14, 15, 7, 5, 100.00, 10.00, '77c46316-c687-4a1d-bd7f-a17de568d569', '2023-06-09 10:02:02', 1, '2023-06-09 10:02:02', 1),
(15, 15, 6, 40, 600.00, 10.00, '46e41ba6-5a15-4a73-9244-be465d8426e5', '2023-06-09 10:02:23', 1, '2023-06-09 10:02:23', 1),
(16, 16, 2, 35, 650.00, 10.00, '6f22fac4-cdc1-46c4-a6fe-d8f717b86fa3', '2023-06-09 10:03:25', 1, '2023-06-09 10:03:25', 1),
(17, 16, 8, 29, 600.00, 10.00, 'b3014b8c-79de-42e5-a64c-7d8cc43efe9d', '2023-06-09 10:03:49', 1, '2023-06-09 10:03:49', 1),
(18, 16, 7, 10, 100.00, 10.00, '9290fd6f-b305-4f72-899e-9db8bc8f02d7', '2023-06-09 10:04:05', 1, '2023-06-09 10:04:05', 1),
(19, 16, 6, 5, 600.00, 10.00, 'd0d574a7-b2d2-4b9e-9060-5a0f875eef46', '2023-06-09 10:04:24', 1, '2023-06-09 10:04:24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_det_ordenes`
--

CREATE TABLE `tbl_det_ordenes` (
  `id_det_orden` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `id_direccion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `teléfono` varchar(255) NOT NULL,
  `direcion` varchar(255) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`id_direccion`, `id_cliente`, `contacto`, `teléfono`, `direcion`, `id_municipio`, `id_departamento`, `principal`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 1, 'carlos romero', '34568765', '<p>Colonia Chaparrastique</p>', 81, 12, 1, '2023-06-01 13:07:36', 1, '2023-06-08 20:35:40', 1, 1),
(3, 2, 'ernesto', '76593409', '<p>Colonia la precita</p>', 81, 12, 1, '2023-06-01 14:40:15', 1, '2023-06-01 14:40:15', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_error_log`
--

CREATE TABLE `tbl_error_log` (
  `id_error_log` int(11) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `mensaje` text NOT NULL,
  `us_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_error_log`
--

INSERT INTO `tbl_error_log` (`id_error_log`, `controller`, `mensaje`, `us_id`, `fecha`) VALUES
(0, 'det-compras/create', 'yii\\base\\UnknownPropertyException: Setting unknown property: app\\modules\\compras\\models\\DetCompras::id_compras in C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:209<br />\nStack trace:<br />\n#0 C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(322): yii\\base\\Component-&gt;__set(&#039;id_compras&#039;, &#039;3&#039;)<br />\n#1 C:\\xampp\\htdocs\\ecommerce\\modules\\compras\\controllers\\DetComprasController.php(83): yii\\db\\BaseActiveRecord-&gt;__set(&#039;id_compras&#039;, &#039;3&#039;)<br />\n#2 [internal function]: app\\modules\\compras\\controllers\\DetComprasController-&gt;actionCreate(&#039;3&#039;)<br />\n#3 C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#6 C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;compras/det-com...&#039;, Array)<br />\n#7 C:\\xampp\\htdocs\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\xampp\\htdocs\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-05-25 11:30:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `id_inventario` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `existencia_original` int(11) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`id_inventario`, `uuid`, `id_producto`, `existencia`, `existencia_original`, `fecha_ing`, `id_usuario_ing`) VALUES
(2, 'd6384f72-3e0b-410a-bfbd-85821542d880', 5, 1, 1, '2023-06-05 11:16:54', 1),
(3, 'bed0d27c-c494-4ce0-8a59-c0e1a4694846', 5, 1, 1, '2023-06-09 09:21:41', 1),
(4, 'de6ce6c7-96c9-4158-811f-f05aebf9712a', 1, 25, 25, '2023-06-09 10:00:29', 1),
(5, 'ea1805f5-a0d4-4aec-b282-196463b6c91f', 8, 30, 30, '2023-06-09 10:00:29', 1),
(6, '57a04387-45c9-44eb-8f61-03a38ed92455', 2, 20, 20, '2023-06-09 10:00:29', 1),
(7, '2c7fbe57-05cb-4e72-96b4-85c42f23a16f', 1, 10, 10, '2023-06-09 10:02:29', 1),
(8, '77c46316-c687-4a1d-bd7f-a17de568d569', 7, 5, 5, '2023-06-09 10:02:29', 1),
(9, '46e41ba6-5a15-4a73-9244-be465d8426e5', 6, 40, 40, '2023-06-09 10:02:29', 1),
(10, '6f22fac4-cdc1-46c4-a6fe-d8f717b86fa3', 2, 35, 35, '2023-06-09 10:04:29', 1),
(11, 'b3014b8c-79de-42e5-a64c-7d8cc43efe9d', 8, 29, 29, '2023-06-09 10:04:29', 1),
(12, '9290fd6f-b305-4f72-899e-9db8bc8f02d7', 7, 10, 10, '2023-06-09 10:04:29', 1),
(13, 'd0d574a7-b2d2-4b9e-9060-5a0f875eef46', 6, 5, 5, '2023-06-09 10:04:29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_kardex`
--

CREATE TABLE `tbl_kardex` (
  `id_kardex` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `cod_documento` varchar(25) NOT NULL,
  `num_documento` varchar(25) NOT NULL,
  `tipo_documento` varchar(25) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_kardex`
--

INSERT INTO `tbl_kardex` (`id_kardex`, `id_documento`, `cod_documento`, `num_documento`, `tipo_documento`, `id_producto`, `cantidad`, `uuid`, `fecha_ing`, `id_usuario_ing`) VALUES
(1, 7, 'CMPR-00005', '0006', 'COMPRA', 5, 1, 'd6384f72-3e0b-410a-bfbd-85821542d880', '2023-06-05 11:16:54', 1),
(2, 8, 'CMPR-00006', '5678', 'COMPRA', 5, 1, 'bed0d27c-c494-4ce0-8a59-c0e1a4694846', '2023-06-09 09:21:41', 1),
(3, 14, 'CMPR-00011', '0010', 'COMPRA', 1, 25, 'de6ce6c7-96c9-4158-811f-f05aebf9712a', '2023-06-09 10:00:29', 1),
(4, 14, 'CMPR-00011', '0010', 'COMPRA', 8, 30, 'ea1805f5-a0d4-4aec-b282-196463b6c91f', '2023-06-09 10:00:29', 1),
(5, 14, 'CMPR-00011', '0010', 'COMPRA', 2, 20, '57a04387-45c9-44eb-8f61-03a38ed92455', '2023-06-09 10:00:29', 1),
(6, 15, 'CMPR-00012', '0011', 'COMPRA', 1, 10, '2c7fbe57-05cb-4e72-96b4-85c42f23a16f', '2023-06-09 10:02:29', 1),
(7, 15, 'CMPR-00012', '0011', 'COMPRA', 7, 5, '77c46316-c687-4a1d-bd7f-a17de568d569', '2023-06-09 10:02:29', 1),
(8, 15, 'CMPR-00012', '0011', 'COMPRA', 6, 40, '46e41ba6-5a15-4a73-9244-be465d8426e5', '2023-06-09 10:02:29', 1),
(9, 16, 'CMPR-00013', '0012', 'COMPRA', 2, 35, '6f22fac4-cdc1-46c4-a6fe-d8f717b86fa3', '2023-06-09 10:04:29', 1),
(10, 16, 'CMPR-00013', '0012', 'COMPRA', 8, 29, 'b3014b8c-79de-42e5-a64c-7d8cc43efe9d', '2023-06-09 10:04:29', 1),
(11, 16, 'CMPR-00013', '0012', 'COMPRA', 7, 10, '9290fd6f-b305-4f72-899e-9db8bc8f02d7', '2023-06-09 10:04:29', 1),
(12, 16, 'CMPR-00013', '0012', 'COMPRA', 6, 5, 'd0d574a7-b2d2-4b9e-9060-5a0f875eef46', '2023-06-09 10:04:29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_marcas`
--

CREATE TABLE `tbl_marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_marcas`
--

INSERT INTO `tbl_marcas` (`id_marca`, `nombre`, `descripcion`, `imagen`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Nintendo', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/gmRCncyjJjzf9vnGn_P9CDKEYxZlsxml.png', '2023-04-11 19:24:34', 1, '2023-04-22 20:55:14', 1, 1),
(2, 'Sony', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/WjjeYPyfeF6JxyZOSpJ7DDu6UHGn2QhC.png', '2023-04-11 19:57:12', 1, '2023-04-22 20:57:10', 1, 1),
(3, 'Microsoft', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/s2NNpVwEbcT58t8UEVQOCwwUMjrPEZzz.jpg', '2023-04-12 19:57:55', 1, '2023-04-25 19:14:13', 1, 1),
(4, 'LG', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', NULL, '2023-04-13 19:58:18', 1, '2023-04-22 20:58:02', 1, 1),
(5, 'Apple', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', NULL, '2023-04-14 19:58:43', 1, '2023-04-22 20:58:40', 1, 1),
(6, 'SAMSUNG', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/5xM1drUxNFPMTphqf5_9UijHb9JdMNy_.webp', '2023-04-14 19:59:09', 1, '2023-04-22 20:55:41', 1, 1),
(7, 'Steam', '<p>Consola Steam Deck</p>', '/marcas/6X6LWXLnPa77cNltMZiTj-yvEbKOAtyo.jpg', '2023-06-09 09:36:21', 1, '2023-06-09 09:36:21', 1, 1),
(8, 'Microsoft', '<p>Microsoft<br></p>', '/marcas/msq3IIGFsItAdj-o7FRIcJKQdMBb5AAI.png', '2023-06-09 09:46:31', 1, '2023-06-09 09:46:31', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_municipios`
--

CREATE TABLE `tbl_municipios` (
  `id_municipio` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_municipios`
--

INSERT INTO `tbl_municipios` (`id_municipio`, `nombre`, `id_departamento`) VALUES
(1, 'Ahuachapán', 1),
(2, 'Jujutla', 1),
(3, 'Atiquizaya', 1),
(4, 'Concepción de Ataco', 1),
(5, 'El Refugio', 1),
(6, 'Guaymango', 1),
(7, 'Apaneca', 1),
(8, 'San Francisco Menéndez', 1),
(9, 'San Lorenzo', 1),
(10, 'San Pedro Puxtla', 1),
(11, 'Tacuba', 1),
(12, 'Turín', 1),
(13, 'Candelaria de la Frontera', 2),
(14, 'Chalchuapa', 2),
(15, 'Coatepeque', 2),
(16, 'El Congo', 2),
(17, 'El Porvenir', 2),
(18, 'Masahuat', 2),
(19, 'Metapán', 2),
(20, 'San Antonio Pajonal', 2),
(21, 'San Sebastián Salitrillo', 2),
(22, 'Santa Ana', 2),
(23, 'Santa Rosa Guachipilín', 2),
(24, 'Santiago de la Frontera', 2),
(25, 'Texistepeque', 2),
(26, 'Acajutla', 3),
(27, 'Armenia', 3),
(28, 'Caluco', 3),
(29, 'Cuisnahuat', 3),
(30, 'Izalco', 3),
(31, 'Juayúa', 3),
(32, 'Nahuizalco', 3),
(33, 'Nahulingo', 3),
(34, 'Salcoatitán', 3),
(35, 'San Antonio del Monte', 3),
(36, 'San Julián', 3),
(37, 'Santa Catarina Masahuat', 3),
(38, 'Santa Isabel Ishuatán', 3),
(39, 'Santo Domingo de Guzmán', 3),
(40, 'Sonsonate', 3),
(41, 'Sonzacate', 3),
(42, 'Alegría', 11),
(43, 'Berlín', 11),
(44, 'California', 11),
(45, 'Concepción Batres', 11),
(46, 'El Triunfo', 11),
(47, 'Ereguayquín', 11),
(48, 'Estanzuelas', 11),
(49, 'Jiquilisco', 11),
(50, 'Jucuapa', 11),
(51, 'Jucuarán', 11),
(52, 'Mercedes Umaña', 11),
(53, 'Nueva Granada', 11),
(54, 'Ozatlán', 11),
(55, 'Puerto El Triunfo', 11),
(56, 'San Agustín', 11),
(57, 'San Buenaventura', 11),
(58, 'San Dionisio', 11),
(59, 'San Francisco Javier', 11),
(60, 'Santa Elena', 11),
(61, 'Santa María', 11),
(62, 'Santiago de María', 11),
(63, 'Tecapán', 11),
(64, 'Usulután', 11),
(65, 'Carolina', 12),
(66, 'Chapeltique', 12),
(67, 'Chinameca', 12),
(68, 'Chirilagua', 12),
(69, 'Ciudad Barrios', 12),
(70, 'Comacarán', 12),
(71, 'El Tránsito', 12),
(72, 'Lolotique', 12),
(73, 'Moncagua', 12),
(74, 'Nueva Guadalupe', 12),
(75, 'Nuevo Edén de San Juan', 12),
(76, 'Quelepa', 12),
(77, 'San Antonio del Mosco', 12),
(78, 'San Gerardo', 12),
(79, 'San Jorge', 12),
(80, 'San Luis de la Reina', 12),
(81, 'San Miguel', 12),
(82, 'San Rafael Oriente', 12),
(83, 'Sesori', 12),
(84, 'Uluazapa', 12),
(85, 'Arambala', 13),
(86, 'Cacaopera', 13),
(87, 'Chilanga', 13),
(88, 'Corinto', 13),
(89, 'Delicias de Concepción', 13),
(90, 'El Divisadero', 13),
(91, 'El Rosario (Morazán)', 13),
(92, 'Gualococti', 13),
(93, 'Guatajiagua', 13),
(94, 'Joateca', 13),
(95, 'Jocoaitique', 13),
(96, 'Jocoro', 13),
(97, 'Lolotiquillo', 13),
(98, 'Meanguera', 13),
(99, 'Osicala', 13),
(100, 'Perquín', 13),
(101, 'San Carlos', 13),
(102, 'San Fernando (Morazán)', 13),
(103, 'San Francisco Gotera', 13),
(104, 'San Isidro (Morazán)', 13),
(105, 'San Simón', 13),
(106, 'Sensembra', 13),
(107, 'Sociedad', 13),
(108, 'Torola', 13),
(109, 'Yamabal', 13),
(110, 'Yoloaiquín', 13),
(111, 'La Unión', 14),
(112, 'San Alejo', 14),
(113, 'Yucuaiquín', 14),
(114, 'Conchagua', 14),
(115, 'Intipucá', 14),
(116, 'San José', 14),
(117, 'El Carmen (La Unión)', 14),
(118, 'Yayantique', 14),
(119, 'Bolívar', 14),
(120, 'Meanguera del Golfo', 14),
(121, 'Santa Rosa de Lima', 14),
(122, 'Pasaquina', 14),
(123, 'Anamoros', 14),
(124, 'Nueva Esparta', 14),
(125, 'El Sauce', 14),
(126, 'Concepción de Oriente', 14),
(127, 'Polorós', 14),
(128, 'Lislique', 14),
(129, 'Antiguo Cuscatlán', 5),
(130, 'Chiltiupán', 5),
(131, 'Ciudad Arce', 5),
(132, 'Colón', 5),
(133, 'Comasagua', 5),
(134, 'Huizúcar', 5),
(135, 'Jayaque', 5),
(136, 'Jicalapa', 5),
(137, 'La Libertad', 5),
(138, 'Santa Tecla', 5),
(139, 'Nuevo Cuscatlán', 5),
(140, 'San Juan Opico', 5),
(141, 'Quezaltepeque', 5),
(142, 'Sacacoyo', 5),
(143, 'San José Villanueva', 5),
(144, 'San Matías', 5),
(145, 'San Pablo Tacachico', 5),
(146, 'Talnique', 5),
(147, 'Tamanique', 5),
(148, 'Teotepeque', 5),
(149, 'Tepecoyo', 5),
(150, 'Zaragoza', 5),
(151, 'Agua Caliente', 4),
(152, 'Arcatao', 4),
(153, 'Azacualpa', 4),
(154, 'Cancasque', 4),
(155, 'Chalatenango', 4),
(156, 'Citalá', 4),
(157, 'Comapala', 4),
(158, 'Concepción Quezaltepeque', 4),
(159, 'Dulce Nombre de María', 4),
(160, 'El Carrizal', 4),
(161, 'El Paraíso', 4),
(162, 'La Laguna', 4),
(163, 'La Palma', 4),
(164, 'La Reina', 4),
(165, 'Las Vueltas', 4),
(166, 'Nueva Concepción', 4),
(167, 'Nueva Trinidad', 4),
(168, 'Nombre de Jesús', 4),
(169, 'Ojos de Agua', 4),
(170, 'Potonico', 4),
(171, 'San Antonio de la Cruz', 4),
(172, 'San Antonio Los Ranchos', 4),
(173, 'San Fernando', 4),
(174, 'San Francisco Lempa', 4),
(175, 'San Francisco Morazán', 4),
(176, 'San Ignacio', 4),
(177, 'San Isidro Labrador', 4),
(178, 'Las Flores', 4),
(179, 'San Luis del Carmen', 4),
(180, 'San Miguel de Mercedes', 4),
(181, 'San Rafael', 4),
(182, 'Santa Rita', 4),
(183, 'Tejutla', 4),
(184, 'Cojutepeque', 7),
(185, 'Candelaria', 7),
(186, 'El Carmen (Cuscatlán)', 7),
(187, 'El Rosario (Cuscatlán)', 7),
(188, 'Monte San Juan', 7),
(189, 'Oratorio de Concepción', 7),
(190, 'San Bartolomé Perulapía', 7),
(191, 'San Cristóbal', 7),
(192, 'San José Guayabal', 7),
(193, 'San Pedro Perulapán', 7),
(194, 'San Rafael Cedros', 7),
(195, 'San Ramón', 7),
(196, 'Santa Cruz Analquito', 7),
(197, 'Santa Cruz Michapa', 7),
(198, 'Suchitoto', 7),
(199, 'Tenancingo', 7),
(200, 'Aguilares', 6),
(201, 'Apopa', 6),
(202, 'Ayutuxtepeque', 6),
(203, 'Cuscatancingo', 6),
(204, 'Ciudad Delgado', 6),
(205, 'El Paisnal', 6),
(206, 'Guazapa', 6),
(207, 'Ilopango', 6),
(208, 'Mejicanos', 6),
(209, 'Nejapa', 6),
(210, 'Panchimalco', 6),
(211, 'Rosario de Mora', 6),
(212, 'San Marcos', 6),
(213, 'San Martín', 6),
(214, 'San Salvador', 6),
(215, 'Santiago Texacuangos', 6),
(216, 'Santo Tomás', 6),
(217, 'Soyapango', 6),
(218, 'Tonacatepeque', 6),
(219, 'Zacatecoluca', 8),
(220, 'Cuyultitán', 8),
(221, 'El Rosario (La Paz)', 8),
(222, 'Jerusalén', 8),
(223, 'Mercedes La Ceiba', 8),
(224, 'Olocuilta', 8),
(225, 'Paraíso de Osorio', 8),
(226, 'San Antonio Masahuat', 8),
(227, 'San Emigdio', 8),
(228, 'San Francisco Chinameca', 8),
(229, 'San Pedro Masahuat', 8),
(230, 'San Juan Nonualco', 8),
(231, 'San Juan Talpa', 8),
(232, 'San Juan Tepezontes', 8),
(233, 'San Luis La Herradura', 8),
(234, 'San Luis Talpa', 8),
(235, 'San Miguel Tepezontes', 8),
(236, 'San Pedro Nonualco', 8),
(237, 'San Rafael Obrajuelo', 8),
(238, 'Santa María Ostuma', 8),
(239, 'Santiago Nonualco', 8),
(240, 'Tapalhuaca', 8),
(241, 'Cinquera', 9),
(242, 'Dolores', 9),
(243, 'Guacotecti', 9),
(244, 'Ilobasco', 9),
(245, 'Jutiapa', 9),
(246, 'San Isidro (Cabañas)', 9),
(247, 'Sensuntepeque', 9),
(248, 'Tejutepeque', 9),
(249, 'Victoria', 9),
(250, 'Apastepeque', 10),
(251, 'Guadalupe', 10),
(252, 'San Cayetano Istepeque', 10),
(253, 'San Esteban Catarina', 10),
(254, 'San Ildefonso', 10),
(255, 'San Lorenzo', 10),
(256, 'San Sebastián', 10),
(257, 'San Vicente', 10),
(258, 'Santa Clara', 10),
(259, 'Santo Domingo', 10),
(260, 'Tecoluca', 10),
(261, 'Tepetitán', 10),
(262, 'Verapaz', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ordenes`
--

CREATE TABLE `tbl_ordenes` (
  `id_orden` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_direccion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `anulado` tinyint(4) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_ordenes`
--

INSERT INTO `tbl_ordenes` (`id_orden`, `codigo`, `id_cliente`, `id_direccion`, `fecha`, `anulado`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, '002', 2, 1, '2023-06-08', 0, '2023-06-08 14:38:29', 1, '2023-06-08 21:14:56', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`id_producto`, `nombre`, `sku`, `descripcion`, `precio`, `id_categoria`, `id_sub_categoria`, `id_marca`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Nintendo Switch', '1223345678', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"<br></p>', 450.00, 1, 1, 1, '2023-04-23 16:40:28', 1, '2023-06-09 09:49:19', 1, 1),
(2, 'PlayStation', '1223345679', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"<br></p>', 750.00, 1, 1, 2, '2023-04-23 16:41:55', 1, '2023-06-09 09:48:54', 1, 1),
(3, 'Super Mario Bros U', '773727112', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', 56.00, 1, 1, 1, '2023-05-11 20:15:36', 1, '2023-05-23 16:10:06', 1, 1),
(4, 'Mario Kart 8', '1223345672', '<p><span style=\"white-space: pre; white-space: normal;\">	</span></p><p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>', 60.00, 1, 1, 1, '2023-05-11 20:38:24', 1, '2023-06-09 09:44:43', 1, 1),
(5, 'Galaxy S23 Ultra ', 'sm-23', '<p>Galaxy S23 Ultra&nbsp; color verde<br></p>', 1200.00, 1, 1, 6, '2023-05-24 08:30:47', 1, '2023-05-24 08:31:21', 1, 1),
(6, 'Steam Deck', 'dec-001', 'Video juego Steam', 900.00, 1, 1, 7, '2023-06-09 09:37:16', 1, '2023-06-09 09:40:53', 1, 1),
(7, 'PlayStation Vita', 'vita-001', '<p>Video juego vita</p>', 150.00, 1, 1, 2, '2023-06-09 09:42:56', 1, '2023-06-09 09:43:30', 1, 1),
(8, 'Xbox Series X', 'xbox-001', '<p>Video juego xbox serie x</p>', 700.00, 1, 1, 3, '2023-06-09 09:47:24', 1, '2023-06-09 09:48:29', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos_imagenes`
--

CREATE TABLE `tbl_productos_imagenes` (
  `id_producto_imagen` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `fecha_ing` datetime NOT NULL,
  `id_usuario_ing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_productos_imagenes`
--

INSERT INTO `tbl_productos_imagenes` (`id_producto_imagen`, `id_producto`, `imagen`, `principal`, `fecha_ing`, `id_usuario_ing`) VALUES
(13, 1, '99d893429ab2fbb93236ffd9042cc46e.jpg', 1, '2023-05-23 15:58:32', 1),
(14, 1, 'c878d6de2980e28397deb989e1a1495f.png', 0, '2023-05-23 15:59:22', 1),
(15, 2, 'd032944a66b3de223557bf42cd45304c.jpeg', 1, '2023-05-23 16:05:51', 1),
(16, 2, 'c1ef4ed7d79913423900d96e3fade976.jpeg', 0, '2023-05-23 16:05:53', 1),
(17, 3, 'ec497d3b953abcf68e16d709c331d8b6.jpg', 1, '2023-05-23 16:09:53', 1),
(18, 3, '6bdeefd7e7bd465d77efd82249980a31.jpg', 0, '2023-05-23 16:10:03', 1),
(19, 3, '16f1ff9842674e345b141a1cd040f386.jpg', 0, '2023-05-23 16:10:04', 1),
(20, 3, '2e47c4f07f6d5ffaf9f7eeecc08aab6e.jpg', 0, '2023-05-23 16:10:05', 1),
(21, 4, '0962d5827f3a989cb580dd66e25943fc.jpg', 0, '2023-05-23 16:12:43', 1),
(22, 4, '0e237a37ec01f954bcd840a581a5097f.jpg', 0, '2023-05-23 16:12:44', 1),
(23, 5, 'fc969b85f77cb521ad486413c5a6908b.jpg', 1, '2023-05-24 08:31:09', 1),
(24, 5, 'dd74f9d62006d561d6f9bcbd073563c4.jpg', 0, '2023-05-24 08:31:18', 1),
(25, 5, 'f00feebb7c9955115e61177c56e943e8.png', 0, '2023-05-24 08:31:19', 1),
(26, 6, '810469aa52741c245b4fc1d48ed67971.jpg', 1, '2023-06-09 09:40:43', 1),
(27, 6, '08f360e4965f01ef017e414d89b12a4a.jpg', 0, '2023-06-09 09:40:50', 1),
(28, 6, '93db8b93d605d7fe787a5aead80c4541.png', 0, '2023-06-09 09:40:51', 1),
(29, 7, 'a8c705d1dc2d039349581b64ecadde27.png', 1, '2023-06-09 09:43:16', 1),
(30, 7, '6ef1a0e4704befed81b992bcbc747697.jpg', 0, '2023-06-09 09:43:27', 1),
(31, 7, '15d3bf8fa9faa01636fd3c742638c7b5.jpg', 0, '2023-06-09 09:43:28', 1),
(32, 4, 'ebde266eb46ec48e3044217850be6c4d.jpg', 1, '2023-06-09 09:44:40', 1),
(33, 8, '265bc46b621c4b215dc576d3b70a3da0.png', 1, '2023-06-09 09:48:16', 1),
(34, 8, 'cf7934ccd95311a22bc356f55d21763f.jpg', 0, '2023-06-09 09:48:27', 1),
(35, 8, 'f684ba4c63cb44fcf02eddc465939a8d.jpg', 0, '2023-06-09 09:48:28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedores`
--

CREATE TABLE `tbl_proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `fecha_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_proveedores`
--

INSERT INTO `tbl_proveedores` (`id_proveedor`, `codigo`, `nombre`, `descripcion`, `id_departamento`, `id_municipio`, `telefono`, `email`, `id_usuario_ing`, `fecha_ing`, `id_usuario_mod`, `fecha_mod`, `estado`) VALUES
(1, '1234567', 'Nintendo', '<p><span style=\"background-color: rgba(0, 0, 0, 0.05);\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 6, 213, '22336-3444', 'nintendo@nintendo.com', 1, '2023-05-05 20:21:27', 1, 2023, 1),
(2, 'PDV-234', 'Proveedor2.0', '<p>Proveedor2<br></p>', 12, 81, '34567890', 'preveedor2@gmail.com', 1, '2023-05-23 21:19:09', 1, 2023, 1),
(3, '0002', 'Sony', '<p>Proveedor de productos Sony</p>', 6, 204, '77414567', 'Sony@gmail.com', 1, '2023-06-09 09:50:59', 1, 2023, 1),
(4, '0003', 'Microsoft', '<p>Proveedor Microsoft</p>', 5, 129, '34569087', 'Microsoft@gmial.com', 1, '2023-06-09 09:51:49', 1, 2023, 1),
(5, '0004', 'Steam ', '<p>Proveedor Steam</p>', 12, 81, '34569876', 'Steam@gmail.com', 1, '2023-06-09 09:52:43', 1, 2023, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sub_categorias`
--

CREATE TABLE `tbl_sub_categorias` (
  `id_sub_categoria` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_sub_categorias`
--

INSERT INTO `tbl_sub_categorias` (`id_sub_categoria`, `id_categoria`, `nombre`, `descripcion`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 1, 'Consolas', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:22:26', 1, '2023-04-11 01:32:37', 1, 1),
(2, 1, 'Video Juegos', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-23 15:11:57', 1, 1),
(3, 1, 'Computadoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(4, 1, 'Camaras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(5, 1, 'Laptops', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(6, 3, 'Cocinas', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(7, 3, 'Lavadoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(8, 3, 'Secadoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(9, 3, 'Refrigeradoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-23 15:06:09', 1, 1),
(10, 1, 'Telefono Samsung', '<p>Telefono Samsung<br></p>', '2023-05-24 08:30:00', 1, '2023-05-24 08:30:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `username`, `nombre`, `apellido`, `auth_key`, `password_hash`, `email`, `imagen`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', 'AxK42pI4nqEvIyBOBUJVfSR9oRTq-chL', '$2y$13$vfsku0ucja/nzCddYYjL3upKL9uDe/gUyNXK0gqTX0eJ7nFTRIrEu', 'admin@outlook.com', '/avatars/7A5_ev7RvHv5CzTWNZxOLeGpVGZM-ZZv.gif', 1, 1677203598, 1677203598),
(2, 'demo', 'demo', 'demo', '_LDZ2AUvtDDoy36zC6bJhNgJRM9rYO3D', '$2y$13$hGFn5B62kUT0kmTZtQS8We5sIj0vsg1mDH/dyf/j1tZVatVcD4khi', 'demo@outlook.com', '/avatars/default.png', 1, 1677203935, 1677203935);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ventas`
--

CREATE TABLE `tbl_ventas` (
  `id_venta` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `num_factura` varchar(8) NOT NULL,
  `tipo_venta` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `comentario` text NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `tbl_categoiras_fk_id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `tbl_categoiras_fk_id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_compras`
--
ALTER TABLE `tbl_compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `tbl_det_compras`
--
ALTER TABLE `tbl_det_compras`
  ADD PRIMARY KEY (`id_det_compra`),
  ADD KEY `id_compra` (`id_compras`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`),
  ADD KEY `id_compras` (`id_compras`);

--
-- Indices de la tabla `tbl_det_ordenes`
--
ALTER TABLE `tbl_det_ordenes`
  ADD PRIMARY KEY (`id_det_orden`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_error_log`
--
ALTER TABLE `tbl_error_log`
  ADD PRIMARY KEY (`id_error_log`),
  ADD KEY `us_id` (`us_id`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `tbl_kardex`
--
ALTER TABLE `tbl_kardex`
  ADD PRIMARY KEY (`id_kardex`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `tbl_marcas_fk_id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `fk_marcas_fk_id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_dirección` (`id_direccion`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `tbl_producto_fk_id_categoria` (`id_categoria`),
  ADD KEY `tbl_producto_fk_id_sub_categoria` (`id_sub_categoria`),
  ADD KEY `tbl_producto_fk_id_marca` (`id_marca`),
  ADD KEY `tbl_producto_fk_id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `tbl_producto_fk_id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_productos_imagenes`
--
ALTER TABLE `tbl_productos_imagenes`
  ADD PRIMARY KEY (`id_producto_imagen`),
  ADD KEY `tbl_productos_imagenes_fk_id_producto` (`id_producto`),
  ADD KEY `tbl_productos_imagenes_fk_id_usuario_ing` (`id_usuario_ing`);

--
-- Indices de la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `tbl_proveedores_fk_id_departamento` (`id_departamento`),
  ADD KEY `tbl_proveedores_fk_id_municipio` (`id_municipio`),
  ADD KEY `tbl_proveedores_fk_id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `tbl_proveedores_fk_id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  ADD PRIMARY KEY (`id_sub_categoria`),
  ADD KEY `tbl_sub_categorias_fk_id_categoria` (`id_categoria`),
  ADD KEY `tbl_sub_categorias_fk_id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `tbl_sub_categorias_fk_id_usuario_mod` (`id_usuario_mod`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_compras`
--
ALTER TABLE `tbl_compras`
  MODIFY `id_compras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_det_compras`
--
ALTER TABLE `tbl_det_compras`
  MODIFY `id_det_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tbl_det_ordenes`
--
ALTER TABLE `tbl_det_ordenes`
  MODIFY `id_det_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_kardex`
--
ALTER TABLE `tbl_kardex`
  MODIFY `id_kardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT de la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_productos_imagenes`
--
ALTER TABLE `tbl_productos_imagenes`
  MODIFY `id_producto_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  MODIFY `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD CONSTRAINT `tbl_categoiras_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_categoiras_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD CONSTRAINT `tbl_clientes_ibfk_1` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_clientes_ibfk_2` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_compras`
--
ALTER TABLE `tbl_compras`
  ADD CONSTRAINT `tbl_compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedores` (`id_proveedor`),
  ADD CONSTRAINT `tbl_compras_ibfk_2` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_compras_ibfk_3` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_det_compras`
--
ALTER TABLE `tbl_det_compras`
  ADD CONSTRAINT `tbl_det_compras_ibfk_1` FOREIGN KEY (`id_compras`) REFERENCES `tbl_compras` (`id_compras`),
  ADD CONSTRAINT `tbl_det_compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  ADD CONSTRAINT `tbl_det_compras_ibfk_3` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_det_compras_ibfk_4` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_det_ordenes`
--
ALTER TABLE `tbl_det_ordenes`
  ADD CONSTRAINT `tbl_det_ordenes_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes` (`id_orden`),
  ADD CONSTRAINT `tbl_det_ordenes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  ADD CONSTRAINT `tbl_det_ordenes_ibfk_3` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_det_ordenes_ibfk_4` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD CONSTRAINT `tbl_direcciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`),
  ADD CONSTRAINT `tbl_direcciones_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`),
  ADD CONSTRAINT `tbl_direcciones_ibfk_3` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipios` (`id_municipio`),
  ADD CONSTRAINT `tbl_direcciones_ibfk_4` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_direcciones_ibfk_5` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_error_log`
--
ALTER TABLE `tbl_error_log`
  ADD CONSTRAINT `tbl_error_log_ibfk_1` FOREIGN KEY (`us_id`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  ADD CONSTRAINT `tbl_inventario_ibfk_2` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_kardex`
--
ALTER TABLE `tbl_kardex`
  ADD CONSTRAINT `tbl_kardex_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  ADD CONSTRAINT `tbl_kardex_ibfk_2` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  ADD CONSTRAINT `fk_marcas_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_marcas_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD CONSTRAINT `tbl_municipios_fk_id_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`);

--
-- Filtros para la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  ADD CONSTRAINT `tbl_ordenes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`),
  ADD CONSTRAINT `tbl_ordenes_ibfk_2` FOREIGN KEY (`id_direccion`) REFERENCES `tbl_direcciones` (`id_direccion`),
  ADD CONSTRAINT `tbl_ordenes_ibfk_3` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_ordenes_ibfk_4` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `tbl_producto_fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_producto_fk_id_marca` FOREIGN KEY (`id_marca`) REFERENCES `tbl_marcas` (`id_marca`),
  ADD CONSTRAINT `tbl_producto_fk_id_sub_categoria` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categorias` (`id_sub_categoria`),
  ADD CONSTRAINT `tbl_producto_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_producto_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_productos_imagenes`
--
ALTER TABLE `tbl_productos_imagenes`
  ADD CONSTRAINT `tbl_productos_imagenes_fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  ADD CONSTRAINT `tbl_productos_imagenes_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  ADD CONSTRAINT `tbl_proveedores_fk_id_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`),
  ADD CONSTRAINT `tbl_proveedores_fk_id_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipios` (`id_municipio`),
  ADD CONSTRAINT `tbl_proveedores_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_proveedores_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  ADD CONSTRAINT `tbl_sub_categorias_fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_sub_categorias_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_sub_categorias_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  ADD CONSTRAINT `tbl_ventas_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes` (`id_orden`),
  ADD CONSTRAINT `tbl_ventas_ibfk_2` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_ventas_ibfk_3` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

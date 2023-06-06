-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2023 at 05:56 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrador', '1', 1677807726),
('DemoRol', '2', 1677807737);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/clientes/*', 2, NULL, NULL, NULL, 1685560355, 1685560355),
('/compras/*', 2, NULL, NULL, NULL, 1684633296, 1684633296),
('/debug/*', 2, NULL, NULL, NULL, 1677807204, 1677807204),
('/gii/*', 2, NULL, NULL, NULL, 1677807211, 1677807211),
('/gridview/*', 2, NULL, NULL, NULL, 1677807174, 1677807174),
('/productos/*', 2, NULL, NULL, NULL, 1681438950, 1681438950),
('/rbac/*', 2, NULL, NULL, NULL, 1677807195, 1677807195),
('/site/*', 2, NULL, NULL, NULL, 1677807256, 1677807256),
('/usuarios/*', 2, NULL, NULL, NULL, 1677807263, 1677807263),
('Administrador', 1, 'Rol de Administrador del sistema', NULL, NULL, 1677807604, 1677807684),
('DemoRol', 1, 'Rol para demosntacion', NULL, NULL, 1677807665, 1677807665),
('PermisoAdmin', 2, 'Este es el permiso para el administrador', NULL, NULL, 1677807368, 1677807368),
('PermisoDemo', 2, 'Este es un permiso para DEmostracion', NULL, NULL, 1677807505, 1677807505);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('PermisoAdmin', '/clientes/*'),
('PermisoAdmin', '/compras/*'),
('PermisoAdmin', '/debug/*'),
('PermisoAdmin', '/gii/*'),
('PermisoAdmin', '/gridview/*'),
('PermisoDemo', '/gridview/*'),
('PermisoAdmin', '/productos/*'),
('PermisoDemo', '/productos/*'),
('PermisoAdmin', '/rbac/*'),
('PermisoAdmin', '/site/*'),
('PermisoDemo', '/site/*'),
('PermisoAdmin', '/usuarios/*'),
('Administrador', 'PermisoAdmin'),
('DemoRol', 'PermisoDemo');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `id_bitacora` int NOT NULL,
  `id_registro` int NOT NULL,
  `controlador` varchar(25) NOT NULL,
  `accion` varchar(25) NOT NULL,
  `data_original` json DEFAULT NULL,
  `data_modificada` json DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(4, 4, 'categorias', 'update', '{\"nombre\": \"Muebles modificdo\", \"visible\": \"1\", \"fecha_mod\": \"2023-03-23 20:23:06\"}', NULL, 1, '2023-03-23 20:23:06'),
(5, 4, 'categorias', 'update', '{\"nombre\": \"Muebles\", \"visible\": \"1\", \"fecha_mod\": \"2023-03-23 20:24:09\"}', NULL, 1, '2023-03-23 20:24:09'),
(6, 3, 'categorias', 'update', '{\"nombre\": \"Juguetes mod\", \"visible\": \"1\"}', NULL, 1, '2023-03-24 19:12:14'),
(7, 1, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/aPyRNGvl0_GIFiMSgPlVrdHtG4scmQpX.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:24:34\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-14 19:24:34'),
(8, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:24:34\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"0\", \"imagen\": \"/marcas/lrQuSBYxzYg0bS1aqPUZlUWJ1oxn3asR.png\", \"nombre\": \"Nintendo edit\"}', 2, '2023-04-14 19:33:55'),
(9, 1, 'marcas', 'update', '{\"estado\": 0, \"imagen\": \"/marcas/lrQuSBYxzYg0bS1aqPUZlUWJ1oxn3asR.png\", \"nombre\": \"Nintendo edit\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:33:55\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 2}', '{\"estado\": \"1\", \"imagen\": null, \"nombre\": \"Nintendo\"}', 1, '2023-04-14 19:42:04'),
(10, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:42:04\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/q1FBNnjB9VSI4spG8rLmLrSiY4fMCdV_.png\"}', 1, '2023-04-14 19:44:18'),
(11, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/q1FBNnjB9VSI4spG8rLmLrSiY4fMCdV_.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:44:18\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-14 19:44:47'),
(12, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:44:47\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/ruFQPbfJB8H7jt7GqBIo3YLBd2X1SuF8.png\"}', 1, '2023-04-14 19:46:13'),
(13, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/ruFQPbfJB8H7jt7GqBIo3YLBd2X1SuF8.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:46:13\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/17Vk3-yXr1c99EMGAuTJA7xDKiu0ckcH.png\"}', 1, '2023-04-14 19:46:41'),
(14, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/17Vk3-yXr1c99EMGAuTJA7xDKiu0ckcH.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:46:41\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-14 19:47:22'),
(15, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:47:22\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/sO7tniNwACOioTc0ZAMrTHSppBUrSw7p.png\"}', 1, '2023-04-14 19:49:31'),
(16, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/sO7tniNwACOioTc0ZAMrTHSppBUrSw7p.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:49:31\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null, \"nombre\": \"Nintendo edit\"}', 1, '2023-04-14 19:52:11'),
(17, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Nintendo edit\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:52:11\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/_8LcCl1vJzZL8k_aXQlV4xXQNmLdkGOa.png\"}', 1, '2023-04-14 19:52:31'),
(18, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/_8LcCl1vJzZL8k_aXQlV4xXQNmLdkGOa.png\", \"nombre\": \"Nintendo edit\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:52:31\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null, \"nombre\": \"Nintendo\"}', 1, '2023-04-14 19:53:20'),
(19, 1, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-14 19:24:34\", \"fecha_mod\": \"2023-04-14 19:53:20\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/4saQUDzIordqjojY1svj6YUZPnO0AdG_.png\"}', 1, '2023-04-14 19:53:33'),
(20, 2, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/g9kThsZaG6_qKzUFXGfesWVcfhe_X_UG.png\", \"nombre\": \"sony\", \"id_marca\": 2, \"fecha_ing\": \"2023-04-14 19:57:12\", \"fecha_mod\": \"2023-04-14 19:57:12\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-14 19:57:12'),
(21, 2, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/g9kThsZaG6_qKzUFXGfesWVcfhe_X_UG.png\", \"nombre\": \"sony\", \"id_marca\": 2, \"fecha_ing\": \"2023-04-14 19:57:12\", \"fecha_mod\": \"2023-04-14 19:57:12\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/xBCUPlydikuxoS3caB4RJH224pmknouP.png\", \"nombre\": \"Sony\"}', 1, '2023-04-14 19:57:30'),
(22, 3, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/Z2hAy2NwqIds6E6vlOiuIj2ljeCEe5iz.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-14 19:57:55\", \"fecha_mod\": \"2023-04-14 19:57:55\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-14 19:57:55'),
(23, 4, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/qSnRSKmCKJYXO_eN3quVqSBXW-ia_9YP.png\", \"nombre\": \"LG\", \"id_marca\": 4, \"fecha_ing\": \"2023-04-14 19:58:18\", \"fecha_mod\": \"2023-04-14 19:58:18\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-14 19:58:18'),
(24, 5, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/MkyVurYEXDYPOTSo38ZReQ5QTFewi3FA.png\", \"nombre\": \"Apple\", \"id_marca\": 5, \"fecha_ing\": \"2023-04-14 19:58:43\", \"fecha_mod\": \"2023-04-14 19:58:43\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-14 19:58:43'),
(25, 6, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/q4DqeAKjE7-E3PnmaRc7-AwZhfRSR_Ml.png\", \"nombre\": \"SAMSUNG\", \"id_marca\": 6, \"fecha_ing\": \"2023-04-14 19:59:09\", \"fecha_mod\": \"2023-04-14 19:59:09\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-14 19:59:09'),
(26, 6, 'marcas', 'delete', '{\"estado\": 1, \"imagen\": \"/marcas/q4DqeAKjE7-E3PnmaRc7-AwZhfRSR_Ml.png\", \"nombre\": \"SAMSUNG\", \"id_marca\": 6, \"fecha_ing\": \"2023-04-14 19:59:09\", \"fecha_mod\": \"2023-04-14 19:59:09\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": 0}', 1, '2023-04-14 20:11:39'),
(27, 6, 'marcas', 'update', '{\"estado\": 0, \"imagen\": \"/marcas/q4DqeAKjE7-E3PnmaRc7-AwZhfRSR_Ml.png\", \"nombre\": \"SAMSUNG\", \"id_marca\": 6, \"fecha_ing\": \"2023-04-14 19:59:09\", \"fecha_mod\": \"2023-04-14 20:11:39\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/HCk33nXZmYZScJMgEouxaZ9wX0ngnQZe.png\"}', 1, '2023-04-14 20:12:48'),
(28, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/Z2hAy2NwqIds6E6vlOiuIj2ljeCEe5iz.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-14 19:57:55\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null, \"descripcion\": \"<p><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></p>\"}', 1, '2023-04-20 19:08:32'),
(29, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:08:32\", \"descripcion\": \"<p><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/gf-KTzCcWtraZexIxqgTBWzls78EGNmJ.png\"}', 1, '2023-04-20 19:09:29'),
(30, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/gf-KTzCcWtraZexIxqgTBWzls78EGNmJ.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:09:29\", \"descripcion\": \"<p><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-20 19:12:45'),
(31, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:12:45\", \"descripcion\": \"<p><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/4k1-G6uETDgX2RxbKi5LR3ZDwQbAuR41.png\"}', 1, '2023-04-20 19:13:33'),
(32, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/4k1-G6uETDgX2RxbKi5LR3ZDwQbAuR41.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:13:33\", \"descripcion\": \"<p><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/eyDmZZJ9SyqQZJrdj8-IDNzsg0PeTmxb.png\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\"}', 1, '2023-04-20 19:14:51'),
(33, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/eyDmZZJ9SyqQZJrdj8-IDNzsg0PeTmxb.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:14:51\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-20 19:23:35'),
(34, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:23:35\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/t2804yFt-4x46pIa6LToym2eQpn7_IDo.png\"}', 1, '2023-04-20 19:24:00'),
(35, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/t2804yFt-4x46pIa6LToym2eQpn7_IDo.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:24:00\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\">\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</font></p>\"}', 1, '2023-04-20 19:58:57'),
(36, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/t2804yFt-4x46pIa6LToym2eQpn7_IDo.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:58:57\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\">\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</font></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null, \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\"><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></font></p>\"}', 1, '2023-04-20 19:59:39'),
(37, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 19:59:39\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\"><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></font></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/xuRSNieqagJPJ4w9cTI9gcGAXm6X5CSV.png\"}', 1, '2023-04-20 20:00:23'),
(38, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/xuRSNieqagJPJ4w9cTI9gcGAXm6X5CSV.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:00:23\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\"><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></font></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/_WNCYNNb2-QvfxN05_Z-8Pmt1lOLE4bs.png\"}', 1, '2023-04-20 20:00:43'),
(39, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/_WNCYNNb2-QvfxN05_Z-8Pmt1lOLE4bs.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:00:43\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\"><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></font></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-20 20:01:06'),
(40, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:01:06\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\"><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></font></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/Qh9FOXV6fJBxToIDODzqTIBLca3fjQgR.png\"}', 1, '2023-04-20 20:03:09'),
(41, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/Qh9FOXV6fJBxToIDODzqTIBLca3fjQgR.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:03:09\", \"descripcion\": \"<p><font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#000000\\\"><b>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</b></font></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\"}', 1, '2023-04-20 20:06:42'),
(42, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/Qh9FOXV6fJBxToIDODzqTIBLca3fjQgR.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:06:42\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-20 20:06:56'),
(43, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:06:56\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/2Vs8umIIqY1CM9vuXxsxSDijsuD6131d.png\"}', 1, '2023-04-20 20:07:21'),
(44, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/2Vs8umIIqY1CM9vuXxsxSDijsuD6131d.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:07:21\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": null}', 1, '2023-04-20 20:07:34'),
(45, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": null, \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:07:34\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/rM1IB-nAK3XkDjvrBxhSpwZug8Ujk9MN.png\"}', 1, '2023-04-20 20:07:51'),
(46, 3, 'marcas', 'update', '{\"estado\": 1, \"imagen\": \"/marcas/rM1IB-nAK3XkDjvrBxhSpwZug8Ujk9MN.png\", \"nombre\": \"Microsoft\", \"id_marca\": 3, \"fecha_ing\": \"2023-04-12 19:57:55\", \"fecha_mod\": \"2023-04-20 20:07:51\", \"descripcion\": \"<p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\r\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\r\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\r\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\r\\nmollit anim id est laborum.\\\"</p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', '{\"estado\": \"1\", \"imagen\": \"/marcas/qmxsTbTTjP9EYirpaL_hKEnmmJOUOmn4.png\"}', 1, '2023-04-20 20:08:05'),
(47, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:53:33\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/ZbpawjPPQlnTI5vb0K144vACj_VG97fK.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-24 22:26:46'),
(48, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-24 22:26:46\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/QDfFVqv9tZDvmVHRgdoaSG5TY1Vnscma.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-24 22:31:17'),
(49, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-24 22:31:17\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/jvWIP652vv2DFDstq8ogLiHl5TwKW_DX.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-24 22:32:17'),
(50, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-24 22:32:17\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/Qru0KF9XpydARi_LAzFyCfcKOH2UiLV9.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-24 22:33:24'),
(51, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-24 22:33:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/nSk9JSqMu8fQ_3KEXADxzOHZreriC7-9.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-24 22:34:38'),
(52, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-24 22:34:38\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/O4lcse3Tg8yNqMRdiKymsI0hN7KnyJH7.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-24 22:38:57'),
(53, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:57:30\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/ecommerce\\\\/web\\\\/marcas\\\\/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 01:23:34'),
(54, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-24 22:38:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/r7mBZWwsFqS_FRM2bOmW9mtu42awqaOn.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 09:54:28'),
(55, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/r7mBZWwsFqS_FRM2bOmW9mtu42awqaOn.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 09:54:28\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 09:59:37'),
(56, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 01:23:34\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/RYet3SQnDs94Tcxv-KQ5qUtkTkwhY5rP.jpg\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 10:01:36');
INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(57, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/RYet3SQnDs94Tcxv-KQ5qUtkTkwhY5rP.jpg\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 10:01:36\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 10:01:43'),
(58, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 09:59:37\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/bHZzQWXhcfVEIE8T3rt-AqYH33dxHFU7.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 10:45:09'),
(59, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/bHZzQWXhcfVEIE8T3rt-AqYH33dxHFU7.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 10:45:09\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 10:45:17'),
(60, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 10:45:17\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/C6BDrgFgizpPZjD1vUZ6oUoMQRK-fv4-.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 10:51:29'),
(61, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/C6BDrgFgizpPZjD1vUZ6oUoMQRK-fv4-.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 10:51:29\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"nombre\\\": \\\"Nintendo Edit\\\",\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 10:51:36'),
(62, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo Edit\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 10:51:36\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/DV1Nl9eHB1jZ3hySns1pqBrBcivYst7R.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 11:04:21'),
(63, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Sony\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:57:12\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 10:01:43\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/B8S6F806lvftSLOwJFv2S6Rk79wAZeXe.jpg\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 11:04:31'),
(64, 3, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 3,\\n    \\\"nombre\\\": \\\"Microsoft\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-12 19:57:55\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-20 20:08:05\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/RtTVcGEQESahmPVskRJoMde8xT6cPqi2.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 11:07:26'),
(65, 4, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 4,\\n    \\\"nombre\\\": \\\"LG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-13 19:58:18\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:58:18\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/bxU3qlCAfk9NMdpTPrDt-2g5VOGKUm-G.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 11:07:36'),
(66, 5, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 5,\\n    \\\"nombre\\\": \\\"Apple\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 19:58:43\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/Cz42roXvcxPObSwO9hftdLw64uuWOI9o.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 11:07:48'),
(67, 6, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 6,\\n    \\\"nombre\\\": \\\"SAMSUNG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:59:09\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-14 20:12:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/aRBWNh-YuVwKk5EawXWdNLZ8hz14tFO5.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 11:07:57'),
(68, 6, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 6,\\n    \\\"nombre\\\": \\\"SAMSUNG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/aRBWNh-YuVwKk5EawXWdNLZ8hz14tFO5.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:59:09\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 11:07:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-25 16:44:48'),
(69, 6, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 6,\\n    \\\"nombre\\\": \\\"SAMSUNG\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/aRBWNh-YuVwKk5EawXWdNLZ8hz14tFO5.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-14 19:59:09\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 16:44:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/tIopubhx1sfXUSvQpTJc3y2f3-jt1-A6.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-25 16:46:08'),
(70, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo Edit\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/DV1Nl9eHB1jZ3hySns1pqBrBcivYst7R.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-25 11:04:21\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:01:18'),
(71, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/DV1Nl9eHB1jZ3hySns1pqBrBcivYst7R.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:01:18\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:01:28'),
(72, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/DV1Nl9eHB1jZ3hySns1pqBrBcivYst7R.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:01:28\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:02:26'),
(73, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/DV1Nl9eHB1jZ3hySns1pqBrBcivYst7R.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:02:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:04:39'),
(74, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:04:39\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/rF3pO7OxNH3l6E4TuCeYLuA__fLkGrch.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:06:48'),
(75, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/rF3pO7OxNH3l6E4TuCeYLuA__fLkGrch.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:06:48\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/YdfLjx5YoK5iVX7OywIN33kzU7zXVFQK.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:07:05'),
(76, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/YdfLjx5YoK5iVX7OywIN33kzU7zXVFQK.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:07:05\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:21:07'),
(77, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/YdfLjx5YoK5iVX7OywIN33kzU7zXVFQK.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:21:07\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": null,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:21:32'),
(78, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:21:32\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/BsgdKIOgSGArLieqMkQt5_8TKeq72hyf.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:21:44'),
(79, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\\\\r\\\\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\\\r\\\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\\\r\\\\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \\\\r\\\\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \\\\r\\\\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \\\\r\\\\nmollit anim id est laborum.\\\\\\\"<\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/BsgdKIOgSGArLieqMkQt5_8TKeq72hyf.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-11 19:24:34\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-26 00:21:44\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/H7GVPtCQQJt_bS71Q-Oj1c2fAcyXwTsZ.png\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-26 00:23:14'),
(80, 8, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 8,\\n    \\\"nombre\\\": \\\"Playstation 5\\\",\\n    \\\"sku\\\": \\\"ps5-2023uh414\\\",\\n    \\\"descripcion\\\": \\\"<p>PlayStation 5 (abreviada como PS5) es la quinta consola de videojuegos de sobremesa desarrollada por la empresa Sony Interactive Entertainment. Fue anunciada en el a\\\\u00f1o 2019 como la sucesora de la PlayStation 4, la PS5 se lanz\\\\u00f3 el 12 de noviembre de 2020 en Australia, Jap\\\\u00f3n, Nueva Zelanda, Estados Unidos, Canad\\\\u00e1, M\\\\u00e9xico y Corea del Sur, y en el resto de pa\\\\u00edses el 19 de noviembre de 2020. La PlayStation 5 junto con la Xbox Series X|S de Microsoft, lanzada el mismo mes, son parte de la novena generaci\\\\u00f3n de consolas de videojuegos.<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"800.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 1,\\n    \\\"id_marca\\\": 2,\\n    \\\"fecha_ing\\\": null,\\n    \\\"id_usuario_ing\\\": null,\\n    \\\"fecha_mod\\\": null,\\n    \\\"id_usuario_mod\\\": null,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"descripcion\\\": \\\"<p><b>PlayStation 5 <\\\\/b>(abreviada como PS5) es la quinta consola de videojuegos de sobremesa desarrollada por la empresa Sony Interactive Entertainment. Fue anunciada en el a\\\\u00f1o 2019 como la sucesora de la PlayStation 4, la PS5 se lanz\\\\u00f3 el 12 de noviembre de 2020 en Australia, Jap\\\\u00f3n, Nueva Zelanda, Estados Unidos, Canad\\\\u00e1, M\\\\u00e9xico y Corea del Sur, y en el resto de pa\\\\u00edses el 19 de noviembre de 2020. La PlayStation 5 junto con la Xbox Series X|S de Microsoft, lanzada el mismo mes, son parte de la novena generaci\\\\u00f3n de consolas de videojuegos.<br><\\\\/p>\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"2\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-17 16:38:33'),
(81, 8, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 8,\\n    \\\"nombre\\\": \\\"Playstation 5\\\",\\n    \\\"sku\\\": \\\"ps5-2023uh414\\\",\\n    \\\"descripcion\\\": \\\"<p><b>PlayStation 5 <\\\\/b>(abreviada como PS5) es la quinta consola de videojuegos de sobremesa desarrollada por la empresa Sony Interactive Entertainment. Fue anunciada en el a\\\\u00f1o 2019 como la sucesora de la PlayStation 4, la PS5 se lanz\\\\u00f3 el 12 de noviembre de 2020 en Australia, Jap\\\\u00f3n, Nueva Zelanda, Estados Unidos, Canad\\\\u00e1, M\\\\u00e9xico y Corea del Sur, y en el resto de pa\\\\u00edses el 19 de noviembre de 2020. La PlayStation 5 junto con la Xbox Series X|S de Microsoft, lanzada el mismo mes, son parte de la novena generaci\\\\u00f3n de consolas de videojuegos.<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"800.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 1,\\n    \\\"id_marca\\\": 2,\\n    \\\"fecha_ing\\\": \\\"2023-05-16 17:40:53\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-17 16:38:33\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"2\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-17 19:23:19'),
(82, 8, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 8,\\n    \\\"nombre\\\": \\\"Playstation 5\\\",\\n    \\\"sku\\\": \\\"ps5-2023uh414\\\",\\n    \\\"descripcion\\\": \\\"<p><b>PlayStation 5 <\\\\/b>(abreviada como PS5) es la quinta consola de videojuegos de sobremesa desarrollada por la empresa Sony Interactive Entertainment. Fue anunciada en el a\\\\u00f1o 2019 como la sucesora de la PlayStation 4, la PS5 se lanz\\\\u00f3 el 12 de noviembre de 2020 en Australia, Jap\\\\u00f3n, Nueva Zelanda, Estados Unidos, Canad\\\\u00e1, M\\\\u00e9xico y Corea del Sur, y en el resto de pa\\\\u00edses el 19 de noviembre de 2020. La PlayStation 5 junto con la Xbox Series X|S de Microsoft, lanzada el mismo mes, son parte de la novena generaci\\\\u00f3n de consolas de videojuegos.<br><\\\\/p>\\\",\\n    \\\"precio\\\": \\\"800.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 1,\\n    \\\"id_marca\\\": 2,\\n    \\\"fecha_ing\\\": \\\"2023-05-16 17:40:53\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-17 19:23:19\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"2\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-17 20:11:00'),
(83, 2, 'proveedores', 'create', '\"{\\n    \\\"id_proveedor\\\": 2,\\n    \\\"codigo\\\": \\\"PVD-0002\\\",\\n    \\\"nombre\\\": \\\"Proveedor 2\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsun<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"216\\\",\\n    \\\"telefono\\\": \\\"32468900\\\",\\n    \\\"email\\\": \\\"proveedor2@proveedor.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-05-20 22:07:47'),
(84, 2, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 2,\\n    \\\"codigo\\\": \\\"PVD-0002\\\",\\n    \\\"nombre\\\": \\\"Proveedor 2\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsun<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 216,\\n    \\\"telefono\\\": \\\"32468900\\\",\\n    \\\"email\\\": \\\"proveedor2@proveedor.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"nombre\\\": \\\"Marielos\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsum editado<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"216\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-20 22:24:37'),
(85, 2, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 2,\\n    \\\"codigo\\\": \\\"PVD-0002\\\",\\n    \\\"nombre\\\": \\\"Marielos\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsum editado<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 216,\\n    \\\"telefono\\\": \\\"32468900\\\",\\n    \\\"email\\\": \\\"proveedor2@proveedor.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-20 22:24:37\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"216\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-20 22:25:28'),
(86, 2, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 2,\\n    \\\"codigo\\\": \\\"PVD-0002\\\",\\n    \\\"nombre\\\": \\\"Marielos\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsum editado<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 216,\\n    \\\"telefono\\\": \\\"32468900\\\",\\n    \\\"email\\\": \\\"proveedor2@proveedor.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-20 22:25:28\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-20 22:25:35'),
(87, 2, 'proveedores', 'delete', '\"{\\n    \\\"id_proveedor\\\": 2,\\n    \\\"codigo\\\": \\\"PVD-0002\\\",\\n    \\\"nombre\\\": \\\"Marielos\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsum editado<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 214,\\n    \\\"telefono\\\": \\\"32468900\\\",\\n    \\\"email\\\": \\\"proveedor2@proveedor.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-20 22:25:35\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-05-20 22:28:45'),
(88, 2, 'proveedores', 'update', '\"{\\n    \\\"id_proveedor\\\": 2,\\n    \\\"codigo\\\": \\\"PVD-0002\\\",\\n    \\\"nombre\\\": \\\"Marielos\\\",\\n    \\\"direccion\\\": \\\"<p>Lorem ipsum editado<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 214,\\n    \\\"telefono\\\": \\\"32468900\\\",\\n    \\\"email\\\": \\\"proveedor2@proveedor.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-20 22:07:47\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-20 22:28:45\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-20 22:28:51'),
(89, 1, 'compras', 'create', '\"{\\n    \\\"id_compra\\\": 1,\\n    \\\"codigo\\\": \\\"CMPR-00001\\\",\\n    \\\"num_factura\\\": \\\"42521\\\",\\n    \\\"id_proveedor\\\": \\\"1\\\",\\n    \\\"tipo_compra\\\": \\\"0\\\",\\n    \\\"fecha\\\": \\\"2023-5-20\\\",\\n    \\\"anulado\\\": 0,\\n    \\\"comentarios\\\": \\\"<p>Escribimos los comentarios de la compra<\\\\/p>\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-29 22:37:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-29 22:37:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', NULL, 1, '2023-05-29 22:37:54'),
(90, 1, 'det-compras', 'create', '\"{\\n    \\\"id_det_compra\\\": 1,\\n    \\\"id_compra\\\": \\\"1\\\",\\n    \\\"id_producto\\\": \\\"8\\\",\\n    \\\"cantidad\\\": \\\"5\\\",\\n    \\\"costo\\\": \\\"559.99\\\",\\n    \\\"descuento\\\": \\\"10\\\",\\n    \\\"uuid\\\": \\\"42e5e43e-634b-4a6e-b9f1-516d945fafa2\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 11:07:18\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 11:07:18\\\",\\n    \\\"id_usuario_mod\\\": 1\\n}\"', NULL, 1, '2023-05-31 11:07:18'),
(91, 9, 'productos', 'create', '\"{\\n    \\\"id_producto\\\": 9,\\n    \\\"nombre\\\": \\\"Xbox Series X\\\",\\n    \\\"sku\\\": \\\"xbox-sx-823\\\",\\n    \\\"descripcion\\\": \\\"<p>Descripcion de la Xbox Series X<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"599\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"3\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 11:37:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 11:37:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-05-31 11:37:54'),
(92, 9, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 9,\\n    \\\"nombre\\\": \\\"Xbox Series X\\\",\\n    \\\"sku\\\": \\\"xbox-sx-823\\\",\\n    \\\"descripcion\\\": \\\"<p>Descripcion de la Xbox Series X<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"599.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 1,\\n    \\\"id_marca\\\": 3,\\n    \\\"fecha_ing\\\": \\\"2023-05-31 11:37:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 11:37:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"3\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-31 11:38:24'),
(93, 2, 'det-compras', 'create', '\"{\\n    \\\"id_det_compra\\\": 2,\\n    \\\"id_compra\\\": \\\"1\\\",\\n    \\\"id_producto\\\": \\\"9\\\",\\n    \\\"cantidad\\\": \\\"30\\\",\\n    \\\"costo\\\": \\\"399.99\\\",\\n    \\\"descuento\\\": \\\"0.00\\\",\\n    \\\"uuid\\\": \\\"d3b24136-a312-414d-ad32-72c92446b6fe\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 11:39:14\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 11:39:14\\\",\\n    \\\"id_usuario_mod\\\": 1\\n}\"', NULL, 1, '2023-05-31 11:39:14'),
(94, 1, 'clientes', 'create', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Ashly\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-05-31 14:07:40'),
(95, 1, 'clientes', 'update', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Ashly\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-31 14:57:37'),
(96, 1, 'clientes', 'delete', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 14:57:37\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-05-31 14:57:44'),
(97, 1, 'clientes', 'update', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 14:57:44\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-05-31 14:57:49'),
(98, 4, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 4,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Edgar\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>rqrwrwr<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 1,\\n    \\\"fecha_ing\\\": null,\\n    \\\"id_usuario_ing\\\": null,\\n    \\\"fecha_mod\\\": null,\\n    \\\"id_usuario_mod\\\": null,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"id_departamento\\\": \\\"2\\\",\\n    \\\"id_municipio\\\": \\\"13\\\",\\n    \\\"principal\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-03 21:29:31'),
(99, 4, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 4,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Edgar\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>rqrwrwr<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 1,\\n    \\\"fecha_ing\\\": null,\\n    \\\"id_usuario_ing\\\": null,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 21:29:31\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-06-03 21:29:49'),
(100, 5, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 5,\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"contacto\\\": \\\"Edgar\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Barrio Concepcion<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"principal\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-03 21:31:02\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 21:31:02\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-03 21:31:02'),
(101, 10, 'productos', 'create', '\"{\\n    \\\"id_producto\\\": 10,\\n    \\\"nombre\\\": \\\"Nintendo Switch\\\",\\n    \\\"sku\\\": \\\"nin-sw-2324\\\",\\n    \\\"descripcion\\\": \\\"<p>Descripcion de Nintendo Switch<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"350\\\",\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-03 22:18:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 22:18:15\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-03 22:18:15'),
(102, 10, 'productos', 'update', '\"{\\n    \\\"id_producto\\\": 10,\\n    \\\"nombre\\\": \\\"Nintendo Switch\\\",\\n    \\\"sku\\\": \\\"nin-sw-2324\\\",\\n    \\\"descripcion\\\": \\\"<p>Descripcion de Nintendo Switch<\\\\/p>\\\",\\n    \\\"precio\\\": \\\"350.00\\\",\\n    \\\"id_categoria\\\": 1,\\n    \\\"id_sub_categoria\\\": 1,\\n    \\\"id_marca\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-06-03 22:18:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 22:18:15\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_categoria\\\": \\\"1\\\",\\n    \\\"id_sub_categoria\\\": \\\"1\\\",\\n    \\\"id_marca\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-03 22:19:13'),
(103, 3, 'det-compras', 'create', '\"{\\n    \\\"id_det_compra\\\": 3,\\n    \\\"id_compra\\\": \\\"1\\\",\\n    \\\"id_producto\\\": \\\"10\\\",\\n    \\\"cantidad\\\": \\\"10\\\",\\n    \\\"costo\\\": \\\"299.99\\\",\\n    \\\"descuento\\\": \\\"5\\\",\\n    \\\"uuid\\\": \\\"7aad2da0-2b46-4aea-bdbb-6050660dcb51\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-03 22:20:04\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 22:20:04\\\",\\n    \\\"id_usuario_mod\\\": 1\\n}\"', NULL, 1, '2023-06-03 22:20:04'),
(104, 4, 'det-compras', 'create', '\"{\\n    \\\"id_det_compra\\\": 4,\\n    \\\"id_compra\\\": \\\"1\\\",\\n    \\\"id_producto\\\": \\\"10\\\",\\n    \\\"cantidad\\\": \\\"10\\\",\\n    \\\"costo\\\": \\\"299.99\\\",\\n    \\\"descuento\\\": \\\"5\\\",\\n    \\\"uuid\\\": \\\"4127817d-f685-494a-9961-585573f50d26\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-03 23:01:38\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 23:01:38\\\",\\n    \\\"id_usuario_mod\\\": 1\\n}\"', NULL, 1, '2023-06-03 23:01:38'),
(105, 6, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"2\\\",\\n    \\\"id_municipio\\\": \\\"13\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', NULL, 1, '2023-06-05 17:45:54'),
(106, 2, 'clientes', 'create', '\"{\\n    \\\"id_cliente\\\": 2,\\n    \\\"nombre\\\": \\\"Edgar\\\",\\n    \\\"apellido\\\": \\\"Campos\\\",\\n    \\\"telefono\\\": \\\"31457777\\\",\\n    \\\"email\\\": \\\"cliente2@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 18:37:46\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 18:37:46\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 18:37:46'),
(107, 7, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 7,\\n    \\\"id_cliente\\\": \\\"2\\\",\\n    \\\"contacto\\\": \\\"Benito\\\",\\n    \\\"telefono\\\": \\\"24224445\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion Principal<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"principal\\\": \\\"1\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 18:39:27\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 18:39:27\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 18:39:27'),
(108, 8, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 8,\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"contacto\\\": \\\"Moises\\\",\\n    \\\"telefono\\\": \\\"214565333\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 3<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"199\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:02:04\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 20:02:04\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 20:02:04'),
(109, 9, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 9,\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"contacto\\\": \\\"Cesar\\\",\\n    \\\"telefono\\\": \\\"13568900\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 4<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"199\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:02:43\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 20:02:43\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 20:02:43'),
(110, 10, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"199\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 20:03:15'),
(111, 11, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 11,\\n    \\\"id_cliente\\\": \\\"1\\\",\\n    \\\"contacto\\\": \\\"Jaime\\\",\\n    \\\"telefono\\\": \\\"57322222\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 6<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"6\\\",\\n    \\\"id_municipio\\\": \\\"97\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:50\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 20:03:50\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 20:03:50'),
(112, 5, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 5,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Edgar\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Barrio Concepcion<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 214,\\n    \\\"principal\\\": 1,\\n    \\\"fecha_ing\\\": \\\"2023-06-03 21:31:02\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-03 21:31:02\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"214\\\",\\n    \\\"principal\\\": \\\"1\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 22:43:05'),
(113, 1, 'clientes', 'update', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-05-31 14:57:49\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 22:43:17'),
(114, 10, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-06-05 22:44:13'),
(115, 10, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 22:44:13\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"199\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-06-05 22:44:23');
INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(116, 10, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 22:44:23\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-06-05 22:44:23'),
(117, 10, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 22:44:23\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-06-05 22:44:23'),
(118, 6, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-06-05 17:45:54'),
(119, 6, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-06-05 17:45:54'),
(120, 6, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"2\\\",\\n    \\\"id_municipio\\\": \\\"13\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 22:59:59'),
(121, 6, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 22:59:59\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-06-05 23:00:02'),
(122, 6, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:00:02\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"2\\\",\\n    \\\"id_municipio\\\": \\\"13\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 23:01:56'),
(123, 6, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:01:56\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-06-05 23:01:59'),
(124, 6, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:01:59\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"2\\\",\\n    \\\"id_municipio\\\": \\\"13\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 23:02:05'),
(125, 6, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:02:05\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-06-05 23:02:10'),
(126, 6, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 6,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Marie\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 2,\\n    \\\"id_municipio\\\": 13,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 17:45:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:02:10\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"2\\\",\\n    \\\"id_municipio\\\": \\\"13\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 23:02:16'),
(127, 10, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 22:44:23\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"199\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-06-05 23:02:45'),
(128, 1, 'clientes', 'update', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 22:43:17\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 23:02:56'),
(129, 1, 'clientes', 'delete', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:02:56\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-06-05 23:03:01'),
(130, 1, 'clientes', 'update', '\"{\\n    \\\"id_cliente\\\": 1,\\n    \\\"nombre\\\": \\\"Gissel\\\",\\n    \\\"apellido\\\": \\\"Zelaya\\\",\\n    \\\"telefono\\\": \\\"13269076\\\",\\n    \\\"email\\\": \\\"cliente1@cliente.com\\\",\\n    \\\"fecha_ing\\\": \\\"2023-05-31 14:07:40\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:03:01\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 23:03:06'),
(131, 10, 'direcciones', 'delete', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:02:45\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-06-05 23:02:45'),
(132, 10, 'direcciones', 'update', '\"{\\n    \\\"id_direccion\\\": 10,\\n    \\\"id_cliente\\\": 1,\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"55578886\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 5<\\\\/p>\\\",\\n    \\\"id_departamento\\\": 12,\\n    \\\"id_municipio\\\": 199,\\n    \\\"principal\\\": 0,\\n    \\\"fecha_ing\\\": \\\"2023-06-05 20:03:15\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:02:45\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"199\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-06-05 23:23:34'),
(133, 12, 'direcciones', 'create', '\"{\\n    \\\"id_direccion\\\": 12,\\n    \\\"id_cliente\\\": \\\"2\\\",\\n    \\\"contacto\\\": \\\"Fernando\\\",\\n    \\\"telefono\\\": \\\"22146477\\\",\\n    \\\"direccion\\\": \\\"<p>Direccion 2<\\\\/p>\\\",\\n    \\\"id_departamento\\\": \\\"12\\\",\\n    \\\"id_municipio\\\": \\\"211\\\",\\n    \\\"principal\\\": \\\"0\\\",\\n    \\\"fecha_ing\\\": \\\"2023-06-05 23:43:19\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-06-05 23:43:19\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', NULL, 1, '2023-06-05 23:43:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categorias`
--

CREATE TABLE `tbl_categorias` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id_categoria`, `nombre`, `descripcion`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Tecnologia', '<h5><font style=\"background-color: rgb(255, 255, 0);\" color=\"#000000\">The standard Lorem Ipsum passage, used since the 1500s</font></h5><p>\"Lorem\r\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.\"</p><p></p>', '2023-04-09 19:09:17', 1, '2023-04-11 02:34:33', 2, 1),
(2, 'Hogar', '\"Lorem\r\n ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.\"<br><p></p>', '2023-04-09 19:11:56', 1, '2023-04-09 19:16:58', 1, 1),
(3, 'Linea Blanca', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-10 23:03:55', 1, '2023-04-10 23:03:55', 1, 1),
(4, 'Juguetes', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-10 23:38:58', 1, '2023-04-10 23:38:58', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefono` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`id_cliente`, `nombre`, `apellido`, `telefono`, `email`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Gissel', 'Zelaya', '13269076', 'cliente1@cliente.com', '2023-05-31 14:07:40', 1, '2023-06-05 23:03:06', 1, 1),
(2, 'Edgar', 'Campos', '31457777', 'cliente2@cliente.com', '2023-06-05 18:37:46', 1, '2023-06-05 18:37:46', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compras`
--

CREATE TABLE `tbl_compras` (
  `id_compra` int NOT NULL,
  `codigo` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `num_factura` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_proveedor` int NOT NULL,
  `tipo_compra` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `anulado` tinyint(1) NOT NULL DEFAULT '0',
  `comentarios` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_compras`
--

INSERT INTO `tbl_compras` (`id_compra`, `codigo`, `num_factura`, `id_proveedor`, `tipo_compra`, `fecha`, `anulado`, `comentarios`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'CMPR-00001', '42521', 1, 0, '2023-05-20', 0, '<p>Escribimos los comentarios de la compra</p>', '2023-05-29 22:37:54', 1, '2023-05-29 22:37:54', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `id_departamento` int NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_departamentos`
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
(9, 'CABANAS', 'CA'),
(10, 'SAN VICENTE', 'SV'),
(11, 'USULUTAN', 'US'),
(12, 'SAN MIGUEL', 'SM'),
(13, 'MORAZAN', 'MO'),
(14, 'LA UNION', 'LU');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_det_compras`
--

CREATE TABLE `tbl_det_compras` (
  `id_det_compra` int NOT NULL,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_det_compras`
--

INSERT INTO `tbl_det_compras` (`id_det_compra`, `id_compra`, `id_producto`, `cantidad`, `costo`, `descuento`, `uuid`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`) VALUES
(1, 1, 8, 10, '659.99', '12.00', '42e5e43e-634b-4a6e-b9f1-516d945fafa2', '2023-05-31 11:07:18', 1, '2023-06-04 13:43:01', 1),
(2, 1, 9, 30, '399.99', '0.00', 'd3b24136-a312-414d-ad32-72c92446b6fe', '2023-05-31 11:39:14', 1, '2023-06-05 17:10:54', 1),
(3, 1, 10, 10, '299.99', '5.00', '7aad2da0-2b46-4aea-bdbb-6050660dcb51', '2023-06-03 22:20:04', 1, '2023-06-03 22:20:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `id_direccion` int NOT NULL,
  `id_cliente` int NOT NULL,
  `contacto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefono` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_departamento` int NOT NULL,
  `id_municipio` int NOT NULL,
  `principal` tinyint NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`id_direccion`, `id_cliente`, `contacto`, `telefono`, `direccion`, `id_departamento`, `id_municipio`, `principal`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(5, 1, 'Edgar', '22146477', '<p>Barrio Concepcion</p>', 12, 214, 1, '2023-06-03 21:31:02', 1, '2023-06-05 22:43:05', 1, 1),
(6, 1, 'Marie', '22146477', '<p>Direccion 2</p>', 2, 13, 0, '2023-06-05 17:45:54', 1, '2023-06-05 23:02:16', 1, 1),
(7, 2, 'Benito', '24224445', '<p>Direccion Principal</p>', 12, 214, 1, '2023-06-05 18:39:27', 1, '2023-06-05 18:39:27', 1, 1),
(8, 1, 'Moises', '214565333', '<p>Direccion 3</p>', 12, 199, 0, '2023-06-05 20:02:04', 1, '2023-06-05 20:02:04', 1, 1),
(9, 1, 'Cesar', '13568900', '<p>Direccion 4</p>', 12, 199, 0, '2023-06-05 20:02:43', 1, '2023-06-05 20:02:43', 1, 1),
(10, 1, 'Fernando', '55578886', '<p>Direccion 5</p>', 12, 199, 0, '2023-06-05 20:03:15', 1, '2023-06-05 23:23:34', 1, 1),
(12, 2, 'Fernando', '22146477', '<p>Direccion 2</p>', 12, 211, 0, '2023-06-05 23:43:19', 1, '2023-06-05 23:43:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_error_log`
--

CREATE TABLE `tbl_error_log` (
  `id_error_log` int NOT NULL,
  `controller` varchar(50) NOT NULL,
  `mensaje` text NOT NULL,
  `us_id` int NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_error_log`
--

INSERT INTO `tbl_error_log` (`id_error_log`, `controller`, `mensaje`, `us_id`, `fecha`) VALUES
(1, 'categorias/create', 'Exception: Usuario is invalid. in C:\\laragon\\www\\yii2basico\\controllers\\CategoriasController.php:85<br />\nStack trace:<br />\n#0 [internal function]: app\\controllers\\CategoriasController-&gt;actionCreate()<br />\n#1 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;categorias/crea...&#039;, Array)<br />\n#5 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\yii2basico\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-03-03 19:57:40'),
(2, 'categorias/update', 'Exception in C:\\laragon\\www\\yii2basico\\controllers\\CategoriasController.php:139<br />\nStack trace:<br />\n#0 [internal function]: app\\controllers\\CategoriasController-&gt;actionUpdate(&#039;4&#039;)<br />\n#1 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#4 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;categorias/upda...&#039;, Array)<br />\n#5 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\yii2basico\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-03-23 20:15:55'),
(3, 'categorias/update', 'Exception in C:\\laragon\\www\\yii2basico\\controllers\\CategoriasController.php:139<br />\nStack trace:<br />\n#0 [internal function]: app\\controllers\\CategoriasController-&gt;actionUpdate(&#039;4&#039;)<br />\n#1 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#4 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;categorias/upda...&#039;, Array)<br />\n#5 C:\\laragon\\www\\yii2basico\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\yii2basico\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-03-23 20:18:20'),
(4, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/aPyRNGvl0_GIFiMSgPlVrdHtG4scmQpX.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:153<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 153, Array)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(153): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 2, '2023-04-14 19:29:32'),
(5, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/aPyRNGvl0_GIFiMSgPlVrdHtG4scmQpX.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:153<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 153, Array)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(153): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 2, '2023-04-14 19:30:56'),
(6, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:156<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 156, Array)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(156): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;3&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-20 20:03:22'),
(7, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/4saQUDzIordqjojY1svj6YUZPnO0AdG_.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-24 22:07:58'),
(8, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/4saQUDzIordqjojY1svj6YUZPnO0AdG_.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-24 22:08:59'),
(9, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/4saQUDzIordqjojY1svj6YUZPnO0AdG_.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:168<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 168)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(168): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-24 22:11:48'),
(10, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/4saQUDzIordqjojY1svj6YUZPnO0AdG_.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:168<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 168)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(168): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-24 22:15:07'),
(11, 'marcas/update', 'yii\\base\\ErrorException: move_uploaded_file(C:\\laragon\\www\\ecommerceweb\\marcasFYafXB5URl3krwYWU6M7MZ8fWKDLBJzn.png): Failed to open stream: No such file or directory in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\UploadedFile.php:197<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;move_uploaded_f...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 197)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\UploadedFile.php(197): move_uploaded_file(&#039;C:\\\\Users\\\\User\\\\A...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(162): yii\\web\\UploadedFile-&gt;saveAs(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#3 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#8 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#9 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#10 {main}', 1, '2023-04-24 22:29:20'),
(12, 'marcas/update', 'yii\\base\\ErrorException: move_uploaded_file(C:\\laragon\\www\\ecommerceweb\\marcas95yK7ViLrBGMTZz2eqVUSIPkResiuEoj.png): Failed to open stream: No such file or directory in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\UploadedFile.php:197<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;move_uploaded_f...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 197)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\UploadedFile.php(197): move_uploaded_file(&#039;C:\\\\Users\\\\User\\\\A...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(162): yii\\web\\UploadedFile-&gt;saveAs(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#3 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#8 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#9 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#10 {main}', 1, '2023-04-24 22:29:44'),
(13, 'marcas/update', 'yii\\base\\ErrorException: move_uploaded_file(C:\\laragon\\www\\ecommerceweb\\marcas7mx4hRXtp1_rey2MGQ6vR9lQx6iDJYAY.png): Failed to open stream: No such file or directory in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\UploadedFile.php:197<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;move_uploaded_f...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 197)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\UploadedFile.php(197): move_uploaded_file(&#039;C:\\\\Users\\\\User\\\\A...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(162): yii\\web\\UploadedFile-&gt;saveAs(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#3 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#8 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#9 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#10 {main}', 1, '2023-04-24 22:30:32'),
(14, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas/xBCUPlydikuxoS3caB4RJH224pmknouP.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 01:18:31'),
(15, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 01:19:59'),
(16, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/ecommerce/web/marcas/O4lcse3Tg8yNqMRdiKymsI0hN7KnyJH7.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 01:20:41'),
(17, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 01:23:41'),
(18, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:168<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 168)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(168): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 01:25:21'),
(19, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas//ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:168<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 168)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(168): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 01:28:13'),
(20, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 09:31:21'),
(21, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/marcas//ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 09:50:26'),
(22, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerceweb\\marcas/ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 09:51:24'),
(23, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 09:51:50'),
(24, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web/ecommerce/web/marcas/tykrQVkk1FO9OBttlUg0ZQERu4Tul9KG.png): No such file or directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 09:54:48'),
(25, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 09:56:06'),
(26, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 10:01:51'),
(27, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 10:40:22'),
(28, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 10:44:48'),
(29, 'marcas/update', 'yii\\base\\ErrorException: unlink(C:\\laragon\\www\\ecommerce/web): Is a directory in C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php:152<br />\nStack trace:<br />\n#0 [internal function]: yii\\base\\ErrorHandler-&gt;handleError(2, &#039;unlink(C:\\\\larag...&#039;, &#039;C:\\\\laragon\\\\www\\\\...&#039;, 152)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\productos\\controllers\\MarcasController.php(152): unlink(&#039;C:\\\\laragon\\\\www\\\\...&#039;)<br />\n#2 [internal function]: app\\modules\\productos\\controllers\\MarcasController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;productos/marca...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-04-25 10:45:32'),
(30, 'proveedores/update', 'yii\\base\\UnknownPropertyException: Getting unknown property: app\\modules\\compras\\models\\Proveedores::2 in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:154<br />\nStack trace:<br />\n#0 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component-&gt;__get(&#039;2&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\compras\\controllers\\ProveedoresController.php(136): yii\\db\\BaseActiveRecord-&gt;__get(&#039;2&#039;)<br />\n#2 [internal function]: app\\modules\\compras\\controllers\\ProveedoresController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;compras/proveed...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-05-20 22:12:23'),
(31, 'proveedores/update', 'yii\\base\\UnknownPropertyException: Getting unknown property: app\\modules\\compras\\models\\Proveedores::2 in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:154<br />\nStack trace:<br />\n#0 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component-&gt;__get(&#039;2&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\compras\\controllers\\ProveedoresController.php(136): yii\\db\\BaseActiveRecord-&gt;__get(&#039;2&#039;)<br />\n#2 [internal function]: app\\modules\\compras\\controllers\\ProveedoresController-&gt;actionUpdate(&#039;2&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;compras/proveed...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-05-20 22:14:21'),
(32, 'proveedores/update', 'yii\\base\\UnknownPropertyException: Getting unknown property: app\\modules\\compras\\models\\Proveedores::1 in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:154<br />\nStack trace:<br />\n#0 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component-&gt;__get(&#039;1&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\compras\\controllers\\ProveedoresController.php(136): yii\\db\\BaseActiveRecord-&gt;__get(&#039;1&#039;)<br />\n#2 [internal function]: app\\modules\\compras\\controllers\\ProveedoresController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;compras/proveed...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-05-20 22:15:55');
INSERT INTO `tbl_error_log` (`id_error_log`, `controller`, `mensaje`, `us_id`, `fecha`) VALUES
(33, 'proveedores/update', 'yii\\base\\UnknownPropertyException: Getting unknown property: app\\modules\\compras\\models\\Proveedores::1 in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:154<br />\nStack trace:<br />\n#0 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component-&gt;__get(&#039;1&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\compras\\controllers\\ProveedoresController.php(136): yii\\db\\BaseActiveRecord-&gt;__get(&#039;1&#039;)<br />\n#2 [internal function]: app\\modules\\compras\\controllers\\ProveedoresController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;compras/proveed...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-05-20 22:18:31'),
(34, 'proveedores/update', 'yii\\base\\UnknownPropertyException: Getting unknown property: app\\modules\\compras\\models\\Proveedores::1 in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:154<br />\nStack trace:<br />\n#0 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component-&gt;__get(&#039;1&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\compras\\controllers\\ProveedoresController.php(136): yii\\db\\BaseActiveRecord-&gt;__get(&#039;1&#039;)<br />\n#2 [internal function]: app\\modules\\compras\\controllers\\ProveedoresController-&gt;actionUpdate(&#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;compras/proveed...&#039;, Array)<br />\n#7 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#8 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#9 {main}', 1, '2023-05-20 22:22:28'),
(35, 'direcciones/create', 'Exception: Fecha cannot be blank. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:96<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate()<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-03 21:25:54'),
(36, 'direcciones/create', 'Exception: Fecha cannot be blank. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:96<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate()<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-03 21:27:04'),
(37, 'direcciones/create', 'Exception: Fecha cannot be blank. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:96<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate()<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-03 21:28:13'),
(38, 'direcciones/create', 'Exception: Id Cliente cannot be blank. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:81<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate()<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 16:37:25'),
(39, 'direcciones/create', 'Exception: Id Cliente cannot be blank. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:81<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate()<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 16:41:22'),
(40, 'direcciones/update', 'Exception: Ya existe otra dirección principal para este cliente. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:135<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionUpdate(&#039;6&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 23:16:01'),
(41, 'direcciones/update', 'yii\\base\\UnknownPropertyException: Getting unknown property: app\\modules\\clientes\\models\\Direcciones::cliente_id in C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Component.php:154<br />\nStack trace:<br />\n#0 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component-&gt;__get(&#039;cliente_id&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\modules\\clientes\\models\\Direcciones.php(88): yii\\db\\BaseActiveRecord-&gt;__get(&#039;cliente_id&#039;)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\validators\\InlineValidator.php(77): app\\modules\\clientes\\models\\Direcciones-&gt;validatePrincipal(&#039;principal&#039;, NULL, Object(yii\\validators\\InlineValidator), &#039;1&#039;)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\validators\\Validator.php(260): yii\\validators\\InlineValidator-&gt;validateAttribute(Object(app\\modules\\clientes\\models\\Direcciones), &#039;principal&#039;)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Model.php(368): yii\\validators\\Validator-&gt;validateAttributes(Object(app\\modules\\clientes\\models\\Direcciones), Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\ActiveRecord.php(674): yii\\base\\Model-&gt;validate(Array)<br />\n#6 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(679): yii\\db\\ActiveRecord-&gt;update(true, NULL)<br />\n#7 C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php(136): yii\\db\\BaseActiveRecord-&gt;save()<br />\n#8 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionUpdate(&#039;10&#039;)<br />\n#9 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#10 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#11 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#12 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#13 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#14 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#15 {main}', 1, '2023-06-05 23:18:16'),
(42, 'direcciones/update', 'Exception: Ya existe otra dirección principal para este cliente. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:137<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionUpdate(&#039;10&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 23:23:16'),
(43, 'direcciones/create', 'Exception: Ya existe otra dirección principal para este cliente. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:85<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate(&#039;1&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 23:24:12'),
(44, 'direcciones/create', 'Exception: Ya existe otra dirección principal para este cliente. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:85<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionCreate(&#039;1&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;create&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 23:24:54'),
(45, 'direcciones/update', 'Exception: Ya existe otra dirección principal para este cliente. in C:\\laragon\\www\\ecommerce\\modules\\clientes\\controllers\\DireccionesController.php:142<br />\nStack trace:<br />\n#0 [internal function]: app\\modules\\clientes\\controllers\\DireccionesController-&gt;actionUpdate(&#039;12&#039;)<br />\n#1 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)<br />\n#2 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction-&gt;runWithParams(Array)<br />\n#3 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller-&gt;runAction(&#039;update&#039;, Array)<br />\n#4 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module-&gt;runAction(&#039;clientes/direcc...&#039;, Array)<br />\n#5 C:\\laragon\\www\\ecommerce\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application-&gt;handleRequest(Object(yii\\web\\Request))<br />\n#6 C:\\laragon\\www\\ecommerce\\web\\index.php(12): yii\\base\\Application-&gt;run()<br />\n#7 {main}', 1, '2023-06-05 23:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marcas`
--

CREATE TABLE `tbl_marcas` (
  `id_marca` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_marcas`
--

INSERT INTO `tbl_marcas` (`id_marca`, `nombre`, `descripcion`, `imagen`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Nintendo', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/H7GVPtCQQJt_bS71Q-Oj1c2fAcyXwTsZ.png', '2023-04-11 19:24:34', 1, '2023-04-26 00:23:14', 1, 1),
(2, 'Sony', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/B8S6F806lvftSLOwJFv2S6Rk79wAZeXe.jpg', '2023-04-11 19:57:12', 1, '2023-04-25 11:04:31', 1, 1),
(3, 'Microsoft', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/RtTVcGEQESahmPVskRJoMde8xT6cPqi2.png', '2023-04-12 19:57:55', 1, '2023-04-25 11:07:26', 1, 1),
(4, 'LG', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/bxU3qlCAfk9NMdpTPrDt-2g5VOGKUm-G.png', '2023-04-13 19:58:18', 1, '2023-04-25 11:07:36', 1, 1),
(5, 'Apple', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/Cz42roXvcxPObSwO9hftdLw64uuWOI9o.png', '2023-04-14 19:58:43', 1, '2023-04-25 11:07:48', 1, 1),
(6, 'SAMSUNG', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '/marcas/tIopubhx1sfXUSvQpTJc3y2f3-jt1-A6.png', '2023-04-14 19:59:09', 1, '2023-04-25 16:46:08', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_municipios`
--

CREATE TABLE `tbl_municipios` (
  `id_municipio` int NOT NULL,
  `id_departamento` int NOT NULL,
  `nombre` varchar(125) NOT NULL,
  `codigo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_municipios`
--

INSERT INTO `tbl_municipios` (`id_municipio`, `id_departamento`, `nombre`, `codigo`) VALUES
(1, 1, 'AHUACHAPAN', '0101'),
(2, 1, 'APANECA', '0102'),
(3, 1, 'ATIQUIZAYA', '0103'),
(4, 1, 'CONCEPCION DE ATACO', '0104'),
(5, 1, 'EL REFUGIO', '0105'),
(6, 1, 'GUAYMANGO', '0106'),
(7, 1, 'JUJUTLA', '0107'),
(8, 1, 'SAN FRANCISCO MENENDEZ', '0108'),
(9, 1, 'SAN LORENZO', '0109'),
(10, 1, 'SAN PEDRO PUXTLA', '0110'),
(11, 1, 'TACUBA', '0111'),
(12, 1, 'TURIN', '0112'),
(13, 2, 'SANTA ANA', '0201'),
(14, 2, 'CANDELARIA DE LA FRONTERA', '0202'),
(15, 2, 'COATEPEQUE', '0203'),
(16, 2, 'CHALCHUAPA', '0204'),
(17, 2, 'EL CONGO', '0205'),
(18, 2, 'EL PORVENIR', '0206'),
(19, 2, 'MASAHUAT', '0207'),
(20, 2, 'METAPAN', '0208'),
(21, 2, 'SAN ANTONIO PAJONAL', '0209'),
(22, 2, 'SAN SEBASTIAN SALITRILLO', '0210'),
(23, 2, 'SANTA ROSA GUACHIPILIN', '0211'),
(24, 2, 'SANTIAGO DE LA FRONTERA', '0212'),
(25, 2, 'TEXISTEPEQUE', '0213'),
(26, 3, 'SONSONATE', '0301'),
(27, 3, 'ACAJUTLA', '0302'),
(28, 3, 'ARMENIA', '0303'),
(29, 3, 'CALUCO', '0304'),
(30, 3, 'CUISNAHUAT', '0305'),
(31, 3, 'IZALCO', '0306'),
(32, 3, 'JUAYUA', '0307'),
(33, 3, 'NAHUIZALCO', '0308'),
(34, 3, 'NAHUILINGO', '0309'),
(35, 3, 'SALCOATITAN', '0310'),
(36, 3, 'SAN ANTONIO DEL MONTE', '0311'),
(37, 3, 'SAN JULIAN', '0312'),
(38, 3, 'SANTA CATARINA MASAHUAT', '0313'),
(39, 3, 'SANTA ISABEL ISHUATAN', '0314'),
(40, 3, 'SANTO DOMINGO DE GUZMAN', '0315'),
(41, 3, 'SONZACATE', '0316'),
(42, 4, 'CHALATENANGO', '0401'),
(43, 4, 'AGUA CALIENTE', '0402'),
(44, 4, 'ARCATAO', '0403'),
(45, 4, 'AZACUALPA', '0404'),
(46, 4, 'SAN JOSE CANCASQUE', '0405'),
(47, 4, 'CITALA', '0406'),
(48, 4, 'COMALAPA', '0407'),
(49, 4, 'CONCEPCION QUEZALTEPEQUE', '0408'),
(50, 4, 'DULCE NOMBRE DE MARIA', '0409'),
(51, 4, 'EL CARRIZAL', '0410'),
(52, 4, 'EL PARAISO', '0411'),
(53, 4, 'LA LAGUNA', '0412'),
(54, 4, 'LA PALMA', '0413'),
(55, 4, 'LA REINA', '0414'),
(56, 4, 'LAS FLORES', '0415'),
(57, 4, 'LAS VUELTAS', '0416'),
(58, 4, 'NOMBRE DE JESUS', '0417'),
(59, 4, 'NUEVA CONCEPCION', '0418'),
(60, 4, 'NUEVA TRINIDAD', '0419'),
(61, 4, 'OJOS DE AGUA', '0420'),
(62, 4, 'POTONICO', '0421'),
(63, 4, 'SAN ANTONIO DE LA CRUZ', '0422'),
(64, 4, 'SAN ANTONIO LOS RANCHOS', '0423'),
(65, 4, 'SAN FERNANDO', '0424'),
(66, 4, 'SAN FRANCISCO LEMPA', '0425'),
(67, 4, 'SAN FRANCISCO MORAZAN', '0426'),
(68, 4, 'SAN IGNACIO', '0427'),
(69, 4, 'SAN ISIDRO LABRADOR', '0428'),
(70, 4, 'SAN LUIS DEL CARMEN', '0429'),
(71, 4, 'SAN MIGUEL DE MERCEDES', '0430'),
(72, 4, 'SAN RAFAEL', '0431'),
(73, 4, 'SANTA RITA', '0432'),
(74, 4, 'TEJUTLA', '0433'),
(75, 5, 'SANTA TECLA', '0501'),
(76, 5, 'ANTIGUO CUSCATLAN', '0502'),
(77, 5, 'CIUDAD ARCE', '0503'),
(78, 5, 'COLON', '0504'),
(79, 5, 'COMASAGUA', '0505'),
(80, 5, 'CHILTIUPAN', '0506'),
(81, 5, 'HUIZUCAR', '0507'),
(82, 5, 'JAYAQUE', '0508'),
(83, 5, 'JICALAPA', '0509'),
(84, 5, 'LA LIBERTAD', '0510'),
(85, 5, 'NUEVO CUSCATLAN', '0511'),
(86, 5, 'SAN JUAN OPICO', '0512'),
(87, 5, 'QUEZALTEPEQUE', '0513'),
(88, 5, 'SACACOYO', '0514'),
(89, 5, 'SAN JOSE VILLANUEVA', '0515'),
(90, 5, 'SAN MATIAS', '0516'),
(91, 5, 'SAN PABLO TACACHICO', '0517'),
(92, 5, 'TALNIQUE', '0518'),
(93, 5, 'TAMANIQUE', '0519'),
(94, 5, 'TEOTEPEQUE', '0520'),
(95, 5, 'TEPECOYO', '0521'),
(96, 5, 'ZARAGOZA', '0522'),
(97, 6, 'SAN SALVADOR', '0601'),
(98, 6, 'AGUILARES', '0602'),
(99, 6, 'APOPA', '0603'),
(100, 6, 'AYUTUXTEPEQUE', '0604'),
(101, 6, 'CUSCATANCINGO', '0605'),
(102, 6, 'DELGADO', '0606'),
(103, 6, 'EL PAISNAL', '0607'),
(104, 6, 'GUAZAPA', '0608'),
(105, 6, 'ILOPANGO', '0609'),
(106, 6, 'MEJICANOS', '0610'),
(107, 6, 'NEJAPA', '0611'),
(108, 6, 'PANCHIMALCO', '0612'),
(109, 6, 'ROSARIO DE MORA', '0613'),
(110, 6, 'SAN MARCOS', '0614'),
(111, 6, 'SAN MARTIN', '0615'),
(112, 6, 'SANTIAGO TEXACUANGOS', '0616'),
(113, 6, 'SANTO TOMAS', '0617'),
(114, 6, 'SOYAPANGO', '0618'),
(115, 6, 'TONACATEPEQUE', '0619'),
(116, 7, 'COJUTEPEQUE', '0701'),
(117, 7, 'CANDELARIA', '0702'),
(118, 7, 'EL CARMEN', '0703'),
(119, 7, 'EL ROSARIO', '0704'),
(120, 7, 'MONTE SAN JUAN', '0705'),
(121, 7, 'ORATORIO DE CONCEPCION', '0706'),
(122, 7, 'SAN BARTOLOME PERULAPIA', '0707'),
(123, 7, 'SAN CRISTOBAL', '0708'),
(124, 7, 'SAN JOSE GUAYABAL', '0709'),
(125, 7, 'SAN PEDRO PERULAPAN', '0710'),
(126, 7, 'SAN RAFAEL CEDROS', '0711'),
(127, 7, 'SAN RAMON', '0712'),
(128, 7, 'SANTA CRUZ ANALQUITO', '0713'),
(129, 7, 'SANTA CRUZ MICHAPA', '0714'),
(130, 7, 'SUCHITOTO', '0715'),
(131, 7, 'TENANCINGO', '0716'),
(132, 8, 'ZACATECOLUCA', '0801'),
(133, 8, 'CUYULTITAN', '0802'),
(134, 8, 'EL ROSARIO', '0803'),
(135, 8, 'JERUSALEN', '0804'),
(136, 8, 'MERCEDES DE LA CEIBA', '0805'),
(137, 8, 'OLOCUILTA', '0806'),
(138, 8, 'PARAISO DE OSORIO', '0807'),
(139, 8, 'SAN ANTONIO MASAHUAT', '0808'),
(140, 8, 'SAN EMIGDIO', '0809'),
(141, 8, 'SAN FRANCISCO CHINAMECA', '0810'),
(142, 8, 'SAN JUAN NONUALCO', '0811'),
(143, 8, 'SAN JUAN TALPA', '0812'),
(144, 8, 'SAN JUAN TEPEZONTES', '0813'),
(145, 8, 'SAN LUIS TALPA', '0814'),
(146, 8, 'SAN LUIS LA HERRADURA', '0815'),
(147, 8, 'SAN MIGUEL TEPEZONTES', '0816'),
(148, 8, 'SAN PEDRO MASAHUAT', '0817'),
(149, 8, 'SAN PEDRO NONUALCO', '0818'),
(150, 8, 'SAN RAFAEL OBRAJUELO', '0819'),
(151, 8, 'SANTA MARIA OSTUMA', '0820'),
(152, 8, 'SANTIAGO NONUALCO', '0821'),
(153, 8, 'TAPALHUACA', '0822'),
(154, 9, 'SENSUNTEPEQUE', '0901'),
(155, 9, 'CINQUERA', '0902'),
(156, 9, 'DOLORES', '0903'),
(157, 9, 'GUACOTECTI', '0904'),
(158, 9, 'ILOBASCO', '0905'),
(159, 9, 'JUTIAPA', '0906'),
(160, 9, 'SAN ISIDRO', '0907'),
(161, 9, 'TEJUTEPEQUE', '0908'),
(162, 9, 'VICTORIA', '0909'),
(163, 10, 'SAN VICENTE', '1001'),
(164, 10, 'APASTEPEQUE', '1002'),
(165, 10, 'GUADALUPE', '1003'),
(166, 10, 'SAN CAYETANO ISTEPEQUE', '1004'),
(167, 10, 'SAN ESTEBAN CATARINA', '1005'),
(168, 10, 'SAN ILDEFONSO', '1006'),
(169, 10, 'SAN LORENZO', '1007'),
(170, 10, 'SAN SEBASTIAN', '1008'),
(171, 10, 'SANTA CLARA', '1009'),
(172, 10, 'SANTO DOMINGO', '1010'),
(173, 10, 'TECOLUCA', '1011'),
(174, 10, 'TEPETITAN', '1012'),
(175, 10, 'VERAPAZ', '1013'),
(176, 11, 'USULUTAN', '1101'),
(177, 11, 'ALEGRIA', '1102'),
(178, 11, 'BERLIN', '1103'),
(179, 11, 'CALIFORNIA', '1104'),
(180, 11, 'CONCEPCION BATRES', '1105'),
(181, 11, 'EL TRIUNFO', '1106'),
(182, 11, 'EREGUAYQUIN', '1107'),
(183, 11, 'ESTANZUELAS', '1108'),
(184, 11, 'JIQUILISCO', '1109'),
(185, 11, 'JUCUAPA', '1110'),
(186, 11, 'JUCUARAN', '1111'),
(187, 11, 'MERCEDES UMANA', '1112'),
(188, 11, 'NUEVA GRANADA', '1113'),
(189, 11, 'OZATLAN', '1114'),
(190, 11, 'PUERTO EL TRIUNFO', '1115'),
(191, 11, 'SAN AGUSTIN', '1116'),
(192, 11, 'SAN BUENAVENTURA', '1117'),
(193, 11, 'SAN DIONISIO', '1118'),
(194, 11, 'SAN FRANCISCO JAVIER', '1119'),
(195, 11, 'SANTA ELENA', '1120'),
(196, 11, 'SANTA MARIA', '1121'),
(197, 11, 'SANTIAGO DE MARIA', '1122'),
(198, 11, 'TECAPAN', '1123'),
(199, 12, 'SAN MIGUEL', '1201'),
(200, 12, 'CAROLINA', '1202'),
(201, 12, 'CIUDAD BARRIOS', '1203'),
(202, 12, 'COMACARAN', '1204'),
(203, 12, 'CHAPELTIQUE', '1205'),
(204, 12, 'CHINAMECA', '1206'),
(205, 12, 'CHIRILAGUA', '1207'),
(206, 12, 'EL TRANSITO', '1208'),
(207, 12, 'LOLOTIQUE', '1209'),
(208, 12, 'MONCAGUA', '1210'),
(209, 12, 'NUEVA GUADALUPE', '1211'),
(210, 12, 'NUEVO EDEN DE SAN JUAN', '1212'),
(211, 12, 'QUELEPA', '1213'),
(212, 12, 'SAN ANTONIO', '1214'),
(213, 12, 'SAN GERARDO', '1215'),
(214, 12, 'SAN JORGE', '1216'),
(215, 12, 'SAN LUIS DE LA REINA', '1217'),
(216, 12, 'SAN RAFAEL ORIENTE', '1218'),
(217, 12, 'SESORI', '1219'),
(218, 12, 'ULUAZAPA', '1220'),
(219, 13, 'SAN FRANCISCO GOTERA', '1301'),
(220, 13, 'ARAMBALA', '1302'),
(221, 13, 'CACAOPERA', '1303'),
(222, 13, 'CORINTO', '1304'),
(223, 13, 'CHILANGA', '1305'),
(224, 13, 'DELICIAS DE CONCEPCION', '1306'),
(225, 13, 'EL DIVISADERO', '1307'),
(226, 13, 'EL ROSARIO', '1308'),
(227, 13, 'GUALOCOCTI', '1309'),
(228, 13, 'GUATAJIAGUA', '1310'),
(229, 13, 'JOATECA', '1311'),
(230, 13, 'JOCOAITIQUE', '1312'),
(231, 13, 'JOCORO', '1313'),
(232, 13, 'LOLOTIQUILLO', '1314'),
(233, 13, 'MEANGUERA', '1315'),
(234, 13, 'OSICALA', '1316'),
(235, 13, 'PERQUIN', '1317'),
(236, 13, 'SAN CARLOS', '1318'),
(237, 13, 'SAN FERNANDO', '1319'),
(238, 13, 'SAN ISIDRO', '1320'),
(239, 13, 'SAN SIMON', '1321'),
(240, 13, 'SENSEMBRA', '1322'),
(241, 13, 'SOCIEDAD', '1323'),
(242, 13, 'TOROLA', '1324'),
(243, 13, 'YAMABAL', '1325'),
(244, 13, 'YOLOAIQUIN', '1326'),
(245, 14, 'LA UNION', '1401'),
(246, 14, 'ANAMOROS', '1402'),
(247, 14, 'BOLIVAR', '1403'),
(248, 14, 'CONCEPCION ORIENTE', '1404'),
(249, 14, 'CONCHAGUA', '1405'),
(250, 14, 'EL CARMEN', '1406'),
(251, 14, 'EL SAUCE', '1407'),
(252, 14, 'INTIPUCA', '1408'),
(253, 14, 'LISLIQUE', '1409'),
(254, 14, 'MEANGUERA DEL GOLFO', '1410'),
(255, 14, 'NUEVA ESPARTA', '1411'),
(256, 14, 'PASAQUINA', '1412'),
(257, 14, 'POLOROS', '1413'),
(258, 14, 'SAN ALEJO', '1414'),
(259, 14, 'SAN JOSE', '1415'),
(260, 14, 'SANTA ROSA DE LIMA', '1416'),
(261, 14, 'YAYANTIQUE', '1417'),
(262, 14, 'YUCUAIQUIN', '1418');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `id_producto` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `id_categoria` int NOT NULL,
  `id_sub_categoria` int NOT NULL,
  `id_marca` int NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_productos`
--

INSERT INTO `tbl_productos` (`id_producto`, `nombre`, `sku`, `descripcion`, `precio`, `id_categoria`, `id_sub_categoria`, `id_marca`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(8, 'Playstation 5', 'ps5-2023uh414', '<p><b>PlayStation 5 </b>(abreviada como PS5) es la quinta consola de videojuegos de sobremesa desarrollada por la empresa Sony Interactive Entertainment. Fue anunciada en el año 2019 como la sucesora de la PlayStation 4, la PS5 se lanzó el 12 de noviembre de 2020 en Australia, Japón, Nueva Zelanda, Estados Unidos, Canadá, México y Corea del Sur, y en el resto de países el 19 de noviembre de 2020. La PlayStation 5 junto con la Xbox Series X|S de Microsoft, lanzada el mismo mes, son parte de la novena generación de consolas de videojuegos.<br></p>', '800.00', 1, 1, 2, '2023-05-16 17:40:53', 1, '2023-05-17 20:11:00', 1, 1),
(9, 'Xbox Series X', 'xbox-sx-823', '<p>Descripcion de la Xbox Series X</p>', '599.00', 1, 1, 3, '2023-05-31 11:37:54', 1, '2023-05-31 11:38:24', 1, 1),
(10, 'Nintendo Switch', 'nin-sw-2324', '<p>Descripcion de Nintendo Switch</p>', '350.00', 1, 1, 1, '2023-06-03 22:18:15', 1, '2023-06-03 22:19:13', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productos_imagenes`
--

CREATE TABLE `tbl_productos_imagenes` (
  `id_producto_imagen` int NOT NULL,
  `id_producto` int NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `tbl_productos_imagenes`
--

INSERT INTO `tbl_productos_imagenes` (`id_producto_imagen`, `id_producto`, `imagen`, `principal`, `fecha_ing`, `id_usuario_ing`) VALUES
(56, 8, '5d791fee6f5b8d39ce7fb77e9a4de17e.jpeg', 1, '2023-05-17 19:22:54', 1),
(57, 8, '5465efc416652caa187383e5ebe65c0b.jpg', 0, '2023-05-17 19:23:01', 1),
(58, 8, 'c5d68426bb9454e9ab1a5ecf261d6457.jpeg', 0, '2023-05-17 19:23:01', 1),
(59, 8, '9ec64212fc3fc9175bd6e5c9be456a5b.jpg', 0, '2023-05-17 19:23:01', 1),
(60, 8, '1bacee130f59e14a84ec05dff24af3d7.jpeg', 0, '2023-05-17 19:23:05', 1),
(61, 8, 'bbfb0cb777538b94a594fa23a104f7bb.jpg', 0, '2023-05-17 19:23:10', 1),
(62, 9, 'eb2a9a93f2f5a330ec2bdfb3c9dd3583.jpg', 1, '2023-05-31 11:38:22', 1),
(63, 10, '670c18ed25148301961054effe1e992d.jpg', 1, '2023-06-03 22:19:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proveedores`
--

CREATE TABLE `tbl_proveedores` (
  `id_proveedor` int NOT NULL,
  `codigo` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_departamento` int NOT NULL,
  `id_municipio` int NOT NULL,
  `telefono` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_proveedores`
--

INSERT INTO `tbl_proveedores` (`id_proveedor`, `codigo`, `nombre`, `direccion`, `id_departamento`, `id_municipio`, `telefono`, `email`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'PVD-0001', 'Proveedor 1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 12, 214, '42424678', 'proveedor1@gmail.com', '2023-05-20 11:47:23', 1, '2023-05-20 21:21:57', 1, 1),
(2, 'PVD-0002', 'Marielos', '<p>Lorem ipsum editado</p>', 12, 214, '32468900', 'proveedor2@proveedor.com', '2023-05-20 22:07:47', 1, '2023-05-20 22:28:51', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_categorias`
--

CREATE TABLE `tbl_sub_categorias` (
  `id_sub_categoria` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_sub_categorias`
--

INSERT INTO `tbl_sub_categorias` (`id_sub_categoria`, `id_categoria`, `nombre`, `descripcion`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 1, 'Consolas', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:22:26', 1, '2023-04-11 01:32:37', 1, 1),
(2, 1, 'Video Juegos', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(3, 1, 'Computadoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(4, 1, 'Camaras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(5, 1, 'Laptops', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(6, 3, 'Cocinas', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(7, 3, 'Lavadoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(8, 3, 'Secadoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1),
(9, 3, 'Refrigeradoras', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p>', '2023-04-11 01:42:26', 1, '2023-04-11 01:42:26', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuario` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `username`, `nombre`, `apellido`, `auth_key`, `password_hash`, `email`, `imagen`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'James', 'Guevara', 'AxK42pI4nqEvIyBOBUJVfSR9oRTq-chL', '$2y$13$hQrQEsIKutJ6FrRy0/YyxeKE/A4a7vSz0qfOYN1u0GW.w7L6lam1C', 'admin@outlook.com', '/avatars/NtlwwXuxMF6Me4EYgK7ymifFda24QwEk.gif', 1, 1677203598, 1677203598),
(2, 'demo', 'demo', 'demo', '_LDZ2AUvtDDoy36zC6bJhNgJRM9rYO3D', '$2y$13$o0rSCi/5gEx2cZpNt1Tm.OQsOvwtLduPRfvE1IhIUsEXOIYKXhKc2', 'demo@outlook.com', '/avatars/Ny4a_5P9S4CpJtKHy7igRgkfuQdZdRrr.png', 1, 1677203935, 1677203935);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_compras`
--
ALTER TABLE `tbl_compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `tbl_det_compras`
--
ALTER TABLE `tbl_det_compras`
  ADD PRIMARY KEY (`id_det_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_error_log`
--
ALTER TABLE `tbl_error_log`
  ADD PRIMARY KEY (`id_error_log`),
  ADD KEY `us_id` (`us_id`);

--
-- Indexes for table `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `ad_mu_relacion` (`id_departamento`),
  ADD KEY `ad_mu_relacion_2` (`id_departamento`),
  ADD KEY `ad_mu_relacion_3` (`id_departamento`);

--
-- Indexes for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_sub_categoria` (`id_sub_categoria`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_productos_imagenes`
--
ALTER TABLE `tbl_productos_imagenes`
  ADD PRIMARY KEY (`id_producto_imagen`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  ADD PRIMARY KEY (`id_sub_categoria`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_usuario_ing` (`id_usuario_ing`),
  ADD KEY `id_usuario_mod` (`id_usuario_mod`);

--
-- Indexes for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `id_bitacora` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_compras`
--
ALTER TABLE `tbl_compras`
  MODIFY `id_compra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `id_departamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_det_compras`
--
ALTER TABLE `tbl_det_compras`
  MODIFY `id_det_compra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  MODIFY `id_direccion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_error_log`
--
ALTER TABLE `tbl_error_log`
  MODIFY `id_error_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  MODIFY `id_marca` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  MODIFY `id_municipio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_productos_imagenes`
--
ALTER TABLE `tbl_productos_imagenes`
  MODIFY `id_producto_imagen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  MODIFY `id_proveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  MODIFY `id_sub_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Constraints for table `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD CONSTRAINT `tbl_categorias_ibfk_1` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_categorias_ibfk_2` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Constraints for table `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD CONSTRAINT `tbl_clientes_ibfk_1` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_clientes_ibfk_2` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_compras`
--
ALTER TABLE `tbl_compras`
  ADD CONSTRAINT `tbl_compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_compras_ibfk_2` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_compras_ibfk_3` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_det_compras`
--
ALTER TABLE `tbl_det_compras`
  ADD CONSTRAINT `tbl_det_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compras` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_det_compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_det_compras_ibfk_3` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_det_compras_ibfk_4` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD CONSTRAINT `tbl_direcciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_direcciones_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_direcciones_ibfk_3` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipios` (`id_municipio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_direcciones_ibfk_4` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_direcciones_ibfk_5` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_error_log`
--
ALTER TABLE `tbl_error_log`
  ADD CONSTRAINT `tbl_error_log_ibfk_1` FOREIGN KEY (`us_id`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Constraints for table `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  ADD CONSTRAINT `tbl_marcas_ibfk_1` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_marcas_ibfk_2` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Constraints for table `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD CONSTRAINT `tbl_municipios_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`);

--
-- Constraints for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_productos_ibfk_2` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categorias` (`id_sub_categoria`),
  ADD CONSTRAINT `tbl_productos_ibfk_3` FOREIGN KEY (`id_marca`) REFERENCES `tbl_marcas` (`id_marca`),
  ADD CONSTRAINT `tbl_productos_ibfk_4` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_productos_ibfk_5` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Constraints for table `tbl_productos_imagenes`
--
ALTER TABLE `tbl_productos_imagenes`
  ADD CONSTRAINT `tbl_productos_imagenes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`);

--
-- Constraints for table `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  ADD CONSTRAINT `tbl_proveedores_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_proveedores_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_proveedores_ibfk_3` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_proveedores_ibfk_4` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  ADD CONSTRAINT `tbl_sub_categorias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_sub_categorias_ibfk_2` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_sub_categorias_ibfk_3` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

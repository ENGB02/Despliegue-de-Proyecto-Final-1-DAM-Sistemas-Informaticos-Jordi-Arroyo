-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： db
-- 生成日期： 2022-06-10 08:50:04
-- 服务器版本： 8.0.29
-- PHP 版本： 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `testdb1`
--

-- --------------------------------------------------------

--
-- 表的结构 `BUFF_DEBUFF`
--

CREATE TABLE `BUFF_DEBUFF` (
  `BUFF` tinyint(1) DEFAULT NULL,
  `ID_BUFF` int NOT NULL,
  `NOMBRE` varchar(12) DEFAULT NULL,
  `STATUS` varchar(12) DEFAULT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `DURACION` int DEFAULT NULL,
  `PERIODO` int DEFAULT NULL,
  `DESCRIPCION` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `estadistica`
--

CREATE TABLE `estadistica` (
  `id_personaje` int DEFAULT NULL,
  `NIVEL` int DEFAULT NULL,
  `EXPERIENCIA_MAX` int DEFAULT NULL,
  `EXPERIENCIA` int DEFAULT NULL,
  `VIDA_MAX` int DEFAULT NULL,
  `MAGIA_MAXIMA` int DEFAULT NULL,
  `VIDA` int DEFAULT NULL,
  `MAGIA` int DEFAULT NULL,
  `FUERZA` int DEFAULT NULL,
  `INTELIGENCIA` int DEFAULT NULL,
  `VITALIDAD` int DEFAULT NULL,
  `VOLUNTAD` int DEFAULT NULL,
  `DEFENSA` int DEFAULT NULL,
  `AGILIDAD` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `HABILIDAD`
--

CREATE TABLE `HABILIDAD` (
  `ID_TIPO` int NOT NULL,
  `TIPO` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `HABILIDADES`
--

CREATE TABLE `HABILIDADES` (
  `ID_TIPO` int NOT NULL,
  `ID_HABILIDAD` int NOT NULL,
  `NOMBRE` varchar(12) DEFAULT NULL,
  `RAREZA` varchar(12) DEFAULT NULL,
  `DANO` int DEFAULT NULL,
  `MAGIA` int DEFAULT NULL,
  `CD` int DEFAULT NULL,
  `TIEMPO` int DEFAULT NULL,
  `ID_DEBUFF` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `MONSTRUO`
--

CREATE TABLE `MONSTRUO` (
  `ID_MONSTRUOS` int NOT NULL,
  `NOMBRE_MONSTRO` varchar(12) NOT NULL,
  `NIVEL` int NOT NULL,
  `VIDA_MAXIMA` int NOT NULL,
  `MAGIA_MAXIMA` int NOT NULL,
  `FUERZA` int NOT NULL,
  `INTELIGENCIA` int NOT NULL,
  `VITALIDAD` int NOT NULL,
  `VOLUNTAD` int NOT NULL,
  `DEFENSA` int NOT NULL,
  `AGILIDAD` int NOT NULL,
  `ID_HABILIDAD` int DEFAULT NULL,
  `ID_HABILIDAD2` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `MONSTRUO`
--

INSERT INTO `MONSTRUO` (`ID_MONSTRUOS`, `NOMBRE_MONSTRO`, `NIVEL`, `VIDA_MAXIMA`, `MAGIA_MAXIMA`, `FUERZA`, `INTELIGENCIA`, `VITALIDAD`, `VOLUNTAD`, `DEFENSA`, `AGILIDAD`, `ID_HABILIDAD`, `ID_HABILIDAD2`) VALUES
(1, 'Pollo', 1, 20, 5, 8, 2, 3, 5, 5, 9, NULL, NULL),
(2, 'Vaca', 5, 65, 30, 24, 9, 14, 15, 35, 9, NULL, NULL),
(3, 'Slime', 8, 100, 50, 34, 12, 15, 16, 45, 9, NULL, NULL),
(4, 'Goblin', 15, 150, 60, 28, 12, 43, 25, 55, 19, NULL, NULL),
(5, 'Orco', 18, 200, 70, 70, 32, 34, 14, 65, 39, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `objeto`
--

CREATE TABLE `objeto` (
  `Id_tipo` int NOT NULL,
  `Tipo` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `objeto`
--

INSERT INTO `objeto` (`Id_tipo`, `Tipo`) VALUES
(1, 'Equipable'),
(2, 'Consumible');

-- --------------------------------------------------------

--
-- 表的结构 `objetos`
--

CREATE TABLE `objetos` (
  `ID_TIPO` int NOT NULL,
  `ID_OBJETO` int NOT NULL,
  `NUM_MAX` int NOT NULL,
  `PRECIO_COMPRA` int DEFAULT NULL,
  `PRECIO_VENTA` int DEFAULT NULL,
  `RAREZA` varchar(12) DEFAULT NULL,
  `FUERZA` int DEFAULT NULL,
  `INTELIGENCIA` int DEFAULT NULL,
  `VITALIDAD` int DEFAULT NULL,
  `VOLUNTAD` int DEFAULT NULL,
  `DEFENSA` int DEFAULT NULL,
  `AGILIDAD` int DEFAULT NULL,
  `DURACION` int DEFAULT NULL,
  `TIEMPO_DE_USO` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `personaje`
--

CREATE TABLE `personaje` (
  `id_personaje` int NOT NULL,
  `nom_personaje` varchar(12) DEFAULT NULL,
  `habitacion` int DEFAULT NULL,
  `oro` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `PERSONAJE_HABILIDADES`
--

CREATE TABLE `PERSONAJE_HABILIDADES` (
  `ID_PERSONAJE` int NOT NULL,
  `num_habilidad` int NOT NULL,
  `Id_tipo` int DEFAULT NULL,
  `ID_HABILIDAD` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `PERSONAJE_INVENTARIO`
--

CREATE TABLE `PERSONAJE_INVENTARIO` (
  `ID_PERSONAJE` int NOT NULL,
  `NUM_CASILLA` int NOT NULL,
  `Id_tipo` int DEFAULT NULL,
  `ID_OBJETO` int DEFAULT NULL,
  `CANTIDAD` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `Nom_usuario` varchar(12) NOT NULL,
  `contrasena` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转储表的索引
--

--
-- 表的索引 `BUFF_DEBUFF`
--
ALTER TABLE `BUFF_DEBUFF`
  ADD PRIMARY KEY (`ID_BUFF`);

--
-- 表的索引 `estadistica`
--
ALTER TABLE `estadistica`
  ADD KEY `Per_estat` (`id_personaje`);

--
-- 表的索引 `HABILIDAD`
--
ALTER TABLE `HABILIDAD`
  ADD PRIMARY KEY (`ID_TIPO`);

--
-- 表的索引 `HABILIDADES`
--
ALTER TABLE `HABILIDADES`
  ADD PRIMARY KEY (`ID_HABILIDAD`),
  ADD KEY `habi_habilidads` (`ID_TIPO`),
  ADD KEY `habili_buff` (`ID_DEBUFF`);

--
-- 表的索引 `MONSTRUO`
--
ALTER TABLE `MONSTRUO`
  ADD PRIMARY KEY (`ID_MONSTRUOS`);

--
-- 表的索引 `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`Id_tipo`);

--
-- 表的索引 `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`ID_OBJETO`),
  ADD KEY `ob_objetos` (`ID_TIPO`);

--
-- 表的索引 `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id_personaje`);

--
-- 表的索引 `PERSONAJE_HABILIDADES`
--
ALTER TABLE `PERSONAJE_HABILIDADES`
  ADD PRIMARY KEY (`ID_PERSONAJE`,`num_habilidad`),
  ADD KEY `tipohabili_FK` (`Id_tipo`);

--
-- 表的索引 `PERSONAJE_INVENTARIO`
--
ALTER TABLE `PERSONAJE_INVENTARIO`
  ADD PRIMARY KEY (`ID_PERSONAJE`,`NUM_CASILLA`),
  ADD KEY `tipoOBJETO_FK` (`Id_tipo`);

--
-- 表的索引 `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

--
-- 限制导出的表
--

--
-- 限制表 `estadistica`
--
ALTER TABLE `estadistica`
  ADD CONSTRAINT `Per_estat` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`);

--
-- 限制表 `HABILIDADES`
--
ALTER TABLE `HABILIDADES`
  ADD CONSTRAINT `habi_habilidads` FOREIGN KEY (`ID_TIPO`) REFERENCES `HABILIDAD` (`ID_TIPO`),
  ADD CONSTRAINT `habili_buff` FOREIGN KEY (`ID_DEBUFF`) REFERENCES `BUFF_DEBUFF` (`ID_BUFF`);

--
-- 限制表 `objetos`
--
ALTER TABLE `objetos`
  ADD CONSTRAINT `ob_objetos` FOREIGN KEY (`ID_TIPO`) REFERENCES `objeto` (`Id_tipo`);

--
-- 限制表 `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `us_per` FOREIGN KEY (`id_personaje`) REFERENCES `usuario` (`id_usuario`);

--
-- 限制表 `PERSONAJE_HABILIDADES`
--
ALTER TABLE `PERSONAJE_HABILIDADES`
  ADD CONSTRAINT `IDPERS_FK` FOREIGN KEY (`ID_PERSONAJE`) REFERENCES `personaje` (`id_personaje`),
  ADD CONSTRAINT `tipohabili_FK` FOREIGN KEY (`Id_tipo`) REFERENCES `HABILIDAD` (`ID_TIPO`);

--
-- 限制表 `PERSONAJE_INVENTARIO`
--
ALTER TABLE `PERSONAJE_INVENTARIO`
  ADD CONSTRAINT `IDPERSONA_FK` FOREIGN KEY (`ID_PERSONAJE`) REFERENCES `personaje` (`id_personaje`),
  ADD CONSTRAINT `tipoOBJETO_FK` FOREIGN KEY (`Id_tipo`) REFERENCES `objeto` (`Id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

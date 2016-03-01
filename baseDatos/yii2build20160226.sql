-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.9-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para yii2build
CREATE DATABASE IF NOT EXISTS `yii2build` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yii2build`;


-- Volcando estructura para tabla yii2build.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- Volcando datos para la tabla yii2build.gender: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;


-- Volcando estructura para tabla yii2build.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE latin1_general_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Volcando datos para la tabla yii2build.migration: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1456350119),
	('m130524_201442_init', 1456350127);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;


-- Volcando estructura para tabla yii2build.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `first_name` text CHARACTER SET latin1,
  `last_name` text CHARACTER SET latin1,
  `created_at` datetime DEFAULT NULL,
  `gender_id` int(10) unsigned NOT NULL,
  `birthdate` date NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_gender_idx` (`gender_id`),
  CONSTRAINT `fk_profile_gender` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- Volcando datos para la tabla yii2build.profile: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Volcando estructura para tabla yii2build.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla yii2build.role: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Volcando estructura para tabla yii2build.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  `status_value` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla yii2build.status: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;


-- Volcando estructura para tabla yii2build.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` smallint(6) NOT NULL DEFAULT '10',
  `role_id` smallint(6) NOT NULL DEFAULT '10',
  `user_type_id` smallint(6) NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_claro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla yii2build.user: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status_id`, `role_id`, `user_type_id`, `created_at`, `updated_at`, `password_claro`) VALUES
	(1, 'javier', 'mlxd_7P3oL9TW5LDyXW6vHdTF0DOPICd', '$2y$13$vgIc961GSoN9LrjlvcjUy.yX.zK71P7e3w8mskkDjlhRBYLATDD.K', NULL, 'javieriranzo@hotmail.com', 10, 10, 10, '2016-02-25 20:55:05', '2016-02-25 20:55:05', 'javier'),
	(2, 'pilar', 'J84gt7HjvcoiiHZV2nu7wFocZkzLbrCF', '$2y$13$WDPtwEtcVPFSIWUXgMRvjujC1t8jsntKrRgz0H.sc8E/JmUKDm6v6', NULL, 'pilarvelasanz@hotmail.com', 10, 10, 10, '2016-02-25 22:18:30', '2016-02-25 22:18:30', 'pilarvela');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Volcando estructura para tabla yii2build.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(45) NOT NULL,
  `user_type_value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla yii2build.user_type: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for translation
CREATE DATABASE IF NOT EXISTS `translation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `translation`;

-- Dumping structure for table translation.language
CREATE TABLE IF NOT EXISTS `language` (
  `languageId` varchar(2) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table translation.language: ~4 rows (approximately)
INSERT INTO `language` (`languageId`, `language`, `isDeleted`) VALUES
	('en', 'English', b'0'),
	('jp', 'Japanese', b'0'),
	('vi', 'Việt Nam', b'0'),
	('zh', 'Chinese', b'0');

-- Dumping structure for table translation.product
CREATE TABLE IF NOT EXISTS `product` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `weight` decimal(4,2) DEFAULT NULL,
  `productCategoryID` int DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `FK__productcategory_product` (`productCategoryID`),
  CONSTRAINT `FK__productcategory_product` FOREIGN KEY (`productCategoryID`) REFERENCES `productcategory` (`productCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table translation.product: ~3 rows (approximately)
INSERT INTO `product` (`productID`, `price`, `weight`, `productCategoryID`, `isDeleted`) VALUES
	(2, 200000, 20.00, 1, b'0'),
	(3, 200000, 20.00, 1, b'0'),
	(4, 0, 0.00, 2, b'1');

-- Dumping structure for table translation.productcategory
CREATE TABLE IF NOT EXISTS `productcategory` (
  `productCategoryID` int NOT NULL AUTO_INCREMENT,
  `canBeShipped` bit(1) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`productCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table translation.productcategory: ~2 rows (approximately)
INSERT INTO `productcategory` (`productCategoryID`, `canBeShipped`, `isDeleted`) VALUES
	(1, b'1', b'0'),
	(2, b'1', b'0');

-- Dumping structure for table translation.productcategorytranslation
CREATE TABLE IF NOT EXISTS `productcategorytranslation` (
  `productCategoryID` int NOT NULL AUTO_INCREMENT,
  `languageID` varchar(2) NOT NULL,
  `categoryName` varchar(50) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`productCategoryID`,`languageID`),
  KEY `FK__language` (`languageID`),
  CONSTRAINT `FK__language` FOREIGN KEY (`languageID`) REFERENCES `language` (`languageId`),
  CONSTRAINT `FK__productcategory` FOREIGN KEY (`productCategoryID`) REFERENCES `productcategory` (`productCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table translation.productcategorytranslation: ~6 rows (approximately)
INSERT INTO `productcategorytranslation` (`productCategoryID`, `languageID`, `categoryName`, `isDeleted`) VALUES
	(1, 'en', 'Television', b'0'),
	(1, 'vi', 'Ti vi', b'0'),
	(1, 'zh', '电子产品', b'0'),
	(2, 'en', 'Laptop', b'0'),
	(2, 'vi', 'Máy tính', b'0'),
	(2, 'zh', '服装', b'0');

-- Dumping structure for table translation.producttranslation
CREATE TABLE IF NOT EXISTS `producttranslation` (
  `productID` int NOT NULL,
  `languageID` char(2) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productDescription` varchar(50) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`productID`,`languageID`),
  KEY `FK__language_producttranslation` (`languageID`),
  CONSTRAINT `FK__language_producttranslation` FOREIGN KEY (`languageID`) REFERENCES `language` (`languageId`),
  CONSTRAINT `FK__product_producttranslation` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table translation.producttranslation: ~7 rows (approximately)
INSERT INTO `producttranslation` (`productID`, `languageID`, `productName`, `productDescription`, `isDeleted`) VALUES
	(2, 'en', 'TV360', 'This is TV 360in', b'0'),
	(2, 'vi', 'Tivi 360', 'Đây là  Tivi 360in', b'0'),
	(2, 'zh', '笔记本电脑', '高性能笔记本电脑，适合工作和娱乐', b'0'),
	(3, 'en', 'TV400', 'This is TV 400in', b'0'),
	(3, 'vi', 'Tivi 400', 'Đây là  tivi 400in', b'0'),
	(3, 'zh', '无线鼠标', '符合人体工程学的无线鼠标', b'0'),
	(4, 'vi', 'Lap top Dell', 'Laptop hiệu năng cao', b'0');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

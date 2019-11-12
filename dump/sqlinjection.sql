CREATE DATABASE  IF NOT EXISTS `sqlinjection` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sqlinjection`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: sqlinjection
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Optical Drive','Storage device that uses light to read and write information'),(2,'Computer Case','Enclosure that contains most of the components of a computer'),(3,'RAM Memory','A form of computer data storage'),(4,'Hard Drive','Device comprising one or more rigid rotating discs that allow to read and write data magnetically'),(5,'Keyboard','A set of keys used to input information to a computer'),(6,'Monitor','A screen that displays output from a computer'),(7,'Mouse','A pointing device that functions by detecting two-dimensional motion relative to its supporting surface'),(8,'Motherboard','A printed circuit board that holds many of the crucial components of a computer'),(9,'Network Adapter','A computer hardware component that connects a computer to a computer network'),(10,'Operating System','A set of programs that manage computer hardware resources and provide common services for application software'),(11,'Processor','An electronic circuit which executes computer programs, containing a processing unit and a control unit'),(12,'Sound Card','An internal computer expansion card that facilitates the input and output of audio signals to and from a computer under control of computer programs'),(13,'Video Card','An expansion card which generates output images to a display');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_member_permission` (`permission`),
  CONSTRAINT `fk_member_permission` FOREIGN KEY (`permission`) REFERENCES `permissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'boss','aStrongPwd4Me!','Brad','Pitt','admin@website.com',1),(2,'max','poker','Maximilian','Schell','maxfootball991032@hotmail.com',2),(3,'h4x0r','pwd','','Mitnick','hacker@hack.com',4),(4,'suzy99','flowers99','Susan','Boyle','susan.boyle@provider.com',2),(5,'thePlayer','imAPlaya','Tiger','Woods','tiger@woods.com',2),(6,'user4412','4412','John','','user4412123911@hotmail.com',3),(7,'rich_kid','1M$','Mark','Zuckerberg','mark@fb.com',2),(8,'musicfan','rap','Kanye','West','kanye@west.com',2),(9,'highfive','fivehigh','Johan','Smith','hivefive@happy.com',2),(10,'2','3','5','1','4',3),(11,'4','5','\'\'','1','6',3),(12,'88','88','1','1','\'',3),(13,'userfake','passfake','nombrefake','apellidofake','mailfake',3),(14,'userfake2','passfake','nombrefake','apellidofake','mailfake',2),(15,'userfake3','passfake','nombrefake','apellidofake','mailfake',2),(17,'userfake4','passfake','nombrefake','apellidofake','mailfake',2),(18,'adminfake','passfake','nombrefake','apellidofake','mailfake',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlines`
--

DROP TABLE IF EXISTS `orderlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderline_product` (`product`),
  KEY `fk_orderline_order` (`order`),
  CONSTRAINT `fk_orderline_order` FOREIGN KEY (`order`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_product` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlines`
--

LOCK TABLES `orderlines` WRITE;
/*!40000 ALTER TABLE `orderlines` DISABLE KEYS */;
INSERT INTO `orderlines` VALUES (1,1,3,1),(2,2,8,2),(3,1,12,2),(4,4,14,3),(5,2,8,3),(6,1,11,3),(7,1,6,3),(8,1,2,3),(9,1,3,4),(10,1,7,4),(11,3,13,4),(12,3,2,5),(13,1,9,6),(14,1,12,7),(15,1,6,7),(16,1,9,7),(17,1,14,7),(18,2,1,8),(19,1,6,8),(20,1,11,8),(21,5,4,8),(22,1,2,9),(23,1,7,9),(24,1,10,9),(25,1,4,9),(26,5,3,10),(27,1,6,10),(28,3,9,10),(29,3,14,10),(30,1,11,10),(31,3,12,11),(32,1,14,11),(33,1,12,12),(34,1,2,13),(35,2,6,14),(36,1,2,14),(37,1,12,14),(38,1,5,14),(39,1,6,15),(40,1,2,16),(41,1,5,16),(42,1,4,17),(43,2,11,18),(44,2,9,19),(45,1,3,19),(46,1,2,19),(47,2,10,19),(48,1,12,19),(49,3,6,19),(50,1,13,20),(51,1,11,20),(52,1,8,21),(53,1,13,21),(54,3,2,21),(55,1,12,21),(56,3,6,21),(57,1,14,21),(58,2,1,21),(59,1,11,21),(60,3,3,21),(61,1,10,21),(62,1,8,22),(63,1,6,23),(64,1,9,24),(65,1,9,25),(66,2,5,25),(67,1,6,25),(68,1,11,26),(69,1,2,26),(70,1,4,26),(71,1,4,27),(72,5,9,27),(73,3,11,28),(74,1,8,29),(75,1,9,30),(76,1,2,31),(77,1,5,31),(78,1,4,31),(79,1,10,32),(80,1,3,32),(81,2,5,33),(82,2,13,33),(83,1,8,34),(84,1,4,35),(85,2,5,35),(86,1,11,35),(87,1,13,35),(88,1,10,35),(89,4,8,35),(90,4,13,36),(91,1,2,36),(92,2,4,36),(93,1,10,37),(94,1,3,37),(95,2,11,38),(96,1,5,39),(97,1,9,40),(98,3,6,41),(99,2,1,41),(100,1,5,41),(101,1,14,41),(102,1,2,41),(103,4,11,41),(104,1,8,41),(105,1,4,41),(106,1,10,41),(107,1,2,42),(108,2,10,42),(109,1,3,42),(110,1,5,43),(111,1,6,44),(112,2,9,45),(113,1,9,46),(114,1,8,47),(115,1,4,48),(116,1,13,48),(117,4,3,49),(118,1,8,50),(119,1,10,50),(120,1,11,50);
/*!40000 ALTER TABLE `orderlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `member` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_member` (`member`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2011-02-02 00:00:00',3),(2,'2011-02-08 00:00:00',8),(3,'2011-02-14 00:00:00',6),(4,'2011-02-27 00:00:00',9),(5,'2011-03-01 00:00:00',7),(6,'2011-03-02 00:00:00',4),(7,'2011-03-02 00:00:00',8),(8,'2011-03-06 00:00:00',7),(9,'2011-03-18 00:00:00',3),(10,'2011-03-19 00:00:00',7),(11,'2011-03-22 00:00:00',2),(12,'2011-03-24 00:00:00',7),(13,'2011-03-25 00:00:00',6),(14,'2011-03-25 00:00:00',5),(15,'2011-04-04 00:00:00',9),(16,'2011-04-05 00:00:00',6),(17,'2011-04-05 00:00:00',7),(18,'2011-04-13 00:00:00',6),(19,'2011-04-27 00:00:00',4),(20,'2011-04-28 00:00:00',5),(21,'2011-05-19 00:00:00',6),(22,'2011-05-22 00:00:00',2),(23,'2011-05-28 00:00:00',8),(24,'2011-06-01 00:00:00',8),(25,'2011-06-17 00:00:00',8),(26,'2011-06-22 00:00:00',3),(27,'2011-07-07 00:00:00',8),(28,'2011-07-14 00:00:00',1),(29,'2011-07-23 00:00:00',7),(30,'2011-08-13 00:00:00',7),(31,'2011-08-14 00:00:00',4),(32,'2011-08-16 00:00:00',6),(33,'2011-08-16 00:00:00',7),(34,'2011-08-28 00:00:00',6),(35,'2011-09-10 00:00:00',4),(36,'2011-09-25 00:00:00',2),(37,'2011-10-07 00:00:00',5),(38,'2011-10-15 00:00:00',8),(39,'2011-10-21 00:00:00',2),(40,'2011-10-23 00:00:00',4),(41,'2011-10-24 00:00:00',9),(42,'2011-10-25 00:00:00',4),(43,'2011-11-04 00:00:00',6),(44,'2011-11-05 00:00:00',8),(45,'2011-11-05 00:00:00',2),(46,'2011-11-10 00:00:00',7),(47,'2011-11-21 00:00:00',5),(48,'2011-11-23 00:00:00',6),(49,'2011-12-13 00:00:00',8),(50,'2011-12-22 00:00:00',6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creditcard_number` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderline_order` (`order`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'4198 1744 6124 0918 7971 2331','2011-02-11 00:00:00',1),(2,'2147 9852 4672 1484 8854 3745','2011-02-08 00:00:00',2),(3,'5132 7621 6123 8235 8833 1231','2011-02-15 00:00:00',3),(4,'8174 7784 1056 1749 7245 8814','2011-02-28 00:00:00',4),(5,'1071 4008 7081 8614 9941 5683','2011-03-09 00:00:00',5),(6,'4198 1744 6124 0918 7971 2331','2011-03-14 00:00:00',8),(7,'1071 4008 7081 8614 9941 5683','2011-03-24 00:00:00',9),(8,'0000 0000 0000 0000 0000 0000','2011-03-21 00:00:00',10),(9,'5547 3289 4658 4612 6871 8214','2011-03-27 00:00:00',11),(10,'7174 0074 1729 5710 1772 3356','2011-03-31 00:00:00',12),(11,'0000 0000 0000 0000 0000 0000','2011-04-01 00:00:00',13),(12,'4198 1744 6124 0918 7971 2331','2011-03-28 00:00:00',14),(13,'2147 9852 4672 1484 8854 3745','2011-04-05 00:00:00',15),(14,'7174 0074 1729 5710 1772 3356','2011-04-06 00:00:00',16),(15,'0000 0000 0000 0000 0000 0000','2011-04-14 00:00:00',18),(16,'4198 1744 6124 0918 7971 2331','2011-05-02 00:00:00',19),(17,'9879 8179 6123 8903 7853 2987','2011-05-05 00:00:00',20),(18,'1071 4008 7081 8614 9941 5683','2011-05-22 00:00:00',21),(19,'7174 0074 1729 5710 1772 3356','2011-05-29 00:00:00',22),(20,'2147 9852 4672 1484 8854 3745','2011-05-31 00:00:00',23),(21,'5547 3289 4658 4612 6871 8214','2011-06-08 00:00:00',24),(22,'5547 3289 4658 4612 6871 8214','2011-06-22 00:00:00',26),(23,'1071 4008 7081 8614 9941 5683','2011-07-11 00:00:00',27),(24,'7174 0074 1729 5710 1772 3356','2011-07-23 00:00:00',28),(25,'2147 9852 4672 1484 8854 3745','2011-07-25 00:00:00',29),(26,'8174 7784 1056 1749 7245 8814','2011-08-22 00:00:00',30),(27,'7174 0074 1729 5710 1772 3356','2011-08-18 00:00:00',31),(28,'5547 3289 4658 4612 6871 8214','2011-08-23 00:00:00',32),(29,'9879 8179 6123 8903 7853 2987','2011-08-19 00:00:00',33),(30,'0000 0000 0000 0000 0000 0000','2011-09-01 00:00:00',34),(31,'7174 0074 1729 5710 1772 3356','2011-09-12 00:00:00',35),(32,'5132 7621 6123 8235 8833 1231','2011-10-14 00:00:00',37),(33,'5132 7621 6123 8235 8833 1231','2011-10-19 00:00:00',38),(34,'8174 7784 1056 1749 7245 8814','2011-10-24 00:00:00',39),(35,'0000 0000 0000 0000 0000 0000','2011-10-24 00:00:00',40),(36,'0000 0000 0000 0000 0000 0000','2011-10-29 00:00:00',41),(37,'7174 0074 1729 5710 1772 3356','2011-11-02 00:00:00',42),(38,'8174 7784 1056 1749 7245 8814','2011-11-11 00:00:00',43),(39,'2147 9852 4672 1484 8854 3745','2011-11-08 00:00:00',44),(40,'4198 1744 6124 0918 7971 2331','2011-11-14 00:00:00',45),(41,'5132 7621 6123 8235 8833 1231','2011-11-13 00:00:00',46),(42,'2147 9852 4672 1484 8854 3745','2011-11-29 00:00:00',48);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,100,'admin','System administrator'),(2,50,'member','Classic member'),(3,30,'new','New member (no access)'),(4,10,'banned','Banned member');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` decimal(7,2) NOT NULL,
  `qty_left` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_category` (`id`),
  KEY `category` (`category`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'CASE-084-SILVER','Entry level  computer case',50.00,25,2),(2,'CASE-077-GOLD','Great price/quality computer case',75.00,33,2),(3,'CASE-084-ULTIMATE','High performance computer case',125.00,30,2),(4,'CPU-085-SILVER','Entry level  processor',200.00,38,11),(5,'CPU-035-GOLD','Great price/quality processor',350.00,49,11),(6,'CPU-088-ULTIMATE','High performance processor',425.00,53,11),(7,'CPU-019-ULTIMATE_PLUS','Radical performance processor',550.00,48,11),(8,'CPU-035-BEST','Best processor on the market',1200.00,12,11),(9,'HD-027-SILVER','Entry level  hard drive',100.00,13,4),(10,'HD-025-GOLD','Great price/quality hard drive',180.00,39,4),(11,'HD-003-ULTIMATE','High performance hard drive',300.00,50,4),(12,'KB-005-SILVER','Entry level  keyboard',20.00,33,5),(13,'KB-091-GOLD','Great price/quality keyboard',40.00,14,5),(14,'MB-008-SILVER','Entry level  motherboard',130.00,26,8),(15,'MB-000-GOLD','Great price/quality motherboard',200.00,24,8),(16,'MB-057-ULTIMATE','High performance motherboard',300.00,18,8),(17,'MB-057-ULTIMATE_PLUS','Radical performance motherboard',500.00,23,8),(18,'MON-031-SILVER','Entry level  monitor',150.00,31,6),(19,'MON-060-GOLD','Great price/quality monitor',350.00,41,6),(20,'MON-005-ULTIMATE','High performance monitor',700.00,48,6),(21,'MOUS-018-SILVER','Entry level  mouse',10.00,34,7),(22,'MOUS-021-GOLD','Great price/quality mouse',35.00,16,7),(23,'MOUS-023-ULTIMATE','High performance mouse',80.00,53,7),(24,'NET-014-GOLD','Great price/quality network adapter',30.00,59,9),(25,'OPTIC-100-SILVER','Entry level  optical drive',25.00,19,1),(26,'OPTIC-040-GOLD','Great price/quality optical drive',45.00,38,1),(27,'OPTIC-099-ULTIMATE','High performance optical drive',60.00,60,1),(28,'OS-064-SILVER','Entry level  operating system',125.00,55,10),(29,'OS-012-GOLD','Great price/quality operating system',175.00,51,10),(30,'RAM-082-SILVER','Entry level  ram memory',50.00,41,3),(31,'RAM-002-GOLD','Great price/quality ram memory',100.00,38,3),(32,'RAM-003-ULTIMATE','High performance ram memory',200.00,21,3),(33,'SC-012-SILVER','Entry level  sound card',50.00,27,12),(34,'SC-019-GOLD','Great price/quality sound card',150.00,28,12),(35,'SC-093-ULTIMATE','High performance sound card',250.00,55,12),(36,'VC-033-SILVER','Entry level  video card',120.00,49,13),(37,'VC-078-GOLD','Great price/quality video card',195.00,33,13),(38,'VC-096-ULTIMATE','High performance video card',325.00,10,13);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 10:16:01

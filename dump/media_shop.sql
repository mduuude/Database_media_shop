-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: media_shop
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio` (
  `item_id` int(11) NOT NULL,
  `artist` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `recording_company_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`recording_company_id`),
  KEY `fk_audio_item1_idx` (`item_id`),
  KEY `fk_audio_recording_company1_idx` (`recording_company_id`),
  CONSTRAINT `fk_audio_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_audio_recording_company1` FOREIGN KEY (`recording_company_id`) REFERENCES `recording_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio`
--

LOCK TABLES `audio` WRITE;
/*!40000 ALTER TABLE `audio` DISABLE KEYS */;
INSERT INTO `audio` VALUES (1,'The Beatles',NULL,1),(2,'The Beach Boys',NULL,2),(6,'The Beatles',NULL,1),(8,'Bob Dylan',NULL,3),(13,'The Beatles',NULL,1),(14,'Marvin Gaye',NULL,4),(15,'The Rolling Stones',NULL,5),(17,'The Clash',NULL,6),(18,'Bob Dylan',NULL,3),(20,'The Beatles',NULL,7),(21,'Elvis Presley',NULL,8),(22,'Miles Davis',NULL,3),(23,'The Velvet Underground and Nico',NULL,9),(25,'The Beatles',NULL,7),(26,'The Jimi Hendrix Experience',NULL,10),(27,'Bob Dylan',NULL,3),(28,'Nirvana',NULL,11),(29,'Bruce Springsteen',NULL,12),(30,'Van Morrison',NULL,13),(31,'Michael Jackson',NULL,6),(32,'Chuck Berry',NULL,14);
/*!40000 ALTER TABLE `audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `audio_albums_price_list`
--

DROP TABLE IF EXISTS `audio_albums_price_list`;
/*!50001 DROP VIEW IF EXISTS `audio_albums_price_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `audio_albums_price_list` AS SELECT 
 1 AS `audio_album_artist`,
 1 AS `audio_album_title`,
 1 AS `genre`,
 1 AS `year_of_recording`,
 1 AS `recording_company`,
 1 AS `storage_format`,
 1 AS `base_price`,
 1 AS `sale_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `e-mail` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `is_regular` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Bob','666-66-01','bobby@mail.com','Kyiv','Tarasa Shevchenka bvd., 21, 193 app.','false'),(2,'Bill','666-66-02','bill@mail.com','Odesa','Peremohy str., 9, 12 app.','false'),(3,'Bradley','666-66-03','bradley@mail.com','Kyiv','Velyka str., 2, 17 app.','true'),(4,'Baron','666-66-04','baron@mail.com','Cherkasy','Zelena str., 29','false'),(5,'Becky','666-66-05','becky@mail.com','Odesa','Morskyy bvd., 54, 3 app.','false'),(6,'Bro','666-66-06','bro@mail.com','Kharkin','Vyshneva str., 64, 53 app.','false'),(7,'Bismark','666-66-07','bismark@mail.com','Odesa','Richna str., 51, 43 app.','false'),(8,'Bran','666-66-08','bran@mail.com','Simferopol','Dachna str., 14, 42 app.','true'),(9,'Bart','666-66-09','bart@mail.com','Kyiv','Rozumovskoho str., 8, 25 app.','false'),(10,'Bronson','666-66-10','bronson@mail.com','Chernivtsi','Lisnyy bvd., 34, 231 app.','false'),(11,'Brenda','666-66-11','brenda@mail.com','Kyiv','3tya liniya str., 51','false');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Alternative',1),(2,'Blues',1),(3,'Classical',1),(4,'Country',1),(5,'Electronic Dance Music',1),(6,'Hip-Hop/Rap',1),(7,'Industrial',1),(8,'Jazz',1),(9,'Pop',1),(10,'R&B/Soul',1),(11,'Reggae',1),(12,'Rock',1),(13,'Soundtrack',1),(14,'Action',2),(15,'Adventure',2),(16,'Animation',2),(17,'Biography',2),(18,'Comedy',2),(19,'Crime',2),(20,'Documentary',2),(21,'Drama',2),(22,'Family',2),(23,'Fantasy',2),(24,'History',2),(25,'Music',2),(26,'Musical',2),(27,'Mystery',2),(28,'Romance',2),(29,'Sport',2),(30,'Thriller',2),(31,'War',2),(32,'Western',2);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `rating` double(2,1) DEFAULT NULL,
  `item_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`item_type_id`),
  KEY `fk_item_item_type1_idx` (`item_type_id`),
  CONSTRAINT `fk_item_item_type1` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Sgt. Pepper\'s Lonely Hearts Club Band',1967,4.2,1),(2,'Pet Sounds',1966,3.8,1),(3,'The Shawshank Redemption',1994,3.8,2),(4,'The Godfather',1972,3.6,2),(5,'The Godfather: Part II',1974,4.8,2),(6,'Revolver',1966,2.6,1),(7,'The Dark Knight',2008,4.8,2),(8,'Highway 61 Revisited',1965,3.6,1),(9,'Schindlers List',1993,4.6,2),(10,'12 Angry Men',1957,4.2,2),(11,'Pulp Fiction',1994,4.2,2),(12,'The Lord of the Rings: The Return of the King',2003,4.8,2),(13,'Rubber Soul',1965,4.4,1),(14,'What\'s Going On',1971,NULL,1),(15,'Exile on Main Street',1972,4.0,1),(16,'The Good, the Bad and the Ugly',1966,4.2,2),(17,'London Calling',1980,4.0,1),(18,'Blonde on Blonde',1966,3.8,1),(19,'Fight Club',1999,4.4,2),(20,'The White Album',1968,4.8,1),(21,'The Sun Sessions',1976,NULL,1),(22,'Kind of Blue',1959,4.0,1),(23,'The Velvet Underground',1967,5.0,1),(24,'The LOTR: The Fellowship of the Ring',2001,4.6,2),(25,'Abbey Road',1969,3.6,1),(26,'Are You Experienced',1969,NULL,1),(27,'Blood on the Tracks',1975,NULL,1),(28,'Nevermind',1991,NULL,1),(29,'Born to Run',1975,NULL,1),(30,'Astral Weeks',1968,3.6,1),(31,'Thriller',1982,4.2,1),(32,'The Great Twenty-Eight',1982,3.8,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_genre`
--

DROP TABLE IF EXISTS `item_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_genre` (
  `genre_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`genre_id`,`item_id`),
  KEY `fk_audio_genre_genre1_idx` (`genre_id`),
  KEY `fk_item_genre_item1_idx` (`item_id`),
  CONSTRAINT `fk_audio_genre_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_genre_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_genre`
--

LOCK TABLES `item_genre` WRITE;
/*!40000 ALTER TABLE `item_genre` DISABLE KEYS */;
INSERT INTO `item_genre` VALUES (2,8),(2,18),(2,26),(8,22),(8,30),(9,1),(9,2),(9,6),(9,8),(9,13),(9,20),(9,31),(10,14),(10,30),(12,1),(12,2),(12,6),(12,8),(12,13),(12,15),(12,17),(12,18),(12,20),(12,21),(12,23),(12,25),(12,26),(12,27),(12,28),(12,29),(12,30),(12,32),(14,7),(15,12),(15,24),(17,9),(19,3),(19,4),(19,5),(19,7),(19,10),(19,11),(21,3),(21,4),(21,5),(21,7),(21,9),(21,10),(21,11),(21,12),(21,19),(21,24),(23,12),(23,24),(24,9),(32,16);
/*!40000 ALTER TABLE `item_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_type`
--

LOCK TABLES `item_type` WRITE;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` VALUES (1,'audio'),(2,'video');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_program`
--

DROP TABLE IF EXISTS `loyalty_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loyalty_program` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `coeff` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_program`
--

LOCK TABLES `loyalty_program` WRITE;
/*!40000 ALTER TABLE `loyalty_program` DISABLE KEYS */;
INSERT INTO `loyalty_program` VALUES (1,'2 items sale 5%','Buy 2 items with 5% discount',0.95),(2,'5 items sale 15%','Buy 5 items with 15% discount',0.85),(3,'10 items sale 20%','Buy 3 items with 20% discount',0.80),(4,'Item sale 10%','Some items are sale with 10% discount',0.90),(5,'Item sale 20%','Some items are sale with 20% discount',0.80),(6,'Regular Customer sale 15%','For regular customers 15% discount',0.85);
/*!40000 ALTER TABLE `loyalty_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Adrian','555-55-01'),(2,'Agness','555-55-02'),(3,'Aria','555-55-03'),(4,'Antuane','555-55-04'),(5,'Archibald','555-55-05'),(6,'Aaron','555-55-06'),(7,'Alfred','555-55-07'),(8,'Adolf','555-55-08'),(9,'Abraham','555-55-09');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  `product_price_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`customer_id`),
  KEY `fk_order_product_product_price1_idx` (`product_price_id`),
  KEY `fk_order_detail_manager1_idx` (`manager_id`),
  KEY `fk_order_detail_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_order_detail_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_manager1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_product_product_price1` FOREIGN KEY (`product_price_id`) REFERENCES `product_price` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'2015-10-20',1,NULL,15,1,1),(2,'2015-10-20',1,NULL,15,1,1),(3,'2015-10-20',1,NULL,33,2,5),(4,'2015-10-20',1,NULL,18,2,5),(5,'2015-10-20',1,NULL,34,2,5),(6,'2015-10-20',1,NULL,21,1,1),(7,'2015-10-20',1,NULL,6,1,1),(8,'2015-10-20',4,NULL,8,1,6),(9,'2015-10-20',4,NULL,17,1,6),(10,'2015-10-20',1,NULL,22,1,1),(11,'2015-10-20',1,NULL,9,1,1),(12,'2015-10-21',1,NULL,33,3,2),(13,'2015-10-21',1,NULL,15,3,2),(14,'2015-10-21',1,NULL,19,3,2),(15,'2015-10-21',1,NULL,26,3,2),(16,'2015-10-21',1,NULL,8,4,7),(17,'2015-10-21',1,NULL,31,4,7),(18,'2015-10-21',1,NULL,30,4,7),(19,'2015-10-22',1,NULL,28,1,1),(20,'2015-10-22',1,NULL,10,1,1),(21,'2015-10-22',1,NULL,9,1,2),(22,'2015-10-22',1,NULL,31,1,2),(23,'2015-10-22',1,NULL,26,2,2),(24,'2015-10-22',1,NULL,18,2,2),(25,'2015-10-22',1,NULL,13,2,2),(26,'2015-10-23',1,NULL,15,4,7),(27,'2015-10-23',1,NULL,18,4,7),(28,'2015-10-23',1,NULL,8,4,7),(29,'2015-10-23',1,NULL,5,3,4),(30,'2015-10-23',1,NULL,8,3,4),(31,'2015-10-23',1,NULL,26,3,4),(32,'2015-10-23',1,NULL,17,3,4),(33,'2015-10-23',1,NULL,3,3,1),(34,'2015-10-23',1,NULL,8,3,1),(35,'2015-10-23',1,NULL,10,4,4),(36,'2015-10-23',1,NULL,28,4,4),(37,'2015-10-23',1,NULL,33,4,7),(38,'2015-10-24',4,NULL,13,5,6),(39,'2015-10-24',5,NULL,1,5,6),(40,'2015-10-24',1,NULL,2,5,1),(41,'2015-10-24',1,NULL,17,5,1),(42,'2015-10-24',1,NULL,19,5,5),(43,'2015-10-25',1,NULL,15,1,3),(44,'2015-10-25',1,NULL,24,1,3),(45,'2015-10-25',1,NULL,21,1,3),(46,'2015-10-25',1,NULL,3,2,1),(47,'2015-10-25',1,NULL,6,2,7),(48,'2015-10-26',1,NULL,19,3,1),(49,'2015-10-26',1,NULL,32,3,6),(50,'2015-10-26',1,NULL,28,4,6),(51,'2015-10-27',1,NULL,31,5,2),(52,'2015-10-27',1,NULL,22,5,2),(53,'2015-10-27',1,NULL,8,5,2),(54,'2015-10-20',1,NULL,15,1,1),(55,'2015-11-10',1,NULL,13,1,1),(56,'2015-11-10',1,NULL,28,2,5),(57,'2015-11-10',1,NULL,15,2,5),(58,'2015-11-10',1,NULL,32,2,5),(59,'2015-11-10',1,NULL,1,1,1),(60,'2015-11-10',1,NULL,28,1,1),(61,'2015-11-10',4,NULL,15,1,6),(62,'2015-11-11',4,NULL,32,1,6),(63,'2015-11-11',1,NULL,30,1,1),(64,'2015-11-11',1,NULL,32,1,1),(65,'2015-11-11',1,NULL,24,3,2),(66,'2015-11-11',1,NULL,15,3,2),(67,'2015-11-11',1,NULL,34,3,2),(68,'2015-11-11',1,NULL,17,3,2),(69,'2015-11-11',1,NULL,31,4,7),(70,'2015-11-12',1,NULL,16,4,7),(71,'2015-11-12',1,NULL,5,4,7),(72,'2015-11-12',1,NULL,27,1,1),(73,'2015-11-12',1,NULL,7,1,1),(74,'2015-11-12',1,NULL,4,1,2),(75,'2015-11-13',1,NULL,21,1,2),(76,'2015-11-13',1,NULL,30,2,2),(77,'2015-11-13',1,NULL,32,2,2),(78,'2015-11-13',1,NULL,13,2,2),(79,'2015-11-13',1,NULL,15,4,7),(80,'2015-11-13',1,NULL,32,4,7),(81,'2015-11-13',1,NULL,13,4,7),(82,'2015-11-13',1,NULL,15,3,4),(83,'2015-11-14',1,NULL,8,3,4),(84,'2015-11-14',1,NULL,1,3,4),(85,'2015-11-14',1,NULL,2,3,4),(86,'2015-11-14',1,NULL,4,3,1),(87,'2015-11-15',1,NULL,19,3,1),(88,'2015-11-15',1,NULL,8,4,4),(89,'2015-11-15',1,NULL,15,4,4),(90,'2015-11-15',1,NULL,13,4,7),(91,'2015-11-16',4,NULL,5,5,6),(92,'2015-11-16',5,NULL,13,5,6),(93,'2015-11-16',1,NULL,1,5,1),(94,'2015-11-16',1,NULL,19,5,1),(95,'2015-11-16',1,NULL,1,5,5),(96,'2015-11-16',1,NULL,15,1,3),(97,'2015-11-17',1,NULL,13,1,3),(98,'2015-11-17',1,NULL,16,1,3),(99,'2015-11-17',1,NULL,7,2,1),(100,'2015-11-18',1,NULL,2,2,7),(101,'2015-11-18',1,NULL,19,3,1),(102,'2015-11-18',1,NULL,30,3,6),(103,'2015-11-18',1,NULL,32,4,6),(104,'2015-11-19',1,NULL,2,5,2),(105,'2015-11-19',1,NULL,1,5,2),(106,'2015-11-20',1,NULL,13,5,2),(107,'2015-11-18',1,NULL,2,2,7),(108,'2015-11-18',1,NULL,19,3,1),(109,'2015-11-18',1,NULL,30,3,6),(110,'2015-11-18',1,NULL,32,4,6),(111,'2015-11-19',1,NULL,2,5,2),(112,'2015-11-19',1,NULL,1,5,2),(113,'2015-11-20',1,NULL,13,5,2),(114,'2016-02-18',1,NULL,21,2,7),(115,'2016-02-18',1,NULL,8,3,1),(116,'2016-02-18',1,NULL,30,3,6),(117,'2016-02-18',1,NULL,41,4,6),(118,'2016-02-19',1,NULL,30,5,2),(119,'2016-02-19',1,NULL,39,5,2),(120,'2016-02-20',1,NULL,36,5,2),(121,'2016-02-20',1,NULL,7,2,7),(122,'2016-02-21',1,NULL,19,3,1),(123,'2016-02-21',1,NULL,34,3,6),(124,'2016-02-21',1,NULL,24,4,6),(125,'2016-02-21',1,NULL,38,5,2),(126,'2016-02-25',1,NULL,27,5,2),(127,'2016-02-25',1,NULL,1,5,2),(128,'2016-02-25',1,NULL,4,2,7),(129,'2016-02-25',1,NULL,7,3,1),(130,'2016-02-26',1,NULL,24,3,6),(131,'2016-03-10',1,NULL,31,4,6),(132,'2016-03-10',1,NULL,35,5,2),(133,'2016-03-10',1,NULL,24,5,2),(134,'2016-03-12',1,NULL,34,5,2),(135,'2016-03-12',1,NULL,44,2,7),(136,'2016-03-12',1,NULL,44,3,1),(137,'2016-03-12',1,NULL,44,3,6),(138,'2016-03-15',1,NULL,35,4,6),(139,'2016-03-15',1,NULL,21,5,2),(140,'2016-03-15',1,NULL,7,5,2),(141,'2016-03-15',1,NULL,8,5,2),(142,'2016-03-16',1,NULL,32,4,6),(143,'2016-03-16',1,NULL,41,5,2),(144,'2016-03-16',1,NULL,44,5,2),(145,'2016-03-18',1,NULL,21,5,2),(146,'2016-03-18',1,NULL,41,2,7),(147,'2016-03-18',1,NULL,4,3,1),(148,'2016-03-19',1,NULL,1,3,6),(149,'2016-03-19',1,NULL,24,4,6),(150,'2016-03-19',1,NULL,19,5,2),(151,'2016-03-20',1,NULL,34,5,2),(152,'2016-03-20',1,NULL,21,5,2);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`order_item_AFTER_INSERT` AFTER INSERT ON `order_item` FOR EACH ROW
BEGIN
	IF (NEW.`quantity` > 
		(SELECT `product`.`quantity` FROM `product_price`
		JOIN `product` ON `product_price`.`product_id` = `product`.`id`
		WHERE `product_price`.`id` = NEW.`product_price_id`)) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "It is not enough products!";
    ELSE
    	UPDATE `product`
        JOIN `product_price` ON `product`.`id`=`product_price`.`product_id`
		SET `product`.`quantity` = `product`.`quantity` - NEW.`quantity`
		WHERE `product_price`.`id` = NEW.`product_price_id`;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`order_item_AFTER_UPDATE` AFTER UPDATE ON `order_item` FOR EACH ROW
BEGIN
	IF (NEW.`quantity` > 
		(SELECT `product`.`quantity` FROM `product_price`
		JOIN `product` ON `product_price`.`product_id` = `product`.`id`
		WHERE `product_price`.`id` = NEW.`product_price_id`)) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "It is not enough products!";
    ELSE
    	UPDATE `product`
        JOIN `product_price` ON `product`.`id`=`product_price`.`product_id`
		SET `product`.`quantity` = `product`.`quantity` + OLD.`quantity` - NEW.`quantity`
		WHERE `product_price`.`id` = NEW.`product_price_id`;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_item_archive`
--

DROP TABLE IF EXISTS `order_item_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item_archive` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  `product_price_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_archive`
--

LOCK TABLES `order_item_archive` WRITE;
/*!40000 ALTER TABLE `order_item_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `storage_format_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`item_id`,`storage_format_id`),
  KEY `fk_product_item1_idx` (`item_id`),
  KEY `fk_product_storage_format1_idx` (`storage_format_id`),
  CONSTRAINT `fk_product_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_storage_format1` FOREIGN KEY (`storage_format_id`) REFERENCES `storage_format` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,2,'2013-01-08',1,1),(2,8,'2013-02-01',2,3),(3,5,'2013-02-01',2,1),(4,8,'2013-02-02',3,1),(5,5,'2013-03-08',4,3),(6,1,'2013-03-14',4,1),(7,10,'2013-03-22',5,3),(8,13,'2013-04-18',6,3),(9,3,'2013-06-01',7,3),(10,9,'2013-10-05',8,3),(11,0,'2014-02-01',8,1),(12,18,'2014-07-10',9,1),(13,14,'2014-07-12',10,1),(14,12,'2014-08-04',11,1),(15,0,'2014-08-11',12,3),(16,9,'2014-10-14',12,1),(17,4,'2014-11-01',13,1),(18,4,'2014-11-06',14,3),(19,14,'2014-12-02',14,1),(20,0,'2014-12-25',15,3),(21,28,'2014-12-31',16,1),(22,5,'2014-12-31',17,3),(23,0,'2015-01-17',17,1),(24,12,'2015-01-05',18,3),(25,0,'2015-02-01',19,1),(26,0,'2015-02-09',20,1),(27,10,'2015-02-13',21,1),(28,15,'2015-03-07',21,3),(29,7,'2015-06-02',22,2),(30,18,'2015-06-19',23,5),(31,6,'2015-09-18',24,2),(32,23,'2016-01-15',24,4),(33,1,'2016-01-15',25,5),(34,13,'2016-01-15',26,5),(35,8,'2016-01-15',27,5),(36,16,'2016-02-01',27,4),(37,13,'2016-02-09',28,2),(38,5,'2016-02-10',28,4),(39,17,'2016-02-10',29,2),(40,0,'2016-02-13',30,4),(41,23,'2016-02-14',31,5),(42,7,'2016-03-05',31,2),(43,12,'2016-03-05',32,2),(44,25,'2016-03-11',32,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_demand_and_handling`
--

DROP TABLE IF EXISTS `product_demand_and_handling`;
/*!50001 DROP VIEW IF EXISTS `product_demand_and_handling`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `product_demand_and_handling` AS SELECT 
 1 AS `type_of_product`,
 1 AS `product_title`,
 1 AS `year`,
 1 AS `storage_format`,
 1 AS `num_of_orders`,
 1 AS `base_price`,
 1 AS `sale_price`,
 1 AS `revenue`,
 1 AS `rating`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price` (
  `id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date DEFAULT NULL,
  `price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_price_product1_idx` (`product_id`),
  CONSTRAINT `fk_product_price_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (1,'2015-09-01',NULL,1410,1),(2,'2015-09-01',NULL,1350,2),(3,'2015-09-01',NULL,1425,3),(4,'2015-09-01',NULL,1380,4),(5,'2015-09-01',NULL,1290,5),(6,'2015-09-16',NULL,1310,6),(7,'2015-07-01',NULL,1360,7),(8,'2015-07-01',NULL,1210,8),(9,'2015-09-01',NULL,1195,9),(10,'2015-07-01',NULL,1295,10),(11,'2015-07-01',NULL,1350,11),(12,'2015-07-01',NULL,1215,12),(13,'2015-09-01','2016-01-31',1320,13),(14,'2016-02-01',NULL,1350,13),(15,'2015-07-01',NULL,1410,14),(16,'2015-09-01','2016-01-31',1230,15),(17,'2016-02-01',NULL,1280,15),(18,'2015-07-01',NULL,1420,16),(19,'2015-09-01',NULL,1450,17),(20,'2015-09-01',NULL,1350,18),(21,'2015-07-01',NULL,1290,19),(22,'2015-09-01',NULL,1350,20),(23,'2015-09-01',NULL,1455,21),(24,'2015-07-01',NULL,1350,22),(25,'2015-07-01','2016-01-31',1310,23),(26,'2016-02-01',NULL,1330,23),(27,'2015-07-01',NULL,1390,24),(28,'2015-07-01',NULL,1315,25),(29,'2015-09-01','2016-01-31',1345,26),(30,'2016-02-01',NULL,1400,26),(31,'2015-07-01',NULL,1350,27),(32,'2015-09-01',NULL,1250,28),(33,'2015-07-01',NULL,1285,29),(34,'2015-07-01',NULL,1210,30),(35,'2015-09-01',NULL,1350,31),(36,'2015-09-01',NULL,1420,32),(37,'2015-07-01','2016-01-31',1370,33),(38,'2016-02-01',NULL,1340,33),(39,'2015-07-01',NULL,1290,34),(40,'2015-07-01',NULL,1350,35),(41,'2015-07-01',NULL,1190,36),(42,'2015-09-01',NULL,1350,37),(43,'2015-09-01',NULL,1275,38),(44,'2015-09-01',NULL,1280,39),(45,'2015-09-01',NULL,1350,40),(46,'2015-09-01',NULL,1310,41),(47,'2015-09-15',NULL,1430,42),(48,'2015-09-15',NULL,1415,43),(49,'2015-09-15',NULL,1350,44);
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`product_price_AFTER_INSERT` AFTER INSERT ON `product_price` FOR EACH ROW
BEGIN
	IF (NEW.`date_from` > NEW.`date_to`) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "Date error! Date to cannot be less than date from";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`product_price_AFTER_UPDATE` AFTER UPDATE ON `product_price` FOR EACH ROW
BEGIN
	IF (NEW.`date_from` > NEW.`date_to`) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "Date error! Date to cannot be less than date from";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_sale`
--

DROP TABLE IF EXISTS `product_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_sale` (
  `product_id` int(11) NOT NULL,
  `loyalty_program_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`product_id`,`loyalty_program_id`),
  KEY `fk_product_price_product1_idx` (`product_id`),
  KEY `fk_product_sale_loyalty_program1_idx` (`loyalty_program_id`),
  CONSTRAINT `fk_product_price_product10` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_sale_loyalty_program1` FOREIGN KEY (`loyalty_program_id`) REFERENCES `loyalty_program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sale`
--

LOCK TABLES `product_sale` WRITE;
/*!40000 ALTER TABLE `product_sale` DISABLE KEYS */;
INSERT INTO `product_sale` VALUES (7,5,'2015-12-01',NULL),(8,4,'2015-11-01','2016-02-01'),(13,4,'2015-11-01','2016-02-01'),(21,4,'2015-12-01',NULL),(22,5,'2015-12-01',NULL),(26,5,'2015-11-01','2016-02-01'),(34,4,'2016-01-01','2016-04-10'),(41,5,'2015-12-01',NULL);
/*!40000 ALTER TABLE `product_sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`product_sale_AFTER_INSERT` AFTER INSERT ON `product_sale` FOR EACH ROW
BEGIN
	IF (NEW.`date_from` > NEW.`date_to`) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "Date error! Date to cannot be less than date from";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`product_sale_AFTER_UPDATE` AFTER UPDATE ON `product_sale` FOR EACH ROW
BEGIN
	IF (NEW.`date_from` > NEW.`date_to`) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "Date error! Date to cannot be less than date from";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `production_company`
--

DROP TABLE IF EXISTS `production_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_company` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_company`
--

LOCK TABLES `production_company` WRITE;
/*!40000 ALTER TABLE `production_company` DISABLE KEYS */;
INSERT INTO `production_company` VALUES (1,'Castle Rock Entertainment'),(2,'Paramount Pictures'),(3,'Warner Bros.'),(4,'Universal Pictures'),(5,'Orion-Nova Productions'),(6,'Miramax'),(7,'New Line Cinema'),(8,'Produzioni Europee Associati (PEA)'),(9,'Fox 2000 Pictures');
/*!40000 ALTER TABLE `production_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `item_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`customer_id`),
  KEY `fk_ratings_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_ratings_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ratings_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,5),(1,2,4),(1,3,5),(1,4,4),(1,5,3),(2,1,5),(2,2,4),(2,3,3),(2,4,4),(2,5,3),(3,1,5),(3,2,5),(3,3,4),(3,4,2),(3,5,3),(4,1,5),(4,2,4),(4,3,3),(4,4,3),(4,5,3),(5,1,5),(5,2,5),(5,3,4),(5,4,5),(5,5,5),(6,1,5),(6,2,3),(6,3,1),(6,4,2),(6,5,2),(7,1,5),(7,2,5),(7,3,5),(7,4,4),(7,5,5),(8,1,5),(8,2,4),(8,3,4),(8,4,3),(8,5,2),(9,1,5),(9,2,4),(9,3,4),(9,4,5),(9,5,5),(10,1,5),(10,2,5),(10,3,2),(10,4,4),(10,5,5),(11,1,5),(11,2,5),(11,3,4),(11,4,2),(11,5,5),(12,1,5),(12,2,5),(12,3,4),(12,4,5),(12,5,5),(13,1,5),(13,2,4),(13,3,5),(13,4,3),(13,5,5),(15,1,5),(15,2,3),(15,3,4),(15,4,3),(15,5,5),(16,1,5),(16,2,5),(16,3,4),(16,4,4),(16,5,3),(17,1,5),(17,2,3),(17,3,3),(17,4,4),(17,5,5),(18,1,5),(18,2,2),(18,3,3),(18,4,4),(18,5,5),(19,1,5),(19,2,3),(19,3,4),(19,4,5),(19,5,5),(20,1,5),(20,2,5),(20,3,5),(20,4,4),(20,5,5),(22,1,5),(22,2,3),(22,3,4),(22,4,3),(22,5,5),(23,1,5),(23,2,5),(23,3,5),(23,4,5),(23,5,5),(24,1,5),(24,2,3),(24,3,5),(24,4,5),(24,5,5),(25,1,5),(25,2,4),(25,3,3),(25,4,3),(25,5,3),(30,1,5),(30,2,4),(30,3,4),(30,4,3),(30,5,2),(31,1,5),(31,2,4),(31,3,2),(31,4,5),(31,5,5),(32,1,5),(32,2,4),(32,3,3),(32,4,4),(32,5,3);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`rating_AFTER_INSERT` AFTER INSERT ON `rating` FOR EACH ROW
BEGIN
	IF (NEW.rate > 5 || NEW.rate < 1) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "The rate should be from 1 to 5!";
    ELSE
    	UPDATE item
		SET rating = (SELECT AVG(rate) FROM rating WHERE item_id = NEW.item_id)
		WHERE id = NEW.item_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`rating_AFTER_UPDATE` AFTER UPDATE ON `rating` FOR EACH ROW
BEGIN
	IF (NEW.rate > 5 || NEW.rate < 1) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "The rate should be from 1 to 5!";
    ELSE
    	UPDATE item
		SET rating = (SELECT AVG(rate) FROM rating WHERE item_id = NEW.item_id)
		WHERE id = NEW.item_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_shop`.`rating_AFTER_DELETE` AFTER DELETE ON `rating` FOR EACH ROW
BEGIN
	UPDATE item
	SET rating = (SELECT AVG(rate) FROM rating WHERE item_id = OLD.item_id)
	WHERE id = OLD.item_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recording_company`
--

DROP TABLE IF EXISTS `recording_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_company` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_company`
--

LOCK TABLES `recording_company` WRITE;
/*!40000 ALTER TABLE `recording_company` DISABLE KEYS */;
INSERT INTO `recording_company` VALUES (1,'Parlophone Records'),(2,'Capitol Records'),(3,'Columbia Records'),(4,'Motown Records'),(5,'Rolling Stones Records'),(6,'Epic Records'),(7,'Apple Records'),(8,'RCA Records'),(9,'MGM Records'),(10,'Track Record'),(11,'DGC Records'),(12,'CBS Records International'),(13,'Warner Bros. Records'),(14,'Chess Records');
/*!40000 ALTER TABLE `recording_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_format`
--

DROP TABLE IF EXISTS `storage_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_format` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_format`
--

LOCK TABLES `storage_format` WRITE;
/*!40000 ALTER TABLE `storage_format` DISABLE KEYS */;
INSERT INTO `storage_format` VALUES (1,'cc','Compact Cassette'),(2,'vhs','Video Home System'),(3,'cd','Compact Disc'),(4,'dvd','Digital Versatile Disc'),(5,'bd','Blu-ray Disc');
/*!40000 ALTER TABLE `storage_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `item_id` int(11) NOT NULL,
  `director` varchar(45) NOT NULL,
  `lenght` time(6) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `production_company_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`production_company_id`),
  KEY `fk_video_item1_idx` (`item_id`),
  KEY `fk_video_production_company1_idx` (`production_company_id`),
  CONSTRAINT `fk_video_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_production_company1` FOREIGN KEY (`production_company_id`) REFERENCES `production_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (3,'Frank Darabont','02:22:00.000000',NULL,1),(4,'Francis Ford Coppola','02:55:00.000000',NULL,2),(5,'Francis Ford Coppola','03:22:00.000000',NULL,2),(7,'Christopher Nolan','02:32:00.000000',NULL,3),(9,'Steven Spielberg','03:15:00.000000',NULL,4),(10,'Sidney Lumet','01:36:00.000000',NULL,5),(11,'Quentin Tarantino','02:34:00.000000',NULL,6),(12,'Peter Jackson','03:21:00.000000',NULL,7),(16,'Frank Darabont','02:22:00.000000',NULL,8),(19,'David Fincher','02:19:00.000000',NULL,9),(24,'Peter Jackson','02:51:00.000000',NULL,7);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `video_price_list`
--

DROP TABLE IF EXISTS `video_price_list`;
/*!50001 DROP VIEW IF EXISTS `video_price_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `video_price_list` AS SELECT 
 1 AS `video_title`,
 1 AS `video_director`,
 1 AS `genre`,
 1 AS `year_of_production`,
 1 AS `production_company`,
 1 AS `storage_format`,
 1 AS `base_price`,
 1 AS `sale_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'media_shop'
--

--
-- Dumping routines for database 'media_shop'
--
/*!50003 DROP FUNCTION IF EXISTS `act_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `act_price`(`par` INTEGER(11)) RETURNS int(11)
BEGIN
	DECLARE `var_is_reg` VARCHAR(5);
    DECLARE `var_coeff` DECIMAL(3,2);
    DECLARE `var_sale_date` VARCHAR(45);
    DECLARE `var_qtt` INTEGER;
    DECLARE `var_price` INTEGER;

	SET `var_is_reg` = (SELECT `customer`.`is_regular` 
		FROM `customer`
        JOIN `order_item` ON `customer`.`id` = `order_item`.`customer_id`
        WHERE `order_item`.`id` = `par`);
	SET `var_coeff` = (SELECT `loyalty_program`.`coeff` 
		FROM `loyalty_program`
        JOIN `product_sale` ON `loyalty_program`.`id` = `product_sale`.`loyalty_program_id`
        JOIN `product` ON `product_sale`.`product_id` = `product`.`id`
        JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
        JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
        WHERE `order_item`.`id` = `par`);
	SET `var_sale_date` = (SELECT `product_sale`.`date_to` 
        FROM `product_sale`
        JOIN `product` ON `product_sale`.`product_id` = `product`.`id`
        JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
        JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
        WHERE `order_item`.`id` = `par`);
	SET `var_qtt` = (SELECT `order_item`.`quantity` 
        FROM `order_item`
        WHERE `order_item`.`id` = `par`);
	SET `var_price` = (SELECT `product_price`.`price` 
        FROM `product_price`
        JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
        WHERE `order_item`.`id` = `par`);
	
    IF (`var_is_reg` = 'true') THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 6);
	END IF;
    
    IF (`var_coeff` IS NOT NULL AND `var_sale_date` IS NULL) THEN
		SET `var_price` = `var_price` * `var_coeff`;    
	END IF;
    
	IF (`var_qtt` BETWEEN 2 AND 4) THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 1);
	ELSEIF (`var_qtt` BETWEEN 5 AND 9) THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 2);
	ELSEIF (`var_qtt` > 10) THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 3);
	END IF;
    
RETURN `var_price`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_items_on_storage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_items_on_storage`(`par` INTEGER(2))
BEGIN
SELECT * FROM (
SELECT `product`.`id`,
	IF(`item`.`item_type_id` = 1, 'audio', 'video') AS `type_of_product`,
	`item`.`title` AS `product_title`, 
	`storage_format`.`name` AS `storage_format`, 
	`product`.`quantity`
FROM `product`
JOIN `storage_format` ON `product`.`storage_format_id` = `storage_format`.`id`
JOIN `item` ON `product`.`item_id` = `item`.`id`
WHERE `product`.`quantity` < `par`
GROUP BY `product`.`id`
ORDER BY `product`.`quantity`) AS `t`

UNION ALL

SELECT * FROM (
SELECT `product`.`id`,
	IF(`item`.`item_type_id` = 1, 'audio', 'video') AS `type_of_product`,
	`item`.`title` AS `product_title`, 
	`storage_format`.`name` AS `storage_format`, 
	`product`.`quantity`
FROM `product`
JOIN `storage_format` ON `product`.`storage_format_id` = `storage_format`.`id`
JOIN `item` ON `product`.`item_id` = `item`.`id`
WHERE `product`.`quantity` < `par`
GROUP BY `product`.`id`
ORDER BY `product`.`quantity`
) AS `t2`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `managers_efficience` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `managers_efficience`()
BEGIN
DROP TABLE IF EXISTS `temp`;
    
CREATE TEMPORARY TABLE `temp`   
SELECT DISTINCT `manager`.`id`,
	`manager`.`name`, 
	COUNT(DISTINCT `order_item`.`date`) AS `worked_days`
FROM `manager`
JOIN `order_item` ON `order_item`.`manager_id` = `manager`.`id`
GROUP BY `manager`.`id`;

SELECT `manager`.`name`,
	SUM(`order_item`.`quantity`) AS `num_of_orders`,
    `temp`.`worked_days`,
	(SUM(`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`order_item`.`id`))) AS `revenue`
FROM `manager`
JOIN `temp` ON `manager`.`id` = `temp`.`id`
JOIN `order_item` ON `order_item`.`manager_id` = `manager`.`id`
JOIN `product_price` ON `order_item`.`product_price_id` = `product_price`.`id`
JOIN `product` ON `product_price`.`product_id` = `product`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
GROUP BY `manager`.`name`
ORDER BY `num_of_orders` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `most_loyal_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `most_loyal_customers`()
BEGIN
SELECT `customer`.`name` AS `customer_name`,
		COUNT(DISTINCT `order_item`.`id`) AS `num_of_orders`,
		AVG (`rating`.`rate`) AS `avg_cust_rate_of_products`
FROM `customer` 
JOIN `order_item` ON `customer`.`id` = `order_item`.`customer_id`
LEFT JOIN `rating` ON `customer`.`id` = `rating`.`customer_id`
JOIN `product_price` ON `order_item`.`product_price_id` = `product_price`.`id`
JOIN `product` ON `product_price`.`product_id` = `product`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
GROUP BY `customer_name`
ORDER BY `num_of_orders` DESC, `avg_cust_rate_of_products` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `most_popular_and_valuable_storage_formats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `most_popular_and_valuable_storage_formats`()
BEGIN
SELECT `storage_format`.`name`, 
	SUM(`order_item`.`quantity`) AS `num_of_orders`,
	(SUM(`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`order_item`.`id`))) AS `revenue`
FROM `storage_format`
JOIN `product` ON `storage_format`.`id` = `product`.`storage_format_id`
JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
JOIN `order_item` ON `order_item`.`product_price_id` = `product_price`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
GROUP BY `storage_format`.`name`
ORDER BY `num_of_orders` DESC, `revenue` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_archive_orders_over_91d` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_archive_orders_over_91d`()
BEGIN
	INSERT INTO `order_item_arcive`
	SELECT * FROM `order_item`
    WHERE `order_item`.`date` < (NOW() - INTERVAL 91 DAY);
    
    DELETE FROM `order_item`
    WHERE `order_item`.`date` < (NOW() - INTERVAL 91 DAY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `audio_albums_price_list`
--

/*!50001 DROP VIEW IF EXISTS `audio_albums_price_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `audio_albums_price_list` AS select `audio`.`artist` AS `audio_album_artist`,`item`.`title` AS `audio_album_title`,group_concat(`genre`.`name` separator ',') AS `genre`,`item`.`year` AS `year_of_recording`,`recording_company`.`name` AS `recording_company`,`storage_format`.`name` AS `storage_format`,`product_price`.`price` AS `base_price`,ifnull((`product_price`.`price` * `loyalty_program`.`coeff`),`product_price`.`price`) AS `sale_price` from (((((((((`product_price` join `product` on((`product_price`.`product_id` = `product`.`id`))) left join `product_sale` on((`product`.`id` = `product_sale`.`product_id`))) left join `loyalty_program` on((`product_sale`.`loyalty_program_id` = `loyalty_program`.`id`))) join `storage_format` on((`product`.`storage_format_id` = `storage_format`.`id`))) join `item` on((`product`.`item_id` = `item`.`id`))) join `audio` on((`item`.`id` = `audio`.`item_id`))) join `recording_company` on((`audio`.`recording_company_id` = `recording_company`.`id`))) join `item_genre` on((`item`.`id` = `item_genre`.`item_id`))) join `genre` on((`item_genre`.`genre_id` = `genre`.`id`))) where isnull(`product_price`.`date_to`) group by `product`.`id` order by `audio_album_artist`,`audio_album_title`,`storage_format` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_demand_and_handling`
--

/*!50001 DROP VIEW IF EXISTS `product_demand_and_handling`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_demand_and_handling` AS select `t`.`type_of_product` AS `type_of_product`,`t`.`product_title` AS `product_title`,`t`.`year` AS `year`,`t`.`storage_format` AS `storage_format`,`t`.`num_of_orders` AS `num_of_orders`,`t`.`base_price` AS `base_price`,`t`.`sale_price` AS `sale_price`,`t`.`revenue` AS `revenue`,`t`.`rating` AS `rating`,`t`.`quantity` AS `quantity` from (select if((`media_shop`.`item`.`item_type_id` = 1),'audio','video') AS `type_of_product`,`media_shop`.`item`.`title` AS `product_title`,`media_shop`.`item`.`year` AS `year`,`media_shop`.`storage_format`.`name` AS `storage_format`,sum(`media_shop`.`order_item`.`quantity`) AS `num_of_orders`,cast(`media_shop`.`product_price`.`price` as decimal(11,2)) AS `base_price`,ifnull((`media_shop`.`product_price`.`price` * `media_shop`.`loyalty_program`.`coeff`),`media_shop`.`product_price`.`price`) AS `sale_price`,(sum(`media_shop`.`order_item`.`quantity`) * (select `media_shop`.`act_price`(`media_shop`.`order_item`.`id`))) AS `revenue`,`media_shop`.`item`.`rating` AS `rating`,`media_shop`.`product`.`quantity` AS `quantity` from (((((((`media_shop`.`order_item` join `media_shop`.`product_price` on((`media_shop`.`order_item`.`product_price_id` = `media_shop`.`product_price`.`id`))) join `media_shop`.`product` on((`media_shop`.`product_price`.`product_id` = `media_shop`.`product`.`id`))) left join `media_shop`.`product_sale` on((`media_shop`.`product`.`id` = `media_shop`.`product_sale`.`product_id`))) left join `media_shop`.`loyalty_program` on((`media_shop`.`product_sale`.`loyalty_program_id` = `media_shop`.`loyalty_program`.`id`))) join `media_shop`.`storage_format` on((`media_shop`.`product`.`storage_format_id` = `media_shop`.`storage_format`.`id`))) join `media_shop`.`item` on((`media_shop`.`product`.`item_id` = `media_shop`.`item`.`id`))) join `media_shop`.`video` on((`media_shop`.`item`.`id` = `media_shop`.`video`.`item_id`))) where isnull(`media_shop`.`product_price`.`date_to`) group by `media_shop`.`order_item`.`product_price_id` order by `revenue` desc,`media_shop`.`item`.`rating` desc) `t` union all select `t2`.`type_of_product` AS `type_of_product`,`t2`.`product_title` AS `product_title`,`t2`.`year` AS `year`,`t2`.`storage_format` AS `storage_format`,`t2`.`num_of_orders` AS `num_of_orders`,`t2`.`base_price` AS `base_price`,`t2`.`sale_price` AS `sale_price`,`t2`.`revenue` AS `revenue`,`t2`.`rating` AS `rating`,`t2`.`quantity` AS `quantity` from (select if((`media_shop`.`item`.`item_type_id` = 1),'audio','video') AS `type_of_product`,`media_shop`.`item`.`title` AS `product_title`,`media_shop`.`item`.`year` AS `year`,`media_shop`.`storage_format`.`name` AS `storage_format`,sum(`media_shop`.`order_item`.`quantity`) AS `num_of_orders`,cast(`media_shop`.`product_price`.`price` as decimal(11,2)) AS `base_price`,ifnull((`media_shop`.`product_price`.`price` * `media_shop`.`loyalty_program`.`coeff`),`media_shop`.`product_price`.`price`) AS `sale_price`,(sum(`media_shop`.`order_item`.`quantity`) * (select `media_shop`.`act_price`(`media_shop`.`order_item`.`id`))) AS `revenue`,`media_shop`.`item`.`rating` AS `rating`,`media_shop`.`product`.`quantity` AS `quantity` from (((((((`media_shop`.`order_item` join `media_shop`.`product_price` on((`media_shop`.`order_item`.`product_price_id` = `media_shop`.`product_price`.`id`))) join `media_shop`.`product` on((`media_shop`.`product_price`.`product_id` = `media_shop`.`product`.`id`))) left join `media_shop`.`product_sale` on((`media_shop`.`product`.`id` = `media_shop`.`product_sale`.`product_id`))) left join `media_shop`.`loyalty_program` on((`media_shop`.`product_sale`.`loyalty_program_id` = `media_shop`.`loyalty_program`.`id`))) join `media_shop`.`storage_format` on((`media_shop`.`product`.`storage_format_id` = `media_shop`.`storage_format`.`id`))) join `media_shop`.`item` on((`media_shop`.`product`.`item_id` = `media_shop`.`item`.`id`))) join `media_shop`.`audio` on((`media_shop`.`item`.`id` = `media_shop`.`audio`.`item_id`))) where isnull(`media_shop`.`product_price`.`date_to`) group by `media_shop`.`order_item`.`product_price_id` order by `revenue` desc,`media_shop`.`item`.`rating` desc) `t2` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `video_price_list`
--

/*!50001 DROP VIEW IF EXISTS `video_price_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `video_price_list` AS select `item`.`title` AS `video_title`,`video`.`director` AS `video_director`,group_concat(`genre`.`name` separator ',') AS `genre`,`item`.`year` AS `year_of_production`,`production_company`.`name` AS `production_company`,`storage_format`.`name` AS `storage_format`,`product_price`.`price` AS `base_price`,ifnull((`product_price`.`price` * `loyalty_program`.`coeff`),`product_price`.`price`) AS `sale_price` from (((((((((`product_price` join `product` on((`product_price`.`product_id` = `product`.`id`))) left join `product_sale` on((`product`.`id` = `product_sale`.`product_id`))) left join `loyalty_program` on((`product_sale`.`loyalty_program_id` = `loyalty_program`.`id`))) join `storage_format` on((`product`.`storage_format_id` = `storage_format`.`id`))) join `item` on((`product`.`item_id` = `item`.`id`))) join `video` on((`item`.`id` = `video`.`item_id`))) join `production_company` on((`video`.`production_company_id` = `production_company`.`id`))) join `item_genre` on((`item`.`id` = `item_genre`.`item_id`))) join `genre` on((`item_genre`.`genre_id` = `genre`.`id`))) where isnull(`product_price`.`date_to`) group by `product`.`id` order by `video_title`,`year_of_production`,`storage_format` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-15 14:03:58

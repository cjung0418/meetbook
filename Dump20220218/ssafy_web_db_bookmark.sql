-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: i6a206.p.ssafy.io    Database: ssafy_web_db
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conference_id` int NOT NULL,
  `user_id` int NOT NULL,
  `alarm` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BOOK_MARK_CONF01_idx` (`conference_id`),
  KEY `FK_BOOK_MARK_USER01_idx` (`user_id`),
  CONSTRAINT `FK_BOOK_MARK_CONF01` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BOOK_MARK_USER01` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
INSERT INTO `bookmark` VALUES (2,2,4,1),(3,2,5,1),(13,3,10,1),(19,5,8,1),(22,9,10,1),(29,3,8,1),(30,9,8,1),(32,14,10,1),(44,21,8,1),(45,21,10,1),(59,13,10,1),(61,26,8,1),(65,3,21,1),(70,28,8,1),(71,29,8,1),(73,30,21,1),(89,36,25,1),(98,2,8,1),(99,2,8,1),(100,37,8,1),(101,38,8,1),(102,39,8,1),(104,40,10,1),(106,42,8,1),(118,34,30,1),(126,43,30,1),(166,48,5,1),(167,48,30,1),(170,2,6,1),(175,50,5,1),(176,51,9,1),(177,50,30,1),(178,52,5,1),(179,53,10,1),(180,54,5,1),(181,55,5,1),(183,56,5,1),(184,56,30,1),(188,3,9,1),(189,57,9,1),(190,58,30,1),(193,14,9,1),(195,4,9,1),(196,59,5,1),(200,61,5,1),(204,63,5,1),(205,63,30,1),(206,64,30,1),(207,65,30,1),(208,65,5,1),(209,66,10,1),(210,67,5,1),(211,67,30,1),(212,68,10,1),(213,69,10,1),(214,70,9,1),(215,71,9,1),(216,72,9,1),(217,73,5,1),(218,74,9,1),(219,75,9,1),(228,83,5,1),(235,84,30,1),(246,88,5,1),(249,89,21,1),(250,90,21,1),(254,92,21,1),(261,96,9,1),(263,20,6,1),(264,98,30,1),(265,99,30,1),(266,99,5,1),(267,98,5,1),(269,100,9,1),(273,102,33,1),(274,103,5,1),(275,104,6,1),(278,107,9,1),(280,107,12,1),(281,108,12,1),(282,108,9,1),(285,10,9,1),(289,109,9,1),(292,95,21,1),(293,110,5,1),(294,111,5,1),(295,112,5,1),(296,113,5,1),(297,114,5,1),(298,115,6,1),(299,116,5,1),(300,117,5,1),(301,35,9,1),(303,81,22,1),(304,76,22,1),(305,88,22,1),(306,77,22,1),(307,92,22,1),(308,42,22,1),(309,107,22,1),(310,118,5,1),(311,119,5,1),(312,120,5,1),(313,121,6,1),(314,122,6,1),(319,35,6,1),(328,124,6,1),(329,77,23,1),(330,92,23,1);
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-18 11:55:32

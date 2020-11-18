-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: simklinik
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `log_print_billing`
--

DROP TABLE IF EXISTS `log_print_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_print_billing` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `no_billing` varchar(150) NOT NULL,
  `jenis_dokumen` enum('billing','kwitansi') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `penerima` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `no_billing` (`no_billing`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_print_billing`
--

LOCK TABLES `log_print_billing` WRITE;
/*!40000 ALTER TABLE `log_print_billing` DISABLE KEYS */;
INSERT INTO `log_print_billing` VALUES (1,'IBK/2011/00009','billing','2020-11-18 04:08:17',1,NULL),(2,'IBK/2011/00009','billing','2020-11-18 04:08:30',1,NULL),(3,'IBK/2011/00009','billing','2020-11-18 04:09:12',1,NULL),(4,'IBK/2011/00009','billing','2020-11-18 04:09:15',1,NULL),(5,'IBK/2011/00009','billing','2020-11-18 04:09:17',1,NULL),(6,'IBK/2011/00009','billing','2020-11-18 04:09:20',1,NULL),(7,'IBK/2011/00009','billing','2020-11-18 04:12:09',1,NULL),(8,'IBK/2011/00009','billing','2020-11-18 04:13:56',1,NULL),(9,'IBK/2011/00009','billing','2020-11-18 04:13:57',1,NULL),(10,'IBK/2011/00009','billing','2020-11-18 04:14:00',1,NULL),(11,'IBK/2011/00009','billing','2020-11-18 04:14:02',1,NULL),(49,'IBK/2011/00008','billing','2020-11-18 05:55:27',1,NULL),(50,'IBK/2011/00008','billing','2020-11-18 05:55:55',1,NULL),(51,'IBK/2011/00008','billing','2020-11-18 05:56:11',1,NULL),(52,'IBK/2011/00008','billing','2020-11-18 05:56:27',1,NULL),(53,'IBK/2011/00008','billing','2020-11-18 05:56:43',1,NULL),(54,'IBK/2011/00008','billing','2020-11-18 05:57:05',1,NULL),(55,'IBK/2011/00008','billing','2020-11-18 06:01:57',1,NULL),(56,'IBK/2011/00008','billing','2020-11-18 06:05:52',1,NULL),(57,'IBK/2011/00008','billing','2020-11-18 06:12:50',1,NULL),(58,'IBK/2011/00008','billing','2020-11-18 06:13:21',1,NULL),(59,'IBK/2011/00008','billing','2020-11-18 06:14:28',1,NULL),(60,'IBK/2011/00008','billing','2020-11-18 06:15:42',1,NULL),(61,'IBK/2011/00008','billing','2020-11-18 06:20:10',1,NULL),(62,'IBK/2011/00008','billing','2020-11-18 06:20:26',1,NULL),(63,'IBK/2011/00008','billing','2020-11-18 06:20:57',1,NULL),(64,'IBK/2011/00008','billing','2020-11-18 06:21:15',1,NULL),(65,'IBK/2011/00008','billing','2020-11-18 06:22:13',1,NULL),(66,'IBK/2011/00008','billing','2020-11-18 06:26:08',1,NULL),(67,'IBK/2011/00008','billing','2020-11-18 06:30:11',1,NULL),(68,'IBK/2011/00008','billing','2020-11-18 06:30:46',1,NULL),(69,'IBK/2011/00008','billing','2020-11-18 06:31:25',1,NULL),(70,'IBK/2011/00008','billing','2020-11-18 06:32:01',1,NULL),(71,'IBK/2011/00008','billing','2020-11-18 06:32:43',1,NULL),(72,'IBK/2011/00008','billing','2020-11-18 06:33:11',1,NULL),(73,'IBK/2011/00008','billing','2020-11-18 06:34:17',1,NULL),(74,'IBK/2011/00008','billing','2020-11-18 06:35:32',1,NULL),(75,'IBK/2011/00008','billing','2020-11-18 06:36:59',1,NULL),(76,'IBK/2011/00008','billing','2020-11-18 06:41:05',1,NULL),(77,'IBK/2011/00008','billing','2020-11-18 06:42:50',1,NULL),(78,'IBK/2011/00008','billing','2020-11-18 06:48:41',1,NULL),(79,'IBK/2011/00008','billing','2020-11-18 06:48:57',1,NULL),(80,'IBK/2011/00008','billing','2020-11-18 06:51:19',1,NULL),(81,'IBK/2011/00008','billing','2020-11-18 06:52:04',1,NULL),(82,'IBK/2011/00008','billing','2020-11-18 06:52:38',1,NULL),(83,'IBK/2011/00008','billing','2020-11-18 06:53:22',1,NULL),(84,'IBK/2011/00008','billing','2020-11-18 06:53:41',1,NULL),(85,'IBK/2011/00008','billing','2020-11-18 06:54:38',1,NULL),(86,'IBK/2011/00008','billing','2020-11-18 06:55:14',1,NULL),(87,'IBK/2011/00008','billing','2020-11-18 06:55:40',1,NULL),(88,'IBK/2011/00008','billing','2020-11-18 06:58:22',1,NULL),(89,'IBK/2011/00008','billing','2020-11-18 06:59:50',1,NULL),(90,'IBK/2011/00008','billing','2020-11-18 07:00:39',1,NULL),(91,'IBK/2011/00008','billing','2020-11-18 07:01:01',1,NULL),(92,'IBK/2011/00008','billing','2020-11-18 07:01:37',1,NULL),(93,'IBK/2011/00008','billing','2020-11-18 07:02:52',1,NULL),(94,'IBK/2011/00008','billing','2020-11-18 07:03:13',1,NULL),(95,'IBK/2011/00006','billing','2020-11-18 08:35:38',1,NULL),(96,'IBK/2011/00005','billing','2020-11-18 08:36:03',1,NULL),(97,'IBK/2011/00005','billing','2020-11-18 09:17:24',1,NULL),(98,'IBK/2011/00005','billing','2020-11-18 09:26:54',1,NULL),(99,'IBK/2011/00005','kwitansi','2020-11-18 09:28:18',1,NULL),(100,'IBK/2011/00005','kwitansi','2020-11-18 09:29:09',1,NULL),(101,'IBK/2011/00005','billing','2020-11-18 09:32:44',1,NULL),(102,'IBK/2011/00005','kwitansi','2020-11-18 09:48:38',1,'Abidin'),(103,'IBK/2011/00005','kwitansi','2020-11-18 09:49:01',1,'Udin'),(104,'IBK/2011/00005','kwitansi','2020-11-18 10:00:26',1,'andi wijaya'),(105,'IBK/2011/00005','billing','2020-11-18 10:03:24',1,''),(106,'IBK/2011/00005','billing','2020-11-18 10:36:05',1,''),(107,'IBK/2011/00005','kwitansi','2020-11-18 10:38:44',1,'Erina'),(108,'IBK/2011/00005','kwitansi','2020-11-18 10:39:19',1,'Jumriah Sanusi'),(109,'','kwitansi','2020-11-18 10:57:10',1,'arial'),(110,'IBK/2011/00005','kwitansi','2020-11-18 11:00:00',1,'asiap'),(111,'IBK/2011/00005','kwitansi','2020-11-18 11:00:20',1,'asiap'),(112,'IBK/2011/00005','kwitansi','2020-11-18 11:04:42',1,'Subasa'),(113,'IBK/2011/00005','kwitansi','2020-11-18 11:06:32',1,'siman'),(114,'IBK/2011/00005','kwitansi','2020-11-18 11:07:07',1,'smina'),(115,'IBK/2011/00005','kwitansi','2020-11-18 11:07:33',1,'sdsd'),(116,'IBK/2011/00005','kwitansi','2020-11-18 11:08:24',1,'dfdf'),(117,'IBK/2011/00005','kwitansi','2020-11-18 11:09:34',1,'ree'),(118,'IBK/2011/00005','kwitansi','2020-11-18 11:10:45',1,'dsfsdf'),(119,'IBK/2011/00005','kwitansi','2020-11-18 11:11:23',1,''),(120,'IBK/2011/00005','kwitansi','2020-11-18 11:12:39',1,'tererer'),(121,'IBK/2011/00005','kwitansi','2020-11-18 11:14:03',1,'tersds'),(122,'IBK/2011/00005','kwitansi','2020-11-18 11:17:22',1,'Amin Saipudin'),(123,'IBK/2011/00005','billing','2020-11-18 11:18:48',1,''),(124,'IBK/2011/00005','billing','2020-11-18 11:23:28',1,''),(125,'IBK/2011/00005','billing','2020-11-18 11:27:04',1,''),(126,'IBK/2011/00005','billing','2020-11-18 11:28:05',1,''),(127,'IBK/2011/00005','billing','2020-11-18 11:28:27',1,''),(128,'IBK/2011/00005','billing','2020-11-18 11:28:51',1,''),(129,'IBK/2011/00005','billing','2020-11-18 11:29:09',1,''),(130,'IBK/2011/00005','billing','2020-11-18 11:29:51',1,''),(131,'IBK/2011/00005','billing','2020-11-18 11:33:35',1,''),(132,'IBK/2011/00005','billing','2020-11-18 11:39:13',1,''),(133,'IBK/2011/00005','billing','2020-11-18 11:40:56',1,''),(134,'IBK/2011/00005','billing','2020-11-18 11:41:23',1,''),(135,'IBK/2011/00005','billing','2020-11-18 11:42:58',1,''),(136,'IBK/2011/00005','kwitansi','2020-11-18 11:48:03',1,''),(137,'IBK/2011/00005','billing','2020-11-18 11:51:42',1,''),(138,'IBK/2011/00005','kwitansi','2020-11-18 11:52:54',1,''),(139,'IBK/2011/00005','kwitansi','2020-11-18 11:58:17',1,'Amin Saipudin'),(140,'IBK/2011/00005','kwitansi','2020-11-18 12:16:33',1,'amin'),(141,'IBK/2011/00005','kwitansi','2020-11-18 12:23:33',1,'amin'),(142,'IBK-20-11-00002','billing','2020-11-18 12:35:42',1,''),(143,'IBK-20-11-00002','billing','2020-11-18 12:36:14',1,''),(144,'IBK-20-11-00002','kwitansi','2020-11-18 12:36:42',1,'Monkey D.');
/*!40000 ALTER TABLE `log_print_billing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 19:41:27

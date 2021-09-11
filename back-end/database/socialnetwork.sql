-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: socialnetwork
-- ------------------------------------------------------
-- Server version	5.6.51-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `pseudo` varchar(45) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `PostId` (`PostId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`PostId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (9,'bientot les lox en tant que familier','Administrateur','2021-09-10 20:45:07','2021-09-10 20:45:07',30,10),(11,'trés belle photo , si vous avez besoin d\'aide n\'hesiter pas ','Administrateur','2021-09-10 20:50:08','2021-09-10 20:50:08',30,13);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `PostId` (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (10,'2021-07-01 13:58:22','2021-07-01 13:58:22',14,14),(11,'2021-07-05 11:55:53','2021-07-05 11:55:53',15,8),(17,'2021-07-17 12:57:32','2021-07-17 12:57:32',16,10),(18,'2021-07-17 13:02:39','2021-07-17 13:02:39',14,10),(19,'2021-07-17 14:57:07','2021-07-17 14:57:07',15,10),(21,'2021-08-13 14:08:26','2021-08-13 14:08:26',15,12),(23,'2021-08-20 14:28:17','2021-08-20 14:28:17',24,10),(25,'2021-09-09 16:12:39','2021-09-09 16:12:39',18,15),(27,'2021-09-11 12:45:07','2021-09-11 12:45:07',30,14),(28,'2021-09-11 12:49:05','2021-09-11 12:49:05',18,13),(29,'2021-09-11 12:49:09','2021-09-11 12:49:09',18,10);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (10,'On espère tous avec la mise à jour , pouvoir faire ceci un jour !!!! ',NULL,'http://localhost:3000/upload/lox1625486086297.png','2021-07-05 11:54:46','2021-07-05 11:54:46',15),(13,'Petite pause avec notre admin Smouche en haut Inazuma',NULL,'http://localhost:3000/upload/20217302246401631306909651.png','2021-09-10 20:48:29','2021-09-10 20:48:29',18);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bio` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'Freezer','friza@gmail.com','$2a$10$oZ2W0vLfegpJVWpd3REACuIPTiw.Mm/DRoVAgHUfI6FYv9KLIks7i','http://localhost:3000/upload/static-assets-upload77202205850361958461625499341186.png','Tyran galactique:\r\nCombattant redoutable, sans scrupules.\r\npsychopathe, qui savoure la mort d\'autrui et la destruction.\r\n un ego immense',0,'2021-07-05 11:53:08','2021-07-05 15:43:28'),(18,'Shake_ton_body','Shake@gmail.com','$2a$10$1eKuAnxb3UQ/RiHzk/WQW.e3e18Yk4zQtxYs62nhQra7l7Z/cGLPy','http://localhost:3000/upload/images1629212726237.jpg','Charismatique et breakdancer , je suis une véritable fine lame .\r\nMa passion se porte sur les femmes. \r\nOn me surnomme souvent le faucheur noir.\r\nJe n\'hésite pas désobéir à mes supérieurs , pour obtenir les informations dont j\'ai besoin. ',0,'2021-08-17 15:00:49','2021-08-17 15:24:18'),(19,'Guigui_boss_de_fin','guigui@gmail.com','$2a$10$hQToxBHdwMcB7rtbJ2n8w.DaqRwa.umzXRNBRBOlFCqHSa2A55iU6',NULL,NULL,0,'2021-08-17 15:31:13','2021-08-17 15:31:13'),(22,'Mr_concombre','concombre@gmail.com','$2a$10$NoevfySm7wkU0IE3Nnq2qOokSh1rMKJYkgbh6zNTJ/8744qEBhc9m','http://localhost:3000/upload/indexG1629379582508.jpg','Je suis un gladiateur héroïque, qui a connu la gloire et le pouvoir.  ',0,'2021-08-17 15:32:56','2021-08-19 13:26:22'),(23,'ChingChong','chinchong@gmail.com','$2a$10$PVT01FKCPtGDmMied3I41ekyWfgIZKfIOZTg6Pf52blgY./Gs4IYK',NULL,NULL,0,'2021-08-17 15:33:28','2021-08-17 15:33:28'),(24,'Inquisitrice','bobmae@gmail.com','$2a$10$X2TZxZWI3zfmh0lkTk2TPeC3C2P.hz5Cove.E.OKw8n2f/LLqqQO6','http://localhost:3000/upload/index1629368912712.jpg','Guerrier égoïste, malpoli, prétentieux et énormément sûr de moi.',0,'2021-08-17 15:34:29','2021-08-19 11:31:20'),(25,'Marikea','marie@gmail.com','$2a$10$WTBO4o39OyPEhMuq6e8aHuRpzV7bNkysdoaeoWCEhciUh6qhgOP0S',NULL,NULL,0,'2021-08-17 15:34:53','2021-08-17 15:34:53'),(26,'Panda_sensei','shinra@gmail.com','$2a$10$S6/C0Ury/WB9y/jC5ONTZeQXSvMy9j1sFtafEZZSAHTwEpfovfY.G','http://localhost:3000/upload/imagesK1629380042591.jpg',' Cynique, fier, rusé, rusé et manipulateur.Je déteste et se méfie des humains.',0,'2021-08-17 15:35:30','2021-08-19 13:34:02'),(30,'Administrateur','admin@gmail.com','$2a$10$pna7Tqnq/VfKdVGBbte9POZsUXDWBGfMtzVV01d9hayKLJRgUBCym',NULL,NULL,1,'2021-09-02 12:45:16','2021-09-02 12:45:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-11 15:12:31

-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
  `userId` int(11) NOT NULL,
  `postid` varchar(45) NOT NULL,
  `text` varchar(255) NOT NULL,
  `createdate` datetime NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (46,64,'70','super publication tom 70 !','2022-05-05 21:23:25','bambiroud'),(49,63,'75','ddfdfdfdfdfdfdfdfdfdfdfd','2022-05-06 18:36:12','Tom'),(50,63,'75','dfsdkjfdskjlfsdfsdfdsfsdfdsfsdfs','2022-05-06 18:36:24','Tom'),(51,63,'75','ffsdfdsfsddfsfdsfds','2022-05-09 03:39:17','Tom'),(53,65,'76','dsfdsfsdfdsfsdfsdfdsfdsfsdfdsfsdfdsfdsfsdfsdfsdfsdfsdfsdfsdfsdfsd','2022-05-09 14:25:08','test pour soutenance'),(59,65,'76','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2022-05-09 14:48:28','test pour soutenance'),(60,65,'76','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2022-05-09 14:48:29','test pour soutenance'),(61,65,'74','dfdfdfdfdfdfdfdfdfdfd','2022-05-09 15:03:19','test pour soutenance'),(62,65,'75','dfdfdfdfdfdfdfdfdfd','2022-05-09 15:03:33','test pour soutenance'),(63,61,'79','dfgfdsfsfsd','2022-05-09 16:38:25','tomzzzz'),(66,61,'80','dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd','2022-05-09 16:41:40','tomzzzz');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `text` varchar(500) NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (67,62,'zddsgdsgdfsgdsgdsgsdgdsgsdgdsgsdgsd','2022-05-05 12:42:34'),(68,62,'dfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsd','2022-05-05 19:33:29'),(69,62,'dfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsddfsgdfsgsd','2022-05-05 19:35:42'),(70,63,'dgsddfsgsdgsdfgsdgdsfgfdsgdfsgdsfgsdf','2022-05-05 20:03:46'),(74,61,'fgfdgfdgfdgfdgdfgfdgdfgfdg','2022-05-05 22:08:28'),(75,61,'dffdsfdsdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds','2022-05-06 18:34:02'),(79,61,'dfdfdfdfdfdfdfdfdfdfdfdfd','2022-05-09 16:37:56'),(80,61,'dfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfd','2022-05-09 16:38:44'),(81,61,'dfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfdfd','2022-05-09 16:43:09'),(82,64,'fgsfdfgdsfdsfdsfdsfdsfdsfdsfsdfsd','2022-05-09 17:06:27');
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
  `name` varchar(45) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profilpicture` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (61,'tomzzzz','test@****.test','$2b$15$uakHDQoIfJW7g9JVUyeWD.yvFnNXsWffQtpoBo7.arTt.33NAdkUq',NULL,1),(63,'Tom','tom@**m.tom','$2b$15$omWaI3LJROh3CamyQN0gzOnEem1nrQRqRU/cT06gG3kpOGFMke.Nq',NULL,0),(64,'bambiroud','bambi****@****.test','$2b$15$WjEnidEIEX1KofgoNkTLIOLVuNvGbPbwsXpU4R.oYUzALsg.u2XC6',NULL,0),(65,'test pour soutenance','video@******video','$2b$15$SfXuSNluz4l..eqV3u8xT.14.cAl3W03FaB93tGh2VQgux2PHYoEC',NULL,0);
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

-- Dump completed on 2022-05-09 17:23:14

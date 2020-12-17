-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: resort
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acts`
--

DROP TABLE IF EXISTS `acts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `open_from` varchar(5) DEFAULT NULL,
  `open_till` varchar(5) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `acts_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acts`
--

LOCK TABLES `acts` WRITE;
/*!40000 ALTER TABLE `acts` DISABLE KEYS */;
/*!40000 ALTER TABLE `acts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifts`
--

DROP TABLE IF EXISTS `lifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `open_from` varchar(5) DEFAULT NULL,
  `open_till` varchar(5) DEFAULT NULL,
  `night_open_from` varchar(5) DEFAULT NULL,
  `night_open_till` varchar(5) DEFAULT NULL,
  `summer` tinyint(1) DEFAULT NULL,
  `add_time` varchar(50) DEFAULT NULL,
  `add_time_open_from` varchar(5) DEFAULT NULL,
  `add_time_open_till` varchar(5) DEFAULT NULL,
  `last_up0` varchar(50) DEFAULT NULL,
  `last_up0_open_from` varchar(5) DEFAULT NULL,
  `last_up0_open_till` varchar(5) DEFAULT NULL,
  `last_up1` varchar(50) DEFAULT NULL,
  `last_up1_open_from` varchar(5) DEFAULT NULL,
  `last_up1_open_till` varchar(5) DEFAULT NULL,
  `last_up2` varchar(50) DEFAULT NULL,
  `last_up2_open_from` varchar(5) DEFAULT NULL,
  `last_up2_open_till` varchar(5) DEFAULT NULL,
  `last_up3` varchar(50) DEFAULT NULL,
  `last_up3_open_from` varchar(5) DEFAULT NULL,
  `last_up3_open_till` varchar(5) DEFAULT NULL,
  `length` int DEFAULT NULL,
  `night` varchar(10) DEFAULT 'off',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `lifts_chk_1` CHECK ((`inactive` in (0,1))),
  CONSTRAINT `lifts_chk_3` CHECK ((`summer` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifts`
--

LOCK TABLES `lifts` WRITE;
/*!40000 ALTER TABLE `lifts` DISABLE KEYS */;
INSERT INTO `lifts` VALUES (1,'ОЛИМПИЯ','OLIMPIA','2020-12-17 11:07:35.808553','rosa',0,'OO','TC','07:30','23:45','19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2341,'on'),(2,'ЗАПОВЕДНЫЙ ЛЕС','ZAPOVEDNYY LES','2020-12-17 11:07:35.856843','rosa',0,'OO','TC','07:30','16:30','19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1541,'on'),(3,'КАВКАЗСКИЙ ЭКСПРЕСС ВЫШЕ 1600','KAVKAZSKIY EXPRESS ABOVE 1600','2020-12-17 11:07:35.903319','rosa',0,'C','TC','08:35','16:45','19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'on'),(4,'КАВКАЗСКИЙ ЭКСПРЕСС НИЖЕ 1600','KAVKAZSKIY EXPRESS BELOW 1600','2020-12-17 04:27:42.516478','rosa',0,'O','TC','08:35','16:45','19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'off'),(5,'СТРЕЛА','STRELA','2020-12-17 04:27:42.559391','rosa',0,'O','TC','08:30','15:20','19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3838,'off'),(6,'КВАРТЕТ','KVARTET','2020-12-09 16:57:53.560941','root',0,'C','TS','08:40','16:30','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'off'),(7,'СОЛО','SOLO','2020-12-09 16:57:53.577783','root',0,'C','TR','07:45','16:45','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'off'),(8,'БЕСЕДА','BESEDA','2020-12-09 16:57:53.609102','root',0,'C','TS','08:30','16:00','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1502,'off'),(9,'ДРИАДА','DRIADA','2020-12-09 16:57:53.623951','root',0,'C','TC','08:30','16:10','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2145,'off'),(10,'ТУНДРА','TUNDRA','2020-12-09 16:57:53.639585','root',0,'C','TC','08:45','15:45','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1534,'off'),(11,'ШАЛЕ','CHALET','2020-12-09 16:57:53.673082','root',0,'C','TS','19:00','22:45','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,836,'off'),(12,'ЮВЕНТА','JUVENTA','2020-12-09 16:57:53.688539','root',0,'C','TK','08:30','22:45','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,277,'off'),(13,'ЭКСТРИМ','EXTREME','2020-12-09 16:57:53.704490','root',0,'C','TS','08:30','16:30','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,954,'off'),(14,'КРОКУС','KROKUS','2020-12-09 16:57:53.719706','root',0,'P','TS','09:30','15:10','19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1041,'off'),(15,'ПАРК 1','PARK 1','2020-12-09 16:57:53.753285','root',0,'C','TK','09:00','16:00','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,'off'),(16,'ПАРК 2','PARK 2','2020-12-09 16:57:53.768122','root',0,'C','TK','09:00','16:00','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,165,'off'),(17,'БУГЕЛЬ 1600-1','TOW LIFT 1600-1','2020-12-09 16:57:53.782903','root',0,'C','TK','09:00','16:00','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,'off'),(18,'БУГЕЛЬ 1600-2','TOW LIFT 1600-2','2020-12-09 16:57:53.796891','root',0,'C','TK','09:00','16:00','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'off'),(19,'УЧЕБНЫЙ СКЛОН 1','TRAINING SLOPE 1','2020-12-09 16:57:53.811246','root',0,'C','TR','08:30','22:45','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,141,'off'),(20,'УЧЕБНЫЙ СКЛОН 2','TRAINING SLOPE 2','2020-12-09 16:57:53.825429','root',0,'C','TR','08:30','22:45','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105,'off'),(21,'ДЕТСКИЙ СКЛОН','KIDS SLOPE','2020-12-09 16:57:53.839848','root',0,'C','TR','09:00','16:30','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71,'off'),(22,'ТЮБИНГ','TUBING','2020-12-09 16:57:53.853979','root',0,'C','TK','10:00','22:00','19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240,'off');
/*!40000 ALTER TABLE `lifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slopes`
--

DROP TABLE IF EXISTS `slopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slopes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `open_from` varchar(5) DEFAULT NULL,
  `open_till` varchar(5) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `length` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `south` tinyint(1) DEFAULT NULL,
  `night_open_from` varchar(5) DEFAULT '19:00',
  `night_open_till` varchar(5) DEFAULT '23:45',
  `night` varchar(10) DEFAULT 'off',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `slopes_chk_1` CHECK ((`inactive` in (0,1))),
  CONSTRAINT `slopes_chk_3` CHECK ((`south` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slopes`
--

LOCK TABLES `slopes` WRITE;
/*!40000 ALTER TABLE `slopes` DISABLE KEYS */;
INSERT INTO `slopes` VALUES (1,'АИБГА','AIBGA','2020-12-17 12:36:28.023574','rosa',0,'C','B','08:40','16:00','D',1035,144,0,'19:00','23:45','on'),(2,'АРБОР','ARBOR','2020-12-17 15:14:23.752930','rosa',0,'C','B','08:30','16:20','R',1910,0,0,'19:00','23:45','off'),(3,'Б 52 ВЫШЕ 1350','B 52 ABOVE 1350','2020-12-17 12:36:28.066488','rosa',0,'C','B','08:40','16:00','G',2000,250,0,'19:00','23:45','off'),(4,'Б 52 НИЖЕ 1350','B 52 BELOW 1350','2020-12-17 04:10:47.016569','rosa',0,'C','B','07:30','16:20','G',2050,180,0,'19:00','23:45','off'),(5,'БОРЕЙ ВЫШЕ 1295','BOREY ABOVE 1295','2020-12-17 04:10:47.042095','rosa',0,'C','B','08:30','16:20','B',690,0,0,'19:00','23:45','off'),(6,'БОРЕЙ НИЖЕ 1295','BOREY BELOW 1295','2020-12-16 09:17:28.782403','rosa',0,'C','B','08:30','16:20','B',330,0,0,'19:00','23:45','on'),(7,'БУМЕРАНГ','BUMERANG','2020-12-16 10:48:58.858543','rosa',0,'C','B','09:00','16:20','B',310,72,0,'19:00','23:45','off'),(8,'ШАЛЕ','CHALET','2020-12-16 09:17:28.847973','rosa',0,'C','B','19:00','22:45','G',950,0,0,'19:00','23:45','on'),(9,'ШАМОНИ 24','CHAMONIX 24','2020-12-16 09:17:28.883714','rosa',0,'C','B','07:30','16:45','B',1905,410,0,'19:00','23:45','on'),(10,'КРЭЙЗИ ХУТОР ВЫШЕ 1400','CRAZY KHUTOR ABOVE 1400','2020-12-16 09:17:28.917044','rosa',0,'C','B','09:00','16:00','D',3000,895,0,'19:00','23:45','on'),(11,'КРЭЙЗИ ХУТОР НИЖЕ 1400','CRAZY KHUTOR BELOW 1400','2020-12-16 09:17:28.949981','rosa',0,'C','B','09:00','16:00','D',1650,306,0,'19:00','23:45','on'),(12,'ЭХО','EHKHO','2020-12-16 09:17:28.983540','rosa',0,'C','B','08:30','16:20','R',755,0,0,'19:00','23:45','on'),(13,'ГОРИЗОНТ ВЫШЕ 1600','GORIZONT ABOVE 1600','2020-12-16 09:17:29.016532','rosa',0,'C','B','08:50','16:00','B',4550,720,0,'19:00','23:45','on'),(14,'ГОРИЗОНТ НИЖЕ 1600','GORIZONT BELOW 1600','2020-12-16 10:48:59.058400','rosa',0,'C','B','08:30','16:00','B',2710,660,0,'19:00','23:45','off'),(15,'ЮВЕНТА','JUVENTA','2020-12-16 09:17:29.080039','rosa',0,'C','B','08:30','22:45','G',285,41,0,'19:00','23:45','on'),(16,'КАСКАД ВЫШЕ 1600','KASKAD ABOVE 1600','2020-12-16 09:17:29.112756','rosa',0,'C','B','08:40','16:00','R',2920,506,0,'19:00','23:45','on'),(17,'КАСКАД НИЖЕ 1600','KASKAD BELOW 1600','2020-12-16 09:17:29.145533','rosa',0,'C','B','08:40','16:00','R',1480,660,0,'19:00','23:45','on'),(18,'ДЕТСКИЙ СКЛОН','KIDS SLOPE','2020-12-16 09:17:29.178322','rosa',0,'C','B','09:00','16:30','G',80,0,0,'19:00','23:45','on'),(19,'КВАРТЕТ','KVARTET','2020-12-16 09:17:29.210236','rosa',0,'C','B','09:00','16:20','D',790,0,0,'19:00','23:45','on'),(20,'ЛАБИРИНТ ВЫШЕ 1400','LABIRINT ABOVE 1400','2020-12-16 09:17:29.242553','rosa',0,'C','B','08:50','16:30','B',1900,244,0,'19:00','23:45','on'),(21,'ЛАБИРИНТ НИЖЕ 1400','LABIRINT BELOW 1400','2020-12-16 09:17:29.274612','rosa',0,'C','B','08:50','16:30','B',1350,460,0,'19:00','23:45','on'),(22,'МУЖСКОЙ ОЛИМПИЙСКИЙ СПУСК ВЫШЕ 1600','MUZHSKOY OLYMPIC ABOVE 1600','2020-12-16 09:17:29.306575','rosa',0,'C','B','08:40','16:00','D',1336,445,0,'19:00','23:45','on'),(23,'МУЖСКОЙ ОЛИМПИЙСКИЙ СПУСК НИЖЕ 1600','MUZHSKOY OLYMPIC BELOW 1600','2020-12-16 09:17:29.339170','rosa',0,'C','B','07:30','16:00','D',1780,630,0,'19:00','23:45','on'),(24,'НАГАНО 98','NAGANO 98','2020-12-16 09:17:29.371201','rosa',0,'C','B','07:30','16:45','B',2000,415,0,'19:00','23:45','on'),(25,'ОБЕР ХУТОР ВЫШЕ 1600','OBER KHUTOR ABOVE 1600','2020-12-16 09:17:29.403040','rosa',0,'C','B','08:50','16:00','R',1935,630,0,'19:00','23:45','on'),(26,'ОБЕР ХУТОР НИЖЕ 1600','OBER KHUTOR BELOW 1600','2020-12-16 09:17:29.436657','rosa',0,'C','B','08:40','16:30','R',2580,494,0,'19:00','23:45','on'),(27,'ОРЕЛ','OREL','2020-12-16 09:17:29.470230','rosa',0,'C','B','07:30','16:30','D',1000,289,0,'19:00','23:45','on'),(28,'ОЗЕРНАЯ','OZERNAYA','2020-12-16 09:17:29.502613','rosa',0,'C','B','07:30','16:30','B',2200,415,0,'19:00','23:45','on'),(29,'ПЛАТО','PLATO','2020-12-16 09:17:29.534914','rosa',0,'C','B','07:30','16:30','G',2055,180,0,'19:00','23:45','on'),(30,'РОЗА СТАР','ROSA STAR','2020-12-16 09:17:29.567827','rosa',0,'C','B','08:30','16:30','R',1075,179,0,'19:00','23:45','on'),(31,'РОЗА БЛЕЙД','ROSA X BLADE','2020-12-16 09:17:29.601975','rosa',0,'C','B','08:30','16:30','B',1700,212,0,'19:00','23:45','on'),(32,'СНОУПАРК НА РОЗА 1600','SNOW PARK AT ROSA 1600','2020-12-16 09:17:29.633753','rosa',0,'C','S','09:00','16:00','R',725,100,0,'19:00','23:45','on'),(33,'СНОУПАРК','SNOW PARK','2020-12-16 09:17:29.665631','rosa',0,'C','S','09:00','16:00','R',945,0,0,'19:00','23:45','on'),(34,'ПАРК THE STASH','THE STASH PARK','2020-12-16 09:17:29.698327','rosa',0,'C','S','09:00','16:00','R',975,0,0,'19:00','23:45','on'),(35,'ТРАССА ДЛЯ САНОК','TOBOGGAN','2020-12-17 15:14:24.539697','rosa',0,'C','L','00:00','23:59','G',2000,0,0,'19:00','23:45','on'),(36,'ТУРИН 06','TORINO 06','2020-12-16 09:17:29.762661','rosa',0,'C','B','07:30','16:30','B',800,81,0,'19:00','23:45','on'),(37,'УЧЕБНЫЙ СКЛОН','TRAINING SLOPE','2020-12-16 09:17:29.795109','rosa',0,'C','B','08:30','22:45','G',290,0,0,'19:00','23:45','on'),(38,'ТРИТОН ВЫШЕ 2000','TRITON ABOVE 2000','2020-12-16 09:17:29.827357','rosa',0,'C','B','08:40','16:00','B',1795,320,0,'19:00','23:45','on'),(39,'ТРИТОН НИЖЕ 1600','TRITON BELOW 1600','2020-12-16 09:17:29.858997','rosa',0,'C','B','08:30','16:30','B',2045,250,0,'19:00','23:45','on'),(40,'ТРИТОН МЕЖДУ 1600 И 2000','TRITON MIDDLE 1600','2020-12-16 09:17:29.890729','rosa',0,'C','B','08:40','16:00','B',2525,400,0,'19:00','23:45','on'),(41,'ТЮБИНГ','TUBING','2020-12-16 09:17:29.922440','rosa',0,'C','L','10:00','22:00','G',155,18,0,'19:00','23:45','on'),(42,'ВАНКУВЕР 10','VANCOUVER 10','2020-12-16 09:17:29.953914','rosa',0,'C','B','07:30','16:45','B',2010,410,0,'19:00','23:45','on'),(43,'ВИРАЖ ВЫШЕ 1800','VIRAZH ABOVE 1800','2020-12-16 09:17:29.985874','rosa',0,'C','B','08:40','16:00','R',1275,291,0,'19:00','23:45','on'),(44,'ВИРАЖ НИЖЕ 1800','VIRAZH BELOW 1800','2020-12-16 09:17:30.018416','rosa',0,'C','B','08:40','16:00','R',1070,0,0,'19:00','23:45','on'),(45,'ВСТРЕЧА','VSTRECHA','2020-12-16 09:17:30.050359','rosa',0,'C','B','07:30','16:30','B',450,59,0,'19:00','23:45','on'),(46,'ЮРЬЕВ ХУТОР','YUREV KHUTOR','2020-12-16 09:17:30.082160','rosa',0,'C','B','08:50','16:00','D',2020,676,0,'19:00','23:45','on'),(47,'ЖЕНСКИЙ ОЛИМПИЙСКИЙ СПУСК ВЫШЕ 1600','ZHENSKIY OLYMPIC A','2020-12-16 09:17:30.113905','rosa',0,'C','B','08:40','16:00','D',368,155,0,'19:00','23:45','on'),(48,'ЖЕНСКИЙ ОЛИМПИЙСКИЙ СПУСК НИЖЕ 1600','ZHENSKIY OLYMPIC B','2020-12-16 09:17:30.146351','rosa',0,'C','B','08:30','16:30','D',2532,635,0,'19:00','23:45','on'),(49,'ЗМЕЙКА ВЫШЕ 1665','ZMEIKA ABOVE 1665','2020-12-16 09:17:30.178177','rosa',0,'C','B','08:30','16:00','B',965,297,0,'19:00','23:45','on'),(50,'ЗМЕЙКА НИЖЕ 1665','ZMEIKA BELOW 1665','2020-12-16 09:17:30.210531','rosa',0,'C','B','00:00','23:59','B',655,0,0,'19:00','23:45','on'),(51,'АДОНИС','ADONIS','2020-12-16 09:17:30.242428','rosa',0,'C','A','09:30','15:00','R',660,0,1,'19:00','23:45','on'),(52,'АЛЬПИКА','ALPIKA','2020-12-16 09:17:30.274970','rosa',0,'C','A','08:50','15:00','R',2500,0,1,'19:00','23:45','on'),(53,'АЗАЛИЯ ВЫШЕ 1535','AZALIA ABOVE 1535','2020-12-16 09:17:30.307452','rosa',0,'C','A','09:30','15:00','G',1070,0,1,'19:00','23:45','on'),(54,'АЗАЛИЯ НИЖЕ 1535','AZALIA BELOW 1535','2020-12-16 09:17:30.339425','rosa',0,'C','A','09:30','15:00','G',410,0,1,'19:00','23:45','on'),(55,'ФИАЛКА','FIALKA','2020-12-16 09:17:30.371438','rosa',0,'C','A','09:30','15:00','B',1540,278,1,'19:00','23:45','on'),(56,'ГОРИЦВЕТ','GORITSVET','2020-12-16 09:17:30.403190','rosa',0,'C','A','09:30','16:00','B',375,0,1,'19:00','23:45','on'),(57,'НАЯДА','NAYADA','2020-12-16 09:17:30.436125','rosa',0,'C','A','09:30','15:00','D',850,0,1,'19:00','23:45','on'),(58,'ОРЕАДА','OREADA','2020-12-16 09:17:30.467868','rosa',0,'C','A','09:30','15:00','R',940,0,1,'19:00','23:45','on'),(59,'ПАНОРАМА','PANORAMA','2020-12-16 09:17:30.499647','rosa',0,'C','A','09:30','15:00','B',5015,0,1,'19:00','23:45','on'),(60,'ПРИМАВЕРА','PRIMAVERA','2020-12-16 09:17:30.531703','rosa',0,'C','A','09:30','15:00','R',1615,0,1,'19:00','23:45','on'),(61,'ПРИМУЛА ВЫШЕ 1940','PRIMULA ABOVE 1940','2020-12-16 09:17:30.563682','rosa',0,'C','A','09:30','15:00','R',2215,534,1,'19:00','23:45','on'),(62,'ПРИМУЛА НИЖЕ 1940','PRIMULA BELOW 1940','2020-12-16 09:17:30.595318','rosa',0,'C','A','09:30','15:00','R',1040,195,1,'19:00','23:45','on'),(63,'СТОРОЖКА','STOROGKA','2020-12-16 09:17:30.627485','rosa',0,'C','A','09:30','15:00','R',2465,0,1,'19:00','23:45','on'),(64,'ВЕРОНИКА','VERONIKA','2020-12-16 09:17:30.659194','rosa',0,'C','A','09:30','15:00','D',375,200,1,'19:00','23:45','on'),(65,'ЯВОР 2','YAVOR 2','2020-12-16 09:17:30.692326','rosa',0,'C','A','09:30','15:00','G',3250,0,1,'19:00','23:45','on'),(66,'ЯВОР ВЫШЕ 2220','YAVOR ABOVE 2220','2020-12-16 09:17:30.724336','rosa',0,'C','A','09:30','15:00','G',1005,100,1,'19:00','23:45','on'),(67,'ЯВОР НИЖЕ 2120','YAVOR BELOW 2120','2020-12-16 09:17:30.757343','rosa',0,'C','A','09:30','15:00','G',4240,2120,1,'19:00','23:45','on'),(68,'ЯВОР МЕЖДУ 2120 И 2220','YAVOR MIDDLE 2120','2020-12-16 09:17:30.789311','rosa',0,'C','A','09:30','15:00','G',810,100,1,'19:00','23:45','on');
/*!40000 ALTER TABLE `slopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer`
--

DROP TABLE IF EXISTS `summer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_day` int DEFAULT NULL,
  `last_day` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer`
--

LOCK TABLES `summer` WRITE;
/*!40000 ALTER TABLE `summer` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `users_chk_1` CHECK ((`inactive` in (0,1))),
  CONSTRAINT `users_chk_2` CHECK ((`admin` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rosa',NULL,'2020-12-09 12:55:14.831553','root',0,1,'khutor');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valrisk`
--

DROP TABLE IF EXISTS `valrisk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valrisk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valrisk`
--

LOCK TABLES `valrisk` WRITE;
/*!40000 ALTER TABLE `valrisk` DISABLE KEYS */;
INSERT INTO `valrisk` VALUES (1,2);
/*!40000 ALTER TABLE `valrisk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_0_local`
--

DROP TABLE IF EXISTS `weather_0_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_0_local` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT NULL,
  `snow_height` int DEFAULT NULL,
  `snow_height_new` int DEFAULT NULL,
  `snow_date` varchar(20) DEFAULT NULL,
  `snow_avalanche` int DEFAULT NULL,
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  `source` varchar(20) DEFAULT 'yrno',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_0_local_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_0_local`
--

LOCK TABLES `weather_0_local` WRITE;
/*!40000 ALTER TABLE `weather_0_local` DISABLE KEYS */;
INSERT INTO `weather_0_local` VALUES (1,'Роза Долина','ROSA VALLEY','2020-12-17 12:35:56.054290','rosa',0,560,'ПАСМУРНО',6,'ПАСМУРНО',6,1,'W','ВЕСЕННИЙ',118,12,'-',2,0,'-','yrno'),(2,'Роза Стадион','ROSA STADIUM','2020-12-17 15:15:32.314810','rosa',0,960,'ПАСМУРНО',4,'ОБЛАЧНО',-1,1,'W','СВЕЖИЙ',3,2,'',1,0,'-','yrno'),(3,'Горная олимпийская деревня','ALPINE OLYMPIC VILLAGE','2020-12-17 16:16:11.726228','rosa',0,1100,'ПАСМУРНО',0,'ОБЛАЧНО',-1,1,'SW','СВЕЖИЙ',20,10,'',1,0,'-','yrno'),(4,'Роза 1600','ROSA 1600','2020-12-17 15:19:40.644185','rosa',0,1600,'ПАСМУРНО',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-','yrno'),(5,'Роза Пик','ROSA PEAK','2020-12-17 15:19:45.278046','rosa',0,2320,'ПАСМУРНО',-4,'ОБЛАЧНО',-9,1,'W','РЫХЛЫЙ',2,1,'16.10.2020',2,0,'-','yrno'),(6,'Южный склон','SOUTHERN SLOPE','2020-12-17 15:13:16.117319','rosa',0,1925,'ПАСМУРНО',-1,'ОБЛАЧНО',-7,1,'NW','СВЕЖИЙ',2,1,'',1,0,'-','yrno');
/*!40000 ALTER TABLE `weather_0_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_0_yrno`
--

DROP TABLE IF EXISTS `weather_0_yrno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_0_yrno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT NULL,
  `snow_height` int DEFAULT NULL,
  `snow_height_new` int DEFAULT NULL,
  `snow_date` varchar(20) DEFAULT NULL,
  `snow_avalanche` int DEFAULT NULL,
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  `source` varchar(20) DEFAULT 'yrno',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_0_yrno_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_0_yrno`
--

LOCK TABLES `weather_0_yrno` WRITE;
/*!40000 ALTER TABLE `weather_0_yrno` DISABLE KEYS */;
INSERT INTO `weather_0_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-17 15:45:03.469643','root',0,560,'ПАСМУРНО',6,'ОБЛАЧНО',3,1,'SW','СВЕЖИЙ',22,11,'',1,0,'NE','yrno'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-17 15:45:03.525125','root',0,960,'ПАСМУРНО',4,'ОБЛАЧНО',-1,1,'W','СВЕЖИЙ',3,2,'',1,1,'SE','yrno'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-17 15:45:03.587801','root',0,1100,'ПАСМУРНО',0,'ОБЛАЧНО',-1,1,'SW','СВЕЖИЙ',20,10,'',1,0,'NE','yrno'),(4,'РОЗА 1600','ROSA 1600','2020-12-17 15:45:03.644297','root',0,1600,'ПАСМУРНО',0,'ОБЛАЧНО',-5,1,'W','СВЕЖИЙ',2,1,'',1,1,'SE','yrno'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-17 15:45:03.758825','root',0,2320,'ПАСМУРНО',-4,'ОБЛАЧНО',-9,1,'W','СВЕЖИЙ',2,1,'',1,1,'SE','yrno'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-17 15:45:03.699894','root',0,1925,'ПАСМУРНО',-2,'ОБЛАЧНО',-7,1,'W','СВЕЖИЙ',2,1,'',1,1,'SE','yrno');
/*!40000 ALTER TABLE `weather_0_yrno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_1_local`
--

DROP TABLE IF EXISTS `weather_1_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_1_local` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT NULL,
  `snow_height` int DEFAULT NULL,
  `snow_height_new` int DEFAULT NULL,
  `snow_date` varchar(20) DEFAULT NULL,
  `snow_avalanche` int DEFAULT NULL,
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  `source` varchar(20) DEFAULT 'yrno',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_1_local_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_1_local`
--

LOCK TABLES `weather_1_local` WRITE;
/*!40000 ALTER TABLE `weather_1_local` DISABLE KEYS */;
INSERT INTO `weather_1_local` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-09 12:56:02.662251','root',0,560,'СОЛНЦЕ',15,'СОЛНЦЕ',16,1,'SE','СВЕЖИЙ',22,11,'',1,0,'-','yrno'),(2,'Роза Стадион','ROSA STADIUM','2020-12-17 15:15:26.762831','rosa',0,960,'ОБЛАЧНО',4,'ОБЛАЧНО',-1,1,'W','СВЕЖИЙ',3,2,'',1,0,'-','yrno'),(3,'Горная олимпийская деревня','ALPINE OLYMPIC VILLAGE','2020-12-17 15:15:56.005596','rosa',0,1100,'ОБЛАЧНО',2,'ПАСМУРНО',-4,1,'W','СВЕЖИЙ',20,10,'',1,0,'-','yrno'),(4,'Роза 1600','ROSA 1600','2020-12-17 15:19:59.815430','rosa',0,1600,'ОБЛАЧНО',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-','yrno'),(5,'Роза Пик','ROSA PEAK','2020-12-17 15:12:31.838010','rosa',0,2320,'ОБЛАЧНО',-4,'ОБЛАЧНО',-9,1,'W','СВЕЖИЙ',2,1,'',1,0,'-','yrno'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-09 12:56:03.045956','root',0,1925,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-','yrno');
/*!40000 ALTER TABLE `weather_1_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_1_yrno`
--

DROP TABLE IF EXISTS `weather_1_yrno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_1_yrno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT NULL,
  `snow_height` int DEFAULT NULL,
  `snow_height_new` int DEFAULT NULL,
  `snow_date` varchar(20) DEFAULT NULL,
  `snow_avalanche` int DEFAULT NULL,
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  `source` varchar(20) DEFAULT 'yrno',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_1_yrno_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_1_yrno`
--

LOCK TABLES `weather_1_yrno` WRITE;
/*!40000 ALTER TABLE `weather_1_yrno` DISABLE KEYS */;
INSERT INTO `weather_1_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-17 15:45:03.483914','root',0,560,'ОБЛАЧНО',6,'ПАСМУРНО',0,1,'W','СВЕЖИЙ',22,11,'',1,1,'NE','yrno'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-17 15:45:03.539927','root',0,960,'ОБЛАЧНО',4,'ОБЛАЧНО',-1,1,'W','СВЕЖИЙ',3,2,'',1,1,'E','yrno'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-17 15:45:03.601893','root',0,1100,'ОБЛАЧНО',2,'ПАСМУРНО',-4,1,'W','СВЕЖИЙ',20,10,'',1,1,'NE','yrno'),(4,'РОЗА 1600','ROSA 1600','2020-12-17 15:45:03.658472','root',0,1600,'ОБЛАЧНО',0,'ОБЛАЧНО',-5,1,'W','СВЕЖИЙ',2,1,'',1,1,'E','yrno'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-17 15:45:03.773440','root',0,2320,'ОБЛАЧНО',-4,'ОБЛАЧНО',-9,1,'W','СВЕЖИЙ',2,1,'',1,1,'E','yrno'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-17 15:45:03.716074','root',0,1925,'ОБЛАЧНО',-2,'ОБЛАЧНО',-7,1,'W','СВЕЖИЙ',2,1,'',1,1,'E','yrno');
/*!40000 ALTER TABLE `weather_1_yrno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_2_local`
--

DROP TABLE IF EXISTS `weather_2_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_2_local` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT NULL,
  `snow_height` int DEFAULT NULL,
  `snow_height_new` int DEFAULT NULL,
  `snow_date` varchar(20) DEFAULT NULL,
  `snow_avalanche` int DEFAULT NULL,
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  `source` varchar(20) DEFAULT 'yrno',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_2_local_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_2_local`
--

LOCK TABLES `weather_2_local` WRITE;
/*!40000 ALTER TABLE `weather_2_local` DISABLE KEYS */;
INSERT INTO `weather_2_local` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-09 12:56:02.695772','root',0,560,'СОЛНЦЕ',15,'СОЛНЦЕ',16,1,'SE','СВЕЖИЙ',22,11,'',1,0,'-','yrno'),(2,'Роза Стадион','ROSA STADIUM','2020-12-17 15:15:22.451686','rosa',0,960,'ПАСМУРНО',4,'ДОЖДЬ',1,1,'SW','СВЕЖИЙ',3,2,'',1,0,'-','yrno'),(3,'Горная олимпийская деревня','ALPINE OLYMPIC VILLAGE','2020-12-17 16:36:53.216224','rosa',0,1100,'ПАСМУРНО',2,'СНЕГ',23,3,'NE','РЫХЛЫЙ',20,10,'-',2,0,'-','yrno'),(4,'Роза 1600','ROSA 1600','2020-12-17 15:20:06.242101','rosa',0,1600,'ПАСМУРНО',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-','yrno'),(5,'Роза Пик','ROSA PEAK','2020-12-17 15:12:39.174692','rosa',0,2320,'ПАСМУРНО',-4,'СНЕГ',-7,1,'SW','СВЕЖИЙ',2,1,'',1,0,'-','yrno'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-09 12:56:03.068513','root',0,1925,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-','yrno');
/*!40000 ALTER TABLE `weather_2_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_2_yrno`
--

DROP TABLE IF EXISTS `weather_2_yrno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_2_yrno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT NULL,
  `snow_height` int DEFAULT NULL,
  `snow_height_new` int DEFAULT NULL,
  `snow_date` varchar(20) DEFAULT NULL,
  `snow_avalanche` int DEFAULT NULL,
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  `source` varchar(20) DEFAULT 'yrno',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_2_yrno_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_2_yrno`
--

LOCK TABLES `weather_2_yrno` WRITE;
/*!40000 ALTER TABLE `weather_2_yrno` DISABLE KEYS */;
INSERT INTO `weather_2_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-17 15:45:03.497558','root',0,560,'ПАСМУРНО',6,'ДОЖДЬ',3,0,'SW','СВЕЖИЙ',22,11,'',1,1,'W','yrno'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-17 15:45:03.559596','root',0,960,'ПАСМУРНО',4,'ДОЖДЬ',1,1,'SW','СВЕЖИЙ',3,2,'',1,1,'W','yrno'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-17 15:45:03.616336','root',0,1100,'ПАСМУРНО',2,'СНЕГ',0,0,'SW','СВЕЖИЙ',20,10,'',1,1,'W','yrno'),(4,'РОЗА 1600','ROSA 1600','2020-12-17 15:45:03.673482','root',0,1600,'ПАСМУРНО',0,'СНЕГ',-3,1,'SW','СВЕЖИЙ',2,1,'',1,1,'W','yrno'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-17 15:45:03.787879','root',0,2320,'ПАСМУРНО',-4,'СНЕГ',-7,1,'SW','СВЕЖИЙ',2,1,'',1,1,'W','yrno'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-17 15:45:03.730381','root',0,1925,'ПАСМУРНО',-2,'СНЕГ',-4,1,'SW','СВЕЖИЙ',2,1,'',1,1,'W','yrno');
/*!40000 ALTER TABLE `weather_2_yrno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_3_local`
--

DROP TABLE IF EXISTS `weather_3_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_3_local` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT 'ОТСУТСТВИЕ СНЕГА',
  `snow_height` int DEFAULT '0',
  `snow_height_new` int DEFAULT '0',
  `snow_date` varchar(20) DEFAULT '-',
  `snow_avalanche` int DEFAULT '0',
  `source` varchar(20) DEFAULT 'yrno',
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_3_local_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_3_local`
--

LOCK TABLES `weather_3_local` WRITE;
/*!40000 ALTER TABLE `weather_3_local` DISABLE KEYS */;
INSERT INTO `weather_3_local` VALUES (1,'Роза Долина','ROSA VALLEY','2020-12-17 04:08:11.415732','rosa',0,560,'ОБЛАЧНО',5,'НЕТ',0,0,'S','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(2,'Роза Стадион','ROSA STADIUM','2020-12-17 16:40:12.917968','rosa',0,960,'ОБЛАЧНО',4,'НЕТ',0,1,'W','СВЕЖИЙ',0,0,'-',2,'yrno',0,'-'),(3,'Горная олимпийская деревня','ALPINE OLYMPIC VILLAGE','2020-12-17 16:32:24.474661','rosa',0,1100,'СНЕГ',5,'НЕТ',0,2,'S','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(4,'Роза 1600','ROSA 1600','2020-12-17 15:20:10.550946','rosa',0,1600,'СНЕГ',-3,'НЕТ',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(5,'Роза Пик','ROSA PEAK','2020-12-17 15:12:45.044655','rosa',0,2320,'СНЕГ',-7,'НЕТ',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-14 00:17:04.265729','root',0,1925,'ПАСМУРНО',1,'НЕТ',0,0,'NW','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-');
/*!40000 ALTER TABLE `weather_3_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_3_yrno`
--

DROP TABLE IF EXISTS `weather_3_yrno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_3_yrno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `name_en` varchar(80) DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `updated_by` varchar(40) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weather_sky` varchar(80) DEFAULT NULL,
  `weather_temp` int DEFAULT NULL,
  `weather_sky_day` varchar(80) DEFAULT NULL,
  `weather_temp_day` int DEFAULT NULL,
  `wind_velocity` int DEFAULT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `snow_state` varchar(80) DEFAULT 'ОТСУТСТВИЕ СНЕГА',
  `snow_height` int DEFAULT '0',
  `snow_height_new` int DEFAULT '0',
  `snow_date` varchar(20) DEFAULT '-',
  `snow_avalanche` int DEFAULT '0',
  `source` varchar(20) DEFAULT 'yrno',
  `wind_velocity_day` int DEFAULT '0',
  `wind_direction_day` varchar(20) DEFAULT '-',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `weather_3_yrno_chk_1` CHECK ((`inactive` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_3_yrno`
--

LOCK TABLES `weather_3_yrno` WRITE;
/*!40000 ALTER TABLE `weather_3_yrno` DISABLE KEYS */;
INSERT INTO `weather_3_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-17 15:45:03.510158','root',0,560,'ДОЖДЬ',3,'-',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-17 15:45:03.572939','root',0,960,'ДОЖДЬ',1,'-',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-17 15:45:03.630140','root',0,1100,'СНЕГ',0,'-',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(4,'РОЗА 1600','ROSA 1600','2020-12-17 15:45:03.686222','root',0,1600,'СНЕГ',-3,'-',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-17 15:45:03.801192','root',0,2320,'СНЕГ',-7,'-',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-17 15:45:03.743467','root',0,1925,'СНЕГ',-4,'-',0,1,'W','ОТСУТСТВИЕ СНЕГА',0,0,'-',0,'yrno',0,'-');
/*!40000 ALTER TABLE `weather_3_yrno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_source`
--

DROP TABLE IF EXISTS `weather_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_source` (
  `id` int NOT NULL AUTO_INCREMENT,
  `local` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `weather_source_chk_1` CHECK ((`local` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_source`
--

LOCK TABLES `weather_source` WRITE;
/*!40000 ALTER TABLE `weather_source` DISABLE KEYS */;
INSERT INTO `weather_source` VALUES (1,1);
/*!40000 ALTER TABLE `weather_source` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 16:43:15

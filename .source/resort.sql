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
  `night` tinyint(1) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `lifts_chk_1` CHECK ((`inactive` in (0,1))),
  CONSTRAINT `lifts_chk_2` CHECK ((`night` in (0,1))),
  CONSTRAINT `lifts_chk_3` CHECK ((`summer` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifts`
--

LOCK TABLES `lifts` WRITE;
/*!40000 ALTER TABLE `lifts` DISABLE KEYS */;
INSERT INTO `lifts` VALUES (1,'ОЛИМПИЯ','OLIMPIA','2020-12-09 18:17:38.549375','rosa',0,'P','TC','07:30','23:45',0,'19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2341),(2,'ЗАПОВЕДНЫЙ ЛЕС','ZAPOVEDNYY LES','2020-12-09 18:17:38.588518','rosa',0,'P','TC','07:30','16:30',0,'19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1541),(3,'КАВКАЗСКИЙ ЭКСПРЕСС ВЫШЕ 1600','KAVKAZSKIY EXPRESS ABOVE 1600','2020-12-09 18:17:34.456735','rosa',0,'C','TC','08:35','16:45',0,'19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'КАВКАЗСКИЙ ЭКСПРЕСС НИЖЕ 1600','KAVKAZSKIY EXPRESS BELOW 1600','2020-12-09 18:17:34.495331','rosa',0,'C','TC','08:35','16:45',0,'19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'СТРЕЛА','STRELA','2020-12-09 16:57:53.497586','root',0,'C','TC','08:30','15:20',0,'19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3838),(6,'КВАРТЕТ','KVARTET','2020-12-09 16:57:53.560941','root',0,'C','TS','08:40','16:30',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'СОЛО','SOLO','2020-12-09 16:57:53.577783','root',0,'C','TR','07:45','16:45',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50),(8,'БЕСЕДА','BESEDA','2020-12-09 16:57:53.609102','root',0,'C','TS','08:30','16:00',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1502),(9,'ДРИАДА','DRIADA','2020-12-09 16:57:53.623951','root',0,'C','TC','08:30','16:10',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2145),(10,'ТУНДРА','TUNDRA','2020-12-09 16:57:53.639585','root',0,'C','TC','08:45','15:45',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1534),(11,'ШАЛЕ','CHALET','2020-12-09 16:57:53.673082','root',0,'C','TS','19:00','22:45',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,836),(12,'ЮВЕНТА','JUVENTA','2020-12-09 16:57:53.688539','root',0,'C','TK','08:30','22:45',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,277),(13,'ЭКСТРИМ','EXTREME','2020-12-09 16:57:53.704490','root',0,'C','TS','08:30','16:30',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,954),(14,'КРОКУС','KROKUS','2020-12-09 16:57:53.719706','root',0,'P','TS','09:30','15:10',0,'19:00','22:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1041),(15,'ПАРК 1','PARK 1','2020-12-09 16:57:53.753285','root',0,'C','TK','09:00','16:00',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,110),(16,'ПАРК 2','PARK 2','2020-12-09 16:57:53.768122','root',0,'C','TK','09:00','16:00',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,165),(17,'БУГЕЛЬ 1600-1','TOW LIFT 1600-1','2020-12-09 16:57:53.782903','root',0,'C','TK','09:00','16:00',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,113),(18,'БУГЕЛЬ 1600-2','TOW LIFT 1600-2','2020-12-09 16:57:53.796891','root',0,'C','TK','09:00','16:00',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(19,'УЧЕБНЫЙ СКЛОН 1','TRAINING SLOPE 1','2020-12-09 16:57:53.811246','root',0,'C','TR','08:30','22:45',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,141),(20,'УЧЕБНЫЙ СКЛОН 2','TRAINING SLOPE 2','2020-12-09 16:57:53.825429','root',0,'C','TR','08:30','22:45',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105),(21,'ДЕТСКИЙ СКЛОН','KIDS SLOPE','2020-12-09 16:57:53.839848','root',0,'C','TR','09:00','16:30',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71),(22,'ТЮБИНГ','TUBING','2020-12-09 16:57:53.853979','root',0,'C','TK','10:00','22:00',0,'19:00','22:45',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240);
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
  `night` tinyint(1) DEFAULT NULL,
  `south` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_en` (`name_en`),
  CONSTRAINT `slopes_chk_1` CHECK ((`inactive` in (0,1))),
  CONSTRAINT `slopes_chk_2` CHECK ((`night` in (0,1))),
  CONSTRAINT `slopes_chk_3` CHECK ((`south` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slopes`
--

LOCK TABLES `slopes` WRITE;
/*!40000 ALTER TABLE `slopes` DISABLE KEYS */;
INSERT INTO `slopes` VALUES (1,'АИБГА','AIBGA','2020-12-09 12:55:36.495619','root',0,'C','B','08:40','16:00','D',1035,144,0,0),(2,'АРБОР','ARBOR','2020-12-09 12:55:36.510281','root',0,'C','B','08:30','16:20','R',1910,0,0,0),(3,'Б 52 ВЫШЕ 1350','B 52 ABOVE 1350','2020-12-09 12:55:36.522643','root',0,'C','B','08:40','16:00','G',2000,250,0,0),(4,'Б 52 НИЖЕ 1350','B 52 BELOW 1350','2020-12-09 12:55:36.535133','root',0,'C','B','07:30','16:20','G',2050,180,0,0),(5,'БОРЕЙ ВЫШЕ 1295','BOREY ABOVE 1295','2020-12-09 18:15:22.329250','rosa',0,'C','B','08:30','16:20','B',690,0,0,0),(6,'БОРЕЙ НИЖЕ 1295','BOREY BELOW 1295','2020-12-09 12:55:36.560083','root',0,'C','B','08:30','16:20','B',330,0,0,0),(7,'БУМЕРАНГ','BUMERANG','2020-12-09 12:55:36.573581','root',0,'C','B','09:00','16:20','B',310,72,0,0),(8,'ШАЛЕ','CHALET','2020-12-09 12:55:36.586038','root',0,'C','B','19:00','22:45','G',950,0,0,0),(9,'ШАМОНИ 24','CHAMONIX 24','2020-12-09 12:55:36.598747','root',0,'C','B','07:30','16:45','B',1905,410,0,0),(10,'КРЭЙЗИ ХУТОР ВЫШЕ 1400','CRAZY KHUTOR ABOVE 1400','2020-12-09 12:55:36.611636','root',0,'C','B','09:00','16:00','D',3000,895,0,0),(11,'КРЭЙЗИ ХУТОР НИЖЕ 1400','CRAZY KHUTOR BELOW 1400','2020-12-09 12:55:36.624020','root',0,'C','B','09:00','16:00','D',1650,306,0,0),(12,'ЭХО','EHKHO','2020-12-09 12:55:36.635941','root',0,'C','B','08:30','16:20','R',755,0,0,0),(13,'ГОРИЗОНТ ВЫШЕ 1600','GORIZONT ABOVE 1600','2020-12-09 12:55:36.648209','root',0,'C','B','08:50','16:00','B',4550,720,0,0),(14,'ГОРИЗОНТ НИЖЕ 1600','GORIZONT BELOW 1600','2020-12-09 12:55:36.661743','root',0,'C','B','08:30','16:00','B',2710,660,0,0),(15,'ЮВЕНТА','JUVENTA','2020-12-09 12:55:36.675017','root',0,'C','B','08:30','22:45','G',285,41,0,0),(16,'КАСКАД ВЫШЕ 1600','KASKAD ABOVE 1600','2020-12-09 12:55:36.687420','root',0,'C','B','08:40','16:00','R',2920,506,0,0),(17,'КАСКАД НИЖЕ 1600','KASKAD BELOW 1600','2020-12-09 12:55:36.699795','root',0,'C','B','08:40','16:00','R',1480,660,0,0),(18,'ДЕТСКИЙ СКЛОН','KIDS SLOPE','2020-12-09 12:55:36.713696','root',0,'C','B','09:00','16:30','G',80,0,0,0),(19,'КВАРТЕТ','KVARTET','2020-12-09 12:55:36.727244','root',0,'C','B','09:00','16:20','D',790,0,0,0),(20,'ЛАБИРИНТ ВЫШЕ 1400','LABIRINT ABOVE 1400','2020-12-09 12:55:36.740958','root',0,'C','B','08:50','16:30','B',1900,244,0,0),(21,'ЛАБИРИНТ НИЖЕ 1400','LABIRINT BELOW 1400','2020-12-09 12:55:36.754580','root',0,'C','B','08:50','16:30','B',1350,460,0,0),(22,'МУЖСКОЙ ОЛИМПИЙСКИЙ СПУСК ВЫШЕ 1600','MUZHSKOY OLYMPIC ABOVE 1600','2020-12-09 12:55:36.768948','root',0,'C','B','08:40','16:00','D',1336,445,0,0),(23,'МУЖСКОЙ ОЛИМПИЙСКИЙ СПУСК НИЖЕ 1600','MUZHSKOY OLYMPIC BELOW 1600','2020-12-09 12:55:36.783396','root',0,'C','B','07:30','16:00','D',1780,630,0,0),(24,'НАГАНО 98','NAGANO 98','2020-12-09 12:55:36.797386','root',0,'C','B','07:30','16:45','B',2000,415,0,0),(25,'ОБЕР ХУТОР ВЫШЕ 1600','OBER KHUTOR ABOVE 1600','2020-12-09 12:55:36.810896','root',0,'C','B','08:50','16:00','R',1935,630,0,0),(26,'ОБЕР ХУТОР НИЖЕ 1600','OBER KHUTOR BELOW 1600','2020-12-09 12:55:36.824547','root',0,'C','B','08:40','16:30','R',2580,494,0,0),(27,'ОРЕЛ','OREL','2020-12-09 12:55:36.838284','root',0,'C','B','07:30','16:30','D',1000,289,0,0),(28,'ОЗЕРНАЯ','OZERNAYA','2020-12-09 12:55:36.851204','root',0,'C','B','07:30','16:30','B',2200,415,0,0),(29,'ПЛАТО','PLATO','2020-12-09 12:55:36.863710','root',0,'C','B','07:30','16:30','G',2055,180,0,0),(30,'РОЗА СТАР','ROSA STAR','2020-12-09 12:55:36.876422','root',0,'C','B','08:30','16:30','R',1075,179,0,0),(31,'РОЗА БЛЕЙД','ROSA X BLADE','2020-12-09 12:55:36.888969','root',0,'C','B','08:30','16:30','B',1700,212,0,0),(32,'СНОУПАРК НА РОЗА 1600','SNOW PARK AT ROSA 1600','2020-12-09 12:55:36.901630','root',0,'C','S','09:00','16:00','R',725,100,0,0),(33,'СНОУПАРК','SNOW PARK','2020-12-09 12:55:36.914186','root',0,'C','S','09:00','16:00','R',945,0,0,0),(34,'ПАРК THE STASH','THE STASH PARK','2020-12-09 12:55:36.927019','root',0,'C','S','09:00','16:00','R',975,0,0,0),(35,'ТРАССА ДЛЯ САНОК','TOBOGGAN','2020-12-09 12:55:36.939928','root',0,'OO','L','00:00','23:59','G',2000,0,0,0),(36,'ТУРИН 06','TORINO 06','2020-12-09 12:55:36.952528','root',0,'C','B','07:30','16:30','B',800,81,0,0),(37,'УЧЕБНЫЙ СКЛОН','TRAINING SLOPE','2020-12-09 12:55:36.965292','root',0,'C','B','08:30','22:45','G',290,0,0,0),(38,'ТРИТОН ВЫШЕ 2000','TRITON ABOVE 2000','2020-12-09 12:55:36.977711','root',0,'C','B','08:40','16:00','B',1795,320,0,0),(39,'ТРИТОН НИЖЕ 1600','TRITON BELOW 1600','2020-12-09 12:55:36.990237','root',0,'C','B','08:30','16:30','B',2045,250,0,0),(40,'ТРИТОН МЕЖДУ 1600 И 2000','TRITON MIDDLE 1600','2020-12-09 12:55:37.002561','root',0,'C','B','08:40','16:00','B',2525,400,0,0),(41,'ТЮБИНГ','TUBING','2020-12-09 12:55:37.015551','root',0,'C','L','10:00','22:00','G',155,-18,0,0),(42,'ВАНКУВЕР 10','VANCOUVER 10','2020-12-09 12:55:37.028305','root',0,'C','B','07:30','16:45','B',2010,410,0,0),(43,'ВИРАЖ ВЫШЕ 1800','VIRAZH ABOVE 1800','2020-12-09 12:55:37.040531','root',0,'C','B','08:40','16:00','R',1275,291,0,0),(44,'ВИРАЖ НИЖЕ 1800','VIRAZH BELOW 1800','2020-12-09 12:55:37.052754','root',0,'C','B','08:40','16:00','R',1070,0,0,0),(45,'ВСТРЕЧА','VSTRECHA','2020-12-09 12:55:37.065511','root',0,'C','B','07:30','16:30','B',450,59,0,0),(46,'ЮРЬЕВ ХУТОР','YUREV KHUTOR','2020-12-09 12:55:37.077929','root',0,'C','B','08:50','16:00','D',2020,676,0,0),(47,'ЖЕНСКИЙ ОЛИМПИЙСКИЙ СПУСК ВЫШЕ 1600','ZHENSKIY OLYMPIC A','2020-12-09 12:55:37.090502','root',0,'C','B','08:40','16:00','D',368,155,0,0),(48,'ЖЕНСКИЙ ОЛИМПИЙСКИЙ СПУСК НИЖЕ 1600','ZHENSKIY OLYMPIC B','2020-12-09 12:55:37.103128','root',0,'C','B','08:30','16:30','D',2532,635,0,0),(49,'ЗМЕЙКА ВЫШЕ 1665','ZMEIKA ABOVE 1665','2020-12-09 12:55:37.115476','root',0,'C','B','08:30','16:00','B',965,297,0,0),(50,'ЗМЕЙКА НИЖЕ 1665','ZMEIKA BELOW 1665','2020-12-09 12:55:37.127663','root',0,'C','B','00:00','23:59','B',655,0,0,0),(51,'АДОНИС','ADONIS','2020-12-09 12:55:53.660649','root',0,'C','A','09:30','15:00','R',660,0,0,1),(52,'АЛЬПИКА','ALPIKA','2020-12-09 12:55:53.675166','root',0,'C','A','08:50','15:00','R',2500,0,0,1),(53,'АЗАЛИЯ ВЫШЕ 1535','AZALIA ABOVE 1535','2020-12-09 12:55:53.688736','root',0,'C','A','09:30','15:00','G',1070,0,0,1),(54,'АЗАЛИЯ НИЖЕ 1535','AZALIA BELOW 1535','2020-12-09 12:55:53.703296','root',0,'C','A','09:30','15:00','G',410,0,0,1),(55,'ФИАЛКА','FIALKA','2020-12-09 12:55:53.716765','root',0,'C','A','09:30','15:00','B',1540,278,0,1),(56,'ГОРИЦВЕТ','GORITSVET','2020-12-09 12:55:53.729690','root',0,'C','A','09:30','16:00','B',375,0,0,1),(57,'НАЯДА','NAYADA','2020-12-09 12:55:53.743085','root',0,'C','A','09:30','15:00','N',850,0,0,1),(58,'ОРЕАДА','OREADA','2020-12-09 12:55:53.756485','root',0,'C','A','09:30','15:00','R',940,0,0,1),(59,'ПАНОРАМА','PANORAMA','2020-12-09 12:55:53.768971','root',0,'C','A','09:30','15:00','B',5015,0,0,1),(60,'ПРИМАВЕРА','PRIMAVERA','2020-12-09 12:55:53.782199','root',0,'C','A','09:30','15:00','R',1615,0,0,1),(61,'ПРИМУЛА ВЫШЕ 1940','PRIMULA ABOVE 1940','2020-12-09 12:55:53.794924','root',0,'C','A','09:30','15:00','R',2215,534,0,1),(62,'ПРИМУЛА НИЖЕ 1940','PRIMULA BELOW 1940','2020-12-09 12:55:53.808142','root',0,'C','A','09:30','15:00','R',1040,195,0,1),(63,'СТОРОЖКА','STOROGKA','2020-12-09 12:55:53.821140','root',0,'C','A','09:30','15:00','R',2465,0,0,1),(64,'ВЕРОНИКА','VERONIKA','2020-12-09 12:55:53.833997','root',0,'C','A','09:30','15:00','N',375,200,0,1),(65,'ЯВОР 2','YAVOR 2','2020-12-09 12:55:53.847057','root',0,'C','A','09:30','15:00','G',3250,0,0,1),(66,'ЯВОР ВЫШЕ 2220','YAVOR ABOVE 2220','2020-12-09 12:55:53.860207','root',0,'C','A','09:30','15:00','G',1005,100,0,1),(67,'ЯВОР НИЖЕ 2120','YAVOR BELOW 2120','2020-12-09 12:55:53.874532','root',0,'C','A','09:30','15:00','G',4240,2120,0,1),(68,'ЯВОР МЕЖДУ 2120 И 2220','YAVOR MIDDLE 2120','2020-12-09 12:55:53.889252','root',0,'C','A','09:30','15:00','G',810,100,0,1);
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
INSERT INTO `weather_0_local` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-09 12:56:02.629105','root',0,560,'СОЛНЦЕ',15,'СОЛНЦЕ',16,1,'SE','СВЕЖИЙ',22,11,'',1,0,'-'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-09 12:56:02.725530','root',0,960,'СОЛНЦЕ',-20,'СОЛНЦЕ',-10,5,'W','СВЕЖИЙ',3,2,'',1,0,'-'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-09 12:56:02.795601','root',0,1100,'ПАСМУРНО',20,'ПАСМУРНО',23,3,'NE','СВЕЖИЙ',20,10,'',1,0,'-'),(4,'РОЗА 1600','ROSA 1600','2020-12-09 12:56:02.876098','root',0,1600,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-09 12:56:02.951380','root',0,2320,'СОЛНЦЕ',25,'СОЛНЦЕ',22,3,'SE','СВЕЖИЙ',2,1,'',1,0,'-'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-09 12:56:03.022866','root',0,1925,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-');
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
INSERT INTO `weather_0_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-14 07:59:39.431005','root',0,560,'ОБЛАЧНО',4,'ОБЛАЧНО',14,1,'NE','СВЕЖИЙ',22,11,'',1,1,'NE'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-14 07:59:39.505322','root',0,960,'ОБЛАЧНО',4,'ОБЛАЧНО',11,2,'E','СВЕЖИЙ',3,2,'',1,1,'E'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-14 07:59:39.556487','root',0,1100,'ОБЛАЧНО',0,'ОБЛАЧНО',10,1,'NE','СВЕЖИЙ',20,10,'',1,1,'NE'),(4,'РОЗА 1600','ROSA 1600','2020-12-14 07:59:39.606576','root',0,1600,'ОБЛАЧНО',0,'ОБЛАЧНО',7,2,'E','СВЕЖИЙ',2,1,'',1,1,'E'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-14 07:59:39.655459','root',0,2320,'ОБЛАЧНО',-4,'ОБЛАЧНО',3,2,'E','СВЕЖИЙ',2,1,'',1,1,'E'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-14 07:59:39.703952','root',0,1925,'ОБЛАЧНО',-2,'ОБЛАЧНО',5,2,'E','СВЕЖИЙ',2,1,'',1,1,'E');
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
INSERT INTO `weather_1_local` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-09 12:56:02.662251','root',0,560,'СОЛНЦЕ',15,'СОЛНЦЕ',16,1,'SE','СВЕЖИЙ',22,11,'',1,0,'-'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-09 12:56:02.748978','root',0,960,'СОЛНЦЕ',-20,'СОЛНЦЕ',-10,5,'W','СВЕЖИЙ',3,2,'',1,0,'-'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-09 12:56:02.820635','root',0,1100,'ПАСМУРНО',20,'ПАСМУРНО',23,3,'NE','СВЕЖИЙ',20,10,'',1,0,'-'),(4,'РОЗА 1600','ROSA 1600','2020-12-09 12:56:02.902746','root',0,1600,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-09 12:56:02.975260','root',0,2320,'СОЛНЦЕ',25,'СОЛНЦЕ',22,3,'SE','СВЕЖИЙ',2,1,'',1,0,'-'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-09 12:56:03.045956','root',0,1925,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-');
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
INSERT INTO `weather_1_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-14 07:59:39.459096','root',0,560,'ПАСМУРНО',3,'ПАСМУРНО',14,1,'NE','СВЕЖИЙ',22,11,'',1,1,'E'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-14 07:59:39.520815','root',0,960,'ПАСМУРНО',3,'ПАСМУРНО',12,2,'E','СВЕЖИЙ',3,2,'',1,0,'SE'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-14 07:59:39.570266','root',0,1100,'ПАСМУРНО',-1,'ПАСМУРНО',10,1,'NE','СВЕЖИЙ',20,10,'',1,1,'E'),(4,'РОЗА 1600','ROSA 1600','2020-12-14 07:59:39.619296','root',0,1600,'ПАСМУРНО',-1,'ПАСМУРНО',8,2,'E','СВЕЖИЙ',2,1,'',1,0,'SE'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-14 07:59:39.668694','root',0,2320,'ПАСМУРНО',-6,'ПАСМУРНО',4,2,'E','СВЕЖИЙ',2,1,'',1,0,'SE'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-14 07:59:39.715155','root',0,1925,'ПАСМУРНО',-3,'ПАСМУРНО',6,2,'E','СВЕЖИЙ',2,1,'',1,0,'SE');
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
INSERT INTO `weather_2_local` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-09 12:56:02.695772','root',0,560,'СОЛНЦЕ',15,'СОЛНЦЕ',16,1,'SE','СВЕЖИЙ',22,11,'',1,0,'-'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-09 12:56:02.772200','root',0,960,'СОЛНЦЕ',-20,'СОЛНЦЕ',-10,5,'W','СВЕЖИЙ',3,2,'',1,0,'-'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-09 12:56:02.847627','root',0,1100,'ПАСМУРНО',20,'ПАСМУРНО',23,3,'NE','СВЕЖИЙ',20,10,'',1,0,'-'),(4,'РОЗА 1600','ROSA 1600','2020-12-09 12:56:02.927853','root',0,1600,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-09 12:56:02.998174','root',0,2320,'СОЛНЦЕ',25,'СОЛНЦЕ',22,3,'SE','СВЕЖИЙ',2,1,'',1,0,'-'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-09 12:56:03.068513','root',0,1925,'СОЛНЦЕ',-2,'СОЛНЦЕ',-1,5,'W','СВЕЖИЙ',2,1,'',1,0,'-');
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
INSERT INTO `weather_2_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-14 07:59:39.477387','root',0,560,'ДОЖДЬ',7,'ДОЖДЬ',8,0,'NE','СВЕЖИЙ',22,11,'',1,0,'SW'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-14 07:59:39.532925','root',0,960,'ДОЖДЬ',5,'ДОЖДЬ',6,1,'E','СВЕЖИЙ',3,2,'',1,0,'SE'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-14 07:59:39.584330','root',0,1100,'ДОЖДЬ',3,'ДОЖДЬ',5,0,'NE','СВЕЖИЙ',20,10,'',1,0,'SW'),(4,'РОЗА 1600','ROSA 1600','2020-12-14 07:59:39.630768','root',0,1600,'ДОЖДЬ',1,'ДОЖДЬ',2,1,'E','СВЕЖИЙ',2,1,'',1,0,'SE'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-14 07:59:39.681454','root',0,2320,'СНЕГ',-4,'СНЕГ',-2,1,'E','СВЕЖИЙ',2,1,'',1,0,'SE'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-14 07:59:39.726650','root',0,1925,'СНЕГ',-1,'СНЕГ',0,1,'E','СВЕЖИЙ',2,1,'',1,0,'SE');
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
INSERT INTO `weather_3_local` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-14 00:17:04.043081','root',0,560,'ДОЖДЬ',9,'-',0,0,'S'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-14 00:17:04.086606','root',0,960,'ПАСМУРНО',7,'-',0,0,'NW'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-14 00:17:04.135599','root',0,1100,'ДОЖДЬ',5,'-',0,0,'S'),(4,'РОЗА 1600','ROSA 1600','2020-12-14 00:17:04.178888','root',0,1600,'ПАСМУРНО',3,'-',0,0,'NW'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-14 00:17:04.221122','root',0,2320,'ПАСМУРНО',-2,'-',0,0,'NW'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-14 00:17:04.265729','root',0,1925,'ПАСМУРНО',1,'-',0,0,'NW');
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
INSERT INTO `weather_3_yrno` VALUES (1,'РОЗА ДОЛИНА','ROSA VALLEY','2020-12-14 07:59:39.491608','root',0,560,'ОБЛАЧНО',5,'-',0,1,'W'),(2,'РОЗА СТАДИОН','ROSA STADIUM','2020-12-14 07:59:39.544385','root',0,960,'ОБЛАЧНО',4,'-',0,1,'W'),(3,'ГОРНАЯ ОЛИМПИЙСКАЯ ДЕРЕВНЯ','ALPINE OLYMPIC VILLAGE','2020-12-14 07:59:39.594950','root',0,1100,'ОБЛАЧНО',2,'-',0,1,'W'),(4,'РОЗА 1600','ROSA 1600','2020-12-14 07:59:39.642270','root',0,1600,'ОБЛАЧНО',0,'-',0,1,'W'),(5,'РОЗА ПИК','ROSA PEAK','2020-12-14 07:59:39.692537','root',0,2320,'ОБЛАЧНО',-5,'-',0,1,'W'),(6,'ЮЖНЫЙ СКЛОН','SOUTHERN SLOPE','2020-12-14 07:59:39.739472','root',0,1925,'ОБЛАЧНО',-2,'-',0,1,'W');
/*!40000 ALTER TABLE `weather_3_yrno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14  8:05:16

-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: fabm_db
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` VALUES (17,'Morning tea(9:00~11:00)',5,1),(18,'Lunch(11:00~14:00)',4,1),(20,'dinner(16:00~22:00)',3,1),(21,'Supper(22:00~02:00)',2,1);
/*!40000 ALTER TABLE `times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'18241172058','123456',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '-1',
  `birth_date` datetime NOT NULL,
  `phone` varchar(255) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'best selling',15,1),(4,'Hot dishes',4,1),(5,'cold dish',1,1),(6,'Noodle soup',1,1),(7,'Hong Kong Style Siu Mei',1,1),(8,'Drink',1,1),(9,'Pretty soupetty soup',1,1),(10,'fried rice',1,1),(11,'Lo mei',1,1),(12,'beer',1,1),(13,'Dessert',1,1),(14,'New product',19,0),(15,'Taiwanese flavor',1,1),(16,'Sichuan style',1,1),(17,'Northeast flavor',1,1),(18,'Mì quảng Phan Thiết',0,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `desc` text,
  `sort` int(11) DEFAULT '0',
  `cid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (4,'Spicy Chicken Burger Set','0.75','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183231622.jpg','',1,3,1),(5,'Cold yuba','0.66','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183349550.png','',1,5,1),(6,'Pork in a pot','6.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183357408.png','',1,4,1),(7,'Yuxiang Pork','6.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183366161.jpg','',1,4,1),(8,'Sweet and Sour Fish','5.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183469792.jpg','',1,4,1),(9,'Cauliflower','2.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183374265.jpg','',1,5,1),(10,'Spicy Crab','15.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183383842.jpg','',1,14,1),(11,'Spicy Fried Clams','2.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183438456.jpg','',1,14,1),(12,'Hanamaki','0.5','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183447384.jpg','',1,15,1),(13,'Saliva chicken','9.00','http://lzread.oss-cn-shanghai.aliyuncs.com/20200941599183454807.jpg','',1,5,1);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `did` (`did`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`did`) REFERENCES `dishes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,0,4,1,1),(2,0,8,1,1),(3,0,8,1,1),(4,0,7,1,1),(5,0,4,1,1),(6,0,4,1,1),(7,0,4,1,1),(8,0,4,1,1),(9,0,4,1,1),(10,0,4,1,1),(11,0,4,1,1);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) NOT NULL,
  `repast_date` varchar(255) DEFAULT NULL,
  `repast_time` varchar(255) DEFAULT NULL,
  `seat_no` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,'1608349029051','2020-12-19','10:37:28',3,'info here',1),(5,'1608349071051','2020-12-19','10:37:49',4,'',-1),(6,'1608349086051','2020-12-19','10:38:04',13,'',1),(7,'1608349113051','2020-12-19','10:38:31',11,'',1),(8,'1608349486051','2020-12-19','10:44:44',16,'',1),(9,'1608350686051','2020-12-19','11:04:44',4,'',1),(10,'1608350840051','2020-12-19','11:07:18',5,'',1),(11,'1608351628051','2020-12-19','11:20:26',12,'',1),(12,'1608352249051','2020-12-19','11:30:47',6,'',1),(13,'1608352495051','2020-12-19','11:34:53',7,'',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `order_dishes`
--

DROP TABLE IF EXISTS `order_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `dishes_id` int(11) NOT NULL,
  `dishes_num` int(11) NOT NULL,
  `dishes_price` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `dishes_id` (`dishes_id`),
  CONSTRAINT `order_dishes_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_dishes_ibfk_2` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dishes`
--

LOCK TABLES `order_dishes` WRITE;
/*!40000 ALTER TABLE `order_dishes` DISABLE KEYS */;
INSERT INTO `order_dishes` VALUES (5,4,10,4,'15.00',1),(6,4,11,3,'2.00',1),(7,5,4,1,'0.75',1),(8,5,5,4,'0.66',1),(9,5,9,3,'2.00',1),(10,5,13,2,'9.00',1),(11,6,10,1,'15.00',1),(12,6,11,3,'2.00',1),(13,6,12,3,'0.5',1),(14,7,10,2,'15.00',1),(15,7,11,2,'2.00',1),(16,8,10,1,'15.00',1),(17,8,11,1,'2.00',1),(18,9,10,1,'15.00',1),(19,9,11,1,'2.00',1),(20,10,10,1,'15.00',1),(21,10,11,1,'2.00',1),(22,11,4,5,'0.75',1),(23,12,10,1,'15.00',1),(24,12,11,3,'2.00',1),(25,12,4,2,'0.75',1),(26,13,10,1,'15.00',1),(27,13,11,2,'2.00',1);
/*!40000 ALTER TABLE `order_dishes` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (2,'1~2/person',10,1),(3,'2~4/person',9,1),(4,'4~6/person',8,1),(5,'6~12/person',7,1),(6,'12~20/person',6,1),(7,'20 people or more',5,1);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (3,'Table 101',100,0),(4,'Table 102',99,0),(5,'Table 103',98,0),(6,'Table 104',97,0),(7,'Table 105',96,0),(8,'Table 106',95,1),(9,'Table 107',94,1),(10,'108Table',93,1),(11,'109Table',92,0),(12,'Table 110',91,0),(13,'Table 111',90,0),(14,'Table 112',89,1),(15,'Table 113',88,1),(16,'Table 114',87,0),(17,'Table 115',86,1),(18,'"Spring" Private Room',85,1),(19,'"Sapa" Private Room',84,1),(20,'“Phan Thiet”Private Room',83,1),(21,'“Sai Gon”Private Room',82,1);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;



-- Dump completed on 2020-12-23 11:59:51

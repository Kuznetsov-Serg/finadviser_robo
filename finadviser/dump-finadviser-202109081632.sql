-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: finadviser
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add association',6,'add_association'),(22,'Can change association',6,'change_association'),(23,'Can delete association',6,'delete_association'),(24,'Can view association',6,'view_association'),(25,'Can add code',7,'add_code'),(26,'Can change code',7,'change_code'),(27,'Can delete code',7,'delete_code'),(28,'Can view code',7,'view_code'),(29,'Can add nonce',8,'add_nonce'),(30,'Can change nonce',8,'change_nonce'),(31,'Can delete nonce',8,'delete_nonce'),(32,'Can view nonce',8,'view_nonce'),(33,'Can add user social auth',9,'add_usersocialauth'),(34,'Can change user social auth',9,'change_usersocialauth'),(35,'Can delete user social auth',9,'delete_usersocialauth'),(36,'Can view user social auth',9,'view_usersocialauth'),(37,'Can add partial',10,'add_partial'),(38,'Can change partial',10,'change_partial'),(39,'Can delete partial',10,'delete_partial'),(40,'Can view partial',10,'view_partial'),(41,'Can add пользователь',11,'add_investoruser'),(42,'Can change пользователь',11,'change_investoruser'),(43,'Can delete пользователь',11,'delete_investoruser'),(44,'Can view пользователь',11,'view_investoruser'),(45,'Can add investor user profile',12,'add_investoruserprofile'),(46,'Can change investor user profile',12,'change_investoruserprofile'),(47,'Can delete investor user profile',12,'delete_investoruserprofile'),(48,'Can view investor user profile',12,'view_investoruserprofile'),(49,'Can add категория',13,'add_productcategory'),(50,'Can change категория',13,'change_productcategory'),(51,'Can delete категория',13,'delete_productcategory'),(52,'Can view категория',13,'view_productcategory'),(53,'Can add фин.продукт',14,'add_product'),(54,'Can change фин.продукт',14,'change_product'),(55,'Can delete фин.продукт',14,'delete_product'),(56,'Can view фин.продукт',14,'view_product'),(57,'Can add портфель',15,'add_portfolio'),(58,'Can change портфель',15,'change_portfolio'),(59,'Can delete портфель',15,'delete_portfolio'),(60,'Can view портфель',15,'view_portfolio'),(61,'Can add брокер',16,'add_broker'),(62,'Can change брокер',16,'change_broker'),(63,'Can delete брокер',16,'delete_broker'),(64,'Can view брокер',16,'view_broker'),(65,'Can add фин.продукт брокера',17,'add_brokerproduct'),(66,'Can change фин.продукт брокера',17,'change_brokerproduct'),(67,'Can delete фин.продукт брокера',17,'delete_brokerproduct'),(68,'Can view фин.продукт брокера',17,'view_brokerproduct'),(69,'Can add модель предсказаний',18,'add_model'),(70,'Can change модель предсказаний',18,'change_model'),(71,'Can delete модель предсказаний',18,'delete_model'),(72,'Can view модель предсказаний',18,'view_model'),(73,'Can add сигнал модели для фин.продукта',19,'add_prediction'),(74,'Can change сигнал модели для фин.продукта',19,'change_prediction'),(75,'Can delete сигнал модели для фин.продукта',19,'delete_prediction'),(76,'Can view сигнал модели для фин.продукта',19,'view_prediction'),(77,'Can add сигнал',20,'add_signal'),(78,'Can change сигнал',20,'change_signal'),(79,'Can delete сигнал',20,'delete_signal'),(80,'Can view сигнал',20,'view_signal');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_investoruser`
--

DROP TABLE IF EXISTS `authapp_investoruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authapp_investoruser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `activation_key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_key_expires` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_investoruser`
--

LOCK TABLES `authapp_investoruser` WRITE;
/*!40000 ALTER TABLE `authapp_investoruser` DISABLE KEYS */;
INSERT INTO `authapp_investoruser` VALUES (1,'!O7sy6ToqsrCZUOHaupvX47xWT1ysPksqdUsUbkYm','2021-09-08 16:09:12.754452',0,'id96696609','Сергей','Кузнецов','ksn1974@mail.ru',0,1,'2021-08-21 23:43:38.471907','https://sun9-74.userapi.com/s/v1/ig2/Kr3cwBP3XHle7unTbJ4peHOr7vEPqxk4VcVpEMue4mQl6LiFrDLdp2T64Avs5GrE6bTNJ8cfPqkP6UnZFnrC46xc.jpg?size=400x400&quality=96&crop=6,0,1767,1767&ava=1','1974-08-18','','2021-08-23 23:43:26.514602'),(2,'!NJUdNiDvRloLsaffKLyxID3N3EkfYzgdKJsGZHQY','2021-08-22 19:13:55.623962',0,'107955373323','Сергей','Кузнецов','',0,1,'2021-08-21 23:43:50.219371','https://i.mycdn.me/image?id=457436907531&t=33&plc=API&aid=512001258891&tkn=*pPEiWIlEWP8Bhg8KAxykIoRX8NE','1974-08-18','','2021-08-23 23:43:26.514602'),(3,'pbkdf2_sha256$260000$hmGPSZbghQHN94CFrIkvl1$ZZfsNQN6gTJiXbaCJIxVHruVWVudnWoZIFqHydZhNf4=','2021-09-08 16:09:36.816197',1,'kuznetsov','Сергей','Кузнецов','ksn1974@mail.ru',1,1,'2021-08-21 23:44:44.446075','users_avatars/на_белом_фоне_ATRspMu.png','1974-08-18','','2021-08-23 23:44:25.777653'),(4,'pbkdf2_sha256$260000$uaaN6jo2SaFXtGGkOsqm6A$OdR3rk6zji103NWtiH0U1Id6mEjVApKP0VnhtZxJ2YM=',NULL,0,'ivanova','Наталья','Иванова','inn-1979@mail.ru',0,1,'2021-08-24 21:48:33.232010','users_avatars/cat_avatar_Mvw56cB.jpg','1979-05-14','267746524ad7c1ccddc32d4ccfac93d25bf15c53','2021-08-26 21:45:03.096364');
/*!40000 ALTER TABLE `authapp_investoruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_investoruser_groups`
--

DROP TABLE IF EXISTS `authapp_investoruser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authapp_investoruser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `investoruser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authapp_investoruser_gro_investoruser_id_group_id_b23d5b23_uniq` (`investoruser_id`,`group_id`),
  KEY `authapp_investoruser_groups_group_id_bb028105_fk_auth_group_id` (`group_id`),
  CONSTRAINT `authapp_investoruser_groups_group_id_bb028105_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `authapp_investoruser_investoruser_id_e9289730_fk_authapp_i` FOREIGN KEY (`investoruser_id`) REFERENCES `authapp_investoruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_investoruser_groups`
--

LOCK TABLES `authapp_investoruser_groups` WRITE;
/*!40000 ALTER TABLE `authapp_investoruser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `authapp_investoruser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_investoruser_user_permissions`
--

DROP TABLE IF EXISTS `authapp_investoruser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authapp_investoruser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `investoruser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authapp_investoruser_use_investoruser_id_permissi_2ffa026d_uniq` (`investoruser_id`,`permission_id`),
  KEY `authapp_investoruser_permission_id_f435bafb_fk_auth_perm` (`permission_id`),
  CONSTRAINT `authapp_investoruser_investoruser_id_32a3717c_fk_authapp_i` FOREIGN KEY (`investoruser_id`) REFERENCES `authapp_investoruser` (`id`),
  CONSTRAINT `authapp_investoruser_permission_id_f435bafb_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_investoruser_user_permissions`
--

LOCK TABLES `authapp_investoruser_user_permissions` WRITE;
/*!40000 ALTER TABLE `authapp_investoruser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `authapp_investoruser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authapp_investoruserprofile`
--

DROP TABLE IF EXISTS `authapp_investoruserprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authapp_investoruserprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tagline` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_me` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_user` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authapp_investoruser_user_id_4c12d4b2_fk_authapp_i` FOREIGN KEY (`user_id`) REFERENCES `authapp_investoruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authapp_investoruserprofile`
--

LOCK TABLES `authapp_investoruserprofile` WRITE;
/*!40000 ALTER TABLE `authapp_investoruserprofile` DISABLE KEYS */;
INSERT INTO `authapp_investoruserprofile` VALUES (1,'','','M','',1),(2,'','Офигенную жизнь и чашечку кофе, пожалуйста...)))*','M','',2),(3,'','Молодец, против овец','M','',3),(4,'жена','','W','I',4);
/*!40000 ALTER TABLE `authapp_investoruserprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brokerapp_broker`
--

DROP TABLE IF EXISTS `brokerapp_broker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brokerapp_broker` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brokerapp_broker`
--

LOCK TABLES `brokerapp_broker` WRITE;
/*!40000 ALTER TABLE `brokerapp_broker` DISABLE KEYS */;
INSERT INTO `brokerapp_broker` VALUES (1,'ФИНАМ','','АО «Инвестиционная компания «ФИНАМ». Лицензия на осуществление брокерской деятельности №177-02739-100000 от 09.11.2000 выдана ФКЦБ России без ограничения срока действия.\r\n\r\nООО «Управляющая компания «Финам Менеджмент». Лицензия на осуществление деятельности по управлению ценными бумагами №077-11748-001000 выдана ФСФР России без ограничения срока действия.\r\n\r\nАО «Банк ФИНАМ». Лицензия на осуществление банковских операций со средствами в рублях и иностранной валюте № 2799 от 29 сентября 2015 года.\r\n\r\nООО «ФИНАМ ФОРЕКС», лицензия профессионального участника рынка ценных бумаг на осуществление деятельности форекс-дилера № 045-13961-020000 от 14 декабря 2015 года.','https://www.finam.ru',1),(2,'Солид','Инвестиционно-финансовая компания «Солид»','- TOP 5 Рейтинг надежности и качества услуг НРА\r\n- TOP 20 Организаторов выпусков облигаций в России\r\n- TOP 25 Ведущих операторов Мосбиржи','https://solidbroker.ru',1),(3,'АО «Открытие Брокер»','','','https://open-broker.ru/invest/?widget=advisor',1),(4,'РИКОМ-ТРАСТ','Инвестиционная компания «РИКОМ-ТРАСТ»','Инвестиционная компания «РИКОМ-ТРАСТ» образована в 1994 году;\r\n\r\nМы входим в число 25 крупнейших инвестиционных компаний в России (рейтинг Московской биржи);\r\n\r\nСовокупная стоимость клиентских активов составляет более 3,5 млрд руб;\r\n\r\nВ 2019 году количество клиентов перешагнуло планку в 6300 человек.','https://www.ricom.ru',1),(5,'ООО «Альфа-Форекс»','','Альфа-Форекс — лицензированный форекс-дилер, учреждённый Альфа-Банком','https://alfaforex.ru',1);
/*!40000 ALTER TABLE `brokerapp_broker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brokerapp_brokerproduct`
--

DROP TABLE IF EXISTS `brokerapp_brokerproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brokerapp_brokerproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `broker_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brokerapp_brokerprod_broker_id_ef339fe8_fk_brokerapp` (`broker_id`),
  KEY `brokerapp_brokerprod_product_id_b16e5464_fk_mainapp_p` (`product_id`),
  CONSTRAINT `brokerapp_brokerprod_broker_id_ef339fe8_fk_brokerapp` FOREIGN KEY (`broker_id`) REFERENCES `brokerapp_broker` (`id`),
  CONSTRAINT `brokerapp_brokerprod_product_id_b16e5464_fk_mainapp_p` FOREIGN KEY (`product_id`) REFERENCES `mainapp_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brokerapp_brokerproduct`
--

LOCK TABLES `brokerapp_brokerproduct` WRITE;
/*!40000 ALTER TABLE `brokerapp_brokerproduct` DISABLE KEYS */;
INSERT INTO `brokerapp_brokerproduct` VALUES (4,1,'2021-08-24 22:53:52.126869','2021-08-24 22:53:52.126892',1,1),(5,1,'2021-08-24 22:54:24.259941','2021-08-24 22:54:24.259967',1,2),(6,1,'2021-08-24 22:54:47.543820','2021-08-24 22:54:47.543844',1,14),(7,1,'2021-08-24 22:55:06.765172','2021-08-24 22:55:06.765198',5,22),(8,1,'2021-08-24 22:55:17.843216','2021-08-24 22:55:17.843241',5,23),(9,1,'2021-08-24 22:55:35.477664','2021-08-24 22:55:35.477687',5,24),(10,1,'2021-08-24 22:55:47.798689','2021-08-24 22:55:47.798712',5,25),(11,1,'2021-08-24 22:56:00.942303','2021-08-24 22:56:00.942325',5,30),(12,1,'2021-08-24 22:56:10.718860','2021-08-24 22:56:10.718885',5,31);
/*!40000 ALTER TABLE `brokerapp_brokerproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_authapp_investoruser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authapp_investoruser_id` FOREIGN KEY (`user_id`) REFERENCES `authapp_investoruser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-08-24 20:32:43.448635','1','структурные продукты (безрисковые)',1,'[{\"added\": {}}]',13,3),(2,'2021-08-24 20:33:36.290310','2','структурные продукты с ограниченным риском',1,'[{\"added\": {}}]',13,3),(3,'2021-08-24 20:34:05.763102','1','безрисковые структурные продукты',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\"]}}]',13,3),(4,'2021-08-24 20:39:57.529488','3','акции',1,'[{\"added\": {}}]',13,3),(5,'2021-08-24 20:40:14.582420','4','облигации',1,'[{\"added\": {}}]',13,3),(6,'2021-08-24 20:40:40.912689','5','валюта',1,'[{\"added\": {}}]',13,3),(7,'2021-08-24 20:41:02.137835','6','фьючерсы',1,'[{\"added\": {}}]',13,3),(8,'2021-08-24 20:41:10.224236','7','драгоценные металлы',1,'[{\"added\": {}}]',13,3),(9,'2021-08-24 20:42:17.777808','1','НК Роснефть (акции)',1,'[{\"added\": {}}]',14,3),(10,'2021-08-24 20:42:47.371605','1','НК Роснефть (акции)',2,'[{\"changed\": {\"fields\": [\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',14,3),(11,'2021-08-24 20:43:45.949209','2','МТС (акции)',1,'[{\"added\": {}}]',14,3),(12,'2021-08-24 20:44:05.372312','1','НК Роснефть (акции)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',14,3),(13,'2021-08-24 20:45:24.568185','3','Bank of America Corporation (акции)',1,'[{\"added\": {}}]',14,3),(14,'2021-08-24 20:47:03.519065','4','Veritiv Corporation (акции)',1,'[{\"added\": {}}]',14,3),(15,'2021-08-24 20:48:00.077849','5','ГК Самолет (акции)',1,'[{\"added\": {}}]',14,3),(16,'2021-08-24 20:48:55.482203','6','Prothena Corporation plc (акции)',1,'[{\"added\": {}}]',14,3),(17,'2021-08-24 20:49:15.477558','7','Cortexyme Inc. (акции)',1,'[{\"added\": {}}]',14,3),(18,'2021-08-24 20:49:49.101496','8','Moderna Inc. (акции)',1,'[{\"added\": {}}]',14,3),(19,'2021-08-24 20:50:43.370208','9','Ашинский метзавод (акции)',1,'[{\"added\": {}}]',14,3),(20,'2021-08-24 20:51:37.967878','1','НК Роснефть (акции)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',14,3),(21,'2021-08-24 20:51:58.950378','2','МТС (акции)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',14,3),(22,'2021-08-24 20:52:20.648483','3','Bank of America Corporation (акции)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',14,3),(23,'2021-08-24 20:58:46.593428','4','Veritiv Corporation (акции)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',14,3),(24,'2021-08-24 21:08:26.101444','10','Банк ФК Открытие БО-П07 (облигации)',1,'[{\"added\": {}}]',14,3),(25,'2021-08-24 21:08:36.990585','11','ПИК СЗ БО-П04 (облигации)',1,'[{\"added\": {}}]',14,3),(26,'2021-08-24 21:09:06.459138','12','ВЭБ.РФ ВЭБ ПБО-001P-01 (облигации)',1,'[{\"added\": {}}]',14,3),(27,'2021-08-24 21:09:29.734383','13','МаксимаТелеком БО-П01 (облигации)',1,'[{\"added\": {}}]',14,3),(28,'2021-08-24 21:10:06.292796','14','ГК Самолет БО-П09 (облигации)',1,'[{\"added\": {}}]',14,3),(29,'2021-08-24 21:10:32.370303','15','Волга-Спорт 01 (облигации)',1,'[{\"added\": {}}]',14,3),(30,'2021-08-24 21:11:06.655980','16','ЛК Европлан 001P-03 (облигации)',1,'[{\"added\": {}}]',14,3),(31,'2021-08-24 21:12:06.031402','8','фонды',1,'[{\"added\": {}}]',13,3),(32,'2021-08-24 21:12:33.840688','17','Открытие - Всепогодный (фонды)',1,'[{\"added\": {}}]',14,3),(33,'2021-08-24 21:13:00.722101','18','БПИФ рыночных финансовых инструментов Открытие - Акции США (фонды)',1,'[{\"added\": {}}]',14,3),(34,'2021-08-24 21:13:35.537540','19','ЗПИФ недвижимости ПНК-Рентал (фонды)',1,'[{\"added\": {}}]',14,3),(35,'2021-08-24 21:13:59.696865','20','FinEx Акции ИТ-компаний США (фонды)',1,'[{\"added\": {}}]',14,3),(36,'2021-08-24 21:14:26.164609','21','FinEx Акции компаний Германии (фонды)',1,'[{\"added\": {}}]',14,3),(37,'2021-08-24 21:15:22.406214','22','USD/RUB (валюта)',1,'[{\"added\": {}}]',14,3),(38,'2021-08-24 21:16:00.353444','23','EUR/RUB (валюта)',1,'[{\"added\": {}}]',14,3),(39,'2021-08-24 21:16:35.006574','24','EUR/USD (валюта)',1,'[{\"added\": {}}]',14,3),(40,'2021-08-24 21:17:01.732794','25','GBP/RUB (валюта)',1,'[{\"added\": {}}]',14,3),(41,'2021-08-24 21:17:41.408303','26','UCAD-9.21 (фьючерсы)',1,'[{\"added\": {}}]',14,3),(42,'2021-08-24 21:18:17.037426','27','UCHF-9.21 (фьючерсы)',1,'[{\"added\": {}}]',14,3),(43,'2021-08-24 21:18:46.646694','28','Si-9.21 (фьючерсы)',1,'[{\"added\": {}}]',14,3),(44,'2021-08-24 21:19:23.219264','29','UJPY-9.21 (фьючерсы)',1,'[{\"added\": {}}]',14,3),(45,'2021-08-24 21:20:12.315813','30','GLD/RUB (драгоценные металлы)',1,'[{\"added\": {}}]',14,3),(46,'2021-08-24 21:21:02.010023','31','SLV/RUB (драгоценные металлы)',1,'[{\"added\": {}}]',14,3),(47,'2021-08-24 21:22:19.463473','32','АКБ Приморье (акции)',1,'[{\"added\": {}}]',14,3),(48,'2021-08-24 21:34:10.510479','1',' (НК Роснефть)',1,'[{\"added\": {}}]',15,3),(49,'2021-08-24 21:35:20.090526','2',' (Ашинский метзавод)',1,'[{\"added\": {}}]',15,3),(50,'2021-08-24 21:42:18.859910','3',' (МТС)',1,'[{\"added\": {}}]',15,3),(51,'2021-08-24 21:42:47.591955','4',' (Bank of America Corporation)',1,'[{\"added\": {}}]',15,3),(52,'2021-08-24 22:31:14.999522','1','Broker object (1)',1,'[{\"added\": {}}]',16,3),(53,'2021-08-24 22:34:50.776818','2','Broker object (2)',1,'[{\"added\": {}}]',16,3),(54,'2021-08-24 22:36:38.499247','3','Broker object (3)',1,'[{\"added\": {}}]',16,3),(55,'2021-08-24 22:38:37.036294','4','Broker object (4)',1,'[{\"added\": {}}]',16,3),(56,'2021-08-24 22:41:20.507206','5','Broker object (5)',1,'[{\"added\": {}}]',16,3),(57,'2021-08-24 22:53:52.129818','4','ФИНАМ (НК Роснефть)',1,'[{\"added\": {}}]',17,3),(58,'2021-08-24 22:54:24.261096','5','ФИНАМ (МТС)',1,'[{\"added\": {}}]',17,3),(59,'2021-08-24 22:54:47.544622','6','ФИНАМ (ГК Самолет БО-П09)',1,'[{\"added\": {}}]',17,3),(60,'2021-08-24 22:55:06.767723','7','ООО «Альфа-Форекс» (USD/RUB)',1,'[{\"added\": {}}]',17,3),(61,'2021-08-24 22:55:17.844635','8','ООО «Альфа-Форекс» (EUR/RUB)',1,'[{\"added\": {}}]',17,3),(62,'2021-08-24 22:55:35.478272','9','ООО «Альфа-Форекс» (EUR/USD)',1,'[{\"added\": {}}]',17,3),(63,'2021-08-24 22:55:47.799419','10','ООО «Альфа-Форекс» (GBP/RUB)',1,'[{\"added\": {}}]',17,3),(64,'2021-08-24 22:56:00.944099','11','ООО «Альфа-Форекс» (GLD/RUB)',1,'[{\"added\": {}}]',17,3),(65,'2021-08-24 22:56:10.719635','12','ООО «Альфа-Форекс» (SLV/RUB)',1,'[{\"added\": {}}]',17,3),(66,'2021-08-25 15:16:10.699690','1','Превосходная модель №1',1,'[{\"added\": {}}]',18,3),(67,'2021-08-25 15:17:21.081679','2','Лучшая модель',1,'[{\"added\": {}}]',18,3),(68,'2021-08-25 15:18:12.526229','1','Превосходная модель',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\"]}}]',18,3),(69,'2021-08-25 15:18:56.559835','1','Превосходная модель (НК Роснефть)',1,'[{\"added\": {}}]',19,3),(70,'2021-08-25 15:19:11.896163','2','Превосходная модель (МТС)',1,'[{\"added\": {}}]',19,3),(71,'2021-08-25 22:11:28.165016','1','Open long',1,'[{\"added\": {}}]',20,3),(72,'2021-08-25 22:11:36.964270','1','Open long',2,'[]',20,3),(73,'2021-08-25 22:11:49.545726','2','Open short',1,'[{\"added\": {}}]',20,3),(74,'2021-08-25 22:12:00.287067','3','Close long',1,'[{\"added\": {}}]',20,3),(75,'2021-08-25 22:12:11.856066','4','Close short',1,'[{\"added\": {}}]',20,3),(76,'2021-08-25 22:12:23.106058','5','Hold',1,'[{\"added\": {}}]',20,3),(77,'2021-08-25 22:13:07.791631','3','Превосходная модель (НК Роснефть)',1,'[{\"added\": {}}]',19,3),(78,'2021-08-25 22:13:29.229956','4','Превосходная модель (МТС)',1,'[{\"added\": {}}]',19,3),(79,'2021-08-25 22:13:55.115160','5','Превосходная модель (Bank of America Corporation)',1,'[{\"added\": {}}]',19,3),(80,'2021-08-25 22:14:46.785006','6','Превосходная модель (USD/RUB)',1,'[{\"added\": {}}]',19,3),(81,'2021-08-25 22:15:24.717804','7','Превосходная модель (GLD/RUB)',1,'[{\"added\": {}}]',19,3),(82,'2021-08-25 22:16:36.139688','4','Превосходная модель (МТС)',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 (\\u0434\\u043e\\u043b\\u044f)\"]}}]',19,3),(83,'2021-08-25 22:16:52.891275','4','Превосходная модель (МТС)',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 (\\u0434\\u043e\\u043b\\u044f)\"]}}]',19,3),(84,'2021-08-25 22:17:54.477794','8','Лучшая модель (Bank of America Corporation)',1,'[{\"added\": {}}]',19,3),(85,'2021-08-25 22:18:26.955085','9','Лучшая модель (FinEx Акции компаний Германии)',1,'[{\"added\": {}}]',19,3),(86,'2021-08-25 22:19:00.885678','10','Лучшая модель (БПИФ рыночных финансовых инструментов Открытие - Акции США)',1,'[{\"added\": {}}]',19,3),(87,'2021-08-25 22:19:30.066556','11','Лучшая модель (FinEx Акции ИТ-компаний США)',1,'[{\"added\": {}}]',19,3),(88,'2021-08-25 22:30:35.466940','3','InvestorUserProfile object (3)',2,'[{\"changed\": {\"fields\": [\"\\u041e \\u0441\\u0435\\u0431\\u0435\"]}}]',12,3),(89,'2021-08-25 22:30:48.494731','4','InvestorUserProfile object (4)',2,'[{\"changed\": {\"fields\": [\"\\u0422\\u0435\\u0433\\u0438\", \"\\u041f\\u043e\\u043b\", \"\\u0422\\u0438\\u043f \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\"]}}]',12,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(11,'authapp','investoruser'),(12,'authapp','investoruserprofile'),(16,'brokerapp','broker'),(17,'brokerapp','brokerproduct'),(4,'contenttypes','contenttype'),(14,'mainapp','product'),(13,'mainapp','productcategory'),(18,'modelapp','model'),(19,'modelapp','prediction'),(20,'modelapp','signal'),(15,'portfolioapp','portfolio'),(5,'sessions','session'),(6,'social_django','association'),(7,'social_django','code'),(8,'social_django','nonce'),(10,'social_django','partial'),(9,'social_django','usersocialauth');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3mo4vlbplnaomijv08ima3ro2geyva9d','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIbb1:cx44GAKufyaMflFXO41657XpoLtl2gBi_rWbKHIBjGI','2021-09-07 21:56:27.297429'),('4lqy2tk52hvof502g7wi1kwdeuz0xpg4','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIbyW:uaL7DAgg9lVx-kmWHGwJplklX4UX7NXMYDelhSrgP3M','2021-09-07 22:20:44.781011'),('4ph9d4izvwjy62nq7tpb4irok8souljf','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIVoj:Vq0ifZaMyH9P6mfB_pwV3PbMoUs4UhMwwDex42UZDY0','2021-09-07 15:46:13.700923'),('atvqdcqv682ybt9y6or3o8n6pqghrfkp','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIbsL:v6Xtqp9fep8nZ4c5ZOBbJ04mCgjcQGcq7yLX4XtfSIU','2021-09-07 22:14:21.896022'),('bq4yqc9rx9m4u34cbbdy2jypbo8rz0gm','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIW6B:rDtYsPllplBMQJ_UwVIj1K45T0SR3RHzfJSjhx5w7qY','2021-09-07 16:04:15.997355'),('cfbd9jm11pxr7hlhgg9r64whuzxmzw9z','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIVUh:zbpfajgACFGdyaWv_rnO1MnT3V4IboHfM_j4TcDIOjE','2021-09-07 15:25:31.994138'),('flji791e55rnk7y3xrjxwgojhdy30wq0','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIcT2:yowzkGIe8HEe0DPjQ39R5FJ386YHRdLzVpYRZZW-TOI','2021-09-07 22:52:16.758405'),('h23x20cdn37jlf89t9bws8mwyj3lzlvn','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIync:hn1JmSgosVmGJDphjvUUYnC8QETy-H7E48DjWho-jUY','2021-09-08 22:43:00.842141'),('kaen3780anj1gv6rqvlvl4x188dgmtze','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mHq6y:lstpVd38yxie-AIcr37wax8yNVItMTWtXb5qOsg9hTU','2021-09-05 19:14:16.455869'),('qxvwkancafmad1fncggwkcqfvqa3wsgb','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mNxKa:PpK-GYt8ykeXw-1oinQmitetsvmt1GkpBYcepxVQKmo','2021-09-22 16:09:36.824502'),('sx8npsywd08up5crqyjonvpo8mznalm7','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mKN9n:2sf4QAhgjQ33ZrJ70d5OPdPtueoyCGa-nowwJYabS0U','2021-09-12 18:55:39.927448'),('zp5slqjhhno8zdrks4j69jkokkda7c9n','.eJxVjEEOwiAQRe_C2hBgSmdw6d4zkIEptmpoUtqV8e7apAvd_vfef6nI2zrGrQ1LnESdFajT75Y4P4a6A7lzvc06z3VdpqR3RR-06essw_NyuH8HI7fxWxNkBkh9L4TFoBVi8hCCMTmUznumDnuHCW2HYqkYtuLIFmB0wMGq9wfBEza_:1mIVkt:zzUEtEeS0A1xTg6yXXEbHW5O0NU3eBkog3XV7wmmY-c','2021-09-07 15:42:15.791583');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_product`
--

DROP TABLE IF EXISTS `mainapp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mainapp_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mainapp_product_category_id_adb0278b_fk_mainapp_p` (`category_id`),
  CONSTRAINT `mainapp_product_category_id_adb0278b_fk_mainapp_p` FOREIGN KEY (`category_id`) REFERENCES `mainapp_productcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_product`
--

LOCK TABLES `mainapp_product` WRITE;
/*!40000 ALTER TABLE `mainapp_product` DISABLE KEYS */;
INSERT INTO `mainapp_product` VALUES (1,'НК Роснефть','Интегрированные нефтяные и газо...','«НК Роснефть» — крупнейшая нефтяная компания в Российской Федерации. Занимается поиском, разведкой месторождений, добычей нефти, газа, газового конденсата, переработкой и последующим производством нефтепродуктов. Зарегистрирована в 1994 году в Москве, в 2016 году из открытого акционерного общества реорганизована в публичное. Находится в перечне стратегических предприятий страны.',1,3),(2,'МТС','Беспроводные телекоммуникационн...','«МТС» («Мобильные ТелеСистемы») — ведущий российский оператор связи. Образован в 1993 году, в 2015 году из открытого акционерного общества реорганизован в публичное. Штаб-квартира расположена в Москве. Компания и ее дочерние предприятия работают во всех регионах России, в Армении, Республике Беларусь, Украине, Узбекистане и Туркменистане. Приоритетное направление развития «МТС» — расширение сетей передачи данных, домашнего и мобильного интернета.',1,3),(3,'Bank of America Corporation','Банки - NEC','Компания Bank of America Corporation является банковской и финансовой холдинговой компанией. Компания представляет собой крупнейший финансовый институт в мире, обслуживающий физических лиц, малый и средний бизнес, институциональных инвесторов, крупные корпорации и правительства. Компания предоставляет своим клиентам полный комплекс инвестиционных услуг, услуг по управлению активами, управлению рисками и других финансовых продуктов и услуг. Компания была основана в 1784 году и в 1998 году зарегистрирована в качестве корпорации, учрежденной в соответствии с законодательством штата Делавэр.',1,3),(4,'Veritiv Corporation','Грузовая логистика','Veritiv Corporation является ведущим североамериканским дистрибьютором упаковки, печатных и издательских продуктов и услуг для корпоративных клиентов. Кроме того, компания предлагает своим клиентам решения по управлению логистикой и цепочкой поставок. Эмитент управляет примерно 160 дистрибьюторскими центрами, в основном, в США, Канаде и Мексике, обслуживая клиентов из разнообразных отраслей. В числе клиентов Veritiv Corporation типографии, издатели, центры обработки данных, производители, высшие учебные заведения, медицинские учреждения, спортивные арены, розничные магазины, государственные ведомства, управляющие недвижимостью и поставщики коммунальных услуг.',1,3),(5,'ГК Самолет','ГК Самолет','',1,3),(6,'Prothena Corporation plc','Биофармацевтические лекарства','',1,3),(7,'Cortexyme Inc.','Биотехнологии и медицинские исс...','',1,3),(8,'Moderna Inc.','Биотехнологии и медицинские исс...','',1,3),(9,'Ашинский метзавод','Металлургические комбинаты','',1,3),(10,'Банк ФК Открытие БО-П07','Облигации российских компаний','',1,4),(11,'ПИК СЗ БО-П04','','',1,4),(12,'ВЭБ.РФ ВЭБ ПБО-001P-01','','',1,4),(13,'МаксимаТелеком БО-П01','','',1,4),(14,'ГК Самолет БО-П09','','',1,4),(15,'Волга-Спорт 01','','',1,4),(16,'ЛК Европлан 001P-03','','',1,4),(17,'Открытие - Всепогодный','','',1,8),(18,'БПИФ рыночных финансовых инструментов Открытие - Акции США','','',1,8),(19,'ЗПИФ недвижимости ПНК-Рентал','','',1,8),(20,'FinEx Акции ИТ-компаний США','','',1,8),(21,'FinEx Акции компаний Германии','','',1,8),(22,'USD/RUB','Валютные пары','',1,5),(23,'EUR/RUB','Валютные пары','',1,5),(24,'EUR/USD','Валютные пары','',1,5),(25,'GBP/RUB','Валютные пары','',1,5),(26,'UCAD-9.21','Курс доллар США – канадский доллар (USDCAD_REUTERS)','',1,6),(27,'UCHF-9.21','Курс доллар США – швейцарский франк (USDCHF_REUTERS)','',1,6),(28,'Si-9.21','Фиксинг доллар США / российский рубль Московской Биржи (USDFIXME)','',1,6),(29,'UJPY-9.21','Курс доллар США – японская йена (USDJPY_REUTERS)','',1,6),(30,'GLD/RUB','Пары металл-валюта','',1,7),(31,'SLV/RUB','Пары металл-валюта','',1,7),(32,'АКБ Приморье','Акции российских компаний','',1,3);
/*!40000 ALTER TABLE `mainapp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_productcategory`
--

DROP TABLE IF EXISTS `mainapp_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mainapp_productcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `short_desc` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_productcategory`
--

LOCK TABLES `mainapp_productcategory` WRITE;
/*!40000 ALTER TABLE `mainapp_productcategory` DISABLE KEYS */;
INSERT INTO `mainapp_productcategory` (`id`, `name`, `description`, `is_active`, `created`, `updated`, `short_desc`) VALUES (1,'безрисковые структурные продукты','Безрисковые продукты, которые гарантируют возврат 100% капитала.',1,'2021-08-24 20:32:43.437847','2021-08-24 20:34:05.758600',''),(2,'структурные продукты с ограниченным риском','Продукты с ограниченным риском, в которых активы делятся на две части, чтобы покрыть возможный убыток от рискованных вложений.',1,'2021-08-24 20:33:36.288530','2021-08-24 20:33:36.288560',''),(3,'акции','',1,'2021-08-24 20:39:57.527526','2021-08-24 20:39:57.527553',''),(4,'облигации','',1,'2021-08-24 20:40:14.581514','2021-08-24 20:40:14.581541',''),(5,'валюта','',1,'2021-08-24 20:40:40.911985','2021-08-24 20:40:40.912007',''),(6,'фьючерсы','',1,'2021-08-24 20:41:02.136508','2021-08-24 20:41:02.136531',''),(7,'драгоценные металлы','',1,'2021-08-24 20:41:10.223520','2021-08-24 20:41:10.223545',''),(8,'фонды','',1,'2021-08-24 21:12:06.029705','2021-08-24 21:12:06.029742','');
/*!40000 ALTER TABLE `mainapp_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelapp_model`
--

DROP TABLE IF EXISTS `modelapp_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelapp_model` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `secret_key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelapp_model`
--

LOCK TABLES `modelapp_model` WRITE;
/*!40000 ALTER TABLE `modelapp_model` DISABLE KEYS */;
INSERT INTO `modelapp_model` (`id`, `name`, `short_desc`, `description`, `is_active`, `secret_key`,`pub_key`) VALUES (1,'Превосходная модель','от Марата','',1,'',''),(2,'Лучшая модель','от Евгения','',1,'','');
/*!40000 ALTER TABLE `modelapp_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelapp_signal`
--

DROP TABLE IF EXISTS `modelapp_signal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelapp_signal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelapp_signal`
--

LOCK TABLES `modelapp_signal` WRITE;
/*!40000 ALTER TABLE `modelapp_signal` DISABLE KEYS */;
INSERT INTO `modelapp_signal` VALUES (1,'Open long',1),(2,'Open short',1),(3,'Close long',1),(4,'Close short',1),(5,'Hold',1);
/*!40000 ALTER TABLE `modelapp_signal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolioapp_portfolio`
--

DROP TABLE IF EXISTS `portfolioapp_portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolioapp_portfolio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolioapp_portfolio_product_id_41af81c2_fk_mainapp_product_id` (`product_id`),
  KEY `portfolioapp_portfol_user_id_576a5ab1_fk_authapp_i` (`user_id`),
  CONSTRAINT `portfolioapp_portfol_user_id_576a5ab1_fk_authapp_i` FOREIGN KEY (`user_id`) REFERENCES `authapp_investoruser` (`id`),
  CONSTRAINT `portfolioapp_portfolio_product_id_41af81c2_fk_mainapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `mainapp_product` (`id`),
  CONSTRAINT `portfolioapp_portfolio_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolioapp_portfolio`
--

LOCK TABLES `portfolioapp_portfolio` WRITE;
/*!40000 ALTER TABLE `portfolioapp_portfolio` DISABLE KEYS */;
INSERT INTO `portfolioapp_portfolio` VALUES (1,10,1,1,3),(2,5,1,9,3),(3,8,1,2,3),(4,12,0,3,3);
/*!40000 ALTER TABLE `portfolioapp_portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_authapp_i` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_authapp_i` FOREIGN KEY (`user_id`) REFERENCES `authapp_investoruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'vk-oauth2','96696609','{\"auth_time\": 1631106552, \"id\": 96696609, \"expires\": 86400, \"access_token\": \"b5c2e4872341c8d7ca82afa11863bc0b2fa8a791559021687b9c3a59eb4ed58c98164eecaa7ebab9b9c8b\", \"token_type\": null}',1,'2021-08-21 23:43:38.476681','2021-09-08 16:09:12.600346'),(2,'odnoklassniki-oauth2','107955373323','{\"auth_time\": 1629648835, \"refresh_token\": \"889585cde6ac6190bc26ec571b9958d8ac844_107955373323_1629644\", \"expires\": \"1800\", \"access_token\": \"-s-9T4GwMAClX-GX89mhCXHoZ7lhAarnK-DiaXGWYBmVaYGia4\", \"token_type\": null}',2,'2021-08-21 23:43:50.224494','2021-08-22 19:13:55.534490');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'finadviser'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-08 16:32:24

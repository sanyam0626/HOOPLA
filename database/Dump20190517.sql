-- MySQL dump 10.13  Distrib 8.0.14, for macos10.14 (x86_64)
--
-- Host: localhost    Database: hdb
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add role',7,'add_role'),(20,'Can change role',7,'change_role'),(21,'Can delete role',7,'delete_role'),(22,'Can add user detail',8,'add_userdetail'),(23,'Can change user detail',8,'change_userdetail'),(24,'Can delete user detail',8,'delete_userdetail'),(25,'Can add prod type',9,'add_prodtype'),(26,'Can change prod type',9,'change_prodtype'),(27,'Can delete prod type',9,'delete_prodtype'),(28,'Can add product',10,'add_product'),(29,'Can change product',10,'change_product'),(30,'Can delete product',10,'delete_product'),(31,'Can add prod categories',11,'add_prodcategories'),(32,'Can change prod categories',11,'change_prodcategories'),(33,'Can delete prod categories',11,'delete_prodcategories'),(34,'Can add prod brand',12,'add_prodbrand'),(35,'Can change prod brand',12,'change_prodbrand'),(36,'Can delete prod brand',12,'delete_prodbrand'),(37,'Can add prod size',13,'add_prodsize'),(38,'Can change prod size',13,'change_prodsize'),(39,'Can delete prod size',13,'delete_prodsize'),(40,'Can add temp product',14,'add_tempproduct'),(41,'Can change temp product',14,'change_tempproduct'),(42,'Can delete temp product',14,'delete_tempproduct'),(43,'Can add sale table',15,'add_saletable'),(44,'Can change sale table',15,'change_saletable'),(45,'Can delete sale table',15,'delete_saletable'),(46,'Can add PayPal IPN',16,'add_paypalipn'),(47,'Can change PayPal IPN',16,'change_paypalipn'),(48,'Can delete PayPal IPN',16,'delete_paypalipn'),(49,'Can add payment token',17,'add_paymenttoken'),(50,'Can change payment token',17,'change_paymenttoken'),(51,'Can delete payment token',17,'delete_paymenttoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$uNoxm28RMpw1$DxTpDR1EN4W11+xWgnzkew3VslJo2C13dTGJua8KaFk=','2019-04-10 05:21:47.867156',1,'Sanyam','Sanyam','Moudgil','sanyamm02@gmail.com',1,1,'2019-04-09 05:30:30.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-09 05:31:59.211339','1','Role object (1)',1,'[{\"added\": {}}]',7,1),(2,'2019-04-09 05:32:03.379108','2','Role object (2)',1,'[{\"added\": {}}]',7,1),(3,'2019-04-09 05:32:06.178215','3','Role object (3)',1,'[{\"added\": {}}]',7,1),(4,'2019-04-09 05:32:09.352331','4','Role object (4)',1,'[{\"added\": {}}]',7,1),(5,'2019-04-09 05:33:59.878172','sanyam123@gmail.com','UserDetail object (sanyam123@gmail.com)',1,'[{\"added\": {}}]',8,1),(6,'2019-04-09 05:35:18.597220','1','Sanyam',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\"]}}]',4,1),(7,'2019-04-10 05:23:36.200535','user1@gmail.com','UserDetail object (user1@gmail.com)',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'ipn','paypalipn'),(17,'manager','paymenttoken'),(12,'manager','prodbrand'),(11,'manager','prodcategories'),(13,'manager','prodsize'),(9,'manager','prodtype'),(10,'manager','product'),(7,'manager','role'),(15,'manager','saletable'),(14,'manager','tempproduct'),(8,'manager','userdetail'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-09 05:29:05.427350'),(2,'auth','0001_initial','2019-04-09 05:29:05.697221'),(3,'admin','0001_initial','2019-04-09 05:29:05.775795'),(4,'admin','0002_logentry_remove_auto_add','2019-04-09 05:29:05.785870'),(5,'contenttypes','0002_remove_content_type_name','2019-04-09 05:29:05.850819'),(6,'auth','0002_alter_permission_name_max_length','2019-04-09 05:29:05.889433'),(7,'auth','0003_alter_user_email_max_length','2019-04-09 05:29:05.914795'),(8,'auth','0004_alter_user_username_opts','2019-04-09 05:29:05.924761'),(9,'auth','0005_alter_user_last_login_null','2019-04-09 05:29:05.956113'),(10,'auth','0006_require_contenttypes_0002','2019-04-09 05:29:05.958887'),(11,'auth','0007_alter_validators_add_error_messages','2019-04-09 05:29:05.969049'),(12,'auth','0008_alter_user_username_max_length','2019-04-09 05:29:06.003884'),(13,'auth','0009_alter_user_last_name_max_length','2019-04-09 05:29:06.040063'),(14,'manager','0001_initial','2019-04-09 05:29:06.094705'),(15,'sessions','0001_initial','2019-04-09 05:29:06.114930'),(16,'manager','0002_prodcategories_prodtype_product','2019-04-09 16:23:21.123710'),(17,'manager','0003_auto_20190410_0529','2019-04-10 05:29:28.173475'),(18,'manager','0004_auto_20190410_0612','2019-04-10 06:12:16.837052'),(19,'manager','0005_product_prod_description','2019-04-10 06:13:22.912245'),(20,'manager','0006_auto_20190412_0737','2019-04-12 07:38:19.577223'),(21,'manager','0007_auto_20190423_0422','2019-04-23 04:22:54.964880'),(22,'manager','0008_auto_20190501_0453','2019-05-01 04:53:18.240166'),(23,'manager','0009_remove_product_prod_image','2019-05-02 05:22:10.512577'),(24,'manager','0010_tempproduct','2019-05-03 05:41:14.515019'),(25,'manager','0011_saletable','2019-05-09 10:25:03.847809'),(26,'manager','0012_auto_20190514_0656','2019-05-14 06:56:35.938284'),(27,'ipn','0001_initial','2019-05-15 04:13:07.286058'),(28,'ipn','0002_paypalipn_mp_id','2019-05-15 04:13:07.332921'),(29,'ipn','0003_auto_20141117_1647','2019-05-15 04:13:07.442855'),(30,'ipn','0004_auto_20150612_1826','2019-05-15 04:13:08.737778'),(31,'ipn','0005_auto_20151217_0948','2019-05-15 04:13:08.803730'),(32,'ipn','0006_auto_20160108_1112','2019-05-15 04:13:08.922193'),(33,'ipn','0007_auto_20160219_1135','2019-05-15 04:13:08.939973'),(34,'ipn','0008_auto_20181128_1032','2019-05-15 04:13:08.959414'),(35,'manager','0013_paymenttoken','2019-05-16 07:03:52.041378');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2478o212bv9jxq2oxmyxztvf8zqqp1u9','YzM3ZGY4ZWM4MWU3ZmZiZmMyYjlmM2QzZTkwNzQ2ODQwZmRlZGJjMjp7IkF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJlbWFpbGlkIjoiIiwicm9sZWlkIjoxLCJyb2xlX2lkIjoiIiwibmFtZSI6IlNhbnlhbSIsImltYWdlIjoic2FueWFtLmpwZyIsImludm9pY2UiOiIiLCJ0b3RhbCI6IiIsImFkZHJlc3MiOiIiLCJsYW5kbWFyayI6IiIsInBpbiI6IiIsIm1vZGUiOiJQYXlQYWwiLCJ0b2tlbiI6IiIsInNpemUiOiIifQ==','2019-05-31 06:46:10.785148'),('7utm54o0ylz8ir978f24259gr0ynk26t','NGJhOTViYTllYTYxYjY5Yzk2NjUyOWE0YjM1ZWJhN2JiZDA5Mjg1Njp7IkF1dGhlbnRpY2F0ZWQiOnRydWUsImVtYWlsaWQiOiJzYW55YW0xMjNAZ21haWwuY29tIiwicm9sZWlkIjoxfQ==','2019-05-02 04:57:30.278500'),('cgfalyzkhphh02qh2jm4t58karcjq81s','OTBhYzhjZjQ4NGJiMzA4OGRkODA5NWIwYzdlYzNmZGM0NDEwNzhiZjp7ImFkZHJlc3MiOiIiLCJsYW5kbWFyayI6IiIsInBpbiI6IiIsImludm9pY2UiOiIiLCJ0b3RhbCI6IiIsInRva2VuIjoiIiwic2l6ZSI6IiJ9','2019-05-31 06:54:44.129176'),('uuaqgacqyfg7kif6nwu2jwzt0es3mi1a','MjEzODFjZTBkYTA5MjU4ZmYxZTJkNDhlYWVlZWFkZjlmMDE4YzBmNDp7ImFkZHJlc3MiOiIiLCJsYW5kbWFyayI6IiIsInBpbiI6IiIsImludm9pY2UiOiIiLCJ0b3RhbCI6IiIsInRva2VuIjoiIiwic2l6ZSI6IiIsIkF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJlbWFpbGlkIjoiIiwicm9sZV9pZCI6IiIsIm5hbWUiOiJWaXNoYXYiLCJtb2RlIjoiUGF5UGFsIn0=','2019-05-31 07:29:38.547867');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_paymenttoken`
--

DROP TABLE IF EXISTS `manager_paymenttoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_paymenttoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_paymenttoken`
--

LOCK TABLES `manager_paymenttoken` WRITE;
/*!40000 ALTER TABLE `manager_paymenttoken` DISABLE KEYS */;
INSERT INTO `manager_paymenttoken` VALUES (1,'smoudgil_be15@thapar.edu','8253987668356','#987668356'),(2,'smoudgil_be15@thapar.edu','1211987677165','#987677165'),(4,'smoudgil_be15@thapar.edu','5704987611334','987611334'),(5,'smoudgil_be15@thapar.edu','7205987678813','987678813'),(6,'smoudgil_be15@thapar.edu','3532828379022','828379022'),(7,'smoudgil_be15@thapar.edu','3926828382568','828382568'),(8,'smoudgil_be15@thapar.edu','2833828350258','828350258'),(9,'smoudgil_be15@thapar.edu','7869828360866','828360866'),(10,'smoudgil_be15@thapar.edu','5985828339230','828339230'),(11,'smoudgil_be15@thapar.edu','8556828345697','828345697'),(12,'vishavmahajan96@gmail.com','6838750889032','750889032');
/*!40000 ALTER TABLE `manager_paymenttoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_prodbrand`
--

DROP TABLE IF EXISTS `manager_prodbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_prodbrand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_prodbrand`
--

LOCK TABLES `manager_prodbrand` WRITE;
/*!40000 ALTER TABLE `manager_prodbrand` DISABLE KEYS */;
INSERT INTO `manager_prodbrand` VALUES (1,'Nike',1),(2,'Adidas',1),(3,'Zara',1),(4,'Allen Solly',1),(5,'Champion',1),(6,'Calvin Klein',1),(7,'Titan',1),(8,'Tag-Heuer',1),(9,'Tommy Hilfiger',1),(10,'Reebok',1),(11,'United Colors of Benetton',1),(12,'Sparx',1),(13,'Jack & Jones',1),(14,'Carlton London',1),(15,'Puma',1),(16,'Cole Haan',1),(17,'Vans',1),(18,'Levis',1),(19,'Blackberry',1),(20,'Skybags',1),(21,'Under Armour',1),(22,'Biba',1),(23,'Madame',1);
/*!40000 ALTER TABLE `manager_prodbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_prodcategories`
--

DROP TABLE IF EXISTS `manager_prodcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_prodcategories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(225) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_prodcategories`
--

LOCK TABLES `manager_prodcategories` WRITE;
/*!40000 ALTER TABLE `manager_prodcategories` DISABLE KEYS */;
INSERT INTO `manager_prodcategories` VALUES (1,'Mens',1),(2,'Women',1),(3,'Shoes',1),(4,'Bags',1);
/*!40000 ALTER TABLE `manager_prodcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_prodsize`
--

DROP TABLE IF EXISTS `manager_prodsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_prodsize` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `type_id_id` int(11) NOT NULL,
  PRIMARY KEY (`size_id`),
  KEY `manager_prodsize_type_id_id_58af3a60_fk_manager_prodtype_type_id` (`type_id_id`),
  CONSTRAINT `manager_prodsize_type_id_id_58af3a60_fk_manager_prodtype_type_id` FOREIGN KEY (`type_id_id`) REFERENCES `manager_prodtype` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_prodsize`
--

LOCK TABLES `manager_prodsize` WRITE;
/*!40000 ALTER TABLE `manager_prodsize` DISABLE KEYS */;
INSERT INTO `manager_prodsize` VALUES (4,'L',1,1),(5,'XL',1,8),(6,'Free Size',1,6),(9,'M',1,1),(10,'Free Size',1,19),(11,'All',1,21),(12,'All',1,22),(13,'All',1,23),(14,'All',1,24),(15,'All',1,25);
/*!40000 ALTER TABLE `manager_prodsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_prodtype`
--

DROP TABLE IF EXISTS `manager_prodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_prodtype` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_prodtype`
--

LOCK TABLES `manager_prodtype` WRITE;
/*!40000 ALTER TABLE `manager_prodtype` DISABLE KEYS */;
INSERT INTO `manager_prodtype` VALUES (1,'Shirts',1),(2,'T-Shirt',1),(3,'Blazer',1),(4,'Track Pant',1),(5,'Jeans',1),(6,'Belt',1),(7,'Watch',1),(8,'Sweatshirt',1),(9,'Flip-Flop',1),(10,'Heels',1),(11,'Running',1),(12,'Formal',1),(13,'Canvas',1),(14,'Skirt',1),(15,'Tights',1),(16,'Top',1),(17,'Bellie',1),(18,'Casual',1),(19,'Socks',1),(20,'Shorts',1),(21,'Laptop ',1),(22,'Duffel',1),(23,'Hand-Held Bag',1),(24,'Swiss',1),(25,'Backpack',1);
/*!40000 ALTER TABLE `manager_prodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_product`
--

DROP TABLE IF EXISTS `manager_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(255) NOT NULL,
  `prod_price` varchar(255) NOT NULL,
  `prod_qty` varchar(55) NOT NULL,
  `prod_creationdate` varchar(200) NOT NULL,
  `cat_id_id` int(11) NOT NULL,
  `type_id_id` int(11) NOT NULL,
  `user_email_id` varchar(225) NOT NULL,
  `prod_img1` varchar(255) NOT NULL,
  `prod_img2` varchar(255),
  `prod_img3` varchar(255),
  `prod_img4` varchar(255),
  `brand_id_id` int(11) NOT NULL,
  `size_id_id` int(11) NOT NULL,
  `prod_description` varchar(2000),
  PRIMARY KEY (`prod_id`),
  KEY `manager_product_cat_id_id_68f69f00_fk_manager_p` (`cat_id_id`),
  KEY `manager_product_type_id_id_7552d3be_fk_manager_prodtype_type_id` (`type_id_id`),
  KEY `manager_product_user_email_id_438cafab_fk_manager_u` (`user_email_id`),
  KEY `manager_product_brand_id_id_5a5b01a1_fk_manager_p` (`brand_id_id`),
  KEY `manager_product_size_id_id_b6e6e1de_fk_manager_prodsize_size_id` (`size_id_id`),
  CONSTRAINT `manager_product_brand_id_id_5a5b01a1_fk_manager_p` FOREIGN KEY (`brand_id_id`) REFERENCES `manager_prodbrand` (`brand_id`),
  CONSTRAINT `manager_product_cat_id_id_68f69f00_fk_manager_p` FOREIGN KEY (`cat_id_id`) REFERENCES `manager_prodcategories` (`cat_id`),
  CONSTRAINT `manager_product_size_id_id_b6e6e1de_fk_manager_prodsize_size_id` FOREIGN KEY (`size_id_id`) REFERENCES `manager_prodsize` (`size_id`),
  CONSTRAINT `manager_product_type_id_id_7552d3be_fk_manager_prodtype_type_id` FOREIGN KEY (`type_id_id`) REFERENCES `manager_prodtype` (`type_id`),
  CONSTRAINT `manager_product_user_email_id_438cafab_fk_manager_u` FOREIGN KEY (`user_email_id`) REFERENCES `manager_userdetail` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_product`
--

LOCK TABLES `manager_product` WRITE;
/*!40000 ALTER TABLE `manager_product` DISABLE KEYS */;
INSERT INTO `manager_product` VALUES (4,'Formal Blue Shirt','600','48','2019-05-02',1,1,'sanyamm02@gmail.com','m1.jpg','','','',4,4,'Cotton fabric, Hand made, Comfortable to wear during summers. '),(5,'Grey sweatshirt','800','50','2019-05-03',1,8,'sanyamm02@gmail.com','m2.jpg','','','',13,5,'GOOD'),(6,'Black track pant','1200','48','2019-05-03',1,4,'sanyamm02@gmail.com','m3.jpg','','','',2,4,''),(7,'Round neck t-shirt','700','49','2019-05-03',1,2,'sanyamm02@gmail.com','m4.jpg','','','',6,4,'GOOD'),(8,'Blue denim','1200','50','2019-05-03',1,5,'sanyamm02@gmail.com','m5.jpg','','','',11,5,'GOOD'),(9,'Reversible belt black brown','399','49','2019-05-03',1,6,'sanyamm02@gmail.com','m6.jpg','','','',6,4,'Good'),(10,'Grey metallic watch','4999','49','2019-05-03',1,7,'sanyamm02@gmail.com','m7.jpg','','','',8,6,'Good'),(11,'Grey black blazer','2500','50','2019-05-03',1,3,'sanyamm02@gmail.com','m8.jpg','','','',3,4,'Good'),(12,'Black tights dri-fit','1200','50','2019-05-04',2,15,'sanyamm02@gmail.com','w8.jpg','','','',10,4,'Good'),(13,'Checkered skirt','899','50','2019-05-04',2,14,'sanyamm02@gmail.com','w1.jpg','','','',11,4,'Good'),(14,'Black top','1499','50','2019-05-04',2,16,'sanyamm02@gmail.com','w2.jpg','','','',23,4,'Good'),(15,'Pink track pant','899','46','2019-05-04',2,4,'sanyamm02@gmail.com','w5.jpg','','','',1,4,'Good'),(16,'Analog metallic watch','2499','25','2019-05-04',2,7,'sanyamm02@gmail.com','w6.jpg','','','',7,6,'Good'),(17,'Black cotton socks','499','38','2019-05-04',2,19,'sanyamm02@gmail.com','w7.jpg','','','',2,10,'Good'),(18,'Black jeans','3499','55','2019-05-04',2,5,'sanyamm02@gmail.com','w3.jpg','','','',3,5,'Good'),(19,'Dotted black shorts','600','30','2019-05-04',2,20,'sanyamm02@gmail.com','w4.jpg','','','',11,4,'Good'),(20,'Laptop messenger bag','1200','40','2019-05-09',4,21,'sanyamm02@gmail.com','b1.jpg','','','',6,11,'Good'),(21,'Puma backpack ','1500','50','2019-05-09',4,25,'sanyamm02@gmail.com','b2.jpg','','','',15,11,'Good'),(22,'Laptop bag','1299','55','2019-05-09',4,21,'sanyamm02@gmail.com','b3.jpg','','','',20,13,'Good'),(23,'Hand-held bag','899','30','2019-05-09',4,23,'sanyamm02@gmail.com','b4.jpg','','','',12,11,'Good'),(24,'Costa swiss bag','1199','30','2019-05-09',4,24,'sanyamm02@gmail.com','b7.jpg','','','',9,14,'Good'),(25,'Black hand-held bag','599','50','2019-05-09',4,23,'sanyamm02@gmail.com','b5.jpg','','','',22,14,'Good'),(26,'Butterflies bag','899','50','2019-05-09',4,24,'sanyamm02@gmail.com','b6.jpg','','','',23,11,'Good'),(27,'Noble designs bag','1200','50','2019-05-09',4,22,'sanyamm02@gmail.com','b8.jpg','','','',20,14,'Good');
/*!40000 ALTER TABLE `manager_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_role`
--

DROP TABLE IF EXISTS `manager_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(200) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_role`
--

LOCK TABLES `manager_role` WRITE;
/*!40000 ALTER TABLE `manager_role` DISABLE KEYS */;
INSERT INTO `manager_role` VALUES (1,'Manager'),(2,'User'),(3,'Seller');
/*!40000 ALTER TABLE `manager_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_saletable`
--

DROP TABLE IF EXISTS `manager_saletable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_saletable` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(35) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_name` varchar(55) NOT NULL,
  `prod_size` varchar(255) DEFAULT NULL,
  `prod_type` varchar(25) NOT NULL,
  `prod_cat` varchar(25) NOT NULL,
  `total` int(11) NOT NULL,
  `payment_mode` varchar(35) NOT NULL,
  `sale_date` varchar(35) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_landmark` varchar(30) NOT NULL,
  `user_mobile` varchar(55) NOT NULL,
  `user_pincode` varchar(25) NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_saletable`
--

LOCK TABLES `manager_saletable` WRITE;
/*!40000 ALTER TABLE `manager_saletable` DISABLE KEYS */;
INSERT INTO `manager_saletable` VALUES (1,'#987669094',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamM','','1','1',600,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(2,'#987669094',5,'Grey sweatshirt',1,800,'smoudgil_be15@thapar.edu','SanyamM','','8','1',800,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(3,'#987669094',9,'Reversible belt black brown',1,399,'smoudgil_be15@thapar.edu','SanyamM','','6','1',399,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(4,'#987695383',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamM','','1','1',600,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(5,'#987695383',5,'Grey sweatshirt',1,800,'smoudgil_be15@thapar.edu','SanyamM','','8','1',800,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(6,'#987695383',9,'Reversible belt black brown',1,399,'smoudgil_be15@thapar.edu','SanyamM','','6','1',399,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(7,'#987695383',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamM','','1','1',600,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(8,'#987695383',5,'Grey sweatshirt',1,800,'smoudgil_be15@thapar.edu','SanyamM','','8','1',800,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(9,'#987695383',9,'Reversible belt black brown',1,399,'smoudgil_be15@thapar.edu','SanyamM','','6','1',399,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(10,'#987613299',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamM','','1','1',600,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(11,'#987613299',5,'Grey sweatshirt',1,800,'smoudgil_be15@thapar.edu','SanyamM','','8','1',800,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(12,'#987613299',9,'Reversible belt black brown',1,399,'smoudgil_be15@thapar.edu','SanyamM','','6','1',399,'COD','2019-05-09','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(13,'#987678336',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamM','','1','1',600,'COD','2019-05-11','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(14,'#987637722',6,'Black track pant',2,1200,'smoudgil_be15@thapar.edu','SanyamM','','4','1',2400,'COD','2019-05-14','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(15,'#987617634',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamM','','1','1',600,'COD','2019-05-14','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','160043',0,1),(16,'#987617634',5,'Grey sweatshirt',2,800,'smoudgil_be15@thapar.edu','SanyamM','','8','1',1600,'COD','2019-05-14','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','160043',0,1),(17,'#987617634',6,'Black track pant',1,1200,'smoudgil_be15@thapar.edu','SanyamM','','4','1',1200,'COD','2019-05-14','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','160043',0,1),(18,'#987612507',10,'Grey metallic watch',1,4999,'smoudgil_be15@thapar.edu','SanyamM','','7','1',4999,'COD','2019-05-14','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(19,'#987611912',6,'Black track pant',1,1200,'smoudgil_be15@thapar.edu','SanyamM','','4','1',1200,'COD','2019-05-16','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(20,'#987644286',7,'Round neck t-shirt',1,700,'smoudgil_be15@thapar.edu','SanyamM','','2','1',700,'COD','2019-05-16','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(21,'#987611334',6,'Black track pant',1,1200,'smoudgil_be15@thapar.edu','SanyamM','','4','1',1200,'PayPal','2019-05-16','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(22,'987678813',9,'Reversible belt black brown',1,399,'smoudgil_be15@thapar.edu','SanyamM','','6','1',399,'PayPal','2019-05-16','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','9876543210','142027',0,1),(23,'828345697',4,'Formal Blue Shirt',1,600,'smoudgil_be15@thapar.edu','SanyamMoudgil','','1','1',600,'PayPal','2019-05-16','B-120, Rajgadh Estates, Ludhiana','Punjab','8283822432','142027',0,1),(24,'750889032',4,'Formal Blue Shirt',1,600,'vishavmahajan96@gmail.com','VishavMahajan','','1','1',600,'PayPal','2019-05-17','#1232 ,Sector 43-b,chandigarh','near mini market','7508001801','160043',0,1);
/*!40000 ALTER TABLE `manager_saletable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_tempproduct`
--

DROP TABLE IF EXISTS `manager_tempproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_tempproduct` (
  `tempproduct_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `prod_qty` int(11) NOT NULL DEFAULT '1',
  `prod_price` int(11) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `prod_size` varchar(25) DEFAULT NULL,
  `prod_type` varchar(25) NOT NULL,
  `prod_cat` varchar(25) NOT NULL,
  `add_date` varchar(255) DEFAULT NULL,
  `prod_image` varchar(255) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`tempproduct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_tempproduct`
--

LOCK TABLES `manager_tempproduct` WRITE;
/*!40000 ALTER TABLE `manager_tempproduct` DISABLE KEYS */;
INSERT INTO `manager_tempproduct` VALUES (1,4,'Formal Blue Shirt',1,600,'moudgilaseem@yahoo.com','','1','1','2019-05-06','m1.jpg',NULL);
/*!40000 ALTER TABLE `manager_tempproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_userdetail`
--

DROP TABLE IF EXISTS `manager_userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager_userdetail` (
  `role_id_id` int(11) NOT NULL,
  `user_fname` varchar(225) NOT NULL,
  `user_lname` varchar(225) NOT NULL,
  `user_email` varchar(225) NOT NULL,
  `user_password` varchar(1000) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_gender` varchar(10) NOT NULL,
  `user_isactive` tinyint(1) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_isavailable` tinyint(1) NOT NULL,
  `user_isqueue` tinyint(1) NOT NULL,
  `date_reg` varchar(200),
  `otp` varchar(200),
  `otp_time_gen` varchar(255),
  `user_isverified` tinyint(1) NOT NULL,
  `user_token` varchar(255),
  `user_address` varchar(500) NOT NULL,
  `user_landmark` varchar(30) NOT NULL,
  `user_pincode` varchar(30) NOT NULL,
  PRIMARY KEY (`user_email`),
  KEY `manager_userdetail_role_id_id_7502b8ed_fk_manager_role_role_id` (`role_id_id`),
  CONSTRAINT `manager_userdetail_role_id_id_7502b8ed_fk_manager_role_role_id` FOREIGN KEY (`role_id_id`) REFERENCES `manager_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_userdetail`
--

LOCK TABLES `manager_userdetail` WRITE;
/*!40000 ALTER TABLE `manager_userdetail` DISABLE KEYS */;
INSERT INTO `manager_userdetail` VALUES (2,'Keshav','Baniya','keshav.k.gupta1@gmail.com','pbkdf2_sha256$100000$bFkxvxHFuhB5$Zoj6bgQf9GHgrf1uGwZEC20D8PA8Y+XJQvnsUud86L8=','8872701144','Male',1,'1996-11-28','creed quote.jpg',1,0,'2019-05-11','','',1,'','D-616, Hostel M, Thapar University, Patiala','Thapar University','147001'),(2,'Aseem','Moudgil','moudgilaseem@yahoo.com','pbkdf2_sha256$100000$ZfF5cpRWkdMo$WbboobbLPUNZw8H0fXVh69mjNDLbzjEKt+hwTPuxqiU=','9988488330','Male',1,'2001-05-29','00000.jpg',1,0,'2019-05-03','','',1,'','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','142027'),(2,'Sam','Moudgil','sanyam.moudgil26@gmail.com','pbkdf2_sha256$100000$4c39FPLmtquJ$STVi1oCJm+Bu9qQYODb/9wnnw5ijVDLhATreJlkaYb0=','9098765432','Male',1,'1991-03-21','sanyam.jpg',1,0,'2019-04-26','136348','19:38:13.521606',1,'','B-120, Rajgadh Estates, Ludhiana','Rajgadh Estates','142027'),(1,'Sanyam','Moudgil','sanyamm02@gmail.com','pbkdf2_sha256$100000$Bz1nNlSMnqqj$ib9QtyKRrbieQLlYa0G6cXQmkMBS8khxIp9lNQjRf5E=','8283822432','Male',1,'1997-12-26','sanyam.jpg',1,0,'2019-04-23','','',1,'','','',''),(2,'Sanyam','Moudgil','smoudgil_be15@thapar.edu','pbkdf2_sha256$100000$zUh755hIyJiL$TxbZnEmUQCg9R+EXfuiEbbJ4BayCaTbP8sATaFa6pbc=','8283822432','Male',1,'1997-12-26','IMG_6120.JPG',1,0,'2019-05-16','','',1,'','B-120, Rajgadh Estates, Ludhiana','Punjab','142027'),(3,'Vishav','Mahajan','vishav@live.com','pbkdf2_sha256$100000$8AgMNZvRhZgb$PMsRkZ45v30zx7NRwU9oaMQ8ENmZEinpB85WWf6FLQs=','9876556473','Male',1,'2001-02-21','48053396_2170274813235723_1028163394831646720_o.jpg',1,0,'2019-05-16','','',1,'visha61658256473','Hello Ji','Punjab','160076'),(2,'Vishav','Mahajan','vishavmahajan@gmail.com','pbkdf2_sha256$100000$rUSWU2biLZpI$SGa2VaX6FdWkgUWegYmMZcber+sJsC5y8xC6408tkEw=','7973090319','Male',1,'1996-11-26','Screen Shot 2019-03-14 at 10.11.10 PM.png',1,0,'2019-04-30','','',1,'','','',''),(2,'Vishav','Mahajan','vishavmahajan96@gmail.com','pbkdf2_sha256$100000$gL3i4OeplgEu$8HaoRlCNwWBwUvuuJrOOtj+ppMTjLejGCFV8EqZA1LY=','7508001801','Male',1,'2019-05-08','IMG_1202.jpg',1,0,'2019-05-17','','',1,'','chandigarh','near mini market','160043');
/*!40000 ALTER TABLE `manager_userdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-17 13:35:38

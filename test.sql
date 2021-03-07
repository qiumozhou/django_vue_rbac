-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: django_demo
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add menu',7,'add_menu'),(26,'Can change menu',7,'change_menu'),(27,'Can delete menu',7,'delete_menu'),(28,'Can view menu',7,'view_menu'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add role',9,'add_role'),(34,'Can change role',9,'change_role'),(35,'Can delete role',9,'delete_role'),(36,'Can view role',9,'view_role');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_tb_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-27 06:49:01.816537','1','用户管理',1,'[{\"added\": {}}]',7,1),(2,'2021-02-27 06:49:27.647807','2','用户列表',1,'[{\"added\": {}}]',7,1),(3,'2021-02-27 06:49:40.605774','3','权限管理',1,'[{\"added\": {}}]',7,1),(4,'2021-02-27 06:50:03.785615','4','权限列表',1,'[{\"added\": {}}]',7,1),(5,'2021-02-27 06:50:25.634180','5','角色列表',1,'[{\"added\": {}}]',7,1),(6,'2021-02-27 06:51:35.527026','1','查看用户',1,'[{\"added\": {}}]',8,1),(7,'2021-02-27 06:51:54.246175','2','修改用户',1,'[{\"added\": {}}]',8,1),(8,'2021-02-27 06:52:07.344226','3','删除用户',1,'[{\"added\": {}}]',8,1),(9,'2021-02-27 06:52:21.980330','4','添加用户',1,'[{\"added\": {}}]',8,1),(10,'2021-02-27 06:52:42.452734','1','测试',1,'[{\"added\": {}}]',9,1),(11,'2021-02-27 06:57:19.145493','1','测试',2,'[{\"changed\": {\"fields\": [\"Users\"]}}]',9,2),(12,'2021-02-27 06:59:37.170698','1','测试',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',9,2),(13,'2021-02-27 08:20:49.163820','1','admin',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,2),(14,'2021-02-27 08:21:21.950101','1','admin',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,2),(15,'2021-02-27 09:09:59.722033','6','菜单列表',1,'[{\"added\": {}}]',7,2),(16,'2021-02-27 09:10:10.327033','1','测试',2,'[{\"changed\": {\"fields\": [\"Menus\"]}}]',9,2),(17,'2021-02-27 09:10:46.455561','6','菜单列表',2,'[{\"changed\": {\"fields\": [\"Parent id\"]}}]',7,2),(18,'2021-02-27 09:21:39.363289','4','添加用户',2,'[{\"changed\": {\"fields\": [\"Code\"]}}]',8,2),(19,'2021-02-27 09:22:03.141114','3','删除用户',2,'[{\"changed\": {\"fields\": [\"Code\"]}}]',8,2),(20,'2021-02-27 09:22:36.837743','1','查看用户',2,'[{\"changed\": {\"fields\": [\"Code\"]}}]',8,2),(21,'2021-02-27 09:22:48.539734','2','修改用户',2,'[{\"changed\": {\"fields\": [\"Code\"]}}]',8,2),(22,'2021-02-27 11:13:17.213204','1','测试',2,'[{\"changed\": {\"fields\": [\"Menus\"]}}]',9,2),(23,'2021-02-27 11:16:01.418604','1','测试',2,'[{\"changed\": {\"fields\": [\"Menus\"]}}]',9,2),(24,'2021-02-27 11:18:04.600319','1','测试',2,'[{\"changed\": {\"fields\": [\"Menus\"]}}]',9,2),(25,'2021-02-27 11:46:55.857336','1','测试',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',9,2),(26,'2021-02-27 11:53:50.774268','1','admin',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,2),(27,'2021-02-27 14:13:00.522998','1','测试',2,'[{\"changed\": {\"fields\": [\"Users\"]}}]',9,2),(28,'2021-02-28 03:00:26.113777','2','普通用户',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'rbac','menu'),(8,'rbac','permission'),(9,'rbac','role'),(6,'rbac','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-27 06:36:42.507229'),(2,'contenttypes','0002_remove_content_type_name','2021-02-27 06:36:43.614724'),(3,'auth','0001_initial','2021-02-27 06:36:44.290572'),(4,'auth','0002_alter_permission_name_max_length','2021-02-27 06:36:48.557641'),(5,'auth','0003_alter_user_email_max_length','2021-02-27 06:36:48.579618'),(6,'auth','0004_alter_user_username_opts','2021-02-27 06:36:48.607543'),(7,'auth','0005_alter_user_last_login_null','2021-02-27 06:36:48.635434'),(8,'auth','0006_require_contenttypes_0002','2021-02-27 06:36:48.658401'),(9,'auth','0007_alter_validators_add_error_messages','2021-02-27 06:36:48.680347'),(10,'auth','0008_alter_user_username_max_length','2021-02-27 06:36:48.708239'),(11,'auth','0009_alter_user_last_name_max_length','2021-02-27 06:36:48.736164'),(12,'auth','0010_alter_group_name_max_length','2021-02-27 06:36:49.998037'),(13,'auth','0011_update_proxy_permissions','2021-02-27 06:36:50.037930'),(14,'auth','0012_alter_user_first_name_max_length','2021-02-27 06:36:50.065855'),(15,'rbac','0001_initial','2021-02-27 06:36:52.315623'),(16,'admin','0001_initial','2021-02-27 06:37:03.923713'),(17,'admin','0002_logentry_remove_auto_add','2021-02-27 06:37:05.110618'),(18,'admin','0003_logentry_add_action_flag_choices','2021-02-27 06:37:05.200378'),(19,'sessions','0001_initial','2021-02-27 06:37:05.505707'),(20,'rbac','0002_permission_code','2021-02-27 09:21:26.739548'),(21,'rbac','0003_remove_permission_model','2021-02-27 09:22:22.743657'),(22,'rbac','0004_auto_20210227_1723','2021-02-27 09:24:09.417606'),(23,'rbac','0005_auto_20210228_1100','2021-02-28 03:00:28.028084');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('02pweeonm2tijf1mnu3ajxlnusbfwm0x','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxYD:dUDd-0yrOsAekT-TbVxC_iccIPyUQPqQsjH7m-8hgbA','2021-02-27 23:14:21.871961'),('0ugfsw4u5tj7lxeppczlqfe7fe5clhew','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFu9T:A3RIlOtk74WPXbXNVe9M0yfwBax4dEcCAZfXnvgzqXE','2021-02-27 19:36:35.929373'),('0ujt1dqi2wuy61t02fe01656z2xarz3o','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuSc:Bp_cZFEH_Pz7RVzCNfijW51v5rNPDmSdVotxOxoULVE','2021-02-27 19:56:22.439341'),('2mni5led7rh1xoyigrewm2jbljuddbwy','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJyU1JzUklQYLzElBchE6McUgGlGEoKajSQCNTS2FgAgKjPY:1lG0nV:RQzwWCqCsVhiD8PhZTBxpPfSY-x6fLFubsmzFuSJDDU','2021-02-28 02:42:21.055735'),('3imc5sli9nkpipb8so79domavl68encg','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZWpkZBBTamlmZoIhZZaSlgRSkGiAIhVbCwAaUSP6:1lFtUn:rixLxWY4PTsjD1XbNTp46zzFovRNy-OYbxO3ZZF81WU','2021-02-27 18:54:33.440406'),('4uovud552n8u7l4cafg3audk8o9ektsd','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuGQ:srktba6TKuP0qMPGwV-p-3hMi-9SzakrEen-x-hBRgk','2021-02-27 19:43:46.642251'),('52pn4mt5ynyfagm4emkoyu0l4fbontvv','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFu23:LRANQfzra-LbZrldlpIpTPPkpCGnOl0eXJD_JgPDO-s','2021-02-27 19:28:55.555033'),('5gd8ry4bcna1058z4c6vr5wjjkefxzlz','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFu5b:1fA1xUlwCUruE0D7DWvOpwnj1TIDykkwryfXZhczUxA','2021-02-27 19:32:35.720316'),('9gwuefox5t9tnykbdc6rh1y4kob3xtym','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuVe:F3I_7lfDaFsvJ2uvHPKmMIdav4zfOzh_TTRPhUPei2g','2021-02-27 19:59:30.099622'),('a1fn6a2o0g71p6qan2go8n56xadrw8kf','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZWpkZBBTamlmZoIhZZaSlgRSkGiAIhVbCwAaUSP6:1lFtUn:rixLxWY4PTsjD1XbNTp46zzFovRNy-OYbxO3ZZF81WU','2021-02-27 18:54:33.517164'),('a3n0os1syiy0jsvj3jumcsde24puu8k9','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxbW:BoeTNYe9s2iUUhAo6S6ZvquJ5PyozABqToZ6YHXy0bA','2021-02-27 23:17:46.084726'),('bf57gifho2jcctqkk388m8sau6wpg9ff','.eJxljEsKgDAQQ-8ya0_gVUREaBaFfmTa6kK8uzLtaMHdS8LLSRvY25RsDDROVBJ42S0OGiozErIGA4cMTasxD37-v1C5q9p317ynHB10F1ZdQj0XfA2PUNog2GRhlSU0Y75uL01W4A:1lIj59:JVgUMVrCVx9xhkUOkVHvVF764yXv_ZxdO91CHjJq9Z4','2021-03-07 14:23:47.836463'),('c8idhmyz36c4pkhc26usa4ydj6qhijd5','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxbH:A03zUd6dAZsgFXwS2eRC5QA7T_wrWTUnVyrdevMKytM','2021-02-27 23:17:31.365999'),('c9ocv6kvgeycec7a0pj94f5nf8d7b4ci','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuB0:vugSuYl9QH8avJVzmxu47VBNC_et67nvX4462VnEoQ0','2021-02-27 19:38:10.346553'),('cc4j7gzxnt03v3opzmldphuyp4gguak9','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFu8F:zzvZtK4ZcNfVvu1j50qjVa6kZfN54RGbTOLB_2udzDE','2021-02-27 19:35:19.971285'),('ea1mvimma5lza6zccm7p9smqs6ibcyid','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZWpkZBBTamlmZoIhZZaSlgRSkGiAIhVbCwAaUSP6:1lFtXZ:xYnFh8PtSv6EhX4DR9N27yiMXCyWhC7ZhOSY0gozKAE','2021-02-27 18:57:25.505168'),('fe1lo5oll5kloy27cvxpqv1ulal3e8ae','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFubN:ABc3sFhp4rJJ2D5akQyYBix5zMyqZ4bRxX45twVbD-0','2021-02-27 20:05:25.539837'),('g1lfq34d3zmk9nhr080dtmw3k9frmmai','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxbH:A03zUd6dAZsgFXwS2eRC5QA7T_wrWTUnVyrdevMKytM','2021-02-27 23:17:31.987486'),('gxrzev1pbhh7i57rmjvjrei5gmdq4m0k','.eJxljEsKgDAQQ-8ya0_gVUREaBaFfmTa6kK8uzLtaMHdS8LLSRvY25RsDDROVBJ42S0OGiozErIGA4cMTasxD37-v1C5q9p317ynHB10F1ZdQj0XfA2PUNog2GRhlSU0Y75uL01W4A:1lIj59:JVgUMVrCVx9xhkUOkVHvVF764yXv_ZxdO91CHjJq9Z4','2021-03-07 14:23:47.715515'),('hvlrfeo74n3capqv4p1ox98ytj82djrd','.eJxljEsOgjAQhu8ya0IoBVJcuvcExpBpZyr1AYaCLox3F7REiLv_-T3hxt3Vee_aBjZ7GDx31d3xA6Kv7thzPxviC_c8OyQa5e__H8znRRTYiyRADxFUOPR19WE7gg0IWGUazZmbqaATNsc2Nm3Td07H0yQOrY937Ujchu0KUKOvx7eWZEWZUaJspvLEKEwtW0mFYiFQFaUma7VMbG5FnqeSteYCE5KYMhsu4PUGB8xsKg:1lGKFU:B3i_cZnFasSi3SzND_e-9BiGlrorF0uqV7Zjlw04_L8','2021-02-28 23:28:32.614360'),('i4z6sx9phs2xp1e0aivukwvt8grl5m77','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuGQ:srktba6TKuP0qMPGwV-p-3hMi-9SzakrEen-x-hBRgk','2021-02-27 19:43:46.830746'),('ik5tfhf42ap2r1idttfmv25pehynifuq','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJyU1JzUklQYLzElBchE6McUgGlGEoKajSQCNTS2FgAgKjPY:1lH5GB:Fkkf8H6HirKHbxwm2Oc6s3kVhSeeXx35F7wUmyoaz4A','2021-03-03 01:40:23.610910'),('j8outao1v5zgmo1r6i6qbw2ic3qwd8ns','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxdj:0eTqFfpBuvKKTcDRMNroykuohwsw237_wig12G2wIwM','2021-02-27 23:20:03.074371'),('jo5io6wsk4b3h9jn0xu6gh9y6mxmvmm7','.eJxljstuwjAQRf9l1iiKYxIZlt33CxCKxplxYx42spN2gfj3BmNTUHf3MedqrnDhcLYxWu9gu4M5cui_Lf_A6qEDR56KIT7xxMUh0SL_-P9BgV-ivP2SPEeDP3Hpky54Mo_xJJ_Emd2ciyQznHSBk8nEfgU9ztPYp_8twRYEvGUahyO7e0EHdF--GrybgtXV_aTKbaw-_bL4kW_fBkaM40JrSUZs1lQrs1ZtPShsDBtJnWIhUHUbTcZoWZvWiLZtJGvNHdYksWEeuIPbL1uYjzI:1lIVro:em10HmpKszTFuw30pElHcwXk_8udQ9wbjEhrXlhHybY','2021-03-07 00:17:08.050545'),('js4p3gmqkpeqnsvs41hyo5hz53p71w0p','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJyU1JzUklQYLzElBchE6McUgGlGEoKajSQCNTS2FgAgKjPY:1lH4FX:P4_02TTvTFfD8oTUzFXC8eGZG4Zv4pTAWT-evqPqX7s','2021-03-03 00:35:39.380004'),('ktaxs9jry5clk1t0dmn5c1yndstfkdzi','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFu3v:Purupz7ubTz3O8rzee84_fi8eyz2wgKRXltA-dnVyj4','2021-02-27 19:30:51.954241'),('o041jrenfzadpapkdh2a1ew00y75qowo','.eJxVjEEOwiAQRe_C2pAODAIu3XsGMjBUqgaS0q6Md7dNutDtf-_9twi0LiWsPc9hYnERSpx-t0jpmesO-EH13mRqdZmnKHdFHrTLW-P8uh7u30GhXrYagTifR63Ax4QjWzKMBJpJWbcRrRAcaDsMiAoNZm8cABuVDUf2Wny-3Nc3Ng:1lFtXM:fQaejTtI80UrEZpAjTz6yE8Fpc-8X5MHtEkd78e4if8','2021-02-27 18:57:12.306635'),('oe31r72p805z51oc0ek03qy4992x0k86','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxYD:dUDd-0yrOsAekT-TbVxC_iccIPyUQPqQsjH7m-8hgbA','2021-02-27 23:14:21.917841'),('opfwlv2t649t2ml8x8yi9r5asu3k88e7','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuMO:XvBpfhuJozxFN-ck5zFP-97IW515wjWfsOokrhi9MY8','2021-02-27 19:49:56.361203'),('pj8qp316wurokvedtzf86f9fyw1p4lxl','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuJL:YNN4F6_xCNkFOcnlN7FehsM9-7nRVqn-sLH3ahNxeIo','2021-02-27 19:46:47.034110'),('qy655mvpo8hw8hghlrf8xtlvi2ym5mjj','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJyU1JzUklQYLzElBchE6McUgGlGEoKajSQCNTS2FgAgKjPY:1lGBsz:4T1HRlOxISYMEo7f_4aSftDKtfxX3vpScrPvxJZ7vKY','2021-02-28 14:32:45.840794'),('rn5fa1higcqw44ckxwdtqv5d4k3tzhkr','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxdJ:7f7sMmhE458LG4cwfMo9jGytDNFrsM0kgmOe4m_2tew','2021-02-27 23:19:37.414641'),('s3xiqekxw0so0nvhikruqlpdwk2byoib','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuHj:83nhojnGkqTXKF2V6eCqho5hGbJq61qsVIfbogRGcc0','2021-02-27 19:45:07.558644'),('th3rch6a9acvurnqvmnernsb98j4nyw9','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFuPf:icL5sLFZYqCiTbQu23WepsAR-ZW9xAPVwafOWz_QdVE','2021-02-27 19:53:19.850233'),('timuedhhcrbb21930xovuiemfss6soqp','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxdY:Hc7LzD_vP5SMgSqAr64qEHgbIpWADaW0EH5EPEyBuLc','2021-02-27 23:19:52.640291'),('ubynmkf8vkjdl2w5brq6u5tbp9l7hb9j','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxk0:zrUhRkBGR577Lxb7ZmDYMpjM3zsB3KcuJmVZ7npQZRw','2021-02-27 23:26:32.432043'),('wsh8zvhv7shcqo5f369h3cs969a0ofnm','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFtZq:LzzdhN1T1lK6ztsywdtp-K3nWYbahYRBrYsHirnqR1E','2021-02-27 18:59:46.345977'),('x57tvt8ie9budqkdjcqw8rtu5igj3g4m','.eJyrVipILcrNLC7OzM9TsopWiik1M081jSk1NzdIApKmRhZAESNjcyUdoJRJWmoqkGtqbIkhZZaSBlRvapRogCIVWwsAxGMc_A:1lFti6:MKGghlWnYJK3rA4-9Hd2gv8HehrxUMS_2stpBcv5gRE','2021-02-27 19:08:18.480507'),('xapxop6xog85h9jdnml808aez8wya1cc','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxc1:GoVw8hLtC_eVk28yPzEeYHjKFp_KJGRHYQt2VFdl69o','2021-02-27 23:18:17.127746'),('zbeuhngflkr7vme1az0i1wawk1bru0dl','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJyU1JzUklQYLzElBchE6McUgGlGEoKajSQCNTS2FgAgKjPY:1lIS28:ePdtrSwMcoXFPhAJesmFF8l6Qci3ULORccw-6waoNlI','2021-03-06 20:11:32.381208'),('zlt7ocvrl1lx0u7zskws3hdfdzvxbr8b','.eJyrVipILcrNLC7OzM9TsopWKi1OLYovy0wtV9KBsItSi1NLYJzElBSl2FoA_XcS_Q:1lFxdJ:7f7sMmhE458LG4cwfMo9jGytDNFrsM0kgmOe4m_2tew','2021-02-27 23:19:37.595117');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `icon` varchar(50) NOT NULL,
  `component` varchar(50) DEFAULT NULL,
  `parent_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_menu_parent_id_id_37787a27_fk_tb_menu_id` (`parent_id_id`),
  CONSTRAINT `tb_menu_parent_id_id_37787a27_fk_tb_menu_id` FOREIGN KEY (`parent_id_id`) REFERENCES `tb_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,NULL,'用户管理',NULL,'el-icon-user-solid',NULL,NULL),(2,'uesrs','用户列表','/users','el-icon-s-check','Users',1),(3,NULL,'权限管理',NULL,'el-icon-rank',NULL,NULL),(4,'permission','权限列表','/permissions','el-icon-s-help','Permissions',3),(5,'roles','角色列表','/roles','el-icon-s-opportunity','Roles',3),(6,'menu','菜单列表','/menus','el-icon-s-grid','Menu',3);
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permission`
--

DROP TABLE IF EXISTS `tb_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `is_root` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_permission_menu_id_3259cf5c_fk_tb_menu_id` (`menu_id`),
  CONSTRAINT `tb_permission_menu_id_3259cf5c_fk_tb_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permission`
--

LOCK TABLES `tb_permission` WRITE;
/*!40000 ALTER TABLE `tb_permission` DISABLE KEYS */;
INSERT INTO `tb_permission` VALUES (1,'查看用户',2,'user_view',1),(2,'修改用户',2,'user_reset',1),(3,'删除用户',2,'user_delete',1),(4,'添加用户',2,'user_add',1),(5,'添加权限',4,'permission_add',1),(6,'修改权限',4,'permission_reset',1),(7,'查询权限',4,'permission_view',1),(8,'删除权限',4,'permission_delete',1),(9,'查看角色',5,'role_view',1),(10,'修改角色',5,'role_reset',1),(11,'添加角色',5,'role_add',1),(12,'删除角色',5,'role_delete',1),(13,'添加菜单',6,'menu_add',1),(14,'查看菜单',6,'menu_view',1),(15,'修改菜单',6,'menu_reset',1),(16,'删除菜单',6,'menu_delete',1);
/*!40000 ALTER TABLE `tb_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'测试'),(2,'普通用户1');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_menus`
--

DROP TABLE IF EXISTS `tb_role_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_role_menus_role_id_menu_id_eb9ac04d_uniq` (`role_id`,`menu_id`),
  KEY `tb_role_menus_menu_id_a64616e7_fk_tb_menu_id` (`menu_id`),
  CONSTRAINT `tb_role_menus_menu_id_a64616e7_fk_tb_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`id`),
  CONSTRAINT `tb_role_menus_role_id_055a94c8_fk_tb_role_id` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_menus`
--

LOCK TABLES `tb_role_menus` WRITE;
/*!40000 ALTER TABLE `tb_role_menus` DISABLE KEYS */;
INSERT INTO `tb_role_menus` VALUES (7,1,1),(8,1,2),(9,1,3),(10,1,4),(18,1,5),(21,1,6),(19,2,1),(20,2,2),(13,2,3),(14,2,4),(15,2,5),(28,2,6);
/*!40000 ALTER TABLE `tb_role_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_permissions`
--

DROP TABLE IF EXISTS `tb_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_role_permissions_role_id_permission_id_0884ad22_uniq` (`role_id`,`permission_id`),
  KEY `tb_role_permissions_permission_id_054c7c00_fk_tb_permission_id` (`permission_id`),
  CONSTRAINT `tb_role_permissions_permission_id_054c7c00_fk_tb_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `tb_permission` (`id`),
  CONSTRAINT `tb_role_permissions_role_id_c9b931e2_fk_tb_role_id` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_permissions`
--

LOCK TABLES `tb_role_permissions` WRITE;
/*!40000 ALTER TABLE `tb_role_permissions` DISABLE KEYS */;
INSERT INTO `tb_role_permissions` VALUES (22,1,1),(23,1,2),(24,1,3),(25,1,4),(26,1,5),(27,1,6),(28,1,7),(29,1,8),(30,1,9),(31,1,10),(32,1,11),(33,1,12),(47,1,13),(48,1,14),(49,1,15),(46,1,16),(50,2,1);
/*!40000 ALTER TABLE `tb_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_users`
--

DROP TABLE IF EXISTS `tb_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_role_users_role_id_user_id_97fc686b_uniq` (`role_id`,`user_id`),
  KEY `tb_role_users_user_id_33e30f7c_fk_tb_user_id` (`user_id`),
  CONSTRAINT `tb_role_users_role_id_72b4ffd8_fk_tb_role_id` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`),
  CONSTRAINT `tb_role_users_user_id_33e30f7c_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_users`
--

LOCK TABLES `tb_role_users` WRITE;
/*!40000 ALTER TABLE `tb_role_users` DISABLE KEYS */;
INSERT INTO `tb_role_users` VALUES (1,1,1),(2,1,2),(6,1,7),(3,1,8),(4,1,9),(5,1,10),(7,1,12),(8,1,13),(13,1,14),(16,2,1),(9,2,13);
/*!40000 ALTER TABLE `tb_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` longtext NOT NULL,
  `email` varchar(30) NOT NULL,
  `gender` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_admin` int(11) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,1,'','',1,'2021-02-27 06:38:00.000000','admin','pbkdf2_sha256$216000$usPKjj8h6smO$F1mFi4CviBRbNy1k1JaVAmEUWPzN7GqAJyW58DSDe28=','admin@123435',1,1,0,'2021-03-06 09:19:03.127695'),(2,1,'','',1,'2021-02-27 06:57:06.993687','admin123','pbkdf2_sha256$216000$2PIt6GQgo3vo$TAJh2jhiT2uTST3+VSmhJ9wRWQWaXaklgfRh8KCK0Qc=','admin123',1,1,0,'2021-02-27 08:22:39.415690'),(7,0,'','',0,'2021-02-27 09:04:20.217535','admin123456','','admin123',1,1,0,'2021-02-27 09:04:20.218480'),(8,0,'','',0,'2021-02-27 09:05:05.666842','as','','dasd',1,1,0,'2021-02-27 10:34:49.155656'),(9,0,'','',0,'2021-02-27 10:36:14.527347','adasd','','asddas',1,1,0,'2021-02-27 13:56:22.423212'),(10,0,'','',0,'2021-02-27 14:12:08.119542','erw','','werrwe',1,1,0,'2021-02-27 14:12:08.119542'),(11,0,'','',0,'2021-02-27 14:14:12.690100','dasd','','asda',1,1,0,'2021-02-27 14:14:12.691064'),(12,0,'','',0,'2021-02-28 02:38:24.330847','222','222','22',1,1,0,'2021-03-06 08:11:49.645683'),(13,0,'','',0,'2021-02-28 03:05:09.607969','3333','33','333',1,1,0,'2021-02-28 03:05:09.607969'),(14,0,'','',0,'2021-02-28 03:18:12.345097','4444444','222','222',1,1,0,'2021-03-06 10:56:05.850176');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_groups`
--

DROP TABLE IF EXISTS `tb_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_groups_user_id_group_id_adb62351_uniq` (`user_id`,`group_id`),
  KEY `tb_user_groups_group_id_3d826fde_fk_auth_group_id` (`group_id`),
  CONSTRAINT `tb_user_groups_group_id_3d826fde_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `tb_user_groups_user_id_162ae03c_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_groups`
--

LOCK TABLES `tb_user_groups` WRITE;
/*!40000 ALTER TABLE `tb_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_user_permissions`
--

DROP TABLE IF EXISTS `tb_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_user_permissions_user_id_permission_id_fb1d58db_uniq` (`user_id`,`permission_id`),
  KEY `tb_user_user_permiss_permission_id_83890c0b_fk_auth_perm` (`permission_id`),
  CONSTRAINT `tb_user_user_permiss_permission_id_83890c0b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `tb_user_user_permissions_user_id_1b639637_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_user_permissions`
--

LOCK TABLES `tb_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `tb_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07 10:48:13

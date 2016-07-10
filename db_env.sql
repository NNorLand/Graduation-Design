CREATE DATABASE  IF NOT EXISTS `environmental` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `environmental`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: environmental
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES (1,NULL),(2,'8'),(3,'7'),(4,'9'),(5,'7'),(6,'7'),(7,'7'),(8,'10'),(9,'10'),(10,'10'),(11,'10'),(12,'10'),(13,'6');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_area`
--

DROP TABLE IF EXISTS `t_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_area` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_area`
--

LOCK TABLES `t_area` WRITE;
/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
INSERT INTO `t_area` VALUES (1,'大同市'),(2,'石家庄'),(3,'武汉市');
/*!40000 ALTER TABLE `t_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_atmos`
--

DROP TABLE IF EXISTS `t_atmos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_atmos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` float(20,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`) USING BTREE,
  CONSTRAINT `t_atmos_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_atmos`
--

LOCK TABLES `t_atmos` WRITE;
/*!40000 ALTER TABLE `t_atmos` DISABLE KEYS */;
INSERT INTO `t_atmos` VALUES (31,NULL,'2014-08-04 20:09:30',1.013),(32,NULL,'2014-08-04 20:09:31',1.006),(33,NULL,'2014-08-04 20:09:32',1.007),(34,NULL,'2014-08-04 20:09:33',1.005),(35,NULL,'2014-08-04 20:09:34',1.009),(36,NULL,'2014-08-04 20:09:35',1.011),(37,NULL,'2014-08-04 20:09:36',1.008),(38,NULL,'2014-08-04 20:09:37',1.007),(39,NULL,'2014-08-04 20:09:38',1.007),(40,NULL,'2014-08-04 20:09:39',1.006),(41,NULL,'2014-08-04 20:09:40',1.008);
/*!40000 ALTER TABLE `t_atmos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_atmos1`
--

DROP TABLE IF EXISTS `t_atmos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_atmos1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_atmos1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_atmos1`
--

LOCK TABLES `t_atmos1` WRITE;
/*!40000 ALTER TABLE `t_atmos1` DISABLE KEYS */;
INSERT INTO `t_atmos1` VALUES (31,NULL,'2014-06-01',1.013),(32,NULL,'2014-06-02',1.009),(33,NULL,'2014-06-03',1.001),(34,NULL,'2014-06-04',0.988),(35,NULL,'2014-06-05',0.994),(36,NULL,'2014-06-06',0.999),(37,NULL,'2014-06-07',1.006),(38,NULL,'2014-06-08',1.003),(39,NULL,'2014-06-09',1.007),(40,NULL,'2014-06-10',0.986),(41,NULL,'2014-06-11',0.99);
/*!40000 ALTER TABLE `t_atmos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_auth`
--

DROP TABLE IF EXISTS `t_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth` (
  `authId` int(11) NOT NULL AUTO_INCREMENT,
  `authName` varchar(20) DEFAULT NULL,
  `authPath` varchar(100) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `authDescription` varchar(200) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `iconCls` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`authId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth`
--

LOCK TABLES `t_auth` WRITE;
/*!40000 ALTER TABLE `t_auth` DISABLE KEYS */;
INSERT INTO `t_auth` VALUES (1,'水源地监控系统','',-1,NULL,'closed','icon-home'),(2,'权限管理','',1,NULL,'closed','icon-permission'),(3,'系统管理','',1,'','closed','icon-student'),(4,'数据监测','',1,NULL,'closed','icon-course'),(5,'传感器管理','ssManage.html',3,NULL,'open','icon-item'),(6,'节点管理','nodeManage.html',3,NULL,'open','icon-item'),(7,'区域管理','areaManage.html',3,NULL,'open','icon-item'),(9,'气象监测','water/water.jsp',4,'','open','icon-item'),(10,'节点监测','water/environment.jsp',4,'','open','icon-item'),(12,'用户管理','userManage.html',2,NULL,'open','icon-userManage'),(13,'角色管理','roleManage.html',2,NULL,'open','icon-roleManage'),(15,'修改密码','',1,NULL,'open','icon-modifyPassword'),(16,'安全退出','',1,NULL,'open','icon-exit');
/*!40000 ALTER TABLE `t_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dampness`
--

DROP TABLE IF EXISTS `t_dampness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dampness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_dampness_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dampness`
--

LOCK TABLES `t_dampness` WRITE;
/*!40000 ALTER TABLE `t_dampness` DISABLE KEYS */;
INSERT INTO `t_dampness` VALUES (31,NULL,'2013-10-01',20),(32,NULL,'2013-10-02',23),(33,NULL,'2013-10-03',22),(34,NULL,'2013-10-04',29),(35,NULL,'2013-10-05',45),(36,NULL,'2013-10-06',56),(37,NULL,'2013-10-07',64),(38,NULL,'2013-10-08',33),(39,NULL,'2013-10-09',45),(40,NULL,'2013-10-10',67),(41,NULL,'2013-10-11',71),(42,NULL,'2013-10-12',54),(43,NULL,'2013-10-13',47),(44,NULL,'2013-10-14',53),(45,NULL,'2013-10-15',45),(46,NULL,'2013-10-16',32),(47,NULL,'2013-10-17',22),(48,NULL,'2013-10-18',34),(49,NULL,'2013-10-19',21),(50,NULL,'2013-10-20',25),(51,NULL,'2013-10-21',24),(52,NULL,'2013-10-22',18),(53,NULL,'2013-10-23',19),(54,NULL,'2013-10-24',21),(55,NULL,'2013-10-25',15),(56,NULL,'2013-10-26',13),(57,NULL,'2013-10-27',18),(58,NULL,'2013-10-28',14),(59,NULL,'2013-10-29',23),(60,NULL,'2013-10-30',17);
/*!40000 ALTER TABLE `t_dampness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hum`
--

DROP TABLE IF EXISTS `t_hum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`) USING BTREE,
  CONSTRAINT `t_hum_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hum`
--

LOCK TABLES `t_hum` WRITE;
/*!40000 ALTER TABLE `t_hum` DISABLE KEYS */;
INSERT INTO `t_hum` VALUES (31,NULL,'2014-08-04 20:09:30',20),(32,NULL,'2014-08-04 20:09:31',24),(33,NULL,'2014-08-04 20:09:32',22),(34,NULL,'2014-08-04 20:09:33',29),(35,NULL,'2014-08-04 20:09:34',22),(36,NULL,'2014-08-04 20:09:35',23),(37,NULL,'2014-08-04 20:09:36',27),(38,NULL,'2014-08-04 20:09:37',28),(39,NULL,'2014-08-04 20:09:38',24),(40,NULL,'2014-08-04 20:09:39',27),(41,NULL,'2014-08-04 20:09:40',24),(42,NULL,'2014-08-04 20:09:41',29),(43,NULL,'2014-08-04 20:09:42',22),(44,NULL,'2014-08-04 20:09:43',24),(45,NULL,'2014-08-04 20:09:44',24),(46,NULL,'2014-08-04 20:09:45',23),(47,NULL,'2014-08-04 20:09:46',26),(48,NULL,'2014-08-04 20:09:47',28),(49,NULL,'2014-08-04 20:09:48',22),(50,NULL,'2014-08-04 20:09:49',25),(51,NULL,'2014-08-04 20:09:50',25),(52,NULL,'2014-08-04 20:09:51',22),(53,NULL,'2014-08-04 20:09:52',26),(54,NULL,'2014-08-04 20:09:53',22),(55,NULL,'2014-08-04 20:09:54',22),(56,NULL,'2014-08-04 20:09:55',26),(57,NULL,'2014-08-04 20:09:56',26),(58,NULL,'2014-08-04 20:09:57',26),(59,NULL,'2014-08-04 20:09:58',23),(60,NULL,'2014-08-04 20:09:59',22);
/*!40000 ALTER TABLE `t_hum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hum1`
--

DROP TABLE IF EXISTS `t_hum1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hum1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_hum1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hum1`
--

LOCK TABLES `t_hum1` WRITE;
/*!40000 ALTER TABLE `t_hum1` DISABLE KEYS */;
INSERT INTO `t_hum1` VALUES (31,NULL,'2014-06-01',20),(32,NULL,'2014-06-02',23),(33,NULL,'2014-06-03',22),(34,NULL,'2014-06-04',29),(35,NULL,'2014-06-05',45),(36,NULL,'2014-06-06',56),(37,NULL,'2014-06-07',64),(38,NULL,'2014-06-08',33),(39,NULL,'2014-06-09',45),(40,NULL,'2014-06-10',67),(41,NULL,'2014-06-11',71);
/*!40000 ALTER TABLE `t_hum1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_node`
--

DROP TABLE IF EXISTS `t_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_node` (
  `nodeId` int(11) NOT NULL AUTO_INCREMENT,
  `tnodeName` varchar(25) DEFAULT NULL,
  `areaId` int(11) DEFAULT NULL,
  `x` varchar(10) DEFAULT NULL,
  `y` varchar(10) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`nodeId`),
  KEY `areaid` (`areaId`),
  CONSTRAINT `t_node_ibfk_1` FOREIGN KEY (`areaId`) REFERENCES `t_area` (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_node`
--

LOCK TABLES `t_node` WRITE;
/*!40000 ALTER TABLE `t_node` DISABLE KEYS */;
INSERT INTO `t_node` VALUES (1,'节点一',2,'33.0','45.0',''),(2,'节点2',2,'2111.0','24543.0','这是节点二'),(3,'节点3',3,'33.0','33.0','sss'),(7,'节点5',2,'123.0','111.0','啊啊啊'),(8,'1',2,'123.0','1231.0','sss');
/*!40000 ALTER TABLE `t_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_prec`
--

DROP TABLE IF EXISTS `t_prec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_prec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_prec_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_prec`
--

LOCK TABLES `t_prec` WRITE;
/*!40000 ALTER TABLE `t_prec` DISABLE KEYS */;
INSERT INTO `t_prec` VALUES (31,NULL,'2014-06-01',3700),(32,NULL,'2014-06-02',3789),(33,NULL,'2014-06-03',3848),(34,NULL,'2014-06-04',3829),(35,NULL,'2014-06-05',3745),(36,NULL,'2014-06-06',3798),(37,NULL,'2014-06-07',3764),(38,NULL,'2014-06-08',3733),(39,NULL,'2014-06-09',3745),(40,NULL,'2014-06-10',3767),(41,NULL,'2014-06-11',3771);
/*!40000 ALTER TABLE `t_prec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_prec1`
--

DROP TABLE IF EXISTS `t_prec1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_prec1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_prec1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_prec1`
--

LOCK TABLES `t_prec1` WRITE;
/*!40000 ALTER TABLE `t_prec1` DISABLE KEYS */;
INSERT INTO `t_prec1` VALUES (31,NULL,'2014-06-01',3700),(32,NULL,'2014-06-02',3789),(33,NULL,'2014-06-03',3848),(34,NULL,'2014-06-04',3829),(35,NULL,'2014-06-05',3745),(36,NULL,'2014-06-06',3798),(37,NULL,'2014-06-07',3764),(38,NULL,'2014-06-08',3733),(39,NULL,'2014-06-09',3745),(40,NULL,'2014-06-10',3767),(41,NULL,'2014-06-11',3771);
/*!40000 ALTER TABLE `t_prec1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  `authIds` varchar(50) DEFAULT NULL,
  `roleDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'超级管理员','1,2,12,13,3,5,6,7,4,9,10,11,15,16','具有最高权限'),(2,'用户','1,2,12,13,3,5,6,7,4,9,10,16','查阅信息'),(9,'普通管理员','1,3,5,6,7,4,9,15,16','权限很多');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_somke`
--

DROP TABLE IF EXISTS `t_somke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_somke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`) USING BTREE,
  CONSTRAINT `t_somke_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_somke`
--

LOCK TABLES `t_somke` WRITE;
/*!40000 ALTER TABLE `t_somke` DISABLE KEYS */;
INSERT INTO `t_somke` VALUES (31,NULL,'2014-08-04 20:09:30',40),(32,NULL,'2014-08-04 20:09:31',44),(33,NULL,'2014-08-04 20:09:32',42),(34,NULL,'2014-08-04 20:09:33',29),(35,NULL,'2014-08-04 20:09:34',22),(36,NULL,'2014-08-04 20:09:35',23),(37,NULL,'2014-08-04 20:09:36',27),(38,NULL,'2014-08-04 20:09:37',28),(39,NULL,'2014-08-04 20:09:38',24),(40,NULL,'2014-08-04 20:09:39',27),(41,NULL,'2014-08-04 20:09:40',24),(42,NULL,'2014-08-04 20:09:41',29),(43,NULL,'2014-08-04 20:09:42',22),(44,NULL,'2014-08-04 20:09:43',24),(45,NULL,'2014-08-04 20:09:44',24),(46,NULL,'2014-08-04 20:09:45',23),(47,NULL,'2014-08-04 20:09:46',46),(48,NULL,'2014-08-04 20:09:47',48),(49,NULL,'2014-08-04 20:09:48',42),(50,NULL,'2014-08-04 20:09:49',25),(51,NULL,'2014-08-04 20:09:50',25),(52,NULL,'2014-08-04 20:09:51',22),(53,NULL,'2014-08-04 20:09:52',26),(54,NULL,'2014-08-04 20:09:53',22),(55,NULL,'2014-08-04 20:09:54',22),(56,NULL,'2014-08-04 20:09:55',26),(57,NULL,'2014-08-04 20:09:56',26),(58,NULL,'2014-08-04 20:09:57',46),(59,NULL,'2014-08-04 20:09:58',43),(60,NULL,'2014-08-04 20:09:59',42);
/*!40000 ALTER TABLE `t_somke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_somke1`
--

DROP TABLE IF EXISTS `t_somke1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_somke1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_somke1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_somke1`
--

LOCK TABLES `t_somke1` WRITE;
/*!40000 ALTER TABLE `t_somke1` DISABLE KEYS */;
INSERT INTO `t_somke1` VALUES (31,NULL,'2014-06-01',40),(32,NULL,'2014-06-02',43),(33,NULL,'2014-06-03',42),(34,NULL,'2014-06-04',39),(35,NULL,'2014-06-05',45),(36,NULL,'2014-06-06',36),(37,NULL,'2014-06-07',44),(38,NULL,'2014-06-08',43),(39,NULL,'2014-06-09',45),(40,NULL,'2014-06-10',47),(41,NULL,'2014-06-11',41);
/*!40000 ALTER TABLE `t_somke1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ss`
--

DROP TABLE IF EXISTS `t_ss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ss` (
  `ssId` int(11) NOT NULL AUTO_INCREMENT,
  `ssName` varchar(255) DEFAULT NULL,
  `nodeId` int(11) DEFAULT NULL,
  `styleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssId`),
  KEY `nodeid` (`nodeId`),
  KEY `styleid` (`styleId`),
  CONSTRAINT `t_ss_ibfk_1` FOREIGN KEY (`nodeId`) REFERENCES `t_node` (`nodeId`),
  CONSTRAINT `t_ss_ibfk_2` FOREIGN KEY (`styleId`) REFERENCES `t_ssstyle` (`styleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ss`
--

LOCK TABLES `t_ss` WRITE;
/*!40000 ALTER TABLE `t_ss` DISABLE KEYS */;
INSERT INTO `t_ss` VALUES (1,'传感器一',1,2),(2,'传感器二',1,3),(3,'传感器三',2,3);
/*!40000 ALTER TABLE `t_ss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ssstyle`
--

DROP TABLE IF EXISTS `t_ssstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ssstyle` (
  `styleId` int(11) NOT NULL AUTO_INCREMENT,
  `styleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`styleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ssstyle`
--

LOCK TABLES `t_ssstyle` WRITE;
/*!40000 ALTER TABLE `t_ssstyle` DISABLE KEYS */;
INSERT INTO `t_ssstyle` VALUES (1,'温度'),(2,'湿度'),(3,'光照'),(4,'风向');
/*!40000 ALTER TABLE `t_ssstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tem_gas`
--

DROP TABLE IF EXISTS `t_tem_gas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tem_gas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`) USING BTREE,
  CONSTRAINT `t_tem_gas_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tem_gas`
--

LOCK TABLES `t_tem_gas` WRITE;
/*!40000 ALTER TABLE `t_tem_gas` DISABLE KEYS */;
INSERT INTO `t_tem_gas` VALUES (31,NULL,'2014-08-04 20:09:30',30),(32,NULL,'2014-08-04 20:09:31',24),(33,NULL,'2014-08-04 20:09:32',22),(34,NULL,'2014-08-04 20:09:33',29),(35,NULL,'2014-08-04 20:09:34',32),(36,NULL,'2014-08-04 20:09:35',23),(37,NULL,'2014-08-04 20:09:36',27),(38,NULL,'2014-08-04 20:09:37',28),(39,NULL,'2014-08-04 20:09:38',24),(40,NULL,'2014-08-04 20:09:39',27),(41,NULL,'2014-08-04 20:09:40',24),(42,NULL,'2014-08-04 20:09:41',29),(43,NULL,'2014-08-04 20:09:42',22),(44,NULL,'2014-08-04 20:09:43',24),(45,NULL,'2014-08-04 20:09:44',24),(46,NULL,'2014-08-04 20:09:45',23),(47,NULL,'2014-08-04 20:09:46',26),(48,NULL,'2014-08-04 20:09:47',28),(49,NULL,'2014-08-04 20:09:48',22),(50,NULL,'2014-08-04 20:09:49',25),(51,NULL,'2014-08-04 20:09:50',25),(52,NULL,'2014-08-04 20:09:51',22),(53,NULL,'2014-08-04 20:09:52',26),(54,NULL,'2014-08-04 20:09:53',22),(55,NULL,'2014-08-04 20:09:54',22),(56,NULL,'2014-08-04 20:09:55',26),(57,NULL,'2014-08-04 20:09:56',26),(58,NULL,'2014-08-04 20:09:57',26),(59,NULL,'2014-08-04 20:09:58',23),(60,NULL,'2014-08-04 20:09:59',22);
/*!40000 ALTER TABLE `t_tem_gas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tem_gas1`
--

DROP TABLE IF EXISTS `t_tem_gas1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tem_gas1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_tem_gas1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tem_gas1`
--

LOCK TABLES `t_tem_gas1` WRITE;
/*!40000 ALTER TABLE `t_tem_gas1` DISABLE KEYS */;
INSERT INTO `t_tem_gas1` VALUES (31,NULL,'2014-06-01',30),(32,NULL,'2014-06-02',23),(33,NULL,'2014-06-03',29),(34,NULL,'2014-06-04',24),(35,NULL,'2014-06-05',25),(36,NULL,'2014-06-06',31),(37,NULL,'2014-06-07',34),(38,NULL,'2014-06-08',33),(39,NULL,'2014-06-09',31),(40,NULL,'2014-06-10',27),(41,NULL,'2014-06-11',29);
/*!40000 ALTER TABLE `t_tem_gas1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tem_water`
--

DROP TABLE IF EXISTS `t_tem_water`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tem_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`) USING BTREE,
  CONSTRAINT `t_tem_water_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tem_water`
--

LOCK TABLES `t_tem_water` WRITE;
/*!40000 ALTER TABLE `t_tem_water` DISABLE KEYS */;
INSERT INTO `t_tem_water` VALUES (31,NULL,'2014-08-04 20:09:30',20),(32,NULL,'2014-08-04 20:09:31',24),(33,NULL,'2014-08-04 20:09:32',22),(34,NULL,'2014-08-04 20:09:33',23),(35,NULL,'2014-08-04 20:09:34',22),(36,NULL,'2014-08-04 20:09:35',23),(37,NULL,'2014-08-04 20:09:36',19),(38,NULL,'2014-08-04 20:09:37',21),(39,NULL,'2014-08-04 20:09:38',24),(40,NULL,'2014-08-04 20:09:39',27),(41,NULL,'2014-08-04 20:09:40',24),(42,NULL,'2014-08-04 20:09:41',29),(43,NULL,'2014-08-04 20:09:42',22),(44,NULL,'2014-08-04 20:09:43',24),(45,NULL,'2014-08-04 20:09:44',24),(46,NULL,'2014-08-04 20:09:45',23),(47,NULL,'2014-08-04 20:09:46',26),(48,NULL,'2014-08-04 20:09:47',28),(49,NULL,'2014-08-04 20:09:48',22),(50,NULL,'2014-08-04 20:09:49',25),(51,NULL,'2014-08-04 20:09:50',25),(52,NULL,'2014-08-04 20:09:51',22),(53,NULL,'2014-08-04 20:09:52',26),(54,NULL,'2014-08-04 20:09:53',22),(55,NULL,'2014-08-04 20:09:54',22),(56,NULL,'2014-08-04 20:09:55',26),(57,NULL,'2014-08-04 20:09:56',26),(58,NULL,'2014-08-04 20:09:57',26),(59,NULL,'2014-08-04 20:09:58',23),(60,NULL,'2014-08-04 20:09:59',22);
/*!40000 ALTER TABLE `t_tem_water` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tem_water1`
--

DROP TABLE IF EXISTS `t_tem_water1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tem_water1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_tem_water1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tem_water1`
--

LOCK TABLES `t_tem_water1` WRITE;
/*!40000 ALTER TABLE `t_tem_water1` DISABLE KEYS */;
INSERT INTO `t_tem_water1` VALUES (31,NULL,'2014-06-01',20),(32,NULL,'2014-06-02',23),(33,NULL,'2014-06-03',22),(34,NULL,'2014-06-04',29),(35,NULL,'2014-06-05',25),(36,NULL,'2014-06-06',26),(37,NULL,'2014-06-07',24),(38,NULL,'2014-06-08',23),(39,NULL,'2014-06-09',25),(40,NULL,'2014-06-10',27),(41,NULL,'2014-06-11',21);
/*!40000 ALTER TABLE `t_tem_water1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_temper`
--

DROP TABLE IF EXISTS `t_temper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_temper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_temper_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_temper`
--

LOCK TABLES `t_temper` WRITE;
/*!40000 ALTER TABLE `t_temper` DISABLE KEYS */;
INSERT INTO `t_temper` VALUES (31,NULL,'2013-10-01',20.5),(32,NULL,'2013-10-02',23.7),(33,NULL,'2013-10-03',22.4),(34,NULL,'2013-10-04',29),(35,NULL,'2013-10-05',22.2),(36,NULL,'2013-10-06',22.6),(37,NULL,'2013-10-07',26.9),(38,NULL,'2013-10-08',28),(39,NULL,'2013-10-09',24.1),(40,NULL,'2013-10-10',27.1),(41,NULL,'2013-10-11',23.6),(42,NULL,'2013-10-12',28.8),(43,NULL,'2013-10-13',22.4),(44,NULL,'2013-10-14',23.6),(45,NULL,'2013-10-15',24.2),(46,NULL,'2013-10-16',22.6),(47,NULL,'2013-10-17',26.2),(48,NULL,'2013-10-18',28.2),(49,NULL,'2013-10-19',21.7),(50,NULL,'2013-10-20',25.2),(51,NULL,'2013-10-21',25),(52,NULL,'2013-10-22',21.6),(53,NULL,'2013-10-23',25.7),(54,NULL,'2013-10-24',21.7),(55,NULL,'2013-10-25',22.2),(56,NULL,'2013-10-26',25.6),(57,NULL,'2013-10-27',26.2),(58,NULL,'2013-10-28',26),(59,NULL,'2013-10-29',23.2),(60,NULL,'2013-10-30',22.4);
/*!40000 ALTER TABLE `t_temper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `userType` tinyint(4) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `userDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_t_user` (`roleId`),
  CONSTRAINT `FK_t_user` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'root','root',1,1,'管理员'),(30,'yonghu1','123',2,2,''),(32,'yonghu3','123',2,2,''),(34,'yonghu4','123',2,2,'11'),(35,'用户','root',2,1,'超级管理员'),(36,'小明','123',2,2,''),(37,'小红','123',2,2,''),(38,'小刚','123',2,2,''),(39,'李雷','123',2,2,''),(40,'韩梅梅','123',2,2,''),(41,'你好','123',2,2,''),(42,'机器人','123',2,2,''),(43,'liujiaan','123',2,2,'我的测试账号');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_water_line`
--

DROP TABLE IF EXISTS `t_water_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_water_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(20) NOT NULL,
  `data` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`) USING BTREE,
  CONSTRAINT `t_water_line_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_water_line`
--

LOCK TABLES `t_water_line` WRITE;
/*!40000 ALTER TABLE `t_water_line` DISABLE KEYS */;
INSERT INTO `t_water_line` VALUES (31,NULL,'2014-08-04 20:09:30',20),(32,NULL,'2014-08-04 20:09:31',24),(33,NULL,'2014-08-04 20:09:32',22),(34,NULL,'2014-08-04 20:09:33',29),(35,NULL,'2014-08-04 20:09:34',22),(36,NULL,'2014-08-04 20:09:35',23),(37,NULL,'2014-08-04 20:09:36',27),(38,NULL,'2014-08-04 20:09:37',28),(39,NULL,'2014-08-04 20:09:38',24),(40,NULL,'2014-08-04 20:09:39',27),(41,NULL,'2014-08-04 20:09:40',24),(42,NULL,'2014-08-04 20:09:41',29),(43,NULL,'2014-08-04 20:09:42',22),(44,NULL,'2014-08-04 20:09:43',24),(45,NULL,'2014-08-04 20:09:44',24),(46,NULL,'2014-08-04 20:09:45',23),(47,NULL,'2014-08-04 20:09:46',26),(48,NULL,'2014-08-04 20:09:47',28),(49,NULL,'2014-08-04 20:09:48',22),(50,NULL,'2014-08-04 20:09:49',25),(51,NULL,'2014-08-04 20:09:50',25),(52,NULL,'2014-08-04 20:09:51',22),(53,NULL,'2014-08-04 20:09:52',26),(54,NULL,'2014-08-04 20:09:53',22),(55,NULL,'2014-08-04 20:09:54',22),(56,NULL,'2014-08-04 20:09:55',26),(57,NULL,'2014-08-04 20:09:56',26),(58,NULL,'2014-08-04 20:09:57',26),(59,NULL,'2014-08-04 20:09:58',23),(60,NULL,'2014-08-04 20:09:59',22);
/*!40000 ALTER TABLE `t_water_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_water_line1`
--

DROP TABLE IF EXISTS `t_water_line1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_water_line1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_water_line1_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_water_line1`
--

LOCK TABLES `t_water_line1` WRITE;
/*!40000 ALTER TABLE `t_water_line1` DISABLE KEYS */;
INSERT INTO `t_water_line1` VALUES (31,NULL,'2014-06-01',20),(32,NULL,'2014-06-02',23),(33,NULL,'2014-06-03',22),(34,NULL,'2014-06-04',19),(35,NULL,'2014-06-05',25),(36,NULL,'2014-06-06',26),(37,NULL,'2014-06-07',24),(38,NULL,'2014-06-08',18),(39,NULL,'2014-06-09',15),(40,NULL,'2014-06-10',17),(41,NULL,'2014-06-11',21);
/*!40000 ALTER TABLE `t_water_line1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wind`
--

DROP TABLE IF EXISTS `t_wind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_wind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssId` int(11) DEFAULT NULL,
  `datetime` char(10) NOT NULL,
  `data` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssId` (`ssId`),
  CONSTRAINT `t_wind_ibfk_1` FOREIGN KEY (`ssId`) REFERENCES `t_ss` (`ssId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wind`
--

LOCK TABLES `t_wind` WRITE;
/*!40000 ALTER TABLE `t_wind` DISABLE KEYS */;
INSERT INTO `t_wind` VALUES (31,NULL,'2013-10-01',2),(32,NULL,'2013-10-02',2),(33,NULL,'2013-10-03',1),(34,NULL,'2013-10-04',1),(35,NULL,'2013-10-05',1),(36,NULL,'2013-10-06',1),(37,NULL,'2013-10-07',2),(38,NULL,'2013-10-08',1),(39,NULL,'2013-10-09',1),(40,NULL,'2013-10-10',1),(41,NULL,'2013-10-11',2),(42,NULL,'2013-10-12',2),(43,NULL,'2013-10-13',2),(44,NULL,'2013-10-14',1),(45,NULL,'2013-10-15',1),(46,NULL,'2013-10-16',1),(47,NULL,'2013-10-17',1),(48,NULL,'2013-10-18',2),(49,NULL,'2013-10-19',2),(50,NULL,'2013-10-20',2),(51,NULL,'2013-10-21',1),(52,NULL,'2013-10-22',2),(53,NULL,'2013-10-23',1),(54,NULL,'2013-10-24',2),(55,NULL,'2013-10-25',2),(56,NULL,'2013-10-26',2),(57,NULL,'2013-10-27',2),(58,NULL,'2013-10-28',1),(59,NULL,'2013-10-29',2),(60,NULL,'2013-10-30',2);
/*!40000 ALTER TABLE `t_wind` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-14 14:11:46

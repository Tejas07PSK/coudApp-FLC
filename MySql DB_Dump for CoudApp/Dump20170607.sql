-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: coudApp
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `ADDRESS_DETAILS`
--

DROP TABLE IF EXISTS `ADDRESS_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDRESS_DETAILS` (
  `UID` varchar(10) NOT NULL,
  `LOCALITY` varchar(100) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `PIN` char(6) NOT NULL,
  `STATE` varchar(15) NOT NULL,
  `COUNTRY` varchar(20) NOT NULL,
  `AD_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`AD_ID`),
  UNIQUE KEY `AD_ID_UNIQUE` (`AD_ID`),
  KEY `FK_UID_idx` (`UID`),
  CONSTRAINT `FK_UID` FOREIGN KEY (`UID`) REFERENCES `USER_DETAILS` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS_DETAILS`
--

LOCK TABLES `ADDRESS_DETAILS` WRITE;
/*!40000 ALTER TABLE `ADDRESS_DETAILS` DISABLE KEYS */;
INSERT INTO `ADDRESS_DETAILS` VALUES ('UID29921','College More','Burdwan','713103','West Bengal','India','AID13759'),('UID5794','Kalyanpur','Asansol','713305','West Bengal','India','AID17399'),('UID5794','Murgasol','Asansol','713303','West Bengal','India','AID24926'),('UID29921','Apcar Garden','Asansol','713304','West Bengal','India','AID4745');
/*!40000 ALTER TABLE `ADDRESS_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AGENT_DETAILS`
--

DROP TABLE IF EXISTS `AGENT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENT_DETAILS` (
  `AG_ID` varchar(10) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `AG_Locality` varchar(100) NOT NULL,
  `AG_City` varchar(20) NOT NULL,
  `AG_Pin` char(6) NOT NULL,
  `AG_State` varchar(20) NOT NULL,
  `AG_Country` varchar(25) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`AG_ID`),
  UNIQUE KEY `idnew_table_UNIQUE` (`AG_ID`),
  UNIQUE KEY `Password_UNIQUE` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENT_DETAILS`
--

LOCK TABLES `AGENT_DETAILS` WRITE;
/*!40000 ALTER TABLE `AGENT_DETAILS` DISABLE KEYS */;
INSERT INTO `AGENT_DETAILS` VALUES ('AG25643','Sayan Banerjee','Shristinagar','Asansol','713304','West Bengal','India','syn'),('AG30409','Rohan Jain','Golapbag','Burdwan','713104','West Bengal','India','rhn');
/*!40000 ALTER TABLE `AGENT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_DETAILS`
--

DROP TABLE IF EXISTS `ORDER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_DETAILS` (
  `ORDER_ID` varchar(10) NOT NULL,
  `PRO_ID` varchar(10) NOT NULL,
  `USR_ID` varchar(10) NOT NULL,
  `ORDER_DATE` char(10) NOT NULL,
  `DELIVERY_DATE` char(10) NOT NULL,
  `STATUS` varchar(15) NOT NULL DEFAULT 'In Transit',
  `ADD_ID` varchar(10) NOT NULL,
  `ASG_AG` varchar(10) NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`ORDER_ID`),
  UNIQUE KEY `ORDER_ID_UNIQUE` (`ORDER_ID`),
  KEY `FK_USRID_idx` (`USR_ID`),
  KEY `FK_PRID_idx` (`PRO_ID`),
  KEY `Ag_idfk_idx` (`ASG_AG`),
  CONSTRAINT `FK_PRID` FOREIGN KEY (`PRO_ID`) REFERENCES `PRODUCT_DETAILS` (`PRODUCT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USRID` FOREIGN KEY (`USR_ID`) REFERENCES `USER_DETAILS` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_DETAILS`
--

LOCK TABLES `ORDER_DETAILS` WRITE;
/*!40000 ALTER TABLE `ORDER_DETAILS` DISABLE KEYS */;
INSERT INTO `ORDER_DETAILS` VALUES ('OID11307','PRID203421','UID5794','07/06/2017','N/A','In Transit','AID24926','N/A'),('OID23634','PRID203422','UID5794','07/06/2017','N/A','In Transit','AID24926','N/A'),('OID46552','PRID203419','UID29921','02/06/2017','N/A','In Transit','AID4745','N/A'),('OID48611','PRID203420','UID29921','02/06/2017','N/A','In Transit','AID13759','N/A'),('OID7499','PRID203421','UID29921','02/06/2017','N/A','In Transit','AID4745','N/A'),('OID783','PRID203419','UID5794','07/06/2017','N/A','In Transit','AID17399','N/A');
/*!40000 ALTER TABLE `ORDER_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_DETAILS`
--

DROP TABLE IF EXISTS `PRODUCT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_DETAILS` (
  `PRODUCT_ID` varchar(10) NOT NULL,
  `PRODUCT_NAME` varchar(100) NOT NULL,
  `PRICE` int(11) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `PRODUCT_ID_UNIQUE` (`PRODUCT_ID`),
  UNIQUE KEY `PRODUCT_NAME_UNIQUE` (`PRODUCT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_DETAILS`
--

LOCK TABLES `PRODUCT_DETAILS` WRITE;
/*!40000 ALTER TABLE `PRODUCT_DETAILS` DISABLE KEYS */;
INSERT INTO `PRODUCT_DETAILS` VALUES ('PRID203419','Apple iphone 6s',35000),('PRID203420','Apple MacBook Pro',1050000),('PRID203421','Samsung HD Led Tv',45000),('PRID203422','Philips Headphone',1500);
/*!40000 ALTER TABLE `PRODUCT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_DETAILS`
--

DROP TABLE IF EXISTS `USER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_DETAILS` (
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `MOB_NO` bigint(20) NOT NULL,
  `EMAIL_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `MOB_NO` (`MOB_NO`,`EMAIL_ID`,`USER_ID`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`),
  UNIQUE KEY `MOB_NO_UNIQUE` (`MOB_NO`),
  UNIQUE KEY `EMAIL_ID_UNIQUE` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DETAILS`
--

LOCK TABLES `USER_DETAILS` WRITE;
/*!40000 ALTER TABLE `USER_DETAILS` DISABLE KEYS */;
INSERT INTO `USER_DETAILS` VALUES ('Palash','Sarkar','UID29921',9547068904,'palashsarkar0007@gmail.com'),('Avinash','Singh','UID5794',9093331895,'coolavi2796@gmail.com');
/*!40000 ALTER TABLE `USER_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'coudApp'
--

--
-- Dumping routines for database 'coudApp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-07  4:04:01

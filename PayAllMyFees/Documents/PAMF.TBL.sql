-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: dev_pamf
-- ------------------------------------------------------
-- Server version	5.5.41-log

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
-- Table structure for table `/* ping */ select 1`
--

DROP TABLE IF EXISTS `/* ping */ select 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `/* ping */ select 1` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_admn_info`
--

DROP TABLE IF EXISTS `pmf_admn_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_admn_info` (
  `ID_ADMIN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_CRDNT` int(11) NOT NULL,
  `FN_USER` varchar(100) DEFAULT NULL,
  `LN_USER` varchar(100) DEFAULT NULL,
  `CNCT_PHN` int(11) DEFAULT NULL,
  `CNCT_PHN01` int(11) DEFAULT NULL,
  `EML_ADMIN` varchar(100) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ADMIN`),
  KEY `ID_USER_CRDNT` (`ID_USER_CRDNT`),
  CONSTRAINT `PMF_ADMN_INFO_ibfk_1` FOREIGN KEY (`ID_USER_CRDNT`) REFERENCES `pmf_user_crdnt` (`ID_USER_CRDNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_inst`
--

DROP TABLE IF EXISTS `pmf_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_inst` (
  `ID_INST` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_CRDNT` int(11) DEFAULT NULL,
  `NM_INST` varchar(500) DEFAULT NULL,
  `ADS_INST` varchar(2000) DEFAULT NULL,
  `CNCT_PHN` varchar(30) DEFAULT NULL,
  `EML_INST` varchar(50) DEFAULT NULL,
  `ST_INST` varchar(1) DEFAULT '0',
  `ID_RGN` int(11) NOT NULL,
  PRIMARY KEY (`ID_INST`),
  KEY `ID_USER_CRDNT` (`ID_USER_CRDNT`),
  KEY `ID_RGN` (`ID_RGN`),
  CONSTRAINT `PMF_INST_ibfk_3` FOREIGN KEY (`ID_USER_CRDNT`) REFERENCES `pmf_user_crdnt` (`ID_USER_CRDNT`),
  CONSTRAINT `PMF_INST_ibfk_4` FOREIGN KEY (`ID_RGN`) REFERENCES `pmf_rgn` (`ID_RGN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_inst_cls_div_map`
--

DROP TABLE IF EXISTS `pmf_inst_cls_div_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_inst_cls_div_map` (
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST` int(11) NOT NULL DEFAULT '0',
  `CLS_STDNT` varchar(50) NOT NULL DEFAULT '',
  `DIV_STDNT` varchar(30) NOT NULL DEFAULT '',
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_INST_CLS_DIV_MAP`,`ID_INST`,`CLS_STDNT`,`DIV_STDNT`),
  KEY `ID_INST` (`ID_INST`),
  CONSTRAINT `PMF_INST_CLS_DIV_MAP_ibfk_1` FOREIGN KEY (`ID_INST`) REFERENCES `pmf_inst` (`ID_INST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_inst_fe_struct`
--

DROP TABLE IF EXISTS `pmf_inst_fe_struct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_inst_fe_struct` (
  `ID_INST_FE_STRUCT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) DEFAULT NULL,
  `FE_STRUCT` text,
  PRIMARY KEY (`ID_INST_FE_STRUCT`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  CONSTRAINT `PMF_INST_FE_STRUCT_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `pmf_inst_cls_div_map` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_inst_ru`
--

DROP TABLE IF EXISTS `pmf_inst_ru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_inst_ru` (
  `ID_INST_RU` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) DEFAULT NULL,
  `LATE_FE_AMT_RT` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`ID_INST_RU`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  CONSTRAINT `PMF_INST_RU_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `pmf_inst_cls_div_map` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_notification`
--

DROP TABLE IF EXISTS `pmf_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_notification` (
  `ID_NOTIF` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL,
  `MSG_NOTIF` varchar(4000) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_NOTIF`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  CONSTRAINT `PMF_NOTIFICATION_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `pmf_inst_cls_div_map` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_payment`
--

DROP TABLE IF EXISTS `pmf_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_payment` (
  `ID_PAYMENT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_STNDT_MAP` int(11) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PAYMENT`),
  KEY `ID_USER_STNDT_MAP` (`ID_USER_STNDT_MAP`),
  CONSTRAINT `PMF_PAYMENT_ibfk_1` FOREIGN KEY (`ID_USER_STNDT_MAP`) REFERENCES `pmf_user_stdnt_map` (`ID_USER_STNDT_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_result`
--

DROP TABLE IF EXISTS `pmf_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_result` (
  `ID_RESULT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL,
  `ID_STDNT` int(11) NOT NULL,
  `DESC_RESULT` varchar(4000) DEFAULT NULL,
  `URL_RESULT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID_RESULT`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  KEY `ID_STDNT` (`ID_STDNT`),
  CONSTRAINT `PMF_RESULT_ibfk_1` FOREIGN KEY (`ID_STDNT`) REFERENCES `pmf_stdnt` (`ID_STDNT`),
  CONSTRAINT `PMF_RESULT_ibfk_2` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `pmf_inst_cls_div_map` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_rgn`
--

DROP TABLE IF EXISTS `pmf_rgn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_rgn` (
  `ID_RGN` int(11) NOT NULL AUTO_INCREMENT,
  `ST_RGN` varchar(100) DEFAULT NULL COMMENT 'State Region',
  `CI_RGN` varchar(100) DEFAULT NULL COMMENT 'City Region',
  `TS_CRT_RCRD` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_RGN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_stdnt`
--

DROP TABLE IF EXISTS `pmf_stdnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_stdnt` (
  `ID_STDNT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST` int(11) NOT NULL,
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL,
  `NM_GRDN` varchar(100) DEFAULT NULL,
  `CNCT_PHN` int(11) NOT NULL,
  `FN_STDNT` varchar(100) NOT NULL,
  `LN_STDNT` varchar(100) DEFAULT NULL,
  `ID_GEN_RGSTR` varchar(100) DEFAULT NULL,
  `DOB_STDNT` date DEFAULT NULL,
  `EML_STDNT` varchar(50) DEFAULT NULL,
  `FE_AMT_DUE` decimal(12,2) DEFAULT NULL,
  `FE_PAID` varchar(1) DEFAULT 'N',
  `LATE_FE_AMT` decimal(12,2) DEFAULT NULL,
  `DATE_DUE` timestamp NULL DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STDNT`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  KEY `ID_INST` (`ID_INST`),
  CONSTRAINT `PMF_STDNT_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `pmf_inst_cls_div_map` (`ID_INST_CLS_DIV_MAP`),
  CONSTRAINT `PMF_STDNT_ibfk_2` FOREIGN KEY (`ID_INST`) REFERENCES `pmf_inst` (`ID_INST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_user_crdnt`
--

DROP TABLE IF EXISTS `pmf_user_crdnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_user_crdnt` (
  `ID_USER_CRDNT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_LOGIN` varchar(50) NOT NULL,
  `PW_SLT_USER` varchar(250) NOT NULL,
  `TY_USER` int(11) NOT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER_CRDNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_user_info`
--

DROP TABLE IF EXISTS `pmf_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_user_info` (
  `ID_USER_INFO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_CRDNT` int(11) NOT NULL,
  `CNCT_PHN00` int(11) DEFAULT NULL,
  `CNCT_PHN01` int(11) DEFAULT NULL,
  `CNCT_PHN02` int(11) DEFAULT NULL,
  `CNCT_PHN03` int(11) DEFAULT NULL,
  `ADS_USER` varchar(2000) DEFAULT NULL,
  `EML_USER` varchar(100) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER_INFO`),
  KEY `ID_USER_CRDNT` (`ID_USER_CRDNT`),
  CONSTRAINT `PMF_USER_INFO_ibfk_1` FOREIGN KEY (`ID_USER_CRDNT`) REFERENCES `pmf_user_crdnt` (`ID_USER_CRDNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmf_user_stdnt_map`
--

DROP TABLE IF EXISTS `pmf_user_stdnt_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmf_user_stdnt_map` (
  `ID_USER_STNDT_MAP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_INFO` int(11) DEFAULT NULL,
  `ID_STDNT` int(11) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER_STNDT_MAP`),
  KEY `ID_USER` (`ID_USER_INFO`),
  KEY `ID_STDNT` (`ID_STDNT`),
  CONSTRAINT `PMF_USER_STDNT_MAP_ibfk_2` FOREIGN KEY (`ID_STDNT`) REFERENCES `pmf_stdnt` (`ID_STDNT`),
  CONSTRAINT `PMF_USER_STDNT_MAP_ibfk_3` FOREIGN KEY (`ID_USER_INFO`) REFERENCES `pmf_user_info` (`ID_USER_INFO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:37:30

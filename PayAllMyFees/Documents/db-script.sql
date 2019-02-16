-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Host: mysql3000.mochahost.com
-- Generation Time: Jan 18, 2015 at 05:50 AM
-- Server version: 5.5.40-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `satya123_dev_pamf`
--

-- --------------------------------------------------------

--
-- Table structure for table `/* ping */ SELECT 1`
--

CREATE TABLE IF NOT EXISTS `/* ping */ SELECT 1` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PMF_ADMN_INFO`
--

CREATE TABLE IF NOT EXISTS `PMF_ADMN_INFO` (
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
  KEY `ID_USER_CRDNT` (`ID_USER_CRDNT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `PMF_ADMN_INFO`
--

INSERT INTO `PMF_ADMN_INFO` (`ID_ADMIN`, `ID_USER_CRDNT`, `FN_USER`, `LN_USER`, `CNCT_PHN`, `CNCT_PHN01`, `EML_ADMIN`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(1, 4, 'Ram', 'Gupta', 2255443, 2266446, 'admin@gmail.com', '2015-01-04 13:49:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_INST`
--

CREATE TABLE IF NOT EXISTS `PMF_INST` (
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
  KEY `ID_RGN` (`ID_RGN`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `PMF_INST`
--

INSERT INTO `PMF_INST` (`ID_INST`, `ID_USER_CRDNT`, `NM_INST`, `ADS_INST`, `CNCT_PHN`, `EML_INST`, `ST_INST`, `ID_RGN`) VALUES
(32, 9, 'Rajhans Vidyalaya', 'J. P. Road, Near Bhavans College, Andheri (W), Mumbai - 400102', '987654321', 'queries@rajhansvidyalaya.com', '0', 0),
(37, 22, 'Klaim Institute 2', 'Sec-98', '989898980', 'mr.kkk3@gg.com', '0', 0),
(42, 27, 'Klaim Institute 3', 'Sec-989', '9898989809', 'mr.kkk4@gg.com', '0', 0),
(43, 4, 'St. Xaviers', 'Vashi', '9870703678', 'st.xaviers@gmail.com', '0', 0),
(45, 28, 'Fr.Angel', 'Vashi', '9870756786', 'fr.angel@gmail.com', '0', 0),
(46, 29, 'Ryan International School', 'Krishna Vatika Marg, Opp Aarey Bhasker Ground, Gokuldham, Goregaon East, Mumbai, Maharashtra', '987080567', 'queries.ryan@gmail.com', '0', 0),
(48, 22, 'St. Mary''s High School', 'Chhatrapati Shivaji Road\nDahisar East\nMumbai, Maharashtra', '022553333', 'st.marys@gmail.com', '0', 0),
(50, 27, 'TreeHouse', 'Ghansoli', '02226655777', 'treehouse@gmail.com', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_INST_CLS_DIV_MAP`
--

CREATE TABLE IF NOT EXISTS `PMF_INST_CLS_DIV_MAP` (
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST` int(11) NOT NULL DEFAULT '0',
  `CLS_STDNT` varchar(50) NOT NULL DEFAULT '',
  `DIV_STDNT` varchar(30) NOT NULL DEFAULT '',
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_INST_CLS_DIV_MAP`,`ID_INST`,`CLS_STDNT`,`DIV_STDNT`),
  KEY `ID_INST` (`ID_INST`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `PMF_INST_CLS_DIV_MAP`
--

INSERT INTO `PMF_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`, `ID_INST`, `CLS_STDNT`, `DIV_STDNT`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(7, 32, '10', 'A', '2014-12-27 17:27:56', '2014-12-27 17:27:56'),
(12, 32, '10', 'B', '2014-12-27 17:28:16', '2014-12-27 17:28:16'),
(17, 32, '11', 'A', '2014-12-27 17:28:33', '2014-12-27 17:28:33'),
(22, 37, '9', 'A', '2014-12-27 17:28:49', '2014-12-27 17:28:49'),
(27, 37, '9', 'B', '2014-12-27 17:29:06', '2014-12-27 17:29:06'),
(32, 37, '8', 'A', '2014-12-27 17:29:18', '2014-12-27 17:29:18'),
(37, 42, '7', 'A', '2014-12-27 17:29:35', '2014-12-27 17:29:35'),
(42, 42, '6', 'B', '2014-12-27 17:29:45', '2014-12-27 17:29:45'),
(47, 42, '5', 'A', '2014-12-27 17:29:58', '2014-12-27 17:29:58'),
(48, 32, '11', 'C', '2015-01-01 14:04:14', NULL),
(49, 32, '11', 'B', '2015-01-01 14:05:32', NULL),
(52, 32, '12', '', '2015-01-01 16:42:43', NULL),
(53, 32, '99', 'Z', '2015-01-03 00:58:20', NULL),
(54, 48, '8th', 'A', '2015-01-04 12:09:52', NULL),
(55, 48, '8th', 'B', '2015-01-04 12:11:08', NULL),
(56, 48, '9th', 'A', '2015-01-04 12:11:38', NULL),
(57, 46, '10th', 'C', '2015-01-04 12:13:28', NULL),
(58, 46, '10th', 'B', '2015-01-04 12:13:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_INST_FE_STRUCT`
--

CREATE TABLE IF NOT EXISTS `PMF_INST_FE_STRUCT` (
  `ID_INST_FE_STRUCT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) DEFAULT NULL,
  `FE_STRUCT` text,
  PRIMARY KEY (`ID_INST_FE_STRUCT`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `PMF_INST_FE_STRUCT`
--

INSERT INTO `PMF_INST_FE_STRUCT` (`ID_INST_FE_STRUCT`, `ID_INST_CLS_DIV_MAP`, `FE_STRUCT`) VALUES
(1, 7, 'Admission Fee                                               Rs. 25.00\r\nRe Admission Fee                                Rs 100.00\r\nTutition Fee    \r\n    Class IX & X (Boys)                         Rs 200.00\r\n    Class XI & XII Commerce & Humanities (Boys)             Rs 300.00\r\n    Class XI & XII Science (Boys)                       Rs.400.00\r\nComputer Fund   \r\n    Class III onwards wherever Computer Education is being imparted     Rs 100.00\r\n    Computer Science Fee. (for elective subjects) + 2 stage         Rs 150.00\r\nVidyalaya Vikas Nidhi (Classes I - XII)                     Rs.500.00'),
(2, 37, 'Hello,\r\nI am the Fee Structure2\r\n\r\nRegards,\r\nFee Structure2.');

-- --------------------------------------------------------

--
-- Table structure for table `PMF_INST_RU`
--

CREATE TABLE IF NOT EXISTS `PMF_INST_RU` (
  `ID_INST_RU` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) DEFAULT NULL,
  `LATE_FE_AMT_RT` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`ID_INST_RU`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PMF_NOTIFICATION`
--

CREATE TABLE IF NOT EXISTS `PMF_NOTIFICATION` (
  `ID_NOTIF` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL,
  `MSG_NOTIF` varchar(4000) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_NOTIF`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `PMF_NOTIFICATION`
--

INSERT INTO `PMF_NOTIFICATION` (`ID_NOTIF`, `ID_INST_CLS_DIV_MAP`, `MSG_NOTIF`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(3, 48, '11 Class and Division C', '2015-01-01 14:09:46', NULL),
(21, 12, 'Dear Student your fees has been received sucessfully', '2015-01-04 13:06:55', NULL),
(22, 17, 'Dear Student your fees has been received  not sucessfully', '2015-01-04 13:06:55', NULL),
(23, 52, '', '2015-01-05 12:04:17', NULL),
(24, 7, '', '2015-01-05 19:31:03', NULL),
(25, 12, '', '2015-01-05 19:31:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_PAYMENT`
--

CREATE TABLE IF NOT EXISTS `PMF_PAYMENT` (
  `ID_PAYMENT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_STNDT_MAP` int(11) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PAYMENT`),
  KEY `ID_USER_STNDT_MAP` (`ID_USER_STNDT_MAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PMF_RESULT`
--

CREATE TABLE IF NOT EXISTS `PMF_RESULT` (
  `ID_RESULT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INST_CLS_DIV_MAP` int(11) NOT NULL,
  `ID_STDNT` int(11) NOT NULL,
  `DESC_RESULT` varchar(4000) DEFAULT NULL,
  `URL_RESULT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID_RESULT`),
  KEY `ID_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  KEY `ID_STDNT` (`ID_STDNT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `PMF_RGN`
--

CREATE TABLE IF NOT EXISTS `PMF_RGN` (
  `ID_RGN` int(11) NOT NULL AUTO_INCREMENT,
  `ST_RGN` varchar(100) DEFAULT NULL COMMENT 'State Region',
  `CI_RGN` varchar(100) DEFAULT NULL COMMENT 'City Region',
  `TS_CRT_RCRD` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_RGN`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `PMF_RGN`
--

INSERT INTO `PMF_RGN` (`ID_RGN`, `ST_RGN`, `CI_RGN`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(0, 'Andaman and Nicobar Islands', 'Port Blair', '2015-01-18 11:27:01', NULL),
(1, 'Andhra Pradesh', 'Adilabad', '2015-01-18 11:27:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_STDNT`
--

CREATE TABLE IF NOT EXISTS `PMF_STDNT` (
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
  KEY `ID_INST` (`ID_INST`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `PMF_STDNT`
--

INSERT INTO `PMF_STDNT` (`ID_STDNT`, `ID_INST`, `ID_INST_CLS_DIV_MAP`, `NM_GRDN`, `CNCT_PHN`, `FN_STDNT`, `LN_STDNT`, `ID_GEN_RGSTR`, `DOB_STDNT`, `EML_STDNT`, `FE_AMT_DUE`, `FE_PAID`, `LATE_FE_AMT`, `DATE_DUE`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(2, 32, 7, 'Suresh', 2147483647, 'Suresh', 'Inchur', '1982', '2014-12-26', 'inchur@gamil.com', NULL, 'N', NULL, NULL, '2014-12-27 17:32:44', '2014-12-27 17:32:44'),
(7, 37, 12, 'Shahebaz', 1234567890, 'Shahebaz', 'Shaikh', '1983', '2014-12-26', 'b@b.com', NULL, 'N', NULL, NULL, '2014-12-27 17:33:34', '2014-12-27 17:33:34'),
(12, 37, 12, 'Ashutosh', 2147483647, 'Ashutosh', 'Shukla', '1984', '2014-12-26', 'z@z.com', NULL, 'N', NULL, NULL, '2014-12-27 17:34:20', '2014-12-27 17:34:20'),
(13, 32, 7, 'Parent1', 1234567890, 'Nishant', 'Modi', '1985', '1998-03-31', 'nishant@gamil.com', '10000.00', NULL, '0.00', '2014-03-31 05:00:00', '2015-01-01 22:12:32', NULL),
(14, 32, 12, 'Parent1', 1234567890, 'Kalim', 'Khan', '1986', '1998-03-31', NULL, '10000.00', NULL, '0.00', '2014-03-31 05:00:00', '2015-01-01 22:12:33', NULL),
(15, 32, 7, 'Parent2', 1234567890, 'Steve', 'D''souza', '1991', '1998-03-31', NULL, '10000.00', NULL, '0.00', '2014-03-31 05:00:00', '2015-01-01 22:14:59', NULL),
(16, 32, 12, 'Parent2', 2147483647, 'Balwinder', 'Singh', '2048', '1998-03-31', NULL, '10000.00', NULL, '0.00', '2014-03-31 05:00:00', '2015-01-01 22:15:00', NULL),
(26, 32, 53, 'Sharad', 2147483647, 'Sharad', 'Tank', '1999', '1998-03-31', NULL, '2000.00', NULL, '0.00', '2014-03-31 05:00:00', '2015-01-03 01:06:18', NULL),
(27, 48, 32, 'Mahesh', 987056342, 'Rakesh', 'Nayak', '121312', '2010-05-12', 'rakesh@gmail.com', '15000.00', 'N', '200.00', '2015-01-14 06:00:00', '2015-01-10 12:00:12', NULL),
(28, 46, 22, 'Steve ', 214748364, 'Sathyanarayan', 'Ramchandran', '3455', '2010-05-12', 'sathyanarayan@gmail.com', '12300.00', 'N', '500.00', '2015-01-01 06:00:00', '2015-01-10 12:00:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_USER_CRDNT`
--

CREATE TABLE IF NOT EXISTS `PMF_USER_CRDNT` (
  `ID_USER_CRDNT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_LOGIN` varchar(50) NOT NULL,
  `PW_SLT_USER` varchar(250) NOT NULL,
  `TY_USER` int(11) NOT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER_CRDNT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `PMF_USER_CRDNT`
--

INSERT INTO `PMF_USER_CRDNT` (`ID_USER_CRDNT`, `ID_USER_LOGIN`, `PW_SLT_USER`, `TY_USER`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(4, 'admin', 'admin', 0, '2014-12-23 09:36:14', '2014-12-23 09:36:14'),
(9, 'institute', 'institute', 1, '2014-12-23 09:36:48', '2014-12-28 09:04:22'),
(14, 'user', 'user', 2, '2014-12-23 09:37:13', '2014-12-28 23:22:35'),
(22, 'institute1', 'institute1', 1, '2014-12-27 11:21:46', '2014-12-27 11:21:46'),
(27, 'institute2', 'institute2', 1, '2014-12-27 11:21:58', '2014-12-27 11:21:58'),
(28, 'school1', 'school1', 1, '2015-01-04 19:59:40', NULL),
(29, 'school2', 'school2', 1, '2015-01-04 19:59:40', NULL),
(31, 'demo', 'demo', 2, '2015-01-10 11:39:56', NULL),
(32, 'Steve', 'steve123', 2, '2015-01-10 11:41:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_USER_INFO`
--

CREATE TABLE IF NOT EXISTS `PMF_USER_INFO` (
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
  KEY `ID_USER_CRDNT` (`ID_USER_CRDNT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `PMF_USER_INFO`
--

INSERT INTO `PMF_USER_INFO` (`ID_USER_INFO`, `ID_USER_CRDNT`, `CNCT_PHN00`, `CNCT_PHN01`, `CNCT_PHN02`, `CNCT_PHN03`, `ADS_USER`, `EML_USER`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(1, 14, 787877979, 878777897, NULL, NULL, 'test', 'test@test.com', '2014-12-30 22:34:37', NULL),
(2, 9, 0, 2147483647, 2147483647, 2147483647, 'Ghansoli,Navi Mumbai', 'sha@gmail.com', '2015-01-04 12:40:22', NULL),
(3, 9, 22554432, 2147483647, 2147483647, 2147483647, 'Koperkhirne,navi mumbai', 'yes@gmail.com', '2015-01-04 12:40:22', NULL),
(4, 9, 2255442, 2147483647, 2147483647, 2147483647, 'Ghansoli,NaviMumbai', 'yes@gmail.com', '2015-01-04 12:42:38', NULL),
(5, 9, 2255443, 2255444, 2255445, 2255446, 'Ghansoli', 'yes@gmail.com', '2015-01-04 12:52:40', NULL),
(6, 9, 22667755, 22667757, 22667756, 22667757, 'koperkhirne', 'sha@gmail.com', '2015-01-04 12:55:50', NULL),
(7, 31, 214748364, NULL, NULL, NULL, 'Plot No: 21, Shree Deepak Niwas, Thane(W), Maharashtra', 'rajanmehta@gmail.com', '2015-01-10 11:46:25', NULL),
(8, 32, 2147483647, NULL, NULL, NULL, 'Lotus Apartment, LT Road, Maheshwari Garden, Mumbai\r\n', 'steve@hotmail.com', '2015-01-10 11:46:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PMF_USER_STDNT_MAP`
--

CREATE TABLE IF NOT EXISTS `PMF_USER_STDNT_MAP` (
  `ID_USER_STNDT_MAP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER_INFO` int(11) DEFAULT NULL,
  `ID_STDNT` int(11) DEFAULT NULL,
  `TS_CRT_RCRD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_MDF_RCRD` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER_STNDT_MAP`),
  KEY `ID_USER` (`ID_USER_INFO`),
  KEY `ID_STDNT` (`ID_STDNT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `PMF_USER_STDNT_MAP`
--

INSERT INTO `PMF_USER_STDNT_MAP` (`ID_USER_STNDT_MAP`, `ID_USER_INFO`, `ID_STDNT`, `TS_CRT_RCRD`, `TS_MDF_RCRD`) VALUES
(1, 1, 2, '2014-12-30 22:48:00', NULL),
(2, 1, 7, '2014-12-30 22:48:00', NULL),
(3, 1, 13, '2015-01-04 07:51:17', NULL),
(4, 1, 14, '2015-01-04 07:51:17', NULL),
(5, 1, 15, '2015-01-04 07:51:17', NULL),
(6, 1, 16, '2015-01-04 07:51:17', NULL),
(7, 1, 26, '2015-01-04 07:51:17', NULL),
(8, 3, 14, '2015-01-04 12:57:22', NULL),
(9, 1, 12, '2015-01-04 12:57:22', NULL),
(10, 3, 13, '2015-01-04 12:59:13', NULL),
(11, 2, 15, '2015-01-04 12:59:13', NULL),
(12, 7, 27, '2015-01-10 12:11:10', NULL),
(13, 7, 28, '2015-01-10 12:11:10', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PMF_ADMN_INFO`
--
ALTER TABLE `PMF_ADMN_INFO`
  ADD CONSTRAINT `PMF_ADMN_INFO_ibfk_1` FOREIGN KEY (`ID_USER_CRDNT`) REFERENCES `PMF_USER_CRDNT` (`ID_USER_CRDNT`);

--
-- Constraints for table `PMF_INST`
--
ALTER TABLE `PMF_INST`
  ADD CONSTRAINT `PMF_INST_ibfk_4` FOREIGN KEY (`ID_RGN`) REFERENCES `PMF_RGN` (`ID_RGN`),
  ADD CONSTRAINT `PMF_INST_ibfk_3` FOREIGN KEY (`ID_USER_CRDNT`) REFERENCES `PMF_USER_CRDNT` (`ID_USER_CRDNT`);

--
-- Constraints for table `PMF_INST_CLS_DIV_MAP`
--
ALTER TABLE `PMF_INST_CLS_DIV_MAP`
  ADD CONSTRAINT `PMF_INST_CLS_DIV_MAP_ibfk_1` FOREIGN KEY (`ID_INST`) REFERENCES `PMF_INST` (`ID_INST`);

--
-- Constraints for table `PMF_INST_FE_STRUCT`
--
ALTER TABLE `PMF_INST_FE_STRUCT`
  ADD CONSTRAINT `PMF_INST_FE_STRUCT_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `PMF_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`);

--
-- Constraints for table `PMF_INST_RU`
--
ALTER TABLE `PMF_INST_RU`
  ADD CONSTRAINT `PMF_INST_RU_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `PMF_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`);

--
-- Constraints for table `PMF_NOTIFICATION`
--
ALTER TABLE `PMF_NOTIFICATION`
  ADD CONSTRAINT `PMF_NOTIFICATION_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `PMF_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`);

--
-- Constraints for table `PMF_PAYMENT`
--
ALTER TABLE `PMF_PAYMENT`
  ADD CONSTRAINT `PMF_PAYMENT_ibfk_1` FOREIGN KEY (`ID_USER_STNDT_MAP`) REFERENCES `PMF_USER_STDNT_MAP` (`ID_USER_STNDT_MAP`);

--
-- Constraints for table `PMF_RESULT`
--
ALTER TABLE `PMF_RESULT`
  ADD CONSTRAINT `PMF_RESULT_ibfk_2` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `PMF_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`),
  ADD CONSTRAINT `PMF_RESULT_ibfk_1` FOREIGN KEY (`ID_STDNT`) REFERENCES `PMF_STDNT` (`ID_STDNT`);

--
-- Constraints for table `PMF_STDNT`
--
ALTER TABLE `PMF_STDNT`
  ADD CONSTRAINT `PMF_STDNT_ibfk_2` FOREIGN KEY (`ID_INST`) REFERENCES `PMF_INST` (`ID_INST`),
  ADD CONSTRAINT `PMF_STDNT_ibfk_1` FOREIGN KEY (`ID_INST_CLS_DIV_MAP`) REFERENCES `PMF_INST_CLS_DIV_MAP` (`ID_INST_CLS_DIV_MAP`);

--
-- Constraints for table `PMF_USER_INFO`
--
ALTER TABLE `PMF_USER_INFO`
  ADD CONSTRAINT `PMF_USER_INFO_ibfk_1` FOREIGN KEY (`ID_USER_CRDNT`) REFERENCES `PMF_USER_CRDNT` (`ID_USER_CRDNT`);

--
-- Constraints for table `PMF_USER_STDNT_MAP`
--
ALTER TABLE `PMF_USER_STDNT_MAP`
  ADD CONSTRAINT `PMF_USER_STDNT_MAP_ibfk_3` FOREIGN KEY (`ID_USER_INFO`) REFERENCES `PMF_USER_INFO` (`ID_USER_INFO`),
  ADD CONSTRAINT `PMF_USER_STDNT_MAP_ibfk_2` FOREIGN KEY (`ID_STDNT`) REFERENCES `PMF_STDNT` (`ID_STDNT`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

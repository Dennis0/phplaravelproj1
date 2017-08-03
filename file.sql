-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ancerpuvacorp
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `accountgroup`
--

DROP TABLE IF EXISTS `accountgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountgroup` (
  `AccCode` int(11) NOT NULL,
  `AccName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `AccMaster` int(11) NOT NULL,
  PRIMARY KEY (`AccCode`),
  UNIQUE KEY `AccCode_UNIQUE` (`AccCode`) USING BTREE,
  KEY `FK417DC07258A841D` (`AccMaster`) USING BTREE,
  CONSTRAINT `accountgroup_ibfk_1` FOREIGN KEY (`AccMaster`) REFERENCES `accountmaster` (`AccCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountgroup`
--

LOCK TABLES `accountgroup` WRITE;
/*!40000 ALTER TABLE `accountgroup` DISABLE KEYS */;
INSERT INTO `accountgroup` VALUES (100,'Current Assets',NULL,10),(200,'Non-Current Assets',NULL,10),(300,'Current Liabilities',NULL,50),(400,'Non-Current Liabilities',NULL,50),(500,'Capital',NULL,60),(540,'Retained Earnings',NULL,60),(600,'Income/Revenue',NULL,70),(660,'Sales Returns',NULL,70),(700,'Cost of Goods Sold',NULL,80),(800,'Operating Expenses',NULL,80),(960,'Non-operating Income',NULL,70),(980,'Non-operating Expense',NULL,80);
/*!40000 ALTER TABLE `accountgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountmaster`
--

DROP TABLE IF EXISTS `accountmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountmaster` (
  `AccCode` int(11) NOT NULL,
  `AccName` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AccCode`),
  UNIQUE KEY `AccCode_UNIQUE` (`AccCode`) USING BTREE,
  UNIQUE KEY `AccName_UNIQUE` (`AccName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountmaster`
--

LOCK TABLES `accountmaster` WRITE;
/*!40000 ALTER TABLE `accountmaster` DISABLE KEYS */;
INSERT INTO `accountmaster` VALUES (10,'Asset',NULL),(50,'Liability',NULL),(60,'Equity',NULL),(70,'Income/Revenue',NULL),(80,'Expense',NULL);
/*!40000 ALTER TABLE `accountmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountsubtype`
--

DROP TABLE IF EXISTS `accountsubtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountsubtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accounttype` int(11) DEFAULT NULL,
  `subtype` varchar(100) NOT NULL,
  `CreatedDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TnxDate` datetime DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ActiveStatus` tinyint(1) unsigned NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AccsubtypeIndex` (`subtype`) USING BTREE,
  KEY `AccsubtypeTypeIndex` (`accounttype`) USING BTREE,
  KEY `accsubtypeCreatedBy` (`CreatedBy`) USING BTREE,
  KEY `accsubtypeApprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `accsubtypecostcenter` (`costcenter`),
  KEY `accsubtypecompany` (`company`),
  CONSTRAINT `accountsubtype_ibfk_1` FOREIGN KEY (`accounttype`) REFERENCES `accounttypes` (`AccCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `accountsubtype_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accountsubtype_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accsubtypecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accsubtypecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountsubtype`
--

LOCK TABLES `accountsubtype` WRITE;
/*!40000 ALTER TABLE `accountsubtype` DISABLE KEYS */;
INSERT INTO `accountsubtype` VALUES (1,8010,'Admin Expense','2014-04-25',7,'2014-04-25 11:02:17',NULL,NULL,1,1,NULL,NULL),(7,7300,'Generator','2014-04-25',7,'2014-04-25 11:17:47',NULL,NULL,1,1,NULL,NULL),(8,8010,'Employee Expense','2014-04-25',7,'2014-04-25 11:59:48',NULL,NULL,1,1,NULL,NULL),(9,8010,'Bank Service Charges','2014-04-25',7,'2014-04-25 12:00:35',NULL,NULL,1,1,NULL,NULL),(10,8010,'Vehicle Repairs & Maintenence','2014-04-25',7,'2014-04-25 12:25:52',NULL,NULL,1,1,NULL,NULL),(11,8010,'Vehicle Expense-Parking','2014-04-25',7,'2014-04-25 12:26:12',NULL,NULL,1,1,NULL,NULL),(12,8010,'Vehicle Expense-Fuel-Admin','2014-04-25',7,'2014-04-25 12:26:29',NULL,NULL,1,1,NULL,NULL),(13,8010,'Interest Expense','2014-04-25',7,'2014-04-25 12:26:48',NULL,NULL,1,1,NULL,NULL),(14,8010,'Transport Outwards','2014-04-25',7,'2014-04-25 12:27:22',NULL,NULL,1,1,NULL,NULL),(15,8010,'Vehicle Expense-Fuel-Selling&Distr','2014-04-25',7,'2014-04-25 12:43:41',NULL,NULL,1,1,NULL,NULL),(16,8010,'Vehicle Expense-Misc','2014-04-25',7,'2014-04-25 12:44:50',NULL,NULL,1,1,NULL,NULL),(20,8010,'Mobile Phone Airtime','2016-01-04',7,'2016-01-04 13:39:32','2016-01-04 13:39:59',7,1,1,NULL,NULL),(21,8010,'Vehicle Expense-Carwash','2016-01-04',7,'2016-01-04 13:51:53','2016-01-04 13:52:19',7,1,1,NULL,NULL);
/*!40000 ALTER TABLE `accountsubtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttypes`
--

DROP TABLE IF EXISTS `accounttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounttypes` (
  `AccCode` int(11) NOT NULL,
  `AccName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `AccGrp` int(11) NOT NULL,
  `Rolling` tinyint(1) NOT NULL,
  `Cashflow` tinyint(1) NOT NULL,
  PRIMARY KEY (`AccCode`),
  UNIQUE KEY `AccCode_UNIQUE` (`AccCode`) USING BTREE,
  KEY `FK4238226C224E04AB` (`AccGrp`) USING BTREE,
  CONSTRAINT `accounttypes_ibfk_1` FOREIGN KEY (`AccGrp`) REFERENCES `accountgroup` (`AccCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttypes`
--

LOCK TABLES `accounttypes` WRITE;
/*!40000 ALTER TABLE `accounttypes` DISABLE KEYS */;
INSERT INTO `accounttypes` VALUES (1100,'Cash','Cash',100,0,0),(1150,'Card','Cash',100,0,0),(1200,'Bank ','Cash',100,0,0),(1250,'Mobile Banking','Cash',100,0,0),(1300,'Inventory/Stock','',100,0,0),(1400,'Accounts Receivable','',100,0,0),(1450,'Sundry Receivables','',100,0,0),(1500,'Receivables-Statutory','',100,0,0),(1600,'Short Term Investments','Short Term Investments/Instruments',100,0,0),(1650,'Loans Receivable','',100,0,0),(1700,'Prepayments','',100,0,0),(1750,'Deposits','',100,0,0),(1800,'Other Current Assets','',100,0,0),(2100,'Land and Building','',200,0,0),(2150,'Furniture, Fixtures &  Fittings','',200,0,0),(2200,'Office Equipment','',200,0,0),(2300,'Plant & Machinery','',200,0,0),(2350,'Invesrment Property','',200,0,0),(2400,'Vehicles','',200,0,0),(2450,'Project Assets','',200,0,0),(2500,'Intangible Assets','',200,0,0),(2510,'Software ','',200,0,0),(2600,'Accumulated Depreciation','',200,0,0),(2610,'Impairment','',200,0,0),(2620,'Armotisation','',200,0,0),(2630,'Disposal','',200,0,0),(2650,'Assets Held For Sale','',200,0,0),(2700,'Biological Asset','',200,0,0),(2800,'Subsidiary','',200,0,0),(2810,'Joint Venture','',200,0,0),(2820,'Associate','',200,0,0),(2830,'Goodwill','',200,0,0),(2840,'Finance Lease','',200,0,0),(2850,'Long Term Investments','Long Term Investments/Instruments',200,0,0),(2900,'Other Non-Current Asset','',200,0,0),(3100,'Accounts Payables','',300,0,0),(3200,'Payables-Statutory','',300,0,0),(3300,'Sundry Payables','',300,0,0),(3400,'Accrued Expenses','',300,0,0),(3500,'Provisions','',300,0,0),(3600,'Loans and Borrowings-Short Term','',300,0,0),(3700,'Other Current Liability','',300,0,0),(4010,'Loans and Borrowings-Long Term','',400,0,0),(4015,'Term Loan','',400,0,0),(4020,'Bonds Payable','',400,0,0),(4025,'Finance Lease','',400,0,0),(4030,'Employee Post-retirement Benefits','',400,0,0),(4035,'Other Non-Current Liability','',400,0,0),(5100,'Share Capital','',500,0,0),(5110,'Share Premium','',500,0,0),(5200,'Capital Reserves','',500,0,0),(5210,'Revenue Reserves','',500,0,0),(5220,'Redemption Reserve','',500,0,0),(5230,'Revaluation Reserves','',500,0,0),(5300,'Foreign Exchange Reserve','',500,0,0),(5400,'Other Capital Account','',500,0,0),(5500,'Retained Earnings','',500,0,0),(5600,'Beginning Balance','',500,0,0),(6100,'Sales','',600,0,0),(6200,'Income','',600,0,0),(6300,'Revenue','',600,0,0),(6400,'Commission','',600,0,0),(6410,'Rental income','',600,0,0),(6420,'Interest income','',600,0,0),(6430,'Service Income','',600,0,0),(6440,'Contract Income','',600,0,0),(6500,'Other Income','',600,0,0),(6600,'Returns -Sales','',600,0,0),(6700,'Cash Discounts','',600,0,0),(6710,'Sales Discounts','',600,0,0),(7100,'Purchases','',700,0,0),(7200,'Cost of Operations','',700,0,0),(7300,'Cost of Manufacture','',700,0,0),(7400,'Returns - Purchases','',700,0,0),(7500,'Inventory CoGs','',700,0,0),(7600,'Finished Goods','',700,0,0),(7610,'Work In Process','',700,0,0),(7620,'Direct Material','',700,0,0),(7630,'Direct Labour','',700,0,0),(7640,'Direct Expense','',700,0,0),(7650,'CoGS Variances','',700,0,0),(7660,'CoGs Discounts','',700,0,0),(8010,'Operating Expenses','',800,0,0),(9400,'General Expense','',800,0,0),(9450,'Indirect Expense','',800,0,0),(9550,'Other Expense','',800,0,0),(9610,'Non-operating Revenues and Gains ','',960,0,0),(9620,'Currency Gain','',960,0,0),(9630,'Fixed Assets Sale Gain','',960,0,0),(9810,'Non-operating Expenses and Losses ','',980,0,0),(9820,'Currency Loss','',980,0,0),(9830,'Fixed Assets Sale Loss','',980,0,0),(9840,'Foreign exchange Gain/Loss','',980,0,0),(9850,'Default/Suspense Accounts','Temporary accounts - balance should be zero',980,0,0),(9910,'Tax Expense','',800,0,0);
/*!40000 ALTER TABLE `accounttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ancparams`
--

DROP TABLE IF EXISTS `ancparams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ancparams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefixInvoice` varchar(45) DEFAULT NULL COMMENT '	',
  `prefixSalesOrder` varchar(45) DEFAULT NULL,
  `prefixSalesInvoice` varchar(45) DEFAULT NULL,
  `prefixSalesDelivery` varchar(45) DEFAULT NULL,
  `prefixConsignmentNote` varchar(45) DEFAULT NULL,
  `prefixGrn` varchar(45) DEFAULT NULL,
  `prefixIssueNote` varchar(45) DEFAULT NULL,
  `prefixReturnNote` varchar(45) DEFAULT NULL,
  `prefixPurchaseOrder` varchar(45) DEFAULT NULL,
  `prefixSupplierInvoice` varchar(45) DEFAULT NULL,
  `prefixSupplierCreditNote` varchar(45) DEFAULT NULL,
  `prefixSupplierDebitNote` varchar(45) DEFAULT NULL,
  `prefixQuotation` varchar(45) DEFAULT NULL,
  `prefixEnquiryNote` varchar(45) DEFAULT NULL,
  `prefixSalesCreditNote` varchar(45) DEFAULT NULL,
  `prefixSupplier` varchar(45) DEFAULT NULL,
  `prefixCustomer` varchar(45) DEFAULT NULL,
  `prefixPrCustomer` varchar(45) DEFAULT NULL,
  `prefixInventoryCarton` varchar(45) DEFAULT '""',
  `currDecimalCount` tinyint(3) DEFAULT NULL,
  `qtyDecimalCount` tinyint(3) DEFAULT NULL,
  `roundOff` double(7,4) NOT NULL DEFAULT '0.0000',
  `dateFormat` varchar(45) DEFAULT NULL,
  `ProcessingCostSqm` double(7,4) NOT NULL DEFAULT '0.0000',
  `defWasteAllowance` double(7,4) NOT NULL DEFAULT '0.0000',
  `defProfitMargin` double(7,4) NOT NULL DEFAULT '0.0000',
  `defConversionMargin` double(7,4) NOT NULL DEFAULT '0.0000',
  `BFactor` double(3,2) NOT NULL DEFAULT '0.00',
  `CFactor` double(3,2) NOT NULL DEFAULT '0.00',
  `EFactor` double(3,2) NOT NULL DEFAULT '0.00',
  `ManufactureOH` double(7,4) NOT NULL DEFAULT '0.0000',
  `ExcessGrn` double(7,4) NOT NULL DEFAULT '0.0000',
  `ExcessSO` double(7,4) NOT NULL DEFAULT '0.0000',
  `ProductionDays` double(7,4) NOT NULL DEFAULT '0.0000',
  `footnote` text,
  `dividendsRate` double(7,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ancparams`
--

LOCK TABLES `ancparams` WRITE;
/*!40000 ALTER TABLE `ancparams` DISABLE KEYS */;
INSERT INTO `ancparams` VALUES (1,'INV','SO','INV','DEL','CSN','GRN','IS','RN','PO','SUIN','SCRN','SDBN','QT','EN','SCN','SPL','CS','PRC','STCK',2,4,0.5000,'dd/MMM/yyyy',9.0000,8.0000,18.0000,60.0000,1.40,1.50,1.28,13.5000,10.0000,0.0000,0.0000,NULL,1.000);
/*!40000 ALTER TABLE `ancparams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetregister`
--

DROP TABLE IF EXISTS `assetregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AssetName` varchar(100) NOT NULL,
  `AssetSerial` varchar(200) NOT NULL,
  `AssetModelNo` varchar(200) DEFAULT NULL,
  `AssetUse` varchar(40) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `PurchaseDate` datetime DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Supplier` int(11) DEFAULT NULL,
  `prefix` varchar(45) NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AssetSerial_UNIQUE` (`AssetSerial`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `assetDeptIndex_idx` (`deptId`) USING BTREE,
  KEY `assetCreatedBY` (`CreatedBy`) USING BTREE,
  KEY `assetApprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `assetSuppIndex` (`Supplier`) USING BTREE,
  KEY `assetregistercostcenter` (`costcenter`),
  KEY `assetregistercompany` (`company`),
  CONSTRAINT `assetregister_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assetregister_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assetregister_ibfk_3` FOREIGN KEY (`deptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assetregister_ibfk_4` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assetregistercompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `assetregistercostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetregister`
--

LOCK TABLES `assetregister` WRITE;
/*!40000 ALTER TABLE `assetregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audittrail`
--

DROP TABLE IF EXISTS `audittrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime NOT NULL,
  `docno` varchar(45) NOT NULL,
  `docType` varchar(45) NOT NULL,
  `oldvalue` double(12,2) DEFAULT NULL,
  `newValue` double(12,2) DEFAULT NULL,
  `action` varchar(45) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `computer` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trailCreatedBy` (`createdby`) USING BTREE,
  KEY `audittrailcostcenter` (`costcenter`),
  KEY `audittrailcompany` (`company`),
  CONSTRAINT `audittrail_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audittrailcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audittrailcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audittrail`
--

LOCK TABLES `audittrail` WRITE;
/*!40000 ALTER TABLE `audittrail` DISABLE KEYS */;
INSERT INTO `audittrail` VALUES (1,'2016-02-09 18:16:37','1','CUSTOMER',NULL,NULL,'CREATE',1,0,7,'192.168.0.26:Ndegwa-PC',1,NULL,NULL),(2,'2016-02-09 18:46:32','1','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(3,'2016-02-09 18:49:59','2','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(4,'2016-02-09 18:53:39','3','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(5,'2016-02-10 19:47:33','1','Jobcard',NULL,NULL,'CREATE',0,0,7,'127.0.0.1:Ndegwa-PC',0,NULL,NULL),(6,'2016-02-10 20:05:57','2','Jobcard',NULL,NULL,'CREATE',0,0,7,'127.0.0.1:Ndegwa-PC',0,NULL,NULL),(7,'2016-02-11 18:11:06','1','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(8,'2016-02-11 21:01:57','4','Helpdesk',NULL,NULL,'CREATE',0,0,7,'127.0.0.1:Ndegwa-PC',0,NULL,NULL),(9,'2016-02-11 21:05:23','3','Jobcard',NULL,NULL,'CREATE',0,0,7,'127.0.0.1:Ndegwa-PC',0,NULL,NULL),(10,'2016-02-11 21:10:49','2','Tracker',NULL,NULL,'CREATE',0,0,7,'127.0.0.1:Ndegwa-PC',0,NULL,NULL),(11,'2016-02-12 10:10:11','5','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.55:Ndegwa-PC',0,NULL,NULL),(12,'2016-02-12 10:11:52','3','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.55:Ndegwa-PC',0,NULL,NULL),(13,'2016-02-12 10:21:37','6','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.55:Ndegwa-PC',0,NULL,NULL),(14,'2016-02-12 10:25:41','4','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.55:Ndegwa-PC',0,NULL,NULL),(15,'2016-02-12 10:29:17','1','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.55:Ndegwa-PC',0,NULL,NULL),(16,'2016-02-17 11:24:54','1','Auctioneer',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(17,'2016-02-17 12:13:49','2','Auctioneer',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(18,'2016-02-17 14:58:01','7','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(19,'2016-02-17 16:49:57','1','CUSTOMER',NULL,NULL,'EDIT',1,0,7,'192.168.0.28:Ndegwa-PC',1,NULL,NULL),(20,'2016-02-17 17:46:17','8','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(21,'2016-02-17 17:47:18','9','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(22,'2016-02-18 13:02:17','1','Helpdesktrail',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(23,'2016-02-18 16:27:08','5','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(24,'2016-02-18 19:31:29','2562','CHART OF ACCOUNT',NULL,0.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(25,'2016-02-18 19:32:17','1','DEFAULT ACCOUNTS',NULL,NULL,'EDIT',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(26,'2016-02-18 19:48:39','6','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(27,'2016-02-18 19:50:44','2','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(28,'2016-02-18 19:58:17','3','Auctioneer',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(29,'2016-02-18 20:02:35','10','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(30,'2016-02-18 20:03:57','2','Helpdesktrail',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(31,'2016-02-18 20:07:51','7','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(32,'2016-02-18 20:10:50','3','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(33,'2016-02-18 20:19:01','1','RECEIPT',NULL,45000.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(34,'2016-02-18 20:19:57','1','AR ALLOCATION',NULL,45000.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(35,'2016-02-18 20:23:19','1','SUPPLIER',NULL,NULL,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',1,NULL,NULL),(36,'2016-02-18 20:45:44','1','PURCHASE ORDER',NULL,23000.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(37,'2016-02-18 20:48:05','1','GOODS RECEIPT',NULL,10.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(38,'2016-02-18 20:49:15','25','REEL SERIALIZATION',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(39,'2016-02-18 20:50:47','1','MATERIAL REQUISITION',NULL,3.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(40,'2016-02-18 20:52:00','9','MATERIAL ISSUE',NULL,3.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(41,'2016-02-18 20:52:22','2','MATERIAL REQUISITION',NULL,2.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(42,'2016-02-18 20:55:30','10','MATERIAL ISSUE',NULL,2.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(43,'2016-02-18 20:57:05','3','CREDIT SALES',NULL,5000.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(44,'2016-02-18 20:57:51','1','MATERIAL RETURNS',NULL,1.00,'CREATE',1,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(45,'2016-02-19 09:54:34','4','Auctioneer',NULL,NULL,'CREATE',0,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(46,'2016-02-19 10:07:14','11','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(47,'2016-02-19 10:08:37','1','Helpdesktrail',NULL,NULL,'CREATE',0,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(48,'2016-02-19 10:24:37','8','Jobcard',NULL,NULL,'CREATE',0,0,7,'127.0.0.1:Ndegwa-PC',0,NULL,NULL),(49,'2016-02-19 10:31:08','1','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(50,'2016-02-19 10:37:22','1','RECEIPT',NULL,300000.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(51,'2016-02-19 10:38:33','1','AR ALLOCATION',NULL,300000.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(52,'2016-02-19 10:48:07','2','PURCHASE ORDER',NULL,11500.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(53,'2016-02-19 10:49:11','2','GOODS RECEIPT',NULL,5.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(54,'2016-02-19 10:53:04','30','REEL SERIALIZATION',NULL,NULL,'CREATE',0,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(55,'2016-02-19 10:54:21','3','MATERIAL REQUISITION',NULL,2.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(56,'2016-02-19 10:57:23','11','MATERIAL ISSUE',NULL,2.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(57,'2016-02-19 11:01:19','5','CREDIT SALES',NULL,5000.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(58,'2016-02-19 11:02:16','2','MATERIAL RETURNS',NULL,1.00,'CREATE',1,0,7,'192.168.0.68:Ndegwa-PC',0,NULL,NULL),(59,'2016-02-19 12:05:13','9','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(60,'2016-02-19 12:08:35','2','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.28:Ndegwa-PC',0,NULL,NULL),(61,'2016-02-22 10:01:44','1','AUCTIONEER AGENCY',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(62,'2016-02-22 11:16:08','5','AUCTIONEER',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(63,'2016-02-22 11:18:12','2','AUCTIONEER AGENCY',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(64,'2016-02-22 11:20:39','6','AUCTIONEER',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(65,'2016-02-22 11:22:01','7','AUCTIONEER',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(66,'2016-02-22 11:55:58','1','HELPDESK ISSUE',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(67,'2016-02-22 11:56:16','2','HELPDESK ISSUE',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(68,'2016-02-22 13:08:03','2','CUSTOMER',NULL,NULL,'EDIT',1,0,7,'192.168.0.26:Ndegwa-PC',1,NULL,NULL),(69,'2016-02-22 13:09:30','2','CUSTOMER',NULL,NULL,'EDIT',1,0,7,'192.168.0.26:Ndegwa-PC',1,NULL,NULL),(70,'2016-02-22 13:09:37','2','CUSTOMER',NULL,NULL,'EDIT',1,0,7,'192.168.0.26:Ndegwa-PC',1,NULL,NULL),(71,'2016-02-23 14:32:24','1','CUSTOMER',NULL,NULL,'EDIT',1,0,7,'192.168.0.26:Ndegwa-PC',1,NULL,NULL),(72,'2016-02-23 18:37:09','1','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(73,'2016-02-23 18:52:14','2','Helpdesk',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(74,'2016-02-23 19:13:17','10','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(75,'2016-02-24 13:13:28','11','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.137.171:Ndegwa-PC',0,NULL,NULL),(76,'2016-02-26 18:53:45','3','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(77,'2016-02-26 20:20:04','12','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(78,'2016-02-26 20:21:05','0','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(79,'2016-02-26 20:27:27','13','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(80,'2016-02-26 20:28:15','4','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(81,'2016-02-26 20:35:34','14','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(82,'2016-02-26 20:38:33','5','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(83,'2016-02-26 20:47:13','15','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(84,'2016-02-26 20:47:46','6','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(85,'2016-02-26 20:51:45','16','Jobcard',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(86,'2016-02-26 20:52:50','7','Tracker',NULL,NULL,'CREATE',0,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(87,'2016-02-29 11:32:27','1','RECEIPT',NULL,12000.00,'CREATE',1,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(88,'2016-02-29 11:33:16','1','AR ALLOCATION',NULL,10000.00,'CREATE',1,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(89,'2016-02-29 12:15:14','2','AR ALLOCATION',NULL,10000.00,'CREATE',1,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL),(90,'2016-02-29 12:19:32','3','AR ALLOCATION',NULL,10000.00,'CREATE',1,0,7,'192.168.0.26:Ndegwa-PC',0,NULL,NULL);
/*!40000 ALTER TABLE `audittrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankcodes`
--

DROP TABLE IF EXISTS `bankcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankcodes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BankId` int(11) NOT NULL,
  `BranchCode` varchar(100) CHARACTER SET latin1 NOT NULL,
  `BankBranch` varchar(100) CHARACTER SET latin1 NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  KEY `BankCode_UNIQUE` (`BankId`) USING BTREE,
  KEY `bankcodeCreatedBy` (`CreatedBy`) USING BTREE,
  KEY `bankcodesApprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `bankcodescostcenter` (`costcenter`),
  KEY `bankcodescompany` (`company`),
  CONSTRAINT `bankcodes_ibfk_1` FOREIGN KEY (`BankId`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bankcodes_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bankcodes_ibfk_3` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bankcodescompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bankcodescostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2926 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankcodes`
--

LOCK TABLES `bankcodes` WRITE;
/*!40000 ALTER TABLE `bankcodes` DISABLE KEYS */;
INSERT INTO `bankcodes` VALUES (1463,6202,'263','BIASHARA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1464,6202,'181','BOMET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1465,6202,'228','BONDO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1466,6202,'197','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1467,6202,'205','BURUBURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1468,6202,'229','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1469,6202,'201','CAPITAL HILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1470,6202,'139','CARD CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1471,6202,'206','CHOGORIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1472,6202,'196','CHUKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1473,6202,'292','CPC BULK CORPORATE CHEQUES','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1474,6202,'133','CUSTODY SERVICES','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1475,6202,'302','DIASPORA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1476,6202,'91','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1477,6202,'252','EGERTON UNIVERSITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1478,6202,'163','ELDAMA RAVINE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1479,6202,'109','ELDORET KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1480,6202,'168','ELDORET WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1481,6202,'215','EMALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1482,6202,'116','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1483,6202,'217','FLAMINGO SAVINGS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1484,6202,'290','Garden Plaza','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1485,6202,'169','GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1486,6202,'226','Garsen','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1487,6202,'204','GATEWAY MSA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1488,6202,'214','GATUNDU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1489,6202,'257','GIKOMBA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1490,6202,'159','GILGIL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1491,6202,'193','GITHUNGURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1492,6202,'288','Haile Selassie','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1493,6202,'94','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1494,6202,'96','HEAD OFFICE FINANCE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1495,6202,'146','HOLA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1496,6202,'230','HOMA BAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1497,6202,'306','HURLINGHAM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1498,6202,'113','INDUSTRIAL AREA NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1499,6202,'284','ISIBANIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1500,6202,'216','ISIOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1501,6202,'158','ITEN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1502,6202,'137','JOGOO ROAD NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1503,6202,'152','KABARNET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1504,6202,'311','KABARTONJO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1505,6202,'131','KAJIADO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1506,6202,'110','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1507,6202,'207','KANGARE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1508,6202,'117','KANGEMA/KIRIAINI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1509,6202,'151','KAPENGURIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1510,6202,'166','KAPSABET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1511,6202,'231','KAPSOWAR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1512,6202,'120','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1513,6202,'202','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1514,6202,'260','KARIOBANGI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1515,6202,'309','KASARANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1516,6202,'254','Kawangware','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1517,6202,'92','KCB C.P.C.','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1518,6202,'232','KEHANCHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1519,6202,'225','KENGELENI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1520,6202,'104','KENYATTA CONFERENCE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1521,6202,'106','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1522,6202,'233','KEROKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1523,6202,'195','KERUGOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1524,6202,'119','KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1525,6202,'208','KIANYAGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1526,6202,'307','KIBERA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1527,6202,'164','KIBWEZI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1528,6202,'129','KIKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1529,6202,'234','Kilgoris','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1530,6202,'174','KILIFI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1531,6202,'111','KILINDINI MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1532,6202,'255','KIMATHI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1533,6202,'235','KIMILILI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1534,6202,'101','KIPANDE HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1535,6202,'251','KIRIAINI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1536,6202,'287','KISAUNI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1537,6202,'285','KISERAIN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1538,6202,'191','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1539,6202,'303','KISII WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1540,6202,'297','KISUMU AIRPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1541,6202,'246','KISUMU WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1542,6202,'105','KISUMU/AHERO/KISUMUWEST/LUANDA/K','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1543,6202,'149','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1544,6202,'162','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1545,6202,'135','KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1546,6202,'258','KWALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1547,6202,'267','KYUSO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1548,6202,'173','LAMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1549,6202,'155','LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1550,6202,'236','LITEIN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1551,6202,'144','LODWAR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1552,6202,'142','LOITOKITOK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1553,6202,'203','LOKICHOGIO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1554,6202,'237','Londiani','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1555,6202,'238','LUANDA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1556,6202,'310','MAASAI MARA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1557,6202,'194','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1558,6202,'278','MAKINDU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1559,6202,'211','MAKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1560,6202,'239','MALABA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1561,6202,'199','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1562,6202,'150','MANDERA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1563,6202,'154','MARALAL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1564,6202,'220','MARIAKANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1565,6202,'247','MARIGAT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1566,6202,'140','MARSABIT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1567,6202,'249','MASHARIKI (I/A)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1568,6202,'270','MASII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1569,6202,'134','MATUU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1570,6202,'253','MAUA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1571,6202,'183','MBALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1572,6202,'304','MBITA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1573,6202,'271','MENENGAI CRATER','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1574,6202,'123','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1575,6202,'192','Migori','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1576,6202,'175','MILIMANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1577,6202,'100','MOI AVENUE NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1578,6202,'248','MOI BRIDGE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1579,6202,'299','MOI INTERNATIONAL AIRPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1580,6202,'296','MOMBASA HIGH COURT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1581,6202,'272','MOMBASA TOWN CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1582,6202,'127','MOYALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1583,6202,'221','MPEKETONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1584,6202,'222','MTITU ANDEI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1585,6202,'223','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1586,6202,'240','MUHORONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1587,6202,'177','MUKURUWEINI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1588,6202,'124','MUMIAS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1589,6202,'115','MURANGA/MAKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1590,6202,'219','Mutomo','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1591,6202,'136','MVITA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1592,6202,'212','MWEA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1593,6202,'286','MWEMBE TAYARI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1594,6202,'148','MWINGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1595,6202,'295','NAIROBI HIGH COURT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1596,6202,'190','NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1597,6202,'103','NAKURU/ELBURGON/FLAMINGO/MENENGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1598,6202,'256','NAMANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1599,6202,'143','NANDI HILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1600,6202,'125','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1601,6202,'250','NARO MORO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1602,6202,'184','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1603,6202,'266','Ngara','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1604,6202,'213','NJAMBINI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1605,6202,'218','NJORO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1606,6202,'209','NKUBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1607,6202,'122','NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1608,6202,'300','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1609,6202,'176','NYAMIRA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1610,6202,'112','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1611,6202,'210','OL KALOU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1612,6202,'161','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1613,6202,'185','OTHAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1614,6202,'241','OYUGIS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1615,6202,'298','PORT VICTORIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1616,6202,'259','PRESTIGE PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1617,6202,'114','RIVER ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1618,6202,'283','RONGO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1619,6202,'147','RUIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1620,6202,'289','SALAMA HOUSE MORTGAGE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1621,6202,'141','SARIT CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1622,6202,'291','SARIT CENTRE MORTGAGE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1623,6202,'244','SEREM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1624,6202,'121','SIAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1625,6202,'245','Sondu','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1626,6202,'305','SORI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1627,6202,'189','SOTIK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1628,6202,'130','TALA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1629,6202,'224','TAVETA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1630,6202,'108','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1631,6202,'308','THIKA ROAD MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1632,6202,'107','TOM MBOYA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1633,6202,'293','TRADE SERVICES','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1634,6202,'102','TREASURY SQUARE (MSA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1635,6202,'242','UGUNJA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1636,6202,'157','UKUNDA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1637,6202,'145','UN-GIGIRI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1638,6202,'243','UNITED MALL KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1639,6202,'167','UNIVERSITY WAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1640,6202,'180','VILLAGE MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1641,6202,'186','VOI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1642,6202,'153','WAJIR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1643,6202,'227','WATAMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1644,6202,'188','WEBUYE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1645,6202,'301','WESTGATE ADVANTAGE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1646,6202,'95','WOTE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1647,6202,'198','WUNDANYI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1648,6203,'90','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1649,6203,'78','C.O.U','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1650,6203,'84','CHIROMO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1651,6203,'80','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1652,6203,'0','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1653,6203,'85','GREENSAPN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1654,6203,'19','HARAMBEE AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1655,6203,'53','INDUSTRIAL AREA (NBI)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1656,6203,'54','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1657,6203,'75','KAREN BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1658,6203,'6','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1659,6203,'1','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1660,6203,'20','KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1661,6203,'5','KILINDINI ROAD (MSA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1662,6203,'81','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1663,6203,'2','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1664,6203,'3','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1665,6203,'89','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1666,6203,'64','KOINANGE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1667,6203,'73','LANGATA SHOPPING CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1668,6203,'16','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1669,6203,'74','MAKUPA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1670,6203,'60','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1671,6203,'17','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1672,6203,'8','MOI AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1673,6203,'76','MUTHAIGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1674,6203,'9','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1675,6203,'10','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1676,6203,'83','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1677,6203,'11','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1678,6203,'72','RUARAKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1679,6203,'87','THE JUNCTION','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1680,6203,'12','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1681,6203,'91','THIKA ROAD MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1682,6203,'86','T-MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1683,6203,'4','TREASURY SQUARE (MSA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1684,6203,'79','UKAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1685,6203,'82','UPPERHILL BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1686,6203,'15','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1687,6203,'71','YAYA CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1688,6204,'90','ABC PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1689,6204,'128','BAMBURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1690,6204,'77','BARCALYS PLAZA CORPORATE SERVICE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1691,6204,'21','BARCLAYCARD OPERATIONS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1692,6204,'56','BARCLAYS ADVISORY AND REG.SERVICES','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1693,6204,'96','BARCLAYS MERCHANT FINANCE LTD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1694,6204,'97','BARCLAYS SECURITIES SERVICES','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1695,6204,'29','BOMET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1696,6204,'48','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1697,6204,'84','BUNYALA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1698,6204,'28','BURUBURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1699,6204,'88','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1700,6204,'79','BUTERE ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1701,6204,'151','CASH MONITORING UNIT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1702,6204,'114','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1703,6204,'38','CHOMBA HOUSE RIVER ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1704,6204,'60','CHUKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1705,6204,'273','CONSUMER OPERATIONS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1706,6204,'354','CREDIT OPERATIONS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1707,6204,'47','DEVELOPMENT HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1708,6204,'100','DIANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1709,6204,'81','DIGO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1710,6204,'337','DOCUMENTS AND SECURITIES Dsc','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1711,6204,'14','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1712,6204,'3','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1713,6204,'4','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1714,6204,'70','ENTERPRISE ROAD BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1715,6204,'300','FINANCE DEPARTMENT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1716,6204,'17','GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1717,6204,'33','GIKOMBA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1718,6204,'23','GILGIL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1719,6204,'57','GITHUNGURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1720,6204,'24','GITHURAI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1721,6204,'82','HAILE SELASSIE AVENUE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1722,6204,'130','HARAMBEE AVENUE - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1723,6204,'400','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1724,6204,'1','HEAD OFFICE - VPC','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1725,6204,'51','HOMA BAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1726,6204,'45','HURLINGHAM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1727,6204,'42','ISIOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1728,6204,'103','JKI AIRPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1729,6204,'72','JUJA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1730,6204,'62','KABARNET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1731,6204,'26','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1732,6204,'6','KAPENGURIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1733,6204,'2','KAPSABET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1734,6204,'206','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1735,6204,'65','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1736,6204,'93','KARIOBANGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1737,6204,'59','KASARANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1738,6204,'34','KAWANGWARE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1739,6204,'76','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1740,6204,'7','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1741,6204,'63','KERUGOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1742,6204,'74','KIKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1743,6204,'19','KILIFI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1744,6204,'78','KIRIAINI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1745,6204,'8','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1746,6204,'9','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1747,6204,'132','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1748,6204,'15','KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1749,6204,'49','LAVINGTON','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1750,6204,'11','LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1751,6204,'40','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1752,6204,'46','MAKUPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1753,6204,'12','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1754,6204,'113','MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1755,6204,'44','MAUA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1756,6204,'35','MBALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1757,6204,'13','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1758,6204,'80','MIGORI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1759,6204,'145','MOI AVENUE MSA - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1760,6204,'75','MOI AVENUE NBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1761,6204,'39','MUMIAS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1762,6204,'5','MURANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1763,6204,'55','MUTHAIGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1764,6204,'86','NAIROBI WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1765,6204,'111','NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1766,6204,'61','NAKUMATT - WESTGATE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1767,6204,'95','NAKUMATT EMBAKASI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1768,6204,'71','NAKUMATT MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1769,6204,'27','NAKURU EAST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1770,6204,'125','NAKURU WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1771,6204,'190','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1772,6204,'41','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1773,6204,'43','NGONG','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1774,6204,'16','NKRUMAH ROAD BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1775,6204,'139','NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1776,6204,'18','NYAMIRA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1777,6204,'220','NYERERE AVENUE MSA - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1778,6204,'30','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1779,6204,'20','OFFICE PARK WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1780,6204,'52','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1781,6204,'53','OTHAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1782,6204,'68','PAMOJA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1783,6204,'89','PANGANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1784,6204,'87','PARKLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1785,6204,'10','PARKLANDS MOMBASA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1786,6204,'22','PAYMANTS AND INTERNATIONAL SERVICES','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1787,6204,'36','PLAZA PREMIER CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1788,6204,'32','PORT MSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1789,6204,'94','QUEENSWAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1790,6204,'117','RAHIMTULLA TRUST TOWERS - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1791,6204,'340','RETAIL CREDIT TEAM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1792,6204,'37','RIVER ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1793,6204,'67','RUARAKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1794,6204,'106','SARIT CENTRE - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1795,6204,'50','TALA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1796,6204,'64','TAVETA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1797,6204,'31','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1798,6204,'144','TREASURY OPERATIONS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1799,6204,'83','UON MAIN CAMPUS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1800,6204,'105','VILLAGE MARKET - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1801,6204,'54','VOI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1802,6204,'58','WEBUYE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1803,6204,'73','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1804,6204,'69','WOTE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1805,6204,'66','WUNDANYI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1806,6204,'109','YAYA CENTRE - PREMIER LIFE CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1807,6205,'9','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1808,6205,'2','INDUSTRIAL AREA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1809,6205,'0','KENYATTA AVENUE, NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1810,6205,'1','NKURUMAH ROAD, MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1811,6205,'3','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1812,6206,'2','DIGO RD, MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1813,6206,'8','Eldoret','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1814,6206,'7','Industrial Area','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1815,6206,'10','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1816,6206,'5','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1817,6206,'0','NAIROBI MAIN OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1818,6206,'9','NAKURU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1819,6206,'11','NYALI,MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1820,6206,'6','Sarit Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1821,6206,'4','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1822,6207,'25','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1823,6207,'24','DIANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1824,6207,'26','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1825,6207,'16','GALLERIA MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1826,6207,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1827,6207,'5','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1828,6207,'17','JUNCTION','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1829,6207,'27','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1830,6207,'3','MAMA NGINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1831,6207,'6','MAMLAKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1832,6207,'21','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1833,6207,'20','MOI AVENUE MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1834,6207,'22','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1835,6207,'23','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1836,6207,'9','PARKSIDE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1837,6207,'8','SWISSPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1838,6207,'28','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1839,6207,'18','THIKA ROAD MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1840,6207,'1','UPPERHILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1841,6207,'7','VILLAGE MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1842,6207,'2','WABERA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1843,6207,'4','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1844,6208,'49','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1845,6208,'48','KIMATHI STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1846,6208,'86','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1847,6208,'47','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1848,6208,'46','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1849,6209,'4','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1850,6209,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1851,6209,'1','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1852,6209,'3','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1853,6209,'2','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1854,6210,'2','BIASHARA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1855,6210,'11','CAPITAL CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1856,6210,'9','CARD CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1857,6210,'15','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1858,6210,'0','HEAD OFFICE RIVERSIDE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1859,6210,'10','HURLINGHAM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1860,6210,'5','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1861,6210,'14','KAMUKUNJI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1862,6210,'16','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1863,6210,'1','KENINDIA HSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1864,6210,'6','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1865,6210,'3','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1866,6210,'17','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1867,6210,'12','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1868,6210,'7','PARKLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1869,6210,'8','RIVERSIDE DRIVE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1870,6210,'4','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1871,6211,'1','STIMMA SACCO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1872,6212,'65','Aga Khan Walk','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1873,6212,'33','ATHI RIVER','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1874,6212,'82','BOMET BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1875,6212,'25','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1876,6212,'32','BURUBURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1877,6212,'57','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1878,6212,'44','CANNON HOUSE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1879,6212,'104','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1880,6212,'18','CHUKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1881,6212,'49','CITY HALL ANNEX KAUNDA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1882,6212,'97','CLEARING CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1883,6212,'2','CO-OP.BANK HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1884,6212,'50','COOPERATIVE BANK DIGO ROAD MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1885,6212,'75','DANDORA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1886,6212,'254','DIASPORA BANKING','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1887,6212,'87','Donholm','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1888,6212,'20','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1889,6212,'13','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1890,6212,'103','ELDORET WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1891,6212,'69','Embakasi','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1892,6212,'121','EMBAKASI JUNCTION','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1893,6212,'23','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1894,6212,'56','ENTERPRISE ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1895,6212,'1','FINANCE AND ACCOUNTS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1896,6212,'81','GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1897,6212,'137','GATUNDU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1898,6212,'78','GIKOMBA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1899,6212,'84','Gilgil','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1900,6212,'134','GITHUNGURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1901,6212,'106','GITHURAI KIMBO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1902,6212,'47','GITHURAI ROUND ABOUT THIKA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1903,6212,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1904,6212,'22','HOMA BAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1905,6212,'7','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1906,6212,'102','ISIOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1907,6212,'124','JUJA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1908,6212,'76','KAJIADO BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1909,6212,'52','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1910,6212,'74','Kangemi','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1911,6212,'72','KAPSABET BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1912,6212,'28','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1913,6212,'135','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1914,6212,'41','KARIOBANGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1915,6212,'126','KAWANGWARE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1916,6212,'42','KAWANGWARE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1917,6212,'27','KAYOLE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1918,6212,'54','Kenyatta Avenue Mombasa','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1919,6212,'24','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1920,6212,'83','KEROKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1921,6212,'12','KERUGOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1922,6212,'21','KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1923,6212,'70','Kibera','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1924,6212,'133','KIKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1925,6212,'113','KILGORIS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1926,6212,'108','KILIFI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1927,6212,'266','KILINDINI PORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1928,6212,'45','KIMATHI STREET BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1929,6212,'111','KIMILILI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1930,6212,'8','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1931,6212,'112','KISII EAST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1932,6212,'3','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1933,6212,'105','KISUMU EAST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1934,6212,'46','KITALE AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1935,6212,'64','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1936,6212,'67','KITUI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1937,6212,'122','KONGOWEA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1938,6212,'119','KUTUS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1939,6212,'123','LANGATA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1940,6212,'86','Likoni','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1941,6212,'132','LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1942,6212,'141','MAASAI MALL - ONGAT RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1943,6212,'9','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1944,6212,'43','Makutano Meru','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1945,6212,'116','MALABA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1946,6212,'61','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1947,6212,'60','MARIAKANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1948,6212,'128','MARSABIT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1949,6212,'48','MAUA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1950,6212,'110','MBALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1951,6212,'73','MBITA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1952,6212,'5','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1953,6212,'53','MIGORI ISEBANIA RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1954,6212,'107','MLOLONGO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1955,6212,'14','MOI AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1956,6212,'117','MOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1957,6212,'127','Mombasa Road','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1958,6212,'270','MONEY TRANSFERS AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1959,6212,'136','MPEKETONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1960,6212,'30','MTWAPA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1961,6212,'34','MUMIAS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1962,6212,'26','MURANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1963,6212,'118','MWEA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1964,6212,'88','MWINGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1965,6212,'40','NACICO PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1966,6212,'51','NAIROBI BUSINESS CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1967,6212,'15','NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1968,6212,'6','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1969,6212,'63','NAKURU EAST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1970,6212,'144','NANDI HILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1971,6212,'68','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1972,6212,'66','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1973,6212,'100','NDHIWA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1974,6212,'125','NGONG','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1975,6212,'55','NKUBU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1976,6212,'4','NKURUMAH ROAD MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1977,6212,'17','NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1978,6212,'139','NYALI MALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1979,6212,'80','NYAMIRA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1980,6212,'10','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1981,6212,'109','OL KALAU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1982,6212,'38','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1983,6212,'131','OTHAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1984,6212,'101','OYUGIS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1985,6212,'79','RIVER ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1986,6212,'89','RUAKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1987,6212,'138','RUIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1988,6212,'228','SHARES OPERATIONS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1989,6212,'71','SIAKAGO TOWNSHIP','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1990,6212,'58','SIAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1991,6212,'35','STIMA PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1992,6212,'77','TALA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1993,6212,'39','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1994,6212,'85','TOM MBOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1995,6212,'11','UKULIMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1996,6212,'29','UKUNDA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1997,6212,'120','UMOJA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1998,6212,'31','UNIVERSITY WAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(1999,6212,'37','UPPER HILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2000,6212,'59','VOI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2001,6212,'19','WAKULIMA MARKET BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2002,6212,'90','WEBUYE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2003,6212,'36','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2004,6212,'114','WOTE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2005,6212,'140','YALA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2006,6212,'62','ZIMMERMAN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2007,6213,'22','AWENDO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2008,6213,'56','BOMET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2009,6213,'19','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2010,6213,'5','BUSIA & NAMBALE AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2011,6213,'98','CARD CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2012,6213,'0','CENTRAL BUSINESS UNIT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2013,6213,'198','CENTRAL CLEARING CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2014,6213,'52','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2015,6213,'52','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2016,6213,'15','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2017,6213,'40','ELDORET & MOI UNIVERSITY AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2018,6213,'28','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2019,6213,'53','GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2020,6213,'58','GREENSPAN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2021,6213,'3','HARAMBEE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2022,6213,'99','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2023,6213,'4','HILL BRANCH / WILSON AIRPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2024,6213,'25','HOSPITAL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2025,6213,'39','J.K.I.A','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2026,6213,'29','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2027,6213,'21','KAPSABET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2028,6213,'8','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2029,6213,'2','KENYATTA AV.','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2030,6213,'44','KENYATTA UNIVERSITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2031,6213,'6','KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2032,6213,'43','KIANJAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2033,6213,'10','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2034,6213,'50','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2035,6213,'13','KITALE & MOI S BRIDGE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2036,6213,'49','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2037,6213,'17','KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2038,6213,'16','LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2039,6213,'48','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2040,6213,'11','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2041,6213,'37','MAUA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2042,6213,'7','MERU & KIANJAI AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2043,6213,'34','MIGORI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2044,6213,'23','MOI AVENUE MOMBASA/Portway','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2045,6213,'47','MOI INTERNATIONAL AIRPORT,MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2046,6213,'46','MOI UNIVERSITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2047,6213,'41','MOIS BRIDGE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2048,6213,'18','MOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2049,6213,'55','MSA POLYTECHNIC UNIVERSITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2050,6213,'55','MSA POLYTECHNIC UNIVERSITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2051,6213,'51','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2052,6213,'42','MUTOMO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2053,6213,'30','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2054,6213,'33','NANDI HILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2055,6213,'9','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2056,6213,'20','NKURUMAH RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2057,6213,'12','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2058,6213,'27','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2059,6213,'26','RUIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2060,6213,'59','SAMEER PARK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2061,6213,'60','SEKU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2062,6213,'45','ST.PAULS UNIVERSITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2063,6213,'54','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2064,6213,'36','TIMES TOWER','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2065,6213,'31','UKUNDA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2066,6213,'32','UPPERHILL(TSC BUILDING)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2067,6213,'93','WAJIR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2068,6213,'35','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2069,6213,'38','WILSON AIRPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2070,6214,'5','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2071,6214,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2072,6214,'6','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2073,6214,'1','KOINANGE STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2074,6214,'10','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2075,6214,'8','NAKUMATT MEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2076,6214,'3','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2077,6214,'4','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2078,6214,'9','THIKA ROAD MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2079,6214,'7','WESTLANDS BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2080,6215,'500','GIGIRI AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2081,6215,'0','HEAD OFFICE,NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2082,6215,'700','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2083,6215,'400','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2084,6216,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2085,6216,'2','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2086,6216,'1','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2087,6216,'3','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2088,6217,'0','HEAD OFFICE NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2089,6217,'4','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2090,6217,'3','MILIMANI RD NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2091,6217,'2','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2092,6217,'1','NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2093,6218,'16','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2094,6218,'15','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2095,6218,'11','Eldoret','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2096,6218,'12','Embakasi','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2097,6218,'21','GALLERIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2098,6218,'22','GREENSPAN MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2099,6218,'26','Kenyatta Avenue','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2100,6218,'13','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2101,6218,'17','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2102,6218,'6','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2103,6218,'19','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2104,6218,'25','LUNGA LUNGA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2105,6218,'18','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2106,6218,'28','MOI AVENUE MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2107,6218,'1','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2108,6218,'8','MONROVIA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2109,6218,'9','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2110,6218,'24','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2111,6218,'10','NGONG RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2112,6218,'20','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2113,6218,'14','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2114,6218,'0','REINSURANCE PLAZA NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2115,6218,'4','RIVER ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2116,6218,'7','RUARAKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2117,6218,'27','SAMEER BUSINESS PARK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2118,6218,'5','THIKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2119,6218,'3','UHURU HIGHWAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2120,6218,'23','UPPER HILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2121,6218,'2','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2122,6219,'1','EAST LEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2123,6219,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2124,6219,'2','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2125,6219,'3','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2126,6219,'4','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2127,6219,'20','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2128,6220,'15','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2129,6220,'2','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2130,6220,'0','HARAMBEE AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2131,6220,'11','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2132,6220,'10','ISIOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2133,6220,'17','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2134,6220,'4','KOINANGE STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2135,6220,'8','Laare','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2136,6220,'9','MAUA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2137,6220,'6','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2138,6220,'3','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2139,6220,'1','MURANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2140,6220,'16','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2141,6220,'7','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2142,6220,'14','River Road','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2143,6220,'18','TAJ MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2144,6220,'5','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2145,6220,'13','UMOJA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2146,6221,'9','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2147,6221,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2148,6221,'6','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2149,6221,'4','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2150,6221,'2','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2151,6221,'1','KOINANGE STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2152,6221,'11','MOMBASA - NYALI CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2153,6221,'3','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2154,6221,'8','NAKURU KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2155,6221,'10','RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2156,6221,'5','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2157,6222,'3','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2158,6222,'12','EPZ Athi River','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2159,6222,'1','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2160,6222,'6','Jomo Kenyatta International Airport','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2161,6222,'8','Kabarak University','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2162,6222,'14','Kabarnet','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2163,6222,'10','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2164,6222,'7','KIRINYAGA ROAD NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2165,6222,'15','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2166,6222,'5','Moi International Airport','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2167,6222,'2','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2168,6222,'4','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2169,6222,'13','NANDI HILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2170,6222,'11','NANDI HILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2171,6222,'16','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2172,6222,'9','OLENGURUONE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2173,6223,'13','Bondeni Chase Iman','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2174,6223,'23','BURU BURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2175,6223,'29','CHASE ELITE ABC PLACE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2176,6223,'28','Chase Xpress - Ngong Road','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2177,6223,'1','CITY CENTRE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2178,6223,'17','DIAMOND PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2179,6223,'12','Donholm','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2180,6223,'6','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2181,6223,'16','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2182,6223,'20','EMBAKASI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2183,6223,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2184,6223,'5','HURLINGHAM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2185,6223,'25','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2186,6223,'15','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2187,6223,'19','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2188,6223,'4','MOMBASA MOI AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2189,6223,'31','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2190,6223,'11','Nakuru','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2191,6223,'14','Ngara Mini','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2192,6223,'22','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2193,6223,'32','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2194,6223,'7','Parklands','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2195,6223,'27','RAFIKI DTM CLEARING CENTER','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2196,6223,'8','RIVERSIDE MEWS BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2197,6223,'30','SAMEER BUSINESS PARK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2198,6223,'24','STRATHMORE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2199,6223,'10','THIKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2200,6223,'21','UPPERHILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2201,6223,'3','VILLAGE MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2202,6223,'26','VIRTUAL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2203,6223,'33','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2204,6223,'18','WINDSOR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2205,6224,'19','BuruBuru','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2206,6224,'999','CENTRAL PROCESSING HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2207,6224,'0','CFC STANBIC HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2208,6224,'7','Chiromo Road Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2209,6224,'3','Digo Road Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2210,6224,'22','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2211,6224,'20','Gikomba','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2212,6224,'6','Harambee Avenue Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2213,6224,'5','Industrial Area Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2214,6224,'8','International House','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2215,6224,'23','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2216,6224,'2','Kenyatta Avenue','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2217,6224,'24','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2218,6224,'13','Kisumu Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2219,6224,'18','Meru','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2220,6224,'11','Naivasha Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2221,6224,'14','Nakuru','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2222,6224,'17','NANYUKI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2223,6224,'26','PRIVATE CLIENTS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2224,6224,'21','Ruaraka','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2225,6224,'15','THIKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2226,6224,'10','Upperhill Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2227,6224,'4','Waiyaki Way Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2228,6224,'25','WARWICK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2229,6224,'12','Westgate Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2230,6225,'5','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2231,6225,'0','HEAD OFFICE/KOINANGE STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2232,6225,'2','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2233,6225,'4','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2234,6225,'9','LAMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2235,6225,'7','LIBRA HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2236,6225,'6','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2237,6225,'8','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2238,6225,'3','NKRUMAH ROAD BRANCH/ MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2239,6225,'1','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2240,6226,'19','BAMBURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2241,6226,'14','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2242,6226,'8','DIANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2243,6226,'10','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2244,6226,'21','GREENSPAN MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2245,6226,'17','HAILE SELASSIE RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2246,6226,'26','HIGHRIDGE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2247,6226,'6','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2248,6226,'1','IPS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2249,6226,'20','JUNCTION MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2250,6226,'11','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2251,6226,'23','KENYATTA STREET ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2252,6226,'9','KILIFI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2253,6226,'16','LIKONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2254,6226,'5','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2255,6226,'2','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2256,6226,'4','PARKLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2257,6226,'15','RIVERSIDE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2258,6226,'12','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2259,6226,'3','UPPER HILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2260,6226,'18','VILLAGE MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2261,6226,'7','WATAMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2262,6226,'24','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2263,6226,'22','Westside Mall','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2264,6227,'122','ABC','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2265,6227,'124','CHANGAMWE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2266,6227,'101','CITY CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2267,6227,'116','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2268,6227,'115','GALLERIA (BOMAS)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2269,6227,'110','HARAMBEE AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2270,6227,'103','HARBOUR HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2271,6227,'104','HEAD OFFICE - FARGO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2272,6227,'0','HEAD OFFICE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2273,6227,'119','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2274,6227,'125','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2275,6227,'112','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2276,6227,'114','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2277,6227,'107','NAKURU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2278,6227,'102','NIC HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2279,6227,'109','NKRUMAH ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2280,6227,'108','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2281,6227,'111','PRESTIGE - NGONG ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2282,6227,'118','SAMEER PARK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2283,6227,'121','TAJ MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2284,6227,'106','THE JUNCTION BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2285,6227,'105','THE MALL WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2286,6227,'113','THIKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2287,6227,'123','Thika Road Mall','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2288,6227,'117','VILLAGE MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2289,6228,'0','BANDA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2290,6228,'2','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2291,6228,'3','KIMATHI STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2292,6228,'4','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2293,6228,'1','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2294,6228,'7','RIDGE COURT PARKLANDS 3RD AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2295,6228,'5','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2296,6229,'18','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2297,6229,'5','CHAMBERS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2298,6229,'7','ELDORET OGINGA ODINGA ST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2299,6229,'0','FEDHA BRANCH,HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2300,6229,'21','GIKOMBA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2301,6229,'100','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2302,6229,'11','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2303,6229,'16','JOMO KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2304,6229,'12','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2305,6229,'24','KAREN BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2306,6229,'9','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2307,6229,'8','KISUMU OGINGA ODINGA RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2308,6229,'10','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2309,6229,'19','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2310,6229,'20','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2311,6229,'1','MOI AVE NBI.','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2312,6229,'2','MOMBASA AKIBA HSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2313,6229,'15','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2314,6229,'25','NYALI MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2315,6229,'17','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2316,6229,'3','PLAZA 2000','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2317,6229,'6','THIKA STADIUM ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2318,6229,'14','UNITED MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2319,6229,'22','UPPERHILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2320,6229,'23','VALLEY ARCADE-GITANGA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2321,6229,'13','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2322,6229,'4','WESTMINISTER','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2323,6230,'5','Chester','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2324,6230,'9','Eldoret','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2325,6230,'0','HEAD OFFICE NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2326,6230,'13','Industrial Area','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2327,6230,'8','Kakamega','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2328,6230,'12','Kisumu','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2329,6230,'2','Mombasa','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2330,6230,'4','Mombasa Road','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2331,6230,'15','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2332,6230,'11','Nyali','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2333,6230,'1','Nyerere','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2334,6230,'10','SENATOR CARDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2335,6230,'7','Waiyaki Way','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2336,6230,'3','Westlands - The Mall','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2337,6231,'6','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2338,6231,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2339,6231,'3','KOINANGE STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2340,6231,'4','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2341,6231,'2','PARKLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2342,6231,'1','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2343,6232,'307','BANANA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2344,6232,'114','FUNZI ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2345,6232,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2346,6232,'107','KARIOBANGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2347,6232,'105','KAWANGWARE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2348,6232,'101','KAYOLE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2349,6232,'106','KIBERA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2350,6232,'306','KIKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2351,6232,'100','KIONGOZI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2352,6232,'116','KIRINYAGA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2353,6232,'213','KIRITIRI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2354,6232,'402','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2355,6232,'1','KOINANGE STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2356,6232,'102','MATHARE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2357,6232,'603','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2358,6232,'210','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2359,6232,'303','MURANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2360,6232,'507','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2361,6232,'502','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2362,6232,'301','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2363,6233,'7','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2364,6233,'11','GIKOMBA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2365,6233,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2366,6233,'2','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2367,6233,'1','KIMATHI STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2368,6233,'4','LAVINGTON ABC PLACE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2369,6233,'13','MERU TOWN CTR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2370,6233,'6','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2371,6233,'9','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2372,6233,'12','NGONG ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2373,6233,'5','NKURUMAH ROAD,MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2374,6233,'14','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2375,6233,'10','THIKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2376,6233,'3','WESTLANDS UKAY CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2377,6234,'2','RIVERSIDE DRIVE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2378,6234,'1','VICTORIA TOWERS,UPPERHILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2379,6235,'4','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2380,6235,'6','GUIDERS CENTRE MOI AVE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2381,6235,'5','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2382,6235,'3','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2383,6235,'7','Mombasa Road','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2384,6235,'1','NAIROBI HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2385,6235,'9','NGONG ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2386,6235,'8','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2387,6235,'2','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2388,6236,'1','2ND NGONG AVE. NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2389,6236,'4','BIASHARA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2390,6236,'98','CARD CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2391,6236,'21','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2392,6236,'17','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2393,6236,'3','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2394,6236,'6','INDUSTRIAL AREA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2395,6236,'8','KAREN CONNECTION KAREN ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2396,6236,'0','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2397,6236,'20','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2398,6236,'7','KISUMU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2399,6236,'15','LANGATA LINK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2400,6236,'16','LAVINGTON','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2401,6236,'22','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2402,6236,'5','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2403,6236,'18','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2404,6236,'14','NYALI CINEMAX','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2405,6236,'23','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2406,6236,'12','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2407,6236,'9','PANARI CENTRE MSA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2408,6236,'10','PARKLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2409,6236,'19','RIVERSIDE DRIVE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2410,6236,'2','SARIT CENTRE WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2411,6236,'13','SOUTH C SHOPPING CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2412,6236,'11','WILSON AIRPORT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2413,6237,'0','HEAD OFFICE NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2414,6237,'1','LOITA STREET NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2415,6238,'7','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2416,6238,'1','CITY CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2417,6238,'4','DIANI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2418,6238,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2419,6238,'3','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2420,6238,'8','KILIMANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2421,6238,'5','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2422,6238,'6','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2423,6238,'9','NEW MUTHAIGA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2424,6238,'10','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2425,6238,'2','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2426,6239,'230','BURUBURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2427,6239,'410','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2428,6239,'220','GILL HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2429,6239,'100','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2430,6239,'210','KENYATTA MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2431,6239,'600','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2432,6239,'520','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2433,6239,'300','MOMBASA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2434,6239,'400','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2435,6239,'310','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2436,6239,'510','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2437,6239,'200','REHANI HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2438,6239,'500','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2439,6240,'21','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2440,6240,'24','BURUBURU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2441,6240,'48','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2442,6240,'16','CHANGAMWE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2443,6240,'41','COURTYARD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2444,6240,'36','CROSS ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2445,6240,'35','DIAMOND PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2446,6240,'20','DIANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2447,6240,'15','EASTLEIGH BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2448,6240,'14','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2449,6240,'9','INDUSTRIAL AREA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2450,6240,'37','JKIA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2451,6240,'26','JOMO KENYATTA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2452,6240,'27','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2453,6240,'31','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2454,6240,'28','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2455,6240,'44','KILIFI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2456,6240,'10','KISII BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2457,6240,'3','KISUMU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2458,6240,'22','KITALE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2459,6240,'25','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2460,6240,'43','LAMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2461,6240,'40','MADINA MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2462,6240,'11','MALINDI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2463,6240,'45','MARIAKANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2464,6240,'34','Meru','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2465,6240,'39','MIGORI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2466,6240,'2','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2467,6240,'8','MOMBASA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2468,6240,'42','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2469,6240,'0','NAIROBI HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2470,6240,'18','NAKURU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2471,6240,'1','NATION CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2472,6240,'38','NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2473,6240,'13','OTC BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2474,6240,'5','PARKLANDS BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2475,6240,'23','PRESTIGE PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2476,6240,'33','SHIMANZI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2477,6240,'12','THIKA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2478,6240,'46','THIKA ROAD MALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2479,6240,'17','T-MALL BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2480,6240,'50','TOM MBOYA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2481,6240,'29','UPPER HILL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2482,6240,'19','VILLAGE MARKET BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2483,6240,'32','Voi','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2484,6240,'30','WABERA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2485,6240,'6','WESTGATE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2486,6241,'1','NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2487,6242,'28','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2488,6242,'32','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2489,6242,'16','CHUKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2490,6242,'8','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2491,6242,'21','EMALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2492,6242,'7','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2493,6242,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2494,6242,'24','ISIOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2495,6242,'29','KAJIADO AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2496,6242,'20','KANGEMI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2497,6242,'35','KENGELENI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2498,6242,'3','KENYATTA AVENUE NBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2499,6242,'14','KENYATTA MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2500,6242,'10','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2501,6242,'13','KERUGOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2502,6242,'27','KIBWEZI AGENCY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2503,6242,'36','KILIMANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2504,6242,'15','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2505,6242,'9','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2506,6242,'26','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2507,6242,'17','KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2508,6242,'18','MACHAKOS BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2509,6242,'1','MAIN OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2510,6242,'25','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2511,6242,'11','MLOLONGO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2512,6242,'33','MOI AVENUE NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2513,6242,'2','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2514,6242,'31','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2515,6242,'34','MWEA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2516,6242,'22','NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2517,6242,'4','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2518,6242,'19','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2519,6242,'30','NKUBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2520,6242,'23','NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2521,6242,'5','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2522,6242,'12','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2523,6242,'6','VISION PLAZA BURUBURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2524,6243,'143','AWENDO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2525,6243,'122','BOMET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2526,6243,'75','BONDO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2527,6243,'48','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2528,6243,'95','BURUBURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2529,6243,'78','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2530,6243,'120','CHANGAMWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2531,6243,'21','CHUKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2532,6243,'130','CITY HALL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2533,6243,'17','COMMUNITY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2534,6243,'18','COMMUNITY CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2535,6243,'136','DADAAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2536,6243,'82','DONHOLM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2537,6243,'84','EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2538,6243,'131','ELDAMA RAVINE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2539,6243,'30','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2540,6243,'109','ELDORET MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2541,6243,'132','EMBAKASI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2542,6243,'19','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2543,6243,'80','ENTERPRISE ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2544,6243,'149','EPZ Athi River','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2545,6243,'1','EQUITY BANK CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2546,6243,'81','EQUITY CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2547,6243,'54','EQUITY CENTRE DIASPORA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2548,6243,'154','EWASO NYIRO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2549,6243,'2','FOURWAYS TOWERS GROUND FLOOR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2550,6243,'58','GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2551,6243,'66','GATUNDU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2552,6243,'43','GIKOMBA BUSINESS ARCADE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2553,6243,'77','GILGIL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2554,6243,'93','GITHUNGURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2555,6243,'71','GITHURAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2556,6243,'24','HARAMBEE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2557,6243,'0','HEAD OFFICE NHIF BUILDING','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2558,6243,'121','HOLA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2559,6243,'98','HOMABAY BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2560,6243,'56','INDUSTRIAL AREA KENPIPE PLAZA - MOGADISHU RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2561,6243,'41','ISIOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2562,6243,'153','ITEN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2563,6243,'148','JKIA Cargo Centre','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2564,6243,'152','JUJA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2565,6243,'139','KABARNET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2566,6243,'42','KAGIO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2567,6243,'86','KAJIADO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2568,6243,'50','KAKAMEGA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2569,6243,'7','KANGARI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2570,6243,'3','KANGEMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2571,6243,'137','KANGEMI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2572,6243,'107','KAPENGURIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2573,6243,'49','KAPSABET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2574,6243,'157','KAPSOWAR SUB -BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2575,6243,'4','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2576,6243,'125','KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2577,6243,'32','KARIOBANGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2578,6243,'118','KASARANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2579,6243,'63','KAWANGWARE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2580,6243,'65','KAYOLE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2581,6243,'114','Kengeleni, Mombasa','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2582,6243,'89','KENOL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2583,6243,'129','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2584,6243,'160','KENYATTA AVENUE SUPREME','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2585,6243,'28','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2586,6243,'124','KEROKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2587,6243,'10','KERUGOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2588,6243,'64','KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2589,6243,'117','Kibera','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2590,6243,'57','KIKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2591,6243,'123','KILGORIS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2592,6243,'106','KILIFI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2593,6243,'145','KILIMANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2594,6243,'147','Kilimani Supreme','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2595,6243,'26','KIMATHI STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2596,6243,'115','Kimathi Way, Nyeri','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2597,6243,'111','KIMENDE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2598,6243,'5','KIRIA-INI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2599,6243,'51','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2600,6243,'29','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2601,6243,'126','KISUMU ANGAWA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2602,6243,'33','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2603,6243,'70','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2604,6243,'72','KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2605,6243,'35','KNUT HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2606,6243,'133','KPCU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2607,6243,'113','KU Sub Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2608,6243,'158','KWALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2609,6243,'159','LAMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2610,6243,'141','LAVINGTON CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2611,6243,'69','LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2612,6243,'53','LITEIN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2613,6243,'99','LODWAR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2614,6243,'74','LOITOKTOK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2615,6243,'112','LUANDA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2616,6243,'60','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2617,6243,'105','MALABA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2618,6243,'45','MALINDI LAMU ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2619,6243,'15','MAMA NGINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2620,6243,'100','MANDERA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2621,6243,'110','MARALAL','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2622,6243,'101','MARSABIT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2623,6243,'39','MATUU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2624,6243,'40','MAUA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2625,6243,'151','MAYFAIR SUPREME CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2626,6243,'96','Mbale Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2627,6243,'76','MBITA POINT','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2628,6243,'14','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2629,6243,'104','MERU MAKUTANO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2630,6243,'116','Migori','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2631,6243,'47','MOI AVENUE SHARKADASS HSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2632,6243,'23','MOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2633,6243,'46','MOMBASA DIGO ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2634,6243,'108','MOMBASA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2635,6243,'156','MOMBASA SUPREME CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2636,6243,'25','MOMBASA UTC BUILDING','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2637,6243,'102','MOYALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2638,6243,'127','MPEKETONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2639,6243,'119','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2640,6243,'83','MUKURWE-INI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2641,6243,'68','MUMIAS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2642,6243,'22','MURANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2643,6243,'6','MURARANDIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2644,6243,'38','MWEA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2645,6243,'59','MWINGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2646,6243,'128','NAIROBI WEST','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2647,6243,'20','NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2648,6243,'13','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2649,6243,'146','NAKURU CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2650,6243,'31','NAKURU KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2651,6243,'85','NAMANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2652,6243,'92','NANDI HILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2653,6243,'27','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2654,6243,'36','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2655,6243,'91','Ngara Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2656,6243,'73','NGONG','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2657,6243,'37','NKUBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2658,6243,'16','NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2659,6243,'138','NYALI CENTRE CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2660,6243,'52','NYAMIRA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2661,6243,'11','NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2662,6243,'62','OL KALAO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2663,6243,'61','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2664,6243,'88','OTC','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2665,6243,'8','OTHAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2666,6243,'150','Oyugis','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2667,6243,'134','RIDGEWAYS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2668,6243,'144','RUAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2669,6243,'87','RUIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2670,6243,'135','RUNYENJES SUB BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2671,6243,'97','Siaya Branch','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2672,6243,'142','Taita Taveta','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2673,6243,'90','TALA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2674,6243,'94','TEA ROOM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2675,6243,'9','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2676,6243,'34','THIKA KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2677,6243,'155','THIKA SUPREME CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2678,6243,'12','TOM MBOYA CLARIL CHAMBERS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2679,6243,'44','UKUNDA BEACH RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2680,6243,'79','VOI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2681,6243,'103','WAJIR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2682,6243,'55','WESTLANDS BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2683,6243,'140','WESTLANDS CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2684,6243,'67','WOTE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2685,6244,'51','BANANA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2686,6244,'77','BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2687,6244,'79','BUSIA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2688,6244,'14','CARGEN HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2689,6244,'21','DAGORETTI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2690,6244,'92','DIGO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2691,6244,'33','DONHOLM','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2692,6244,'85','ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2693,6244,'82','Eldoret West','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2694,6244,'75','EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2695,6244,'35','FOURWAYS TOWERS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2696,6244,'68','FOURWAYS TOWERS CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2697,6244,'4','GATUNDU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2698,6244,'42','GIKOMBA AREA 42','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2699,6244,'2','GITHUNGURI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2700,6244,'45','GITHURAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2701,6244,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2702,6244,'31','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2703,6244,'49','KAGWE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2704,6244,'78','KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2705,6244,'7','KANGARI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2706,6244,'9','KANGEMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2707,6244,'97','KAPSABET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2708,6244,'56','KARATINA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2709,6244,'41','KARIOBANGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2710,6244,'61','KAYOLE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2711,6244,'12','KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2712,6244,'22','KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2713,6244,'57','KERUGOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2714,6244,'1','KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2715,6244,'102','KIKUYU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2716,6244,'8','KIRIA INI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2717,6244,'27','KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2718,6244,'28','KISUMU AL-IMRAN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2719,6244,'25','KISUMU RELIANCE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2720,6244,'93','KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2721,6244,'71','KITENGELA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2722,6244,'72','KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2723,6244,'38','KTDA PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2724,6244,'65','KTDA PLAZA CORPORATE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2725,6244,'47','LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2726,6244,'73','MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2727,6244,'63','MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2728,6244,'83','MOLO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2729,6244,'96','MOMBASA JOMO KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2730,6244,'95','MOMBASA NKRUMAH ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2731,6244,'94','MTWAPA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2732,6244,'81','MUMIAS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2733,6244,'6','MURANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2734,6244,'53','NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2735,6244,'18','NAKURU FINANCE HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2736,6244,'19','NAKURU NJORO HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2737,6244,'64','NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2738,6244,'29','NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2739,6244,'69','NGARA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2740,6244,'62','NKUBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2741,6244,'23','NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2742,6244,'26','NYAMIRA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2743,6244,'55','Nyeri','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2744,6244,'37','OLKALOU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2745,6244,'66','ONGATA RONGAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2746,6244,'11','OTHAYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2747,6244,'59','RIVER ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2748,6244,'24','RUIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2749,6244,'43','SOKONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2750,6244,'3','SONALUX','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2751,6244,'5','THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2752,6244,'58','TOM MBOYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2753,6244,'48','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2754,6244,'46','YAYA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2755,6245,'16','BOMBULULU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2756,6245,'10','BONDENI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2757,6245,'1','CENTRAL CLEARING CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2758,6245,'11','EASTLEIGH 7TH STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2759,6245,'12','EASTLEIGH ATHUMANI KIPANGA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2760,6245,'3','EASTLEIGH BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2761,6245,'6','GARISSA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2762,6245,'0','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2763,6245,'14','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2764,6245,'15','JOMO KENYATTA AVENUE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2765,6245,'4','KENYATTA AVENUE BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2766,6245,'7','LAMU BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2767,6245,'8','MALINDI BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2768,6245,'5','MOMBASA BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2769,6245,'9','Muthaiga','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2770,6245,'2','UPPERHILL BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2771,6245,'13','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2772,6246,'2','EASTLEIGH 1','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2773,6246,'5','EASTLEIGH 2 - GENERAL WARUING','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2774,6246,'4','GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2775,6246,'13','HABASWENI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2776,6246,'999','HEAD OFFICE/CLEARING CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2777,6246,'11','INDUSTRIAL AREA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2778,6246,'8','KIMATHI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2779,6246,'7','KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2780,6246,'6','MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2781,6246,'12','MASALANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2782,6246,'3','MOMBASA 1','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2783,6246,'17','Mombasa 2 Ayub Khan Avenue Kizingo','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2784,6246,'15','Moyale','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2785,6246,'16','NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2786,6246,'10','SOUTH C BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2787,6246,'1','WABERA STREET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2788,6246,'14','WAJIR','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2789,6246,'9','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2790,6247,'2','ENTERPRISE ROAD BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2791,6247,'99','HEAD OFFICE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2792,6247,'3','UPPER HILL BRANCH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2793,6247,'1','WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2794,6248,'705','AFYA CENTRE (KACP)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2795,6248,'11','BONDENI (KBOD)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2796,6248,'23','BUNGOMA (KBUN)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2797,6248,'605','CANON HOUSE (KCNN)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2798,6248,'1','CENTRAL HEAD OFFICE (KAAC)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2799,6248,'560','CHAANI (KCAN)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2800,6248,'44','DOCKS MOMBASA (KDOC)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2801,6248,'51','ELDORET (KELO)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2802,6248,'56','EMBU (KEMU)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2803,6248,'58','ENTERPRISE ROAD (KENT)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2804,6248,'735','EXPORT PROCESSING (KEPZ)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2805,6248,'66','GARISSA (KGAR)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2806,6248,'707','GITHURAI (KGTR)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2807,6248,'85','HOMA-BAY (KHOM)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2808,6248,'597','JUJA ROAD (KJUJ)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2809,6248,'100','KABARANET (KKAB)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2810,6248,'109','KAKAMEGA (KKAK)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2811,6248,'116','KAPSABET (KKAS)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2812,6248,'121','KAREN (KKAX)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2813,6248,'724','KENYATTA MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2814,6248,'128','KERICHO (KKEC)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2815,6248,'133','KERUGOYA (KKER)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2816,6248,'141','KIAMBU (KKIA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2817,6248,'159','KISII (KKIS)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2818,6248,'161','KISUMU (KKIU)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2819,6248,'163','KITALE (KKIW)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2820,6248,'164','KITUI (KKIX)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2821,6248,'198','LIKONI (KLIK)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2822,6248,'199','LIMURU (KLIM)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2823,6248,'213','MACHAKOS (KMA4)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2824,6248,'226','MALINDI (KMAL)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2825,6248,'237','MASENO (KMAX)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2826,6248,'249','MERU (KMER)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2827,6248,'273','MOMBASA (KMOM)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2828,6248,'284','MTOPANGA (KMTO)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2829,6248,'716','MTWAPA (KMTP)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2830,6248,'293','MURANGA (KMUR)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2831,6248,'298','MWINGI (KMWI)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2832,6248,'746','NACICO (KNCO)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2833,6248,'308','NAIVASHA (KNAI)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2834,6248,'309','NAKURU (KNAK)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2835,6248,'315','NAROK (KNAR)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2836,6248,'327','NGARA ROAD (KNGA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2837,6248,'329','NGONG HILLS (KNGH)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2838,6248,'333','NYAHURURU (KNHR)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2839,6248,'310','NYALI (KNAL)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2840,6248,'341','NYERI (KNYE)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2841,6248,'25','Post Bank Busia','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2842,6248,'372','RONALD NGALA (KROD)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2843,6248,'378','RUIRU (KRUI)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2844,6248,'449','SUNA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2845,6248,'416','THIKA (KTHI)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2846,6248,'422','TOM MBOYA STREET (KTOM)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2847,6248,'428','UKUNDA (KUKU)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2848,6248,'592','UTHIRU (KUTH)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2849,6248,'436','VIWANDANI (KVIW)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2850,6248,'437','VOI (KVOI)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2851,6248,'448','WESTLANDS (KWEST)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2852,6249,'1','MSHWARI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2853,6250,'150','ATM Wages payment','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2854,6250,'137','BROOKSIDE SACCO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2855,6250,'37','ESTATE B.SOC.- PROTECTION HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2856,6250,'44','MURATA FARMERS CO-OP','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2857,6250,'126','Mwalimu SACCO Kisumu','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2858,6250,'50','MWALIMU SACCO NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2859,6250,'148','NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2860,6250,'139','OTC PAYMENTS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2861,6250,'36','PIONEER B.SOC.- MIDLAND HOUSE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2862,6250,'24','POST BANK - AFYA CENTRE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2863,6250,'26','POST BANK - CANNON HOUSE NAIROBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2864,6250,'57','POST BANK - ELDORET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2865,6250,'58','POST BANK - EPZ ATHI RIVER','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2866,6250,'2','POST BANK - HEAD OFFICE BANDA S','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2867,6250,'30','POST BANK - HOMA BAY','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2868,6250,'56','POST BANK - JUJA ROAD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2869,6250,'96','POST BANK - KAKAMEGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2870,6250,'27','POST BANK - KENYATTA MARKET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2871,6250,'28','POST BANK - KERICHO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2872,6250,'22','POST BANK - KISUMU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2873,6250,'43','POST BANK - MASENO','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2874,6250,'29','POST BANK - NAKURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2875,6250,'98','POST BANK - NANYUKI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2876,6250,'23','POST BANK - NYERI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2877,6250,'31','POST BANK - RONALD NGALA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2878,6250,'55','POST BANK - RUIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2879,6250,'21','POST BANK - THIKA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2880,6250,'32','POST BANK - TOM MBOYA ST.','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2881,6250,'90','POST BANK - VOI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2882,6250,'69','POSTBABK- LIMURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2883,6250,'62','POSTBANK - EASTLEIGH','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2884,6250,'48','POSTBANK - GITHURAI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2885,6250,'61','POSTBANK - NGARA RD. NBI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2886,6250,'25','POSTBANK - POSTBANK HSE MSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2887,6250,'60','POSTBANK- ENTERPRISE RD.','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2888,6250,'59','POSTBANK -JOGOO RD','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2889,6250,'68','POSTBANK- KIAMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2890,6250,'67','POSTBANK- KISII','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2891,6250,'71','POSTBANK- MACHAKOS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2892,6250,'134','POSTBANK MUMIAS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2893,6250,'75','POSTBANK- MURANG A','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2894,6250,'54','POSTBANK NACICO PLAZA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2895,6250,'78','POSTBANK- NAROK','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2896,6250,'65','POSTBANK- VIWANDANI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2897,6250,'45','POSTBANK WESTLANDS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2898,6250,'82','POSTBANK-BONDENI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2899,6250,'95','POSTBANK-BUNGOMA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2900,6250,'89','POSTBANK-DOCKS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2901,6250,'74','POSTBANK-EMBU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2902,6250,'94','POSTBANK-GARISSA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2903,6250,'83','POSTBANK-KABARNET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2904,6250,'81','POSTBANK-KAPSABET','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2905,6250,'64','POSTBANK-KAREN','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2906,6250,'76','POSTBANK-KERUGUYA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2907,6250,'80','POSTBANK-KITALE','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2908,6250,'72','POSTBANK-KITUI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2909,6250,'88','POSTBANK-LIKONI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2910,6250,'97','POSTBANK-MAKADARA(THIKA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2911,6250,'87','POSTBANK-MALINDI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2912,6250,'77','POSTBANK-MERU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2913,6250,'91','POSTBANK-MTOPANGA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2914,6250,'86','POSTBANK-MTWAPA(MSA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2915,6250,'73','POSTBANK-MWINGI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2916,6250,'79','POSTBANK-NAIVASHA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2917,6250,'66','POSTBANK-NGONGHILLS','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2918,6250,'70','POSTBANK-NYAHURURU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2919,6250,'92','POSTBANK-NYALI','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2920,6250,'84','POSTBANK-SAVANI HOUSE(MSA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2921,6250,'93','POSTBANK-UKUNDA','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2922,6250,'63','POSTBANK-UTHIRU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2923,6250,'85','POSTTBANK-CHAANI(MSA)','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2924,6250,'38','PRUDENTIAL B.SOC.-PROTECTION HOU','2014-01-01',7,'2016-02-06 05:16:02','0000-00-00 00:00:00',7,1,NULL,NULL),(2925,6254,'2365','TOWER SACCO OL KALOU','2015-08-04',29,'2016-02-06 05:16:02','2015-08-05 05:38:41',29,1,NULL,NULL);
/*!40000 ALTER TABLE `bankcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankcode` varchar(50) NOT NULL,
  `bankName` varchar(200) DEFAULT NULL,
  `createDate` date NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `bankName` (`bankName`) USING BTREE,
  KEY `bankcreatedBy` (`createdBy`) USING BTREE,
  KEY `bankApprovedBy` (`approvedBy`) USING BTREE,
  KEY `bankscostcenter` (`costcenter`),
  KEY `bankcompany` (`company`),
  CONSTRAINT `bankcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banks_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bankscostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (6202,'1','KENYA COMMERCIAL BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6203,'2','STANDARD CHARTERED BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6204,'3','BARCLAYS BANK OF KENYA LTD.','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6205,'5','BANK OF INDIA','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6206,'6','BANK OF BARODA','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6207,'7','COMMERCIAL BANK OF AFRICA','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6208,'8','HABIB BANK LTD.','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6209,'9','CENTRAL BANK OF KENYA','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6210,'10','PRIME BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6211,'100','KENGEN','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6212,'11','THE COOPERATIVE BANK OF KENYA','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6213,'12','NATIONAL BANK OF KENYA LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6214,'14','ORIENTAL COMMERCIAL BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6215,'16','CITIBANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6216,'17','HABIB BANK A.G.ZURICH','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6217,'18','MIDDLE EAST BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6218,'19','BANK OF AFRICA KENYA LIMITED','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6219,'20','DUBAI BANK OF KENYA LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6220,'23','CONSOLIDATED BANK OF KENYA LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6221,'25','CREDIT BANK / TRUST / CITY FINANCE','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6222,'26','TRANSNATIONAL BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6223,'30','CHASE BANK (K) LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6224,'31','CFC-STANBIC BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6225,'35','AFRICAN BANKING CORPORATION LTD.','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6226,'39','IMPERIAL BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6227,'41','NATIONAL INDUSTRIAL CREDIT BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6228,'42','GIRO BANK LTD / COMMERCE BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6229,'43','ECOBANK KENYA LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6230,'49','EQUATORIAL COMMERCIAL BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6231,'50','PARAMOUNT UNIVERSAL BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6232,'51','JAMII BORA BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6233,'53','GUARANTY TRUST BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6234,'54','VICTORIA COMMERCIAL BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6235,'55','GUARDIAN BANK / GUILDERS','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6236,'57','INVESTMENT & MORGAGES BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6237,'59','DEVELOPMENT BANK OF KENYA','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6238,'60','FIDELITY COMMERCIAL BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6239,'61','HOUSING FINANCE','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6240,'63','DIAMOND TRUST BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6241,'65','INDUSTRIAL DEVELOPMENT BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6242,'66','K-REP BANK LIMITED','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6243,'68','EQUITY BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6244,'70','FAMILY BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6245,'72','GULF AFRICAN BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6246,'74','FIRST COMMUNITY BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6247,'76','UBA KENYA BANK LTD','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6248,'88','POST BANK','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6249,'97','KENYA MSHWARI TRANSFER','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6250,'98','NON-BANK FINANCIAL INSTITUTION','2014-01-01',7,'2014-04-25 00:00:00','0000-00-00 00:00:00',7,1,NULL,NULL),(6251,'99','COSMOPOLITAN-FOSA-NAKURU','2014-01-01',7,'2014-01-01 00:00:00',NULL,7,1,NULL,NULL),(6252,'100','FAULU KENYA','2014-01-01',7,'2014-01-01 00:00:00',NULL,7,1,NULL,NULL),(6253,'101','SMEP DTM LTD','2014-01-01',7,'2014-01-01 00:00:00',NULL,7,1,NULL,NULL),(6254,'102','TOWER SACCO SOCIETY LTD','2014-01-01',7,'2014-01-01 00:00:00',NULL,7,1,NULL,NULL),(6255,'103','UNAITAS','2014-01-01',7,'2014-01-01 00:00:00',NULL,7,1,NULL,NULL);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashbook`
--

DROP TABLE IF EXISTS `cashbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CashBookRef` varchar(45) DEFAULT NULL,
  `ChqNumber` varchar(45) DEFAULT NULL,
  `Memo` varchar(45) DEFAULT NULL,
  `ModeOfPaymt` varchar(45) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `Description` text,
  `AccCode` int(11) NOT NULL,
  `CurrId` int(11) NOT NULL,
  `CurrRate` double(9,3) NOT NULL,
  `DebitAmt` double(12,3) NOT NULL,
  `CreditAmt` double(12,3) NOT NULL,
  `Drawer` varchar(45) DEFAULT NULL,
  `BankId` int(11) DEFAULT NULL,
  `ChqStatus` varchar(45) DEFAULT NULL,
  `ReconId` int(11) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `CostArea` int(11) DEFAULT NULL,
  `ChqClearDate` datetime DEFAULT NULL,
  `ChqMatureDate` datetime DEFAULT NULL,
  `Journal` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Supplier` int(11) DEFAULT NULL,
  `Subtotal` double(12,3) NOT NULL,
  `vatAmt` double(12,3) NOT NULL,
  `remarks` text,
  `Receipt_reg` int(11) DEFAULT NULL,
  `Contra` int(11) DEFAULT NULL,
  `Deposit` int(11) DEFAULT NULL,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `Reconciled` tinyint(1) NOT NULL,
  `UnclearedEffectDesc` varchar(45) DEFAULT NULL,
  `UnclearedEffect` int(11) DEFAULT NULL,
  `UnclearedAmt` double(12,2) NOT NULL DEFAULT '0.00',
  `Voided` tinyint(1) NOT NULL,
  `Financialperiod` int(11) NOT NULL,
  `VoidRef` int(11) DEFAULT NULL,
  `Remittance` int(11) DEFAULT NULL,
  `DocNum` varchar(45) DEFAULT NULL,
  `ReconApproved` tinyint(1) NOT NULL DEFAULT '0',
  `salesinvoice` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `CBCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `CBBankIndex_idx` (`BankId`) USING BTREE,
  KEY `CBDeptIndex_idx` (`DeptId`) USING BTREE,
  KEY `CBJournalIndex` (`Journal`) USING BTREE,
  KEY `CBCustIndex` (`Customer`) USING BTREE,
  KEY `CBSuppIndex` (`Supplier`) USING BTREE,
  KEY `CBCoaIndex` (`AccCode`) USING BTREE,
  KEY `CBRcptregIndex` (`Receipt_reg`) USING BTREE,
  KEY `CBContraIndex` (`Contra`) USING BTREE,
  KEY `CBDepositIndex` (`Deposit`) USING BTREE,
  KEY `CBUnclearedeffectIndex` (`UnclearedEffect`) USING BTREE,
  KEY `CBReconIndex` (`ReconId`) USING BTREE,
  KEY `CBFinperiodIndex` (`Financialperiod`) USING BTREE,
  KEY `CBVoidIndex` (`VoidRef`) USING BTREE,
  KEY `CBRemittIndex` (`Remittance`) USING BTREE,
  KEY `CBcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `CBapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `cashbook_sinvoiceIndex` (`salesinvoice`),
  KEY `cashbookcostcenter` (`costcenter`),
  KEY `cashbookcompany` (`company`),
  CONSTRAINT `cashbook_ibfk_1` FOREIGN KEY (`BankId`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_11` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_13` FOREIGN KEY (`Receipt_reg`) REFERENCES `chequeregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_14` FOREIGN KEY (`AccCode`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_15` FOREIGN KEY (`Contra`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_16` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_17` FOREIGN KEY (`Customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_18` FOREIGN KEY (`Deposit`) REFERENCES `deposit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_19` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_2` FOREIGN KEY (`Financialperiod`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_3` FOREIGN KEY (`Journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_4` FOREIGN KEY (`ReconId`) REFERENCES `reconciliation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_5` FOREIGN KEY (`Remittance`) REFERENCES `remmitance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_6` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_7` FOREIGN KEY (`UnclearedEffect`) REFERENCES `unclearedeffect` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_8` FOREIGN KEY (`VoidRef`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_ibfk_9` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_sinvoiceIndex` FOREIGN KEY (`salesinvoice`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbookcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbookcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbook`
--

LOCK TABLES `cashbook` WRITE;
/*!40000 ALTER TABLE `cashbook` DISABLE KEYS */;
INSERT INTO `cashbook` VALUES (1,'CBK','34656',NULL,'Cash',7,'Customer',NULL,2526,1,1.000,12000.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-02-29',7,'2016-02-29 11:32:27',7,'2016-02-29 11:32:01',1,NULL,0.000,0.000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0.00,0,2,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cashbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashbook_detail`
--

DROP TABLE IF EXISTS `cashbook_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashbook_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashbook` int(11) DEFAULT NULL,
  `Description` text,
  `Vat` int(11) DEFAULT NULL,
  `Vat_rate` double(12,2) DEFAULT NULL,
  `gl_account` int(11) DEFAULT NULL,
  `amount_one` double(12,2) DEFAULT NULL,
  `amount_two` double(12,2) DEFAULT NULL,
  `Spotrate` double(12,2) DEFAULT NULL,
  `Currency` int(11) DEFAULT NULL,
  `Currate` double(12,2) DEFAULT NULL,
  `vatinclusive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CashbookIndex` (`cashbook`) USING BTREE,
  KEY `FK_VatIndex` (`Vat`) USING BTREE,
  KEY `FK_CoaIndex` (`gl_account`) USING BTREE,
  KEY `CashbookDetailCurrIndex` (`Currency`) USING BTREE,
  CONSTRAINT `cashbook_detail_ibfk_1` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_detail_ibfk_2` FOREIGN KEY (`cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_detail_ibfk_3` FOREIGN KEY (`gl_account`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cashbook_detail_ibfk_4` FOREIGN KEY (`Vat`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbook_detail`
--

LOCK TABLES `cashbook_detail` WRITE;
/*!40000 ALTER TABLE `cashbook_detail` DISABLE KEYS */;
INSERT INTO `cashbook_detail` VALUES (1,1,NULL,NULL,NULL,NULL,12000.00,12000.00,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `cashbook_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chartaccount`
--

DROP TABLE IF EXISTS `chartaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chartaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccCode` varchar(45) NOT NULL,
  `AccName` varchar(65) DEFAULT NULL,
  `Description` varchar(155) DEFAULT NULL,
  `AccType` int(11) DEFAULT NULL,
  `ActiveStatus` tinyint(1) NOT NULL,
  `BankId` int(11) DEFAULT NULL,
  `BankAcc` varchar(45) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `Bankbranch` int(11) DEFAULT NULL,
  `Cash_type` varchar(45) DEFAULT NULL,
  `Openingbal` double(12,2) NOT NULL DEFAULT '0.00',
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `Bank` tinyint(1) NOT NULL,
  `Subtype` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AccCode_UNIQUE` (`AccCode`) USING BTREE,
  KEY `CoACurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `CoABankIndex_idx` (`BankId`) USING BTREE,
  KEY `CoAAccTypeIndex_idx` (`AccType`) USING BTREE,
  KEY `FKD8C4BC8F31B6891C` (`AccType`) USING BTREE,
  KEY `FKD8C4BC8F6923F839` (`BankId`) USING BTREE,
  KEY `FKD8C4BC8FFB7A88D3` (`CurrId`) USING BTREE,
  KEY `CoAAccsubtypeIndex` (`Subtype`) USING BTREE,
  KEY `CoaBankBranchIndex` (`Bankbranch`) USING BTREE,
  KEY `CoAcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `CoAapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `coacostcenter` (`costcenter`),
  KEY `coacompany` (`company`),
  CONSTRAINT `chartaccount_ibfk_1` FOREIGN KEY (`AccType`) REFERENCES `accounttypes` (`AccCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chartaccount_ibfk_2` FOREIGN KEY (`Subtype`) REFERENCES `accountsubtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chartaccount_ibfk_3` FOREIGN KEY (`BankId`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chartaccount_ibfk_4` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chartaccount_ibfk_5` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chartaccount_ibfk_6` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chartaccount_ibfk_7` FOREIGN KEY (`Bankbranch`) REFERENCES `bankcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coacompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coacostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2563 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartaccount`
--

LOCK TABLES `chartaccount` WRITE;
/*!40000 ALTER TABLE `chartaccount` DISABLE KEYS */;
INSERT INTO `chartaccount` VALUES (2217,'1300-10','General Trade Inventory','Inventory Account',1300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2218,'1300-20','Product asset','Product Inventory Account',1300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2219,'1300-30','Work In Process','Work In Process Account',1300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2220,'1300-40','Finished Stock','Finished Stock Account',1300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2221,'1300-50','Stock In Transit','Stock In Transit',1300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2222,'1400-10','Accounts Receivable - Trade','Accounts Receivables',1400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2223,'1400-20','Accounts Receivable -Non Trade',NULL,1400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2224,'1400-30','A/R Trade Allowance for Bad Debit',NULL,1400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2225,'1400-40','Not invoiced Receivables','We delivered but have not invoiced yet',1400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2226,'1500-10','Tax credit A/R','Tax to be re-imbursed - before tax declaration',1500,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2227,'1500-20','Tax receivables','Tax to receive based on tax declaration',1500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2228,'1500-30','Intercompany Due From','Default Receivables account for intercompany trx',1500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2229,'1500-40','A/R Miscellaneous',NULL,1500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2230,'1600-10','Government Securities',NULL,1600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2231,'1600-20','Tax-Exempt Securities',NULL,1600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2232,'1600-30','Other Investments',NULL,1600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2233,'1650-10','Loans Receivable Employees','Outstanding balance on employee loans',1650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2234,'1650-20','Loans Receivable Owners/Shareholders',NULL,1650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2235,'1650-30','Loans Receivable Others',NULL,1650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2236,'1700-10','Prepaid Insurance',NULL,1700,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2237,'1700-20','Prepaid Rent',NULL,1700,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2238,'1700-30','Prepaid Interest',NULL,1700,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2239,'1700-40','Prepaid Others',NULL,1700,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2240,'1700-50','Vendor prepayment','Prepayments for future expense',1700,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2241,'1700-60','Employee Expense Prepayment','Expense advances',1700,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2243,'1750-10','Deposit Rent',NULL,1750,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2244,'1750-20','Deposit Utilities',NULL,1750,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2245,'1750-30','Deposit Others',NULL,1750,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2246,'1800-10','Other Current Assets',NULL,1800,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2247,'2100-10','Land',NULL,2100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2248,'2100-20','Land & Building',NULL,2100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2249,'2100-30','Land Improvements',NULL,2100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2250,'2100-40','Building Improvements',NULL,2100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2251,'2100-50','Leasehold Improvements',NULL,2100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2252,'2150-10','Furniture',NULL,2150,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2253,'2150-20','Fixtures & Fittings',NULL,2150,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2254,'2150-30','AC Cooler',NULL,2150,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2255,'2200-10','Computers',NULL,2200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2256,'2200-20','Printers',NULL,2200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2257,'2200-30','Cash Registers & Computing Equipment',NULL,2200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2258,'2200-40','Other Office Equipment',NULL,2200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2259,'2300-10','Machine 1',NULL,2300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2260,'2300-20','Machine 2',NULL,2300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2261,'2300-30','Plant 1',NULL,2300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2262,'2300-40','Plant 2',NULL,2300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2263,'2400-10','Delivery Van',NULL,2400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2264,'2400-20','Bus',NULL,2400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2265,'2400-30','Lorry',NULL,2400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2266,'2400-40','Truck',NULL,2400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2267,'2400-50','Saloon Car',NULL,2400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2268,'2450-10','Project asset','Created Asset',2450,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2269,'2450-20','Project WIP','Asset Work in Progress',2450,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2270,'2500-10','Amortizable Assets',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2271,'2500-20','Goodwill',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2272,'2500-30','Patent',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2273,'2500-40','Insurance Claims',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2274,'2500-50','Other Intangible Assets',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2275,'2500-60','Accumulated Amortization',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2276,'2500-70','Cash Surrender Value of Life Insurance',NULL,2500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2277,'2510-10','Microsoft Office',NULL,2510,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2278,'2510-20','Pos Accounting System',NULL,2510,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2279,'2510-30','Antivirus Software',NULL,2510,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2280,'2600-05','Building Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2281,'2600-10','Land Improvement Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2282,'2600-15','Building Improvement Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2283,'2600-20','Leasehold Improvement Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2284,'2600-25','Furniture Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2285,'2600-30','Fixtures Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2286,'2600-35','Equipment Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2287,'2600-40','Vehicles Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2288,'2600-45','Data Processing Equipment Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2289,'2600-50','Software Accumulated Depreciation',NULL,2600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2290,'3100-05','Accounts Payables Trade',NULL,3100,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2291,'3100-10','Accounts Payable Non-Trade','Accounts Payables',3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2292,'3100-15','Unearned Receipts','Received products/services from vendors, but not invoiced',3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2293,'3100-20','Accounts Payable Services','Accounts Payables for non-product revenue',3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2294,'3100-25','Directors Current Accounts','Selected A/P invoices for payment ',3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2295,'3100-30','Customer Prepayments','Prepayments for future revenue',3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2296,'3100-35','Merchandise Credits Unredeemed',NULL,3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2297,'3100-40','Gift Certificated Unredeemed',NULL,3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2298,'3100-45','Special Order Deposits',NULL,3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2299,'3100-50','Mail Order Deposits',NULL,3100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2300,'3200-05','Vat','Vat Tax to be paid based on tax declaration',3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2301,'3200-10','Corportion Tax due','Tax to be paid - before tax declaration',3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2302,'3200-15','Installment Tax liability','Tax to be paid based on tax declaration',3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2303,'3200-20','Withholding Tax','Tax to be paid based on tax declaration',3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2304,'3200-25','Custom Duty liability','Tax to be paid based on tax declaration',3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2305,'3200-30','Paye Deductions',NULL,3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2306,'3200-35','NHIF Deductions',NULL,3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2307,'3200-40','NSSF Deductions',NULL,3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2308,'3200-45','Helb-Deductions',NULL,3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2309,'3200-50','Sacco-Deductions',NULL,3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2310,'3200-55','Other Deductions',NULL,3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2311,'3200-60','Intercompany Due To','Default Payables account for intercompany trx',3200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2312,'3400-05','Accrued-Net Pay',NULL,3400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2313,'3400-10','Accrued Wages',NULL,3400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2314,'3400-15','Accrued Dividends',NULL,3400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2315,'3400-20','Accrued Interest',NULL,3400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2316,'3400-25','Accrued Expenses Others',NULL,3400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2317,'3500-10','Dividends',NULL,3500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2318,'3600-10','Short Term Obligation',NULL,3600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2319,'3600-20','Current Portion of Long Term Debt',NULL,3600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2320,'4010-10','Long Term Obligation',NULL,4010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2321,'4010-20','Mortgage',NULL,4010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2322,'4010-30','Loan from Owner/Stockholder',NULL,4010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2323,'4010-40','Other Long Term Obligation',NULL,4010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2324,'4010-50','Current Portion of Long Term Debt',NULL,4010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2325,'5100-00','Share Capital',NULL,5100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2326,'5110-00','Share Premium','Capital in excess of Par on Common Stock',5110,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2327,'5200-00','Revaluation Reserves',NULL,5200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2328,'5210-00','Revenue Reserves',NULL,5210,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2329,'5400-00','Preference Shares',NULL,5400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2330,'5500-00','Retained Earnings P & L ','Year end processing to balance account (Income Summary)',5500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2331,'6100-10','Trade Revenue-Local','Default Product or Service revenue',6100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2332,'6100-20','Trade Revenue-Exports',NULL,6100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2333,'6100-30','Royalties Revenue',NULL,6100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2334,'6100-40','Not invoiced revenue','We delivered but have not invoiced yet',6100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2335,'6500-10','Interest Income','Bank interest revenue',6500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2336,'6500-20','Dividend Income',NULL,6500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2337,'6500-30','Rental Income',NULL,6500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2338,'6500-40','Sales Tax Commission',NULL,6500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2339,'6600-10','Returns Expense-Customers',NULL,6600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2340,'6600-20','Returns from Customers-Local',NULL,6600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2341,'6600-30','Returns from Customers-Exports',NULL,6600,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2342,'6710-10','Trade Discounts','Granted Trade discounts (corrects Product Revenue)',6710,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2343,'6710-20','Payment discount expense','Granted early payment discount to customers',6710,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2344,'6710-30','Promotion Discounts',NULL,6710,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2345,'7500-05','Product CoGs','Cost of Goods Sold',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2346,'7300-10','Cost Of Production','Cost Of Production Account',7300,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2347,'7500-10','Scrap/Waste','Scrap Account',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2348,'7200-10','Outside Processing (Subcontract)','Outside Processing Account',7200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2349,'7200-25','Product Expense','Default Service costs (I.e. not on inventory)',7200,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2350,'7500-15','Product Cost Adjustment','Product Cost Adjustments',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2351,'7500-20','Product Inventory Clearing','Default Product costs (I.e. on inventory)',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2352,'7100-10','Purchases-Local',NULL,7100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2353,'7100-20','Purchases-Imports',NULL,7100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2354,'7100-30','Freight in','Carriage inwards',7100,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2355,'7400-10','Returns Expense-Vendors',NULL,7400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2356,'7400-20','Returns to Vendors-Local',NULL,7400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2357,'7400-30','Returns to Vendors-Imports',NULL,7400,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2358,'7500-25','Inventory Shrinkage','Physical Inventory Gain/Loss',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2359,'7500-30','Inventory Write Down Below Cost',NULL,7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2360,'7500-35','Inventory Adjustment','Inventory Actual Accounting Value Adjustment',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2361,'7500-40','Inventory Revaluation','Difference to (lower cost) or market',7500,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2362,'7650-05','Invoice price variance','Difference between product cost and invoice price (IPV)',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2363,'7650-10','Purchase price variance','Difference between purchase price and standard costs (PPV)',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2364,'7650-15','Purchase price variance Offset','Offset Account for Purchase price variance (PPV) ',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2365,'7650-20','Using Variance','Account for Using Variance',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2366,'7650-25','Method Change Variance','Account for Method Change Variance',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2367,'7650-30','Rate Variance','Account for Rate Variance',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2368,'7650-35','Mix Variance','Account for Mix Variance',7650,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2369,'7660-10','Trade discounts received','Received Trade Discounts (corrects Product expense)',7660,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2370,'7660-20','Payment discount revenue','Granted early payment discount from vendors',7660,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2371,'8010-05','Wages-Casual',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2372,'8010-10','Staff Salaries',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2373,'8010-15','Contracts',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2374,'8010-20','Commission',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2375,'8010-25','Leave Pay',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2376,'8010-30','Sick Pay',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2377,'8010-35','Travel Allowance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2378,'8010-40','Retirement (Pension, Profit Sharing)',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2379,'8010-45','Employer Pension Contribution',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2380,'8010-50','NSSF-Employer Contribution',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2381,'8010-55','DIT-Employer Contribution',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2382,'8010-60','Workers Compensation Insurance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2383,'8010-65','Health Insurance Premium',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2384,'8010-70','Health Insurance Premium Owners',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2385,'8010-75','Health Insurance Employee Contribution',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2386,'8010-80','Other Benefit Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2387,'8010-85','Staff Gifts & Perks(Bonus)',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2388,'8010-90','Payroll Processing Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2389,'8010-95','Life Insurance Premium',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2390,'8020-05','Life Insurance Premium Owners',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2391,'8020-10','Life Insurance Employee Contribution',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2392,'8020-15','Recruitment Costs',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2393,'8110-05','Rent Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2394,'8110-10','Land Rent & Rates',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2395,'8110-15','Utilities-Water',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2396,'8110-20','Utilities-Security',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2397,'8110-25','Utilities-Electricity',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2398,'8110-30','Utilities-Gas',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2399,'8110-35','Utilities-Garbage Collection',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2400,'8110-40','Other Occupancy Costs',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2401,'8120-05','Media Advertising',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2402,'8120-10','Catalog, Newsletter',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2403,'8120-15','Events',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2404,'8120-20','Joint Advertising',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2405,'8120-25','Web Hosting',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2406,'8120-30','Other Advertising & Promotion',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2407,'8120-35','Vendor Advertising Allowances',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2408,'8130-05','Telephone',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2409,'8130-10','Mobile Telephone',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2410,'8130-15','Internet & Network & Charges',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2411,'8140-05','Legal & Professional Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2412,'8140-10','Audit,Accounting & Mgt Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2413,'8140-15','Audit-ISO Certification',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2414,'8140-20','Audit-Health & Safety',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2415,'8140-25','Audit-Environmental',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2416,'8140-30','Inventory Verification Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2417,'8140-35','Consulting Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2418,'8140-40','Franchise Fee / Royalty Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2419,'8150-05','Office Expenses',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2420,'8150-10','Stationary & Supplies - Office Use',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2421,'8150-15','Janitorial/Cleaning Supplies',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2422,'8160-05','Data Processing Supplies',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2423,'8160-10','Data Processing Rental',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2424,'8160-15','Computer Running Expenses',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2425,'8160-20','Data Processing Other Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2426,'8170-05','Building Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2427,'8170-10','Land Improvement Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2428,'8170-15','Building Improvement Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2429,'8170-20','Leasehold Improvement Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2430,'8170-25','Furniture Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2431,'8170-30','Fixtures Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2432,'8170-35','Equipment Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2433,'8170-40','Vehicles Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2434,'8170-45','Data Processing Equipment Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2435,'8170-50','Software Depreciation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2436,'8170-55','Amortization Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2437,'8180-05','Travel - Local',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2438,'8180-10','Travel - Oversees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2439,'8180-15','Travel - Hotel Accomodation',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2440,'8180-20','Travel - Meals & Entertainment',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2441,'8180-25','Staff Meeting Food',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2443,'8180-35','Business Travel Other Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2444,'8190-10','Business Insurance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2445,'8190-20','Real Estate Insurance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2446,'8190-30','Medical Insurance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2447,'8190-40','Vehicle Insurance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2448,'8190-50','General Insurance',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2449,'8200-10','Credit Card Service Charges',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2451,'8200-30','Other Payment Service Charges',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2452,'8210-10','Association Membership Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2453,'8210-20','Subscription Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2454,'8220-10','Postage & Courier Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2455,'8220-20','Customer Package Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2456,'8220-30','Customer Postage Fees Received',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2457,'8220-40','Delivery/Shipping Expenses','Carriage outwards',8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2458,'8230-10','Licenses','Business Licenses',8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2459,'8230-20','Software Licenses',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2460,'8230-30','Permits',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2461,'8230-40','Registration Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2462,'8230-50','Other Licenses & Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2463,'8240-10','Education Course Fees',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2464,'8240-20','Education Travel',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2465,'8240-30','Education Meals & Entertainment (50%)',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2466,'8240-40','Education Other',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2467,'8250-10','Equipment Lease/Hire',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2468,'8250-20','Store Lease/Hire',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2469,'8250-30','Machine Lease/Hire',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2470,'8260-10','Building Repairs & Maintenence',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2471,'8260-20','Furniture, Equipment Repairs & Maintenence',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2472,'8260-30','Data Processing Repairs & Maintenence',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2473,'8260-40','Software Maintenence',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2474,'8260-60','Repairs & Maintenance Other',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2475,'8270-10','Bad Debts Write-off','Receivables write-off - bad debt',8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2476,'8270-20','Collection Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2477,'8270-30','Petty Cash Over/Short','Petty Cash Differences',8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2478,'8270-90','Penalties',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2479,'8280-20','Miscellaneous Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2483,'8270-70','Vehicle Inspection & Registration',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2485,'8290-20','Mortage Interest Expense',NULL,8010,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2486,'9550-30','Uninsured Casualty Loss',NULL,9550,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2487,'9550-40','Donation /Charitable Contributions',NULL,9550,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2488,'9620-05','Bank revaluation gain','Foreign currency bank account gain',9620,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2489,'9620-10','Bank settlement gain','Difference between payment and bank account currency',9620,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2490,'9620-15','Unrealized Exchange  gain','Difference between foreign currency receivables/payables and current rate',9620,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2491,'9620-20','Realized Exchange gain','Difference between invoice and payment currency',9620,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2492,'9620-25','Capital Gains Income',NULL,9620,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2493,'9620-30','Currency balancing','Rounding difference to make journal balance in accounting currency',9620,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2494,'9630-10',' Gain On Sale of Fixed Asset',NULL,9630,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2495,'9820-05','Bank revaluation Loss','Foreign currency bank account gain',9820,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2496,'9820-10','Bank settlement Loss','Difference between payment and bank account currency',9820,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2497,'9820-15','Unrealized Exchange Loss','Difference between foreign currency receivables/payables and current rate',9820,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2498,'9820-20','Realized Exchange Loss','Difference between invoice and payment currency',9820,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2499,'9820-25','Capital Gains Loss',NULL,9820,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2500,'9820-30','Currency balancing','Rounding difference to make journal balance in accounting currency',9820,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2501,'9830-10','Loss On Sale of Fixed Asset',NULL,9830,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2502,'9850-05','Default account','Default Account (if no other account is defined) V1.1',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2503,'9850-10','Suspense balancing ','Difference to make journal balance in source currency - needs to be solved',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2504,'9850-15','Suspense error','Import did not find account - needs to be solved',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2505,'9850-20','Cash book expense','Default other expense for petty cash transactions',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2506,'9850-25','Cash book receipts','Default other revenue for petty cash transactions',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2507,'9850-30','Charge expense','Default other expense',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2508,'9850-35','Charge revenue','Default other revenue',9850,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2509,'9900-10','Corporation Income Tax',NULL,9910,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2510,'9900-20','State Income Tax',NULL,9910,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2511,'9900-30','Local Income Tax',NULL,9910,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2512,'9900-40','Income Summary','Year end processing to balance account (Retained Earnings)',9910,1,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-01-01',1,NULL,NULL,0,NULL,'2014-01-01 00:00:00',NULL,NULL),(2514,'9840-20','Exchange Fluctuation Gain/Loss',NULL,9840,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-01-23',1,NULL,NULL,0,NULL,'2014-01-23 10:13:55',NULL,NULL),(2515,'5600-20','Capital Beginning Balance',NULL,5600,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-01-23',1,NULL,NULL,0,NULL,'2014-01-23 10:15:09',NULL,NULL),(2517,'1300-60','Raw Material',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-02-24',1,NULL,NULL,0,NULL,'2014-02-24 10:34:02',NULL,NULL),(2518,'1300-70','Spares & Maintenance',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-02-24',1,NULL,NULL,0,NULL,'2014-02-24 10:34:44',NULL,NULL),(2519,'1300-80','Consumables',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-02-24',1,NULL,NULL,0,NULL,'2014-02-24 10:35:04',NULL,NULL),(2520,'3100-55','Stock Received Uninvoiced',NULL,3700,1,NULL,'',NULL,NULL,NULL,0.00,NULL,'2014-02-24',1,NULL,NULL,0,NULL,'2014-02-24 10:35:28',NULL,NULL),(2523,'1100-20','PETTY CASH',NULL,1100,1,NULL,NULL,1,NULL,'Cash',0.00,NULL,'2014-03-25',1,NULL,NULL,0,NULL,'2014-03-25 15:31:53',NULL,NULL),(2524,'1300-90','Steel Bar',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2015-12-22',1,7,'2015-12-22 13:54:29',0,NULL,'2015-12-22 13:54:11',NULL,NULL),(2525,'6100-50','Cash Sales',NULL,6100,1,NULL,'',NULL,NULL,NULL,0.00,7,'2015-12-29',1,7,'2015-12-29 17:13:57',0,NULL,'2015-12-29 17:13:33',NULL,NULL),(2526,'1200-10','Equity Chema',NULL,1200,1,6243,'1520262244067',1,2564,'Cash',0.00,7,'2015-12-30',1,7,'2015-12-30 15:46:49',1,NULL,'2015-12-30 15:45:56',NULL,NULL),(2527,'6300-10','Transport Charged to Customer',NULL,6300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2015-12-31',1,7,'2015-12-31 14:21:21',0,NULL,'2015-12-31 14:20:25',NULL,NULL),(2528,'6300-20','Fuel Charged to Customer',NULL,6300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2015-12-31',1,7,'2015-12-31 14:21:50',0,NULL,'2015-12-31 14:21:21',NULL,NULL),(2529,'1310-10','Binding Wire',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:30:37',0,NULL,'2016-01-04 11:30:07',NULL,NULL),(2530,'1310-20','Hoop Iron',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:33:28',0,NULL,'2016-01-04 11:30:38',NULL,NULL),(2531,'1310-30','Barbed Wire',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:33:54',0,NULL,'2016-01-04 11:33:29',NULL,NULL),(2532,'1310-40','Wheelbarrow',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:34:19',0,NULL,'2016-01-04 11:33:54',NULL,NULL),(2533,'1310-50','Polythene Sheet',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:34:50',0,NULL,'2016-01-04 11:34:19',NULL,NULL),(2534,'1310-60','Wire Mesh',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:35:15',0,NULL,'2016-01-04 11:34:50',NULL,NULL),(2535,'1310-70','Nail',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:35:40',0,NULL,'2016-01-04 11:35:15',NULL,NULL),(2536,'1310-80','Welding Rod',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:36:05',0,NULL,'2016-01-04 11:35:40',NULL,NULL),(2537,'1310-90','Cutting Blade',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:36:24',0,NULL,'2016-01-04 11:36:05',NULL,NULL),(2538,'1320-10','Cutting Disc',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:37:10',0,NULL,'2016-01-04 11:36:25',NULL,NULL),(2539,'1320-20','Grinding Disc',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 11:37:36',0,NULL,'2016-01-04 11:37:11',NULL,NULL),(2540,'1200-20','Cooperative Chema',NULL,1200,1,6212,'01148283307800',1,1907,'Cash',0.00,7,'2016-01-04',1,7,'2016-01-04 13:12:50',1,NULL,'2016-01-04 13:10:38',NULL,NULL),(2541,'1200-30','Barclays Chema',NULL,1200,1,6204,'2030146444',1,1793,'Cash',0.00,7,'2016-01-04',1,7,'2016-01-04 13:14:32',1,NULL,'2016-01-04 13:12:50',NULL,NULL),(2542,'1250-10','0721605016 Charles',NULL,1250,1,NULL,NULL,1,NULL,'Cash',0.00,7,'2016-01-04',1,7,'2016-01-04 13:15:41',0,NULL,'2016-01-04 13:14:32',NULL,NULL),(2543,'1250-20','0713790735- Emmah',NULL,1250,1,NULL,NULL,1,NULL,'Cash',0.00,7,'2016-01-04',1,7,'2016-01-04 13:16:12',0,NULL,'2016-01-04 13:15:41',NULL,NULL),(2544,'8290-30','Newspaper',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:32:42',0,NULL,'2016-01-04 13:32:19',NULL,NULL),(2545,'8920-40','Fuel-KRC 917',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:35:25',0,15,'2016-01-04 13:32:42',NULL,NULL),(2546,'8290-50','Fuel-KAQ 651F',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:36:06',0,15,'2016-01-04 13:35:25',NULL,NULL),(2547,'8290-60','Fuel-KCE 325m',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:36:50',0,15,'2016-01-04 13:36:06',NULL,NULL),(2548,'8290-70','Repair & Maintenance KRC 917',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:46:12',0,10,'2016-01-04 13:40:19',NULL,NULL),(2549,'8290-80','Repair & Maintenance KAQ 651F',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:46:45',0,10,'2016-01-04 13:46:12',NULL,NULL),(2550,'8290-90','Repair & Maintenance KCE 325M',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:47:21',0,10,'2016-01-04 13:46:46',NULL,NULL),(2551,'8300-10','Repair & Maintenance KBQ 376N',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:48:14',0,10,'2016-01-04 13:47:21',NULL,NULL),(2552,'8300-20','Fuel KBQ 376N',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:49:36',0,12,'2016-01-04 13:48:46',NULL,NULL),(2553,'8300-30','Parking KBQ 376N',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:51:45',0,11,'2016-01-04 13:49:37',NULL,NULL),(2554,'8300-40','Carwash KRC 917',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:53:09',0,21,'2016-01-04 13:52:29',NULL,NULL),(2555,'8300-50','Carwash KAQ 651F',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:53:48',0,21,'2016-01-04 13:53:09',NULL,NULL),(2556,'8300-60','Carwash KCE 325M',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:54:21',0,21,'2016-01-04 13:53:49',NULL,NULL),(2557,'8300-70','Carwash KBQ 376N',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:54:59',0,21,'2016-01-04 13:54:21',NULL,NULL),(2558,'8300-80','Airtime Airtel',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:56:19',0,20,'2016-01-04 13:54:59',NULL,NULL),(2559,'8300-90','Airtime Safaricom',NULL,8010,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-04',1,7,'2016-01-04 13:56:57',0,20,'2016-01-04 13:56:19',NULL,NULL),(2560,'1320-30','Chalk',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-07',1,7,'2016-01-07 13:49:31',0,NULL,'2016-01-07 13:49:07',NULL,NULL),(2561,'1320-40','Steel nail',NULL,1300,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-01-07',1,7,'2016-01-07 13:56:44',0,NULL,'2016-01-07 13:56:13',NULL,NULL),(2562,'6300-30','Tracking Installation Income',NULL,6200,1,NULL,'',NULL,NULL,NULL,0.00,7,'2016-02-18',1,7,'2016-02-18 19:31:29',0,NULL,'2016-02-18 19:30:51',NULL,NULL);
/*!40000 ALTER TABLE `chartaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chequeregister`
--

DROP TABLE IF EXISTS `chequeregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chequeregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Receipt_cat` varchar(45) DEFAULT NULL,
  `Remarks` text,
  `TxnDate` datetime NOT NULL,
  `CreateDate` date NOT NULL,
  `Dept` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `Amount` double(12,3) DEFAULT NULL,
  `RegNo` varchar(45) DEFAULT NULL,
  `VoucherDate` datetime DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `Supplier` int(11) DEFAULT NULL,
  `DepositDate` datetime DEFAULT NULL,
  `ChequeNo` varchar(45) DEFAULT NULL,
  `Bank` int(11) DEFAULT NULL,
  `Branch` int(11) DEFAULT NULL,
  `RegisterTotal` double(12,3) DEFAULT NULL,
  `Deposited` tinyint(1) NOT NULL,
  `CashbookAcc` int(11) DEFAULT NULL,
  `Currency` int(11) DEFAULT NULL,
  `reject` tinyint(1) NOT NULL,
  `payment` tinyint(1) NOT NULL,
  `receipt` tinyint(1) NOT NULL,
  `costcenter` int(11) NOT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ReceiptregDeptIndex` (`Dept`) USING BTREE,
  KEY `ChequeregCustIndex` (`Customer`) USING BTREE,
  KEY `ChequeregBankIndex` (`Bank`) USING BTREE,
  KEY `ChequeregBankBranchIndex` (`Branch`) USING BTREE,
  KEY `ChequeregCoAIndex` (`CashbookAcc`) USING BTREE,
  KEY `ChequeregSuppIndex` (`Supplier`) USING BTREE,
  KEY `ChequeregCurrIndex` (`Currency`) USING BTREE,
  KEY `chequeregcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `chequeregapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `chequeregcostcenter` (`costcenter`),
  KEY `chequeregcompany` (`company`),
  CONSTRAINT `chequeregcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_1` FOREIGN KEY (`Branch`) REFERENCES `bankcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_2` FOREIGN KEY (`Bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_3` FOREIGN KEY (`CashbookAcc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_4` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_5` FOREIGN KEY (`Customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_6` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_7` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_8` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chequeregister_ibfk_9` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chequeregister`
--

LOCK TABLES `chequeregister` WRITE;
/*!40000 ALTER TABLE `chequeregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `chequeregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CountryId` int(11) NOT NULL,
  `CityName` varchar(100) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `approvalstatus` tinyint(1) NOT NULL DEFAULT '1',
  `TxnDate` datetime NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `CityCountryIdIndex` (`CountryId`) USING BTREE,
  KEY `FK2E996BBC9B1232` (`CountryId`) USING BTREE,
  KEY `CitycreatedBy` (`CreatedBy`) USING BTREE,
  KEY `CityApprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `citycostcenter` (`costcenter`),
  KEY `citycompany` (`company`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`CountryId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `citycompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `citycostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'NAIROBI','2014-03-23',NULL,NULL,NULL,1,'2014-03-23 11:51:24',NULL,NULL),(2,1,'NAKURU','2014-03-23',NULL,NULL,NULL,1,'2014-03-23 11:54:28',NULL,NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `combinedledgers`
--

DROP TABLE IF EXISTS `combinedledgers`;
/*!50001 DROP VIEW IF EXISTS `combinedledgers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combinedledgers` (
  `Date` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `financialperiod` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `DocType` tinyint NOT NULL,
  `AccName` tinyint NOT NULL,
  `currency` tinyint NOT NULL,
  `CurrRate` tinyint NOT NULL,
  `Debit Amt` tinyint NOT NULL,
  `Credit Amt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `combinedledgers_basecurr`
--

DROP TABLE IF EXISTS `combinedledgers_basecurr`;
/*!50001 DROP VIEW IF EXISTS `combinedledgers_basecurr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combinedledgers_basecurr` (
  `Date` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `financialperiod` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `DocType` tinyint NOT NULL,
  `AccName` tinyint NOT NULL,
  `Debit Amt` tinyint NOT NULL,
  `Credit Amt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `companydetails`
--

DROP TABLE IF EXISTS `companydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companydetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) NOT NULL,
  `BaseCurrencyId` int(11) DEFAULT NULL,
  `Address` text,
  `PostCodeId` int(11) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `Tel` varchar(100) DEFAULT NULL,
  `Tel2` varchar(100) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `BizType` varchar(45) DEFAULT NULL,
  `Reg_No` varchar(100) NOT NULL,
  `PIN_No` varchar(100) NOT NULL,
  `VAT_No` varchar(20) NOT NULL,
  `TaxMode` varchar(45) DEFAULT NULL COMMENT 'Check',
  `Valuation` varchar(45) DEFAULT NULL COMMENT 'Check',
  `AccSystem` varchar(45) DEFAULT NULL COMMENT 'Check',
  `RoundOff` varchar(45) DEFAULT NULL COMMENT 'Check dtype or add dec for amt\n',
  `BudgetPeriod` varchar(45) DEFAULT NULL,
  `Street_2` text,
  `Street_3` text,
  `Country` int(11) DEFAULT NULL,
  `Finyearstart` datetime NOT NULL,
  `Finyearend` datetime NOT NULL,
  `Mobile` text,
  `Fax` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `CompanyName_UNIQUE` (`CompanyName`) USING BTREE,
  KEY `CompCityIdIndex` (`CityId`) USING BTREE,
  KEY `CompCurrencyIndex` (`BaseCurrencyId`) USING BTREE,
  KEY `CompPostcodeIndex` (`PostCodeId`) USING BTREE,
  KEY `FKE9C91F2514892C83` (`BaseCurrencyId`) USING BTREE,
  KEY `FKE9C91F25D60A5DA6` (`CityId`) USING BTREE,
  KEY `FKE9C91F25FC942499` (`PostCodeId`) USING BTREE,
  KEY `CompCountryIndex` (`Country`) USING BTREE,
  CONSTRAINT `companydetails_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companydetails_ibfk_2` FOREIGN KEY (`Country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companydetails_ibfk_3` FOREIGN KEY (`BaseCurrencyId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companydetails_ibfk_4` FOREIGN KEY (`PostCodeId`) REFERENCES `postcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companydetails`
--

LOCK TABLES `companydetails` WRITE;
/*!40000 ALTER TABLE `companydetails` DISABLE KEYS */;
INSERT INTO `companydetails` VALUES (1,'Chema Steel and Hardware',1,'',NULL,'Juja',NULL,'',NULL,'','',NULL,'NA','','NA',NULL,NULL,NULL,NULL,NULL,'','',1,'2015-01-01 00:00:00','2015-12-31 00:00:00','','');
/*!40000 ALTER TABLE `companydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consignmentnote`
--

DROP TABLE IF EXISTS `consignmentnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consignmentnote` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transporter` int(11) NOT NULL,
  `Routerate` int(11) NOT NULL,
  `Vehicle` int(11) NOT NULL,
  `Rate` double(12,2) NOT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `CloseStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `Dept` int(11) DEFAULT NULL,
  `Stores` int(11) DEFAULT NULL,
  `GatepassNo` varchar(45) DEFAULT NULL,
  `Driver` varchar(45) DEFAULT NULL,
  `Drivermobileno` varchar(45) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  KEY `ConsignmentnoteStoreIndex` (`Dept`) USING BTREE,
  KEY `consignSuppIndex` (`Transporter`) USING BTREE,
  KEY `consignvehicleIndex` (`Vehicle`) USING BTREE,
  KEY `consigncreatedByIndex` (`CreatedBy`) USING BTREE,
  KEY `consignclosedByIndex` (`ClosedBy`) USING BTREE,
  KEY `consignApprovedByIndex` (`ApprovedBy`) USING BTREE,
  KEY `consignStoreIndex` (`Stores`) USING BTREE,
  KEY `consignRouteIndex` (`Routerate`) USING BTREE,
  KEY `consigncostcenter` (`costcenter`),
  KEY `consigncompany` (`company`),
  CONSTRAINT `consigncompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consigncostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_1` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_3` FOREIGN KEY (`Routerate`) REFERENCES `routerate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_4` FOREIGN KEY (`Stores`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_5` FOREIGN KEY (`Transporter`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_6` FOREIGN KEY (`ClosedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_ibfk_8` FOREIGN KEY (`Vehicle`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consignmentnote`
--

LOCK TABLES `consignmentnote` WRITE;
/*!40000 ALTER TABLE `consignmentnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `consignmentnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consignmentnote_details`
--

DROP TABLE IF EXISTS `consignmentnote_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consignmentnote_details` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ConsNoteIndex` int(11) NOT NULL,
  `DelNteNo` int(11) NOT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `Customer` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  KEY `ConsNoteDIndex_idx` (`ConsNoteIndex`) USING BTREE,
  KEY `ConsNoteDelIndex` (`DelNteNo`) USING BTREE,
  KEY `ConsNoteCustIndex` (`Customer`) USING BTREE,
  CONSTRAINT `consignmentnote_details_ibfk_1` FOREIGN KEY (`Customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_details_ibfk_2` FOREIGN KEY (`ConsNoteIndex`) REFERENCES `consignmentnote` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consignmentnote_details_ibfk_3` FOREIGN KEY (`DelNteNo`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consignmentnote_details`
--

LOCK TABLES `consignmentnote_details` WRITE;
/*!40000 ALTER TABLE `consignmentnote_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `consignmentnote_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costcenter`
--

DROP TABLE IF EXISTS `costcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costcenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApproveDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `Desc_UNIQUE` (`Description`) USING BTREE,
  KEY `centrecreatedBy` (`CreatedBy`) USING BTREE,
  KEY `centreapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcentercostcenter` (`costcenter`),
  KEY `costcentercompany` (`company`),
  CONSTRAINT `costcenter_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costcenter_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costcentercompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costcentercostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costcenter`
--

LOCK TABLES `costcenter` WRITE;
/*!40000 ALTER TABLE `costcenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `costcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costhistory`
--

DROP TABLE IF EXISTS `costhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory` int(11) DEFAULT NULL,
  `suppinvoice` int(11) DEFAULT NULL,
  `originalcost` double(12,2) NOT NULL DEFAULT '0.00',
  `newcost` double(12,2) NOT NULL DEFAULT '0.00',
  `createDate` date NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `txnDate` datetime NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `costhistinvindex` (`inventory`) USING BTREE,
  KEY `costhistsuppinvindex` (`suppinvoice`) USING BTREE,
  KEY `costhistcreatedBy` (`createdBy`) USING BTREE,
  KEY `costhistcostcenter` (`costcenter`),
  KEY `costhistcompany` (`company`),
  CONSTRAINT `costhistcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costhistcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costhistory_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costhistory_ibfk_2` FOREIGN KEY (`inventory`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costhistory_ibfk_3` FOREIGN KEY (`suppinvoice`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costhistory`
--

LOCK TABLES `costhistory` WRITE;
/*!40000 ALTER TABLE `costhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `costhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costing`
--

DROP TABLE IF EXISTS `costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) NOT NULL,
  `inventory` int(11) NOT NULL,
  `wasteallowanceRate` double(12,2) NOT NULL,
  `wasteallowanceVal` double(12,2) NOT NULL,
  `manuOHRate` double(12,2) NOT NULL,
  `manuOHVal` double(12,2) NOT NULL,
  `freightChargeRate` double(12,2) NOT NULL DEFAULT '0.00',
  `freightChargeVal` double(12,2) NOT NULL,
  `totalOHCost` double(12,2) NOT NULL DEFAULT '0.00',
  `grossUnitCost` double(12,2) NOT NULL,
  `grossMargin` double(12,2) NOT NULL,
  `netMargin` double(12,2) NOT NULL,
  `sellingprice` double(12,2) NOT NULL,
  `txnDate` datetime NOT NULL,
  `createDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `costPrice` double(12,2) NOT NULL DEFAULT '0.00',
  `rawMaterial` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `costingCustIndex` (`customer`) USING BTREE,
  KEY `costingInventIndex` (`inventory`) USING BTREE,
  KEY `costingCreatedByIndex` (`createdBy`) USING BTREE,
  KEY `costingRawMaterial` (`rawMaterial`) USING BTREE,
  CONSTRAINT `costing_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costing_ibfk_2` FOREIGN KEY (`inventory`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costing_ibfk_3` FOREIGN KEY (`rawMaterial`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `costing_ibfk_4` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costing`
--

LOCK TABLES `costing` WRITE;
/*!40000 ALTER TABLE `costing` DISABLE KEYS */;
/*!40000 ALTER TABLE `costing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(100) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `CountryName_UNIQUE` (`CountryName`) USING BTREE,
  KEY `countrycreatedBy` (`CreatedBy`) USING BTREE,
  KEY `countryapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `countrycostcenter` (`costcenter`),
  KEY `countrycompany` (`company`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `country_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `countrycompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `countrycostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'KENYA','2014-03-23',NULL,'2016-02-08 02:39:17',NULL,NULL,1,NULL,NULL),(2,'RWANDA','2014-03-23',NULL,'2016-02-08 02:39:17',NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CurrName` varchar(45) NOT NULL,
  `CurrSymbol` varchar(5) DEFAULT NULL,
  `PurchaseRate` double(7,4) NOT NULL DEFAULT '0.0000',
  `SaleRate` double(7,4) NOT NULL DEFAULT '0.0000',
  `ExchangeRate` double(7,4) DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `CurrName_UNIQUE` (`CurrName`) USING BTREE,
  KEY `currcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `currapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `currcostcenter` (`costcenter`),
  KEY `currcompany` (`company`),
  CONSTRAINT `currcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currency_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'KENYA SHILLINGS','KES',1.0000,1.0000,1.0000,1,'2014-03-23',NULL,'2016-02-08 02:43:48',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencyhistory`
--

DROP TABLE IF EXISTS `currencyhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencyhistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `finyear` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `exchangerate` double NOT NULL,
  `purchaserate` double NOT NULL,
  `salerate` double NOT NULL,
  `createdby` int(11) NOT NULL,
  `oldExchangerate` double NOT NULL,
  `oldPurchaserate` double NOT NULL,
  `oldSalerate` double NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currhistFinyearIndex` (`finyear`) USING BTREE,
  KEY `currhistCurrIndex` (`currency`) USING BTREE,
  KEY `currhistCreatedbyIndex` (`createdby`) USING BTREE,
  KEY `currhistcostcenter` (`costcenter`),
  KEY `currhistcompany` (`company`),
  CONSTRAINT `currencyhistory_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currencyhistory_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currencyhistory_ibfk_3` FOREIGN KEY (`finyear`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currhistcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currhistcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencyhistory`
--

LOCK TABLES `currencyhistory` WRITE;
/*!40000 ALTER TABLE `currencyhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencyhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(20) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `Address` text,
  `PostCodeId` int(11) DEFAULT NULL,
  `City` int(11) DEFAULT NULL,
  `Tel` varchar(100) DEFAULT NULL,
  `CountryId` int(11) DEFAULT NULL,
  `Tel2` varchar(100) DEFAULT NULL,
  `Mobile` varchar(100) DEFAULT NULL,
  `Fax` varchar(100) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `ContactName` varchar(200) DEFAULT NULL,
  `ContactPhone` varchar(100) DEFAULT NULL,
  `FinContact` varchar(200) DEFAULT NULL,
  `FinContactNo` varchar(100) DEFAULT NULL,
  `BankId` int(11) DEFAULT NULL,
  `BankAccNo` varchar(45) DEFAULT NULL,
  `terms` int(11) DEFAULT NULL,
  `CreditLimit` double(9,2) DEFAULT NULL,
  `Discount` double(9,2) DEFAULT NULL,
  `CreditStatus` tinyint(1) DEFAULT NULL,
  `notes` text,
  `ActiveStatus` tinyint(1) NOT NULL DEFAULT '0',
  `CurrencyId` int(11) DEFAULT NULL,
  `Vatable` tinyint(1) NOT NULL DEFAULT '1',
  `PIN_No` varchar(45) DEFAULT NULL,
  `VAT_No` varchar(45) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Discountdays` double(9,2) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  `finemail` text,
  `distributer` tinyint(1) NOT NULL DEFAULT '0',
  `vehicle` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `idNo` text,
  `tracker` int(11) DEFAULT NULL,
  `financier` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Company_UNIQUE` (`company`) USING BTREE,
  UNIQUE KEY `company` (`company`) USING BTREE,
  KEY `CityIdIndex` (`City`) USING BTREE,
  KEY `CurrencyIndex` (`CurrencyId`) USING BTREE,
  KEY `PostCodeIndex` (`PostCodeId`) USING BTREE,
  KEY `FK24217FDE274AFF4B` (`City`) USING BTREE,
  KEY `FK24217FDE4BEDB86C` (`BankId`) USING BTREE,
  KEY `FK24217FDEAF4B6F2` (`CurrencyId`) USING BTREE,
  KEY `FK24217FDEFC942499` (`PostCodeId`) USING BTREE,
  KEY `custCountryIndex_idx` (`CountryId`) USING BTREE,
  KEY `custcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `custapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `customercatIndex` (`Category`) USING BTREE,
  KEY `custvehidx` (`vehicle`),
  KEY `custcostcenter` (`costcenter`),
  KEY `custcompany` (`companyid`),
  KEY `tracker` (`tracker`),
  CONSTRAINT `custcompany` FOREIGN KEY (`companyid`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `custcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`BankId`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`City`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`CurrencyId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`PostCodeId`) REFERENCES `postcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_5` FOREIGN KEY (`CountryId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_6` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_8` FOREIGN KEY (`Category`) REFERENCES `customercat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_9` FOREIGN KEY (`tracker`) REFERENCES `tracker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `custvehidx` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,NULL,'Test Customer','',NULL,NULL,'0722488048',NULL,'','0722488048','','test@test.com','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,1,1,0,'','',7,'2016-02-09','2016-02-09 23:13:10',7,'2016-02-09 23:13:10',1,NULL,NULL,'',0,NULL,NULL,NULL,'22991074',NULL,0),(6,NULL,'Jessy Ndegwa',NULL,NULL,NULL,'0723789374',NULL,NULL,'0723789374',NULL,'kwach112@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,NULL,NULL,7,'2016-02-26','2016-02-27 01:47:46',7,'2016-02-27 01:47:46',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'ID NO',6,0),(7,NULL,'SEREM SHADRACK',NULL,NULL,NULL,'077276475',NULL,NULL,'077276475',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,NULL,NULL,7,'2016-02-26','2016-02-27 01:52:50',7,'2016-02-27 01:52:50',1,NULL,NULL,NULL,0,NULL,NULL,NULL,'',7,0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerallocations`
--

DROP TABLE IF EXISTS `customerallocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerallocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustId` int(11) DEFAULT NULL,
  `Journal` int(11) DEFAULT NULL,
  `Salesledger` int(11) DEFAULT NULL,
  `SCnote` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `AllocAmnt` double(12,2) NOT NULL,
  `AllocNo` varchar(45) DEFAULT NULL,
  `CreditType` varchar(45) NOT NULL,
  `UnallocatedBal` double(12,2) DEFAULT NULL,
  `ExCreditAmt` double(12,2) DEFAULT NULL,
  `ExAllocatedAmt` double(12,2) DEFAULT NULL,
  `ExDiff` double(12,2) DEFAULT NULL,
  `JournalDetail` int(11) DEFAULT NULL,
  `Department` int(11) DEFAULT NULL,
  `Voided` tinyint(1) NOT NULL DEFAULT '0',
  `DocNo` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `CustAllocCustIndex_idx` (`CustId`) USING BTREE,
  KEY `FKAC9E54F5FD509481` (`CustId`) USING BTREE,
  KEY `CustAllocJnlIndex` (`Journal`) USING BTREE,
  KEY `CustAllocScnoteIndex` (`SCnote`) USING BTREE,
  KEY `CustAllocCbkIndex` (`Salesledger`) USING BTREE,
  KEY `CustAllocJnldetailIndex` (`JournalDetail`) USING BTREE,
  KEY `CustAllocDeptIndex` (`Department`) USING BTREE,
  KEY `custalloccreatedBy` (`ApprovedBy`) USING BTREE,
  KEY `custallocapprovedBy` (`CreatedBy`) USING BTREE,
  KEY `custalloccostcenter` (`costcenter`),
  KEY `custalloccompany` (`company`),
  CONSTRAINT `custalloccompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `custalloccostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_1` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_2` FOREIGN KEY (`Department`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_3` FOREIGN KEY (`Journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_4` FOREIGN KEY (`JournalDetail`) REFERENCES `journal_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_5` FOREIGN KEY (`Salesledger`) REFERENCES `salesledger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_6` FOREIGN KEY (`SCnote`) REFERENCES `salescreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocations_ibfk_8` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerallocations`
--

LOCK TABLES `customerallocations` WRITE;
/*!40000 ALTER TABLE `customerallocations` DISABLE KEYS */;
INSERT INTO `customerallocations` VALUES (3,7,NULL,14,NULL,'2016-02-29',7,'2016-02-29 12:19:32','2016-02-29 12:19:32',7,1,10000.00,NULL,'RECEIPT',2000.00,10000.00,10000.00,0.00,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customerallocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerallocdetail`
--

DROP TABLE IF EXISTS `customerallocdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerallocdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustAllocId` int(11) DEFAULT NULL,
  `InvoiceNo` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `CustInvDate` datetime DEFAULT '0000-00-00 00:00:00',
  `CustInvrate` double(12,2) NOT NULL DEFAULT '0.00',
  `CustInvamt` double(12,2) NOT NULL DEFAULT '0.00',
  `CustAllocatedamt` double(12,2) NOT NULL DEFAULT '0.00',
  `CustInvBal` double(12,2) NOT NULL DEFAULT '0.00',
  `AllocAmt` double(12,2) NOT NULL DEFAULT '0.00',
  `ClearBal` tinyint(1) NOT NULL DEFAULT '0',
  `Salesledger` int(11) NOT NULL,
  `Docno` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `CustAllocHeaderIndex_idx` (`CustAllocId`) USING BTREE,
  KEY `CustAllDetInvIndex_idx` (`InvoiceNo`) USING BTREE,
  KEY `CustAllocdetSLIndex` (`Salesledger`) USING BTREE,
  CONSTRAINT `customerallocdetail_ibfk_1` FOREIGN KEY (`InvoiceNo`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocdetail_ibfk_2` FOREIGN KEY (`CustAllocId`) REFERENCES `customerallocations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerallocdetail_ibfk_3` FOREIGN KEY (`Salesledger`) REFERENCES `salesledger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerallocdetail`
--

LOCK TABLES `customerallocdetail` WRITE;
/*!40000 ALTER TABLE `customerallocdetail` DISABLE KEYS */;
INSERT INTO `customerallocdetail` VALUES (3,3,12,'CREDIT SALES','2016-02-26 00:00:00',1.00,10000.00,0.00,10000.00,10000.00,0,13,'12');
/*!40000 ALTER TABLE `customerallocdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customercat`
--

DROP TABLE IF EXISTS `customercat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customercat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `Desc_UNIQUE` (`Category`) USING BTREE,
  KEY `customercatcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `customercatapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `custcatcostcenter` (`costcenter`),
  KEY `custcatcompany` (`company`),
  CONSTRAINT `custcatcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `custcatcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customercat_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customercat_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercat`
--

LOCK TABLES `customercat` WRITE;
/*!40000 ALTER TABLE `customercat` DISABLE KEYS */;
/*!40000 ALTER TABLE `customercat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debitnote`
--

DROP TABLE IF EXISTS `debitnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debitnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debitNo` varchar(5) DEFAULT NULL,
  `CustId` int(11) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(9,4) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `TotalAmount` double(12,4) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `Approvedby` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `SubTotal` double(9,2) NOT NULL,
  `Vat` double(9,2) NOT NULL,
  `vatinclusive` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `DrNoteCustIndex` (`CustId`) USING BTREE,
  KEY `DrNoteCurrIndex` (`CurrId`) USING BTREE,
  KEY `DrNoteDepIndex` (`DeptId`) USING BTREE,
  KEY `DrNoteStoreIndex` (`StoreId`) USING BTREE,
  KEY `DrcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `DrapprovedBy` (`Approvedby`) USING BTREE,
  KEY `drnotecostcenter` (`costcenter`),
  KEY `drnotecompany` (`company`),
  CONSTRAINT `debitnote_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnote_ibfk_2` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnote_ibfk_3` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnote_ibfk_4` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnote_ibfk_5` FOREIGN KEY (`Approvedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnote_ibfk_6` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drnotecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drnotecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debitnote`
--

LOCK TABLES `debitnote` WRITE;
/*!40000 ALTER TABLE `debitnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `debitnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debitnotedetail`
--

DROP TABLE IF EXISTS `debitnotedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debitnotedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Debitnote` int(11) DEFAULT NULL,
  `Description` text,
  `CoA` int(11) DEFAULT NULL,
  `Vat` int(11) DEFAULT NULL,
  `Vatrate` double(12,2) DEFAULT NULL,
  `Unitprice` double(12,2) DEFAULT NULL,
  `Qty` double(12,2) DEFAULT NULL,
  `Total` double(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DrNoteDrIndex` (`Debitnote`) USING BTREE,
  KEY `DrNoteCoaIndex` (`CoA`) USING BTREE,
  KEY `DrNoteVatIndex` (`Vat`) USING BTREE,
  CONSTRAINT `debitnotedetail_ibfk_1` FOREIGN KEY (`CoA`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnotedetail_ibfk_2` FOREIGN KEY (`Debitnote`) REFERENCES `debitnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debitnotedetail_ibfk_3` FOREIGN KEY (`Vat`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debitnotedetail`
--

LOCK TABLES `debitnotedetail` WRITE;
/*!40000 ALTER TABLE `debitnotedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `debitnotedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaultaccount`
--

DROP TABLE IF EXISTS `defaultaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaul_accreceivable` int(11) DEFAULT NULL,
  `default_customerprepayment` int(11) DEFAULT NULL,
  `default_discountexpense` int(11) DEFAULT NULL,
  `default_receivableservice` int(11) DEFAULT NULL,
  `default_cashsale` int(11) DEFAULT NULL,
  `default_exportcredit` int(11) DEFAULT NULL,
  `default_defaultincome` int(11) DEFAULT NULL,
  `default_accpayable` int(11) DEFAULT '0',
  `default_vendorprepayment` int(11) DEFAULT NULL,
  `default_discountrevenue` int(11) DEFAULT NULL,
  `default_payableservice` int(11) DEFAULT NULL,
  `default_localpurchase` int(11) DEFAULT NULL,
  `default_importpurchase` int(11) DEFAULT NULL,
  `default_defaultexpense` int(11) DEFAULT NULL,
  `default_asset` int(11) DEFAULT NULL,
  `default_costadjustment` int(11) DEFAULT NULL,
  `default_inventoryadjustment` int(11) DEFAULT NULL,
  `default_wip` int(11) DEFAULT NULL,
  `default_scrap` int(11) DEFAULT NULL,
  `default_finishedproduct` int(11) DEFAULT NULL,
  `default_checkingacc` int(11) DEFAULT NULL,
  `default_depositacc` int(11) DEFAULT NULL,
  `default_cashinregister` int(11) DEFAULT NULL,
  `default_pettycash` int(11) DEFAULT NULL,
  `default_vat` int(11) DEFAULT NULL,
  `default_turnovertax` int(11) DEFAULT NULL,
  `default_withholdingtax` int(11) DEFAULT NULL,
  `default_empprepayment` int(11) DEFAULT NULL,
  `default_empexpense` int(11) DEFAULT NULL,
  `default_empnhifded` int(11) DEFAULT NULL,
  `default_empnssfded` int(11) DEFAULT NULL,
  `default_empgratuity` int(11) DEFAULT NULL,
  `default_capital` int(11) DEFAULT NULL,
  `default_exchangegainloss` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `TxnDate` datetime DEFAULT NULL,
  `UpdatedBy` int(11) DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `default_customerreturnslocal` int(11) DEFAULT NULL,
  `default_customerreturnsexport` int(11) DEFAULT NULL,
  `default_vendorreturnslocal` int(11) DEFAULT NULL,
  `default_vendorreturnsimport` int(11) DEFAULT NULL,
  `default_grn` int(11) DEFAULT NULL,
  `default_uninvoicedstock` int(11) DEFAULT NULL,
  `default_localcredit` int(11) DEFAULT NULL,
  `default_purchasepriceVar` int(11) DEFAULT NULL,
  `default_consumable` int(11) DEFAULT NULL,
  `default_sparesmaintenance` int(11) DEFAULT NULL,
  `default_cogs` int(11) DEFAULT NULL,
  `default_dividends` int(11) DEFAULT NULL,
  `default_trackingincome` int(11) DEFAULT NULL,
  `default_deductions` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `AccCode_UNIQUE` (`defaul_accreceivable`) USING BTREE,
  KEY `CustomerprepaymentIndex` (`default_customerprepayment`) USING BTREE,
  KEY `DiscountexpenseIndex` (`default_discountexpense`) USING BTREE,
  KEY `ReceivableserviceIndex` (`default_receivableservice`) USING BTREE,
  KEY `CashsaleIndex` (`default_cashsale`) USING BTREE,
  KEY `ExportcreditIndex` (`default_exportcredit`) USING BTREE,
  KEY `DefaultincomeIndex` (`default_defaultincome`) USING BTREE,
  KEY `AccpayableIndex` (`default_accpayable`) USING BTREE,
  KEY `VendorprepaymentIndex` (`default_vendorprepayment`) USING BTREE,
  KEY `DiscountrevenueIndex` (`default_discountrevenue`) USING BTREE,
  KEY `PayableserviceIndex` (`default_payableservice`) USING BTREE,
  KEY `LocalpurchaseIndex` (`default_localpurchase`) USING BTREE,
  KEY `ImportpurchaseIndex` (`default_importpurchase`) USING BTREE,
  KEY `DefaultexpenseIndex` (`default_defaultexpense`) USING BTREE,
  KEY `AssetIndex` (`default_asset`) USING BTREE,
  KEY `CostAdjustmentIndex` (`default_costadjustment`) USING BTREE,
  KEY `InventoryadjIndex` (`default_inventoryadjustment`) USING BTREE,
  KEY `WipIndex` (`default_wip`) USING BTREE,
  KEY `ScrapIndex` (`default_scrap`) USING BTREE,
  KEY `FinishedproductIndex` (`default_finishedproduct`) USING BTREE,
  KEY `CheckingaccIndex` (`default_checkingacc`) USING BTREE,
  KEY `DepositaccIndex` (`default_depositacc`) USING BTREE,
  KEY `CashregisterIndex` (`default_cashinregister`) USING BTREE,
  KEY `PettyCashIndex` (`default_pettycash`) USING BTREE,
  KEY `VatIndex` (`default_vat`) USING BTREE,
  KEY `TurnovertaxIndex` (`default_turnovertax`) USING BTREE,
  KEY `WithholdingtaxIndex` (`default_withholdingtax`) USING BTREE,
  KEY `EmpprepaymentIndex` (`default_empprepayment`) USING BTREE,
  KEY `EmpexpenseIndex` (`default_empexpense`) USING BTREE,
  KEY `EmpnhifIndex` (`default_empnhifded`) USING BTREE,
  KEY `EmpnssfIndex` (`default_empnssfded`) USING BTREE,
  KEY `EmpgratuityIndex` (`default_empgratuity`) USING BTREE,
  KEY `CapitalIndex` (`default_capital`) USING BTREE,
  KEY `ExchangegainlossIndex` (`default_exchangegainloss`) USING BTREE,
  KEY `CustomerreturnlocalIndex` (`default_customerreturnslocal`) USING BTREE,
  KEY `CustomerreturnexportIndex` (`default_customerreturnsexport`) USING BTREE,
  KEY `VendorreturnlocalIndex` (`default_vendorreturnslocal`) USING BTREE,
  KEY `VendorreturnimportIndex` (`default_vendorreturnsimport`) USING BTREE,
  KEY `grnIndex` (`default_grn`) USING BTREE,
  KEY `UninvoicedstockIndex` (`default_uninvoicedstock`) USING BTREE,
  KEY `LocalcreditIndex` (`default_localcredit`) USING BTREE,
  KEY `PricevarIndex` (`default_purchasepriceVar`) USING BTREE,
  KEY `ConsumableIndex` (`default_consumable`) USING BTREE,
  KEY `SparemaintenanceIndex` (`default_sparesmaintenance`) USING BTREE,
  KEY `defaultaccupdatedBy` (`UpdatedBy`) USING BTREE,
  KEY `cogsIndex` (`default_cogs`) USING BTREE,
  KEY `dividendsDefAcc` (`default_dividends`) USING BTREE,
  KEY `deductionsIndex` (`default_deductions`) USING BTREE,
  KEY `defaultacccostcenter` (`costcenter`),
  KEY `defaultacccompany` (`company`),
  KEY `default_trackingincome` (`default_trackingincome`),
  CONSTRAINT `defaultacccompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultacccostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_1` FOREIGN KEY (`default_accpayable`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_10` FOREIGN KEY (`default_empexpense`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_11` FOREIGN KEY (`default_empgratuity`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_12` FOREIGN KEY (`defaul_accreceivable`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_13` FOREIGN KEY (`default_empnhifded`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_14` FOREIGN KEY (`default_empnssfded`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_15` FOREIGN KEY (`default_empprepayment`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_16` FOREIGN KEY (`default_exchangegainloss`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_17` FOREIGN KEY (`default_exportcredit`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_18` FOREIGN KEY (`default_finishedproduct`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_19` FOREIGN KEY (`default_importpurchase`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_2` FOREIGN KEY (`default_customerprepayment`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_20` FOREIGN KEY (`default_inventoryadjustment`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_21` FOREIGN KEY (`default_localcredit`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_22` FOREIGN KEY (`default_localpurchase`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_23` FOREIGN KEY (`default_asset`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_24` FOREIGN KEY (`default_payableservice`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_25` FOREIGN KEY (`default_pettycash`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_26` FOREIGN KEY (`default_purchasepriceVar`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_27` FOREIGN KEY (`default_receivableservice`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_28` FOREIGN KEY (`default_scrap`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_29` FOREIGN KEY (`default_sparesmaintenance`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_3` FOREIGN KEY (`default_customerreturnsexport`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_30` FOREIGN KEY (`default_turnovertax`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_31` FOREIGN KEY (`default_uninvoicedstock`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_32` FOREIGN KEY (`default_vat`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_33` FOREIGN KEY (`default_vendorprepayment`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_34` FOREIGN KEY (`default_capital`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_35` FOREIGN KEY (`default_vendorreturnsimport`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_36` FOREIGN KEY (`default_vendorreturnslocal`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_37` FOREIGN KEY (`default_wip`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_38` FOREIGN KEY (`default_withholdingtax`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_39` FOREIGN KEY (`default_cogs`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_4` FOREIGN KEY (`default_customerreturnslocal`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_40` FOREIGN KEY (`default_deductions`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_41` FOREIGN KEY (`UpdatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_42` FOREIGN KEY (`default_dividends`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_43` FOREIGN KEY (`default_grn`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_44` FOREIGN KEY (`default_cashinregister`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_45` FOREIGN KEY (`default_cashsale`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_46` FOREIGN KEY (`default_checkingacc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_47` FOREIGN KEY (`default_consumable`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_48` FOREIGN KEY (`default_costadjustment`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_49` FOREIGN KEY (`default_trackingincome`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_5` FOREIGN KEY (`default_defaultexpense`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_6` FOREIGN KEY (`default_defaultincome`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_7` FOREIGN KEY (`default_depositacc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_8` FOREIGN KEY (`default_discountexpense`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultaccount_ibfk_9` FOREIGN KEY (`default_discountrevenue`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultaccount`
--

LOCK TABLES `defaultaccount` WRITE;
/*!40000 ALTER TABLE `defaultaccount` DISABLE KEYS */;
INSERT INTO `defaultaccount` VALUES (1,2222,2295,NULL,NULL,2525,2332,NULL,2290,2240,2369,NULL,NULL,NULL,NULL,NULL,NULL,2360,2219,2347,2220,NULL,NULL,NULL,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2515,2514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2340,2341,2355,2357,NULL,2520,2331,2363,NULL,NULL,2345,NULL,2562,NULL,NULL,NULL);
/*!40000 ALTER TABLE `defaultaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Acc_code` int(11) DEFAULT NULL,
  `Receipt_cat` varchar(45) DEFAULT NULL,
  `TotalAmt` decimal(12,2) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreatedDate` date NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) DEFAULT NULL,
  `Currency` int(11) DEFAULT NULL,
  `Remarks` text,
  `Dept` int(11) DEFAULT NULL,
  `DepositNo` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DepCoAIndex` (`Acc_code`) USING BTREE,
  KEY `DepDeptIndex` (`Dept`) USING BTREE,
  KEY `DepCurrIndex` (`Currency`) USING BTREE,
  KEY `DepcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `DepapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `depositcostcenter` (`costcenter`),
  KEY `depositcompany` (`company`),
  CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`Acc_code`) REFERENCES `chartaccount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deposit_ibfk_3` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deposit_ibfk_4` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deposit_ibfk_5` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depositcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depositcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depts`
--

DROP TABLE IF EXISTS `depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeptName` varchar(100) DEFAULT NULL,
  `Company` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DeptComIndex` (`Company`) USING BTREE,
  KEY `deptcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `deptapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `deptcostcenter` (`costcenter`),
  CONSTRAINT `deptcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depts_ibfk_1` FOREIGN KEY (`Company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depts_ibfk_3` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depts_ibfk_4` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depts`
--

LOCK TABLES `depts` WRITE;
/*!40000 ALTER TABLE `depts` DISABLE KEYS */;
INSERT INTO `depts` VALUES (30,'FINANCE',NULL,'2014-03-22',NULL,'2016-02-08 03:27:45',NULL,NULL,1,NULL),(31,'PRODUCTION',NULL,'2014-03-22',NULL,'2016-02-08 03:27:45',NULL,NULL,1,NULL),(32,'SALES',NULL,'2014-03-22',NULL,'2016-02-08 03:27:45',NULL,NULL,1,NULL),(33,'STORES',NULL,'2014-03-22',NULL,'2016-02-08 03:27:45',NULL,NULL,1,NULL),(34,'PURCHASES',NULL,'2014-04-06',NULL,'2016-02-08 03:27:45',NULL,NULL,1,NULL),(35,'MANAGEMENT',NULL,'2014-04-06',NULL,'2016-02-08 03:27:45',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `depts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicecard`
--

DROP TABLE IF EXISTS `devicecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` int(11) NOT NULL,
  `qtyout` double(12,2) NOT NULL DEFAULT '0.00',
  `qtyin` double(12,2) NOT NULL DEFAULT '0.00',
  `stockcard` int(11) DEFAULT NULL,
  `invoiceDetail` int(11) DEFAULT NULL,
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicecard_device_fk` (`device`),
  KEY `dvcard_stckcard_fk` (`stockcard`),
  KEY `dvcard_invdet_fk` (`invoiceDetail`),
  CONSTRAINT `devicecard_device_fk` FOREIGN KEY (`device`) REFERENCES `deviceserial` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `dvcard_invdet_fk` FOREIGN KEY (`invoiceDetail`) REFERENCES `salesinvoice_details` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `dvcard_stckcard_fk` FOREIGN KEY (`stockcard`) REFERENCES `stockcard` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicecard`
--

LOCK TABLES `devicecard` WRITE;
/*!40000 ALTER TABLE `devicecard` DISABLE KEYS */;
INSERT INTO `devicecard` VALUES (82,65,0.00,1.00,30,NULL,0),(83,66,0.00,1.00,30,NULL,0),(84,67,0.00,1.00,30,NULL,0),(85,68,0.00,1.00,30,NULL,0),(86,69,0.00,1.00,30,NULL,0),(87,65,1.00,0.00,31,NULL,0),(88,66,1.00,0.00,31,NULL,0),(89,67,1.00,0.00,NULL,5,0),(90,68,1.00,0.00,NULL,5,0),(91,66,0.00,1.00,33,NULL,0);
/*!40000 ALTER TABLE `devicecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceserial`
--

DROP TABLE IF EXISTS `deviceserial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceserial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Serialno` varchar(355) NOT NULL,
  `createDate` date NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `Devicefamily` int(11) NOT NULL,
  `Stockcard` int(11) DEFAULT NULL,
  `issued` tinyint(1) NOT NULL DEFAULT '0',
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  `dateIssued` datetime DEFAULT NULL,
  `dateRetuned` datetime DEFAULT NULL,
  `stockissue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reelCode` (`Serialno`) USING BTREE,
  KEY `reelInvInventoryIndex` (`Devicefamily`) USING BTREE,
  KEY `reelInvstkcardIndex` (`Stockcard`),
  KEY `reelinvcreatedBy` (`createdBy`),
  KEY `reelinvapprovedBy` (`ApprovedBy`),
  KEY `deviceserials_fk_stckissue` (`stockissue`),
  CONSTRAINT `deviceserial_ibfk_2` FOREIGN KEY (`Stockcard`) REFERENCES `stockcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deviceserial_ibfk_3` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deviceserial_ibfk_4` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deviceserials_fk_inventory` FOREIGN KEY (`Devicefamily`) REFERENCES `inventory` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `deviceserials_fk_stckissue` FOREIGN KEY (`stockissue`) REFERENCES `stockissue` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceserial`
--

LOCK TABLES `deviceserial` WRITE;
/*!40000 ALTER TABLE `deviceserial` DISABLE KEYS */;
INSERT INTO `deviceserial` VALUES (65,'123','2016-02-19',NULL,0,NULL,NULL,'2016-02-19 10:49:47',36,30,0,0,NULL,NULL,NULL),(66,'321','2016-02-19',NULL,0,NULL,NULL,'2016-02-19 10:49:47',36,30,0,0,NULL,NULL,NULL),(67,'345','2016-02-19',NULL,0,NULL,NULL,'2016-02-19 10:49:47',36,30,0,0,NULL,NULL,NULL),(68,'235','2016-02-19',NULL,0,NULL,NULL,'2016-02-19 10:49:47',36,30,0,0,NULL,NULL,NULL),(69,'135','2016-02-19',NULL,0,NULL,NULL,'2016-02-19 10:49:47',36,30,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `deviceserial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicetype`
--

DROP TABLE IF EXISTS `devicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdbydtype_fk` (`createdby`),
  KEY `updatebyDtype_fk` (`updatedby`),
  CONSTRAINT `createdbydtype_fk` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `updatebyDtype_fk` FOREIGN KEY (`updatedby`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicetype`
--

LOCK TABLES `devicetype` WRITE;
/*!40000 ALTER TABLE `devicetype` DISABLE KEYS */;
INSERT INTO `devicetype` VALUES (1,'TRACKING GADGET',29,NULL,'2016-02-11 20:46:27',NULL),(2,'SIM CARD',29,NULL,'2016-02-11 20:47:20',NULL);
/*!40000 ALTER TABLE `devicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialmonths`
--

DROP TABLE IF EXISTS `financialmonths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financialmonths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MonthStart` datetime NOT NULL,
  `MonthEnd` datetime NOT NULL,
  `FinancialYear` int(11) DEFAULT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `FinmonthsFinperiodIndex` (`FinancialYear`) USING BTREE,
  KEY `finmonthcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `finmonthapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `finmonthscostcenter` (`costcenter`),
  KEY `finmonthcompany` (`company`),
  CONSTRAINT `financialmonths_ibfk_1` FOREIGN KEY (`FinancialYear`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `financialmonths_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `financialmonths_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `finmonthcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `finmonthscostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialmonths`
--

LOCK TABLES `financialmonths` WRITE;
/*!40000 ALTER TABLE `financialmonths` DISABLE KEYS */;
INSERT INTO `financialmonths` VALUES (1,'2016-01-01 00:00:00','2016-01-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(2,'2016-02-01 00:00:00','2016-02-29 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(3,'2016-03-01 00:00:00','2016-03-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(4,'2016-04-01 00:00:00','2016-04-30 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(5,'2016-05-01 00:00:00','2016-05-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(6,'2016-06-01 00:00:00','2016-06-30 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(7,'2016-07-01 00:00:00','2016-07-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(8,'2016-08-01 00:00:00','2016-08-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(9,'2016-09-01 00:00:00','2016-09-30 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(10,'2016-10-01 00:00:00','2016-10-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(11,'2016-11-01 00:00:00','2016-11-30 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL),(12,'2016-12-01 00:00:00','2016-12-31 00:00:00',2,0,7,'2016-01-07',NULL,'2016-01-07 19:34:27',1,NULL,NULL);
/*!40000 ALTER TABLE `financialmonths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialperiods`
--

DROP TABLE IF EXISTS `financialperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financialperiods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `YearStart` datetime NOT NULL,
  `YearEnd` datetime NOT NULL,
  `CurrentYear` tinyint(1) NOT NULL DEFAULT '0',
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  `CreateDate` date NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` datetime DEFAULT NULL,
  `Company` int(11) NOT NULL,
  `Financialperiod` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `FinperiodCompanyIndex` (`Company`) USING BTREE,
  KEY `FinperiodFinperiodIndex` (`Financialperiod`) USING BTREE,
  KEY `finperiodcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `finperiodapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `financialpdcostcenter` (`costcenter`),
  CONSTRAINT `financialpdcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `financialperiods_ibfk_1` FOREIGN KEY (`Company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `financialperiods_ibfk_2` FOREIGN KEY (`Financialperiod`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `financialperiods_ibfk_3` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `financialperiods_ibfk_4` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialperiods`
--

LOCK TABLES `financialperiods` WRITE;
/*!40000 ALTER TABLE `financialperiods` DISABLE KEYS */;
INSERT INTO `financialperiods` VALUES (1,'2015-01-01 00:00:00','2015-12-31 00:00:00',0,1,'2015-01-01',7,1,'2015-01-01 00:00:00',1,1,7,'2015-01-01 00:00:00',NULL),(2,'2016-01-01 00:00:00','2016-12-30 00:00:00',1,0,'2016-01-07',7,0,'2016-01-07 19:34:27',1,NULL,7,NULL,NULL);
/*!40000 ALTER TABLE `financialperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaccess`
--

DROP TABLE IF EXISTS `formaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form` int(11) NOT NULL,
  `access` tinyint(1) NOT NULL DEFAULT '0',
  `roles` int(11) NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formIndex` (`form`) USING BTREE,
  KEY `rolesIndex` (`roles`) USING BTREE,
  KEY `formaccesscostcenter` (`costcenter`),
  KEY `formaccesscompany` (`company`),
  CONSTRAINT `formaccess_ibfk_1` FOREIGN KEY (`form`) REFERENCES `forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formaccess_ibfk_2` FOREIGN KEY (`roles`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formaccesscompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formaccesscostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formaccess`
--

LOCK TABLES `formaccess` WRITE;
/*!40000 ALTER TABLE `formaccess` DISABLE KEYS */;
INSERT INTO `formaccess` VALUES (881,79,1,1,NULL,NULL),(882,61,1,1,NULL,NULL),(883,53,1,1,NULL,NULL),(884,64,1,1,NULL,NULL),(885,26,1,1,NULL,NULL),(886,29,1,1,NULL,NULL),(887,48,1,1,NULL,NULL),(888,84,1,1,NULL,NULL),(889,45,1,1,NULL,NULL),(890,62,1,1,NULL,NULL),(891,59,1,1,NULL,NULL),(892,57,1,1,NULL,NULL),(893,77,1,1,NULL,NULL),(894,34,1,1,NULL,NULL),(895,58,1,1,NULL,NULL),(896,76,1,1,NULL,NULL),(897,19,1,1,NULL,NULL),(898,72,1,1,NULL,NULL),(899,74,1,1,NULL,NULL),(900,38,1,1,NULL,NULL),(901,47,1,1,NULL,NULL),(902,85,1,1,NULL,NULL),(903,11,1,1,NULL,NULL),(904,67,1,1,NULL,NULL),(905,54,1,1,NULL,NULL),(906,50,1,1,NULL,NULL),(907,56,1,1,NULL,NULL),(908,63,1,1,NULL,NULL),(909,41,1,1,NULL,NULL),(910,65,1,1,NULL,NULL),(911,36,1,1,NULL,NULL),(912,55,1,1,NULL,NULL),(913,16,1,1,NULL,NULL),(914,52,1,1,NULL,NULL),(915,6,1,1,NULL,NULL),(916,39,1,1,NULL,NULL),(917,1,1,1,NULL,NULL),(918,30,1,1,NULL,NULL),(919,49,1,1,NULL,NULL),(920,9,1,1,NULL,NULL),(921,23,1,1,NULL,NULL),(922,15,1,1,NULL,NULL),(923,20,1,1,NULL,NULL),(924,13,1,1,NULL,NULL),(925,27,1,1,NULL,NULL),(926,51,1,1,NULL,NULL),(927,60,1,1,NULL,NULL),(928,5,1,1,NULL,NULL),(929,2,1,1,NULL,NULL),(930,8,1,1,NULL,NULL),(931,3,1,1,NULL,NULL),(932,68,1,1,NULL,NULL),(933,32,1,1,NULL,NULL),(934,17,1,1,NULL,NULL),(935,80,1,1,NULL,NULL),(936,75,1,1,NULL,NULL),(937,71,1,1,NULL,NULL),(938,31,1,1,NULL,NULL),(939,83,1,1,NULL,NULL),(940,24,1,1,NULL,NULL),(941,14,1,1,NULL,NULL),(942,69,1,1,NULL,NULL),(943,33,1,1,NULL,NULL),(944,35,1,1,NULL,NULL),(945,44,1,1,NULL,NULL),(946,73,1,1,NULL,NULL),(947,78,1,1,NULL,NULL),(948,70,1,1,NULL,NULL),(949,4,1,1,NULL,NULL),(950,25,1,1,NULL,NULL),(951,66,1,1,NULL,NULL),(952,28,1,1,NULL,NULL),(953,81,1,1,NULL,NULL),(954,40,1,1,NULL,NULL),(955,12,1,1,NULL,NULL),(956,22,1,1,NULL,NULL),(957,18,1,1,NULL,NULL),(958,43,1,1,NULL,NULL),(959,21,1,1,NULL,NULL),(960,42,1,1,NULL,NULL),(961,10,1,1,NULL,NULL),(962,82,1,1,NULL,NULL),(963,37,1,1,NULL,NULL),(964,7,1,1,NULL,NULL),(965,46,1,1,NULL,NULL),(2581,1,1,16,NULL,NULL),(2582,2,1,16,NULL,NULL),(2583,3,1,16,NULL,NULL),(2584,4,1,16,NULL,NULL),(2585,5,1,16,NULL,NULL),(2586,6,1,16,NULL,NULL),(2587,7,1,16,NULL,NULL),(2588,8,1,16,NULL,NULL),(2589,9,1,16,NULL,NULL),(2590,10,1,16,NULL,NULL),(2591,11,1,16,NULL,NULL),(2592,12,1,16,NULL,NULL),(2593,13,1,16,NULL,NULL),(2594,14,1,16,NULL,NULL),(2595,15,1,16,NULL,NULL),(2596,16,1,16,NULL,NULL),(2597,17,1,16,NULL,NULL),(2598,18,1,16,NULL,NULL),(2599,19,1,16,NULL,NULL),(2600,20,1,16,NULL,NULL),(2601,21,1,16,NULL,NULL),(2602,22,1,16,NULL,NULL),(2603,23,1,16,NULL,NULL),(2604,24,1,16,NULL,NULL),(2605,25,1,16,NULL,NULL),(2606,26,1,16,NULL,NULL),(2607,27,1,16,NULL,NULL),(2608,28,1,16,NULL,NULL),(2609,29,1,16,NULL,NULL),(2610,30,1,16,NULL,NULL),(2611,31,1,16,NULL,NULL),(2612,32,1,16,NULL,NULL),(2613,33,1,16,NULL,NULL),(2614,34,1,16,NULL,NULL),(2615,35,1,16,NULL,NULL),(2616,36,1,16,NULL,NULL),(2617,37,1,16,NULL,NULL),(2618,38,1,16,NULL,NULL),(2619,39,1,16,NULL,NULL),(2620,40,1,16,NULL,NULL),(2621,41,1,16,NULL,NULL),(2622,42,1,16,NULL,NULL),(2623,43,1,16,NULL,NULL),(2624,44,1,16,NULL,NULL),(2625,45,1,16,NULL,NULL),(2626,46,1,16,NULL,NULL),(2627,47,1,16,NULL,NULL),(2628,48,1,16,NULL,NULL),(2629,49,1,16,NULL,NULL),(2630,50,1,16,NULL,NULL),(2631,51,1,16,NULL,NULL),(2632,52,1,16,NULL,NULL),(2633,53,1,16,NULL,NULL),(2634,54,1,16,NULL,NULL),(2635,55,1,16,NULL,NULL),(2636,56,1,16,NULL,NULL),(2637,57,1,16,NULL,NULL),(2638,58,1,16,NULL,NULL),(2639,59,1,16,NULL,NULL),(2640,60,1,16,NULL,NULL),(2641,61,1,16,NULL,NULL),(2642,62,1,16,NULL,NULL),(2643,63,1,16,NULL,NULL),(2644,64,1,16,NULL,NULL),(2645,65,1,16,NULL,NULL),(2646,66,1,16,NULL,NULL),(2647,67,1,16,NULL,NULL),(2648,68,1,16,NULL,NULL),(2649,69,1,16,NULL,NULL),(2650,70,1,16,NULL,NULL),(2651,71,1,16,NULL,NULL),(2652,72,1,16,NULL,NULL),(2653,73,1,16,NULL,NULL),(2654,74,1,16,NULL,NULL),(2655,75,1,16,NULL,NULL),(2656,76,1,16,NULL,NULL),(2657,77,1,16,NULL,NULL),(2658,78,1,16,NULL,NULL),(2659,79,1,16,NULL,NULL),(2660,80,1,16,NULL,NULL),(2661,81,1,16,NULL,NULL),(2662,82,1,16,NULL,NULL),(2663,83,1,16,NULL,NULL),(2664,84,1,16,NULL,NULL),(2665,85,1,16,NULL,NULL),(3516,74,0,13,NULL,NULL),(3517,26,0,13,NULL,NULL),(3518,85,0,13,NULL,NULL),(3519,31,0,13,NULL,NULL),(3520,79,0,13,NULL,NULL),(3521,62,0,13,NULL,NULL),(3522,64,0,13,NULL,NULL),(3523,49,0,13,NULL,NULL),(3524,30,0,13,NULL,NULL),(3525,22,0,13,NULL,NULL),(3526,10,0,13,NULL,NULL),(3527,60,0,13,NULL,NULL),(3528,25,0,13,NULL,NULL),(3529,52,0,13,NULL,NULL),(3530,76,0,13,NULL,NULL),(3531,66,0,13,NULL,NULL),(3532,33,0,13,NULL,NULL),(3533,7,0,13,NULL,NULL),(3534,55,1,13,NULL,NULL),(3535,37,0,13,NULL,NULL),(3536,16,0,13,NULL,NULL),(3537,35,0,13,NULL,NULL),(3538,4,0,13,NULL,NULL),(3539,48,0,13,NULL,NULL),(3540,1,0,13,NULL,NULL),(3541,70,0,13,NULL,NULL),(3542,28,0,13,NULL,NULL),(3543,17,0,13,NULL,NULL),(3544,54,0,13,NULL,NULL),(3545,41,0,13,NULL,NULL),(3546,50,0,13,NULL,NULL),(3547,43,0,13,NULL,NULL),(3548,29,0,13,NULL,NULL),(3549,21,0,13,NULL,NULL),(3550,2,0,13,NULL,NULL),(3551,20,0,13,NULL,NULL),(3552,19,0,13,NULL,NULL),(3553,57,0,13,NULL,NULL),(3554,82,0,13,NULL,NULL),(3555,69,0,13,NULL,NULL),(3556,83,0,13,NULL,NULL),(3557,71,0,13,NULL,NULL),(3558,18,0,13,NULL,NULL),(3559,5,0,13,NULL,NULL),(3560,27,0,13,NULL,NULL),(3561,84,0,13,NULL,NULL),(3562,65,0,13,NULL,NULL),(3563,63,0,13,NULL,NULL),(3564,38,0,13,NULL,NULL),(3565,24,0,13,NULL,NULL),(3566,67,0,13,NULL,NULL),(3567,73,0,13,NULL,NULL),(3568,53,0,13,NULL,NULL),(3569,40,0,13,NULL,NULL),(3570,72,0,13,NULL,NULL),(3571,39,0,13,NULL,NULL),(3572,11,0,13,NULL,NULL),(3573,8,0,13,NULL,NULL),(3574,42,0,13,NULL,NULL),(3575,59,0,13,NULL,NULL),(3576,15,0,13,NULL,NULL),(3577,14,0,13,NULL,NULL),(3578,61,0,13,NULL,NULL),(3579,36,1,13,NULL,NULL),(3580,78,0,13,NULL,NULL),(3581,75,0,13,NULL,NULL),(3582,9,0,13,NULL,NULL),(3583,80,0,13,NULL,NULL),(3584,77,0,13,NULL,NULL),(3585,3,0,13,NULL,NULL),(3586,12,0,13,NULL,NULL),(3587,34,0,13,NULL,NULL),(3588,81,0,13,NULL,NULL),(3589,44,0,13,NULL,NULL),(3590,46,0,13,NULL,NULL),(3591,51,0,13,NULL,NULL),(3592,68,0,13,NULL,NULL),(3593,47,0,13,NULL,NULL),(3594,23,0,13,NULL,NULL),(3595,6,0,13,NULL,NULL),(3596,32,0,13,NULL,NULL),(3597,13,0,13,NULL,NULL),(3598,56,0,13,NULL,NULL),(3599,58,0,13,NULL,NULL),(3600,45,0,13,NULL,NULL),(5726,47,0,5,NULL,NULL),(5727,11,1,5,NULL,NULL),(5728,33,0,5,NULL,NULL),(5729,44,0,5,NULL,NULL),(5730,64,0,5,NULL,NULL),(5731,79,0,5,NULL,NULL),(5732,54,0,5,NULL,NULL),(5733,48,0,5,NULL,NULL),(5734,46,0,5,NULL,NULL),(5735,32,0,5,NULL,NULL),(5736,42,0,5,NULL,NULL),(5737,69,0,5,NULL,NULL),(5738,63,0,5,NULL,NULL),(5739,39,0,5,NULL,NULL),(5740,26,0,5,NULL,NULL),(5741,84,0,5,NULL,NULL),(5742,30,0,5,NULL,NULL),(5743,2,1,5,NULL,NULL),(5744,18,0,5,NULL,NULL),(5745,38,0,5,NULL,NULL),(5746,15,0,5,NULL,NULL),(5747,67,0,5,NULL,NULL),(5748,61,0,5,NULL,NULL),(5749,55,1,5,NULL,NULL),(5750,28,0,5,NULL,NULL),(5751,13,1,5,NULL,NULL),(5752,81,0,5,NULL,NULL),(5753,73,0,5,NULL,NULL),(5754,72,0,5,NULL,NULL),(5755,21,0,5,NULL,NULL),(5756,9,0,5,NULL,NULL),(5757,35,0,5,NULL,NULL),(5758,83,0,5,NULL,NULL),(5759,17,0,5,NULL,NULL),(5760,12,1,5,NULL,NULL),(5761,6,1,5,NULL,NULL),(5762,29,0,5,NULL,NULL),(5763,85,0,5,NULL,NULL),(5764,27,0,5,NULL,NULL),(5765,77,0,5,NULL,NULL),(5766,24,0,5,NULL,NULL),(5767,36,0,5,NULL,NULL),(5768,71,0,5,NULL,NULL),(5769,78,0,5,NULL,NULL),(5770,58,0,5,NULL,NULL),(5771,76,0,5,NULL,NULL),(5772,8,0,5,NULL,NULL),(5773,23,0,5,NULL,NULL),(5774,1,1,5,NULL,NULL),(5775,10,1,5,NULL,NULL),(5776,74,0,5,NULL,NULL),(5777,19,0,5,NULL,NULL),(5778,49,0,5,NULL,NULL),(5779,4,0,5,NULL,NULL),(5780,53,0,5,NULL,NULL),(5781,59,0,5,NULL,NULL),(5782,14,1,5,NULL,NULL),(5783,7,1,5,NULL,NULL),(5784,66,0,5,NULL,NULL),(5785,62,0,5,NULL,NULL),(5786,56,0,5,NULL,NULL),(5787,82,0,5,NULL,NULL),(5788,20,0,5,NULL,NULL),(5789,51,0,5,NULL,NULL),(5790,50,1,5,NULL,NULL),(5791,60,0,5,NULL,NULL),(5792,22,0,5,NULL,NULL),(5793,16,0,5,NULL,NULL),(5794,57,0,5,NULL,NULL),(5795,65,0,5,NULL,NULL),(5796,3,0,5,NULL,NULL),(5797,52,0,5,NULL,NULL),(5798,43,0,5,NULL,NULL),(5799,70,0,5,NULL,NULL),(5800,31,0,5,NULL,NULL),(5801,40,0,5,NULL,NULL),(5802,68,0,5,NULL,NULL),(5803,80,0,5,NULL,NULL),(5804,37,0,5,NULL,NULL),(5805,5,0,5,NULL,NULL),(5806,75,0,5,NULL,NULL),(5807,41,0,5,NULL,NULL),(5808,34,0,5,NULL,NULL),(5809,25,0,5,NULL,NULL),(5810,45,0,5,NULL,NULL),(6576,69,0,6,NULL,NULL),(6577,38,0,6,NULL,NULL),(6578,63,0,6,NULL,NULL),(6579,24,1,6,NULL,NULL),(6580,78,0,6,NULL,NULL),(6581,62,0,6,NULL,NULL),(6582,21,1,6,NULL,NULL),(6583,14,0,6,NULL,NULL),(6584,43,0,6,NULL,NULL),(6585,82,0,6,NULL,NULL),(6586,28,0,6,NULL,NULL),(6587,57,0,6,NULL,NULL),(6588,19,1,6,NULL,NULL),(6589,42,0,6,NULL,NULL),(6590,41,0,6,NULL,NULL),(6591,22,1,6,NULL,NULL),(6592,3,0,6,NULL,NULL),(6593,58,0,6,NULL,NULL),(6594,2,0,6,NULL,NULL),(6595,84,0,6,NULL,NULL),(6596,6,0,6,NULL,NULL),(6597,33,0,6,NULL,NULL),(6598,4,0,6,NULL,NULL),(6599,52,0,6,NULL,NULL),(6600,75,0,6,NULL,NULL),(6601,64,0,6,NULL,NULL),(6602,11,0,6,NULL,NULL),(6603,68,0,6,NULL,NULL),(6604,25,1,6,NULL,NULL),(6605,72,0,6,NULL,NULL),(6606,74,0,6,NULL,NULL),(6607,51,0,6,NULL,NULL),(6608,40,0,6,NULL,NULL),(6609,5,0,6,NULL,NULL),(6610,39,0,6,NULL,NULL),(6611,1,0,6,NULL,NULL),(6612,66,0,6,NULL,NULL),(6613,45,0,6,NULL,NULL),(6614,18,1,6,NULL,NULL),(6615,29,1,6,NULL,NULL),(6616,71,0,6,NULL,NULL),(6617,36,0,6,NULL,NULL),(6618,7,0,6,NULL,NULL),(6619,76,0,6,NULL,NULL),(6620,8,0,6,NULL,NULL),(6621,67,0,6,NULL,NULL),(6622,53,0,6,NULL,NULL),(6623,16,1,6,NULL,NULL),(6624,56,0,6,NULL,NULL),(6625,13,0,6,NULL,NULL),(6626,27,0,6,NULL,NULL),(6627,65,0,6,NULL,NULL),(6628,60,0,6,NULL,NULL),(6629,20,1,6,NULL,NULL),(6630,61,0,6,NULL,NULL),(6631,48,0,6,NULL,NULL),(6632,26,0,6,NULL,NULL),(6633,15,1,6,NULL,NULL),(6634,73,0,6,NULL,NULL),(6635,46,0,6,NULL,NULL),(6636,44,0,6,NULL,NULL),(6637,47,0,6,NULL,NULL),(6638,70,0,6,NULL,NULL),(6639,17,1,6,NULL,NULL),(6640,80,0,6,NULL,NULL),(6641,9,0,6,NULL,NULL),(6642,49,0,6,NULL,NULL),(6643,37,0,6,NULL,NULL),(6644,23,1,6,NULL,NULL),(6645,12,0,6,NULL,NULL),(6646,32,0,6,NULL,NULL),(6647,59,0,6,NULL,NULL),(6648,50,0,6,NULL,NULL),(6649,83,0,6,NULL,NULL),(6650,34,0,6,NULL,NULL),(6651,10,0,6,NULL,NULL),(6652,55,1,6,NULL,NULL),(6653,77,0,6,NULL,NULL),(6654,31,1,6,NULL,NULL),(6655,81,0,6,NULL,NULL),(6656,54,0,6,NULL,NULL),(6657,35,0,6,NULL,NULL),(6658,30,0,6,NULL,NULL),(6659,85,0,6,NULL,NULL),(6660,79,0,6,NULL,NULL),(6831,36,0,9,NULL,NULL),(6832,39,0,9,NULL,NULL),(6833,74,0,9,NULL,NULL),(6834,21,0,9,NULL,NULL),(6835,40,0,9,NULL,NULL),(6836,65,0,9,NULL,NULL),(6837,83,0,9,NULL,NULL),(6838,80,0,9,NULL,NULL),(6839,79,0,9,NULL,NULL),(6840,84,0,9,NULL,NULL),(6841,64,0,9,NULL,NULL),(6842,33,0,9,NULL,NULL),(6843,19,1,9,NULL,NULL),(6844,75,0,9,NULL,NULL),(6845,67,0,9,NULL,NULL),(6846,63,0,9,NULL,NULL),(6847,9,0,9,NULL,NULL),(6848,7,0,9,NULL,NULL),(6849,35,0,9,NULL,NULL),(6850,13,0,9,NULL,NULL),(6851,57,0,9,NULL,NULL),(6852,53,0,9,NULL,NULL),(6853,31,0,9,NULL,NULL),(6854,20,0,9,NULL,NULL),(6855,34,0,9,NULL,NULL),(6856,18,0,9,NULL,NULL),(6857,41,0,9,NULL,NULL),(6858,23,0,9,NULL,NULL),(6859,76,0,9,NULL,NULL),(6860,2,0,9,NULL,NULL),(6861,72,0,9,NULL,NULL),(6862,16,0,9,NULL,NULL),(6863,68,0,9,NULL,NULL),(6864,4,0,9,NULL,NULL),(6865,1,0,9,NULL,NULL),(6866,10,0,9,NULL,NULL),(6867,60,0,9,NULL,NULL),(6868,28,0,9,NULL,NULL),(6869,26,1,9,NULL,NULL),(6870,14,0,9,NULL,NULL),(6871,3,0,9,NULL,NULL),(6872,71,0,9,NULL,NULL),(6873,47,0,9,NULL,NULL),(6874,69,0,9,NULL,NULL),(6875,54,0,9,NULL,NULL),(6876,77,0,9,NULL,NULL),(6877,44,0,9,NULL,NULL),(6878,49,0,9,NULL,NULL),(6879,51,0,9,NULL,NULL),(6880,45,0,9,NULL,NULL),(6881,12,0,9,NULL,NULL),(6882,48,0,9,NULL,NULL),(6883,30,0,9,NULL,NULL),(6884,15,0,9,NULL,NULL),(6885,81,0,9,NULL,NULL),(6886,6,0,9,NULL,NULL),(6887,62,0,9,NULL,NULL),(6888,43,0,9,NULL,NULL),(6889,29,0,9,NULL,NULL),(6890,5,0,9,NULL,NULL),(6891,50,0,9,NULL,NULL),(6892,27,1,9,NULL,NULL),(6893,11,0,9,NULL,NULL),(6894,38,0,9,NULL,NULL),(6895,70,0,9,NULL,NULL),(6896,78,0,9,NULL,NULL),(6897,85,0,9,NULL,NULL),(6898,24,0,9,NULL,NULL),(6899,8,0,9,NULL,NULL),(6900,73,0,9,NULL,NULL),(6901,17,0,9,NULL,NULL),(6902,59,0,9,NULL,NULL),(6903,66,0,9,NULL,NULL),(6904,52,0,9,NULL,NULL),(6905,25,1,9,NULL,NULL),(6906,42,0,9,NULL,NULL),(6907,82,0,9,NULL,NULL),(6908,61,0,9,NULL,NULL),(6909,22,0,9,NULL,NULL),(6910,58,0,9,NULL,NULL),(6911,56,0,9,NULL,NULL),(6912,32,0,9,NULL,NULL),(6913,55,1,9,NULL,NULL),(6914,46,0,9,NULL,NULL),(6915,37,0,9,NULL,NULL),(7001,80,0,11,NULL,NULL),(7002,19,0,11,NULL,NULL),(7003,55,1,11,NULL,NULL),(7004,46,0,11,NULL,NULL),(7005,16,0,11,NULL,NULL),(7006,73,0,11,NULL,NULL),(7007,1,0,11,NULL,NULL),(7008,8,0,11,NULL,NULL),(7009,63,0,11,NULL,NULL),(7010,48,0,11,NULL,NULL),(7011,47,0,11,NULL,NULL),(7012,9,0,11,NULL,NULL),(7013,62,0,11,NULL,NULL),(7014,11,0,11,NULL,NULL),(7015,30,0,11,NULL,NULL),(7016,5,0,11,NULL,NULL),(7017,65,0,11,NULL,NULL),(7018,33,1,11,NULL,NULL),(7019,60,0,11,NULL,NULL),(7020,68,0,11,NULL,NULL),(7021,58,0,11,NULL,NULL),(7022,10,0,11,NULL,NULL),(7023,22,0,11,NULL,NULL),(7024,74,0,11,NULL,NULL),(7025,4,1,11,NULL,NULL),(7026,35,1,11,NULL,NULL),(7027,14,0,11,NULL,NULL),(7028,69,0,11,NULL,NULL),(7029,50,0,11,NULL,NULL),(7030,83,0,11,NULL,NULL),(7031,43,0,11,NULL,NULL),(7032,66,0,11,NULL,NULL),(7033,7,0,11,NULL,NULL),(7034,52,0,11,NULL,NULL),(7035,64,0,11,NULL,NULL),(7036,24,0,11,NULL,NULL),(7037,34,1,11,NULL,NULL),(7038,59,0,11,NULL,NULL),(7039,56,0,11,NULL,NULL),(7040,71,0,11,NULL,NULL),(7041,3,0,11,NULL,NULL),(7042,45,0,11,NULL,NULL),(7043,51,0,11,NULL,NULL),(7044,75,0,11,NULL,NULL),(7045,78,0,11,NULL,NULL),(7046,42,0,11,NULL,NULL),(7047,17,0,11,NULL,NULL),(7048,41,0,11,NULL,NULL),(7049,31,0,11,NULL,NULL),(7050,21,0,11,NULL,NULL),(7051,79,0,11,NULL,NULL),(7052,57,0,11,NULL,NULL),(7053,27,0,11,NULL,NULL),(7054,15,0,11,NULL,NULL),(7055,61,0,11,NULL,NULL),(7056,82,0,11,NULL,NULL),(7057,12,0,11,NULL,NULL),(7058,26,1,11,NULL,NULL),(7059,20,0,11,NULL,NULL),(7060,81,0,11,NULL,NULL),(7061,49,0,11,NULL,NULL),(7062,53,0,11,NULL,NULL),(7063,32,1,11,NULL,NULL),(7064,39,0,11,NULL,NULL),(7065,6,0,11,NULL,NULL),(7066,37,1,11,NULL,NULL),(7067,76,0,11,NULL,NULL),(7068,84,0,11,NULL,NULL),(7069,77,0,11,NULL,NULL),(7070,36,0,11,NULL,NULL),(7071,23,0,11,NULL,NULL),(7072,70,0,11,NULL,NULL),(7073,2,0,11,NULL,NULL),(7074,85,0,11,NULL,NULL),(7075,72,0,11,NULL,NULL),(7076,54,0,11,NULL,NULL),(7077,18,0,11,NULL,NULL),(7078,44,0,11,NULL,NULL),(7079,38,0,11,NULL,NULL),(7080,13,0,11,NULL,NULL),(7081,67,0,11,NULL,NULL),(7082,25,0,11,NULL,NULL),(7083,29,0,11,NULL,NULL),(7084,28,0,11,NULL,NULL),(7085,40,0,11,NULL,NULL),(7256,64,0,15,NULL,NULL),(7257,42,0,15,NULL,NULL),(7258,17,1,15,NULL,NULL),(7259,38,0,15,NULL,NULL),(7260,33,1,15,NULL,NULL),(7261,62,0,15,NULL,NULL),(7262,26,1,15,NULL,NULL),(7263,68,0,15,NULL,NULL),(7264,35,1,15,NULL,NULL),(7265,55,1,15,NULL,NULL),(7266,71,0,15,NULL,NULL),(7267,37,1,15,NULL,NULL),(7268,10,1,15,NULL,NULL),(7269,60,0,15,NULL,NULL),(7270,70,0,15,NULL,NULL),(7271,19,1,15,NULL,NULL),(7272,51,0,15,NULL,NULL),(7273,6,1,15,NULL,NULL),(7274,78,0,15,NULL,NULL),(7275,74,0,15,NULL,NULL),(7276,61,0,15,NULL,NULL),(7277,63,0,15,NULL,NULL),(7278,65,0,15,NULL,NULL),(7279,67,0,15,NULL,NULL),(7280,32,1,15,NULL,NULL),(7281,28,1,15,NULL,NULL),(7282,52,0,15,NULL,NULL),(7283,5,1,15,NULL,NULL),(7284,85,0,15,NULL,NULL),(7285,23,1,15,NULL,NULL),(7286,77,0,15,NULL,NULL),(7287,13,1,15,NULL,NULL),(7288,36,1,15,NULL,NULL),(7289,45,0,15,NULL,NULL),(7290,69,0,15,NULL,NULL),(7291,39,0,15,NULL,NULL),(7292,43,0,15,NULL,NULL),(7293,22,1,15,NULL,NULL),(7294,80,0,15,NULL,NULL),(7295,72,0,15,NULL,NULL),(7296,75,0,15,NULL,NULL),(7297,20,1,15,NULL,NULL),(7298,76,0,15,NULL,NULL),(7299,25,1,15,NULL,NULL),(7300,82,0,15,NULL,NULL),(7301,30,1,15,NULL,NULL),(7302,8,1,15,NULL,NULL),(7303,48,0,15,NULL,NULL),(7304,49,0,15,NULL,NULL),(7305,27,1,15,NULL,NULL),(7306,59,0,15,NULL,NULL),(7307,56,0,15,NULL,NULL),(7308,53,1,15,NULL,NULL),(7309,7,1,15,NULL,NULL),(7310,54,1,15,NULL,NULL),(7311,84,0,15,NULL,NULL),(7312,47,0,15,NULL,NULL),(7313,9,1,15,NULL,NULL),(7314,44,0,15,NULL,NULL),(7315,46,0,15,NULL,NULL),(7316,12,1,15,NULL,NULL),(7317,57,0,15,NULL,NULL),(7318,31,1,15,NULL,NULL),(7319,29,1,15,NULL,NULL),(7320,50,0,15,NULL,NULL),(7321,79,0,15,NULL,NULL),(7322,34,1,15,NULL,NULL),(7323,11,1,15,NULL,NULL),(7324,81,0,15,NULL,NULL),(7325,40,0,15,NULL,NULL),(7326,24,1,15,NULL,NULL),(7327,2,1,15,NULL,NULL),(7328,4,1,15,NULL,NULL),(7329,14,1,15,NULL,NULL),(7330,18,1,15,NULL,NULL),(7331,83,0,15,NULL,NULL),(7332,21,1,15,NULL,NULL),(7333,3,1,15,NULL,NULL),(7334,58,0,15,NULL,NULL),(7335,66,0,15,NULL,NULL),(7336,16,1,15,NULL,NULL),(7337,73,0,15,NULL,NULL),(7338,15,1,15,NULL,NULL),(7339,1,1,15,NULL,NULL),(7340,41,0,15,NULL,NULL),(7596,72,0,10,NULL,NULL),(7597,74,0,10,NULL,NULL),(7598,32,1,10,NULL,NULL),(7599,41,0,10,NULL,NULL),(7600,12,0,10,NULL,NULL),(7601,52,0,10,NULL,NULL),(7602,15,0,10,NULL,NULL),(7603,82,1,10,NULL,NULL),(7604,77,0,10,NULL,NULL),(7605,26,1,10,NULL,NULL),(7606,70,0,10,NULL,NULL),(7607,51,0,10,NULL,NULL),(7608,65,0,10,NULL,NULL),(7609,50,0,10,NULL,NULL),(7610,80,0,10,NULL,NULL),(7611,67,0,10,NULL,NULL),(7612,54,0,10,NULL,NULL),(7613,39,0,10,NULL,NULL),(7614,84,1,10,NULL,NULL),(7615,11,0,10,NULL,NULL),(7616,53,0,10,NULL,NULL),(7617,21,0,10,NULL,NULL),(7618,29,1,10,NULL,NULL),(7619,62,0,10,NULL,NULL),(7620,73,0,10,NULL,NULL),(7621,24,0,10,NULL,NULL),(7622,5,1,10,NULL,NULL),(7623,85,0,10,NULL,NULL),(7624,55,1,10,NULL,NULL),(7625,16,0,10,NULL,NULL),(7626,81,1,10,NULL,NULL),(7627,71,0,10,NULL,NULL),(7628,8,0,10,NULL,NULL),(7629,18,0,10,NULL,NULL),(7630,48,0,10,NULL,NULL),(7631,37,1,10,NULL,NULL),(7632,31,1,10,NULL,NULL),(7633,6,0,10,NULL,NULL),(7634,76,0,10,NULL,NULL),(7635,61,0,10,NULL,NULL),(7636,68,0,10,NULL,NULL),(7637,33,1,10,NULL,NULL),(7638,30,0,10,NULL,NULL),(7639,23,0,10,NULL,NULL),(7640,25,0,10,NULL,NULL),(7641,79,0,10,NULL,NULL),(7642,46,0,10,NULL,NULL),(7643,66,0,10,NULL,NULL),(7644,60,0,10,NULL,NULL),(7645,35,1,10,NULL,NULL),(7646,45,0,10,NULL,NULL),(7647,56,0,10,NULL,NULL),(7648,49,0,10,NULL,NULL),(7649,47,0,10,NULL,NULL),(7650,19,0,10,NULL,NULL),(7651,7,0,10,NULL,NULL),(7652,63,0,10,NULL,NULL),(7653,40,0,10,NULL,NULL),(7654,43,0,10,NULL,NULL),(7655,42,0,10,NULL,NULL),(7656,13,0,10,NULL,NULL),(7657,78,0,10,NULL,NULL),(7658,9,1,10,NULL,NULL),(7659,22,0,10,NULL,NULL),(7660,59,0,10,NULL,NULL),(7661,20,0,10,NULL,NULL),(7662,57,0,10,NULL,NULL),(7663,36,1,10,NULL,NULL),(7664,44,0,10,NULL,NULL),(7665,64,0,10,NULL,NULL),(7666,4,1,10,NULL,NULL),(7667,2,0,10,NULL,NULL),(7668,38,0,10,NULL,NULL),(7669,17,0,10,NULL,NULL),(7670,58,0,10,NULL,NULL),(7671,1,0,10,NULL,NULL),(7672,75,0,10,NULL,NULL),(7673,27,0,10,NULL,NULL),(7674,34,1,10,NULL,NULL),(7675,3,1,10,NULL,NULL),(7676,10,0,10,NULL,NULL),(7677,83,1,10,NULL,NULL),(7678,69,0,10,NULL,NULL),(7679,28,0,10,NULL,NULL),(7680,14,0,10,NULL,NULL),(8191,69,0,12,NULL,NULL),(8192,3,0,12,NULL,NULL),(8193,2,0,12,NULL,NULL),(8194,31,0,12,NULL,NULL),(8195,51,0,12,NULL,NULL),(8196,13,0,12,NULL,NULL),(8197,10,0,12,NULL,NULL),(8198,71,0,12,NULL,NULL),(8199,5,0,12,NULL,NULL),(8200,80,0,12,NULL,NULL),(8201,83,0,12,NULL,NULL),(8202,49,0,12,NULL,NULL),(8203,15,0,12,NULL,NULL),(8204,6,0,12,NULL,NULL),(8205,59,0,12,NULL,NULL),(8206,66,0,12,NULL,NULL),(8207,65,0,12,NULL,NULL),(8208,70,0,12,NULL,NULL),(8209,12,0,12,NULL,NULL),(8210,54,0,12,NULL,NULL),(8211,23,0,12,NULL,NULL),(8212,53,0,12,NULL,NULL),(8213,84,0,12,NULL,NULL),(8214,33,1,12,NULL,NULL),(8215,68,0,12,NULL,NULL),(8216,29,0,12,NULL,NULL),(8217,46,0,12,NULL,NULL),(8218,41,0,12,NULL,NULL),(8219,45,0,12,NULL,NULL),(8220,25,0,12,NULL,NULL),(8221,4,0,12,NULL,NULL),(8222,32,1,12,NULL,NULL),(8223,52,0,12,NULL,NULL),(8224,28,0,12,NULL,NULL),(8225,27,0,12,NULL,NULL),(8226,62,0,12,NULL,NULL),(8227,9,0,12,NULL,NULL),(8228,72,0,12,NULL,NULL),(8229,67,0,12,NULL,NULL),(8230,50,0,12,NULL,NULL),(8231,44,0,12,NULL,NULL),(8232,18,0,12,NULL,NULL),(8233,60,0,12,NULL,NULL),(8234,26,0,12,NULL,NULL),(8235,8,0,12,NULL,NULL),(8236,56,0,12,NULL,NULL),(8237,48,0,12,NULL,NULL),(8238,75,0,12,NULL,NULL),(8239,11,0,12,NULL,NULL),(8240,35,0,12,NULL,NULL),(8241,57,0,12,NULL,NULL),(8242,1,0,12,NULL,NULL),(8243,82,0,12,NULL,NULL),(8244,22,0,12,NULL,NULL),(8245,40,0,12,NULL,NULL),(8246,38,0,12,NULL,NULL),(8247,20,0,12,NULL,NULL),(8248,16,0,12,NULL,NULL),(8249,39,0,12,NULL,NULL),(8250,14,0,12,NULL,NULL),(8251,17,0,12,NULL,NULL),(8252,58,0,12,NULL,NULL),(8253,42,0,12,NULL,NULL),(8254,21,0,12,NULL,NULL),(8255,78,0,12,NULL,NULL),(8256,55,1,12,NULL,NULL),(8257,30,0,12,NULL,NULL),(8258,77,0,12,NULL,NULL),(8259,24,0,12,NULL,NULL),(8260,43,0,12,NULL,NULL),(8261,7,0,12,NULL,NULL),(8262,37,1,12,NULL,NULL),(8263,79,0,12,NULL,NULL),(8264,74,0,12,NULL,NULL),(8265,81,0,12,NULL,NULL),(8266,73,0,12,NULL,NULL),(8267,85,0,12,NULL,NULL),(8268,61,0,12,NULL,NULL),(8269,19,0,12,NULL,NULL),(8270,76,0,12,NULL,NULL),(8271,64,0,12,NULL,NULL),(8272,63,0,12,NULL,NULL),(8273,47,0,12,NULL,NULL),(8274,36,1,12,NULL,NULL),(8275,34,1,12,NULL,NULL),(8276,67,0,8,NULL,NULL),(8277,39,0,8,NULL,NULL),(8278,18,0,8,NULL,NULL),(8279,46,0,8,NULL,NULL),(8280,53,0,8,NULL,NULL),(8281,81,0,8,NULL,NULL),(8282,4,0,8,NULL,NULL),(8283,26,1,8,NULL,NULL),(8284,28,1,8,NULL,NULL),(8285,12,0,8,NULL,NULL),(8286,6,0,8,NULL,NULL),(8287,20,0,8,NULL,NULL),(8288,10,0,8,NULL,NULL),(8289,80,0,8,NULL,NULL),(8290,68,0,8,NULL,NULL),(8291,34,0,8,NULL,NULL),(8292,65,0,8,NULL,NULL),(8293,50,0,8,NULL,NULL),(8294,47,0,8,NULL,NULL),(8295,77,0,8,NULL,NULL),(8296,43,0,8,NULL,NULL),(8297,45,0,8,NULL,NULL),(8298,42,0,8,NULL,NULL),(8299,60,0,8,NULL,NULL),(8300,19,1,8,NULL,NULL),(8301,37,1,8,NULL,NULL),(8302,3,0,8,NULL,NULL),(8303,73,0,8,NULL,NULL),(8304,82,0,8,NULL,NULL),(8305,1,0,8,NULL,NULL),(8306,74,0,8,NULL,NULL),(8307,23,0,8,NULL,NULL),(8308,44,0,8,NULL,NULL),(8309,54,0,8,NULL,NULL),(8310,14,0,8,NULL,NULL),(8311,11,0,8,NULL,NULL),(8312,5,0,8,NULL,NULL),(8313,38,0,8,NULL,NULL),(8314,79,0,8,NULL,NULL),(8315,70,0,8,NULL,NULL),(8316,51,0,8,NULL,NULL),(8317,41,0,8,NULL,NULL),(8318,21,1,8,NULL,NULL),(8319,72,0,8,NULL,NULL),(8320,13,0,8,NULL,NULL),(8321,55,1,8,NULL,NULL),(8322,25,1,8,NULL,NULL),(8323,56,0,8,NULL,NULL),(8324,40,0,8,NULL,NULL),(8325,29,1,8,NULL,NULL),(8326,16,0,8,NULL,NULL),(8327,36,0,8,NULL,NULL),(8328,30,0,8,NULL,NULL),(8329,58,0,8,NULL,NULL),(8330,15,0,8,NULL,NULL),(8331,49,0,8,NULL,NULL),(8332,66,0,8,NULL,NULL),(8333,84,0,8,NULL,NULL),(8334,52,0,8,NULL,NULL),(8335,22,0,8,NULL,NULL),(8336,17,1,8,NULL,NULL),(8337,64,0,8,NULL,NULL),(8338,7,0,8,NULL,NULL),(8339,59,0,8,NULL,NULL),(8340,57,0,8,NULL,NULL),(8341,83,0,8,NULL,NULL),(8342,27,1,8,NULL,NULL),(8343,71,0,8,NULL,NULL),(8344,78,0,8,NULL,NULL),(8345,63,0,8,NULL,NULL),(8346,33,0,8,NULL,NULL),(8347,48,0,8,NULL,NULL),(8348,31,1,8,NULL,NULL),(8349,69,0,8,NULL,NULL),(8350,62,0,8,NULL,NULL),(8351,8,0,8,NULL,NULL),(8352,24,0,8,NULL,NULL),(8353,85,0,8,NULL,NULL),(8354,75,0,8,NULL,NULL),(8355,35,0,8,NULL,NULL),(8356,32,1,8,NULL,NULL),(8357,61,0,8,NULL,NULL),(8358,9,0,8,NULL,NULL),(8359,2,0,8,NULL,NULL),(8360,76,0,8,NULL,NULL),(8531,40,0,14,NULL,NULL),(8532,82,1,14,NULL,NULL),(8533,35,1,14,NULL,NULL),(8534,9,1,14,NULL,NULL),(8535,36,1,14,NULL,NULL),(8536,78,0,14,NULL,NULL),(8537,6,1,14,NULL,NULL),(8538,62,0,14,NULL,NULL),(8539,58,0,14,NULL,NULL),(8540,34,1,14,NULL,NULL),(8541,14,1,14,NULL,NULL),(8542,11,1,14,NULL,NULL),(8543,72,0,14,NULL,NULL),(8544,13,1,14,NULL,NULL),(8545,49,0,14,NULL,NULL),(8546,44,0,14,NULL,NULL),(8547,67,0,14,NULL,NULL),(8548,76,0,14,NULL,NULL),(8549,51,0,14,NULL,NULL),(8550,31,1,14,NULL,NULL),(8551,80,0,14,NULL,NULL),(8552,43,0,14,NULL,NULL),(8553,52,0,14,NULL,NULL),(8554,74,0,14,NULL,NULL),(8555,68,0,14,NULL,NULL),(8556,8,1,14,NULL,NULL),(8557,37,1,14,NULL,NULL),(8558,27,1,14,NULL,NULL),(8559,12,1,14,NULL,NULL),(8560,69,0,14,NULL,NULL),(8561,15,1,14,NULL,NULL),(8562,47,0,14,NULL,NULL),(8563,65,0,14,NULL,NULL),(8564,85,1,14,NULL,NULL),(8565,24,1,14,NULL,NULL),(8566,1,1,14,NULL,NULL),(8567,81,1,14,NULL,NULL),(8568,39,0,14,NULL,NULL),(8569,57,0,14,NULL,NULL),(8570,55,1,14,NULL,NULL),(8571,17,1,14,NULL,NULL),(8572,29,1,14,NULL,NULL),(8573,53,0,14,NULL,NULL),(8574,4,1,14,NULL,NULL),(8575,84,1,14,NULL,NULL),(8576,77,0,14,NULL,NULL),(8577,32,1,14,NULL,NULL),(8578,59,0,14,NULL,NULL),(8579,71,0,14,NULL,NULL),(8580,5,1,14,NULL,NULL),(8581,21,1,14,NULL,NULL),(8582,45,0,14,NULL,NULL),(8583,18,1,14,NULL,NULL),(8584,38,0,14,NULL,NULL),(8585,75,0,14,NULL,NULL),(8586,42,0,14,NULL,NULL),(8587,3,1,14,NULL,NULL),(8588,61,0,14,NULL,NULL),(8589,23,1,14,NULL,NULL),(8590,7,1,14,NULL,NULL),(8591,66,0,14,NULL,NULL),(8592,54,1,14,NULL,NULL),(8593,22,1,14,NULL,NULL),(8594,73,0,14,NULL,NULL),(8595,26,1,14,NULL,NULL),(8596,30,0,14,NULL,NULL),(8597,28,1,14,NULL,NULL),(8598,56,0,14,NULL,NULL),(8599,25,1,14,NULL,NULL),(8600,19,1,14,NULL,NULL),(8601,83,1,14,NULL,NULL),(8602,64,1,14,NULL,NULL),(8603,16,1,14,NULL,NULL),(8604,63,0,14,NULL,NULL),(8605,41,0,14,NULL,NULL),(8606,2,1,14,NULL,NULL),(8607,70,0,14,NULL,NULL),(8608,46,0,14,NULL,NULL),(8609,33,1,14,NULL,NULL),(8610,60,0,14,NULL,NULL),(8611,48,0,14,NULL,NULL),(8612,20,1,14,NULL,NULL),(8613,50,0,14,NULL,NULL),(8614,10,1,14,NULL,NULL),(8615,79,0,14,NULL,NULL),(8616,29,0,3,NULL,NULL),(8617,14,1,3,NULL,NULL),(8618,81,0,3,NULL,NULL),(8619,71,0,3,NULL,NULL),(8620,11,0,3,NULL,NULL),(8621,74,0,3,NULL,NULL),(8622,8,1,3,NULL,NULL),(8623,2,1,3,NULL,NULL),(8624,64,0,3,NULL,NULL),(8625,49,0,3,NULL,NULL),(8626,19,0,3,NULL,NULL),(8627,84,0,3,NULL,NULL),(8628,1,1,3,NULL,NULL),(8629,59,0,3,NULL,NULL),(8630,15,0,3,NULL,NULL),(8631,18,0,3,NULL,NULL),(8632,61,0,3,NULL,NULL),(8633,20,0,3,NULL,NULL),(8634,41,0,3,NULL,NULL),(8635,33,0,3,NULL,NULL),(8636,54,0,3,NULL,NULL),(8637,58,0,3,NULL,NULL),(8638,57,0,3,NULL,NULL),(8639,66,0,3,NULL,NULL),(8640,37,0,3,NULL,NULL),(8641,52,0,3,NULL,NULL),(8642,32,1,3,NULL,NULL),(8643,30,0,3,NULL,NULL),(8644,35,0,3,NULL,NULL),(8645,13,0,3,NULL,NULL),(8646,55,1,3,NULL,NULL),(8647,45,0,3,NULL,NULL),(8648,21,0,3,NULL,NULL),(8649,39,0,3,NULL,NULL),(8650,85,0,3,NULL,NULL),(8651,23,0,3,NULL,NULL),(8652,27,0,3,NULL,NULL),(8653,17,0,3,NULL,NULL),(8654,12,1,3,NULL,NULL),(8655,76,0,3,NULL,NULL),(8656,56,0,3,NULL,NULL),(8657,6,1,3,NULL,NULL),(8658,31,1,3,NULL,NULL),(8659,3,1,3,NULL,NULL),(8660,82,0,3,NULL,NULL),(8661,70,0,3,NULL,NULL),(8662,7,0,3,NULL,NULL),(8663,68,0,3,NULL,NULL),(8664,75,0,3,NULL,NULL),(8665,36,0,3,NULL,NULL),(8666,26,0,3,NULL,NULL),(8667,43,0,3,NULL,NULL),(8668,22,0,3,NULL,NULL),(8669,72,0,3,NULL,NULL),(8670,47,0,3,NULL,NULL),(8671,77,0,3,NULL,NULL),(8672,65,0,3,NULL,NULL),(8673,42,0,3,NULL,NULL),(8674,60,0,3,NULL,NULL),(8675,4,1,3,NULL,NULL),(8676,67,0,3,NULL,NULL),(8677,34,0,3,NULL,NULL),(8678,28,0,3,NULL,NULL),(8679,78,0,3,NULL,NULL),(8680,10,1,3,NULL,NULL),(8681,44,0,3,NULL,NULL),(8682,40,0,3,NULL,NULL),(8683,24,0,3,NULL,NULL),(8684,73,0,3,NULL,NULL),(8685,83,0,3,NULL,NULL),(8686,51,0,3,NULL,NULL),(8687,48,0,3,NULL,NULL),(8688,69,0,3,NULL,NULL),(8689,53,0,3,NULL,NULL),(8690,38,0,3,NULL,NULL),(8691,16,0,3,NULL,NULL),(8692,63,0,3,NULL,NULL),(8693,79,0,3,NULL,NULL),(8694,62,0,3,NULL,NULL),(8695,46,0,3,NULL,NULL),(8696,80,0,3,NULL,NULL),(8697,50,0,3,NULL,NULL),(8698,5,1,3,NULL,NULL),(8699,25,0,3,NULL,NULL),(8700,9,1,3,NULL,NULL),(8701,29,0,2,NULL,NULL),(8702,49,0,2,NULL,NULL),(8703,66,0,2,NULL,NULL),(8704,73,0,2,NULL,NULL),(8705,53,0,2,NULL,NULL),(8706,21,0,2,NULL,NULL),(8707,3,1,2,NULL,NULL),(8708,14,1,2,NULL,NULL),(8709,40,0,2,NULL,NULL),(8710,8,1,2,NULL,NULL),(8711,77,0,2,NULL,NULL),(8712,42,0,2,NULL,NULL),(8713,15,0,2,NULL,NULL),(8714,71,0,2,NULL,NULL),(8715,70,0,2,NULL,NULL),(8716,83,0,2,NULL,NULL),(8717,63,0,2,NULL,NULL),(8718,45,0,2,NULL,NULL),(8719,1,1,2,NULL,NULL),(8720,85,0,2,NULL,NULL),(8721,2,0,2,NULL,NULL),(8722,9,1,2,NULL,NULL),(8723,64,0,2,NULL,NULL),(8724,61,0,2,NULL,NULL),(8725,13,0,2,NULL,NULL),(8726,30,0,2,NULL,NULL),(8727,84,0,2,NULL,NULL),(8728,69,0,2,NULL,NULL),(8729,19,0,2,NULL,NULL),(8730,7,0,2,NULL,NULL),(8731,6,1,2,NULL,NULL),(8732,47,0,2,NULL,NULL),(8733,80,0,2,NULL,NULL),(8734,54,0,2,NULL,NULL),(8735,46,0,2,NULL,NULL),(8736,23,0,2,NULL,NULL),(8737,39,0,2,NULL,NULL),(8738,51,0,2,NULL,NULL),(8739,41,0,2,NULL,NULL),(8740,60,0,2,NULL,NULL),(8741,48,0,2,NULL,NULL),(8742,57,0,2,NULL,NULL),(8743,31,0,2,NULL,NULL),(8744,37,0,2,NULL,NULL),(8745,22,0,2,NULL,NULL),(8746,67,0,2,NULL,NULL),(8747,56,0,2,NULL,NULL),(8748,18,0,2,NULL,NULL),(8749,76,0,2,NULL,NULL),(8750,28,0,2,NULL,NULL),(8751,10,1,2,NULL,NULL),(8752,44,0,2,NULL,NULL),(8753,50,0,2,NULL,NULL),(8754,62,0,2,NULL,NULL),(8755,25,0,2,NULL,NULL),(8756,79,0,2,NULL,NULL),(8757,65,0,2,NULL,NULL),(8758,36,0,2,NULL,NULL),(8759,4,1,2,NULL,NULL),(8760,82,0,2,NULL,NULL),(8761,72,0,2,NULL,NULL),(8762,43,0,2,NULL,NULL),(8763,38,0,2,NULL,NULL),(8764,17,0,2,NULL,NULL),(8765,59,0,2,NULL,NULL),(8766,52,0,2,NULL,NULL),(8767,24,0,2,NULL,NULL),(8768,78,0,2,NULL,NULL),(8769,68,0,2,NULL,NULL),(8770,35,0,2,NULL,NULL),(8771,75,0,2,NULL,NULL),(8772,58,0,2,NULL,NULL),(8773,16,0,2,NULL,NULL),(8774,33,0,2,NULL,NULL),(8775,26,0,2,NULL,NULL),(8776,55,1,2,NULL,NULL),(8777,12,0,2,NULL,NULL),(8778,81,0,2,NULL,NULL),(8779,32,0,2,NULL,NULL),(8780,20,0,2,NULL,NULL),(8781,74,0,2,NULL,NULL),(8782,11,0,2,NULL,NULL),(8783,5,1,2,NULL,NULL),(8784,27,0,2,NULL,NULL),(8785,34,0,2,NULL,NULL),(8786,58,0,7,NULL,NULL),(8787,44,1,7,NULL,NULL),(8788,6,1,7,NULL,NULL),(8789,54,1,7,NULL,NULL),(8790,2,1,7,NULL,NULL),(8791,57,0,7,NULL,NULL),(8792,33,0,7,NULL,NULL),(8793,83,0,7,NULL,NULL),(8794,29,1,7,NULL,NULL),(8795,84,0,7,NULL,NULL),(8796,24,1,7,NULL,NULL),(8797,20,1,7,NULL,NULL),(8798,17,1,7,NULL,NULL),(8799,49,1,7,NULL,NULL),(8800,16,1,7,NULL,NULL),(8801,14,1,7,NULL,NULL),(8802,76,0,7,NULL,NULL),(8803,12,1,7,NULL,NULL),(8804,70,1,7,NULL,NULL),(8805,21,1,7,NULL,NULL),(8806,64,0,7,NULL,NULL),(8807,25,1,7,NULL,NULL),(8808,67,0,7,NULL,NULL),(8809,85,0,7,NULL,NULL),(8810,26,1,7,NULL,NULL),(8811,10,1,7,NULL,NULL),(8812,28,1,7,NULL,NULL),(8813,81,0,7,NULL,NULL),(8814,71,0,7,NULL,NULL),(8815,37,1,7,NULL,NULL),(8816,15,1,7,NULL,NULL),(8817,80,0,7,NULL,NULL),(8818,68,0,7,NULL,NULL),(8819,78,0,7,NULL,NULL),(8820,47,1,7,NULL,NULL),(8821,32,0,7,NULL,NULL),(8822,77,0,7,NULL,NULL),(8823,35,0,7,NULL,NULL),(8824,62,0,7,NULL,NULL),(8825,82,0,7,NULL,NULL),(8826,19,1,7,NULL,NULL),(8827,65,0,7,NULL,NULL),(8828,18,1,7,NULL,NULL),(8829,5,0,7,NULL,NULL),(8830,50,1,7,NULL,NULL),(8831,63,0,7,NULL,NULL),(8832,8,0,7,NULL,NULL),(8833,74,0,7,NULL,NULL),(8834,11,1,7,NULL,NULL),(8835,31,1,7,NULL,NULL),(8836,27,1,7,NULL,NULL),(8837,22,1,7,NULL,NULL),(8838,53,1,7,NULL,NULL),(8839,46,1,7,NULL,NULL),(8840,52,1,7,NULL,NULL),(8841,30,1,7,NULL,NULL),(8842,60,0,7,NULL,NULL),(8843,1,1,7,NULL,NULL),(8844,73,0,7,NULL,NULL),(8845,56,1,7,NULL,NULL),(8846,55,1,7,NULL,NULL),(8847,23,1,7,NULL,NULL),(8848,7,0,7,NULL,NULL),(8849,79,0,7,NULL,NULL),(8850,48,1,7,NULL,NULL),(8851,42,1,7,NULL,NULL),(8852,51,1,7,NULL,NULL),(8853,4,0,7,NULL,NULL),(8854,45,1,7,NULL,NULL),(8855,9,0,7,NULL,NULL),(8856,3,0,7,NULL,NULL),(8857,38,1,7,NULL,NULL),(8858,36,0,7,NULL,NULL),(8859,40,1,7,NULL,NULL),(8860,59,0,7,NULL,NULL),(8861,75,0,7,NULL,NULL),(8862,41,1,7,NULL,NULL),(8863,69,0,7,NULL,NULL),(8864,34,0,7,NULL,NULL),(8865,43,1,7,NULL,NULL),(8866,66,0,7,NULL,NULL),(8867,13,1,7,NULL,NULL),(8868,72,1,7,NULL,NULL),(8869,61,0,7,NULL,NULL),(8870,39,1,7,NULL,NULL),(9041,43,0,4,NULL,NULL),(9042,29,0,4,NULL,NULL),(9043,50,0,4,NULL,NULL),(9044,70,1,4,NULL,NULL),(9045,4,0,4,NULL,NULL),(9046,18,0,4,NULL,NULL),(9047,32,1,4,NULL,NULL),(9048,25,0,4,NULL,NULL),(9049,30,0,4,NULL,NULL),(9050,31,1,4,NULL,NULL),(9051,51,0,4,NULL,NULL),(9052,3,0,4,NULL,NULL),(9053,28,1,4,NULL,NULL),(9054,10,1,4,NULL,NULL),(9055,5,0,4,NULL,NULL),(9056,37,0,4,NULL,NULL),(9057,57,0,4,NULL,NULL),(9058,62,0,4,NULL,NULL),(9059,46,0,4,NULL,NULL),(9060,80,0,4,NULL,NULL),(9061,2,0,4,NULL,NULL),(9062,27,1,4,NULL,NULL),(9063,85,0,4,NULL,NULL),(9064,39,0,4,NULL,NULL),(9065,61,0,4,NULL,NULL),(9066,19,0,4,NULL,NULL),(9067,23,1,4,NULL,NULL),(9068,42,0,4,NULL,NULL),(9069,14,1,4,NULL,NULL),(9070,84,0,4,NULL,NULL),(9071,7,0,4,NULL,NULL),(9072,60,0,4,NULL,NULL),(9073,20,1,4,NULL,NULL),(9074,82,0,4,NULL,NULL),(9075,68,1,4,NULL,NULL),(9076,45,0,4,NULL,NULL),(9077,69,1,4,NULL,NULL),(9078,52,0,4,NULL,NULL),(9079,12,1,4,NULL,NULL),(9080,63,0,4,NULL,NULL),(9081,64,0,4,NULL,NULL),(9082,65,0,4,NULL,NULL),(9083,6,0,4,NULL,NULL),(9084,36,0,4,NULL,NULL),(9085,17,0,4,NULL,NULL),(9086,8,0,4,NULL,NULL),(9087,1,0,4,NULL,NULL),(9088,49,0,4,NULL,NULL),(9089,81,0,4,NULL,NULL),(9090,24,1,4,NULL,NULL),(9091,54,0,4,NULL,NULL),(9092,9,0,4,NULL,NULL),(9093,78,1,4,NULL,NULL),(9094,26,1,4,NULL,NULL),(9095,71,0,4,NULL,NULL),(9096,76,0,4,NULL,NULL),(9097,22,0,4,NULL,NULL),(9098,21,1,4,NULL,NULL),(9099,72,0,4,NULL,NULL),(9100,40,0,4,NULL,NULL),(9101,16,0,4,NULL,NULL),(9102,34,0,4,NULL,NULL),(9103,66,1,4,NULL,NULL),(9104,35,1,4,NULL,NULL),(9105,79,1,4,NULL,NULL),(9106,53,0,4,NULL,NULL),(9107,13,0,4,NULL,NULL),(9108,67,1,4,NULL,NULL),(9109,47,0,4,NULL,NULL),(9110,77,0,4,NULL,NULL),(9111,75,0,4,NULL,NULL),(9112,41,0,4,NULL,NULL),(9113,73,0,4,NULL,NULL),(9114,48,0,4,NULL,NULL),(9115,55,1,4,NULL,NULL),(9116,74,0,4,NULL,NULL),(9117,38,0,4,NULL,NULL),(9118,44,0,4,NULL,NULL),(9119,56,0,4,NULL,NULL),(9120,83,0,4,NULL,NULL),(9121,33,0,4,NULL,NULL),(9122,58,0,4,NULL,NULL),(9123,15,1,4,NULL,NULL),(9124,59,0,4,NULL,NULL),(9125,11,0,4,NULL,NULL);
/*!40000 ALTER TABLE `formaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Form` varchar(45) NOT NULL,
  `Group` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (1,'ROLE_CUSTOMER','SALES'),(2,'ROLE_SHIPPINGADD','SALES'),(3,'ROLE_ENQUIRY','SALES'),(4,'ROLE_ARTWORK','SALES'),(5,'ROLE_CUSTOMERPRODUCTS','SALES'),(6,'ROLE_PRICELIST','SALES'),(7,'ROLE_PAPERMASTER','SALES'),(8,'ROLE_QUOTATION','SALES'),(9,'ROLE_SALESORDER','SALES'),(10,'ROLE_SALESINVOICE','SALES'),(11,'ROLE_DEBITNOTE','SALES'),(12,'ROLE_SALESRETURN','SALES'),(13,'ROLE_SALESCREDITNOTE','SALES'),(14,'ROLE_RECEIVABLEREPORTS','SALES'),(15,'ROLE_SUPPLIER','PURCHASES'),(16,'ROLE_COSTHISTORY','PURCHASES'),(17,'ROLE_PURCHASEREQUISITION','PURCHASES'),(18,'ROLE_PURCHASEORDER','PURCHASES'),(19,'ROLE_GRN','PURCHASES'),(20,'ROLE_PURCHASEINVOICE','PURCHASES'),(21,'ROLE_PURCHASERETURNS','PURCHASES'),(22,'ROLE_PURCHASECREDITNOTE','PURCHASES'),(23,'ROLE_PAYABLEREPORTS','PURCHASES'),(24,'ROLE_INVENTORYMASTER','INVENTORY'),(25,'ROLE_REELSERIAL','INVENTORY'),(26,'ROLE_MATERIALREQUISITION','INVENTORY'),(27,'ROLE_MATERIALISSUE','INVENTORY'),(28,'ROLE_MATERIALRETURN','INVENTORY'),(29,'ROLE_STOCKANALYSIS','INVENTORY'),(30,'ROLE_STOCKADJUSTMENT','INVENTORY'),(31,'ROLE_INVENTORYREPORTS','INVENTORY'),(32,'ROLE_JOBTICKET','PRODUCTION'),(33,'ROLE_CORRUGATORSCHED','PRODUCTION'),(34,'ROLE_PRINTSCHED','PRODUCTION'),(35,'ROLE_FINISHSCHED','PRODUCTION'),(36,'ROLE_QUALITYCONTROL','PRODUCTION'),(37,'ROLE_PRODUCTIONREPORTS','PRODUCTION'),(38,'ROLE_FINANCIALPERIOD','FINANCE'),(39,'ROLE_JOURNAL','FINANCE'),(40,'ROLE_ACCOUNTSSUBTYPE','FINANCE'),(41,'ROLE_COA','FINANCE'),(42,'ROLE_REMITTANCE','FINANCE'),(43,'ROLE_ARALLOCATION','FINANCE'),(44,'ROLE_APALLOCATION','FINANCE'),(45,'ROLE_UNCLEAREDEFFECTS','FINANCE'),(46,'ROLE_BANKRECON','FINANCE'),(47,'ROLE_CHEQUEREGISTER','FINANCE'),(48,'ROLE_CHEQUEDEPOSIT','FINANCE'),(49,'ROLE_PAYMENTS','FINANCE'),(50,'ROLE_RECEIPTS','FINANCE'),(51,'ROLE_CONTRA','FINANCE'),(52,'ROLE_VOIDENTRY','FINANCE'),(53,'ROLE_CASHBOOKREPORTS','FINANCE'),(54,'ROLE_MISREPORTS','FINANCE'),(55,'ROLE_MAINMENU','SYSTEM'),(56,'ROLE_COMPANYSETTCOMPANYINFO','SETTINGS'),(57,'ROLE_COMPANYSETTDEPT','SETTINGS'),(58,'ROLE_COMPANYSETTSTORE','SETTINGS'),(59,'ROLE_COMPANYSETTASSET','SETTINGS'),(60,'ROLE_COMPANYSETTPARAM','SETTINGS'),(61,'ROLE_COMPANYSETTROLE','SETTINGS'),(62,'ROLE_COMPANYSETTFORMACCESS','SETTINGS'),(63,'ROLE_COMPANYSETTROLEACCESS','SETTINGS'),(64,'ROLE_COMPANYSETTUSER','SETTINGS'),(65,'ROLE_GLOBALSETTPOSTCODE','SETTINGS'),(66,'ROLE_GLOBALSETTCOUNTRY','SETTINGS'),(67,'ROLE_GLOBALSETTCITY','SETTINGS'),(68,'ROLE_FINANCESETTBANK','SETTINGS'),(69,'ROLE_FINANCESETTBANKBRANCH','SETTINGS'),(70,'ROLE_FINANCESETTCURRENCY','SETTINGS'),(71,'ROLE_FINANCESETTVAT','SETTINGS'),(72,'ROLE_FINANCESETTDEFAULTACC','SETTINGS'),(73,'ROLE_INVENTSETTUOM','SETTINGS'),(74,'ROLE_INVENTSETTCARTONTYPE','SETTINGS'),(75,'ROLE_INVENTSETTGSM','SETTINGS'),(76,'ROLE_INVENTSETTREELTYPE','SETTINGS'),(77,'ROLE_INVENTSETTREELWIDTH','SETTINGS'),(78,'ROLE_INVENTSETTINVCLASS','SETTINGS'),(79,'ROLE_INVENTSETTGROUP','SETTINGS'),(80,'ROLE_INVENTSETTSUBGROUP','SETTINGS'),(81,'ROLE_PRODSETTSHIFT','SETTINGS'),(82,'ROLE_PRODSETTMACHINESET','SETTINGS'),(83,'ROLE_PRODSETTCREASETYPE','SETTINGS'),(84,'ROLE_PRODSETTQCCHECKPOINT','SETTINGS'),(85,'ROLE_SETTINGSACCESS','SETTINGS');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalledger`
--

DROP TABLE IF EXISTS `generalledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccCode` int(11) NOT NULL,
  `VatId` int(11) DEFAULT NULL,
  `VatRate` double(9,2) DEFAULT NULL,
  `DebitAmt` double(12,2) NOT NULL,
  `CreditAmt` double(12,2) NOT NULL,
  `CurrId` int(11) NOT NULL,
  `CurrRate` double(9,4) NOT NULL,
  `Journal` int(11) DEFAULT NULL,
  `Description` text,
  `Saleinvoice` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DocType` varchar(45) DEFAULT NULL,
  `Supplierinv` int(11) DEFAULT NULL,
  `Cashbook` int(11) DEFAULT NULL,
  `Receiptreg` int(11) DEFAULT NULL,
  `CustCreditnote` int(11) DEFAULT NULL,
  `SuppCreditnote` int(11) DEFAULT NULL,
  `Debitnote` int(11) DEFAULT NULL,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `OtherAcc` int(11) DEFAULT NULL,
  `CustomerAllocation` int(11) DEFAULT NULL,
  `SupplierAllocation` int(11) DEFAULT NULL,
  `MaterialIssue` int(11) DEFAULT NULL,
  `Materialreturn` int(11) DEFAULT NULL,
  `Jtproduction` int(11) DEFAULT NULL,
  `Financialperiod` int(11) NOT NULL,
  `Remittance` int(11) DEFAULT NULL,
  `Grn` int(11) DEFAULT NULL,
  `DocNum` varchar(45) DEFAULT NULL,
  `Stockadjustment` int(11) DEFAULT NULL,
  `Salesreturn` int(11) DEFAULT NULL,
  `Purchasereturn` int(11) DEFAULT NULL,
  `Jobticket` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovedBy` int(11) DEFAULT NULL,
  `farmerDed` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `GenLedVatIndex_idx` (`VatId`) USING BTREE,
  KEY `GenLedCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `GenLedSalesinvoiceIndex` (`Saleinvoice`) USING BTREE,
  KEY `FK_Cashbook` (`Cashbook`) USING BTREE,
  KEY `FK_Supplierinvoice` (`Supplierinv`) USING BTREE,
  KEY `FK_JournalInde` (`Journal`) USING BTREE,
  KEY `GenLedCoaIndex` (`AccCode`) USING BTREE,
  KEY `GenLedReceiptregIndex` (`Receiptreg`) USING BTREE,
  KEY `GenLedCustCnoteIndex` (`CustCreditnote`) USING BTREE,
  KEY `GenLedSuppCnoteIndex` (`SuppCreditnote`) USING BTREE,
  KEY `GenLedDebitnoteIndex` (`Debitnote`) USING BTREE,
  KEY `GenLedOtherAccIndex` (`OtherAcc`) USING BTREE,
  KEY `GenLedCustAllocIndex` (`CustomerAllocation`) USING BTREE,
  KEY `GenLedSuppAllocIndex` (`SupplierAllocation`) USING BTREE,
  KEY `GenLedIssueIndex` (`MaterialIssue`) USING BTREE,
  KEY `GenLedIssuereturnIndex` (`Materialreturn`) USING BTREE,
  KEY `GenLedFinperiodIndex` (`Financialperiod`) USING BTREE,
  KEY `GenledRemittIndex` (`Remittance`) USING BTREE,
  KEY `GenLedGrnIndex` (`Grn`) USING BTREE,
  KEY `GenLedStkadjIndex` (`Stockadjustment`) USING BTREE,
  KEY `GenLedSalesreturnIndex` (`Salesreturn`) USING BTREE,
  KEY `GenLedPreturnIndex` (`Purchasereturn`) USING BTREE,
  KEY `GenLedJtprodIndex_idx` (`Jtproduction`) USING BTREE,
  KEY `GenLedJticket` (`Jobticket`) USING BTREE,
  KEY `GenLedcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `GenLedapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `genkedgerfarmerDedidx` (`farmerDed`) USING BTREE,
  KEY `glcostcenter` (`costcenter`),
  KEY `glcompany` (`company`),
  CONSTRAINT `generalledger_ibfk_1` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_10` FOREIGN KEY (`Salesreturn`) REFERENCES `salesreturnnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_11` FOREIGN KEY (`Stockadjustment`) REFERENCES `stkadjustment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_12` FOREIGN KEY (`Receiptreg`) REFERENCES `chequeregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_13` FOREIGN KEY (`SupplierAllocation`) REFERENCES `supplierallocation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_14` FOREIGN KEY (`SuppCreditnote`) REFERENCES `purcreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_15` FOREIGN KEY (`Supplierinv`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_16` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_17` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_18` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_19` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_2` FOREIGN KEY (`MaterialIssue`) REFERENCES `stockissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_20` FOREIGN KEY (`Remittance`) REFERENCES `remmitance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_21` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_22` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_23` FOREIGN KEY (`AccCode`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_24` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_26` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_27` FOREIGN KEY (`CustomerAllocation`) REFERENCES `customerallocations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_28` FOREIGN KEY (`CustCreditnote`) REFERENCES `salescreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_29` FOREIGN KEY (`Debitnote`) REFERENCES `debitnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_3` FOREIGN KEY (`Materialreturn`) REFERENCES `materialreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_30` FOREIGN KEY (`Financialperiod`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_31` FOREIGN KEY (`Grn`) REFERENCES `goodsreceipt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_4` FOREIGN KEY (`Journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_7` FOREIGN KEY (`OtherAcc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_8` FOREIGN KEY (`Purchasereturn`) REFERENCES `purchasereturnnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generalledger_ibfk_9` FOREIGN KEY (`Saleinvoice`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `glcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `glcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalledger`
--

LOCK TABLES `generalledger` WRITE;
/*!40000 ALTER TABLE `generalledger` DISABLE KEYS */;
INSERT INTO `generalledger` VALUES (7,2217,NULL,NULL,0.00,6900.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-18','2016-02-19 01:52:00','MATERIAL ISSUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,2217,NULL,NULL,6900.00,0.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-18','2016-02-19 01:52:00','MATERIAL ISSUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,2217,NULL,NULL,0.00,4600.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-18','2016-02-19 01:55:30','MATERIAL ISSUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,2217,NULL,NULL,4600.00,0.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-18','2016-02-19 01:55:30','MATERIAL ISSUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(11,2331,NULL,NULL,0.00,4200.00,1,1.0000,NULL,NULL,3,7,'2016-02-18','2016-02-19 01:57:05','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(12,2300,NULL,NULL,0.00,800.00,1,1.0000,NULL,NULL,3,7,'2016-02-18','2016-02-19 01:57:05','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(13,2217,NULL,NULL,0.00,4600.00,1,1.0000,NULL,NULL,3,7,'2016-02-18','2016-02-19 01:57:05','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(14,2345,NULL,NULL,4600.00,0.00,1,1.0000,NULL,NULL,3,7,'2016-02-18','2016-02-19 01:57:05','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(15,2217,NULL,NULL,2300.00,0.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-18','2016-02-19 01:57:51','MATERIAL RETURNS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(16,2217,NULL,NULL,0.00,2300.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-18','2016-02-19 01:57:51','MATERIAL RETURNS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(19,2217,NULL,NULL,11500.00,0.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-19','2016-02-19 15:49:11','GOODS RECEIPT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,2,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(20,2520,NULL,NULL,0.00,11500.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-19','2016-02-19 15:49:11','GOODS RECEIPT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,2,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(21,2217,NULL,NULL,0.00,4600.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-19','2016-02-19 15:57:23','MATERIAL ISSUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(22,2217,NULL,NULL,4600.00,0.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-19','2016-02-19 15:57:23','MATERIAL ISSUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(23,2331,NULL,NULL,0.00,4200.00,1,1.0000,NULL,NULL,5,7,'2016-02-19','2016-02-19 16:01:19','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(24,2300,NULL,NULL,0.00,800.00,1,1.0000,NULL,NULL,5,7,'2016-02-19','2016-02-19 16:01:19','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(25,2217,NULL,NULL,0.00,4600.00,1,1.0000,NULL,NULL,5,7,'2016-02-19','2016-02-19 16:01:19','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(26,2345,NULL,NULL,4600.00,0.00,1,1.0000,NULL,NULL,5,7,'2016-02-19','2016-02-19 16:01:19','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(27,2217,NULL,NULL,2300.00,0.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-19','2016-02-19 16:02:16','MATERIAL RETURNS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(28,2217,NULL,NULL,0.00,2300.00,1,1.0000,NULL,NULL,NULL,7,'2016-02-19','2016-02-19 16:02:16','MATERIAL RETURNS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(39,2300,NULL,NULL,0.00,6080.00,1,1.0000,NULL,'Tracking Installation Invoice',11,NULL,'2016-02-26','2016-02-27 01:47:46','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2016-02-26 20:47:46',NULL,NULL),(40,2562,NULL,NULL,0.00,38000.00,1,1.0000,NULL,'Tracking Installation Invoice',11,NULL,'2016-02-26','2016-02-27 01:47:46','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2016-02-26 20:47:46',NULL,NULL),(41,2562,NULL,NULL,0.00,10000.00,1,1.0000,NULL,'Tracking Installation Invoice',12,NULL,'2016-02-26','2016-02-27 01:52:50','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2016-02-26 20:52:50',NULL,NULL),(42,2300,NULL,NULL,0.00,0.00,1,1.0000,NULL,'Tracking Installation Invoice',12,NULL,'2016-02-26','2016-02-27 01:52:50','CREDIT SALES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2016-02-26 20:52:50',NULL,NULL);
/*!40000 ALTER TABLE `generalledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsreceipt`
--

DROP TABLE IF EXISTS `goodsreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsreceipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier` int(11) DEFAULT NULL,
  `PONum` int(11) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `SuppInvNo` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `GrnNo` varchar(45) DEFAULT NULL,
  `DelNoteNo` varchar(100) DEFAULT NULL,
  `Transporter` int(11) DEFAULT NULL,
  `Driver` varchar(45) DEFAULT NULL,
  `WaybillNo` varchar(45) DEFAULT NULL,
  `WaybillDate` datetime DEFAULT NULL,
  `ReceivedBY` int(11) DEFAULT NULL,
  `Remarks` text,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` datetime DEFAULT NULL,
  `ConsigmentNo` varchar(45) DEFAULT NULL,
  `Consigndate` datetime DEFAULT NULL,
  `Delnotedate` datetime DEFAULT NULL,
  `TransregNo` varchar(100) DEFAULT NULL,
  `Transtype` varchar(45) DEFAULT NULL,
  `Batchno` varchar(45) DEFAULT NULL,
  `SuppInvoice` int(11) DEFAULT NULL,
  `TotalQty` double(12,2) NOT NULL DEFAULT '0.00',
  `grnProcessed` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68E00E2237BF4B3F` (`PONum`) USING BTREE,
  KEY `FK68E00E227D30F8A3` (`StoreId`) USING BTREE,
  KEY `FK68E00E226CE51B19` (`DeptId`) USING BTREE,
  KEY `FK68E00E2269773A2` (`SuppInvNo`) USING BTREE,
  KEY `FK68E00E22A1FDD268` (`Supplier`) USING BTREE,
  KEY `GrnTransIndex` (`Transporter`) USING BTREE,
  KEY `GrnSuppInvIndex` (`SuppInvoice`) USING BTREE,
  KEY `GrncreatedBy` (`CreatedBy`) USING BTREE,
  KEY `GrnapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `grncostcenter` (`costcenter`),
  KEY `grncompany` (`company`),
  CONSTRAINT `goodsreceipt_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_2` FOREIGN KEY (`PONum`) REFERENCES `purchaseorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_3` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_4` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_5` FOREIGN KEY (`SuppInvoice`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_6` FOREIGN KEY (`Transporter`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_7` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goodsreceipt_ibfk_8` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grncompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grncostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsreceipt`
--

LOCK TABLES `goodsreceipt` WRITE;
/*!40000 ALTER TABLE `goodsreceipt` DISABLE KEYS */;
INSERT INTO `goodsreceipt` VALUES (2,1,NULL,33,NULL,NULL,'GRN','453456',NULL,'',NULL,NULL,NULL,'','2016-02-19',7,'2016-02-19 10:49:11',7,1,'2016-02-19 10:48:13','',NULL,'2016-02-19 00:00:00','',NULL,'',NULL,5.00,0,NULL,NULL);
/*!40000 ALTER TABLE `goodsreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GroupDesc` varchar(100) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `GroupDesc_UNIQUE` (`GroupDesc`) USING BTREE,
  KEY `groupcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `groupapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `grpcostcenter` (`costcenter`),
  KEY `grpcompany` (`company`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grpcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grpcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk`
--

DROP TABLE IF EXISTS `helpdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `phoneNo` text,
  `callerName` text,
  `helpdeskType` int(11) DEFAULT NULL,
  `remarks` text,
  `assignedTo` int(11) DEFAULT NULL,
  `helpdeskstatus` int(11) DEFAULT NULL,
  `notifyonemail` tinyint(1) NOT NULL DEFAULT '0',
  `notified` tinyint(1) NOT NULL,
  `timeline` date NOT NULL,
  `tracker` int(11) DEFAULT NULL,
  `location` text,
  `email` text,
  `existing` tinyint(1) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `technicalremarks` text,
  `helpdeskcaller` int(11) DEFAULT NULL,
  `internal` tinyint(1) NOT NULL,
  `helpdeskissue` int(11) DEFAULT NULL,
  `team` text,
  `auctioneer` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `financier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `helpdeskType` (`helpdeskType`),
  KEY `assignedTo` (`assignedTo`),
  KEY `helpdeskstatus` (`helpdeskstatus`),
  KEY `customer` (`customer`),
  KEY `helpdeskcaller` (`helpdeskcaller`),
  KEY `helpdeskissue` (`helpdeskissue`),
  KEY `auctioneer` (`auctioneer`),
  KEY `bank` (`bank`),
  KEY `financier` (`financier`),
  KEY `tracker` (`tracker`),
  CONSTRAINT `helpdesk_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_10` FOREIGN KEY (`helpdeskissue`) REFERENCES `helpdeskissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_11` FOREIGN KEY (`auctioneer`) REFERENCES `helpdeskauctioneer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_12` FOREIGN KEY (`bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_13` FOREIGN KEY (`financier`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_14` FOREIGN KEY (`tracker`) REFERENCES `tracker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_5` FOREIGN KEY (`helpdeskType`) REFERENCES `helpdesktype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_6` FOREIGN KEY (`assignedTo`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_7` FOREIGN KEY (`helpdeskstatus`) REFERENCES `helpdeskstatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_8` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesk_ibfk_9` FOREIGN KEY (`helpdeskcaller`) REFERENCES `helpdeskcaller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk`
--

LOCK TABLES `helpdesk` WRITE;
/*!40000 ALTER TABLE `helpdesk` DISABLE KEYS */;
INSERT INTO `helpdesk` VALUES (1,'2016-02-23','2016-02-23 18:32:55',7,1,7,'2016-02-23 18:50:12',0,NULL,NULL,'','',1,'',1,NULL,0,0,'2016-02-23',NULL,NULL,'',0,NULL,NULL,3,0,2,'Team will be here',NULL,NULL,NULL);
/*!40000 ALTER TABLE `helpdesk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdeskauctioneer`
--

DROP TABLE IF EXISTS `helpdeskauctioneer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskauctioneer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `contactperson` text,
  `phoneno` text,
  `agency` int(11) DEFAULT NULL,
  `remarks` text,
  `active` tinyint(1) NOT NULL,
  `email` text,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `agency` (`agency`),
  CONSTRAINT `helpdeskauctioneer_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneer_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneer_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneer_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneer_ibfk_5` FOREIGN KEY (`agency`) REFERENCES `helpdeskauctioneeragency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdeskauctioneer`
--

LOCK TABLES `helpdeskauctioneer` WRITE;
/*!40000 ALTER TABLE `helpdeskauctioneer` DISABLE KEYS */;
INSERT INTO `helpdeskauctioneer` VALUES (5,'2016-02-22','2016-02-22 11:15:01',7,1,7,'2016-02-22 11:16:08',NULL,NULL,'Joseph Walke','Phone no',1,NULL,1,'email'),(6,'2016-02-22','2016-02-22 11:20:25',7,0,NULL,NULL,NULL,NULL,'Jamlek Kamau','98675767',1,NULL,0,''),(7,'2016-02-22','2016-02-22 11:21:41',7,1,7,'2016-02-22 11:22:01',NULL,NULL,'Jessy Omondi','phone',2,NULL,1,'');
/*!40000 ALTER TABLE `helpdeskauctioneer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdeskauctioneeragency`
--

DROP TABLE IF EXISTS `helpdeskauctioneeragency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskauctioneeragency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `description` text,
  `tel1` text,
  `tel2` text,
  `phone` text,
  `email` text,
  `postadd` text,
  `postcode` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `postcode` (`postcode`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  CONSTRAINT `helpdeskauctioneeragency_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneeragency_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneeragency_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneeragency_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneeragency_ibfk_5` FOREIGN KEY (`postcode`) REFERENCES `postcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneeragency_ibfk_6` FOREIGN KEY (`city`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskauctioneeragency_ibfk_7` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdeskauctioneeragency`
--

LOCK TABLES `helpdeskauctioneeragency` WRITE;
/*!40000 ALTER TABLE `helpdeskauctioneeragency` DISABLE KEYS */;
INSERT INTO `helpdeskauctioneeragency` VALUES (1,'2016-02-22','2016-02-22 10:00:23',7,1,7,'2016-02-22 10:37:57',NULL,NULL,'REGEANT AUCTIONEER','TEL 2',NULL,'MOBILE','','POST ADD',1,1,1,1),(2,'2016-02-22','2016-02-22 11:17:55',7,1,7,'2016-02-22 11:21:25',NULL,NULL,'Kenya Auctioneers','',NULL,'','','',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `helpdeskauctioneeragency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdeskcaller`
--

DROP TABLE IF EXISTS `helpdeskcaller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskcaller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdeskcaller`
--

LOCK TABLES `helpdeskcaller` WRITE;
/*!40000 ALTER TABLE `helpdeskcaller` DISABLE KEYS */;
INSERT INTO `helpdeskcaller` VALUES (1,'Customer'),(2,'Auctioneer'),(3,'Bank'),(4,'Others');
/*!40000 ALTER TABLE `helpdeskcaller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdeskissue`
--

DROP TABLE IF EXISTS `helpdeskissue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskissue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `helpdeskissue_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskissue_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskissue_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdeskissue_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdeskissue`
--

LOCK TABLES `helpdeskissue` WRITE;
/*!40000 ALTER TABLE `helpdeskissue` DISABLE KEYS */;
INSERT INTO `helpdeskissue` VALUES (1,'2016-02-22','2016-02-22 11:46:58',7,1,7,'2016-02-22 12:30:05',NULL,NULL,0,'Stolen'),(2,'2016-02-22','2016-02-22 11:55:59',7,1,7,'2016-02-22 11:56:16',NULL,NULL,1,'Malfunction');
/*!40000 ALTER TABLE `helpdeskissue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdeskstatus`
--

DROP TABLE IF EXISTS `helpdeskstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdeskstatus`
--

LOCK TABLES `helpdeskstatus` WRITE;
/*!40000 ALTER TABLE `helpdeskstatus` DISABLE KEYS */;
INSERT INTO `helpdeskstatus` VALUES (1,'Initiated'),(3,'Suspended'),(4,'Resolved'),(5,'Closed'),(6,'Reopened');
/*!40000 ALTER TABLE `helpdeskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesktrail`
--

DROP TABLE IF EXISTS `helpdesktrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesktrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `description` text,
  `timeline` date DEFAULT NULL,
  `assignedto` int(11) DEFAULT NULL,
  `team` text,
  `remarks` text,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `closeparent` tinyint(1) NOT NULL DEFAULT '0',
  `helpdesk` int(11) NOT NULL,
  `notifyonemail` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `assignedto` (`assignedto`),
  KEY `helpdesk` (`helpdesk`),
  KEY `helpdesktrail_ibfk_1` (`createdBy`),
  KEY `helpdesktrail_ibfk_2` (`approvedBy`),
  CONSTRAINT `helpdesktrail_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesktrail_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesktrail_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesktrail_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesktrail_ibfk_5` FOREIGN KEY (`assignedto`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helpdesktrail_ibfk_6` FOREIGN KEY (`helpdesk`) REFERENCES `helpdesk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesktrail`
--

LOCK TABLES `helpdesktrail` WRITE;
/*!40000 ALTER TABLE `helpdesktrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesktrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesktype`
--

DROP TABLE IF EXISTS `helpdesktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesktype`
--

LOCK TABLES `helpdesktype` WRITE;
/*!40000 ALTER TABLE `helpdesktype` DISABLE KEYS */;
INSERT INTO `helpdesktype` VALUES (1,'Technical'),(2,'Finance'),(3,'Sales');
/*!40000 ALTER TABLE `helpdesktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_disabled`
--

DROP TABLE IF EXISTS `hr_disabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_disabled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_disabled`
--

LOCK TABLES `hr_disabled` WRITE;
/*!40000 ALTER TABLE `hr_disabled` DISABLE KEYS */;
INSERT INTO `hr_disabled` VALUES (1,'No'),(2,'Yes');
/*!40000 ALTER TABLE `hr_disabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_employee`
--

DROP TABLE IF EXISTS `hr_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `idno` varchar(45) DEFAULT NULL,
  `passportno` varchar(45) DEFAULT NULL,
  `pinno` varchar(45) DEFAULT NULL,
  `maritalstatus` int(11) DEFAULT NULL,
  `nextofkin` varchar(200) DEFAULT NULL,
  `kinrelation` varchar(45) DEFAULT NULL,
  `kincontact` varchar(45) DEFAULT NULL,
  `dependants` varchar(45) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `addresscode` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `bankbranch` int(11) DEFAULT NULL,
  `bankaccno` varchar(45) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `disableform` varchar(200) DEFAULT NULL,
  `txnDate` datetime NOT NULL,
  `createDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approvedby` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `notes` varchar(2000) DEFAULT NULL,
  `nssf` varchar(45) DEFAULT NULL,
  `nhif` varchar(45) DEFAULT NULL,
  `empid` varchar(45) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RegGenderIndex` (`gender`) USING BTREE,
  KEY `RegMaritalIndex` (`maritalstatus`) USING BTREE,
  KEY `RegCityIndex` (`city`) USING BTREE,
  KEY `RegBankIndex` (`bank`) USING BTREE,
  KEY `RegBranchIndex` (`bankbranch`) USING BTREE,
  KEY `RegDisabledIndex` (`disabled`) USING BTREE,
  KEY `RegApprovedbyIndex` (`approvedby`) USING BTREE,
  KEY `RegCreatedbyIndex` (`createdBy`) USING BTREE,
  KEY `hrempcostcenter` (`costcenter`),
  KEY `hrempcompany` (`company`),
  CONSTRAINT `hr_employee_ibfk_1` FOREIGN KEY (`approvedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_2` FOREIGN KEY (`bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_3` FOREIGN KEY (`bankbranch`) REFERENCES `bankcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_4` FOREIGN KEY (`city`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_5` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_6` FOREIGN KEY (`disabled`) REFERENCES `hr_disabled` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_7` FOREIGN KEY (`gender`) REFERENCES `hr_gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hr_employee_ibfk_8` FOREIGN KEY (`maritalstatus`) REFERENCES `hr_maritalstatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hrempcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hrempcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_employee`
--

LOCK TABLES `hr_employee` WRITE;
/*!40000 ALTER TABLE `hr_employee` DISABLE KEYS */;
INSERT INTO `hr_employee` VALUES (1,'The Installer',NULL,1,'31290088','','',NULL,'','','','',NULL,'','','718885981','',NULL,NULL,'',NULL,'','2013-05-16 00:00:00','2013-05-16',7,1,7,'2013-05-16 00:00:00',1,'','','','16','','',NULL,NULL),(2,'The BRO',NULL,2,'','','',NULL,'','','','',NULL,'','','','',NULL,NULL,'',NULL,'','2013-05-16 00:00:00','2013-05-16',7,1,7,'2013-05-16 00:00:00',1,'','','','2','','',NULL,NULL);
/*!40000 ALTER TABLE `hr_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_gender`
--

DROP TABLE IF EXISTS `hr_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_gender`
--

LOCK TABLES `hr_gender` WRITE;
/*!40000 ALTER TABLE `hr_gender` DISABLE KEYS */;
INSERT INTO `hr_gender` VALUES (1,'Male'),(2,'Female');
/*!40000 ALTER TABLE `hr_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_maritalstatus`
--

DROP TABLE IF EXISTS `hr_maritalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_maritalstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_maritalstatus`
--

LOCK TABLES `hr_maritalstatus` WRITE;
/*!40000 ALTER TABLE `hr_maritalstatus` DISABLE KEYS */;
INSERT INTO `hr_maritalstatus` VALUES (1,'Single'),(2,'Married'),(3,'Divorced'),(4,'Widow'),(5,'Widower');
/*!40000 ALTER TABLE `hr_maritalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invclass`
--

DROP TABLE IF EXISTS `invclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `createDate` date NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `txnDate` datetime NOT NULL,
  `approvalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `approvalDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approvedBy` int(11) DEFAULT NULL,
  `invType` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`) USING BTREE,
  KEY `invclasscreatedBy` (`createdBy`) USING BTREE,
  KEY `invclassapprovedBy` (`approvedBy`) USING BTREE,
  KEY `invType` (`invType`) USING BTREE,
  KEY `invclasscostcenter` (`costcenter`),
  KEY `invlasscompany` (`company`),
  CONSTRAINT `invclass_ibfk_1` FOREIGN KEY (`invType`) REFERENCES `inventorytypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invclass_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invclass_ibfk_3` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invclasscostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invlasscompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invclass`
--

LOCK TABLES `invclass` WRITE;
/*!40000 ALTER TABLE `invclass` DISABLE KEYS */;
INSERT INTO `invclass` VALUES (1,'DEVICES','2016-02-18',7,'2016-02-18 20:22:32',1,'2016-02-19 01:22:44',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `invclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `InternalCode` varchar(45) DEFAULT NULL,
  `Description` varchar(200) NOT NULL,
  `SuppCode` int(11) DEFAULT NULL,
  `UOM` int(11) DEFAULT NULL,
  `currQty` double(9,3) DEFAULT '0.000',
  `InventoryCategory` int(11) DEFAULT NULL,
  `InventoryType` int(11) DEFAULT NULL,
  `InventoryClass` int(11) DEFAULT NULL,
  `vatstatus` int(11) DEFAULT NULL,
  `ReorderLevel` double(9,4) DEFAULT NULL,
  `BufferLevel` double(9,4) DEFAULT NULL,
  `EOQ` double(9,4) DEFAULT NULL,
  `CostPrice` double(12,4) NOT NULL DEFAULT '0.0000',
  `RRPrice` double(9,4) NOT NULL DEFAULT '0.0000',
  `WSPrice` double(9,4) DEFAULT '0.0000',
  `EMDPrice` double(9,4) DEFAULT '0.0000',
  `WMDPrice` double(9,4) DEFAULT '0.0000',
  `SalesDisc` double(9,4) DEFAULT '0.0000',
  `EDiscount` double(9,4) DEFAULT '0.0000',
  `WSDiscount` double(9,4) DEFAULT '0.0000',
  `ActiveStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Department` int(11) DEFAULT NULL,
  `Store` int(11) DEFAULT NULL,
  `Groups` int(11) DEFAULT NULL,
  `SubGrp` int(11) DEFAULT NULL,
  `UPC` varchar(100) DEFAULT NULL,
  `CustId` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Suppinvoice` int(11) DEFAULT NULL,
  `coa` int(11) DEFAULT NULL,
  `foreignUnitPrice` double(12,2) NOT NULL DEFAULT '0.00',
  `saleProdCurrency` int(11) NOT NULL,
  `currRate` double(12,2) NOT NULL DEFAULT '0.00',
  `expenseAcc` int(11) DEFAULT NULL,
  `revenueAccount` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `device` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  UNIQUE KEY `Description_UNIQUE` (`Description`) USING BTREE,
  UNIQUE KEY `InternalCode_UNIQUE` (`InternalCode`) USING BTREE,
  KEY `ProdUomId` (`UOM`) USING BTREE,
  KEY `ProdInvClass_idx` (`InventoryClass`) USING BTREE,
  KEY `ProdDeptIndex_idx` (`Department`) USING BTREE,
  KEY `ProdStoreIndex_idx` (`Store`) USING BTREE,
  KEY `ProdGroupsIndex_idx` (`Groups`) USING BTREE,
  KEY `ProdSubGroupIndex_idx` (`SubGrp`) USING BTREE,
  KEY `ProdCustIndex_idx` (`CustId`) USING BTREE,
  KEY `ProdInvTypeIndex_idx` (`InventoryType`) USING BTREE,
  KEY `ProdVatIndex_idx` (`vatstatus`) USING BTREE,
  KEY `ProdInvCatIndex_idx` (`InventoryCategory`) USING BTREE,
  KEY `SuppIndex` (`SuppCode`) USING BTREE,
  KEY `suppInvoiceindex_idx` (`Suppinvoice`) USING BTREE,
  KEY `invcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `invapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `invcoaIndex` (`coa`) USING BTREE,
  KEY `prodCurrIndex_idx` (`saleProdCurrency`) USING BTREE,
  KEY `expenseAccIndex_idx` (`expenseAcc`) USING BTREE,
  KEY `revAccIndex` (`revenueAccount`) USING BTREE,
  KEY `inventorycostcenter` (`costcenter`),
  KEY `inventorycompany` (`company`),
  KEY `invdevicetype_FK` (`device`),
  CONSTRAINT `invdevicetype_FK` FOREIGN KEY (`device`) REFERENCES `devicetype` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_10` FOREIGN KEY (`saleProdCurrency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_11` FOREIGN KEY (`revenueAccount`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_12` FOREIGN KEY (`Suppinvoice`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_13` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_14` FOREIGN KEY (`Department`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_15` FOREIGN KEY (`Groups`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_16` FOREIGN KEY (`InventoryCategory`) REFERENCES `inventorycategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_17` FOREIGN KEY (`InventoryClass`) REFERENCES `invclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_18` FOREIGN KEY (`InventoryType`) REFERENCES `inventorytypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_19` FOREIGN KEY (`Store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_20` FOREIGN KEY (`SubGrp`) REFERENCES `subgroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_3` FOREIGN KEY (`UOM`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_4` FOREIGN KEY (`vatstatus`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_5` FOREIGN KEY (`SuppCode`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_6` FOREIGN KEY (`expenseAcc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_7` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_8` FOREIGN KEY (`coa`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_9` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventorycompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventorycostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (36,'85TRACKIN','TRACKING BOX',NULL,2,NULL,1,1,1,2,NULL,NULL,NULL,2300.0000,2500.0000,NULL,NULL,NULL,NULL,NULL,NULL,1,31,NULL,NULL,NULL,'',NULL,'2016-02-14',29,'2016-02-14 17:01:33',NULL,NULL,0,NULL,2217,0.00,1,0.00,2217,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorycategory`
--

DROP TABLE IF EXISTS `inventorycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventorycategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorycategory`
--

LOCK TABLES `inventorycategory` WRITE;
/*!40000 ALTER TABLE `inventorycategory` DISABLE KEYS */;
INSERT INTO `inventorycategory` VALUES (1,'Inventory'),(2,'Non-Inventory');
/*!40000 ALTER TABLE `inventorycategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorytypes`
--

DROP TABLE IF EXISTS `inventorytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventorytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  `Invcat` int(11) DEFAULT NULL,
  `Approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `Type_UNIQUE` (`Type`) USING BTREE,
  KEY `invCat` (`Invcat`) USING BTREE,
  CONSTRAINT `inventorytypes_ibfk_1` FOREIGN KEY (`Invcat`) REFERENCES `inventorycategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorytypes`
--

LOCK TABLES `inventorytypes` WRITE;
/*!40000 ALTER TABLE `inventorytypes` DISABLE KEYS */;
INSERT INTO `inventorytypes` VALUES (1,'Sales Product',1,1),(2,'Raw Material',1,0),(3,'Spares & Equipment',2,1),(4,'Consumables',2,1),(5,'Service',2,1);
/*!40000 ALTER TABLE `inventorytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobcard`
--

DROP TABLE IF EXISTS `jobcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `customerName` text,
  `customerID` varchar(50) DEFAULT NULL,
  `helpdesk` int(11) DEFAULT NULL,
  `customerPhone` text,
  `customerEmail` text,
  `jobType` int(11) NOT NULL,
  `trackerType` int(11) DEFAULT NULL,
  `carReg` text,
  `carModel` text,
  `chassisno` text,
  `engineno` text,
  `color` text,
  `installationDate` date DEFAULT NULL,
  `location` text,
  `duration` double(16,4) DEFAULT '0.0000',
  `installer` int(11) DEFAULT NULL,
  `salesrep` int(11) DEFAULT NULL,
  `amountcharged` double NOT NULL,
  `contactPerson` text,
  `contactPersonPhoneNo` text,
  `currency` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `otherAccount` text,
  `contactPersonCommission` double(16,4) NOT NULL DEFAULT '0.0000',
  `remarks` text,
  `existingCustomer` tinyint(1) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `closeremarks` text,
  `closedBy` int(11) DEFAULT NULL,
  `closedDate` datetime DEFAULT NULL,
  `team` text,
  `financier` int(11) DEFAULT NULL,
  `installed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `customer` (`customer`),
  KEY `helpdesk` (`helpdesk`),
  KEY `jobType` (`jobType`),
  KEY `installer` (`installer`),
  KEY `salesrep` (`salesrep`),
  KEY `currency` (`currency`),
  KEY `bank` (`bank`),
  KEY `jobcard_ibfk_8` (`trackerType`),
  KEY `closedBy` (`closedBy`),
  KEY `financier` (`financier`),
  CONSTRAINT `jobcard_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_10` FOREIGN KEY (`salesrep`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_11` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_12` FOREIGN KEY (`bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_13` FOREIGN KEY (`closedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_14` FOREIGN KEY (`financier`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_5` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_6` FOREIGN KEY (`helpdesk`) REFERENCES `helpdesk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_7` FOREIGN KEY (`jobType`) REFERENCES `jobcardtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_8` FOREIGN KEY (`trackerType`) REFERENCES `trackertype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobcard_ibfk_9` FOREIGN KEY (`installer`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobcard`
--

LOCK TABLES `jobcard` WRITE;
/*!40000 ALTER TABLE `jobcard` DISABLE KEYS */;
INSERT INTO `jobcard` VALUES (15,'2016-02-26','2016-02-26 20:46:27',7,1,7,'2016-02-26 20:47:13',NULL,NULL,NULL,'Jessy Ndegwa','ID NO',NULL,'0723789374','kwach112@yahoo.com',1,NULL,'REG','MODEL','CHASSIS NO','ENGINE NO','COLOR','2016-02-29','LOCATION',NULL,1,2,38000,'CONTACT PERSON','0787626474',NULL,NULL,NULL,3000.0000,'',0,0,NULL,NULL,NULL,NULL,NULL,1),(16,'2016-02-26','2016-02-26 20:51:07',7,1,7,'2016-02-26 20:51:45',NULL,NULL,NULL,'SEREM SHADRACK','',NULL,'077276475','',1,NULL,'','','','','','2016-02-29','',NULL,1,2,0,'','',NULL,NULL,NULL,0.0000,'',0,0,NULL,NULL,NULL,NULL,NULL,1),(17,'2016-02-29','2016-02-29 19:29:15',7,1,7,'2016-02-29 19:29:24',NULL,NULL,NULL,'Wasabi','565456545',NULL,'087987078','hhgy@hh.com',1,NULL,'reg','model','chassis','engine','color','2016-02-29','location',0.0000,1,2,600,'person','456789',NULL,NULL,NULL,0.0000,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `jobcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobcardtype`
--

DROP TABLE IF EXISTS `jobcardtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobcardtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobcardtype`
--

LOCK TABLES `jobcardtype` WRITE;
/*!40000 ALTER TABLE `jobcardtype` DISABLE KEYS */;
INSERT INTO `jobcardtype` VALUES (1,'Individual'),(2,'Bank'),(3,'Others');
/*!40000 ALTER TABLE `jobcardtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `JournalNo` varchar(45) DEFAULT NULL,
  `DebitAmt` double(12,2) NOT NULL,
  `CreditAmt` double(12,2) NOT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(12,2) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `JournalType` varchar(45) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `Supplier` int(11) DEFAULT NULL,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `JournalCurrIndex` (`CurrId`) USING BTREE,
  KEY `JournalCustIndex` (`Customer`) USING BTREE,
  KEY `JournalSuppIndex` (`Supplier`) USING BTREE,
  KEY `journalcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `journalapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `jrncostcenter` (`costcenter`),
  KEY `jrncompany` (`company`),
  CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`Customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_ibfk_3` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_ibfk_4` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_ibfk_5` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jrncompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jrncostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_detail`
--

DROP TABLE IF EXISTS `journal_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal` int(11) DEFAULT NULL,
  `gl_account` int(11) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `description` text,
  `debit` double(12,2) NOT NULL,
  `credit` double(12,2) NOT NULL,
  `currency` int(11) DEFAULT NULL,
  `currRate` double(7,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JournalIndex` (`journal`) USING BTREE,
  KEY `FK_SuppIndex` (`supplier`) USING BTREE,
  KEY `FK_CustIndex` (`customer`) USING BTREE,
  KEY `FK_GLIndex` (`gl_account`) USING BTREE,
  KEY `JnlDetCurrIndex` (`currency`) USING BTREE,
  CONSTRAINT `journal_detail_ibfk_1` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_detail_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_detail_ibfk_3` FOREIGN KEY (`gl_account`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_detail_ibfk_4` FOREIGN KEY (`journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `journal_detail_ibfk_5` FOREIGN KEY (`supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_detail`
--

LOCK TABLES `journal_detail` WRITE;
/*!40000 ALTER TABLE `journal_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialreq`
--

DROP TABLE IF EXISTS `materialreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialreq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MRNum` varchar(10) DEFAULT NULL,
  `Ref` varchar(10) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `MRType` varchar(45) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `Remarks` text,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `MRStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active\n1 for closed',
  `CloseDate` timestamp NULL DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `TxnDate` datetime NOT NULL,
  `Machine` int(11) DEFAULT NULL,
  `RequestDept` int(11) DEFAULT NULL,
  `RequestStore` int(11) DEFAULT NULL,
  `Supplier` int(11) DEFAULT NULL,
  `subtotal` double(12,2) NOT NULL DEFAULT '0.00',
  `vat` double(12,2) NOT NULL DEFAULT '0.00',
  `total` double(12,2) NOT NULL DEFAULT '0.00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `service` tinyint(1) NOT NULL DEFAULT '0',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `materialissue` int(11) DEFAULT NULL,
  `salesperson` int(11) DEFAULT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `MRDeptIndex` (`DeptId`) USING BTREE,
  KEY `MRStoreIndex` (`StoreId`) USING BTREE,
  KEY `FK6749EE177D30F8A3` (`StoreId`) USING BTREE,
  KEY `FK6749EE176CE51B19` (`DeptId`) USING BTREE,
  KEY `MRRequestDeptIndex` (`RequestDept`) USING BTREE,
  KEY `MRRequestStoreIndex` (`RequestStore`) USING BTREE,
  KEY `MRMachineIndex` (`Machine`) USING BTREE,
  KEY `MRcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `MRapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `Index_15` (`MRStatus`) USING BTREE,
  KEY `Index_16` (`ApprovalStatus`) USING BTREE,
  KEY `Index_17` (`CreateDate`) USING BTREE,
  KEY `MRSupplier` (`Supplier`) USING BTREE,
  KEY `MRstockissue` (`materialissue`) USING BTREE,
  KEY `matreqPersonel` (`salesperson`) USING BTREE,
  KEY `matreqVehicle` (`vehicle`) USING BTREE,
  KEY `materialreqcostcenter` (`costcenter`),
  KEY `materialreqcompany` (`company`),
  CONSTRAINT `materialreq_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_10` FOREIGN KEY (`RequestStore`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_11` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_12` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_13` FOREIGN KEY (`salesperson`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_14` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_4` FOREIGN KEY (`materialissue`) REFERENCES `stockissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_8` FOREIGN KEY (`Machine`) REFERENCES `assetregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_ibfk_9` FOREIGN KEY (`RequestDept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreqcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreqcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialreq`
--

LOCK TABLES `materialreq` WRITE;
/*!40000 ALTER TABLE `materialreq` DISABLE KEYS */;
INSERT INTO `materialreq` VALUES (1,NULL,'MR',33,'DEVICES',NULL,NULL,7,'2016-02-18',0,NULL,NULL,7,'2016-02-19 01:50:47',1,'2016-02-18 20:50:47',NULL,NULL,NULL,NULL,0.00,0.00,0.00,0,0,0,NULL,NULL,NULL,NULL,NULL),(2,NULL,'MR',NULL,'DEVICES',NULL,NULL,7,'2016-02-18',0,NULL,NULL,7,'2016-02-19 01:52:21',1,'2016-02-18 20:52:21',NULL,NULL,NULL,NULL,0.00,0.00,0.00,0,0,0,NULL,NULL,NULL,NULL,NULL),(3,NULL,'MR',NULL,'DEVICES',NULL,NULL,7,'2016-02-19',0,NULL,NULL,7,'2016-02-19 15:54:21',1,'2016-02-19 10:54:21',NULL,NULL,NULL,NULL,0.00,0.00,0.00,0,0,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `materialreq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialreq_details`
--

DROP TABLE IF EXISTS `materialreq_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialreq_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MRId` int(11) DEFAULT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Quantity` double(12,2) DEFAULT NULL,
  `UomId` int(11) DEFAULT NULL,
  `CurrentQty` double(12,2) DEFAULT NULL,
  `BookedQty` double(12,2) DEFAULT NULL,
  `UsedQty` double(12,2) DEFAULT NULL,
  `ExpenseAcc` int(11) DEFAULT NULL,
  `Price` double(12,2) NOT NULL DEFAULT '0.00',
  `Total` double(12,2) NOT NULL DEFAULT '0.00',
  `Vat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `MRDetItemId` (`ItemId`) USING BTREE,
  KEY `MRDetMRIndex` (`MRId`) USING BTREE,
  KEY `MRDetUomIndex` (`UomId`) USING BTREE,
  KEY `MRCoA` (`ExpenseAcc`) USING BTREE,
  KEY `Index_8` (`Quantity`) USING BTREE,
  KEY `MRVat` (`Vat`) USING BTREE,
  CONSTRAINT `materialreq_details_ibfk_2` FOREIGN KEY (`ExpenseAcc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_details_ibfk_3` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_details_ibfk_4` FOREIGN KEY (`MRId`) REFERENCES `materialreq` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_details_ibfk_5` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreq_details_ibfk_6` FOREIGN KEY (`Vat`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialreq_details`
--

LOCK TABLES `materialreq_details` WRITE;
/*!40000 ALTER TABLE `materialreq_details` DISABLE KEYS */;
INSERT INTO `materialreq_details` VALUES (1,1,36,NULL,3.00,2,10.00,NULL,NULL,2217,0.00,0.00,NULL),(2,2,36,NULL,2.00,2,7.00,NULL,NULL,2217,0.00,0.00,NULL),(3,3,36,NULL,2.00,2,5.00,NULL,NULL,2217,0.00,0.00,NULL);
/*!40000 ALTER TABLE `materialreq_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialreturn`
--

DROP TABLE IF EXISTS `materialreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialreturn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dept` int(11) DEFAULT NULL,
  `returnNo` varchar(45) DEFAULT NULL,
  `IssueNo` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `approvedStatus` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `Store` int(11) DEFAULT NULL,
  `Remarks` text,
  `ReturnDept` int(11) DEFAULT NULL,
  `ReturnStore` int(11) DEFAULT NULL,
  `Machine` int(11) DEFAULT NULL,
  `ReturnType` varchar(45) DEFAULT NULL,
  `subtotal` double(12,2) NOT NULL DEFAULT '0.00',
  `vat` double(12,2) NOT NULL DEFAULT '0.00',
  `total` double(12,2) NOT NULL DEFAULT '0.00',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MatRetIssueIndex` (`IssueNo`) USING BTREE,
  KEY `MatRetDeptIndex` (`Dept`) USING BTREE,
  KEY `MatRetStoreIndex` (`Store`) USING BTREE,
  KEY `MatRetReturnDept` (`ReturnDept`) USING BTREE,
  KEY `MatRetMachine` (`Machine`) USING BTREE,
  KEY `MatRetReturnStore` (`ReturnStore`) USING BTREE,
  KEY `MatretcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `MatretapprovedBy` (`approvedBy`) USING BTREE,
  KEY `matreturncostcenter` (`costcenter`),
  KEY `matreturncompany` (`company`),
  CONSTRAINT `materialreturn_ibfk_1` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_2` FOREIGN KEY (`IssueNo`) REFERENCES `stockissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_4` FOREIGN KEY (`Machine`) REFERENCES `assetregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_5` FOREIGN KEY (`ReturnDept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_6` FOREIGN KEY (`ReturnStore`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_7` FOREIGN KEY (`Store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_8` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materialreturn_ibfk_9` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matreturncompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matreturncostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialreturn`
--

LOCK TABLES `materialreturn` WRITE;
/*!40000 ALTER TABLE `materialreturn` DISABLE KEYS */;
INSERT INTO `materialreturn` VALUES (1,NULL,'RN',10,'2016-02-18',7,'2016-02-18 20:57:51',1,7,'2016-02-18 20:57:22',NULL,'',NULL,NULL,NULL,'DEVICES',0.00,0.00,0.00,NULL,NULL),(2,NULL,'RN',11,'2016-02-19',7,'2016-02-19 11:02:16',1,7,'2016-02-19 11:01:51',NULL,'',NULL,NULL,NULL,'DEVICES',0.00,0.00,0.00,NULL,NULL);
/*!40000 ALTER TABLE `materialreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcodes`
--

DROP TABLE IF EXISTS `postcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcodes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) NOT NULL,
  `AreaDesc` varchar(200) NOT NULL,
  `CreateDate` date NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApproveDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Code_UNIQUE` (`Code`) USING BTREE,
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  KEY `pcodecreatedBy` (`CreatedBy`) USING BTREE,
  KEY `pcodeapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `postcodecostcenter` (`costcenter`),
  KEY `postcodecompany` (`company`),
  CONSTRAINT `postcodecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postcodecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postcodes_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postcodes_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcodes`
--

LOCK TABLES `postcodes` WRITE;
/*!40000 ALTER TABLE `postcodes` DISABLE KEYS */;
INSERT INTO `postcodes` VALUES (1,'00100','GPO NAIROBI','2014-03-23',NULL,NULL,1,NULL,'2014-03-23 11:46:08',NULL,NULL),(2,'00300','HOLA','2014-03-23',NULL,NULL,0,NULL,'2014-03-23 11:46:37',NULL,NULL),(3,'00200','Nairobi','2016-01-07',7,'2016-01-07 16:22:05',1,7,'2016-01-07 11:21:33',NULL,NULL),(4,'00600','Nairobi','2016-01-07',7,'2016-01-07 16:23:04',1,7,'2016-01-07 11:22:05',NULL,NULL);
/*!40000 ALTER TABLE `postcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelist`
--

DROP TABLE IF EXISTS `pricelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Inventory` int(11) DEFAULT NULL,
  `Oldprice` double(12,2) NOT NULL DEFAULT '0.00',
  `Newprice` double(12,2) NOT NULL DEFAULT '0.00',
  `CreatDate` date NOT NULL DEFAULT '0000-00-00',
  `TxnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Createdby` int(11) DEFAULT NULL,
  `Approved` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Approvedby` int(11) DEFAULT NULL,
  `Approveddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `OldCost` double(12,2) NOT NULL DEFAULT '0.00',
  `NewCost` double NOT NULL DEFAULT '0',
  `customer` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Inventry` (`Inventory`) USING BTREE,
  KEY `pricecreatedBy` (`Createdby`) USING BTREE,
  KEY `priceapprovedBy` (`Approvedby`) USING BTREE,
  KEY `priceListCustomer` (`customer`) USING BTREE,
  KEY `pricelistcostcenter` (`costcenter`),
  KEY `pricelistcompany` (`company`),
  CONSTRAINT `pricelist_ibfk_1` FOREIGN KEY (`Inventory`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelist_ibfk_3` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelist_ibfk_4` FOREIGN KEY (`Approvedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelist_ibfk_5` FOREIGN KEY (`Createdby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelistcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelistcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist`
--

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseledger`
--

DROP TABLE IF EXISTS `purchaseledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DocType` varchar(45) DEFAULT NULL,
  `Suppinvoice` int(11) DEFAULT NULL,
  `Description` text,
  `SuppId` int(11) NOT NULL,
  `CurrId` int(11) NOT NULL,
  `CurrRate` double(12,2) NOT NULL,
  `DebitAmt` double(12,2) NOT NULL,
  `CreditAmt` double(12,2) NOT NULL,
  `AccCode` int(11) NOT NULL,
  `Journal` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Creditnote` int(11) DEFAULT NULL,
  `Cashbook` int(11) DEFAULT NULL,
  `Receipt_reg` int(11) DEFAULT NULL,
  `Deposit` int(11) DEFAULT NULL,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `Allocation` int(11) DEFAULT NULL,
  `Financialperiod` int(11) NOT NULL,
  `Remittance` int(11) DEFAULT NULL,
  `DocNum` varchar(45) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `Allocated` tinyint(1) NOT NULL DEFAULT '0',
  `Materialissue` int(11) DEFAULT NULL,
  `Materialreturn` int(11) DEFAULT NULL,
  `Inventory` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PurLedSuppIndex_idx` (`SuppId`) USING BTREE,
  KEY `PurLedCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `PurLedSuppinvoiceIndex` (`Suppinvoice`) USING BTREE,
  KEY `PurLedCnoteIndex` (`Creditnote`) USING BTREE,
  KEY `PurLedJournalIndex` (`Journal`) USING BTREE,
  KEY `PurLedCashbkIndex` (`Cashbook`) USING BTREE,
  KEY `PurLedReceiptregIndex` (`Receipt_reg`) USING BTREE,
  KEY `PurLedDepositIndex` (`Deposit`) USING BTREE,
  KEY `PurLedCoaIndex` (`AccCode`) USING BTREE,
  KEY `PurLedAllocIndex` (`Allocation`) USING BTREE,
  KEY `PurLedFinperiodIndex` (`Financialperiod`) USING BTREE,
  KEY `PurLedRemittIndex` (`Remittance`) USING BTREE,
  KEY `PurLedcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `PurLedapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `PurLedMaterialissue` (`Materialissue`) USING BTREE,
  KEY `PurLedMaterialreturn` (`Materialreturn`) USING BTREE,
  KEY `PurLedInventory` (`Inventory`) USING BTREE,
  KEY `plcostcenter` (`costcenter`),
  KEY `plcompany` (`company`),
  CONSTRAINT `plcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_1` FOREIGN KEY (`Allocation`) REFERENCES `supplierallocation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_10` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_13` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_14` FOREIGN KEY (`Receipt_reg`) REFERENCES `chequeregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_15` FOREIGN KEY (`Creditnote`) REFERENCES `purcreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_16` FOREIGN KEY (`AccCode`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_17` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_18` FOREIGN KEY (`Deposit`) REFERENCES `deposit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_19` FOREIGN KEY (`Financialperiod`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_2` FOREIGN KEY (`Inventory`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_3` FOREIGN KEY (`Journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_4` FOREIGN KEY (`Materialissue`) REFERENCES `stockissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_5` FOREIGN KEY (`Materialreturn`) REFERENCES `materialreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_6` FOREIGN KEY (`Remittance`) REFERENCES `remmitance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_7` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_8` FOREIGN KEY (`Suppinvoice`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseledger_ibfk_9` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseledger`
--

LOCK TABLES `purchaseledger` WRITE;
/*!40000 ALTER TABLE `purchaseledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PONum` varchar(45) DEFAULT NULL,
  `SuppId` int(11) DEFAULT NULL,
  `POReqId` int(11) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(12,2) DEFAULT NULL,
  `remarks` text,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` datetime DEFAULT NULL,
  `Vat` double(12,2) NOT NULL,
  `Subtotal` double(12,2) NOT NULL,
  `TotalAmt` double(12,2) NOT NULL,
  `FilteredBySupp` tinyint(1) NOT NULL,
  `ServicePO` tinyint(1) NOT NULL,
  `Scheme` varchar(45) DEFAULT NULL,
  `totalorderQty` double(12,2) DEFAULT '0.00',
  `vatinclusive` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PurOrdReqIndex_idx` (`POReqId`) USING BTREE,
  KEY `PurOrdSuppIndex_idx` (`SuppId`) USING BTREE,
  KEY `PurOrdDeptIndex_idx` (`DeptId`) USING BTREE,
  KEY `PurOrdStoreIndex_idx` (`StoreId`) USING BTREE,
  KEY `PurOrdCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `FKB1F87AED7D30F8A3` (`StoreId`) USING BTREE,
  KEY `FKB1F87AED6CE51B19` (`DeptId`) USING BTREE,
  KEY `FKB1F87AED1281DB80` (`POReqId`) USING BTREE,
  KEY `FKB1F87AEDFB7A88D3` (`CurrId`) USING BTREE,
  KEY `FKB1F87AEDD2FE9D4F` (`SuppId`) USING BTREE,
  KEY `PurOrdcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `PurOrdapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `pocostcenter` (`costcenter`),
  KEY `pocompany` (`company`),
  CONSTRAINT `pocompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pocostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_2` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_3` FOREIGN KEY (`POReqId`) REFERENCES `purchaserequisition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_4` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_5` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_6` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (2,'PO',1,NULL,NULL,NULL,1,1.00,'',0,NULL,NULL,'2016-02-19',7,'2016-02-19 15:48:06',7,1,'2016-02-19 10:48:06',1840.00,9660.00,11500.00,0,0,NULL,5.00,1,NULL,NULL);
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorderdetail`
--

DROP TABLE IF EXISTS `purchaseorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PONum` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `Description` text,
  `UomId` int(11) DEFAULT NULL,
  `Qty` double(12,2) DEFAULT NULL,
  `UnitPrice` double(12,2) DEFAULT NULL,
  `TotalAmt` double(12,2) DEFAULT NULL,
  `VatId` int(11) DEFAULT NULL,
  `VatRate` double(12,2) DEFAULT NULL,
  `remarks` text,
  `Currency` int(11) DEFAULT NULL,
  `Curr_rate` double(12,2) DEFAULT NULL,
  `Coa` int(11) DEFAULT NULL,
  `PendingQty` double(12,2) DEFAULT '0.00',
  `PRdetail` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PurOrdHeaderIndex_idx` (`PONum`) USING BTREE,
  KEY `PurOrdItemIndex_idx` (`ItemId`) USING BTREE,
  KEY `PurOrdVatIndex_idx` (`VatId`) USING BTREE,
  KEY `PurOrdUomIndex_idx` (`UomId`) USING BTREE,
  KEY `PurOrdCurrencyIndex` (`Currency`) USING BTREE,
  KEY `PurOrdCoaIndex` (`Coa`) USING BTREE,
  KEY `prdetailindex` (`PRdetail`) USING BTREE,
  CONSTRAINT `purchaseorderdetail_ibfk_1` FOREIGN KEY (`Coa`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_2` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_3` FOREIGN KEY (`PONum`) REFERENCES `purchaseorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_4` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_5` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_6` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_7` FOREIGN KEY (`PRdetail`) REFERENCES `purchasereqdetail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderdetail`
--

LOCK TABLES `purchaseorderdetail` WRITE;
/*!40000 ALTER TABLE `purchaseorderdetail` DISABLE KEYS */;
INSERT INTO `purchaseorderdetail` VALUES (1,2,36,NULL,NULL,5.00,2300.00,11500.00,2,16.00,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchaseorderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasereqdetail`
--

DROP TABLE IF EXISTS `purchasereqdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasereqdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UomId` int(11) DEFAULT NULL,
  `Reqid` int(11) DEFAULT NULL,
  `Itemid` int(11) DEFAULT NULL,
  `Qty` double NOT NULL,
  `PlaceOrder` tinyint(1) NOT NULL,
  `Reorderlevel` double(12,2) DEFAULT NULL,
  `CurrQty` double(12,2) DEFAULT NULL,
  `PreferredSupp` int(11) DEFAULT NULL,
  `monthlyConsumption` double(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FKDE106E8E4AC7DD75` (`Itemid`) USING BTREE,
  KEY `FKDE106E8E7342EF6C` (`UomId`) USING BTREE,
  KEY `FKDE106E8E305E021F` (`Reqid`) USING BTREE,
  KEY `PurchreqdetSuppIndex` (`PreferredSupp`) USING BTREE,
  CONSTRAINT `purchasereqdetail_ibfk_1` FOREIGN KEY (`Itemid`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereqdetail_ibfk_2` FOREIGN KEY (`PreferredSupp`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereqdetail_ibfk_3` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereqdetail_ibfk_4` FOREIGN KEY (`Reqid`) REFERENCES `purchaserequisition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasereqdetail`
--

LOCK TABLES `purchasereqdetail` WRITE;
/*!40000 ALTER TABLE `purchasereqdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasereqdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaserequisition`
--

DROP TABLE IF EXISTS `purchaserequisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaserequisition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ref` varchar(45) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovedBy` int(11) DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `PRClosed` tinyint(1) NOT NULL DEFAULT '0',
  `Dept` int(11) DEFAULT NULL,
  `Supplier` int(11) DEFAULT NULL,
  `Currency` int(11) DEFAULT NULL,
  `CurrRate` double(12,2) DEFAULT NULL,
  `ReorderGenerated` tinyint(1) NOT NULL,
  `Porder` int(11) DEFAULT NULL,
  `Scheme` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PurReqStoreIndex_idx` (`StoreId`) USING BTREE,
  KEY `FK53FCD0FB7D30F8A3` (`StoreId`) USING BTREE,
  KEY `PurReqDeptIndex` (`Dept`) USING BTREE,
  KEY `PurReqSuppIndex` (`Supplier`) USING BTREE,
  KEY `PurReqCurrIndex` (`Currency`) USING BTREE,
  KEY `PurReqPOrderIndex` (`Porder`) USING BTREE,
  KEY `PurreqcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `PurreqapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `purchasereqcostcenter` (`costcenter`),
  KEY `purchasereqcompany` (`company`),
  CONSTRAINT `purchasereqcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereqcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaserequisition_ibfk_1` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchaserequisition_ibfk_2` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchaserequisition_ibfk_3` FOREIGN KEY (`Porder`) REFERENCES `purchaseorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchaserequisition_ibfk_4` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchaserequisition_ibfk_5` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchaserequisition_ibfk_6` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchaserequisition_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaserequisition`
--

LOCK TABLES `purchaserequisition` WRITE;
/*!40000 ALTER TABLE `purchaserequisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaserequisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasereturnnote`
--

DROP TABLE IF EXISTS `purchasereturnnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasereturnnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PRNNo` varchar(45) DEFAULT NULL,
  `GrnNo` int(11) DEFAULT NULL,
  `SuppId` int(11) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(12,3) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `remarks` text,
  `TotalAmt` double(12,3) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Transporter` int(11) DEFAULT NULL,
  `Driver` varchar(80) DEFAULT NULL,
  `Reg_No` varchar(45) DEFAULT NULL,
  `Trans_Type` varchar(45) DEFAULT NULL,
  `Loadedby` int(11) DEFAULT NULL,
  `Credited` tinyint(1) NOT NULL,
  `Creditnote` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PrnSuppIndex_idx` (`SuppId`) USING BTREE,
  KEY `PrnCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `PrnDeptIndex_idx` (`DeptId`) USING BTREE,
  KEY `PrnStoreIndex_idx` (`StoreId`) USING BTREE,
  KEY `FKB4CB4CE37D30F8A3` (`StoreId`) USING BTREE,
  KEY `FKB4CB4CE36CE51B19` (`DeptId`) USING BTREE,
  KEY `FKB4CB4CE3FB7A88D3` (`CurrId`) USING BTREE,
  KEY `FKB4CB4CE3D2FE9D4F` (`SuppId`) USING BTREE,
  KEY `PrnTransporterIndex` (`Transporter`) USING BTREE,
  KEY `PrnCreditnoteIndex` (`Creditnote`) USING BTREE,
  KEY `PRNSuppInvNo_idx` (`GrnNo`) USING BTREE,
  KEY `PrncreatedBy` (`CreatedBy`) USING BTREE,
  KEY `PrnapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `purchasereturncostcentr` (`costcenter`),
  KEY `purchasereturncompany` (`company`),
  CONSTRAINT `purchasereturncompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereturncostcentr` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereturnnote_ibfk_1` FOREIGN KEY (`Creditnote`) REFERENCES `purcreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereturnnote_ibfk_2` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchasereturnnote_ibfk_3` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchasereturnnote_ibfk_4` FOREIGN KEY (`GrnNo`) REFERENCES `goodsreceipt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereturnnote_ibfk_5` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchasereturnnote_ibfk_6` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchasereturnnote_ibfk_7` FOREIGN KEY (`Transporter`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchasereturnnote_ibfk_8` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchasereturnnote_ibfk_9` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasereturnnote`
--

LOCK TABLES `purchasereturnnote` WRITE;
/*!40000 ALTER TABLE `purchasereturnnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasereturnnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purcreditnote`
--

DROP TABLE IF EXISTS `purcreditnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purcreditnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PurCredId` varchar(45) DEFAULT NULL,
  `PurRetNo` int(11) DEFAULT NULL,
  `SuppInvNo` int(11) DEFAULT NULL,
  `SuppId` int(11) DEFAULT NULL,
  `SuppCredNoteRef` varchar(45) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(12,2) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `TotalAmt` double(12,2) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `Closed` tinyint(1) DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `VatAmt` double(12,2) NOT NULL,
  `Subtotal` double(12,2) NOT NULL,
  `Remarks` text,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `Service` tinyint(1) NOT NULL DEFAULT '0',
  `vatinclusive` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PCNPrnIndex_idx` (`PurRetNo`) USING BTREE,
  KEY `PCNSuppInvIndex_idx` (`SuppInvNo`) USING BTREE,
  KEY `PCNSuppIndex_idx` (`SuppId`) USING BTREE,
  KEY `PCNCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `PCNDeptIndex_idx` (`DeptId`) USING BTREE,
  KEY `PCNStoreIndex_idx` (`StoreId`) USING BTREE,
  KEY `FK9C43D387D30F8A3` (`StoreId`) USING BTREE,
  KEY `FK9C43D386CE51B19` (`DeptId`) USING BTREE,
  KEY `FK9C43D38CD16B31C` (`SuppInvNo`) USING BTREE,
  KEY `FK9C43D38BA6F7CD` (`PurRetNo`) USING BTREE,
  KEY `FK9C43D38FB7A88D3` (`CurrId`) USING BTREE,
  KEY `FK9C43D38D2FE9D4F` (`SuppId`) USING BTREE,
  KEY `PCNcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `PCNapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `purcreditnotecostcenter` (`costcenter`),
  KEY `purcreditnotecompany` (`company`),
  CONSTRAINT `purcreditnote_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_2` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_3` FOREIGN KEY (`PurRetNo`) REFERENCES `purchasereturnnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_4` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_5` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_6` FOREIGN KEY (`SuppInvNo`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_7` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnote_ibfk_8` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnotecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcreditnotecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purcreditnote`
--

LOCK TABLES `purcreditnote` WRITE;
/*!40000 ALTER TABLE `purcreditnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `purcreditnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purcrednotedetail`
--

DROP TABLE IF EXISTS `purcrednotedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purcrednotedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PCNId` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `UomId` int(11) DEFAULT NULL,
  `Qty` double(12,2) DEFAULT NULL,
  `UnitPrice` double(12,2) DEFAULT NULL,
  `VatId` int(11) DEFAULT NULL,
  `VatRate` double(12,2) DEFAULT NULL,
  `TotalAmt` double(12,2) DEFAULT NULL,
  `Coa` int(11) DEFAULT NULL,
  `Currency` int(11) DEFAULT NULL,
  `CurrRate` double(12,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `PCNHeaderIndex_idx` (`PCNId`) USING BTREE,
  KEY `PCNDetItemIndex_idx` (`ItemId`) USING BTREE,
  KEY `PCNDetUomIndex_idx` (`UomId`) USING BTREE,
  KEY `PCNDetVatIndex_idx` (`VatId`) USING BTREE,
  KEY `PCNCoaIndex` (`Coa`) USING BTREE,
  KEY `PCNDetCurrencyIndex` (`Currency`) USING BTREE,
  CONSTRAINT `purcrednotedetail_ibfk_1` FOREIGN KEY (`Coa`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcrednotedetail_ibfk_2` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcrednotedetail_ibfk_3` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purcrednotedetail_ibfk_4` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purcrednotedetail_ibfk_5` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purcrednotedetail_ibfk_6` FOREIGN KEY (`PCNId`) REFERENCES `purcreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purcrednotedetail`
--

LOCK TABLES `purcrednotedetail` WRITE;
/*!40000 ALTER TABLE `purcrednotedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `purcrednotedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation`
--

DROP TABLE IF EXISTS `quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QuoteId` varchar(10) DEFAULT NULL,
  `CustId` int(11) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `CurrRate` double(9,4) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `QuoteExpiryDate` datetime DEFAULT NULL,
  `DiscountRate` double(3,2) DEFAULT NULL,
  `DiscAmount` double(9,2) DEFAULT NULL,
  `VATId` int(11) DEFAULT NULL,
  `VatAmount` double(9,2) DEFAULT NULL,
  `QuoteClosed` tinyint(1) NOT NULL DEFAULT '0',
  `TotalAmount` double(9,2) DEFAULT '0.00',
  `Remarks` text,
  `CloseDate` timestamp NULL DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Shipping_add` int(11) DEFAULT NULL,
  `SubTotal` double(9,2) DEFAULT NULL,
  `Terms` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `QuoteCurrId` (`CurrencyId`) USING BTREE,
  KEY `QuoteCustId` (`CustId`) USING BTREE,
  KEY `QuoteStoreId` (`StoreId`) USING BTREE,
  KEY `FK_quotation_7` (`Shipping_add`) USING BTREE,
  KEY `FK_quotation_8` (`VATId`) USING BTREE,
  KEY `QuotecreatedBy` (`CreatedBy`) USING BTREE,
  KEY `QuoteapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `quotecostcenter` (`costcenter`),
  KEY `quotecompany` (`company`),
  CONSTRAINT `quotation_ibfk_1` FOREIGN KEY (`CurrencyId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_ibfk_2` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_ibfk_4` FOREIGN KEY (`Shipping_add`) REFERENCES `shippingadd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_ibfk_5` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_ibfk_6` FOREIGN KEY (`VATId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_ibfk_7` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_ibfk_8` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation`
--

LOCK TABLES `quotation` WRITE;
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_detail`
--

DROP TABLE IF EXISTS `quotation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QuoteId` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `UomId` int(11) DEFAULT NULL,
  `Quantity` double(9,3) DEFAULT NULL,
  `Unit_Price` double(9,2) DEFAULT NULL,
  `VatId` int(11) DEFAULT NULL,
  `VatRate` double(9,3) DEFAULT NULL,
  `TotalAmount` double(9,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `QuoteDetQuoteId` (`QuoteId`) USING BTREE,
  KEY `QuoteDetVatId` (`VatId`) USING BTREE,
  KEY `QuoteInvIndex_idx` (`ItemId`) USING BTREE,
  KEY `QuoteUomIndex_idx` (`UomId`) USING BTREE,
  CONSTRAINT `quotation_detail_ibfk_2` FOREIGN KEY (`QuoteId`) REFERENCES `quotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_detail_ibfk_3` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_detail_ibfk_4` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_detail_ibfk_5` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_detail`
--

LOCK TABLES `quotation_detail` WRITE;
/*!40000 ALTER TABLE `quotation_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptreg_detail`
--

DROP TABLE IF EXISTS `receiptreg_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiptreg_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Receipt_reg` int(11) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `Supplier` int(11) DEFAULT NULL,
  `Mode` varchar(45) DEFAULT NULL,
  `Reference` varchar(45) DEFAULT NULL,
  `ReceiptDate` datetime DEFAULT NULL,
  `Bank` int(11) DEFAULT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `Remarks` text,
  `Deposited` tinyint(1) NOT NULL,
  `DepositDate` datetime DEFAULT NULL,
  `Bankbranch` int(11) DEFAULT NULL,
  `Acc_code` int(11) DEFAULT NULL,
  `Receipt_Cat` varchar(45) NOT NULL,
  `Deposit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ReciptregIndex` (`Receipt_reg`) USING BTREE,
  KEY `FK_CustomerIndex` (`Customer`) USING BTREE,
  KEY `FK_SupplierIndex` (`Supplier`) USING BTREE,
  KEY `FK_BankIndex` (`Bank`) USING BTREE,
  KEY `FK_BankBranchIndex` (`Bankbranch`) USING BTREE,
  KEY `ReceitregCoaIndex` (`Acc_code`) USING BTREE,
  KEY `ReceiptregdetailDepositIndex` (`Deposit`) USING BTREE,
  CONSTRAINT `receiptreg_detail_ibfk_1` FOREIGN KEY (`Bankbranch`) REFERENCES `bankcodes` (`Id`),
  CONSTRAINT `receiptreg_detail_ibfk_2` FOREIGN KEY (`Bank`) REFERENCES `banks` (`id`),
  CONSTRAINT `receiptreg_detail_ibfk_3` FOREIGN KEY (`Customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `receiptreg_detail_ibfk_4` FOREIGN KEY (`Receipt_reg`) REFERENCES `receiptregister` (`id`),
  CONSTRAINT `receiptreg_detail_ibfk_5` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `receiptreg_detail_ibfk_6` FOREIGN KEY (`Deposit`) REFERENCES `deposit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `receiptreg_detail_ibfk_7` FOREIGN KEY (`Acc_code`) REFERENCES `chartaccount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptreg_detail`
--

LOCK TABLES `receiptreg_detail` WRITE;
/*!40000 ALTER TABLE `receiptreg_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiptreg_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptregister`
--

DROP TABLE IF EXISTS `receiptregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiptregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Acc_code` int(11) DEFAULT NULL,
  `Currency` int(11) NOT NULL,
  `Curr_rate` decimal(12,2) NOT NULL,
  `Receipt_cat` varchar(45) DEFAULT NULL,
  `Remarks` text,
  `TxnDate` datetime NOT NULL,
  `CreateDate` date NOT NULL,
  `Dept` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `Total` decimal(12,2) NOT NULL,
  `ReceiptregNo` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ReceiptregCoaIndex` (`Acc_code`) USING BTREE,
  KEY `ReceiptregDeptIndex` (`Dept`) USING BTREE,
  KEY `ReceiptregCurrIndex` (`Currency`) USING BTREE,
  KEY `ReceiptregcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `ReceiptregapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `receiptregcostcenter` (`costcenter`),
  KEY `receiptregcompany` (`company`),
  CONSTRAINT `receiptregcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptregcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptregister_ibfk_1` FOREIGN KEY (`Acc_code`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptregister_ibfk_2` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptregister_ibfk_3` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptregister_ibfk_4` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptregister_ibfk_5` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptregister`
--

LOCK TABLES `receiptregister` WRITE;
/*!40000 ALTER TABLE `receiptregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiptregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reconciliation`
--

DROP TABLE IF EXISTS `reconciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reconciliation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ReconId` int(11) DEFAULT NULL,
  `StatementDate` date DEFAULT NULL,
  `ReconType` varchar(45) DEFAULT NULL,
  `ClosingBal` double(12,2) DEFAULT '0.00',
  `unPresentedTtl` double(12,2) DEFAULT '0.00',
  `unCreditedTtl` double(12,2) DEFAULT '0.00',
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `Coa` int(11) DEFAULT NULL,
  `StatementBal` double(12,2) DEFAULT NULL,
  `CashbookBal` double(12,2) DEFAULT NULL,
  `Difference` double(12,2) DEFAULT NULL,
  `ReconAmt` double(12,2) DEFAULT NULL,
  `Period` int(11) DEFAULT NULL,
  `Approved` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `Transactions` varchar(45) DEFAULT NULL,
  `PeriodStart` date DEFAULT NULL,
  `PeriodEnd` date NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `ReconCoaIndex` (`Coa`) USING BTREE,
  KEY `reconcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `reconapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `reconcostcenter` (`costcenter`),
  KEY `reconcompany` (`company`),
  CONSTRAINT `reconciliation_ibfk_1` FOREIGN KEY (`Coa`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reconciliation_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reconciliation_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reconcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reconcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reconciliation`
--

LOCK TABLES `reconciliation` WRITE;
/*!40000 ALTER TABLE `reconciliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reconciliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remmitance`
--

DROP TABLE IF EXISTS `remmitance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remmitance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RemId` int(11) DEFAULT NULL,
  `SuppId` int(11) DEFAULT NULL,
  `Amount` double(12,2) DEFAULT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  `PaymentRef` varchar(45) DEFAULT NULL,
  `PaymentMode` varchar(45) DEFAULT NULL,
  `DocType` varchar(45) DEFAULT NULL,
  `Remarks` text,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Period` varchar(45) DEFAULT NULL,
  `Processed` tinyint(1) NOT NULL DEFAULT '0',
  `Department` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `RemmSuppIdIndex_idx` (`SuppId`) USING BTREE,
  KEY `RemmDeptIndex` (`Department`) USING BTREE,
  KEY `remcreatedBY` (`CreatedBy`) USING BTREE,
  KEY `remapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `remittcostcenter` (`costcenter`),
  KEY `remittcompany` (`company`),
  CONSTRAINT `remittcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remittcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remmitance_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remmitance_ibfk_2` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remmitance_ibfk_3` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remmitance_ibfk_4` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remmitance`
--

LOCK TABLES `remmitance` WRITE;
/*!40000 ALTER TABLE `remmitance` DISABLE KEYS */;
/*!40000 ALTER TABLE `remmitance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remmitancedetail`
--

DROP TABLE IF EXISTS `remmitancedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remmitancedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RemId` int(11) DEFAULT NULL,
  `InvNo` int(11) DEFAULT NULL,
  `Invrate` double(12,3) DEFAULT NULL,
  `InvAmt` double(12,3) DEFAULT NULL,
  `RemDesc` varchar(45) DEFAULT NULL,
  `InvDate` datetime DEFAULT NULL,
  `ClearBal` tinyint(1) DEFAULT NULL,
  `TotalRemitt` double(12,2) DEFAULT NULL,
  `RemittAmount` double(12,2) DEFAULT NULL,
  `BalafterRemit` double(12,2) DEFAULT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  `Docno` varchar(45) DEFAULT NULL,
  `purchaseledger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `RemDetHeaderIndex_idx` (`RemId`) USING BTREE,
  KEY `RemDetInvIndex_idx` (`InvNo`) USING BTREE,
  KEY `purchLdgerIndex_idx` (`purchaseledger`) USING BTREE,
  CONSTRAINT `remmitancedetail_ibfk_1` FOREIGN KEY (`RemId`) REFERENCES `remmitance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remmitancedetail_ibfk_2` FOREIGN KEY (`InvNo`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remmitancedetail_ibfk_3` FOREIGN KEY (`purchaseledger`) REFERENCES `purchaseledger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remmitancedetail`
--

LOCK TABLES `remmitancedetail` WRITE;
/*!40000 ALTER TABLE `remmitancedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `remmitancedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_settaccess`
--

DROP TABLE IF EXISTS `role_settaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_settaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Companysett_companyinfo` int(11) DEFAULT NULL,
  `Companysett_dept` int(11) DEFAULT NULL,
  `Companysett_store` int(11) DEFAULT NULL,
  `Companysett_asset` int(11) DEFAULT NULL,
  `Companysett_param` int(11) DEFAULT NULL,
  `Companysett_role` int(11) DEFAULT NULL,
  `Companysett_formaccess` int(11) DEFAULT NULL,
  `Companysett_roleaccess` int(11) DEFAULT NULL,
  `Companysett_user` int(11) DEFAULT NULL,
  `Globalsett_postcode` int(11) DEFAULT NULL,
  `Globalsett_country` int(11) DEFAULT NULL,
  `Globalsett_city` int(11) DEFAULT NULL,
  `Inventsett_uom` int(11) DEFAULT NULL,
  `Inventsett_cartontype` int(11) DEFAULT NULL,
  `Inventsett_gsm` int(11) DEFAULT NULL,
  `Inventsett_reeltype` int(11) DEFAULT NULL,
  `Inventsett_reelwidth` int(11) DEFAULT NULL,
  `Inventsett_invclass` int(11) DEFAULT NULL,
  `Inventsett_group` int(11) DEFAULT NULL,
  `Inventsett_subgroup` int(11) DEFAULT NULL,
  `Prodsett_shift` int(11) DEFAULT NULL,
  `Prodsett_machinesett` int(11) DEFAULT NULL,
  `Prodsett_creasetype` int(11) DEFAULT NULL,
  `Prodsett_qccheckpoint` int(11) DEFAULT NULL,
  `Settings` int(11) DEFAULT NULL,
  `Financesett_bank` int(11) DEFAULT NULL,
  `Financesett_branch` int(11) DEFAULT NULL,
  `Financesett_vat` int(11) DEFAULT NULL,
  `Financesett_currency` int(11) DEFAULT NULL,
  `Financesett_defaultacc` int(11) DEFAULT NULL,
  `Role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyinfo` (`Companysett_companyinfo`) USING BTREE,
  KEY `companydept` (`Companysett_dept`) USING BTREE,
  KEY `companystore` (`Companysett_store`) USING BTREE,
  KEY `companyasset` (`Companysett_asset`) USING BTREE,
  KEY `companyparam` (`Companysett_param`) USING BTREE,
  KEY `formaccess` (`Companysett_formaccess`) USING BTREE,
  KEY `roleaccess` (`Companysett_roleaccess`) USING BTREE,
  KEY `user` (`Companysett_user`) USING BTREE,
  KEY `globalpostcode` (`Globalsett_postcode`) USING BTREE,
  KEY `globalcountry` (`Globalsett_country`) USING BTREE,
  KEY `globalcity` (`Globalsett_city`) USING BTREE,
  KEY `inventoryuom` (`Inventsett_uom`) USING BTREE,
  KEY `inventorycartontype` (`Inventsett_cartontype`) USING BTREE,
  KEY `inventorygsm` (`Inventsett_gsm`) USING BTREE,
  KEY `inventoryreeltype` (`Inventsett_reeltype`) USING BTREE,
  KEY `inventoryreelwidth` (`Inventsett_reelwidth`) USING BTREE,
  KEY `inventoryinvclass` (`Inventsett_invclass`) USING BTREE,
  KEY `inventorygroup` (`Inventsett_group`) USING BTREE,
  KEY `inventorysubgroup` (`Inventsett_subgroup`) USING BTREE,
  KEY `prodshift` (`Prodsett_shift`) USING BTREE,
  KEY `prodmachinesett` (`Prodsett_machinesett`) USING BTREE,
  KEY `prodcreasetype` (`Prodsett_creasetype`) USING BTREE,
  KEY `prodqcpoints` (`Prodsett_qccheckpoint`) USING BTREE,
  KEY `settings` (`Settings`) USING BTREE,
  KEY `finbank` (`Financesett_bank`) USING BTREE,
  KEY `finbranch` (`Financesett_branch`) USING BTREE,
  KEY `fincurrency` (`Financesett_currency`) USING BTREE,
  KEY `finvat` (`Financesett_vat`) USING BTREE,
  KEY `findefaultacc` (`Financesett_defaultacc`) USING BTREE,
  KEY `companyuser_role` (`Companysett_role`) USING BTREE,
  KEY `role` (`Role`) USING BTREE,
  CONSTRAINT `role_settaccess_ibfk_1` FOREIGN KEY (`Companysett_asset`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_10` FOREIGN KEY (`Inventsett_gsm`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_11` FOREIGN KEY (`Inventsett_invclass`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_12` FOREIGN KEY (`Companysett_dept`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_13` FOREIGN KEY (`Inventsett_reeltype`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_14` FOREIGN KEY (`Inventsett_reelwidth`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_15` FOREIGN KEY (`Inventsett_subgroup`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_16` FOREIGN KEY (`Inventsett_uom`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_17` FOREIGN KEY (`Prodsett_creasetype`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_18` FOREIGN KEY (`Prodsett_machinesett`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_19` FOREIGN KEY (`Prodsett_qccheckpoint`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_2` FOREIGN KEY (`Financesett_defaultacc`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_20` FOREIGN KEY (`Prodsett_shift`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_21` FOREIGN KEY (`Role`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_22` FOREIGN KEY (`Companysett_roleaccess`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_23` FOREIGN KEY (`Companysett_companyinfo`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_24` FOREIGN KEY (`Settings`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_25` FOREIGN KEY (`Companysett_user`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_26` FOREIGN KEY (`Companysett_param`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_27` FOREIGN KEY (`Companysett_store`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_28` FOREIGN KEY (`Companysett_role`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_29` FOREIGN KEY (`Financesett_bank`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_3` FOREIGN KEY (`Financesett_vat`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_30` FOREIGN KEY (`Financesett_branch`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_31` FOREIGN KEY (`Financesett_currency`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_4` FOREIGN KEY (`Companysett_formaccess`) REFERENCES `roleaccesslevels` (`id`),
  CONSTRAINT `role_settaccess_ibfk_5` FOREIGN KEY (`Globalsett_city`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_6` FOREIGN KEY (`Globalsett_country`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_7` FOREIGN KEY (`Globalsett_postcode`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_8` FOREIGN KEY (`Inventsett_cartontype`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_settaccess_ibfk_9` FOREIGN KEY (`Inventsett_group`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_settaccess`
--

LOCK TABLES `role_settaccess` WRITE;
/*!40000 ALTER TABLE `role_settaccess` DISABLE KEYS */;
INSERT INTO `role_settaccess` VALUES (1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1),(2,1,4,4,1,1,5,5,5,5,4,4,4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,14),(3,4,4,4,4,4,4,4,1,2,4,4,4,4,4,4,4,4,4,4,4,1,1,4,4,1,4,4,4,4,4,7),(5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2),(6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,5,5,5,5,5,16);
/*!40000 ALTER TABLE `role_settaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleaccess`
--

DROP TABLE IF EXISTS `roleaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sales_customer` int(11) NOT NULL DEFAULT '0',
  `Sales_shippingadd` int(11) NOT NULL DEFAULT '0',
  `Sales_quotation` int(11) NOT NULL DEFAULT '0',
  `Sales_salesorder` int(11) NOT NULL DEFAULT '0',
  `Sales_salesinvoice` int(11) NOT NULL DEFAULT '1',
  `Sales_salesreturn` int(11) NOT NULL DEFAULT '1',
  `Sales_salescnote` int(11) NOT NULL DEFAULT '0',
  `Sales_receivablereport` int(11) NOT NULL DEFAULT '0',
  `Sales_enquiry` int(11) NOT NULL DEFAULT '0',
  `Sales_pricelist` int(11) NOT NULL DEFAULT '0',
  `Sales_papermaster` int(11) NOT NULL DEFAULT '0',
  `Sales_debitnote` int(11) NOT NULL DEFAULT '0',
  `Purchase_supplier` int(11) NOT NULL DEFAULT '0',
  `Purchase_costhistory` int(11) NOT NULL DEFAULT '0',
  `Purchase_purchaserequisition` int(11) NOT NULL DEFAULT '0',
  `Purchase_purchaseorder` int(11) NOT NULL DEFAULT '0',
  `Purchase_grn` int(11) NOT NULL DEFAULT '0',
  `Purchase_suppinvoice` int(11) NOT NULL DEFAULT '0',
  `Purchase_purchasereturns` int(11) NOT NULL DEFAULT '0',
  `Purchase_purchasecnote` int(11) NOT NULL DEFAULT '0',
  `Purchase_payablereport` int(11) NOT NULL DEFAULT '0',
  `Inventory_inventorymaster` int(11) NOT NULL DEFAULT '0',
  `Inventory_reelserial` int(11) NOT NULL DEFAULT '0',
  `Inventory_matrequisition` int(11) NOT NULL DEFAULT '0',
  `Inventory_matissue` int(11) NOT NULL DEFAULT '0',
  `Inventory_matreturn` int(11) NOT NULL DEFAULT '0',
  `Inventory_stockanalysis` int(11) NOT NULL DEFAULT '0',
  `Inventory_stockadj` int(11) NOT NULL DEFAULT '0',
  `Inventory_inventoryreport` int(11) NOT NULL DEFAULT '0',
  `Fin_finperiod` int(11) NOT NULL DEFAULT '0',
  `Fin_journal` int(11) NOT NULL DEFAULT '0',
  `Fin_accsubtype` int(11) NOT NULL DEFAULT '0',
  `Fin_coa` int(11) NOT NULL DEFAULT '0',
  `Fin_remittance` int(11) NOT NULL DEFAULT '0',
  `Fin_customerallocation` int(11) NOT NULL DEFAULT '0',
  `Fin_supplierallocation` int(11) NOT NULL DEFAULT '0',
  `Fin_unclearedeffect` int(11) NOT NULL DEFAULT '0',
  `Fin_bankrecon` int(11) NOT NULL DEFAULT '0',
  `Fin_chequereg` int(11) NOT NULL DEFAULT '0',
  `Fin_chequedeposit` int(11) NOT NULL DEFAULT '0',
  `Fin_payment` int(11) NOT NULL DEFAULT '0',
  `Fin_receipt` int(11) NOT NULL DEFAULT '0',
  `Fin_contra` int(11) NOT NULL DEFAULT '0',
  `Fin_void` int(11) NOT NULL DEFAULT '0',
  `Fin_cashbookreport` int(11) NOT NULL DEFAULT '0',
  `MIS_report` int(11) NOT NULL DEFAULT '0',
  `Prod_jobticket` int(11) NOT NULL DEFAULT '0',
  `Prod_corrshedule` int(11) NOT NULL DEFAULT '0',
  `Prod_printschedule` int(11) NOT NULL DEFAULT '0',
  `Prod_finishschedule` int(11) NOT NULL DEFAULT '0',
  `Prod_qc` int(11) NOT NULL DEFAULT '0',
  `Prod_prodreports` int(11) NOT NULL DEFAULT '0',
  `Sett_company` int(11) NOT NULL DEFAULT '0',
  `Sett_global` int(11) NOT NULL DEFAULT '0',
  `Sett_finance` int(11) NOT NULL DEFAULT '0',
  `Sett_inventory` int(11) NOT NULL DEFAULT '0',
  `Sett_production` int(11) NOT NULL DEFAULT '0',
  `Role` int(11) DEFAULT NULL,
  `Sales_artwork` int(11) NOT NULL DEFAULT '0',
  `Sales_customerprod` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `RAcustomer` (`Sales_customer`) USING BTREE,
  KEY `RAshippingadd` (`Sales_shippingadd`) USING BTREE,
  KEY `RAquote` (`Sales_quotation`) USING BTREE,
  KEY `RAsalesorder` (`Sales_salesorder`) USING BTREE,
  KEY `RAsalesinvoice` (`Sales_salesinvoice`) USING BTREE,
  KEY `RAsalesreturn` (`Sales_salesreturn`) USING BTREE,
  KEY `RAsalescnote` (`Sales_salescnote`) USING BTREE,
  KEY `RAreceivablereport` (`Sales_receivablereport`) USING BTREE,
  KEY `RAenquiry` (`Sales_enquiry`) USING BTREE,
  KEY `RApricelist` (`Sales_pricelist`) USING BTREE,
  KEY `RApapermaster` (`Sales_papermaster`) USING BTREE,
  KEY `RAdebitnote` (`Sales_debitnote`) USING BTREE,
  KEY `RAcosthistory` (`Purchase_costhistory`) USING BTREE,
  KEY `RAsupplier` (`Purchase_supplier`) USING BTREE,
  KEY `RApurchasereq` (`Purchase_purchaserequisition`) USING BTREE,
  KEY `RApurchaseorder` (`Purchase_purchaseorder`) USING BTREE,
  KEY `RAgrn` (`Purchase_grn`) USING BTREE,
  KEY `RAsuppinvoice` (`Purchase_suppinvoice`) USING BTREE,
  KEY `RApurchasereturn` (`Purchase_purchasereturns`) USING BTREE,
  KEY `RApurchasecnote` (`Purchase_purchasecnote`) USING BTREE,
  KEY `RApayablereport` (`Purchase_payablereport`) USING BTREE,
  KEY `RAreelserial` (`Inventory_reelserial`) USING BTREE,
  KEY `RAmatreq` (`Inventory_matrequisition`) USING BTREE,
  KEY `RAmatissue` (`Inventory_matissue`) USING BTREE,
  KEY `RAmatreturn` (`Inventory_matreturn`) USING BTREE,
  KEY `RAstkanalysis` (`Inventory_stockanalysis`) USING BTREE,
  KEY `RAstkadjust` (`Inventory_stockadj`) USING BTREE,
  KEY `RAinventoryreport` (`Inventory_inventoryreport`) USING BTREE,
  KEY `RAfinperiod` (`Fin_finperiod`) USING BTREE,
  KEY `RAjournal` (`Fin_journal`) USING BTREE,
  KEY `RAaccsubtype` (`Fin_accsubtype`) USING BTREE,
  KEY `RAcoa` (`Fin_coa`) USING BTREE,
  KEY `RAremittance` (`Fin_remittance`) USING BTREE,
  KEY `RAcustalloc` (`Fin_customerallocation`) USING BTREE,
  KEY `RAsuppalloc` (`Fin_supplierallocation`) USING BTREE,
  KEY `RAbankrec` (`Fin_bankrecon`) USING BTREE,
  KEY `RAchequereg` (`Fin_chequereg`) USING BTREE,
  KEY `RAchequedeposit` (`Fin_chequedeposit`) USING BTREE,
  KEY `RApayment` (`Fin_payment`) USING BTREE,
  KEY `RAreceipt` (`Fin_receipt`) USING BTREE,
  KEY `RAcontra` (`Fin_contra`) USING BTREE,
  KEY `RAvoid` (`Fin_void`) USING BTREE,
  KEY `RAmisreport` (`MIS_report`) USING BTREE,
  KEY `RAjobticket` (`Prod_jobticket`) USING BTREE,
  KEY `RAcorrschedule` (`Prod_corrshedule`) USING BTREE,
  KEY `RAprintschedule` (`Prod_printschedule`) USING BTREE,
  KEY `RAfinishschedule` (`Prod_finishschedule`) USING BTREE,
  KEY `RAqc` (`Prod_qc`) USING BTREE,
  KEY `RAcompanysett` (`Sett_company`) USING BTREE,
  KEY `RAglobalsett` (`Sett_global`) USING BTREE,
  KEY `RAfinsett` (`Sett_finance`) USING BTREE,
  KEY `RAinventorysett` (`Sett_inventory`) USING BTREE,
  KEY `RAprodsett` (`Sett_production`) USING BTREE,
  KEY `RAunclearedeffect` (`Fin_unclearedeffect`) USING BTREE,
  KEY `RAprodreport` (`Prod_prodreports`) USING BTREE,
  KEY `RAinventory` (`Inventory_inventorymaster`) USING BTREE,
  KEY `RAcbkreport` (`Fin_cashbookreport`) USING BTREE,
  KEY `RArole` (`Role`) USING BTREE,
  KEY `RAsalesartwork` (`Sales_artwork`) USING BTREE,
  KEY `RAsalescustomerprod` (`Sales_customerprod`) USING BTREE,
  CONSTRAINT `roleaccess_ibfk_1` FOREIGN KEY (`Fin_accsubtype`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_10` FOREIGN KEY (`Sett_global`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_11` FOREIGN KEY (`Purchase_grn`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_12` FOREIGN KEY (`Fin_bankrecon`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_13` FOREIGN KEY (`Inventory_inventorymaster`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_14` FOREIGN KEY (`Inventory_inventoryreport`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_15` FOREIGN KEY (`Sett_inventory`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_16` FOREIGN KEY (`Prod_jobticket`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_17` FOREIGN KEY (`Fin_journal`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_18` FOREIGN KEY (`Inventory_matissue`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_19` FOREIGN KEY (`Inventory_matrequisition`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_2` FOREIGN KEY (`Purchase_costhistory`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_20` FOREIGN KEY (`Inventory_matreturn`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_21` FOREIGN KEY (`MIS_report`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_22` FOREIGN KEY (`Sales_papermaster`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_23` FOREIGN KEY (`Fin_cashbookreport`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_24` FOREIGN KEY (`Purchase_payablereport`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_25` FOREIGN KEY (`Fin_payment`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_26` FOREIGN KEY (`Sales_pricelist`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_27` FOREIGN KEY (`Prod_printschedule`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_28` FOREIGN KEY (`Prod_prodreports`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_29` FOREIGN KEY (`Sett_production`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_3` FOREIGN KEY (`Fin_customerallocation`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_30` FOREIGN KEY (`Purchase_purchasecnote`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_31` FOREIGN KEY (`Purchase_purchaseorder`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_32` FOREIGN KEY (`Purchase_purchaserequisition`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_33` FOREIGN KEY (`Purchase_purchasereturns`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_34` FOREIGN KEY (`Fin_chequedeposit`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_35` FOREIGN KEY (`Prod_qc`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_36` FOREIGN KEY (`Sales_quotation`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_37` FOREIGN KEY (`Fin_receipt`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_38` FOREIGN KEY (`Sales_receivablereport`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_39` FOREIGN KEY (`Inventory_reelserial`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_4` FOREIGN KEY (`Sales_customer`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_40` FOREIGN KEY (`Fin_remittance`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_41` FOREIGN KEY (`Role`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_42` FOREIGN KEY (`Sales_artwork`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_43` FOREIGN KEY (`Sales_salescnote`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_44` FOREIGN KEY (`Sales_customerprod`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_45` FOREIGN KEY (`Fin_chequereg`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_46` FOREIGN KEY (`Sales_salesinvoice`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_47` FOREIGN KEY (`Sales_salesorder`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_48` FOREIGN KEY (`Sales_salesreturn`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_49` FOREIGN KEY (`Sales_shippingadd`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_5` FOREIGN KEY (`Sales_debitnote`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_50` FOREIGN KEY (`Inventory_stockadj`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_51` FOREIGN KEY (`Inventory_stockanalysis`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_52` FOREIGN KEY (`Fin_supplierallocation`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_53` FOREIGN KEY (`Purchase_suppinvoice`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_54` FOREIGN KEY (`Purchase_supplier`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_55` FOREIGN KEY (`Fin_unclearedeffect`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_56` FOREIGN KEY (`Fin_coa`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_57` FOREIGN KEY (`Fin_void`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_58` FOREIGN KEY (`Sett_company`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_59` FOREIGN KEY (`Fin_contra`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_6` FOREIGN KEY (`Sales_enquiry`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_60` FOREIGN KEY (`Prod_corrshedule`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_7` FOREIGN KEY (`Prod_finishschedule`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_8` FOREIGN KEY (`Fin_finperiod`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleaccess_ibfk_9` FOREIGN KEY (`Sett_finance`) REFERENCES `roleaccesslevels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleaccess`
--

LOCK TABLES `roleaccess` WRITE;
/*!40000 ALTER TABLE `roleaccess` DISABLE KEYS */;
INSERT INTO `roleaccess` VALUES (1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,5,5),(2,3,1,1,1,1,1,1,1,1,1,1,1,2,1,3,3,4,1,3,1,3,4,3,5,5,1,3,2,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,3,4,4,4,4,4,8,1,1),(3,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,1,1,1,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,6,1,1),(4,4,4,3,3,5,4,4,4,3,1,1,4,5,4,4,4,4,4,4,4,4,3,4,5,4,2,4,4,4,4,4,4,5,4,5,5,5,4,4,4,4,4,4,5,4,4,1,1,1,3,1,1,1,1,1,1,1,7,1,3),(6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1,1,1,16,5,5),(7,3,1,3,3,3,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,2),(8,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,5,5,5,5,5,5,5,5,5,1,1,1,1,1,14,5,5),(9,4,4,2,3,1,3,1,1,3,3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3),(10,3,3,3,5,3,3,1,1,3,3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,3,3,2),(11,1,1,1,1,4,3,1,1,1,1,1,1,3,1,4,2,2,3,3,1,4,3,1,5,4,1,1,1,4,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,3,3,3,1,1,4,1,1,1,1,1,1,1,4,1,1),(12,3,3,1,1,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,5,1,1),(13,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,3,4,4,4,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1),(14,1,1,1,3,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,4,4,4,4,4,1,1,1,1,1,10,4,3),(15,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,4,4,4,4,4,1,1,1,1,1,11,3,1),(16,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,5,3,1,1,1,1,1,12,4,1),(17,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,13,1,1),(18,5,4,4,4,4,4,4,4,5,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,1,1,1,1,1,15,4,5),(19,4,4,4,5,4,4,4,4,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,5,4,4,4,4,4,1,1,1,1,1,15,4,5);
/*!40000 ALTER TABLE `roleaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleaccesslevels`
--

DROP TABLE IF EXISTS `roleaccesslevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleaccesslevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleaccesslevels`
--

LOCK TABLES `roleaccesslevels` WRITE;
/*!40000 ALTER TABLE `roleaccesslevels` DISABLE KEYS */;
INSERT INTO `roleaccesslevels` VALUES (1,'NONE'),(2,'CREATE'),(3,'EDIT'),(4,'APPROVE'),(5,'SUPER');
/*!40000 ALTER TABLE `roleaccesslevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `Approvedby` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ActiveStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoleId`),
  UNIQUE KEY `RoleName` (`RoleName`) USING BTREE,
  KEY `rolecreatedBy` (`CreatedBy`) USING BTREE,
  KEY `roleapprovedBy` (`Approvedby`) USING BTREE,
  KEY `rolecostcenter` (`costcenter`),
  KEY `rolecompany` (`company`),
  CONSTRAINT `rolecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rolecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`Approvedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SYSTEM','2013-03-24',NULL,'2016-02-08 04:44:50','2013-03-25 07:12:09',NULL,1,1,NULL,NULL),(2,'SALES MANAGER','2013-04-11',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(3,'SALES CORDINATOR','2013-04-11',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(4,'ACCOUNTS CLERK','2013-04-11',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(5,'ACCOUNTS ASS.1','2013-04-11',NULL,'2016-02-08 04:44:50',NULL,NULL,1,0,NULL,NULL),(6,'ACCOUNTS ASS.2','2013-04-11',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(7,'ACCOUNTS','2014-03-19',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(8,'STORE MANAGER','2014-03-21',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(9,'STORES ASS.1','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(10,'PRODUCTION MANAGER','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(11,'PRODUCTION ASS.1','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(12,'QC MANAGER','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(13,'QC ASS.1','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(14,'IT','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(15,'GM','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL),(16,'MANAGEMENT','2014-04-03',NULL,'2016-02-08 04:44:50',NULL,NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `route` varchar(45) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approvalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `activeStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `routeCreatedbyIndex` (`createdBy`) USING BTREE,
  KEY `routeapprovedbyIndex` (`approvedBy`) USING BTREE,
  KEY `routecostcenter` (`costcenter`),
  KEY `routecompany` (`company`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerate`
--

DROP TABLE IF EXISTS `routerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `route` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `rate` double(12,2) NOT NULL DEFAULT '0.00',
  `createdBy` int(11) NOT NULL,
  `approvedStatus` tinyint(1) NOT NULL DEFAULT '0',
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `activeStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `routeIndex` (`route`) USING BTREE,
  KEY `routeratesuppIndex` (`supplier`) USING BTREE,
  KEY `routeratevehicleIndex` (`vehicle`) USING BTREE,
  KEY `routerateCreatedByIndex` (`createdBy`) USING BTREE,
  KEY `routerateApprovedByIndex` (`approvedBy`) USING BTREE,
  KEY `routeratecostcenter` (`costcenter`),
  KEY `routeratecompany` (`company`),
  CONSTRAINT `routerate_ibfk_1` FOREIGN KEY (`route`) REFERENCES `route` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routerate_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routerate_ibfk_3` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routerate_ibfk_4` FOREIGN KEY (`supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routerate_ibfk_5` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routeratecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routeratecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerate`
--

LOCK TABLES `routerate` WRITE;
/*!40000 ALTER TABLE `routerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salescreditnote`
--

DROP TABLE IF EXISTS `salescreditnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salescreditnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CrNo` varchar(5) DEFAULT NULL,
  `InvoiceNo` int(11) DEFAULT NULL,
  `CustId` int(11) DEFAULT NULL,
  `CustRef` varchar(45) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(9,4) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `CloseDate` timestamp NULL DEFAULT NULL,
  `SLCrClosed` tinyint(1) DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `TotalAmount` double(12,4) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovealDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Subtotal` double(12,2) NOT NULL,
  `Vat` double(12,2) NOT NULL,
  `Salesretunnote` int(11) DEFAULT NULL,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `Service` tinyint(1) NOT NULL DEFAULT '0',
  `rejected` tinyint(1) NOT NULL,
  `vatinclusive` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `CustId_idx` (`CustId`) USING BTREE,
  KEY `CurrencyIdIndex_idx` (`CurrId`) USING BTREE,
  KEY `DeptIdIndex_idx` (`DeptId`) USING BTREE,
  KEY `StoreIdIndex_idx` (`StoreId`) USING BTREE,
  KEY `SaleCrSaleInvIndex_idx` (`InvoiceNo`) USING BTREE,
  KEY `FK5C1CA0777D30F8A3` (`StoreId`) USING BTREE,
  KEY `FK5C1CA0775A68B5C4` (`InvoiceNo`) USING BTREE,
  KEY `FK5C1CA0776CE51B19` (`DeptId`) USING BTREE,
  KEY `FK5C1CA077FD509481` (`CustId`) USING BTREE,
  KEY `FK5C1CA077FB7A88D3` (`CurrId`) USING BTREE,
  KEY `SaleCrSalesreturnIndex` (`Salesretunnote`) USING BTREE,
  KEY `SalecrcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SalcrapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `scnotecostcenter` (`costcenter`),
  KEY `scnotecompany` (`company`),
  CONSTRAINT `salescreditnote_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_2` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_3` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_4` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_5` FOREIGN KEY (`InvoiceNo`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_6` FOREIGN KEY (`Salesretunnote`) REFERENCES `salesreturnnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_7` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_ibfk_8` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scnotecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scnotecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salescreditnote`
--

LOCK TABLES `salescreditnote` WRITE;
/*!40000 ALTER TABLE `salescreditnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `salescreditnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salescreditnote_details`
--

DROP TABLE IF EXISTS `salescreditnote_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salescreditnote_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VatId` int(11) DEFAULT NULL,
  `UomId` int(11) DEFAULT NULL,
  `CrId` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `ItemDesc` varchar(200) DEFAULT NULL,
  `Qty` double(12,2) DEFAULT NULL,
  `UnitPrice` double(12,2) DEFAULT NULL,
  `VatRate` double(12,2) DEFAULT NULL,
  `TotalAmt` double(12,2) DEFAULT NULL,
  `Coa` int(11) DEFAULT NULL,
  `Currency` int(11) NOT NULL,
  `CurrRate` double(12,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1AB4D27A4AC7DD75` (`ItemId`) USING BTREE,
  KEY `FK1AB4D27A7342EF6C` (`UomId`) USING BTREE,
  KEY `FK1AB4D27AA336A2AC` (`CrId`) USING BTREE,
  KEY `vatrefIndex` (`VatId`) USING BTREE,
  KEY `SCNCoaIndex` (`Coa`) USING BTREE,
  KEY `SCNDetCurrIndex` (`Currency`) USING BTREE,
  CONSTRAINT `salescreditnote_details_ibfk_1` FOREIGN KEY (`CrId`) REFERENCES `salescreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_details_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_details_ibfk_3` FOREIGN KEY (`Coa`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_details_ibfk_4` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_details_ibfk_5` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salescreditnote_details_ibfk_6` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salescreditnote_details`
--

LOCK TABLES `salescreditnote_details` WRITE;
/*!40000 ALTER TABLE `salescreditnote_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `salescreditnote_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesinvoice`
--

DROP TABLE IF EXISTS `salesinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SlInvNo` varchar(5) DEFAULT NULL,
  `SOrderNo` int(11) DEFAULT NULL,
  `Quoteid` int(11) DEFAULT NULL,
  `CustId` int(11) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(9,4) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `DiscRate` double(9,4) DEFAULT NULL,
  `DiscAmt` double(9,4) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `TotalAmount` double(12,4) NOT NULL,
  `TransportType` varchar(45) DEFAULT NULL,
  `TransportRegno` varchar(45) DEFAULT NULL,
  `TransporterId` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `ClosedStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `Approvedby` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `SubTotal` double(9,2) NOT NULL,
  `Vat` double(9,2) NOT NULL,
  `Discount` double(9,2) DEFAULT NULL,
  `Shippingadd` int(11) DEFAULT NULL,
  `Driver` varchar(100) DEFAULT NULL,
  `DelNo` varchar(5) DEFAULT NULL,
  `Debitnote` int(11) DEFAULT NULL,
  `SOrderClosed` tinyint(1) NOT NULL,
  `InvoiceType` varchar(45) NOT NULL,
  `Consignment` int(11) DEFAULT NULL,
  `ConsignmentClosed` tinyint(1) NOT NULL DEFAULT '0',
  `treoscheme` tinyint(1) NOT NULL,
  `loaderDetail` varchar(150) DEFAULT NULL,
  `transportmode` int(11) DEFAULT NULL,
  `stockissue` int(11) DEFAULT NULL,
  `coveredMillage` double(12,2) NOT NULL DEFAULT '0.00',
  `cashsale` tinyint(1) NOT NULL DEFAULT '0',
  `cashbook` int(11) DEFAULT NULL,
  `cashbookref` varchar(100) DEFAULT NULL,
  `amount` double(12,4) NOT NULL DEFAULT '0.0000',
  `vatinclusive` tinyint(1) NOT NULL DEFAULT '0',
  `salesrep` int(11) DEFAULT NULL,
  `installer` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `jobcard` int(11) DEFAULT NULL,
  `tracker` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SaleInvSOIndex_idx` (`SOrderNo`) USING BTREE,
  KEY `SaleInvQuoteIndex_idx` (`Quoteid`) USING BTREE,
  KEY `SaleInvCustIndex_idx` (`CustId`) USING BTREE,
  KEY `SaleInvCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `SaleInvDeptId_idx` (`DeptId`) USING BTREE,
  KEY `SaleInvStoreIndex_idx` (`StoreId`) USING BTREE,
  KEY `FK8C6DF4A17D30F8A3` (`StoreId`) USING BTREE,
  KEY `FK8C6DF4A16CE51B19` (`DeptId`) USING BTREE,
  KEY `FK8C6DF4A1FD509481` (`CustId`) USING BTREE,
  KEY `FK8C6DF4A1FB7A88D3` (`CurrId`) USING BTREE,
  KEY `FK8C6DF4A1D883E6CE` (`Quoteid`) USING BTREE,
  KEY `FK8C6DF4A1EF210833` (`SOrderNo`) USING BTREE,
  KEY `SalesInvShippaddIndex` (`Shippingadd`) USING BTREE,
  KEY `SaleInvDrNoteIndex` (`Debitnote`) USING BTREE,
  KEY `SaleInvTransporterIndex` (`TransporterId`) USING BTREE,
  KEY `SaleinvcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SaleinvapprovedBy` (`Approvedby`) USING BTREE,
  KEY `SalesinvConsignIndex` (`Consignment`) USING BTREE,
  KEY `SalesinvTransportmode` (`transportmode`) USING BTREE,
  KEY `sinvoice_stkisssue` (`stockissue`) USING BTREE,
  KEY `salesinvoice_chartaccount` (`cashbook`),
  KEY `sinvoicecostcenter` (`costcenter`),
  KEY `sinvoicecompany` (`company`),
  KEY `salesrep` (`salesrep`),
  KEY `installer` (`installer`),
  KEY `jobcard` (`jobcard`),
  KEY `tracker` (`tracker`),
  CONSTRAINT `salesinvoice_chartaccount` FOREIGN KEY (`cashbook`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_10` FOREIGN KEY (`SOrderNo`) REFERENCES `salesorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_11` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_12` FOREIGN KEY (`TransporterId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_13` FOREIGN KEY (`Approvedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_14` FOREIGN KEY (`stockissue`) REFERENCES `stockissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_15` FOREIGN KEY (`salesrep`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_16` FOREIGN KEY (`installer`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_17` FOREIGN KEY (`jobcard`) REFERENCES `jobcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_18` FOREIGN KEY (`tracker`) REFERENCES `tracker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_3` FOREIGN KEY (`Shippingadd`) REFERENCES `shippingadd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_4` FOREIGN KEY (`Consignment`) REFERENCES `consignmentnote` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_6` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_7` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_8` FOREIGN KEY (`Debitnote`) REFERENCES `debitnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_ibfk_9` FOREIGN KEY (`Quoteid`) REFERENCES `quotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinvoicecompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinvoicecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesinvoice`
--

LOCK TABLES `salesinvoice` WRITE;
/*!40000 ALTER TABLE `salesinvoice` DISABLE KEYS */;
INSERT INTO `salesinvoice` VALUES (3,'',NULL,NULL,1,1,1.0000,32,NULL,NULL,NULL,'',5000.0000,NULL,NULL,NULL,'2016-02-18',7,'2016-02-19 01:57:05',NULL,NULL,0,'2016-02-19 01:55:59',7,1,4200.00,800.00,NULL,NULL,NULL,NULL,NULL,0,'RFD',NULL,0,0,NULL,NULL,NULL,0.00,0,NULL,'',0.0000,1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'',NULL,NULL,1,1,1.0000,32,NULL,NULL,NULL,'',5000.0000,NULL,NULL,NULL,'2016-02-19',7,'2016-02-19 16:01:19',NULL,NULL,0,'2016-02-19 16:00:19',7,1,4200.00,800.00,NULL,NULL,NULL,NULL,NULL,0,'RFD',NULL,0,0,NULL,NULL,NULL,0.00,0,NULL,'',0.0000,1,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,6,1,1.0000,NULL,NULL,NULL,NULL,NULL,44080.0000,NULL,NULL,NULL,'2016-02-26',7,'2016-02-27 01:47:46',NULL,NULL,0,'2016-02-27 01:47:46',7,1,38000.00,6080.00,NULL,NULL,NULL,NULL,NULL,0,'SERVICE',NULL,0,0,NULL,NULL,NULL,0.00,0,NULL,NULL,38000.0000,0,NULL,NULL,NULL,NULL,NULL,6),(12,NULL,NULL,NULL,7,1,1.0000,NULL,NULL,NULL,NULL,NULL,10000.0000,NULL,NULL,NULL,'2016-02-26',7,'2016-02-27 01:52:50',NULL,NULL,0,'2016-02-27 01:52:50',7,1,10000.00,0.00,NULL,NULL,NULL,NULL,NULL,0,'SERVICE',NULL,0,0,NULL,NULL,NULL,0.00,0,NULL,NULL,10000.0000,0,NULL,NULL,NULL,NULL,NULL,7);
/*!40000 ALTER TABLE `salesinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesinvoice_details`
--

DROP TABLE IF EXISTS `salesinvoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesinvoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VatId` int(11) DEFAULT NULL,
  `uomId` int(11) DEFAULT NULL,
  `SalesInvId` int(11) DEFAULT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `Qty` double(12,2) DEFAULT NULL,
  `UnitPrice` double(12,2) DEFAULT NULL,
  `VatRate` double(12,2) DEFAULT NULL,
  `TotalAmt` double(12,2) DEFAULT NULL,
  `Salesorder` int(11) DEFAULT NULL,
  `Jobticket` int(11) DEFAULT NULL,
  `Chartaccount` int(11) DEFAULT NULL,
  `SOQty` double(12,2) DEFAULT NULL,
  `SOPendingQty` double(12,2) DEFAULT NULL,
  `Description` text,
  `currentQty` double(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FK31AC5CA44AC7DD75` (`ItemId`) USING BTREE,
  KEY `FK31AC5CA47342EF6C` (`uomId`) USING BTREE,
  KEY `FK31AC5CA4734AC618` (`VatId`) USING BTREE,
  KEY `FK31AC5CA4290F6756` (`SalesInvId`) USING BTREE,
  KEY `InvdetailSOIndex` (`Salesorder`) USING BTREE,
  KEY `InvdetailJobticketIndex` (`Jobticket`) USING BTREE,
  KEY `InvdetailCoAIndex` (`Chartaccount`) USING BTREE,
  CONSTRAINT `salesinvoice_details_ibfk_1` FOREIGN KEY (`Chartaccount`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_details_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_details_ibfk_3` FOREIGN KEY (`SalesInvId`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_details_ibfk_5` FOREIGN KEY (`Salesorder`) REFERENCES `salesorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_details_ibfk_6` FOREIGN KEY (`uomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesinvoice_details_ibfk_7` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesinvoice_details`
--

LOCK TABLES `salesinvoice_details` WRITE;
/*!40000 ALTER TABLE `salesinvoice_details` DISABLE KEYS */;
INSERT INTO `salesinvoice_details` VALUES (3,2,NULL,3,36,2.00,2500.00,16.00,5000.00,NULL,NULL,2217,NULL,NULL,NULL,5.00),(5,2,NULL,5,36,2.00,2500.00,16.00,5000.00,NULL,NULL,2217,NULL,NULL,NULL,3.00),(11,2,NULL,11,NULL,1.00,38000.00,16.00,38000.00,NULL,NULL,2562,NULL,NULL,'Tracking Installation Invoice',0.00),(12,1,NULL,12,NULL,1.00,10000.00,0.00,10000.00,NULL,NULL,2562,NULL,NULL,'Tracking Installation Invoice',0.00);
/*!40000 ALTER TABLE `salesinvoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesledger`
--

DROP TABLE IF EXISTS `salesledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DocType` varchar(45) DEFAULT NULL,
  `Salesinvoice` int(11) DEFAULT NULL,
  `Description` text,
  `CustId` int(11) NOT NULL,
  `CurrId` int(11) NOT NULL,
  `CurrRate` double(9,2) NOT NULL,
  `DebitAmt` double(12,2) NOT NULL,
  `CreditAmt` double(12,2) NOT NULL,
  `AccCode` int(11) NOT NULL,
  `Journal` int(11) DEFAULT NULL,
  `Cashbook` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DocNum` varchar(45) DEFAULT NULL,
  `Creditnote` int(11) DEFAULT NULL,
  `Receipt_reg` int(11) DEFAULT NULL,
  `Deposit` int(11) DEFAULT NULL,
  `Debitnote` int(11) DEFAULT NULL,
  `UnallocatedAmt` double(12,2) DEFAULT NULL,
  `Allocation` int(11) DEFAULT NULL,
  `Financialperiod` int(11) NOT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `Allocated` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SlsLedCustIndex_idx` (`CustId`) USING BTREE,
  KEY `SlsLedCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `SlsLedInvoiceIndex` (`Salesinvoice`) USING BTREE,
  KEY `SlsLedCbkIndex` (`Cashbook`) USING BTREE,
  KEY `SlsLedCnIndex` (`Creditnote`) USING BTREE,
  KEY `SlsLedJournalIndex` (`Journal`) USING BTREE,
  KEY `SlsLedReceiptregIndex` (`Receipt_reg`) USING BTREE,
  KEY `SlsLedDepositIndex` (`Deposit`) USING BTREE,
  KEY `SlsLedCoaIndex` (`AccCode`) USING BTREE,
  KEY `SlsLedDrNoteIndex` (`Debitnote`) USING BTREE,
  KEY `SlsLedAllocIndex` (`Allocation`) USING BTREE,
  KEY `SlsLedFinperiodIndex` (`Financialperiod`) USING BTREE,
  KEY `SlcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SlapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `slcostcenter` (`costcenter`),
  KEY `slcompany` (`company`),
  CONSTRAINT `salesledger_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_10` FOREIGN KEY (`Receipt_reg`) REFERENCES `chequeregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_11` FOREIGN KEY (`Creditnote`) REFERENCES `salescreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_12` FOREIGN KEY (`AccCode`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_13` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_14` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_2` FOREIGN KEY (`Deposit`) REFERENCES `deposit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_3` FOREIGN KEY (`Debitnote`) REFERENCES `debitnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_4` FOREIGN KEY (`Financialperiod`) REFERENCES `financialperiods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_5` FOREIGN KEY (`Salesinvoice`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_6` FOREIGN KEY (`Journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_8` FOREIGN KEY (`Allocation`) REFERENCES `customerallocations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesledger_ibfk_9` FOREIGN KEY (`Cashbook`) REFERENCES `cashbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `slcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `slcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesledger`
--

LOCK TABLES `salesledger` WRITE;
/*!40000 ALTER TABLE `salesledger` DISABLE KEYS */;
INSERT INTO `salesledger` VALUES (4,'CREDIT SALES',3,NULL,1,1,1.00,5000.00,0.00,2222,NULL,NULL,NULL,'2016-02-18','2016-02-19 01:57:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,NULL,NULL,0,NULL,NULL),(7,'CREDIT SALES',5,NULL,1,1,1.00,5000.00,0.00,2222,NULL,NULL,NULL,'2016-02-19','2016-02-19 16:01:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,NULL,NULL,0,NULL,NULL),(12,'CREDIT SALES',11,'Tracking Installation Invoice',6,1,1.00,44080.00,0.00,2222,NULL,NULL,7,'2016-02-26','2016-02-27 01:47:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,'2016-02-26 20:47:46',7,0,NULL,NULL),(13,'CREDIT SALES',12,'Tracking Installation Invoice',7,1,1.00,10000.00,0.00,2222,NULL,NULL,7,'2016-02-26','2016-02-29 17:19:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,'2016-02-26 20:52:50',7,1,NULL,NULL),(14,'RECEIPT',NULL,NULL,7,1,1.00,0.00,12000.00,2222,NULL,1,7,'2016-02-29','2016-02-29 16:32:27','34656',NULL,NULL,NULL,NULL,NULL,NULL,2,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `salesledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesorder`
--

DROP TABLE IF EXISTS `salesorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Custid` int(11) DEFAULT NULL,
  `SONumber` varchar(10) DEFAULT NULL,
  `QuoteId` int(11) DEFAULT NULL,
  `LPONumber` varchar(100) NOT NULL,
  `LPODate` datetime NOT NULL,
  `Department` int(11) DEFAULT NULL,
  `SOClosed` tinyint(1) NOT NULL,
  `dueDate` datetime DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Vat` double(12,2) NOT NULL,
  `Subtotal` double(12,2) NOT NULL,
  `TotalAmount` double(12,2) NOT NULL,
  `Shippingadd` int(11) DEFAULT NULL,
  `Currency` int(11) DEFAULT NULL,
  `CurrRate` double(9,2) DEFAULT NULL,
  `Sales_rep` int(11) DEFAULT NULL,
  `Remarks` text,
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  `Orderqty` double(12,2) NOT NULL DEFAULT '0.00',
  `reorderqty` double(12,2) NOT NULL,
  `reorderSO` int(11) DEFAULT NULL,
  `reordered` tinyint(1) NOT NULL,
  `vatinclusive` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SOCustIndex` (`Custid`) USING BTREE,
  KEY `SOQuoteIndex` (`QuoteId`) USING BTREE,
  KEY `FK674F05C2FD509481` (`Custid`) USING BTREE,
  KEY `FK674F05C2D883E6CE` (`QuoteId`) USING BTREE,
  KEY `SOStoreIndex` (`Department`) USING BTREE,
  KEY `FK674F05C27D30F8A3` (`Department`) USING BTREE,
  KEY `SOShippingadd` (`Shippingadd`) USING BTREE,
  KEY `SOCurrencyIndex` (`Currency`) USING BTREE,
  KEY `SOcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SOapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `SOreorderIndex` (`reorderSO`) USING BTREE,
  KEY `socostcenter` (`costcenter`),
  KEY `socompany` (`company`),
  CONSTRAINT `salesorder_ibfk_1` FOREIGN KEY (`Currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_2` FOREIGN KEY (`Custid`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_4` FOREIGN KEY (`QuoteId`) REFERENCES `quotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_5` FOREIGN KEY (`Shippingadd`) REFERENCES `shippingadd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_6` FOREIGN KEY (`Department`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_7` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_8` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_ibfk_9` FOREIGN KEY (`reorderSO`) REFERENCES `salesorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `socompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `socostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorder`
--

LOCK TABLES `salesorder` WRITE;
/*!40000 ALTER TABLE `salesorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesorder_details`
--

DROP TABLE IF EXISTS `salesorder_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorder_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SONumber` int(11) NOT NULL DEFAULT '0',
  `ItemId` int(11) DEFAULT '0',
  `Description` varchar(200) DEFAULT NULL,
  `UOMId` int(11) DEFAULT NULL,
  `Order_Qty` double(12,4) NOT NULL DEFAULT '0.0000',
  `Unit_Price` double(12,4) NOT NULL DEFAULT '0.0000',
  `vatAmount` double(12,3) NOT NULL DEFAULT '0.000',
  `Total_Amount` double(12,4) NOT NULL DEFAULT '0.0000',
  `subtotalamount` double(12,4) NOT NULL DEFAULT '0.0000',
  `CurrId` int(11) DEFAULT '1',
  `CurrRate` double(9,4) DEFAULT NULL,
  `VatId` int(11) DEFAULT '1',
  `VatRate` double(9,4) DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `SOStatus` int(11) DEFAULT '0',
  `OrderSource` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SODetCurrIndex` (`CurrId`) USING BTREE,
  KEY `SODetInventoryIndex` (`ItemId`) USING BTREE,
  KEY `SODetSONumIndex` (`SONumber`) USING BTREE,
  KEY `SODetUOMIndex` (`UOMId`) USING BTREE,
  KEY `SODetVatIndex` (`VatId`) USING BTREE,
  KEY `FK43BEBCC5E9409B1C` (`SONumber`) USING BTREE,
  KEY `FK43BEBCC54AC7DD75` (`ItemId`) USING BTREE,
  KEY `FK43BEBCC57342EF6C` (`UOMId`) USING BTREE,
  KEY `FK43BEBCC5734AC618` (`VatId`) USING BTREE,
  KEY `FK43BEBCC5FB7A88D3` (`CurrId`) USING BTREE,
  CONSTRAINT `salesorder_details_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `salesorder_details_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_details_ibfk_4` FOREIGN KEY (`SONumber`) REFERENCES `salesorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_details_ibfk_5` FOREIGN KEY (`UOMId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesorder_details_ibfk_6` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorder_details`
--

LOCK TABLES `salesorder_details` WRITE;
/*!40000 ALTER TABLE `salesorder_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorder_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesreturnnote`
--

DROP TABLE IF EXISTS `salesreturnnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesreturnnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SRNo` varchar(45) DEFAULT NULL,
  `CustInv` int(11) DEFAULT NULL,
  `CustId` int(11) DEFAULT NULL,
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(12,3) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `remarks` text,
  `TotalAmt` double(12,3) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Receivedby` int(11) DEFAULT NULL,
  `Credited` tinyint(1) NOT NULL DEFAULT '0',
  `Creditnote` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SalesreturnCustIndex` (`CustId`) USING BTREE,
  KEY `SalesreturnInvIndex` (`CustInv`) USING BTREE,
  KEY `SalesreturnCurrIndex` (`CurrId`) USING BTREE,
  KEY `SalesreturnDeptIndex` (`DeptId`) USING BTREE,
  KEY `SalesreturnStoreIndex` (`StoreId`) USING BTREE,
  KEY `SalesreturnCnoteIndex` (`Creditnote`) USING BTREE,
  KEY `SalesretcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SalesretapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `sreturncostcenter` (`costcenter`),
  KEY `sreturncompany` (`company`),
  CONSTRAINT `salesreturnnote_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreturnnote_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreturnnote_ibfk_3` FOREIGN KEY (`Creditnote`) REFERENCES `salescreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreturnnote_ibfk_4` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreturnnote_ibfk_5` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreturnnote_ibfk_6` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`),
  CONSTRAINT `salesreturnnote_ibfk_7` FOREIGN KEY (`CustInv`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreturnnote_ibfk_8` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sreturncompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sreturncostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesreturnnote`
--

LOCK TABLES `salesreturnnote` WRITE;
/*!40000 ALTER TABLE `salesreturnnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesreturnnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippingadd`
--

DROP TABLE IF EXISTS `shippingadd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippingadd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustId` int(11) NOT NULL,
  `ShippingAdd` text NOT NULL,
  `LocationDetails` varchar(200) DEFAULT NULL,
  `telNum` varchar(60) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `TransitDays` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK414C9433FD509481` (`CustId`) USING BTREE,
  KEY `FK_shippingadd_2` (`cityId`) USING BTREE,
  KEY `CountryIndex` (`countryId`) USING BTREE,
  KEY `ShippaddcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `ShippaddapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `shippaddcostcenter` (`costcenter`),
  KEY `shippaddcompany` (`company`),
  CONSTRAINT `shippaddcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippaddcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippingadd_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippingadd_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippingadd_ibfk_3` FOREIGN KEY (`CustId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippingadd_ibfk_4` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippingadd_ibfk_5` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingadd`
--

LOCK TABLES `shippingadd` WRITE;
/*!40000 ALTER TABLE `shippingadd` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippingadd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stkadjustment`
--

DROP TABLE IF EXISTS `stkadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stkadjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeptId` int(11) DEFAULT NULL,
  `StockAnlysId` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `AdjRefNo` varchar(45) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `InventoryCat` int(11) DEFAULT NULL,
  `Inventtype` int(11) DEFAULT NULL,
  `InventClass` int(11) DEFAULT NULL,
  `Remarks` text,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK52C97F177D30F8A3` (`StoreId`) USING BTREE,
  KEY `FK52C97F176CE51B19` (`DeptId`) USING BTREE,
  KEY `FK52C97F174AD54F5B` (`StockAnlysId`) USING BTREE,
  KEY `StkAdjInventCatIndex` (`InventoryCat`) USING BTREE,
  KEY `StkAdjInventtypeIndex` (`Inventtype`) USING BTREE,
  KEY `StkAdjInventoryClassIndex` (`InventClass`) USING BTREE,
  KEY `StkadjcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `StkadjapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `stkadjcostcenter` (`costcenter`),
  KEY `stkadjcompany` (`company`),
  CONSTRAINT `stkadjcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_2` FOREIGN KEY (`InventoryCat`) REFERENCES `inventorycategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_3` FOREIGN KEY (`InventClass`) REFERENCES `invclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_4` FOREIGN KEY (`Inventtype`) REFERENCES `inventorytypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_5` FOREIGN KEY (`StockAnlysId`) REFERENCES `stockanalysis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_6` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_7` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkadjustment_ibfk_8` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stkadjustment`
--

LOCK TABLES `stkadjustment` WRITE;
/*!40000 ALTER TABLE `stkadjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `stkadjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockanalysis`
--

DROP TABLE IF EXISTS `stockanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockanalysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AnalysisNo` varchar(45) DEFAULT NULL,
  `Dept` int(11) DEFAULT NULL,
  `Store` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `remarks` text,
  `Closed` tinyint(1) NOT NULL,
  `InventCat` int(11) DEFAULT NULL,
  `Inventtype` int(11) DEFAULT NULL,
  `Inventclass` int(11) DEFAULT NULL,
  `costcenter` int(11) NOT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `stkAnlysDept_idx` (`Dept`) USING BTREE,
  KEY `stkAnlysStoreIndex_idx` (`Store`) USING BTREE,
  KEY `FK6475B3F2BCAB8B3E` (`Dept`) USING BTREE,
  KEY `FK6475B3F2F40B9FC8` (`Store`) USING BTREE,
  KEY `StkAnlysInvetCatIndex` (`InventCat`) USING BTREE,
  KEY `StkanlysInventTypeIndex` (`Inventtype`) USING BTREE,
  KEY `StkAnlysInventClassIndex` (`Inventclass`) USING BTREE,
  KEY `StkanalcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `StkanalapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `stkanalysiscostcenter` (`costcenter`),
  KEY `stkanalysiscompany` (`company`),
  CONSTRAINT `stkanalysiscompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkanalysiscostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_1` FOREIGN KEY (`Dept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_2` FOREIGN KEY (`Inventclass`) REFERENCES `invclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_3` FOREIGN KEY (`InventCat`) REFERENCES `inventorycategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_4` FOREIGN KEY (`Store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_5` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_6` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysis_ibfk_7` FOREIGN KEY (`Inventtype`) REFERENCES `inventorytypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockanalysis`
--

LOCK TABLES `stockanalysis` WRITE;
/*!40000 ALTER TABLE `stockanalysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockanalysisdetail`
--

DROP TABLE IF EXISTS `stockanalysisdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockanalysisdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Itemid` int(11) DEFAULT NULL,
  `StkAnalysId` int(11) DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `PhysicalQty` double DEFAULT NULL,
  `VarQty` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26318EC34AC7DD75` (`Itemid`) USING BTREE,
  KEY `FK26318EC3336C4214` (`StkAnalysId`) USING BTREE,
  CONSTRAINT `stockanalysisdetail_ibfk_1` FOREIGN KEY (`Itemid`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockanalysisdetail_ibfk_2` FOREIGN KEY (`StkAnalysId`) REFERENCES `stockanalysis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockanalysisdetail`
--

LOCK TABLES `stockanalysisdetail` WRITE;
/*!40000 ALTER TABLE `stockanalysisdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockanalysisdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockcard`
--

DROP TABLE IF EXISTS `stockcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VatId` int(11) DEFAULT NULL,
  `InventoryId` int(11) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Salesinv` int(11) DEFAULT NULL,
  `docType` varchar(100) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `InternalCode` varchar(200) DEFAULT NULL,
  `Deptid` int(11) DEFAULT NULL,
  `StoreId` int(11) DEFAULT NULL,
  `VatRate` double(9,2) DEFAULT NULL,
  `unitPrice` double(9,2) DEFAULT NULL,
  `Quantity_In` double(9,3) DEFAULT '0.000',
  `Quantity_Out` double(9,3) DEFAULT '0.000',
  `Total_Amt` double(12,2) DEFAULT NULL,
  `Batch_No` varchar(45) DEFAULT NULL,
  `CurrencyRate` double(9,4) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(4) DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `Salescreditnote` int(11) DEFAULT NULL,
  `Supplierinv` int(11) DEFAULT NULL,
  `Grn` int(11) DEFAULT NULL,
  `Purchasecnote` int(11) DEFAULT NULL,
  `Purchasereturn` int(11) DEFAULT NULL,
  `Stockissue` int(11) DEFAULT NULL,
  `Issuereturn` int(11) DEFAULT NULL,
  `Stockadj` int(11) DEFAULT NULL,
  `Porder` int(11) DEFAULT NULL,
  `PorderQty` double(12,2) DEFAULT NULL,
  `PorderPendingQty` double(12,2) DEFAULT NULL,
  `Supplier` int(11) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `Adjustment` varchar(45) DEFAULT NULL,
  `AnalysisQty` double(12,2) DEFAULT NULL,
  `Remarks` text,
  `CurrentQty` double(12,2) DEFAULT NULL,
  `Salesreturn` int(11) DEFAULT NULL,
  `Salesorder` int(11) DEFAULT NULL,
  `SOrderQty` double(12,2) DEFAULT NULL,
  `SOrderPendingQty` double(12,2) DEFAULT NULL,
  `Scheme` varchar(45) DEFAULT NULL,
  `Machine` int(11) DEFAULT NULL,
  `MRQty` double(12,2) DEFAULT NULL,
  `MRPendingQty` double(12,2) DEFAULT NULL,
  `Materialreq` int(11) DEFAULT NULL,
  `ReturnedQty` double(12,2) DEFAULT NULL,
  `Chartaccount` int(11) DEFAULT NULL,
  `POdetail` int(11) DEFAULT NULL,
  `Stockcard` int(11) DEFAULT NULL,
  `Saleinvoicedetails` int(11) DEFAULT NULL,
  `Jobticket` int(11) DEFAULT NULL,
  `DocNo` varchar(45) DEFAULT NULL,
  `MaterialreqDetail` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK4B9BF72674F80D7E` (`InventoryId`) USING BTREE,
  KEY `FK4B9BF726734AC618` (`VatId`) USING BTREE,
  KEY `FK4B9BF726AF4B6F2` (`CurrencyId`) USING BTREE,
  KEY `FK_Grn` (`Grn`) USING BTREE,
  KEY `FK_Purchasecnote` (`Purchasecnote`) USING BTREE,
  KEY `FK_Purchasereturn` (`Purchasereturn`) USING BTREE,
  KEY `FK_Stockissue` (`Stockissue`) USING BTREE,
  KEY `FK_Stockadj` (`Stockadj`) USING BTREE,
  KEY `FK_Salescnote` (`Salescreditnote`) USING BTREE,
  KEY `FK_Supplierinv` (`Supplierinv`) USING BTREE,
  KEY `StcardSalesinvoiceIndex` (`Salesinv`) USING BTREE,
  KEY `FK_Issuereturn` (`Issuereturn`) USING BTREE,
  KEY `StkcardPOrderIndex` (`Porder`) USING BTREE,
  KEY `StkcardSuppIndex` (`Supplier`) USING BTREE,
  KEY `StkcardCustomerIndex` (`Customer`) USING BTREE,
  KEY `StkcardSalesreturnIndex` (`Salesreturn`) USING BTREE,
  KEY `StkcardSOIndex` (`Salesorder`) USING BTREE,
  KEY `StkcardMachineIndex` (`Machine`) USING BTREE,
  KEY `StkcardDeptIndex` (`Deptid`) USING BTREE,
  KEY `StkcardStoreIndex` (`StoreId`) USING BTREE,
  KEY `StkcardMatreqIndex` (`Materialreq`) USING BTREE,
  KEY `StkcardCoAIndex` (`Chartaccount`) USING BTREE,
  KEY `StkcardPOdetailIndex` (`POdetail`) USING BTREE,
  KEY `StkcardStkcardIndex` (`Stockcard`) USING BTREE,
  KEY `SalesinvoicedetailsIndex` (`Saleinvoicedetails`) USING BTREE,
  KEY `StkcardjobticketIndex` (`Jobticket`) USING BTREE,
  KEY `StkcardcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `StkcardapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `StkcardMatreqDetailIndex` (`MaterialreqDetail`) USING BTREE,
  KEY `Index_33` (`Quantity_In`) USING BTREE,
  KEY `Index_34` (`Quantity_Out`) USING BTREE,
  KEY `stkcardcostcenter` (`costcenter`),
  KEY `stkcardcompany` (`company`),
  CONSTRAINT `stkcardcompany` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stkcardcostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_10` FOREIGN KEY (`Purchasecnote`) REFERENCES `purcreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_11` FOREIGN KEY (`Purchasereturn`) REFERENCES `purchasereturnnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_12` FOREIGN KEY (`Salesorder`) REFERENCES `salesorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_13` FOREIGN KEY (`Salescreditnote`) REFERENCES `salescreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_14` FOREIGN KEY (`Salesinv`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_15` FOREIGN KEY (`Chartaccount`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_16` FOREIGN KEY (`Salesreturn`) REFERENCES `salesreturnnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_17` FOREIGN KEY (`Stockcard`) REFERENCES `stockcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_18` FOREIGN KEY (`Stockadj`) REFERENCES `stkadjustment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_19` FOREIGN KEY (`Stockissue`) REFERENCES `stockissue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_20` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_21` FOREIGN KEY (`Supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_22` FOREIGN KEY (`Supplierinv`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_23` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_24` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_25` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_26` FOREIGN KEY (`CurrencyId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_29` FOREIGN KEY (`Customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_30` FOREIGN KEY (`Deptid`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_31` FOREIGN KEY (`Grn`) REFERENCES `goodsreceipt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_32` FOREIGN KEY (`InventoryId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_33` FOREIGN KEY (`Issuereturn`) REFERENCES `materialreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_4` FOREIGN KEY (`Saleinvoicedetails`) REFERENCES `salesinvoice_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_5` FOREIGN KEY (`Machine`) REFERENCES `assetregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_6` FOREIGN KEY (`MaterialreqDetail`) REFERENCES `materialreq_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_7` FOREIGN KEY (`Materialreq`) REFERENCES `materialreq` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_8` FOREIGN KEY (`POdetail`) REFERENCES `purchaseorderdetail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockcard_ibfk_9` FOREIGN KEY (`Porder`) REFERENCES `purchaseorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockcard`
--

LOCK TABLES `stockcard` WRITE;
/*!40000 ALTER TABLE `stockcard` DISABLE KEYS */;
INSERT INTO `stockcard` VALUES (30,2,36,1,NULL,'GOODS RECEIPT',NULL,NULL,33,NULL,16.00,2300.00,5.000,NULL,11500.00,NULL,1.0000,7,'2016-02-19','2016-02-19 10:49:11',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,2,5.00,5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2217,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(31,2,36,1,NULL,'MATERIAL ISSUE',NULL,NULL,NULL,NULL,16.00,2300.00,NULL,2.000,4600.00,NULL,1.0000,7,'2016-02-19','2016-02-19 10:57:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5.00,NULL,NULL,NULL,NULL,NULL,NULL,2.00,2.00,3,NULL,2217,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,0),(32,2,36,1,5,'CREDIT SALES',NULL,NULL,32,NULL,16.00,2500.00,NULL,2.000,5000.00,NULL,1.0000,7,'2016-02-19','2016-02-19 11:01:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,0),(33,2,36,1,NULL,'MATERIAL RETURNS',NULL,NULL,NULL,NULL,16.00,2300.00,1.000,NULL,2300.00,NULL,1.0000,7,'2016-02-19','2016-02-19 11:02:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,0);
/*!40000 ALTER TABLE `stockcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockissue`
--

DROP TABLE IF EXISTS `stockissue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockissue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FromStore` int(11) DEFAULT NULL,
  `ToStore` int(11) DEFAULT NULL,
  `ReqDept` int(11) DEFAULT NULL,
  `MRRequisition` int(11) DEFAULT NULL,
  `IssueNo` varchar(45) DEFAULT NULL,
  `IssueType` varchar(45) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `Remarks` text,
  `JobTicket` int(11) DEFAULT NULL,
  `Machine` int(11) DEFAULT NULL,
  `JobTicketreqType` varchar(45) DEFAULT NULL,
  `FromDept` int(11) DEFAULT NULL,
  `Closed` tinyint(1) NOT NULL,
  `subtotal` double(12,2) NOT NULL DEFAULT '0.00',
  `vat` double(12,2) NOT NULL DEFAULT '0.00',
  `total` double(12,2) NOT NULL DEFAULT '0.00',
  `salesperson` int(11) DEFAULT NULL,
  `millage` double(12,2) NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK283FAF83FDC3C4DC` (`ReqDept`) USING BTREE,
  KEY `FK283FAF83A9C8662D` (`ToStore`) USING BTREE,
  KEY `FK283FAF837E6DDD9` (`MRRequisition`) USING BTREE,
  KEY `FK283FAF83F369C25E` (`FromStore`) USING BTREE,
  KEY `StkIssueFromdeptIndex` (`FromDept`) USING BTREE,
  KEY `StkIssueJobticketIndex` (`JobTicket`) USING BTREE,
  KEY `StkIssueMachineIndex` (`Machine`) USING BTREE,
  KEY `StkissuecreatedBy` (`CreatedBy`) USING BTREE,
  KEY `StkissueapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `stockIssueHrEmp` (`salesperson`) USING BTREE,
  KEY `stkissuecostcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `stkissuecostcenter` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_1` FOREIGN KEY (`salesperson`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_10` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_11` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_2` FOREIGN KEY (`FromStore`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_3` FOREIGN KEY (`FromDept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_5` FOREIGN KEY (`Machine`) REFERENCES `assetregister` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_6` FOREIGN KEY (`MRRequisition`) REFERENCES `materialreq` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_7` FOREIGN KEY (`ReqDept`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_8` FOREIGN KEY (`ToStore`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockissue_ibfk_9` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockissue`
--

LOCK TABLES `stockissue` WRITE;
/*!40000 ALTER TABLE `stockissue` DISABLE KEYS */;
INSERT INTO `stockissue` VALUES (6,NULL,NULL,NULL,3,'','DEVICES','2016-02-18',29,'2016-02-18 12:00:03',1,29,'2016-02-18 11:48:57','',NULL,NULL,NULL,NULL,0,0.00,0.00,0.00,NULL,0.00,NULL,NULL),(7,NULL,NULL,NULL,3,'','DEVICES','2016-02-18',29,'2016-02-18 12:08:23',1,29,'2016-02-18 12:00:04','',NULL,NULL,NULL,NULL,0,0.00,0.00,0.00,NULL,0.00,NULL,NULL),(8,NULL,NULL,NULL,3,'','DEVICES','2016-02-18',29,'2016-02-18 16:23:01',1,29,'2016-02-18 16:17:52','',NULL,NULL,NULL,NULL,0,0.00,0.00,0.00,NULL,0.00,NULL,NULL),(9,NULL,NULL,NULL,1,'','DEVICES','2016-02-18',7,'2016-02-18 20:52:00',1,7,'2016-02-18 20:50:53','',NULL,NULL,NULL,33,0,0.00,0.00,0.00,NULL,0.00,NULL,NULL),(10,NULL,NULL,NULL,2,'','DEVICES','2016-02-18',7,'2016-02-18 20:55:30',1,7,'2016-02-18 20:54:56','',NULL,NULL,NULL,NULL,0,0.00,0.00,0.00,NULL,0.00,NULL,NULL),(11,NULL,NULL,NULL,3,'','DEVICES','2016-02-19',7,'2016-02-19 10:57:23',1,7,'2016-02-19 10:54:32','',NULL,NULL,NULL,NULL,0,0.00,0.00,0.00,NULL,0.00,NULL,NULL);
/*!40000 ALTER TABLE `stockissue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StoreDesc` varchar(100) NOT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StoreDeptId` (`DeptId`) USING BTREE,
  KEY `FKCAD423B26CE51B19` (`DeptId`) USING BTREE,
  KEY `StorecreatedBy` (`CreatedBy`) USING BTREE,
  KEY `StoreapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stores_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stores_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stores_ibfk_4` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stores_ibfk_5` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgroup`
--

DROP TABLE IF EXISTS `subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subgroup` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SubGrpDesc` varchar(100) DEFAULT NULL,
  `GrpId` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  KEY `SubGrpIndex` (`GrpId`) USING BTREE,
  KEY `SubgrpcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SubgrpapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `subgroup_ibfk_1` FOREIGN KEY (`GrpId`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subgroup_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subgroup_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subgroup_ibfk_4` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subgroup_ibfk_5` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgroup`
--

LOCK TABLES `subgroup` WRITE;
/*!40000 ALTER TABLE `subgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppallocdetail`
--

DROP TABLE IF EXISTS `suppallocdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppallocdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SuppAllocId` int(11) NOT NULL,
  `SuppInvId` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `SuppInvdate` datetime DEFAULT NULL,
  `SuppInvRate` double(12,2) NOT NULL DEFAULT '0.00',
  `SuppInvAmt` double(12,2) NOT NULL DEFAULT '0.00',
  `SuppInvallocatedAmt` double(12,2) NOT NULL DEFAULT '0.00',
  `SuppInvBal` double(12,2) NOT NULL DEFAULT '0.00',
  `AllocAmt` double(12,2) NOT NULL DEFAULT '0.00',
  `ClearBal` tinyint(1) NOT NULL DEFAULT '0',
  `Purchaseledger` int(11) NOT NULL,
  `Docno` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SuppAllHeaderIndex_idx` (`SuppAllocId`) USING BTREE,
  KEY `SuppAllocSuppInvIndex_idx` (`SuppInvId`) USING BTREE,
  KEY `SuppAllocdetPLIndex` (`Purchaseledger`) USING BTREE,
  CONSTRAINT `suppallocdetail_ibfk_1` FOREIGN KEY (`SuppAllocId`) REFERENCES `supplierallocation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppallocdetail_ibfk_2` FOREIGN KEY (`Purchaseledger`) REFERENCES `purchaseledger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppallocdetail_ibfk_3` FOREIGN KEY (`SuppInvId`) REFERENCES `supplierinvoice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppallocdetail`
--

LOCK TABLES `suppallocdetail` WRITE;
/*!40000 ALTER TABLE `suppallocdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppallocdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierallocation`
--

DROP TABLE IF EXISTS `supplierallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplierallocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SuppId` int(11) DEFAULT NULL,
  `Journal` int(11) DEFAULT NULL,
  `Purchaseledger` int(11) DEFAULT NULL,
  `PCnote` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `AllocAmt` double(12,2) NOT NULL,
  `AllocNo` varchar(45) DEFAULT NULL,
  `CreditType` varchar(45) NOT NULL,
  `UnallocatedBal` double(12,2) DEFAULT NULL,
  `Remittance` int(11) DEFAULT NULL,
  `ExCreditAmt` double(12,2) DEFAULT NULL,
  `ExAllocatedAmt` double(12,2) DEFAULT NULL,
  `ExDiff` double(12,2) DEFAULT NULL,
  `JournalDetail` int(11) DEFAULT NULL,
  `Department` int(11) DEFAULT NULL,
  `Voided` tinyint(1) NOT NULL DEFAULT '0',
  `DocNo` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2D397BACD2FE9D4F` (`SuppId`) USING BTREE,
  KEY `SuppallocPcnoteIndex` (`PCnote`) USING BTREE,
  KEY `SuppallocJnlIndex` (`Journal`) USING BTREE,
  KEY `SuppallocRemittIndex` (`Remittance`) USING BTREE,
  KEY `SuppallocCbkIndex` (`Purchaseledger`) USING BTREE,
  KEY `SuppallocjnldetailIndex` (`JournalDetail`) USING BTREE,
  KEY `SuppallocdeptIndex` (`Department`) USING BTREE,
  KEY `SuppalloccreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SuppallocapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `supplierallocation_ibfk_1` FOREIGN KEY (`Journal`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_10` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_11` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_2` FOREIGN KEY (`Purchaseledger`) REFERENCES `purchaseledger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_3` FOREIGN KEY (`PCnote`) REFERENCES `purcreditnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_4` FOREIGN KEY (`Remittance`) REFERENCES `remmitance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_5` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_6` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `supplierallocation_ibfk_8` FOREIGN KEY (`Department`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierallocation_ibfk_9` FOREIGN KEY (`JournalDetail`) REFERENCES `journal_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierallocation`
--

LOCK TABLES `supplierallocation` WRITE;
/*!40000 ALTER TABLE `supplierallocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplierallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierinvoice`
--

DROP TABLE IF EXISTS `supplierinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplierinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SinvNo` varchar(45) DEFAULT NULL,
  `POId` int(11) DEFAULT NULL,
  `SuppId` int(11) DEFAULT NULL,
  `Service` tinyint(1) NOT NULL DEFAULT '0',
  `CurrId` int(11) DEFAULT NULL,
  `CurrRate` double(12,2) DEFAULT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `Storeid` int(11) DEFAULT NULL,
  `DiscRate` double(12,2) DEFAULT NULL,
  `DiscAmt` double(12,2) DEFAULT NULL,
  `TotalAmt` double(12,2) DEFAULT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  `CloseDate` datetime DEFAULT NULL,
  `ClosedBy` int(11) DEFAULT NULL,
  `TransportType` int(11) DEFAULT NULL,
  `TransporterName` varchar(45) DEFAULT NULL,
  `TransaportReg` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` datetime NOT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Subtotal` double(12,2) NOT NULL,
  `VatAmt` double(12,2) NOT NULL,
  `Suppinvoice` varchar(45) DEFAULT NULL,
  `Suppinvdate` datetime DEFAULT NULL,
  `Suppdelnote` varchar(45) DEFAULT NULL,
  `Suppdelnotedate` datetime DEFAULT NULL,
  `PriceVariance` double(12,2) DEFAULT NULL,
  `Creditnote` tinyint(1) NOT NULL DEFAULT '0',
  `vatInclusive` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SupInvCurrIndex_idx` (`CurrId`) USING BTREE,
  KEY `SuppInvSuppIndex_idx` (`SuppId`) USING BTREE,
  KEY `SuppInvPOIndex_idx` (`POId`) USING BTREE,
  KEY `SuppInvDeptIndex_idx` (`DeptId`) USING BTREE,
  KEY `SuppInvStoreIndex_idx` (`Storeid`) USING BTREE,
  KEY `FK87AFEBE17D30F8A3` (`Storeid`) USING BTREE,
  KEY `FK87AFEBE16CE51B19` (`DeptId`) USING BTREE,
  KEY `FK87AFEBE1FB7A88D3` (`CurrId`) USING BTREE,
  KEY `FK87AFEBE131957972` (`POId`) USING BTREE,
  KEY `FK87AFEBE1D2FE9D4F` (`SuppId`) USING BTREE,
  KEY `SuppinvcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SupinvapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `supplierinvoice_ibfk_1` FOREIGN KEY (`CurrId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_3` FOREIGN KEY (`DeptId`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_4` FOREIGN KEY (`POId`) REFERENCES `purchaseorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_5` FOREIGN KEY (`Storeid`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_6` FOREIGN KEY (`SuppId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_7` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_8` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoice_ibfk_9` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierinvoice`
--

LOCK TABLES `supplierinvoice` WRITE;
/*!40000 ALTER TABLE `supplierinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplierinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierinvoicedetail`
--

DROP TABLE IF EXISTS `supplierinvoicedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplierinvoicedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SuppInvNo` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `UomId` int(11) DEFAULT NULL,
  `Qty` double(12,3) DEFAULT NULL,
  `UnitPrice` double(12,3) DEFAULT NULL,
  `VatId` int(11) DEFAULT NULL,
  `VatRate` double(12,3) DEFAULT NULL,
  `TotalAmt` double(12,3) DEFAULT NULL,
  `AccCode` int(11) DEFAULT NULL,
  `Grn` int(11) DEFAULT NULL,
  `Stockcard` int(11) DEFAULT NULL,
  `pendingGrnQty` double(12,2) NOT NULL DEFAULT '0.00',
  `bulkInvDetails` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `SuppInvHeaderIndex_idx` (`SuppInvNo`) USING BTREE,
  KEY `SuppInvDetItemIndex_idx` (`itemId`) USING BTREE,
  KEY `SuppInvDetUomIndex_idx` (`UomId`) USING BTREE,
  KEY `SuppInvDetVatIndex_idx` (`VatId`) USING BTREE,
  KEY `SuppInvDetAccIndex_idx` (`AccCode`) USING BTREE,
  KEY `SuppInvDetGrnIndex` (`Grn`) USING BTREE,
  KEY `SuppInvDetStkcard` (`Stockcard`) USING BTREE,
  KEY `suppinvdetMilkdetailIdx` (`bulkInvDetails`) USING BTREE,
  CONSTRAINT `supplierinvoicedetail_ibfk_1` FOREIGN KEY (`AccCode`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoicedetail_ibfk_2` FOREIGN KEY (`Grn`) REFERENCES `goodsreceipt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoicedetail_ibfk_3` FOREIGN KEY (`itemId`) REFERENCES `inventory` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoicedetail_ibfk_4` FOREIGN KEY (`Stockcard`) REFERENCES `stockcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoicedetail_ibfk_5` FOREIGN KEY (`UomId`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoicedetail_ibfk_6` FOREIGN KEY (`VatId`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplierinvoicedetail_ibfk_7` FOREIGN KEY (`SuppInvNo`) REFERENCES `supplierinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierinvoicedetail`
--

LOCK TABLES `supplierinvoicedetail` WRITE;
/*!40000 ALTER TABLE `supplierinvoicedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplierinvoicedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SuppCode` varchar(10) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Address` text,
  `PostCodeId` int(11) DEFAULT NULL,
  `City` int(11) DEFAULT NULL,
  `Tel` varchar(100) DEFAULT NULL,
  `Mobile` varchar(100) DEFAULT NULL,
  `Fax` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `ContactName` varchar(100) DEFAULT NULL,
  `ContactTelno` varchar(100) DEFAULT NULL,
  `Bankbranch` int(11) DEFAULT NULL,
  `BankAccNo` varchar(45) DEFAULT NULL,
  `terms` int(11) DEFAULT NULL,
  `CreditLimit` decimal(12,2) DEFAULT NULL,
  `Discount` decimal(12,2) DEFAULT NULL,
  `CreditStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Notes` text,
  `ActiveStatus` tinyint(1) NOT NULL DEFAULT '0',
  `CurrencyId` int(11) DEFAULT NULL,
  `PIN_No` varchar(45) DEFAULT NULL,
  `VAT_No` varchar(45) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Tel2` varchar(100) DEFAULT NULL,
  `FinContact` varchar(100) DEFAULT NULL,
  `FinContactNo` varchar(100) DEFAULT NULL,
  `Vatable` tinyint(1) NOT NULL,
  `Country` int(11) DEFAULT NULL,
  `Bank` int(11) DEFAULT NULL,
  `Discountdays` double(12,2) DEFAULT NULL,
  `milksupp` tinyint(1) NOT NULL,
  `cashpaymode` tinyint(1) NOT NULL,
  `mobilepaymode` tinyint(1) NOT NULL,
  `bankpaymode` tinyint(1) NOT NULL,
  `route` int(11) DEFAULT NULL,
  `shareholder` tinyint(1) NOT NULL,
  `linkedcashacc` int(11) DEFAULT NULL,
  `nationalID` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SuppPostCode` (`PostCodeId`) USING BTREE,
  KEY `SuppCity` (`City`) USING BTREE,
  KEY `SuppCurrency` (`CurrencyId`) USING BTREE,
  KEY `FKFEA34027274AFF4B` (`City`) USING BTREE,
  KEY `FKFEA34027AF4B6F2` (`CurrencyId`) USING BTREE,
  KEY `FKFEA34027FC942499` (`PostCodeId`) USING BTREE,
  KEY `SuppCountryIndex` (`Country`) USING BTREE,
  KEY `SuppBankIndex` (`Bank`) USING BTREE,
  KEY `SuppcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `SuppapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `Supproute` (`route`) USING BTREE,
  KEY `SuppBank` (`Bankbranch`) USING BTREE,
  KEY `SupplinkedCashacc` (`linkedcashacc`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `companyid` (`companyid`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`Bankbranch`) REFERENCES `bankcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_10` FOREIGN KEY (`linkedcashacc`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_11` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_12` FOREIGN KEY (`companyid`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`route`) REFERENCES `route` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_3` FOREIGN KEY (`Bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_4` FOREIGN KEY (`City`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_5` FOREIGN KEY (`Country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_6` FOREIGN KEY (`CurrencyId`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_7` FOREIGN KEY (`PostCodeId`) REFERENCES `postcodes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_8` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_ibfk_9` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,NULL,'ENDMOR STEEL LTD','',NULL,NULL,'','','','',NULL,'','',NULL,'',NULL,NULL,NULL,0,NULL,1,1,'','',7,'2016-02-18','2016-02-19 01:22:59','2016-02-19 01:23:19',7,1,NULL,NULL,NULL,0,NULL,NULL,NULL,0,0,0,0,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `jobcard` int(11) NOT NULL,
  `trackerType` int(11) DEFAULT NULL,
  `trackerID` text,
  `location` text,
  `duration` int(11) DEFAULT NULL,
  `installer` int(11) DEFAULT NULL,
  `imeino` text,
  `deviceno` text,
  `salesrep` int(11) DEFAULT NULL,
  `contactPerson` text,
  `contactPersonPhone` text,
  `amountCharged` double(16,4) NOT NULL,
  `commission` double(16,4) NOT NULL,
  `registration` text,
  `model` text,
  `chassisno` text,
  `engineno` text,
  `color` text,
  `remarks` text,
  `existingCustomer` tinyint(1) NOT NULL,
  `currency` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `backupimeino` text,
  `backupdeviceno` text,
  `bulkinvoice` tinyint(1) NOT NULL,
  `invoiceno` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `vat` int(11) DEFAULT NULL,
  `vatinc` tinyint(1) NOT NULL DEFAULT '0',
  `invoicepaid` tinyint(1) NOT NULL DEFAULT '0',
  `allocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `jobcard` (`jobcard`),
  KEY `trackerType` (`trackerType`),
  KEY `installer` (`installer`),
  KEY `salesrep` (`salesrep`),
  KEY `currency` (`currency`),
  KEY `customer` (`customer`),
  KEY `invoiceno` (`invoiceno`),
  KEY `vat` (`vat`),
  KEY `allocation` (`allocation`),
  CONSTRAINT `tracker_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_10` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_11` FOREIGN KEY (`invoiceno`) REFERENCES `salesinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_12` FOREIGN KEY (`vat`) REFERENCES `vat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_13` FOREIGN KEY (`allocation`) REFERENCES `customerallocations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_5` FOREIGN KEY (`jobcard`) REFERENCES `jobcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_6` FOREIGN KEY (`trackerType`) REFERENCES `trackertype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_7` FOREIGN KEY (`installer`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_8` FOREIGN KEY (`salesrep`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_ibfk_9` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
INSERT INTO `tracker` VALUES (6,'2016-02-26','2016-02-26 20:47:18',7,1,'2016-02-26 20:47:46',7,NULL,NULL,15,1,NULL,'LOCATION',1,1,'IMEI','BK DEVICE',2,'CONTACT PERSON','0787626474',38000.0000,3000.0000,'REG','MODEL','CHASSIS NO','ENGINE NO','COLOR','',0,1,6,'BK IMEI','DEVICENO',0,11,0,2,0,0,NULL),(7,'2016-02-26','2016-02-26 20:51:58',7,1,'2016-02-26 20:52:50',7,NULL,NULL,16,1,NULL,'LOCATI',2,1,'IMEI','',2,'contact person','092848595',10000.0000,0.0000,'REB','MODE','CHASSIS','ENGIN','COLOR','',0,1,7,'','DEVICENO',0,12,0,1,0,1,NULL);
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackercertificate`
--

DROP TABLE IF EXISTS `trackercertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackercertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `tracker` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `expiryDate` date NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `noofyear` int(11) NOT NULL DEFAULT '0',
  `remarks` text,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `tracker` (`tracker`),
  CONSTRAINT `trackercertificate_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercertificate_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercertificate_ibfk_4` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercertificate_ibfk_5` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercertificate_ibfk_6` FOREIGN KEY (`tracker`) REFERENCES `tracker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackercertificate`
--

LOCK TABLES `trackercertificate` WRITE;
/*!40000 ALTER TABLE `trackercertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackercertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackercontract`
--

DROP TABLE IF EXISTS `trackercontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackercontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `certificate` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `noofyears` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `remarks` text,
  `renew` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `trackercontract_ibfk_5` (`certificate`),
  CONSTRAINT `trackercontract_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercontract_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercontract_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercontract_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackercontract_ibfk_5` FOREIGN KEY (`certificate`) REFERENCES `trackercertificate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackercontract`
--

LOCK TABLES `trackercontract` WRITE;
/*!40000 ALTER TABLE `trackercontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackercontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackermaintenance`
--

DROP TABLE IF EXISTS `trackermaintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackermaintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `tracker` int(11) DEFAULT NULL,
  `helpdesk` int(11) DEFAULT NULL,
  `oldimei` text,
  `newimei` text,
  `oldbackupimei` text,
  `newbackupimei` text,
  `olddeviceno` text,
  `newdeviceno` text,
  `oldbackupdeviceno` text,
  `newbackupdeviceno` text,
  `oldimeireturned` tinyint(1) NOT NULL,
  `olddevicenoreturned` tinyint(1) NOT NULL,
  `oldbackupimeireturned` tinyint(1) NOT NULL,
  `oldbackupdevicenoreturned` tinyint(1) NOT NULL,
  `remarks` text,
  `installer` int(11) DEFAULT NULL,
  `bro` int(11) DEFAULT NULL,
  `timeline` date DEFAULT NULL,
  `description` text,
  `oldimedamaged` tinyint(1) NOT NULL,
  `oldbackupimeidamaged` tinyint(1) NOT NULL,
  `olddevicenodamaged` tinyint(1) NOT NULL,
  `oldbackupdevicenodamaged` tinyint(1) NOT NULL,
  `charges` double(16,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `approvedBy` (`approvedBy`),
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  KEY `tracker` (`tracker`),
  KEY `helpdesk` (`helpdesk`),
  KEY `installer` (`installer`),
  KEY `bro` (`bro`),
  CONSTRAINT `trackermaintenance_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_5` FOREIGN KEY (`tracker`) REFERENCES `tracker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_6` FOREIGN KEY (`helpdesk`) REFERENCES `helpdesk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_7` FOREIGN KEY (`installer`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trackermaintenance_ibfk_8` FOREIGN KEY (`bro`) REFERENCES `hr_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackermaintenance`
--

LOCK TABLES `trackermaintenance` WRITE;
/*!40000 ALTER TABLE `trackermaintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackermaintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackertype`
--

DROP TABLE IF EXISTS `trackertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackertype`
--

LOCK TABLES `trackertype` WRITE;
/*!40000 ALTER TABLE `trackertype` DISABLE KEYS */;
INSERT INTO `trackertype` VALUES (1,'A'),(2,'B'),(3,'C');
/*!40000 ALTER TABLE `trackertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unclearedeffect`
--

DROP TABLE IF EXISTS `unclearedeffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unclearedeffect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` date NOT NULL,
  `TxnDate` datetime NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `Coa` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `TotalUnpresented` double(12,2) DEFAULT NULL,
  `TotalUncredited` double(12,2) DEFAULT NULL,
  `TotalUncleared` double(12,2) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UnclearedEffectCoaIndex` (`Coa`) USING BTREE,
  KEY `effectcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `effectapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `unclearedeffect_ibfk_1` FOREIGN KEY (`Coa`) REFERENCES `chartaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unclearedeffect_ibfk_2` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unclearedeffect_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unclearedeffect_ibfk_4` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unclearedeffect_ibfk_5` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unclearedeffect`
--

LOCK TABLES `unclearedeffect` WRITE;
/*!40000 ALTER TABLE `unclearedeffect` DISABLE KEYS */;
/*!40000 ALTER TABLE `unclearedeffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UomDesc` varchar(45) NOT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `Desc_UNIQUE` (`UomDesc`) USING BTREE,
  KEY `uomcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `uomapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `uom_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uom_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uom_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uom_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES (2,'PCS','2014-03-23',NULL,'2016-02-08 15:40:21',NULL,NULL,1,NULL,NULL),(8,'KGS','2014-03-23',NULL,'2016-02-08 15:40:21',NULL,NULL,1,NULL,NULL),(9,'BATC','2014-04-05',NULL,'2016-02-08 15:40:21',NULL,NULL,1,NULL,NULL),(10,'ROLL','2014-04-05',NULL,'2016-02-08 15:40:21',NULL,NULL,1,NULL,NULL),(11,'LTR','2014-04-05',NULL,'2016-02-08 15:40:21',NULL,NULL,1,NULL,NULL),(12,'MTR','2014-04-05',NULL,'2016-02-08 15:40:21',NULL,NULL,1,NULL,NULL),(13,'Bag','2016-01-07',7,'2016-02-08 15:40:21','2016-01-07 17:42:52',7,1,NULL,NULL),(14,'PACKET','2016-01-07',7,'2016-02-08 15:40:21','2016-01-07 19:03:09',7,1,NULL,NULL);
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(200) NOT NULL,
  `UserPass` varchar(32) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `theme` varchar(20) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NULL DEFAULT NULL,
  `ApproveDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ActiveStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Department` int(11) DEFAULT NULL,
  `Sales_HoD` tinyint(1) NOT NULL DEFAULT '0',
  `Purchases_HoD` tinyint(1) NOT NULL DEFAULT '0',
  `Stores_HoD` tinyint(1) NOT NULL DEFAULT '0',
  `Finance_HoD` tinyint(1) NOT NULL DEFAULT '0',
  `Production_HoD` tinyint(1) NOT NULL DEFAULT '0',
  `Email` varchar(45) DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `UserName_UNIQUE` (`UserName`) USING BTREE,
  KEY `userRole` (`RoleId`) USING BTREE,
  KEY `usercreatedBy` (`CreatedBy`) USING BTREE,
  KEY `userapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `DeptIndex` (`Department`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `depts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_5` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_6` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'Jessy','?milestone2',1,'vader','2014-03-21',NULL,'2014-03-22 03:04:11','2014-04-04 02:06:45',NULL,1,1,NULL,1,1,1,1,1,'',NULL,NULL),(29,'Shedy','erpADMIN',1,'vader','2014-06-20',7,'2014-06-21 00:19:55','2014-06-21 00:21:12',7,1,1,35,1,1,1,1,1,'',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vat`
--

DROP TABLE IF EXISTS `vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vat` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(2) NOT NULL,
  `rate` double(7,4) NOT NULL DEFAULT '0.0000',
  `CreateDate` date NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  UNIQUE KEY `Code_UNIQUE` (`Code`) USING BTREE,
  KEY `vatcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `vatapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `vat_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vat_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vat_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vat_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vat`
--

LOCK TABLES `vat` WRITE;
/*!40000 ALTER TABLE `vat` DISABLE KEYS */;
INSERT INTO `vat` VALUES (1,'Z',0.0000,'2013-05-23',NULL,'2016-02-08 15:43:10',NULL,NULL,1,NULL,NULL),(2,'S',16.0000,'2013-05-23',NULL,'2016-02-08 15:43:10',NULL,NULL,1,NULL,NULL),(3,'E',0.0000,'2013-08-24',NULL,'2016-02-08 15:43:10','2013-08-24 14:00:00',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `vat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `supplier` int(11) NOT NULL,
  `vehicletype` int(11) DEFAULT NULL,
  `regno` varchar(45) DEFAULT NULL,
  `driver` varchar(45) DEFAULT NULL,
  `drivermobileno` varchar(45) DEFAULT NULL,
  `approvalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `activeStatus` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleSuppIndex` (`supplier`) USING BTREE,
  KEY `vehicleCreatedByIndex` (`createdBy`) USING BTREE,
  KEY `vehicleApprvdByIndex` (`approvedBy`) USING BTREE,
  KEY `vehicletypeIndex` (`vehicletype`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicle_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicle_ibfk_4` FOREIGN KEY (`vehicletype`) REFERENCES `vehicletype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicle_ibfk_5` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicle_ibfk_6` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicletype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `txnDate` datetime NOT NULL,
  `vehicleType` varchar(45) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `approvalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vtypeCreatedbyIndex` (`createdBy`) USING BTREE,
  KEY `vtypeApprovedbyIndex` (`approvedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `vehicletype_ibfk_1` FOREIGN KEY (`approvedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicletype_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicletype_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicletype_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES (1,'2015-11-24','2015-11-24 21:21:49','Pickup',29,1,29,'2015-11-24 21:22:02',NULL,NULL),(2,'2015-11-24','2015-11-24 21:22:04','Lorry',29,1,29,'2015-11-24 21:22:14',NULL,NULL),(3,'2015-11-24','2015-11-24 21:22:14','Tuktuk',29,1,29,'2015-11-24 21:22:32',NULL,NULL),(4,'2015-11-27','2015-11-27 16:07:55','Motorbike',29,1,29,'2015-11-27 16:08:12',NULL,NULL);
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshift`
--

DROP TABLE IF EXISTS `workshift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshift` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ShiftName` varchar(45) DEFAULT NULL,
  `ShiftStart` timestamp NULL DEFAULT NULL,
  `ShiftEnd` timestamp NULL DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `TxnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ApprovedBy` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `ApprovalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `costcenter` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`) USING BTREE,
  KEY `shiftcreatedBy` (`CreatedBy`) USING BTREE,
  KEY `shiftapprovedBy` (`ApprovedBy`) USING BTREE,
  KEY `costcenter` (`costcenter`),
  KEY `company` (`company`),
  CONSTRAINT `workshift_ibfk_1` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workshift_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workshift_ibfk_3` FOREIGN KEY (`costcenter`) REFERENCES `costcenter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workshift_ibfk_4` FOREIGN KEY (`company`) REFERENCES `companydetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshift`
--

LOCK TABLES `workshift` WRITE;
/*!40000 ALTER TABLE `workshift` DISABLE KEYS */;
INSERT INTO `workshift` VALUES (1,'Morning Shift','1970-01-01 21:00:00','1970-01-02 06:00:00',NULL,'2013-11-06','2013-11-07 11:06:38',NULL,'2013-11-06 16:00:00',1,NULL,NULL),(2,'Afternoon Shift','1970-01-02 06:00:00','1970-01-02 13:00:00',NULL,'2013-11-06','2013-11-07 11:13:24',NULL,'2013-11-06 16:00:00',1,NULL,NULL),(3,'Evening Shift','1970-01-02 13:00:00','1970-01-01 21:00:00',NULL,'2013-11-06','2013-11-07 11:17:33',NULL,'2013-11-06 16:00:00',1,NULL,NULL),(4,'Night Shift','1970-01-02 11:00:00','1970-01-01 22:00:00',NULL,'2014-01-23','2014-01-24 13:23:47',NULL,'2014-01-23 16:00:00',1,NULL,NULL);
/*!40000 ALTER TABLE `workshift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `combinedledgers`
--

/*!50001 DROP TABLE IF EXISTS `combinedledgers`*/;
/*!50001 DROP VIEW IF EXISTS `combinedledgers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `combinedledgers` AS select `sl`.`CreateDate` AS `Date`,`sl`.`AccCode` AS `code`,`sl`.`Financialperiod` AS `financialperiod`,`sl`.`Description` AS `description`,`sl`.`DocType` AS `DocType`,`ch`.`AccName` AS `AccName`,`cur`.`CurrSymbol` AS `currency`,`sl`.`CurrRate` AS `CurrRate`,`sl`.`DebitAmt` AS `Debit Amt`,`sl`.`CreditAmt` AS `Credit Amt` from ((`salesledger` `sl` join `chartaccount` `ch`) join `currency` `cur`) where ((`sl`.`AccCode` = `ch`.`id`) and (`sl`.`CurrId` = `cur`.`id`)) union select `pl`.`CreateDate` AS `Date`,`pl`.`AccCode` AS `code`,`pl`.`Financialperiod` AS `financialperiod`,`pl`.`Description` AS `description`,`pl`.`DocType` AS `DocType`,`ch`.`AccName` AS `AccName`,`cur`.`CurrSymbol` AS `currency`,`pl`.`CurrRate` AS `CurrRate`,(`pl`.`DebitAmt` * `pl`.`CurrRate`) AS `Debit Amt`,(`pl`.`CreditAmt` * `pl`.`CurrRate`) AS `Credit Amt` from ((`purchaseledger` `pl` join `chartaccount` `ch`) join `currency` `cur`) where ((`pl`.`AccCode` = `ch`.`id`) and (`pl`.`CurrId` = `cur`.`id`)) union select `gl`.`CreateDate` AS `Date`,`gl`.`AccCode` AS `code`,`gl`.`Financialperiod` AS `financialperiod`,`gl`.`Description` AS `description`,`gl`.`DocType` AS `DocType`,`ch`.`AccName` AS `AccName`,`cur`.`CurrSymbol` AS `currency`,`gl`.`CurrRate` AS `CurrRate`,(`gl`.`DebitAmt` * `gl`.`CurrRate`) AS `Debit Amt`,(`gl`.`CreditAmt` * `gl`.`CurrRate`) AS `Credit Amt` from ((`generalledger` `gl` join `chartaccount` `ch`) join `currency` `cur`) where ((`gl`.`AccCode` = `ch`.`id`) and (`gl`.`CurrId` = `cur`.`id`)) union select `cbk`.`CreateDate` AS `Date`,`cbk`.`AccCode` AS `code`,`cbk`.`Financialperiod` AS `financialperiod`,`cbk`.`Description` AS `description`,`cbk`.`ModeOfPaymt` AS `DocType`,`ch`.`AccName` AS `AccName`,`cur`.`CurrSymbol` AS `currency`,`cbk`.`CurrRate` AS `CurrRate`,(`cbk`.`DebitAmt` * `cbk`.`CurrRate`) AS `Debit Amt`,(`cbk`.`CreditAmt` * `cbk`.`CurrRate`) AS `Credit Amt` from ((`cashbook` `cbk` join `chartaccount` `ch`) join `currency` `cur`) where ((`cbk`.`AccCode` = `ch`.`id`) and (`cbk`.`CurrId` = `cur`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `combinedledgers_basecurr`
--

/*!50001 DROP TABLE IF EXISTS `combinedledgers_basecurr`*/;
/*!50001 DROP VIEW IF EXISTS `combinedledgers_basecurr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `combinedledgers_basecurr` AS select `sl`.`CreateDate` AS `Date`,`sl`.`AccCode` AS `code`,`sl`.`Financialperiod` AS `financialperiod`,`sl`.`Description` AS `description`,`sl`.`DocType` AS `DocType`,`ch`.`AccName` AS `AccName`,(`sl`.`DebitAmt` * `sl`.`CurrRate`) AS `Debit Amt`,(`sl`.`CreditAmt` * `sl`.`CurrRate`) AS `Credit Amt` from ((`salesledger` `sl` join `chartaccount` `ch`) join `currency` `cur`) where ((`sl`.`AccCode` = `ch`.`id`) and (`sl`.`CurrId` = `cur`.`id`)) union select `pl`.`CreateDate` AS `Date`,`pl`.`AccCode` AS `code`,`pl`.`Financialperiod` AS `financialperiod`,`pl`.`Description` AS `description`,`pl`.`DocType` AS `DocType`,`ch`.`AccName` AS `AccName`,(`pl`.`DebitAmt` * `pl`.`CurrRate`) AS `Debit Amt`,(`pl`.`CreditAmt` * `pl`.`CurrRate`) AS `Credit Amt` from ((`purchaseledger` `pl` join `chartaccount` `ch`) join `currency` `cur`) where ((`pl`.`AccCode` = `ch`.`id`) and (`pl`.`CurrId` = `cur`.`id`)) union select `gl`.`CreateDate` AS `Date`,`gl`.`AccCode` AS `code`,`gl`.`Financialperiod` AS `financialperiod`,`gl`.`Description` AS `description`,`gl`.`DocType` AS `DocType`,`ch`.`AccName` AS `AccName`,(`gl`.`DebitAmt` * `gl`.`CurrRate`) AS `Debit Amt`,(`gl`.`CreditAmt` * `gl`.`CurrRate`) AS `Credit Amt` from ((`generalledger` `gl` join `chartaccount` `ch`) join `currency` `cur`) where ((`gl`.`AccCode` = `ch`.`id`) and (`gl`.`CurrId` = `cur`.`id`)) union select `cbk`.`CreateDate` AS `Date`,`cbk`.`AccCode` AS `code`,`cbk`.`Financialperiod` AS `financialperiod`,`cbk`.`Description` AS `description`,`cbk`.`ModeOfPaymt` AS `DocType`,`ch`.`AccName` AS `AccName`,(`cbk`.`DebitAmt` * `cbk`.`CurrRate`) AS `Debit Amt`,(`cbk`.`CreditAmt` * `cbk`.`CurrRate`) AS `Credit Amt` from ((`cashbook` `cbk` join `chartaccount` `ch`) join `currency` `cur`) where ((`cbk`.`AccCode` = `ch`.`id`) and (`cbk`.`CurrId` = `cur`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 13:31:19

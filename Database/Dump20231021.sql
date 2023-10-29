-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_system
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `Acc_No` varchar(15) NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Branch_ID` int DEFAULT NULL,
  `Account_Type` enum('saving','current') DEFAULT NULL,
  `Opening_Date` date DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Acc_No`),
  KEY `Branch_ID` (`Branch_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `bank_accounts_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branches` (`Branch_ID`),
  CONSTRAINT `bank_accounts_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` VALUES ('100001',1001,101,'current','2020-03-10',1),('100002',1002,102,'current','2021-07-25',1),('100003',1003,101,'saving','2021-11-02',1),('100004',1004,102,'saving','2022-09-18',1),('100005',1005,101,'saving','2021-06-07',1),('100006',1006,102,'saving','2020-12-29',1),('100007',1007,101,'current','2021-01-15',1),('100008',1008,102,'current','2022-04-30',1),('100009',1009,101,'saving','2020-08-21',1),('100010',1010,102,'saving','2020-05-03',1),('100011',1011,101,'current','2021-08-14',1),('100012',1012,102,'saving','2022-01-27',1),('100013',1013,101,'saving','2022-09-03',1),('100014',1014,102,'saving','2021-12-19',1),('100015',1015,101,'saving','2020-02-28',1),('100016',1016,102,'saving','2020-08-10',1),('100017',1017,101,'current','2021-03-04',1),('100018',1018,102,'saving','2020-06-22',1),('100019',1019,101,'saving','2022-02-07',1),('100020',1020,102,'current','2020-10-12',1);
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `Branch_ID` int NOT NULL AUTO_INCREMENT,
  `Branch_name` varchar(30) DEFAULT NULL,
  `Branch_Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (101,'Colombo Central Branch','123, Galle Road, Colombo 03, Sri Lanka'),(102,'Kandy Main Branch','456, Peradeniya Road, Kandy, Sri Lanka'),(103,'Galle Coastal Branch','789, Matara Road, Galle, Sri Lanka');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_accounts`
--

DROP TABLE IF EXISTS `current_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_accounts` (
  `Acc_No` varchar(15) NOT NULL,
  `Account_Bal` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Acc_No`),
  CONSTRAINT `current_accounts_ibfk_1` FOREIGN KEY (`Acc_No`) REFERENCES `bank_accounts` (`Acc_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_accounts`
--

LOCK TABLES `current_accounts` WRITE;
/*!40000 ALTER TABLE `current_accounts` DISABLE KEYS */;
INSERT INTO `current_accounts` VALUES ('100001',9874510.29),('100002',68711200.47),('100007',9844544.73),('100008',845021.00),('100011',2210.56),('100017',11236.36),('100020',457180.86);
/*!40000 ALTER TABLE `current_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_online_banking_details`
--

DROP TABLE IF EXISTS `customer_online_banking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_online_banking_details` (
  `Online_banking_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int DEFAULT NULL,
  `User_Name` varchar(15) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Online_banking_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `customer_online_banking_details_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_online_banking_details`
--

LOCK TABLES `customer_online_banking_details` WRITE;
/*!40000 ALTER TABLE `customer_online_banking_details` DISABLE KEYS */;
INSERT INTO `customer_online_banking_details` VALUES (1,1001,'saman_silva','password_1'),(2,1002,'nimal_fernando','password_2'),(3,1003,'kumari_perera','password_3'),(4,1004,'rohan_jaya','password_4'),(5,1007,'indika_fonseka','password_5');
/*!40000 ALTER TABLE `customer_online_banking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  `Is_Reg_For_Online_Banking` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1001,'Saman','Silva','1990-05-15','199005123456','99679a2d90d85eb0a54771628c02cf7a08b42b34b9a09020fabd56ce','123, Main Street, Colombo, Sri Lanka',0),(1002,'Nimal','Fernando','1995-08-21','199508123456','12efa10f792d4a6bf0b20f47be4321359b75bacb27c05c95e2eec5c0','456, Park Road, Kandy, Sri Lanka',0),(1003,'Kumari','Perera','2000-12-03','200012123456','1da1415b15aec5085bbd1f48c99b5d0089e2e903af789ebb356eaeea','789, Beach Avenue, Galle, Sri Lanka',0),(1004,'Rohan','Jayawardena','2005-03-07','200503123456','5a0f98742553c760b0392c90e6cb2e42d21bb1dfd0807bb09bffd4c3','101, River Lane, Negombo, Sri Lanka',0),(1005,'Malini','Gunawardhana','2010-11-14','201011123456','4b084c523c5e1db192fbc93ea2019abc17ef1c7576c2f7a015332a6b','222, Hillside Drive, Jaffna, Sri Lanka',0),(1006,'Chathura','Bandara','2015-07-29','201507123456','65c1e20ca038f73f73eb9fac82c9e48c021be682910d00291681ab61','333, Sea View, Trincomalee, Sri Lanka',0),(1007,'Indika','Fonseka','1965-02-09','196502123456','f47a76a90acaf85a0beb5e3a23912b1a7d1ddfd41f60d89dba7de143','444, Forest Road, Anuradhapura, Sri Lanka',0),(1008,'Lakshika','Rajapaksa','1970-12-17','197012123456','996de14a8177cd5d9c627ace0456e8e877d249a2dc349b26f126682d','555, Mountain View, Badulla, Sri Lanka',0),(1009,'Hasitha','Perera','1980-06-25','198006123456','840e1b2d6eaf8af0900b9d3b99d4c9a8874543f38bf9ce5d9c4b6625','666, Lake Side, Ratnapura, Sri Lanka',0),(1010,'Ishara','Fernando','1985-09-30','198509123456','a39d7f076918868c33ae9e03c08645f52b5b442b3b0d49b24fb7084b','777, Riverside, Matara, Sri Lanka',0),(1011,'Kasun','Samaraweera','1992-04-11','199204123456','9689b7c1e946b4cee653888484b5e3dc6b08ed7667eb854e4225642a','888, Valley Road, Kurunegala, Sri Lanka',0),(1012,'Sachini','Fernando','1997-10-01','199710123456','363635b55064df2521c0a16f52f8ccdcc41a128c0d8c2aa1a7daf21c','999, Green Lane, Hambantota, Sri Lanka',0),(1013,'Sanjeewa','Perera','2002-07-19','200207123456','76788dc6b372cc72aae607872a5eb1196e67b180156075edfd64b441','111, Coconut Grove, Kalutara, Sri Lanka',0),(1014,'Tharanga','Jayasuriya','2007-11-26','200711123456','8e29d6ab753b9906518d696b157adfeeda9a370ba64fb38815cbc8ff','222, Pine Street, Matale, Sri Lanka',0),(1015,'Chamara','Rathnayake','2012-03-02','201203123456','4a55c124bd6977a2c0d9443389dd694a1cd2c7e1c9948c1907afdc62','333, Orchid Road, Nuwara Eliya, Sri Lanka',0),(1016,'Nirosha','Fernando','2017-09-10','201709123456','db786bfe841dad825f9c7973a20658bec5ae11345a86c2ab44232210','444, Sunflower Avenue, Batticaloa, Sri Lanka',0),(1017,'Dilanka','Perera','1960-12-31','196012123456','568ba949969b25b0412c2eedfcd8b16e26dbb5508cf48477f72e0c13','555, Rose Street, Polonnaruwa, Sri Lanka',0),(1018,'Sandun','Fonseka','1967-05-08','196705123456','5e86918cd5a6da24f4bd2282b94c4a7fe5d121df865a478b49ee8cfa','666, Jasmine Lane, Ampara, Sri Lanka',0),(1019,'Thushara','Bandara','1975-08-14','197508123456','e70344579e013e41acff6fc9767b87a6b41bc069632abb6e4ab9e722','777, Tulip Road, Vavuniya, Sri Lanka',0),(1020,'Nimesha','Jayawardena','1989-11-23','198911123456','f77b2fc47287ba2c8dc1777c7df34e06bd132d2f22a736978474b208','888, Lily Drive, Kurunegala, Sri Lanka',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `User_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Position` enum('Manager','Employee') DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user_details` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Saman','Perera','Manager'),(2,'Kumari','Silva','Employee'),(3,'Nimal','Fernando','Employee'),(4,'Malini','Fonseka','Manager'),(5,'Rohan','Bandara','Employee'),(6,'Chathura','Ratnayake','Employee'),(7,'Lakshika','Gunawardhana','Employee'),(8,'Hasitha','Rajapaksa','Employee'),(9,'Ishara','Fernando','Employee'),(10,'Indika','Jayawardena','Employee');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fd_plans`
--

DROP TABLE IF EXISTS `fd_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fd_plans` (
  `Plan_ID` tinyint NOT NULL AUTO_INCREMENT,
  `Interest_Rate_Annum` decimal(4,2) DEFAULT NULL,
  `Duration_By_Months` tinyint DEFAULT NULL,
  PRIMARY KEY (`Plan_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fd_plans`
--

LOCK TABLES `fd_plans` WRITE;
/*!40000 ALTER TABLE `fd_plans` DISABLE KEYS */;
INSERT INTO `fd_plans` VALUES (1,13.00,6),(2,14.00,12),(3,15.00,36);
/*!40000 ALTER TABLE `fd_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_deposits`
--

DROP TABLE IF EXISTS `fixed_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_deposits` (
  `Fd_ID` int NOT NULL AUTO_INCREMENT,
  `Saving_acc_No` varchar(15) DEFAULT NULL,
  `FD_Plan_ID` tinyint DEFAULT NULL,
  `FD_Opening_date` date DEFAULT NULL,
  `FD_Closing_date` date DEFAULT NULL,
  `FD_Amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Fd_ID`),
  KEY `Saving_acc_No` (`Saving_acc_No`),
  KEY `FD_Plan_ID` (`FD_Plan_ID`),
  CONSTRAINT `fixed_deposits_ibfk_1` FOREIGN KEY (`Saving_acc_No`) REFERENCES `saving_accounts` (`Acc_No`),
  CONSTRAINT `fixed_deposits_ibfk_2` FOREIGN KEY (`FD_Plan_ID`) REFERENCES `fd_plans` (`Plan_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_deposits`
--

LOCK TABLES `fixed_deposits` WRITE;
/*!40000 ALTER TABLE `fixed_deposits` DISABLE KEYS */;
INSERT INTO `fixed_deposits` VALUES (1,'100012',1,'2023-08-01','2024-02-01',100000.00),(2,'100013',2,'2023-01-01','2024-01-01',80000.00),(3,'100018',3,'2021-05-01','2024-05-01',150000.00),(4,'100019',1,'2023-08-07','2024-02-07',40000.00);
/*!40000 ALTER TABLE `fixed_deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_details`
--

DROP TABLE IF EXISTS `loan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_details` (
  `Loan_Detail_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int DEFAULT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Is_Approved` tinyint(1) DEFAULT NULL,
  `Starting_Date` date DEFAULT NULL,
  `Closing_Date` date DEFAULT NULL,
  `Interest_Rate` decimal(4,2) DEFAULT NULL,
  `Amount_Remained` decimal(12,2) DEFAULT NULL,
  `Loan_Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Loan_Detail_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_details`
--

LOCK TABLES `loan_details` WRITE;
/*!40000 ALTER TABLE `loan_details` DISABLE KEYS */;
INSERT INTO `loan_details` VALUES (10001,1013,120000.00,1,'2022-12-01','2024-12-01',10.00,NULL,'Online'),(10002,1018,90000.00,1,'2023-01-05','2024-01-05',10.00,NULL,'Online'),(10003,1001,300000.00,1,'2023-03-10','2025-03-10',10.00,NULL,'Normal'),(10004,1011,60000.00,1,'2023-02-03','2024-02-03',10.00,NULL,'Normal');
/*!40000 ALTER TABLE `loan_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loan_details_after_insert` AFTER INSERT ON `loan_details` FOR EACH ROW BEGIN
	UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal + NEW.Amount
	WHERE Acc_No = (SELECT Acc_No FROM bank_accounts WHERE Customer_ID = NEW.Customer_ID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loan_installments`
--

DROP TABLE IF EXISTS `loan_installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_installments` (
  `Installment_ID` int NOT NULL AUTO_INCREMENT,
  `Loan_Detail_ID` int DEFAULT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  `Installed_Date` date DEFAULT NULL,
  `Comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Installment_ID`),
  KEY `Loan_Detail_ID` (`Loan_Detail_ID`),
  CONSTRAINT `loan_installments_ibfk_1` FOREIGN KEY (`Loan_Detail_ID`) REFERENCES `loan_details` (`Loan_Detail_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_installments`
--

LOCK TABLES `loan_installments` WRITE;
/*!40000 ALTER TABLE `loan_installments` DISABLE KEYS */;
INSERT INTO `loan_installments` VALUES (1,10001,5500.00,'2022-12-20','2022-12-18','First installment paid on time'),(2,10002,8250.00,'2023-01-20','2023-01-15','First installment paid on time'),(3,10001,5500.00,'2023-01-20','2023-01-21','Second installment paid with late'),(4,10003,13750.00,'2023-02-20','2023-02-16','First installment paid on time'),(5,10001,5500.00,'2023-02-20','2023-02-18','Third installment paid on time'),(6,10002,8250.00,'2023-02-20','2023-02-19','Second installment paid on time');
/*!40000 ALTER TABLE `loan_installments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loan_installments_after_insert` AFTER INSERT ON `loan_installments` FOR EACH ROW BEGIN
	UPDATE loan_details
    SET Amount_Remained = Amount_Remained - NEW.Amount
	WHERE Loan_Detail_ID = NEW.Loan_Detail_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `normal_loans`
--

DROP TABLE IF EXISTS `normal_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normal_loans` (
  `Loan_detail_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  PRIMARY KEY (`Loan_detail_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `normal_loans_ibfk_1` FOREIGN KEY (`Loan_detail_ID`) REFERENCES `loan_details` (`Loan_Detail_ID`),
  CONSTRAINT `normal_loans_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normal_loans`
--

LOCK TABLES `normal_loans` WRITE;
/*!40000 ALTER TABLE `normal_loans` DISABLE KEYS */;
INSERT INTO `normal_loans` VALUES (10003,5),(10004,8);
/*!40000 ALTER TABLE `normal_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_portal_loans`
--

DROP TABLE IF EXISTS `online_portal_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_portal_loans` (
  `Loan_detail_ID` int NOT NULL,
  `Fixed_Deposit_ID` int DEFAULT NULL,
  PRIMARY KEY (`Loan_detail_ID`),
  KEY `Fixed_Deposit_ID` (`Fixed_Deposit_ID`),
  CONSTRAINT `online_portal_loans_ibfk_1` FOREIGN KEY (`Loan_detail_ID`) REFERENCES `loan_details` (`Loan_Detail_ID`),
  CONSTRAINT `online_portal_loans_ibfk_2` FOREIGN KEY (`Fixed_Deposit_ID`) REFERENCES `fixed_deposits` (`Fd_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_portal_loans`
--

LOCK TABLES `online_portal_loans` WRITE;
/*!40000 ALTER TABLE `online_portal_loans` DISABLE KEYS */;
INSERT INTO `online_portal_loans` VALUES (10001,2),(10002,3);
/*!40000 ALTER TABLE `online_portal_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saving_account_types`
--

DROP TABLE IF EXISTS `saving_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saving_account_types` (
  `Type_No` tinyint NOT NULL AUTO_INCREMENT,
  `Person_Type` varchar(15) DEFAULT NULL,
  `Interest_Rate_Annum` decimal(4,2) DEFAULT NULL,
  `Required_Min_Bal` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`Type_No`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving_account_types`
--

LOCK TABLES `saving_account_types` WRITE;
/*!40000 ALTER TABLE `saving_account_types` DISABLE KEYS */;
INSERT INTO `saving_account_types` VALUES (1,'Children',12.00,NULL),(2,'Teen',11.00,500.00),(3,'Adult',10.00,1000.00),(4,'Senior',13.00,1000.00);
/*!40000 ALTER TABLE `saving_account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saving_accounts`
--

DROP TABLE IF EXISTS `saving_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saving_accounts` (
  `Acc_No` varchar(15) NOT NULL,
  `Saving_Acc_Type_No` tinyint DEFAULT NULL,
  `Acc_Bal` decimal(12,2) DEFAULT NULL,
  `No_Of_Withdrawals` int DEFAULT NULL,
  PRIMARY KEY (`Acc_No`),
  KEY `Saving_Acc_Type_No` (`Saving_Acc_Type_No`),
  CONSTRAINT `saving_accounts_ibfk_1` FOREIGN KEY (`Saving_Acc_Type_No`) REFERENCES `saving_account_types` (`Type_No`),
  CONSTRAINT `saving_accounts_ibfk_2` FOREIGN KEY (`Acc_No`) REFERENCES `bank_accounts` (`Acc_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving_accounts`
--

LOCK TABLES `saving_accounts` WRITE;
/*!40000 ALTER TABLE `saving_accounts` DISABLE KEYS */;
INSERT INTO `saving_accounts` VALUES ('100003',3,1500.00,0),('100004',3,2000.00,0),('100005',2,3000.00,0),('100006',1,4000.00,0),('100009',3,2500.00,0),('100010',3,3500.00,0),('100012',3,4500.00,0),('100013',3,5500.00,0),('100014',2,6500.00,0),('100015',1,7500.00,0),('100016',1,8500.00,0),('100018',3,9500.00,0),('100019',3,10500.00,0);
/*!40000 ALTER TABLE `saving_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `Transfer_ID` int NOT NULL AUTO_INCREMENT,
  `Transfer_Time` timestamp NULL DEFAULT NULL,
  `Trans_Amount` decimal(12,2) DEFAULT NULL,
  `From_Acc` varchar(15) DEFAULT NULL,
  `To_Acc` varchar(15) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Transfer_ID`),
  KEY `From_Acc` (`From_Acc`),
  KEY `To_Acc` (`To_Acc`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`From_Acc`) REFERENCES `bank_accounts` (`Acc_No`),
  CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`To_Acc`) REFERENCES `bank_accounts` (`Acc_No`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,'2021-11-03 08:00:00',500.00,'100006','100004',NULL),(2,'2020-07-01 03:15:00',600.00,'100001','100010',NULL),(3,'2022-05-20 11:45:00',300.00,'100013','100008',NULL),(4,'2020-08-29 03:30:00',500.00,'100010','100016',NULL),(5,'2021-05-06 09:25:00',400.00,'100018','100007',NULL);
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transfers_after_insert` AFTER INSERT ON `transfers` FOR EACH ROW BEGIN
	-- If from acoount is a saving account
	UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal - NEW.Trans_Amount
    WHERE Acc_No = NEW.From_Acc;
    
    -- If to acoount is a saving account
	UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal + NEW.Trans_Amount
    WHERE Acc_No = NEW.To_Acc;
    
    -- If from acoount is a current account
	UPDATE current_accounts
    SET Account_Bal = Account_Bal - NEW.Trans_Amount
    WHERE Acc_No = NEW.From_Acc;
    
    -- If to acoount is a current account
	UPDATE current_accounts
    SET Account_Bal = Account_Bal + NEW.Trans_Amount
    WHERE Acc_No = NEW.To_Acc;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Branch_ID` int DEFAULT NULL,
  `User_Name` varchar(20) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Contact_No` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branches` (`Branch_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,101,'User1','9440e64e095ff718c1926110fd811e64948984c9dee7ef860feb4d5d','Male','200123456789','user1@bank.com','0712345678'),(2,101,'User2','f346538a32757f10aa71baf7cf05693a6ac006f61347c5d5a1cfbd83','Female','191234567890','user2@bank.com','0723456789'),(3,101,'User3','cf63542523d0f21fd825a3c25f4cdbaef6bcb2a7c52e141da8c6ffbc','Male','200987654321','user3@bank.com','0712345670'),(4,102,'User4','55d2258384fb2aa2fc676b00774be260356091ac479a407f39b24043','Female','190987654322','user4@bank.com','0723456781'),(5,101,'User5','7ff7a3e9df02b3769a9b3a710a02a8ca832a01b073e07f05b1e8b132','Other','200112233445','user5@bank.com','0712345672'),(6,101,'User6','3ad2a1ef2f33bd157ceacf7d36ff39f8d2a1b16831548d0ed7a33aa2','Male','191122334455','user6@bank.com','0723456783'),(7,102,'User7','be87ab3501ab2f6f31f4480dfca94aed7c78fae6910cc9f83bd8bfb4','Female','200998877665','user7@bank.com','0712345674'),(8,101,'User8','a4fc29c64959b2146112e647c2ffb4f5d01ba94278c57b29b377c233','Male','200776655443','user8@bank.com','0723456785'),(9,102,'User9','65a6ac6248604a782980135adb735256fec8b0bcca85042a21d76cc0','Female','190011223344','user9@bank.com','0712345676'),(10,102,'User10','3f2786cbe260d9faffae8eeea03e62dab0fad98971898264b0d30db8','Male','200099887766','user10@bank.com','0723456787');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawals` (
  `Withdraw_ID` int NOT NULL AUTO_INCREMENT,
  `Acc_No` varchar(15) DEFAULT NULL,
  `Withdraw_Time` timestamp NULL DEFAULT NULL,
  `Withdraw_Amount` decimal(12,2) DEFAULT NULL,
  `Withdraw_Date` date DEFAULT NULL,
  PRIMARY KEY (`Withdraw_ID`),
  KEY `Acc_No` (`Acc_No`),
  CONSTRAINT `withdrawals_ibfk_1` FOREIGN KEY (`Acc_No`) REFERENCES `bank_accounts` (`Acc_No`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawals`
--

LOCK TABLES `withdrawals` WRITE;
/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
INSERT INTO `withdrawals` VALUES (1,'100003','2021-11-03 03:00:00',500.00,NULL),(2,'100005','2021-09-03 07:15:00',700.00,NULL),(3,'100007','2022-05-04 10:45:00',300.00,NULL),(4,'100008','2022-08-05 03:50:00',1000.00,NULL),(5,'100010','2022-05-06 09:25:00',200.00,NULL),(6,'100012','2023-07-07 05:40:00',900.00,NULL),(7,'100014','2022-01-08 12:00:00',600.00,NULL),(8,'100015','2020-06-09 04:55:00',800.00,NULL),(9,'100020','2020-12-22 08:10:00',400.00,NULL);
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `withdrawals_after_insert_1` AFTER INSERT ON `withdrawals` FOR EACH ROW BEGIN
    -- update current accounts
    UPDATE current_accounts
    SET Account_Bal = Account_Bal - NEW.Withdraw_Amount
    WHERE Acc_No = NEW.Acc_No;
    
	-- update current accounts
    UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal - NEW.Withdraw_Amount
    WHERE Acc_No = NEW.Acc_No;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `withdrawals_after_insert_2` AFTER INSERT ON `withdrawals` FOR EACH ROW BEGIN
	UPDATE saving_accounts
    SET No_Of_Withdrawals = No_Of_Withdrawals + 1
    WHERE Acc_No = NEW.Acc_No;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'bank_system'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `daily_update_fd_interest` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `daily_update_fd_interest` ON SCHEDULE EVERY 1 DAY STARTS '2023-10-21 00:22:10' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	CALL update_fd_interest();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `daily_update_saving_interest` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `daily_update_saving_interest` ON SCHEDULE EVERY 1 DAY STARTS '2023-10-21 00:22:12' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	CALL update_saving_interest();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'bank_system'
--
/*!50003 DROP FUNCTION IF EXISTS `get_FD_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_FD_interest`(amount DECIMAL(12,2), plan_Id tinyint) RETURNS decimal(12,2)
    READS SQL DATA
BEGIN
	DECLARE interest DECIMAL(12,2) DEFAULT 0.0;
    DECLARE rate DECIMAL(4,2) DEFAULT 0.0;
    
    -- calculate interest rate
	SELECT Interest_Rate_Annum FROM fd_plans fp WHERE fp.Plan_ID = plan_Id INTO rate;
    SELECT (amount * rate) / 1200 INTO interest;
	RETURN interest ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_interset_saving_accounts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_interset_saving_accounts`(balance DECIMAL(12,2), type_no tinyint) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE interest DECIMAL(12,2) DEFAULT 0.0;
    DECLARE rate DECIMAL(4,2) DEFAULT 0.0;
    
    -- calculate interest rate
	SELECT Interest_Rate_Annum FROM saving_account_types sat WHERE sat.Type_No = type_no INTO rate;
    SELECT (balance * rate) / 1200 INTO interest;
	RETURN interest ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_fd_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_fd_interest`()
BEGIN
	-- declare variables
	DECLARE count INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
	DECLARE interest DECIMAL(12,2) DEFAULT 0.0;
    DECLARE acc_no VARCHAR(15) DEFAULT NULL;
    
    SELECT COUNT(*) FROM fixed_deposits INTO count;
    
    SET i = 0;
    WHILE (i < count) DO
    
		-- find Account number and calculate interest
        SELECT get_interest(fd.FD_Amount, fd.FD_Plan_ID) ,fd.Saving_acc_No
		FROM fixed_deposits fd
		WHERE DATEDIFF(CURRENT_DATE(), fd.FD_Opening_date) % 30 = 0
		LIMIT i,1
        INTO interest, acc_no;
        
        -- update saving accounts
		UPDATE saving_accounts sa
		SET Acc_Bal = Acc_Bal + interest
		WHERE (sa.Acc_No = acc_no);
        
        SET i = i + 1;
        
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_saving_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_saving_interest`()
BEGIN
	-- declare variables
	DECLARE count INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
	DECLARE interest DECIMAL(12,2) DEFAULT 0.0;
    DECLARE acc_no VARCHAR(15) DEFAULT NULL;
    
    SELECT COUNT(*) FROM saving_accounts INTO count;
    
    SET i = 0;
    WHILE (i < count) DO
		
		-- find Account number and calculate interest
        SELECT get_interset_saving_accounts(sa.Acc_Bal, sa.Saving_Acc_Type_No) , sa.Acc_No
		FROM saving_accounts sa
		WHERE DATEDIFF(CURRENT_DATE(), (SELECT ba.Opening_Date FROM bank_accounts ba WHERE ba.Acc_No = sa.Acc_No)) % 30 = 0
		LIMIT i,1
        INTO interest, acc_no;
        
        -- update saving accounts
		UPDATE saving_accounts sa
		SET Acc_Bal = Acc_Bal + interest
		WHERE (sa.Acc_No = acc_no);
        
        SET i = i + 1;
        
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-21  1:11:35

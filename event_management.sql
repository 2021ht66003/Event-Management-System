CREATE DATABASE  IF NOT EXISTS `event_management`;
USE `event_management`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_role_id` int NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `USER_ROLE_FK_idx` (`user_role_id`),
  CONSTRAINT `USER_ROLE_FK` FOREIGN KEY (`user_role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
CREATE TABLE `event_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_type_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `EVENT_TYPE_FK_idx` (`event_type_id`),
  CONSTRAINT `EVENT_TYPE_FK` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `event_item`
--

DROP TABLE IF EXISTS `event_item`;
CREATE TABLE `event_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `EVENT_FK_idx` (`event_id`),
  KEY `SUPPLIER_FK_idx` (`supplier_id`),
  CONSTRAINT `EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `SUPPLIER_FK` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_item_id` int NOT NULL,
  `status_id` int NOT NULL,
  `client_id` int NOT NULL,
  `event_manager_id` int NOT NULL,
  `event_admin_id` int NOT NULL,
  `order_no` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `location` varchar(8000) NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_UNIQUE` (`order_no`),
  KEY `EVENT_ITEM_FK_idx` (`event_item_id`),
  KEY `STATUS_FK_idx` (`status_id`),
  KEY `CLIENT_FK_idx` (`client_id`),
  KEY `EVENT_MANAGER_FK_idx` (`event_manager_id`),
  KEY `EVENT_ADMIN_FK_idx` (`event_admin_id`),
  CONSTRAINT `CLIENT_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `EVENT_ADMIN_FK` FOREIGN KEY (`event_admin_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `EVENT_ITEM_FK` FOREIGN KEY (`event_item_id`) REFERENCES `event_item` (`id`),
  CONSTRAINT `EVENT_MANAGER_FK` FOREIGN KEY (`event_manager_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `STATUS_FK` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `is_active` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_type_id` int NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `note` varchar(4000) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `PAYMENT_TYPE_FK_idx` (`payment_type_id`),
  KEY `ORDER_FK_idx` (`order_id`),
  CONSTRAINT `ORDER_FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `PAYMENT_TYPE_FK` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Role master data
--
INSERT INTO `event_management`.`role` (`id`, `name`, `is_active`, `is_deleted`) VALUES ('1', 'Admin', '1', '0');
INSERT INTO `event_management`.`role` (`id`, `name`, `is_active`, `is_deleted`) VALUES ('2', 'Manager', '1', '0');
INSERT INTO `event_management`.`role` (`id`, `name`, `is_active`, `is_deleted`) VALUES ('3', 'Executive', '1', '0');

--
-- Event type master data
--
INSERT INTO `event_management`.`event_type` (`id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('1', 'Basic', 'Economy events consept. Events organized with necessry objecs and activities.', '1', '0');
INSERT INTO `event_management`.`event_type` (`id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('2', 'Medium', 'Average events consept. Events organized with  objecs and activities which are commonly available in every normal events of this type.', '1', '0');
INSERT INTO `event_management`.`event_type` (`id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('3', 'Premium', 'Premium event consept. Event organized with very premium obects and activities.', '1', '0');

--
-- Event master data
--
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('1', '1', 'Birthday', 'Birthdays are a new start, a fresh beginning and a time to pursue new endeavors with new goals.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('2', '2', 'Birthday', 'Birthdays are a new start, a fresh beginning and a time to pursue new endeavors with new goals.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('3', '3', 'Birthday', 'Birthdays are a new start, a fresh beginning and a time to pursue new endeavors with new goals.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('4', '1', 'Marriage', 'A happy marriage is a long conversation which always seems too short.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('5', '2', 'Marriage', 'A happy marriage is a long conversation which always seems too short.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('6', '3', 'Marriage', 'A happy marriage is a long conversation which always seems too short.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('7', '1', 'Naming ceremony', 'May your child be blessed and protected by God\'s wonderful love. Do celebrate the occation in devine but party way.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('8', '2', 'Naming ceremony', 'May your child be blessed and protected by God\'s wonderful love. Do celebrate the occation in devine but party way.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('9', '3', 'Naming ceremony', 'May your child be blessed and protected by God\'s wonderful love. Do celebrate the occation in devine but party way.', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('10', '1', 'Kitty party', 'Every Indian woman likes to host unique kitty parties once in a while. Let us work together to colour the occation', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('11', '2', 'Kitty party', 'Every Indian woman likes to host unique kitty parties once in a while. Let us work together to colour the occation', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('12', '3', 'Kitty party', 'Every Indian woman likes to host unique kitty parties once in a while. Let us work together to colour the occation', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('13', '1', 'Farewell', 'Don’t be dismayed at goodbyes. A farewell is necessary before you can meet again. And meeting again, after moments or lifetimes, is certain for those who are friends. Cheer up!', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('14', '2', 'Farewell', 'Don’t be dismayed at goodbyes. A farewell is necessary before you can meet again. And meeting again, after moments or lifetimes, is certain for those who are friends. Cheer up!', '1', '0');
INSERT INTO `event_management`.`event` (`id`, `event_type_id`, `name`, `description`, `is_active`, `is_deleted`) VALUES ('15', '3', 'Farewell', 'Don’t be dismayed at goodbyes. A farewell is necessary before you can meet again. And meeting again, after moments or lifetimes, is certain for those who are friends. Cheer up!', '1', '0');

--
-- Supplier master data
--
INSERT INTO `event_management`.`supplier` (`id`, `email`, `name`, `address`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('1', 'wedland@gmail.com', 'Wedland', 'Arena Plaza, East fort', '2222222222', 'Trivandrum', 'Kerala', '123456', '1', '0');
INSERT INTO `event_management`.`supplier` (`id`, `email`, `name`, `address`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('2', 'prettyevents@gmail.com', 'Pretty Events', 'Wed Plaza, Valmiki Nagar', '3333333333', 'Chennair', 'Tamilnadu', '456789', '1', '0');
INSERT INTO `event_management`.`supplier` (`id`, `email`, `name`, `address`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('3', 'amoulika@gmail.com', 'Amoulika', 'Lalbagh', '4444444444', 'Banglore', 'Karnataka', '321234', '1', '0');

--
-- Event item master data
--
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('1', '2', 'Pretty B\'Day', '30000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('2', '2', 'Super B\'day', '50000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('3', '3', 'Glorious B\'day', '75000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('4', '1', 'Silver Weds', '1200000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('5', '1', 'Glory Weds', '2000000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('6', '3', 'Super Weds', '3000000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('5', '3', 'Amouli Weds', '2500000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('5', '2', 'Pretty Weds', '1800000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('9', '2', 'Pretty Naming', '30000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('8', '3', 'Name Your Baby', '20000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('10', '1', 'Kitty Pretty', '15000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('11', '3', 'Kitty Party Silver', '20000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('12', '3', 'Kitty Party Gold', '30000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('13', '2', 'Pretty Farewell', '25000', '1', '0');
INSERT INTO `event_management`.`event_item` (`event_id`, `supplier_id`, `name`, `cost`, `is_active`, `is_deleted`) VALUES ('14', '3', 'Party Byes', '35000', '1', '0');

--
-- Order status master data
--
INSERT INTO `event_management`.`order_status` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('pending', 'Order is pending for approval', '1', '0');
INSERT INTO `event_management`.`order_status` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('Declined', 'Order has been declided', '1', '0');
INSERT INTO `event_management`.`order_status` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('In progress', 'Order is accepted and implementation in progress', '1', '0');
INSERT INTO `event_management`.`order_status` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('Complete', 'Order has been implemented successfully and payment completed.', '1', '0');

--
-- Payment type master data
--
INSERT INTO `event_management`.`payment_type` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('Credit Card', 'Credit card payment', '1', '0');
INSERT INTO `event_management`.`payment_type` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('Debit Card', 'Debit card payment', '1', '0');
INSERT INTO `event_management`.`payment_type` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('Cach', 'Cash payment', '1', '0');
INSERT INTO `event_management`.`payment_type` (`name`, `description`, `is_active`, `is_deleted`) VALUES ('UPI', 'Payment through any of the UPI apps.', '1', '0');

--
-- Employee sample data
--
INSERT INTO `event_management`.`employee` (`user_role_id`, `password`, `email`, `name`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('1', 'admin123', 'admin@gmail.com', 'Vasudev', '2293456787', 'Mumbai', 'Maharashtra', '123456', '1', '0');
INSERT INTO `event_management`.`employee` (`user_role_id`, `password`, `email`, `name`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('2', 'manager123', 'manager1@gmail.com', 'Greeshma', '3245345626', 'Panaji', 'Goa', '232123', '1', '0');
INSERT INTO `event_management`.`employee` (`user_role_id`, `password`, `email`, `name`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('3', 'executive123', 'executive1@gmail.com', 'Harikrishnan', '3425345678', 'Trivandrum', 'Kerala', '3423456789', '1', '0');
INSERT INTO `event_management`.`employee` (`user_role_id`, `password`, `email`, `name`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('2', 'manager123', 'manager2@gmail.com', 'Karthik', '3452345678', 'Ahmedabad', 'Gujarat', '456372', '1', '0');
INSERT INTO `event_management`.`employee` (`user_role_id`, `password`, `email`, `name`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('3', 'executive123', 'executive2@gmail.com', 'Hanna', '5454321234', 'Chennai', 'Tamilnadu', '1234231234', '1', '0');

--
-- Client sample data
--
INSERT INTO `event_management`.`client` (`password`, `email`, `name`, `address`, `phone`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('akshay123', 'akshay@gmail.com', 'Akshay', 'Madurai', '3456726345', 'Madurai', 'Tamilnadu', '876543', '1', '0');
INSERT INTO `event_management`.`client` (`password`, `email`, `name`, `address`, `city`, `state`, `zip`, `is_active`, `is_deleted`) VALUES ('rajit123', 'rajit@gmail.com', 'Rajit Kumar', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '555555', '1', '0');
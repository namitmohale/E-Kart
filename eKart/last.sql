/*
SQLyog Community v12.2.1 (64 bit)
MySQL - 5.5.48 : Database - ecommerce
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecommerce`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `CartUserID` int(11) NOT NULL,
  `CartProductID` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  KEY `CartUserID_idx` (`CartUserID`),
  KEY `CartProductID_idx` (`CartProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

insert  into `cart`(`CartUserID`,`CartProductID`,`qty`) values 
(6,4,1),
(6,1,9),
(10,1,1),
(1,1,2),
(1,4,1),
(13,13,1),
(6,5,2),
(0,5,3);

/*Table structure for table `comments_nlp` */

DROP TABLE IF EXISTS `comments_nlp`;

CREATE TABLE `comments_nlp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(40) DEFAULT NULL,
  `comments` text,
  `commentValue` int(11) DEFAULT NULL,
  `user_id` varchar(40) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `comments_nlp` */

insert  into `comments_nlp`(`id`,`item_id`,`comments`,`commentValue`,`user_id`,`com_date`) values 
(2,'5','This is good product.',1,'6','2016-05-04 13:01:50'),
(3,'1','This is bad product.',-1,'6','2016-05-04 13:02:04'),
(4,'1','ram jata h.',0,'6','2016-05-04 13:02:16'),
(6,'5','this is bad product.',-1,'6','2017-04-10 15:14:00'),
(7,'5','This is a good product.',1,'1','2017-10-25 15:21:38');

/*Table structure for table `feedback_query` */

DROP TABLE IF EXISTS `feedback_query`;

CREATE TABLE `feedback_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(100) DEFAULT NULL,
  `ph` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qType` varchar(100) DEFAULT NULL,
  `Message` tinytext,
  `qstatus` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback_query` */

insert  into `feedback_query`(`id`,`uName`,`ph`,`email`,`qType`,`Message`,`qstatus`) values 
(1,'Rajesh Kumar','90155883930','rkproject24@gmail.com','Rajesh Kumar','this is rajesh','processing'),
(2,'rajesh kumar','sdfsdf','rajesh@gmail.com',NULL,'zvfsdfsdf','processing');

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `ImageProductID` int(11) NOT NULL,
  `ProductImage` blob NOT NULL,
  KEY `ProductID_idx` (`ImageProductID`),
  CONSTRAINT `ImageProductID` FOREIGN KEY (`ImageProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `images` */

/*Table structure for table `orderedproduct` */

DROP TABLE IF EXISTS `orderedproduct`;

CREATE TABLE `orderedproduct` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  KEY `ProductID_idx` (`ProductID`),
  KEY `OrderID_idx` (`OrderID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orderedproduct` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `OrderUserID` int(11) NOT NULL,
  `OrderTotalPrice` double NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipAddress` varchar(100) NOT NULL,
  `OrderShipAddress2` varchar(100) NOT NULL,
  `OrderCity` varchar(50) NOT NULL,
  `OrderZip` varchar(20) NOT NULL,
  `OrderCountry` varchar(50) NOT NULL,
  `OrderShippingPrice` double NOT NULL,
  `OrderDate` varchar(45) NOT NULL,
  `OrderShipped` tinyint(6) NOT NULL,
  `OrderPaid` tinyint(4) NOT NULL,
  `OrderState` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  UNIQUE KEY `OrderUserID_UNIQUE` (`OrderUserID`),
  CONSTRAINT `OrderUserID` FOREIGN KEY (`OrderUserID`) REFERENCES `users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

/*Table structure for table `popular` */

DROP TABLE IF EXISTS `popular`;

CREATE TABLE `popular` (
  `ID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Rating` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `popular` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductThumb` tinytext,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductCondition` varchar(15) DEFAULT '',
  `ProductColor` varchar(45) DEFAULT NULL,
  `Material` varchar(100) DEFAULT '',
  `Manufacture` varchar(100) DEFAULT NULL,
  `CountryOfManufacture` varchar(100) DEFAULT 'India',
  `ProductPrice` double DEFAULT NULL,
  `ProductSale` double DEFAULT NULL,
  `ProductCategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`ProductID`,`ProductThumb`,`ProductName`,`ProductCondition`,`ProductColor`,`Material`,`Manufacture`,`CountryOfManufacture`,`ProductPrice`,`ProductSale`,`ProductCategoryID`) values 
(1,'1.jpg','T-Shirt',NULL,NULL,NULL,'ADIDASS',NULL,11,NULL,1),
(4,'107.jpg','T-Shirt',NULL,NULL,NULL,NULL,NULL,33,NULL,2),
(5,'1.png','1234',NULL,NULL,NULL,NULL,NULL,500,NULL,3),
(6,'63.jpg','t-shirt',NULL,NULL,NULL,NULL,NULL,700,NULL,1),
(7,'64.jpg','t shirt 2',NULL,NULL,NULL,NULL,NULL,710,NULL,1),
(8,'1.jpg','jeans',NULL,NULL,NULL,NULL,NULL,800,NULL,1),
(9,'6.jpg','jeans 2',NULL,NULL,NULL,NULL,NULL,850,NULL,1),
(10,'60.jpg','shirt2',NULL,NULL,NULL,NULL,NULL,1000,NULL,1),
(11,'22.jpg','shoes',NULL,NULL,NULL,NULL,NULL,600,NULL,1),
(12,'23.jpg','shoes2',NULL,NULL,NULL,NULL,NULL,650,NULL,1),
(13,'76.jpg','abc',NULL,NULL,NULL,NULL,NULL,550,NULL,2),
(14,'77.jpg','abc2',NULL,NULL,NULL,NULL,NULL,560,NULL,2),
(15,'93.jpg','ladiesbag',NULL,NULL,NULL,NULL,NULL,670,NULL,2),
(16,'95.JPG','ladies bag2',NULL,NULL,NULL,NULL,NULL,700,NULL,2),
(17,'129.jpg','ladies shoes',NULL,NULL,NULL,NULL,NULL,800,NULL,2),
(18,'148.jpg','ladies shoes 2',NULL,NULL,NULL,NULL,NULL,1000,NULL,2);

/*Table structure for table `productcategories` */

DROP TABLE IF EXISTS `productcategories`;

CREATE TABLE `productcategories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `StatusOpt` varchar(50) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `productcategories` */

insert  into `productcategories`(`CategoryID`,`CategoryName`,`StatusOpt`) values 
(1,'Men','Active'),
(2,'Women','Active'),
(3,'Kids','Active');

/*Table structure for table `size` */

DROP TABLE IF EXISTS `size`;

CREATE TABLE `size` (
  `SizeProductID` int(11) NOT NULL,
  `ProductSize` varchar(45) NOT NULL,
  KEY `ProductSize_idx` (`SizeProductID`),
  CONSTRAINT `SizeProductID` FOREIGN KEY (`SizeProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `size` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserFirstName` varchar(45) NOT NULL,
  `UserLastName` varchar(45) NOT NULL,
  `UserEmail` varchar(90) NOT NULL,
  `UserPassword` varchar(45) NOT NULL,
  `UserBirthDate` varchar(10) NOT NULL,
  `UserPhone` varchar(25) DEFAULT NULL,
  `UserAddress` varchar(100) NOT NULL,
  `UserAddress2` varchar(45) DEFAULT NULL,
  `UserCity` varchar(50) NOT NULL,
  `UserZip` varchar(30) NOT NULL,
  `UserCountry` varchar(50) NOT NULL,
  `UserGender` varchar(6) NOT NULL,
  `UserEmailVerified` int(11) NOT NULL,
  `UserRegistrationDate` varchar(45) NOT NULL,
  `UserVerificationCode` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `emailAddress_UNIQUE` (`UserEmail`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`UserID`,`UserFirstName`,`UserLastName`,`UserEmail`,`UserPassword`,`UserBirthDate`,`UserPhone`,`UserAddress`,`UserAddress2`,`UserCity`,`UserZip`,`UserCountry`,`UserGender`,`UserEmailVerified`,`UserRegistrationDate`,`UserVerificationCode`) values 
(0,'admin','admin','admin@gmail.com','admin','18/1/2010','9015588303','New Delhi','New Delhi','Delhi','110018','India','male',1,'18/04/2016 09:06:08','@admin'),
(1,'rajesh','kumar','janaktalk@gmail.com','rajesh','16/5/2017','9015588303','New Delhi janakpuri, Vikaspuri ,Budhela market',NULL,'Delhi','110018','India','male',0,'27/04/2017 20:51:16','[B@52300b28');

/*Table structure for table `wish_list` */

DROP TABLE IF EXISTS `wish_list`;

CREATE TABLE `wish_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CartUserID` int(11) DEFAULT NULL,
  `CartProductID` int(11) DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `wish_list` */

insert  into `wish_list`(`ID`,`CartUserID`,`CartProductID`,`other`) values 
(1,6,1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

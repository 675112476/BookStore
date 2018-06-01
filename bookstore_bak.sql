/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.58 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookstore`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id_FK` (`category_id`),
  CONSTRAINT `category_id_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`author`,`price`,`image`,`description`,`category_id`) values ('1','book1','123',500,'1.jpg','561515961','1'),('2','book2','123',400,'2.jpg','651651231','1'),('3','book3','1234',600,'1.jpg','545236525','2'),('4','book4','1234',800,'2.jpg','6516516126','2');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`description`) values ('1','a','123123123'),('2','b','123123');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `id` varchar(40) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `book_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_FK` (`order_id`),
  KEY `book_id_FK` (`book_id`),
  CONSTRAINT `order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `book_id_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`id`,`quantity`,`price`,`order_id`,`book_id`) values ('0ec0d3c5-665e-4b30-bc8d-681d35c6a213',1,500,'4487665c-4b1c-45f0-a6c1-2fdd63e46ffe','1'),('20042302-ce3b-43e3-9f14-0c5f8f4d1995',1,500,'dab9dda0-ac18-47db-b198-1cf8610ab8a2','1'),('24686e54-2f06-4838-9d20-64d1344a83ba',3,1500,'a7ba1326-8eb6-4416-afa2-7c3b4fc9bc54','1'),('2e1ef1d7-828b-4987-a00c-7b8c2eae45e5',1,500,'f2a12586-422f-45ee-bb34-78fab93d7931','1'),('31b245cb-a99f-4c19-a677-bc9a32118110',2,1000,'3a813fe3-60a3-4069-bb2e-d513db47c19f','1'),('353b082c-e8d3-4231-a613-53aae0459580',1,500,'e3f7d580-2cc9-4516-ac8f-74b068c5a087','1'),('4d4b0950-380d-4a1a-8e31-20dd8f12af8f',2,1000,'d8a02447-58ae-4d3f-8c33-1f2bfe2d44ca','1'),('593e2952-2882-451a-acab-06da273b5c19',2,1000,'5857cbda-f7a5-4ef0-a326-db7ca04f51cf','1'),('73e6f7df-59fc-4897-a529-b7e60f33d48a',1,500,'185b0dac-82e0-4976-801a-fbac7ec758fc','1'),('8c95059b-3433-4365-acf2-5e9797c20e1a',1,500,'09c391bd-bc08-4c0e-990f-da2e53e0d975','1'),('b0b5bc60-e40c-4c6b-84b8-5f47a18918c6',3,1500,'fb7ddb37-3dd0-49a1-ae60-ecdeb00a9cbd','1'),('badf5a0e-ef23-42e2-b6ed-02b49e1ab6b1',1,500,'e350d6c8-1490-40ed-9d69-caa3a2576dc2','1'),('c16a61d8-02ca-495e-bd82-d2790fe78fed',2,1000,'89950e42-1159-4b41-8034-97a9747c274d','1'),('c5bf5612-ed66-4eb4-814b-8e129bc931b3',1,500,'34540754-d692-4225-b149-b0cab9f72aba','1'),('c81466bb-568a-4613-881f-05075b42900a',1,500,'6d89c67b-193b-43a7-b535-1b1abfa84dd5','1'),('cdc4e337-c4d2-4c11-bb01-10b65f829974',1,400,'1b00537c-1fe8-41a0-bd04-115c15344778','2'),('deae4c9d-dadd-44f9-bbbc-1613b4afe2e9',1,600,'846bb326-e7b7-4b0c-b290-7ae160b6a7ea','3'),('ec08fe4f-1c78-44ce-9c1d-a99ad8a1e719',1,500,'83cebd68-fd1d-4e09-acd2-fc7add9dc0f2','1'),('f076534b-c7ba-45be-a3a5-5f972b7957bb',1,500,'846bb326-e7b7-4b0c-b290-7ae160b6a7ea','1'),('f2816160-c793-45a0-b8db-168b471b21fc',1,500,'6d46f5be-ff00-48ff-a790-47d123834f2a','1'),('f358f751-9512-41cd-abda-6267c857e780',2,1000,'e22e019e-7b18-4e44-822f-837cb933aecd','1'),('fbf643c1-a9db-4393-8b60-c498f7ba9027',1,500,'054f3145-ea97-4ada-894a-7f8a970afa86','1');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(40) NOT NULL,
  `ordertime` datetime NOT NULL,
  `price` double NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `user_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_FK` (`user_id`),
  CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`ordertime`,`price`,`state`,`user_id`) values ('054f3145-ea97-4ada-894a-7f8a970afa86','2018-05-31 20:30:01',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('09c391bd-bc08-4c0e-990f-da2e53e0d975','2018-05-31 20:46:38',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('185b0dac-82e0-4976-801a-fbac7ec758fc','2018-05-31 23:20:13',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('1b00537c-1fe8-41a0-bd04-115c15344778','2018-05-31 20:26:49',400,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('34540754-d692-4225-b149-b0cab9f72aba','2018-05-31 20:57:17',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('3a813fe3-60a3-4069-bb2e-d513db47c19f','2018-05-31 20:41:48',1000,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('4487665c-4b1c-45f0-a6c1-2fdd63e46ffe','2018-05-31 20:36:27',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('5857cbda-f7a5-4ef0-a326-db7ca04f51cf','2018-05-31 20:35:31',1000,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('6d46f5be-ff00-48ff-a790-47d123834f2a','2018-05-31 20:45:27',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('6d89c67b-193b-43a7-b535-1b1abfa84dd5','2018-05-31 20:46:58',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('83cebd68-fd1d-4e09-acd2-fc7add9dc0f2','2018-05-31 20:34:08',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('846bb326-e7b7-4b0c-b290-7ae160b6a7ea','2018-05-31 20:29:07',1100,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('89950e42-1159-4b41-8034-97a9747c274d','2018-05-31 20:32:45',1000,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('a7ba1326-8eb6-4416-afa2-7c3b4fc9bc54','2018-05-31 18:57:37',1500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('d8a02447-58ae-4d3f-8c33-1f2bfe2d44ca','2018-05-31 20:29:39',1000,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('dab9dda0-ac18-47db-b198-1cf8610ab8a2','2018-05-31 20:26:08',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('e22e019e-7b18-4e44-822f-837cb933aecd','2018-05-31 18:58:13',1000,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('e350d6c8-1490-40ed-9d69-caa3a2576dc2','2018-05-31 20:42:02',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('e3f7d580-2cc9-4516-ac8f-74b068c5a087','2018-05-31 20:33:04',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('f2a12586-422f-45ee-bb34-78fab93d7931','2018-05-31 20:25:22',500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('fb7ddb37-3dd0-49a1-ae60-ecdeb00a9cbd','2018-05-31 20:39:50',1500,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `cellphone` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`cellphone`,`email`,`address`) values ('e2d700bd-ca19-4a1c-91e6-86886b92ffc6','123','123','123','123','123','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

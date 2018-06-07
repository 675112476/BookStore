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

insert  into `book`(`id`,`name`,`author`,`price`,`image`,`description`,`category_id`) values ('1','清单人生','[瑞典]弗雷德里克',35,'1.jpg','巴克曼“暖心三部曲”最终话，国外读者好评如潮。','1'),('10','所谓情商高，就是会说话','[日]佐佐木圭一',24.9,'10.jpg','日本深受欢迎的人际沟通课程，世界知名企业员工指定培训教材！','4'),('11','断舍离','[日]山下英子',23,'11.jpg','认识更深层自我，重掌命运控制权，人生从此更自由！颠覆百万人生活方式的人生整理哲学。','4'),('12','一个优秀销售员的自我修炼','[美]托马斯.赫伯特.拉塞尔',29,'12.jpg','AI时代，销售需要的不仅是技巧，具有专业素质才是专业人士。','4'),('2','白夜行','[日]东野圭吾',41.1,'2.jpg','万千东野迷心中的无冕之王，中文版销量超450万册。','1'),('3','那不勒斯的萤火','[意]马西米利亚诺·威尔吉利奥',33.2,'3.jpg','被誉为欧美文坛近十年来的“灯塔”巨作。','1'),('4','唐诗三百首','思睿',26,'4.jpg','腹有诗书气自华 中国诗词大会 入选省级重点小学教学必备。','2'),('5','五三 2019A版 高考理数','曲一线',57.8,'5.jpg','（新课标专用）5年高考3年模拟 曲一线科学备考','2'),('6','新东方 (2019)考研英语高分写作','王江涛',36,'6.jpg','考研英语写作经典备考书目，2019全新改版，震撼上市，美籍外教全书审订。','2'),('7','余生很长，何必慌张','林熙',28.1,'7.jpg','不辜负自己，莫错过流光，去做你想做的事，趁阳光正好，趁微风不燥！','3'),('8','龙族3:黑月之潮(上) ','江南',17.5,'8.jpg','《知音漫客》周刊、《漫客小说绘》漫画&小说火热连载中，千万读者热烈追捧！','3'),('9','后来时间都与你有关','张皓宸',23.9,'9.jpg','张皓宸全新中短篇故事集。十万次握手，百万次相遇，只为你的一个喜欢。','3');

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

insert  into `category`(`id`,`name`,`description`) values ('1','热门小说','中国当代小说|中国近现代小说|中国古典小说|四大名著|港澳台小说|外国小说|侦探/悬疑/推理|惊悚/恐怖|魔幻|科幻|武侠|军事|情感|社会|都市|乡土|职场|财经|官场|历史|影视小说|作品集|世界名著|'),('2','教材教辅','一年级|二年级|三年级|四年级|五年级|六年级|小学升初中|小学通用|七年级|八年级|九年级|中考|初中通用|高一|高二|高三|高考|高中通用|中小学阅读英语专项|语文作文|工具书|写字/字帖|学习方法|教育理论/教师用书|'),('3','青春文学','校园|爱情/情感|叛逆/成长|悬疑/惊悚|娱乐/偶像|爆笑/无厘头|玄幻/新武侠/魔幻/科幻|大陆原创|港台青春文学|韩国青春文学|穿越/重生/架空|其他国外青春文学|影视|写真|古代言情'),('4','成功励志','人生哲学|成功/激励|心灵与修养|性格与习惯|智商/智谋|情商/情绪|管理|财商/财富|智慧人|在职场|人际交往|处世学|礼仪|口才/演讲/辩论|青少年励志|出国/留学|名言/格言|励志小品|男性励志|女性励志|名人励志|励志经典著作|英文原版书-成功励志');

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
  CONSTRAINT `book_id_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`id`,`quantity`,`price`,`order_id`,`book_id`) values ('5b82b808-827c-472d-b793-76e77956b6ab',1,24.9,'a5daddd7-e282-4036-997f-b48d2b89e59a','10'),('62cde730-90bc-424f-b23c-c811e5b04fd9',1,57.8,'d8d66784-71e3-4688-a37a-0e5961cadf25','5'),('82b7f290-4f85-470a-96b3-84c8623b2170',1,36,'d8d66784-71e3-4688-a37a-0e5961cadf25','6'),('91ca2f24-cd21-4538-9d08-2cd36403b07c',1,29,'f2de2f3e-40d8-4f30-99e9-489bb5893a81','12'),('ce2d7d40-a2a6-4eae-b190-7db714b0808d',1,33.2,'f2de2f3e-40d8-4f30-99e9-489bb5893a81','3'),('e700effa-8ce0-4b07-b1fa-ac459860b76f',1,26,'a5daddd7-e282-4036-997f-b48d2b89e59a','4'),('f1111e6f-4e56-48dd-899e-383693c35ecf',1,35,'a5daddd7-e282-4036-997f-b48d2b89e59a','1'),('f75e8adc-ce34-45d0-ba86-f0a592778a56',1,41.1,'f2de2f3e-40d8-4f30-99e9-489bb5893a81','2'),('f9d47220-8c64-4753-a8e8-0b3a02dbf00e',1,23,'a5daddd7-e282-4036-997f-b48d2b89e59a','11');

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

insert  into `orders`(`id`,`ordertime`,`price`,`state`,`user_id`) values ('a5daddd7-e282-4036-997f-b48d2b89e59a','2018-06-07 15:41:50',108.9,1,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('d8d66784-71e3-4688-a37a-0e5961cadf25','2018-06-07 15:42:25',93.8,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6'),('f2de2f3e-40d8-4f30-99e9-489bb5893a81','2018-06-07 15:42:15',103.3,0,'e2d700bd-ca19-4a1c-91e6-86886b92ffc6');

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

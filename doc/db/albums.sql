/*
SQLyog Ultimate v9.62 
MySQL - 5.5.24-log : Database - springtest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springtest` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `springtest`;

/*Table structure for table `album_categories` */

DROP TABLE IF EXISTS `album_categories`;

CREATE TABLE `album_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `album_categories` */

insert  into `album_categories`(`id`,`name`,`description`) values (1,'photo','default album'),(2,'life','life album'),(3,'sports','sports album'),(4,'beauty','beauty album');

/*Table structure for table `album_permissions` */

DROP TABLE IF EXISTS `album_permissions`;

CREATE TABLE `album_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `album_permissions` */

insert  into `album_permissions`(`id`,`name`,`description`) values (1,'normal','default'),(2,'private','only be viewed by onself');

/*Table structure for table `albums` */

DROP TABLE IF EXISTS `albums`;

CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `cover` int(11) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk$albums_permission` (`permission`),
  KEY `fk$albums_cover` (`cover`),
  KEY `fk$albums_user_id` (`user_id`),
  KEY `fk$albums_category` (`category`),
  CONSTRAINT `fk$albums_category` FOREIGN KEY (`category`) REFERENCES `album_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk$albums_cover` FOREIGN KEY (`cover`) REFERENCES `photos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk$albums_permission` FOREIGN KEY (`permission`) REFERENCES `album_permissions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk$albums_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `albums` */

/*Table structure for table `photos` */

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `album` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk$photos_albums_id` (`album`),
  CONSTRAINT `fk$photos_albums_id` FOREIGN KEY (`album`) REFERENCES `albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE photos AUTO_INCREMENT=1000;

/*Data for the table `photos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

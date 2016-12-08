/*
SQLyog Ultimate v10.42 
MySQL - 5.5.27 : Database - parkir_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parkir_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `parkir_db`;

/*Table structure for table `kendaraan` */

DROP TABLE IF EXISTS `kendaraan`;

CREATE TABLE `kendaraan` (
  `jenis` varchar(20) DEFAULT NULL,
  `tarif` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kendaraan` */

insert  into `kendaraan`(`jenis`,`tarif`) values ('Motor',2000),('Mobil',3000);

/*Table structure for table `parkir` */

DROP TABLE IF EXISTS `parkir`;

CREATE TABLE `parkir` (
  `no_tiket` int(100) NOT NULL AUTO_INCREMENT,
  `nopol` varchar(10) DEFAULT NULL,
  `jenis` enum('Motor','Mobil') DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jam_masuk` time DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  PRIMARY KEY (`no_tiket`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `parkir` */

insert  into `parkir`(`no_tiket`,`nopol`,`jenis`,`tgl_masuk`,`jam_masuk`,`tgl_keluar`,`jam_keluar`) values (1,'H6666HW','Motor','2013-06-03','07:00:00','2013-06-03','21:31:58'),(2,'H5107JE','Mobil','2013-06-03','07:30:45','2013-06-03','21:18:47'),(3,'H1111DN','Mobil','2013-06-03','08:10:57','2013-06-03','10:00:00'),(4,'K2222AC','Motor','2013-06-03','08:11:34','2013-06-03','09:00:00'),(5,'H6666AJ','Motor','2013-06-03','19:04:03','2013-06-03','21:17:53'),(6,'66666','Motor','2013-06-03','21:30:43','2013-06-03','21:35:26');

/*Table structure for table `vpark` */

DROP TABLE IF EXISTS `vpark`;

/*!50001 DROP VIEW IF EXISTS `vpark` */;
/*!50001 DROP TABLE IF EXISTS `vpark` */;

/*!50001 CREATE TABLE  `vpark`(
 `jam` varchar(8) 
)*/;

/*View structure for view vpark */

/*!50001 DROP TABLE IF EXISTS `vpark` */;
/*!50001 DROP VIEW IF EXISTS `vpark` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpark` AS select time_format(`parkir`.`jam_masuk`,'%H-') AS `jam` from `parkir` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

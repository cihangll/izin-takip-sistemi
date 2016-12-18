-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.30-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema izintakipsistemi
--

CREATE DATABASE IF NOT EXISTS izintakipsistemi;
USE izintakipsistemi;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kadi` varchar(45) CHARACTER SET latin1 NOT NULL,
  `sifre` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin5;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`kadi`,`sifre`) VALUES 
 (1,'admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `izinler`
--

DROP TABLE IF EXISTS `izinler`;
CREATE TABLE `izinler` (
  `birim` varchar(45) NOT NULL,
  `kayit_no` int(10) unsigned NOT NULL,
  `sicil_no` int(10) unsigned NOT NULL,
  `kalan_izin_mik` int(10) unsigned NOT NULL,
  `izin_bas_tarih` date NOT NULL,
  `izin_bts_tarih` date NOT NULL,
  `izin_turu` varchar(45) NOT NULL,
  `kullanilan_izin_mik` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kayit_no`),
  KEY `FK_izinler_1` (`sicil_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin5;

--
-- Dumping data for table `izinler`
--

/*!40000 ALTER TABLE `izinler` DISABLE KEYS */;
INSERT INTO `izinler` (`birim`,`kayit_no`,`sicil_no`,`kalan_izin_mik`,`izin_bas_tarih`,`izin_bts_tarih`,`izin_turu`,`kullanilan_izin_mik`) VALUES 
 ('yazilim',1,1,20,'2015-05-16','2015-05-30','yillik',14),
 ('yönetim',2,2,45,'2015-04-23','2015-04-25','ücretsiz',2),
 ('işçi',3,3,30,'2014-02-04','2014-02-07','mazeret',3),
 ('işci',4,4,12,'2014-03-02','2014-03-07','rapor',5),
 ('yönetim',5,5,11,'2015-03-18','2015-05-18','yillik',60),
 ('donanim',6,6,90,'2015-09-19','2015-10-19','yillik',30),
 ('donanim',7,7,17,'2014-05-01','2014-05-05','mazaret',4),
 ('kargo',8,8,12,'2015-06-06','2015-06-30','yillik',24),
 ('yönetim',9,9,41,'2012-07-12','2012-09-01','ücretsiz',6),
 ('donanim',10,10,15,'2013-03-05','2013-03-08','ücretsiz',8),
 ('yazilim',11,11,30,'2015-05-27','2015-07-01','rapor',35),
 ('yazilim',12,12,32,'2010-01-01','2010-02-01','mazeret',30),
 ('işci',13,13,27,'2014-02-05','2014-02-16','yillik',11),
 ('işci',14,14,24,'2014-02-04','2014-02-24','ücretsiz',20),
 ('yönetim',15,15,23,'2015-12-11','2016-01-01','mazeret',20),
 ('yazilim',16,16,20,'2014-12-12','2015-01-01','yillik',18),
 ('yönetim',17,17,40,'2014-06-24','2014-06-25','rapor',1),
 ('temizlik',18,18,12,'2014-07-22','2014-07-31','ücretsiz',9),
 ('temizlik',19,19,24,'2014-05-01','2014-05-25','mazeret',24),
 ('bilgi işlem',20,20,13,'2015-01-29','2015-02-11','yillik',12),
 ('temizlik',21,19,0,'2015-01-01','2015-01-25','yillik',24),
 ('yazilim',22,11,7,'2012-05-01','2012-05-24','ücretsiz',23),
 ('yönetim',23,2,43,'2000-01-29','2000-02-01','rapor',2),
 ('işci',24,4,11,'2008-01-02','2008-01-03','rapor',1),
 ('kargo',25,8,6,'2009-01-08','2009-01-14','mazeret',6),
 ('yönetim',26,5,8,'2015-06-27','2015-06-30','yillik',3),
 ('donanim',27,6,0,'2015-07-01','2015-09-30','ücretsiz',90),
 ('yönetim',28,17,5,'2012-12-01','2013-01-05','ücretsiz',35),
 ('işci',29,14,19,'2013-12-01','2013-12-06','rapor',5),
 ('temizlik',30,18,4,'2014-12-23','2015-01-01','yillik',8),
 ('denemeeee',31,1,0,'1111-11-11','1111-11-11','yillik',0);
/*!40000 ALTER TABLE `izinler` ENABLE KEYS */;


--
-- Definition of table `kisi_bilgi`
--

DROP TABLE IF EXISTS `kisi_bilgi`;
CREATE TABLE `kisi_bilgi` (
  `ad` varchar(45) NOT NULL,
  `soyad` varchar(45) NOT NULL,
  `tc_no` varchar(45) NOT NULL,
  `sicil_no` int(10) unsigned NOT NULL,
  `cinsiyet` varchar(45) NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `sehir` varchar(45) NOT NULL,
  PRIMARY KEY (`sicil_no`,`tc_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin5;

--
-- Dumping data for table `kisi_bilgi`
--

/*!40000 ALTER TABLE `kisi_bilgi` DISABLE KEYS */;
INSERT INTO `kisi_bilgi` (`ad`,`soyad`,`tc_no`,`sicil_no`,`cinsiyet`,`dogum_tarihi`,`sehir`) VALUES 
 ('Cihan','Güllü','10456754450',1,'erkek','1994-02-15','Manisa'),
 ('Hasan','Camci','17530653483',2,'erkek','1995-03-20','Antalya'),
 ('Yakup','Soy','40414141444',3,'erkek','1994-07-28','İstanbul'),
 ('Aysen','Dag','64563464441',4,'kiz','1994-01-04','Ankara'),
 ('Büsra','Akan','51909512051',5,'kiz','1994-09-22','Ankara'),
 ('Emel','Erdem','84613515112',6,'kiz','1990-03-13','Usak'),
 ('Kadim','Kan','25123523521',7,'erkek','1987-05-20','Afyon'),
 ('Faruk','Açar','61624123441',8,'erkek','1990-04-19','Ankara'),
 ('Mustafa','Aydogan','74526345244',9,'erkek','1995-02-07','Manisa'),
 ('Mahmut','Tuncer','07456345151',10,'erkek','1992-06-21','İzmir'),
 ('Ayse','Mutlu','86736245234',11,'kiz','1996-09-09','Kütahya'),
 ('Betül','Perk','86736455231',12,'kiz','1980-08-30','Edirne'),
 ('Devran','Demirkiran','95452312700',13,'erkek','1984-01-08','Sakarya'),
 ('Aykut','Portakal','12342134662',14,'erkek','1993-02-02','Kocaeli'),
 ('Rakıp','Efendi','93425345235',15,'erkek','1995-07-18','Yozgaz'),
 ('Gamze','Yilmaz','54238521582',16,'kiz','1994-08-02','Edirne'),
 ('Özcan','Olmaz','84563464363',17,'erkek','1989-12-17','Muğla'),
 ('Aysel','Özgeli','94563262626',18,'kiz','1991-12-01','Sivas'),
 ('Ridvan','Ercan','93635646341',19,'erkek','1994-11-16','Hakkari'),
 ('Sakıp','Rakat','74523452525',20,'erkek','1995-10-27','Hatay'),
 ('Mert','Yazar','74523452525',21,'erkek','1995-10-27','Hatay'),
 ('Sinan','Uzun','75696456234',22,'erkek','1997-12-11','Muş'),
 ('Melek','Öz','96765256232',23,'kiz','1994-05-26','Kayseri'),
 ('Özlem','Gül','86523452352',24,'kiz','1989-04-07','Samsun'),
 ('Hatice','Soylu','94241045732',25,'kiz','1992-03-07','Trabzon');
/*!40000 ALTER TABLE `kisi_bilgi` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

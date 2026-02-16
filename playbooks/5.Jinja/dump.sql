CREATE DATABASE IF NOT EXISTS `myflixdb`
/*!40100 DEFAULT CHARACTER SET latin1 */;
USE `myflixdb`;
-- MySQL dump 10.13 Distrib 5.5.16,
for Win32 (x86) -- -- Host: localhost Database: myflixdb -- ------------------------------------------------------ -- Server version 5.5.25a
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

-- -- Table structure for table `movies`
-- DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `movies` (
`movie_id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(300) DEFAULT NULL,
`director` varchar(150) DEFAULT NULL,
`year_released` year(4) DEFAULT NULL,
`category_id` int(11) DEFAULT NULL,
PRIMARY KEY (`movie_id`),
KEY `fk_Movies_Categories1` (`category_id`),
KEY `title_index` (`title`),
KEY `qw` (`title`),
CONSTRAINT `fk_Movies_Categories1`
FOREIGN KEY (`category_id`)
REFERENCES `categories` (`category_id`)
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */
;

-- -- Dumping data for table `movies`
LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */
;
INSERT INTO `movies` VALUES
(1, 'Pirates of the Caribean 4', ' Rob Marshall', 2011, 1),
(2, 'Forgetting Sarah Marshal', 'Nicholas Stoller', 2008, 2),
(3, 'X-Men', NULL, 2008, NULL),
(4, 'Code Name Black', 'Edgar Jimz', 2010, NULL),
(5, 'Daddy\'s Little Girls', NULL, 2007, 8),
(6, 'Angels and Demons', NULL, 2007, 6),
(7, 'Davinci Code', NULL, 2007, 6),
(9, 'Honey mooners', 'John Schultz', 2005, 8),
(16, '67% Guilty', NULL, 2012, NULL);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */
;
UNLOCK TABLES;

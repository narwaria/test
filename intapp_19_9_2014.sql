/*
SQLyog Ultimate v8.55 
MySQL - 5.5.34-0ubuntu0.12.04.1 : Database - interview_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`interview_app` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `interview_app`;

/*Table structure for table `email_template` */

DROP TABLE IF EXISTS `email_template`;

CREATE TABLE `email_template` (
  `template_id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_template` */

/*Table structure for table `interview_question_log` */

DROP TABLE IF EXISTS `interview_question_log`;

CREATE TABLE `interview_question_log` (
  `interview_question_id` int(20) NOT NULL AUTO_INCREMENT,
  `question_data` text,
  `answers_data` text,
  `created_at` datetime DEFAULT NULL,
  `int_scheduler_id` int(11) DEFAULT NULL,
  `interviewer_data` text,
  PRIMARY KEY (`interview_question_id`),
  KEY `FK_interview_question_log` (`int_scheduler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `interview_question_log` */

/*Table structure for table `tbl_candidate` */

DROP TABLE IF EXISTS `tbl_candidate`;

CREATE TABLE `tbl_candidate` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_fname` varchar(255) NOT NULL,
  `candidate_lname` varchar(255) NOT NULL,
  `candidate_email` varchar(255) NOT NULL,
  `interview_id` int(11) NOT NULL,
  `interview_status` tinyint(1) NOT NULL COMMENT '0=>Pending, 1=>Completed, 2=>cancel, 3=>expired',
  `client_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`candidate_id`),
  KEY `FK_tbl_candidate` (`interview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_candidate` */

/*Table structure for table `tbl_candidate_answer` */

DROP TABLE IF EXISTS `tbl_candidate_answer`;

CREATE TABLE `tbl_candidate_answer` (
  `candidate_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_id` varchar(10) DEFAULT NULL,
  `answer_text` text,
  `candidate_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`candidate_answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_candidate_answer` */

/*Table structure for table `tbl_department` */

DROP TABLE IF EXISTS `tbl_department`;

CREATE TABLE `tbl_department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_department` */

insert  into `tbl_department`(`dept_id`,`dept_name`,`client_id`,`created_by_user_id`,`created_date`) values (1,'HR',NULL,NULL,'2014-09-12 16:47:25'),(2,'Engineering',NULL,NULL,'2014-09-12 16:47:25'),(3,'Finance',NULL,NULL,'2014-09-12 16:47:25'),(4,'System',NULL,NULL,'2014-09-12 16:47:25'),(5,'Marketing',1,1,'2014-09-18 11:43:34'),(9,'Admin',1,1,'2014-09-18 11:46:17');

/*Table structure for table `tbl_designation` */

DROP TABLE IF EXISTS `tbl_designation`;

CREATE TABLE `tbl_designation` (
  `desig_id` int(11) NOT NULL AUTO_INCREMENT,
  `desig_name` varchar(100) NOT NULL,
  `dept_id` int(11) DEFAULT NULL COMMENT 'dept_id from tbl_department ',
  `client_id` int(11) DEFAULT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`desig_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_designation` */

insert  into `tbl_designation`(`desig_id`,`desig_name`,`dept_id`,`client_id`,`created_by_user_id`,`created_date`) values (1,'Manager',3,NULL,NULL,'2014-09-12 16:47:25'),(2,'Team Leader',5,NULL,NULL,'2014-09-12 16:47:25'),(3,'Developer',2,NULL,NULL,'2014-09-12 16:47:25'),(4,'Designer',2,NULL,NULL,'2014-09-12 16:47:25'),(5,'Supervisor',9,NULL,NULL,'2014-09-12 16:47:25'),(6,'Trainee',2,NULL,NULL,'2014-09-12 16:47:25'),(10,'Manager',2,3,41,'2014-09-19 16:56:27'),(11,'Manager',1,3,41,'2014-09-19 16:56:41'),(12,'Delivery Head',2,3,41,'2014-09-19 16:58:26');

/*Table structure for table `tbl_interview` */

DROP TABLE IF EXISTS `tbl_interview`;

CREATE TABLE `tbl_interview` (
  `int_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `interview_duration` int(5) DEFAULT NULL,
  `position_aplied_for` int(11) DEFAULT NULL COMMENT 'cat_d = Dipartment + Degination/Role + Techonlogies',
  `exprience` int(11) DEFAULT NULL COMMENT 'exprince in months ',
  `recuritor_id` int(11) DEFAULT NULL COMMENT 'user_id ',
  `number_of_question` int(3) DEFAULT NULL,
  `status` int(2) DEFAULT '0' COMMENT '0= inactive , 1 = active, 3 = Cancled',
  `s_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`int_id`),
  KEY `FK_tbl_interview` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_interview` */

/*Table structure for table `tbl_interview_question_relation` */

DROP TABLE IF EXISTS `tbl_interview_question_relation`;

CREATE TABLE `tbl_interview_question_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `int_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_interview_question_relation` (`int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_interview_question_relation` */

/*Table structure for table `tbl_interview_questions` */

DROP TABLE IF EXISTS `tbl_interview_questions`;

CREATE TABLE `tbl_interview_questions` (
  `int_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `option_ids` varchar(255) DEFAULT NULL,
  `is_true` int(3) DEFAULT NULL,
  `int_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`int_question_id`),
  KEY `FK_tbl_interview_questions` (`int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_interview_questions` */

/*Table structure for table `tbl_interview_results` */

DROP TABLE IF EXISTS `tbl_interview_results`;

CREATE TABLE `tbl_interview_results` (
  `int_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `int_id` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `comments` tinytext,
  `exprience` int(2) DEFAULT NULL COMMENT 'number of months.',
  `identity_type` int(3) DEFAULT NULL COMMENT '1= PANCARD, 2 =DRIVING LISCENSE, 3 = VOTER ID CARD, 4 = ADHAR CARD, 5 = PASSPORT.',
  `identity_number` varchar(255) DEFAULT NULL,
  `is_completed` int(1) DEFAULT NULL,
  `search_tags` text,
  PRIMARY KEY (`int_result_id`),
  KEY `FK_tbl_interview_report` (`int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_interview_results` */

/*Table structure for table `tbl_interview_set` */

DROP TABLE IF EXISTS `tbl_interview_set`;

CREATE TABLE `tbl_interview_set` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(255) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `recuritor_id` int(11) DEFAULT NULL,
  `number_of_question` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '0= Not Approved 1= Approved.',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_interview_set` */

/*Table structure for table `tbl_interview_set_question_relation` */

DROP TABLE IF EXISTS `tbl_interview_set_question_relation`;

CREATE TABLE `tbl_interview_set_question_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_interview_set_question_relation` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_interview_set_question_relation` */

/*Table structure for table `tbl_login_history` */

DROP TABLE IF EXISTS `tbl_login_history`;

CREATE TABLE `tbl_login_history` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `uid` int(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL COMMENT '0=>Success, 1=>fail',
  PRIMARY KEY (`id`),
  KEY `FK_tbl_login_history` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_login_history` */

/*Table structure for table `tbl_option` */

DROP TABLE IF EXISTS `tbl_option`;

CREATE TABLE `tbl_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_title` varchar(255) DEFAULT NULL,
  `is_true` int(2) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `FK_tbl_option` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_option` */

/*Table structure for table `tbl_question` */

DROP TABLE IF EXISTS `tbl_question`;

CREATE TABLE `tbl_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_name` text NOT NULL,
  `question_level` tinyint(1) NOT NULL COMMENT '0=>Beginers, 1=>Intermediate, 2=>Expert ',
  `question_type` tinyint(1) NOT NULL COMMENT '0=>Radio, 1=>checkbox, 2=>freetext',
  `topic_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`question_id`),
  KEY `FK_tbl_question` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_question` */

/*Table structure for table `tbl_question_answer` */

DROP TABLE IF EXISTS `tbl_question_answer`;

CREATE TABLE `tbl_question_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_name` varchar(255) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_correct` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_question_answer` */

/*Table structure for table `tbl_skill` */

DROP TABLE IF EXISTS `tbl_skill`;

CREATE TABLE `tbl_skill` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_skill` */

insert  into `tbl_skill`(`skill_id`,`skill_name`,`client_id`,`created_by_user_id`,`created_date`) values (1,'PHP',NULL,NULL,'0000-00-00 00:00:00'),(2,'Dot NET',NULL,NULL,'0000-00-00 00:00:00'),(3,'Java',NULL,0,'0000-00-00 00:00:00'),(4,'MySql',NULL,NULL,'0000-00-00 00:00:00'),(5,'Oracle',NULL,NULL,'2014-09-14 19:07:25'),(6,'ROR',1,1,'2014-09-17 17:51:12');

/*Table structure for table `tbl_topic` */

DROP TABLE IF EXISTS `tbl_topic`;

CREATE TABLE `tbl_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_topic` */

insert  into `tbl_topic`(`topic_id`,`topic_name`,`client_id`,`created_by_user_id`,`created_date`) values (34,'Drupal',1,1,'2014-09-16 19:02:28'),(35,'Zend2',1,1,'2014-09-16 19:06:53'),(36,'JSP',1,1,'2014-09-16 19:07:08');

/*Table structure for table `tbl_topic_skill` */

DROP TABLE IF EXISTS `tbl_topic_skill`;

CREATE TABLE `tbl_topic_skill` (
  `topic_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_topic_skill` */

insert  into `tbl_topic_skill`(`topic_rel_id`,`topic_id`,`skill_id`) values (1,10,1),(2,10,2),(3,6,1),(4,7,1),(5,7,2),(6,7,3),(7,7,4),(71,13,1),(72,13,2),(73,13,3),(76,5,1),(77,5,3),(78,5,4),(80,17,1),(81,17,2),(82,18,1),(87,19,1),(88,19,3),(89,19,4),(92,22,1),(93,22,2),(94,22,3),(95,23,1),(96,23,2),(97,23,3),(100,21,1),(101,21,4),(102,24,1),(103,24,2),(104,24,3),(110,26,1),(111,27,1),(112,28,2),(113,29,2),(118,30,2),(126,25,1),(127,25,2),(128,25,3),(129,20,1),(131,32,1),(135,33,1),(142,35,1),(143,35,4),(145,36,3),(146,36,5),(150,34,1),(151,34,4);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `log_last_attmp` datetime DEFAULT NULL,
  `log_failed_count` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=>In-active, 1=>active, 2=>soft deleted',
  `token` varchar(255) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL COMMENT 'if ''0'' it means for organisation else users under respective company',
  PRIMARY KEY (`user_id`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`user_id`,`fname`,`lname`,`email`,`password`,`designation`,`organisation`,`phone`,`log_last_attmp`,`log_failed_count`,`status`,`token`,`client_id`) values (1,'aloksingh','','aloknarwaria3@gmail.com','cd81f508ca76714d142be3d19e2fdab4','alok',NULL,'878777897','2014-09-10 17:47:09',0,1,NULL,NULL),(2,'Ashok','','ashok.pal@stigasoft.com','e10adc3949ba59abbe56e057f20f883e','123',NULL,'9811098110','2014-09-19 18:15:57',0,1,NULL,NULL),(3,'Sanjay','Shah','info@stigasoft.com','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,'2014-09-17 15:34:52',NULL,1,NULL,NULL),(40,'alok1','narwaria1','aloknarwarddddfia@gmail.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,'2014-09-18 18:34:52',0,1,'NDB8MTQxMDc2NDA5Ng==',NULL),(41,'Sanjay','','sanjay.shah@stigasoft.com','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,'2014-09-19 19:16:13',0,1,NULL,3),(42,'cool company','','aloknarwardia@gmail.com','bad220c335d0c1f53548f6acdb17e265',NULL,NULL,NULL,NULL,0,1,'NDJ8MTQxMDQwOTY2OQ==',NULL),(43,'ashok','','palashok23@yahoo.com','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,'2014-09-18 17:42:00',0,1,NULL,NULL),(62,'alok','narwaria','aloknardwaria@gmail.com','cd81f508ca76714d142be3d19e2fdab4','','','',NULL,NULL,0,'NjJ8MTQxMDg0MjY2MA==',NULL),(64,'alok','narwaria','aalok@gmail.com','cd81f508ca76714d142be3d19e2fdab4','','','',NULL,NULL,0,'NjR8MTQxMDg0Mzc5Nw==',NULL),(65,'alok narwaria','narwaria','sfdaria@gmail.com','cd81f508ca76714d142be3d19e2fdab4','d','d','d',NULL,NULL,0,'NjV8MTQxMDg0Mzg5Mw==',NULL),(66,'alok','Narwaria','abcd@gmail.com','cd81f508ca76714d142be3d19e2fdab4','','','','2014-09-16 12:38:05',0,2,NULL,40),(67,'Alok','Narwaria','aaaa@gmail.com','cd81f508ca76714d142be3d19e2fdab4','','','','2014-09-16 17:35:08',0,0,NULL,40),(68,'alok','narwaria','alosdfaria@gmail.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,0,NULL,40),(69,'Rahul','Ray','raj@testing.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,1,'Njl8MTQxMDkzMjY0NQ==',40),(70,'vipul','ray','vi@testing.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,2,NULL,40),(71,'raj','raj','ramraj@gmail.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,1,'NzF8MTQxMTAzMzExOQ==',40),(72,'David','Samul','palashok@gmail.com','25d55ad283aa400af464c76d713c07ad','','','',NULL,NULL,0,'NzJ8MTQxMTA0MTE4Mg==',NULL),(73,'Ashok','pal','palashok1@gmail.com','25d55ad283aa400af464c76d713c07ad',NULL,NULL,NULL,'2014-09-18 17:41:37',0,1,'NzN8MTQxMTA0MjI0Mw==',43),(74,'alok','alok','abcd@gmail.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,1,'NzR8MTQxMTA0NTU2OA==',40),(75,'alok','narwaria','sfsffsdsfd@gmail.com','25d55ad283aa400af464c76d713c07ad','Sr. Software Engineer','Stigasoft','9899396488',NULL,NULL,0,'NzV8MTQxMTA0NjA1NQ==',NULL),(76,'938573','qq','palashok1@yahoo.com','25d55ad283aa400af464c76d713c07ad','','','3874657346',NULL,NULL,0,'NzZ8MTQxMTA0NjI3Mg==',NULL),(78,'ashok','pal','palashok@yahoo.com','25d55ad283aa400af464c76d713c07ad','','','',NULL,NULL,0,'Nzh8MTQxMTA0ODU0Ng==',NULL),(79,'ashok','pal','test@demo.com','25d55ad283aa400af464c76d713c07ad',NULL,NULL,NULL,'2014-09-18 20:33:44',0,1,'Nzl8MTQxMTA1MTI2Ng==',2),(80,'kumar','test','test1@demo.com','25d55ad283aa400af464c76d713c07ad',NULL,NULL,NULL,NULL,NULL,1,'ODB8MTQxMTA1MjIyNg==',2),(81,'sanjay','singh','test2@demo.com','25d55ad283aa400af464c76d713c07ad',NULL,NULL,NULL,NULL,NULL,1,'ODF8MTQxMTA1MjMwOQ==',2),(82,'alok','narwaria','23@gmail.com','cd81f508ca76714d142be3d19e2fdab4','Sr. Software Engineer','Stigasoft','9899396488','2014-09-19 12:54:58',1,1,NULL,NULL),(83,'alok','narwaria','aloknarwaria@gmail.com','cd81f508ca76714d142be3d19e2fdab4','Sr. Software Engineer','Stigasoft','9899396488','2014-09-19 19:02:21',0,1,'ODN8MTQxMTEyNTUzOQ==',NULL),(84,'alok','narwaria','alok1@test.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,2,NULL,83),(85,'alok','narwaria','sdfia@gmail.com','25f9e794323b453885f5181f1b624d0b','Sr. Software Engineer','Stigasoft','878777897',NULL,NULL,0,'ODV8MTQxMTExNzc4Nw==',NULL),(86,'alok','narwaria','sdfsdfsf@testing.com','25f9e794323b453885f5181f1b624d0b','Sr. Software Engineer','Stigasoft','9899396488',NULL,NULL,0,'ODZ8MTQxMTExNzg0MQ==',NULL),(87,'alok','narwaria','sfdsfria@gmail.com','25f9e794323b453885f5181f1b624d0b','Sr. Software Engineer','Stigasoft','9899396488',NULL,NULL,0,'ODd8MTQxMTExNzkzMg==',NULL),(88,'alok','narwaria','dddd@gmail.com','25f9e794323b453885f5181f1b624d0b','Sr. Software Engineer','Stigasoft','9899396488',NULL,NULL,1,NULL,NULL),(89,'alok','narwaria','swaria@gmail.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,2,NULL,83),(90,'alok','narwaria','sfdaria@gmail.com','cd81f508ca76714d142be3d19e2fdab4',NULL,NULL,NULL,NULL,NULL,2,NULL,83);

/*Table structure for table `tbl_user_permission` */

DROP TABLE IF EXISTS `tbl_user_permission`;

CREATE TABLE `tbl_user_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `permission_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user_permission` */

insert  into `tbl_user_permission`(`id`,`user_id`,`permission_id`) values (1,59,1),(2,59,2),(3,59,3),(4,59,4),(5,59,5),(6,59,6),(7,60,1),(8,60,3),(9,60,5),(10,61,2),(11,61,3),(12,61,5),(13,62,1),(14,62,3),(15,63,1),(16,63,3),(17,64,1),(18,64,3),(19,64,5),(20,65,1),(21,65,5),(33,41,1),(34,41,2),(35,41,3),(36,41,4),(37,41,5),(38,41,6),(140,68,2),(141,68,4),(142,68,6),(143,70,3),(144,70,5),(145,71,2),(146,71,4),(147,71,6),(157,67,2),(158,67,4),(159,67,6),(160,69,1),(161,69,3),(162,69,5),(166,66,1),(167,66,3),(168,66,5),(171,73,3),(172,73,5),(173,74,1),(180,79,1),(181,79,2),(182,79,3),(183,79,4),(184,79,5),(185,79,6),(186,80,3),(187,80,6),(188,81,1),(189,81,3),(190,81,4),(191,81,5),(192,81,6),(193,84,1),(194,89,1),(195,89,3),(196,90,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

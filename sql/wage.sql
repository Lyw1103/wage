/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.26 : Database - wage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `wage`;

/*Table structure for table `sysa` */

DROP TABLE IF EXISTS `sysa`;

CREATE TABLE `sysa` (
  `userid` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `userpassword` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `salt` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '盐值',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sysa` */

insert  into `sysa`(`userid`,`username`,`userpassword`,`salt`) values 
(1,'cs','355d1a2cfeabf4efd47cdbf7f202cfc1','24854236');

/*Table structure for table `sysc` */

DROP TABLE IF EXISTS `sysc`;

CREATE TABLE `sysc` (
  `workerid` int NOT NULL AUTO_INCREMENT COMMENT '工人信息id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `workernumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工号',
  `sex` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `age` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '出生年月',
  `card` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `nation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '民族',
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家庭地址',
  `degree` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学历',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `emergencycontacts` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '紧急联系人',
  `emergencycontactsphone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '紧急联系人电话',
  `post` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位',
  `department` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门',
  `onboardingdate` datetime DEFAULT NULL COMMENT '入职日期',
  `isincumbency` tinyint DEFAULT NULL COMMENT '是否在职',
  `status` tinyint DEFAULT NULL COMMENT '状态',
  `basesalaryid` int DEFAULT NULL COMMENT '基本工资id',
  `salaryitemid` int DEFAULT NULL COMMENT '工资项id',
  `issuestate` tinyint DEFAULT NULL COMMENT '发放状态',
  PRIMARY KEY (`workerid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sysc` */

insert  into `sysc`(`workerid`,`name`,`workernumber`,`sex`,`age`,`birthday`,`card`,`nation`,`address`,`degree`,`phone`,`emergencycontacts`,`emergencycontactsphone`,`post`,`department`,`onboardingdate`,`isincumbency`,`status`,`basesalaryid`,`salaryitemid`,`issuestate`) values 
(1,'禹志云','202112203090','男','27','1994-05-07','320206199405078311','汉族','广东省安顺市南岔区安远路195号','小学','13000788888','王伯涛','13000789975','经理','开发部','2021-12-20 15:54:07',1,0,1,1,0),
(2,'胡明时','202112201564','男','38','1983-10-19','230231198310192912','汉族','广东省安顺市南岔区安远路193号','小学','13000789987','苏辉辉','13000789986 ','副经理','开发部','2021-12-20 16:27:46',0,0,2,1,0),
(3,'陈士杰','202112203310','男','37','1984-09-12','140123198409122191','汉族','广东省安顺市南岔区安远路197号','小学','13000789977','赵明峰','13000789975','普通员工','开发部','2021-12-20 16:39:01',1,1,6,1,0),
(4,'袁文江','202112207307','男','32','1989-06-24','37108219890624717X','汉族','广东省安顺市南岔区安远路199号','小学','13000789987','吴健华','13000787987','普通员工','开发部','2021-12-20 16:42:26',0,0,6,1,0),
(5,'庞春法 ','202112211605','男','27','1994-04-08','15062119940408801X','汉族','广东省安顺市南岔区安远路200号','大专','13000789988','苏深鸿','13000789980','普通员工','开发部','2021-12-21 10:26:16',0,0,6,1,1),
(6,'王爱云','202112211715','女','28','1993-06-13','21050519930613292X','汉族','广东省安顺市南岔区安远路201号','大专','13000789987','翟婧妍','13000789982','普通员工','开发部','2021-12-21 11:26:16',0,0,6,1,0),
(15,'测试','202112231083','男','31','1990-08-03','211381199008036151','汉族','广东省安顺市南岔区安远路193号','小学','13000789982','王佳麟','13000789981','副经理','设计部','2021-12-23 21:29:06',1,1,1,1,1),
(16,'王佳麟 ','202201071562','男','30','1991-09-20','140223199109208030','壮族','广东省安顺市南岔区安远路199号','高中','13000789988','远波','13000789977','副经理','设计部','2022-01-07 11:00:04',0,0,1,1,1);

/*Table structure for table `sysd` */

DROP TABLE IF EXISTS `sysd`;

CREATE TABLE `sysd` (
  `salaryitemid` int NOT NULL AUTO_INCREMENT COMMENT '工资项id',
  `latearrivalpenalty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '迟到罚金',
  `earlyrefundpenalty` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '早退罚金',
  `travelallowance` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出差补贴',
  `attendanceaward` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全勤奖',
  `foodandbeveragesubsidies` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '餐饮补贴',
  `transportationsubsidies` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交通补贴',
  `overtimworkrates` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平时加班工价',
  `weekendovertimerates` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '周末加班工价',
  PRIMARY KEY (`salaryitemid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sysd` */

insert  into `sysd`(`salaryitemid`,`latearrivalpenalty`,`earlyrefundpenalty`,`travelallowance`,`attendanceaward`,`foodandbeveragesubsidies`,`transportationsubsidies`,`overtimworkrates`,`weekendovertimerates`) values 
(1,'-300','-100','200','200','300','300','50','100');

/*Table structure for table `syse` */

DROP TABLE IF EXISTS `syse`;

CREATE TABLE `syse` (
  `attendanceid` int NOT NULL AUTO_INCREMENT COMMENT '考勤id',
  `workerid` int DEFAULT NULL COMMENT '员工id',
  `sickleave` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '病假',
  `thingsfake` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '事假',
  `usuallyovertime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平时加班',
  `weekly` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '周未加班',
  `overtimeonholidays` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节假日加班',
  `latearrivals` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '迟到次数',
  `earlyarrivals` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '早退次数',
  `absences` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缺勤天数',
  `travelallowanceday` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出差天数',
  `attendancetime` datetime DEFAULT NULL COMMENT '考勤时间',
  `state` tinyint DEFAULT NULL COMMENT '状态(0是待审核状态，1是审核通过，2是审核不通过)',
  PRIMARY KEY (`attendanceid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `syse` */

insert  into `syse`(`attendanceid`,`workerid`,`sickleave`,`thingsfake`,`usuallyovertime`,`weekly`,`overtimeonholidays`,`latearrivals`,`earlyarrivals`,`absences`,`travelallowanceday`,`attendancetime`,`state`) values 
(1,5,'0','0','2','2','2','2','2','0','2','2021-12-22 09:59:42',1),
(2,15,'0','0','2','5','0','1','1','1','1','2021-12-23 21:30:29',1),
(3,1,'2','2','2','2','2','2','2','2','2','2021-12-26 08:25:44',0),
(4,16,'1','1','1','1','1','1','1','1','1','2022-01-07 14:56:56',1);

/*Table structure for table `sysf` */

DROP TABLE IF EXISTS `sysf`;

CREATE TABLE `sysf` (
  `basesalaryid` int NOT NULL AUTO_INCREMENT COMMENT '基本工资id',
  `basesalary` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '基本工资',
  PRIMARY KEY (`basesalaryid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sysf` */

insert  into `sysf`(`basesalaryid`,`basesalary`) values 
(1,'16000'),
(2,'12000'),
(3,'8000'),
(4,'7000'),
(5,'5000'),
(6,'4000'),
(7,'6000'),
(8,'20000'),
(9,'40000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

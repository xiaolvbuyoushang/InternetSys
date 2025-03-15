/*
SQLyog v10.2 
MySQL - 5.5.15 : Database - internetsys
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE
DATABASE /*!32312 IF NOT EXISTS*/`internetsys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE
`internetsys`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin`
(
    `amdinID`   varchar(20) NOT NULL,
    `adminName` varchar(20) DEFAULT NULL,
    `adminPass` varchar(20) NOT NULL,
    PRIMARY KEY (`amdinID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert into `admin`(`amdinID`, `adminName`, `adminPass`)
values ('admin', 'admin', '123456');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company`
(
    `companyid`   int(10) NOT NULL AUTO_INCREMENT,
    `companyname` varchar(20) NOT NULL,
    `address`     varchar(50) NOT NULL,
    `typeid`      int(10) NOT NULL,
    `monitorname` varchar(20) DEFAULT NULL,
    `cellphone`   varchar(13) DEFAULT NULL,
    PRIMARY KEY (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert into `company`(`companyid`, `companyname`, `address`, `typeid`, `monitorname`, `cellphone`)
values (1, '市级政府', 'street1', 1, 'Tony', '11111112'),
       (2, '区网安局', '南邻区', 2, '赵三', '55566633322'),
       (5, '纵横家', 'street11', 3, 'TIMI', '1123653269'),
       (7, 'ceo@iqianyue.com', 'street12', 4, 'Watter', '1123653288'),
       (8, '市政府', 'street13', 1, 'Mary', '5623653269'),
       (9, '区监察局', 'street11', 2, '小王', '1123653289'),
       (11, '毒霸安全公司', 'street12', 3, '小宝', '1123653269');

/*Table structure for table `companytype` */

DROP TABLE IF EXISTS `companytype`;

CREATE TABLE `companytype`
(
    `typeid` int(2) NOT NULL AUTO_INCREMENT,
    `type`   varchar(50) NOT NULL,
    PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `companytype` */

insert into `companytype`(`typeid`, `type`)
values (1, '市级单位'),
       (2, '市级各辖区单位'),
       (3, '受监管企业单位'),
       (4, '安全服务单位');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback`
(
    `id`      int(10) NOT NULL AUTO_INCREMENT,
    `taskid`  int(10) NOT NULL,
    `content` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert into `feedback`(`id`, `taskid`, `content`)
values (1, 1, '已对违规操作进行处罚'),
       (2, 1, '已恢复网络，并定位攻击者位置'),
       (4, 1, '已清除恶意软件，并处罚了制作该软件的人。'),
       (5, 4, '已及时抢修。'),
       (6, 4, '已及时抢修。'),
       (7, 7, '33333'),
       (8, 7, '33333');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log`
(
    `logid`     int(10) NOT NULL AUTO_INCREMENT,
    `userid`    int(10) NOT NULL,
    `logindate` date NOT NULL,
    PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert into `log`(`logid`, `userid`, `logindate`)
values (1, 1, '2019-12-10'),
       (2, 1, '2019-12-10'),
       (3, 1, '2019-12-10'),
       (4, 1, '2019-12-10'),
       (5, 1, '2019-12-10'),
       (6, 1, '2019-12-10'),
       (7, 1, '2019-12-10'),
       (8, 1, '2019-12-10'),
       (9, 1, '2019-12-10'),
       (10, 1, '2019-12-10'),
       (11, 1, '2019-12-10'),
       (12, 1, '2019-12-10'),
       (13, 3, '2019-12-10'),
       (14, 3, '2019-12-10'),
       (15, 3, '2019-12-10'),
       (16, 1, '2019-12-10'),
       (17, 1, '2019-12-10'),
       (18, 1, '2019-12-10'),
       (19, 2, '2019-12-10'),
       (20, 2, '2019-12-10'),
       (21, 2, '2019-12-10'),
       (22, 2, '2019-12-10'),
       (23, 2, '2019-12-10'),
       (24, 2, '2019-12-10'),
       (25, 1, '2019-12-11'),
       (26, 1, '2019-12-11'),
       (27, 2, '2019-12-11'),
       (28, 1, '2019-12-11'),
       (29, 1, '2019-12-11'),
       (30, 1, '2019-12-11'),
       (31, 1, '2019-12-11'),
       (32, 1, '2019-12-11'),
       (33, 1, '2019-12-11'),
       (34, 2, '2019-12-11'),
       (35, 2, '2019-12-11'),
       (36, 1, '2019-12-11'),
       (37, 4, '2019-12-11'),
       (38, 2, '2019-12-11'),
       (39, 1, '2019-12-11'),
       (40, 1, '2019-12-11'),
       (41, 1, '2019-12-11'),
       (42, 1, '2019-12-11'),
       (43, 1, '2019-12-11'),
       (44, 1, '2019-12-11'),
       (45, 1, '2019-12-11'),
       (46, 1, '2019-12-11'),
       (47, 1, '2019-12-11'),
       (48, 1, '2019-12-11'),
       (49, 1, '2019-12-11'),
       (50, 1, '2019-12-11'),
       (51, 2, '2019-12-11'),
       (52, 1, '2019-12-11'),
       (53, 1, '2019-12-11'),
       (54, 1, '2019-12-11'),
       (55, 1, '2019-12-11'),
       (56, 2, '2019-12-11'),
       (57, 2, '2019-12-11'),
       (58, 2, '2019-12-11'),
       (59, 2, '2019-12-11'),
       (60, 2, '2019-12-11'),
       (61, 2, '2019-12-11'),
       (62, 2, '2019-12-11'),
       (63, 2, '2019-12-11'),
       (64, 4, '2019-12-11'),
       (65, 1, '2019-12-11'),
       (66, 1, '2019-12-11'),
       (67, 1, '2019-12-11'),
       (68, 2, '2019-12-11'),
       (69, 4, '2019-12-11'),
       (70, 1, '2019-12-11'),
       (71, 1, '2019-12-11'),
       (72, 1, '2019-12-15'),
       (73, 2, '2019-12-18'),
       (74, 2, '2019-12-24'),
       (75, 1, '2019-12-24'),
       (76, 2, '2019-12-24'),
       (77, 1, '2019-12-24'),
       (78, 1, '2020-01-06'),
       (79, 1, '2020-01-31'),
       (80, 1, '2020-01-31');

/*Table structure for table `taskone` */

DROP TABLE IF EXISTS `taskone`;

CREATE TABLE `taskone`
(
    `taskid`     int(10) NOT NULL AUTO_INCREMENT,
    `tasktype`   varchar(20)  NOT NULL,
    `assigndate` date         NOT NULL,
    `status`     int(1) NOT NULL,
    `content`    varchar(100) NOT NULL,
    `companyid`  int(10) NOT NULL,
    `level`      int(2) NOT NULL,
    PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `taskone` */

insert into `taskone`(`taskid`, `tasktype`, `assigndate`, `status`, `content`, `companyid`, `level`)
values (1, '违规处理', '2019-12-09', 1, '违规使用网络工具处理', 2, 2),
       (2, '网络攻击', '2019-12-10', 1, '政府内网遭受不明攻击，需尽快处理', 2, 2),
       (3, '恶意软件', '2019-12-11', 1, '网络上有危险性极大的恶意软件需要清理', 9, 1),
       (4, '信息泄露', '2019-12-11', 1, '某公司发生了大量数据泄漏事件', 11, 3),
       (5, '安全威胁/漏洞', '2019-12-11', 0, '发现网络安全威胁信息', 2, 1),
       (6, '违处信息', '2019-12-11', 0, '违规使用VPN', 2, 1),
       (7, '恶意软件', '2019-12-24', 1, '清楚\r\n\r\n', 2, 1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`
(
    `userid`    int(10) NOT NULL AUTO_INCREMENT,
    `username`  varchar(20) NOT NULL,
    `phone`     varchar(11) DEFAULT NULL,
    `email`     varchar(30) DEFAULT NULL,
    `wechat`    varchar(30) DEFAULT NULL,
    `companyid` int(10) NOT NULL,
    `status`    int(11) NOT NULL,
    `operation` varchar(20) DEFAULT NULL,
    `level`     int(2) NOT NULL,
    `userpass`  varchar(20) NOT NULL,
    PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert into `user`(`userid`, `username`, `phone`, `email`, `wechat`, `companyid`, `status`, `operation`, `level`,
                   `userpass`)
values (1, '张三', '1112225563', NULL, NULL, 1, 1, NULL, 1, '1234567'),
       (2, '赵三', '11122233311', NULL, NULL, 2, 1, NULL, 2, '123456'),
       (3, '小刘', '13961023668', NULL, NULL, 5, 1, NULL, 3, '1234567'),
       (4, '皇城PK', '13961023668', NULL, NULL, 7, 1, NULL, 4, '111');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

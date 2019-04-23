/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.11-log : Database - his
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`his` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `his`;

/*Table structure for table `addupload2` */

DROP TABLE IF EXISTS `addupload2`;

CREATE TABLE `addupload2` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(55) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `size` varchar(55) COLLATE utf8_bin DEFAULT NULL COMMENT '文件大小',
  `todate` date DEFAULT NULL COMMENT '上传时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `addupload2` */

insert  into `addupload2`(`id`,`name`,`size`,`todate`,`user_id`) values (4,'del.gif','125','2018-12-20',11),(5,'姓名查询','452','2018-12-07',11),(6,'的v发','452','2018-12-14',11);

/*Table structure for table `base_dept` */

DROP TABLE IF EXISTS `base_dept`;

CREATE TABLE `base_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_dept` */

insert  into `base_dept`(`dept_id`,`dept_name`) values (1,'内科'),(2,'外科'),(3,'儿科'),(4,'骨科'),(5,'新生儿科'),(6,'妇产科'),(7,'神经内科'),(8,'医务科'),(9,'药房'),(10,'综合科');

/*Table structure for table `base_function` */

DROP TABLE IF EXISTS `base_function`;

CREATE TABLE `base_function` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能ID',
  `fname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '功能名称',
  `mid` int(11) DEFAULT NULL COMMENT '模块ID',
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'url地址',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_function` */

insert  into `base_function`(`fid`,`fname`,`mid`,`url`) values (1,'用户管理',4,'/baseUser/list'),(2,'模块管理',4,'/baseModule/list'),(3,'功能管理',4,'/baseFunction/list'),(7,'角色管理',4,'/baseRole/list'),(20,'药品类别',2,'/medicineType/list'),(21,'药品编号',2,'/medicineCode/list'),(22,'生产厂商',2,'/baseManufacturer/list'),(23,'药品汇总',2,'/medicinePurchaseInfo/list'),(24,'药剂师',2,'/medicineReqPlan/list'),(25,'药房主任',2,'/medicineReqPlan/listBoss'),(27,'考试_公司信息',6,'/companyinfo/list'),(28,'采购主管',2,'/medicinePurchaseInfo/lists'),(29,'仓库管理',2,'/medicinePurchaseInfo/listPI'),(30,'药品入库记录',2,'/medicineInstock/list'),(31,'药品库存',2,'/medicineStockinfo/list'),(32,'部门管理',4,'/baseDept/list'),(33,'套餐管理',3,'/doctorMenu/list'),(34,'办理就诊卡',4,'/basePatientInfo/list'),(35,'挂号',3,'/patientRegisterRecord/list'),(36,'上传',6,'/addupload2/list'),(37,'医生就诊',3,'/doctorVisitRecord/dactorVisitRecord'),(38,'收费',1,'/doctorVisitRecord/list'),(39,'住院病人',6,'/inPatient/list'),(40,'领药',1,'/doctorVisitRecord/lists');

/*Table structure for table `base_manufacturer` */

DROP TABLE IF EXISTS `base_manufacturer`;

CREATE TABLE `base_manufacturer` (
  `man_Code` int(255) NOT NULL AUTO_INCREMENT COMMENT '生产厂商ID',
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `py1` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '拼音\r\n',
  `man_chn_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '生产厂商名称\r\n',
  `man_eng_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '英文名称\r\n',
  `man_abs_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '生产厂商简称\r\n',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址\r\n',
  `fax_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '传真号\r\n',
  `nation_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '国籍代码\r\n',
  `post_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮编编码\r\n',
  `tel_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话\r\n',
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '网址\r\n',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱\r\n',
  `state_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '省/直辖市\r\n',
  `city_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '县/市\r\n',
  PRIMARY KEY (`man_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `base_manufacturer` */

insert  into `base_manufacturer`(`man_Code`,`note`,`py1`,`man_chn_name`,`man_eng_desc`,`man_abs_name`,`address`,`fax_no`,`nation_code`,`post_code`,`tel_no`,`website`,`email`,`state_code`,`city_code`) values (1,'aa',NULL,'周口同和堂药业',NULL,NULL,'周口川汇区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'bb',NULL,'周口开心人大药房',NULL,NULL,'周口市经济开发区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'cc','xianyangsenzhiyao','西安杨森制药',NULL,NULL,'陕西西安市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'nb','xiajieniubiliuliuliu','夏杰牛逼六六六','sexsex',NULL,'周口市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `base_module` */

DROP TABLE IF EXISTS `base_module`;

CREATE TABLE `base_module` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `mname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '模块名称',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_module` */

insert  into `base_module`(`mid`,`mname`) values (1,'收费管理'),(2,'药房管理'),(3,'医生工作站'),(4,'基础信息'),(5,'统计分析'),(6,'考试');

/*Table structure for table `base_patient_info` */

DROP TABLE IF EXISTS `base_patient_info`;

CREATE TABLE `base_patient_info` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '病人姓名',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭住址',
  `phonenum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `personid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_patient_info` */

insert  into `base_patient_info`(`patient_id`,`patient_name`,`birth`,`sex`,`address`,`phonenum`,`personid`) values (1,'李继光','2018-12-21','男','周口市','15585859271','411502201812210046'),(2,'李利利','2018-12-27','女','周口市','15585859311','411502201812271169'),(4,'李静静','2018-12-27','女','周口市','15585855111','411502201812261911'),(5,'夏杰','2018-12-27','男','周口市','15585852222','411502201812272546'),(6,'柴年年','2018-12-27','男','周口市','15585856654','411502201812276582');

/*Table structure for table `base_role` */

DROP TABLE IF EXISTS `base_role`;

CREATE TABLE `base_role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `rname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_role` */

insert  into `base_role`(`rid`,`rname`) values (1,'医生'),(2,'主任医生'),(3,'药房管理员'),(4,'药方主任'),(5,'超级管理员'),(6,'收费员'),(7,'院长'),(8,'医务科科员'),(9,'护士'),(10,'护士长'),(11,'医生副主任'),(12,'副护士长'),(13,'副院长'),(14,'医务科科长'),(15,'药剂师'),(16,'药房主任'),(17,'采购员'),(18,'采购主管'),(20,'仓库管理员');

/*Table structure for table `base_role_function` */

DROP TABLE IF EXISTS `base_role_function`;

CREATE TABLE `base_role_function` (
  `rmid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) DEFAULT NULL COMMENT '角色id',
  `fid` int(11) DEFAULT NULL COMMENT '功能id',
  PRIMARY KEY (`rmid`)
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_role_function` */

insert  into `base_role_function`(`rmid`,`rid`,`fid`) values (1,NULL,2),(2,NULL,3),(3,NULL,1),(4,NULL,2),(5,NULL,2),(6,NULL,3),(9,1,1),(10,1,13),(11,1,14),(12,1,15),(59,2,9),(60,2,10),(61,2,11),(62,2,12),(63,2,13),(64,2,14),(65,2,15),(66,2,16),(67,2,17),(68,2,18),(69,2,19),(70,13,1),(71,13,2),(72,13,3),(73,13,6),(74,13,7),(75,13,8),(76,13,9),(77,13,10),(78,13,11),(79,13,12),(80,13,13),(81,13,14),(82,13,15),(83,13,16),(84,13,17),(85,13,18),(86,13,19),(216,17,23),(350,15,24),(351,15,33),(352,16,25),(353,16,33),(459,7,1),(460,7,2),(461,7,3),(462,7,7),(463,7,20),(464,7,21),(465,7,22),(466,7,23),(467,7,24),(468,7,25),(469,7,27),(470,7,28),(471,7,29),(472,7,30),(473,7,31),(474,7,32),(475,7,33),(476,7,34),(477,7,35),(478,7,36),(479,7,37),(480,7,38),(481,7,39),(482,7,40);

/*Table structure for table `base_user` */

DROP TABLE IF EXISTS `base_user`;

CREATE TABLE `base_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名字',
  `sex` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_user` */

insert  into `base_user`(`user_id`,`user_name`,`password`,`cname`,`sex`,`dept_id`,`post_id`) values (1,'wanjunhui','202CB962AC59075B964B07152D234B70','万俊辉','男',8,2),(2,'xulongxi','202CB962AC59075B964B07152D234B70','许龙曦','男',3,NULL),(3,'admin','202CB962AC59075B964B07152D234B70','管理员','女',1,NULL),(4,'chenqihang','202CB962AC59075B964B07152D234B70','陈起航','男',6,NULL),(5,'xiajie','202CB962AC59075B964B07152D234B70','夏杰','男',7,NULL),(7,'chenjuncheng','202CB962AC59075B964B07152D234B70','陈俊成','男',4,NULL),(8,'wan','202CB962AC59075B964B07152D234B70','万三','男',9,NULL),(9,'zhangjiahao','202CB962AC59075B964B07152D234B70','张家豪','男',4,NULL),(10,'dangliutao','202CB962AC59075B964B07152D234B70','党刘涛','男',5,NULL),(11,'zxs','202CB962AC59075B964B07152D234B70','曾祥顺','男',10,NULL),(12,'xj','202CB962AC59075B964B07152D234B70','夏杰','男',2,NULL),(13,'lll','202CB962AC59075B964B07152D234B70','李利利','女',10,NULL),(14,'ljj','202CB962AC59075B964B07152D234B70','李静静','女',8,NULL);

/*Table structure for table `base_user_role` */

DROP TABLE IF EXISTS `base_user_role`;

CREATE TABLE `base_user_role` (
  `urid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `rid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `base_user_role` */

insert  into `base_user_role`(`urid`,`uid`,`rid`) values (1,3,1),(2,3,2),(3,3,3),(4,3,5),(5,3,6),(6,3,7),(7,3,8),(8,1,3),(9,1,4),(10,1,5),(11,1,6),(12,1,7),(13,1,9),(24,2,2),(25,2,3),(26,2,5),(27,2,9),(28,2,10),(29,4,1),(70,5,15),(71,12,17),(72,13,15),(73,14,16),(74,11,7);

/*Table structure for table `charge_record` */

DROP TABLE IF EXISTS `charge_record`;

CREATE TABLE `charge_record` (
  `charge_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` int(11) NOT NULL COMMENT '病人',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生',
  `amount` double DEFAULT NULL COMMENT '总金额',
  `charge_date` date DEFAULT NULL COMMENT '收费日期',
  `charge_user` int(11) DEFAULT NULL COMMENT '收费人',
  PRIMARY KEY (`charge_id`,`patient_id`),
  UNIQUE KEY `charge_id` (`charge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `charge_record` */

insert  into `charge_record`(`charge_id`,`patient_id`,`doctor_id`,`amount`,`charge_date`,`charge_user`) values (7,5,11,450,'2019-02-08',11);

/*Table structure for table `charge_recordinfo` */

DROP TABLE IF EXISTS `charge_recordinfo`;

CREATE TABLE `charge_recordinfo` (
  `charge_infoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `charge_id` int(11) DEFAULT NULL COMMENT '收费记录',
  `code_id` int(11) DEFAULT NULL COMMENT '药品',
  `unitprc` double DEFAULT NULL COMMENT '单价',
  `amt` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`charge_infoid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `charge_recordinfo` */

insert  into `charge_recordinfo`(`charge_infoid`,`charge_id`,`code_id`,`unitprc`,`amt`) values (13,7,2,15,20),(14,7,5,15,10);

/*Table structure for table `companyinfo` */

DROP TABLE IF EXISTS `companyinfo`;

CREATE TABLE `companyinfo` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `compname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `ownername` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '法人姓名',
  `ownertel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '法人电话',
  `compinfo` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公司简介',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `companyinfo` */

insert  into `companyinfo`(`cid`,`compname`,`ownername`,`ownertel`,`compinfo`) values (1,'阿里','马云','13768686868','电子商务'),(2,'腾讯','马化腾','13669696969','聊天'),(3,'百度','李彦宏','15859595959','搜索');

/*Table structure for table `doctor_menu` */

DROP TABLE IF EXISTS `doctor_menu`;

CREATE TABLE `doctor_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `menu_name` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '套餐名称',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '套餐描述',
  `type` int(11) DEFAULT NULL COMMENT '套餐类型',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `doctor_menu` */

insert  into `doctor_menu`(`menu_id`,`menu_name`,`user_id`,`description`,`type`) values (9,'大保健',11,'继光专用药',1),(21,'妇产科垃圾2',11,'继光专用药',2),(22,'妇产科垃圾1',11,'继光专用药2',3),(23,'套餐1',13,'继光专用药',1),(24,'套餐2',13,'继光专用药',2),(25,'套餐3',13,'继光专用药',3),(26,'套餐4',14,'继光专用药',1),(27,'套餐5',14,'继光专用药',2),(28,'套餐6',14,'继光专用药',3);

/*Table structure for table `doctor_menu_medicine` */

DROP TABLE IF EXISTS `doctor_menu_medicine`;

CREATE TABLE `doctor_menu_medicine` (
  `md_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) DEFAULT NULL COMMENT '套餐',
  `code_id` int(11) DEFAULT NULL COMMENT '药品',
  `amt` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`md_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `doctor_menu_medicine` */

insert  into `doctor_menu_medicine`(`md_id`,`menu_id`,`code_id`,`amt`) values (9,9,2,20),(10,9,1,20),(11,22,1,20),(12,9,4,20);

/*Table structure for table `doctor_visit_record` */

DROP TABLE IF EXISTS `doctor_visit_record`;

CREATE TABLE `doctor_visit_record` (
  `vr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` int(11) DEFAULT NULL COMMENT '病人',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生',
  `visit_date` date DEFAULT NULL COMMENT '就诊时间',
  `symptom` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '症状',
  `advice` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '医生建议',
  `times` int(11) DEFAULT NULL COMMENT '就诊次数',
  `status` int(11) DEFAULT NULL COMMENT '状态(1:已就诊2:已缴费3:已领药)',
  PRIMARY KEY (`vr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `doctor_visit_record` */

insert  into `doctor_visit_record`(`vr_id`,`patient_id`,`doctor_id`,`visit_date`,`symptom`,`advice`,`times`,`status`) values (2,1,11,'2019-01-07','即将死亡','火化',1,1),(3,5,11,'2019-01-25','脑子有水','洗脑',1,2);

/*Table structure for table `doctor_visit_recordinfo` */

DROP TABLE IF EXISTS `doctor_visit_recordinfo`;

CREATE TABLE `doctor_visit_recordinfo` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vr_id` int(11) DEFAULT NULL COMMENT '就诊记录ID',
  `code_id` int(11) DEFAULT NULL COMMENT '药品',
  `amt` int(11) DEFAULT NULL COMMENT '药品数量',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `doctor_visit_recordinfo` */

insert  into `doctor_visit_recordinfo`(`info_id`,`vr_id`,`code_id`,`amt`) values (2,2,2,20),(3,2,4,20),(4,3,2,20),(5,3,5,10);

/*Table structure for table `in_patient` */

DROP TABLE IF EXISTS `in_patient`;

CREATE TABLE `in_patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_name` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '病人姓名',
  `sex` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `bed_num` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '床号',
  `amount` double DEFAULT NULL COMMENT '消费金额',
  `status` int(11) DEFAULT NULL COMMENT '1:在院2:出院',
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `in_patient` */

insert  into `in_patient`(`patient_id`,`patient_name`,`sex`,`birth`,`bed_num`,`amount`,`status`) values (1,'宋江','男','2018-10-01','儿科1床',36.8,2),(2,'卢俊义','男','2018-09-02','儿科5床',123.9,1),(3,'吴用','女','2018-11-03','儿科8床',48.1,2),(4,'公孙胜','女','2018-08-01','儿科12床',29.4,1),(5,'关胜','女','2018-07-01','儿科3床',18.3,2),(6,'林冲','男','2018-06-01','儿科16床',310.2,2),(7,'秦明','女','2018-05-01','儿科21床',280.5,2),(8,'呼延灼','男','2018-04-01','儿科24床',176.3,2),(9,'花荣','女','2018-03-01','儿科13床',90.1,2),(10,'柴进','男','2018-02-01','儿科2床',65.1,2),(11,'李应','男','2018-01-01','儿科6床',420.5,1),(12,'朱仝','男','2017-10-01','儿科19床',367,2),(13,'鲁智深','女','2017-09-01','儿科31床',250.1,2),(14,'武松','女','2018-10-19','儿科28床',210.9,1),(15,'董平','女','2018-07-08','儿科18床',248.3,1),(16,'张清','女','2018-06-10','儿科11床',27.9,1),(17,'杨志','男','2018-05-11','儿科4床',13.8,2),(18,'徐宁','女','2018-04-12','儿科33床',124.5,2),(19,'索超','男','2018-09-20','儿科38床',230.8,2),(20,'戴宗','女','2018-07-23','儿科45床',345.6,1);

/*Table structure for table `medicine_code` */

DROP TABLE IF EXISTS `medicine_code`;

CREATE TABLE `medicine_code` (
  `code_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '药品ID\r\n',
  `MEDICINE_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '药品名\r\n',
  `alias_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '别名名称\r\n',
  `specification` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '规格\r\n',
  `man_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '生产厂商ID\r\n',
  `man_chn_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '生产厂商名称\r\n',
  `type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '药品分类名称(W 西药 C 中成药 G 中草药)\r\n',
  `type_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '药品分类代码\r\n',
  `stock_unit` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '库存单位\r\n',
  `retail_price` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '零售价\r\n',
  `stock_price` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '库存平均价 (加权平均成本)\r\n',
  `drug_notes_patient` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用药注意事项\r\n',
  `drug_note` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '药袋说明\r\n',
  `drug_form` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '药品外形说明\r\n',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `medicine_code` */

insert  into `medicine_code`(`code_id`,`MEDICINE_NAME`,`alias_name`,`specification`,`man_code`,`man_chn_name`,`type_name`,`type_code`,`stock_unit`,`retail_price`,`stock_price`,`drug_notes_patient`,`drug_note`,`drug_form`) values (1,'恩替卡韦分散片',NULL,'0.5mg*7片','3','西安杨森制药','W','1','盒',NULL,NULL,NULL,NULL,NULL),(2,'叶酸片',NULL,'0.4mg*31片*3板','1','周口同和堂药业','G','3','盒',NULL,NULL,NULL,NULL,NULL),(4,'止咳糖浆',NULL,'22*1','1','周口同和堂药业','W','1','盒',NULL,NULL,NULL,NULL,NULL),(5,'阿莫西林',NULL,'22*1','4','夏杰牛逼六六六','C','2','盒',NULL,NULL,NULL,NULL,NULL),(6,'云南白药','创可贴','22*1','3','西安杨森制药','C','2','盒','20',NULL,NULL,NULL,NULL);

/*Table structure for table `medicine_instock` */

DROP TABLE IF EXISTS `medicine_instock`;

CREATE TABLE `medicine_instock` (
  `instock_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `medicine_codeid` int(11) DEFAULT NULL COMMENT '药品',
  `inamt` int(11) DEFAULT NULL COMMENT '入库数量',
  `unitprc` double DEFAULT NULL COMMENT '入库单价',
  `zje` double DEFAULT NULL COMMENT '入库总金额',
  `instock_userid` int(11) DEFAULT NULL COMMENT '入库人',
  `instock_date` date DEFAULT NULL COMMENT '入库日期',
  `man_code` int(11) DEFAULT NULL COMMENT '供应商',
  PRIMARY KEY (`instock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `medicine_instock` */

insert  into `medicine_instock`(`instock_id`,`invno`,`medicine_codeid`,`inamt`,`unitprc`,`zje`,`instock_userid`,`instock_date`,`man_code`) values (6,'123',2,40,10,400,11,'2018-12-11',2),(7,'234',2,50,10,500,11,'2018-12-11',1),(8,'45654',5,60,10,600,11,'2018-12-12',4),(9,'45681',4,20,10,200,11,'2018-12-19',2);

/*Table structure for table `medicine_month_balance` */

DROP TABLE IF EXISTS `medicine_month_balance`;

CREATE TABLE `medicine_month_balance` (
  `balance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `month` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `code_id` int(11) DEFAULT NULL COMMENT '药品',
  `stock_amt` int(11) DEFAULT NULL COMMENT '库存数量',
  `real_amt` int(11) DEFAULT NULL COMMENT '实际数量',
  `result` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '结果',
  `balance_user` int(11) DEFAULT NULL COMMENT '盘点人',
  PRIMARY KEY (`balance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `medicine_month_balance` */

/*Table structure for table `medicine_outstock` */

DROP TABLE IF EXISTS `medicine_outstock`;

CREATE TABLE `medicine_outstock` (
  `outstock_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code_id` int(11) DEFAULT NULL COMMENT '药品',
  `outamt` int(11) DEFAULT NULL COMMENT '出库数量',
  `unitprc` double DEFAULT NULL COMMENT '出库单价',
  `zje` double DEFAULT NULL COMMENT '总金额',
  `outstock_user` int(11) DEFAULT NULL COMMENT '出库人',
  `outstock_date` date DEFAULT NULL COMMENT '出库日期',
  `patient_id` int(11) DEFAULT NULL COMMENT '病人',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生',
  PRIMARY KEY (`outstock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `medicine_outstock` */

/*Table structure for table `medicine_purchase_info` */

DROP TABLE IF EXISTS `medicine_purchase_info`;

CREATE TABLE `medicine_purchase_info` (
  `PCH_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购编号',
  `MEDICINE_CODEID` int(11) DEFAULT NULL COMMENT '药品',
  `MAN_CODE` int(11) DEFAULT NULL COMMENT '供应商',
  `PCH_AMT` int(11) DEFAULT NULL COMMENT '采购数量',
  `PCH_PRICE` double DEFAULT NULL COMMENT '采购单价',
  `PCH_TOTAL` double DEFAULT NULL COMMENT '采购总价',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  `PCH_USERID` int(11) DEFAULT NULL COMMENT '汇总人',
  `PCH_DATE` date DEFAULT NULL COMMENT '汇总日期',
  `APPRV_USERID` int(11) DEFAULT NULL COMMENT '审批人',
  `APPRV_DATE` date DEFAULT NULL COMMENT '审批日期',
  PRIMARY KEY (`PCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `medicine_purchase_info` */

insert  into `medicine_purchase_info`(`PCH_ID`,`MEDICINE_CODEID`,`MAN_CODE`,`PCH_AMT`,`PCH_PRICE`,`PCH_TOTAL`,`STATUS`,`PCH_USERID`,`PCH_DATE`,`APPRV_USERID`,`APPRV_DATE`) values (13,2,2,40,10,400,3,11,'2018-12-09',11,'2018-12-10'),(14,5,4,60,10,600,3,11,'2018-12-09',11,'2018-12-10'),(22,2,1,50,10,500,3,12,'2018-12-10',11,'2018-12-10'),(23,4,2,20,10,200,3,12,'2018-12-10',11,'2018-12-10'),(24,4,1,70,10,700,2,11,'2018-12-10',11,'2018-12-19');

/*Table structure for table `medicine_req_plan` */

DROP TABLE IF EXISTS `medicine_req_plan`;

CREATE TABLE `medicine_req_plan` (
  `REQPLNNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '需求计划编号',
  `MEDICINE_CODEID` int(11) DEFAULT NULL COMMENT '药品',
  `REQAMT` int(11) DEFAULT NULL COMMENT '需求数量',
  `APP_USERID` int(11) DEFAULT NULL COMMENT '申请人',
  `APP_DATE` date DEFAULT NULL COMMENT '申请日期',
  `PURPOSE` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用途',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  `APPRV_USERID` int(11) DEFAULT NULL COMMENT '审批人',
  `APPRV_DATE` date DEFAULT NULL COMMENT '审批日期',
  `PCH_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`REQPLNNO`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `medicine_req_plan` */

insert  into `medicine_req_plan`(`REQPLNNO`,`MEDICINE_CODEID`,`REQAMT`,`APP_USERID`,`APP_DATE`,`PURPOSE`,`STATUS`,`APPRV_USERID`,`APPRV_DATE`,`PCH_ID`) values (7,2,20,11,'2018-12-04','止咳化痰',1,NULL,NULL,NULL),(8,5,30,11,'2018-12-05','发烧头痛',4,11,'2018-12-05',14),(10,4,40,8,'2018-12-04','发烧',3,11,'2018-12-05',24),(11,2,40,7,'2018-12-04','垃圾',4,11,'2018-12-05',13),(12,5,20,11,'2018-12-05','发烧头痛',1,NULL,NULL,NULL),(14,4,30,11,'2018-12-05','止咳化痰',3,11,'2018-12-05',24),(15,5,30,5,'2018-12-06','发烧头痛',1,NULL,NULL,NULL),(16,5,30,11,'2018-12-09','发烧头痛',4,11,'2018-12-09',14),(17,2,50,13,'2018-12-10','发烧头痛',4,14,'2018-12-10',22),(18,4,20,13,'2018-12-10','止咳化痰',4,14,'2018-12-10',23),(19,2,30,11,'2018-12-19','消化不良',2,11,'2018-12-19',NULL);

/*Table structure for table `medicine_stockinfo` */

DROP TABLE IF EXISTS `medicine_stockinfo`;

CREATE TABLE `medicine_stockinfo` (
  `stockinfo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `medicinecode_id` int(11) DEFAULT NULL COMMENT '药品',
  `amt` int(11) DEFAULT NULL COMMENT '库存数量',
  `unitprc` double DEFAULT NULL COMMENT '库存单价',
  `saleunitprc` double DEFAULT NULL COMMENT '销售单价(库存单价*1.5)',
  `zje` double DEFAULT NULL COMMENT '库存总金额(库存单价*数量)',
  PRIMARY KEY (`stockinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `medicine_stockinfo` */

insert  into `medicine_stockinfo`(`stockinfo_id`,`medicinecode_id`,`amt`,`unitprc`,`saleunitprc`,`zje`) values (1,2,90,10,15,900),(2,5,60,10,15,600),(3,4,20,10,15,200);

/*Table structure for table `medicine_type` */

DROP TABLE IF EXISTS `medicine_type`;

CREATE TABLE `medicine_type` (
  `type_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '生产厂商ID\r\n',
  `type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '类别名称\r\n',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注\r\n',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `medicine_type` */

insert  into `medicine_type`(`type_id`,`type_name`,`remark`) values (1,'W','西药'),(2,'C','中成药'),(3,'G','中草药');

/*Table structure for table `patient_register_record` */

DROP TABLE IF EXISTS `patient_register_record`;

CREATE TABLE `patient_register_record` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` int(11) DEFAULT NULL COMMENT '病人',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门',
  `register_date` date DEFAULT NULL COMMENT '挂号时间',
  `record_user` int(11) DEFAULT NULL COMMENT '挂号人',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `patient_register_record` */

insert  into `patient_register_record`(`register_id`,`patient_id`,`dept_id`,`register_date`,`record_user`,`doctor_id`,`status`) values (1,1,10,'2018-12-23',11,11,2),(4,2,3,'2018-12-26',11,2,1),(5,5,10,'2018-12-27',11,NULL,2),(6,4,3,'2018-12-27',11,2,1),(7,6,10,'2019-01-25',11,11,1);

/*Table structure for table `telvisit` */

DROP TABLE IF EXISTS `telvisit`;

CREATE TABLE `telvisit` (
  `tvid` int(11) NOT NULL AUTO_INCREMENT COMMENT '回访编号',
  `telname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '回访人姓名',
  `teltime` date DEFAULT NULL COMMENT '回访时间',
  `visitreason` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '回访分类',
  `visitreturn` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '回访结果',
  `visittype` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '回访方式',
  `cid` int(11) DEFAULT NULL COMMENT '所属公司编号',
  PRIMARY KEY (`tvid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `telvisit` */

insert  into `telvisit`(`tvid`,`telname`,`teltime`,`visitreason`,`visitreturn`,`visittype`,`cid`) values (1,'李明','2018-10-01','cc','dd','ee',23),(2,'梁哲','2018-10-02','售后回访','AAA','电话',1),(3,'张戈','2018-10-03','销售意向回访','BBB','QQ',1),(4,'张戈','2018-10-04','销售意向回访','CCC','微信',1),(5,'庞星辰','2018-10-05','售后回访','DDD','电话',2),(6,'庞星辰','2018-10-06','售后回访','EEE','QQ',2),(7,'万俊辉','2018-10-07','满意度回访','FFF','微信',2),(8,'王梦瑶','2018-10-08','满意度回访','GGG','QQ',2),(9,'耿俊宇','2018-10-09','售后回访','调查','微信',2),(10,'徐广慧','2018-10-10','销售意向回访','HHH','电话',2),(11,'耿俊宇','2018-10-11','销售意向回访','III','微信',2),(12,'张家豪','2018-10-12','售后回访','不不不','电话',2),(13,'王旗','2018-10-13','售后回访','玩玩玩','电话',3),(14,'李志新','2018-10-14','销售意向回访','KKK','QQ',3),(15,'王文迪','2018-10-15','满意度回访','文文文','QQ',3),(16,'孙玉峰','2018-12-04','售后回访','UUU','电话',2),(17,'刘博','2018-12-01','销售意向回访','xxx','QQ',1),(18,'刘博','2018-12-01','销售意向回访','xxx','QQ',1),(19,'申宇浩','2018-12-07','满意度回访','yyy','微信',3),(20,'李利利','2018-12-05','售后回访','www','QQ',2),(21,'李利利','2018-12-05','售后回访','www','QQ',1),(22,'李利利','2018-12-12','满意度回访','www','微信',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

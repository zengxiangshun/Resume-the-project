/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.11-log : Database - ishop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ishop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `ishop`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `adminuser` */

insert  into `adminuser`(`uid`,`username`,`password`) values (102,'zhangsan','123456'),(103,'admin','admin'),(104,'mxw','123'),(113,'admin','123456');

/*Table structure for table `carinf` */

DROP TABLE IF EXISTS `carinf`;

CREATE TABLE `carinf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carno` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cartype` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `carpric` double DEFAULT NULL,
  `carstate` int(11) DEFAULT NULL,
  `cardesc` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `carinf` */

insert  into `carinf`(`id`,`carno`,`cartype`,`carpric`,`carstate`,`cardesc`) values (1,'111','fff',22,1,NULL),(2,'222','ccc',200,1,NULL);

/*Table structure for table `carinfo` */

DROP TABLE IF EXISTS `carinfo`;

CREATE TABLE `carinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `carno` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '车牌号',
  `cartype` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '车辆类型',
  `carprice` double DEFAULT NULL COMMENT '车辆价格',
  `carstate` int(11) DEFAULT NULL COMMENT '车辆状态',
  `cardesc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '车辆描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `carinfo` */

insert  into `carinfo`(`id`,`carno`,`cartype`,`carprice`,`carstate`,`cardesc`) values (1,'HB1001','本田轿车',400,0,'aaaa'),(2,'HB1002','东风轿车',1200,0,'bbbb'),(3,'HB1003','现代轿车',500,1,'cccc'),(4,'HB1004','宝马轿车',800,0,'ddddd'),(5,'HB1005','东风货车',800,1,'eeee'),(6,'HB1006','摩托车',100,1,'fff');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cname` varchar(255) DEFAULT NULL COMMENT '一级分类名称',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values (1,'女装男装'),(2,'鞋靴箱包'),(3,'运动户外'),(4,'珠宝配饰'),(5,'手机数码'),(6,'家电办公'),(7,'护肤彩妆'),(10,'家居饰品'),(13,'箱包'),(14,'用品');

/*Table structure for table `categorysecond` */

DROP TABLE IF EXISTS `categorysecond`;

CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `csname` varchar(255) DEFAULT NULL COMMENT '二级分类名称',
  `cid` int(11) DEFAULT NULL COMMENT '一级分类id',
  PRIMARY KEY (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `categorysecond` */

insert  into `categorysecond`(`csid`,`csname`,`cid`) values (1,'潮流女装',1),(2,'初冬羽绒',1),(3,'毛呢大衣',1),(4,'温暖毛衣',1),(5,'精选男装',1),(6,'冬季外套',1),(9,'女鞋',2),(10,'短靴',2),(11,'男鞋',2),(12,'女包',2),(13,'男包',2),(14,'服饰配件',2),(15,'运动鞋',3),(16,'运动服',3),(17,'户外运动',3),(18,'健身装备',3),(19,'骑行装备',3),(20,'珠宝首饰',4),(21,'时尚饰品',4),(22,'品质手表',4),(23,'眼镜配饰',4),(24,'手机',5),(25,'平板',5),(26,'电脑',5),(27,'相机',5),(28,'大家电',6),(29,'厨房电器',6),(30,'生活电器',6),(31,'个户电器',6),(32,'办公耗材',6),(33,'美容护肤',7),(34,'强效保养',7),(35,'超值彩妆',7),(36,'换季保养',7),(40,'组合柜222',10),(43,'江南皮革',10),(44,'羽绒服',1);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `ctelphone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `csex` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `cbirthday` date DEFAULT NULL COMMENT '生日',
  `cjifen` double DEFAULT NULL COMMENT '积分',
  `cbalance` double DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `customer` */

insert  into `customer`(`cid`,`cname`,`ctelphone`,`csex`,`cbirthday`,`cjifen`,`cbalance`) values (1,'陈启航','133456','男','2018-08-01',0.4,10),(2,'许方为','133457','女','2018-08-02',0.1,148),(3,'党刘涛','133458','男','2018-08-08',0,0);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `indate` date DEFAULT NULL COMMENT '入库日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods` */

insert  into `goods`(`id`,`gname`,`price`,`indate`) values (9,'瓜子',6.8,'2018-08-02');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单列表ID',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `subtotal` double DEFAULT NULL COMMENT '商品金额',
  `pid` int(11) DEFAULT NULL COMMENT '商品ID',
  `oid` int(11) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemid`,`count`,`subtotal`,`pid`,`oid`) values (1,1,358,51,1),(2,2,716,45,1),(3,1,198,21,2),(4,1,119,6,2),(5,1,83,62,3),(6,1,128,31,3),(7,1,153,28,3),(8,1,208,88,4),(9,1,1700,89,5),(10,1,96,85,8),(11,2,192,85,9),(12,5,945,3,9),(13,1,690,11,9),(14,1,236,52,10),(15,1,410,44,11),(16,2,192,85,11),(17,1,96,85,12);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `total` double DEFAULT NULL COMMENT '订单总金额',
  `ordertime` datetime DEFAULT NULL COMMENT '下单时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户电话',
  `addr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户地址',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`total`,`ordertime`,`state`,`name`,`phone`,`addr`,`uid`) values (1,1074,'2018-08-20 00:00:00',1,'冯士纯','1350009','河南周口',19),(2,317,'2018-08-20 00:00:00',1,'梁哲','15003940241','河南周口',14),(3,364,'2018-08-20 16:14:28',1,'张戈','15003940000','河南周口',15),(4,208,'2018-08-20 17:10:32',1,'张戈','15003940000','河南周口',15),(5,1700,'2018-08-20 17:19:54',1,'王旗','13677888877','河南周口',21),(6,222,NULL,1,'ee','121313','ww',12),(8,96,'2018-11-15 11:00:31',NULL,'姓名查询','15155555555',NULL,27),(9,1827,'2018-11-15 11:05:18',NULL,'姓名查询','15155555555',NULL,27),(10,236,'2018-11-18 14:45:14',NULL,'姓名查询','15155555555',NULL,27),(11,602,'2018-11-18 15:25:24',NULL,'姓名查询','15155555555',NULL,27),(12,96,'2018-11-18 15:27:48',NULL,'曾祥顺','15037616138','周口',28);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `marketprice` double DEFAULT NULL COMMENT '市场价格',
  `shopprice` double DEFAULT NULL COMMENT '商品价格',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `pdesc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品说明',
  `ishot` int(11) DEFAULT NULL COMMENT '是否热卖',
  `pdate` datetime DEFAULT NULL COMMENT '日期',
  `csid` int(11) DEFAULT NULL COMMENT '二级分类名称',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`marketprice`,`shopprice`,`image`,`pdesc`,`ishot`,`pdate`,`csid`) values (1,'韩版连帽加厚毛衣女外套',558,228,'cs10001.jpg','双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。',1,'2018-11-11 20:04:02',1),(3,'韩版女装翻领羔绒夹棉格子毛呢外套',238,189,'cs10003.jpg','外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少',0,'2014-10-01 20:18:00',1),(5,'韩版女装翻领羔绒夹棉格子毛呢外套',238,320,'cs10005.jpg','外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少',0,'2014-11-02 20:18:00',1),(6,'冬装韩版女装翻领羔绒夹棉格子毛呢外套',238,256,'cs10006.jpg','外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少',0,'2014-11-10 15:18:00',1),(7,'新款优雅奢华毛领白鸭绒轻薄羽绒服',1120,148,'cs10007.jpg','秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！',0,'2014-11-03 20:18:00',1),(8,'秋冬季毛呢外套女中长款圆领小香风呢子大衣',672,350,'cs10008.jpg','【双12预售】双12提前开抢，11月24日—12月11日抢先付预付款33.6元，12月12日付剩余尾款，先付先发货，提前引爆双12！！！买就【送】双十二10元无门槛优惠券！！！商家【赠】运费险！！！',0,'2014-11-03 20:18:00',1),(9,'女装貉子毛大衣 时尚修身长袖淑女毛呢外套',238,128,'cs10009.jpg','秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！',0,'2014-11-03 20:18:00',1),(10,'修身显瘦淑女针织长袖打底连衣裙女',356,79,'cs10010.jpg','【1212万能盛典预售抢先购,早买早便宜！】定金15.80元，预售价158.00元，双12价涨价至178.00元!',0,'2014-11-03 20:18:00',1),(11,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,690,'cs20001.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(12,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,760,'cs20002.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(13,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,730,'cs20003.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(14,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,980,'cs20004.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(15,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,820,'cs20005.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(16,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,850,'cs20006.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(17,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,710,'cs20007.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(18,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,1020,'cs20008.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-11-03 20:18:00',2),(19,'整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮',19800,1000,'cs20009.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修',0,'2014-10-01 20:18:00',2),(20,'中长款貂皮大衣整貂女装',17900,886,'cs20010.jpg','采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】【售后保障】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货',0,'2014-11-03 20:18:00',2),(21,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,179,'cs30001.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',1,'2014-11-03 20:18:00',3),(22,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,126,'cs30002.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(23,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,180,'cs30003.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(24,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,154,'cs30004.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(25,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,139,'cs30005.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(26,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,118,'cs30006.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(27,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,108,'cs30007.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(28,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,153,'cs30008.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(29,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,126,'cs30009.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-03 20:18:00',3),(30,'韩版毛呢外套女韩范秋冬装厚中长款冬季呢子',598,150,'cs30010.png','今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~',0,'2014-11-10 20:18:00',3),(31,'打底衫加厚修身羊毛衫女装羊绒衫',387,128,'cs40001.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(32,'打底衫加厚修身羊毛衫女装羊绒衫',387,210,'cs40002.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(33,'打底衫加厚修身羊毛衫女装羊绒衫',387,236,'cs40003.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(34,'性感时尚 酷感黑色小圆领露肩修身长袖针织衫',387,258,'cs40004.jpg','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(35,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,247,'cs40005.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',1,'2014-11-03 20:18:00',4),(36,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,279,'cs40006.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(37,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,240,'cs40007.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(38,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,215,'cs40008.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(39,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,258,'cs40009.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(40,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,249,'cs40010.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',0,'2014-11-03 20:18:00',4),(41,'韩版黑色打底衫加厚修身羊毛衫女装羊绒衫',387,219,'cs40011.png','本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换',1,'2014-11-03 20:18:00',4),(42,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,218,'cs50001.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',1,'2014-11-03 20:18:00',5),(43,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,296,'cs50002.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',0,'2014-11-03 20:18:00',5),(44,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,410,'cs50003.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',1,'2014-11-03 20:18:00',5),(45,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,438,'cs50004.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',0,'2014-12-07 20:18:00',5),(46,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,428,'cs50005.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',0,'2014-11-03 20:18:00',5),(47,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,540,'cs50006.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',1,'2014-11-03 20:18:00',5),(48,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,510,'cs50007.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',0,'2014-11-03 20:18:00',5),(49,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,320,'cs50008.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',0,'2014-11-03 20:18:00',5),(50,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,280,'cs50009.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',0,'2014-11-03 20:18:00',5),(51,'冬装外套棉衣立领修身商务大码男装潮牌上衣',899,538,'cs50010.png','【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套',1,'2014-12-07 20:18:00',5),(52,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,236,'cs60001.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(53,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,348,'cs60002.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',1,'2014-11-03 20:18:00',6),(54,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,379,'cs60003.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(55,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,369,'cs60004.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(56,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,268,'cs60005.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(57,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,240,'cs60006.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',1,'2014-12-07 22:18:00',6),(58,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,160,'cs60007.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(59,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,180,'cs60008.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(60,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,150,'cs60009.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',1,'2014-12-02 20:18:00',6),(61,'商务修身羊毛呢子风衣 中长款呢大衣外套',997,120,'cs60010.png','冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！',0,'2014-11-03 20:18:00',6),(62,'韩版修身羽绒服加厚保暖可脱卸帽',198,200,'cs70001.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-11-03 20:18:00',7),(63,'韩版修身羽绒服加厚保暖可脱卸帽',198,280,'cs70002.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-11-03 20:18:00',7),(64,'韩版修身羽绒服加厚保暖可脱卸帽',198,320,'cs70003.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',0,'2014-11-03 20:18:00',7),(65,'韩版修身羽绒服加厚保暖可脱卸帽',198,360,'cs70004.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-11-03 20:18:00',7),(66,'韩版修身羽绒服加厚保暖可脱卸帽',198,350,'cs70005.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',0,'2014-11-03 20:18:00',7),(67,'韩版修身羽绒服加厚保暖可脱卸帽',198,300,'cs70006.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-11-03 20:18:00',7),(68,'韩版修身羽绒服加厚保暖可脱卸帽',198,250,'cs70007.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-12-04 20:18:00',7),(69,'韩版修身羽绒服加厚保暖可脱卸帽',198,210,'cs70008.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-11-03 20:18:00',7),(70,'韩版修身羽绒服加厚保暖可脱卸帽',198,259,'cs70009.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',0,'2014-11-03 20:18:00',7),(71,'韩版修身羽绒服加厚保暖可脱卸帽',198,89,'cs70010.png','羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！',1,'2014-11-03 20:18:00',7),(85,'菲都狄都正品超轻单肩斜挎包竖款男包小包尼龙包帆布包休闲运动包',158,96,'31cc93b1-fcc2-48df-a9a4-25a508fed5e9.jpg','                海量新品 潮流穿搭 玩趣互动 \n            \n            ',0,'2018-08-09 15:00:07',13),(86,'包包2018新款男包单肩包斜挎包男士包商务竖款休闲挎包背包',336,168,'a0e65e15-0826-430e-8437-67e91982a7fa.jpg','                                                欧派名品皮具店(古奇欧南京站）222\n            \n            \n            \n            ',1,'2018-08-09 14:59:26',13),(87,'稻草人户外冲锋衣男三合一女加绒加厚防风衣可拆卸内胆外套防寒服 ',2988,1398,'caa0ea63-6999-4017-8e30-b1f6c9fd481b.jpg','全场正品 达人推荐 无忧退换 \n            ',0,'2018-08-09 15:02:56',17),(89,'技术的',477,111,'41929fd3-75f9-4266-b472-0c920d8bd397edit.gif','                                而哇嘎\r\n            \r\n\r\n            \r\n            ',0,'2018-11-18 15:51:02',1);

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int(11) DEFAULT NULL COMMENT '会员id',
  `sid` int(11) DEFAULT NULL COMMENT '销售员id',
  `rtype` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '扣款方式',
  `paymoney` double DEFAULT NULL COMMENT '消费金额',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `record` */

insert  into `record`(`rid`,`cid`,`sid`,`rtype`,`paymoney`) values (2,1,1,'余额',2),(3,1,2,'积分',0.1),(4,2,1,'余额',2),(5,2,1,'积分',0.1),(6,1,2,'余额',3);

/*Table structure for table `salesman` */

DROP TABLE IF EXISTS `salesman`;

CREATE TABLE `salesman` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `stelphone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `salesman` */

insert  into `salesman`(`sid`,`sname`,`stelphone`) values (1,'马云','166777'),(2,'马化腾','166778'),(3,'刘强东','166779'),(4,'丁磊','1368888');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sname` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `chinese` int(11) DEFAULT NULL COMMENT '语文',
  `math` int(11) DEFAULT NULL COMMENT '数学',
  `english` int(11) DEFAULT NULL COMMENT '英语',
  `sex` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student` */

insert  into `student`(`id`,`sname`,`chinese`,`math`,`english`,`sex`) values (9,'陈启航',67,72,NULL,NULL),(10,'许方为',90,92,91,NULL),(11,'张1',80,NULL,NULL,NULL),(12,'张2',80,NULL,NULL,NULL),(13,'张3',85,0,0,NULL),(14,'张4',90,0,0,NULL),(15,'张5',90,0,0,NULL),(16,'张6',95,0,0,NULL),(17,'张7',97,NULL,NULL,NULL),(18,'张8',NULL,NULL,NULL,NULL),(19,'张9',NULL,NULL,NULL,NULL),(20,'张10',NULL,NULL,NULL,NULL),(21,'张11',NULL,NULL,NULL,NULL),(22,'李1',78,86,NULL,NULL),(23,'王1',98,NULL,88,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `state` int(11) DEFAULT NULL COMMENT '是否激活',
  `code` varchar(64) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`,`email`,`phone`,`addr`,`state`,`code`) values (9,'chenqihang','123','陈启航','362517339@qq.com','133378999','新疆',0,NULL),(10,'zhangtongtong','123','张彤彤','601521371@qq.com','15559988','河南周口',1,'8fc677c24bae42a191f5ba74615500d55528924a2b62449e9620bcef47f11fa2'),(14,'liangzhe','liangzhe123','梁哲','maluoxicc@163.com','15003940241','河南周口',1,'b2ac9cd0-b6e5-41c3-bfa4-5e03a5b05b66'),(15,'zhangge','zhangge123','张戈','maluoxicc@163.com','15003940000','河南周口',1,'998da1b2-4a13-44c3-b5c6-9e89c9673bf0'),(16,'wangdingyu','wangdingyu123','王定宇','maluoxicc@163.com','15003941234','河南周口',1,'b4267edd-3157-40ee-8ad9-595a3c0850b1'),(17,'shenyuhao','shenyuhao123','申宇浩','maluoxicc@163.com','15003940000','河南周口',1,'6892680a-d4fa-4b15-929d-c16e3da04bea'),(18,'lizhixin','lizhixin123','李志新','maluoxicc@163.com','1356667','河南周口',1,'4fc0af12-64f7-404c-bfdf-1a1f1ce59fad'),(19,'fengshichun','fengshichun123','冯士纯','maluoxicc@163.com','1350009','河南周口',1,'48b2362a-0eb1-4f1c-8458-47b80817391a'),(20,'wangwendi','wangwendi123','王文迪','maluoxicc@163.com','15003345656','河南周口',0,'972cfc6a-6f9c-41d7-b1e6-a901603dc581'),(22,'gengjunyu','gengjunyu123','耿俊宇','maluoxicc@163.com','135909090','河南周口',1,'0af77af9-b26b-4354-8e7f-13f83f8e0260'),(25,'huwenyue','huwenyue123','胡雯月','maluoxicc@163.com','150003344','河南周口',1,'341aca90-77a1-436a-a238-1f43c874f076'),(27,'admin','11111','姓名查询','11111@qq.com','15155555555',NULL,NULL,NULL),(28,'zxc111','11111','曾祥顺','155454@qq.com','15037616138','周口',NULL,NULL);

/*Table structure for table `userinf` */

DROP TABLE IF EXISTS `userinf`;

CREATE TABLE `userinf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `userpwd` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `userflag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `userinf` */

insert  into `userinf`(`id`,`userid`,`username`,`userpwd`,`userflag`) values (1,'22222','2222','22222',0),(2,'12345','1234','12345',1),(3,'qqqqqq','qqq','qqqqqq',1),(4,'qqqqqqqqq','qq','qqqqqqq',1),(5,'admin','全球','123456',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

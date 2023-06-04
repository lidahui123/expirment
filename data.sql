CREATE DATABASE tpccTAll;
use tpccTAll;
#建表SQL
DROP TABLE IF EXISTS `sys_customer`;
CREATE TABLE `sys_customer` (
  `id` VARCHAR(32) NOT NULL  COMMENT '顾客表ID',
  `c_d_id` VARCHAR(32) COMMENT '地区id',
  `c_w_id` VARCHAR(32) COMMENT '仓库id',
  `c_first` VARCHAR(32) COMMENT '第一个顾客',
  `c_middle` VARCHAR(32) COMMENT 'c中等',
  `c_last` VARCHAR(32) COMMENT '顾客最后',
  `c_street_one` VARCHAR(32) COMMENT '顾客街道1',
  `c_street_2` VARCHAR(32) COMMENT '顾客街道2',
  `c_city` VARCHAR(32) COMMENT '顾客所在城市',
  `c_state` VARCHAR(32) COMMENT '顾客状态',
  `c_zip` VARCHAR(32) COMMENT '顾客zip',
  `c_phone` VARCHAR(32) COMMENT '顾客电话',
  `c_since` TIMESTAMP(0) NULL  COMMENT '顾客since',
  `c_credit` VARCHAR(32) COMMENT '顾客credit',
  `c_credit_lim` DECIMAL(12,2) COMMENT '顾客creditLim',
  `c_discount` DECIMAL(8,4) COMMENT '顾客discount',
  `c_balance` DECIMAL(12,2) COMMENT '顾客balance',
  `c_ytd_payment` DECIMAL(12,2) COMMENT '顾客ytdPayment',
  `c_payment_cnt` INTEGER(5) COMMENT '顾客paymentCnt',
  `c_delivery_cnt` INTEGER(5) COMMENT '顾客deliveryCNT',
  `c_data` VARCHAR(500) COMMENT '顾客日期',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;
  
  
  DROP TABLE IF EXISTS `sys_district`;
CREATE TABLE `sys_district` (
  `id` VARCHAR(32) NOT NULL  COMMENT '区域表(district)ID',
  `d_w_id` VARCHAR(32) COMMENT '关联的仓库的id',
  `d_name` VARCHAR(32) COMMENT '地区名字',
  `d_street_one` VARCHAR(32) COMMENT '地区位于的街道1',
  `d_street_two` VARCHAR(32) COMMENT '地区位于的街道2',
  `d_city` VARCHAR(32) COMMENT '地区位于的城市',
  `d_state` VARCHAR(32) COMMENT '地区位于的骤',
  `d_zip` VARCHAR(32) COMMENT '地区的zip',
  `d_tax` DECIMAL(10,4) COMMENT '地区的TAX',
  `d_ytd` DECIMAL(10,4) COMMENT '地区的YTD',
  `d_next_o_id` VARCHAR(32) COMMENT '下一个订单的id',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_history`;
CREATE TABLE `sys_history` (
  `id` VARCHAR(32) NOT NULL  COMMENT '历史记录表ID',
  `h_c_id` VARCHAR(32) COMMENT '历史顾客id',
  `h_c_d_id` VARCHAR(32) COMMENT '历史顾客地址id',
  `h_c_w_id` VARCHAR(32) COMMENT '历史消费仓库Id',
  `h_w_id` VARCHAR(32) COMMENT '历史仓库id',
  `h_d_id` VARCHAR(32) COMMENT '历史地址信息',
  `h_date` TIMESTAMP(0) NULL  COMMENT '历史日期',
  `h_amount` DECIMAL(10,4) COMMENT '历史价格',
  `h_data` VARCHAR(32) COMMENT '历史数据',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;
  

DROP TABLE IF EXISTS `sys_item`;
CREATE TABLE `sys_item` (
  `id` VARCHAR(32) NOT NULL  COMMENT '条目表ID',
  `i_im_id` VARCHAR(32) COMMENT '条目表IMId',
  `i_price` DECIMAL(10,4) COMMENT '条目价格',
  `i_data` VARCHAR(32) COMMENT '条目日期',
  `i_name` VARCHAR(32) COMMENT '条目名称',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_new_order`;
CREATE TABLE `sys_new_order` (
  `id` VARCHAR(32) NOT NULL  COMMENT '新订单表ID',
  `no_d_id` VARCHAR(32) COMMENT '新订单地区id',
  `no_w_id` VARCHAR(32) COMMENT '新仓库id',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order` (
  `id` VARCHAR(32) NOT NULL  COMMENT '订单表ID',
  `o_d_id` VARCHAR(32) COMMENT '订单地区id',
  `o_w_id` VARCHAR(32) COMMENT '订单仓库id',
  `o_c_id` VARCHAR(32) COMMENT '订单消费者id',
  `o_entry_d` TIMESTAMP(0) NULL  COMMENT '订单时间',
  `o_carrier_id` VARCHAR(32) COMMENT '订单carrierid',
  `o_ol_cnt` INTEGER(5) COMMENT '订单OLCNT',
  `o_all_local` INTEGER(5) COMMENT '订单所有的本地',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_order_line`;
CREATE TABLE `sys_order_line` (
  `id` VARCHAR(32) NOT NULL  COMMENT '订单行ID',
  `ol_o_id` VARCHAR(32) COMMENT '订单行订单ID',
  `ol_d_id` VARCHAR(32) COMMENT '订单行地区Id',
  `ol_w_id` VARCHAR(32) COMMENT '订单行仓库id',
  `ol_number` VARCHAR(32) COMMENT '订单行数量',
  `ol_i_id` VARCHAR(32) COMMENT '订单行物品Id',
  `ol_supply_w_id` VARCHAR(32) COMMENT '订单行供应仓库Id',
  `ol_delivery_d` TIMESTAMP(0) NULL  COMMENT '订单行送达时间',
  `ol_quantity` INTEGER(5) COMMENT '订单行数量',
  `ol_amount` DECIMAL(10,4) COMMENT '订单行钱数',
  `ol_dist_info` VARCHAR(32) COMMENT '订单距离信息',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_stock`;
CREATE TABLE `sys_stock` (
  `id` VARCHAR(32) NOT NULL  COMMENT '库存表ID',
  `s_i_id` VARCHAR(32) COMMENT '库存条目ID',
  `s_quantity` INTEGER(5) COMMENT '库存数量',
  `s_dist_one` VARCHAR(32) COMMENT '库存dist01',
  `s_dist_two` VARCHAR(32) COMMENT '库存dist02',
  `s_dist_three` VARCHAR(32) COMMENT '库存dist03',
  `s_dist_five` VARCHAR(32) COMMENT '库存dist05',
  `s_dist_four` VARCHAR(32) COMMENT '库存dist04',
  `s_dist_six` VARCHAR(32) COMMENT '库存dist06',
  `s_dist_serven` VARCHAR(32) COMMENT '库存dist07',
  `s_dist_eight` VARCHAR(32) COMMENT '库存dist08',
  `s_dist_nine` VARCHAR(32) COMMENT '库存dist09',
  `s_dist_ten` VARCHAR(32) COMMENT '库存dist10',
  `s_ytd` INTEGER(8) COMMENT '库存YTD',
  `s_order_cnt` INTEGER(5) COMMENT '库存订单CNT',
  `s_remote_cnt` VARCHAR(32) COMMENT '库存远程CNT',
  `s_data` VARCHAR(32) COMMENT '库存日期',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_warehouse`;
CREATE TABLE `sys_warehouse` (
  `id` VARCHAR(32) NOT NULL  COMMENT '仓库表（warehouse）ID',
  `w_name` VARCHAR(32) COMMENT '仓库名称',
  `w_street_one` VARCHAR(32) COMMENT '仓库街道1',
  `w_street_two` VARCHAR(32) COMMENT '仓库街道2',
  `w_city` VARCHAR(32) COMMENT '仓库位于的城市',
  `w_state` INTEGER(5) COMMENT '仓库状态',
  `w_zip` VARCHAR(32) COMMENT '仓库zip',
  `w_tax` DECIMAL(10,4) COMMENT '仓库TAX',
  `w_ytd` VARCHAR(32) COMMENT '仓库YTD',
  `gmt_update` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '更新时间',
  `gmt_create` TIMESTAMP(0) NOT NULL  DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;




## 存储过程，插入表数据

##插入Warehouse 插入10条吧。id从1-10

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("1","仓库名1","街道11","街道12","城市1","状态1","zip1",10.22,"ytdne1");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("2","仓库名2","街道21","街道22","城市2","状态2","zip2",20.22,"ytdne2");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("3","仓库名3","街道31","街道32","城市3","状态3","zip3",20.22,"ytdne3");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("4","仓库名4","街道41","街道42","城市4","状态4","zip4",20.22,"ytdne4");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("5","仓库名5","街道51","街道52","城市5","状态5","zip5",20.22,"ytdne5");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("6","仓库名6","街道61","街道62","城市6","状态6","zip6",20.22,"ytdne6");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("7","仓库名7","街道71","街道72","城市7","状态7","zip7",20.22,"ytdne7");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("8","仓库名8","街道81","街道82","城市8","状态8","zip8",20.22,"ytdne8");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("9","仓库名9","街道91","街道92","城市9","状态9","zip9",20.22,"ytdne9");

INSERT INTO sys_warehouse(id,w_name,w_street_one,w_street_two,w_city,w_state,w_zip,w_tax,w_ytd) 
VALUES("10","仓库名10","街道101","街道102","城市10","状态10","zip10",20.22,"ytdne10");

## District

DROP PROCEDURE insertDistrict;
DELIMITER //
CREATE PROCEDURE insertDistrict()
BEGIN

	DECLARE num INT;
	DECLARE num2 INT;
	DECLARE num3 INT;
	SET num=1;
	SET num2=1;
	SET num3=1;
	WHILE num<=10 DO
		WHILE num2<=10 DO
			INSERT INTO sys_district(id,d_w_id,d_name,d_street_one,d_street_two,d_city,d_state,d_zip,d_tax,d_ytd,d_next_o_id)
			 VALUES(CONCAT(num3,''),CONCAT(num,''),CONCAT("d_name",num3),CONCAT("street_",num,1),CONCAT("street_",num,2),CONCAT("city",num),CONCAT("state",num),CONCAT("d_zip_",num3),CONCAT("d_tax_",num3),CONCAT("d_ytd_",num3),CONCAT("d_next_o_id",num3));
			SET num2=num2+1;
			SET num3=num3+1;
		END WHILE;
		SET num2=1;
		SET num=num+1;
	END WHILE;


END;
//



## Customer
DROP PROCEDURE insertCustomer;
DELIMITER //
CREATE PROCEDURE insertCustomer()
BEGIN

	DECLARE wareId INT;
	DECLARE districtId INT;
	DECLARE customerId INT;
	DECLARE cycle2 INT;
	DECLARE cycle3 INT;
	SET wareId=1;
	SET districtId=1;
	SET customerId=1;
	SET cycle2=1;
	SET cycle3=1;
	WHILE wareId <=10 DO
		WHILE cycle2<=10 DO
			WHILE cycle3<=3000 DO
				INSERT INTO sys_customer(id,c_d_id,c_w_id,c_first,c_middle,c_last,c_street_one,c_street_2,c_city,c_state,c_zip,c_phone,c_since,c_credit,c_credit_lim,c_discount,c_balance,c_ytd_payment,c_payment_cnt,c_delivery_cnt,c_data)
				VALUES(CONCAT(customerId,''),CONCAT(districtId,''),CONCAT(wareId,''),CONCAT("first",customerId),CONCAT("middle",customerId),CONCAT("last",customerId),CONCAT("street_",wareId,1),CONCAT("street_",wareId,2),
				CONCAT("city",wareId),CONCAT("state",wareId),CONCAT("c_zip_",customerId),CONCAT("c_phone_",customerId),UNIX_TIMESTAMP(NOW()),CONCAT("c_credit_",customerId),customerId+0.11,customerId+0.22,customerId+0.33,customerId+0.44,customerId,customerId,CONCAT("c_data",customerId));
				SET cycle3=cycle3+1;
				SET customerId=customerId+1; 
			END WHILE;
			SET cycle3=1;
			SET cycle2=cycle2+1;
			SET districtId=districtId+1;
		END WHILE;
		SET cycle2=1;
		SET wareId=wareId+1;
	END WHILE;


END;
//


## History

DROP PROCEDURE insertHistory;
DELIMITER //
CREATE PROCEDURE insertHistory()
BEGIN

	DECLARE wareId INT;
	DECLARE districtId INT;
	DECLARE historyId INT;
	DECLARE cycle2 INT;
	DECLARE cycle3 INT;
	SET wareId=1;
	SET districtId=1;
	SET historyId=1;
	SET cycle2=1;
	SET cycle3=1;
	WHILE wareId <=10 DO
		WHILE cycle2<=10 DO
			WHILE cycle3<=3000 DO
				INSERT INTO sys_history(id,h_c_id,h_c_d_id,h_c_w_id,h_w_id,h_d_id,h_date,h_amount,h_data)
				VALUES(CONCAT(historyId,''),CONCAT(historyId,''),CONCAT(districtId,''),CONCAT(wareId,''),CONCAT(wareId,''),CONCAT(districtId,''),NOW(),historyId+0.11,CONCAT("h_data",historyId));
				SET cycle3=cycle3+1;
				SET historyId=historyId+1; 
			END WHILE;
			SET cycle3=1;
			SET cycle2=cycle2+1;
			SET districtId=districtId+1;
		END WHILE;
		SET cycle2=1;
		SET wareId=wareId+1;
	END WHILE;


END;


## NewOrder

DROP PROCEDURE insertNewOrder;
DELIMITER //
CREATE PROCEDURE insertNewOrder()
BEGIN

	DECLARE wareId INT;
	DECLARE districtId INT;
	DECLARE newOrderId INT;
	DECLARE cycle2 INT;
	DECLARE cycle3 INT;
	SET wareId=1;
	SET districtId=1;
	SET newOrderId=1;
	SET cycle2=1;
	SET cycle3=1;
	WHILE wareId <=10 DO
		WHILE cycle2<=10 DO
			WHILE cycle3<=3000 DO
				INSERT INTO sys_new_order(id,no_d_id,no_w_id)
				VALUES(newOrderId,districtId,wareId);
				SET cycle3=cycle3+1;
				SET newOrderId=newOrderId+1; 
			END WHILE;
			SET cycle3=1;
			SET cycle2=cycle2+1;
			SET districtId=districtId+1;
		END WHILE;
		SET cycle2=1;
		SET wareId=wareId+1;
	END WHILE;


END;


## Order

DROP PROCEDURE insertOrder;
DELIMITER //
CREATE PROCEDURE insertOrder()
BEGIN

	DECLARE wareId INT;
	DECLARE districtId INT;
	DECLARE orderId INT;
	DECLARE cycle2 INT;
	DECLARE cycle3 INT;
	SET wareId=1;
	SET districtId=1;
	SET orderId=1;
	SET cycle2=1;
	SET cycle3=1;
	WHILE wareId <=10 DO
		WHILE cycle2<=10 DO
			WHILE cycle3<=3000 DO
				INSERT INTO sys_order(id,o_d_id,o_w_id,o_c_id,o_entry_d,o_carrier_id,o_ol_cnt,o_all_local)
				VALUES(CONCAT(orderId,''),CONCAT(districtId,''),CONCAT(wareId,''),CONCAT(orderId,''),NOW(),CONCAT(orderId,''),orderId,orderId);
				SET cycle3=cycle3+1;
				SET orderId=orderId+1; 
			END WHILE;
			SET cycle3=1;
			SET cycle2=cycle2+1;
			SET districtId=districtId+1;
		END WHILE;
		SET cycle2=1;
		SET wareId=wareId+1;
	END WHILE;


END;


## Stock

DROP PROCEDURE insertStock;
DELIMITER //
CREATE PROCEDURE insertStock()
BEGIN

	DECLARE stockId INT;
	DECLARE distinctId INT;
	DECLARE itemId INT;
	SET stockId=1;
	SET distinctId=1;
	SET itemId=1;
	WHILE distinctId<=100 DO
		WHILE itemId <=100000 DO
			INSERT INTO sys_stock(id,s_i_id,s_quantity,s_dist_one,s_dist_two,s_dist_three,s_dist_four,s_dist_five,s_dist_six,s_dist_serven,s_dist_eight,s_dist_nine,s_dist_ten,s_ytd,s_order_cnt,s_remote_cnt,s_data)
			VALUES(CONCAT(stockId,''),CONCAT(itemId,''),itemId%100,CONCAT(distinctId,''),CONCAT(distinctId+1,''),CONCAT(distinctId+2,''),CONCAT(distinctId+3,''),CONCAT(distinctId+4,''),CONCAT(distinctId+5,''),CONCAT(distinctId+6,''),CONCAT(distinctId+7,''),CONCAT(distinctId+8,''),CONCAT(distinctId+9,''),stockId,stockId,CONCAT("stock_",stockId),CONCAT("s_data_",stockId));
			SET itemId=itemId+1;
			SET stockId=stockId+1;	
		END WHILE;
		SET itemId=1;
		SET distinctId=distinctId+10;
	END WHILE;
END;




## Order-Line


DROP PROCEDURE insertOrderLine;
DELIMITER //
CREATE PROCEDURE insertOrderLine()
BEGIN

	DECLARE wareId INT;
	DECLARE districtId INT;
	DECLARE orderId INT;
	DECLARE cycle2 INT;
	DECLARE cycle3 INT;
	DECLARE cycle4 INT;
	DECLARE orderLineId INT;
	SET wareId=1;
	SET districtId=1;
	SET orderId=1;
	SET cycle2=1;
	SET cycle3=1;
	SET cycle4=1;
	SET orderLineId=1;
	WHILE wareId <=10 DO
		WHILE cycle2<=10 DO
			WHILE cycle3<=3000 DO
				WHILE cycle4<=10 DO
					INSERT INTO sys_order_line(id,ol_o_id,ol_d_id,ol_w_id,ol_number,ol_i_id,ol_supply_w_id,ol_delivery_d,ol_quantity,ol_amount,ol_dist_info)
					VALUES(CONCAT(orderLineId,''),CONCAT(orderId,''),CONCAT(districtId,''),CONCAT(wareId,''),'5',CONCAT(cycle3%990+cycle4,''),CONCAT(wareId,''),NOW(),20,orderId+0.22,CONCAT("dist_",orderLineId));
					SET orderLineId=orderLineId+1;
					SET cycle4=cycle4+1;
				END WHILE;
				SET cycle4=1;
				SET cycle3=cycle3+1;
				SET orderId=orderId+1; 
			END WHILE;
			SET cycle3=1;
			SET cycle2=cycle2+1;
			SET districtId=districtId+1;
		END WHILE;
		SET cycle2=1;
		SET wareId=wareId+1;
	END WHILE;


END;




## Item


DROP PROCEDURE insertItem;
DELIMITER //
CREATE PROCEDURE insertItem()
BEGIN

	DECLARE itemId INT;
	SET itemId=1;
	WHILE itemId <=100000 DO
		INSERT INTO sys_item(id,i_im_id,i_price,i_data,i_name)
		VALUES(CONCAT(itemId,''),CONCAT(itemId,''),itemId+0.22,CONCAT("i_data_",itemId),CONCAT("i_name_",itemId));
		SET itemId=itemId+1;	
	END WHILE;
END;


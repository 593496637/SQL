CREATE TABLE IF NOT EXISTS `brand`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	websit VARCHAR(100),
	phoneRank INT
);

INSERT INTO `brand` (name,websit,phoneRank) VALUES ('苹果','www.apple.com',1);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('三星','www.sunsang.com',2);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('华为','www.huawei.com',3);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('小米','www.mi.com',4);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('OPPO','www.oppo.com',5);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('vivo','www.vivo.com',6);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('联想','www.lenovo.com',7);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('摩托罗拉','www.moto.com',8);


# 添加brand_id 字段
ALTER TABLE `products` ADD FOREIGN KEY 
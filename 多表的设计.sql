# 1.创建brand表并添加字段
CREATE TABLE IF NOT EXISTS `brand`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	websit VARCHAR(100),
	phoneRank INT
);

# 为brand表插入数据
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('苹果','www.apple.com',1);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('三星','www.sunsang.com',2);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('华为','www.huawei.com',3);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('小米','www.mi.com',4);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('OPPO','www.oppo.com',5);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('vivo','www.vivo.com',6);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('联想','www.lenovo.com',7);
INSERT INTO `brand` (name,websit,phoneRank) VALUES ('摩托罗拉','www.moto.com',8);

# 2.给products设置外键，引用brand中的id约束
# 添加brand_id 字段
ALTER TABLE `products` ADD `brand_id` INT;
# 添加外键
ALTER TABLE `products` ADD FOREIGN KEY(brand_id) REFERENCES brand(id);
# 删除外键
ALTER TABLE `products` DROP FOREIGN KEY brand_id;
ALTER TABLE `products` DROP brand_id;

# 设置products中brand_id的值
UPDATE `products` SET `brand_id`=1 WHERE title = '华为';
UPDATE `products` SET `brand_id`=2 WHERE title = '小米';
UPDATE `products` SET `brand_id`=3 WHERE title = 'OPPO';
UPDATE `products` SET `brand_id`=4 WHERE title = '联想';
UPDATE `products` SET `brand_id`=5 WHERE title = 'vivo';

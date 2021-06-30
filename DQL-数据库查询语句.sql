# DQL

CREATE TABLE IF NOT EXISTS `products` (
		id INT PRIMARY KEY AUTO_INCREMENT,
		brand VARCHAR(20),
		title	VARCHAR(100) NOT NULL,
		price DOUBLE not NULL,
		score DECIMAL(2,1),
		voteCnt INT,
		url VARCHAR(100),
		pid INT
);

# 1.基本查询
# 查询所有数据
SELECT * FROM `products`;
# 查询指定字段
SELECT title as 标题,price as 价格 FROM `products`;

# 2.where条件
# 价格=181
SELECT * FROM `products` WHERE price = 181;
# 价格<1000
SELECT * FROM `products` WHERE price < 1000;

SELECT * FROM `products` WHERE price <> 181;

SELECT * FROM `products` WHERE price > 181 AND price < 475;
SELECT * FROM `products` WHERE price >= 181 AND price < 475;
# 包含前后
SELECT * FROM `products` WHERE price BETWEEN 181 AND 475;

SELECT * FROM `products` WHERE price < 500 || title = '华为';

SELECT * FROM `products` WHERE title like '%布%';

# 将某些值设置为null
-- UPDATE `products` SET url = NULL WHERE id >= 85 and id <= 88;

# 查询某个值为null
SELECT * FROM `products` WHERE url IS NULL;




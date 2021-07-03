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
# 第二个字符包含 孩 的
SELECT * FROM `products` WHERE title like '_孩%';

# 查询包含多个条件  +  排序 asc:升序，DESC：降序
SELECT * FROM `products` WHERE title IN ('华为','小米','苹果') ORDER BY price ASC,score DESC;
 
# 将某些值设置为null
-- UPDATE `products` SET url = NULL WHERE id >= 85 and id <= 88;

# 查询某个值为null
SELECT * FROM `products` WHERE url IS NULL;

# 分页查询
# LIMIT limit OFFSET offset
SELECT * FROM `products` LIMIT 10 OFFSET 0;
SELECT * FROM `products` LIMIT 10 OFFSET 10;

# LIMIT offset,limit
SELECT * FROM `products` LIMIT 0,10;
SELECT * FROM `products` LIMIT 10,10;









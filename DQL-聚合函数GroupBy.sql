# 1.聚合函数的使用
# 求所有手机的价格的总和 AS totalPrice  AS可以省略
SELECT SUM(price) totalPrice FROM `products`; 

# 求华为手机的价格的总和
SELECT SUM(price) totalPrice FROM `products` WHERE title='华为';
# 求华为手机的价格的平均
SELECT AVG(price) totalPrice FROM `products` WHERE title='华为';
# 求华为手机的最高价格
SELECT MAX(price) totalPrice FROM `products` WHERE title='华为';
# 求华为手机的最低价格
SELECT MIN(price) totalPrice FROM `products` WHERE title='华为';
# 求华为手机的个数
SELECT COUNT(*) totalPrice FROM `products` WHERE title='华为';
# 求华为手机的个数  url不为空的时候
SELECT COUNT(url) totalPrice FROM `products` WHERE title='华为';
# DISTINCT 去除重复项
SELECT COUNT(DISTINCT price) totalPrice FROM `products` WHERE title='华为';


# 2.GROUP BY
SELECT title,AVG(price) avgPrice,COUNT(*) count,AVG(score) avgScore FROM `products` GROUP BY title;

# 3.HAVING
# 筛选price的平均价格小于500的
SELECT title,AVG(price) avgPrice,COUNT(*) count,AVG(score) avgScore FROM `products` GROUP BY title HAVING avgPrice<500;

# 4.求scrore > 8的手机平均价格
SELECT title,AVG(price),AVG(score) FROM `products` WHERE score > 8;
# 升级 score > 8 且按照品牌分组
SELECT title,AVG(price),AVG(score) FROM `products` WHERE score > 8 GROUP BY title;

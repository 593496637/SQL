# 1.获取到的是笛卡尔积
SELECT * FROM `products`,`brand`;
# 获取到的是笛卡尔积进行筛选
SELECT * FROM `products`,`brand` WHERE products.brand_id = brand.id;

# 2.左查询
# 2.1查询所有的手机（包括没有品牌信息的手机）以及对应的品牌null
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id;
# 2.2查询没有对应品牌的数据
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand_id WHERE brand.id IS NULL;

# 3.右查询
# 3.1
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id;
# 3.2 查询没有对应
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE products.brand_id IS NULL;

# 4.内连接
SELECT * FROM `products` JOIN `brand` ON products.brand_id = brand.id;
SELECT * FROM `products` JOIN `brand` ON products.brand_id = brand.id WHERE price = 127;

# 全联接
# 联合查询 查询的是左边的所有数据与右边没有对应的手机品牌的数据
(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id)
UNION
(SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id)

# 查询所有除了有交集的数据
(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE brand.id IS NULL)
UNION
(SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE products.brand_id IS NULL);

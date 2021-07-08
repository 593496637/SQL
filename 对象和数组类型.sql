# 将联合查询到的数据转成对象(一对多)
SELECT 
	products.id id,products.title,products.price price,
	JSON_OBJECT('id',brand.id,'name',brand.name,'website',brand.websit) brand
FROM `products`
LEFT JOIN `brand` ON products.brand_id = brand.id;

# 查询所有学生的选课情况
SELECT stu.id id,stu.name,stu.age,
	JSON_ARRAYAGG(JSON_OBJECT('id',cs.id,'name',cs.name,'price',cs.price))
FROM `students` stu
JOIN `students_select_coures` ssc ON stu.id = ssc.student_id
JOIN `courses` cs ON ssc.course_id = cs.id
GROUP BY stu.id;



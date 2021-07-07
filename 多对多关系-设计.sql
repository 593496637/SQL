# 1.创建表
CREATE TABLE IF NOT EXISTS students(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	age INT
);

CREATE TABLE IF NOT EXISTS courses(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	price DOUBLE
)
# 2.插入数据
INSERT INTO `students` (name,age) VALUES ('kk',19);
INSERT INTO `students` (name,age) VALUES ('小明',16);
INSERT INTO `students` (name,age) VALUES ('Tom',23);
INSERT INTO `students` (name,age) VALUES ('lily',29);
INSERT INTO `students` (name,age) VALUES ('boby',22);


INSERT INTO `courses` (name,price) VALUES ('语文',100);
INSERT INTO `courses` (name,price) VALUES ('数学',140);
INSERT INTO `courses` (name,price) VALUES ('英语',200);
INSERT INTO `courses` (name,price) VALUES ('历史',300);

# 3.建立关系表
CREATE TABLE IF NOT EXISTS `students_select_coures`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	student_id INT NOT NULL,
	course_id INT NULL,
	FOREIGN KEY (student_id) REFERENCES students(id) ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES courses(id) ON UPDATE CASCADE
)

# 4.学生选择课程
INSERT INTO students_select_coures (student_id,course_id) VALUES (1,5);
INSERT INTO students_select_coures (student_id,course_id) VALUES (1,6);
INSERT INTO students_select_coures (student_id,course_id) VALUES (2,6);
INSERT INTO students_select_coures (student_id,course_id) VALUES (3,7);

# 4.1查询所有学生选择的课程
SELECT stu.id id,stu.name stuName,stu.age stuAge, cs.id csId,cs.name csName,cs.price csPrice
FROM `students` stu
JOIN `students_select_coures` ssc ON stu.id = ssc.student_id
JOIN `courses` cs ON ssc.course_id = cs.id
ORDER BY id;

# 4.2查询所有学生的选课情况
SELECT stu.id id,stu.name stuName,stu.age stuAge, cs.id csId,cs.name csName,cs.price csPrice
FROM `students` stu
LEFT JOIN `students_select_coures` ssc ON stu.id = ssc.student_id
LEFT JOIN `courses` cs
ON ssc.course_id = cs.id

# 4.3 查询没有选课的学生
SELECT stu.id id,stu.name stuName,stu.age stuAge, cs.id csId,cs.name csName,cs.price csPrice
FROM `students` stu
LEFT JOIN `students_select_coures` ssc ON stu.id = ssc.student_id
LEFT JOIN `courses` cs ON ssc.course_id = cs.id
WHERE cs.id IS NULL;

# 4.4查询没有被选择的课程
SELECT stu.id id,stu.name stuName,stu.age stuAge, cs.id csId,cs.name csName,cs.price csPrice
FROM `students` stu
RIGHT JOIN `students_select_coures` ssc ON stu.id = ssc.student_id
RIGHT JOIN `courses` cs ON ssc.course_id = cs.id
WHERE stu.id IS NULL;

# 4.5查询某个学生选择的所有课程
SELECT stu.id id,stu.name stuName,stu.age stuAge, cs.id csId,cs.name csName,cs.price csPrice
FROM `students` stu
LEFT JOIN `students_select_coures` ssc ON stu.id = ssc.student_id
LEFT JOIN `courses` cs ON ssc.course_id = cs.id
WHERE stu.id=1;
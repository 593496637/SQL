# 
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

INSERT INTO `students` (name,age) VALUES ('kk',19);
INSERT INTO `students` (name,age) VALUES ('小明',16);
INSERT INTO `students` (name,age) VALUES ('Tom',23);
INSERT INTO `students` (name,age) VALUES ('lily',29);
INSERT INTO `students` (name,age) VALUES ('boby',22);


INSERT INTO `courses` (name,price) VALUES ('boby',100);
INSERT INTO `courses` (name,price) VALUES ('boby',140);
INSERT INTO `courses` (name,price) VALUES ('boby',200);
INSERT INTO `courses` (name,price) VALUES ('boby',300);

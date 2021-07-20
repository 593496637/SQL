CREATE TABLE IF NOT EXISTS `user`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (name,password) VALUES (?,?);

SELECT	* FROM users WHERE name=?;


CREATE TABLE IF NOT EXISTS `moment`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) NOT NULL,
	user_id INT NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES user(id)
);

INSERT INTO moment (content,user_id) VALUES (?,?);

SELECT * FROM moment WHERE id = ?;

SELECT m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
	JSON_OBJECT('id',u.id,'name',u.name) user
	FROM moment m
	LEFT JOIN user u ON m.user_id = u.id
	WHERE m.id=1;
	
	
SELECT m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
	JSON_OBJECT('id',u.id,'name',u.name) user
	FROM moment m
	LEFT JOIN user u ON m.user_id = u.id
	LIMIT ?,?;
	
SELECT * FROM moment WHERE id=? AND user_id=?	
	
UPDATE moment SET content = ? WHERE id = ?;
	
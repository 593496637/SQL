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
	
	
CREATE TABLE IF NOT EXISTS comment(
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) NOT NULL,
	moment_id INT NOT NULL,
	user_id INT NOT NULL,
	comment_id INT DEFAULT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN key(comment_id) REFERENCES COMMENT(id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO comment(moment_id,content,user_id) VALUES (?,?,?);


SELECT m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
	JSON_OBJECT('id',u.id,'name',u.name) user,
	(SELECT COUNT(*) FROM comment c WHERE c.moment_id = m.id) commentCount,
	(SELECT COUNT(*) FROM moment_label ml WHERE ml.moment_id = m.id) labelCount
	FROM moment m
	LEFT JOIN user u ON m.user_id = u.id
	LIMIT 0,30;


# 获取动态列表（包含评论/用户信息）
SELECT 
	m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
	IF(COUNT(u.id),JSON_OBJECT('id',u.id,'name',u.name),JSON_ARRAY()) author,
	IF(COUNT(l.id),JSON_ARRAYAGG(JSON_OBJECT('id',l.id,'name',l.name,'time',DATE_FORMAT(l.createAT,'%Y-%c-%d %H:%i:%s'))) ,JSON_ARRAY()) labels,
	(SELECT IF(COUNT(c.id),JSON_ARRAYAGG(
		JSON_OBJECT('id',c.id,'content',c.content,'commentId',c.comment_id,'createTime',DATE_FORMAT(c.createAt,'%Y-%c-%d %H:%i:%s'),
							  'user',JSON_OBJECT('id',cu.id,'name',cu.name))
		),JSON_ARRAY()) FROM comment c
										LEFT JOIN user cu ON c.user_id = cu.id
										WHERE m.id = c.moment_id) comments
FROM moment m
LEFT JOIN user u ON m.user_id = u.id  

LEFT JOIN moment_label ml ON m.id = ml.moment_id
LEFT JOIN label l ON l.id = ml.label_id
WHERE m.id = 4
GROUP BY m.id;


SELECT 
	c.id id,c.content,content,c.comment_id conmmentId,c.createAt createTime,
	JSON_OBJECT('id',u.id,'name',u.name) user
FROM comment c
LEFT JOIN user u ON u.id = c.user_id
WHERE c.moment_id = 4;


# 标签label
CREATE TABLE IF NOT EXISTS label(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL UNIQUE,
	createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
# label_comment 中间表
CREATE TABLE IF NOT EXISTS moment_label(
	moment_id INT NOT NULL,
	label_id INT NOT NULL,
	createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(moment_id,label_id),
	FOREIGN KEY(moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN key(label_id) REFERENCES label(id) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO label(name) VALUES (' Java');
INSERT INTO label(name) VALUES (' C#');
INSERT INTO label(name) VALUES (' python');
INSERT INTO label(name) VALUES (' html');


SELECT * FROM label LIMIT 0,10;



-- 文件上传
CREATE TABLE IF NOT EXISTS avatar(
	id INT PRIMARY KEY AUTO_INCREMENT,
	filename VARCHAR(255) NOT NULL UNIQUE,
	mimetype VARCHAR(30),
	size INT,
	user_id INT,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
)


ALTER TABLE `user` ADD avatar_url VARCHAR(200)

>>>>>>> temp
SELECT * FROM label;


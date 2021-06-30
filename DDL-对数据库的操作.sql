#创建数据库
CREATE DATABASE IF NOT EXISTS test2;
#删除数据库
DROP DATABASE IF EXISTS test2;

#创建表
CREATE TABLE IF NOT EXISTS `users`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	age INT DEFAULT 0,
	phoneNum VARCHAR(20) UNIQUE DEFAULT '',
	createTime TIMESTAMP
);
#删除表
DROP TABLE IF EXISTS `users`;

#1.修改表的名字
ALTER TABLE `users` RENAME TO `user`;
#2.添加列
ALTER TABLE `user` ADD `updateTime` TIMESTAMP;
#3.修改字段名称
ALTER TABLE `user` CHANGE `phoneNum` `telPhone` VARCHAR(20);
#4.修改字段类型
ALTER TABLE `user` MODIFY `name` VARCHAR(30);
#5.删除字段
ALTER TABLE `user` DROP `age`;

#根据一张表结构创建另一张表
CREATE TABLE `user2` LIKE `user`;
#根据另一个表中的所有内容创建另外一个表
CREATE TABLE `user3` (SELECT * FROM `user`);
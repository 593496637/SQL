#DML
#插入数据
INSERT INTO `user` VALUES (110,'kk','13522112344','2021-07-01','2021-08-02');
	
#ID自增
INSERT INTO `user` ( name, phoneNum, createTime, updateTime )
VALUES
	( '小敏', '13818777711', '2021-01-01', '2020-01-02' );

#createTime 和 updateTime可以自动设置值
ALTER TABLE `user` MODIFY `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `user` MODIFY `updateTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

INSERT INTO `user` ( user.name, user.phoneNum)
VALUES
	( '阿列克22', '13111121114');
	
	
	
	# 删除所有数据
	DELETE FROM `user`;
	# 删除符合条件的数据
	DELETE FROM `user` WHERE id = 110;
	
	# 更新数据
	# 更新所有的数据
	UPDATE `user` SET name = 'lily', phoneNum='010-12233441';
	# 更新符合条件的数据
	UPDATE `user` SET name = 'lily3' WHERE id = 113;

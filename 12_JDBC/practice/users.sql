SELECT * FROM demo.users;
insert into users(name,email,country) values
('Nguyen Thanh An','An12312@gmail.com','Chicago,US'),
('Trần Phước Sơn','Son3490@gmail.com','Việt Nam'),
('Lỗ Quyên Quyên','quyen.h@gmail.com','Việt Nam'),
('Trần Công Quyền','quyen.c@gmail.com','Việt Nam'),
('Hoàng Thị Mai','mai223@gmail.com','Việt Nam'),
('Lương Sơn Bá','sonba@gmail.com','Việt Nam'),
('Nguyễn Bá Vương','vuongng2@gmail.com','LA,US'),
('Trần Thanh Sơn','sonth@gmail.com','Bejing,CN'),
('Nguyễn Hoàng Duy','hduy@gmail.com','Tokyo,JP');
DELETE FROM users;
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE users AUTO_INCREMENT = 1;
select * from users where name like '%Quyen%';
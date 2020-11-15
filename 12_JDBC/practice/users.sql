create database demo;
create table users(
id int  primary key AUTO_INCREMENT,
name nvarchar(50),
email nvarchar(50),
country nvarchar(50));
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

create table login(
id int primary key auto_increment,
username varchar(30),
password varchar(30));
insert into login(username,password) values('admin','admin');
-- procedure
DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER $$
-- get list user

CREATE PROCEDURE get_list_user()

BEGIN

    SELECT users. id, users.name, users.email, users.country

    FROM users;

    END$$

DELIMITER ;
-- update user
DELIMITER $$

CREATE PROCEDURE update_user(idUpd int,nameUpd varchar(30),emailUpd varchar(30),countryUpd varchar(30))

BEGIN

    update users set name=nameUpd,email=emailUpd,country=countryUpd where id = idUpd;

    END$$

DELIMITER ;

-- delete user
DELIMITER $$

CREATE PROCEDURE delete_user(idDel int)

BEGIN

    delete from users where id = idDel;

    END$$

DELIMITER ;
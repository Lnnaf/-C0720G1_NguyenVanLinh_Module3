create database `demo`;
create table customers(
	id int not null auto_increment primary key ,
   name varchar(40),
   address varchar(255),
   email varchar(255)
);
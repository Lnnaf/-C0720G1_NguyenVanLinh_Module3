create database baitap;
create table studen(
id int primary key auto_increment,
ten varchar(50),
tuoi int,
khoahoc varchar(50),
sotien bigint
);
select * from studen;
select * from studen where ten = 'Huong';
select sum(sotien) from studen where ten = 'Huong'; 
select ten,count(ten) from studen group by ten;
create database `pratice_rdbsm`;
-- created Products
create table Products(
Id int,
name varchar(50),
ImageUrl nvarchar(1000),
Price int,
Discount int,
Stock int,
CategoryId int,
SuppliedId int,
Description nvarchar(50)
);
-- created Orders
create table Orders(
Id int,
CreatedDate datetime,
ShippedDate datetime,
Status varchar(50),
Description nvarchar(50),
ShippingAddress nvarchar(500),
ShippingCity nvarchar(50),
PaymentType varchar(20),
CustommerId varchar(50),
EmployeeId varchar(50)
);
-- Turn Off Safe Updates 
SET SQL_SAFE_UPDATES = 0;
insert into products values
(1,'Phantom Assassin','bit.ly/imageOfPA.png',45,0,123,2,21,'Have Arcana'),
(2,'Lina','bit.ly/lina.png',40,0,258,31,33,'Have Arcana'),
(3,'Storm Spirit','bit.ly/Storm_Spirit.png',33,0,421,32,21,'Have not arcana '),
(4,'Sven','bit.ly/Sven.png',32,0,521,22,42,'Have not arcana'),
(5,'Temple Assasin','bit.ly/Temple_Assasin.png',31,0,443,12,12,'Have not arcana'),
(6,'Kunka','bit.ly/Kunka.png',22,0,112,23,9,'Have not arcana'),
(7,'Tiny','bit.ly/Tiny.png',12,0,112,1,11,'Have not arcana'),
(8,'Omniknight','bit.ly/Omniknight.png',22,0,531,22,42,'Have not arcana'),
(9,'Anti Mage','bit.ly/Anti Mage.png',123,0,875,31,23,'Have not arcana'),
(10,'Invoker','bit.ly/Invoker.png',11,0,12,11,22,'Have not arcana'),
(11,'Legion Commander','bit.ly/LC.png',32,0,65,12,21,'Have Arcana') ;
select * from products;
delete from products;




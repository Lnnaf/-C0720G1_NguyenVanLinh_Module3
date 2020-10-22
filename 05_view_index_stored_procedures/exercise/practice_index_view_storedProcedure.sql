create table products (
id int primary key  NOT NULL AUTO_INCREMENT,
productCode varchar(20),
productName varchar(50),
productPrice int(20),
productAmount int(20),
productDescription varchar(100),
productStatus varchar(100)
);
insert into products values(1,'sp001','TV','123','4','not ship','stock'),
(2,'sp002','Radio','234','3','ship','stock'),
(3,'sp003','Motobike','121','12','not ship','stock'),
(4,'sp004','Washing','551','1','not ship','stock'),
(5,'sp005','Fan','231','11','ship','stock'),
(6,'sp006','Cook','512','21','ship','stock'),
(7,'sp007','Shoe','678','32','not ship','stock');
-- create unique index
create unique index index_productCode 
on products(productCode);
-- create composite index
create index composite_index 
on products(productName,productPrice);
-- test index 
explain select * from products where productName='Fan' ;
explain select * from products where productCode='sp002' ;

-- create view
create view test_view as 
select productCode, productName,productPrice,productStatus 
from products; 
-- edit view
create or replace view test_view as
select productCode, productName,productPrice,productStatus 
from products where productStatus = 'stock';
-- drop view
drop view test_view;
-- create stored procedure show all product
delimiter //
create procedure showAllProduct()
begin 
select * from products;
end //
delimiter ;
-- create stored procedure add new product
delimiter //
create procedure addNewProductAutoID(productCode varchar(20),
productName varchar(50),
productPrice int(20),
productAmount int(20),
productDescription varchar(100),
productStatus varchar(100)
)
begin
insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value(productCode,productName,productPrice,productAmount,productDescription,productStatus);
end; //
delimiter ;
call addNewProductAutoID('sp008','Hat','121','32','ship','not stock');
-- edit by id
delimiter //
create procedure editById(inputId int,
productCode varchar(20),
productName varchar(50),
productPrice int(20),
productAmount int(20),
productDescription varchar(100),
productStatus varchar(100))
begin
update products
set
productCode=productCode, 
productName=productName,
productPrice=productPrice,
productAmount=productAmount,
productDescription=productDescription,
productStatus=productStatus
where id = inputId;
end; //
delimiter ;
call editById(7,'sp444','AK-47','444','44','not ship','dont have');
select * from products;
-- delete by id
delimiter //
create procedure deleteById(inputId int)
begin
delete from products where id = inputId;
end;//
delimiter ;
call deleteById(7);
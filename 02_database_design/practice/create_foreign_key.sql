create database `demo`;
create table customers(
	id int not null auto_increment primary key ,
   name varchar(40),
   address varchar(255),
   email varchar(255)
);
create table orders(
id int auto_increment,
staff varchar(50),
primary key(id),
customer_id int,
foreign key (customer_id) references customers(id)
);
insert into customers values (1,'john','78/23 CA-USA','john@us.com'),
 (2,'john','78/23 CA-USA','john@us.com'),
 (3,'john','78/23 CA-USA','john@us.com'),
 (4,'john','78/23 CA-USA','john@us.com');
select * from customers;
select * from orders;

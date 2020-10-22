create table customers(
id int not null primary key,
name nvarchar(50),
email nvarchar(50),
phone nvarchar(11)
);
create table accounts(
customer_number int,
foreign key (customer_number) references customers(id),
type varchar(10),
date_create date,
balance int
);
create table transactions(
account_number int,
foreign key (account_number) references accounts(customer_number),
value int,
date date,
description nvarchar(50)
);
alter table transactions add column id_transactions int;
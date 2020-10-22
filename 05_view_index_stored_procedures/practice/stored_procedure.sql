DELIMITER //
CREATE PROCEDURE findAllCustomers()
begin
select * from customers;
end//
DELIMITER ;

call findAllCustomers();

DELIMITER //
CREATE PROCEDURE getCusById(in cusNum int(11))
begin
select * from customers where customerNumber = cusNum;
end//
DELIMITER ;

call getCusById(175);
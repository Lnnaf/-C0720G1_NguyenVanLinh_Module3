create database furama_resort;
-- create table customer_type
CREATE TABLE `furama_resort`.`customer_type` (
  `customer_type_id` INT NOT NULL AUTO_INCREMENT,
  `customer_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_type_id`));
  -- create table customer 
  CREATE TABLE `furama_resort`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_type_id` INT NULL,
  `customer_name` VARCHAR(45) NULL,
  `customer_birthday` DATE NULL,
  `customer_gender` BIT(1) NULL,
  `customer_idcard` VARCHAR(45) NULL,
  `customer_phone` VARCHAR(45) NULL,
  `customer_email` VARCHAR(45) NULL,
  `customer_address` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`));
  -- create table position
  CREATE TABLE `furama_resort`.`position` (
  `position_id` INT NOT NULL,
  `position_name` VARCHAR(45) NULL,
  PRIMARY KEY (`position_id`));
  
-- START BY CREATING A DATABSE TO PERFORM THE NORMALIZATION 
CREATE DATABASE NORMALIZATION;

-- Question 1 Achieving 1NF
USE NORMALIZATION;

CREATE TABLE productDetail(
orderID INT,
customerName varchar(100),
product varchar(150)
);

insert into productDetail(orderID,customerName,product)
values(101,'John Doe','Laptop'),
(101,'John Doe','Mouse'),
(102,'Jane Smith','Tablet'),
(102,'Jane Smith','Keyboard'),
(102,'Jane Smith','Mouse'),
(103,'Emily Clark','Phone');

-- Question 2 Achieving 2NF
-- TO CONVERT THE TABLE TO 2NF TWO TABLES WILL BE CREATED TO REMOVE THE PARTIAL DEPENDENCY
 
USE NORMALIZATION;

CREATE TABLE orders(
orderID INT PRIMARY KEY,
customerName varchar(100)
);

CREATE TABLE orderDetails(
orderID INT,
product varchar(100),
quantity INT,
PRIMARY KEY (orderID, product),
FOREIGN KEY(orderID) REFERENCES orders(orderID)
);

insert into orders(orderID,customerName)
values(101,'John Doe'),
(102,'Jane Smith'),
(103,'Emily Clark');

INSERT INTO orderDetails(orderID,product,quantity)
values(101,'Laptop',2),
(101,'Mouse',1),
(102,'Tablet',3),
(102,'Keyboard',1),
(102,'Mouse',2),
(103,'Phone',1); 


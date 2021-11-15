CREATE DATABASE ProductManagement;
USE ProductManagement;

CREATE TABLE Products (
productId VARCHAR(5) UNIQUE PRIMARY KEY,
productName VARCHAR(40),
productPrice DOUBLE,
productQuantity INT,
productColor VARCHAR(20),
productDescription TEXT
);

CREATE TABLE Category (
CategoryId INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
productId VARCHAR(5),
productCategory VARCHAR(60)
);





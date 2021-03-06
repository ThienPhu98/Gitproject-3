CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customers (
cID INT AUTO_INCREMENT PRIMARY KEY,
cname VARCHAR(25),
cAGE INT
);

CREATE TABLE Orders (
oID INT AUTO_INCREMENT PRIMARY KEY,
cID INT,
oDate DATETIME,
oTotalPrice INT,
FOREIGN KEY (cID) REFERENCES Customers (cID)
);

CREATE TABLE Product (
pID INT AUTO_INCREMENT PRIMARY KEY,
pName VARCHAR(25),
pPrice INT
);

CREATE TABLE OrderDetail (
oID INT,
FOREIGN KEY (oID) REFERENCES Orders (oID),
pID INT,
FOREIGN KEY (pID) REFERENCES Product (pID),
odQTY INT
);
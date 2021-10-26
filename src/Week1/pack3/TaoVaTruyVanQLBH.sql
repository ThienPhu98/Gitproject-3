USE QuanLyBanHang;

INSERT INTO Customers
VALUE (1, 'Minh Quan', 10);
INSERT INTO Customers
VALUE (2, 'Ngoc Oanh', 20);
INSERT INTO Customers
VALUE (3, 'Hong Ha', 50);

INSERT INTO Orders
VALUE (1, 1, '2006-3-21', Null);
INSERT INTO Orders
VALUE (2, 2, '2006-3-23', Null);
INSERT INTO Orders
VALUE (3, 1, '2006-3-16', Null);

INSERT INTO Product
VALUE (1, 'May Giat', 3);
INSERT INTO Product
VALUE (2, 'Tu Lanh', 5);
INSERT INTO Product
VALUE (3, 'Dieu Hoa', 7);
INSERT INTO Product
VALUE (4, 'Quat', 1);
INSERT INTO Product
VALUE (5, 'Bep Dien', 2);

INSERT INTO OrderDetail
VALUE (1, 1, 3);
INSERT INTO OrderDetail
VALUE (1, 3, 7);
INSERT INTO OrderDetail
VALUE (1, 4, 2);
INSERT INTO OrderDetail
VALUE (2, 1, 1);
INSERT INTO OrderDetail
VALUE (3, 1, 8);
INSERT INTO OrderDetail
VALUE (2, 5, 4);
INSERT INTO OrderDetail
VALUE (2, 3, 3);

SELECT oID, oDate, oPrice FROM Orders
JOIN 
(SELECT oID AS id, 
pPrice AS oPrice
FROM OrderDetail
JOIN Product
ON OrderDetail.pID = Product.pID
) AS productInfo
ON Orders.oID = productInfo.id;

SELECT ProductInfo.oID, CustomerInfo.cName, ProductInfo.pName
FROM 
(SELECT oID, pName FROM OrderDetail
JOIN Product
ON OrderDetail.pID = Product.pID) AS ProductInfo
JOIN
(SELECT oID, cName FROM Orders
JOIN Customers
ON Orders.cID = Customers.cID) AS CustomerInfo
ON CustomerInfo.oID = ProductInfo.oID;

SELECT * FROM Customers
WHERE cID NOT IN 
(SELECT Orders.cID FROM Orders);

SELECT BillDetail.oID, oDate, Bill FROM
(SELECT oID, pID,
(pPrice * odQTY) AS Bill
FROM
(SELECT oID, OrderDetail.pID, pPrice, odQTY FROM OrderDetail
JOIN Product
ON OrderDetail.pID = Product.pID) AS productDetail) AS BillDetail
JOIN Orders
ON BillDetail.oID = Orders.oID
CREATE DATABASE Demo;
USE Demo;

CREATE TABLE Products (
id INT AUTO_INCREMENT PRIMARY KEY,
productCode INT UNIQUE,
productName VARCHAR(45),
productPrice INT,
productAmount INT,
productDescription TEXT,
productStatus INT);

INSERT INTO Products
VALUES (1, 1, 'I-Phone', 102, 15, null, 1);
INSERT INTO Products
VALUES (2, 2, 'SamSung', 97, 12, null, 1);
INSERT INTO Products
VALUES (3, 3, 'Xiaomi', 80, 10, null, 1);
INSERT INTO Products
VALUES (4, 4, 'Nokia', 85, 15, null, 0);
INSERT INTO Products
VALUES (5, 5, 'V-Smart', 92, 20, null, 1);
INSERT INTO Products
VALUES (6, 6, 'B-Phone', 87, 5, null, 0);
INSERT INTO Products
VALUES (7, 7, 'Oppo', 80, 8, null, 1);
INSERT INTO Products
VALUES (8, 8, 'ZRadius', 78, 7, null, 1);
INSERT INTO Products
VALUES (9, 9, 'Vivo', 89, 9, null, 0);
INSERT INTO Products
VALUES (10, 10, 'Realme', 94, 5, null, 1);

SELECT * FROM Products
WHERE productStatus = 1;

ALTER TABLE Products ADD UNIQUE INDEX idx_Code(productCode);
EXPLAIN SELECT * FROM Products WHERE productStatus = 1;

ALTER TABLE Products ADD INDEX idx_Code2(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productStatus = 1;

CREATE VIEW Products_view AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
select * from Products_view;

CREATE OR REPLACE VIEW Products_view AS
SELECT id, productName, productPrice, productAmount
FROM Products;

DROP VIEW Products_view;


DELIMITER //

CREATE PROCEDURE takeAllProduct()

BEGIN

  SELECT * FROM Products;

END //


DELIMITER ;

DELIMITER //

CREATE PROCEDURE addNewProduct(
id INT,
productCode INT,
productName VARCHAR(45),
productPrice INT,
productAmount INT,
productDescription TEXT,
productStatus INT)

BEGIN

  INSERT INTO Products
  VALUES (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE removeProduct(id_remove INT)

BEGIN

  DELETE FROM Products
  WHERE id = id_remove;

END //

DELIMITER ;


CALL addNewProduct(11, 11, 'V-Line', 91, 4, null, 1);
CALL removeProduct(11);
CALL takeAllProduct();
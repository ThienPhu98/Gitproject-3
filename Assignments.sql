CREATE DATABASE FrontOfficeSystem;
USE FrontOfficeSystem;

CREATE TABLE BookingList(
bookingCode INT PRIMARY KEY,
guestName VARCHAR(45),
phoneNumber VARCHAR(11),
dayArrival DATE,
guaranteeFee INT,
methodPayment VARCHAR(20)
);

CREATE TABLE InHouseGuestList(
guestID INT PRIMARY KEY,
guestName VARCHAR(45),
phoneNumber VARCHAR(11),
dayArrival DATE,
guaranteeFee INT,
methodPayment VARCHAR(20)
);

CREATE TABLE Room(
roomNumber INT PRIMARY KEY,
guestID INT,
FOREIGN KEY (guestID) REFERENCES InHouseGuestList (guestID)
);

CREATE TABLE Staff(
staffID INT PRIMARY KEY,
staffName VARCHAR(45),
staffLevel VARCHAR(20),
staffHistory TEXT
);

INSERT INTO BookingList
VALUE ('#31253', 'Strangel Luke', '0123642332', '2021-12-5', 1000000, 'cash');
INSERT INTO BookingList
VALUE ('#30423', 'David Lust', '0342162714', '2022-1-15', 4000000, 'credit-card');
INSERT INTO BookingList
VALUE ('#20254', 'Le Thi Hai', '01236423324', '2021-11-25', 1000000, 'cash');
INSERT INTO BookingList
VALUE ('#21355', 'Nguyen Thanh Dat', '092183723', '2021-11-12', 2000000, 'credit-card');
INSERT INTO BookingList
VALUE ('#01234', 'Nguyen Minh Tuan', '0772831422', '2021-11-30', 8000000, 'cash');

INSERT INTO Room
VALUE ('101', null);
INSERT INTO Room
VALUE ('102', null);
INSERT INTO Room
VALUE ('103', null);
INSERT INTO Room
VALUE ('201', null);
INSERT INTO Room
VALUE ('202', null);
INSERT INTO Room
VALUE ('203', null);
INSERT INTO Room
VALUE ('301', null);
INSERT INTO Room
VALUE ('302', null);
INSERT INTO Room
VALUE ('303', null);
INSERT INTO Room
VALUE ('304', null);

INSERT INTO Staff
VALUE ('17234', 'Nguyen Phan Thien Phu', 'manager', null);
INSERT INTO Staff
VALUE ('91283', 'Arnol Villa', 'manager', null);
INSERT INTO Staff
VALUE ('12744', 'Nguyen Thanh Hai', 'staff', null);
INSERT INTO Staff
VALUE ('12934', 'Cao Mai Trang', 'staff', null);
INSERT INTO Staff
VALUE ('71245', 'Le Thi Hoai Lam', 'staff', null);
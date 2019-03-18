use master
go
create database Activity6
go

use Activity6
go



create table Branch(
Branch_Code int identity(1,1) primary key,
branch_description varchar(20),
branch_Address varchar(20)
)
go
create table Employee(
empID int Identity(1,1) Primary Key,
name varchar(20),
surname varchar(20),
contact varchar(10),
Branch_Code int
foreign key (Branch_Code) references Branch(Branch_Code)
)
go
create table Customer(
CusID int Identity(1,1) Primary Key,
name varchar(20),
surname varchar(20)

)
go


create Table Sales(
SaleID int Identity(1,1) Primary Key,
CusID int,
empID int,
Amount decimal(10,2),
Sale_Date Datetime
CONSTRAINT FK_Sales1 FOREIGN KEY (empID)
REFERENCES Employee(empID),
CONSTRAINT FK_Sales2 FOREIGN KEY (CusID)
REFERENCES Customer(CusID)
)
go

--use master
--go
--drop database Activity5
--go



INSERT INTO Employee(name,surname,contact,Branch_Code) VALUES ('Jason','Brooks','0123456789', 1)
INSERT INTO Employee(name,surname,contact,Branch_Code) VALUES('Uyanda','Thema','0612345678', 2)
INSERT INTO Employee(name,surname,contact,Branch_Code) VALUES('Max','Smith','0612345674', 3)
INSERT INTO Employee(name,surname,contact,Branch_Code) VALUES('Sam','Kim','0612345558', 1)
INSERT INTO Employee(name,surname,contact,Branch_Code) VALUES('Josh','Jay','0611145678', 2)

INSERT INTO Customer(name,surname) VALUES ('Ben','James')
INSERT INTO Customer(name,surname) VALUES ('Bhuti','Magagula')
INSERT INTO Customer(name,surname) VALUES ('Lana','Houston')
INSERT INTO Customer(name,surname) VALUES ('Mary','Lamb')
INSERT INTO Customer(name,surname) VALUES ('Pig','Piglet')
INSERT INTO Customer(name,surname) VALUES ('Jack','Kruger')

insert into Branch(branch_description,branch_address) values ('Pretoria','1066 burnett street')
insert into Branch(branch_description,branch_address) values('Nelspruit','10 cameroon street')
insert into Branch(branch_description,branch_address) values('Durban','11 pine street')

INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (1,6,423.20,'2019.01.05')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (2,8,500.00,'2019.01.08')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (4,7,233.50,'2019.01.30')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (3,9,325.25,'2019.02.06')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (2,10,365.86,'2019.02.14')

INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (2,6,789.25,'2019.02.20')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (3,8,123.52,'2019.02.26')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (6,7,365.32,'2019.03.09')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (6,6,568.20,'2019.03.11')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (2,9,111.99,'2019.03.18')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (4,10,99.99,'2019.03.22')
INSERT INTO Sales(CusID,empID,Amount,Sale_Date) VALUES (5,9,12.63,'2019.03.28')
select *
from Sales

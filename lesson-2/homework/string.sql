--1
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);
--2
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali Karimov', 2500.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(2, 'Dilnoza Rasulova', 3000.00),
(3, 'Sardor Abdullayev', 2800.50);
--3
UPDATE Employees
SET Salary = 2700.00
WHERE EmpID = 1;
--4
DELETE FROM Employees
WHERE EmpID = 2;
--5
-- CREATE test table
CREATE TABLE TestTable (
    ID INT,
    Name VARCHAR(50)
);

-- Insert example data
INSERT INTO TestTable VALUES (1, 'Example'), (2, 'Demo');

-- DELETE (records only, structure remains, can be rolled back if in transaction)
DELETE FROM TestTable;

-- TRUNCATE (faster than DELETE, removes all records, cannot be rolled back easily)
TRUNCATE TABLE TestTable;

-- DROP (removes table structure completely)
DROP TABLE TestTable;
--6
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
--7
ALTER TABLE Employees
ADD Department VARCHAR(50);
--8
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;
--9
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
--10
-- Option 1: DELETE (can use WHERE too)
DELETE FROM Employees;

-- Option 2: TRUNCATE (if you want to remove all rows efficiently)
-- TRUNCATE TABLE Employees;
--1
-- Misol uchun mavjud jadvaldan 5 ta yozuvni olish:
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT TOP 5 DepartmentID, DepartmentName
FROM SourceDepartments;

--2
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
--3
DELETE FROM Employees;
TRUNCATE TABLE Employees;
--4
ALTER TABLE Employees
DROP COLUMN Department;
--5
EXEC sp_rename 'Employees', 'StaffMembers';

--6
DROP TABLE Departments;
--1
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Description VARCHAR(255)
);
--2
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--3
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';
--4
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'Gaming laptop'),
(2, 'Chair', 'Furniture', 150.50, 'Ergonomic office chair'),
(3, 'Headphones', 'Electronics', 75.25, 'Wireless over-ear'),
(4, 'Desk', 'Furniture', 200.00, 'Wooden desk with drawers'),
(5, 'Smartphone', 'Electronics', 950.00, 'Latest model with 5G');
--5
SELECT * INTO Products_Backup
FROM Products;
--6
EXEC sp_rename 'Products', 'Inventory';
--7
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;
--8
-- 1. Yangi jadval yaratish
CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000,5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    Description VARCHAR(255),
    StockQuantity INT
);

-- 2. Eski jadvaldan yangi jadvalga ma'lumotlarni ko‘chirish
INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, Description, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, Description, StockQuantity
FROM Inventory;

-- 3. Eski jadvalni o‘chirish (ixtiyoriy)
DROP TABLE Inventory;

-- 4. Yangi jadvalni Inventory deb qayta nomlash
EXEC sp_rename 'Inventory_New', 'Inventory';

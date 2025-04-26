
----# 🔵 Part 1: Stored Procedure Tasks

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE DepartmentBonus (
    Department NVARCHAR(50) PRIMARY KEY,
    BonusPercentage DECIMAL(5,2)
);


INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Sales', 5000),
(2, 'Jane', 'Smith', 'Sales', 5200),
(3, 'Mike', 'Brown', 'IT', 6000),
(4, 'Anna', 'Taylor', 'HR', 4500);

INSERT INTO DepartmentBonus VALUES
('Sales', 10),
('IT', 15),
('HR', 8);
----```

-------

----## 📄 Task 1:

----Create a stored procedure that:

--- Creates a temp table `#EmployeeBonus`
--- Inserts EmployeeID, FullName (FirstName + LastName), Department, Salary, and BonusAmount into it
--  - (BonusAmount = Salary * BonusPercentage / 100)
--- Then, selects all data from the temp table.

CREATE TABLE #EmployeeBonus (
    EmployeeID INT,
    FullName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(18,2),
    BonusAmount DECIMAL(18,2)
);

INSERT INTO #EmployeeBonus (EmployeeID, FullName, Department, Salary, BonusAmount)
SELECT 
    e.EmployeeID,
    concat (e.FirstName , ' ' ,e.LastName) AS FullName,
    e.Department,
    e.Salary,
    e.Salary * db.BonusPercentage / 100 AS BonusAmount
FROM Employees e
join DepartmentBonus db on e.Department=db.Department

select * from #EmployeeBonus

--2
CREATE PROCEDURE UpdateEmployeeSalary
    @DepartmentName VARCHAR(50),
    @IncreasePercent DECIMAL(5,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * @IncreasePercent / 100)
    WHERE Department = @DepartmentName;

    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary
    FROM Employees
    WHERE Department = @DepartmentName;
END;

EXEC UpdateEmployeeSalary 'Sales', 10;

--## 📄 Task 2:

CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);


--## 📄 Task 3:


Merge into Products_Current as target
using Products_New as Source
on target.productID = Source.productID
when matched and target.price <> source.price	then
	update set target.price = source.price
when not matched by Source then
	delete
when not matched by Target then
	insert values 
	(source.productID, source.productname,
	source.price);



--## 📄 Task 4:

Create table Tree (id int, p_id int)
Truncate table Tree
insert into Tree (id, p_id) values ('1', NULL)
insert into Tree (id, p_id) values ('2', '1')
insert into Tree (id, p_id) values ('3', '1')
insert into Tree (id, p_id) values ('4', '2')
insert into Tree (id, p_id) values ('5', '2')

SELECT 
    t1.id,
    CASE 
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN t1.id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree t1;

--## 📄 Task 5:

Create table Signups (user_id int, time_stamp datetime)
Create table  Confirmations (user_id int, time_stamp datetime, action varchar(20))
Truncate table Signups
insert into Signups (user_id, time_stamp) values ('3', '2020-03-21 10:16:13')
insert into Signups (user_id, time_stamp) values ('7', '2020-01-04 13:57:59')
insert into Signups (user_id, time_stamp) values ('2', '2020-07-29 23:09:44')
insert into Signups (user_id, time_stamp) values ('6', '2020-12-09 10:39:37')
insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-01-06 03:30:46', 'timeout')
insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-07-14 14:00:00', 'timeout')
insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-12 11:57:29', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-13 12:58:28', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-14 13:59:27', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-01-22 00:00:00', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-02-28 23:59:59', 'timeout')

SELECT 
    s.user_id,
    ROUND(
        CASE 
            WHEN COUNT(c.action) = 0 THEN 0
            ELSE 
                SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0
                / COUNT(c.action)
        END
    , 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;

--## 📄 Task 6:



CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

SELECT * 
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);


--## 📄 Task 7:

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);


-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    SaleDate DATE
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Model A', 'Electronics', 1200),
(2, 'Laptop Model B', 'Electronics', 1500),
(3, 'Tablet Model X', 'Electronics', 600),
(4, 'Tablet Model Y', 'Electronics', 700),
(5, 'Smartphone Alpha', 'Electronics', 800),
(6, 'Smartphone Beta', 'Electronics', 850),
(7, 'Smartwatch Series 1', 'Wearables', 300),
(8, 'Smartwatch Series 2', 'Wearables', 350),
(9, 'Headphones Basic', 'Accessories', 150),
(10, 'Headphones Pro', 'Accessories', 250),
(11, 'Wireless Mouse', 'Accessories', 50),
(12, 'Wireless Keyboard', 'Accessories', 80),
(13, 'Desktop PC Standard', 'Computers', 1000),
(14, 'Desktop PC Gaming', 'Computers', 2000),
(15, 'Monitor 24 inch', 'Displays', 200),
(16, 'Monitor 27 inch', 'Displays', 300),
(17, 'Printer Basic', 'Office', 120),
(18, 'Printer Pro', 'Office', 400),
(19, 'Router Basic', 'Networking', 70),
(20, 'Router Pro', 'Networking', 150);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-15'), -- Laptop A
(2, 1, 1, '2024-02-10'), -- Laptop A again
(3, 1, 3, '2024-03-08'), -- Laptop A again
(4, 2, 1, '2024-01-22'), -- Laptop B
(5, 3, 5, '2024-01-20'), -- Tablet X
(6, 5, 2, '2024-02-18'), -- Smartphone Alpha
(7, 5, 1, '2024-03-25'), -- Smartphone Alpha again
(8, 6, 4, '2024-04-02'), -- Smartphone Beta
(9, 7, 2, '2024-01-30'), -- Smartwatch 1
(10, 7, 1, '2024-02-25'), -- Smartwatch 1 again
(11, 7, 1, '2024-03-15'), -- Smartwatch 1 again
(12, 9, 8, '2024-01-18'), -- Headphones Basic
(13, 9, 5, '2024-02-20'), -- Headphones Basic again
(14, 10, 3, '2024-03-22'), -- Headphones Pro
(15, 11, 2, '2024-02-14'), -- Mouse
(16, 13, 1, '2024-03-10'), -- Desktop PC Standard
(17, 14, 2, '2024-03-22'), -- Desktop PC Gaming
(18, 15, 5, '2024-02-01'), -- Monitor 24
(19, 15, 3, '2024-03-11'), -- Monitor 24 again
(20, 19, 4, '2024-04-01'); -- Router Basic


CREATE PROCEDURE GetProductSalesSummary
    @ProductID INT
AS
BEGIN
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS Total_Quantity_Sold,
        SUM(s.Quantity * p.Price) AS Total_Sales_Amount,
        MIN(s.SaleDate) AS First_Sale_Date,
        MAX(s.SaleDate) AS Last_Sale_Date
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.ProductID = @ProductID
    GROUP BY p.ProductName;
END;

EXEC GetProductSalesSummary @ProductID = 1;

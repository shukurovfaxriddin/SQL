--1
select *,
	case
	when month(Dt) < 10 then concat(0,month(Dt))
	else CAST(MONTH(Dt) AS VARCHAR)
	end as MonthPrefixedWithZero
from Dates
--2
CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);

select * from MyTabel

with cte as(
select Distinct id as Distinct_Ids ,rID,MAX(Vals) AS TotalOfMaxVals from MyTabel
group by id,rID)
select count(Distinct_Ids) as Distinct_Ids,rID,sum(TotalOfMaxVals) TotalOfMaxVals from cte
group by rID

--3
CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');

select * from TestFixLengths
where len(TRIM(Vals)) between 6 and 10

--4
CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);


SELECT t.ID, t.Item, t.Vals
FROM TestMaximum t
INNER JOIN (
    SELECT ID, MAX(Vals) AS MaxVal
    FROM TestMaximum
    GROUP BY ID
) m ON t.ID = m.ID AND t.Vals = m.MaxVal
order by vals desc

--5
CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);

select * from SumOfMax

SELECT s1.Id , s1.Vals --,sum( s1.Vals) as SumofMax
FROM SumOfMax s1
 JOIN (
    SELECT DetailedNumber,id, MAX(Vals) AS MaxVal
    FROM SumOfMax s2
    GROUP BY DetailedNumber,id
) s2 ON s1.id = s2.id 
group by s1.Id 
order by vals desc


select id,sum(MaxVal) SumofMax from (
    SELECT DetailedNumber,id, MAX(Vals) AS MaxVal
    FROM SumOfMax s2
    GROUP BY DetailedNumber,id) sss
group by id

--6
CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

with cte as(
select id,a,b, CAST (a-b AS varchar(20))  as OUTPUTt  

from TheZeroPuzzle)
select id,a,b,case
	when OUTPUTt = 0 then ''
	else OUTPUTt
	end as OUTPUT
from cte

--7
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    CustomerID INT
);

INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region, CustomerID)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North', 1),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North', 2),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East', 3),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West', 4),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South', 5),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South', 6),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East', 7),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North', 8),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West', 9),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East', 10),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South', 1),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North', 2),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West', 3),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South', 4),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East', 5),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North', 6),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South', 7),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East', 8),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West', 9),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North', 10);

--7 Каков общий доход, полученный от всех продаж?
select sum(QuantitySold*UnitPrice) as total_Price  from Sales
--8
select avg(UnitPrice) AverageUnitPrice  from Sales
--9
SELECT COUNT(*) AS TotalSales FROM Sales
--10  Каково наибольшее количество единиц, проданных за одну транзакцию?
select top 3 * from Sales
order by QuantitySold desc
--11  Сколько товаров было продано в каждой категории?
select Category,sum(QuantitySold)  total_orders from Sales
group by Category
--12  Каков общий доход для каждого региона?
select Region,sum(QuantitySold * UnitPrice)  total_price from Sales
group by Region
--13  Какой продукт принес наибольший общий доход?
select top 1 Product ,sum(QuantitySold) total_Quantity, sum(QuantitySold * UnitPrice)  total_price from Sales
group by Product
order by total_price desc
--14
select *,sum(QuantitySold*UnitPrice)over(order by saledate ) as RunningTotal from Sales
--15  Какой вклад вносит каждая категория в общий доход от продаж?
SELECT 
    Category,
    SUM(QuantitySold * UnitPrice) AS CategoryRevenue,
    SUM(QuantitySold * UnitPrice) * 1.0 / SUM(SUM(QuantitySold * UnitPrice)) OVER() AS Contribution
FROM Sales
GROUP BY Category;
--17
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);
INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');
--17  Показать все продажи вместе с соответствующими именами клиентов
select c.*,s.QuantitySold,s.UnitPrice from Customers c
 join Sales s on c.CustomerID=s.CustomerID
--18 Перечислите клиентов, которые не совершали никаких покупок
select c.*,s.UnitPrice from Customers c
left  join Sales s on c.CustomerID=s.CustomerID
where s.UnitPrice is null
--19  Вычислите общий доход, полученный от каждого клиента
select c.CustomerID,c.CustomerName,sum(QuantitySold) total_Quantity,sum(QuantitySold*UnitPrice) total_prise from Customers c
 join Sales s on c.CustomerID=s.CustomerID
 group by c.CustomerID,c.CustomerName
--20
SELECT TOP 1 c.CustomerID, c.CustomerName, SUM(s.QuantitySold * s.UnitPrice) AS TotalRevenue
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalRevenue DESC;
--21
SELECT c.CustomerID, c.CustomerName, SUM(s.QuantitySold * s.UnitPrice) AS TotalSales
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName;
--22
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);

select * from Products p
 join Sales s on p.ProductName = s.Product
where  s.QuantitySold > 0
--23
 SELECT TOP 1 ProductName, SellingPrice
FROM Products
ORDER BY SellingPrice DESC;
--24
WITH AvgPricePerCategory AS (
    SELECT Category, AVG(SellingPrice) AS AvgPrice
    FROM Products
    GROUP BY Category
)
SELECT p.ProductName, p.Category, p.SellingPrice
FROM Products p
JOIN AvgPricePerCategory a ON p.Category = a.Category
WHERE p.SellingPrice > a.AvgPrice;

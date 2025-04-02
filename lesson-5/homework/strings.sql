--1  Write a query that uses an alias to rename the ProductName column as Name in the Products table.
select [ProductName] as Name from Products

--2 Write a query that uses an alias to rename the Customers table as Client for easier reference.
SELECT * 
FROM Customers AS Client;

--3
SELECT ProductName 
FROM Products 
UNION 
SELECT ProductName 
FROM Products_Discontinued;

--4
SELECT ProductName 
FROM Products 
INTERSECT  
SELECT ProductName 
FROM Products_Discontinued;

--5
SELECT ProductID, ProductName, Price, Quantity 
FROM Products 
UNION ALL  
SELECT ProductID, ProductName, Price, Quantity 
FROM Orders;

--6
SELECT DISTINCT CustomerName, Country 
FROM Customers;

--7
SELECT ProductName, Price,  
       CASE  
           WHEN Price > 100 THEN 'High'  
           ELSE 'Low'  
       END AS PriceCategory  
FROM Products;

--8
SELECT Country, COUNT(*) AS EmployeeCount  
FROM Employees  
WHERE Department = 'Sales'  
GROUP BY Country;

--9
SELECT Category, COUNT(ProductID) AS ProductCount  
FROM Products  
GROUP BY Category;

--10
SELECT ProductName, Stock,  
       IIF(Stock > 100, 'Yes', 'No') AS InStock  
FROM Products;

--1
SELECT o.OrderID, o.OrderDate, c.CustomerName AS ClientName, o.TotalAmount  
FROM Orders AS o  
INNER JOIN Customers AS c  
ON o.CustomerID = c.CustomerID;

--2
SELECT ProductName 
FROM Products 
UNION 
SELECT ProductName 
FROM OutOfStock;
--3
SELECT ProductName 
FROM Products 
EXCEPT  
SELECT ProductName 
FROM DiscontinuedProducts;
--4
SELECT c.CustomerName, 
       CASE 
           WHEN COUNT(o.OrderID) > 5 THEN 'Eligible' 
           ELSE 'Not Eligible' 
       END AS EligibilityStatus
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
--5
SELECT ProductName, Price,  
       IIF(Price > 100, 'Expensive', 'Affordable') AS PriceCategory  
FROM Products;
--6
SELECT CustomerID, COUNT(OrderID) AS OrderCount  
FROM Orders  
GROUP BY CustomerID;
--7 Write a query to find employees in the Employees table who have either Age < 25 or Salary > 6000.
SELECT EmployeeID, Name, Age, Salary  
FROM Employees  
WHERE Age < 25 OR Salary > 6000;
--8
SELECT Region, SUM(SalesAmount) AS TotalSales  
FROM Sales  
GROUP BY Region;
--9
SELECT c.CustomerID, c.CustomerName, o.OrderID, 
       o.OrderDate AS OrderPlacedDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
--10
UPDATE Employees  
SET Salary = IF(Department = 'HR', Salary * 1.10, Salary)  
WHERE Department = 'HR';

--1
SELECT ProductID, SUM(Amount) AS TotalAmount
FROM (
    SELECT ProductID, SalesAmount AS Amount FROM Sales
    UNION ALL
    SELECT ProductID, -ReturnAmount AS Amount FROM Returns
) AS CombinedData
GROUP BY ProductID;

--2
SELECT ProductName  
FROM Products  
INTERSECT  
SELECT ProductName  
FROM DiscontinuedProducts;

--3
SELECT CustomerID, TotalSales,
       CASE 
           WHEN TotalSales > 10000 THEN 'Top Tier'
           WHEN TotalSales BETWEEN 5000 AND 10000 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SalesTier
FROM Sales;

--4
--5
SELECT CustomerID
FROM Orders
EXCEPT
SELECT CustomerID
FROM Invoices;

--6
SELECT CustomerID, ProductID, Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID, ProductID, Region;

--7
SELECT ProductID, Quantity,
       CASE 
           WHEN Quantity >= 100 THEN '20% Discount'
           WHEN Quantity BETWEEN 50 AND 99 THEN '10% Discount'
           WHEN Quantity BETWEEN 20 AND 49 THEN '5% Discount'
           ELSE 'No Discount'
       END AS Discount
FROM Orders;
--8
SELECT p.ProductID, p.ProductName, p.InStockStatus
FROM Products p
INNER JOIN Inventory i ON p.ProductID = i.ProductID
WHERE p.InStockStatus = 'In Stock'

UNION

SELECT dp.ProductID, dp.ProductName, 'Not In Stock' AS InStockStatus
FROM DiscontinuedProducts dp
INNER JOIN Inventory i ON dp.ProductID = i.ProductID
WHERE dp.ProductID NOT IN (SELECT ProductID FROM Products);
--9
SELECT ProductID, ProductName, Stock,
       IIF(Stock > 0, 'Available', 'Out of Stock') AS StockStatus
FROM Products;
--10
SELECT CustomerID
FROM Customers
EXCEPT
SELECT CustomerID
FROM VIP_Customers;

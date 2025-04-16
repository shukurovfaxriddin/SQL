--1. Find the minimum price of a product in the Products table

SELECT MIN(Price) AS MinPrice
FROM Products;
--2. Find the maximum salary from the Employees table

SELECT MAX(Salary) AS MaxSalary
FROM Employees;
--3. Count the number of rows in the Customers table

SELECT COUNT(*) AS TotalCustomers
FROM Customers;
--4. Count the number of unique product categories

SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products;
--5. Find the total sales amount for product with ID = 7

SELECT SUM(SalesAmount) AS TotalSales
FROM Sales
WHERE ProductID = 7;
--6. Calculate average age of employees

SELECT AVG(Age) AS AvgAge
FROM Employees;
--7. Count the number of employees in each department

SELECT DeptID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;
--8. Show min and max price of products grouped by category

SELECT Category, 
       MIN(Price) AS MinPrice, 
       MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;
--9. Calculate total sales per customer

SELECT CustomerID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;
--10. Filter departments having more than 5 employees
OUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;

--
--1. Total and average sales for each product category

SELECT 
    p.Category,
    SUM(s.SalesAmount) AS TotalSales,
    AVG(s.SalesAmount) AS AvgSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;
--2. Count employees in the ‘HR’ department

SELECT COUNT(EmpID) AS HR_EmployeeCount
FROM Employees
WHERE Department = 'HR';
--3. Highest and lowest salary by department

SELECT 
    DeptID,
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DeptID;
--4. Average salary per department

SELECT 
    DeptID,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;
--5. AVG salary and COUNT of employees per department

SELECT 
    DeptID,
    AVG(Salary) AS AvgSalary,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;
--6. Product categories with AVG price > 400

SELECT 
    Category,
    AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
--7. Total sales for each year

SELECT 
    YEAR(SaleDate) AS SalesYear,
    SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);
--8. Customers with at least 3 orders

SELECT 
    CustomerID,
    COUNT(*) AS OrderCount
FROM Sales
GROUP BY CustomerID
HAVING COUNT(*) >= 3;
--9. Departments with total salary expenses > 500,000

SELECT 
    DeptID,
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DeptID
HAVING SUM(Salary) > 500000;



--
--1. AVG sales for each product category, filter AVG > 200

SELECT 
    p.Category,
    AVG(s.SalesAmount) AS AvgSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category
HAVING AVG(s.SalesAmount) > 200;
--2. SUM sales per Customer, filter SUM > 1500

SELECT 
    CustomerID,
    SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SalesAmount) > 1500;
--3. SUM and AVG salary per department, filter AVG > 65000

SELECT 
    DeptID,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 65000;
--4. MAX and MIN order value per customer, exclude MAX < 50

SELECT 
    CustomerID,
    MAX(SalesAmount) AS MaxOrder,
    MIN(SalesAmount) AS MinOrder
FROM Sales
GROUP BY CustomerID
HAVING MAX(SalesAmount) >= 50;
Agar siz barcha xaridlar ichidan har bir mijoz uchun buyurtma qiymatini ko‘rsatayotgan bo‘lsangiz.

--5. Total sales and distinct products per month, filter > 8 products

SELECT 
    MONTH(SaleDate) AS SaleMonth,
    SUM(SalesAmount) AS TotalSales,
    COUNT(DISTINCT ProductID) AS DistinctProducts
FROM Sales
GROUP BY MONTH(SaleDate)
HAVING COUNT(DISTINCT ProductID) > 8;
--6. MIN and MAX order quantity per year (from Orders table)

SELECT 
    YEAR(OrderDate) AS OrderYear,
    MIN(OrderQuantity) AS MinQty,
    MAX(OrderQuantity) AS MaxQty
FROM Orders
GROUP BY YEAR(OrderDate);

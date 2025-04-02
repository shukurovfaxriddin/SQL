--task 1 
--1 Write a query to select the top 5 employees from the Employees table.
select top 5 * from employees 

--2 Use SELECT DISTINCT to select unique ProductName values from the Products table.
select DISTINCT productID ,ProductName from Products

--3 Write a query that filters the Products table to show products with Price > 100.
select * from Products 
where Price > 100
Customers
--4 Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
select * from [dbo].[Customers]
where firstName like 'A%'

--5 Order the results of a Products query by Price in ascending order.
select * from [dbo].[Products]
order by [Price]

--6 Write a query that uses the WHERE clause to filter for employees with Salary >= 5000 and Department = 'HR'.
select * from [dbo].[Employees] , [dbo].[Departments]
where [Employees].[DepartmentID] = [Departments].[DepartmentID] and [Employees].Salary >= 5000 and 
[Departments].[DepartmentName] = 'Human Resources'

--7 Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".
SELECT [CustomerID], CONCAT(FirstName, ' ', LastName) AS FullName ,
       ISNULL(Email, 'noemail@example.com') AS Email 
FROM [Customers];

--8 Write a query that shows all products with Price BETWEEN 50 AND 100.
select * from products
where  Price BETWEEN 50 AND 100

--9 Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
select DISTINCT Category , ProductName from Products

--10 Order the results by ProductName in descending order.
select * from Products
order by ProductName DESC

--1 Write a query to select the top 10 products from the Products table, ordered by Price DESC.
select top 10 * from Products
order by  Price DESC

--2 Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
select [CustomerID], COALESCE(FirstName, LastName) AS Name from [dbo].[Customers]

--3 Write a query that selects distinct Category and Price from the Products table.
select distinct Category,Price from Products

--4 Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
select * from Employees e
join [Departments] d  on e.[EmployeeID] = d.[DepartmentID]
where (e.age between 30 and 40) or (d. [DepartmentName]= 'Marketing')

--5 Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
select * from Employees 
order by Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

--6 Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
SELECT * 
FROM Products 
WHERE Price <= 1000 
  AND [StockQuantity] > 50 
ORDER BY [StockQuantity] ;

--7 Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
select * from Products
where ProductName like '%e%'

-- 8 Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
select * from employees e 
join [dbo].[Departments] d on e.[EmployeeID] = d.[DepartmentID] 
WHERE d.[DepartmentName] IN ('HR', 'IT', 'Finance');

--9 Write a query that uses the ANY operator to find employees who earn more than the average salary of all employees.
SELECT * 
FROM Employees 
WHERE Salary > ANY (SELECT AVG(Salary) FROM Employees);

--10 Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
SELECT * 
FROM Customers 
ORDER BY City ASC, PostalCode DESC;

--1 Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
SELECT TOP(10) * 
FROM Products 
ORDER BY  [StockQuantity] DESC;

--2 Use COALESCE to combine FirstName and LastName into one column named FullName in the Employees table.
select [CustomerID], COALESCE(FirstName, LastName) AS Name from [dbo].[Customers]

--3 Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
select distinct Category , ProductName , Price from Products
where price > 50

--4 Write a query that selects products whose Price is within 10% of the average price in the Products table.
SELECT * 
FROM Products 
WHERE Price BETWEEN 
    (SELECT AVG(Price) * 0.9 FROM Products) 
    AND 
    (SELECT AVG(Price) * 1.1 FROM Products);

--5 Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
 SELECT * 
FROM Employees 
WHERE Age < 30 
AND Department IN ('HR', 'IT');

 -- 6 Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
 SELECT * 
FROM Customers 
WHERE Email LIKE '%@gmail.com';

--7 Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
SELECT e.* ,d.[DepartmentName]
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > ALL (
    SELECT e2.Salary 
    FROM Employees e2
    JOIN Departments d2 ON e2.DepartmentID = d2.DepartmentID
    WHERE d2.DepartmentName = 'Sales'
);

--8 Use ORDER BY with OFFSET-FETCH to show employees with the highest salaries, displaying 10 employees at a time (pagination).
select * from employees
order by salary 
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--9  Write a query that filters the Orders table for orders placed in the last 30 days using BETWEEN and CURRENT_DATE.
SELECT * 
FROM Orders 
WHERE OrderDate BETWEEN DATEADD(DAY, -30, GETDATE()) AND GETDATE();

--10 
SELECT * 
FROM Employees e
WHERE Salary > ANY (
    SELECT AVG(Salary) 
    FROM Employees 
    GROUP BY DepartmentID
);

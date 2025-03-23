--homework 10 
--task 1/1. Write a query to perform an INNER JOIN between Orders and Customers using AND in the ON clause to filter orders placed after 2022.
select o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, FirstName + ' ' + LastName AS FullName 
from Orders o
join Customers c on o.CustomerID=c.CustomerID AND year(o.OrderDate)>2022

-- 2. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department.
select e.EmployeeID,e.Name,d.DepartmentName
from Employees e
join Departments d on e.DepartmentID=d.DepartmentID AND (d.DepartmentName = 'Sales' OR d.DepartmentName = 'Marketing');

--3. Write a query to demonstrate a CROSS APPLY between Departments and a derived table that shows their Employees, top-performing employee (e.g., top 1 Employee who gets the most salary).
SELECT d.DepartmentID, d.DepartmentName, e.EmployeeID, e.name, e.Salary
FROM Departments d
CROSS APPLY  (  
   SELECT TOP 1 EmployeeID, name, Salary
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
    ORDER BY e.Salary DESC) e ;
--4. Write a query to join Customers and Orders using AND in the ON clause to filter customers who have placed orders in 2023 and who lives in the USA.
select c.CustomerID, FirstName + ' ' + LastName AS FullName , c.Country, o.OrderID, o.OrderDate
from Customers c
join Orders o on c.CustomerID=o.CustomerID AND YEAR(o.OrderDate) = 2023  and c.Country = 'USA' ;

--5. Write a query to join a derived table (SELECT CustomerID, COUNT(*) FROM Orders GROUP BY CustomerID) with the Customers table to show the number of orders per customer.
SELECT c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, COALESCE(o.TotalOrders, 0) AS TotalOrders
FROM Customers c
LEFT JOIN (
    SELECT CustomerID, COUNT(*) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
) o ON c.CustomerID = o.CustomerID;

--6. Write a query to join Products and Suppliers using OR in the ON clause to show products supplied by either 'Gadget Supplies' or 'Clothing Mart'.
SELECT c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, COALESCE(o.TotalOrders, 0) AS TotalOrders
FROM Customers c
LEFT JOIN (
    SELECT CustomerID, COUNT(*) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
) o ON c.CustomerID = o.CustomerID;

--6. Write a query to join Products and Suppliers using OR in the ON clause to show products supplied by either 'Gadget Supplies' or 'Clothing Mart'.
select p.ProductID,p.ProductName,p.Price,s.SupplierID,s.SupplierName
from Products p
join Suppliers s on p.SupplierID=s.SupplierID AND s.SupplierName = 'Gadget Supplies' or s.SupplierName = 'Clothing Mart';

--7. Write a query to demonstrate the use of OUTER APPLY between Customers and a derived table that returns each Customers''s most recent order.
SELECT  c.CustomerID, 
    c.FirstName + ' ' + c.LastName AS FullName, 
    o.OrderID, 
    o.OrderDate, 
    o.TotalAmount
FROM Customers c
OUTER APPLY (
    SELECT TOP 1 o.OrderID, o.OrderDate, o.TotalAmount
    FROM Orders o
    WHERE c.CustomerID = o.CustomerID
	ORDER BY o.OrderDate DESC
) o;

--8. Write a query that uses the AND logical operator in the ON clause to join Orders and Customers, and filter customers who placed an order with a total amount greater than 500.
select   c.CustomerID, 
    c.FirstName + ' ' + c.LastName AS FullName,
    o.OrderID, 
    o.OrderDate, 
    o.TotalAmount from Orders o 
 join Customers c on o.CustomerID = c.CustomerID and o.TotalAmount > 500 ORDER BY c.CustomerID 

 --9. Write a query that uses the OR logical operator in the ON clause to join Products and Sales to filter products that were either sold in 2022 or the SaleAmount is more than 400.
 select   p.ProductID, 
    p.ProductName, 
    s.SaleID, 
    s.SaleDate, 
    s.SaleAmount from Products p 
 join Sales s on p.ProductID = s.ProductID and year(s.SaleDate) = 2022 or p.StockQuantity > 400
 ORDER BY p.ProductID

 --10. Write a query to join a derived table that calculates the total sales (SELECT ProductID, SUM(Amount) FROM Sales GROUP BY ProductID) with the Products table to show total sales for each product.

SELECT p.ProductID, p.ProductName, COALESCE(s.TotalSales, 0) AS TotalSales
FROM Products p
LEFT JOIN (
    SELECT ProductID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
) s ON p.ProductID = s.ProductID;

--11. Write a query to join Employees and Departments using AND in the ON clause to filter employees who belong to the 'HR' department and whose salary is greater than 50000.
select e.EmployeeID, e.name, e.Salary, d.DepartmentName from Employees e
INNER  join  Departments d on e.DepartmentID = d.DepartmentID  AND d.DepartmentName = 'Human Resources' 
and e.Salary > '50000';

--12. Write a query to use OUTER APPLY to return all customers along with their most recent orders, including customers who have not placed any orders.

SELECT c.CustomerID,  c.FirstName + ' ' + c.LastName AS FullName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
OUTER APPLY 
(
    SELECT TOP 1 o.OrderID, o.OrderDate, o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
    ORDER BY o.OrderDate DESC
) o;

--13. Write a query to join Products and Sales using AND in the ON clause to filter products that were sold in 2023 and StockQuantity is more than 50.
 select   p.ProductID, 
    p.ProductName, 
    s.SaleID, 
    s.SaleDate, 
    s.SaleAmount,p.StockQuantity from Products p 
 join Sales s on p.ProductID = s.ProductID and year(s.SaleDate) = 2023 and p.StockQuantity > 50
 ORDER BY p.ProductID,s.SaleID

 --14. Write a query to join Employees and Departments using OR in the ON clause to show employees who either belong to the 'Sales' department or hired after 2020.
 select   e.EmployeeID, e.name, e.HireDate, d.DepartmentName from Employees e 
 join Departments d on e.DepartmentID = d.DepartmentID and d.DepartmentName ='Sales' 
 or year(e.HireDate) > 2020

--15. Write a query to demonstrate the use of the AND logical operator in the ON clause between Orders and Customers, and filter orders made by customers who are located in 'USA' and lives in an address that starts with 4 digits.
 select  o.OrderID, o.OrderDate, c.CustomerID,c.FirstName + ' ' + c.LastName AS FullName, c.Address, c.Country from Orders o 
 join Customers c on o.CustomerID = c.CustomerID and c.Country = 'USA' 
 AND c.Address LIKE '[0-9][0-9][0-9][0-9]%'

 --16. Write a query to demonstrate the use of OR in the ON clause when joining Products and Sales to show products that are either part of the 'Electronics' category or Sale amount is greater than 350.
  SELECT p.ProductID, p.ProductName, p.Category, s.SaleID, s.SaleAmount
FROM Products p
 JOIN Sales s 
ON p.ProductID = s.ProductID 
join Categories c on p.Category = c.CategoryID
OR c.CategoryName = 'Electronics' 
OR s.SaleAmount > 350;

--17. Write a query to join a derived table that returns a count of products per category (SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID) with the Categories table to show the count of products in each category.
SELECT c.CategoryID, c.CategoryName, p.ProductCount
FROM Categories c
LEFT JOIN (
    SELECT Category, COUNT(*) AS ProductCount
    FROM Products
    GROUP BY Category
) p ON c.CategoryID = p.Category;

--18. Write a query to join Orders and Customers using AND in the ON clause to show orders where the customer is from 'Los Angeles' and the order amount is greater than 300.
 select o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, c.City  from Orders o 
 join Customers c on o.CustomerID = c.CustomerID and c.City = 'Los Angeles' and o.TotalAmount > 300

 --19. Write a query to join Employees and Departments using a complex OR condition in the ON clause to show employees who are in the 'HR' or 'Finance' department, or have at least 4 wowels in their name.
  select   * from Employees e 
 join Departments d on e.DepartmentID = d.DepartmentID and d.DepartmentName IN ('HR', 'Finance') 
   OR (
        (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'a', ''))) +
        (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'e', ''))) +
        (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'i', ''))) +
        (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'o', ''))) +
        (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'u', ''))) >= 4
   );

   --20. Write a query to join Sales and Products using AND in the ON clause to filter products that have both a sales quantity greater than 100 and a price above 500.
    select  * from Sales s 
 join Products p on s.ProductID = p.ProductID and s.SaleAmount  > 100 and p.Price > 500

 --21. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department, and with a salary greater than 60000.
     select  e.EmployeeID, e.Name, e.Salary, d.DepartmentName from Employees e 
 join Departments d on e.DepartmentID = d.DepartmentID and d.DepartmentName in ('Sales' , 'Marketing') and e.Salary > 60000



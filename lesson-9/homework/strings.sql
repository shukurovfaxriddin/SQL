
--1
SELECT e.EmployeeID,e.Name,e.Salary,d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
where e.Salary > 5000

--2
SELECT o.OrderID,o.CustomerID,o.OrderDate,o.Quantity,o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
where year(o.OrderDate) = '2023'

--3
SELECT e.EmployeeID, e.Name, d.DepartmentID, d.DepartmentName
FROM Employees e
left JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NOT NULL;

--4
SELECT s.SupplierID,s.SupplierName,p.ProductID,p.ProductName
FROM Products p
RIGHT JOIN Suppliers s ON p.SupplierID = s.SupplierID

--5
select o.OrderID, o.CustomerID, o.OrderDate, 
       p.PaymentID, p.Amount, p.PaymentDate
from Orders o 
full join Payments  p on o.OrderID = p.OrderID
WHERE o.OrderID IS NOT NULL and p.PaymentID IS NOT NULL;

--6
SELECT e1.EmployeeID, 
       e1.Name , 
       e2.ManagerID , 
       e2.Name as ManagerName
FROM Employees e1
 JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID;

 --7 Write a query to join Students and Courses using INNER JOIN, and use the WHERE clause to show only students enrolled in 'Math 101'.(USE ENROLLMENTS TABLE AS A BRIDGE TABLE)
SELECT s.StudentID, s.Name, c.CourseID, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';

--8. Write a query that uses INNER JOIN between Customers and Orders, and filters the result with a WHERE clause to show customers who have placed more than 3 items at once.
SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 3;

--9. Write a query to join Employees and Departments using a LEFT OUTER JOIN and use the WHERE clause to filter employees in the 'HR' department(Human Resources).
SELECT e.EmployeeID, e.Name, d.DepartmentID, d.DepartmentName
FROM Employees e
left JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';

--10 Write a query to perform an INNER JOIN between Employees and Departments, and use the HAVING clause to show employees who belong to departments with more than 10 employees.
SELECT e.DepartmentID, d.DepartmentName, COUNT(e.DepartmentID) AS EmployeeCount
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID, d.DepartmentName
HAVING COUNT(e.DepartmentID) > 10;

--11. Write a query to perform a LEFT OUTER JOIN between Products and Sales, and use the WHERE clause to filter only products with no sales.
SELECT p.ProductID,p.ProductName,p.Price,s.SaleID,s.SaleAmount
FROM Products p
left JOIN Sales s ON p.ProductID = s.ProductID
where s.ProductID IS NULL

--12. Write a query to perform a RIGHT OUTER JOIN between Customers and Orders, and filter the result using the HAVING clause to show only customers who have placed at least one order.
SELECT c.CustomerID,c.FirstName,o.OrderDate,COUNT(o.OrderID) AS TotalOrders,o.Quantity,o.TotalAmount
FROM Customers c
RIGHT  JOIN Orders o ON c.CustomerID = o.CustomerID
group by c.CustomerID, c.FirstName,o.OrderDate,o.Quantity,o.TotalAmount
HAVING COUNT(o.OrderID) >= 1;

--13. Write a query that uses a FULL OUTER JOIN between Employees and Departments, and filters out the results where the department is NULL.
SELECT e.DepartmentID, d.DepartmentName
FROM Employees e
full join Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IS  NULL 

--14. Write a query to perform a SELF JOIN on the Employees table to show employees who report to the same manager.
select  e.EmployeeID,e.Name,isnull(b.Name,'CEO') as ManagerName
from Employees e
 left join Employees b on e.ManagerID = b.EmployeeID

--15 Write a query to perform a LEFT OUTER JOIN between Orders and Customers, followed by a WHERE clause to filter orders placed in the year 2022.
SELECT c.CustomerID, c.FirstName,o.OrderID, o.OrderDate, o.TotalAmount
FROM Orders o
LEFT OUTER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;

--16 Write a query to use the ON clause with INNER JOIN to return only the employees from the 'Sales' department whose salary is greater than 5000.
SELECT e.EmployeeID, e.name, e.Salary, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' AND e.Salary > 5000;

--17 Write a query to join Employees and Departments using INNER JOIN, and use WHERE to filter employees whose department''s DepartmentName is 'IT'.
SELECT e.EmployeeID, e.name, e.Salary, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT'  ;

--18 Write a query to join Orders and Payments using a FULL OUTER JOIN, and use the WHERE clause to show only the orders that have corresponding payments.
SELECT o.OrderID, o.CustomerID, o.OrderDate, p.PaymentID, p.Amount, p.PaymentDate
FROM Orders o
FULL OUTER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NOT NULL;

--19. Write a query to perform a LEFT OUTER JOIN between Products and Orders, and use the WHERE clause to show products that have no orders.
SELECT p.ProductID, p.ProductName, p.Price, o.OrderID
FROM Products p
FULL OUTER JOIN Orders o ON p.ProductID = o.ProductID
WHERE p.ProductID  is  NULL  or o.OrderID  is  NULL;

--20 Write a query using a JOIN between Employees and Departments, followed by a WHERE clause to show employees whose salary is higher than the average salary of all employees.
SELECT e.EmployeeID,e.Name,e.Salary,d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > (SELECT AVG(Salary) FROM Employees)

--21. Write a query to perform a LEFT OUTER JOIN between Orders and Payments, and use the WHERE clause to return all orders placed before 2020 that have not been paid yet.
SELECT o.OrderID,o.OrderDate,o.Quantity,o.TotalAmount,p.PaymentDate,p.PaymentMethod
FROM Orders o
LEFT OUTER JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.OrderDate > '2020-01-01' AND p.PaymentID IS NULL;

--22. Write a query to perform a FULL OUTER JOIN between Products and Categories, and use the WHERE clause to filter only products that have no category assigned.
SELECT *
FROM Products p
FULL OUTER JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryID is null

--23. Write a query to perform a SELF JOIN on the Employees table to find employees who report to the same manager and earn more than 5000.
select  e.EmployeeID,e.Name,isnull(b.Name,'CEO') as ManagerName,e.Salary
from Employees e
  join Employees b on e.ManagerID = b.EmployeeID
 where e.Salary>5000

 --24. Write a query to join Employees and Departments using a RIGHT OUTER JOIN, and use the WHERE clause to show employees from departments where the department name starts with ‘M’.
 SELECT e.EmployeeID, e.Name, e.Salary, d.DepartmentID, d.DepartmentName
FROM Employees e
right JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName like 'M%'
 
 --25. Write a query to join Products and Sales, and use WHERE to filter only sales greater than 1000.
 select p.ProductID,p.ProductName,p.Price,s.SaleID,s.SaleDate,s.SaleAmount
from Products p
  join Sales s on p.ProductID = s.ProductID
 where p.Price > 1000 or s.SaleAmount > 1000;

 --26. Write a query to perform a LEFT OUTER JOIN between Students and Courses, and use the WHERE clause to show only students who have not enrolled in 'Math 101'.(USE ENROLLMENTS TABLE AS A BRIDGE TABLE)
SELECT s.StudentID, s.name,c.CourseID, c.CourseName
FROM Students s
LEFT OUTER JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT OUTER JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IS NULL OR c.CourseName != 'Math 101';

--27. Write a query using a FULL OUTER JOIN between Orders and Payments, followed by a WHERE clause to filter out the orders with no payment.
 SELECT o.OrderID, o.OrderDate, o.TotalAmount, p.PaymentID, p.PaymentDate, p.Amount
FROM Orders o
full OUTER JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.ProductID is null 

--28. Write a query to join Products and Categories using an INNER JOIN, and use the WHERE clause to filter products that belong to either 'Electronics' or 'Furniture'.
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p
 JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture')
 

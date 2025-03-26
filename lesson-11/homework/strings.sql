--1
select e.Name AS EmployeeName, d.DepartmentName 
from Employees e
left join Departments d on e.DepartmentID = d.DepartmentID 

--2
select s.StudentID,s.StudentName, COALESCE(c.ClassName, 'No Class') AS ClassName
from Students  s
left join Classes c on s.ClassID = c.ClassID
order by c.ClassName desc

--3
select c.CustomerID,c.CustomerName,COALESCE(CAST(o.OrderID AS VARCHAR), 'No Order') AS OrderID ,
COALESCE(CAST(o.OrderDate AS VARCHAR), 'No Order') AS OrderDate
from customers  c
left join Orders o on c.CustomerID = o.CustomerID

--4
SELECT 
    p.ProductID, 
    p.ProductName, 
    COALESCE(CAST(s.SaleID AS VARCHAR), 'No Sale') AS SaleID,
    COALESCE(CAST(s.[Quantity] AS VARCHAR), 'No Sale') AS [Quantity]
FROM Products p
FULL OUTER JOIN Sales s ON p.ProductID = s.ProductID;

--5
select emp.EmployeeID ,
       emp.name as emp_name,
	   COALESCE(CAST(emp.ManagerID AS VARCHAR), 'Boss') AS ManagerID,
	   ISNULL(man.Name, 'No Manager') AS Manager_name
from  Employees emp
left join Employees man on emp.ManagerID=man.EmployeeID

--6
SELECT 
    c.ColorName, 
    s.SizeName
FROM Colors c
CROSS JOIN Sizes s

--7
select m.MovieID,m.Title,m.ReleaseYear,a.ActorID,a.Name from Movies m 
 join Actors a on m.MovieID = a.MovieID 
where m.ReleaseYear < '2015'

--8
select o.OrderID,o.OrderDate,c.CustomerID,c.CustomerName,od.ProductID from Orders o
join Customers  c on o.CustomerID=c.CustomerID
join OrderDetails od on od.OrderID = o.OrderID 

--9
SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(s.Quantity ) AS TotalRevenue,AVG(p.Price) AS AveragePrice
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName


use [homework 8]
--task 1 / 1
select c.CustomerName,o.[OrderDate] from [dbo].[Customers] c
inner join Orders o on c.[CustomerID] = o.[OrderID];

--2
select * from EmployeeDepartments ed
join [dbo].[Employees] e on ed.EmployeeID = e.EmployeeID

--3
select p.ProductName,c.CategoryName from [Products] p 
join Categories c on p.ProductID = c.CategoryID

--4
 select c.CustomerID,c.CustomerName,o.OrderDate from Customers c
left join orders o on c.CustomerID = o.[CustomerID]
order by c.CustomerID 

--5
create table OrderDetails (OrderID int IDENTITY(1,1), ProductID int
PRIMARY KEY (orderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID))

	INSERT into  OrderDetails (ProductID) VALUES
	(1)	,
	(2)	,
	(3)	,
	(4)	,
	(5)	,
	(6)	,
	(7)	,
	(8)	,
	(9)	,
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40);
select   od.OrderID, 
    o.OrderDate, 
    od.ProductID, 
    p.ProductName, 
    o.Quantity from orders o
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID

--6
SELECT 
    p.ProductID, 
    p.ProductName, 
    c.CategoryID, 
    c.CategoryName
FROM Products p
CROSS JOIN Categories c;

--7
select c.CustomerID ,c.CustomerName,o.[Quantity],c.Country,o.[OrderDate] from Customers  c 
join Orders  o on c.CustomerID = o.CustomerID

--8
SELECT 
     p.ProductID, 
    p.ProductName,
	p.price,
    o.OrderID, 
    o.[OrderDate]
FROM Products p
CROSS JOIN orders o
where p.price > 500


--9
select e.Name,ed.DepartmentName from Employees e
join EmployeeDepartments ed on e.EmployeeID = ed.EmployeeID

--10
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    o.CustomerID AS OrderCustomerID
FROM Customers c
JOIN Orders o 
    ON c.CustomerID <> o.CustomerID;

	--task 2 / 1
SELECT 
    c.CustomerName, 
    o.quantity AS total_number_of_orders, o .[OrderDate],COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
	GROUP BY c.[CustomerName];

	SELECT 
    c.CustomerName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

	--2

SELECT 
s.ID as StudentsID , 
c.ID

FROM [Students] s
CROSS JOIN [Courses] c

--3
SELECT *
FROM Employees e
CROSS JOIN Departments1  d
where e.Salary > 5000

--4
SELECT 
    ed.EmployeeName, 
   
    ed.DepartmentName,
   e.salary, e.HireDate
FROM Employees e
INNER JOIN [EmployeeDepartments] ed ON e.EmployeeID = ed.EmployeeID;

--5

--6
SELECT p.productname , p.Price, s.SaleDate , o.OrderDate, o.Quantity
FROM Products  p
LEFT JOIN  Sales s ON p.ProductID = s.ProductID
LEFT JOIN [Orders] o ON s.ProductID = o.ProductID;

--7
SELECT e.EmployeeID,e.Name,d.DepartmentID,d.DepartmentName,e.Salary
FROM Employees e
INNER JOIN Departments1 d ON e.DepartmentID = d.DepartmentID
where e.Salary > 4000 and d.DepartmentName like 'H%R%'

--8
SELECT e.EmployeeID,e.Name,d.DepartmentID,d.DepartmentName,e.Salary
FROM Employees e
INNER JOIN Departments1 d ON e.DepartmentID  >=  d.DepartmentID
where e.Salary > 4000 and d.DepartmentName like 'H%R%'

--9

--10

--task 3 / 1
SELECT     p.ProductID, 
    p.ProductName, 
    c.CategoryName
FROM Products  p
INNER JOIN Categories  c ON p.ProductID  =  c.CategoryID
WHERE c.CategoryName <> 'Electronics';

--3
SELECT o.OrderID,p.ProductID,p.ProductName,o.OrderDate,p.Price
FROM Orders  o
CROSS JOIN Products  p
where p.Price > 100

--4
SELECT    *
FROM Employees   e
INNER JOIN Departments1   d ON e.DepartmentID  =  d.DepartmentID
WHERE e.HireDate <= DATEADD(YEAR, -5, GETDATE());

--5
SELECT 
    e.EmployeeID, 
    e.name, 
    d.DepartmentID, 
    d.DepartmentName
FROM Employees e
INNER JOIN Departments1 d 
    ON e.DepartmentID = d.DepartmentID;

	--6

	--7
	SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) >= 10;

--8

--9 
SELECT 
    e.EmployeeID, 
    e.EmployeeName, 
    d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Marketing';

--10
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    o.OrderID, 
    o.OrderDate
FROM Customers c
JOIN Orders o 
ON c.CustomerID <= o.OrderID;

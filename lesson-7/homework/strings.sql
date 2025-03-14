--easy /1
use [homework 4/5]

select min(Price) as minPrice  from Products1

--2
select max(Salary) as maxSalary  from Employees

--3
select count(*) as countrow  from [Customers1]

--4
select count(distinct Category) as uniqcategories  from Products1

--5
select ProductID , sum(SaleAmount) as totalSales from [dbo].[Sales]
group by ProductID

--6
select  avg(age) as ageEmployees  from Employees

--7
select DepartmentName ,count(EmployeeName) as countDepartment  from [dbo].[EmployeeDepartments]
group by DepartmentName

--8
select Category ,max(Price) as maxPrice ,min(Price) as minPrice  from [Products1]
group by Category

--9
select CustomerID ,sum(SaleAmount) as sumSaleAmount from [Sales]
group by CustomerID

--10
SELECT 
    DepartmentID, 
    COUNT(EmployeeID) AS NumberOfEmployees
FROM 
    Employees
GROUP BY 
    DepartmentID
HAVING 
    COUNT(EmployeeID) > 5;

	--task 2 / 1
  select ProductID ,sum(SaleAmount) as totalSales, avg(SaleAmount) as avgSales from [dbo].[Sales]
group by ProductID
select * from [Sales]

--2
select DepartmentName ,count(EmployeeName) as countEmployeeName from EmployeeDepartments
group by DepartmentName

--3 select *  from Employees
select DepartmentID ,max(Salary) as maxPrice ,min(Salary) as minPrice  from Employees
group by DepartmentID

--4
select DepartmentID ,avg(Salary) as avgSalary  from Employees
group by DepartmentID

--5
select DepartmentID ,avg(Salary) as avgSalary,count(Salary) as countSalary from Employees
group by DepartmentID

--6 select * from Products1
select Category,avg(price) as avgprice  from Products1
group by Category
having   avg(price) > 100;

--7 select * from Sales
select count(distinct ProductID) as uniqcategories  from Sales

--8
SELECT 
    YEAR(SaleDate) AS SalesYear, 
    SUM(SaleAmount) AS TotalSales
FROM 
    Sales
GROUP BY 
    YEAR(SaleDate)
ORDER BY 
    SalesYear;

	--9
	select Status ,count(distinct CustomerID) as countCustomerID from Orders1 
	group by Status

	--10
	SELECT 
    DepartmentID, sum(Salary) AS NumberOfEmployees
FROM  Employees
GROUP BY 
    DepartmentID
HAVING 
   sum(Salary) > 100000;

   
--task 3 /1
select ProductID ,avg(SaleAmount) as avgSaleAmount  from [dbo].[Sales]
group by ProductID
having avg(SaleAmount) > 200

--2
select DepartmentID ,sum(salary) as sumSaleAmount  from Employees
group by DepartmentID
having sum(salary) > 5000

--3
select DepartmentID ,sum(salary) as sumSaleAmount,avg(salary) as avgSaleAmount  from Employees
group by DepartmentID
having avg(salary) > 6000

--4 select * from Orders
select CustomerID, max(TotalAmount) as maxAmount,min(TotalAmount) as minAmount  from Orders
group by CustomerID
having max(TotalAmount) >= 50

--5
 
 --6 select * from [dbo].[Products1]
 select p.Category,p.ProductName, max(Quantity) as maxAmount,min(Quantity) as minAmount from Orders o
 join Products1 p on o.ProductID = p.ProductID
 group by p.Category , p.ProductName

 --7

 --8
 SELECT 
    ProductID, 
    Quarter, 
    SalesAmount
FROM 
    (SELECT ProductID, Q1, Q2, Q3, Q4 FROM Sales) s
UNPIVOT 
    (SalesAmount FOR Quarter IN (Q1, Q2, Q3, Q4)) AS unpvt;

	--9 select * from [dbo].[Products1]
SELECT 
    p.Category, 
    p.ProductName, 
    COUNT(o.TotalAmount) AS TotalOrders
FROM Orders o
JOIN Products1 p ON o.ProductID = p.ProductID
GROUP BY p.Category, p.ProductName
HAVING COUNT(o.TotalAmount) > 50;

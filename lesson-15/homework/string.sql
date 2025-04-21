-- 1. Create a numbers table using a recursive query
WITH Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1 FROM Numbers WHERE Number < 100
)
SELECT * FROM Numbers;

-- 2. Recursive doubling starting from 1
WITH Doubles AS (
    SELECT 1 AS Value
    UNION ALL
    SELECT Value * 2 FROM Doubles WHERE Value < 10000
)
SELECT * FROM Doubles;

-- 3. Total sales per employee using a derived table
SELECT e.EmployeeID, e.FirstName, e.LastName, dt.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM([SalesAmount]) AS TotalSales
    FROM  Sales
    GROUP BY EmployeeID
) dt ON e.EmployeeID = dt.EmployeeID;

-- 4. Average salary using CTE
WITH AvgSalCTE AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT * FROM AvgSalCTE;

-- 5. Highest sales for each product using a derived table
SELECT p.ProductID, p.ProductName, dt.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) dt ON p.ProductID = dt.ProductID;

-- 6. Employees who made more than 5 sales
WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS SalesCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.FirstName, e.LastName
FROM Employees e
JOIN SalesCount sc ON e.EmployeeID = sc.EmployeeID
WHERE sc.SalesCount > 5;--not need

-- 7. Products with sales greater than $500
WITH ProductSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductName, ps.TotalSales
FROM ProductSales ps
JOIN Products p ON ps.ProductID = p.ProductID
WHERE ps.TotalSales > 500;

-- 8. Employees with salaries above average
WITH AvgSalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT * FROM Employees
WHERE Salary > (SELECT AvgSalary FROM AvgSalaryCTE);

-- 9. Total number of products sold using derived table
SELECT SUM(CountPerProduct) AS TotalProductsSold
FROM (
    SELECT COUNT(*) AS CountPerProduct
    FROM Sales
    GROUP BY ProductID
) AS dt;

-- 10. Employees who have not made any sales
WITH SalesCounts AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.FirstName, e.LastName
FROM Employees e
LEFT JOIN SalesCounts sc ON e.EmployeeID = sc.EmployeeID
WHERE sc.SaleCount IS NULL;

-- Medium Tasks

-- 1. Factorials using recursion
WITH Factorial AS (
    SELECT 1 AS Number, 1 AS Fact
    UNION ALL
    SELECT Number + 1, Fact * (Number + 1)
    FROM Factorial
    WHERE Number < 10
)
SELECT * FROM Factorial;

-- 2. Fibonacci numbers
WITH Fibonacci AS (
    SELECT 1 AS n, 0 AS Fib1, 1 AS Fib2
    UNION ALL
    SELECT n + 1, Fib2, Fib1 + Fib2
    FROM Fibonacci
    WHERE n < 10
)
SELECT n, Fib1 AS Fibonacci
FROM Fibonacci;

-- 3. Split string into characters
WITH SplitString AS (
    SELECT 
        Id,
        1 AS Pos,
        SUBSTRING(String, 1, 1) AS Char
    FROM Example
    WHERE LEN(String) >= 1

    UNION ALL
    SELECT 
        s.Id,
        s.Pos + 1,
        SUBSTRING(e.String, s.Pos + 1, 1)
    FROM SplitString s
    JOIN Example e ON e.Id = s.Id
    WHERE s.Pos + 1 <= LEN(e.String)
)
SELECT * FROM SplitString
ORDER BY Id, Pos

-- 4. Rank employees by total sales
WITH SalesTotal AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.FirstName, e.LastName, st.TotalSales, RANK() OVER (ORDER BY st.TotalSales DESC) AS Rank
FROM SalesTotal st
JOIN Employees e ON st.EmployeeID = e.EmployeeID;

-- 5. Top 5 employees by order count
SELECT TOP 5 e.FirstName, e.LastName, dt.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) dt ON e.EmployeeID = dt.EmployeeID
ORDER BY dt.OrderCount DESC;

-- 6. Sales difference month over month
WITH MonthlySales AS (
    SELECT FORMAT(SaleDate, 'yyyy-MM') AS Month, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
SalesDiff AS (
    SELECT Month, TotalSales,
           LAG(TotalSales) OVER (ORDER BY Month) AS PrevMonthSales
    FROM MonthlySales
)
SELECT Month, TotalSales, PrevMonthSales, TotalSales - PrevMonthSales AS Diff
FROM SalesDiff;

-- 7. Sales per product category
SELECT p.CategoryID, SUM(s.SalesAmount) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.CategoryID;

-- 8. Rank products by sales in last year
WITH LastYearSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY ProductID
)
SELECT p.ProductName, lys.TotalSales, RANK() OVER (ORDER BY lys.TotalSales DESC) AS Rank
FROM LastYearSales lys
JOIN Products p ON lys.ProductID = p.ProductID;

-- 9. Employees with quarterly sales > $5000
SELECT *
FROM (
    SELECT EmployeeID, DATEPART(QUARTER, SaleDate) AS Quarter,
           SUM(SalesAmount) AS QuarterlySales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) dt
WHERE QuarterlySales > 5000;

-- 10. Top 3 employees by sales last month
SELECT TOP 3 e.FirstName, e.LastName, dt.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE MONTH(SaleDate) = MONTH(GETDATE()) - 1
    GROUP BY EmployeeID
) dt ON e.EmployeeID = dt.EmployeeID
ORDER BY dt.TotalSales DESC;

--1
CREATE FUNCTION dbo.GetIncreasingSequenceRows (@n INT)
RETURNS @ResultTable TABLE (
    SequenceNumber INT,
    Sequence VARCHAR(MAX)
)
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @seq VARCHAR(MAX) = '';

    WHILE @i <= @n
    BEGIN
        SET @seq = @seq + CAST(@i AS VARCHAR);
        INSERT INTO @ResultTable (SequenceNumber, Sequence)
        VALUES (@i, @seq);

        SET @i = @i + 1;
    END

    RETURN;
END;

SELECT * FROM dbo.GetIncreasingSequenceRows(5);
--2
SELECT e.EmployeeID, e.FirstName, e.LastName, t.TotalSales
FROM Employees e
JOIN (
    SELECT s.EmployeeID, SUM(s.SalesAmount) AS TotalSales
    FROM Sales s
    WHERE s.SaleDate >= DATEADD(MONTH, -6, GETDATE()) -- Last 6 months
    GROUP BY s.EmployeeID
) t ON e.EmployeeID = t.EmployeeID
ORDER BY t.TotalSales DESC;
--3
WITH RunningTotal AS (
    -- Anchor member: Starting point for recursion, where the total is 0.
    SELECT 1 AS Step, 0 AS Total
    UNION ALL
    -- Recursive member: Adds a random number to the running total.
    -- We ensure the total doesn't go above 10 or below 0.
    SELECT Step + 1, 
           CASE 
               WHEN (Total + 2) > 10 THEN 10 -- Limit total to 10
               WHEN (Total - 2) < 0 THEN 0   -- Limit total to 0
               ELSE Total + 2                -- Otherwise add 2
           END
    FROM RunningTotal
    WHERE Step < 10 -- Limit recursion to 10 steps
)
SELECT Step, Total
FROM RunningTotal;
--4
SELECT 
    s.ScheduleID,
    s.StartTime,
    s.EndTime,
    COALESCE(a.ActivityName, 'Work') AS Activity
FROM 
    Schedule s
LEFT JOIN 
    Activity a ON s.ScheduleID = a.ScheduleID
ORDER BY 
    s.StartTime;	

--5
WITH DepartmentSales AS (
    SELECT 
        e.DepartmentID,
        p.ProductID,
        SUM(s.SalesAmount) AS TotalSales
    FROM 
        Sales s
    JOIN 
        Employees e ON s.EmployeeID = e.EmployeeID
    JOIN 
        Products p ON s.ProductID = p.ProductID
    GROUP BY 
        e.DepartmentID, p.ProductID
),
DepartmentTotalSales AS (
    SELECT 
        e.DepartmentID,
        SUM(s.SalesAmount) AS DepartmentTotalSales
    FROM 
        Sales s
    JOIN 
        Employees e ON s.EmployeeID = e.EmployeeID
    GROUP BY 
        e.DepartmentID
)
SELECT 
    d.DepartmentName,
    p.ProductName,
    ds.TotalSales,
    dts.DepartmentTotalSales
FROM 
    DepartmentSales ds
JOIN 
    Departments d ON ds.DepartmentID = d.DepartmentID
JOIN 
    Products p ON ds.ProductID = p.ProductID
JOIN 
    DepartmentTotalSales dts ON ds.DepartmentID = dts.DepartmentID
ORDER BY 
    d.DepartmentName, p.ProductName;



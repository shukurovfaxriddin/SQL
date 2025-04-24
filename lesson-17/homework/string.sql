--1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.

--Return: ProductID, TotalQuantity, TotalRevenue

CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(18, 2)
);

INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE 
    MONTH(s.SaleDate) = MONTH(GETDATE()) AND
    YEAR(s.SaleDate) = YEAR(GETDATE())
GROUP BY s.ProductID;

SELECT * FROM #MonthlySales;

--2. Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.

--Return: ProductID, ProductName, Category, TotalQuantitySold

CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID, 
    p.ProductName, 
    p.Category, 
    SUM(ISNULL(s.Quantity, 0)) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;


 select * from vw_ProductSalesSummary

--3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)

--Return: total revenue for the given product ID

CREATE FUNCTION fn_GetTotalRevenueForProduct
(
    @ProductID INT
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18, 2);

    SELECT @TotalRevenue = SUM(ISNULL(s.Quantity, 0) * ISNULL(p.Price, 0))
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    WHERE s.ProductID = @ProductID;

    RETURN ISNULL(@TotalRevenue, 0);
END;

SELECT dbo.fn_GetTotalRevenueForProduct(20); 


--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))

--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

--Now we will move on with 2 Lateral-thinking puzzles (5 and 6th puzzles). Lateral-thinking puzzles are the ones that can’t be solved by straightforward logic — you have to think outside the box. 🔍🧠

CREATE FUNCTION fn_GetSalesByCategory
(
    @Category VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductName,
        SUM(ISNULL(s.Quantity, 0)) AS TotalQuantity,
        SUM(ISNULL(s.Quantity, 0) * ISNULL(p.Price, 0)) AS TotalRevenue
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);

SELECT * FROM dbo.fn_GetSalesByCategory('Electronics');

--5. You have to create a function that get one argument as input from user and the function should return 'Yes' if the input number is a prime number and 'No' otherwise. You can start it like this:

--Create function dbo.fn_IsPrime (@Number INT)
--Returns ...

--This is for those who has no idea about prime numbers: A prime number is a number greater than 1 that has only two divisors: 1 and itself(2, 3, 5, 7 and so on).

CREATE FUNCTION dbo.fn_IsPrime
(
    @Number INT
)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @i INT = 2;
    DECLARE @IsPrime BIT = 1;
    DECLARE @Result VARCHAR(3);

    IF @Number <= 1
        SET @Result = 'no';
    ELSE
    BEGIN
        WHILE @i * @i <= @Number
        BEGIN
            IF @Number % @i = 0
            BEGIN
                SET @IsPrime = 0;
                BREAK;
            END
            SET @i = @i + 1;
        END

        IF @IsPrime = 1
            SET @Result = 'yes';
        ELSE
            SET @Result = 'no';
    END

    RETURN @Result;
END;

SELECT dbo.fn_IsPrime(7); 
SELECT dbo.fn_IsPrime(10); 

--6. Create a table-valued function named fn_GetNumbersBetween that accepts two integers as input:

--@Start INT
--@End INT

--The function should return a table with a single column:

--Number
--...

--It should include all integer values from @Start to @End, inclusive.

CREATE FUNCTION dbo.fn_GetNumbersBetween
(
    @Start INT,
    @End INT
)
RETURNS @Result TABLE
(
    Number INT
)
AS
BEGIN
    ;WITH Numbers AS (
        SELECT @Start AS Number
        UNION ALL
        SELECT Number + 1
        FROM Numbers
        WHERE Number + 1 <= @End
    )
    INSERT INTO @Result
    SELECT Number FROM Numbers
    OPTION (MAXRECURSION 1000);  -- recursion limit

    RETURN;
END;

SELECT * FROM dbo.fn_GetNumbersBetween(3, 8);

--7. Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL. 

--NOTE: You have to do some research on Dense_rank window function.

--Example 1:

--Input: 
--Employee table:

--+----+--------+

--| id | salary |

--+----+--------+

--| 1  | 100    |

--| 2  | 200    |

--| 3  | 300    |

--+----+--------+

--n = 2
--Output: 

--+------------------------+

--| getNthHighestSalary(2) |

--+------------------------+

--| 200                    |

--+------------------------+

--Example 2:

--Input: 
--Employee table:

--+----+--------+

--| id | salary |

--+----+--------+

--| 1  | 100    |

--+----+--------+

--n = 2
--Output:

--+------------------------+

--| getNthHighestSalary(2) |

--+------------------------+

--| null                   |

--+------------------------+

CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;

    SELECT @Result = Salary
    FROM (
        SELECT DISTINCT Salary,
               DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
        FROM Employee
    ) AS Ranked
    WHERE rnk = @N;

    RETURN @Result;
END;

SELECT dbo.getNthHighestSalary(2) AS [getNthHighestSalary(2)];

--8. Write a SQL query to find the person who has the most friends.

--Return: Their id, The total number of friends they have

--Friendship is mutual. For example, if user A sends a request to user B and its accepted, both A and B are considered friends with each other. The test case is guaranteed to have only one user with the most friends.

--Input: 
--RequestAccepted table:

--+--------------+-------------+-------------+

--| requester_id | accepter_id | accept_date |

--+--------------+-------------+-------------+

--| 1            | 2           | 2016/06/03  |

--| 1            | 3           | 2016/06/08  |

--| 2            | 3           | 2016/06/08  |

--| 3            | 4           | 2016/06/09  |

--+--------------+-------------+-------------+

--Output: 

--+----+-----+

--| id | num |

--+----+-----+

--| 3  | 3   |

--+----+-----+

--Explanation: 
--The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.

--You can also solve this in Leetcode: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50

SELECT TOP 1 id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS AllFriends
GROUP BY id
ORDER BY COUNT(*) DESC;


--9. Create a View for Customer Order Summary. 

--CREATE TABLE Customers (
--    customer_id INT PRIMARY KEY,
--    name VARCHAR(100),
--    city VARCHAR(50)
--);

--CREATE TABLE Orders (
--    order_id INT PRIMARY KEY,
--    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
--    order_date DATE,
--    amount DECIMAL(10,2)
--);

---- Customers
--INSERT INTO Customers (customer_id, name, city)
--VALUES
--(1, 'Alice Smith', 'New York'),
--(2, 'Bob Jones', 'Chicago'),
--(3, 'Carol White', 'Los Angeles');

---- Orders
--INSERT INTO Orders (order_id, customer_id, order_date, amount)
--VALUES
--(101, 1, '2024-12-10', 120.00),
--(102, 1, '2024-12-20', 200.00),
--(103, 1, '2024-12-30', 220.00),
--(104, 2, '2025-01-12', 120.00),
--(105, 2, '2025-01-20', 180.00);

--Create a view called vw_CustomerOrderSummary that returns a summary of customer orders. The view must contain the following columns:

--Column Name | Description
--customer_id | Unique identifier of the customer
--name | Full name of the customer
--total_orders | Total number of orders placed by the customer
--total_amount | Cumulative amount spent across all orders
--last_order_date | Date of the most recent order placed by the customer

CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

select * from vw_CustomerOrderSummary

10. Write an SQL statement to fill in the missing gaps. You have to write only select statement, no need to modify the table.

-------------------------------------------

--|Row Number	|	Workflow	|	Status	|

-------------------------------------------

--|	  1		|	  Alpha		|	 Pass	|

--|	  2		|				|	 Fail	|

--|	  3		|				|	 Fail	|

--|	  4		|				|	 Fail	|

--|	  5		|	  Bravo		|	 Pass	|

--|	  6		|				|	 Fail	|

--|	  7		|				|	 Fail	|

--|	  8		|				|	 Pass	|

--|	  9		|				|	 Pass	|

--|	  10	|	 Charlie	|	 Fail	|

--|	  11	|				|	 Fail	|

--|	  12	|				|	 Fail	|

-------------------------------------------


--Here is the expected output.

-------------------------------------------

--|Row Number	|	Workflow	|	Status	|

-------------------------------------------

--|	  1		|	  Alpha		|	 Pass	|


--|	  2		|	  Alpha		|	 Fail	|

--|	  3		|	  Alpha		|	 Fail	|

--|	  4		|	  Alpha		|	 Fail	|

--|	  5		|	  Bravo		|	 Pass	|

--|	  6		|	  Bravo		|	 Fail	|

--|	  7		|	  Bravo		|	 Fail	|

--|	  8		|	  Bravo		|	 Pass	|

--|	  9		|	  Bravo		|	 Pass	|

--|	  10	|	 Charlie	|	 Fail	|

--|	  11	|	 Charlie	|	 Fail	|

--|	  12	|	 Charlie	|	 Fail	|

-------------------------------------------


DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,'Charlie'),(8,NULL),(9,NULL);


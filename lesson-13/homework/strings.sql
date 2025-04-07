
--homework 
--task 1
--1
select left('DATABASE',4) as SubstringResult
--2 2️⃣ Find Position of a Word → Find position of 'SQL' in 'I love SQL Server'.
select CHARINDEX('SQL','I love SQL Server') AS PositionOfSQL
--3 3️⃣ Replace a Word → Replace 'World' with 'SQL' in 'Hello World'.
select REPLACE('Hello World','World','SQL') AS ReplacedText
--4 4️⃣ Find String Length → Find length of 'Microsoft SQL Server'.
SELECT LEN('Microsoft SQL Server') AS StringLength
--5 5️⃣ Extract Last 3 Characters → Get last 3 characters from 'Database'.
select right('Database',3) AS Last3Chars
--6 6️⃣ Count a Character → Count occurrences of 'a' in 'apple', 'banana', 'grape'.
select PATINDEX('%[a]%', 'apple') as apple  ,  PATINDEX('%[a]%', 'banana') as banana,  PATINDEX('%[a]%','grape') as grape
--7
SELECT SUBSTRING('abcdefg', 6, LEN('abcdefg')) AS result;
--8 Extract a Word → Extract second word from 'SQL is powerful', 'I love databases'.

SELECT value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM STRING_SPLIT('SQL is powerful', ' ')
) AS x
WHERE rn = 2

UNION ALL

SELECT value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM STRING_SPLIT('I love databases', ' ')
) AS x
WHERE rn = 2;

--9
SELECT ROUND(15.6789, 2) AS RoundedNumber;
--10
SELECT ABS(-345.67) AS AbsoluteValue;

--task 2
--1
SELECT SUBSTRING('ABCDEFGHI', 4, 3) AS MiddleCharacters;
--2 1️⃣2️⃣ Replace Part of String → Replace first 3 chars of 'Microsoft' with 'XXX'.
select CONCAT('XXX',SUBSTRING('Microsoft',4,len('Microsoft')))
--3 1️⃣3️⃣ Find First Space → Find position of first space in 'SQL Server 2025'.
select charindex(' ','SQL Server 2025')
--4 1️⃣4️⃣ Concatenate Names → Join FirstName & LastName with ', '.
select CONCAT('Join FirstName',', ','LastName')
--5 
SELECT value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM STRING_SPLIT('The database is very efficient', ' ')
) AS x
WHERE rn = 3;
--6 Extract Only Numbers → Get numeric part from 'INV1234', 'ORD5678'.
SELECT STUFF('INV1234', 1, PATINDEX('%[0-9]%', 'INV1234') - 1, '') AS result ,
STUFF( 'ORD5678', 1, PATINDEX('%[0-9]%',  'ORD5678') - 1, '') AS result
--7 
SELECT ROUND(CAST(99.5 AS FLOAT), 0) AS YaxlitlanganSon
--8 1️⃣8️⃣ Find Day Difference → Days between '2025-01-01' & '2025-03-15'.
select DATEDIFF(day, '2025-01-01', '2025-03-15') AS KunlarFarqi
--9 1️⃣9️⃣ Find Month Name → Retrieve month name from '2025-06-10'.
SELECT DATENAME(MONTH, '2025-06-10') AS OyNomi
--10 2️⃣0️⃣ Calculate Week Number → Week number for '2025-04-22'.
SELECT DATEPART(WEEK, '2025-04-22') AS HaftaRaqami

--task3
--1 2️⃣1️⃣ Extract After '@' → Extract domain from 'user1@gmail.com', 'admin@company.org'.
SELECT SUBSTRING('user1@gmail.com', CHARINDEX('@', 'user1@gmail.com') + 1, LEN('user1@gmail.com') - CHARINDEX('@', 'user1@gmail.com')) AS result
UNION ALL
SELECT SUBSTRING('admin@company.org', CHARINDEX('@', 'admin@company.org') + 1, LEN('admin@company.org') - CHARINDEX('@', 'admin@company.org'))
--2
SELECT LEN('experience') - CHARINDEX('e', REVERSE('experience')) + 1 AS Last_E_Position;
--3
SELECT FLOOR(RAND() * (500 - 100 + 1)) + 100 AS RandomNumber;
--4
SELECT FORMAT(9876543, 'N0') AS FormattedNumber;
--5
SELECT 
    FullName,
    LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM Customers;
--6
SELECT RIGHT('00000' + CAST(42 AS VARCHAR(5)), 5) AS PaddedNumber;
--7
SELECT MAX(LEN(value)) AS LongestWordLength
FROM STRING_SPLIT('SQL is fast and efficient', ' ');
--8
SELECT SUBSTRING('Error: Connection failed', CHARINDEX(' ', 'Error: Connection failed') + 1, LEN('Error: Connection failed')) AS Result;
--9
SELECT DATEDIFF(MINUTE, '08:15:00', '09:45:00') AS TimeDifferenceInMinutes;

--1. Alias bilan ProductName ustunini Name deb nomlash (Products jadvali)

SELECT ProductName AS Name
FROM Products;
--2. Customers jadvaliga Client nomli alias berish

SELECT *
FROM Customers AS Client;
--3. UNION yordamida Products va Products_Discounted jadvalidan ProductName ni birlashtirish

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
Eslatma: UNION avtomatik ravishda DISTINCT ishlatadi.

--4. INTERSECT yordamida Products va Products_Discounted kesishmasini topish

SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;
--5. SELECT DISTINCT bilan takrorlanmagan mijoz nomlari va mamlakati

SELECT DISTINCT CustomerName, Country
FROM Customers;
--6. CASE ishlatib Price ustuni asosida 'High' yoki 'Low' ko‘rsatish (Products jadvali)

SELECT ProductName,
       Price,
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;
--7. IIF yordamida StockQuantity > 100 bo‘lsa 'Yes', aks holda 'No' chiqarish (Products_Discounted jadvali)

SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;

--
--1. UNION yordamida Products va OutOfStock jadvalidan ProductName ni birlashtirish

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;
UNION avtomatik ravishda takrorlanayotgan qiymatlarni olib tashlaydi. Agar takrorlar ko‘rsatilishi kerak bo‘lsa, UNION ALL ishlatish mumkin.

--2. EXCEPT yordamida Products va Products_Discounted jadvalaridan farqni topish

SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;
EXCEPT birinchi so‘rovdagi qiymatlar ikkinchi so‘rovda mavjud bo‘lmagan qiymatlarni chiqaradi.

--3. IIF bilan shartli ustun qo‘shish: 'Expensive' yoki 'Affordable' (Products jadvali)

SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;
--4. Employees jadvalidan yosh < 25 yoki maosh > 60000 bo‘lgan xodimlarni topish

SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;
--5. UPDATE yordamida xodim maoshini yangilash: 'HR' bo‘lsa 10% oshirish yoki EmployeeID = 5 bo‘lsa

UPDATE Employees
SET Salary = Salary * 1.10
WHERE DeptID = 'HR' OR EmployeeID = 5;

--
--1. INTERSECT yordamida Products va Products_Discounted jadvallari orasidagi umumiy mahsulotlarni topish

SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

--2. CASE yordamida SaleAmount bo‘yicha 'Top Tier', 'Mid Tier', 'Low Tier'ni tayinlash (Sales jadvali)

SELECT SaleAmount,
       CASE 
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleTier
FROM Sales;

--3. EXCEPT yordamida faqat Orders jadvalidan buyurtma bergan va Invoices jadvalida mos yozuvi bo‘lmagan mijozlarni topish

SELECT CustomerID FROM Orders
EXCEPT
SELECT CustomerID FROM Invoices;

--4. CASE yordamida buyurtma miqdoriga qarab chegirma foizini hisoblash (Orders jadvali)

SELECT CustomerID,
       Quantity,
       CASE 
           WHEN Quantity = 1 THEN 3
           WHEN Quantity BETWEEN 2 AND 3 THEN 5
           ELSE 7
       END AS DiscountPercentage
FROM Orders;

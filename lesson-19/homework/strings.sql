use lesson19hw

--task1
--Vazifa: kompaniyada eng kam maosh oladigan xodimlarni oling. Jadvallar :xodimlar (ustunlar: id, ism, maosh)
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select * from employees where  salary in (select min(salary) from employees)
--task2  Vazifa: o'rtacha narxi yuqorida baholi mahsulotlarini olish. Jadvallar: mahsulotlar (ustunlar: id, product_name, narx)
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);
INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);
--task2  Vazifa: o'rtacha narxi yuqorida baholi mahsulotlarini olish. Jadvallar: mahsulotlar (ustunlar: id, product_name, narx)
select * from products 
where price > (select avg(price) from products)
--task3  3. Savdo bo'limidagi xodimlarni toping vazifa: "savdo" bo'limida ishlaydigan xodimlarni oling. Jadvallar: xodimlar (ustunlar: id, ism, bo'lim_id), bo'limlar (ustunlar :id, bo'lim_name)
SELECT * 
FROM employees 
WHERE department_id IN (
    SELECT id 
    FROM departments
    WHERE department_name = 'Sales');


CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

--task 4  Vazifa: har qanday buyurtma yo'q mijozlar olish. Jadvallar: mijozlar (ustunlar: customer_id, ism), buyurtmalar (ustunlar: order_id, customer_id)
SELECT * 
FROM customers 
WHERE customer_id NOT IN (
    SELECT customer_id 
    FROM orders
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);
--task5 Vazifa: har bir toifadagi eng yuqori narxga ega mahsulotlarni oling. Jadvallar: mahsulotlar (ustunlar: id, product_name, narx, category_id)
SELECT p.*
FROM products p
JOIN (
    SELECT category_id, MAX(price) AS max_price
    FROM products
    GROUP BY category_id
) maxp ON p.category_id = maxp.category_id 
       AND p.price = maxp.max_price;


CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);


INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

--task 6   Vazifa: kafedrada ishlaydigan xodimlarni
--eng yuqori o'rtacha ish haqi bilan olish. Stollar: xodimlar (ustunlar: id, ism, maosh, bo'lim_id), bo'limlar (ustunlar :id, bo'lim_name)
SELECT *
FROM departments
WHERE id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
INSERT INTO departments (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

--7
SELECT * 
FROM employees e
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id
);
--8
SELECT s.student_id, s.name, g.course_id, g.grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE (g.course_id, g.grade) IN (
    SELECT course_id, MAX(grade)
    FROM grades
    GROUP BY course_id
);
--9
SELECT * 
FROM products p
WHERE price = (
    SELECT DISTINCT price
    FROM products
    WHERE category_id = p.category_id
    ORDER BY price DESC
    OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY
);
--10
SELECT * 
FROM employees e
WHERE 
    e.salary > (SELECT AVG(salary) FROM employees) AND
    e.salary < (
        SELECT MAX(salary) 
        FROM employees 
        WHERE department_id = e.department_id
    );

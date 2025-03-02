--1.Display All Salespeople
CREATE table  salesman (Salesman_id int ,Name varchar(20),City varchar(20),Commission float)
select * FROM salesman
INSERT INTO salesman VALUES 
(5001,'James Hoog','New York',0.15), 
(5002,'Nail Knite','Paris',0.13), 
(5005,'Pit Alex','London',0.11), 
(5006,'Mc Lyon','Paris',0.14), 
( 5007,'Paul Adam','Rome',0.13), 
(5003,'Lauson Hen','San Jose',0.12)
select * FROM salesman
--drop table tablitsa1
--2.
SELECT 'This is SQL Exercise, Practice and Solution'
--3.
SELECT 150,150,150
--4
SELECT 10 + 15 AS Natija
--6
SELECT name, commission FROM salesman

--7
create table orders (Ord_no int,Purch_amt float ,ord_date date ,customer_id int,salesman_id int)
select * from orders
insert into orders values 
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002);
SELECT * FROM orders
--drop table tablitsa3
--8 Unique Salespeople IDs
SELECT  salesman_id FROM orders;

--9 Salespeople in Paris
SELECT name, City FROM salesman 
WHERE City = 'Paris';

--10 Customers with Grade 200 customer
create table customer (customer_id int,cust_name varchar(20),city varchar(20),grade int null,salesman_id int)
select * FROM customer
insert into customer values 
        (3002 , 'Nick Rimando'   , 'New York',   100,       5001),
        (3007 , 'Brad Davis'     , 'New York',   200,      5001),
        (3005 , 'Graham Zusi'   , 'California',   200 ,       5002),
        (3008 , 'Julian Green'   , 'London',  300 ,      5002),
        (3004 , 'Fabian Johnson' , 'Paris',   300,      5006),
        (3009 , 'Geoff Cameron'  , 'Berlin',  100,       5003),
        (3003 , 'Jozy Altidor'  , 'Moscow',   200,      5007),
        (3001 , 'Brad Guzan'    , 'London',  null ,    5005);
SELECT customer_id,cust_name,city, grade,salesman_id FROM customer 
WHERE grade = 200;
--drop table tablitsa6
--11 Orders by Salesperson 5001
SELECT ord_no, ord_date, purch_amt FROM orders 
WHERE salesman_id = 5001;

--12 Nobel_Winner_of_1970
create table nobel_win (YEAR int, SUBJECT  varchar(50), WINNER varchar(50), COUNTRY varchar(50), CATEGORY varchar(50))
select * FROM nobel_win
insert into nobel_win values 
(1970,'Physics','Hannes Alfven','Sweden','Scientist'),
(1970,'Physics','Louis Neel','France','Scientist'),
(1970,'Chemistry','Luis Federico Leloir','France','Scientist'),
(1970,'Physiology','Ulf von Euler','Sweden','Scientist'),
(1970,'Physiology','Bernard Katz','Germany','Scientist'),
(1970,'Literature','Aleksandr_Solzhenitsyn','Russia','Linguist'),
(1970,'Economics','Paul Samuelson','USA',' Economist'),
(1970,'Physiology','Julius Axelrod','USA','Scientist'),
(1971,'Physics','Dennis Gabor','Hungary',' Scientist'),
(1971,'Chemistry','Gerhard Herzberg','Germany','Scientist'),
(1971,'Peace','Willy Brandt ','Germany','Chancellor'),
(1971,'Literature','Pablo Neruda ','Chile','Linguist'),
(1971,'Economics','Simon Kuznets','Russia','Economist'),
(1978,'Peace','Anwar al-Sadat','Egypt','President'),
(1978,'Peace','Menachem Begin','Israel','Prime Minister'),
(1987,'Chemistry','Donald J. Cram','USA','Scientist'),
(1987,'Chemistry','Jean-Marie Lehn','France','Scientist'),
(1987,'Physiology','Susumu Tonegawa','Japan','Scientist'),
(1994,'Economics','Reinhard Selten','Germany','Economist'),
(1994,'Peace','Yitzhak Rabin','Israel','Prime Minister'),
(1987,'Physics','Johannes Georg Bednorz','Germany','Scientist'),
(1987,'Literature','Joseph Brodsky','Russia','Linguist'),
(1987,'Economics','Robert Solow','USA','Economist'),
(1994,'Literature','Kenzaburo Oe','Japan','Linguist');
 SELECT year,subject ,winner FROM nobel_win 
WHERE YEAR = 1970
--DROP TABLE Nobel_Winner_of_1970;

--13 Literature Winner 1971
 SELECT winner FROM nobel_win 
WHERE YEAR = 1971 AND subject = 'Literature';
--DROP TABLE Literature_Winner_1971;

--14 Locate_Dennis_Gabor
 SELECT YEAR, SUBJECT FROM nobel_win 
WHERE WINNER = 'Dennis Gabor'
--DROP TABLE Locate_Dennis_Gabor;

--15 Physics Winners Since 1950
 SELECT WINNER FROM nobel_win 
WHERE year >= 1950 AND subject = 'Physics';
--DROP TABLE Physics_Winners_Since_1950;

--16. Chemistry Winners (1965-1975)
select year, subject, winner, country from nobel_win
where SUBJECT = 'Chemistry' and YEAR >= 1965 and YEAR <= 1975;

--17. Prime Ministers After 1972
select * from nobel_win
where year > 1972 and CATEGORY = ' ';

--18. Winners with First Name Louis
select * from nobel_win
where WINNER  like 'Louis%';

--19. Combine Winners (Physics 1970 & Economics 1971)
select year, subject, winner, country,  category from  nobel_win
where year = 1970  and subject = 'Physics' 
union 
select year, subject, winner, country,  category from  nobel_win
where year = 1971 and subject = 'Economics';

--20. 1970 Winners Excluding Physiology & Economics
select * from nobel_win
where year = 1970 and subject != 'Physiology' and subject != 'Economics' ;

--21. Physiology Before 1971 & Peace After 1974
select * from nobel_win
where subject = 'Physiology' and year <= 1970 
union
select * from nobel_win
where subject = 'Peace' and year >= 1974 ;

--22. Details of Johannes Georg Bednorz
select * from  nobel_win 
where winner = 'Johannes Georg Bednorz';

--23. Winners Excluding Subjects Starting with P
select * from  nobel_win 
where subject  not like 'P%'
order by year desc ;
--24. Ordered 1970 Nobel Prize Winners
select * from  nobel_win 
where year = 1970 or subject = 'Chemistry' and subject = 'Economics'

--25. Products in Price Range Rs.200-600
create   table item_mast (PRO_ID  int, PRO_NAME varchar(50), PRO_PRICE decimal (10,2), PRO_COM int)
select * FROM item_mast
insert into item_mast values 
    (101,'Mother Board',3200.00,15),
   (102,'Key Board',450.00,16),
    (103,'ZIP drive',250.00,14),
    (104, 'Speaker',                          550.00  ,       16),
    (105, 'Monitor',                         5000.00  ,       11),
    (106, 'DVD drive',                        900.00  ,       12),
    (107, 'CD drive',                         800.00  ,       12),
    (108, 'Printer',                        2600.00    ,     13),
    (109, 'Refill cartridge',                 350.00  ,       13),
    (110, 'Mouse',                            250.00  ,       12);
	select * from item_mast
	where PRO_PRICE >=200 and PRO_PRICE <=600
	order by PRO_PRICE ;

	--26 Average Price for Manufacturer Code 16
	select avg(pro_price) 'avg' FROM item_mast
	where PRO_COM = 16

	--27. Display Item Name and Price
	SELECT pro_name as "Item Name", pro_price AS "Price in Rs"
	FROM item_mast;
	--28. Items with Price >= $250
		SELECT pro_name, pro_price FROM item_mast
		where PRO_PRICE >=250 
		order by PRO_PRICE desc

		--29. Average Price per Company  
		SELECT AVG(pro_price), pro_com FROM item_mast
        GROUP BY pro_com;
--30. Cheapest Item 
SELECT pro_name, pro_price FROM item_mast
SELECT MIN(PRO_PRICE) FROM item_mast;

--31. Unique Employee Last Names
create   table emp_details (EMP_IDNO int, EMP_FNAME varchar(50), EMP_LNAME varchar(50), EMP_DEPT int)
select * FROM emp_details
insert into emp_details values 
   (127323, 'Michale','Robbin',                  57),
   (526689, 'Carlos','Snares',                  63),
   (843795, 'Enric','Dosio',                   57),
   (328717, 'Jhon','Snares',                  63),
   (444527, 'Joseph','Dosni',                   47),
   (659831, 'Zanifer','Emily',                   47),
   (847674, 'Kuleswar','Sitaraman',               57),
   (748681, 'Henrey','Gabriel',                 47),
   (555935, 'Alex','Manuel',                  57),
   (539569, 'George','Mardy',                   27),
   (733843, 'Mario','Saule',                   63),
   (631548, 'Alan','Snappy',                  27),
   (839139, 'Maria','Foster',                  57);
   select EMP_LNAME from emp_details
--32. Employees with Last Name Snares
   select * from emp_details
   where EMP_LNAME = 'Snares'
   --33. Employees in Department 57
   select * from emp_details
   where EMP_DEPT = 57

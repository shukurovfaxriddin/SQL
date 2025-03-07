create table employees (EMPLOYEE_ID  int , FIRST_NAME  varchar(50), LAST_NAME   varchar(50) , EMAIL    varchar(50) , PHONE_NUMBER   varchar(50)    
, HIRE_DATE  date, JOB_ID varchar(50)    , SALARY float  , COMMISSION_PCT float , MANAGER_ID int , DEPARTMENT_ID int) 																																							 )
--	drop table 		employees	
 insert into employees  values
(100 , 'Steven     ' , 'King        ', 'SKING    ', '515.123.4567       ', '2003-06-17' ,'AD_PRES', 24000.00 ,0.00 ,   0 ,   90),
(101 , 'Neena      ' , 'Kochhar     ', 'NKOCHHAR ', '515.123.4568       ', '2005-09-21' ,'AD_VP', 17000.00 ,0.00 , 100 ,   90),
(102 , 'Lex        ' , 'De Haan     ', 'LDEHAAN  ', '515.123.4569       ', '2001-01-13' ,'AD_VP', 17000.00 ,0.00 , 100 ,   90),
(103 , 'Alexander  ' , 'Hunold      ', 'AHUNOLD  ', '590.423.4567       ', '2006-01-03' ,'IT_PROG',  9000.00 ,0.00 , 102 ,   60),
(104 , 'Bruce      ' , 'Ernst       ', 'BERNST   ', '590.423.4568       ', '2007-05-21' ,'IT_PROG',  6000.00 ,0.00 , 103 ,   60),
(105 , 'David      ' , 'Austin      ', 'DAUSTIN  ', '590.423.4569       ', '2005-06-25' ,'IT_PROG',  4800.00 ,0.00 , 103 ,   60),
(106 , 'Valli      ' , 'Pataballa   ', 'VPATABAL ', '590.423.4560       ', '2006-02-05' ,'IT_PROG',  4800.00 ,0.00 , 103 ,   60),
(107 , 'Diana      ' , 'Lorentz     ', 'DLORENTZ ', '590.423.5567       ', '2007-02-07' ,'IT_PROG',  4200.00 ,0.00 , 103 ,   60),
(108 , 'Nancy      ' , 'Greenberg   ', 'NGREENBE ', '515.124.4569       ', '2002-08-17' ,'FI_MGR', 12008.00 ,0.00 , 101 ,  100),
(109 , 'Daniel     ' , 'Faviet      ', 'DFAVIET  ', '515.124.4169       ', '2002-08-16' ,'FI_ACCOUNT ',  9000.00 ,0.00 , 108 ,  100),
(110 , 'John       ' , 'Chen        ', 'JCHEN    ', '515.124.4269       ', '2005-09-28' ,'FI_ACCOUNT ',  8200.00 ,0.00 , 108 ,  100),
(111 , 'Ismael     ' , 'Sciarra     ', 'ISCIARRA ', '515.124.4369       ', '2005-09-30' ,'FI_ACCOUNT ',  7700.00 ,0.00 , 108 ,  100),
(112 , 'Jose Manuel' , 'Urman       ', 'JMURMAN  ', '515.124.4469       ', '2006-03-07' ,'FI_ACCOUNT ',  7800.00 ,0.00 , 108 ,  100),
(113 , 'Luis       ' , 'Popp        ', 'LPOPP    ', '515.124.4567       ', '2007-12-07' ,'FI_ACCOUNT ',  6900.00 ,0.00 , 108 ,  100),
(114 , 'Den        ' , 'Raphaely    ', 'DRAPHEAL ', '515.127.4561       ', '2002-12-07' ,'PU_MAN', 11000.00 ,0.00 , 100 ,   30),
(115 , 'Alexander  ' , 'Khoo        ', 'AKHOO    ', '515.127.4562       ', '2003-05-18' ,'PU_CLERK',  3100.00 ,0.00 , 114 ,   30),
(116 , 'Shelli     ' , 'Baida       ', 'SBAIDA   ', '515.127.4563       ', '2005-12-24' ,'PU_CLERK',  2900.00 ,0.00 , 114 ,   30),
(117 , 'Sigal      ' , 'Tobias      ', 'STOBIAS  ', '515.127.4564       ', '2005-07-24' ,'PU_CLERK',  2800.00 ,0.00 , 114 ,   30),
(118 , 'Guy        ' , 'Himuro      ', 'GHIMURO  ', '515.127.4565       ', '2006-11-15' ,'PU_CLERK',  2600.00 ,0.00 , 114 ,   30),
(119 , 'Karen      ' , 'Colmenares  ', 'KCOLMENA ', '515.127.4566       ', '2007-08-10' ,'PU_CLERK',  2500.00 ,0.00 , 114 ,   30),
(120 , 'Matthew    ' , 'Weiss       ', 'MWEISS   ', '650.123.1234       ', '2004-07-18' ,'ST_MAN',  8000.00 ,0.00 , 100 ,   50),
(121 , 'Adam       ' , 'Fripp       ', 'AFRIPP   ', '650.123.2234       ', '2005-04-10' ,'ST_MAN',  8200.00 ,0.00 , 100 ,   50),
(122 , 'Payam      ' , 'Kaufling    ', 'PKAUFLIN ', '650.123.3234       ', '2003-05-01' ,'ST_MAN',  7900.00 ,0.00 , 100 ,   50),
(123 , 'Shanta     ' , 'Vollman     ', 'SVOLLMAN ', '650.123.4234       ', '2005-10-10' ,'ST_MAN',  6500.00 ,0.00 , 100 ,   50),
(124 , 'Kevin      ' , 'Mourgos     ', 'KMOURGOS ', '650.123.5234       ', '2007-11-16' ,'ST_MAN',  5800.00 ,0.00 , 100 ,   50),
(125 , 'Julia      ' , 'Nayer       ', 'JNAYER   ', '650.124.1214       ', '2005-07-16' ,'ST_CLERK',  3200.00 ,0.00 , 120 ,   50),
(126 , 'Irene      ' , 'Mikkilineni ', 'IMIKKILI ', '650.124.1224       ', '2006-09-28' ,'ST_CLERK',  2700.00 ,0.00 , 120 ,   50),
(127 , 'James      ' , 'Landry      ', 'JLANDRY  ', '650.124.1334       ', '2007-01-14' ,'ST_CLERK',  2400.00 ,0.00 , 120 ,   50),
(128 , 'Steven     ' , 'Markle      ', 'SMARKLE  ', '650.124.1434       ', '2008-03-08' ,'ST_CLERK',  2200.00 ,0.00 , 120 ,   50),
(129 , 'Laura      ' , 'Bissot      ', 'LBISSOT  ', '650.124.5234       ', '2005-08-20' ,'ST_CLERK',  3300.00 ,0.00 , 121 ,   50),
(130 , 'Mozhe      ' , 'Atkinson    ', 'MATKINSO ', '650.124.6234       ', '2005-10-30' ,'ST_CLERK',  2800.00 ,0.00 , 121 ,   50),
(131 , 'James      ' , 'Marlow      ', 'JAMRLOW  ', '650.124.7234       ', '2005-02-16' ,'ST_CLERK',  2500.00 ,0.00 , 121 ,   50),
(132 , 'TJ         ' , 'Olson       ', 'TJOLSON  ', '650.124.8234       ', '2007-04-10' ,'ST_CLERK',  2100.00 ,0.00 , 121 ,   50),
(133 , 'Jason      ' , 'Mallin      ', 'JMALLIN  ', '650.127.1934       ', '2004-06-14' ,'ST_CLERK',  3300.00 ,0.00 , 122 ,   50),
(134 , 'Michael    ' , 'Rogers      ', 'MROGERS  ', '650.127.1834       ', '2006-08-26' ,'ST_CLERK',  2900.00 ,0.00 , 122 ,   50),
(135 , 'Ki         ' , 'Gee         ', 'KGEE     ', '650.127.1734       ', '2007-12-12' ,'ST_CLERK',  2400.00 ,0.00 , 122 ,   50),
(136 , 'Hazel      ' , 'Philtanker  ', 'HPHILTAN ', '650.127.1634       ', '2008-02-06' ,'ST_CLERK',  2200.00 ,0.00 , 122 ,   50),
(137 , 'Renske     ' , 'Ladwig      ', 'RLADWIG  ', '650.121.1234       ', '2003-07-14' ,'ST_CLERK',  3600.00 ,0.00 , 123 ,   50),
(138 , 'Stephen    ' , 'Stiles      ', 'SSTILES  ', '650.121.2034       ', '2005-10-26' ,'ST_CLERK',  3200.00 ,0.00 , 123 ,   50),
(139 , 'John       ' , 'Seo         ', 'JSEO     ', '650.121.2019       ', '2006-02-12' ,'ST_CLERK',  2700.00 ,0.00 , 123 ,   50),
(140 , 'Joshua     ' , 'Patel       ', 'JPATEL   ', '650.121.1834       ', '2006-04-06' ,'ST_CLERK',  2500.00 ,0.00 , 123 ,   50),
(141 , 'Trenna     ' , 'Rajs        ', 'TRAJS    ', '650.121.8009       ', '2003-10-17' ,'ST_CLERK',  3500.00 ,0.00 , 124 ,   50),
(142 , 'Curtis     ' , 'Davies      ', 'CDAVIES  ', '650.121.2994       ', '2005-01-29' ,'ST_CLERK',  3100.00 ,0.00 , 124 ,   50),
(143 , 'Randall    ' , 'Matos       ', 'RMATOS   ', '650.121.2874       ', '2006-03-15' ,'ST_CLERK',  2600.00 ,0.00 , 124 ,   50),
(144 , 'Peter      ' , 'Vargas      ', 'PVARGAS  ', '650.121.2004       ', '2006-07-09' ,'ST_CLERK',  2500.00 ,0.00 , 124 ,   50),
(145 , 'John       ' , 'Russell     ', 'JRUSSEL  ', '011.44.1344.429268 ', '2004-10-01' ,'SA_MAN', 14000.00 ,0.40 , 100 ,   80),
(146 , 'Karen      ' , 'Partners    ', 'KPARTNER ', '011.44.1344.467268 ', '2005-01-05' ,'SA_MAN', 13500.00 ,0.30 , 100 ,   80),
(147 , 'Alberto    ' , 'Errazuriz   ', 'AERRAZUR ', '011.44.1344.429278 ', '2005-03-10' ,'SA_MAN', 12000.00 ,0.30 , 100 ,   80),
(148 , 'Gerald     ' , 'Cambrault   ', 'GCAMBRAU ', '011.44.1344.619268 ', '2007-10-15' ,'SA_MAN', 11000.00 ,0.30 , 100 ,   80),
(149 , 'Eleni      ' , 'Zlotkey     ', 'EZLOTKEY ', '011.44.1344.429018 ', '2008-01-29' ,'SA_MAN', 10500.00 ,0.20 , 100 ,   80),
(150 , 'Peter      ' , 'Tucker      ', 'PTUCKER  ', '011.44.1344.129268 ', '2005-01-30' ,'SA_REP', 10000.00 ,0.30 , 145 ,   80),
(151 , 'David      ' , 'Bernstein   ', 'DBERNSTE ', '011.44.1344.345268 ', '2005-03-24' ,'SA_REP',  9500.00 ,0.25 , 145 ,   80),
(152 , 'Peter      ' , 'Hall        ', 'PHALL    ', '011.44.1344.478968 ', '2005-08-20' ,'SA_REP',  9000.00 ,0.25 , 145 ,   80),
(153 , 'Christopher' , 'Olsen       ', 'COLSEN   ', '011.44.1344.498718 ', '2006-03-30' ,'SA_REP',  8000.00 ,0.20 , 145 ,   80),
(154 , 'Nanette    ' , 'Cambrault   ', 'NCAMBRAU ', '011.44.1344.987668 ', '2006-12-09' ,'SA_REP',  7500.00 ,0.20 , 145 ,   80),
(155 , 'Oliver     ' , 'Tuvault     ', 'OTUVAULT ', '011.44.1344.486508 ', '2007-11-23' ,'SA_REP',  7000.00 ,0.15 , 145 ,   80),
(156 , 'Janette    ' , 'King        ', 'JKING    ', '011.44.1345.429268 ', '2004-01-30' ,'SA_REP', 10000.00 ,0.35 , 146 ,   80),
(157 , 'Patrick    ' , 'Sully       ', 'PSULLY   ', '011.44.1345.929268 ', '2004-03-04' ,'SA_REP',  9500.00 ,0.35 , 146 ,   80),
(158 , 'Allan      ' , 'McEwen      ', 'AMCEWEN  ', '011.44.1345.829268 ', '2004-08-01' ,'SA_REP',  9000.00 ,0.35 , 146 ,   80),
(159 , 'Lindsey    ' , 'Smith       ', 'LSMITH   ', '011.44.1345.729268 ', '2005-03-10' ,'SA_REP',  8000.00 ,0.30 , 146 ,   80),
(160 , 'Louise     ' , 'Doran       ', 'LDORAN   ', '011.44.1345.629268 ', '2005-12-15' ,'SA_REP',  7500.00 ,0.30 , 146 ,   80),
(161 , 'Sarath     ' , 'Sewall      ', 'SSEWALL  ', '011.44.1345.529268 ', '2006-11-03' ,'SA_REP',  7000.00 ,0.25 , 146 ,   80),
(162 , 'Clara      ' , 'Vishney     ', 'CVISHNEY ', '011.44.1346.129268 ', '2005-11-11' ,'SA_REP', 10500.00 ,0.25 , 147 ,   80),
(163 , 'Danielle   ' , 'Greene      ', 'DGREENE  ', '011.44.1346.229268 ', '2007-03-19' ,'SA_REP',  9500.00 ,0.15 , 147 ,   80),
(164 , 'Mattea     ' , 'Marvins     ', 'MMARVINS ', '011.44.1346.329268 ', '2008-01-24' ,'SA_REP',  7200.00 ,0.10 , 147 ,   80),
(165 , 'David      ' , 'Lee         ', 'DLEE     ', '011.44.1346.529268 ', '2008-02-23' ,'SA_REP',  6800.00 ,0.10 , 147 ,   80),
(166 , 'Sundar     ' , 'Ande        ', 'SANDE    ', '011.44.1346.629268 ', '2008-03-24' ,'SA_REP',  6400.00 ,0.10 , 147 ,   80),
(167 , 'Amit       ' , 'Banda       ', 'ABANDA   ', '011.44.1346.729268 ', '2008-04-21' ,'SA_REP',  6200.00 ,0.10 , 147 ,   80),
(168 , 'Lisa       ' , 'Ozer        ', 'LOZER    ', '011.44.1343.929268 ', '2005-03-11' ,'SA_REP', 11500.00 ,0.25 , 148 ,   80),
(169 , 'Harrison   ' , 'Bloom       ', 'HBLOOM   ', '011.44.1343.829268 ', '2006-03-23' ,'SA_REP', 10000.00 ,0.20 , 148 ,   80),
(170 , 'Tayler     ' , 'Fox         ', 'TFOX     ', '011.44.1343.729268 ', '2006-01-24' ,'SA_REP',  9600.00 ,0.20 , 148 ,   80),
(171 , 'William    ' , 'Smith       ', 'WSMITH   ', '011.44.1343.629268 ', '2007-02-23' ,'SA_REP',  7400.00 ,0.15 , 148 ,   80),
(172 , 'Elizabeth  ' , 'Bates       ', 'EBATES   ', '011.44.1343.529268 ', '2007-03-24' ,'SA_REP',  7300.00 ,0.15 , 148 ,   80),
(173 , 'Sundita    ' , 'Kumar       ', 'SKUMAR   ', '011.44.1343.329268 ', '2008-04-21' ,'SA_REP',  6100.00 ,0.10 , 148 ,   80),
(174 , 'Ellen      ' , 'Abel        ', 'EABEL    ', '011.44.1644.429267 ', '2004-05-11' ,'SA_REP', 11000.00 ,0.30 , 149 ,   80),
(175 , 'Alyssa     ' , 'Hutton      ', 'AHUTTON  ', '011.44.1644.429266 ', '2005-03-19' ,'SA_REP',  8800.00 ,0.25 , 149 ,   80),
(176 , 'Jonathon   ' , 'Taylor      ', 'JTAYLOR  ', '011.44.1644.429265 ', '2006-03-24' ,'SA_REP',  8600.00 ,0.20 , 149 ,   80),
(177 , 'Jack       ' , 'Livingston  ', 'JLIVINGS ', '011.44.1644.429264 ', '2006-04-23' ,'SA_REP',  8400.00 ,0.20 , 149 ,   80),
(178 , 'Kimberely  ' , 'Grant       ', 'KGRANT   ', '011.44.1644.429263 ', '2007-05-24' ,'SA_REP',  7000.00 ,0.15 , 149 ,    0),
(179 , 'Charles    ' , 'Johnson     ', 'CJOHNSON ', '011.44.1644.429262 ', '2008-01-04' ,'SA_REP',  6200.00 ,0.10 , 149 ,   80),
(180 , 'Winston    ' , 'Taylor      ', 'WTAYLOR  ', '650.507.9876       ', '2006-01-24' ,'SH_CLERK',  3200.00 ,0.00 , 120 ,   50),
(181 , 'Jean       ' , 'Fleaur      ', 'JFLEAUR  ', '650.507.9877       ', '2006-02-23' ,'SH_CLERK',  3100.00 ,0.00 , 120 ,   50),
(182 , 'Martha     ' , 'Sullivan    ', 'MSULLIVA ', '650.507.9878       ', '2007-06-21' ,'SH_CLERK',  2500.00 ,0.00 , 120 ,   50),
(183 , 'Girard     ' , 'Geoni       ', 'GGEONI   ', '650.507.9879       ', '2008-02-03' ,'SH_CLERK',  2800.00 ,0.00 , 120 ,   50),
(184 , 'Nandita    ' , 'Sarchand    ', 'NSARCHAN ', '650.509.1876       ', '2004-01-27' ,'SH_CLERK',  4200.00 ,0.00 , 121 ,   50),
(185 , 'Alexis     ' , 'Bull        ', 'ABULL    ', '650.509.2876       ', '2005-02-20' ,'SH_CLERK',  4100.00 ,0.00 , 121 ,   50),
(186 , 'Julia      ' , 'Dellinger   ', 'JDELLING ', '650.509.3876       ', '2006-06-24' ,'SH_CLERK',  3400.00 ,0.00 , 121 ,   50),
(187 , 'Anthony    ' , 'Cabrio      ', 'ACABRIO  ', '650.509.4876       ', '2007-02-07' ,'SH_CLERK',  3000.00 ,0.00 , 121 ,   50),
(188 , 'Kelly      ' , 'Chung       ', 'KCHUNG   ', '650.505.1876       ', '2005-06-14' ,'SH_CLERK',  3800.00 ,0.00 , 122 ,   50),
(189 , 'Jennifer   ' , 'Dilly       ', 'JDILLY   ', '650.505.2876       ', '2005-08-13' ,'SH_CLERK',  3600.00 ,0.00 , 122 ,   50),
(190 , 'Timothy    ' , 'Gates       ', 'TGATES   ', '650.505.3876       ', '2006-07-11' ,'SH_CLERK',  2900.00 ,0.00 , 122 ,   50),
(191 , 'Randall    ' , 'Perkins     ', 'RPERKINS ', '650.505.4876       ', '2007-12-19' ,'SH_CLERK',  2500.00 ,0.00 , 122 ,   50),
(192 , 'Sarah      ' , 'Bell        ', 'SBELL    ', '650.501.1876       ', '2004-02-04' ,'SH_CLERK',  4000.00 ,0.00 , 123 ,   50),
(193 , 'Britney    ' , 'Everett     ', 'BEVERETT ', '650.501.2876       ', '2005-03-03' ,'SH_CLERK',  3900.00 ,0.00 , 123 ,   50),
(194 , 'Samuel     ' , 'McCain      ', 'SMCCAIN  ', '650.501.3876       ', '2006-07-01' ,'SH_CLERK',  3200.00 ,0.00 , 123 ,   50),
(195 , 'Vance      ' , 'Jones       ', 'VJONES   ', '650.501.4876       ', '2007-03-17' ,'SH_CLERK',  2800.00 ,0.00 , 123 ,   50),
(196 , 'Alana      ' , 'Walsh       ', 'AWALSH   ', '650.507.9811       ', '2006-04-24' ,'SH_CLERK',  3100.00 ,0.00 , 124 ,   50),
(197 , 'Kevin      ' , 'Feeney      ', 'KFEENEY  ', '650.507.9822       ', '2006-05-23' ,'SH_CLERK',  3000.00 ,0.00 , 124 ,   50),
(198 , 'Donald     ' , 'OConnell    ', 'DOCONNEL ', '650.507.9833       ', '2007-06-21' ,'SH_CLERK',  2600.00 ,0.00 , 124 ,   50),
(199 , 'Douglas    ' , 'Grant       ', 'DGRANT   ', '650.507.9844       ', '2008-01-13' ,'SH_CLERK',  2600.00 ,0.00 , 124 ,   50),
(200 , 'Jennifer   ' , 'Whalen      ', 'JWHALEN  ', '515.123.4444       ', '2003-09-17' ,'AD_ASST',  4400.00 ,0.00 , 101 ,   10),
(201 , 'Michael    ' , 'Hartstein   ', 'MHARTSTE ', '515.123.5555       ', '2004-02-17' ,'MK_MAN', 13000.00 ,0.00 , 100 ,   20),
(202 , 'Pat        ' , 'Fay         ', 'PFAY     ', '603.123.6666       ', '2005-08-17' ,'MK_REP',  6000.00 ,0.00 , 201 ,   20),
(203 , 'Susan      ' , 'Mavris      ', 'SMAVRIS  ', '515.123.7777       ', '2002-06-07' ,'HR_REP',  6500.00 ,0.00 , 101 ,   40),
(204 , 'Hermann    ' , 'Baer        ', 'HBAER    ', '515.123.8888       ', '2002-06-07' ,'PR_REP', 10000.00 ,0.00 , 101 ,   70),
(205 , 'Shelley    ' , 'Higgins     ', 'SHIGGINS ', '515.123.8080       ', '2002-06-07' ,'AC_MGR', 12008.00 ,0.00 , 101 ,  110),
(206 , 'William    ' , 'Gietz       ', 'WGIETZ   ', '515.123.8181       ', '2002-06-07' ,'AC_ACCOUNT',  8300.00 ,0.00 , 205 ,  110);

--1 From the following table, write a SQL query to find those employees 
 --whose salaries are less than 6000. Return full name (first and last name), and salary.
select FIRST_NAME , LAST_NAME ,SALARY from employees
where SALARY < 6000 

--2 From the following table, write a SQL query to find those employees 
--whose salary is higher than 8000. Return first name, last name and department number and salary.
select FIRST_NAME , LAST_NAME , DEPARTMENT_ID , SALARY from employees
where SALARY > 8000 

--3. From the following table, write a SQL query to find those employees 
--whose last name is "McEwen". Return first name, last name and department ID.
select FIRST_NAME , LAST_NAME , DEPARTMENT_ID from employees
where LAST_NAME = 'McEwen'

--4. From the following table, write a SQL query to identify employees who do not have a department number. 
--Return employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,commission_pct, manager_id and department_id.
select * from employees
where DEPARTMENT_ID is null

create table departments (DEPARTMENT_ID int, DEPARTMENT_NAME    varchar(50), MANAGER_ID int, LOCATION_ID bigint)
 insert into departments  values
( 10 ,'Administration       ',200,1700 ),
( 20 ,'Marketing            ',201,1800 ),
( 30 ,'Purchasing           ',114,1700 ),
( 40 ,'Human Resources      ',203,2400 ),
( 50 ,'Shipping             ',121,1500 ),
( 60 ,'IT                   ',103,1400 ),
( 70 ,'Public Relations     ',204,2700 ),
( 80 ,'Sales                ',145,2500 ),
( 90 ,'Executive            ',100,1700 ),
(100 ,'Finance              ',108,1700 ),
(110 ,'Accounting           ',205,1700 ),
(120 ,'Treasury             ',  0,1700 ),
(130 ,'Corporate Tax        ',  0,1700 ),
(140 ,'Control And Credit   ',  0,1700 ),
(150 ,'Shareholder Services ',  0,1700 ),
(160 ,'Benefits             ',  0,1700 ),
(170 ,'Manufacturing        ',  0,1700 ),
(180 ,'Construction         ',  0,1700 ),
(190 ,'Contracting          ',  0,1700 ),
(200 ,'Operations           ',  0,1700 ),
(210 ,'IT Support           ',  0,1700 ),
(220 ,'NOC                  ',  0,1700 ),
(230 ,'IT Helpdesk          ',  0,1700 ),
(240 ,'Government Sales     ',  0,1700 ),
(250 ,'Retail Sales         ',  0,1700 ),
(260 ,'Recruiting           ',  0,1700 ),
(270 ,'Payroll              ',  0,1700 );

--5 From the following table, write a SQL query to find the details of 'Marketing' department. Return all fields.
select * from departments
where DEPARTMENT_NAME = 'Marketing'

--6. From the following table, write a SQL query to find those employees 
--whose first name does not contain the letter ‘M’. Sort the result-set in ascending order by department ID. 
--Return full name (first and last name together), hire_date, salary and department_id.
select  CONCAT(first_name,last_name) AS full_name  ,hire_date, salary, department_id from employees
where FIRST_NAME NOT LIKE '%M%'

--7. From the following table, write a SQL query to find those employees who 
--earn between 8000 and 12000 (Begin and end values are included.) and get some commission.
--These employees joined before ‘1987-06-05’ and were not included in the department numbers 40, 120 and 70. Return all fields.
select * from employees
 where SALARY >= 8000 and SALARY <= 12000  AND   HIRE_DATE > '1987-06-05' and department_id NOT IN (40 , 120 , 70)  

 --8. From the following table, write a SQL query to find those employees 
 --who do not earn any commission. Return full name (first and last name), and salary.
 select CONCAT(first_name,last_name) AS full_name,SALARY  from employees
 where COMMISSION_PCT is null   

 --9. From the following table, write a SQL query to find the employees 
 --whose salary is in the range 9000,17000 (Begin and end values are included). Return full name, contact details and salary.
 select CONCAT(first_name,last_name) AS full_name,PHONE_NUMBER as contact_details,SALARY from employees
 where SALARY >= 9000 and SALARY <= 17000

 --10. From the following table, write a SQL query to find the employees
 --whose first name ends with the letter ‘m’. Return the first and last name, and salary.
  select FIRST_NAME , LAST_NAME,SALARY from employees
  WHERE RTRIM(FIRST_NAME) LIKE '%m';

  --11 From the following table, write a SQL query to find those employees
  --whose salaries are not between 7000 and 15000 (Begin and end values are included). 
  --Sort the result-set in ascending order by the full name (first and last). Return full name and salary.

    select CONCAT( first_name,last_name) AS full_name , SALARY from employees
	where salary not between 7000 AND 15000;

	--12. From the following table, write a SQL query to find those employees
	--who were hired between November 5th, 2007 and July 5th, 2009. Return full name (first and last), job id and hire date.
    select CONCAT( first_name,last_name) AS full_name , JOB_ID, HIRE_DATE from employees
	where HIRE_DATE between '2007-11-05' AND '2009-07-05'  order by full_name ;

	--13. From the following table, write a SQL query to find those employees 
	--who work either in department 70 or 90. Return full name (first and last name), department id.
	  select CONCAT( first_name,last_name) AS full_name , DEPARTMENT_ID from employees
	where DEPARTMENT_ID in (70 , 90) ;

 --14. From the following table, write a SQL query to find those employees 
 --who work under a manager. Return full name (first and last name), salary, and manager ID.
 	  select CONCAT( first_name,last_name) AS full_name , SALARY ,MANAGER_ID from employees
	where MANAGER_ID != 0.00 ;

	--15. From the following table, write a SQL query to find the employees
	--who were hired before June 21st, 2002. Return all fields.
	select * from employees
	where HIRE_DATE < '2002-06-21'
	--16. From the following table, write a SQL query to find the employees 
	--whose managers hold the ID 120, 103, or 145. Return first name, last name, email, salary and manager ID.
	  	select FIRST_NAME,LAST_NAME,EMAIL,SALARY,MANAGER_ID from employees
	where MANAGER_ID in (120,103,145)

	--17. From the following table, write a SQL query to find employees
	--whose first names contain the letters D, S, or N. Sort the result-set in descending order by salary. Return all fields.
	select * from employees
	where FIRST_NAME like 'D%' or FIRST_NAME like 'S%' or FIRST_NAME like 'N%' order by SALARY desc;

	--18. From the following table, write a SQL query to find those employees 
	--who earn above 11000 or the seventh character in their phone number is 3. Sort the result-set in descending order by first name. 
	--Return full name (first name and last name), hire date, commission percentage, email, and telephone separated by '-', and salary.
		 select CONCAT( first_name,last_name) AS full_name , HIRE_DATE,COMMISSION_PCT,EMAIL,CONCAT(PHONE_NUMBER,'-',EMAIL) as contact_details, SALARY from employees
		where SALARY > 11000 or SUBSTRING(phone_number, 7, 1) = '3' order by FIRST_NAME desc ;

		--	19. From the following table, write a SQL query to find those employees 
		--whose first name contains a character 's' in the third position. Return first name, last name and department id.
			 select FIRST_NAME,LAST_NAME,DEPARTMENT_ID from employees
		where FIRST_NAME like '__s%';

		--20. From the following table, write a SQL query to find those employees 
		--work in the departments that are not part of the department 50 or 30 or 80. Return employee_id, first_name,job_id, department_id.
				 select FIRST_NAME,LAST_NAME,DEPARTMENT_ID from employees
		where FIRST_NAME like '__s%';

					 select EMPLOYEE_ID,FIRST_NAME,JOB_ID,DEPARTMENT_ID from employees
		where DEPARTMENT_ID not  in(50,30,80);

		--21From the following table, write a SQL query to find the employees
--		whose department numbers are included in 30, 40, or 90. Return employee id, first name, job id, department id.
		select EMPLOYEE_ID,FIRST_NAME,JOB_ID,DEPARTMENT_ID from employees
		where DEPARTMENT_ID   in(30,40,90);

		--22. From the following table, write a SQL query to find those employees 
		--who worked more than two jobs in the past. Return employee id.
				
		--23. From the following table, write a SQL query to count the number of employees, the sum of all salary, 
		--and difference between the highest salary and lowest salaries by each job id. Return job_id, count, sum, salary_difference.
		select count(JOB_ID)as count,sum(SALARY)as sum,max(SALARY)-min(SALARY) AS salary_difference from employees
	group by JOB_ID;

	--24. From the following table, write a SQL query to find each job ids
	--where two or more employees worked for more than 300 days. Return job id.



	create table locations (LOCATION_ID int, STREET_ADDRESS varchar(50), POSTAL_CODE varchar(25), 
	CITY varchar(40), STATE_PROVINCE varchar(40),COUNTRY_ID varchar(2))
Insert into locations values (1000 ,' 1297 Via Cola di Rie                     ','989       ',' Roma                ',    null           ,'IT '),
							 (1100 ,' 93091 Calle della Testa                  ','10934     ',' Venice              ',    null			 ,'IT '),
							 (1200 ,' 2017 Shinjuku-ku                         ','1689      ',' Tokyo               ',' Tokyo Prefecture','JP '),
							 (1300 ,' 9450 Kamiya-cho                          ','6823      ',' Hiroshima           ',	  null			 ,'JP '),
							 (1400 ,' 2014 Jabberwocky Rd                      ','26192     ',' Southlake           ',' Texas           ','US '),
							 (1500 ,' 2011 Interiors Blvd                      ','99236     ',' South San Francisco ',' California      ','US '),
							 (1600 ,' 2007 Zagora St                           ','50090     ',' South Brunswick     ',' New Jersey      ','US '),
							 (1700 ,' 2004 Charade Rd                          ','98199     ',' Seattle             ',' Washington      ','US '),
							 (1800 ,' 147 Spadina Ave                          ','M5V 2L7   ',' Toronto             ',' Ontario         ','CA '),
							 (1900 ,' 6092 Boxwood St                          ','YSW 9T2   ',' Whitehorse          ',' Yukon           ','CA '),
							 (2000 ,' 40-5-12 Laogianggen                      ','190518    ',' Beijing             ',     null          ,'CN '),
							 (2100 ,' 1298 Vileparle (E)                       ','490231    ',' Bombay              ',' Maharashtra     ','IN '),
							 (2200 ,' 12-98 Victoria Street                    ','2901      ',' Sydney              ',' New South Wales ','AU '),
							 (2300 ,' 198 Clementi North                       ','540198    ',' Singapore           ',	   null			 ,'SG '),
							 (2400 ,' 8204 Arthur St                           ','          ',' London              ',	   null		     ,'UK '),
							 (2500 ,' Magdalen Centre, The Oxford Science Park ','OX9 9ZB   ',' Oxford              ',' Oxford          ','UK '),
							 (2600 ,' 9702 Chester Road                        ','9629850293',' Stretford           ',' Manchester      ','UK '),
							 (2700 ,' Schwanthalerstr. 7031                    ','80925     ',' Munich              ',' Bavaria         ','DE '),
							 (2800 ,' Rua Frei Caneca 1360                     ','01307-002 ',' Sao Paulo           ',' Sao Paulo       ','BR '),
							 (2900 ,' 20 Rue des Corps-Saints                  ','1730      ',' Geneva              ',' Geneve          ','CH '),
							 (3000 ,' Murtenstrasse 921                        ','3095      ',' Bern                ',' BE              ','CH '),
							 (3100 ,' Pieter Breughelstraat 837                ','3029SK    ',' Utrecht             ',' Utrecht         ','NL '),
							 (3200 ,' Mariano Escobedo 9991                    ','11932     ',' Mexico City         ',' Distrito Federal','MX ');

	--25. From the following table, write a SQL query to count the number of 
	--cities in each country. Return country ID and number of cities.
			select COUNTRY_ID, count(CITY) as count from locations
		group by country_id	
	--26. From the following table, write a SQL query to count 
	--the number of employees worked under each manager. Return manager ID and number of employees.
			select MANAGER_ID, count(EMPLOYEE_ID) as count from employees
		group by MANAGER_ID	order by count(EMPLOYEE_ID) desc
	


	create table jobs ( JOB_ID varchar(15), JOB_TITLE varchar(50), MIN_SALARY int, MAX_SALARY int)
insert into jobs values ( 'AD_PRES   ',' President                       ',  20080 , 40000),
						( 'AD_VP     ',' Administration Vice President   ',  15000 , 30000),
						( 'AD_ASST   ',' Administration Assistant        ',   3000 ,  6000),
						( 'FI_MGR    ',' Finance Manager                 ',   8200 , 16000),
						( 'FI_ACCOUNT',' Accountant                      ',   4200 ,  9000),
						( 'AC_MGR    ',' Accounting Manager              ',   8200 , 16000),
						( 'AC_ACCOUNT',' Public Accountant               ',   4200 ,  9000),
						( 'SA_MAN    ',' Sales Manager                   ',  10000 , 20080),
						( 'SA_REP    ',' Sales Representative            ',   6000 , 12008),
						( 'PU_MAN    ',' Purchasing Manager              ',   8000 , 15000),
						( 'PU_CLERK  ',' Purchasing Clerk                ',   2500 ,  5500),
						( 'ST_MAN    ',' Stock Manager                   ',   5500 ,  8500),
						( 'ST_CLERK  ',' Stock Clerk                     ',   2008 ,  5000),
						( 'SH_CLERK  ',' Shipping Clerk                  ',   2500 ,  5500),
						( 'IT_PROG   ',' Programmer                      ',   4000 , 10000),
						( 'MK_MAN    ',' Marketing Manager               ',   9000 , 15000),
						( 'MK_REP    ',' Marketing Representative        ',   4000 ,  9000),
						( 'HR_REP    ',' Human Resources Representative  ',   4000 ,  9000),
						( 'PR_REP    ',' Public Relations Representative ',   4500 , 10500)

	--27. From the following table, write a SQL query to find all jobs. 
	--Sort the result-set in descending order by job title. Return all fields.
	select * from jobs
	ORDER BY job_title DESC;
	--28. From the following table, write a SQL query to find all those employees 
	--who are either Sales Representatives or Salesmen. Return first name, last name and hire date.
		select FIRST_NAME,LAST_NAME,HIRE_DATE from employees
WHERE job_id IN ('SA_REP', 'SA_MAN');
--29. From the following table, write a SQL query to calculate the average salary of employees 
--who receive a commission percentage for each department. Return department id, average salary.

select department_id, AVG(salary) from employees
WHERE commission_pct IS NOT null
GROUP BY department_id;

--30. From the following table, write a SQL query to find the departments 
--where any manager manages four or more employees. Return department_id.

--31. From the following table, write a SQL query to find the departments 
--where more than ten employees receive commissions. Return department id.

create table job_history (EMPLOYEE_ID int, START_DATE date, END_DATE date, JOB_ID varchar(30), DEPARTMENT_ID int)
insert into job_history values (102 ,' 2001-01-13','2006-07-24',' IT_PROG   ', 60),
							   (101 ,' 1997-09-21','2001-10-27',' AC_ACCOUNT',110),
							   (101 ,' 2001-10-28','2005-03-15',' AC_MGR    ',110),
							   (201 ,' 2004-02-17','2007-12-19',' MK_REP    ', 20),
							   (114 ,' 2006-03-24','2007-12-31',' ST_CLERK  ', 50),
							   (122 ,' 2007-01-01','2007-12-31',' ST_CLERK  ', 50),
							   (200 ,' 1995-09-17','2001-06-17',' AD_ASST   ', 90),
							   (176 ,' 2006-03-24','2006-12-31',' SA_REP    ', 80),
							   (176 ,' 2007-01-01','2007-12-31',' SA_MAN    ', 80),
							   (200 ,' 2002-07-01','2006-12-31',' AC_ACCOUNT', 90);

--32. From the following table, write a SQL query to find those employees 
--who have completed their previous jobs. Return employee ID, end_date.

--33. From the following table, write a SQL query to find those employees 
--who do not have commission percentage and have salaries between 7000, 12000 (Begin and end values are included.) 
--and who are employed in the department number 50. Return all the fields of employees.
select * from employees
WHERE commission_pct IS null and SALARY between 7000 and 12000 and DEPARTMENT_ID = 50

--34. From the following table, write a SQL query to compute the average salary of each job ID.
--Exclude those records where average salary is on or lower than 8000. Return job ID, average salary.

select JOB_ID, avg(SALARY) as avg  from employees
group by JOB_ID
having avg(SALARY) > 8000
--35. From the following table, write a SQL query to find those job titles 
--where maximum salary falls between 12000 and 18000 (Begin and end values are included.). Return job_title, max_salary-min_salary.
select JOB_TITLE,MAX_SALARY,MIN_SALARY  from jobs
WHERE MAX_SALARY  between 12000 and 18000;

--36. From the following table, write a SQL query to find the employees
--whose first or last name begins with 'D'. Return first name, last name.
select FIRST_NAME,LAST_NAME  from employees
WHERE  FIRST_NAME like 'D%' or LAST_NAME like 'D%'

--37. From the following table, write a SQL query to find details of those jobs
--where the minimum salary exceeds 9000. Return all the fields of jobs.
select * from jobs
WHERE  MIN_SALARY > 9000
--38. From the following table, write a SQL query to find those employees 
--who joined after 7th September 1987. Return all the fields.
select * from employees
WHERE  HIRE_DATE >  '1987-09-07'



 

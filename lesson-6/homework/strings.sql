
--Puzzle 0
	select * from [TestMultipleZero]
	where a != 0 or b != 0 or c != 0 or d != 0
	--Puzzle 1.1
	SELECT Name,
      sum(CASe Fruit WHEN 'MANGO' THEN 1 else 0 END) AS MANGO,
	   sum(CASe Fruit WHEN 'APPLE' THEN 1 else 0 END) AS APPLE,
		sum(CASe Fruit WHEN 'ORANGE' THEN 1 else 0 END) AS ORANGE,
		sum(CASe Fruit WHEN 'LICHi' THEN 1 else 0 END) AS LICHi
FROM FruitCount 
GROUP BY Name
	--Puzzle 1.2
select number , case 
WHEN number % 15 = 0 THEN 'fizzbuzz' 
WHEN number % 3 = 0 THEN 'fizz' 
WHEN number % 5 = 0 THEN 'buzz' 

else 'False' end as bolinish_qoyidasi
from numbers
--Puzzle 1
SELECT col1, col2 FROM InputTbl
WHERE col1 < col2  
UNION  
SELECT col2, col1 FROM InputTbl
WHERE col2 < col1;

--Puzzle 2
select typ ,
sum(case when Value1 = 'a' then 1 else 0 end  ) +
sum(case when Value2 = 'a' then 1 else 0 end  ) +
sum(case when Value3 = 'a' then 1 else 0 end  ) as count
from GroupbyMultipleColumns
group by typ ;
select *from GroupbyMultipleColumns

--Puzzle 3
SELECT EmpName, occurrences
FROM (
    SELECT EmpName, COUNT(EmpName) AS occurrences
    FROM TESTDuplicateCount
    WHERE EmpName IN ('Pawan', 'Manisha', 'Sharlee', 'Barry', 'Jyoti')
    GROUP BY EmpName
) AS EmpCounts
WHERE occurrences > 1;
--Puzzle 5
select name, 
sum(case when Fruit = 'MANGO' then 1 else 0 end  ) as count_MANGO,
sum(case when Fruit = 'APPLE' then 1 else 0 end  ) as count_APPLE,
sum(case when Fruit = 'ORANGE' then 1 else 0 end  ) as count_ORANGE,
sum(case when Fruit = 'LICHI' then 1 else 0 end  ) as count_LICHI
from FruitCount1
group by name

--Puzzle 3
select EmpName, count(EmpName) name_count from TESTDuplicateCount
group by EmpName
having count(EmpName) > 1
select * from TESTDuplicateCount

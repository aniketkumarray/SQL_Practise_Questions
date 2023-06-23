CREATE TABLE Worker (
	WORKER_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY , 
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);



INSERT INTO Worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
    ('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
    ('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
    ('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
    ('Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
    ('Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
    ('Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
    ('Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
    ('Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');


	CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES
    (001, 5000, '2020-02-16'),
    (002, 3000, '2011-06-16'),
    (003, 4000, '2020-02-16'),
    (001, 4500, '2020-02-16'),
    (002, 3500, '2011-06-16');

	CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

select * from Worker;
select * from bonus;
select * from title;
 
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table 
 -- using the alias name as <WORKER_NAME>.
 
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table 
-- in upper case.

SELECT upper(FIRST_NAME) FROM Worker;


-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT 
-- from Worker table.

SELECT distinct DEPARTMENT FROM Worker;

-- Q-4. Write an SQL query to print the first three characters 
-- of  FIRST_NAME from Worker table.

SELECT substring(FIRST_NAME, 1, 3) FROM Worker;

-- INITIALS OF FIRST NAME AND LAST NAME

SELECT substring(FIRST_NAME, 1,1), substring(LAST_NAME, 1,1) FROM Worker;

SELECT CONCAT(substring(FIRST_NAME, 1,1), substring(LAST_NAME, 1,1)) FROM Worker;

-- Q-5. Write an SQL query to find the position of the 
-- alphabet (‘a’) in the first name column ‘Amitabh’ from Worker 
-- table.

SELECT CHARINDEX('a', FIRST_NAME) AS Position
FROM Worker
WHERE FIRST_NAME = 'Satish';

-- CASE SENSITIVE/ BINARY DEPRECATED
-- SELECT instr(FIRST_NAME, BINARY 'a') FROM Worker WHERE FIRST_NAME = 'Amitabh';
-- SELECT INSTR(FIRST_NAME, BINARY 'a') FROM Worker WHERE FIRST_NAME='Amitabh';


-- Q-6. Write an SQL query to print the FIRST_NAME from Worker 
-- table after removing white spaces from the right side.

SELECT rtrim(FIRST_NAME) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker 
-- table after removing white spaces from the left side.

SELECT ltrim(DEPARTMENT) FROM Worker;


-- Q-8. Write an SQL query that fetches the unique values of 
-- DEPARTMENT from Worker table and prints its length.

SELECT distinct len(DEPARTMENT) FROM Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from 
-- Worker table after replacing ‘a’ with ‘A’.

SELECT replace(FIRST_NAME, 'a', 'A') FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and 
-- LAST_NAME from Worker table into a single column 
-- COMPLETE_NAME. A space char should separate them.

Select CONCAT(FIRST_NAME, '' ,LAST_NAME)  AS COMPLETE_NAME
From Worker


-- Q-11. Write an SQL query to print all Worker details 
-- from the Worker table order by FIRST_NAME Ascending.
SELECT * From Worker
Order By FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details 
-- from the Worker table order by FIRST_NAME Ascending 
-- and DEPARTMENT Descending.
SELECT * From Worker
Order By FIRST_NAME ASC, DEPARTMENT Desc;


-- Q-13. Write an SQL query to print details for Workers 
-- with the first name as “Vipul” and “Satish” from Worker 
-- table.
SELECT * From Worker
Where FIRST_NAME IN ('Vipul','Satish')


-- Q-14. Write an SQL query to print details of workers 
-- excluding first names, “Vipul” and “Satish” from Worker 
-- table.
SELECT * From Worker
Where FIRST_NAME NOT IN ('Vipul','Satish')


-- Q-15. Write an SQL query to print details of Workers 
-- with DEPARTMENT name as “Admin”.

SELECT * From Worker
Where DEPARTMENT = ('Admin')


-- Q-16. Write an SQL query to print details of the Workers 
-- whose FIRST_NAME contains ‘a’.
SELECT * From Worker
Where FIRST_NAME LIKE '%a%'


-- Q-17. Write an SQL query to print details of the Workers 
-- whose FIRST_NAME ends with ‘a’.
SELECT * From Worker
Where FIRST_NAME LIKE '%a'


-- Q-18. Write an SQL query to print details of the Workers 
-- whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * From Worker
Where FIRST_NAME LIKE '_____h'

-- Q-19. Write an SQL query to print details of the Workers 
-- whose SALARY lies between 100000 and 500000.

SELECT * From Worker
Where SALARY between 100000 and 500000
-- Q-20. Write an SQL query to print details of the Workers 
-- who have joined in Feb’2014.

SELECT * From Worker
WHERE JOINING_DATE >= '2014-02-01' AND JOINING_DATE < '2014-03-01';


-- Q-21. Write an SQL query to fetch the count of employees 
-- working in the department ‘Admin’.
Select COUNT(DEPARTMENT) AS DEPCOUNT FROM Worker WHERE DEPARTMENT = 'Admin' 


-- Q-22. Write an SQL query to fetch worker names with 
-- salaries >= 50000 and <= 100000.

SELECT * From Worker
Where SALARY >= 50000 and SALARY <= 100000


-- Q-23. Write an SQL query to fetch the no. of workers 
-- for each department in the descending order.

Select DEPARTMENT, COUNT(DEPARTMENT) AS DEP FROM Worker 
GROUP BY (DEPARTMENT)
ORDER BY (DEPARTMENT) DESC

-- Q-24. Write an SQL query to print details of the 
-- Workers who are also Managers.

SELECT * FROM Worker AS W
JOIN Title AS T
ON W.WORKER_ID = T.WORKER_REF_ID
Where WORKER_TITLE = 'Manager'

-- Q-25. Write an SQL query to fetch duplicate records 
-- having matching data in some fields of a table.

SELECT WORKER_TITLE, Count(*) AS DUP From Title 
Group By WORKER_TITLE 
Having Count(*) > 1

-- Q-26. Write an SQL query to show only odd rows 
-- from a table.

SELECT * From
( Select *, ROW_NUMBER() Over (Order By FIRST_NAME) AS ROW_NO 
FROM Worker)
AS subq
Where ROW_NO % 2 <> 0


-- Q-27. Write an SQL query to show only even rows 
-- from a table.
SELECT * From
( Select *, ROW_NUMBER() Over (Order By FIRST_NAME) AS ROW_NO 
FROM Worker)
AS subq
Where ROW_NO % 2 = 0



-- Q-28. Write an SQL query to clone a new table from 
-- another table.

SELECT* INTO CLONE FROM Worker 
SELECT * From CLONE

-- Q-29. Write an SQL query to fetch intersecting 
-- records of two tables.

SELECT * FROM Worker 
Inner Join Title 
On Worker.WORKER_ID = Title.WORKER_REF_ID

-- Q-30. Write an SQL query to show records from one 
-- table that another table does not have.

SELECT * FROM Worker 
Right Join Bonus
On Worker.WORKER_ID = Bonus.WORKER_REF_ID


-- Q-31. Write an SQL query to show the current date 
-- and time.
Select CURRENT_TIMESTAMP



-- Q-32. Write an SQL query to show the top n (say 10) 
-- records of a table.

Select TOP 10 * FROM Worker -- limit clause is not supported in SQL server




-- Q-33. Write an SQL query to determine the nth (say n=5) 
-- highest salary from a table.

SELECT * FROM
(SELECT FIRST_NAME, SALARY, ROW_NUMBER () Over(Order BY SALARY DESC) AS ROWNUM
FROM Worker )
AS SBQ 
WHERE ROWNUM = 5 



-- Q-34. Write an SQL query to determine the 5th highest 
-- salary without using TOP or limit method.

SELECT * FROM
(SELECT FIRST_NAME, SALARY, ROW_NUMBER () Over(Order BY SALARY DESC) AS ROWNUM
FROM Worker )
AS SBQ 
WHERE ROWNUM = 5 



-- Q-35. Write an SQL query to fetch the list of employees 
-- with the same salary.

SELECT *
FROM Worker
WHERE salary IN (
  SELECT salary
  FROM Worker
  GROUP BY salary
  HAVING COUNT(*) > 1
);


-- Q-36. Write an SQL query to show the second highest 
-- salary from a table.

SELECT * FROM 
( SELECT *, ROW_NUMBER() OVER (ORDER BY SALARY) AS RNO
FROM Worker
)
AS SUB
WHERE RNO = 2


-- Q-37. Write an SQL query to show one row twice in 
-- results from a table.

SELECT * FROM Worker
WHERE WORKER_ID = 2
UNION ALL
SELECT * FROM Worker
WHERE WORKER_ID = 2


-- Q-38. Write an SQL query to fetch intersecting 
-- records of two tables.

SELECT * FROM Worker AS W
Inner JOIN Bonus AS B
ON W.WORKER_ID = B.WORKER_REF_ID


-- Q-39. Write an SQL query to fetch the first 50% 
-- records from a table.
SELECT TOP 50 PERCENT *
FROM Worker
Order BY FIRST_NAME



-- Q-40. Write an SQL query to fetch the departments 
-- that have less than five people in it.
SELECT DEPARTMENT FROM 
(SELECT DEPARTMENT , COUNT(*) AS CT FROM Worker
Group By DEPARTMENT) AS SUB
Where CT < 5
--OR
SELECT DISTINCT DEPARTMENT
FROM Worker
WHERE DEPARTMENT IN (
  SELECT DEPARTMENT
  FROM Worker
  GROUP BY DEPARTMENT
  HAVING COUNT(*) < 5)
-- Q-41. Write an SQL query to show all departments 
-- along with the number of people in there.

SELECT DEPARTMENT, COUNT(DEPARTMENT) AS Number_Of_Employee
FROM Worker
GROUP BY DEPARTMENT
Order By DEPARTMENT


-- Q-42. Write an SQL query to show the last record 
-- from a table.

SELECT TOP 1*
From Worker
Order By WORKER_ID DESC


-- Q-43. Write an SQL query to fetch the first row 
-- of a table.

SELECT TOP 1*
From Worker
Order By WORKER_ID 


-- Q-44. Write an SQL query to fetch the last five 
-- records from a table.

SELECT TOP 5 *
From Worker
Order By WORKER_ID DESC

-- Q-45. Write an SQL query to print the name of employees 
-- having the highest salary in each department.

SELECT * FROM Worker 
WHERE SALARY IN
(
SELECT MAX(SALARY)
FROM Worker
Group BY DEPARTMENT
)

-- Q-46. Write an SQL query to fetch three max salaries 
-- from a table.

SELECT TOP 3 * FROM Worker
ORDER BY SALARY DESC

-- Q-47. Write an SQL query to fetch three min salaries 
-- from a table.

SELECT TOP 3 * FROM Worker
ORDER BY SALARY 


-- Q-48. Write an SQL query to fetch nth max salaries 
-- from a table.

SELECT TOP 1 Salary
FROM (
    SELECT DISTINCT TOP 1 Salary --in place of 1 write your desired number
    FROM Worker
    ORDER BY Salary DESC
) AS subquery
ORDER BY Salary ASC;


-- Q-49. Write an SQL query to fetch departments along 
-- with the total salaries paid for each of them.

SELECT DEPARTMENT, SUM(SALARY) AS TOTPAID
FROM Worker
GROUP BY DEPARTMENT


-- Q-50. Write an SQL query to fetch the names of workers 
-- who earn the highest salary.

SELECT  CONCAT(FIRST_NAME,'',LAST_NAME)AS Name,SALARY
FROM Worker
WHERE SALARY IN 
(select max(SALARY)
FROM Worker)
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE worker( WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, FIRST_NAME CHAR (25),
LAST_NAME CHAR (25), SALARY INT (25), JOINING_DATE DATETIME, DEPARTMENT CHAR (25));

INSERT INTO worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
(001,'monika','arora',100000,'14-02-20 09:00:00','HR'),
(002,'niharika','verma',80000,'14-06-11 09:00:00','Admin'),
(003,'vishali','singhal',300000,'14-02-20 09:00:00','HR'),
(004,'amitabh','singh',500000,'14-02-20 09:00:00','Admin'),
(005,'vivek','bhati',500000,'14-06-11 09:00:00','Admin'),
(006,'vipul','Diwan',200000,'14-06-11 09:00:00','Account'),
(007,'satish','kumar',75000,'14-01-20 09:00:00','Account'),
(008,'geetika','chauhan',90000,'14-04-11 09:00:00','Admin');

select * from worker;

CREATE TABLE Bonus( WORKER_REF_ID INT, BONUS_AMOUNT INT(10), BONUS_DATE DATETIME, FOREIGN KEY (WORKER_REF_ID)
REFERENCES worker(WORKER_ID) ON DELETE CASCADE); 

INSERT INTO Bonus(WORKER_REF_ID, BONUS_AMOUNT,BONUS_DATE) VALUES
(001,5000,'16-02-20'),
(002,3000,'16-06-11'),
(003,4000,'16-02-20'),
(001,4500,'16-02-20'),
(002,3500,'16-06-11');

select * from Bonus;

CREATE TABLE title(
WORKER_REF_ID INT, WORKER_TITLE CHAR(25), AEFECTED_FROM DATETIME, FOREIGN KEY(WORKER_REF_ID)
REFERENCES worker(WORKER_ID) ON DELETE CASCADE);

INSERT INTO Title(WORKER_REF_ID, WORKER_TITLE, AEFECTED_FROM) VALUES
(001,'Manager','2016-02-20 00:00:00'),
(002,'Executive','2016-06-11 00:00:00'),
(008,'Executive','2016-06-11 00:00:00'),
(005,'Manager','2016-06-20 00:00:00'),
(004,'Asst Manager','2016-06-11 00:00:00'),
(007,'Executive','2016-06-20 00:00:00'),
(006,'Lead','2016-06-11 00:00:00'),
(003,'Lead','2016-06-11 00:00:00');

select * from Title;

-- DRL
SELECT * FROM worker WHERE SALARY > 80000;
SELECT * FROM worker WHERE DEPARTMENT = 'HR';

-- SALARY [80000 - 3000000]
SELECT * FROM worker WHERE SALARY BETWEEN 80000 AND 3000000;

-- reduce OR statements
SELECT *FROM worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';
-- Better way: IN
SELECT *FROM worker WHERE DEPARTMENT IN ('HR','Admin');
-- NOT IN
SELECT *FROM worker WHERE DEPARTMENT NOT IN ('HR','Admin');

-- WILDCARD
SELECT *FROM worker WHERE FIRST_NAME LIKE '%i%';
SELECT *FROM worker WHERE FIRST_NAME LIKE '_i%';

-- Sorting using ORDER BY
SELECT *FROM worker ORDER BY SALARY;

-- for DECENDING order
SELECT *FROM worker ORDER BY SALARY DESC;

-- DISTINCT KEYWORD USE
SELECT DISTINCT DEPARTMENT FROM worker; 

-- GROUP BY without aggregation function (it will treat it like distinct)
SELECT DEPARTMENT FROM worker GROUP BY DEPARTMENT;

-- GROUP BY with aggregation function (COUNT aggreation function is used)
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM worker GROUP BY DEPARTMENT;

-- AVG salary per deprtment 
SELECT DEPARTMENT, AVG(SALARY) FROM worker GROUP BY DEPARTMENT;

-- Minimum salary
SELECT DEPARTMENT, MIN(SALARY) FROM worker GROUP BY DEPARTMENT;

-- maximum salary
SELECT DEPARTMENT, MAX(SALARY) FROM worker GROUP BY DEPARTMENT;

-- sum or total of the salary
SELECT DEPARTMENT, SUM(SALARY) FROM worker GROUP BY DEPARTMENT;

-- GROUP BY with HAVING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;





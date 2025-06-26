-- ok now for example lets take a scenario im a real world scenario there are a lot databases present in a website or a server we cannot know the name of all the databaes right in orcer to accidenta;y creating a prompt such that an error occurs what we can do is we use if exists command after creating 
--CREATE DATABASE IF NOT EXISTS emlpoyees;
-- This will now create the employees database if and only if the databses employees does not exits COMMENT
-- so like we can do the same concept with dropping also like in we want to delete a database but it doesnot exists only we will get an error so it is good practicw
--DROP DATABASE IF EXISTS company


--------keys-----------
--- Special column in a table is known as a key 
---- there are two types keys in sql that is primary key and foriegn key C
-- A primary key is a column or a set of columns in a table which suggest that the this column contains only unique values meanin well defined or no same values like the college id of a student in a college can be a primary ckey but the name cannot be because 2 students can have the same name 
--also primary key cannot be null it has to have somevalue 
--- a foreign key is a column or a set of columns in tablw whcih referes to a primary key of a different table 
-- a foregn key may or maynot have unique values 


--------------Constraints--------------------

-- when we write a column we always initialize data values first after that we also insert a ything called constraints . Constraints are like chains they resist the use of a particular feature of a column 
-- Not Null - says a column cannot have not null values C
-- int unique - it says that the datatype of that particular column is int and all the values in that particulafr column needs to be unique
-- Primary key - it makes the particular column unique and not null but can only be used for 1 column only you cannot make another column primary jey with the helpf the primary key constraints we can also write the combination to be unique and not null in the primary key 

use emlpoyees;
create table students (student_id varchar(50) , student_name varchar(50) , primary key (student_id , student_name));
-- so here the combination becomes a primary key 

-- now we will use the foreign key constraints

use emlpoyees;
create table students (student_id varchar(50) , student_name varchar(50) , payment FLOAT(10) , primary key (student_id , student_name) , FOREIGN key (payment) references emlpoyees(hourlypay) );
-- so here we have given the payment of the student as the foreign key which is a primary key in the table employees with the name of column hourly pay 

-- Default constraints 
-- for eg we have added a new employee and the basic initially salry of the employee is 10 rupees so in order to like not write each and every new persons salary one by one we can use the defalut constraints 
ALTER TABLE employees
modify hourlypay decimal (5, 2) default 10 
-- Check clause -- check clause checks whether  a partcular attribute is used in the rows and if not used will give an error or maybe will not allow a particular attribute to enter 
--lets take an example 
create table students (
    student_id int primary key , 
    city varchar(50),
    age int UNSIGNNED ,
    CONSTRAINT age_check check (age >= 19 AND city = "DELHI")
); 
-- so from here we can see that the table should contain data about the students name id city age but as due tp presence of the contraints clause no row will contain age lesser than 18 and any other city than delhi  
-- another way we can do this by 

CREATE table students (
    age int check(age >= 18),
);

-- this will allow simulataneous checking of the age when data is entered

------ Entering CSV files in a database ------

create table students (
    student_id int primary key , 
    city varchar(50),
    age int UNSIGNNED ,
    CONSTRAINT age_check check (age >= 19 AND city = "DELHI")
);

-- first create a table -----

copy 
students (student_id , city , age )
FROM (csv path file location)
DELIMITER ','
CSV HEADER ; 

-- t=his the way of integrating a csv file into a sql database 



----------------- SELECT -----------------

--1--
 
 SELECT col1 , col2 FROM table_name -- Selects that particular column form the table 

--2--

SELECT DISTINCT colno. FROM table_name -- Selects distincts valeus froma aparticulzr column from a table 

--3--

SELECT CITY , AGE FROM table_name 
WHERE CITY = 'DELHI' AND AGE >= 18 ; -- SLECTS tose columns where the age is greater than 18 and the city os delhi 

-- With where clause we can use a lot of operators like 
--1 arthimatic operater
--2 logical operator 
--3 comparison  operator
--4 BITWISE operator 

--1-- 

SELECT * FROM students WHERE marks BETWEEN 80 AND 90 -- remeber here the between operator is geting used and will give the ouput of marks where the marks is 80 and 90 but remember these number inclusive 

--2--

SELECT * FROM students WHERE city in ("DELHI" , "MUMBAI") -- here we are using the in clause which shows those cities which are delhi and mumbai 

--3--

SELECT * FROM students WHERE city not in ("DELHI" , "MUMBAI") -- here same to same will give those data where the city is not mumbai or delhi 

--4-- 

SELECT col1 , col2 FROM table_name 
limit 3   -- here we are limiting number of rows so by giving the limit number it will limit to 3 rows for those 2 columns 

-- 5--

SELECT * FROM Students 
ORDER BY city ASC ; -- Orders the city in asc order 

--------Agregate FUNCTIONS--------

-- these functions take in multiple input gives a single output multiplexer think of it like a multiplxer 

--1--

SELECT MAX(marks) -- Takes in the full marls row and gives the maximum marks amongst them 
FROM Students;

--2-- 

SELECT MIN(marks) -- Takes in the full marks row and gives the minimum marks amongst them 
FROM Students;

--3--

SELECT AVG(marks) -- Takes in the full marks row and gives the AVerage marks amongst them 
FROM Students;

--4--

SELECT COUNT(name) -- takes the names row gives the number of students present in the class for a particular table 
FROM Students;

--5--

SELECT city , count(name) -- select the city row and groupz it with the count of name that is says how many students are sti=udying in a particular city 
FROM students 
GROUP BY city ; 

--6--

SELECT city , count(name) FROM Students  -- select the citys and groups them with respect to the number of students present in the different city and the sort them wrt to the marks having maximumum greater than eqauls to 90
GROUP BY city 
HAVING max(marks) >=90 

--General order of wrting clauses 

SELECT 
FROM 
WHERE 
GROUP BY
HAVING 
ORDER BY 

-- TAbel related queries--

UPDATE students 
set city = "DELHI"]
where city = "MUMBAI" --- it updates the tabel where the city is mumbai to delhi 

--Switching  of safe mode in sql 

SET SQL_SAFE_UPDATES = 0 ; -- this will  disable the safe mode 

--Switching  on safe mode in sql 

SET SQL_SAFE_UPDATES = 1 ; -- this will enable the safe mode 

--DELETING ROWS 

DELETE FROM students
WHERE city = "DELH" -- DELETES the rows where the city is delhi 

--Foreign KEYS 


-- We already know what is a foreign key . A foreign key can be understood as a key of different table which is the primary key of another table it is used to join 2 tables togther this relationship between tables can be seen using a aeer diagram 

CREATE DATABASE COLLEGE; -- CREATES A DATABASE COLLEGE 
CREATE TABLE DEPARTMENT ( dept_id INT UNSIGNED , dept_name VARCHAR(50) , hod_name varchar(50) ,  -- generating inserting tables 
                            no_of_teachers INT UNSIGNED , number_of_st_in_1styear INT , 
                            number_of_st_in_2ndyear INT , number_of_st_in_3rdyear INT , 
                            number_of_st_in_4thyear INT , primary key (dept_id) );
 CREATE TABLE TEACHERS( teacher_id INT UNSIGNED ,
                        name_teachers VARCHAR(50), 
						subjects VARCHAR(50) , 
                        depart_id INT UNSIGNED , 
                        PRIMARY KEY(teacher_id) , 
                        FOREIGN KEY (depart_id) REFERENCES DEPARTMENT(dept_id)) ; -- so here we can see that the table is related wioth the department table via the foreign key 

-- CASCADING OF FOREIGN KEY ---
-- there are 2 types of cascading in foreign keys they are ON UPDATE CASCADE ON DELETE CASCADE
  
  ON UPDATE CASCADE -- means the changes in any the child table results in the changes in the table of the parent table
  ON DELETE CASCADE -- M=means deletion in the child key results in the deletion in the table of the parent key 

  -- when we want to change the schemas of a particular table we will use the alter command 
  -- schemas meaing design add co;=lumn delete column etc etcs
  -- ADD COLUMN--

  ALTER TABLE table_name
  ADD COLUMN col1

  -- DROP A COLUMN--
  ALTER TABLE table_name
  DROP COLUMN col1;

  -- RENAME A TABLE 
ALTER TABLE table_name 
RENAME TO new table_name ;

--  MODIFY TABLE--
-- IT IS USED FOR MODIFYING THE DATA TYPE OF A COLUMN 

ALTER TABLE students
MODIFY COLUMN name 

-- TRUNCATE-- 
-- IF WE WANNA LIKE DELETE ALL THE DAtAS IN THE TABLE THEN WE USE THE TRUCATE COMMAND 

TRUNCATE TABLE table_name ;

-- DIFFERENCE BETWEEN DROPING A TABLE AND TRUNCATING A TABLE IS THAT IT DROPPING A TABLE DELETES THE ENTIRE TABLE WHILE TRUNCATING A TABLE IS DELETEING THE DATA IN THR TABLE 

-- SQL JOINS --

-- JOINS IN SQL IS USED TO COMBINE ROWS FROM @ DIFFERENT TABLE BASED ON COMMON COLUMNS 

-- THERE ARE 4 TYPES OF JOINS IN SQL 

--1. INNER JOIN 
--2. LEFT JOIN
--3. RIGHT JOIN 
--4. FULL JOIN 


--INNER JOIN 

-- INTERSECTION CONCEPT IN SETS SAME SHIT 
-- lets create this table 

USE COLLEGE ;
-- DEPARTMENTS 
CREATE TABLE DEPARTMENT ( dept_id INT UNSIGNED , dept_name VARCHAR(50) , hod_name varchar(50) , 
                            no_of_teachers INT UNSIGNED , number_of_st_in_1styear INT , 
                            number_of_st_in_2ndyear INT , number_of_st_in_3rdyear INT , number_of_st_in_4thyear INT , primary key (dept_id) );
-- INSERTING VALUES IN DEPARTMENTS 
INSERT INTO department ( dept_id  , dept_name  , hod_name  , no_of_teachers ,  number_of_st_in_1styear , 
                            number_of_st_in_2ndyear , number_of_st_in_3rdyear  , number_of_st_in_4thyear )
VALUES (1 , "Electronics and Communication Engineering (ECE)" , "Dr. Neha Sharma" ,	18 ,	90 ,	85 , 	78 , 72) , 
       (2 , "Computer Science and Engineering (CSE)" , "Dr. Rajeev Mehta", 24 ,	100	, 95 ,88 , 	83),
       (3 , "Mechanical Engineering (ME)" , "Dr. Priya Deshpande", 20 ,	80	,75	, 70 , 68) , 
       (4 , "Electrical Engineering (EE)" , "Dr. Anil Reddy", 16,	85,	82 ,	76 , 55) , 
       (5, "Civil Engineering (CE))" , "Dr. Meera Iyer", 14 ,	75 ,	68 ,	62 , 62) ,
        (6, "Information Technology (IT)" , "Dr. Sandeep Sinha", 21	,92,	86,	80 , 80) ,
       (7, "Instrumentation and Control Engineering (ICE)" , "Dr. Kavita Joshi", 12	,60 ,	55 ,	48 , 48),
       (8, "Chemical Engineering (ChE) " , "Dr. Rohan Bhattacharya", 17 ,	65 ,	60 ,	57 ,	52),
        (9, "Aerospace Engineering (AE) " , "Dr. Sneha Kulkarni", 15	,50,	47,	42,	39);
SELECT * FROM DEPARTMENT;
-- CREATING A TEACHERS TABLE
 CREATE TABLE TEACHERS( teacher_id INT UNSIGNED ,
                        name_teachers VARCHAR(50), 
						subjects VARCHAR(50) , 
                        depart_id INT UNSIGNED , 
                        PRIMARY KEY(teacher_id) , 
                        FOREIGN KEY (depart_id) REFERENCES DEPARTMENT(dept_id)) ;      
SELECT * FROM TEACHERS;
-- creating students table 
CREATE TABLE STUDENTS (std_id INT UNSIGNED ,
                        std_year INT, 
                        depart_id INT UNSIGNED , 
						std_fees DECIMAL(7 , 4) ,
                        PRIMARY KEY(std_id) , 
                        FOREIGN KEY (depart_id) REFERENCES DEPARTMENT(dept_id)) ; 
SELECT * FROM STUDENTS;


--AS there are dept id s in both teachers and departments what we will do we will use the concept of inner join here 

SELECT *
FROM TEACHERS
INNER JOIN DEPARTMENT 
on TEACHERS.depart_id = DEPARTMENT.dept_id;

--we cam use aliases also when there are a large number of tables like 

SELECT *
FROM TEACHERS as S -- this is an alias 
INNER JOIN DEPARTMENT 
on TEACHERS.depart_id = DEPARTMENT.dept_id;


---- LEFT JOIN 

-- WE WILL BE USING THE SAME TABLE IN ABOVE 
-- IT RETURNS ALL THE DATA IN THE LEFT TABLE ALONG WITH DATAS THAT IS INTERSECTION WITH THE RIGHT TABLE

-- KINDA LIKE SAME SYNTAX

SELECT * 
FROM TEACHERS as t
LEFT JOIN DEPARTMENT as d
ON t.depart_id = d.dept_id 

-- SO THIS DOES THE LEFT JOIN OF THE TABLE WHERE WE WANT TO VIEW THE TABLE 
-- IT WILL GIVE THE NAMES\ DATAS OF THE LEFT table as well as those datas that are in conjunction with the right table

---- RIGHT JOIN 

-- WE WILL BE USING THE SAME TABLE IN ABOVE 
-- IT RETURNS ALL THE DATA IN THE RIGHT TABLE ALONG WITH DATAS THAT IS INTERSECTION WITH THE LEFT TABLE

-- KINDA LIKE SAME SYNTAX

SELECT * 
FROM TEACHERS as t
RIGHT JOIN DEPARTMENT as d
ON t.depart_id = d.dept_id 

-- SO THIS DOES THE RIGHT JOIN OF THE TABLE WHERE WE WANT TO VIEW THE TABLE 
-- IT WILL GIVE THE NAMES\ DATAS OF THE RIGHT table as well as those datas that are in conjunction with the left  table

-- SELF JOIN--

--- MY SQL THERE IS NO SUCH COMMAND FOR SELF JOIN WHICH IS THE UNION OF SETS SO WE WILL BYPASS IT BY USING THIS SYNTAX
-- IN ORDER TO THIS FULL JOIN SHIT WE USE FIRST DO THE LEFT JOIN THEN DO THE ROGHT JOIN THE DO AN UNION TO GET THE FULL JOIN

SELECT *
FROM TEACHERS AS t
LEFT JOIN DEPARTMENT AS d
ON t.depart_id = d.dept.id
UNION 
SELECT *
FROM TEACHERS AS t
RIGHT JOIN DEPARTMENT AS d
ON t.depart_id = d.dept.id

-- SPECIAL JOINS

-- REMEMBER SET THEORIES A-B VALUES OF A NOT IN BE FORMULA IS n(A-B) = n(A) - n(A INTERSECTION B) SO SAME CONCEPT HERE WE WILL DO THAT IS 
-- THE LEFT EXCLUSIVE JOIN

SELECT *
FROM TEACHERS AS t
LEFT JOIN DEPARTMENT AS d  -- THIS ENTIRE SHIT GIVES THE LEFT SET OR A BOW FOR THE A-B PSRT 
ON t.depart_id = d.dept.id
WHERE d.id IS NULL ;

-- RIGHT EXCLUSIVE JOIN 

-- SAME BUT n(B-A)

SELECT *
FROM TEACHERS AS t
RIGHT JOIN DEPARTMENT AS d  -- THIS ENTIRE SHIT GIVES THE LEFT SET OR A BOW FOR THE A-B PSRT 
ON t.depart_id = d.dept.id
WHERE t.id IS NULL ;

-- FULL EXCLUSIVE JOIN 

-- THIS SHIT IS THE n(A-B) U n(B-A) 

SELECT *
FROM TEACHERS AS t
LEFT JOIN DEPARTMENT AS d  -- THIS ENTIRE SHIT GIVES THE LEFT SET OR A BOW FOR THE A-B PSRT 
ON t.depart_id = d.dept.id
WHERE d.id IS NULL ;
UNION 
SELECT *
FROM TEACHERS AS t
RIGHT JOIN DEPARTMENT AS d  -- THIS ENTIRE SHIT GIVES THE LEFT SET OR A BOW FOR THE A-B PSRT 
ON t.depart_id = d.dept.id
WHERE t.id IS NULL ;


--SELF JOIN 

-- WHEN WE WANT TO JOIN 2 TABLES WE WILL USE THIS SHIT 

SELECT *
FROM TEACHERS as t
JOIN DEPARTMENTS as d
ON t.depart_id = d.dept_id


-- CREATING AN HIERARCHICAL TABLE USING SELF JOIN 

CREATE TABLE employees (id INT , NAME VARCHAR(20), MANAGER_ID INT) ; 
-- INSERTING VALUES IN THE TABLE 
INSERT INTO employees
values (101 , "ADAM" , 103),
        (102 , "BOB" , 104) , 
        (103 , "CASEY" , NULL) ,
        (104 , "DONALD" , 103) ;

SELECT a.name as MANAGER_name , b.name 
FROM employees as A
JOIN employees as B
ON A.id = B.MANAGER_ID

-- UNION 

-- UNITES 2 TABLES REJECTING REPEATATION AS SAME AS CONCEPT IN SETS 

SELECT columns_no FROM table_a
UNION 
SELECT columns_no FROM table_b

-- UNION ALL

-- UNITES 2 TABLES ALLOWING REPEATATION 

SELECT columns_no FROM table_a
UNION ALL
SELECT columns_no FROM table_b

--====================================== SQL SUB QUERIES ==================================================





-- So whem we are like inserting a query under a query this system is know as sub query in sql 
--it helps to make the system a lot more dynamic 

----PROBLEM STATEMENT 1
-- FIND THE AVERGAE MARKS OF THE STUDENT AND ALSO FIND THE NAMES OF THE STUDENTS THTA HAVE MARKS GRETATER THAN THE AVERAGE 
-- LET US ASSUME THAT WE HAVE A TABLE OF STUDENTS 

-- AVERAGE MARKS

SELECT AVG(MARKS)
FROM STUDENTS ;
-- MPW FINDOMG THE NAMES OF STUDENTS HAVING GREATER THAN THE AVERAGE MARKS

SELECT NAME 
FROM STUDENTS 
WHERE MARKS >(SELECT AVG(MARKS)
FROM STUDENTS ;)


---PROBLEM STATEMENT 2

-- FIND THE EVEN ROLL NUMBERS 
-- FIND THE NAME OF THE STUDENTS WITH EVEN ROLL NUMBERS 

-- GIVES ALL THE EVEN ROLL NUMBERS
SELECT roll_no 
FROM STUDENTS 
WHERE roll_no % 2 = 0

-- GIVES ALL THE NAMES OF STUDENTS HAVING EVEN ROLL NUMBER 

SELECT name 
FROM STUDENTS 
WHERE roll_no IN (SELECT roll_no 
                FROM STUDENTS 
                WHERE roll_no % 2 = 0)

-- PROBLEM STATEMENT 3
-- FIND THE MAXIMUM MARKS FROM STUDNTS OF DELHI 

SELECT MAX(marks)
FROM
 (SELECT * FROM
STUDENTS 
WHERE CITY = "DELHI") AS TEMP ;




-- ========================== MY SQL VIEWS ============================================



--  VIEWS IN MYSQL ARE VIRTUAL TABLES BASED ON THE SET OF COMMANDS GIVEN 


-- when we want to like create a sub table from a real table in a databse to perform operations in the that virtual table such that there is no permanent chanegs in the real table is called views

CREATE VIEW view1 as 
SELECT dept_id , teacher_name from TEACHERS ; 

-- THIS CREATED A SMALL TABLE CONTAINING ONLY DEPT ID AND TEACHER NAME KNOWN AS VIEW1
-- AFTER THIS WE CAN LIKE EASILY DO THE SAME FUNCTIONS THAT WE DO IN THE TABLE WE CAN DO WIT THE VIEWS 

SELECT * FROM view1;

-- ETC ETC ETC -- 

--- FINISHED SQL 
-- completed the DDL , DML , DQL  in mysql 

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

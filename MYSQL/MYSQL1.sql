--OK in order to first use a SQL we need to know some bassics formats 
--first let us start by create a database in mysql workbench 

 CREATE DATABASE mydb;
--this will create the database my db 
--After that if we want to drop a database we ned to use 
--DROP DATABASE myDb;
--this will drop the database and delete it 
--in order to use the database we need set the databse to set as default schema 
--After that in order create a table in mysql in the database in mydb 
CREATE TABLE employees (employeeid int , Firstname varchar(50), lastname(50), dateofjoining(DATE) , hourlypay DECIMAL(5 , 2));
--after that we can select the table by using the this format 
SELECT * FROM employees ;
--if you need to rename a table we need to use this syntax
RENAME TABLE employees to workers ;
--this will now rename the table to workers 
--if we want to delete the table we use the same context 
-- DROP TABLE employees ;
--ok now if we want to like have a new column to mytable we will use this format 
ALTER TABLE employees 
 ADD phonenumber INT ;
--now we want to like change the name of a particular column we can do that 
 ALTER TABLE employees 
 RENAME COLUMN phonenumber to email ;
--now as we have changed the name but we havr still not changed the type of the email character it is still integar type data so inorder tot change we will use this syntax
ALTER TABLE employees 
 MODIFY COLUMN email VARCHAR(100);
--now for example we need to use the and change the email column position in thet table lests ay near the first name so 
ALTER TABLE employees 
 MODIFY COLUMN email VARCHAR(100)
 AFTER lastname ;
--if we want to like change the position of a column in the absolutue first we do not need to writ e so much instead we can us ethis syntax 
ALTER TABLE employees 
MODIFY COLUMN email varchar(100)
FIRST ;
--in order to like delete a column we can do by this
ALTER TABLE employees 
 DROP COLUMN email ; 
SELECT * FROM employees 
--so we will drop the email column
--now we will entering data in our table so 
 INSERT INTO employees 
 VALUES (1 , "Sparsho" , "Chakraborty" , "2023-11-05", 234.69) , 
         (2 , "Sayanatan" , "Maitra" , "2023-01-27", 50.69) ,
       (3 , "Avaish" , "Siddiqui" , "2023-12-07", 200.69) ,
        (4 , "ALAM" , "Mohanamaad" , "2023-10-19", 256.69) ;
 SELECT * FROM employees ;
--so now we have created a table with all the data entries in it
--now for exmample we are creating a new joinee who has recently joined our group which is rahul and we like have not decided to the hourly payment and his recruitment date so in order to do or like in order to add a person but like keep some parametres empty we can do so by using this syntax 
INSERT INTO employees (employeeid , Firstname , lastname )
 VALUES (5 , "Rahul" , "Raj") ;
       
 SELECT * FROM employees ;
--so for example we know that there is something called signed and unsigned values ok so for example an age cannot be negetive right so inorder to increase the range of a datatype we can use the unsigned sysntax ok lets understand it with an example 

--ok let say we know that tinyint (-125 tp 125)  but if we are importing data like an age we can increase this range by using the concept of unsigned data that is

ALTER TABLE employees 
 ADD COLUMN age TINYINT UNSIGNNED (10) ;
 SELECT * FROM employees ;
 INSERT INTO employees (age)
 VALUE (26),(21).(22),(20),(21);
 SELECT * FROM emlpoyees;

-- ===========================================
-- 🧠 SQL Language Classification Summary
-- ===========================================

-- 1️⃣ DDL - Data Definition Language
--     Commands: CREATE, DROP, ALTER, TRUNCATE
--     Purpose: Define and modify database structure

-- 2️⃣ DQL - Data Query Language
--     Command: SELECT
--     Purpose: Query and retrieve data

-- 3️⃣ DML - Data Manipulation Language
--     Commands: INSERT, UPDATE, DELETE
--     Purpose: Manage data inside schema objects

-- 4️⃣ DCL - Data Control Language
--     Commands: GRANT, REVOKE
--     Purpose: Control access to data

-- 5️⃣ TCL - Transaction Control Language
--     Commands: COMMIT, ROLLBACK, SAVEPOINT
--     Purpose: Manage transactions in the database
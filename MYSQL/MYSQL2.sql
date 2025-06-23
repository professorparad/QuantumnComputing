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

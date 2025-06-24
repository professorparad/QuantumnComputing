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


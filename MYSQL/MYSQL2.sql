-- ok now for example lets take a scenario im a real world scenario there are a lot databases present in a website or a server we cannot know the name of all the databaes right in orcer to accidenta;y creating a prompt such that an error occurs what we can do is we use if exists command after creating 
CREATE DATABASE IF NOT EXISTS emlpoyees;
-- This will now create the employees database if and only if the databses employees does not exits COMMENT
-- so like we can do the same concept with dropping also like in we want to delete a database but it doesnot exists only we will get an error so it is good practicw
DROP DATABASE IF EXISTS company

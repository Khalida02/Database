/*
 TASK 1
 DDL - Data Definition Language         DML - Data Manipulation Language
 - To create the database schema        - To populate and manipulate database
 - Statement can't be undo              - Statement can be undo
 - Works on whole table                 - Works on one or more rows

 a) CREATE TABLE universities(          b) SELECT, INSERT, UPDATE, DELETE
        name varchar(50),                   SELECT * FROM universities;
        city varchar(20)));                 INSERT INTO universities VALUES('KBTU', 'Almaty')
DROP DATABASE database;                     UPDATE universities SET number_of_students = 2200;
ALTER TABLE universities                    DELETE FROM universities WHERE name = 'KBTU';
    ADD COLUMN students INTEGER;
RENAME COLUMN students TO number_of_students;
 */
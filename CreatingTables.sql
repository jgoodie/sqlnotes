/*
use exampleDB;
show tables;
*/
/* show databases; */
/* create DATABASE exampleDB2; */
/* drop DATABASE exampleDB2; */
/* DROP DATABASE IF EXISTS tutorial_database; */
/*
create DATABASE IF NOT EXISTS exampleDB;
create DATABASE IF NOT EXISTS exampleDB2;
use exampleDB2;
create TABLE Students (
StudentID INT NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Gender CHAR(1),
Email VARCHAR(30) NOT NULL,
PRIMARY KEY (StudentID)
)
*/
/*
create TABLE Sales_Data (
StoreLocation VARCHAR(30) NOT NULL,
Product VARCHAR(30) NOT NULL,
Date DATE NOT NULL,
Revenue DEC(10,2) NOT NULL DEFAULT 0.0,
PRIMARY KEY (StoreLocation, Product, Date)
)
*/
/* Referential Integrity */
/*
create TABLE Campus_Housing
(
StudentID INT NOT NULL,
DormitoryName VARCHAR(50),
AptNumber INT,
CONSTRAINT fk_students_studentid
FOREIGN KEY (StudentID)
REFERENCES Students (StudentID)
)
*/
show tables;
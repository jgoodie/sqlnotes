use exampleDB2;
/*
show tables;
select * from Students;
*/
/* The StackSkill tutorial video was wrong here insert into TABLE table_name is incorrect */
/*
insert into Students
(FirstName,LastName,Gender,Email)
VALUES
('John','Goodman','M','john.goodman@hds.com');

insert into Students
(FirstName,LastName,Gender,Email)
VALUES
('Janani','Ravi','F','janani@loonycorn.com');
*/
/*
insert into Students
(Gender, Email, FirstName, LastName)
VALUES
('F', 'swetha@loonycorn.com', 'Swetha', 'Kolalapudi');
*/
/* The StackSkills Tutorial vid is wrong here. It looks like you have to specify the first column. Auto-increment will not just do it */
/*
insert into Students
VALUES
('4','Navdeep','Singh','M','navdeep@loonycorn.com');
*/
/* GENDER is omitted and is therefor automatically set to NULL */
/*
insert into Students
(Email, FirstName, LastName)
VALUES
('matweenwa@gmail.com','Ahmad','Mateen');
*/
/*
insert into Students 
(StudentID, Email, FirstName, LastName)
values
(99, 'anuradha@gmail.com','Anu','Radha');
*/
/*
insert into Students 
(Email, FirstName, LastName)
values
('pradeep@loonycorn.com','Pradeep','Shetty');
*/
/* Will fail because of duplicate primary key entry
insert into Students 
(StudentID, Email, FirstName, LastName)
values
(99, 'farts@gmail.com','fart','barf');
*/
select * from Students;

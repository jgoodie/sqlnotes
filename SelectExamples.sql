use exampleDB;
/* show tables; */
/* select email from students where gender = 'F'; */
/* select email from students; */
/* select email from students where gender = 'F' and firstname = 'JANANI'; */
/* select email from students where gender = 'F' or firstname = 'JANANI'; */
/* select * from students where gender = 'F'; */
/* select firstname, lastname, email from students where gender = 'F'; */
/* select * from Students; */
/* select * from Campus_Housing; */
/*select email from students where gender = 'F';*/
/* select dormitoryname from campus_housing;*/
/* select studentid from campus_housing where dormitoryname = 'AKBAR\'S HOUSE';*/
/* select studentid from campus_housing where dormitoryname = 'AKBAR''S HOUSE'; */
/* select studentid from campus_housing where dormitoryname = NULL; */ /* does not work */
/* select studentid from campus_housing where dormitoryname is NULL; */ /* correct */
/* select studentid from campus_housing where dormitoryname is not NULL; */ /* correct */

/* select email, gender from students; */
/* select * from students where studentid = '4'; */
/* select email from students where studentid = '4'; */
/* select email from students where studentid <> '4'; */
/* select email from students where studentid > '4'; */
/* select * from students; */
/* select email from students where studentid <= '4'; */
/* select studentid from campus_housing where dormitoryname is NULL;*/
/* select firstname, lastname, email from students, campus_housing where dormitoryname is NULL and students.studentid = campus_housing.studentid; */
/* SAME AS ABOVE BUT USING ALIASES */
/* select firstname, lastname, email from students s, campus_housing c where dormitoryname is NULL and s.studentid = c.studentid; */
/* WILDCARDS!!! */
/* select email from students where email like '%loonycorn%'; */
/* between, in and not it */
/* select studentid from Campus_Housing where AptNumber > 200 and AptNumber < 400; */
/* select studentid from Campus_Housing where AptNumber between 201 and 399; */
/* comparing across tables */
/* select AptNumber from students s, Campus_Housing c where (firstname = 'JANANI' or firstname = 'SWETHA') and s.studentid = c.StudentID; */
/* select AptNumber from students s, Campus_Housing c where FirstName in ('JANANI', 'SWETHA') and s.studentid = c.StudentID; */
/* select AptNumber, FirstName from Students, Campus_Housing where (FirstName <> 'JANANI' and FirstName <> 'SWETHA') and (students.studentid = campus_housing.studentid); */
/* select AptNumber, FirstName from students s, Campus_Housing c where FirstName not in ('JANANI', 'SWETHA') and s.studentid = c.StudentID; */
/* since there is a studentid in both tables we need to specify which one to use in the select statement */
/* select s.studentid, firstname, lastname from Campus_Housing c, Students s where DormitoryName = 'AKBAR HALL' and s.StudentID = c.StudentID; */
select s.studentid, firstname, lastname, c.DormitoryName from Campus_Housing c, Students s where gender = 'F' and s.StudentID = c.StudentID; 







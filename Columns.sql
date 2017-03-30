use exampleDB;
/* show tables; */
/* select * from Students; */
/* select * from Campus_Housing; */
/*select email from students where gender = 'F';*/
/* select dormitoryname from campus_housing;*/
/* select studentid from campus_housing where dormitoryname = 'AKBAR\'S HOUSE';*/
/* select studentid from campus_housing where dormitoryname = 'AKBAR''S HOUSE'; */
/* select studentid from campus_housing where dormitoryname = NULL; */ /* does not work */
/* select studentid from campus_housing where dormitoryname is NULL; */ /* correct */
select studentid from campus_housing where dormitoryname is not NULL; /* correct */
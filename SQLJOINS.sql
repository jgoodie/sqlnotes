use exampleDB2;
select * from Sales_data;
show TABLES;
select * from Students;
select * from Campus_Housing;
select * from stores;
select * from products;
select * from Sales_Data_new;
select S.StudentID, Firstname, Lastname from Students S, Campus_Housing C where Dormitoryname = 'AKBAR HALL' AND S.StudentID = C.StudentID;
select s.studentid, firstname, lastname, c.DormitoryName from Campus_Housing c, Students s where gender = 'F' and s.StudentID = c.StudentID;

# Cross JOIN or Cartesian Join
# Inner JOIN
# Outer JOIN
## Left outer JOIN
## Right outer JOIN
## Full outer JOIN
# Natural JOIN

# Cross JOIN
select storelocation, productname from stores cross join products ORDER BY StoreLocation, ProductName;
select * from stores cross join products ORDER BY StoreID, ProductID;

# Inner Joins: Inner Joins = Cross Join + A Filter Condition
# Filter condition almost alwyas involves linking 2 columns of the the 2 joined tables
# if the conditiontest for equality the joinis called an equi-join
select s.storelocation, date, revenue from stores s, sales_data_new r where s.StoreID = r.storeid and s.StoreLocation = 'KORAMANGALA';
# Returns the same result as
SELECT s.storelocation, date, revenue from stores s inner join sales_data_new r on s.storeid = r.storeid and s.StoreLocation = 'KORAMANGALA';

select * from stores s inner join Sales_Data_new r on s.StoreID = r.StoreID and S.StoreLocation = 'KORAMANGALA';

# Outer Joins (Left, Right, Full)
# Left OUter Joins
select * from Movies;
select * from Reviews;
select * from Movies M left outer join Reviews R on M.MovieID = R.MovieID;
select M.MovieName, M.MovieID, R.Review, R.Rating from Movies M left outer join Reviews R on M.MovieID = R.MovieID; 

# Right Outer Joins
# Exactly like the Left outer join, except it's the... right!
select M.MovieID, R.Review from Movies M right outer join Reviews R on M.MovieID = R.MovieID;
select * from Movies M right outer join Reviews R on M.MovieID = R.MovieID;

# Full Outer Join is a combo of the Right and Left Outer Joins
### HUGE NOTE: MySQL DOES NOT SUPPORT FULL OUTER JOINS
select * from Movies M FULL outer join Reviews R on M.MovieID = R.MovieID;

# Natural Join is simply an inner or outer join where 2 additional conditions are satisfied
## 1) The two joined tables have a column with the same name
## 2) The Join condition is an Equality check on those 2 columns
## Natural Join is syntactic sugar - i.e. a short hand 
# The Equality Check is implicit
# saves us the effort of specifying the match condition
select M.MovieID, R.Review FROM Movies M NATURAL LEFT OUTER JOIN Reviews R;
select M.MovieID, R.Review FROM Movies M NATURAL RIGHT OUTER JOIN Reviews R;
















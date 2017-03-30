use exampleDB2;
select * from Sales_data;
show TABLES;
select StoreLocation, sum(revenue) as TotalRevenue from Sales_Data GROUP BY StoreLocation;
select * from stores cross join products ORDER BY StoreID, ProductID;
select * from stores s inner join Sales_Data_new r on s.StoreID = r.StoreID and S.StoreLocation = 'KORAMANGALA';
select * from Movies M left outer join Reviews R on M.MovieID = R.MovieID;
select * from Movies M right outer join Reviews R on M.MovieID = R.MovieID;
##FULL outer join doesn't exist in MySQL
select * from Movies M FULL outer join Reviews R on M.MovieID = R.MovieID;
select M.MovieID, R.Review FROM Movies M NATURAL LEFT OUTER JOIN Reviews R;
select M.MovieID, R.Review FROM Movies M NATURAL RIGHT OUTER JOIN Reviews R;

#find average rating of all movies having at least 2 reviews
# MovieID = MovieID
# Grouby movie name
# Having more than 2 reviews; Having is a conditional operation similar to where
# Then average
select * from Reviews;
select M.MovieName, avg(R.Rating) from Movies M INNER JOIN Reviews R ON M.MovieID = R.MovieID GROUP BY MovieName HAVING count(ReviewID) >= 2;

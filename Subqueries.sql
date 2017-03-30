use exampleDB3;
show TABLES;


# We can query from tables generated from queries. 
select email from Students;
select * from Sales_Data;
select * from Sales_Data ORDER BY Revenue DESC;
select Product, sum(Revenue) from Sales_Data GROUP BY Product;
select * from stores S inner join Sales_Data_new R where S.StoreID = R.StoreID and S.StoreLocation = 'Bellandur'; 
select M.MovieName, avg(R.Rating) from Movies M INNER JOIN Reviews R ON M.MovieID = R.MovieID GROUP BY MovieName HAVING count(ReviewID) >= 2;

# subqueries

select * from products;
select * from Sales_Data_new;
# Below is not a good query because of the hardcoded year of 2016
select p.ProductName, year(date) as Year, sum(revenue) as Revenue from Sales_Data_new s INNER JOIN products p on s.ProductID = p.ProductID 
where (p.ProductName = 'Peanut Butter' or p.ProductName = 'Nutella')
and (YEAR(date) = 2016) GROUP BY p.ProductName, YEAR(date);

# Better Query

select p.ProductName, year(date) as Year, sum(revenue) as Revenue from Sales_Data_new s INNER JOIN products p on s.ProductID = p.ProductID 
where (p.ProductName = 'Peanut Butter' or p.ProductName = 'Nutella')
and (year(date) = (select year(max(date)) FROM Sales_Data_new)) GROUP BY p.ProductName, year(date);

# We still shouldn't hard code things. We have Peanut Butter and Nutella hard coded.
select p.ProductName, year(date) as Year, sum(revenue) as Revenue from Sales_Data_new s INNER JOIN products p on s.ProductID = p.ProductID 
where (p.ProductName in (select ProductName from Top_Sellers))
and (year(date) = (select year(max(date)) FROM Sales_Data_new)) GROUP BY p.ProductName, year(date);


(select DISTINCT Email, 'Student' AS Category FROM Students) Union (select DISTINCT Email, 'Faculty' AS Category FROM Faculty);

use nse;
show tables;
select t.id as tickerID, sum(sm.tottrdqty) as tottrdqty, sum(sm.tottrdval) as totrdval
from tickers t inner join stockMovements sm on t.symbol=sm.symbol 
and t.isEquity=1
GROUP BY t.id;



create table tickerSummary as (
select t.id as tickerID, sum(sm.tottrdqty) as tottrdqty, sum(sm.tottrdval) as totrdval
from tickers t inner join stockMovements sm on t.symbol=sm.symbol 
and t.isEquity=1
GROUP BY t.id
);
show tables;
DESCRIBE tickerSummary;
select * from tickerSummary;

## Outer Join vs Inner Join
# Outer join will pad unmatched rows with nulls
# Inner Join will skip nulls or unmatched rows

# Insert a dummy row

insert into tickers (symbol, series, isEquity) VALUES ('DUMMY', 'EQ',1);

select * from tickers where symbol='DUMMY';
# 1472 is the id for DUMMY

drop table tickerSummary;
show tables;
# outer joins show the nulls
create table tickerSummary as (
select t.id as tickerID, sum(sm.tottrdqty) as tottrdqty, sum(sm.tottrdval) as totrdval
from tickers t left outer join stockMovements sm on t.symbol=sm.symbol 
and t.isEquity=1
GROUP BY t.id
);
show tables;
DESCRIBE tickerSummary;
select * from tickerSummary where tickerID = 1472;
#alternate way using a subquery
select * from tickerSummary where tickerID in (select id from tickers where symbol='DUMMY');

## Inner Join skips the nulls
create table tickerSummary as (
select t.id as tickerID, sum(sm.tottrdqty) as tottrdqty, sum(sm.tottrdval) as totrdval
from tickers t inner join stockMovements sm on t.symbol=sm.symbol 
and t.isEquity=1
GROUP BY t.id
);
show tables;
DESCRIBE tickerSummary;
select * from tickerSummary where tickerID = 1472;
select * from tickerSummary where tickerID in (select id from tickers where symbol='DUMMY');
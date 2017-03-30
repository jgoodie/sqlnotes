use exampleDB;
/* select now(), curdate(), curtime(); */
/* select * from Sales_Data; */
/*
select extract(YEAR from Date) as REV_YEAR, extract(MONTH from Date) as REV_MONTH, extract(DAY from Date) as REV_DAY from Sales_Data where REVENUE = (select MAX(REVENUE) from Sales_Data)
*/
/*
select datediff('2015-01-01','2014-01-01')/365 as YEARS_ELAPSED;
*/
/*
select date_add(curdate(), INTERVAL 1 DAY) as TOMORROW, date_sub(curdate(), INTERVAL 1 DAY) as YESTERDAY;
*/
/*
select * from Sales_Data where DATE = '2016-01-18';
*/
/* select * from Sales_Data where Date like '%2016%'; */
select * from SALES_DATA where DATE = DATE_SUB('2016-01-18', INTERVAL 1 DAY);
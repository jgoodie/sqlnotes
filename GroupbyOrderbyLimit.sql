#use exampleDB;
# show tables;
# desc Sales_Data;

#select storelocation, Date, Revenue from Sales_Data where Product='Bananas';
/*
use exampleDB2;
show tables;
desc Sales_Data;
select * from Sales_Data;
insert into Sales_Data
(StoreLocation,Product,Date,Revenue)
VALUES
# Once again the lecture is not quite right here: dates need to be yyyy-MM-dd
('Bellandur','Bananas','2016-01-18',8236.33);
select * from Sales_data;
*/
# Want to get insights into the data, such as revenue across all stores, best performing store, best performing products
# what is the product store combo that works best? Bananas in Bellandur or Koramangala?
use exampleDB;
select * from Sales_data;
# find total sales
# sum is an aggregate function
select sum(revenue) as total_revenue from sales_data;
select sum(revenue) as bellandur_revenue from sales_data where storelocation='Bellandur';
select sum(revenue) as koramangala_revenue from sales_data where storelocation='Koramangala';
# avg is also an aggregate function
select avg(revenue) as avg_revenue from sales_data;
select avg(revenue) as avg_milk_revenue from sales_data where product='milk';
select avg(revenue) as avg_milk_revenue_bellandur from sales_data where product='milk'and storelocation='Bellandur';
select avg(revenue) as avg_milk_revenue_koramangala from sales_data where product='milk'and storelocation='Koramangala';

#find the best performing store GROUP_BY
# To use GROUP BY, you need the column in bot the select and GROUP By locations
select storelocation, sum(revenue) as total_revenue from sales_data GROUP BY storelocation;
select product, sum(revenue) as product_revenue from sales_data GROUP BY product;
select product, storelocation, avg(revenue) as AvgDailyRevenue from Sales_Data GROUP BY Product, StoreLocation;


use exampleDB;
select * from Sales_data;
# Below orders storelocation ascending... alphabetically
select storelocation, sum(revenue) as total_revenue from sales_data GROUP BY storelocation ORDER BY StoreLocation;
#But we want to order by total_revenue
select storelocation, sum(revenue) as total_revenue from sales_data GROUP BY StoreLocation ORDER BY total_revenue DESC;
select product, sum(revenue) as product_revenue from sales_data GROUP BY Product ORDER BY product_revenue DESC;
select product, storelocation, avg(revenue) as AvgDailyRevenue from Sales_Data GROUP BY Product, StoreLocation ORDER BY AvgDailyRevenue DESC;
select product, storelocation, avg(revenue) as AvgDailyRevenue from Sales_Data GROUP BY Product, StoreLocation ORDER BY product;
select product, storelocation, avg(revenue) as AvgDailyRevenue from Sales_Data GROUP BY Product, StoreLocation ORDER BY StoreLocation, Product DESC;

select storelocation, sum(revenue) as total_revenue from sales_data GROUP BY StoreLocation ORDER BY total_revenue DESC LIMIT 1; 

select product, storelocation, avg(revenue) as AvgDailyRevenue from Sales_Data GROUP BY Product, StoreLocation ORDER BY StoreLocation, Product DESC LIMIT 1;
select product, storelocation, avg(revenue) as AvgDailyRevenue from Sales_Data GROUP BY Product, StoreLocation ORDER BY AvgDailyRevenue DESC LIMIT 1;

select storelocation, sum(revenue) as total_revenue from sales_data GROUP BY StoreLocation ORDER BY total_revenue DESC LIMIT 1;


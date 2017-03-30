use exampleDB3;
show TABLES;
create table Sales_Data_2 LIKE Sales_Data;
insert into Sales_Data_2 select * from Sales_Data;
show tables;

select Date, sum(revenue) from Sales_data GROUP BY Date;
select Date, sum(revenue) from Sales_data_2 GROUP BY Date;

# Index helps speed up queries
# How do we setup indices correctly
create index IX_Date on Sales_Data(Date);
create index IX_Store_Product on Sales_Data(StoreLocation, Product);

# indices make queries much faster, but updates much slower - a classic database trade-off
# Indices make less sense on columns that 
# 1) are in very small tables
# 2) hold a lot of nulls
# 3) are written more than read


use exampleDB;
select * from Sales_data;

#Want the number of unique store locations

select StoreLocation from sales_data GROUP BY StoreLocation;

select count(DISTINCT StoreLocation) as UniqueStoreLocations from Sales_Data;

Select count(StoreLocation) as NumStoreLocations from Sales_Data;
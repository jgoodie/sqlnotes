use exampleDB3;
# drop PROCEDURE GetAnnualRevenue;
show TABLES;
# A view is like a virtual table
# A view give us the ablility to refer to a query as a table
### NOTE: This probably doesn't work as it. Will need to google the corrent way to do views in MySQL
DELIMITER //
create VIEW TOP_SELLING_PROD AS
select p.Product, year(DATE), sum(Revenue)
from
	(select * from sales_data where productID in top_sellers)
inner join
	Products P
    on
    s.productID = p.ProductID
where
	(p.product in (select product form top_sellers))
    and
    (Year(DATE) = (select YEAR(max(date)) from sales_data) //
DELIMITER ;

    
    
 ### TEMP tables are tables that last only for the duration of a user session
 ### Use them, particularly if you delete data or drop tables. backup the old table first
    
    
DELIMITER //   
CREATE TEMPORARY TABLE T_Selling_Products AS
SELECT  P.PRODUCTNAME,YEAR(DATE),SUM(REVENUE)  
FROM  (SELECT * FROM SALES_DATA WHERE PRODUCTID IN TOP_SELLERS)  
INNER JOIN 
	PRODUCTS P  
    ON  S.PRODUCTID = P.PRODUCTID 
WHERE  
    (P.PRODUCTNAME IN (SELECT PRODUCTNAME FROM TOP_SELLERS)) 
    AND  
    (YEAR(DATE) = (SELECT YEAR(MAX(DATE)) FROM SALES_DATA) //
DELIMITER ;
    
    
    
##GRANT AND REVOKE ARE SQL COMMANDS TO CONTROL USER PRIVILEGES
GRANT SELECT,INSERT,DELETE ON Products TO Vitthal 
REVOKE SELECT,INSERT,DELETE ON Products TO Vitthal 
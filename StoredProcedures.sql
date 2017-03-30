# The Loonycorn tutorial on this was pretty bad and didn't correspond to MySQL at all. I had to do a lot of Googling and still can't figure out
# whether the stored procedure is working correctly.
use exampleDB3;
# drop PROCEDURE GetAnnualRevenue;
# show TABLES;
# stored procedures : databases :: function : code
# stored proceudres are functions for databases
# It's a way to group a bunch of SQL commands into a unit, give it a name, call this as a unit, and pass it parameters.
# SQL is by and large a declarative language
# stored procedures are procedural; you tell the db how to do things. 
# Stored procedures have all the advantages of functions

# Creating a Stored Procedure

# Calling a stored procedure
DELIMITER //
CREATE PROCEDURE GetAnnualRevenue (
	IN YR INT,
	OUT REVENUE DEC(10,2)
)
BEGIN
SELECT
	YEAR(DATE), @REVENUE = SUM(REVENUE) 
FROM
	Sales_Data
WHERE
	YEAR(Date) = @YR 
GROUP BY
	YEAR(Date);
END //
DELIMITER ;

#set @REV = 0.00;
#call GetAnnualRevenue(2016, @REV);



    
#EXECUTE
# select year(Date), sum(Revenue) from Sales_Data where year(Date) = 2016 GROUP BY year(Date);
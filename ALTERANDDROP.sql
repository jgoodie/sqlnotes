use exampleDB3;
# drop PROCEDURE GetAnnualRevenue;
show TABLES;
# create table Sales_Data_backup LIKE Sales_Data;
# insert into Sales_Data_backup select * from Sales_Data;
# show tables;

# Alter can:
# Rename a Table
# Drop a Column
# Modify a Column
# Add a Column
# Rename a Column
# Add a constraint
# Add an index
# And lots more
DELIMITER //
create table current_employees
(
EmployeeID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50)
)//
DELIMITER ;
 
DELIMITER //
create table upcoming_promotions
(
EmployeeID INT NOT NULL,
CurrentTitle VARCHAR(50),
NewTitle VARCHAR(50),
CONSTRAINT fk_currentemployees_employeeid 
FOREIGN KEY (EmployeeID)
REFERENCES current_employees (EmployeeID)
ON DELETE CASCADE
) //
DELIMITER ;


alter table current_employees RENAME to EX_Employees;
alter table EX_Employees RENAME to current_employees;
create table EX_Employees LIKE current_employees;
insert into EX_Employees select * from current_employees;
show tables;
ALTER TABLE current_employees ADD COLUMN Hire_Date DATE NOT NULL DEFAULT '1970-01-01';
desc current_employees;
select * from current_employees;
Alter table current_employees add column foo VARCHAR(42) NOT NULL DEFAULT 'fartbarf';
desc current_employees;
### ALWAYS MAKE A BACKUP BEFORE DROPPING OR DELETING ANYTHING ####
alter table current_employees drop column foo;
desc current_employees;
#### NOTE THE BACK TICKS. NOT FORWARD TICKS!!!
alter table current_employees CHANGE column `bar` `foo` VARCHAR(42) NOT NULL DEFAULT 'fartbarf';
desc current_employees;
alter table current_employees add column ss VARCHAR(42);
desc current_employees;
alter table current_employees add constraint ss UNIQUE(ss);
#### NEVER DROP A TABLE WITHOUT BACKING UP THE TABLE CONTENTS TO A TEMP TABLE OR FILE, CLEARING IT OF DATA, DELETING THE EMPTY TABLE #####
drop table EX_Employees;


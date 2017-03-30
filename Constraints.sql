use exampleDB3;
show TABLES;
select * from Students;

## NOT NULL Constraints
## Primary Key Constraints
## Froeign Key Constraints
## Check Constraints

# Can add constraints to a table after it has been created using the alter table command

# NOT NULL and Default values
create table Sales_data_foo
(
StoreLocation VARCHAR(30) NOT NULL,
Product VARCHAR(30) NOT NULL,
Date DATE NOT NULL,
Revenue DEC(10,2) NOT NULL DEFAULT 0.0,
PRIMARY KEY (StoreLocation, Product, Date)
)

# Use default values as much as possible when using NOT NULL... when possible as a courtesy 


# Primary Keys and Unique constraints
# A key is a set of columns whose values are unique for each row in a table
# A Primary Key is one fo such set of columns specified as such
# DBMS will ofter construct an index on the primary key even without being told to.
# A Primary Key could include either one column or multiple columns
# Primary Key columns can never contain NULLS. Ever.
# A Primary Key is a constraint or condition that the data in the table must satisfy.
# You can't have two entries with the same primary key. The DBMS would not allow it.


## Unique
# Any column or set of Columns can be declared UNIQUE
# A table can have only 1 primary key but any number of UNIQUE contraints
# Primary Key implies uniqueness, but the reverse is not true

create table Students_foo
(
StudentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Gender CHAR(1),
Email VARCHAR(30) NOT NULL UNIQUE
)

## Foreign Key Constaints
# Example Students Table can exist without the Campus_Housing table but not the other way around. Campus_Housing is depends on Students table for it to make sense.
# Each value in the StudentID column of the capmus_housing must already exist in the StudentID column of the Students Table
# We can add rows to the students table without adding them to the campus_housing table but not vie versa. 
# i.e. Students can live off campus, non-students can't live on campus
# The DBMS needs a way to enforce this.
# We can use a foreign key constraint to enforce this
create table campus_Housing
(
StudentID INT NOT NULL,
DormitoryName VARCHAR(50),
AptNumber INT,
CONSTRAINT fk_students_studentid
FOREIGN KEY (StudentID)
REFERENCES Students (StudentID)
)
# "Referential Integrity" because one table refers to another to check its integrityid

create table current_employees
(
EmployeeID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50)
)

Create table Upcoming_Promotions
(
EmployeeID INT NOT NULL,
CurrentTitle VARCHAR(50),
NewTitle VARCHAR(50),
CONSTRAINT fK_currentemployees_EmployeeID
FOREIGN KEY (EmployeeID)
REFERENCES Current_Employees (EmployeeID)
)

# Example: someone is up for promotion but then gets a job elsewhere. We need to delete them from the current_employee table be they are also listed in the 
# upcoming_promotion table. What to do?
# Option #1: Cascade the deletion and zap from upcoming_promotions too. This is called "ON-DELETE-CASCADE"
create table upcoming_promotions
(
EmployeeID INT NOT NULL,
CurrentTitle CARCHAR(50),
NewTitle VARCHAR(50),
CONSTRAINT fk_currentemployees_employeeid
FOREIGN KEY (EmployeeID)
REFERENCES Current_Employees (EmployeeID)
ON DELETE CASCADE
)

# This is can lead to a significant performance hit because the DBMS needs to check all the various tables 
# that might be foreign key dependent on Current_Employee table. This is computationally very heavy.

# Alternate: Do nothing at all. Not conceptually clean but doesn't kill the performance.
# The issue with this is that it leaves an orphan tuple or orphan row in upcoming_promotions.
# This is called ON-DELETE-DO-NOTHING and it will leave an orphan in the child table.
create table upcoming_promotions
(
EmployeeID INT NOT NULL,
CurrentTitle CARCHAR(50),
NewTitle VARCHAR(50),
CONSTRAINT fk_currentemployees_employeeid
FOREIGN KEY (EmployeeID)
REFERENCES Current_Employees (EmployeeID)
ON DELETE NO ACTION
)

# Third option: is to set the corresponding value in upcoming_promotions to NULL
# Advantage: NULL indicates something is up with the row/tuple
# Disadvantage is that it leaves a NULL value in a NOT NULL column in the child table.
create table upcoming_promotions
(
EmployeeID INT NOT NULL,
CurrentTitle CARCHAR(50),
NewTitle VARCHAR(50),
CONSTRAINT fk_currentemployees_employeeid
FOREIGN KEY (EmployeeID)
REFERENCES Current_Employees (EmployeeID)
ON DELETE SET NULL
)

# There are ON UPDATE CASCADE rules exactly like ON DELETE CASCADE rules
create table upcoming_promotions
(
EmployeeID INT NOT NULL,
CurrentTitle CARCHAR(50),
NewTitle VARCHAR(50),
CONSTRAINT fk_currentemployees_employeeid
FOREIGN KEY (EmployeeID)
REFERENCES Current_Employees (EmployeeID)
ON DELETE CASCADE
ON UPDATE CASCADE
)
# CASCADING is the Best option but it makes updates/deletes very slow

# Check Constraints
# Checks whether a particular value satisfies a specific condition
CREATE TABLE Students
(
StudentID INT NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Gender CHAR(1),
Email VARCHAR(30) NOT NULL,
PRIMARY KEY (StudentID)
CHECK Gender IN ('M','F')
);


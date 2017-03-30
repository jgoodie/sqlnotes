#use exampleDB3;
# drop PROCEDURE GetAnnualRevenue;
#show TABLES;

### Identify the problem that you're trying to model or capture
### Have a good idea of the types of queries that you want to run on the database
### Break up the information into logical units where each logical unit is one table in your database (i.e. Server_Info, Sensor_data)
### Each logical component will probably connect with other logical components
### Capture the relationships either via constraints or other tables devoted to holding relationship specific data

### Within a Table...
### Tables typically hold information about an entity of a relationship
### Think of whether you need a way to uniquely identify each row in a table
### Yes? Then you need a primary key (ServerID, SerialNum?) Firstname lastname not a good identifier, but SS is 
### No NULL values for primary key
### A primary key will be used to represent that row - other tables can reference that row by specifying that primary key value
### If there is no such value in the fields you want to store then generate a value which will be used as a unique identifier.
### Numeric values tend to be more efficient in representation andn lookup - prefer those for primary keys
### Use AUTO_INCREMENT to get the DBMS to generate UNIQUE Identifiers for you
### Primary Keys typically tend to be an identifier whose only job is to be the key is standard practice
### Then there is no reason for the key to change for a specific row.
### Most DBMS will auto create an index on the primary key for faster lookup and retrieval

### Do columns have other constraints which they need to satisfy
### Are NULL values allowed for any column? No? Then USE NOT NULL
### Should they have a default value? Yes? Use DEFAULT and specify what the default should be

### Are the Data types for each column correct?
### Don't use strings for storing date information. Use the DATE data type
### if the data is a single character, don't use a 30 char string to store it.

### How many tables to use to store information?
### One-to-one compulsory information: Student and email address
### Every student has just one email address, there is no reason for email address to lie in a seperate table from the rest of the student info
### Then the relationship between the pieces of information are 1-1 and the informationis not optional we can put it together in the same table

### 1-1 optional information
### Student and sibling information
### Students may or may not have siblings, if the main students table included sibling informatino then there would be many empty cells
### The STudents table would hold only the mandatory information
### Sibling information like student housing should be a seperate table

### The primary key from the students table is used to identify the students in the sibling table


### One-to-Many or Many-to-One Relationships
### Employees and their managers, Teachers and students
### Need at least two table to store this information.
### One for all employees and one for the relationship between the employee and manager.
### Table 1: EmployeeID, Name, Email
### Table 2: EmployeeID, ManagerEmployeeID

### Many to Many relationships
### Store Products and Revenue Data
### This needs 3 tables to represent the information 1) Stores 2) Products 3) Link to stores and products
### Revenue Data is specified for every products sold in every store - Revenue links stored and product in a many to many relationship
### Store Table: StoreID, StoreLocation
### Product Table: ProductID, ProductName
### Revenue Table: StoreID, ProductID, DateSold, Revenue







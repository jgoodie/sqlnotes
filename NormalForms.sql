### Normal Forms in Database Design

### Database Theory has given us standard rules to test if a table (relation) is well defined
### These Rules are codified into normal forms
### The normal forms are a very inaccessible
### But if you can understand them, they are actually very good.ALTER

### 1st Normal Form: A relation is in first normal form if the domain of each attribute contains only atomic (indivisable) values, 
### and the value of each attribute contains only a single value from that domain.
### A table should not have any column with concatenated, compound values.
### Example: A colum called firstname_lastname is not good. Should be a column for first and a column for last.
### Same goes for a column with Major and Graduation year (CS_2016). Should be a major column and a graduation year column.

### 2nd Normal Form: A table is in 2NFif it is in 1NF and no non-prime attribute is dependent on any proper subset of any candidate
### key of the table. (A non-prime attribute of a table is an attribute that is not a part of any candidate key of the table)"
### A table should have every non-key column fully defined by or dependent on a primary key.
### Example: Revenue Table: StoreID, ProductID, Date, Revenue, CategoryManager
### CategoryManager violates 2NF. Example Revenue is clearly identified by the primary key. Revenue is related to store and product.
### CategoryManager: is not identified by store, produc and date. CM can be for a product or a product in a store but not for a date. 
### Need to create a product table or product_store table in which CM is part of.

### 3rd Normal Form: A table is in 3NF if 1) the entity is in 2NF and 2) all the attributes in a table are determined only by the 
### candidate key of that table and not by any non-prime attributes"
### A table is in 3NF if all non-key columns are independent of each other
### Example: Table with StoreID, StoreAddress, StoreCity, StoreCountry
### StoreAddress, StoreCity and StoreCountry are not completely independent
### City and country follow from Store Location
### A better table should have StoreID and StoreAddress and move StoreCity and Country into a Seperate table keyed by store location
###
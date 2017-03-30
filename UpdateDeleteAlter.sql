#### RUN THE CORRESPONDING SELECT STATEMENT FIRST ####
#### MAKE SURE YOU BACK THINGS UP FIRST BEFORE DELETING #####
#### EITHER BACKUP THE WHOLE TABLE OR AT LEAST THE RESULTS FROM THE SELECT STATEMENT ####
use exampleDB2;
# drop PROCEDURE GetAnnualRevenue;
show TABLES;
create table Sales_Data_backup LIKE Sales_Data;
insert into Sales_Data_backup select * from Sales_Data;
show tables;
select * from Sales_Data where StoreLocation = 'Koramangala';
#### RUN THE CORRESPONDING SELECT STATEMENT FIRST ####
#### MAKE SURE YOU BACK THINGS UP FIRST BEFORE DELETING #####
#### EITHER BACKUP THE WHOLE TABLE OR AT LEAST THE RESULTS FROM THE SELECT STATEMENT ####
delete from Sales_Data where StoreLocation = 'Koramangala';

#Delete all rows from a table. Note MySQL Workbench won't allow this. Safe Updates needs to be turned off in the preferences.
delete from Sales_Data;

drop TABLE Sales_Data;

create table Sales_Data like Sales_Data_backup;
insert into Sales_Data select * from Sales_Data_backup;
select * from Sales_Data;

update Sales_Data SET StoreLocation = 'Brigade Road' where StoreLocation = 'Koramangala';
select * from Sales_Data where StoreLocation = 'Koramangala' or StoreLocation = 'Brigade Road';

update Sales_Data SET Revenue = Revenue * 1.2;
select * from Sales_data;
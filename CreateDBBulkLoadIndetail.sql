# use nse;
/*
create table tickers (
id INT(11) unsigned not null AUTO_INCREMENT,
symbol varchar(256),
series varchar(256),
 int,
PRIMARY KEY(id),
unique key (symbol, series)
);
desc tickers;
*/
# ignore row that won't fit in the table. if there is a row can't be loaded into the table, ignore them
# ignore will skip any duplicate rows (so if symbols repeats, it will be skipped)
# FIELDS TERMINATED BY specify the delimiter i.e. CSV there for ','
# ignore the first line since it's the header
# @ symbols are variables that correspnd to the csv, the others (symbol, series, isEquity) correspond to columns in the table.
# variable are same order as csv file
# What to do with the list of columns in the csv file. 
# The first one is sent to the column 'symbol'
# The rest are assigned to variables
# You can use the variable to explicitly set column values (as we do below) or not do anythiing with them at all. 
# in which case those columns of the CSV will be ignored
load data LOCAL INFILE '/Users/jgoodman/Downloads/cm07JAN2014bhav.csv' ignore into table tickers FIELDS TERMINATED BY ',' ignore 1 LINES
(symbol,@series,@open,@high,@low,@close,@last,@prevclose,@tottrdqty,@tottrdval,@timestamp,@totaltrade,@isin)
SET series=@series,isEquity=if(@series='EQ',1,0);
# here we are explicity setting the colum values in the table 
# the column "series" should be set to the value of the variable which is the second column of of the CSV
# Finally the coumn isEquity should be set to the value of 1 if @series ='EQ' else 0

desc tickers;
select * from tickers limit 10;
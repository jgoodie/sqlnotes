# show databases;
# create database nse;
# show databases;
use nse;
# show tables;
/*
create TABLE stockMovements(
	symbol varchar(256),
	series varchar(256),
	open float,
	high float,
	low float,
	close float,
	last float,
	prevclose float,
	tottrdqty float,
	tottrdval float,
	timestamp varchar(256),
	totaltrade float,
	isin varchar(256)
);
*/
# desc stockMovements;
# select symbol,series from stockMovements;
# Again the tutorial didn't mention the secure_file_priv issue. If you don't include LOCAL the command will fail
#load data LOCAL INFILE '/Users/jgoodman/Downloads/cm07JAN2014bhav.csv' into table stockMovements FIELDS TERMINATED BY ',' ignore 1 LINES;

# select * from stockMovements;
select count(distinct symbol) as numTickers from stockMovements;
select max(open) as maxOpen, min(open) as minOpen, avg(open) as avgOpen from stockMovements;
# again the tutorial is not great here as selecting on floats is tricky as open=31.55 doesn't return anything. Use between to get results.
#Stackoverflow comments say to not use float but instead use decimal(x,y) ex: decimal(10,2)
select symbol, series, open from stockMovements where open between 30.0 and 32.0;
select * from stockMovements;



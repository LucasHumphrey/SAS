/******************************************************
 Written by: Lucas Humphrey
 Date: December 2, 2018
 
 This program reads the back and backhem data and uses
 the SQL procedure to query the two data sets into a
 single table that calculates average MCV per country.
 ******************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC SQL;
	title 'Average MCV per Country';
	create table AVG_MCV as
	select s1.country,
	       avg(s2.mcv) as avg_MCV
	from stat483.back as s1, stat483.backhem as s2
	where s1.subj = s2.subj
	group by s1.country
	having 80 LE avg_MCV LE 96;
	select *
	from AVG_MCV;
QUIT;

/*********************************************
 Written by: Lucas Humphrey
 Date: October 28, 2018
 
 This program reads in the address data and
 utilizes character functions to construct an
 output dataset.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA address;
    INPUT #1 @1 line1 $50.
	      #2 @1 line2 $50.
		  #3 @1 line3 $50.;
	line1=compbl(line1);
	first_name=scan(line1,2,' ');
	last_name=scan(line1,-1,' ');
	name=catx(' ',first_name,last_name);
	name=":" || trim(name) || ":";
	line2=tranwrd(line2,'Road','Rd.');
	line2=tranwrd(line2,'Street','St.');
	line2=tranwrd(line2,'Avenue','Ave.');
	street=compbl(line2);
	street=":" || trim(street) || ":";
	city=compbl(line3);
	city=":" || trim(city) || ":";
	drop line1 line2 line3 first_name last_name;
DATALINES;
Mr.  Jason    Simmons
123  Sesame  Street
Madison, WI
Dr.    Justin  Case
78    River  Road
Flemington, NJ
Ms. Marilyn  Crow
777 Jewell   Avenue
Pittsburgh,    PA
;
RUN;

PROC PRINT data=address NOOBS;
  title 'The address data set';
RUN;

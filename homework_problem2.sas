/*********************************************
 Written by: Lucas Humphrey
 Date: October 28, 2018
 
 This program reads in the string data and
 pulls substrings from each line to create
 several new variables.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA string;
    input string $10.;
	length state $ 2;
	x=substr(string,1,2);
	y=substr(string,3,1);
	state=substr(string,4,2);
	state=upcase(state);
	n1=substr(string,6,1);
	n2=substr(string,7,1);
	n3=substr(string,8,1);
	n4=substr(string,9,1);
	n5=substr(string,10,1);
DATALINES;
123nj76543
892NY10203
876pA83745
;
RUN;

PROC PRINT data=string NOOBS;
  title 'The string data set';
RUN;

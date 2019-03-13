/*********************************************
 Written by: Lucas Humphrey
 Date: October 14, 2018
 
 This program transposes the fatgrade dataset
 back into the tallgrades dataset, then prints
 the results.
 *********************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA tallgrades;
  set stat483.fatgrades;
  array allgrades (6) G1 -- G6;
  do gtype = 1 to 6;
     grade = allgrades(gtype);
	 output;
  end;
  drop G1 - G6;
RUN;

PROC PRINT data=tallgrades;
  title 'The tall grades data set';
  var idno l_name grade gtype;
RUN;

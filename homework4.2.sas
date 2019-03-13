/***********************************************
 Written by: Lucas Humphrey
 Date: September 2, 2018
 
 This program reads in values for variables and
 prints new variables created from mathematical
 functions involving the previous variables.
 ***********************************************/
OPTIONS PS=58 LS=80;

DATA temp;
  input abc def ghi jkl;
  one = abc+def-jkl;
  two = (abc+def)-(ghi+jkl);
  three = abc+jkl+(def-ghi);
  four = sum(abc,jkl,def)/ghi;
  five = (abc+def)/(ghi+jkl);
  DATALINES;
10 5 2 4
  ;
RUN;

PROC PRINT data=temp;
  title 'Output dataset: TEMP';
  var one two three four five;  *Prints only these variables;
RUN;

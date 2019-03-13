/*********************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the pumpkins data with
 modified list input and prints the results.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA pumpkins;
  infile 'C:\Users\Amy\Desktop\stat483\data\pumpkins.dat' MISSOVER;
  input Name & $16. Age Type $ EnterDate $10. j1 j2 j3 j4 j5;
RUN;

PROC PRINT data=pumpkins;
  title 'Pumpkins Data Set';
RUN;

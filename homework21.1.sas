/******************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the results data with
 the double trailing at sign and prints the
 results.
 ******************************************/
OPTIONS NODATE NONUMBER;

DATA results;
  infile 'C:\Users\Amy\Desktop\stat483\data\results.dat';
  input team $ member $ score @@;
RUN;

PROC PRINT data=results NOOBS;
  title 'The results data set';
RUN;

/******************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the pumpkins2 data
 with the DLM and DSD options, then prints
 the results.
 ******************************************/
OPTIONS NODATE NONUMBER;

DATA pumpkins2;
  infile 'C:\Users\Amy\Desktop\stat483\data\pumpkins2.dat' DLM=',' DSD;
  length Name $ 16.;
  length EnterDate $ 10.;
  input Name $ Age Type $ EnterDate $ j1 j2 j3 j4 j5;
RUN;

PROC PRINT data=pumpkins2;
  title 'Pumpkins2 Data Set';
  var Name Age Type EnterDate j1 j2 j3 j4 j5;
RUN;

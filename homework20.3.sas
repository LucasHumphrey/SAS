/******************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the pumpkins3 data
 with column input and prints the results.
 ******************************************/
OPTIONS NODATE NONUMBER;

DATA pumpkins3;
  infile 'C:\Users\Amy\Desktop\stat483\data\pumpkins3.dat' FIRSTOBS=2 MISSOVER;
  input Name $ 1-16 Age 18-19 Type $ 21 EnterDate $ 23-32 
        j1 34-36 j2 38-40 j3 42-44 j4 46-48 j5 50-52;
RUN;

PROC PRINT data=pumpkins3;
  title 'Pumpkins3 Data Set';
RUN;

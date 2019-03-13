/************************************************
 Written by: Lucas Humphrey
 Date: September 2, 2018

 This program reads in high and low temperatures
 for three towns in two months of two years, and
 prints out this information with the towns'
 designated numbers. The descriptor information
 for the dataset is also printed out.
 ************************************************/
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';
OPTIONS LS=80 CENTER;

DATA stat483.homework3;
  input tname $ tnumber month year lowtemp hightemp;
  DATALINES;
Kane 20 12 2005 12 25
Ambler 22 12 2005 8 20
Kane 20 01 2006 13 32
Oakey 32 12 2005 30 50
Oakey 32 01 2006 25 45
Ambler 22 01 2006 15 28
  ;
RUN;

PROC PRINT data=stat483.homework3;
  title 'Ouput dataset: HOMEWORK3';
RUN;

PROC CONTENTS data=stat483.homework3;
RUN;

/*********************************************
 Written by: Lucas Humphrey
 Date: October 28, 2018
 
 This program reads in the back data and uses
 the Output Delivery System with the FREQ
 procedure to print new output based on the
 results from the FREQ procedure.
 *********************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

ODS LISTING CLOSE;
ODS RTF file = 'C:\Users\Amy\Desktop\stat483\data\income2.rtf'
        BODYTITLE;

PROC SORT data=stat483.back (where=(income NE .)) out=backinc;
  by income;
RUN;

ODS TRACE ON;
PROC FREQ data=backinc;
  by income;
  tables sex*mar_st/out=income2 norow nocol nopercent;
  ODS SELECT Freq.ByGroup2.Table1.CrossTabFreqs;
RUN;
ODS TRACE OFF;

PROC PRINT NOOBS;
  title 'Marital Status and Gender of Subjects with Income GE $30,000';
RUN;

ODS RTF CLOSE;
ODS LISTING;



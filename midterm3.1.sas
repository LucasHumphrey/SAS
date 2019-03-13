/***********************************************
 Written by: Lucas Humphrey
 Date: October 11, 2018
 
 This program sorts two datasets, merges them
 while creating the status variable, and prints
 the results.
 ***********************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC SORT data=stat483.question01a;
  by student;
RUN;

PROC SORT data=stat483.question01b;
  by student;
RUN;

DATA question01;
  merge stat483.question01a
        stat483.question01b (in=inquestion01b);
  by student;
  if inquestion01b;
  length status $ 8.;
  if major = 'Y' then status = 'major';
    else if major = 'N' then status = 'nonmajor';
  drop major;
RUN;

PROC PRINT data=question01;
  title 'Output dataset: QUESTION01';
  var student exam grade status;
RUN;

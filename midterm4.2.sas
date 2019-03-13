/**********************************************
 Written by: Lucas Humphrey
 Date: October 28, 2018
 
 This program reads in the thin data, prints
 the output, and creates the fat data set from
 sorted thin data using an array.
 **********************************************/
OPTIONS NODATE NONUMBER;

DATA thin;
  infile 'C:\Users\Amy\Desktop\stat483\data\thin.dat';
  input id $ time x @@;
RUN;

PROC PRINT data=thin;
  title 'The thin data set';
RUN;

PROC SORT data=thin out=sortedthin;
  by id;
RUN;

DATA fat;
  set sortedthin;
  by id;
  array alltime (4) x1 - x4;
  if first.id then i = 1;
  alltime(i) = x;
  if last.id then output;
  i + 1;
  retain x1 - x3;
  drop i time x;
RUN;

PROC PRINT data=fat NOOBS;
  title 'The fat data set';
RUN;

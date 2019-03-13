/**************************************************
 Written by: Lucas Humphrey
 Date: October 7, 2018
 
 This program reads the two data sets for golf and
 merges them while setting conditions in the DATA
 step for which observations will be printed.
 **************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA ugolfbyname;
  set stat483.golfbyname;
RUN;

PROC SORT data=ugolfbyname out=golfbyname;
  by id;
RUN;

DATA golfbyid;
  set stat483.golfbyid;
RUN;

DATA golf (where=(int(slope/1)>=127));
  merge golfbyname golfbyid;
  by id;
  drop architect year type usga range pro spikes;
RUN;

PROC PRINT data=golf NOOBS;
  title 'The merged golf data set';
RUN;

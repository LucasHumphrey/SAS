/************************************************
 Written by: Lucas Humphrey
 Date: October 11, 2018
 
 This program sorts the permanent dataset by ID,
 then creates a temporary dataset that utilizes
 a first. variable and the RETAIN statement, then
 prints the results.
 ************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC SORT data=stat483.patients;
  by id;
RUN;

DATA heartrate;
  set stat483.patients;
  by id;
  if first.id then first_hr = hr;
  change = hr - first_hr;
  retain first_hr;
RUN;

PROC PRINT data=heartrate NOOBS;
  title 'Change in heart rate';
RUN;

/**************************************************
 Written by: Lucas Humphrey
 Date: October 7, 2018
 
 This program reads the clinical data set and
 calculates the changes in weight for each patient
 using their weights from their first and last
 visits, then prints the results.
 **************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA change;
  set stat483.clinical;
  by patient;
  if first.patient then startweight = weight;
  if last.patient then endweight = weight;
  changeweight = endweight - startweight;
  if last.patient then output;
  retain startweight;
  drop visit v_date weight;
RUN;

PROC PRINT data=change NOOBS;
  title 'Output dataset: CHANGE';
RUN;

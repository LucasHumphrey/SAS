/***************************************************
 Written by: Lucas Humphrey
 Date: October 7, 2018
 
 This program reads the clinical data set and prints
 weights for each patient during each visit.
 ***************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA fat;
  set stat483.clinical;
  by patient;
  if visit = '1' then weight1 = weight;
    else if visit = '2' then weight2 = weight;
	else if visit = '3' then weight3 = weight;
	else if visit = '4' then weight4 = weight;
  if last.patient then output;
  retain weight1;
  drop visit v_date weight;
RUN;

PROC PRINT data=fat NOOBS;
  title 'Output dataset: FAT';
RUN;

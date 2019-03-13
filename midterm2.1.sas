/********************************************************
 Written by: Lucas Humphrey
 Date: September 23, 2018
 
 This program reads the enrollment data into a temporary
 data set, then prints a report of average SAT scores by
 college using the MEANS procedure.
 ********************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC FORMAT;
  value collegefmt 1 = 'Business'
                   2 = 'Engineering'
				   3 = 'Science';
RUN;

DATA enrollment;
  set stat483.enrollment;
  if major in ('Accounting','Finance') then college = 1;
    else if major in ('Computer Science','Electrical Engineering') then college = 2;
	else if major in ('Biology','Mathematics') then college = 3;
RUN;

PROC MEANS data=enrollment fw=10 maxdec=2 mean;
  title 'Average SAT Scores by College';
  var satm satv;
  class college;
  format college collegefmt.;
RUN;

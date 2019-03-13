/********************************************************
 Written by: Lucas Humphrey
 Date: September 23, 2018
 
 This program reads the bmi data into a permanent data
 set, then prints the data through the REPORT and PRINT
 procedures.
 ********************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA stat483.bmi;
  infile 'C:\Users\Amy\Desktop\stat483\data\bmi.dat';
  input gender $ 1-6 diet $ 8 weight 10-12 height 14-15 dob $ 17-24;
  bmi = (weight/(height*height))*703;
RUN;

PROC REPORT data=stat483.bmi NOWINDOWS HEADLINE HEADSKIP;
  title 'average score by gender and diet group';
  column gender diet bmi;
  define gender / group 'Gender' center;
  define diet / group 'Diet' width = 4 spacing = 5 center;
  define bmi / mean 'Average/BMI' format = 5.2 width = 7 spacing = 7 center;
RUN;

PROC PRINT data=stat483.bmi LABEL;
  title 'BMI for Male Subjects with Diet B';
  label dob = 'Date of Birth'
        bmi = 'BMI';
  id dob;
  var bmi;
  where diet = 'B' and gender = 'Male';
RUN;

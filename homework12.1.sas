/*******************************************************
 Written by: Lucas Humphrey
 Date: September 23, 2018
 
 This program reads the ICDB background data set into a
 frequency table, then prints the summarized data into
 the form of a list.
 *******************************************************/
OPTIONS PS=58 LS=72 NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC FORMAT;
   value sexfmt 1 = 'Male'
                2 = 'Female';
   value marfmt 1 = 'Married'
                2 = 'Partner'
				3 = 'Separated'
				4 = 'Divorced'
				5 = 'Widowed'
				6 = 'Never';
RUN;

DATA summary;
   set stat483.back;
RUN;

PROC FREQ data=summary;
   tables sex*mar_st/out=sum noprint sparse;
RUN;

PROC PRINT;
   title 'Summary data set';
   format sex sexfmt. mar_st marfmt.;
RUN;

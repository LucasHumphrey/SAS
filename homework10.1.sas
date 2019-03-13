/****************************************************
 Written by: Lucas Humphrey
 Date: September 16, 2018
 
 This program reads in the ICDB analytical data and
 constructs a report that summarizes the incomes and
 pain scores for each gender.
 ****************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC FORMAT;
   value sexfmt 1 = 'Male'
                2 = 'Female';
   value incfmt 1 = 'LT $30,000'
                2 = 'GT $30,000';
RUN;

PROC REPORT data = stat483.analysis NOWINDOWS HEADLINE HEADSKIP;
   title 'ICDB Study Pain Score';
   format sex sexfmt. income incfmt.;
   column sex income purg_1;
   define sex / group 'Gender' left;
   define income / across 'Household Income'
                    width = 10 center;
   define purg_1 / mean format = 5.3 'Pain Score' right;
RUN;

/**************************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program reads the in the donner data, formats
 the survival and gender variables, then performs
 logistic regression analysis of the odds of
 survival based on age and gender.
 **************************************************/
OPTIONS NODATE NONUMBER;

PROC FORMAT;
   value survivalfmt 0 = 'No'
                     1 = 'Yes';
   value genderfmt 0 = 'Male'
                   1 = 'Female';
RUN;

DATA donner;
   infile 'C:\Users\Amy\Desktop\stat483\data\donner.dat' firstobs=2;
   input survival age gender;
   format survival survivalfmt. gender genderfmt.;
RUN;

PROC LOGISTIC data=donner descending;
   title 'Odds of Survival Based on Gender';
   class gender (param=ref ref='Male');
   model survival = age gender;
RUN;
QUIT;


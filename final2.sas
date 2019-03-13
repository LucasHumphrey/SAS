/**************************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program reads the in the birds data, formats
 the yellowness values, then conducts a t-test to 
 compare the mean yellowness of odd and typical 
 feathers.
 **************************************************/
OPTIONS NODATE NONUMBER;

PROC FORMAT;
   picture yellowpix LOW - < 0 = '09.999'(prefix='-');
RUN;

DATA birds;
   infile 'C:\Users\Amy\Desktop\stat483\data\birds.dat';
   input id $ feather $ yellowness;
   format yellowness yellowpix.;
RUN;

PROC TTEST data=birds;
   title 'T-test Comparing Mean Yellowness';
   class feather;
   var yellowness;
RUN;

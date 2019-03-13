/**************************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program reads the in the back data, sorts it
 by sex, randomly samples 10% of each sex from the
 observations, and prints the results.
 **************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC SORT in=stat483.back out=srtdback;
   by sex;
RUN;

PROC SURVEYSELECT data=srtdback
                  out=back
				  method=SRS
				  seed=1000
				  sampsize=(6 59);
   strata sex;
   title;
RUN;

PROC PRINT data=back;
   title1 'Stratified Random Sampling of Sex';
   by sex;
   id subj;
   var v_date b_date;
RUN;

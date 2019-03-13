/***********************************************
 Written by: Lucas Humphrey
 Date: October 21, 2018
 
 This program reads in the fall scheduling data
 and determines which patient has a birthday on
 October 21st.
 ***********************************************/
OPTIONS NODATE NONUMBER;

DATA birthday (where = (day = 21));
  infile 'C:\Users\Amy\Desktop\stat483\data\FALLscheduling.dat';
  input patient $ 1-16 
        @18 bdate mmddyy10. @30 lastappt mmddyy10.;
  day=day(bdate);
  format bdate date7.;
  drop lastappt;
RUN;

PROC PRINT data=birthday NOOBS;
  title 'The birthday data set';
RUN;

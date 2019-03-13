/***********************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the fall scheduling data
 and calculates when patients should schedule
 their next appointment based on their age.
 ***********************************************/
OPTIONS NODATE NONUMBER;

DATA scheduling;
  infile 'C:\Users\Amy\Desktop\stat483\data\FALLscheduling.dat';
  input patient $ 1-16 
        @18 bdate mmddyy10. @30 lastappt mmddyy10.;
  age = yrdif(bdate,lastappt,'act/act');
  if age <= 45 then nextappt = lastappt + 730;
    else if age > 45 then nextappt = lastappt + 365;
  format bdate lastappt nextappt date7. age 4.1;
RUN;

PROC PRINT data=scheduling NOOBS;
  title 'The appointment data set';
  var bdate lastappt age nextappt;
RUN;

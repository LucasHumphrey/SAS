/***********************************************
 Written by: Lucas Humphrey
 Date: October 21, 2018
 
 This program reads in the fall scheduling data
 and determines which day of the week that each
 patient's last appointment occurred.
 ***********************************************/
OPTIONS NODATE NONUMBER;

DATA weekday;
  infile 'C:\Users\Amy\Desktop\stat483\data\FALLscheduling.dat';
  input patient $ 1-16 
        @18 bdate mmddyy10. @30 lastappt mmddyy10.;
  day=weekday(lastappt);
  length nameday $9.;
  if day = 1 then nameday = 'Sunday';
    else if day = 2 then nameday = 'Monday';
	else if day = 3 then nameday = 'Tuesday';
	else if day = 4 then nameday = 'Wednesday';
	else if day = 5 then nameday = 'Thursday';
	else if day = 6 then nameday = 'Friday';
	else if day = 7 then nameday = 'Saturday';
  format lastappt date7.;
  drop bdate day;
RUN;

PROC PRINT data=weekday NOOBS;
  title 'The weekday data set';
RUN;

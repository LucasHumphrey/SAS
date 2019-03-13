/*******************************************
 Written by: Lucas Humphrey
 Date: November 11, 2018
 
 This program reads in the scores data and
 creates two regression equations, plotting
 the regressions as well as residuals.
 *******************************************/
OPTIONS NODATE NONUMBER;

DATA dose_response;
   INPUT dose sbp dbp;
   DATALINES;
4  180   110
4  190   108
4  178   100
8  170   100
8  180   98
8  168   88
16 160   80
16 172   86
16 170   86
32 140   80
32 130   72
32 128   70
;
RUN;

SYMBOL1 VALUE=DOT COLOR=BLACK;

PROC REG data=dose_response;
  title 'SBP vs. Dose Regression';
  model sbp = dose;
  plot sbp * dose
       residual. * dose;
RUN;
QUIT;

PROC REG data=dose_response;
  title 'DBP vs. Dose Regression';
  model dbp = dose;
  plot dbp * dose
       residual. * dose;
RUN;
QUIT;

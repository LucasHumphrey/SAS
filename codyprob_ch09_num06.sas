/*********************************************************
 Written by: Lucas Humphrey
 Date: December 2, 2018
 
 This program creates the exercise data set, then builds
 a correlation matrix between all variables, creates a
 dummy variable for gender, and uses stepwise regression
 to determine the appropriate regression equation with
 significant predictors.
 *********************************************************/
OPTIONS NODATE NONUMBER;

DATA EXERCISE; 
    DO SUBJ = 1 TO 500;   
       IF RANUNI(155) LT .5 THEN GENDER = 'Female';  
                            ELSE GENDER = 'Male';  
       PRESS = INT(RANNOR(0)*20 + 95 + 50*(GENDER EQ 'Male'));  
       CURL = RANNOR(0)*10 + 30 + .2*PRESS;  
       PUSHUPS = INT(RANNOR(0)*3 + 5 + 5*(GENDER EQ 'Male') 
                 + .1*CURL); 
       SITUPS = INT(RANNOR(0)*10 + 20 + .1*PRESS + PUSHUPS); 
       OUTPUT;  
    END;
RUN;

PROC CORR data=exercise nosimple;
   title 'Correlations from Exercise';
   var press curl pushups situps;
RUN;

DATA exercise2;
   set exercise;
   if gender in ('Male' 'Female') then gender2 = (gender EQ 'Male');
RUN;

PROC REG data=exercise2;
   title 'Stepwise Regression for Exercise';
   model press = pushups curl situps gender2;
   model press = curl situps gender2;
RUN;
QUIT;

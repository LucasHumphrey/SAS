/***********************************************************
 Written by: Lucas Humphrey
 Date: December 2, 2018
 
 This program creates the smoking data set, then creates
 a two-way frequency table comparing smoking status and
 outcome, and finally performs logistic regression analysis
 on those same two variables.
 ***********************************************************/
OPTIONS NODATE NONUMBER;

PROC FORMAT; 
    VALUE YESNO 1='YES' 0='NO';  
    VALUE OUTCOME 1='Case' 0='Control';
RUN;

DATA SMOKING;
    DO SUBJECT = 1 TO 1000;
       DO OUTCOME = 0,1;  
          IF RANUNI(567) LT .1 OR RANUNI(0)*OUTCOME GT .5 THEN SMOKING = 1;  
                                                          ELSE SMOKING = 0;     
          IF RANUNI(0) LT .05 OR     
             (RANUNI(0)*OUTCOME + .1*SMOKING) GT .6 THEN ASBESTOS = 1;  
                                                    ELSE ASBESTOS = 0;     
          IF RANUNI(0) LT .3 OR OUTCOME*RANUNI(0) GT .9 THEN SES = '1-Low   '; 
     ELSE IF RANUNI(0) LT .3 OR OUTCOME*RANUNI(0) GT .8 THEN SES = '2-Medium'; 
                                                        ELSE SES = '3-High';       
          OUTPUT;   
       END;  
    END;  
    FORMAT SMOKING ASBESTOS YESNO. OUTCOME OUTCOME.;
RUN;

PROC FREQ data=smoking;
   title 'Crosstabulation of Smoking and Outcome';
   tables outcome*smoking / chisq measures;
RUN;

PROC LOGISTIC data=smoking;
   title 'Predicting Outcomes Using Logistic Regression';
   model outcome = smoking / risklimits;
RUN;
QUIT;

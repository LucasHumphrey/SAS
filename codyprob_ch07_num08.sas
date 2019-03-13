/***************************************************
 Written by: Lucas Humphrey
 Date: November 18, 2018
 
 This program reads in the data and first computes
 the correlation between IQ and score, then conducts
 a t-test, tests if the slope is homogeneous, and
 conducts an analysis of covariance.
 ****************************************************/
OPTIONS NODATE NONUMBER;

DATA co_vary; 
     DO I = 1 TO 20; 
       DO GROUP = 'A','B';  
           SUBJ + 1;      
           IQ = INT(RANNOR(124)*10 + 120 + 15*(GROUP EQ 'A'));
           SCORE = INT(.7*IQ + RANNOR(0)*10 + 100 + 10*(GROUP EQ 'B'));  
           OUTPUT;    
       END;  
     END;  
     DROP I;
RUN;

PROC CORR data=co_vary nosimple;
   title 'Correlation';
   var IQ SCORE;
RUN;

PROC TTEST data=co_vary;
   class GROUP;
   var SCORE IQ;
RUN;

PROC GLM data=co_vary;
   class GROUP;
   model SCORE = IQ GROUP IQ*GROUP / SS3;
RUN;

PROC GLM data=co_vary;
   class GROUP;
   model SCORE = IQ GROUP / SS3;
   lsmeans GROUP;
RUN;

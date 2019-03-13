/*********************************************
 Written by: Lucas Humphrey
 Date: November 11, 2018
 
 This program reads in the data and performs
 a paired t-test on the x and y variables for
 groups A and C.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA QUES6_4;  
    DO GROUP = 'A','B','C';   
      DO I = 1 TO 10;      
         X = ROUND(RANNOR(135)*10 + 300 + 5*(GROUP EQ 'A') - 7*(GROUP EQ 'C')); 
         Y = ROUND(RANUNI(135)*100 + X);  
         OUTPUT;    
      END;   
    END;   
    DROP I;
RUN;

PROC TTEST data=QUES6_4 (where=(group NE 'B'));
  title 'Paired T-test for X and Y';
  paired X * Y;
RUN;

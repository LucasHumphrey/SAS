/************************************************
 Written by: Lucas Humphrey
 Date: November 11, 2018
 
 This program reads in the scores data and
 first creates regression and residual plots,
 then creates a scatterplot for a 95% confidence
 interval.
 ************************************************/
OPTIONS NODATE NONUMBER;

DATA SCORES;   
   DO SUBJECT = 1 TO 100;
      IF RANUNI(1357) LT .5 THEN GROUP = 'A'; 
	                        ELSE GROUP = 'B';
      MATH = ROUND(RANNOR(1357)*20 + 550 + 10*(GROUP EQ 'A'));
      SCIENCE = ROUND(RANNOR(1357)*15 + .4*MATH + 300);  
      ENGLISH = ROUND(RANNOR(1357)*20 + 500 + .05*SCIENCE + .05*MATH); 
      SPELLING = ROUND(RANNOR(1357)*15 + 500 + .1*ENGLISH);  
      VOCAB = ROUND(RANNOR(1357)*5 + 400 + .1*SPELLING + .2*ENGLISH);  
      PHYSICAL = ROUND(RANNOR(1357)*20 + 550);     
      OVERALL = ROUND(MEAN(MATH, SCIENCE, ENGLISH, SPELLING, VOCAB, PHYSICAL));  
      OUTPUT;  
   END;
RUN;

SYMBOL1 VALUE=DOT COLOR=BLACK;

PROC REG data=scores;
  title 'Math vs. Science Regression';
  model science = math;
  plot science * math
       residual. * math;
RUN;
QUIT;

GOPTIONS CSYMBOL=BLACK;
SYMBOL1 VALUE=DOT;
SYMBOL2 VALUE=NONE I=RLCLM95;

PROC GPLOT data=scores;
  title 'Math vs. Science Scatterplot';
  plot science * math = 1
       science * math = 2 / overlay;
RUN;
QUIT;

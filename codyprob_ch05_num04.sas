/*******************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in the scores data and
 first creates a correlation matrix for all
 of the variables, then correlates each
 individual variable with overall score.
 *******************************************/
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

PROC CORR data=scores NOSIMPLE;
  title 'Correlation Matrix of Test Scores with Overall Score';
  var math science english spelling vocab physical overall;
RUN;

PROC CORR data=scores NOSIMPLE;
  title 'Correlation of Math with Overall';
  var math overall;
RUN;

PROC CORR data=scores NOSIMPLE;
  title 'Correlation of Science with Overall';
  var science overall;
RUN;

PROC CORR data=scores NOSIMPLE;
  title 'Correlation of English with Overall';
  var english overall;
RUN;

PROC CORR data=scores NOSIMPLE;
  title 'Correlation of Spelling with Overall';
  var spelling overall;
RUN;

PROC CORR data=scores NOSIMPLE;
  title 'Correlation of Vocab with Overall';
  var vocab overall;
RUN;

PROC CORR data=scores NOSIMPLE;
  title 'Correlation of Physical with Overall';
  var physical overall;
RUN;

/***************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in raw data for
 calculating the odds ratio and the
 relative risk using the FREQ procedure.
 ***************************************/
OPTIONS NODATE NONUMBER;

DATA odds;
   INPUT Drug $ Study $ Outcome $ Count;
   DATALINES;
   MGsO4   One   Survived  20
   MGsO4   One   Died     100
   Placebo One   Survived  25
   Placebo One   Died     155
   MGsO4   Two   Survived  25
   MGsO4   Two   Died     150
   Placebo Two   Survived  21
   Placebo Two   Died     150
   MGsO4   Three Survived  30
   MGsO4   Three Died     200
   Placebo Three Survived  28
   Placebo Three Died     240
   ;
RUN;

PROC FREQ data = odds;
   title 'Mantel-Haenszel Chi-square Test';
   TABLE Study*Outcome*Drug/chisq cmh;
   WEIGHT Count;
RUN;

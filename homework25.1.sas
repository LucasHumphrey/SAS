/*************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in raw data for
 calculating the odds ratio using the
 FREQ procedure.
 *************************************/
OPTIONS NODATE NONUMBER;

DATA odds;
   INPUT Outcome $ Exposure $ Count;
   DATALINES;
   Case    Yes  50
   Case    No  500
   Control Yes  40
   Control No  500
   ;
RUN;

PROC FREQ data = odds;
   title 'Program to Compute an Odds Ratio';
   TABLE Exposure*Outcome / chisq cmh;
   WEIGHT Count;
RUN;

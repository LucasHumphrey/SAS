/*************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in raw data for
 calculating the kappa coefficient 
 using the FREQ procedure.
 *************************************/
OPTIONS NODATE NONUMBER;

DATA kappa;
   INPUT MethodOne $ MethodTwo $ Count;
   DATALINES;
   Occuled     Occuled      15
   Occuled     Non-occuled   8
   Non-occuled Occuled      10
   Non-occuled Non-occuled  67
   ;
RUN;

PROC FREQ data = kappa;
   title 'Program to Compute Kappa Coefficient';
   TABLE MethodOne*MethodTwo / agree;
   WEIGHT Count;
RUN;

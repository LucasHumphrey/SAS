/*************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in raw data for
 calculating the relative risk using
 the FREQ procedure.
 *************************************/
OPTIONS NODATE NONUMBER;

DATA RR;
   INPUT Asthma $ Exposure $ Count;
   DATALINES;
   Low-SES  Yes  40
   Low-SES  No  100
   High-SES Yes  30
   High-SES No  130
   ;
RUN;

PROC FREQ data = RR;
   title 'Program to Compute a Relative Risk';
   TABLE Exposure*Asthma / cmh;
   WEIGHT Count;
RUN;

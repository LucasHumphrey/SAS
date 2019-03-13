/**************************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program creates and randomizes observations,
 then sets the observations to rater variables
 inside of macro variable parameters and calculates
 the kappa coefficients for two macro runs.
 **************************************************/
OPTIONS NODATE NONUMBER;

DATA agree;
   do id = 1 to 100;
      output;
   end;
RUN;

DATA agree;
   set agree;
   seed=ranuni(456);
RUN;

PROC SORT data=agree;
   by seed;
RUN;

%MACRO cutoff(cutoff1=, cutoff2=, cutoff3=,);
DATA agree;
   set agree;
   if seed < &cutoff1 then
     do; rater1 = 'Yes'; rater2 = 'Yes'; end;
   else if &cutoff1 < seed < &cutoff2 then
     do; rater1 = 'Yes'; rater2 = 'No'; end;
   else if &cutoff2 < seed < &cutoff3 then
     do; rater1 = 'No'; rater2 = 'Yes'; end;
   else if seed > &cutoff3 then
     do; rater1 = 'No'; rater2 = 'No'; end;
RUN;

PROC FREQ data=agree;
   title 'Kappa Coefficient Calculation';
   table rater1*rater2 / nocum nopercent norow nocol agree;
RUN;
%MEND cutoff;

%cutoff(cutoff1=0.4, cutoff2=0.5, cutoff3=0.6)
%cutoff(cutoff1=0.2, cutoff2=0.5, cutoff3=0.8)


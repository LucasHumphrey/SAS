/************************************************
 Written by: Lucas Humphrey
 Date: November 18, 2018
 
 This program reads in the data and performs
 the ANOVA test for drug and genetic differences.
 *************************************************/
OPTIONS NODATE NONUMBER;

DATA depression;
  do group = 'deficiency','normal';
     do trt = 'anti','placebo';
	    do patient = 1 to 4;
		   input survey @;
           output;
        end;
	 end;
   end;
DATALINES;
9 11 10 10 9 6 6 7 5 4 7 7 12 11 10 11
;
PROC GLM data=depression;
   title 'Depression Study';
   class group trt;
   model survey=group | trt;
RUN;

PROC MEANS data=depression NWAY NOPRINT;
   class group trt;
   var survey;
   output out=means mean=m_s;
RUN;

SYMBOL1 v=square color=black i=join;
SYMBOL2 v=circle color=black i=join;
PROC GPLOT data=means;
    title 'Interaction Plot';
	plot m_s * trt = group;
RUN;

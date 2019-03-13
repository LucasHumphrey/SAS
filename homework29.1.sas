/*********************************************
 Written by: Lucas Humphrey
 Date: November 18, 2018
 
 This program reads in the data and assigns
 treatment groups to the volunteers, then
 performs a one-way ANOVA test followed by an
 SNK multiple-comparison test.
 **********************************************/
OPTIONS NODATE NONUMBER;

DATA med;
  infile 'C:\Users\Amy\Desktop\stat483\data\cody_chap07_num02.dat';
  input v1-v10;
  array volunteer(10) v1-v10;
  length treat $ 7.;
  do treat = 'A','B','Placebo';
     do volno = 1 to 10;
        value = volunteer(volno);
		output;
     end;
  end;
  drop v1-v10;
RUN;

PROC ANOVA data=med;
   title 'Analysis of Medication Data';
   class treat;
   model value = treat;
   means treat / SNK;
RUN;

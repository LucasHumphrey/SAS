/****************************************
 Written by: Lucas Humphrey
 Date: November 11, 2018
 
 This program reads in the diet data and
 performs a t-test and paired t-test for 
 changes in weight.
 ****************************************/
OPTIONS NODATE NONUMBER;

DATA diet;
  infile 'C:\Users\Amy\Desktop\stat483\data\cody_chap06_num06.dat';
  input time $ p1-p12;
  array patient(12) p1-p12;
  do patno = 1 to 12;
     weight = patient(patno);
	 output;
  end;
  drop p1-p12;
RUN;

PROC SORT data=diet out=diet2;
  by patno;
RUN;

DATA diet3;
  set diet2;
  by patno;
  if time = 'Before' then before = weight;
    else if time = 'After' then after = weight;
  if last.patno then output;
  retain before after;
RUN;

PROC TTEST data=diet;
  title 'T-test for Diet';
  class time;
  var weight;
RUN;

PROC TTEST data=diet3;
  title 'Paired T-test for Diet';
  paired before * after;
RUN;

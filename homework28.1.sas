/********************************************
 Written by: Lucas Humphrey
 Date: November 11, 2018
 
 This program reads in the data and performs
 the t-test and Wilcoxon rank-sum test.
 ********************************************/
OPTIONS NODATE NONUMBER;

DATA speed;
  infile 'C:\Users\Amy\Desktop\stat483\data\cody_chap06_num02.dat';
  input program $ s1-s14;
  array subject(14) s1-s14;
  do subjno = 1 to 14;
     reading = subject(subjno);
	 output;
  end;
  drop s1-s14;
RUN;

PROC TTEST data=speed;
  title 'T-test for Reading Speeds';
  class program;
  var reading;
RUN;

PROC NPAR1WAY data=speed WILCOXON;
  title 'Wilcoxon Rank-Sum Test for Reading Speeds';
  class program;
  var reading;
  EXACT WILCOXON;
RUN;

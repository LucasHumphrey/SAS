/*********************************************
 Written by: Lucas Humphrey
 Date: October 14, 2018
 
 This program reads in the grades data as an
 array and creates the variable for number of
 exams passed, then prints the results.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA answers;
  infile 'C:\Users\Amy\Desktop\stat483\data\grades2.dat';
  input id $ score1 score2 score3 score4 score5;
  array top (5) _temporary_ (65, 70, 60, 75, 66);
  array score (5) score1 -- score5;
  passed = 0;
  do i = 1 to 5;
     if score(i) >= top(i)
	 then passed + 1;
  end;
  drop i;
RUN;

PROC PRINT data=answers;
  title 'The answers data set';
  var id score1-score5 passed;
RUN;

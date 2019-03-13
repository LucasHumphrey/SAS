/********************************************************
 Written by: Lucas Humphrey
 Date: September 9, 2018
 
 This program reads in a permanent dataset and calculates
 averages using the established grades, then determines
 a status for the student based on their averages. These
 results are then printed out.
 ********************************************************/
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';
OPTIONS NODATE NONUMBER CENTER;

DATA question03;
  set stat483.question03;
  average1 = (grade1+grade2)/2;
  average2 = (grade2+grade3)/2;
  if (average1 = .) or (average2 = .) then status = 'incomplete';
        else if (average1 = average2) then status = 'no change';
	    else if (average1 < average2) then status = 'improved';
	    else if (average1 > average2) then status = 'regressed';
RUN;

PROC PRINT data=question03;
  title 'Question #3';
  var student grade1 grade2 grade3 status;
RUN;


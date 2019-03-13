/*********************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program creates the grades data, then
 defines and formats the variable for status, 
 and finally prints a list of frequencies for 
 the statuses of students in a group. All of
 this is within a macro variable with the
 parameter being the cutoff grade for passing
 and failing. The macro is invoked thrice for
 three different cutoffs.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA grades;
    do i = 1 to 100;
       id = i;
       grade = int(100*ranuni(123)+1);
       output;
    end;
RUN;

PROC FORMAT;
  value fStatus 1 = 'Failed'
                2 = 'Passed';
RUN;

%MACRO GRADECUTS(cutoff=);
DATA grades2;
  set grades;
  if grade < &cutoff then Status = 1;
    else if grade > &cutoff then Status = 2;
  format Status fStatus.;
RUN;

PROC FREQ data=grades2;
  title "Grade Distribution When Cutoff = &cutoff";
  tables Status / list nocum;
RUN;
%MEND GRADECUTS;

%GRADECUTS(cutoff=60)
%GRADECUTS(cutoff=70)
%GRADECUTS(cutoff=80)

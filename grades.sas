/********************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program creates the grades data, then
 defines the macro variable for the cutoff
 grade, defines and formats the variable for
 status, and finally prints a list of
 frequencies for the statuses of students
 in a group.
 ********************************************/
OPTIONS NODATE NONUMBER;

DATA grades;
    do i = 1 to 100;
       id = i;
       grade = int(100*ranuni(123)+1);
       output;
    end;
RUN;

%LET Cutoff = 70;

PROC FORMAT;
  value fStatus 1 = 'Failed'
                2 = 'Passed';
RUN;

DATA grades2;
  set grades;
  if grade < &Cutoff then Status = 1;
    else if grade > &Cutoff then Status = 2;
  format Status fStatus.;
RUN;

PROC FREQ data=grades2;
  title "Grade Distribution When Cutoff = &Cutoff";
  tables Status / list nocum;
RUN;

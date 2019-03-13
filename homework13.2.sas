/*****************************************************
 Written by: Lucas Humphrey
 Date: September 25, 2018
 
 This program reads in the walk data and creates a
 variable for age groups, then sorts the data by age
 group and time. After finding which observation from
 each age group has the best time, those observations
 are printed out.
 *****************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA walk;
  set stat483.walk;
  length group $ 7;
  select;
      when (age < 18)        group = 'Youth';
	  when (18 <= age <= 62) group = 'Adult';
	  when (age > 62)        group = 'Senior';
      otherwise              group = 'Unknown';
  end;
  format time 4.1;
RUN;

PROC SORT data=walk out=srtdwalk;
  by group time;
RUN;

DATA walk2;
  set srtdwalk;
  by group time;
  firstgroup = first.group;
RUN;

PROC PRINT data=walk2 NOOBS LABEL;
  title 'Winners in Each Age Group';
  label id = 'ID'
        age = 'Age'
		time = 'Time'
		group = 'Age Group';
  var id age time group;
  where firstgroup = 1;
RUN;

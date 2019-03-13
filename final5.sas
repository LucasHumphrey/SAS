/**************************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program reads the quality of life data by
 subject number, calculates the years between each
 visit for each subject, determines the score for
 each subject based on change in qul_1, then prints
 the data in a frequency table.
 **************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA qul;
   set stat483.qul;
   by subj;
   if first.subj then first_visit = v_date;
   if first.subj then qul_11 = qul_1;
   if last.subj then output;
   diff = yrdif(first_visit,v_date,'act/act');
   years = round(diff,1);
   change = qul_1 - qul_11;
   length score $8.;
   if change < 0 then score = 'Better';
     else if change > 0 then score = 'Worse';
	 else if change = 0 then score = 'NoChange';
   retain first_visit years qul_11 change score;
RUN;

PROC FREQ data=qul;
   title 'Table of years by score';
   table years*score / nocol nopercent cmh;
RUN;

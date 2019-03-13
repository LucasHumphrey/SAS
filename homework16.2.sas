/**************************************************
 Written by: Lucas Humphrey
 Date: October 7, 2018
 
 This program reads the three data sets for ICDB
 and merges them with certain conditions in the
 DATA step, then prints out the final analysis.
 **************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA icdbpatients;
  set stat483.icdbpatients;
RUN;

DATA back;
  set stat483.back;
RUN;

DATA qul;
  set stat483.qul;
RUN;

DATA analysis (keep = subj backdate mar_st ed_level
                      quldate qul_1 qul_2);
  merge icdbpatients (in=inicdbpatients)
        back (rename=(v_date=backdate))
        qul (where=(v_type=0)
             rename=(v_date=quldate));
  by subj;
  if inicdbpatients;
RUN;

PROC PRINT data=analysis NOOBS;
  title 'The analysis data set';
RUN;

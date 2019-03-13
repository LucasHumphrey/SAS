/***********************************************
 Written by: Lucas Humphrey
 Date: October 11, 2018
 
 This program merges two datasets in one DATA
 step while creating the avglimit variable and
 setting conditions for which observations appear
 in each dataset's output.
 ***********************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA low high;
  merge stat483.qula (keep=subj v_type v_date qul_1)
        stat483.qulb (rename=(vis_date=v_date)
                      keep=subj v_type vis_date qul_6 qul_8);
  by subj v_type v_date;
  avglimit = (qul_6 + qul_8)/2;
  if (avglimit < 3.0) then output low;
    else if (avglimit >= 3.0) then output high;
  drop qul_6 qul_8;
RUN;

PROC PRINT data=low (OBS=10);
  title 'Output dataset: LOW';
RUN;

PROC PRINT data=high (OBS=10);
  title 'Output dataset: HIGH';
RUN;

/*****************************************************
 Written by: Lucas Humphrey
 Date: October 7, 2018
 
 This program reads the two permanent qul data sets
 and formats one set so both can be concatenated into
 one set, and the contents are printed.
 *****************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA qul11;
  set stat483.qul11;
RUN;

DATA qul21 (rename = (subj_id2 = subj_id));
  set stat483.qul21;
  subj_id2 = put(subj_id,9.);
  drop subj_id;
RUN;

DATA qul;
  set qul11 qul21;
RUN;

PROC CONTENTS data=qul;
  title 'Contents of the qul data set';
RUN;

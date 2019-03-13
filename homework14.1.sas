/*****************************************************
 Written by: Lucas Humphrey
 Date: September 26, 2018
 
 This program reads the Quality of Life data into a
 temporary dataset which keeps certain variables,
 calculates a new variable, and drops the remaining
 variables. The observations printed are chosen based
 on two criteria.
 *****************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA temp (keep = subj v_type v_date scale1);
  set stat483.qul (rename=(qul_3a=qul3a qul_3b=qul3b
                           qul_3c=qul3c qul_3d=qul3d
                           qul_3e=qul3e qul_3f=qul3f
                           qul_3g=qul3g qul_3h=qul3h
                           qul_3i=qul3i qul_3j=qul3j)
                   where=((int(subj/10000)=31)and(v_type < 1)));
  scale1 = qul3a+qul3b+qul3c+qul3d+qul3e+qul3f+qul3g+qul3h+qul3i+qul3j;
  format scale1 4.1;
  drop qul3a qul3b qul3c qul3d qul3e qul3f qul3g qul3h qul3i qul3j;
RUN;

PROC PRINT data=temp;
  title 'Output Dataset: TEMP';
RUN;

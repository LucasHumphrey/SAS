/***********************************************
 Written by: Lucas Humphrey
 Date: September 2, 2018
 
 This program prints out the data recorded from
 the diet program and converts height and weight
 to appropriate measurements for calculations.
 ***********************************************/
OPTIONS PS=58 LS=80;

DATA dietdata;
  infile 'C:\Users\Amy\Desktop\stat483\data\dietdata.dat';
  input subj $ 1-3 height $ 4-5 wt_init 6-8 wt_final 9-11;
  ht = input(height,2.)*0.0254;                      *Convert inches to meters;
  wt_i = wt_init/2.2;                                *Convert pounds to kilograms;
  wt_f = wt_final/2.2;                               *Convert pounds to kilograms;
  bmi_init = wt_i/(ht*ht);
  bmi_final = wt_f/(ht*ht);
  bmi_diff = bmi_final-bmi_init;
RUN;

PROC PRINT data=dietdata;
  title 'Output dataset: DIETDATA';
  var subj ht wt_i wt_f bmi_init bmi_final bmi_diff; *Prints only these variables;
RUN;

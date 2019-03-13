/************************************************
 Written by: Lucas Humphrey
 Date: October 28, 2018
 
 This program reads in the agility data and
 utilizes date formats to change the appearances
 of variables and calculate a new variable.
 ************************************************/
OPTIONS NODATE NONUMBER;

DATA agility (where=(date1<'19mar2009'd));
  infile 'C:\Users\Amy\Desktop\stat483\data\scores.dat' DLM=',' DSD MISSOVER;
  length name $ 10;
  input name $ date1 : mmddyy10. date2 : mmddyy10. s1 s2;
  days=datdif(date1,date2,'act/act');
  format date1 mmddyyp10. date2 mmddyyp10.;
RUN;

PROC PRINT data=agility NOOBS;
  title ' ';
RUN;

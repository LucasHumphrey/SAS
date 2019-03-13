/********************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the results2 data
 with an if-then-else statement, then prints
 the results.
 ********************************************/
OPTIONS NODATE NONUMBER;

DATA results2;
  infile 'C:\Users\Amy\Desktop\stat483\data\results2.dat';
  input source 10 @;
  if source = 1 then input @1 id name $ source score;
    else if source = 2 then input @1 id score source name $;
RUN;

PROC PRINT data=results2 NOOBS;
  title 'The results2 data set';
RUN;

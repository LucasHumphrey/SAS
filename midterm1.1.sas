/******************************************************
 Written by: Lucas Humphrey
 Date: September 9, 2018
 
 This program reads in the data for golf courses and 
 prints an output with modified labels, no observation
 numbers, and is double spaced.
 ******************************************************/
OPTIONS PS=58 LS=80 NODATE NONUMBER CENTER;

DATA question01;
  infile 'C:\Users\Amy\Desktop\stat483\data\question01.dat';
  input name $ 1-19 par $ holes $ yardage $ fees;
  ydge = input(yardage,comma5.);
RUN;

PROC PRINT data=question01 LABEL DOUBLE;
  title 'Question #1';
  label name = 'Golf Course'
        par = 'Par'
		holes = 'No. of holes'
		yardage = 'Yardage'
		fees = 'Greens Fees';
  format fees dollar7.2;
  id name;
  var par holes yardage fees;
RUN;

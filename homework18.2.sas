/*********************************************
 Written by: Lucas Humphrey
 Date: October 9, 2018
 
 This program prints a table of money earned
 in increments of 300 dollars plus interest
 per month, until the amount of money earned
 exceeds 10,000 dollars.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA saved;
  DO UNTIL (earned >= 10000);
    earned + 300;
	earned + earned * (.06/12);
	months + 1;
	output;
  end;
RUN;

PROC PRINT data=saved NOOBS;
  title 'Amount Saved';
RUN;

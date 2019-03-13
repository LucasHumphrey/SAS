/*********************************************
 Written by: Lucas Humphrey
 Date: October 9, 2018
 
 This program prints a multiplication table
 using a DO loop to generate products between
 the values 1 through 9 in the row and column
 labels.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA multiply;
  v1 = 0;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  DO i = 1 to 9;
     v1 + 1;
	 v2 + 2;
	 v3 + 3;
	 v4 + 4;
	 v5 + 5;
	 v6 + 6;
	 v7 + 7;
	 v8 + 8;
	 v9 + 9;
	 output;
  end;
RUN;

PROC PRINT data=multiply NOOBS LABEL;
  title 'Multiplication table';
  label v1 = '1'
        v2 = '2'
		v3 = '3'
		v4 = '4'
		v5 = '5'
		v6 = '6'
		v7 = '7'
		v8 = '8'
		v9 = '9';
  var i v1 v2 v3 v4 v5 v6 v7 v8 v9;
RUN;

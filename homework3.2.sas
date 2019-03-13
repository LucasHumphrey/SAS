/******************************************
 Written by: Lucas Humphrey
 Date: September 2, 2018
 
 This program prints out the rats dataset
 using formatted input.
 ******************************************/
OPTIONS PS=56 LS=78 CENTER;

DATA rats;
  infile 'C:\Users\Amy\Desktop\stat483\data\rats.dat';
  input @1 rat $2.
  		+0 dob $9.
		@13 disease $9.
		@24 death mmddyy8.
		@32 group $1.;
RUN;

PROC PRINT data=rats;
  title 'Output dataset: RATS';
RUN;

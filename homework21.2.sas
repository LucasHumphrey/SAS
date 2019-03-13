/*****************************************
 Written by: Lucas Humphrey
 Date: October 18, 2018
 
 This program reads in the addresses data
 sequentially and non-sequentially, then
 prints the results.
 *****************************************/
OPTIONS NODATE NONUMBER;

DATA addresses;
  infile 'C:\Users\Amy\Desktop\stat483\data\addresses.dat';
  input #4 ID
        #1 Name & $18.
		/ Street & $19.
		/ Town $11. State $ Zip $;
RUN;

PROC PRINT data=addresses NOOBS;
  title 'The addresses data set';
RUN;

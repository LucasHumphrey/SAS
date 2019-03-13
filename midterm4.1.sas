/*********************************************
 Written by: Lucas Humphrey
 Date: October 28, 2018
 
 This program reads in the namesin data and
 utilizes character functions to change the
 formats of each variable in the data set.
 *********************************************/
OPTIONS NODATE NONUMBER;

DATA namesin;
  infile 'C:\Users\Amy\Desktop\stat483\data\namesin.dat';
  input name $ 1-18 phone $ 20-34 SSN $ 35-47;
  first_name=scan(name,1,' ');
  last_name=scan(name,-1,' ');
  Newname=catx(', ',last_name,first_name);
  num1=substr(phone,2,3);
  num2=substr(phone,6,3);
  num3=substr(phone,10,4);
  Newphone="(" || trim(num1) || ") " || trim(num2) || "-" || trim(num3);
  NewSSN=compress(SSN,'({)(-)(})');
  drop name first_name last_name phone num1 num2 num3 SSN;
RUN;

PROC PRINT data=namesin NOOBS;
  title 'The namesin data set';
RUN;

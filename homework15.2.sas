/*****************************************************
 Written by: Lucas Humphrey
 Date: October 7, 2018
 
 This program reads the north and south entrance data
 into two sets that are interleaved into a combined
 data set that is then sorted by pass number and 
 printed.
 *****************************************************/
OPTIONS NODATE NONUMBER;

DATA south;
  infile 'C:\Users\Amy\Desktop\stat483\data\south.dat';
  input entrance $ pass_no party_size age;
RUN;

DATA north;
  infile 'C:\Users\Amy\Desktop\stat483\data\north.dat';
  input entrance $ pass_no party_size age lot;
RUN;

DATA unsortedentrances;
  set south north;
RUN;

PROC SORT data=unsortedentrances out=entrances;
  by pass_no;
RUN;

PROC PRINT data=entrances NOOBS LABEL;
  title 'The entrances data set';
  label entrance = 'Entrance'
        pass_no = 'Pass No'
		party_size = 'Party Size'
		age = 'Age'
		lot = 'Lot';
RUN;

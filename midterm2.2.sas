/********************************************************
 Written by: Lucas Humphrey
 Date: September 23, 2018
 
 This program reads the gpa data into a permanent data
 set, then prints a table of frequencies between seating
 location and performance using the FREQ procedure.
 ********************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA stat483.gpa;
  input student $ gender $ gpa weeklystudy sitting $;
  if (gpa >= 3.7) then performance = 'Good';
    else if (3.0 <= gpa < 3.7) then performance = 'Average';
	else if (gpa < 3.0) then performance = 'Bad';
  DATALINES;
1.    Male  2.67  15    Middle
2.    Female     2.98  8     Middle
3.    Female     2.67  3     Middle
4.    Female     3.6   8     Middle
5.    Female     3.76  12    Back
6.    Male  3.86  20    Middle
7.    Male  3.94  15    Back
8.    Male  2.8   5     Middle
9.    Male  3.48  12    Front
10.   Female     3.8   10    Middle
11.   Female     3.67  20    Front
12.   Female     3.7   8     Middle
13.   Female     2     10    Middle
14.   Female     4     12    Middle
15.   Female     3.55  15    Front
16.   Male  3.3   20    Middle
17.   Male  3.38  5     Middle
18.   Female     3.5   30    Front
19.   Male  3.7   12    Middle
20.   Female     3.2   10    Front
21.   Male  2.86  14    Front
22.   Male  3     2     Middle
23.   Female     3.88  8     Middle
24.   Male  3.51  10    Middle
25.   Female     3     6     Middle
26.   Female     2.8   35    Middle
27.   Male  3.36  15    Middle
28.   Male  4     6     Middle
29.   Male  3.5   10    Back
30.   Female     3.36  12    Middle
  ;
RUN;

PROC FREQ data=stat483.gpa;
  title 'Crosstabulation of Sitting by Performance';
  tables sitting*performance/nopercent;
RUN;

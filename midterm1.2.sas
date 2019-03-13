/******************************************************
 Written by: Lucas Humphrey
 Date: September 9, 2018
 
 This program reads in data for participants' last
 names, team colors, starting and ending weights, and
 determines their categories through if-else statments,
 then prints all the data.
 ******************************************************/
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';
OPTIONS NODATE NONUMBER CENTER;

DATA stat483.question02;
  input idno name $ team $ strtwght endwght;
  if (endwght < 120) then category = 1;
     else if (120 <= endwght < 150) then category = 2;
	 else if (150 <= endwght < 180) then category = 3;
	 else if (endwght >= 180) then category = 4;
  DATALINES;
1023 Shaw     R 189 165
1049 Serrano  Y 145 124
1219 Nance    R 210 192
1246 Sinha    Y 194 177
1078 McKnight R 127 118
1221 Brown    Y 220  .
  ;
RUN;

PROC PRINT data=stat483.question02;
  title 'Question #2';
  id idno;
  var name team strtwght endwght category;
RUN;

/******************************************************
 Written by: Lucas Humphrey
 Date: September 2, 2018
 
 This program reads in the bone score dataset and
 uses if-then-else statements to create new variables,
 then prints those variables with the dataset.
 ******************************************************/
DATA bonescore1;
  infile 'C:\Users\Amy\Desktop\stat483\data\Bonescor2.dat';
  input singh ccratio csi calcar bone dpa;
  if (singh <= 4) then flag1 = 1;
  	else if (4 < singh <= 5) then flag1 = 2;
	else if (singh > 5) then flag1 = 3;
  if (ccratio > 0.67) then flag2 = 1;
  	else if (0.52 < ccratio <= 0.67) then flag2 = 2;
	else if (ccratio <= 0.52) then flag2 = 3;
  if (csi <= 0.55) then flag3 = 1;
  	else if (0.55 < csi <= 0.65) then flag3 = 2;
	else if (csi > 0.65) then flag3 = 3;
  if (calcar <= 6) then flag4 = 1;
  	else if (6 < calcar <= 7) then flag4 = 2;
	else if (calcar > 7) then flag4 = 3;
  ourscore = sum(flag1,flag2,flag3,flag4);
RUN;

PROC PRINT data=bonescore1;
  title 'Output dataset: BONESCORE1';
RUN;

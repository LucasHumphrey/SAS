/*********************************************************
 Written by: Lucas Humphrey
 Date: December 2, 2018
 
 This program reads in the data and creates dummy
 variables for representing the light and water variables,
 then performs regression analysis on tomato yield with
 the dummy variables as the predictors.
 *********************************************************/
OPTIONS NODATE NONUMBER;

DATA tomato;
  infile 'C:\Users\Amy\Desktop\stat483\data\cody_chap09_num02.dat';
  input yield light $ water $;
  if light in ('1' '2' '3') then do;
     light1 = (light EQ '1');
	 light2 = (light EQ '2');
  end;
  if water in ('1' '2') then water1 = (water EQ '1');
RUN;

PROC REG data=tomato;
  title 'Tomato Yield Regression';
  model yield = light1 light2 water1 / P R;
RUN;
QUIT;


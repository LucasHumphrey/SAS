/**************************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program reads the in the ratmaze data, then
 conducts a two-way analysis of variance and plots
 an interaction plot between the average speeds
 and age groups.
 **************************************************/
OPTIONS NODATE NONUMBER;

DATA ratmaze;
   infile 'C:\Users\Amy\Desktop\stat483\data\ratmaze.dat';
   input age $ strain $ speed @@;
RUN;

PROC ANOVA data=ratmaze;
   title 'Two-Way Analysis of Speed';
   class age strain;
   model speed = age strain age*strain;
RUN;

PROC MEANS data=ratmaze NWAY NOPRINT;
   class age strain;
   var speed;
   output out=means mean=avg_speed;
RUN;

SYMBOL1 V=SQUARE COLOR=BLACK I=JOIN;
SYMBOL2 V=CIRCLE COLOR=BLACK I=JOIN;
PROC GPLOT data=means;
   title "Interaction Plot";
   plot avg_speed * age = strain;
RUN;

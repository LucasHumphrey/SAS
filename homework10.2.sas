/*******************************************************
 Written by: Lucas Humphrey
 Date: September 16, 2018
 
 This program reads in the national parks data and
 constructs a report that summarizes the numbers of
 museums and camping sites in each region, as well as
 calculating the total number of facilities per region.
 *******************************************************/
OPTIONS NODATE NONUMBER;

DATA parks;
  infile 'C:\Users\Amy\Desktop\stat483\data\natparks.dat';
  input ParkName $ 1-21 Type $ Region $ Museums Camping;
RUN;

PROC REPORT data = parks NOWINDOWS HEADSKIP;
  title 'National Parks';
  column Region Museums Camping Facilities;
  define Region / group;
  define Museums / analysis format = 2.0 
                    width = 9 center;
  define Camping / analysis format = 2.0 
                    width = 9 center;
  define Facilities / computed format = 2.0 
                    width = 10 center;
  compute Facilities;
    Facilities = Museums.sum + Camping.sum;
  endcomp;
RUN;

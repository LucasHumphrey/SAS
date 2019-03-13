/*******************************************************
 Written by: Lucas Humphrey
 Date: September 23, 2018
 
 This program reads the backhem permanent data set into
 a temporary data set, then uses the MEANS procedure to
 generate a report that summarizes the temporary data.
 The new variables are then formatted and printed into
 a new report.
 *******************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC FORMAT;
  value racefmt 1 = 'AMIndian'
                2 = 'Asian'
				3 = 'Black'
				4 = 'Caucasian'
				5 = 'Multi-racial'
				6 = 'Other';

DATA summary;
  set stat483.backhem;
RUN;

PROC MEANS data=summary fw=10 maxdec=2 mean std min max;
  var mcv;
  format race racefmt.;
  class race;
  output out = racesummary
         min = minmcv
		 max = maxmcv
		 median = medmcv
		 n = n2;
RUN;

PROC PRINT SPLIT='/' DOUBLE;
  title 'The summary data set';
  label race = 'Race'
        minmcv = 'Minimum/MCV'
		maxmcv = 'Maximum/MCV'
		medmcv = 'Median/MCV'
		n2 = 'Sample/Size';
  id race;
  var minmcv medmcv maxmcv n2;
  where race > .;
RUN;

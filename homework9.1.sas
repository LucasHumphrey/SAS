/******************************************************
 Written by: Lucas Humphrey
 Date: September 16, 2018
 
 This program reads in datasets for ICDB background
 information and a state codebook, then formats the
 variables and prints the first 10 observations. These
 observations are summarized in frequency tables for
 each variable.
 ******************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

DATA back;
  set stat483.back;
  keep subj r_id country race state mar_st;
RUN;

PROC FORMAT;
  picture subjpix LOW-HIGH = '00-00000' (prefix='#');
  value countryfmt 1 = 'United States'
				   2 = 'Canada'
				   3 = 'Mexico'
				   4 = 'Other';
  value racefmt 1 = 'Aleut, Eskimo or American Indian'
			    2 = 'Asian or Pacific Islander'
			    3 = 'Black'
                4 = 'White'
                5 = 'Other';
  value mar_stfmt 1 = 'Married'
			      2 = 'Living with a partner'
			      3 = 'Separated'
			      4 = 'Divorced'
			      5 = 'Widowed'
			      6 = 'Never married';
  picture idpix LOW-HIGH = '9999';
RUN;

DATA states;
  set stat483.state_cd (rename = (code = start name = label));
  fmtname = 'statefmt';
RUN;

PROC FORMAT cntlin=states;
RUN;

PROC PRINT data=back (obs=10);
  title 'Background Data for First 10 Observations';
  format subj subjpix. r_id idpix. country countryfmt. 
         state statefmt. race racefmt. mar_st mar_stfmt.;
RUN;

PROC FREQ data=back (obs=10);
  title 'Frequency Counts for First 10 Observations';
  format country countryfmt. state statefmt. race racefmt. 
         mar_st mar_stfmt. r_id idpix.;
  table country state race mar_st r_id;
RUN;

PROC FORMAT FMTLIB;
  title 'Formats from Catalog';
  select subjpix idpix countryfmt statefmt racefmt mar_stfmt;
RUN;


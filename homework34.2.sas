/*******************************************
 Written by: Lucas Humphrey
 Date: December 9, 2018
 
 This program creates data for 32 students,
 randomizes them, assigns the students
 to the defined teaching methods, sorts the
 students in order by their ID, and prints
 the results.
 *******************************************/
OPTIONS NODATE NONUMBER;

DATA students;
   do id = 1 to 32;
      output;
   end;
RUN;

DATA random;
   set students;
   seed=ranuni(1000);
RUN;

PROC SORT data=random;
   by seed;
RUN;

PROC FORMAT;
   value mformat 1 = 'A'
                 2 = 'B'
				 3 = 'C'
				 4 = 'D';
RUN;

DATA teaching;
   set random;
   if _N_ LE 8 then method = 1;
     else if 8 LT _N_ LE 16 then method = 2;
	 else if 16 LT _N_ LE 24 then method = 3;
	 else if 24 LT _N_ LE 32 then method = 4;
   format method mformat.;
RUN;

PROC SORT data=teaching;
   by id;
RUN;

PROC PRINT data=teaching NOOBS;
   title 'Random Assignment of Teaching Methods';
   var id method;
RUN;

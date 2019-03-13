/********************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in the clinical data
 and creates several data sets using results
 from the MEANS procedure.
 ********************************************/
OPTIONS NONUMBER NODATE;

DATA clinical;     
     length PATIENT VISIT DATE_VISIT 8;   
     retain DATE_VISIT WEIGHT;   
     DO PATIENT = 1 TO 25;     
	        /* Gender assignment: 50% Female, 50% Male */
            IF RANUNI(135) LT .5 THEN GENDER = 'Female'; 
            ELSE GENDER = 'Male';    
			/* Group assignment: 33% A, 33% B, 34% C */
            X = RANUNI(135);     
            IF X LT .33 THEN GROUP = 'A';    
            ELSE IF X LT .66 THEN GROUP = 'B';   
            ELSE GROUP = 'C';    
			/* Create a random visit sequence */
            DO VISIT = 1 TO INT(RANUNI(135)*5); 
               IF VISIT = 1 THEN DO;     
                 DATE_VISIT = INT(RANUNI(135)*100) + 17250; 
                 WEIGHT = INT(RANNOR(135)*10 + 150);  
              END;   
              ELSE DO;  
                 DATE_VISIT = DATE_VISIT + VISIT*(10 + INT(RANUNI(135)*50));
                 WEIGHT = WEIGHT + INT(RANNOR(135)*10);  
              END;      
              OUTPUT;   
              IF RANUNI(135) LT .2 THEN LEAVE;  
            END;
     END; 
     DROP X;  
     FORMAT DATE_VISIT DATE9.;
RUN;

PROC MEANS data=clinical NOPRINT CHARTYPE;
  class gender group;
  var weight;
  output out=summary (drop=_FREQ_)
         mean= 
         median= 
         std= / AUTONAME;
RUN;

DATA grand gender group gender_group;
  set summary;
  if _TYPE_ = '00' then output grand;
    else if _TYPE_ = '01' then output gender;
	else if _TYPE_ = '10' then output group;
	else if _TYPE_ = '11' then output gender_group;
RUN;

PROC PRINT data=summary;
  title 'The summary data set';
RUN;

PROC PRINT data=grand;
  title 'The grand data set';
RUN;

PROC PRINT data=gender;
  title 'The gender data set';
RUN;

PROC PRINT data=group;
  title 'The group data set';
RUN;

PROC PRINT data=gender_group;
  title 'The gender & group data set';
RUN;



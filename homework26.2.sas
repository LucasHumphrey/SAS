/*******************************************
 Written by: Lucas Humphrey
 Date: October 31, 2018
 
 This program reads in the clinical data
 and creates a new data set that calculates
 the number of days between visits for each
 patient.
 *******************************************/
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

DATA change;
  set clinical;
  by patient;
  if first.patient and last.patient then delete;
  if first.patient then do;
	 first_weight = weight;
	 first_visit = date_visit;
  end;
  if last.patient then do;
     change_weight = weight - first_weight;
	 change_date = date_visit - first_visit;
  end;
  if last.patient then output;
  retain first_weight first_visit;
RUN;

PROC PRINT data = change;
  title 'The change data set';
RUN;

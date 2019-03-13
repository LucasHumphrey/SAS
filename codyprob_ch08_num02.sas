/*********************************************
 Written by: Lucas Humphrey
 Date: November 18, 2018
 
 This program reads in the data and conducts
 an ANOVA test for HDL, then transposes the
 data set and conducts another ANOVA test for
 HDL based on the three drugs.
 **********************************************/
OPTIONS NODATE NONUMBER;

DATA statin;  
    DO SUBJ = 1 TO 20;   
        IF RANUNI(1557) LT .5 THEN GENDER = 'FEMALE';  
                              ELSE GENDER = 'MALE'; 
        IF RANUNI(0) LT .3 THEN DIET = 'HIGH FAT'; 
                           ELSE DIET = 'LOW FAT';      
        DO DRUG = 'A','B','C';     
                LDL = ROUND(RANNOR(1557)*20 + 110 
                             + 5*(DRUG EQ 'A') 
                             - 10*(DRUG EQ 'B') 
                             - 5*(GENDER EQ 'FEMALE')  
                             + 10*(DIET EQ 'HIGH FAT'));   
                HDL = ROUND(RANNOR(1557)*10 + 20      
                             + .2*LDL         
                             + 12*(DRUG EQ 'B'));   
                TOTAL = ROUND(RANNOR(1557)*20 + LDL + HDL + 50  
                             -10*(GENDER EQ 'FEMALE')     
                             +10*(DIET EQ 'HIGH FAT'));   
                OUTPUT;  
        END;  
    END;
RUN;

PROC ANOVA data=statin;
   title 'ANOVA Test';
   class drug;
   model hdl = drug;
   means drug / SNK;
RUN;

DATA fatstatin;
   set statin;
   by subj;
   if drug = 'A' then hdl1 = hdl;
     else if drug = 'B' then hdl2 = hdl;
	 else if drug = 'C' then hdl3 = hdl;
   if last.subj then output;
   retain hdl1 hdl2 hdl3;
   drop ldl total;
RUN;

PROC ANOVA data=fatstatin;
   title 'ANOVA Test using Repeated Statement';
   model hdl1-hdl3 = / NOUNI;
   repeated drug 3 contrast(1) / NOM summary;
   repeated drug 3 contrast(2) / NOM summary;
   repeated drug 3 contrast(3) / NOM summary;
RUN;

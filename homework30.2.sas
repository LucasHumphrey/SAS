/*********************************************
 Written by: Lucas Humphrey
 Date: November 18, 2018
 
 This program reads in the data and conducts
 a two-way ANOVA test for HDL now considering
 gender, then plots the interaction between
 the mean for HDL and the types of drugs.
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

PROC GLM data=statin;
   title 'Two-Way ANOVA with Drug as a Repeated Measure';
   class subj gender drug;
   model hdl = gender subj(gender) drug
               gender*drug drug*subj(gender) / SS3;
   means gender|drug;
   test H=gender E=subj(gender);
   test H=drug gender*drug E=drug*subj(gender);
RUN;

PROC MEANS DATA=statin NOPRINT NWAY;
    class gender drug;
    var hdl;
    output out=inter
           mean=mean_hdl;
RUN;

OPTIONS LINESIZE=68 PAGESIZE=24;
SYMBOL1 VALUE=CIRCLE COLOR=BLACK INTERPOL=JOIN;
SYMBOL2 VALUE=SQUARE COLOR=BLACK INTERPOL=JOIN;

PROC GPLOT data=inter;
    title "Interaction Plot";
    plot mean_hdl*drug=gender;
RUN;

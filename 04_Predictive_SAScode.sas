PROC IMPORT DATAFILE="Y:/My Drive/Biostatistica/Dataset/PCR.xlsx"
OUT=pcr DBMS=xlsx REPLACE;
RUN;

proc print data=pcr; run;

/* modello completo, her2pos basta moltiplicarlo per 10 */

proc freq data=pcr;
tables outcome1;
run;

proc logistic data=pcr;
class grade3(ref="0") CLCT(ref="2") CLCN(ref="1") HER2POS(ref="0") 
REGIMEN(ref="1") HT1(ref="0") / param=REF;
model outcome1(event="1")= AGE GRADE3 CLCT CLCN ER2 PR2 KI2 HER2POS CICLI2 REGIMEN HT1 ;
run;


/*REDUCTED MODEL*/

proc logistic data=pcr ;
class grade3(ref="0") CLCT(ref="2") CLCN(ref="1") HER2POS(ref="0") 
REGIMEN(ref="1") HT1(ref="0") / param=REF;
 model outcome1(event="1")=  ER2 PR2 KI2  CICLI2;
RUN;


/*PREDIZIONI SU DUE PAZIENTI*/
data new_patients;
input ID  ER2 PR2 KI2 CICLI2;
cards;
90001 95 90 9 4
90002 0 0 50 6
;
run;

data pcr1;
set pcr new_patients;
run;

proc logistic data=pcr1;
model outcome1(event="1")=KI2 ER2 PR2 CICLI2 ;
output out=predetti p=prob_pcr;
run;

proc print data=predetti;
where id>90000;
run;


/*calibration plot (smoothed)*/

proc logistic data=pcr plots=calibration(CLM ShowObs RANGE=CLIP SMOOTH=0.75) ;;
 model outcome1(event="1")=KI2 ER2 PR2 CICLI2 ;
run;

/*c-index - AUC*/

proc logistic data=pcr plots=ROC ;;
 model outcome1(event="1")=KI2 ER2 PR2 CICLI2 ;
run;



/*validazione su set esterno*/

PROC IMPORT DATAFILE="Y:/My Drive/Biostatistica/Dataset/VALIDATION_PCR.xlsx" 
OUT=VALIDATION_SET DBMS=xlsx REPLACE;RUN;


data Training_Validation;
set pcr VALIDATION_SET;
 if id>9000 then do;
  pcr_observed=outcome1;
  outcome1=.;
end;
RUN;
   				  

proc logistic data=Training_Validation;
model outcome1(event="1")=KI2 ER2 PR2 CICLI2 ;
output out=predettiVal p=prob_pcr_val;
run;

data predetti_validation_set;
set predettiVal;
 if id>9000;
run;
 

proc logistic data=predetti_validation_set plots=roc;
model pcr_observed(event="1")=prob_pcr_val ;
run;







proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\dieta.xlsx" 
out=dieta dbms=xlsx replace;
run;

proc print data=dieta;
run;

DATA DIETA1;
SET DIETA;
perdita=(DOPO-PRIMA)*0.453592;
RUN;

proc means data=dieta1;
var perdita;
run;

PROC TTEST DATA=DIETA1 H0=0 SIDES=L;
VAR perdita;
RUN;


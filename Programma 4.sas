proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\NIDDM.xlsx" 
out=niddm dbms=xlsx replace;
run;

DATA NIDDM1;
SET NIDDM;
BMI=WT_KG/(HT_CM/100)**2;
RUN;

PROC MEANS DATA=NIDDM1 N MEAN STD;
VAR BMI;
RUN;

proc ttest data=niddm1 h0=28.4 sides=u;
var bmi;
run;










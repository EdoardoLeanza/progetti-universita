proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\NIDDM.xlsx" 
out=niddm dbms=xlsx replace;
run;

data niddm1;
set niddm;
bmi=wt_kg/(ht_cm/100)**2;
if bmi=. then delete;
run;

proc means data=niddm1;
var bmi;
run;

%LET MEAN=28.4;
%LET STD=3;
%LET N=16;
%LET M=10;

DATA BMI;
CALL STREAMINIT(4102020);
DO STUDIO=1 TO &M;
DO I=1 TO &N;
Y=RAND("NORMAL",&MEAN,&STD);
OUTPUT;
END;
END;
RUN;

ODS EXCLUDE ALL;

PROC MEANS DATA=BMI N MEAN STD;
VAR Y;
CLASS STUDIO;
ODS OUTPUT SUMMARY=MEDIECAMPIONARIE;
RUN;

ODS EXCLUDE NONE;

proc sgplot data=mediecampionarie;
histogram y_mean;
run;

proc means data=mediecampionarie;
 
run;

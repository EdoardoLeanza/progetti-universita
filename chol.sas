proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\chol.xlsx" 
out=chol dbms=xlsx replace;
run;

proc print data=chol;
run;

PROC MEANS DATA=chol N MEAN Stddev;
VAR chol;
RUN;

PROC TTEST DATA=chol h0=200 sides=2;
VAR chol;
RUN;
/* abbiamo trovato boh qui è il commento finale che 
serve tanto all'esame */
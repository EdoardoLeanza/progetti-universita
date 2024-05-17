proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\sbp_trascritto.xlsx" 
out=sbp dbms=xlsx replace;
run;
/* oppure per importare vedi foto 5 ottobre 2023 */

proc print data=sbp;
run;

data step;
set sbp;  /* da rivedere qui */
diff = sbp_dopo - sbp_prima;
run;

PROC TTEST DATA=sbp h0=0 sides=2;
VAR diff;
RUN;

/* essendo t value 2.90 e il valore critico di 0.0145, rifiutiamo l'ipotesi nulla:
abbiamo abbastanze evidenze empiriche per afferamre che la differenza è significatamente diversa */
proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\preop.xlsx" 
out=preop dbms=xlsx replace;
run;

proc print data=preop;
run;

proc means data=preop;
var KI67BIOP KI67SURG;
class treat; /* <-- poichè due gruppi */
run;
/* farmaco nuovo che porta valori tumorali più alti di quello classico... */

data preop1;
set preop;
diff = KI67SURG - KI67BIOP;
run;

PROC TTEST DATA=preop1;
class treat;
VAR diff;
RUN;

/* essendo t value -2.43 e il valore critico di 0.0167, rifiutiamo l'ipotesi nulla:
abbiamo abbastanze evidenze empiriche per affermare che c'è differenza tra i due farmaci,
ovvero il farmaco nuovo è peggiore di quello classico in quanto porta un peggioramento*/

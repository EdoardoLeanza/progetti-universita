proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\bambini.xlsx" 
out=bambini dbms=xlsx replace;
run;

proc print data=bambini;
run;

proc means data=bambini;
class treat; /* <-- poichè tre gruppi */
var months;
run;

proc glm data= bambini;
class treat; /* <-- variabile di stratificazione*/
model months=treat;
run;

/* essendo F value 5.10 e il valore critico di 0.0176, rifiutiamo l'ipotesi nulla:
abbiamo abbastanze evidenze empiriche per affermare che almeno una delle medie sia diversa dalle altre */


PROC TTEST DATA=bambini;
class treat;
VAR months;
where treat in ("A", "C");
RUN;

PROC TTEST DATA=bambini;
class treat;
VAR months;
where treat in ("A", "P");
RUN;

PROC TTEST DATA=bambini;
class treat;
VAR months;
where treat in ("C", "P");
RUN;

/* l'unico confronto significativo è quello tra attivi e controllo */
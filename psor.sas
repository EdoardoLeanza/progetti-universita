proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/PSOR.xlsx"
out=psor dbms=xlsx replace;
run;

proc print data=psor; run;

PROC NPAR1WAY DATA=PSOR WILCOXON;
CLASS DOSE; /* <-- variabile classificazione */
VAR SCORE; /* <-- variabile risposta */
run;

/* 0.11: anche in questo caso non possiamo rifiutare H0, non abbiamo abbastanza bla bla bla */

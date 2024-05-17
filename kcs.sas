proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/KCS.xlsx"
out=kcs dbms=xlsx replace;
run;

proc print data=kcs; run;

DATA KCS1;
SET KCS;
DIFF=OKERINSE-HYPOTEAR;
RUN;

/*  */

PROC UNIVARIATE DATA=KCS1;
VAR DIFF;
HISTOGRAM DIFF;
QQPLOT DIFF;
RUN;

/* q-q plot: quantili teorici con i quantili osservati;
 score alto: sintomo di valore grave, quindi in questo caso valore buono;
 4% DI PROB DI OSSERVARE UN VALORE UGUALE O ESTREMO DI osservare un valore bla bla bla vedi slide */

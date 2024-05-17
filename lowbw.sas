proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/LOWBW.xlsx"
out=lowbw dbms=xlsx replace;
run;

proc print data=lowbw; run;

PROC CORR DATA=LOWBW PLOTS=MATRIX(HISTOGRAM);
VAR WEIGHT CHEST ARM LENGTH;
RUN;

/* più aumenta il petto più aumenta il peso, però il valore di petto viene 
"confuso" anche da arm */

PROC GLM DATA=LOWBW;
MODEL WEIGHT=CHEST / SOLUTION;
run;

/* da 300 */

PROC GLM DATA=LOWBW;
MODEL WEIGHT=CHEST ARM chest*arm;
run;

/* a 117 (più una curva è curva e più la correttezza del modello tra 2 o più 
variabili è corretto) */

PROC GLM DATA=LOWBW;
MODEL WEIGHT=CHEST ARM LENGTH / SOLUTION;
run;

/* usando chest e arm la lunghezza del bimbo non è così rilevante */

PROC GLM DATA=LOWBW;
MODEL WEIGHT=CHEST ARM;
OUTPUT OUT=PREDETTI P=peso_previsto;
run;

/* metto in un dataset "predetti" in cui ci sarà il peso previsto (per non scrivere la formula lunga di pred della slide);
  */

proc glm data=predetti;
MODEL WEIGHT=peso_previsto;
run;

/* stesso R^2 di prima */

data newborn;
input chest arm weight;
cards;
22 8 .
;
run;

data new1;
set lowbw newborn;
run;

PROC GLM DATA=new1;
MODEL WEIGHT=CHEST ARM;
OUTPUT OUT=PREDETTI P=peso_previsto;
run;



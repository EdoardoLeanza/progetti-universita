proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/SERATOX.xlsx"
out=seratox dbms=xlsx replace;
run;

proc print data=seratox; run;

PROC GLM DATA=SERATOX PLOTS=DIAGNOSTICS;
CLASS DRUG;
MODEL SCORE=DRUG;
run;

/* distribuzione asimmetrica;
 quantili teorici con i quantili osservati e pattern abbastanza definito nel grafico quantile-residuo;
  non possiamo ritenere che l'assunto di normalità sia verificato nel box plot della distribuzione dello score*/

PROC NPAR1WAY DATA=SERATOX WILCOXON;
CLASS DRUG;
VAR SCORE;
run;

/* 18 volte su 100 faremo un errore di primo tipo: non possiamo rigettare l'ipotesi di uguaglianza di ipotesi di medie uguali;
  */

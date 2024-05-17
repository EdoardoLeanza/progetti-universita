/* esercitazione analisi non parametrica 1: uso un test non parametrico: test di wilcoxon con dati non appaiati */
proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/analisi_non_parametrica1.xlsx"
out=analisi1 dbms=xlsx replace;
run;

proc print data=analisi1; run;

data analisi1;
input paziente prima dopo;
diff = dopo - prima;
run;

proc univariate data=analisi1;
var diff;
histogram diff / normal;
run;

/* media negativa: è diminuita il numero di apnee dopo (buono!);
  concludiamo che ci sono evidenze che il farmaco funzioni, il farmaco diminuisce il numero di apnee nei bambini: posso negare l'ipotesi nulla*/

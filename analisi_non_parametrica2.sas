/* esercitazione analisi non parametrica 2: uso un test non parametrico: test di wilcoxon con la somma */
proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/analisi_non_parametrica2.xlsx"
out=analisi2 dbms=xlsx replace;
run;

proc print data=analisi2; run;

data=analisi2;
input paziente ipge ipercalcemia;
run;

proc glm data=analisi2 plots=diagnostics;
class ipercalcemia;
model ipge=ipercalcemia;
run;

proc means data=analisi2 n mean sttdev;
class ipercalcemia;
var ipge;
run;

proc npar1way data=analisi2 wilcoxon;
class ipercalcemia;
var ipge;
run;

/* boh vedi soluzioni; ranghi= score;
 applico test a una coda; abbiamo abbastanza evidenze per rigettare H0:
 ci sono differenze tra la media sia significativamente > rispetto alla media con valori di calcio normali*/

proc import file="Y:/My Drive/Biostatistica/Dataset/postop.xlsx"
out=postop dbms=xlsx replace;
getnames=yes;
run;

proc print data=postop; run;

proc univariate data=postop;
var postop_time;
histogram postop_time / normal;
/*output out=out_postop pctlpre=P_ pctlpts= 0 to 100 by 1;*/
run;

/* asimmetrica a destra, il 75% dei pazienti recuperano 13 mesi*/

proc quantreg data=postop;
model postop_time=age / quantile = .25 .50 .75 .9 plot=(quantplot fitplot) seed=1234;
run;

/* ha più senso interpretare l'età e non l'intercetta in età 0: all'aumentare dell'età aumentano mediamente di 0.0588;
nei valori bassi, l'incremento sia altrettanto basso (fino a 0.4 l'incremento non è significativo) (secondo grafico a destra);
nello scatter plot chi ha un'età avanzata mediamente avrà tempi di recupero maggiori*/

proc glm data=postop;
model postop_time=age / clparm;
run;

/* coefficiente stimato di 0.24*/
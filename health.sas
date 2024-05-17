proc import file="Y:/My Drive/Biostatistica/Dataset/health_expenses.xlsx"
out=health dbms=xlsx replace;
getnames=yes;
run;

proc print data=health; run;

proc glm data=health plots=(diagnostics residuals);
model totexp=totchr / clparm;
run;

/* rigettiamo l'ipotesi nulla: possiamo dire che all'aumentare delle patoglogie croniche
aumenti la spesa sanitaria*/

proc univariate data=health;
var totexp;
histogram totexp / odstitle="Distribution of Total medical expenses";
label totexp="Total medical expenses";
output out=out_pct pctlpre=P_ pctlpts= 0 to 100 by 1;
run;

/* vedi slide */

proc quantreg data=health ci=resampling;
model totexp = totchr / quantile = .25 .50 .75 plot=(quantplot fitplot);
run;

/* la regressione quantile, essendo non parametrica,
è robusta rispetto alle violazioni dell'assunto di normalità dei residui e omoschedasticità;
MAD: si può usare quando abbiamo una distribuzione asimmetrica 
perchè non è influenzata dalla media;
*/

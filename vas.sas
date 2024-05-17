proc import datafile="Y:/My Drive/Biostatistica/Dataset-20230928/VAS.xlsx"
out=vas dbms=xlsx replace;
run;

proc sgplot data=vas;
vbox vas / category=treat;
/* scatter x = treat y= vas; */
run;

proc means data=vas;
var vas;
class treat;
run;

proc ttest data=vas;
var vas;
class treat;
run;

/* non ho evidenze per affermare che l'ipotesi nulla sia falsa (vedi t student e Pr > t) */

proc ttest data=vas h0=-0.75;
var vas;
class treat;
run;

/* è uno studio inconclusivo in quanto non riesco a definire l'ipotesi rispetto all'altra */

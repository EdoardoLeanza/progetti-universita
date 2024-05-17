PROC IMPORT FILE= "Y:/My Drive/Biostatistica/Dataset/KI67.XLSX"
OUT=KI67  DBMS=XLSX REPLACE;
RUN;

proc print data=KI67; run;

data ki671;
set ki67;
ki67d=ki67/10;
run;

data nuovipaz;
input pcr ki67;
cards;
. 10
. 20
;
run;

data ki67nuovo;
set ki67 nuovipaz;
run;

proc logistic data=ki671 plots=effect;
model pcr(event="1")=ki67;
output out=predetti p=probpred;
run;

/* incremento basso, 1=chi ha avuto evento 0=chi non; bassa associazione;
 ogni 10 anni il rischio aumenta di  */

proc print data=predetti;
where pcr=.;
run;

/*  */
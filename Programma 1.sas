proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\wcgs.xls" 
out=wcgs dbms=xls replace;
run;

data wcgs1;
set wcgs;
/* trasformo peso e altezza da libbre e pollici
in kg e cm */
peso= weight*0.453592;
altezza=height*2.54;
imc=peso/(altezza/100)**2;
eta=int((DATA_ENT - DOB)/365.25);
if imc < 18.5 then climc="1. sottopeso";
else if imc < 25 then climc="2. normopeso";
else if imc < 30 then climc="3. sovrappeso";
else climc="4. obeso";
run;

proc freq data=wcgs1;
tables climc;
run;

proc univariate data=wcgs1;
	var imc eta;
	histogram imc eta;
	id id;
run;

proc means data=wcgs n mean median stddev;
	var ncigs;
	class chd;
run;

proc freq data=wcgs;
tables behatype / nocum;
run;

proc sgplot data=wcgs;
histogram ncigs / group=chd transparency=0.5;
density ncigs / type=kernel group=chd;
	/*where chd=2;*/
run;

proc sgplot data=wcgs;
vbox ncigs/ category=chd;
run;

proc sgplot data=wcgs1;
scatter x=altezza y=peso / transparency=0.5 group=chd;
run;

proc corr data=wcgs1;
	var altezza peso;
run;



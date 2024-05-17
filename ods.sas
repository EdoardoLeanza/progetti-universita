/* creazione di un nuovo dataset nella proc */

proc freq data=sashelp.cars;
	weight invoice;
	tables cylinders * make;
run;

ods trace on;
proc freq data=sashelp.cars;
	weight invoice;
	tables cylinders * make;
run;
ods trace off;

ods trace on;
proc freq data=sashelp.cars;
	weight invoice;
	tables cylinders * make;
	ods output Freq.Table1.CrossTabFreqs=risultato;
run;
ods trace off;

proc print data=risultato;run;
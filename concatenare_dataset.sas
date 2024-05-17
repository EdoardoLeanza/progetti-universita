/* Stesso insieme di variabili */
data autoe;
	set sashelp.cars;
	if origin='Europe';
run;

data autoa;
	set sashelp.cars;
	if origin='Asia';
run;

data totale;
	set autoa autoe;
run;
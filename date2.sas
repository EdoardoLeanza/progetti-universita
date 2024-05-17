data altezze;
	infile "Y:\My Drive\dati\altezze.csv" firstobs=2 dlm=',' dsd;
	input Nome $:20. Cognome $:20. Data :ddmmyy10. Altezza Peso;
run;

proc print data=altezze;
	format data ddmmyy10.;
run;


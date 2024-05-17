/* dati presi da acque.csv e province.csv, voglio avere una tabella con provincia e la regione
in cui si trova */
proc print data=acque;run;

proc print data=province;run;

data province;
	set province;
	rename sigla = prov;
run;

proc sort data=acque;	/*proc sort: serve per ordinare */
	by prov;
run;

proc sort data=province;
	by prov;
run;

data complessivo;
	merge province acque;
	by prov;
run;
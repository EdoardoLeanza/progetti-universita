data nuovo_dataset;
	set pg1.storm_summary;
	where MaxWindMPH^=. and MinPressure^=.;
run;

proc print data=nuovo_dataset;
run;


proc print data=sashelp.class;
run;

data nuova_classe;
	set sashelp.class;
	where age >= 15;
	*keep name age height; /* in un data step, keep prende solo le variabili che mi interessano */
	*drop sex weight; /* in un data step, drop elimina le variabili che mi interessa visualizzare */
	/* per cambiare il modo in cui i miei dati si mostrano nell'output: */
	format height 4.1 weight 3.;
run;


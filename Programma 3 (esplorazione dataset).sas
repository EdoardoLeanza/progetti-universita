/* mostra il dataset */
proc print data=pg1.storm_summary (obs=10);	/* mostra solo le prime 10 osservazioni */
	var Season Name Basin MaxWindMPH MinPressure StartDate EndDate; /* mostra solo le variabili che scelgo qui */
run;

/* calcola delle statistiche descrittive sommarie*/
proc means data=pg1.storm_summary;
	var MaxWindMPH MinPressure; /* solo variabili numeriche/quantititive */
run;

/* calcola delle statistiche descrittive più specifiche e alcune inferenziali*/
proc univariate data=pg1.storm_summary;
	var MaxWindMPH MinPressure; /* solo variabili numeriche/quantititive */
run;

/* calcola le frequenze*/
proc freq data=pg1.storm_summary;
	table Basin Type Season; 
run;

/* introduzione su come estrarre informazioni da un dataset SAS */

proc print data=sashelp.cars;
run;

/* prezzo medio (mean) sul mercato di msrp? */

proc means data=sashelp.cars mean min max std n nmiss;
								/* proc means: vengono calcolate alcune statistiche
								di default;
								N: numero osservazioni con valori NON mancanti;
								mean: fai solo la media (di default SAS lo fa solo delle variabili
								numeriche);
								*/
	var msrp invoice cylinders;
run;
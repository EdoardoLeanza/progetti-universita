proc print data=sashelp.cars;
	var make model msrp; 		/* var: come keep ma nel proc */
	title "Elenco auto";
	where make="Honda" or cylinders >= 10;		/* where: come if ma nel proc */
	format msrp comma12.;		/* format: formatta la variabile scelta SOLO per MOSTRARLA 
							senza simboli, non la formatta realmente;
							comma12. : usa la virgola come separatore delle migliaia
							nei numeri lunghi 12 cifre */
run;
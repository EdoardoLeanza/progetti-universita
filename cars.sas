libname corso "C:\Users\EL882380\Desktop\prova";

data corso.auto;
	set sashelp.cars;	/* set: creao l'origine dei dati*/
	/* keep make model;	*/	/* tieni solo la variabile make e model */
		/* tieni tutto il resto tranne la variabile make e model */
						/* keep e drop sono esclusive: NON posso averle contemporaneamente nel mio codice*/
	/* if invoice > 50000 and origin = 'Europe';	*/
	/* if cylinders = . then output;*/	/* . indica un elemento mancante */
	differenza = msrp - invoice;
	/* if cylinders ne . then output;*/	/* ne: indica tutti gli elementi che NON hanno un valore mancante */
	/* if differenza> 4000 then output; */
	
	
run;
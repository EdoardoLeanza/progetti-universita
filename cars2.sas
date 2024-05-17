libname corso "C:\Users\EL882380\Desktop\prova";

data corso.auto;
	set sashelp.cars;
/*	minimo = min(msrp, invoice);	/* min: valore minimo tra msrp e invoice 
	massimo = max(msrp, invoice);	/* max: valore massimo tra msrp e invoice 
	media = mean(msrp, invoice);	/* mean: media tra i due valori di msrp e invoice 
	rapporto = msrp/cylinders;		*/
	lunghezza = length(make);
s = substr(make, 2, 3);						/* substr: estrae una sottostringa da una una stringa;
											in questo caso: estrai dalla variabile stringa make
											prendi la sottostringa in posizione 2 e lunga 3 */
i = index(make, "a");			/* index: prende una stringa, un carattere e dice la prima 
								posizione dove si trova nella stringa scelta*/
	keep make model lunghezza s i;
	
run;


proc contents data=work.permessi;
run;

data t;
	set permessi;
	mese = month(completato);
	anno = year(completato);
	giorno = day(completato);
	keep completato giorno mese anno;
run;




libname corso "C:\Users\EL882380\Desktop";

data corso.ford2;
	infile "Y:\My Drive\dati\ford_escort.csv"
	firstobs = 2 dlm=',' dsd;	/* firstobs = 2 vuol dire: leggi i dati numerici solo dalla prima riga */
								/* dlm vuol dire: carattere delimitatore ; se scrivo dlm scrivo anche dsd*/
	input Year Mileage Price;
run;
	
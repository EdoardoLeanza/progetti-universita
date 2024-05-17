/* Leggere i dati in ingresso e memorizzarli in un dataset SAS permanente. */

libname a "C:\Users\EL882380\Desktop\prova";

data a.dati;
	infile "Y:\My Drive\dati\dati.txt" firstobs=2 dlm=',' dsd;
	input mpg cylinders displacement horsepower weight acceleration model_year 
	origin $ name $:50. ;
run;
proc print data=a.dati;run;

/* Tenendo conto che 1 miglio = 1.60935 km e 1 gallone = 4.4 litri, 
esprimere il consumo medio con litri necessari per percorrere 100 km. */

data a.dati;
	set a.dati;
	l100km = 100/(mpg * 1.60935 / 4.4) ;
run;
proc print data=a.dati;run;
/* Calcolare media, deviazione standard e skewness della variabile POTENZA stratificata per ANNO.  */

proc means data=a.dati mean std skewness;
	var horsepower;
	class model_year;
run;

/*  Costruire una tabella a 2 entrate i cui assi rappresentino l’origine del costruttore e l’anno di 
introduzione del modello, e il dato in ogni cella del dataset 
deve essere il numero di modelli introdotti nell’anno da un costruttore con determinata origine. 
Nella tabella devono essere presenti le varie ripartizioni percentuali.
Ad esempio nella cella con etichetta (72,2) si troverà il numero di modelli introdotti nel 1972 da 
costruttori europei, 
inoltre nella tabella si deve avere la percentuale di modelli introdotti nel 1972. */

proc freq data=a.dati;
	tables origin * model_year;
	/* numero di modelli introdotti nell’anno da un costruttore con determinata origine = 
	NO WEIGHT*/
run;

libname gara 'Y:\My Drive\dati';
proc contents data=gara.gareauto;run;

proc means data=gara.gareauto nmiss;
var bonus_gara punti_gara punti_totali_gara;
run;

/* Per ogni pilota, calcolare i punti totali (intesi come somma di punti e bonus) ottenuti.*/

proc means data=gara.gareauto sum;
	var punti_totali_gara;
	class id;
run;

/*Per ogni pilota calcolare il numero medio (e deviazione standard) di punti totali ottenuti 
per ogni gara a cui ha partecipato.*/

proc means data=gara.gareauto mean stddev;
	var punti_totali_gara;
	class id;
run;

/*Come il punto precedente, ma solo relativamente alle gare completate.*/

proc means data=gara.gareauto mean std;
	var punti_totali_gara;
	class id;
	where status_gara = 'Running';
run;
/*Per ogni pilota calcolare la somma totale di premi vinti, di giri percorsi 
e di punti base ottenuti.*/

proc means data=gara.gareauto sum;
	var premio_gara giri_gara punti_gara;
	class id;
run;

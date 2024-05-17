/* Leggere i dati del file in ingresso e memorizzarli in un dataset SAS permanente, 
tenendo conto che valori negativi di SA e RA corrispondono a dati mancanti.*/
libname a "C:\Users\EL882380\Desktop\prova";

data a.giappone;
	infile "Y:\My Drive\dati\japan.csv" firstobs=2 dlm='09'x dsd;
	input station_cod date :yymmdd10. time_utc :hhmmss8. sa ra;
	if sa <0 then sa = .;
	if ra <0 then ra = .;
run;

proc means data=a.giappone mean min max n nmiss;run;
/*Calcolare media, massimo e deviazione standard della variabile RA stratificata per STATION_COD.*/
proc means data=a.giappone mean max std;
	var ra;
	class station_cod;
run;

/*Determinare come le precipitazioni rilevate (RA) siano distribuite 
rispetto ai vari giorni di rilevazione.*/
proc freq data=a.giappone;
	weight ra;
	tables date;
	format date DDMMYY8.;
run;

/*Creare un nuovo dataset temporaneo contenente solo le osservazioni relative a radiazioni (SA) non mancanti.*/
data nonmiss;
	set a.giappone;
	if sa ne .;		/* ne: Not Equal, ovvero "diverso" */
run;
/* Calcolare le precipitazioni medie rilevate in ogni giorno/stazione, 
emettendo il risultato in un nuovo dataset. 
Il nuovo dataset dovrebbe quindi avere variabili GIORNO, STAZIONE, RA_MEDIA.*/
proc means data=a.giappone mean nway;
	var ra;
	class date station_cod;
	output out=ram mean=ra_media;
run;

proc print data=ram;run;
/*In quale stazione è stato rilevato il minimo valore di RA_MEDIA nel punto precedente?*/
proc means data=ram min;
	var ra_media;
	id station_cod;
	output out=dovemin minid=dove;
run;
proc print data=dovemin;
	var dove;
run;
/*Per ogni stazione determinare la media della variabile SA relativamente alle osservazioni 
con data fino al 11/3/2011.*/
proc means data=a.giappone mean nway;
	var sa;
	class station_cod;
	where date <= '11Mar2011'd;
	output out=samedia mean = sa_media;
run;

/*Aggiungere al dataset una variabile INCREMENTO_SA ottenuta come 
differenza fra SA e la media di SA ottenuta al punto precedente. 
La variabile INCREMENTO_SA deve avere valore mancante in tutte le osservazioni fino al 11/3/2011.*/
proc sort data=samedia;
	by station_cod;
run;
proc sort data=a.giappone;
	by station_cod;
run;
data a.giappone;
	merge samedia a.giappone;
	by station_cod;
	INCREMENTO_SA = sa - sa_media;
	/*if date <= '11Mar2011'd then INCREMENTO_SA = .;*/
run;
/* Leggere i dati del file StationLocations.csv e memorizzarli in un dataset SAS permanente. 
Notare che in questo file le stazioni hanno una variabile STATION_ID che 
è un numero progressivo che inizia con 1.*/
libname a "C:\Users\EL882380\Desktop\prova";

data a.stazioni;
	infile "Y:\My Drive\dati\StationLocations.csv" firstobs=2 dlm=';' dsd;
	input Station_ID Station_COD Site_ID Site_Name_EN $:50.Prefecture_ID 
	Prefecture_Name_EN $:50. Station_Name_EN $:50. Station_Name2_EN $:50. Latitude Longitude;
run;
proc means data=a.stazioni mean min max n nmiss;run;
/*Nel dataset ottenuto al punto precedente aggiungere una variabile DISTANZA_Q che 
contiene il quadrato della distanza dal punto con latitudine 37.422972 e longitudine 141.032917, 
ottenuta applicando la formula (80**2)*(latitudine - 37.422972)**2 + (111**2)*(longitudine - 141.032917)**2 */
data a.stazioni;
	set a.stazioni;
	DISTANZA_Q = (80**2)*(latitude - 37.422972)**2 + (111**2)*(longitude - 141.032917)**2;
	drop latitudine longitudine;
run;

/*Per ogni sito (SITE_ID), determinare il numero di stazioni presenti.*/
proc freq data=a.stazioni;
	table site_id;
run;

/*Fondere i due dataset contenenti i due file di dati grezzi letti, 
sfruttando la condivisione della variabile STATION_COD.*/

proc sort data=a.stazioni;
	by station_cod;
run;
proc sort data=a.giappone;
	by station_cod;
run;
data finale;
	merge a.stazioni a.giappone;
run;

proc print data=finale;run;
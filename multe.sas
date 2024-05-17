/* Leggere i dati del file multe.csv in un dataset permanente. 
Se non specificato, ogni operazione deve essere eseguita su tale dataset. 
Ogni osservazione corrisponde ad una multa comminata. Le variabili sono presenti nel file. */
proc means data=a.multe mean max min n nmiss;run;
/*Controllare se sono presenti valori mancanti.*/

/*Creare una nuova variabile ANNO ottenuta a partire dalla variabile ISSUE_DATA.*/

data a.multe;
	set a.multe;
	anno = year('Issue Date 1'n);
run;
/*Costruire un nuovo dataset permanente che contiene le osservazioni dove RP STATE PLATE è diverso da CA.*/
data a.ridotto;
	set a.multe;
	if 'RP State Plate'n ne 'CA';
run;
/*Calcolare media, minimo e deviazione standard di FINE AMOUNT stratificato per RP STATE PLATE.*/
proc means data=a.multe mean min std;
	var 'Fine Amount'n;
	class 'RP State Plate'n;
	output out=multestato mean = multa_media;
run;
/*Individuare quale RP STATE PLATE ha avuto il valore medio di FINE AMOUNT (calcolato al punto precedente) 
più basso.*/
proc means data=multestato min;
	var multa_media;
	id 'RP State Plate'n;
	output out=multebasse minid=stato;
run;
proc print data=multebasse;
	var stato;
run;
/*Indicare, sia in valore assoluto che in percentuale, come il numero di multe sia 
ripartito fra i vari tipi di infrazione (VIOLATION DESCRIPTION).*/
proc freq data=a.multe;
	tables 'VIOLATION DESCRIPTION'n;
run;
/*Emettere i risultati del punto precedente in un nuovo dataset temporaneo.*/
ods trace on;
proc freq data=a.multe;
	tables 'VIOLATION DESCRIPTION'n;
run;
ods trace off;

ods trace on;
proc freq data=a.multe;
	tables 'VIOLATION DESCRIPTION'n;
	ods output Freq.Table1.OneWayFreqs=nuovo;
run;
ods trace off;
/* Leggere i dati del file codici.csv in un dataset temporaneo.*/

/*Fondere i dataset al punto precedente con quello originale, sfruttando il campo AGENCY.*/
proc sort data=a.multe;
	by agency;
run;

proc sort data=work.codici;
	by agency;
run;

data fusione;
	merge a.multe work.codici;
	by agency;
run;

proc print data=fusione;run;
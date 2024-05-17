libname a "Y:\My Drive";

data dieta;
	infile "Y:\My Drive\dati\dieta.csv" dlm=',' dsd;
	input CODICE NOME $:40. SQUADRA $:40. PESOINIZ PESOFIN ETA SESSO $;
run;

proc means data=dieta n nmiss min max mean;run;

/* Media e deviazione standard del peso alla fine della cura, stratificato per squadra.*/

proc means data=dieta mean stddev nway;	/* nway: rimuove la riga nulla che SAS crea automaticamente */
	var PESOFIN;
	class squadra;
/*Creare un dataset contenente media e deviazione standard rispetto alle squadre, come ottenuto al punto 1.*/
	output out=medie mean=media stddev=deviazione_standard;
run;

proc print data=medie;run;

/*Modificare il dataset in modo da avere per ogni persona il peso perso,
sia in assoluto che in percentuale sul peso iniziale*/

data dieta;
	set dieta;
	pesoperso = pesoiniz - pesofin;
	persoperc = pesoperso / pesoiniz * 100;
	obiettivo = 0;
	if persoperc >= 7 then obiettivo = 1;
	no_obiettivo = 1 - obiettivo;
run;

proc print data=dieta;run;

/*Il numero di persone che hanno perso almeno il 7% del peso stratificato per sesso
(queste persone hanno ottenuto l’obiettivo minimo).*/

proc means data=dieta sum;
	var obiettivo;
	class sesso;
run;

/*
MA ANCHE:
proc means data=dieta n;
	var obiettivo;
	where persoperc >=7;
	class sesso;
run;
*/
/*Per ogni squadra la percentuale di pazienti che hanno raggiunto l’obiettivo minimo.
Si stampi l’elenco delle squadre in ordine decrescente di percentuale.*/

proc means data=dieta sum nway;
	var obiettivo;
	class squadra;
	output out=ob sum=quanti;
run;

data ob;
	set ob;
	percentuale = quanti / _FREQ_ *100;
run;

proc print data=ob;run;



proc means data=dieta n nway;
	var codice;
	class squadra;
	where persoperc >=7;
	output out=obiettivo_squadra n=numero_ok;
run;

/*
MA ANCHE:
proc sort data=obiettivo_squadra;
	by squadra;
run;

proc sort data=dimensione_squadra;
	by squadra;
run;

data completo;
	merge obiettivo_squadra dimensione_squadra;
	by squadra;
	percentuale = numero_ok / numero * 100;
run;
proc print data=completo;run;
*/

/*Costruire un dataset contenente il numero di persone per squadra che non hanno
raggiunto l’obiettivo (le squadre che hanno solo persone che hanno raggiunto l’obiettivo possono essere omesse)
*/

proc means data=dieta sum nway;
	var no_obiettivo;
	class squadra;
	output out=no sum=numero_abbandoni;
run;
proc print data=no;run;




/* PARTE EXTRA

Quale squadra ha avuto il numero massimo di persone che non hanno raggiunto l'obiettivo?

proc means data=no max;
	var numero_abbandoni;
	id squadra;
	output out=finale maxid=quale;
run;
*/
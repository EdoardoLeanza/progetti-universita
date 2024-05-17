/* 
Creare un dataset permanente per tali dati */
libname a "Y:\My Drive";

data a.regioni;
	infile "Y:\My Drive\dati\regioni.csv" firstobs=2 dlm=',' dsd;
	input Regione $:40. Popolazione Superficie;
run;
proc print data=a.regioni; run;
/*Dividere i dati in 3 dataset per regioni con meno di 10000 kmq,
con oltre 20000 kmq e le rimanenti
*/
data piccole;
	set a.regioni;
	if Superficie <= 10000;
run;

data grandi;
	set a.regioni;
	if Superficie >= 20000;
run;

data medie;
	set a.regioni;
	if Superficie > 10000 and Superficie < 20000;
run;
/*Calcolare la densità di ogni regione */
data a.regioni;
	set a.regioni;
	densita = popolazione / superficie;
run;
/*Esportare uno dei dataset in un file di testo con dati separati da ;
*/

data _NULL_;	*/ data _NULL_: serve solo per esportare i dati evitando di creare un datastep solo per
				questo */
	set a.medie;
	file "Y:\My Drive\dati\esportato.txt" dlm=';';
	put Regione $:40. Popolazione Superficie;
run;

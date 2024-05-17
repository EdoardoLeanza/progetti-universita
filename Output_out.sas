proc means data=sashelp.cars mean nmiss nway;
	/*nway:elimina la prima riga vuota riepilogativa del proc print */
	var msrp;
	class make;
	output out=work.riassunto mean=media; 
	/*output out=NomeDatasetCheVoglioCreare NomeStatistica=NomeDellaVariabileDelNuovoDataset
	:creazione di un nuovo dataset per fare nuove operazioni */
run;

proc print data=work.riassunto;run;

/*Qual è il produttore (make) con valore di media più basso (minimo)?*/

proc means data=riassunto min;
	id make;
	var media;
	output out=economico minid=produttore min=minimo;	/*Salvo nel dataset "economico" la statistica minid*/
run;

proc print data=economico;
	var produttore minimo;
run;
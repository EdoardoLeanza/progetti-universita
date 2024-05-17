/* Analisi delle frequenze (su dati qualitativi)*/
proc freq data=sashelp.cars;
	tables make * cylinders;	/* *: separa le variabili   (con 2 variabili si crea una tabella a doppia 
								entrata)*/
	/* ma come si distribuiscono le mie variabili? */
	weight invoice;	/* come la mia variabile invoice è distribuita rispetto alle variabili make e cylinders*/
run;
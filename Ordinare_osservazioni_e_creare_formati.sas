/* come ordinare le osservazioni di un data set */
/*
data cars;
	set sashelp.cars;
run;
*/
proc sort data=work.cars;
	by cylinders invoice;		/* by msrp: ordine crescente di msrp;
								by descending msrp: ordine decrescente di msrp  
								
								ATTENZIONE!
								by ordina prima rispetto al numero di cilindri e poi
								limitatamente a quelli che hanno lo stesso numero di cilindri 
								ordina per valori crescenti di invoice
								Nell'output vedi che quelli con 4 cilindri ordina poi 
								in modo crescente invoice
								*/
run;

proc print data=work.cars;
run;


/* come creare un nuovo formato */

data cars;
	set sashelp.cars;
	dimensione = 0;
	if enginesize >2 then dimensione = 1;
run; 


proc print data=work.cars;
run;

proc format;
	value dimauto 0 = "piccolo"
				  1 = "grande";
run;

proc print data=work.cars;
format dimensione dimauto.;		/* . perchè enginesize ha . come delimitatore tra interi
								e decimali */
run;













/* come estrarre informazioni da un dataset SAS su classi
	Es.: calcolare le statistiche NON sull'intero dataset ma 
	separatamente per ogni produttore*/

proc means data=sashelp.cars mean nmiss;
	var msrp invoice cylinders; /* var x y z: x y z DEVONO essere numeriche;
								class x: x senza restrizioni
								*/
	class make; /* class x: x = qualitativa*/
run;

proc print data=sashelp.cars;
run;

proc means data=sashelp.cars mean min max std n nmiss ;
	var msrp invoice cylinders;
	class make;	/* class: stratifica le medie cercate per una variabile */
run;



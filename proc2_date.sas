proc print data=sashelp.citiday;
	var date;
	format date ddmmyy10.; /* e i vari formati delle date che abbiamo visto */
run;
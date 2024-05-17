/* OUTPUT OUT, MAXID, MINID */

proc means data=sashelp.cars mean nmiss nway;
	var msrp;
	class make;
	output out=work.riassunto mean=media;	/* emette un nuovo dataset */
run;

proc print data=work.riassunto;
run;

proc means data=work.riassunto min;
	id make;
	var media;
	output out=economico minid=produttore min=minimo;
run;

proc print data=economico;
	var produttore minimo;
run;
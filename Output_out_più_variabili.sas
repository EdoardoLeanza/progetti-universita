proc means data=sashelp.cars min max std nway;
	var msrp invoice;
	class make;
	output out=riassunto mean(msrp invoice)=media1 media2;
run;

proc print data=riassunto; run;

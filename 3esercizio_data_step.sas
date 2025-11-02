%let Category=Mammal;
*%let Category=Bird;

data &Category;
	set pg1.np_species;
	where Category="&Category";
	drop Abundance Seasonality Conservation_Status;
run;

proc freq data=&Category;
	table Record_Status;
run;

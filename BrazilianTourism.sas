libname corso "C:\Users\EL882380\Desktop\prova";

data corso.braziliantourism;
	infile "Y:\My Drive\dati\braziltourism.csv" firstobs=2 dlm=',' dsd;
	input Age Sex Income Cost Access Active Passive Income Trips;
run;
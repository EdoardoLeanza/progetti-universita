libname corso "C:\Users\EL882380\Desktop";

data faithful;
	infile "Y:\My Drive\dati\faithful.csv" firstobs = 2 dlm=',' dsd obs=273;
	input Index Lenght Wait;	/* obs=273 vuol dire: leggi le prime 273 righe e scarta il resto */
run;
	
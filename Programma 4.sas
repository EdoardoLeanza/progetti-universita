data diamonds;
	infile "Y:\My Drive\dati\diamonds.csv" firstobs=2 dlm=',' dsd;
	input carat cut $:99. color $ clarity $ depth table price x y z;
	/* cut $:99. vuol dire: leggi la variabile alfanumerica cut che ha al massimo 99 caratteri*/
run;
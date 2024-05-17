/* i nomi delle librerie e di tutte le varie cose in SAS deve avere al max 8 caratteri, altrimenti non lo legge */
libname corso "C:\Users\EL882380\Desktop\prova";

data corso.nile;
	infile "Y:/My Drive/dati/nile.txt" firstobs=2;
	input year flood;
run;


data corso.letters;
	infile "Y:/My Drive/dati/letter_frequency.txt" firstobs=3;
	input Letter $ Frequency Percentage;	/* $ : indica un valore alfanumerico (di default è messo valore numerico)*/
run;

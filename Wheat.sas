libname compito "C:\Users\EL882380\Desktop\prova";

data compito.wheat;
	infile "Y:\My Drive\dati\wheat.txt" firstobs = 2  obs= 9 missover;
	input A B C d1-d15;
run;

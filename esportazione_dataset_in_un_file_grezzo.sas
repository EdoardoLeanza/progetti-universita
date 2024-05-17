libname corso "C:\Users\EL882380\Desktop\prova";

data _NULL_;
	set sashelp.cars;
	file "C:\Users\EL882380\Desktop\esportato.csv" dlm=',' dsd;
	put make $:30. model :$99. invoice;
	
	/* l'esportazione avviene con due istruzioni: put e file;
	put: l'elenco delle variabili che voglio esportare esplicitando anche i loro formati
	file: metto il nome del file esterno che verrà creato (uguale ad infile ma dico dove 
	verrà salvato)
	*/
run;
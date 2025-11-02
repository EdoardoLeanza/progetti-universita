/* sort modifica come viene visualizzato l'output, secondo un ordine specifico
nodupkey: no duplicati nelle colonne
*/
proc sort data=pg1.class_test2 nodupkey;
	by /*descending*/ Subject TestScore;
	/* by _ALL_; */		/* rimuove i duplicati nelle righe */
run;

proc sort data=pg1.class_test3 out=test_clean nodupkey dupout=test_dups;
	by _ALL_;
run;

proc sort data=pg1.class_test3 out=test_clean nodupkey dupout=test_dups;
	by Name;
run;

proc sort data=pg1.np_largeparks out=park_clean dupout=park_dups nodupkey;
    by _all_;
run;
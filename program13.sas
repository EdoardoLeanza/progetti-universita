data results.output13;
  set cert.input13;
  Chdate=put(date1,date9.);
  num1=input(Charnum,dollar7.);
run;

proc print data=results.output13;
run;

proc means data=results.output13;
	var num1;
run;

*oppure: ;

proc print data=cert.input13;
run;

data results.output13;
    set cert.input13;

    /* Converte date1 (valore numerico SAS) in stringa ddmonyyyy */
    Chdate = put(date1, date9.);

    /* Converte Charnum in numero rimuovendo $ e virgole */
    num1 = input(compress(Charnum, '$,'), 8.);
run;

proc means data=results.output13 mean;
	var num1;
run;

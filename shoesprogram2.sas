data shoes;
    set sashelp.shoes;
    NetSales=Sales-Returns;
run;

proc print data=shoes;
run;

proc means data=shoes; /* solo sulle variabili quantitative del dataset */
run;

proc univariate data=shoes; /* solo sulle variabili quantitative del dataset */
run;

proc freq data=shoes; /* sia variabili quantitative che qualitative del dataset */
run;

data results.output27a;
    set cert.input27;
    /* Keep only records where country is "US", case-insensitive */
    if upcase(country) = "US";
run;

proc sort data=results.output27a;
    by state descending Postal_Code employee_ID;
run;

proc sort data=cert.input27 out=results.output27b nodupkey;
    by descending Postal_Code;
run;

proc print data=results.output27b (firstobs=98 obs=181);
  var employee_ID;
run;

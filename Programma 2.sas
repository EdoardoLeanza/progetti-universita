proc contents data="/home/u63815003/EPG1V2/data/storm_summary.sas7bdat";
run;

/* usando le librerie diventa: */
libname mylib base "/home/u63815003/EPG1V2/data/storm_summary.sas7bdat";

proc contents data=mylib;
run;

libname mylib clear;

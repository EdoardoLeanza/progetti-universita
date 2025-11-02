proc import datafile="/home/u63815003/ECRBM6/data/payroll.csv" dbms=csv out=payroll replace;
	guessingrows=max;
run;

proc contents data=payroll;
run;

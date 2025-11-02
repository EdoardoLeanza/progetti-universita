/*
How many rows are in the singlestate table?
Total rows: 367

In the multistate table, in which two states does the Hovenweep NM value appear for ParkName?
CO and UT
*/
proc sort data=pg2.np_acres out=acres_sorted;
	by Region ParkName;
run;

data singlestate multistate;
	set acres_sorted;
	by Region ParkName;
	keep Region ParkName State GrossAcres;
	if First.ParkName=1 and Last.ParkName=1 
        then output singlestate;
    else output multistate;
    format GrossAcres comma15.;
run;

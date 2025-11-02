/*
How many rows and columns are in the profitsummary table?
The profitsummary table has 395 rows and 9 columns.

How many rows and columns are in the profitsummary table?
The profitsummary table has 80 rows and 3 columns.
*/
proc sort data=sashelp.shoes out=shoes_sorted;
	by Region Product;
run;

data profitsummary;
	set shoes_sorted;
	by Region Product;
	Profit=Sales-Returns;
	if First.Product then TotalProfit=0;
	TotalProfit+Profit;
	if Last.Product=1;
	keep Region Product TotalProfit;
	format TotalProfit dollar12.;
run;



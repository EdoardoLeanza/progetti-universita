data work.qtr_sales_id;
	set cr.qtr_sales;
	ID=put(Customer_ID, z5.);
	CustID=input(ID, z5.);
run;

proc means data=work.qtr_sales_id stddev;
	var CustID;
run;

data cr.tourism_2008;
	set cr.tourism(keep=_2008);
	if _2008 = ".." then _2008_num = .;
	else _2008_num = input(_2008, 20.);
run;

proc means data=cr.tourism_2008 median;
	var _2008_num;
run;


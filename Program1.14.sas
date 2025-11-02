proc freq data=cr.profit;
	format Order_Date monname.;
    tables Order_Date*Order_Source /*/ nocol norow*/;
run;

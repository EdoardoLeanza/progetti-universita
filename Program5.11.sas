data donation(keep=EmpID Name Department TotalDonation);
    merge cr.employee(in=in_emp) 
          cr.employee_donations(in=in_don);
    by EmpID;
    if in_don=1 and in_emp=1;
    TotalDonation=sum(of Qtr1-Qtr4);
run;


proc sort data=cr.profit out=work.profit;
	by Product_Id;
run;
proc sort data=cr.products out=work.products;
	by Product_Id;
run;

data work.profit_detail work.products_noSales;
	merge work.profit(in=fromF) 
         work.products (in=fromD);
	by Product_ID;
	
	if fromF = 1 and fromD = 1 then output work.profit_detail;
	else if fromF = 0 and fromD = 1 
		then output work.products_noSales;
run;

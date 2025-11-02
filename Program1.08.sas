proc sort data=cr.employee_raw out=emp_sort noduprecs;
	by _all_;
run;

proc print data=emp_sort;
	where JobTitle like "%Logistics%";
	format BirthDate HireDate TermDate date10.;
run;

proc means data=emp_sort;
	where HireDate>="01Jan2010"d and TermDate is missing;
run;

proc univariate data=emp_sort;
	var salary;
run;

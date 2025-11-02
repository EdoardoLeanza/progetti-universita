proc means data=cr.employee ;
	var Salary;
	class Department City;
	output out=salary_summary sum=TotalSalary mean=AvgSalary;
	ways 2;
run;

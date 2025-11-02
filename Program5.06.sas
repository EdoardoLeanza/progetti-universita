proc sort data=cr.employee out=employee_sorted;
	where Department = "Administration";
	by Salary;
run;

data work.dept_salary;
	set employee_sorted;
	TotalDeptSalary+Salary;
	format TotalDeptSalary dollar12.;
run;


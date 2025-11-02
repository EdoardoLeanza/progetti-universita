proc sort data=cr.employee out=work.emp_sort;
	  by department Salary;
run;

data dept_salary;
    set emp_sort;
    by Department;
    if first.Department then do;
        TotalDeptSalary=0;       
    end;
    TotalDeptSalary+Salary;
    if last.department then do;
        HighSalaryJob=JobTitle;
        output;
    end;
    keep Department TotalDeptSalary HighSalaryJob;
    format TotalDeptSalary dollar12.;
run;

/* Note: PROC MEANS can get max Salary because it is a summary statistic. It cannot get information from specific rows of the data 

proc means data=cr.employee;
	class department;
	var Salary;
run;
*/

proc sort data=cr.orders out=work.orders;
	by delivery_date;
run;

data orders_accumulated;
	set orders;
	by delivery_date;
	Profit = retail_price - cost_price * quantity;
	
	retain Daily_Profit Accumulated_Profit 0;
	
	if first.delivery_date = 1 then daily_profit=0;
	
	daily_profit = sum(daily_profit, profit);
	accumulated_profit = sum(accumulated_profit, profit);
	
	if last.delivery_date = 1 then output;
	
	keep delivery_date daily_profit accumulated_profit; 
	format daily_profit accumulated_profit comma20.2;
run;
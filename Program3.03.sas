proc means data=cr.employee_current noprint;
    var Salary;
    class Department;
    output out=salary sum=TotalSalary;
    ways 1;
run;

data salaryforecast;
    set salary;
    format TotalSalary dollar12.;
    do Year=1 to 3;
    	TotalSalary=TotalSalary*1.03;
    	output;
    end;
run;

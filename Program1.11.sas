data bonus;
	set cr.employee;
	where TermDate is missing;
	YearsEmp=yrdif(HireDate, "01JAN2019"d, "age");
    if YearsEmp >= 10 then do;
        Bonus=Salary*.03;
        Vacation=20;
    end;
    else do;
        Bonus=Salary*.02;
        Vacation=15;
    end;
run;

proc freq data=bonus;
    tables Vacation;
run;

proc sort data=bonus;
    by descending YearsEmp;
run;	
proc means data=cr.employee sum mean min max maxdec=0;	
    where Department="Sales";
    var Salary;
    class JobTitle;
    ways 0 1;
run;

/* Prima richiesta */
proc transpose data=sashelp.shoes 
    out=shoes_sales(drop=_label_);
    var Sales;
    by Region Subsidiary;
    id Product;
    where Subsidiary ^= 'Copenhagen';
run;	
proc means data=work.shoes_sales median;
	var Boot;
run;

/* Seconda richiesta */
proc sort data=cr.employee_training out=training_sort;
	by Name;
run;

proc transpose data=training_sort 
               out=training_narrow(rename=(col1=Date)) 	
    name=Course;
    by Name;
    var Compliance_Training Corporate_Security;
run;

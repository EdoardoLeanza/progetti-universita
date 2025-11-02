proc sort data=cr.employee_training out=training_sort;
    by Name;
run;

/* Either PROC TRANSPOSE or the DATA step will create training_narrow */

proc transpose data=training_sort out=training_narrow(rename=(col1=Date)) name=Course;
    by Name;
    var Compliance_Training Corporate_Security On_the_Job_Safety;
run;

/* OR */

data training_narrow;
    set training_sort;
    Course="Compliance Training";
    Date=Compliance_Training;
    output;
    Course="Corporate_Security";
    Date=Corporate_Security;
    output;
    Course="On_the_Job_Safety";
    Date=On_the_Job_Safety;
    output;
    drop Compliance_Training Corporate_Security On_the_Job_Safety;
    format Date date9.;
run;
	
proc freq data=training_narrow;
    tables Date;
    format Date monname.;
run;

data work.country_info;
	set cr.country_info;
	length continent_name $ 6;
	if continent=5 then continent_name="Asia";
	else if continent=3 then continent_name="Europe";
	else continent_name="Other";
run;

data work.emp_don;
	set cr.employee_donations;
	length Type $ 10;
	if (Qtr1-4) ne . then Type="Recurring";
	else Type="Occasional";
run;

proc means data=work.emp_don mean;
	where Type="Occasional";
	var Qtr2;
run;

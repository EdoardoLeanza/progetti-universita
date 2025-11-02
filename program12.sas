data results.output12;
	set cert.input12;
	do until(salary>=500000);
		salary=salary+(salary*0.0565);
		year+1;
		output;
	end;
	format salary dollar12.;
run;

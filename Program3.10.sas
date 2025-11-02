proc format;
	value bmirange low-<18.5="Underweight"
			18.5-24.9="Normal"
			25-29.9="Overweight"
			30-high="Obese";
run;

proc freq data=sashelp.bmimen;
	where age>=21;
	table bmi;
	format bmi BMIRANGE.;
run;


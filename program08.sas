proc sort data=cert.input08a out=input08a_sorted;
	by id;
run;

proc sort data=cert.input08b out=input08b_sorted;
	by id;
run;

data results.match08;
	merge input08a_sorted input08b_sorted;
	by id;
run;

data results.nomatch08;
	merge input08a_sorted(in=a) input08b_sorted(in=b);
	by id;
	drop="ex%";
run;
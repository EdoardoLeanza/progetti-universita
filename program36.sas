data cleandata36;
	set cert.input36;
	group=upcase(group);
	if group in ("A", "B");
run;

/*proc sort data=cleandata36;
	by group;
run;*/

proc means data=cleandata36 mean median;
	class group;
	var kilograms;
run;

data results.output36;
  set cleandata36;
  if Kilograms < 40 or Kilograms > 200 then do;
    if group='A' then kilograms=79;
    else kilograms=89;
  end;
run;

proc contents data=results.output36;
run;

proc means data=results.output36 mean;
  class group;
  var kilograms;
run;


data work.future_expenses_annual;
	Wages=12874000;
	Medical=649000;
	do year=1 to 10;
		do qtr=1 to 4;
			Medical = Medical * (1 + .095/4);
			Wages = Wages * (1 + .06/4);
		output;
		end;
	end;
	drop Qtr;    
    format Wages Medical comma20.;
run;


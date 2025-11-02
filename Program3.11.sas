data continentfmt;
    set cr.continent_codes;
    retain fmtname "contfmt";
    Start=Code;
    Label=Continent;
run;

proc format cntlin=continentfmt;
run;

proc means data=sashelp.demographics sum;
	var pop;
	class Cont;
	format cont contfmt.;
run;

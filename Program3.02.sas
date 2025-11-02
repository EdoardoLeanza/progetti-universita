data dead(drop=Status) alive(drop=DeathCause AgeAtDeath Status);
	set sashelp.heart;
	if Status="Dead" then output dead;
	else output alive;
run;

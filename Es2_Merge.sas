/*
How many rows are in the parkStats table?
4416
How many rows are in the parkOther table?
347
*/

proc sort data=pg2.np_codelookup out=work.SortedCodes;
	by ParkCode;
run;

proc sort data=pg2.np_2016 out=work.Sorted2016;
	by ParkCode;
run;

data work.parkStats(keep=ParkCode ParkName Year Month DayVisits) work.parkOther(keep=ParkCode ParkName);
	merge work.SortedCodes work.Sorted2016(in=inStats);
	by ParkCode;
	if inStats=1 then output work.parkStats;
    else output work.parkOther;
run;

proc means data=pg1.np_westweather;
	where Precip^=0;
	var Precip;
	class Name Year;
	ways 2;
	output out=rainstats n=RainDays sum=TotalRain;
run;

title "Rain Statistics by Year and Park";
proc print data=rainstats label noobs;
	var Name Year RainDays TotalRain;
	label Name="Park Name" RainDays="Number of Days Raining" TotalRain="Total Rain Amount (inches)";
run;

title;
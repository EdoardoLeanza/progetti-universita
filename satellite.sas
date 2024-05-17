data satelliti;
	infile "Y:\My Drive\dati\satellite.txt";
	input PRODOTTO $:40. NUMSATELLITE ALTITUDINE AZIMUTH MEDIO MINIMO MASSIMO;
run;

proc means data=satelliti mean;
	var altitudine azimuth;
	class numsatellite;
run;

proc means data=satelliti mean std skewness;
	var minimo;
run;

data satelliti;
	set satelliti;
	scarto = massimo - minimo;
run;

proc means data=satelliti mean nway;
	var scarto;
	class numsatellite;
	output out=scarti_medi mean=scarto_medio;
run;

proc sort data=scarti_medi;
	by scarto_medio;
run;

proc print data=scarti_medi;run;


proc means data=satelliti mean nway;
	var altitudine azimuth;
	class numsatellite;
	output out=punto2 mean(altitudine)=alt_media mean(azimuth)=azi_media;
run;

proc sort data=satelliti;
	by numsatellite;
run;

proc sort data=punto2;
	by numsatellite;
run;

data satelliti;
	merge satelliti punto2;
	by numsatellite;
	drop _TYPE_ _FREQ_;
run;

proc freq data=satelliti;
	weight scarto;
	tables prodotto;
run;

ods trace on;
proc freq data=satelliti;
	weight scarto;
	tables prodotto;
	ods output Freq.Table1.OneWayFreqs=tabella;
run;
ods trace off;

proc print data=tabella;run;
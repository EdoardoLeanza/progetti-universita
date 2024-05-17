libname a "C:\Users\EL882380\Desktop\prova";

data a.fema;
	infile "Y:\My Drive\dati\FEMA2.csv" firstobs=2 dlm=';' dsd;
	input id State $:30. County $:30. Applicant $:50. EducationChar $ NoProjects Type $:50. Amount Date :DDMMYY10.;
run;

data punto2;
	set a.fema;
	keep id state county;
run;

proc format;
	value $formato 'Yes'=1 'No'=0;
run;

proc print data=a.fema;
	where State='Texas';
	format date DDMMYY10.;
	format educationchar $formato.;
run;

proc means data=a.fema mean max min;
	var amount;
	class county;
	where year(date)=2008;
run;

data medio;
	set a.fema;
	StanziamentoMedio = amount / NoProjects;
	if state = 'Texas';
run;

proc means data=a.fema sum nway;
	var amount;
	class state;
	output out=totalefondi sum=fonditotali;
run;

proc print data=totalefondi;run;

proc means data=totalefondi max;
	var fonditotali;
	id state;
	output out=dove maxid=stato;
run;

proc print data=dove;
	var stato;
run;

proc freq data=a.fema;
	weight amount;
	tables state * educationchar;
run;

/* seconda parte */

data legenda;
	infile "Y:\My Drive\dati\FEMA2.txt" dlm=';' dsd;
	input valore type $:99.;
run;

/*fusione*/

proc sort data=a.fema;
	by type;
run;

proc sort data=legenda;
	by type;
run;

data completo;
	merge a.fema legenda;
	by type;
run;







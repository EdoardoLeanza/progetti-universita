libname a "C:\Users\EL882380\Desktop\prova";

data a.interventi;
	infile "Y:\My Drive\dati\FEMA2.csv" firstobs=2 dlm=';' dsd;
	input id State $:30. County $:30. Applicant $:999. EducationChar $ 
	NoProjects Type $:30. Amount Date yymmdd12.;
run;

proc print data=interventi;run;

data temp;
	set a.interventi;
	keep id state county;
run;

proc format;
	value $edu 'No'='0' 'Yes'='1';
run;

proc print data=a.interventi;
	format data ddmmyy10.;
	format educationchar $edu.;
	where state = 'Texas';
run;

proc means data=a.interventi mean max min;
var amount;
class county;
run;

proc means data=a.interventi mean max min;
var amount;
class county;
where year(data)  =2008;
run;

data nuovo;
    set a.interventi;
    if numeroprogetti > 0 then
        rapporto=importo/NumeroProgetti;
    if state eq 'Texas';
run;


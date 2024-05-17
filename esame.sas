libname a "C:\Users\EL882380\Desktop\prova";

data a.titanic;
	infile "C:\Users\EL882380\Downloads\titanic\titanic_data.csv" firstobs=2 dlm=',' dsd;
	input PassengerId Survived Pclass Name $:99. Sex $ Age SibSp Parch Ticket $:99. Fare Cabin $:99. Embarked $;
run;

proc means data=a.titanic mean max min nmiss n;run;

data a.titanic;
	set a.titanic;
	netfare = fare/2;
run;
proc print data=a.titanic;run;
proc contents data=a.titanic;run;
/*PUNTO 3*/

data pclass;
	set a.titanic;
	if pclass = 2;
run;

/*PUNTO 4*/
proc means data=a.titanic mean max std;
	var fare;
	class pclass;
	output out=tariffe mean=tariffemedie;
run;

proc means data=a.titanic max;
	var fare;
	id age;
	output out=tariffemedie maxid=massimo;
run;

/*PUNTO 5*/
proc means data=a.titanic max;
	var fare;
	id age;
	output out=tariffemedie maxid=massimo;
run;

proc print data=tariffemedie;
	var age;
run;

/*PUNTO 6*/

proc freq data=a.titanic;
	tables  fare * pclass;
run;

/*PUNTO 7*/

ods trace on;
proc freq data=a.titanic;
	tables  fare * pclass;
	ods output Freq.Table1.CrossTabFreqs=nuovo;
run;
ods trace off;

proc freq data=a.titanic;
	tables  fare * pclass;
	ods output Freq.Table1.CrossTabFreqs=nuovo;
run;

/*FUSIONE FINALE*/

proc sort data=a.titanic;
	by pclass;
run;
data classes;
	infile "C:\Users\EL882380\Downloads\titanic\titanic_classes.csv" firstobs=2 dlm=',' dsd;
	input Pclass Name $;
run;
proc print data=classes;run;
proc sort data=classes;
	by pclass;
run;

data fusione;
	merge a.titanic classes;
	by pclass;
run;
%let age=13;

title1 "Class report";
title2 "Age=&age";
footnote1 "School Use Only";

proc print data=pg1.class_birthdate;
	where age=&age;
run;

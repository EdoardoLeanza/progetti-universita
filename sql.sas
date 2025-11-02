proc sql ;
	select Name, Age , Height*2.54 as HightCM format=5.1, Birthdate format date9. from pg1.class_birthdate
	where Age>14
	order by Height desc;
quit;

data results.output04;
	set cert.input04;
	length var3 $ 5;
	var1=ceil(var1);
	var2=ceil(var2);
	var3=var1*var2;
	var20=sum(of var12-var19);
run;

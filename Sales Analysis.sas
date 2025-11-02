/* Accessing Data */

%let path=/home/u63815003/ECRBM6;

options validvarname=v7;
libname ctryxl xlsx "&path/country_lookup.xlsx";

proc import datafile="&path/orders.csv" out=orders dbms=csv replace;
run;

proc contents data=cr.orders;
run;

proc contents data=ctryxl.countries;
run;

proc contents data=ctryxl._all_ nods;
run;

/* Exploring Data */

/* Validate CountryLookup Excel Table*/
proc print data=ctryxl.countries(obs=30);
run;

proc freq data=ctryxl.countries order=freq;
	tables Country_Key Country_Name;
run;

proc print data=ctryxl.countries;
	where Country_Key in ("AG", "CF", "GB", "US");
run;

proc sort data=ctryxl.countries out=country_clean nodupkey dupout=dups;
	by country_key;
run;

/* Validate Imported Sorted Table */
title "Orders with Order Date after Delivery Date";
proc print data=cr.orders;
	where Order_date>Delivery_Date;
	var Order_ID Order_Date Delivery_Date;
run;

title "Examine Values of Numeric Columns in Orders";
proc freq data=cr.orders;
	tables Order_Type Customer_Country Customer_Continent;
run;

title "Examine Values of Categorical Columns in Orders";
proc univariate data=cr.orders;
	var Quantity Retail_Price Cost_Price;
run;
title;
/* Preparing Data */

data profit;
	set cr.orders;
	length Order_Source $ 8;
	where Delivery_Date>=Order_Date;
	Customer_Country=upcase(Customer_Country);
	if Quantity<0 then Quantity=.;
	Profit=(Retail_Price-Cost_Price)*Quantity;
	format Profit dollar12.2;
	ShipDays=Delivery_Date-Order_Date;
	Age_Range=substr(Customer_Age_Group, 1, 5);
	if Order_Type=1 then Order_Source="Retail";
	else if Order_Type=2 then Order_Source="Phone";
	else if Order_Type=3 then Order_Source="Internet";
	else Order_Source="Unknown";
	drop Retail_Price Cost_Price Customer_Age_Group Order_Type;
run;

proc sql;
	create table profit_country as 
	select profit.*, Country_Name from profit inner join country_clean
	on profit.Customer_Country=country_clean.Country_Key
	order by Order_Date desc;
quit;

/* Orders Frequency Analysis */
ods excel file="&path/output/Orders_Analysis.xlsx"
	options(embedded_titles="yes") style=analysis;

ods excel options(sheet_name="Orders by Month");
ods noproctitle;
title "Number of Orders by Month";
title2 "and Customer Continent/Order Source";
proc freq data=profit_country order=freq;
	tables Order_Date / nocum;
	format Order_Date monname.;
	tables Customer_Continent*Order_Source / norow nocol;
run;
title;

/* Ship Days Summary */

%let os=Retail;

title "Days to Ship by Country";
title2 "&os Orders";
proc means data=profit_country min max mean maxdec=0;
	var ShipDays;
	class Country_Name;
	where ShipDays>0 and Order_Source="&os";
run;
title;


proc sort data=profit_Country out=profit_sort;
	by Order_Source;
run;

title "Days to Ship by Country";
proc means data=profit_sort min max mean maxdec=0;
	var ShipDays;
	class Country_Name;
	where ShipDays>0;
	by Order_Source;
run;
title;

/* Profit Analysis by Customer Age */

proc means data=profit_sortcountry noprint;
	var Profit;
	class Age_Range;
	output out=profit_summary median=MedProfit sum=TotalProfit;
	ways 1;
run;

ods excel options(sheet_name="Profit by Age");
title "Profit by Customer Age Range";
proc print data=profit_summary noobs label;
	var Age_Range TotalProfit MedProfit;
	label Age_Range="Age Range" TotalProfit="Total Profit" MedProfit="Median Profit per Order";
	format TotalProfit MedProfit dollar10.;
run;
title;

ods excel close;
/* Exporting Data */

proc export data=profit_Country outfile="&path/output/orders_update.xlsx" dbms=xlsx replace;
run;

libname outxl xlsx "&path/output/orders_update.xlsx";

data outxl.orders_Update;
	set profit_country;
run;

data outxl.orders_Lookup;
	set country_clean;
run;

proc means data=profit noprint;
	var profit;
	class Age_Range;
	ways 1;
	output out=outxl.profit_summary;
run;

libname outxl clear;

/* Exporting PDF Results from Orders Exploration */

ods pdf file="&path/output/orders_validation.pdf" pdftoc=1;

ods proclabel "Orders with Order Date after Delivery Date";
title "Orders with Order Date after Delivery Date";
proc print data=cr.orders;
	where Order_date>Delivery_Date;
	var Order_ID Order_Date Delivery_Date;
run;

ods proclabel "Examine Values of Numeric Columns in Orders";
title "Examine Values of Numeric Columns in Orders";
proc freq data=cr.orders;
	tables Order_Type Customer_Country Customer_Continent;
run;

ods proclabel "Examine Values of Categorical Columns in Orders";
title "Examine Values of Categorical Columns in Orders";
proc univariate data=cr.orders;
	var Quantity Retail_Price Cost_Price;
run;
title;

ods pdf close;


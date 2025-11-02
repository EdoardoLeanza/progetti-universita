/* 
Write a DATA step that creates temporary SAS tables named camping and lodging and reads the pg2.np_2017 table.
Compute a new column, CampTotal, that is the sum of CampingOther, CampingTent, CampingRV, and CampingBackcountry.
Format CampTotal so that values are displayed with commas.
The camping table has the following specifications:
includes rows if CampTotal is greater than zero
contains the ParkName, Month, DayVisits, and CampTotal columns
The lodging table has the following specifications:
includes rows where LodgingOther is greater than zero
contains only the ParkName, Month, DayVisits, and LodgingOther columns
Submit the program and verify the output. The notes in the SAS log indicate how many rows are in each table.

How many rows are in the camping table?
1374 rows
How many rows are in the lodging table?
383 rows
*/

data camping(keep=ParkName Month DayVisits CampTotal) lodging(keep=ParkName Month DayVisits LodgingOther);
	set pg2.np_2017;
	CampTotal=sum(CampingOther, CampingTent, CampingRV, CampingBackcountry);
	if CampTotal>0 then output camping;
    if LodgingOther>0 then output lodging;
    format CampTotal comma15.;
run;
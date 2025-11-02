/*
Examine the pg2.np_2016camping table to determine the three unique values of the CampType column.
The three values of CampType are Tent, RV, and Backcountry.

How many rows are in the camping_wide table?
The camping_wide table has 126 rows.
*/

data camping_wide;
	set pg2.np_2016camping;
	by ParkName;
    keep ParkName Tent RV Backcountry;
    format Tent RV Backcountry comma12.;
    retain ParkName Tent RV Backcountry;
	if CampType="Tent" then Tent=CampCount;
    else if CampType="RV" then RV=CampCount;
    else if CampType="Backcountry" then Backcountry=CampCount;
	if last.ParkName;
run;
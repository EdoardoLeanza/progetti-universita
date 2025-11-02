/*
How many rows and columns are in the camping2016_t table?
The camping2016_t table has 126 rows and four columns.
*/
proc transpose data=pg2.np_2016camping out=work.camping2016_t(drop=_name_);
	by ParkName;
    id CampType;
    var CampCount;
run;

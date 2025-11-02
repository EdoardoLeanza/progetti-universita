/*
Use SAS Help or online documentation to read about using SELECT and WHEN statements in the DATA step.
Modify the program to use SELECT groups and WHEN statements.
Submit the program and examine the output data.

How many rows are in the park table?
246 rows
How many columns are in the monument table?
3 columns
*/

data monument(drop=ParkType) park(drop=ParkType) other;
    set pg2.np_yearlytraffic;
    select (ParkType);
        when("National Monument") output monument;
        when("National Park") output park;
        otherwise output other;
    end;
    drop Region;
run;


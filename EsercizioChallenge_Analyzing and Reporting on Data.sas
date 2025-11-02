proc means data=pg1.np_multiyr noprint;
	var Visitors;
	class Region Year;
	ways 2;
	output out=top3parks(drop=_freq_ _type_)
           sum=TotalVisitors /*sum total visitors*/
    	   idgroup(max(Visitors) /*find the max of visitors*/
    	   out[3] /*top 3*/
    	   (Visitors ParkName)=); /*output columns for top 3 parks*/ 

run;


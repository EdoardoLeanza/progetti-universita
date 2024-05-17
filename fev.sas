proc import file="Y:\My Drive\Biostatistica\Dataset-20230928\fev.xlsx" 
out=fev dbms=xlsx replace;
run;

proc print data=fev;
run;

PROC MEANS DATA=FEV N MEAN STD;
CLASS TRTGRP;
VAR FEV1;
RUN;

PROC TTEST DATA=FEV;
CLASS TRTGRP;
VAR FEV1;
RUN;

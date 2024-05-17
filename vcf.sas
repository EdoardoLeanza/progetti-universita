proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/VCF.xlsx"
out=vcf dbms=xlsx replace;
run;

proc sgplot data=vcf;
scatter x = glucose y=vcf;
run;

proc glm data=vcf;
model vcf=glucose;
run;

/* 0.022, clinicamente, vuol dire che ogni volta che aumenta il glucosio nel sangue aumenta di 0.022
 boh qualcos'altro */



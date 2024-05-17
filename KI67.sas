proc import file="Y:/My Drive/Biostatistica/Dataset/KI67.xlsx"
out=kl dbms=xlsx replace;
getnames=yes;
run;

proc print data=kl; run;

PROC TTEST DATA=kl;
VAR KI67; CLASS PCR;
RUN;

/* prob del 28%, bassa per dire l'associazione tra le due variabili*/
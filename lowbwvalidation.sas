proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/LOWBW.xlsx"
out=lowbw dbms=xlsx replace;
run;

proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/LOWBWVALIDATION.xlsx"
out=lowbwvalidation dbms=xlsx replace;
run;

proc print data=lowbwvalidation; run;

data trainingvalidation;
set lowbw(in=x) lowbwvalidation(in=y); /* x e y valori temporanei*/
if x=1 then dataset="Training  ";
if y=1 then dataset="Validation";
if dataset="Training" then weightt=weight;
if dataset="Validation" then weightt=.;
run;

proc glm data=trainingvalidation;
model weightt=chest arm;
output out=predetti p=peso_previsto;
run;

/* stime più precise ma R^2 diverso e predetti calcolati su tutti */

proc glm data=predetti;
where dataset="Validation";
model weight= peso_previsto;
run;

/* R^2 del vecchio modello: 0.75, quindi quello di prima era ottimistico */
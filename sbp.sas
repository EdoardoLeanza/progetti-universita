proc import file="Y:/My Drive/Biostatistica/Dataset-20230928/SBP.xlsx"
out=sbp dbms=xlsx replace;
run;

proc glm data=sbp;
model sbp=age;
run;

/* al crescere di un anno d'età mediamente la pressione cresce di 1,22
 (per 10 anni 12,2 "punti" di pressione);
 solo l'età sembra spiegare il 50% della variabilità
 della persona */

proc sgplot data=sbp;
reg x = age y=sbp;
xaxis values=(0 to 80 by 20);
/* yaxis values=(0 to 200 by 50); */
run;

proc g3d data=sbp;
scatter age*weight=sbp / shape="balloon";
run;

/* cerco l'equazione di un piano che interpola i punti osservati, che criterio uso?
 lo stesso per la retta: minimizzo le differenze al quadrato delle distanze dei piani */

proc glm data=sbp;
model sbp=age weight;
run;

/* l'effetto dell'età non cambia molto anche aggiungendo il peso (1.19);
ogni 10 chili la pressione aumenta di 2.73 "punti" di pressione */

proc glm data=sbp;
model sbp=age weight age*weight;
run;

/* 54% di iterazione sia con age*weight che senza: difficile interpretare un grafico tridimensionale;
quindi provo a proiettare in un grafico bidimensionale.
 */



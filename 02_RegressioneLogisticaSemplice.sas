***SLIDE 3***;
PROC IMPORT FILE= "Z:\Dropbox\Didattica\Data\KI67.XLSX"
OUT=KI67  DBMS=XLSX REPLACE;
RUN;
PROC TTEST DATA=KI67;
VAR KI67;
CLASS PCR;
RUN;

***SLIDE 9-10***;

PROC IMPORT FILE= "Y:/My Drive/Biostatistica/Dataset/CHD100.XLSX"
OUT=CHD  DBMS=XLSX REPLACE;
RUN;

proc print data=chd; run;

DATA CHD1;
SET CHD;
IF AGE<30 THEN CLETA=25; /* CLETA= classe d'età */
ELSE IF AGE<35 THEN CLETA=32.5;
ELSE IF AGE<40 THEN CLETA=37.5;
ELSE IF AGE<45 THEN CLETA=42.5;
ELSE IF AGE<50 THEN CLETA=47.5;
ELSE IF AGE<55 THEN CLETA=52.5;
ELSE IF AGE<60 THEN CLETA=57.5;
ELSE CLETA=65;
RUN;

/* ho ridotto i dati */

PROC FREQ DATA=CHD1;
TABLES CLETA*CHD / NOCOL nopercent out=rischi outpct;
RUN;

/* voglio vedere le % di riga e vedo che all'aumentare dell'età aumenta la 
prob di avere 1 (vedi slide cosa voglia dire) */

data rischi1;
set rischi;
if chd=1;
PROB= pct_row/100;
keep prob cleta chd pct_row; 
run;

/* creo rischi1 per avere un dataset con le info che mi servono */

proc sgplot data=rischi1;
reg x=cleta y=prob;
yaxis values = (0 to 1 by 0.2);
run;

PROC GLM DATA=RISCHI1;
WHERE CHD=1;
MODEL prob=CLETA / SOLUTION;
QUIT;

/* all'aumentare dell'età il rischio aumenta di 0.0202223593 */

***SLIDE 18***;
DATA ODDS;
SET RISCHI(WHERE=(CHD=1));
PROB=PCT_ROW/100;
ODDS=PROB/(1-PROB);
LNODDS=LOG(ODDS);
RUN;

/*  */

PROC GLM DATA=ODDS;
MODEL LNODDS=CLETA / SOLUTION;
QUIT;

/* all'aumentare dell'età il log dell'odds aumenta di 0.01 circa */

***SLIDE 21***;
PROC LOGISTIC DATA=CHD1;
MODEL CHD(EVENT="1")=CLETA;
RUN;

/* il log dell'odds aumenta di di 0.1 (stime di massima verosimiglianza)*/

***SLIDE 26***;
PROC LOGISTIC DATA=CHD1 PLOTS=EFFECT;
MODEL CHD(EVENT="1")=CLETA;
output out=predetti p=pred;
RUN;

/* come si distrbuisce la variabile sulla x al variare dell'età;
 predetti= dataset in cui ho i valori previsti per ogni soggetto 
 in cui la prob arriva ad un max del 85%;
 */

***SLIDE 31-33***;

PROC IMPORT FILE= "Y:/My Drive/Biostatistica/Dataset/ADGI.XLSX"
OUT=ADGI  DBMS=XLSX REPLACE;
RUN;

proc print data=adgi; run;

DATA ADGI1;
SET ADGI;
IF GRP=2 THEN GRP=0;
RUN;

PROC LOGISTIC DATA=ADGI1 PLOTS=EFFECT;
MODEL GI(EVENT="1")=GRP;
RUN;

/* stimo la prob di evento nel gruppo non trattato e nel gruppo trattato;
 -0.85 è di quanto diminuisce il log dell'odds passando da 0 a 1;
 ipotesi nulla: le due proporzioni sono uguali, quind c'è un'evidenza per rifiutare l'ipotesi nulla*/

PROC FORMAT;
VALUE GRP 1="NUOVO ANTIBIOTICO" 2="ERITROMICINA" ;
VALUE GI 1="AE GI" 0="NO AE GI";
RUN;

/*  */

PROC FREQ DATA=ADGI;
TABLES GRP*GI / NOCOL NOPERCENT CHISQ;
FORMAT GI GI. GRP GRP.;
RUN;

/*  */

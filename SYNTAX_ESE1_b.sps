GET
  FILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14_completo.sav'.
DATASET NAME InsiemeDati1 WINDOW=FRONT.

GET
  FILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_stranie_2013_14.sav'.
DATASET NAME InsiemeDati2 WINDOW=FRONT.
SORT CASES BY v1 (A).

///ordino per codice////


DATASET ACTIVATE InsiemeDati1.
SORT CASES BY v1_link (A).

///Seeleziono solo le province////


SELECT IF (Categoria = 1).
EXECUTE.
SORT CASES BY v1_link (A).




////unisco i due files, partendo dagli stranieri///

DATASET ACTIVATE InsiemeDati2.

MATCH FILES /FILE=*
  /TABLE='InsiemeDati1'
  /RENAME (v31 v30 v32 v22 v21 v23 v25 v24 v26 v28 v27 v29 v16 v15 v17 v19 v18 
v20 v10 v9 v11 v7 v6 v4 v3 v5 v40 v39 v41 v37 v36 v38 v2 v34 v33 v35 v13 v12 v14 v43 
v42 v44 = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 
d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41) v8=n v1_link=v1
  /BY v1
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41.
EXECUTE.
SAVE OUTFILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/Effettistrutturali.sav' 
  /COMPRESSED.
EXECUTE.


////Calcolo Pop media stranieri ////

COMPUTE pm_str=((V5 + V44)/2).
EXECUTE. 


////Calcolo Pop media SOLI ITALIANI////

COMPUTE pm_ita = pm - pm_str.
EXECUTE.

////Calolo nati SOLO ITA////

COMPUTE n_ita = n - V8.
EXECUTE.


///CAlcolo Incidenza stranieri per ogni provincia////

COMPUTE inc_str = pm_str / pm.
EXECUTE.

///Calcolo incidenza media nazionale degli stranieri////

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=
  /pm_str_sum=SUM(pm_str).

COMPUTE incmed_str = pm_str_sum / pm_sum.
EXECUTE.

/// Costruisco una variabile Gruppo che identifica
 le prov. con inc bassa (0  se <media naz) (1 se >= media naz)////

IF (inc_str >= incmed_str) Gruppo = 1.
IF (inc_str < incmed_str) Gruppo = 0.
EXECUTE.


////Calcolo tn italiani e stranieir per Gruppo/////

DATASET DECLARE fff. 
AGGREGATE 
  /OUTFILE='fff' 
  /BREAK=Gruppo 
  /V8_sum=SUM(V8) 
  /pm_str_sum=SUM(pm_str) 
  /n_ita_sum=SUM(n_ita) 
  /pm_ita_sum=SUM(pm_ita). 
DATASET ACTIVATE fff. 
COMPUTE tnita=n_ita_sum / pm_ita_sum*1000. 
EXECUTE. 
COMPUTE tnstr=V8_sum / pm_str_sum*1000. 
EXECUTE.















///ATTENZIONE!!! IL FILE MA_poptot contiene già i codici quindi partire dal punto 4 dopo aver caricato il file///// 


////////// 1 CARICAMENTO DEI FILES ///////////////


GET 
  FILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14.sav'.
DATASET NAME InsiemeDati1 WINDOW=FRONT. 
GET 
  FILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/Codici.sav'. 
DATASET NAME InsiemeDati2 WINDOW=FRONT. 
DATASET ACTIVATE InsiemeDati1. 
 
//////2 ORDINA I FILES PER LO STESSO CODICE /////////

SORT CASES BY V11 (A).  
DATASET ACTIVATE InsiemeDati1. 
SORT CASES BY v1 (A).  


/////// 3 UNISCE I FILES CON I CODICI E SALVA IL FILE UNITO////////////

MATCH FILES /FILE=* 
  /TABLE='InsiemeDati2' 
  /RENAME (v2 v3 V7 V8 V12 V13 V14 V9 v4 V15 = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9) V5=V5_bis V6=V6_bis V10=V10_bis v1=v1_bis 
  /BY V1_link 
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9. 
EXECUTE.  
DATASET ACTIVATE InsiemeDati1. 
SAVE OUTFILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14.sav' 
 /COMPRESSED.  

////////// 4 CALCOLA I TOTALI per REGIONE E AGGIUNGE I CASI  AL FILE/////////////////////

DATASET DECLARE ggg. 
AGGREGATE 
  /OUTFILE='ggg' 
  /BREAK=V6_bis V10_bis 
  /v3_sum=SUM(v3) 
  /v4_sum=SUM(v4) 
  /v5_sum=SUM(v5) 
  /v6_sum=SUM(v6) 
  /v7_sum=SUM(v7) 
  /v8_sum=SUM(v8) 
  /v9_sum=SUM(v9) 
  /v10_sum=SUM(v10) 
  /v11_sum=SUM(v11) 
  /v12_sum=SUM(v12) 
  /v13_sum=SUM(v13) 
  /v14_sum=SUM(v14) 
  /v15_sum=SUM(v15) 
  /v16_sum=SUM(v16) 
  /v17_sum=SUM(v17) 
  /v18_sum=SUM(v18) 
  /v19_sum=SUM(v19) 
  /v20_sum=SUM(v20) 
  /v21_sum=SUM(v21) 
  /v22_sum=SUM(v22) 
  /v23_sum=SUM(v23) 
  /v24_sum=SUM(v24) 
  /v25_sum=SUM(v25) 
  /v26_sum=SUM(v26) 
  /v27_sum=SUM(v27) 
  /v28_sum=SUM(v28) 
  /v29_sum=SUM(v29) 
  /v30_sum=SUM(v30) 
  /v31_sum=SUM(v31) 
  /v32_sum=SUM(v32) 
  /v33_sum=SUM(v33) 
  /v34_sum=SUM(v34) 
  /v35_sum=SUM(v35) 
  /v36_sum=SUM(v36) 
  /v37_sum=SUM(v37) 
  /v38_sum=SUM(v38) 
  /v39_sum=SUM(v39) 
  /v40_sum=SUM(v40) 
  /v41_sum=SUM(v41) 
  /v42_sum=SUM(v42) 
  /v43_sum=SUM(v43) 
  /v44_sum=SUM(v44) 
  /v45_sum=SUM(v45) 
  /v46_sum=SUM(v46) 
  /v47_sum=SUM(v47) 
  /v48_sum=SUM(v48) 
  /v49_sum=SUM(v49) 
  /v50_sum=SUM(v50).  
DATASET ACTIVATE ggg.  

RENAME VARIABLES ( 
v3_sum 
v4_sum 
v5_sum 
v6_sum 
v7_sum 
v8_sum 
v9_sum 
v10_sum 
v11_sum 
v12_sum 
v13_sum 
v14_sum 
v15_sum 
v16_sum 
v17_sum 
v18_sum 
v19_sum 
v20_sum 
v21_sum 
v22_sum 
v23_sum 
v24_sum 
v25_sum 
v26_sum 
v27_sum 
v28_sum 
v29_sum 
v30_sum 
v31_sum 
v32_sum 
v33_sum 
v34_sum 
v35_sum 
v36_sum 
v37_sum 
v38_sum 
v39_sum 
v40_sum 
v41_sum 
v42_sum 
v43_sum 
v44_sum 
v45_sum 
v46_sum 
v47_sum 
v48_sum 
v49_sum 
v50_sum = 
v3 
v4 
v5 
v6 
v7 
v8 
v9 
v10 
v11 
v12 
v13 
v14 
v15 
v16 
v17 
v18 
v19 
v20 
v21 
v22 
v23 
v24 
v25 
v26 
v27 
v28 
v29 
v30 
v31 
v32 
v33 
v34 
v35 
v36 
v37 
v38 
v39 
v40 
v41 
v42 
v43 
v44 
v45 
v46 
v47 
v48 
v49 
v50).  
 
DATASET ACTIVATE InsiemeDati1. 
ADD FILES /FILE=* 
  /RENAME (filter_$=d0) 
  /FILE='hhh' 
  /DROP=d0. 
EXECUTE.  


SAVE OUTFILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14_completo.sav'
  /COMPRESSED.
  



///////CALCOLA I TOTALI DELLE RIPARTIZIONI E  AGGIUNGE I CASI AL FILE////////////

GET
  FILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14.sav'.
DATASET NAME InsiemeDati1 WINDOW=FRONT.


DATASET DECLARE hhh. 
AGGREGATE 
  /OUTFILE='hhh' 
  /BREAK=v1_bis V5_bis 
  /v3_sum=SUM(v3) 
  /v4_sum=SUM(v4) 
  /v5_sum=SUM(v5) 
  /v6_sum=SUM(v6) 
  /v7_sum=SUM(v7) 
  /v8_sum=SUM(v8) 
  /v9_sum=SUM(v9) 
  /v10_sum=SUM(v10) 
  /v11_sum=SUM(v11) 
  /v12_sum=SUM(v12) 
  /v13_sum=SUM(v13) 
  /v14_sum=SUM(v14) 
  /v15_sum=SUM(v15) 
  /v16_sum=SUM(v16) 
  /v17_sum=SUM(v17) 
  /v18_sum=SUM(v18) 
  /v19_sum=SUM(v19) 
  /v20_sum=SUM(v20) 
  /v21_sum=SUM(v21) 
  /v22_sum=SUM(v22) 
  /v23_sum=SUM(v23) 
  /v24_sum=SUM(v24) 
  /v25_sum=SUM(v25) 
  /v26_sum=SUM(v26) 
  /v27_sum=SUM(v27) 
  /v28_sum=SUM(v28) 
  /v29_sum=SUM(v29) 
  /v30_sum=SUM(v30) 
  /v31_sum=SUM(v31) 
  /v32_sum=SUM(v32) 
  /v33_sum=SUM(v33) 
  /v34_sum=SUM(v34) 
  /v35_sum=SUM(v35) 
  /v36_sum=SUM(v36) 
  /v37_sum=SUM(v37) 
  /v38_sum=SUM(v38) 
  /v39_sum=SUM(v39) 
  /v40_sum=SUM(v40) 
  /v41_sum=SUM(v41) 
  /v42_sum=SUM(v42) 
  /v43_sum=SUM(v43) 
  /v44_sum=SUM(v44) 
  /v45_sum=SUM(v45) 
  /v46_sum=SUM(v46) 
  /v47_sum=SUM(v47) 
  /v48_sum=SUM(v48) 
  /v49_sum=SUM(v49) 
  /v50_sum=SUM(v50).  
DATASET ACTIVATE hhh. 
RENAME VARIABLES ( 
v3_sum 
v4_sum 
v5_sum 
v6_sum 
v7_sum 
v8_sum 
v9_sum 
v10_sum 
v11_sum 
v12_sum 
v13_sum 
v14_sum 
v15_sum 
v16_sum 
v17_sum 
v18_sum 
v19_sum 
v20_sum 
v21_sum 
v22_sum 
v23_sum 
v24_sum 
v25_sum 
v26_sum 
v27_sum 
v28_sum 
v29_sum 
v30_sum 
v31_sum 
v32_sum 
v33_sum 
v34_sum 
v35_sum 
v36_sum 
v37_sum 
v38_sum 
v39_sum 
v40_sum 
v41_sum 
v42_sum 
v43_sum 
v44_sum 
v45_sum 
v46_sum 
v47_sum 
v48_sum 
v49_sum 
v50_sum = 
v3 
v4 
v5 
v6 
v7 
v8 
v9 
v10 
v11 
v12 
v13 
v14 
v15 
v16 
v17 
v18 
v19 
v20 
v21 
v22 
v23 
v24 
v25 
v26 
v27 
v28 
v29 
v30 
v31 
v32 
v33 
v34 
v35 
v36 
v37 
v38 
v39 
v40 
v41 
v42 
v43 
v44 
v45 
v46 
v47 
v48 
v49 
v50).  


 
GET 
  FILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14_completo.sav'. 
DATASET NAME Dataset3 WINDOW=FRONT. 
ADD FILES /FILE=* 
  /FILE='hhh'. 
EXECUTE.


SAVE OUTFILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14_completo.sav' 
  /COMPRESSED.  


//////////CREA UNA VARIABILE CHE DISTINGUE I TRE GRUPPI (province, regioni, ripartizioni)////////////

////Verificare che le variabili V6_bs, V1_link e v1_bis siano numeriche, in caso contrario cambiare formato ///


IF  (v1_link  > 0) categoria=1.
EXECUTE.
IF  (missing (v1_link) and V6_bis >0) categoria=2.
EXECUTE.
IF  (missing (v1_link) and missing(V6_bis) and v1_bis >0) categoria=3.
EXECUTE.


SAVE OUTFILE='/Users/rimoldi/Desktop/PTS1_2015_2016\Ese1\MA_poptot_2013_14_completo.sav' 
 /COMPRESSED. 

/////////////CALCOLA IL TASSO DI NATALITA ///////////////////

COMPUTE tn=1000* v8 / ((v5 + v47)/2).
EXECUTE.


////////////CALCOLA MEDIA TASSI NATALITA PER CATEGORIE  Per calcolare media e varianza 
per ciascuna categoria, tuttavia, devo considerare  il tasso ponderato, 
dove I pesi sono la proporzione di popolazione (media) dell’area
 sulla popolazione (media) complessiva./////////////

COMPUTE pm=(v5 + v47)/2.
EXECUTE. 
    
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=
  /pm_sum=SUM(pm).
  
///Attenzione La popolazone somma vale per tre (categorie)///

COMPUTE tn_pon=tn * pm/(pm_sum/3).
EXECUTE.

///per ottenere la media basta fare le somme per categoria///

OLAP CUBES tn_pon BY categoria
  /CELLS=SUM
  /TITLE='Cubi OLAP'.

////Aggiungo il valore della media al file; aggiungo anche il numero delle osservazioni per categoria////

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=categoria
  /tn_MED=SUM(tn_pon).


//////////CALCOLA VARIANZA PONDERATA TN PER CATEGORIA Per il calcolo della varianza 
procedo al calcolo degli scostamenti dei valori del tasso dalla media e pondero/////////////

 
COMPUTE tn_sca=(tn - tn_MED)**2 *(pm / (pm_sum/3)).


OLAP CUBES tn_sca BY categoria
  /CELLS=SUM
  /TITLE='Cubi OLAP'.
  
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES OVERWRITEVARS=YES
  /BREAK=categoria
  /tn_sca_sum=SUM(tn_sca).


SAVE OUTFILE='/Users/rimoldi/Desktop/PTS1_2015_2016/Ese1/MA_poptot_2013_14_completo.sav'
 /COMPRESSED.




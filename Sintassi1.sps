* Encoding: UTF-8.

*** Lotg-linear additive model ****

* Encoding: UTF-8.
weight by count.
GENLOG orig dest
/MODEL=POISSON
/print estim.0

***************** verifica indipendenza ****
   
    
weight off.
GENLIN count BY orig dest 
  /MODEL orig dest 
 DISTRIBUTION=POISSON 
 LINK=LOG.


********* stima parametri quasi indipendenza ********

*Create the binary variable (wt) that will force zeros on the diagonal.
COMPUTE wt=0.
IF (orig ~= dest)wt=1.
WEIGHT BY count.
*Estimate the model and save the predicted values in variable pcount.
GENLOG orig dest
/CSTRUCTURE=wt
/MODEL=POISSON
/PRINT=NONE
/PLOT=NONE
/CRITERIA=CIN(95) ITERATE(20) CONVERGE(0.001) DELTA(.5)
/DESIGN dest orig
/SAVE=PRED(pcount).


***** stime parametri indipendenza****
        
    WEIGHT BY count.
*Estimate the model and save the predicted values in variable pcount.
GENLOG orig dest
/MODEL=POISSON
/PRINT=NONE
/PLOT=NONE
/CRITERIA=CIN(95) ITERATE(20) CONVERGE(0.001) DELTA(.5)
/DESIGN dest orig
/SAVE=PRED(p1count).

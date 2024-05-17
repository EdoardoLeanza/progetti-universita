# -*- coding: utf-8 -*-
# il commento sopra serve per le lettere accentate,
# per favore non modificate queste prime righe

##########################################################
# INTRODUZIONE
##########################################################
# Dovete implementare uno script che analizza il contenuto di alcuni
# file di dati. Dovrete in particolare implementare alcune funzioni.
# Leggete qua sotto la descrizione del file con i dati.
# Troverete successivamente le istruzioni sul lavoro da
# svolgere nei commenti prima della funzioni.
#
# Buon lavoro

##########################################################
# DESCRIZIONE DEL FILE CON I DATI
##########################################################
# Nel file .zip troverete i seguenti file:
#
# - episodi.txt contiene i dati degli episodi criminosi commessi da alcune
#   gang (i dati sono inventati). Il file contiene valori separati da ;
#   La prima riga contiene l'intestazione delle colonne.
#   Un esempio del contenuto del file e':
#   CoordinateX;CoordinateY;Banda;NVolte\n
#   ...\n
#   Il \n rappresenta il carattere di "a capo". Fate attenzione al
#   numero di righe vuote presenti tra l'intestazione delle colonne e
#   i dati.
#   Una riga del file contiene dati su episodi criminosi commessi da
#   una banda criminale.
#   CoordinateX e CoordinateY rappresentano le coordinate (espresse in
#   km) su un piano cartesiano xy del punto in cui sono avvenuti
#   gli episodi criminosi.
#   Banda rappresenta il nome della banda criminale che ha compiuto
#   i crimini.
#   NVolte rappresenta il numero di volte che in tale coordinate la banda
#   ha compiuto un episodio criminoso.
#   SUGGERIMENTO: NON aprite il file con il notepad di windows.
#
# - citta.txt contiene i dati delle coordinate geografiche (nello stesso
#   piano cartesiano xy di cui sopra) del punto centrale di alcune citta.
#   Un esempio del contenuto del file e':
#   Citta;CoordinateX;CoordinateY\n
#   ...\n
#   Fate attenzione al numero di righe vuote presenti tra
#   l'intestazione delle colonne e i dati.

##########################################################
# DESCRIZIONE DEL LAVORO DA SVOLGERE
##########################################################
# Implementate le seguenti funzioni (ogni riferimento a nomi, fatti
# e citta' e' puramente casuale).
# Il commento che precede ogni funzione vi spieghera' cosa fare.
# Per favore NON USATE le istruzioni input() o raw_input()
# nel codice che scriverete.
#
# - calcolaBaricentri(fileName1). La funzione accetta come unico parametro in
#   ingresso il nome del file con i dati degli episodi criminosi avvenuti.
#   Nota bene: il nome del file da aprire deve essere passato alla funzione
#   come parametro. La funzione restituisce un dizionario formato da coppie
#   chiave valore, come nell'esempio seguente: {'SOPRANO':(45,8),
#   'CORLEONE':(30,4), 'TATTAGLIA':(20,18) }.
#   La chiave e' una stringa con il nome della banda
#   (i nomi devono essere ricavati sulla base del contenuto del file), il
#   valore associato alla chiave e' una tupla contenente rispettivamente
#   le coordinate (x,y) nel piano cartesiano del baricentro degli episodi
#   commessi da ogni singola banda. I valori delle coordinate x ed y del
#   baricentro sono le medie pesate rispettivamente delle ascisse (x) e
#   delle ordinate (y) dei punti cui sono avvenuti gli episodi criminosi.
#   Il peso e' dato dal valore di NVolte (vedi descrizione del file dei dati).
#   Le coordinate dei baricentri devono essere espressi in valori interi,
#   eliminando l'eventuale parte decimale. Il dizionario restituito
#   dalla funzione dovra' contenere una coppia chiave valore per ognuna
#   delle bande i cui dati sono riportati nel file in ingresso. Ricordatevi
#   di chiudere il file prima di restituire il risultato.

def calcolaBaricentri(filename1):
    pass


# - cittaVicine(fileName2, dizbar). La funzione accetta come parametro
#   in ingresso rispettivamente il nome del file con le informazioni
#   sulle coordinate di alcune citta' (rispetto al piano cartesiano xy)
#   e il dizionario dei baricentri restituito dalla funzione precedente.
#   Dato che il baricentro associato ai crimini di una banda e' spesso
#   vicino o coincidente con il covo della banda, la polizia e' interessata
#   a conoscere, per ogni banda, qual e' la citta'  piu' vicina al baricentro
#   dei crimini commessi dalla banda.
#   Per ogni banda presente nel dizionario dizbar, dovete individuare la citta'
#   piu' vicina al baricentro della banda.
#   Potete leggere le coordinate delle citta' da associare nel file il cui nome
#   e' passato nel parametro formale fileName2.
#   La funzione deve restituire al programma chiamante un dizionario fatto
#   come nell'esempio seguente: {'SOPRANO':'MILANO', 'CORLEONESI':'PAVIA', ...},
#   dove la chiave e' data dal nome della banda e il valore associato e' il nome
#   della citta' piu' vicina al baricentro della banda. Il dizionario restituito
#   deve contenere tante coppie chiave valore quante sono le bande presenti nel
#   parametro dizbar passato in ingresso alla funzione. Per calcolare il quadrato
#   della distanza tra due punti di coordinate (x1,y1) e (x2,y2) usate la distanza euclidea
#   ... (x2-x1)**2+(sy2-y1)**2 ... Se un baricentro fosse equidistante da due citta',
#   scegliete una città tra le due con il criterio che preferite.
#   Se vi facesse comodo potete implementare funzioni aggiuntive qua sotto.

def cittaVicine(fileName2, dizbar):
    


##########################################################
# Fine della parte da editare obbligatoriamente
# Inizio del corpo principale del programma. Potete
# modificare o lasciare invariato il codice qua sotto
# (a vostra scelta), se lo modificate, accertatevi
# che il codice non dia errori in esecuzione.
##########################################################


print('Eseguo la funzione calcolaBaricentri')
fn1 = 'episodi.txt'
dib = calcolaBaricentri(fn1)
print('Risultato prima funzione: ')
print(dib)
fn2 = 'citta.txt'
print('Eseguo la funzione cittaVicine')
res = cittaVicine(fn2, dib)
print('Risultato seconda funzione: ')
print(res)

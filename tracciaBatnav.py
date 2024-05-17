# -*- coding: utf-8 -*-
# il commento sopra serve per le lettere accentate,
# per favore non modificate queste prime righe

nomeEsercizio = 'Battaglia Navale'

##########################################################
# INTRODUZIONE
##########################################################
#
# L'associazione "amici della battaglia navale in solitario" vuole
# poter analizzare i dati delle partite.
# PRECISAZIONE: a differenza del gioco classico della "battaglia navale"
# nella battaglia navale in solitario ogni giocatore gioca da solo e
# deve riuscire ad individuare tutte le navi della flotta avversaria
# nel minor tempo possibile.
# L'associazione vuole assegnare un punteggio ad ogni partita svolta,
# per poter valutare le performance dei giocatori.
# SEGUE ORA UNA BREVE DESCRIZIONE DEL GIOCO (per chi non lo conoscesse).
# Il gioco si svolge su una scacchiera quadrata di 15 per 15 caselle.
# Le righe sono identificate con le lettere A, B, C, ... I, J, K, L, M, N, O
# in altre parole con le lettere dell'alfabeto dalla A alla O.
# Le colonne sono invece identificate con i numeri da 0 a 14.
# Una flotta di navi e' posizionata sulla scacchiera, le posizioni inizialmente
# non sono note al giocatore, le navi non si muovono durante la partita.
# Una nave, a seconda delle sue dimensioni, puo' occupare da 1 a 5 caselle
# contigue (cioe' caselle una vicino all'altra).
# Il gioco consiste nell'indovinare la posizione delle navi andando per
# tentativi.
# Un tentativo, chiamato "tiro" consiste nell'indicare una posizione sulla
# scacchiera, (per esempio A5 oppure D12, ...). Se la posizione e' occupata
# da una nave l'utente riceve l'informazione "colpito", altrimenti l'utente
# riceve l'informazione "buco". Sulla base delle informazioni raccolte con
# i tiri effettuati, l'utente decide dove effettuare i tiri successivi.
# In ogni partita, la flotta da individuare puo' essere composta dalle seguenti
# tipologie di navi:
# - navi che occupano 5 caselle contigue,
# - navi che occupano 4 caselle contigue,
# - navi che occupano 3 caselle contigue,
# - navi che occupano 2 caselle contigue,
# - navi che occupano 1 caselle contigue.
# Per semplicita', la forma di una nave e' sempre "a bastone", in altre parole
# una nave occupa sempre celle contigue disposte in file orizzontali o verticali.
# Per semplicita', puo' accadere che due navi diverse si ritrovino attaccate
#l'una all'altra.

##########################################################
# DESCRIZIONE DEI FILE CON I DATI
##########################################################
#
# Nel file .zip troverete uno script .py da compilare e alcuni file di dati.
# I file con i dati contengono i dati che descrivono una singola partita svolta da un giocatore.
# I file con i dati sono:
#
#
# - File 1) disposizioneNavi.csv
#   Un esempio del contenuto del file e' il seguente. Nell'esempio
#   non considerate il simbolo di # e gli spazi.
#
#   0;4;3;2;1\r\n    # Attenzione: la struttura della prima riga e' diversa ...
#   A11;A12\r\n        # ... dalla struttura delle righe successive
#   B8;C8;D8;E8\r\n
#   C4;C5;C6\r\n
#
#   Il file NON contiene una riga di intestazione.
#   In tute le righe le informazioni sono separati da ; (punto e virgola) e
#   i \r\n rappresentano i caratteri di a capo.
#   La prima riga del file contiene informazioni sulla tipologia e numerosita'
#   di navi impiegate nella partita.
#   Nell'esempio qua sopra la prima riga indica che nel gioco saranno presenti
#   - 0 navi da 1 casella,
#   - 4 navi da due caselle,
#   - 3 navi da tre caselle,
#   - 2 navi da quattro caselle,
#   - 1 nave da cinque caselle.
#   In generale la prima riga conterra' sempre 5 numeri interi, il primo (da sinistra verso destra)
#   indica quante navi da 1 casella saranno impiegate nel gioco, il secondo numero indica
#   quante navi da 2 caselle saranno impiegate, ..., il K-esimo numero indica quante navi da K caselle
#   saranno impiegate, si ricorda che K>=1 e K<=5.
#   Ogni riga del file successiva alla prima contiene la disposizione di una nave nella scacchiera,
#   per essere piu' precisi, ogni riga contiene le coordinate delle caselle occupate da una
#   singola nave. Se una nave e' composta da N caselle, nella riga ci saranno N coordinate.
#   Di conseguenza, le righe possono contenere un numero variabile di coordinate.
#   Per esempio, in una riga che fa riferimento ad una nave da 3 caselle apparira'
#   C4;C5;C6\r\n
#   mentre in una riga che fa riferimento ad una nave da 2 caselle apparira'
#   A11;A12\r\n
#   Sono esempi di coordinate A11, A12, C4, C5 e C6.
#   Si ricorda le righe della scacchiera sono identificate (dall'alto verso il basso)
#   con le lettere A, B, C, ... I, J, K, L, M, N, O
#   mentre le colonne sono invece identificate (da sinistra verso destra) con i numeri da 0 a 14.
#   Nel corso dell'esercizio, per far riferimento alle righe della scacchiera, oltre alle lettere
#   potranno essere utilizzati i numeri da 0 a 14, in maniera analoga alla
#   numerazione delle colonne (maggiori informazioni in seguito).
#
#
#
#
# - File 2) tiriSuNavi.csv
#   In questo file sono presenti le informazioni sui tiri effettuati
#   da un utente. Un esempio del contenuto del file e' il seguente.
#   Nell'esempio non considerate il simbolo di # e gli spazi.
#
#   coordinata_tiro\r\n
#   A5\r\n
#   B12\r\n
#   G7\r\n
#   ...
#
#   La prima riga del file contiene l'intestazione.
#   Ogni riga successiva alla prima contiene la coordinata di un tiro effettuato dall'utente.
#   Esempi di coordinate sono: A5, oppure B12. La prima lettera
#   indica la riga, il numero successivo identifica la colonna della casella nel
#   quale e' stato effettuato un "tiro":
#
# Provate ad aprire i file con un editor di testi.
# State attenti, se aprirete il file con Excel o con il
# notepad di windows, alcune informazioni potrebbero essere
# VISUALIZZATE in MANIERA DISTORTA rispetto al contenuto del file.


##########################################################
# DESCRIZIONE DEL LAVORO DA SVOLGERE
##########################################################
#
# Implementate le seguenti funzioni, il commento che precede
# ogni funzione vi spieghera' cosa fare in dettaglio.
# Controllate nel corpo principale del programma (in fondo
# allo script), come vengono invocate le funzioni che
# implementerete.
# Per favore NON USATE le istruzioni input() o raw_input()
# nel codice che scriverete.
# Se volete potete implementare delle funzioni aggiuntive
# rispetto a quelle gia' presenti qua sotto.

##########################################################
# INIZIO DELLA PARTE DA EDITARE
##########################################################

cognome='Sostituiscimi con il cognome' # inserisci qua il tuo cognome
nome='Sostituiscimi con il nome' # inserisci qua il tuo nome

# - lettera2num(lettera). La funzione accetta come unico parametro una stringa
#   contenente una lettera dell'alfabeto dalla A alla O. La funzione restituisce
#   il valore numerico corrispondente alla lettera.
#   La funzione e' utilizzata per convertire la coordinata di una riga della scacchiera
#   (espressa tramite una lettera) in una coordinata numerica.
#   NOTA BENE: questa funzione e' GIA' IMPLEMENTATA,
#   NON DOVETE MODIFICARLA, la dovete SOLO USARE negli
#   esercizi seguenti.
def lettera2num(lettera):
    di={'A': 0, 'B': 1, 'C': 2, 'D': 3, 'E': 4, 'F': 5, 'G': 6, 'H': 7, 'I': 8, 'J': 9, 'K': 10, 'L': 11, 'M': 12, 'N': 13, 'O': 14}
    return di[lettera]

# - restituisciScacchieraVuota(). La funzione restituisce una
#   struttura dati che sara' chiamata SCACCHIERA d'ora in poi e
#   che puo' essere usata per memorizzare le posizioni delle navi.
#   La SCACCHIERA e' una lista di liste.
#   La lista esterna ha 15 elementi (uno per ogni riga della scacchiera),
#   chiamati liste interne.
#   Ogni lista interna  rappresenta le caselle di una riga
#   della scacchiera di gioco.
#   L'indice della lista esterna corrisponde alla coordinata numerica di
#   una riga della scacchiera,
#   l'indice di una lista interna corrisponde alla corrdinata numerica
#   di una colonna della scacchiera.
#   Nei diversi elementi delle liste interne,
#   * dove e' presente un 1 significa che la corrispondente casella della scacchiera
#     e' occupata da una parte di una nave,
#   * dove e' presente uno 0 vuol dire che la casella e' libera.
#   La funzione seguente restituisce una scacchiera completamente vuota,
#   dove cioe' tutti i valori sono pari a 0.
#   NOTA BENE: questa funzione e' GIA' IMPLEMENTATA,
#   NON DOVETE MODIFICARLA, la dovete SOLO USARE negli
#   esercizi seguenti.
def restituisciScacchieraVuota():

    return [
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    ]



# - caricaTiri(fname). La funzione accetta come unico parametro in
#   ingresso il nome del file con le coordinate dei "tiri" effettuati da un
#   utente.
#   La funzione deve restituire una struttura dati composta da una lista di
#   tuple come nell'esempio seguente.
#                        [   (riga1, colonna1), (riga2, colonna2), ...]
#   dove le coordinate dei tiri memorizzate nel file devono essere
#   convertite in tuple (riga, colonna) composte SOLO da NUMERI INTERI.
#   Nel file le coordinate sono memorizzate sotto forma di lettere e numeri
#   es. B4,  mentre nel nuovo sistema di riferimento le righe e le colonne
#   della scacchiera sono numerate da 0 a 14.
#   Per le righe, la conversione delle lettere in numeri deve
#   essere effettuata utilizzando la funzione lettera2num() fornita in precedenza.
#   Il numero della colonna presente nel file invece puo essere usato senza modifiche
#   nel nuovo sistema di riferimento.
#   Per esempio
#   * la coordinata A12 deve essere convertita nella tupla (0, 12),
#     il primo numero indica la riga, il secondo la colonna.
#   * La coodinata D8 deve essere convertita nella tupla (3, 8).
def caricaTiri(fname):
    pass  # Implementa il codice della funzione qua sotto. Questa riga puo' essere cancellata.


# - caricaDisposizione(fname). La funzione accetta come unico parametro in
#   ingresso il nome del file con i dati sulle posizioni occupate dalle navi.
#   La funzione deve restituire una "scacchiera" (cioe' una lista di liste,
#   come quella restituita  dalla funzione restituisciScacchieraVuota(),
#   precedentemente introdotto) con indicate le posizioni delle navi.
#   Nell'esempio seguente potete vedere una scacchiera "piena"
#   cioe' con le informazioni sulla posizione delle navi.
#   [
#      [0, 1, 0, ..., 0, 0],    # riga 0
#      [0, 1, 0, ..., 0, 0],    # riga 1
#      ...                      # ...
#      [1, 1, 1, ..., 0, 0],    # riga 14
#   ]
#   Si ricorda che l'indice della lista esterna corrisponde alla coordinata
#   numerica di una riga della scacchiera,
#   l'indice di una lista interna corrisponde alla corrdinata numerica
#   di una colonna della scacchiera.
#   Nei diversi elementi delle liste interne,
#   * dove e' presente un 1 significa che la corrispondente
#     casella della scacchiera
#     e' occupata da una componente di una nave,
#   * dove e' presente uno 0 vuol dire che nella casella
#     e' libera.
#   Nell'implementare questa funzione, dovete utilizzare la funzione restituisciScacchieraVuota()
#   per creare una scacchiera vuota, successivamente dovete
#   assegnare opportunamente gli 0 e gli 1 per rappresentare le posizioni occupate dalle
#   navi, come indicato nel file passato in ingresso.
#   Infine la funzione deve restituire la struttura dati creata al programma chiamante.
def caricaDisposizione(fname):
    pass  # Implementa il codice della funzione qua sotto. Questa riga puo' essere cancellata.



# - calcolaStatisticheTiri(tiri, scac).  La funzione accetta come parametri in ingresso
#   le strutture dati restituite rispettivamente dalla funzione caricaTiri() e dalla
#   funzione caricaDisposizione().
#   La funzione deve restituire un dizionario di coppie chiave:valore come nell'esempio seguente:
#      { numero_tiro:(totale_temporaneo_colpiti, totale_temporaneo_buchi),   }
#   Ogni coppia chiave:valore contiene i dati di uno specifico istante di gioco.
#   Le informazioni inserite nella chiave e nella tupla sono le seguenti:
#   * numero_tiro rappresenta il numero progressivo dei tiri effettuati dal giocatore.
#     Al primo tiro,  numero_tiro deve valere 1.
#   * totale_temporaneo_colpiti: rappresenta il numero totale di successi
#     nei primi n tiri (dove n corrisponde al valore contenuto nella chiave
#     numero_tiro).
#     Il successo si ha quando un tiro colpisce una casella contenente un pezzo di nave.
#   * totale_temporaneo_buchi: rappresenta il numero totale degli INSUCCESSI nei primi
#     n tiri (dove n corrisponde al valore contenuto nella chiave numero_tiro).
def calcolaStatisticheTiri(tiri, scac):
    pass  # Implementa il codice della funzione qua sotto. Questa riga puo' essere cancellata.


# - controlloFlotta(disposizioniFileName). La funzione accetta come unico parametro in
#   ingresso il nome del file con i dati sulle posizioni occupate dalle navi.
#   Si ricorda che in tale file la prima riga indica la tipologia e le numerosita' di navi
#   impiegate nel gioco, mentre le righe successive indicano la disposizione delle navi.
#   Questa funzione deve verificare che, per ogni tipologia di nave, il numero di navi
#   indicato nella prima riga, corrisponda al numero di navi effettivamente
#   descritte nelle righe successive.
#   Si ricorda che le dimensioni delle navi possono andare da 1 a 5 caselle.
#   La funzione deve restituire il valore booleano True se c'e' corrispondenza
#   tra i dati indicati nella prima riga e quelli presenti nelle righe successive,
#   False altrimenti.
def controlloFlotta(disposizioniFileName):
    pass  # Implementa il codice della funzione qua sotto. Questa riga puo' essere cancellata.




# - calcolaPunti(tiri, scac).  La funzione accetta come parametri in ingresso
#   le strutture dati restituite rispettivamente dalla funzione caricaTiri() e dalla
#   funzione caricaDisposizione().
#   L'utente ogni volta che colpisce una nave con dei tiri consecutivi, prende
#   dei punti cosi' calcolati:
#   * primo successo: 0 punti
#   * secondo successo consecutivo: 1 punto
#   * terzo successo consecutivo: 2 punti
#   * quarto successo consecutivo: 3 punti
#   * ...
#   * n_esimo successo consecutivo: n-1 punti
#   I successi isolati, rientrano nella categoria "primo successo" con 0 punti.
#   Per esempio, se un utente, nella partita ha 3 successi consecutivi, prende 0 punti per
#   il primo successo, 1 punto per il secondo successo e 2 punti per il terzo.
#   Se questi di cui sopra sono gli unici successi consecutivi nella partita,
#   l'utente conseguira' 1+2=3 punti totali. Si ricorda che si parla di successi consecutivi
#   quando ci sono due o piu' successi uno di seguito all'altro.
#   La funzione dovra' restituire un valore intero corrispondente alla somma dei punti conseguiti
#   dall'utente secondo i criteri descritti qua sopra.
def calcolaPunti(tiri, scac):
    pass  # Implementa il codice della funzione qua sotto. Questa riga puo' essere cancellata.



##########################################################
# Fine del compito e della parte da editare obbligatoriamente
# Inizio del corpo principale del programma. Potete
# modificare o lasciare invariato il codice qua sotto
# (a vostra scelta), se lo modificate, accertatevi
# che il codice non dia errori in esecuzione.
##########################################################

print('Esercizio %s.' % (nomeEsercizio))

print('Ciao %s, %s .' % (nome, cognome))

print("1) Eseguo la funzione caricaTiri: ")
ftiri='tiriSuNavi.csv'
datiTiri = caricaTiri(ftiri)
print(datiTiri)

print('2) Eseguo la funzione caricaDisposizione: ')
fdisp='disposizioneNavi.csv'
datiDispo = caricaDisposizione(fdisp)
print(datiDispo)

print('3) Eseguo la funzione calcolaStatisticheTiri: ')
st = calcolaStatisticheTiri(datiTiri, datiDispo)
print(st)

print('4) Eseguo la funzione controlloFlotta: ')
rc = controlloFlotta(fdisp)
print(rc)

print('5) Eseguo la funzione calcolaPunti: ')
pt = calcolaPunti(datiTiri, datiDispo)
print(pt)

print('Nome dello script eseguito')
print(__file__) # Questa istruzione stampa il nome dello script, ignoratela.



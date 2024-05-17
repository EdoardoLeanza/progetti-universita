print("inserisci due valori e ti dirò in che parte del piano si trovano")
x=int(input("inserisci valore di x"))
y=int(input("inserisci valore di y"))
if x > 0:
    if y > 0: print(" è nel primo quadrante")
    else: print(" è nel quarto quadrante")
else:
    if y > 0: print(" è nel secondo quadrante")
    else: print(" è nel terzo quadrante")
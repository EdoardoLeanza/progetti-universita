lista=['a', 'b', 'c', 'd']

i=0
while i<len(lista):
    print(lista[i])
    i=i+1

print('\n\nFOR\n')
for pippo in lista:
    print(pippo)


dizionario={'c1':10, 'c2':20, 'c3':40}
dizInv={}
for pippo,pluto in dizionario.items():
    print(pippo, pluto)
    dizInv[pluto]=pippo

print(dizInv)
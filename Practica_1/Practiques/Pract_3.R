sex <- c(0,0,0,1,0,0,1,1,0,1)
edat <- c(18,19,18,22,30,21,18,19,20,21)
iest <- c(8,7,9,7,9,9,8,8,10,6)
ipol <- c(8,6,5,1,7,9,9,10,0,9)

a<- seq(from=3, to=9); a
b<- seq(from=1, to=4, b=0.5); b
rep(c(1,2,3), each=2)
rep(c(3,2,1), times=2)
rep(c(5,6,7), times=c(2,3,4))

rep(1:3, 2) # (1)
rep(1:3, rep(2,3)) # (2)

#La diferència entre (1) i (2) és que (1) repeteix el vector 1:3 dues vegades. En canvi, en (2)
# el que s'indica és que hi ha que repetir dues vegades cada componente del vector 1:3 i l'últim 3 
# de (2) indica la longitud del vector 1:3, que és tres.

rep(rep(c("X","Y"), rep(3,2)),1:6)

#El primer argument de la funció rep de més a la esquerra és un vector
# que s'obté fàcilment tinguent en compte els resultats anterior
# És correspon amb el vector X X X Y Y Y. Després, el segon argument
# es tradueix com times=1:6, i.e., el primer componet de vector es 
# repeteix una vegada, el segon dues, el tercer tres, ... ,el sisé sis.



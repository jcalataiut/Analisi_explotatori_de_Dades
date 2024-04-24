# 1630376

# EXERCICI 1

n<-300 #Definim n com el nombre total de parades estudiades

P_1_e<-n*0.03; P_2.5_e<-n*0.02; P_3_e<-n*0.8
P_4.5_e<-n*0.1; P_8_e<-n*0.05 #Nombre de parades de cada tipus

(P_mitja<-(P_1_e*1+P_2.5_e*2.5+P_3_e*3+P_4.5_e*4.5+P_8_e*8)/n) #Preu mitja roses (mitjana aritmètica)

#EXERCICI 2

#(a)

A<-rep(c(1,0,1), times=c(1,5,3)); A
B<-rep(c(0,1,0), 2:4); B
C<-rep(rep(c(1,0),3), times=c(1,1,1,3,1,2)); C

#(b)

mode(A)
A.l<-as.logical(A); A.l
mode(B)
B.l<-as.logical(B); B.l
mode(C)
C.l<-as.logical(C); C.l

#(c)

X<-A+B; X # fixat que sí es pot fer aquestes operacions perque la longuitud és la mateixa dels vectors
Y<-A+C; Y

#(d)

mode(X)
mode(Y)

#EXERCICI 3

#(a)

id<-0:24; id

#(b)

sexe<-rep(c(1,2), times=c(15,25-15)); sexe

#(c) 

# es podria introduir d'aquesta manera o directament posant les dades en ordre en el vector
edat<-rep(c(18,23,25,27,28,29,30,31,32,20,21,26,28,30,31),times=c(1,1,1,3,1,4,1,1,2,1,1,2,3,1,2)); edat
edat<-c(18,23,25,27,27,27,28,29,29,29,29,30,31,32,32,20,21,26,26,28,28,28,30,31,31); edat

n.individus.llar<-rep(c(2,1,2,3,1,2,4,1,4,3,2,1,2,3,1,5), times=c(2,2,1,1,2,1,1,2,1,1,3,2,2,2,1,1)); n.individus.llar
n.individus.llar<-c(2,2,1,1,2,3,1,1,2,4,1,1,4,3,2,2,2,1,1,2,2,3,3,1,5); n.individus.llar

m2.llar<-c(55,58.5,35,42,57,70,35.5,40.7,NA,73,50,52,70.5,65.5,54,55,54,49.5,35,53.5,49,NA,60,51,90); m2.llar

#(d)

tv<-rep(c(TRUE,FALSE,TRUE,FALSE,TRUE), times=c(13,2,4,1,5)); tv

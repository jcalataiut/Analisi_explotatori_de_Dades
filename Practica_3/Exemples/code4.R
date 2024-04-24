#INDEXACIÓ VECTOR
v<-c(1:4,NA,-2:3) 
v[3];v[5];v[8] #comenza a contar des de 1 les posicions i no des de 0 com Sage i Python
v[1:3]; v[c(4,5,9)] #localitzar sub-vectors
w<-v[1:3];w

v[-1]; v[-(2:5)]
w<-v[-(2:5)];w
v<-v[-(2:5)];v

#INDEXACIÓ MATRIUS I ARRAYS
M<-matrix(1:12,4,3,byrow=TRUE); M
A<-array(1:24, dim=c(2,4,3)); A

M[1,3]; M[1,];M[,1] #atenció mostra les columnes com files en M[,1]
M[-1,]; M[,-1]; M[-1,-1] #mostra M excepta la fila 1 i/o columna 1
A[,1,]
A[,,1]
A[1,,1]
A[1,1,1]
A[,,-1] # ens mostra totes les matrius excepte la primera

#INDEXACIÓ DE LLISTES
L<-list(nombre=a,matriu=M,array=A,vector=v,descriptor=des); L
L[[1]];L[[2]] #cida elements de la llista
L$matriu #crida pel nom al segon element
L[[2]][1,1]; L$matriu[1,1] #indexa dins de la matriu
L[[2]][,-1]; L$matriu[,-1]
L

L[2]
L[[2]]
class(L[2]); class(L[[2]]) #objectes diferents (la primera L[2] és una subllista de L)

#INCEXACIÓ DATA FRAMES
##indexació data frames com a llistes
(df<-data.frame(alg=c(5,4,8),md=c(5,8,8), grup=c("A","B","B")))
df[1] #com a data.frame
class(df[1])
df["alg"]
df[[1]] #primera columna que torna com a vector
class(df[[1]])
df$alg #idem al anterior
df[["alg"]] #idem

#indexació com a matrius
df[1,]
df[-2,]
df[,c(2,3)]

#IDEXACIÓ MITJANÇANT CONDICIONS LÒGIQUES
w<-c(10,20,30,40,50)
seleccio1<-c(2,3,5)
seleccio2<-c(F,T,T,F,T)
w[seleccio1]
w[seleccio2]

w>25
w[w>25] #d'aquesta manera podem seleccionar algunes components
w2<-c(1:5,NA,NA,2,7,NA)
is.na(w2) #dona TRUE les components NA
!is.na(w2) #dona FALSE les components NA
w2[!is.na(w2)] #és w2 sense el valors NA

#CANVI VALORS DELS OBJECTES MITJANÇANT INDEXACIÓ
v<-c(3,4);
v[1]<-0; v

M<-matrix(1:12,nrow=3); M
M[1,]<-c(0,0); M #també es pot posar un vector de length divisor del ncol i aixina repeteix el valors 
A<-array(1:12,dim=c(2,2,3)); A
A[,,2]<-A[,,1]; A[,,3]<-A[,,1]; A # totes les matrius del array iguals a la primera

w2[is.na(w2)]<-0; w2 #assigna 0 als valors NA

w3<-c(-5,-3,9,0,4,-8,10)
w3[w3<0]<- -1; w3[w3>0]<-1; w3

tv<-rep(T,25)
tv[c(15,16,21)]<- FALSE #canviem els que tenen id=14,15,20

#AFEGIR NOVA COLUMNA A UN DATA FRAME AMB INDEXACIÓ
df
df$calcul<-c(5,3,8)
df #ara té una nova columna

df[4,] #no hi ha una quarta fila
df[4,]<-list(7,6,"A",4)
df







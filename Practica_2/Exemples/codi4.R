m<-c(1,1,1,2,2,2)
(M<-matrix(m,nrow=2)) # es transforma el vector m en un vector de dues files
(M<-matrix(m,ncol=3))
(M<-matrix(m,2,3))
dim(m) <- c(2,3); m #idem, hem perdut el vector "m", ara és matriu
                    #fixat que per defecte l'ompli per columnes
M<-matrix(m,nrow=2,byrow = T); M #l'ompli per files

### Sempre el demana que la longuitud del vector sigua un submúltiple o múltiple del numero 
### de files o de columnes introduït, ie, si nrow=2 llavors length(vector)=2*x i aixina
### ncol serà igual a x.

m
M1<-matrix(m,2,3,byrow=T); M2<-matrix(m,3,2,byrow=F)
M3<-matrix(c(1,1,1,2,2,2,3,3,3), 3, 3, byrow=T)
M1;M2;M3
M<-rbind(M1,M3); W<-cbind(M2,M3); M;W

rownames(W) <- paste(c("W"), 1:3, sep="")
colnames(W) <- 1:5; W
dimnames(W)
colnames(W); rownames(W)

length(W)
mode(W)
class(W)

B<-matrix(1:18, 4, 5)
B<-matrix(c(1:18,NA,NA),4,5); B

A<-array(1:32, dim=c(2,4,4))
dim(A) #El vector té components: 2files, 4columnes i 4capes (o fulls)
length(A)
mode(A); class(A)
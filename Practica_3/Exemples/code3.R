v<-c(3,4); v
m<-as.matrix(v); m
as.vector(v)
fa<-as.factor(v);fa
(M<-matrix(1:12,4,3,byrow=T))
(dM<-as.data.frame(M))
length(M); length(dM)

M%*%t(M) #t(M) es la funció matriu transposada (també es pot carregar per a data frames) i %*% producte matricial
dM%*%t(dM) #no es poden multiplicar data frames
as.matrix(dM)%*%as.matrix(t(dM))



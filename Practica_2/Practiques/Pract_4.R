#(a)

A1<-matrix(sample(1:5,5*6,replace=TRUE),5,6); A1

#(b)
A2<-matrix(rep(c(10,20,30),rep(6,3)),nrow=3, byrow=TRUE); A2

#(c)
A3<-rbind(A1,A2); A3

#(d)
rownames(A3) <- paste(c("F"), 101:(101+dim(A3)[1]-1), sep="")
colnames(A3) <- 201:(201+dim(A3)[2]-1)
rownames(A3); colnames(A3)

#Quants atributs té A3?
length(A3)


a<-5; M<-matrix(1:12,4,3,byrow=TRUE); A<-array(1:24,dim=c(2,4,3))
v<-c("blau","verd"); des<-"la llista"
(L<-list(a,M,A,v,des))

(L<-list(escalar=a,matriu=M,array=A,vector=v,descriptor=des))
names(L)
length(L)
mode(L)
class(L)

(A<-array(1:32,dim=c(2,4,4)))
dimnames(A)<-list(c("u","dos"),c("a","b","c","d"),c("m1","m2","m3","m4"));A
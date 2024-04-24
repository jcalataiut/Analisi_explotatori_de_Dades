a<-sqrt(9999); a
v<-c(a,a^2); v
ls()
rm(a)

x<-c(1,1,2,3,1,3)
(fx<-factor(x))
(fx<-factor(x,levels=c(1,2,3),labels=c("baix","normal","alt")))

x<-c(1,1,2,3,1,3)
fx<-ordered(x,levels=c(1,2,3),labels=c("baix","normal","alt")); fx

set.seed(343) #llavor de l'algoritme
(notes<-sample(1:10,25,rep=TRUE))
(f1<-cut(notes, breaks=c(0,5,7,9,10), right=FALSE))
  
(f1<-cut(notes, breaks=c(0,5,7,9,10), right=FALSE, include.lowest=TRUE))
(f2<-cut(notes, include.lowest=TRUE, right=FALSE, breaks=c(0,5,7,9,10), labels=c("s","a","n","e")))
f3<-cut(notes,include.lowest=TRUE,right=FALSE,breaks=c(0,5,7,9,10), labels=c("s","a","n","e"),ordered_result=TRUE);f3
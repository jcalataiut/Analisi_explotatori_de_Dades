D<-c(0,3,3,3,3,1,-2); D
D1<-c(D-3);D1
c(D,D1)
v<-3:6; v
seq(from=3,to=6)
seq(from=2, to=10, by=2)
seq(2,10, by=2)
seq(from=0, to=10, length=5)
rep(3, times=3)
rep(5,3)
rep(c(1,2,3),times=2)
rep(c(1,2,3), times=c(1,4,3))

#Examples

m0<-3; m1<-150
V<- m0:m1; V
V<- seq(from=m0, to=m1); V
W<- m0:m1-1; W; m0:(m1-1)
-1:7; -(1:7)

V<-seq(from=m0, to=m1, by=5); V
seq(-pi,pi,pi/8)
V<-seq(from=1,to=11,length=4); V
V<-rep(0, times=10); V
V<-rep(V, times=2); V
rep(1:10,times=3)
rep(1:10, times=rep(3,10))
rep(1:10, each=3)
rep(c(1,2,3), times=c(1,2,3))

letters
LETTERS
month.name
month.abb
c("Pepa","Ton","Jana")
c('Pepa', 'Ton', 'Jana')
x<- c(1,2,'altre'); x #ho converteix tot a format caràcter

cert <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
cert
cert <- c(TRUE, FALSE, TRUE, TRUE, FALSE)

vector("integer",3)
integer(3)
vector("numeric",3); numeric(3)
vector("logical",3); logical(3)
vector("character", 3); character(3)
#Plot d'un vector
dades1<-c(1,2.4,5,2,3); dades1
plot(dades1)
plot(dades1 ,type='b')
names(dades1)<-letters[1:5]
plot(dades1,type='n') # buit
text(dades1,labels=names(dades1))
plot(dades1,type='l'); text(dades1,labels=names(dades1))

plot(sin,-pi,pi)

x<-1:10; y<-x^2
plot(x,y)

f<-c(rep(c('a','b'), rep(5,2)),rep('c',2)); f
f<-factor(f);f
plot(f)

x<-1:12
plot(f,x)
plot(x~f)

#Alguns paràmetres gràfics

plot(dades1,type="s",ylab="nom eix y",xlab="x", 
     main="Nom de la figura",sub="Altres comentaris")
plot(dades1,xlim=c(0,20),ylim=c(0,10),pch=18)

x<-sample(1:6,20,replace=T)
v1<-rnorm(20)
v2<-rnorm(20)
par(mfrow=c(2,2))
barplot(table(x),col=2:7,main="diagrama de barres de colors")
plot(1:25,pch=1:25,cex=1,main="tipus de punt")
plot(21:25,pch=21:25, bg=rainbow(5),cex=1.3,main="caràcters plans")
hist(v1,col='red',main='histograma')
par(mfrow=c(1,1))

par(mfrow=c(2,2))
plot(v1,v2,las=0,cex=1,main="punts grans i etiquetes marques eixos")
plot(v1,v2,las=1,bty="l",cex=0.5,col="blue",main="punts petits i etiquetes horitz")
plot(v1,v2,axes=FALSE, main="sense eixos")
plot(v1,v2,bty="n",xlim=c(-3,2),ylim=c(-3,3))
par(mfrow=c(1,1))

plot(0:10,0:10,axes=F,xlab="",ylab="")
title(main="fals!!!", sub="Van Gogh")
points(runif(7,0,10),runif(7,0,10),cex=3, col='red')
text(1,7,"que bonic!", col=rainbow(2))
abline(h=2,lty=1)
abline(v=3,lty=3)
abline(a=2,b=1,col='red')
lines(c(0,3,4),c(0,1,7), col='green')
polygon(c(0,3,4),c(0,1,7),col='yellow')
polygon(runif(4,1,7),runif(4,1,7), col='green')
legend(8,8,lty=c(1,2),legend=c('a','b'))

par()
x<-rnorm(10)
y<-rnorm(10)
par()$mar
par()$bg
param.vells<-par()
par(bg="lightgray",mar=c(2.5,2.5,2.5,0.7))
plot(x,y,type='n',xlab="",ylab="",
     xlim=c(-2,2),ylim=c(-2,2),xaxt="n",yaxt="n")
rect(-3,-3,3,3,col="cornsilk")
points(x,y,pch=10,col='red',cex=2)
axis(side=1,c(-2,0,2),tcl=-0.2,labels=F)
axis(side=2, -1:1, tcl=-0.2, labels=FALSE)
title("personalitzar un gràfic",font.main=4,adj=1,cex.main=1)
mtext("Deu números a l’atzar", side=1, line=1, at=1, cex=0.9, font=3)
mtext("Uns altres deu números", side=2,line=1, at=0.5, cex=0.9, font=3) 
mtext(c(-2, 0, 2), side=1, las=1, at=c(-2, 0, 2), line=0.3,                                                                                                                                                                                                            col="blue", cex=0.9)
mtext(-1:1, side=2, las=1, at=-1:1, line=0.2, col="blue", cex=0.9)

par(param.vells)
par(bg='white',mar=c(5.1,4.1,4.1,2.1))





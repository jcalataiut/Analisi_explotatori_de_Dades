boxplot(mpg~cyl)
boxplot(mpg~cyl,col=2:4)
boxplot(mpg~cyl,col="gray",horizontal = TRUE)

c(sum(cyl==4),sum(cyl==6), sum(cyl==8)) #nombre d'elements de cada grup desigual
boxplot(mpg~cyl,col=rainbow(8),varwidth=TRUE)

plot(as.numeric(cyl),mpg,cex=0.8,pch=20,axes=F,xlim=c(2.5,8.5),xlab="cyl",ylim=c(0,40),col=2,main="diagrama de punts")
axis(side=2)
axis(side=1,at=c(4,6,8),labels=c(4,6,8), pos=0)
abline(h=0)

install.packages(package="gplots")
library(gplots)
search()

plotmeans(mpg~cyl,mean.labels=T,digits=2,pch=1,col="red",bars=F,connect=T)

#Les següents instruccions són anàloges a utilitzar la funció plotmeans
mitj1<-by(mpg,cyl,mean)[[1]]
mitj2<-by(mpg,cyl,mean)[[2]]
mitj3<-by(mpg,cyl,mean)[[3]]
mitjanes<-c(mitj1,mitj2,mitj3)
nivells<-as.numeric(levels(as.factor(cyl)))
plot(nivells,mitjanes,type="b",xlim=c(3.5,8.5),
     ylim=c(14,27),xlab="cyl",ylab="means of mpg",col="blue",lty=2)
n1<-by(mpg,cyl,length)[[1]]
n2<-by(mpg,cyl,length)[[2]]
n3<-by(mpg,cyl,length)[[3]]
etiquetes<-paste("n=",c(n1,n2,n3),sep="")
text(nivells,rep(14.3,3),etiquetes)







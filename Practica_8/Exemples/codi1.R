reldroga<-table(relig,legdroga)
barplot(reldroga)
barplot(reldroga,col=gray.colors(5))
legend("topleft",legend=levels(as.factor(relig)),fill=gray.colors(5))

barplot(reldroga,col=gray.colors(5),xlim=c(0,4))
legend(2.5,700,legend=levels(as.factor(relig)),fill=gray.colors(5), cex=0.7)

barplot(t(reldroga),col=gray.colors(2))
legend("topleft",legend=levels(as.factor(legdroga)),fill=gray.colors(2))

barplot(t(reldroga),col=gray.colors(2),beside=T)
legend("topleft",legend=levels(as.factor(legdroga)),fill=gray.colors(2))

reldrog.condf<-prop.table(reldroga,1)*100
reldrog.condc<-prop.table(reldroga,2)*100

barplot(t(reldrog.condf),xlim=c(0,6.3),main="opinió droga condicionada a religió")
legend(6.1,100,legend=levels(as.factor(legdroga)),fill=gray.colors(2))

barplot(reldrog.condc,xlim=c(0,3),col=gray.colors(5),main="religió condicionada a opinió droga")
legend(2.5,100,legend=levels(as.factor(relig)),fill=gray.colors(5))

(alturesrect<-c(10,18,40,20,12))
(finalrect<-cumsum(alturesrect))
(puntsmitjans<-finalrect-alturesrect/2)

x<-barplot(reldrog.condc,xlim=c(0,6))
legend(2.5,100,
       legend=levels(as.factor(relig)),
       fill=gray.colors(5),cex=0.8)

etiquetesx<-rep(x,each=5)
etiquetesy<-as.vector(apply(reldrog.condc,2,function(x) cumsum(x)-x/2))
etiquetes<-paste(round(reldrog.condc),"%",sep="")

text(etiquetesx,etiquetesy,etiquetes,cex=0.7)

mosaicplot(t(reldroga),col=2:6,las=1,off=8,main="")







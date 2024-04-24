barplot(reldrog.condc,xlim=c(0,3.3),col=rainbow(5))
barplot(reldrog.condc,xlim=c(0,3.3),col=rainbow(8)[2:6])
barplot(reldrog.condc,xlim=c(0,3.3),col=gray.colors(6)[2:6])
barplot(reldrog.condc,xlim=c(0,3.3),col=terrain.colors(5))

mosaicplot(t(reldroga),col=1:5,las=1,off=8,main="")

palette(hcl.colors(5,"viridis"))
mosaicplot(t(reldroga),col=1:5,las=1,off=8,main="")

palette(hcl.colors(5,"Purples"))
mosaicplot(t(reldroga),col=1:5,las=1,off=8,main="")

palette(hcl.colors(5,"Temps"))
mosaicplot(t(reldroga),col=1:5,las=1,off=8,main="")

palette("default")

(a<-as.matrix(margin.table(taula,1)))
(b<-as.matrix(margin.table(taula,2)))

(b<-t(b))

round(a%*%b/sum(taula),1)
taula

contingencia<-chisq.test(sexo,ecivil)
contingencia$expected
contingencia$observed
contingencia$p.value # Un p.value p<0.005






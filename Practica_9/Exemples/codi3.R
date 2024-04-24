
library(lattice)
xyplot(salario~salini|catlab, data=df, groups=sexo, auto.key=T,cex=0.4)

load("mon.RData")
attach(mon)
plot(pib_cap~espvidaf)
abline(lm(pib_cap~espvidaf),col="red")
summary(lm(pib_cap~espvidaf))

plot(log(pib_cap)~espvidaf)
abline(lm(log(pib_cap)~espvidaf),col="red")
summary(lm(log(pib_cap)~espvidaf))

logmod<-lm(log(pib_cap)~espvidaf)
coefs<-logmod$coefficients
plot(pib_cap~espvidaf,main="ajust exponencial de pib_cap sobre espvidaf")
x<-seq(min(espvidaf,na.rm=T),max(espvidaf,na.rm=T),by=0.05)
points(x,exp(coefs[1]+coefs[2]*x),type="l", col=2)
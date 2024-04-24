births<-scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
class(births)
naixements<-births[-(1:12)]
length(naixements)
temps<-1:156
plot(temps, naixements, type="l", xlim=c(1,156),col=2, 
     main="Naixements a la ciutat de Nova York", axes=F)
axis(1,at=seq(1,157,by=12), labels=as.character(seq(1947,1960)))
axis(2)
abline(v=seq(1,157,by=12), col="lightgray")

# 1. Calculem la recta de regressió de Y sobre T
model<-lm(naixements~temps)
a<-model$coefficients[1]
b<-model$coefficients[2]
abline(a,b,col=4)

# 2. Càlcul dels coeficients estacionals

sensetend<-naixements-(a+b*temps)
plot(temps,sensetend, type="l", xlim=c(1,156), col=2, axes = F, 
     main="Diferència entre la sèrie ila tendència")
axis(1,at=seq(1,157,by=12), labels=as.character(seq(1947,1960)))
axis(2)
abline(v=seq(1,157,by=12), col="lightgray")
abline(h=0,col=4)

matriudif<- matrix(sensetend,ncol=12,byrow=T)
dimnames(matriudif)<-list(1947:1959,month.abb)
round(matriudif,2)

est<-apply(matriudif,2,mean)
est

# 3. Aproximació de la sèrie

component.estacional<-rep(est,13)
tendencia<-a+b*temps
estimacio<-tendencia + component.estacional
plot(temps, naixements, type="l",xlim=c(1,156), col=1, axes=F,
     main="Naixements a la ciutat de Nova York")
axis(1, at=seq(1,157,by=12), labels=as.character(seq(1947,1960)))
axis(2)
points(temps,estimacio,type="l",col=2)
legend(1,30, legend=c("sèrie naicements", "aproximació"), col=c("black","red"), lty=1, cex=0.9)

# 4. Estimacions

t1<-156+3*12+2
yestim<-a+b*t1+est[2]
round(yestim,3)
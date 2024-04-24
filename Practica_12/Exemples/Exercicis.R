# Problema 1


vendes<-c(2,3.1,2.6,1.8,2.2,3,2.8,2,2.2,3.5,4.3,2.1,2.4,3.6,4.5,2.2)
matriuvendes<-matrix(vendes, nrow=4)
dimnames(matriuvendes)<-list(c("primavera","estiu","tardor","hivern"),paste("any",1:4,sep="_"))
matriuvendes

temps<-1:16
plot(temps,vendes,type="l",col=2,axes=F,xlim=c(1,17),
     main="Vendes d'una empresa de begudes carbòniques")
axis(1,at=seq(1,17,by=4),labels=paste("any",1:5,sep="_"))
axis(2)
abline(v=seq(1,17,by=4), col="lightgray")

model<-lm(vendes~temps)
a<-model$coefficients[1]
b<-model$coefficients[2]
abline(a,b,col="blue")

# Calcul coeficients estacionals

sensetend<-vendes-(a+b*temps)
plot(temps,sensetend,type="l",col=2,axes=F,xlim=c(1,17))
axis(1,at=seq(1,17,by=4),labels=paste("any",1:5,sep="_"))
axis(2)
abline(v=seq(1,17,by=4), col="lightgray")
abline(h=0,col="blue")

matriuvendesdif<-matrix(sensetend,nrow=4)
dimnames(matriuvendesdif)<-list(c("primavera","estiu","tardor","hivern"),paste("any",1:4,sep="_"))
matriuvendesdif

est<-apply(matriuvendesdif,1,mean)
est

component.estacional<-rep(est,4)
tendencia<-a+b*temps
estimacio<-tendencia+component.estacional
plot(temps,vendes,type="l",col=1,axes=F,xlim=c(1,17),
     main="Vendes d'una empresa de begudes carbòniques")
axis(1,at=seq(1,17,by=4),labels=paste("any",1:5,sep="_"))
axis(2)
points(temps,estimacio,type = "l", col=2)

t1=16+1
yestim<-(a+b*t1)+est[1]
round(yestim,3)

#Problema 2

mates<-c(4.5,4.6,4.4,4.8,4.9,4.7,5,5,4.9,5.1,5.2,5.1,5.2,5.3,5.1)
matmates<-matrix(mates,nrow=3)
dimnames(matmates)<-list(paste(1:3, "avaluació",sep=" "),paste("any",1:5,sep=" "))
matmates

temps<-1:15
model<-lm(mates~temps)
a<-model$coefficients[1]
b<-model$coefficients[2]

plot(temps,mates,type="l", col=2, axes=F, xlim=c(1,16))
axis(1,at=seq(1,16,by=3),labels=paste("any",1:6,sep=" "))
axis(2)
abline(v=seq(1,16,by=3), col="lightgray")
abline(a,b,col="blue")

sensetend<-mates-(a+b*temps)
matmatesdif<-matrix(sensetend,nrow=3)
dimnames(matmatesdif)<-list(paste(1:3, "avaluació",sep=" "),paste("any",1:5,sep=" "))
round(matmatesdif,2)

est<-apply(matmatesdif,1,mean)
est

t1<-15+3
yestim<-a+b*t1+est[3]
round(yestim,3)

# Problema 3

## (a)
library(datasets)
airpas<-as.vector(AirPassengers)
temps<-1:length(airpas)

plot(temps,airpas,type="l",col=2, axes=F, xlim=c(1,144))
axis(1,at=seq(1,145,by=12), labels=as.character(seq(1949,1961)))
axis(2)
abline(v=seq(1,145,by=12), col="lightgray")

model<-lm(airpas~temps)
a<-model$coefficients[1]
b<-model$coefficients[2]
abline(a,b,col="blue")

## (b)

Z<-log(airpas)
plot(temps,Z,type="l",col=2, axes=F, xlim=c(1,144))
axis(1,at=seq(1,145,by=12), labels=as.character(seq(1949,1961)))
axis(2)
abline(v=seq(1,145,by=12), col="lightgray")

## (c)
Z<-log(airpas)
modellog<-lm(log(airpas)~temps)
alog<-modellog$coefficients[1]
blog<-modellog$coefficients[2]
abline(alog,blog,col="blue")

## (d)
ylog<-exp(alog+blog*temps)

plot(temps,airpas,type="l",col=2, axes=F, xlim=c(1,144))
axis(1,at=seq(1,145,by=12), labels=as.character(seq(1949,1961)))
axis(2)
abline(v=seq(1,145,by=12), col="lightgray")
points(temps,ylog,col="blue", type="l")

## (e)

sensetendZ<-Z-(alog+blog*temps)
matairpasdif<-matrix(sensetendZ,nrow=12)
dimnames(matairpasdif)<-list(1949:1960,month.abb)
matairpasdif

est<-apply(matairpasdif,2,mean)
est

yest<-exp(est); yest

yestima<-yest*ylog
plot(temps,airpas,type="l",col=1, axes=F, xlim=c(1,144))
axis(1,at=seq(1,145,by=12), labels=as.character(seq(1949,1961)))
axis(2)
abline(v=seq(1,145,by=12), col="lightgray")
points(temps,ylog,col="blue", type="l")
points(temps,yestima,type="l",col=2)

## (h)

t1<-144+4
yestim<-exp(alog+blog*t1)*yest[4]
round(yestim,3)

# Problema 4

## (a)
souvenir<-scan("http://robjhyndman.com/tsdldata/data/fancy.dat"); souvenir
matsou<-round(matrix(souvenir,nrow=7,byrow=T))
dimnames(matsou)<-list(1987:1993,month.abb); matsou

## (b)
temps<-1:length(souvenir)

plot(temps,souvenir,type="l",col=2, axes=F, xlim=c(1,length(souvenir)))
axis(1, at=seq(1,length(souvenir)+1,by=12), labels=as.character(seq(1987,1994)))
axis(2)
abline(v=seq(1,length(souvenir)+1,by=12), col="lightgray")

## (c)
model<-lm(souvenir~temps)
a<-model$coefficients[1]
b<-model$coefficients[2]
abline(a,b,col="blue")
summary(model) # r^2=0.3127 una relació lineal feble

## (d)

plot(temps,log(souvenir),type="l",col=2, axes=F, xlim=c(1,length(souvenir)))
axis(1, at=seq(1,length(souvenir)+1,by=12), labels=as.character(seq(1987,1994)))
axis(2)
abline(v=seq(1,length(souvenir)+1,by=12), col="lightgray")

## (e) i (f)
model_log<-lm(log(souvenir)~temps)
alog<-model_log$coefficients[1]
blog<-model_log$coefficients[2]

sensetend<-log(souvenir)-(alog+blog*temps)
matdif<-matrix(sensetend,nrow=7,byrow=T)
dimnames(matdif)<-list(1987:1993,month.abb); matdif
coef_est_log<-apply(matdif,2,mean); coef_est_log
comp.est<-rep(coef_est_log,7)

points(temps, alog+blog*temps+comp.est, type="l", col="blue")

## (g)
plot(temps,souvenir,type="l",col=1, axes=F, xlim=c(1,length(souvenir)))
axis(1, at=seq(1,length(souvenir)+1,by=12), labels=as.character(seq(1987,1994)))
axis(2)
abline(v=seq(1,length(souvenir)+1,by=12), col="lightgray")
abline(a,b,col="blue")
points(temps, exp(alog+blog*temps+comp.est), type="l", col="red")

## (h)
t1<-length(souvenir)+5
yestim<-exp(alog+blog*t1+coef_est_log[5])
round(yestim,3)




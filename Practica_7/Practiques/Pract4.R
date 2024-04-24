Cardio.Train<-read.csv("aux_Cardio_Train.csv",sep=";",dec="."); tail(Cardio.Train)

attach(Cardio.Train)
layout(matrix(c(1,2),ncol=2))
plot(cardio[1:50],ap_hi[1:50],cex=0.8,pch=20,axes=F,xlim=c(-0.5,2),xlab="cardio",col=2,
     main="Diagrama de punts ap_hi",ylim=c(40,170))
axis(side=2)
axis(side=1,at=c(0,1),pos=40,labels=c(0,1))
abline(h=40)

plot(cardio[1:50],ap_lo[1:50],cex=0.8,pch=20,axes=F,xlim=c(-0.5,2),xlab="cardio",col=2,
     main="Diagrama dels 50 primers casos de ap_lo estratificats per cardio",ylim=c(40,180))
axis(side=2)
axis(side=1,at=c(0,1),pos=40,labels=c(0,1))
abline(h=40)


library(vioplot)
x0<-ap_hi[cardio==0]
x1<-ap_hi[cardio==1]
vioplot(x0,x1,names=c("cardio=0","cardio=1"),col=2:3, main="Pressió arterial ap_hi",ylim=c(0,16000))
axis(side=1,at=seq(0,16000,by=2000),labels=c('0','2000','4000','6000','8000','10000','12000','14000','16000'))

y0<-ap_lo[cardio==0]
y1<-ap_lo[cardio==1]
vioplot(y0,y1,names=c("cardio=0","cardio=1"),col=2:3, main="Pressió arterial ap_lo",ylim=c(0,16000))

layout(1)
detach(Cardio.Train)
#PUNT 1

df.DESPESA<-as.data.frame(DESPESA); df.DESPESA
mit.men<-round(colMeans(df.DESPESA),2); mit.men

plot(mit.men,type="b",xlab="",ylab="",ylim=c(0,180),xlim=c(1,12),xaxt="n",pch=4)
text( mit.men,as.character(mit.men),col='red',cex=0.7,pos=3)
title("Despesa mensual dels alumnes")
axis(side=1,1:12,labels=month.abb)
axis(side=2,c(0,50,100,150,200),labels=T)
mtext("Mesos",side=1,line=2,cex=0.9,font=3)
mtext("Despesa",side=2,line=2,cex=0.9,font = 3)
abline(h=mean(mit.men),lty=1,lwd=2,col='blue')
abline(h=mean(mit.men)+sd(mit.men),lty="dotted")
abline(h=mean(mit.men)-sd(mit.men),lty="dotted")

#PUNT 2
df.mundo<-read.csv("mundo.csv",sep=",",dec="."); head(df.mundo)
boxplot(df.mundo$espvidaf, ylim=c(40,100))
Q<-quantile(df.mundo$espvidaf,probs=seq(0.25,0.75,0.25)); Q
abline(h=Q,col='red',lty="dashed")
RI=Q[3]-Q[1]
abline(h=c(Q[1]-1.5*RI,Q[3]+1.5*RI),col='green',lty='dashed')

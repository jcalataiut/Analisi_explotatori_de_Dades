
par(mfrow=c(2,2))

#Fumar
attach(Cardio.Train)
boxplot(weight~smoke,col=rainbow(3),varwidth=TRUE)
plotmeans(weight~smoke,main.labels=T,digits=2,pch=1,col="orange",bars=F,connect=T)

#Alcohol
boxplot(weight~alco,col=rainbow(2),varwidth=T)
plotmeans(weight~alco,main.labels=T,digits=2,pch=2,col="blue",bars=F,connect=T)

#ACtivitat fisica
boxplot(weight~active,col=c("blue","green"),varwidth=T)
plotmeans(weight~active,main.labels=F,digits=2,pch=20,col="brown",bars=F,connect=T)

###En funció de les gràfiques diria que la varaible que mes condiciona el pes és l'alcohol

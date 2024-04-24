pie(table(df1$grup))
barplot(table(df1$grup))

hist(table(df1$alg))
boxplot(df1$alg)

plot(ecdf(cal))
plot.stepfun(cal,col.vert="gray80")


op<-par(mfrow=c(1,2),cex=0.7)
plot(sort(unique(cal)),df.cal$pci,type="h",ylim=c(0,40))
plot(ecdf(cal))
par(op)

#variable agrupada en intervals
xi<-c(8,18,22,32,52.5,82.5) #marques de classe
ni<-c(10,15,20,50,40,20)
edat<-rep(xi,ni)
talls<-c(0,16,20,24,40,65,100)
hist(edat,breaks=talls,ylim=c(0,0.1))









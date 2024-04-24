library(foreign)
search()

df<-read.spss("Datosdeempleados.sav",to.data.frame=T,max.value.labels=5); head(df) 
summary(df)

attach(df)

plot(salario~salini)
plot(salini,salario)

plot(salario~salini,main="Salari actual en funció de l'inicial",xlab="salari inicial",ylab="salari actual",pch=20)
abline(lm(salario~salini),col="red")

detach(df)
df.enq<-read.table("enq.txt",header=T); head(df.enq)

attach(df.enq)

plot(Alt,Pes,main="Pes en funció de l'altura",xlab="Altura",ylab="Pes",pch=20)
#Existeix com una relación lineal positiva entre les dues varibles que mostra
#que a major altura, major deu de ser el pes de l'individu
detach(df.enq)

attach(df)

plot(tiempemp,salario,main="Salari en funció del temps empleat",cex=0.8,xlab="temps empleat",ylab="salari",pch=18)
abline(lm(salario~tiempemp),col="red")
#D'acord amb el gràfic de dispersió, no hi ha gaire relació entre les dues variables
#perque el fet de treballaR un temps determinat no s'associa a tenir un salari més alt
detach(df)



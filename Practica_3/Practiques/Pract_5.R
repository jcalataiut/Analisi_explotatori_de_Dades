#(a)
imc
imc.1<-imc[1:35];imc.1
imc.2<-imc[-(1:35)]; imc.2
imc.3<-imc[100:200]; imc.3
imc.4<-imc[c(2,19,75,127,225,299)];imc.4

##Quin valor hi ha a la posició 37 de imc?
imc[37]

#(b)
notes.parcials<-NOTES[[3]]; notes.parcials
class(notes.parcials)

parcial.1<-notes.parcials[,1];parcial.1
alumne.3<-notes.parcials[3,];alumne.3
##Nota alumne 5 al 3ºparcial
notes.parcials[5,3]

#(c)
data("mtcars")
df.cotxes<-data.frame(mtcars); df.cotxes

##Què significa la variable cyl?

##Quants carburadors té el cotxe en 10º posició?
df.cotxes$carb[10]

df.cotxes.0<-df.cotxes[names(df.cotxes)!="hp" & names(df.cotxes)!="wt"]; df.cotxes.0
names(df.cotxes.0)


df.cotxes$identificador<-paste("cotxe", 1:nrow(df.cotxes),sep="."); df.cotxes

df.cotxes[nrow(df.cotxes)+1,]<-df.cotxes[25,]
rownames(df.cotxes)
rownames(df.cotxes.0)
rownames(df.cotxes)<-c(rownames(df.cotxes.0),"Datsun 710.0")
df.cotxes["identificador"][nrow(df.cotxes),1]<-paste("coxte",nrow(df.cotxes),sep=".")
df.cotxes

df.cotxes[25,];df.cotxes[33,]

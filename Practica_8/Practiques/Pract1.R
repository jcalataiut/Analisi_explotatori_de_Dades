gss<-read.csv("gss93_reducido.csv",header=T,sep=",",dec=","); head(gss)
attach(gss)

##APARTAT 1

taula<-table(sexo,ecivil)
taula.perc<-round(prop.table(taula)*100,2)

cond.sex<-round(prop.table(taula,1)*100,2) #distribució condicional per files
cond.ecivil<-round(prop.table(taula,2)*100,2) #distribució condicional per columnes

#Quin percentatge de la mostra són dones divorciades? 
taula.perc["Mujer","Divorciado"]
#Quin percentatge de vidus són homes?
cond.ecivil["Hombre","Viudo"]
#Quin percentatge de dones só́n solteres?
cond.sex["Mujer","Viudo"]

##APARTAT 2

taula2<-table(museos,telenov); taula2 #distribució de freq. absolutes
addmargins(taula2)
taula2.perc<-round(prop.table(taula2)*100,2); taula2.perc #distribució conjunta amb percentatges
addmargins(taula2.perc)

cond.museos<-round(prop.table(taula2.perc,1)*100,2); cond.museos
cond.telenov<-round(prop.table(taula2.perc,2)*100,2);cond.telenov

#Quin percentatge de la mostra va a museus i veu telenoveles rarament?
taula2.perc["Sí","Raramente"]
#Quin percentatge dels que no van a museus veuen diariament telenoveles?
cond.museos["No","Diariamente"]
#Quin percentatge dels que mai veuen telenoveles van a museus?
cond.telenov["Sí","Nunca"]
#Et semblen associades (relacionades) les 2 variables? Raona la resposta.
## Sí, perquè del contrari si no estigueren relacionades el comportament de la variabe
## telenov seria el mateix per a les persones que van als museus que per als que no van.
## Identicament, si no estigueren relacionades el comportament de la varaible museus seria 
## el mateix independenment de la freqüència en la que es veuem telenoveles.






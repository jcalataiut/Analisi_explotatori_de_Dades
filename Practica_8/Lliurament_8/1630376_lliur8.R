
#Apartat (a)

micro<-read.csv("microdatos.csv",sep=";"); head(micro) 
str(micro)

class(micro$C_ESTUDIOS)
micro$C_ESTUDIOS<-factor(micro$C_ESTUDIOS,levels=c(1,2,3),labels=c("Obligatoris","Post-Obligatoris","Superiors"))

class(micro$C_HABITAT)
micro$C_HABITAT<-factor(micro$C_HABITAT,levels=c(1,2,3),labels=c("Poble","Ciutat mitjana","Ciutat gran"))

attach(micro)
taula<-table(C_HABITAT,C_ESTUDIOS);taula
taula<-round(prop.table(taula)*100,3); taula
taula.perc<-addmargins(taula); taula.perc

##Quin percentatge de la mostra viuen en una gran ciutat (un milió d’habitants o més)?
taula.perc["Ciutat gran","Sum"]

##Quin percentatge de la mostra representa els que tenen estudis postobligatoris?
taula.perc["Sum","Post-Obligatoris"]

##Quin percentatge són residents en grans ciutats i tenen estudis superiors?
taula.perc["Ciutat gran","Superiors"]

##Quin percentatge viuen en un poble o ciutat de menys de 10000 habitants i el seu nivell d’estudis és fins a secundaris obligatoris?
taula.perc["Poble","Obligatoris"]

detach(micro)

#Apartat (b)

micro$C_CLASESOCIAL<-factor(micro$C_CLASESOCIAL,levels=c(1,2,3),labels=c("Alta y Media Alta","Media","Media Baja y Baja"))

attach(micro)
taula1<-table(C_CLASESOCIAL,C_ESTUDIOS); taula1
taula1.cond_f<-addmargins(round(prop.table(taula1,margin=1)*100,2),2); taula1.cond_f
taula1.cond_c<-addmargins(round(prop.table(taula1,margin=2)*100,2),1); taula1.cond_c

## Quin és el nivell d’estudis més freqüent entre els enquestats de classe Alta o Media Alta?
print("El nivell d'estudis més freqüent entre els enquestats de la classe Alta_y_Media_Alta és estudis Superios")

##I entre els de classe Baja o Media Baja?
print("El nivell d'estudis més freqüent entre els enquestats de la classe Baja_o_Media_Baja és estudis Obligatiris")

##Entre els joves amb estudis superiors,quants són de classe mitjana (en percentatges)?
taula1.cond_c["Media","Superiors"]

##Diries que les dues variables són independents?
contingencia<-chisq.test(C_CLASESOCIAL,C_ESTUDIOS)
contingencia$p.value # Un p-valor petit (<0.05) indica que les variables son dependents. En aquest cas, les variables són dependents

##Fes una representació gràfica de la distribució conjunta de les dues variables.
palette(hcl.colors(5,"Purples"))
barplot(t(taula1),main="Distribució conjunta C_CLASESOCIAL-C_ESTUDIS",col=4:2)
legend(2.5,635,c("Obligatoris","Post-Obligatoris","Superiors"),fill=4:2)

detach(micro)

# Apartat (c)

micro$C_SEXO<-factor(micro$C_SEXO,levels=c(1,2),labels=c("Dones","Homes"))
micro$C_EDAD_REC<-factor(micro$C_EDAD_REC,levels=c(1,2,3),labels=c("15-19_anys","20-24_anys","25-29_anys"))

attach(micro)
taula2<-table(C_SEXO,C_EDAD_REC);taula2
taula2.perc<-round(prop.table(taula2)*100,2);taula2.perc
detach(micro)
##Del total de la mostra, quin percentatge representen els homes de 20 a 24 anys?
taula2.perc["Homes","20-24_anys"]

##Quin SEXE dóna més importància a tenir parella? (variableP26)? 
micro$P26<-factor(micro$P26,levels=c(1:5,9), labels=c("Mucho","Bastante","Regular","Poco","Nada","NS/NC"))

attach(micro)
taula3<-table(C_SEXO,P26); taula3
taula3.cond_c<-round(addmargins(prop.table(taula3,margin=2)*100,1),2); taula3.cond_c
taula3.cond_f<-round(addmargins(prop.table(taula3,margin=1)*100,2),2); taula3.cond_f

print("El sexe que més importància dóna a tenir parella són els homes perque dels enquestats, els 54.41% dels que li donen molta importància a tenir parella són els homes")

##Quin percentatge de les dones creu que és molt o bastant important tenir-ne? 
taula3.cond_f["Dones","Mucho"]+taula3.cond_f["Dones","Bastante"]
##I entre els homes?
taula3.cond_f["Homes","Mucho"]+taula3.cond_f["Homes","Bastante"]

detach(micro)

micro$P27<-factor(micro$P27,levels=c(1:5,9),labels=c("Tradicional","Poliamor","Puntals","No relació","Otras","NS/NC"))

attach(micro)
taula4<-table(P27,C_EDAD_REC,C_SEXO);taula4
taula4.cond_f<-round(prop.table(taula4,margin=1)*100,2); taula4.cond_f
taula4.cond_f.total<-addmargins(taula4.cond_f); taula4.cond_f.total

##D’entre els que es decanten per les parelles obertes (poliamor) quin percentatge tenen entre 25 i 29 anys?
taula4.cond_f.total["Poliamor","25-29_anys","Sum"]

##Quin percentatge són dones i quin homes?
taula4.cond_f.total["Poliamor","25-29_anys","Dones"]
taula4.cond_f.total["Poliamor","25-29_anys","Homes"]

detach(micro)

##Entre les afirmacions de les preguntes P31 a P41, 
##amb quina estan més d’acord les noies (grau 7, 8,9 o 10)? I els nois? 
##Amb quina estan més en desacord les noies (graus 0,1,2,3)? I els nois? 

acord<-function(x){
  y<-x[!is.na(x)]
  num.contes<-length(y)
  z<-y[y>=7 & y<=10]
  num.contes_7<-length(z)
  return(round(num.contes_7/num.contes*100,2))
}

desacord<-function(x){
  y<-x[!is.na(x)]
  num.contes<-length(y)
  z<-y[y>=0 & y<=3]
  num.contes_0<-length(z)
  return(round(num.contes_0/num.contes*100,2))
}



micro_noies.31_41<-subset(micro,C_SEXO=="Dones",c("P28x41_31","P28x41_32","P28x41_33","P28x41_34","P28x41_35",
                                            "P28x41_36","P28x41_37","P28x41_38","P28x41_39","P28x41_40","P28x41_41")); head(micro_noies.31_41)

sapply(micro_noies.31_41,acord)
sapply(micro_noies.31_41,desacord)
###En funció de les dades, les preguntes amb les que les 
### noies estàn més d'acord són: P38, P39, P41 on el percentatge 
### de noies més d'acord en realició al total d'enquestades oscila entre el 26% aprox.
### Per altra banda, estàn més desacord amb les preguntes: P32,P33,P34; on més del 70%
### de les noies han enquestades estàn en desacord amb eixes preguntes

micro_nois.31_41<-subset(micro,C_SEXO=="Homes",c("P28x41_31","P28x41_32","P28x41_33","P28x41_34","P28x41_35",
                                                 "P28x41_36","P28x41_37","P28x41_38","P28x41_39","P28x41_40","P28x41_41")); head(micro_nois.31_41)
sapply(micro_nois.31_41,acord)
sapply(micro_nois.31_41,desacord)
###Estan més d'acord amb les preguntes: P38,P39,P40,P41, gairebé com les dones
###Estan mes en desacord amb les preguntes: P31,P32,P33,P34.

## Apartat (d)

micro$P42x47_42<-factor(micro$P42x47_42,levels=c(1,2,3,4,9),labels=c("Molt desacord","Desacord","Acord","Molt acord","NS/NC")); head(micro["P42x47_42"])
micro$P53<-factor(micro$P53,levels=c(1,2,3,4,5,6,9),labels=c("Molt grans","Grans","Regular","Petites","Molt petites","No existe","NS/NC")); head(micro["P53"])

attach(micro)
taula5<-table(C_EDAD_REC,P42x47_42);taula5
taula5.cond_edat<-round(prop.table(t(taula5),margin=2)*100,2); taula5.cond_edat

taula5_P53<-table(P53,C_EDAD_REC);taula5_P53
taula5_P53.cond_edat<-round(prop.table(taula5_P53,margin=2)*100,2); taula5_P53.cond_edat

### Fet amb la P42 (però cre que hi ha una errata i deuria de ser la P53)
palette(hcl.colors(5,"Temps"))
x<-barplot(taula5.cond_edat,main=c("Opinió desigualtat homes-dones entre joves \n condicionada a edat"), xlim=c(0,5), col=1:5)
legend(3.8,100,legend=levels(P42x47_42),fill=1:5,cex=0.8)

etiquetesx<-rep(x,each=5)
etiquetesy<-as.vector(apply(taula5.cond_edat,2,function(x) cumsum(x)-x/2))
etiquetes<-paste(round(taula5.cond_edat),"%",sep="")
text(etiquetesx,etiquetesy,etiquetes,cex=0.7)

###Fet amb la P53 (que és la que sí correspon a la desigualtat entre H-D en els joves)
palette("default")
x<-barplot(taula5_P53.cond_edat,main=c("Opinió desigualtat homes-dones entre joves \n condicionada a edat"), xlim=c(0,5), col=rainbow(7)[2:9])
legend(3.8,100,legend=levels(P53),fill=rainbow(7)[2:9],cex=0.8)

etiquetesx<-rep(x,each=7)
etiquetesy<-as.vector(apply(taula5_P53.cond_edat,2,function(x) cumsum(x)-x/2))
etiquetes<-paste(round(taula5_P53.cond_edat),"%",sep="")
text(etiquetesx,etiquetesy,etiquetes,cex=0.5)

detach(micro)

## Apartat (e)

### Dependència de les variables P53 i C_ESTUDIOS
attach(micro)
contingencia<-chisq.test(P53,C_ESTUDIOS)
contingencia$observed
contingencia$expected
contingencia$p.value
#### Com que el p-valor es més petit que 0.05 açò ens confirma una dependència entre les variables 
palette(hcl.colors(3,"Purples"))
barplot(prop.table(t(contingencia$observed),margin=2)*100, col=1:3,xlim=c(0,11),
        main="Estudis en funcio l'opinió sobre la desigualtat \n entre homes i dones en els jovens")
legend(8.5,100,legend=levels(C_ESTUDIOS),fill=1:3,cex=0.8)

#### La gràfica ens confirma l'afirmació concluïda amb el resultat del p-valor
#### No hi ha dependència, perque en el cas d' hi haure totes les barres dels barplot 
#### deurien ser igual, ie, que la proporció de Estudis en cada una de les contestacións de la desigualtat
#### deuria de ser la mateix.
palette("default")
detach(micro)

## Apartat (f)

micro$P69<-factor(micro$P69,levels=c(1,2,9),labels=c("SI","NO","NS/NC"))

attach(micro)
contingencia.sex_p69<-chisq.test(C_SEXO,P69)
contingencia.sex_p69$observed
contingencia.sex_p69$expected
contingencia.sex_p69$p.value


mosaicplot(contingencia.sex_p69$observed,col=rainbow(3),las=1,off=8,main="Mosaic de les variables \n assetjament i sexe")

#### Apreciem que el p-value es major que 0.2>0.05 i llavors no podem concloure que hi ha dependència entre les variables
#### a més, veiem la representació gràfica podem dir que són varibles amb un cert grau de indepència 
#### encara que s'aprecien diferències, com que entre els que sí han ejercit algún tipus d'assatjamet, la proporció d'homes es major
#### però no hi han grans diferències i per això podem considerarles independents (segons les dades d'aquesta mostra)







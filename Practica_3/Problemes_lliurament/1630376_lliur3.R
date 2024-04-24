#1630376

ls()

#PROBLEMA 1

Llista<-list(matriu_num=mdades,matriu_char=mdades2,array4.4=AAAA); Llista
ob1_m1<-Llista[[1]]; ob1_m1
class(ob1_m1)
ob1_m2<-Llista$matriu_num; ob1_m2
class(ob1_m2)

subLlista<-Llista[2]; subLlista

#PROBLEMA 2

gedat<-cut(edat, breaks=c(min(edat),20,30,max(edat)),labels=c("<20", "20-29","30o+"),rigth=FALSE, include.lowest=T); gedat
comprovacio<-data.frame(edat=edat, interval=gedat); comprovacio

#PROBLEMA 3

dfdades<-data.frame(identif=id2,sexe=sexe,ind_llar=n.individus.llar, m2.llar=m2.llar, tv=tv); dfdades
dfdades$edat<-gedat;dfdades

dfdades$m2.per.hab<-m2.llar/n.individus.llar; dfdades

df.interes<-dfdades[names(dfdades)=="edat"| names(dfdades)=="m2.llar"]; df.interes #aquesta forma es millor que la següent
df.interes<-dfdades[,c(4,6)];df.interes

#PROBLEMA 4

library(MASS)
data("whiteside")
ws<-data.frame(whiteside); ws
f_ad<-factor(whiteside$Insul,levels=c("Before","After"), labels=c("Abans","Després")); f_ad
ws$Insul<-f_ad
ws

#PROBLEMA 5

##(a)
data("airquality")
mes<-factor(airquality[,5], levels=5:9, labels=c("Maig","Juny","Juliol","Agost","Setembre"))
airquality[,5]<-mes
colnames(airquality)[5]<-"Mes"; airquality

##(b) està millor escrit que el de dalt perquè no depend del nombres, només de els noms que donen a l'enunciat
wind<-airquality["Wind"][,1]; wind
Ventkm<-data.frame(Ventkm=wind*1.61)
airquality["Wind"]<-Ventkm 
colnames(airquality)[colnames(airquality)=="Wind"]<-"Ventkm"; airquality

##(c)
NivellsRadiacio<-cut(airquality["Solar.R"][,1],breaks=c(0,130,250,350), right=FALSE, labels=c("baix", "mitjà", "alt"), include.lowest=TRUE); NivellsRadiacio
airquality["Solar.R"]<-NivellsRadiacio
colnames(airquality)[colnames(airquality)=="Solar.R"]<-"NivellsRadiacio"; airquality

##(d)
ozone<-airquality["Ozone"][,1]
n<-length(ozone)
mitjana<-sum(ozone, na.rm=TRUE)/(n-sum(is.na(ozone))); mitjana
dt<-sqrt((sum(ozone**2, na.rm=TRUE))/(n-sum(is.na(ozone)))-mitjana**2); dt
dmitj<-sum(abs(ozone-mitjana), na.rm=TRUE)/(n-sum(is.na(ozone))); dmitj





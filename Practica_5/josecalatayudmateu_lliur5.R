
#PROBLEMA 1

df.enq<-read.csv("ExerPr1Enq.csv",sep=";",dec=","); head(df.enq)

mean.alt<-mean(df.enq$Alt); mean.alt
sd.alt<-sd(df.enq$Alt);sd.alt
R.alt<-max(df.enq$Alt)-min(df.enq$Alt); R.alt
Q<-quantile(df.enq$Alt,probs=seq(0.25,0.75,0.25)); Q

hist(df.enq$Alt,xlab="Altura",ylim=c(0,500),main="")
title("Histograma Altura",cex=2)

df.joves<-df.enq[df.enq$Edat>=18 & df.enq$Edat<=23,]; head(df.joves)
attach(df.joves)
table(Edat)
df.joves.edat<-as.data.frame(table(Edat)); df.joves.edat
detach(df.joves)
ni<-df.joves.edat$Freq
n<-sum(ni)
fi<-ni/n
pi<-round(fi*100,1)
Ni<-cumsum(ni)
Pi<-round(cumsum(pi),1)
df.joves.edat<-data.frame(df.joves.edat,Ni,pi,Pi); df.joves.edat
colnames(df.joves.edat)[2]<-"ni"
df.joves.edat


#PROBLEMA 2
install.packages("ggplot2")
library(ggplot2)
search()
df.dia<-read.csv("diamonds.csv",sep=",",dec=".")

##noms de les variables
names(df.dia)
##tipus de cada variable
summary(df.dia)
#veiem que les variables 'carat','depth','table','price','x','y','z' son numèriques
#encanvi les variables 'cut','color'i 'clarity' 

head(df.dia)
#mida de l'arxiu
dim(df.dia)
#nombre de variables
ncol(df.dia)
#nombre de diamants estudiats
nrow(df.dia)

mean.dep<-mean(df.dia$depth)
sd.dep<-sd(df.dia$depth)
Q<-quantile(df.dia$depth,probs=seq(0.25,0.75,by=0.25))
#Rang interquartíl·lic
RI<-Q[3]-Q[1]; names(RI)<-"RI"; RI
#Coeficient de variació
CV<-sd.dep/mean.dep; CV

#Gràfica carat.
hist(df.dia$carat,main="Histograma carat. diamants",xlab="",ylab="",col="red",xlim=c(0,5),ylim=c(0,20000))
axis(side=1,seq(0,5,by=0.5),labels=F)
axis(side=2,seq(0,20000,5000),labels=seq(0,20000,5000))
mtext("Carat.",side=1,line=2,cex=0.8)
mtext("Frequency",side=2, line=3,cex=0.8)

#Gràfica cut
cut<-as.ordered(df.dia$cut);cut
cut<-factor(cut,levels=levels(cut),labels=c("Fair","Good","Very Good","Ideal","Premium"))
pie(table(cut),main="Diagrama de sectors de la variable 'cut'",size=c(10,1),radius=2)
barplot(table(cut),main="Diagrama de barres",col=2:7)

#PROBLEMA 3

set.seed(100)
mostra<-sample(1:20,200,replace=T)
table(mostra)
df.mostra<-as.data.frame(table(mostra));df.mostra
ni<-df.mostra$Freq
n<-sum(ni)
fi<-ni/n
pi<-round(fi*100,digits=1)
Ni<-cumsum(ni)
Pi<-round(cumsum(pi),1)
df.mostra<-data.frame(df.mostra,pi,Ni,Pi)
colnames(df.mostra)[colnames(df.mostra)=="Freq"]<-"ni"
df.mostra
#A partir de la taula s'observa que Q1=P25=7, Md=P50=11,
#Q3=P75=16, P90=19
Q<-quantile(mostra,probs=c(0.25,0.5,0.75,0.9)); Q

#PROBLEMA 4
attach(df.dia)
X.mean<-mean(price); X.mean
TRUE %in% is.na(price)
var_nc<-sum((price-X.mean)^2)/length(price); var_nc
sd_nc<-sqrt(var_nc); sd_nc

n<-length(price)
var_nc_teoric<-(n-1)*var(price)/n;var_nc_teoric
##var_nc es igual a var_nc_teoric
detach(df.dia)

#PROBLEMA 5

##(a)
dep<-df.dia$depth
n<-length(dep)
Q=quantile(dep,probs=c(0.1,0.9)); Q
dep<-sort(dep)
dep<-dep[-1:0.1*n] #acabe de llevar els 10% mes petits
dep<--dep
dep<-sort(dep)
dep<-dep[-(1:(0.1*n))]
dep<--dep
mean.dep.80<-mean(dep); mean.dep.80
mean.dep.80_teoric<-mean(df.dia$depth,trim=0.10);mean.dep.80_teoric

##(b)
diam.J<-df.dia[df.dia$color=="J",]; head(diam.J)
diam.E<-df.dia[df.dia$color=="E",]; head(diam.E)
summary(diam.J)
summary(diam.E)

###Comparació, la mitJ=5324 i mitE=3077, a més, el 50% de diamants es troben entre 1860-7695 per als de color J
###i entre 882-4002 els de color E. Per una altra banda, veiem que el 50% de diaments de color J
### son més cars que els 75% de diamants de color E perque 4003=Q3_E<P50_J=Md_J=4234

###Llavors, els diamants de color J son més cars i, a més, estàn més dispersos que els diamants de E, encara que aquets 
#últims tenen molts outliers. Comprovación amb funció boxplot:

##(c)
par(mfrow=c(1,2))
boxplot(diam.J$price, main="Boxplot diamants color=J")
boxplot(diam.E$price, main="Boxplot diamants color=E")
par(mfrow=c(1,1))

##(d)
hist(df.dia$price)
###Fent el histograma comprovem que la variable price NO es simètrica
###A més, es marcadament asimètrica positiva, ie, cap a la dreta

##(e)
df.fair<-df.dia[df.dia$cut=="Fair",]; head(df.fair)
mean.fair<-mean(df.fair$price); mean.fair
Q.fair<-quantile(df.fair$price); Q.fair

df.premium<-df.dia[df.dia$cut=="Premium",]
mean.premium<-mean(df.premium$price); mean.premium
Q.premium<-quantile(df.premium$price); Q.premium

###No hi han gairebé diferencies

#PROBLEMA 6

##(a)

df.enq<-read.csv("ExerPr1Enq.csv",sep=";",dec=","); head(df.enq)
attach(df.enq)
gedat<-cut(Edat,breaks=c(min(Edat),18,20,max(Edat)),right=FALSE,include.lowest=TRUE);gedat
detach(df.enq)
df.enq["Edat"]<-gedat
head(df.enq)

##(b)
### Entenc que el que demana és canviar en la variable edat de df.enq l'edat
### de l'individu 10 per a que li corresponga 28 anys. Com que en l'anterior em fet
### una recodificació dels valores de la variable edat per tal de incluore'ls en intervals
### fem una copia de df.enq original en df.enq1 i canviem açí el seu valor 

df.enq1<-read.csv("ExerPr1Enq.csv",sep=";",dec=","); head(df.enq1)
df.enq1[10,"Edat"]<-28
df.enq1[10,]

###En cas de voler tornar-ho a posar en intervals només hi ha que executar els codi
### de l'exercici anterior sustituint df.enq per df.enq1


##(c)
library(carData)
library(car)
v.oci<-recode(df.enq$Oci,"1='TV';2='ordinador';3='MusLect';4='esport'")

##(d)
v.fumador<-recode(df.enq$Tabac,"1='F';0='NF'")

##(e)
ocifumador<-paste(v.oci,v.fumador,sep='.')
df.enq[length(df.enq)+1]<-ocifumador
head(df.enq)








##PUNT 1
PerTur17<-read.spss('Percepcio_Turisme_BCN_2017.sav', to.data.frame=TRUE,add.undeclared.levels = 'no'); 
head(PerTur17)

PerTur17D<-PerTur17[PerTur17$SEXE=="DONA",c('SEXE', 'EDAT', 'DISTRICTE', 'SECTOR_RIQUESA', 'ALLOTJA_TUR_NRE')]; head(PerTur17D)
PerTur17H<-PerTur17[PerTur17$SEXE=="HOME",c('SEXE', 'EDAT', 'DISTRICTE', 'SECTOR_RIQUESA', 'ALLOTJA_TUR_NRE')];tail(PerTur17H)

#(a)
###Dona
mean(PerTur17D$EDAT, na.rm=T)
sd(PerTur17D$EDAT, na.rm=T)
median(PerTur17D$EDAT, na.rm=T)
range(PerTur17D$EDAT, na.rm=T); (R<-range(PerTur17D$EDAT, na.rm=T)[2]-range(PerTur17D$EDAT, na.rm=T)[1])
quantile(PerTur17D$EDAT,seq=c(0,1,by=.25),na.rm=T)

###Home
mean(PerTur17H$EDAT, na.rm=T)
sd(PerTur17H$EDAT, na.rm=T)
median(PerTur17H$EDAT, na.rm=T)
range(PerTur17H$EDAT, na.rm=T); (R<-range(PerTur17H$EDAT, na.rm=T)[2]-range(PerTur17H$EDAT, na.rm=T)[1])
quantile(PerTur17H$EDAT,seq=c(0,1,by=.25),na.rm=T)

#(b)
summary(PerTur17H)
summary(PerTur17D)

#(c)
x<-mean(PerTur17D$ALLOTJA_TUR_NRE,na.rm=T)
y<-mean(PerTur17H$ALLOTJA_TUR_NRE,na.rm=T)
f<-"En l’enquesta sobre la percepció del turisme al 2017, entre els ve ̈ıns que van allotjar algun turista a casa les dones en van allotjar una mitjana de"
frase<-paste(f,round(x,digits=1),"i els homes de ",round(y,digits=1)); frase

##PUNT 2
DESPESA<-matrix(sample(seq(6,200,.01),12*15),nrow=15,ncol=12)
rownames(DESPESA)<-paste("Alumne",1:15,sep=".")
colnames(DESPESA)<-month.abb
DESPESA

#(a)
###Despesa del total de l'any per alumne
round(rowSums(DESPESA),digits=2)
###Despesa mitjana per mes 
round(rowMeans(DESPESA),digits=2)

#(b)
###Despesa total mensual
round(colSums(DESPESA),digits=2)
###Despesa mitjana per cada mes
round(colMeans(DESPESA),2)

#(c)
summary(DESPESA)
summary(t(DESPESA)) #la funció t() és per fer la trasposta






PerTur17<-read.spss('Percepcio_Turisme_BCN_2017.sav', to.data.frame=TRUE,add.undeclared.levels = 'no'); 
head(PerTur17)

##(a)
#TUR_BENEF
pie(table(PerTur17$TUR_BENEF))
barplot(table(PerTur17$TUR_BENEF))

#SEXE
pie(table(PerTur17$SEXE))
barplot(table(PerTur17$SEXE))

#EDAT
hist(PerTur17$EDAT)
boxplot(PerTur17$EDAT)

##(b)
CV<-PerTur17[PerTur17$DISTRICTE=="CIUTAT VELLA",]
SA<-PerTur17[PerTur17$DISTRICTE=="SANT ANDREU",]
op<-par(mfrow=c(1,2))
barplot(table(CV$TUR_BENEF))
barplot(table(SA$TUR_BENEF))
par(op)
### no s'observen diferencies aparentment

##(c)
joves<-PerTur17[PerTur17$EDAT<30,]
grans<-PerTur17[PerTur17$EDAT>65,]
op<-par(mfrow=c(1,2), cex=0.3)
barplot(table(joves$TUR_BENEF),ylim=c(0,1000))
title("JOVES")
barplot(table(grans$TUR_BENEF), ylim=c(0,1000))
title("GRANS")
par(op)









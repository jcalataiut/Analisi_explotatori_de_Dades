library(foreign)
PerTur17<-read.spss('Percepcio_Turisme_BCN_2017.sav', to.data.frame=TRUE,add.undeclared.levels = 'no'); 


##SECTOR_RIQUESA
attach(PerTur17)
table(SECTOR_RIQUESA)
df.sr<-as.data.frame(table(SECTOR_RIQUESA)); df.sr
detach(PerTur17)
(n<-sum(df.sr$Freq))
pci<-df.sr$Freq*100/n
df.sr<-data.frame(df.sr,pci); df.sr

#COMP_TUR
attach(PerTur17)
table(COMP_TUR)
df.ct<-as.data.frame(table(COMP_TUR)); df.ct
detach(PerTur17)
(m<-sum(df.ct$Freq))
pci<-df.ct$Freq*100/m
df.ct<-data.frame(df.ct,pci); df.ct

#No té sentit fer els càlculs de les freq. acumulades en els dos casos
#Però, si que es pot establir un relacion ordinal amb la variable COMP_TUR
#perque es pot ordenar de "molt dolent" a "molt bo", deixant de banda les 
#contestacions de "no ho sap" o "no contesta".










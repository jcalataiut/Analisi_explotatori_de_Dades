PerTur17<-read.spss('Percepcio_Turisme_BCN_2017.sav', to.data.frame=TRUE); 
head(PerTur17)

##Quantes enquestes conté el fitxer?
nrow(PerTur17)

PerTur17_b<-read.spss('Percepcio_Turisme_BCN_2017.sav', to.data.frame=TRUE,add.undeclared.levels = "no"); 
head(PerTur17_b)

###Per a "no" en l'argument add.undeclared.levels, açò no ho conveteix en factor en cas
### de numeric SPSS levels (no labels), i continua convertint en factor si els 
### SPSS levels estàn en caracters i to.data.frame=TRUE




#(a)

##El data.frame Cardio.Train l'agafem de la Pract1
quant<-quantile(Cardio.Train$age.years); quant
age.cat<-cut(Cardio.Train$age.years,breaks=quant,right = FALSE, include.lowest = T); age.cat
Cardio.Train[,length(Cardio.Train)+1]<-age.cat
colnames(Cardio.Train)[length(Cardio.Train)]<-"age.cat"
head(Cardio.Train)

#(b)
attach(Cardio.Train)
describeBy(height,gender)
describeBy(weight,gender)

describeBy(height,age.cat)
describeBy(weight,age.cat)

###En vista de les dades, el factor que més imflueix en l'alçada 
### i el pes és el SEXE.
detach(Cardio.Train)
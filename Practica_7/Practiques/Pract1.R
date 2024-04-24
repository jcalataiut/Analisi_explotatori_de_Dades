##(a)
Cardio.Train<-read.csv("aux_Cardio_Train.csv",sep=";",dec="."); head(Cardio.Train)

##(b)
#nombre de variables
ncol(Cardio.Train)
#nombre de casos
nrow(Cardio.Train)
#Anàlogament
dim(Cardio.Train)

##(c)
sapply(Cardio.Train,class)
str(Cardio.Train) #aquesta instrucció resumeix molt bé el contigut del data.frame importat
summary(Cardio.Train)

##(d)
Cardio.Train[,c("gender","cholesterol","gluc","smoke","alco","active","cardio")]<-lapply(Cardio.Train[,c("gender","cholesterol","gluc","smoke","alco","active","cardio")],as.factor)
summary(Cardio.Train)

##(e)
age.years<-trunc(Cardio.Train$age/365)
Cardio.Train[,ncol(Cardio.Train)+1]<-age.years
colnames(Cardio.Train)[length(Cardio.Train)]<-"age.years"
head(Cardio.Train)

##(f)
summary(Cardio.Train)
describe(Cardio.Train)





x1<-c(9,4,8,2,1,7,8,10,1)
x2<-c(5,8,8,0,4,5,5,8,4)
x3<-c("A","B","B","B","A","A","A","B","B")
df1<-data.frame(alg=x1,cal=x2,grup=x3)
length(df1[[1]])
length(df1$alg)
range(df1$alg)

sort(df1$alg)
median(df1$alg)
rowMeans(df1[,-3])
summary(df1)
df1$grup<-factor(df1$grup)
table(df1$grup)
table(df1$cal)
df.cal<-as.data.frame(table(df1$cal))
plot(ecdf(df1$cal))

x<-c(rep(8,10),rep(18,15),rep(22,20),rep(32,50),rep(105/2,40),rep(165/2,20))
hist(x,breaks = c(0,16,20,24,40,65,100),ylim=c(0,0.1))
enquesta<-read.csv("necessaris/barometroCIS19.csv")
enquesta$P1901[enquesta$P1901==98 | enquesta$P1901==99]<- NA
summary(factor(enquesta$P1901))

library(foreign)
PerTur17<-read.spss("Percepcio_Turisme_BCN_2017.sav")
PerTur17<-data.frame(PerTur17)
write.csv(PerTur17,file="Percepcio_Turisme_BCN_2017.csv",row.names=FALSE)
Per2<-read.csv("Percepcio_Turisme_BCN_2017.csv")
write.csv(enquesta,file="barometroCIS19.csv",row.names=FALSE)
write.csv(mundo,file="mundo.csv",row.names=FALSE)
mon<-read.csv("mundo.csv")
summary(mon)
summary(mundo)
write.csv(df.interes,file="interes.csv",row.names=FALSE)


library(ggplot2)
diamonds<-read.csv("diamonds.csv")
names(diamonds)
str(diamonds)
diamonds$cut<-factor(diamonds$cut)
diamonds$clarity<-factor(diamonds$clarity)
summary(diamonds)
quantile

set.seed(100)   
mostra<-sample(1:20,200,replace=T)
taula<-data.frame(table(mostra))
taula$pi<-taula$Freq*100/sum(taula$Freq)
taula$Pi<-cumsum(taula$pi)
taula
quantile(mostra,probs=c(.25,.5,.75,.10,.9,.2,.3),type=2)
taula
mm<-mean(diamonds$price,trim=0.1)
mm
mean(diamonds$price)
boxplot(diamonds$price~diamonds$color)
by(diamonds$price,diamonds$color,mean)
mean(diamonds$depth,trim=0.1)
quantils<-quantile(diamonds$depth,probs=c(0.1,0.9), type=2)
mean(diamonds$depth[diamonds$depth>  quantils[1] & diamonds$depth < quantils[2]])

nrow(diamonds)-0.1*nrow(diamonds)
dim(diamonds)
nrow(diamonds)*.1
mean(sort(diamonds$depth)[5395:48546])
str(diamonds)

dades<-read.csv2("necessaris/ExerPr1Enq.csv")
summary(dades)
boxplot(dades$Edat)
dades[8,]
dades$gedat<- "18-20"
dades$gedat[dades$Edat<18]<-"menys de 18"
dades$gedat[dades$Edat>20]<- "mes de 20"
dades[10,]
dades$OciFumador<-"TV.NF"
dades$OciFumador[dades$Oci==1& dades$Tabac==1]<-"TV.F"

Fumador<-rep("NF",nrow(dades))
Fumador[dades$Tabac==0]<-"NF"
Oci<-rep("TV",nrow(dades))
Oci[dades$Oci==2]<-"ordinador"
Oci[dades$Oci==3]<-"MusLect"
Oci[dades$Oci==4]<-"esport"
dades$OciFumador<-paste(Oci,Fumador,sep=".")

x<-sample(1:10,200,replace=TRUE)
aa<-table(x)/sum(table(x))*100
cumsum(aa)

x<-sample(1:8,200,replace=TRUE)
aa<-table(x)/sum(table(x))*100
cumsum(aa)
aa

x2<-sample(1:6,200,replace=TRUE)
aa<-table(x2)/sum(table(x))*100
cumsum(aa)
aa
quantile(x2,probs=c(.16,.25,.63),type=2)

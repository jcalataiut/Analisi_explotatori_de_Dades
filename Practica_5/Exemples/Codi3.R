edat<-c(10,20,32,15,3,160,200,44)
edat[edat>130]<-NA
edat

enquesta<-read.csv("barometroCIS19.csv",header=T, sep=",",na.strings=c("NA","-  ")); head(enquesta)
summary(enquesta$P1901)
enquesta$P1901[enquesta$P1901==98 | enquesta$P1901==99]<-NA
summary(enquesta$P1901)

x<- c(1:4,99,99,NA,-1,-2,-99); x
y<-numeric(length(x)); y
y[is.na(x)]<-0; y
y[!is.na(x)]<- -x[!is.na(x)]
y
y[x==99 | x==-99]<-NA
x;y

x<-sample(letters[1:6],20,rep=T)
length(x)
X<-numeric(length(x))
X[x=='a'|x=='b']<-1
X[x=='c'|x=='d']<-2
X[x=='e'|x=='f']<-3
x;X

x<-c("dona","home","home","dona","home","dona","dona")
(x.cod<-ifelse(x=="dona",1,2))
y<-sample(0:10,20,replace=T)
(y.cod<-ifelse(y>=5,"Aprovat","Suspès"))

install.packages("car")
library(carData)
library(car)
respostes<-sample(1:10,100,replace=T)
respostes.factor<-recode(respostes,"1:4='desacord';5='indiferent';6:10='acord'", as.factor=T); respostes.factor













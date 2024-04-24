data(mtcars)
?mtcars
dim(mtcars)
head(mtcars)
sapply(mtcars,class)
summary(mtcars)

class(mtcars$cyl)
mtcars$cyl<-as.factor(mtcars$cyl)
class(mtcars$cyl)
mtcars[,c("cyl","vs","am","gear","carb")]<-lapply(mtcars[,c("cyl","vs","am","gear","carb")],as.factor)
summary(mtcars)

attach(mtcars)
summary(data.frame(mpg,disp,hp,drat,wt,qsec))
install.packages("psych")
library(psych)
search()
describe(data.frame(mpg,disp,hp,drat,wt,qsec))

resum<-function(x){
  tipus<-class(x)
  valors.perduts<-sum(is.na(x))
  quartils<-quantile(x)
  minim<-quartils[1]
  maxim<-quartils[5]
  q1<-quartils[2]
  Md<-quartils[3]
  q3<-quartils[4]
  rang<-max(x)-min(x)
  R.I<- q3-q1
  mitjana<-mean(x)
  desv<-sqrt(mean((x-mean(x))^2))
  desv.med<-mean(abs(x-median(x)))
  CV<-desv/mitjana
  alpha.sim<-((q3-Md)-(Md-q1))/R.I
  mu4<-mean((x-mean(x))^4)
  Kurtosis<-mu4/(desv^4)
  llista<-list(min=minim,Q1=q1,mediana=Md,mitjana=mitjana,
               Q3=q3,max=maxim,rang=rang,R.I=R.I,desv=desv,desv.med=desv.med,
               CV=CV,alpha=alpha.sim,curtosi=Kurtosis,NAs=valors.perduts)
  lapply(llista,round,2)
}

mtcars.num<-data.frame(mpg,disp,hp,drat,wt,qsec)
t(sapply(mtcars.num,resum))




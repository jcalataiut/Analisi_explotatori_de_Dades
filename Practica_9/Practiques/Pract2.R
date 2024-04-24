# APARTAT 1

df.enq<-read.table("enq.txt",header=T); head(df.enq)

attach(df.enq)
model.pes<-lm(Pes~Alt)
coef<-model.pes$coefficients; coef

pes.teor<-function(x){
  pes.estimat<-coef[1]+coef[2]*x
  names(pes.estimat)<-paste("Alt",x,sep="=")
  return(pes.estimat)
}

##Pes teòric per a l'altura 176cm
pes.teor(176)

##Coeficient de correlació
cor(Pes,Alt)
cor(Pes,Alt)^2 
plot(Pes~Alt)
abline(lm(Pes~Alt),col="red")
### com r^2<0.5 la relació lineal entre les dues varables
### no es bona, és positiva però feble
detach(df.enq)

#APARTAT 2
attach(df)
model.salari<-lm(salario~educ)
coef.sal_edu<-model.salari$coefficients

sal.teor<-function(x){
  sal.estimat<-coef.sal_edu[1]+coef.sal_edu[2]*x
  names(sal.estimat)<-paste("Educ",x,sep="=")
  return(sal.estimat)
}

## Estimació salari persona amb nivell educatiu de 13 anys
sal.teor(13)

##Coeficientes de la correlació
cor(salario,educ)
cor(salario,educ)^2
### La relació lineal es positiva pero feble 

detach(df)

#APARTAT 3
ans<-read.csv("AnscombeQuartet.csv",header=T,sep=",",dec="."); head(ans)
x<-paste("x",1:4,sep="")
y<-paste("y",1:4,sep="")

## Mitjanes X
sapply(ans[names(ans)[names(ans)%in%x]],mean)
## Desviacions X
round(sapply(ans[names(ans)[names(ans)%in%x]],sd),2)

## Mitjanes Y
round(sapply(ans[names(ans)[names(ans)%in%y]],mean),2)
## Desviacions Y
round(sapply(ans[names(ans)[names(ans)%in%y]],sd),2)

layout(matrix(1:4,nrow=2,byrow=T))
vector_cor<-c()
df_rectes<-data.frame()
for(i in seq(1,8,by=2)){
  p<-round(cor(ans[,i],ans[,i+1]),2)
  vector_cor<-c(vector_cor,p)
  model<-lm(ans[,i+1]~ans[,i])
  if(i==1){
    df_rectes<-data.frame(model$coefficients)
  } else{
    df_rectes[ncol(df_rectes)+1]<-data.frame(model$coefficients)
  }
  plot(ans[,i+1]~ans[,i],xlab="",ylab="",xlim=c(5,20),ylim=c(2,14),col="blue",pch=20)
  abline(lm(ans[,i+1]~ans[,i]),col="red")
} 
layout(1)

## Correlacions
names(vector_cor)<-paste("cor(",paste(paste("X",1:4,sep=""),paste("Y",1:4,sep=""),sep=","),")",sep="");
vector_cor

## Rectes de regressió
rownames(df_rectes)<-c("a","b")
colnames(df_rectes)<-paste(paste("Y",1:4,sep=""),paste("X",1:4,sep=""),sep="~")
df_rectes<-round(df_rectes,2); df_rectes
 







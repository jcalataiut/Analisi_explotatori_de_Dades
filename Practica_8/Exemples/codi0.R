gss<-read.csv("gss93_reducido.csv",header=T,sep=",",dec=","); head(gss)
attach(gss)
table(sexo,ecivil)
taula<-table(sexo,ecivil)
class(taula)
round(100*taula/sum(taula),1)
round(prop.table(taula)*100,1)

addmargins(taula)
margin.table(taula,1)
margin.table(taula,2)

cond.files<-prop.table(taula,1); cond.files
round(cond.files*100,2)
round(addmargins(cond.files*100,2),3)

cond.cols<-prop.table(taula,2)
round(addmargins(cond.cols*100,1),3)

taula<-table(sexo,ecivil)
taula/sum(taula)*100
taula2<-cbind(taula,apply(taula,1,sum));taula2
rbind(taula2,apply(taula2,2,sum))

apply(taula,1,sum)
apply(taula,2,sum)

t(apply(taula,1, function(x) x/sum(x)*100)) #distribució condicional per files
t(apply(taula,2,function(x) x/sum(x)*100)) #distribució condicional per columnes











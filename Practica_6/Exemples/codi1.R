f1<- function(x){
  x^2
}

f1(3)
f1(1:5)
x<-100
f1(6)
x #La x de la funció es una varaible local i 
#solapa a qualsevol varible amb el mateix nom definit forma de la funció

f2<-function(x,p){
  x^p
}

f2(2,10)
f2(5,2)
f2(1:5,3)

f3<-function(x){
  mitjana<-round(mean(x),2)
  mediana<-round(median(x),2)
  paste("mitjana=",mitjana,"mediana=",mediana)
}

f3(sample(1:6,10,replace=T))
DESPESA<-matrix(sample(seq(6,200,by=0.01),180,rep=T),15,12)
f3(DESPESA)
apply(DESPESA,2,f3)

potencia<-function(x,p=2){
  x^p
}

potencia(4,3)
potencia(p=5,x=2)
potencia(4)
f2(2)

resum<-function(x){
  mitj<-mean(x)
  desv<-sd(x)
  mi<-min(x)
  ma<-max(x)
  return(list(mitjana=mitj,desviació=desv,mínim=mi,màxim=ma))
}
resum(DESPESA)









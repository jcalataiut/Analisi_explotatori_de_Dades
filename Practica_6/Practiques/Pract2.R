f1<-function(x,y,z){
  sum(c(x^2,y^2,z^2))
}
f1(1,2,3)

f2<-function(x,w){
  mitj<-sum(x*w)/sum(w)
  paste("mitjana ponderada = ",mitj)
}

library(foreign)
PerTur17_sense_factors<-read.spss('Percepcio_Turisme_BCN_2017.sav', to.data.frame=TRUE,add.undeclared.levels = "no")

f3<-function(var,df=PerTur17_sense_factors){
  attach(df)
  if(class(var)=="factor") {var<-as.character(var)}
  if(class(var)!="character") {stop("Variable seleccionada no categòrica")}
  else
    df.var<-as.data.frame(table(var))
    ni<-df.var$Freq
    n<-sum(ni)
    fi<-ni/n
    pci<-fi*100
    Ni<-cumsum(ni)
    Fi<-Ni/n
    Pci<-Fi*100
    df.var<-data.frame(df.var,fi,pi,Ni,Fi,Pci)
    options(digits=2)
    detach(df)
    return(df.var)
}
f3(BARRI)

load("DESPESA.RData")
par(mfrow=c(3,5), cex=0.3)
apply(DESPESA,1,boxplot)
apply(DESPESA,2,boxplot)








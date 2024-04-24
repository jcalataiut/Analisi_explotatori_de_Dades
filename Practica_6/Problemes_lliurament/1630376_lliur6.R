
#PROBLEMA 1
##(a)
qa<-read.csv("QualitatAire.csv",header=T,sep=',',dec='.',na.strings = NA); head(qa)
manresa<-subset(qa,MUNICIPI=="Manresa" & CONTAMINANT=="NO2", select = names(qa)[names(qa)!="MUNICIPI" & names(qa)!="CONTAMINANT"]); head(manresa)

##(b)
sapply(manresa,class)

##(c)
mitjana<-mean(manresa$X21h,na.rm=TRUE); mitjana
quant<-quantile(manresa$X21h,na.rm=T); quant #mediana quantile 50%
Q1<-quant[2]; Q3<-quant[4]
RI<-Q3-Q1
names(RI)<-c("RI"); RI

##(d)
boxplot(manresa$X21h)
title(main="Medició de contaminació a les 21h",sub="Manresa")

##(e)
abline(h=Q3+1.5*RI,lty=2,col="grey")
abline(h=Q3+3*RI,lty=2,col="grey")

##(f)
mtext("Q1+1.5*RI",side=2,las=3,at=Q1+1.5*RI,cex=0.7, col='red')
mtext("Q3+3*RI",side=2,las=3,at=Q3+3*RI,cex=0.7, col='red')

##(g)
manresa$X21h[is.na(manresa$X21h)]<-0
out_severs<-manresa$X21h[manresa$X21h>(Q3+3*RI)]; out_severs #Només hi ha un outlier sever
data<-subset(manresa,X21h==151)$DATA; data
text(155,data,cex=0.7)

#PROBLEMA 2
desv_med<-function(x){
  dm<-mean(abs(x-median(x,na.rm=TRUE)),na.rm=TRUE)
  dm
}
lapply(subset(manresa,select=c("X01h","X02h","X03h","X04h","X05h"))[,1:5],desv_med)

#PROBLEMA 3
dtp<-function(xi,ni){
  if(any(is.na(xi))) {
    for(i in 1:length(xi)){
      if(xi[i]==NA){
        pos=i
        break
      }
    }
    x<-rep(xi[-pos],ni[-pos])
    vtp<-sum((x-mean(x))^2)/length(x)
    return(sqrt(vtp))
  } else {
    x<-rep(xi,ni)
    vtp<-sum((x-mean(x))^2)/sum(ni)
    sqrt(vtp)
  }
}
dtp(c(1,2,3,4),c(18,28,19,15))

#PROBLEMA 4

##(a) 
f1<-function(x){
  c(x^2,x^3,sqrt(x))
}

##(b)
f2<-function(x){
  x<-c(x^2,x^3,sqrt(x))
  names(x)<-c("quadrat","cub","arrel quadrada")
  x
}
f2(3)

##(c)
f3<-function(x){
  if(x<0) {stop("ERROR: No es pot calcular l'arrel quadrata d'un nombre negatiu")}
  x<-c(x^2,x^3,sqrt(x))
  names(x)<-c("quadrat","cub","arrel quadrada")
  x
}
f3(-3)

#PROBLEMA 5
coincidencia<-function(x,num){
  if(class(x)!="numeric") {stop("ERROR: Argument deu de ser un vector numèric")}
  if(class(num)!="numeric") {stop("ERROR: No s'ha introduït un nombre per buscar al vector numèric")}
  else{
    coin<-FALSE
    for(i in 1:length(x)){
      if(x[i]==num){
        coin<-TRUE
        return(TRUE)
      }
    }
    return(coin)
  }
}
coincidencia(c(2,3,4,5,6,7),4)
coincidencia(c(2,3,4,5,6,7),10)

#PROBLEMA 6

##(a)
mon<-read.csv("CountriesOfTheWorld.csv",header=T,sep=',',dec=','); head(mon)
sapply(mon,class)

##(b)
decimals<-function(x){
  if(class(x)!="character") {stop("ERROR: Argument introduit no és una cadena de caracters")}
  x1<-gsub(",",".",x)
  return(x1)
}
decimals("hola,533")

##(c)
decimals_modif<-function(x){
  if(class(x)!="character") {stop("ERROR: Argument introduit no és una cadena de caracters")}
  x1<-gsub(",",".",x)
  return(as.numeric(x1))
}
decimals_modif("3,1416")

##(d)
###Totes les varaibles que tenen que ser numèriques ho són, però açò es 
###conseqüència de la forma en la que hem importat les dades. Veiem que passa si ho fem d'una altra forma
mon2<-read.csv("CountriesOfTheWorld.csv",header=T,sep=','); head(mon2)
sapply(mon2,class) #Ara veiem que si que hi han variables que deurien de ser numèriques i no ho són

vars.incorrectes<-sapply(mon2,class)=="character"
head(mon2[1,vars.incorrectes])

vars.incorrectes["Country"]<-FALSE
vars.incorrectes["Region"]<-FALSE

head(mon2[1,vars.incorrectes])
mon2[,vars.incorrectes]<-lapply(mon2[,vars.incorrectes],decimals_modif)
sapply(mon2,class)
head(mon2)





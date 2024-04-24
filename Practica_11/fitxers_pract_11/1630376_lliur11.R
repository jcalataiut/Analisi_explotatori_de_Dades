#’ ---
#’ title: "Informe de la pràctica 11" 
#’ output: word_document
#’ author: "Jose Calatayud Mateu"
#’ ---

#LLIURAMENT 11

## Pas(1): Importació del fitxer

library(xlsx)
df.plantes<-read.xlsx(file="Plant_height.xlsx",sheetIndex=1, 
                      startRow=1, endRow=179, header=T,encoding="UTF-8")

## Pas(2): Observació de les característiques

#De quin tipus es l'objecte df.plantes?
class(df.plantes)

#Nombre de casos
nrow(df.plantes)

#Nombre de variables
ncol(df.plantes)

#De qui tipus son les variables?
summary(df.plantes)
str(df.plantes)

## Pas(3): Preparacio de l'objecte

### (a)
df.plantes[1:3,]
sapply(df.plantes,table)

### Abans de continuar anem a canviar els charters NA per NA's 
df.plantes[df.plantes=="NA"]<-NA
any(is.na(df.plantes)) # Hi han valors perduts?

### Encara que growthform tingui que ser factor no puc passar-la perque
### després la necessite sense ser-ho i el mateix passa amb hemisphere

df.plantes$entered.by<-as.factor(df.plantes$entered.by)
df.plantes$LAI<-as.numeric(df.plantes$LAI)
df.plantes$NPP<-as.numeric(df.plantes$NPP)

sapply(df.plantes,class) # es confirmen els canvis


## (b)
rownames(df.plantes)<-paste(df.plantes$site,df.plantes$Family,sep="_")
df.plantes[1:3,] # confirma l'assignació

## (c)
df.plantes<-df.plantes[apply(df.plantes,1, function(x) sum(is.na(x)))<=6,]

## (d)
df.plantes<-df.plantes[,apply(df.plantes,2, function(x) sum(is.na(x)))<=15]

## (e)

### Quants valors perduts té la variable growthform?
sum(is.na(df.plantes$growthform))

table(df.plantes$growthform, useNA="always")
var.estudi<-names(table(df.plantes$growthform, useNA="always"))[table(df.plantes$growthform, useNA="always")>2]
var.estudi<-var.estudi[!is.na(var.estudi)]

df.grwNA<-subset(df.plantes, is.na(df.plantes$growthform), select = c(growthform, height)); df.grwNA
df.singrNA<-subset(df.plantes, !is.na(df.plantes$growthform) & df.plantes$growthform%in%var.estudi, select = c(growthform, height)); head(df.singrNA)

unique(df.singrNA$growthform) # Es comprova que no té els que només presenten 1 o 2 casos com "Fern"

attach(df.singrNA)
by(height,growthform,function(x) list(mean=mean(x),sd=sd(x),median=median(x),quantile=quantile(x)))
boxplot(height~growthform, col=rainbow(4), varwidth=TRUE, main="Boxplot de la variable height estratificat \n per growthform amb més de 2 casos", cex=0.7)
legend(0.5,60,legend=var.estudi,cex=0.7, fill = rainbow(4))
detach(df.singrNA)

### En vista de la informació obtinguda és clasificaran per growthform en funció
### de si estan dins de les caixes (i.e, si les altures dels NA's estàn entre el 
### primer i tercer quartil)

for(i in 1:nrow(df.grwNA)){
  if(df.grwNA$height[i]<0.72){df.grwNA$growthform[i]<-"Herb"; next}
  if(df.grwNA$height[i]<4){df.grwNA$growthform[i]<-"Shrub"; next}
  if(df.grwNA$height[i]<11){df.grwNA$growthform[i]<-"Shrub/Tree"; next}
  else {df.grwNA$growthform[i]<-"Tree"}
}
df.grwNA

df.plantes$growthform[is.na(df.plantes$growthform)]<-df.grwNA$growthform
df.plantes["130_Melastomataceae","growthform"] # Es corfirma que els casos s'han assignat de la manera correcta

## (f)

### Quants valors perduts té la variable LAI?
sum(is.na(df.plantes$LAI))

df.laiNA<-subset(df.plantes, is.na(df.plantes$LAI), select=c(LAI, rain)); df.laiNA
df.sinlaiNA<-subset(df.plantes, !is.na(df.plantes$LAI), select=c(LAI, rain)); head(df.sinlaiNA)

attach(df.sinlaiNA) # utilitzem un data.frame sense els NA's de LAI
plot(LAI~rain, pch=20, main="Densitat de vegetació en funció \n de la precipitació anual", 
     xlab="Precipitació anual", ylab="Densitat vegetació")
abline(lm(LAI~rain), col="red")
model.densitat<-lm(LAI~rain)
summary(model.densitat) # r^2=0.557 relació lineal positiva moderada
coef<-model.densitat$coefficients; coef
den<-function(x){
  return(coef[1]+coef[2]*x)
}

detach(df.sinlaiNA)

df.laiNA$LAI<-den(df.laiNA$rain); df.laiNA
df.plantes$LAI[is.na(df.plantes$LAI)]<-df.laiNA$LAI
df.plantes["180_Pinaceae","LAI"] # Comprovació


## (g)

### Quants valors perduts té la variable LAI?
sum(is.na(df.plantes$NPP))

df.nppNA<-subset(df.plantes, is.na(df.plantes$NPP), select=c(NPP, rain)); df.nppNA
df.sinppNA<-subset(df.plantes, !is.na(df.plantes$NPP), select=c(NPP, rain)); head(df.sinppNA)

attach(df.sinppNA) 

plot(NPP~rain, pch=20, main="Grau acum. de CO2 en funció \n de la precipitació anual", xlab="Precipitació anual", ylab="Grau acum. CO2")
abline(lm(NPP~rain), col="red")

model.co2<-lm(NPP~rain)
summary(model.co2) # r^2=0.6208 relació lineal positiva moderada
coef2<-model.co2$coefficients; coef2
fco2<-function(x){
  return(coef2[1]+coef2[2]*x)
}

detach(df.sinppNA)

df.nppNA$NPP<-fco2(df.nppNA$rain); df.nppNA
df.plantes$NPP[is.na(df.plantes$NPP)]<-df.nppNA$NPP
df.plantes["180_Pinaceae","NPP"] # Comprovació

## (h)

### Abans de que es perdin els signe de nort i sud es crearà una nova 
### variable que puga facilitar les operacions en l'apartat següent

df.plantes$tropic<-df.plantes$lat*df.plantes$hemisphere
df.plantes$hemisphere<- factor(df.plantes$hemisphere, levels=c(-1,1), labels=c("South","North"))
head(df.plantes["hemisphere"])

## (i)

attach(df.plantes)
df.plantes$tropic<-cut(tropic, breaks=c(min(tropic),-23.27,23.27,max(tropic)), labels = c("Capricorn","Tropical","Cancer"), include.lowest=T)
detach(df.plantes)
head(df.plantes["tropic"])

# Pas(4): Anàlisi
df.plantes$logheight<-log(df.plantes$height) # es necessitarà més avant
df.plantsi<-subset(df.plantes, select = c(height,logheight,growthform,LAI,rain,temp,hemisphere,
                                          diurn.temp,NPP,tropic))
head(df.plantsi)

## (a)

### Les variables escollides són:
names(df.plantsi)

### De quin tipus són?
sapply(df.plantsi,class)

### Estudi univariant:

library(psych) 
describe(df.plantsi[!(names(df.plantsi)%in%c("growthform","hemisphere","tropic"))]) # per a vars numèriques

sapply(df.plantsi[c("growthform","hemisphere","tropic")], table, useNA="always") # ver a factors


## (b)

boxplot(df.plantsi$temp~df.plantsi$hemisphere,col=rainbow(4)[c(1,3)],xlab="Hemisferi",ylab="Temperatura",cex.axis=0.8, 
        main="Boxplot temperatura mitjana anual \n en funció de l'hemisferi")
frequencies<-as.vector(table(df.plantsi$hemisphere)) 
desvia1<-jitter(rep(1,frequencies[1]),amount=0.15) 
points(desvia1,df.plantsi$temp[df.plantsi$hemisphere=="South"],cex=0.5,pch=20) 
desvia2<-jitter(rep(2,frequencies[2]),amount=0.15) 
points(desvia2,df.plantsi$temp[df.plantsi$hemisphere=="North"],cex=0.5,pch=20)

#### S' observa de les gràfiques que, en general, les temperatures en l'hemisferi sud
#### són molt meés altes que en el Nord. Això s'observa en que el registre de temperatura
#### més baixa del sud és superior al 25% de registres del nord. A més, el 50% aprox. dels
#### registres de temperatures a l'hemisferi sud són superior al 75% de les del nord.

boxplot(df.plantsi$temp~df.plantsi$tropic,col=rainbow(4)[1:3],xlab="Tròpic",ylab="Temperatura",cex.axis=0.8, 
        main="Boxplot temperatura mitjana anual \n en funció de tròpic")

#### Clarament, del gràfic s'interpretar que sense dubte la zona més calida és
#### la Tropical (les seues temperatures són superiors al 100% de les temperatures
#### de les altres dos zones i la més freda és Cancer)

## (c)

attach(df.singrNA)
boxplot(height~growthform, col=rainbow(4), varwidth=TRUE, main="Boxplot de la variable height estratificat \n per growthform amb més de 2 casos", cex=0.7)
legend(0.5,60,legend=var.estudi,cex=0.7, fill = rainbow(4))
detach(df.singrNA)

#### En l'apartat (e) anterior, s'han classificat les plantes amb growthform NA segons la altura 
#### que presentaven i tenin en compte les altures dels altres growthforms. 
#### Aquesta classificació no és una mala estimació, ja que suposant que aquestes plantes
#### que presenten NA's no formen part dels 50% percent dels extrems (es a dir segueixen al mitja) 
#### la estimació no és del tot incorrecta. Però mai serà correcta. Si es suposa que aquestes plantes 
#### es comporte com la mitjana de les plantes de la classificació de growthform, aleshores 
#### la classificació donada és més que correcta. Encara que aquesta informació ignora certes variables 
#### que hagueren ajudat a afinar les estimaciones com, per exemple, la quantitat de plutja que soperten
#### la zona on es troben, les temperatures (major temperatures menor creixement, més o menys), la seua NPP,
#### entre altres.

## (d)

attach(df.sinlaiNA) # utilitzem un data.frame sense els NA's de LAI
plot(LAI~rain, pch=20, main="Densitat de vegetació en funció \n de la precipitació anual", 
     xlab="Precipitació anual", ylab="Densitat vegetació")
abline(lm(LAI~rain), col="red")
model.densitat<-lm(LAI~rain)
summary(model.densitat) # r^2=0.557 relació lineal positiva moderada
coef<-model.densitat$coefficients; coef
den<-function(x){
  return(coef[1]+coef[2]*x)
}
detach(df.sinlaiNA)

attach(df.sinppNA) 
plot(NPP~rain, pch=20, main="Grau acum. de CO2 en funció \n de la precipitació anual", 
     xlab="Precipitació anual", ylab="Grau acum. CO2")
abline(lm(NPP~rain), col="red")
model.co2<-lm(NPP~rain)
summary(model.co2) # r^2=0.6208 relació lineal positiva moderada
coef2<-model.co2$coefficients; coef2
fco2<-function(x){
  return(coef2[1]+coef2[2]*x)
}
detach(df.sinppNA)

#### En els dos casos, les aproximaciones es fan per ajust de mínims quadrats a una recta
#### i observant el coeficient de regressió al quadrat en els dos casos, els ajust presenten
#### una relació lienal moderada. Per tant, una estimació dels valors de LAI i NPP en funció
#### de la precipitació anual soportada per la planta és una bona estimació encara que no
#### del tot correcta però es una estimació que fa minim els errors respecte dels dades sense NA's

## (e)
estudivarsnum<-function(x){
  quartils<-quantile(x, na.rm=T)
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
  Kurtosis<-mu4/desv^4
  llista<-list(min=minim,Q1=q1,mediana=Md,mitjana=mitjana,
               Q3=q3,max=maxim,rang=rang,R.I=R.I,desv=desv,desv.med=desv.med,
               CV=CV,alpha=alpha.sim,curtosi=Kurtosis)
  lapply(llista,round,2)
}

estudiconj<-function(x){
  list(Estudi_univariant=t(sapply(x, estudivarsnum)),Covaciancia=cov(x), Correlacio=cor(x), Correlacio2=cor(x)^2)
}

estudiconj(df.plantes[,c("LAI","diurn.temp","NPP")])

attach(df.plantsi)
layout(matrix(c(1,2),nrow=1))
plot(LAI~diurn.temp, pch=20, xlab="Temp. diurna", ylab="Densitat vegetació (LAI)",
     main="Densitat de vegetació  \n en funció de la temperatura diurna")
abline(lm(LAI~diurn.temp), col="red")

plot(LAI~NPP, pch=20, xlab="Grau acum. CO2", ylab="Densitat vegetació (LAI)",
     main="Densitat de vegetació  \n en funció grau acumulació de CO2")
abline(lm(LAI~NPP), col="red")
layout(1)

#### Es poden extraure les següents conclusions:
#### La relació lineal entre LAI i NPP és gairebé forta, en canvi, la relació
#### entre LAI i diurn.temp es feble. Encara així, es pot concloure que una 
#### una planta que acumula major cantitat de CO2 sol ser perte té una major densitat
#### vegetal i per altra banda, encara que no del tot fiable, es té que una temp. diurna
#### alta sol anar relacionat aun una menor quantitat de densitat (totalment intuitiu).

## (f)

### Es té 3 variables categòriques: growthform, hemisphere i tropic

attach(df.plantsi)
describeBy(LAI,growthform)
describeBy(LAI,hemisphere)
describeBy(LAI,tropic)
detach(df.plantsi)

library(vioplot)
layout(matrix(c(1,2,3), nrow=1))
x1<-df.plantsi$LAI[df.plantsi$growthform=="Fern"] # no posem aquest casos perque només hi ha un
x2<-df.plantsi$LAI[df.plantsi$growthform=="Herb"]
x3<-df.plantsi$LAI[df.plantsi$growthform=="Herb/Shrub"] #només hi ha un cas
x4<-df.plantsi$LAI[df.plantsi$growthform=="Shrub"]
x5<-df.plantsi$LAI[df.plantsi$growthform=="Shrub/Tree"]
x6<-df.plantsi$LAI[df.plantsi$growthform=="Tree"]
vioplot(x2, x4, x5, x6, names=c("Herb","Shrub","Shrub/Tree","Tree"), col="gold",
        ylab="Densitat vegetació (LAI)",xlab="Growthform", 
        main="Densitat de vegetació \n per growthform", las=1) # no es gràfiquen els casos 


y1<-df.plantsi$LAI[df.plantsi$hemisphere=="South"]
y2<-df.plantsi$LAI[df.plantsi$hemisphere=="North"]
vioplot(y1,y2,names=c("South","North"), ylab="Densitat vegetació (LAI)", xlab="Hemisferi",
        col=cm.colors(8)[7],las=1, main="Densitat de vegetació \n per hemisferi")

z1<-df.plantsi$LAI[df.plantsi$tropic=="Capricorn"]
z2<-df.plantsi$LAI[df.plantsi$tropic=="Tropical"]
z3<-df.plantsi$LAI[df.plantsi$tropic=="Cancer"]
vioplot(z1,z2,z3,names=c("Carpicorn","Tropical","Cancer"), col=rainbow(10)[10],
        ylab="Densitat vegetació (LAI)", xlab="Tropics",
        main="Densitat de vegetació \n per tropics")

layout(1)


#### Conclusion: De mediana el growthform amb major LAI es Shrub/Tree, per
#### en hemisferi Sud i en el zona Tropical.

## (g)

estudiconj(df.plantes[,c("height","diurn.temp","NPP")])

#### NO està la variable logheight
df.plantes$logheight<-log(df.plantes$height) # ara sí

estudiconj(df.plantes[,c("height","logheight","diurn.temp","NPP", "rain","temp")])

### Observant la taula de Correlacio2, aquesta és més alta si es pren la 
### variable logheight. Aleshores, es treballarà amb logheight

#### Per a VARS NUMÈRIQUES:
attach(df.plantsi)
layout(matrix(c(1,2,3,4),nrow=2, byrow=T))
logmod4<-lm(logheight~temp)
heigcoef4<-logmod4$coefficients
plot(height~temp, pch=20, xlab="Temp. mitjana anual", ylab="Altura",
     main="Altura en funció \n de temp. mitjana anual")
x<-seq(min(temp,na.rm=TRUE),max(temp,na.rm=TRUE),by=0.05)
points(x,exp(heigcoef4[1]+heigcoef4[2]*x),type="l",col=2)

logmod<-lm(logheight~diurn.temp)
heigcoef<-logmod$coefficients
plot(height~diurn.temp, pch=20, xlab="Temp. diurna", ylab="Altura",
     main="Altura en funció \n de la temperatura diurna")
x<-seq(min(diurn.temp,na.rm=TRUE),max(diurn.temp,na.rm=TRUE),by=0.05)
points(x,exp(heigcoef[1]+heigcoef[2]*x),type="l",col=2)

logmod2<-lm(logheight~NPP)
heigcoef2<-logmod2$coefficients
plot(height~NPP, pch=20, xlab="Grau acum. CO2", ylab="Altura",
     main="Altura en funció \n del grau acum CO2")
x<-seq(min(NPP,na.rm=TRUE),max(NPP,na.rm=TRUE),by=0.05)
points(x,exp(heigcoef2[1]+heigcoef2[2]*x),type="l",col=2)

logmod3<-lm(logheight~rain)
heigcoef3<-logmod3$coefficients
plot(height~rain, pch=20, xlab="Precipitació anual", ylab="Altura",
     main="Altura en funció \n de la precipitació anual")
x<-seq(min(rain,na.rm=TRUE),max(rain,na.rm=TRUE),by=0.05)
points(x,exp(heigcoef3[1]+heigcoef3[2]*x),type="l",col=2)
layout(1)
detach(df.plantsi)

#### Per a VARS CATEGÒRIQUES:

attach(df.plantsi)
describeBy(height,growthform)
describeBy(height,hemisphere)
describeBy(height,tropic)
detach(df.plantsi)

layout(matrix(c(1,2,3), nrow=1))
x1<-df.plantsi$height[df.plantsi$growthform=="Fern"] # no posem aquest casos perque només hi ha un
x2<-df.plantsi$height[df.plantsi$growthform=="Herb"]
x3<-df.plantsi$height[df.plantsi$growthform=="Herb/Shrub"] #només hi ha un cas
x4<-df.plantsi$height[df.plantsi$growthform=="Shrub"]
x5<-df.plantsi$height[df.plantsi$growthform=="Shrub/Tree"]
x6<-df.plantsi$height[df.plantsi$growthform=="Tree"]
vioplot(x2, x4, x5, x6, names=c("Herb","Shrub","Shrub/Tree","Tree"), col="gold",
        ylab="Altura",xlab="Growthform", 
        main="Altura \n per growthform", las=1) # no es gràfiquen els casos 


y1<-df.plantsi$height[df.plantsi$hemisphere=="South"]
y2<-df.plantsi$height[df.plantsi$hemisphere=="North"]
vioplot(y1,y2,names=c("South","North"), ylab="Altura", xlab="Hemisferi",
        col=cm.colors(8)[7],las=1, main="Altura \n per hemisferi")

z1<-df.plantsi$height[df.plantsi$tropic=="Capricorn"]
z2<-df.plantsi$height[df.plantsi$tropic=="Tropical"]
z3<-df.plantsi$height[df.plantsi$tropic=="Cancer"]
vioplot(z1,z2,z3,names=c("Carpicorn","Tropical","Cancer"), col=rainbow(10)[10],
        ylab="Altura", xlab="Tropics",
        main="Altura \n per tropics")
layout(1)

## Pas (5): Preguntes

### Material per justificar les respostes

#### 4.
estudiconj(df.plantes[sapply(df.plantes,class)=="numeric"])[[4]][,c(3,29)]

#### 5.
library(stats)
cormat<-round(cor(df.plantes[sapply(df.plantes,class)=="numeric"]),2)
library(lattice)
levelplot(t(cormat[,c(3,27)]))


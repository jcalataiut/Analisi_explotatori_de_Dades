
#PROBLEMA 1

hea<-read.csv("heart.csv",header=T,sep=",",dec="."); head(hea)

##a
str(hea)
sapply(hea,class)
summary(hea)
var_fact<-c("Sex","ChestPainType","FastingBS","RestingECG","ExerciseAngina","ST_Slope","HeartDisease")
hea[ ,var_fact]<-lapply(hea[,var_fact],as.factor)
summary(hea)
library(psych)
describe(hea[,names(sapply(hea,class)[sapply(hea,class)!="factor"])]) #descipció de les variables numèriques

##b
attach(hea)
edat.gr<-cut(Age,breaks=c(20,36,66,max(Age)),right=F,include.lowest=T,labels=c("joves","adults","grans")); edat.gr #min(Age)=28>20 aixina que pose 20 sense cap problema
colest.nivell<-cut(Cholesterol,breaks=c(min(Cholesterol),200,250,max(Cholesterol)),right = F,include.lowest=T,labels=c("Normal","Alt","Molt alt"))
detach(hea)
hea[,(length(hea)+1):(length(hea)+2)]<-data.frame(edat.gr,colest.nivell);
colnames(hea)[(length(hea)-1):length(hea)]<-c("edat.gr","colest.nivell")
head(hea)
layout(1)
##c  
####  METODE 1
attach(hea)
describeBy(Cholesterol,edat.gr)
boxplot(Cholesterol~edat.gr, col=rainbow(8), main="Nivells de colesterol per grups d'edat",cex=0.8)
###Podem veure que sí hi han certes diferències al estratificar la variable colesterol per grups d'edat:
###la mitjana disminueix conforme la gent es fa major (explicatiu de que la població es cuida quan més gran és 
###per tal d'evitar malalties). A més, segons aumenta l'edat aumenta la disperció del colesterol causa explicativa de que 
###l'edat influeix en el colesterol (es pot entendre com gent gran que es cuida i altra ò con a tipus d'enfermetats que es podem 
### agafar i causen un descontrol en els nivells de colesterol)

describeBy(Cholesterol,Sex)
boxplot(Cholesterol~Sex,col=2:3,main="Nivells de colesterol per sexe",cex=0.8)
detach(hea)
###Ara veiem que les diferències per grups de sexe són molt significatives
### les dones de mitja tenen nivells de coresterol molt més alts que els homes, però
### són menys variables,ie,estàn més centrat respecte la seua mitjana que els homes (açó pot
###significar que hi ha homes que es cuiden més que altres i les dones es solen cuidar de manera similar)

###CONCLUSIÓ: La variable Sex influeix més en els nivells de colesterol

####  METODE 2

c_e<-table(colest.nivell,edat.gr)
addmargins(c_e) #taula de continguència completa
c_e.cond_col<-prop.table(c_e,margin=2)
addmargins(c_e.cond_col)
barplot(c_e.cond_col,col=c("green","orange","firebrick1"))


c_s<-table(colest.nivell,Sex)
addmargins(c_s)
c_s.cond_col<-prop.table(table(colest.nivell,Sex),margin = 2)
addmargins(c_s.cond_col)
barplot(c_s.cond_col,col=c("green","orange","firebrick1"),legend.text =c("Normal","Alt","Molt Alt"))

###CONCLUCIO: Per aquest segon mètode s'aprecien millor que influeix més el factor SEXE que el factor de EDAT.
###           Cal veure que hi han diferencies mes significaties entre les modadilatats F-M que entre j-a-g.
###           a més, veiem que les dones tendeixen a tindren nivells molt més alts de coresterol que els homes i els homes solen tindre nivells més normals
###           En canvi, per edats no s aprecien diferència gairebé molt significatives.


##(d)
f_hd<-table(FastingBS,HeartDisease)
colnames(f_hd)<-c("Normal","Malalt")
rownames(f_hd)<-c("Normal","Sucre alt")
f_hd.cond_col<-prop.table(f_hd,margin = 2)
barplot(f_hd.cond_col,col=c("blue","red"),legend.text =c("Normal","Sucre alt"))

### Aleshores, veiem el gràfic concluim que sí que hi ha relació entre estar malalt i els nivells de sucre
### perque si no hi haguera relació la proporció de nivells de sucre en persones normals i malalts tendiria a ser la mateixa
### situació que ací no es dóna.

hd_f<-table(HeartDisease,FastingBS)
rownames(hd_f)<-c("Normal","Malalt")
colnames(hd_f)<-c("Normal","Sucre alt")
hd_f.cond_col<-prop.table(hd_f,margin = 2)
barplot(hd_f.cond_col,col=c("blue","red"),legend.text =c("Normal","Malalt"))

### Veiem que el porcentatge de malalts amb sucre alt es molt superior al 
### de malalts amb sucre normal, açó ens indica que tenir nivells alts de sucre
### és un risc per a les malalties cardiovasculars


##(e)

#### METODE 1
attach(hea)
layout(matrix(c(1,2,3,4),nrow=2))
describeBy(Cholesterol,HeartDisease)
boxplot(Cholesterol~HeartDisease, col=3:2,varwidth=T, main="Nivell colesterol per enfermetat cor")
library(gplots)
plotmeans(Cholesterol~HeartDisease,mean.labels=T,digits=2,pch=1,bars=F,connect=T,col="gold",ylim=c(140,240))
###Observem que sí que influeix el nivell de coresterol d'una persona en patir o no una malaltia 
### del cor, perque encara que la mediana es pareguda en els dos grups, les seues mitjanes i sd són,
### molt diferents mostrant un comportament de la variable nivell de coresterol diferent en el grup de malalts i en 
### el de no malalts.
describeBy(Cholesterol,FastingBS)
boxplot(Cholesterol~FastingBS, col=3:2,varwidth=T,main="Nivell coresterol per sucre")
plotmeans(Cholesterol~FastingBS,mean.labels=T,digits=2,pch=1,bars=F,connect=T,col="gold",ylim=c(140,240))

### En vista dels gràfics, podem dir que encara que són molt pareguts, al fer del diagrama de mitjanes
###veiem que el nivell de sucre és més influent ja que si tens uns nivells de sucre alts la mitjana cau a vora 140
### i en canvi si tens una malaltia de cor, açó cau només a 170.

### Extraiem les següents relacions:
### -Les persones amb una malaltia de cor tenen nivells de coresterol més baixets que els que no, en mitjana (conseqüència de que es cuiden més), tot i que 
###  són més variables però la seua variabilitat es deu a que hi han casos amb nivells molt baixos 
### -Passa el mateix amb les persones amb sucre però la diferencia és que de mitjana tenen nivells de coresterol encara més baixos que els malalts de cor i 
###  presenten una variabilitat més forta.

###CONCLUSIÓ: El nivell de sucre en sang influeix més en el coresterol que una malaltia cardiovascular

#### METODE 2
hd_c<-table(HeartDisease,colest.nivell)
hd_c.cond_col<-prop.table(hd_c,margin=2)
barplot(hd_c.cond_col,col=c("blue","red"),legend.text =c("Normal","Malalt"))

hd_f<-table(HeartDisease,FastingBS)
colnames(hd_f)<-c("Normal","Sucre alt")
hd_f.cond_col<-prop.table(hd_f,margin=2)
barplot(hd_f.cond_col,col=c("blue","red"),legend.text =c("Normal","Malalt"))

### En primer lloc hem de dir que nivells alts de coresterol NO són causa de malalties 
### cardiovasculars encara que si son molt alts tendeix a aumentar les malalties però 
### inclús dins del grup dels normals hi ha major percentatge de malalts que en els altres

### Per altra banda, veiem que un nivell de sucre alt fa que el percentatge de malalts sigui superior
### CONCLUSIO: Influeix más el nivell de sucre en sang en una malaltia cardiovascular que el nivell de coresterol

##(f)
f_e<-table(FastingBS,edat.gr)
f_e.cond_col<-prop.table(f_e,margin=2)
barplot(f_e.cond_col,col=c("blue","red"),,legend.text =c("Normal","Sucre alt"))

### Acabem de comprovar que les persones grans tenen nivells de sucre més alts, en proporció,
### que la resta de grups d'edat.
detach(hea)
hea_grans<-subset(hea,edat.gr=="grans")
attach(hea_grans)
f_hd.g<-table(FastingBS,HeartDisease)
colnames(f_hd.g)<-c("Normal","Malalt")
f_hd.cond_col.g<-prop.table(f_hd.g,margin=2)
barplot(f_hd.cond_col.g,col=c("blue","red"),,legend.text =c("Normal","Sucre alt"))
detach(hea_grans)

### Veiem que també és influent en sucre alt en el grup de persones grans per a detectar una malaltia

##(g)
x<-hea[order(hea$RestingBP),]
x$color[x$edat.gr=="joves"]<-"blue"
x$color[x$edat.gr=="adults"]<-"blue"
x$color[x$edat.gr=="grans"]<-"blue"
head(x)
layout(1)
dotchart(x$RestingBP,cex=0.5,groups=x$edat.gr,gcolor="black",color=x$color,pch=19,
         main="RestingBP per grups d'edat",xlab="RestingBS",ylab="Grups d'edat")

##(h)
attach(hea)
hd_s<-table(HeartDisease,Sex)
hd_s.cond_col<-prop.table(hd_s,margin=2)
barplot(hd_s.cond_col)

### En vista de les grafiques plottejades, el prototip de persona malalta és majoritariament home amb sucre alt
### d'entrada edat,ie,gran i amb uns nivells de coresterols o normals o molt alts més que alts.

### El prototip de persona no malalt es dona joves.


# PROBLEMA 2

##(a)
library(foreign)
TRC<-read.spss("TRC.sav",to.data.frame=T); head(TRC)
str(TRC)
sapply(TRC,class)

var_media <- function(x){
  xi<-abs(x-median(x))
  n<-sum(is.na(x)==F)
  dm<-sum(xi,na.rm=T)/n
  vm<-dm/median(x)
  return(vm)
}

VM<-sapply(TRC[,c("ANY_IMPLANT","EDAT","CREA","DTSVE","DTDVE")],var_media)

### La maxima disperció es d'aquell que més varaició medià té i correspon a la variable CREA, ie, al valor de la creatinina en sang

##(c)
### SEXE

x1<-TRC$DTSVE[TRC$SEXE=="DONA"]
x2<-TRC$DTSVE[TRC$SEXE=="HOME"]
y1<-TRC$DTDVE[TRC$SEXE=="DONA"]
y2<-TRC$DTDVE[TRC$SEXE=="HOME"]
par(mfrow=c(2,2))
library(vioplot)
vioplot(x1,x2,names=c("Dona","Home"), col=c("red","blue"),xlab = "Sexe", ylab="DTSVE",ylim=c(30,100))
vioplot(y1,y2,names=c("Dona","Home"), col=c("red","blue"),xlab = "Sexe", ylab="DTDVE",ylim=c(30,100))

### MORTS

z1<-TRC$DTSVE[TRC$MORT_12m=="NO"]
z2<-TRC$DTSVE[TRC$MORT_12m=="SI"]
t1<-TRC$DTDVE[TRC$MORT_12m=="NO"]
t2<-TRC$DTDVE[TRC$MORT_12m=="SI"]

vioplot(z1,z2,names=c("NO","SI"),col=c("green","firebrick"),xlab = "Mort als 12 mesos?", ylab="DTSVE",ylim=c(30,100))
vioplot(t1,t2,names=c("NO","SI"),col=c("green","firebrick"),xlab = "Mort als 12 mesos?", ylab="DTDVE",ylim=c(30,100))






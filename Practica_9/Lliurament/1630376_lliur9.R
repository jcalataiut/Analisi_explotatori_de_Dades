
# PROBLEMA 1

gh<-read.csv("GastoHogaresEduc.csv", header=T,sep=",",dec=".",na.strings = c(NA," ")); head(gh)

##(a)
class(gh$GTT)

GHE<-subset(gh,GTT>0,data=gh); head(GHE)
any(is.na(GHE$GTT)) #fent la condició anterior ja eliminem
                    # els casos en que és NA

gh2<-gh[!is.na(gh$GTT),];head(gh2)
GHE2<-subset(gh2,GTT>0,data=gh2); 

any(GHE!=GHE2,na.rm=T) #hem comprovat que aquestes dues manere
                       # de definir el subset són anàloges
 
##(b)
any(is.na(GHE$C34A))
GHE_noNA<-GHE[!is.na(GHE$C34A),]
any(is.na(GHE_noNA$C34A))

summary(GHE_noNA)
attach(GHE_noNA)

plot(C34A~GTT, main="Import d'altres estudis \n en funció despesa total en Educació", 
     pch=20, cex=0.8, xlab="Despesa total en Educació", ylab="Importa d'altres estudis")
abline(lm(C34A~GTT),col="red")

##(c)

model_c34a.gtt<-lm(C34A~GTT)
coef<-model_c34a.gtt$coefficients; coef

r<-cor(GTT,C34A); r
r_2<-r^2; r_2 

### El coeficient de determinació ens informa d'una 
### relació lineal forta i del coeficient de correlació i la gràfica
### veiem que és positiva
detach(GHE_noNA)

##(d)

gh_mcl<-gh[!is.na(gh$GTSR) & !is.na(gh$GTSNR) & !is.na(gh$MCL),]

layout(matrix(c(1,2),nrow=1))
attach(gh_mcl)
plot(GTSR~MCL, main="Despesa total en serveis educ. regulats \n en funció import matricula y classe", cex=0.5, col="darkblue",las=1)
abline(lm(GTSR~MCL), col="red")

plot(GTSNR~MCL, main="Despesa total en serveis educ. NO regulats \n en funció import matricula y classe", cex=0.5, col="darkgreen",xmin=0,ymin=0)
abline(lm(GTSNR~MCL), col="red")

layout(1)
detach(gh_mcl)

##(e)

attach(gh_mcl)

cor(MCL,GTSR)
summary(lm(GTSR~MCL)) # r^2 = 0.8232

cor(MCL,GTSNR)
summary(lm(GTSNR~MCL)) # r^2 = 0.01919

### Els coeficients de determinació ens serveixen per determinar
### si existeix una relació lineal o no i com de forta entre les dues variables
### Veiem que la recta de regressió GTSR~MCL té un coeficient r^2=0.8232 el que 
### verifica la forta relació lineal que mostrava el diagram de dispersió. A més aquesta
### relació es positiva. En canvi, no passa el mateix amb l'ajust lineal de les variables GTSNR~MCL
### ja que r^2=0.01919 que vol dir que practicament no existeix relació lineal entre les dues variables
### és a dir, existeix una relació lineal positiva però aquesta es molt feble i l'ajust ens donaria
### estacions no gairebé bones. Però l'ajust GTSR~MCL sí que seria bó per donar estimació saben valors 
### de la despesa en matrícula i classes.

detach(gh_mcl)

##(f)

attach(gh_mcl)

model.gtsr_mcl<-lm(GTSR~MCL)
coeff<-model.gtsr_mcl$coefficients; coeff

GTSR_estim<-function(x){
  GTSR.estim<-coeff[1]+coeff[2]*x
  M<-matrix(GTSR.estim,nrow=1)
  rownames(M)<-c("GTSR estim:")
  colnames(M)<-paste("MCL",x,sep="=")
  return(M)
}

GTSR_estim(c(200,525,735,995,1350))

detach(gh_mcl)

##(g)

attach(gh_mcl)
any(is.na(gh_mcl$C01)) #No te NA valors
gh_mcl["C01"]<-factor(gh_mcl$C01,levels=c(1,2,3),labels=c("E.Pública","E.Concertada","E.Privada")); head(gh_mcl)
summary(gh_mcl$C01)

library(lattice)

xyplot(GTSR~MCL,groups=C01, data=gh_mcl, col=c("deeppink1","blue","green3"),
       main="Despesa educ. registrats \n respect import matricula i classes per educació",
       xlab="Import despesa matricula i classes lectives",
       ylab="Despesa serveix educ. registrats",pch=c(17,20,22),type=c("p","r"),
       key=list(text=list(levels(gh_mcl$C01)),lines=list(pch=c(17,20,22),type="b", col=c("deeppink1","blue","green3")), columns=3, divide=1))

detach(gh_mcl)
### Entenguem com factor diferencial que la dispersió de les dades GTSR~MCL en cadascuna 
### de les classes del factor es comporta de manera diferent. Veiiem que el comportament no es homogeni, ja que les 
### rectes de regressió són diferent (encara que les de E.Concertada i E.Privada tenen similar pendent, en canvi la pendent
### de E.Pública es major, el que significa )

##(h)

library(lme4)
lc<-lmList(formula = GTSR~MCL | C01, data=gh_mcl)
coef_priv<-lc$E.Privada$coefficients

GTSR_estim_priv<-function(x){
  GTSR.estim<-coef_priv[1]+coef_priv[2]*x
  M<-matrix(GTSR.estim,nrow=1)
  rownames(M)<-c("GTSR(E.priv) estim:")
  colnames(M)<-paste("MCL",x,sep="=")
  return(M)
}

GTSR_estim_priv(c(200,525,735,995,1350))

# PROBLEMA 2

led<-read.csv("LifeExpectancyData.csv",header=T,sep=",", dec=".",na.strings = c(NA," ")); head(led)
led_pe0<-subset(led,percentage_expenditure>0,data=led); head(led_pe0)
summary(led_pe0)

attach(led_pe0)
any(is.na(Life_expectancy))
any(is.na(percentage_expenditure))
led_pe0_na<-led_pe0[!is.na(Life_expectancy),]
detach(led_pe0)

any(is.na(led_pe0_na$Life_expectancy)) # Un cop eliminats tots els FALSE 
                                       # passem a analitzar la relació

attach(led_pe0_na)

plot(percentage_expenditure~Life_expectancy, main="percentage_expenditure \n en funció de Life_ expectancy",pch=20)
abline(lm(percentage_expenditure~Life_expectancy), col="red")
legend(40,17000,legend=c("Punts","Recta regressió"), pch=c(20,-1), col=c("black","red"), lty=c(0,1),cex=0.7)
model_lineal<-lm(percentage_expenditure~Life_expectancy)
summary(model_lineal) # r^2=0.1831

### Veiem que la relació lineal ambdues variables és positiva i molt feble.
### Però observant el gràfic podem veure que hi ha una relació exponencial Y=c*exp(kx)

plot(log(percentage_expenditure)~Life_expectancy, main="percentage_expenditure \n en funció de Life_ expectancy",pch=20)
abline(lm(log(percentage_expenditure)~Life_expectancy), col="red")
modeli<-lm(log(percentage_expenditure)~Life_expectancy)
coefi<-modeli$coefficients
summary(lm(log(percentage_expenditure)~Life_expectancy))
x<-seq(min(Life_expectancy),max(Life_expectancy),by=0.05)
plot(percentage_expenditure~Life_expectancy, main="percentage_expenditure \n en funció de Life_ expectancy",pch=20)
points(x,exp(coefi[1]+coefi[2]*x), col="red",type="l")
legend(40,17000,legend=c("Punts","Recta regressió"), pch=c(20,-1), col=c("black","red"), lty=c(0,1),cex=0.7)

### El nou ajust es millor que l'anterior però continua sent feble, r^2=0.3564. Provem altres:

invers <-function(x){
  return(1/x)
}
plot(invers(percentage_expenditure)~invers(Life_expectancy))
summary(lm(invers(percentage_expenditure)~invers(Life_expectancy)))

### Provant altres tipus de relacions veiem que la funció que millor
### s'ajusta es la exponencia i es la següent:

pe_le<-function(x){
  p<-coefi[1]+coefi[2]*x
  return(p)
}

detach(led_pe0_na)



plot(x,y)






# APARTAT 1

df.enq<-read.table("enq.txt",header=T); head(df.enq)
attach(df)

##Gràfica 1
xyplot(Pes~Alt,groups=Sexe,data=df.enq,col=c("deeppink1","blue"),
       main="Pes en funció de Alt per sexes", xlab="Altura",
       pch=c(17,20),type=c("p","r"),
       key=list(text=list(c("Dona","Home")),lines=list(pch=c(17,20),type="b",col=c("deeppink1","blue")),columns=2,divide=1))

## Gràfica 2
xyplot(Pes~Alt,groups=Sexe,data=df.enq,col=c("deeppink1","blue"),
       main="Pes en funció de Alt per sexes", xlab="Altura",
       pch=c(17,20),type=c("p","r"),
       key=list(text=list(c("Dona","Home")),lines=list(pch=c(17,20),type="b",col=c("deeppink1","blue")),columns=2,divide=1))

### Es poden traure les següents conclusions: 
### els homes tendeixen a pesar més quant major es la seua altura,
### aixó es pot veure amb la pendent de les rectes de regresió. A més,
### pesen en general més que les dones tal i com es pot apreciar quan no es separen.
### També, les donen tenen menys valors extrems, el que fa que la resta s'ajuste millor a les dades
detach(df)

# APARTAT 2
attach(mon)
pairs(mon[c(15,4,6,8,9,11)])

plot(pib_cap~tasa_nat)
abline(lm(pib_cap~tasa_nat),col="red")
summary(lm(pib_cap~tasa_nat)) 
## r^2=0.4244

plot(log(pib_cap)~tasa_nat)
abline(lm(log(pib_cap)~tasa_nat),col="red")
summary(lm(log(pib_cap)~tasa_nat))
## r^2=0.5906

logmod<-lm(log(pib_cap)~tasa_nat)
coef<-logmod$coefficients

plot(pib_cap~tasa_nat,main="ajust exponencialde pib_cap sobre tasa_nat")
x<-seq(min(tasa_nat,na.rm=T),max(tasa_nat,na.rm=T),by=0.05)
points(x,exp(coef[1]+coef[2]*x),type="l",col=2)
detach(mon)
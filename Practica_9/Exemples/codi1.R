attach(df)

model.salaris<-lm(salario~salini)
summary(model.salaris)

model.salaris$coefficients
model.salaris[[1]]

cor(salario,salini)
cor(salario,salini)^2

xllista<-c(10500,12395,29900)
coef<-model.salaris$coefficients
pred<-coef[1]+coef[2]*xllista; pred

f<-function(x) coef[1]+coef[2]*x
f(xllista)

vars.num<-c(4,6,7,8,9)
df.num<-df[,vars.num]
(cormat<-round(cor(df.num),2))
library(lattice)
levelplot(cormat,xlab="",ylab="",main="Correlació vars Dades de treballadors")



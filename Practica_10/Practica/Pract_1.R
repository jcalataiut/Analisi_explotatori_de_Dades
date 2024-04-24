
library(foreign)
search()
df<-read.spss("Datosdeempleados.sav",to.data.frame=T,max.value.labels=5); head(df) #no ho fa correctamente

vars.num<-c(4,6,7,8,9) 
df.num<-df[,vars.num] 
(cormat<-round(cor(df.num),2))

library(lattice)
levelplot(cormat,xlab="",ylab="",
          main="Correlació vars Dades de treballadors")

# Metode per pipes:
df %>% subset(.,,select=vars.num) %>% 
  cor %>% round(digits=2) %>% 
  levelplot(xlab="", ylab="", main="Correlació vars Dades de treballadors")


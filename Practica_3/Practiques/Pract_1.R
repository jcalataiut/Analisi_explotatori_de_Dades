sed.seem(49)
imc <-sample(seq(12,55,by=0.1),300,rep=TRUE)
f_imc<-cut(imc,breaks=c(min(imc),18.5,25,30,max(imc)), right=F,labels=c("Insuficència ponderal","Pes normal","Preobesitat","Obesitat"),include.lowest=T); f_imc

edat<-c(32, 27, 29, 27, 32, 18, 31, 22, 33, 36, 32, 24, 31, 20, 18, 13, 13, 26, 29, 24, 30, 17, 35, 24)
despesa <- c(1, 1, 1, 1, 2, 2, 2, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 1, 2, 1, 2)
color<-c("blau", "verd", "verd", "negre", "blau", "blau", "negre", "negre", "verd", "blau", "vermell", "vermell", "negre", "negre", "rosa", "groc", "blau", "verd", "blau", "rosa", "rosa", "verd", "blau", "groc")

f_edat<-cut(edat,breaks=c(min(edat),18,30,max(edat)), right=FALSE, labels=c("teens","joves","adults"), include.lowest=T); f_edat #Si té sentit tractar-ho com a un factor ordinal
f_despesa <-cut(despesa,breaks=c(min(despesa),30,max(despesa)),right=F, labels=c("menys de 30€", "30€ o mes")); f_despesa #Si té sentit tratar-ho com a factor ordinal perque es pot ordenar en funció del gast
f_color<-factor(color); f_color


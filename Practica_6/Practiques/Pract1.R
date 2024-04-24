A<-matrix(sample(1:6,2000,replace=TRUE),nrow=1000); A
suma_dd=apply(A,1,sum)
hist(suma_dd)

load("DESPESA.RData")
desp<-DESPESA; head(desp)
class(desp)

mitjanes.alum<-apply(desp,1,mean); class(mitjanes.alum)
m.mitjanes.alum<-as.matrix(mitjanes.alum,ncol=1); m.mitjanes.alum
colnames(m.mitjanes.alum)<-c("Mitj.per.alumne")

mitjanes.mes<-apply(desp,2,mean)
mitjanes.mes<-c(mitjanes.mes,(sum(apply(desp,1,sum))+sum(apply(desp,2,mean)))/(15*12))
m.mitjanes.mes<-as.matrix(mitjanes.mes,nrow=1);
m.mitjanes.mes<-t(m.mitjanes.mes);m.mitjanes.mes
rownames(m.mitjanes.mes)<-c("Mitj.per.mes")

desp<-as.data.frame(desp); head(desp)
desp[,13]<-as.data.frame(m.mitjanes.alum)
desp[16,]<-as.data.frame(m.mitjanes.mes)
desp 






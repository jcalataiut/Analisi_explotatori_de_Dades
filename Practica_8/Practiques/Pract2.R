e_rel<-table(eutan,relig);e_rel
mosaicplot(e_rel,las=1,off=8,col=2:6,main="")
contingencia<-chisq.test(eutan,relig)
contingencia$p.value #Sí hi ha dependencia

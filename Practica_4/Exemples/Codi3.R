x<-read.csv('dades1.csv',sep=',',dec='.',header=F)

write.table(x,file='data_de_R.csv',sep=';',dec='.',row.names=F)
write.table(x,"dadesX.txt",quote=FALSE,row.names=F)
write.table(x,"dadesY.txt",quote=FALSE,row.names=T)
write.table(x,"dadesZ.txt",quote=FALSE,row.names=T,col.names=NA)
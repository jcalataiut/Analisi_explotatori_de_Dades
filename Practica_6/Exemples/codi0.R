(A<-matrix(1:12, nrow=3))
apply(A,1,sum)
apply(A,2,sum)

sapply(iris,class)
lapply(iris[,1:4],quantile)

load("mundo.RData")
head(mundo)
sapply(mundo,class)
vars.incorrectes<-sapply(mundo,class)=="factor"; vars.incorrectes
head(mundo[3,vars.incorrectes])
vars.incorrectes["pais"]<-FALSE
vars.incorrectes["relig"]<-FALSE
head(mundo[3,vars.incorrectes])
mundo[,vars.incorrectes]<-lapply(mundo[,vars.incorrectes],as.character)

gsub(",",".","3,1416")
mundo$densidad<-gsub(",",".",mundo$densidad)
mundo[3,vars.incorrectes]
mundo[,vars.incorrectes]<-lapply(mundo[,vars.incorrectes],as.numeric,na.rm=TRUE)
sapply(mundo,class)
head(mundo)





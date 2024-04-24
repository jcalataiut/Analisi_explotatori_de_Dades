#Diagrama de punts amb colors per categories

x<-mtcars[order(mtcars$mpg),]; x
x$color[x$cyl==4]<-"red"
x$color[x$cyl==6]<-"blue"
x$color[x$cyl==8]<-"green"
head(x)


dotchart(x$mpg,labels=row.names(x),cex=0.7,groups=x$cyl,gcolor="black",
         color=x$color,pch=19,
         main="consum en milles per galó de diferents models de cotxes segons nombre de cilindres",
         xlab="Miles per Gallon")


#Gràfics de violí

mu<-2
si<-0.6
set.seed(100) 
bimodal<-c(rnorm(1000,-2,si),rnorm(1000,mu,si)) #rnorm(n,mean=0,sd=1) amb n nombre d'observacions
uniforme<-runif(2000,-4,4)
normal<-rnorm(2000,0,3)

## el layout es un manera més sofisticada que par(mfrow=...) per organitzar gràfics:
## per posar-los en una fila de tres columnes i una fila de 1 columna:
layout(matrix(c(1,2,3,4,4,4,5,5,5),nrow=3))
par(mar=c(2,4.1,4.1,4.1)) #mar especifica el nombre de lines de margens que deixa
hist(normal,col=4,main="normal",xlab="",probability=T,ylab="")
hist(uniforme,col=3,main="uniforme",xlab="",probability=T,ylab="")
hist(bimodal,col=2,main="bimodal",xlab="",probability=T, ylab="")
install.packages(package="vioplot")
library(vioplot)
vioplot(bimodal,uniforme,normal,col=2:4,horizontal=TRUE,main="violí",names=c("bimodal","uniforme","normal"))
boxplot(bimodal,uniforme,normal,horizontal=T,col=2:4,main="boxplot",names=c("bimodal","uniforme","normal"))

layout(1)
x1<-mtcars$mpg[mtcars$cyl==4]
x2<-mtcars$mpg[mtcars$cyl==6]
x3<-mtcars$mpg[mtcars$cyl==8]
vioplot(x1,x2,x3,names=c("cyl=4","cyl=6","cyl=8"),col="gold")

#Boxplots amb punts
jitter(rep(1,5),amount=0.2)
boxplot(iris$Sepal.Length~iris$Species,col=rainbow(4),xlab="",ylab="",cex.axis=0.8)
n<-nrow(iris)
frequencies<-as.vector(table(iris$Species))
desvia1<-jitter(rep(1,frequencies[1]),amount=0.15)
points(desvia1,iris$Sepal.Length[iris$Species=="setosa"],cex=0.5,pch=20)
desvia2<-jitter(rep(2,frequencies[2]),amount=0.15)
points(desvia2,iris$Sepal.Length[iris$Species=="versicolor"],cex=0.5,pch=20)
desvia3<-jitter(rep(3,frequencies[3]),amount=0.15)
points(desvia3,iris$Sepal.Length[iris$Species=="virginica"],cex=0.5,pch=20)
mtext(1,line = 2.3,text="Espècie")
mtext(2,line=2,text="Longitud del sèpal")
mtext(3,line=2,text="Mesures de flors de tres espècies")




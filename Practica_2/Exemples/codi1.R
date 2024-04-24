x <- 1:10
y <- 45:54
x*y
x+y
x^2
sqrt(x)
1/x
# Tots els anteriors són vectors numèrics de longuitud 10

10*x+1
x1 <- c(10,20,30)
x2 <- c(4,5,1,3,4,5)
x1+x2 #suma c(x1,x1) amb x2 (és a dir, repeteix dos cops x1).
#Necessariment l'objecte de major longuitud té que ser multiple del de menor

x3 <- c(20,10)
x1+x3 #Dona error

x1 <- c(10,20,30)
x2 <- c(4,5,1,3,4,5)
(x4 <- c(x1,x2))

sum(x2)
length(x4)

names(x1) <- c("id1","id2","id3"); x1





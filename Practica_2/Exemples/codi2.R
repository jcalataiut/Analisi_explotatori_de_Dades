3>5
x<-c(10,2,5,6,10,3,11)
x>=5 #mira si cada component és major o igual que 5
x==rep(10,7) #compara element a elemnt de cada component del vector
x==10 # compara si cada element és igual a 10
## El resultats de les comparacions són vectors lógics

sum(c(1,3,4))
sum(c(TRUE,TRUE,FALSE)) #Els TRUE==1 i els FALSE==0, conversió implícita
x<-c(10,2,5,6,10,3,11)
sum(x>4)

u <- c(2,3,4,NA,6,NA,100)
is.na(u)
sum(is.na(u)) #qunats valors perduts té el vector u?


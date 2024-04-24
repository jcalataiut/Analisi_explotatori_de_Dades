paste("X","Y","Zabc",sep="") #sense espai de separaciopaste
paste("X",1:4, sep="") #com que 1:4 és un vector, crea un vector
paste("Pacient", 2:6, sep=".")
paste(c("X,Y"), 1:4, sep="")
paste(c("X","Y"), 1:4, sep="")
rep(c("X","Y"), rep(3,2))
paste(rep(c("X","Y"), rep(3,2)), c(1:3,1:3),sep="")

paste(c("X"), 1:4, sep="", collapse="+")

x1 <- c(19,176,82.7)
names(x1) # Dona NULL perque no tenen noms assignats
names(x1) <- c("edat", "alt", "pes") #ara els assignem els noms
x1
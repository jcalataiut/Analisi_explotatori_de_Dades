n <- 7.45 #mitjana de classe
np <- c(9.45, 9.1, 8.85, 8.8, 8.6) #nota assitencia i lliurament 5 millors alum.
ne <- matrix(c(10, 10, 9.3, 9, 8.9, 10, 9.3, 9.7, 8, 8.2, 9.9, 8.9, 9, 8.9, 8.5, 9.7, 9.3, 9.5, 9.7, 8.2), nrow=5, byrow=TRUE); ne
rownames(ne)<-c("Alumne1","Alumne2","Alumne3","Alumne4","Alumne5")
colnames(ne)<-c("Parcial1","Parcial2","Parcial3","Parcial4"); ne

NOTES<-list(n,np,ne)
NOTES<-list(n_mitja_classe=n, np_5mill_alum=np, ne_5mill_alum=ne); 
names(NOTES)



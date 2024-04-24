install.packages("Lahman")
library(Lahman)
search()
data(package="Lahman")

df.salaris<-Salaries; df.salaris
#Quants casos té?
nrow(df.salaris)
#Quantes variables té?
ncol(df.salaris)
#Noms de les variables
names(df.salaris)
help("Salaries",package="Lahman")
head(df.salaris)



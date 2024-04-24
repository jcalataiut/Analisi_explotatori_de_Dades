install.packages("foreign")
library(foreign)
search()
pesedat<-read.spss('pesedat.sav', to.data.frame=TRUE)
head(pesedat)


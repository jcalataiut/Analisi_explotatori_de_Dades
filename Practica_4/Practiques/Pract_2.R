#(1)
passatgers<-read.csv2('Passatgers_ElPrat.csv'); passatgers

## Quines són les variables?
names(passatgers)
##Casos
nrow(passatgers)
##6 primers casos
head(passatgers)

#(2)
read.table('data.csv',header=TRUE,sep=',',na.strings='NA')
read.table('data1.csv',header=TRUE,sep=',',na.strings=c('NA',''))
read.table('data2.csv',header=TRUE,sep=',',na.strings=c('NA','?'))

## Amb xlsx:

install.packages("xlsx")
library(xlsx)
search()

df.noms17<-read.xlsx("Noms_nadons_2017.xlsx",sheetIndex=1, 
                     startRow=10, endRow=29, header=FALSE, 
                     encoding="UTF-8"); df.noms17

df.noms17<-df.noms17[,-6]; df.noms17
names(df.noms17)<-c("Nom", "Ranquing2017", "Quantitat","taxax1000","Ranking2016"); df.noms17

##Amb openxlsx:

install.packages("openxlsx")
library(openxlsx)
###veiem que el paquet openxlsx està enmascarat pel paquet xlsx,
### llavors només podem utilitzar un dels dos

enq<-read.table('ExerPr1Enq.txt',header=TRUE,dec=',')
head(enq)

notes<-read.csv2('notes.csv',header=TRUE,dec=',',na.strings=c('na','np',''))
notes




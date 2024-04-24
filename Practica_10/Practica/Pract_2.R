library(xlsx)
notes<-read.xlsx(file="Notes_assign_comuns_BAT.xlsx", sheetIndex=1, header=T, startRow=1,endRow=1501); head(notes)
summary(notes)

notes<-notes %>% mutate(Sexe=as.factor(Sexe)) %>%
  mutate(BAT=factor(BAT,labels=c("BA", "BCT", "BHCS"))) %>%
  mutate(Curs=as.factor(Curs))

summary(notes)

#(a) 

install.packages("fmsb")
library(fmsb)

notes_a<-notes %>% select(-c("Identificador","Sexe","Curs","BAT")) %>%
  sapply(.,mean) %>% rbind(rep(10,7), rep(0,7),.) %>% as.data.frame(.)

notes_a

radarchart(notes_a)

#(b)

radarchart(notes_a, axistype=1,
           pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4,
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,10,2.5), cglwd=0.8,
           vlcex=0.7 
)

#(c)

## Quina assignatura té la millor nota? CASTELLÀ
## I la pitjor? OPCIÓ_BLOC_3

#(d)
Dones<-notes %>% filter(Sexe=="D") %>% 
  select(-c("Identificador","Sexe","Curs","BAT")) %>% 
  sapply(.,mean) 

Homes<-notes %>% filter(Sexe=="H") %>% 
  select(-c("Identificador","Sexe","Curs","BAT")) %>% 
  sapply(.,mean) 

rownames(not)[3]<-"Tots"

not<-not %>% rbind(rep(10,7), rep(0,7),.) 
radarchart(not, axistype = 1,
           pcol=c(rgb(0.1,0.5,0.7,0.9),rgb(0.1,0.7,0.3,0.9),rgb(0.1,0.1,0.1,0.9)),plwd=c(2,2,5), plty=1,
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,10,2.5), cglwd=0.8,
           vlcex=0.7 
           )
legend(x=0.85, y=0.7, legend=rownames(not[-c(1,2),]),bty='n',pch=20, col=c(rgb(0.1,0.5,0.7,0.9),rgb(0.1,0.7,0.3,0.9),rgb(0.1,0.1,0.1,0.9)),text.col = "grey", cex=1, pt.cex=2.5)
  

## Les dones són millors en Història, Castellà, Català i Anglés.

#(e)

BA<-notes %>% filter(BAT=="BA") %>% 
  select(-c("Identificador","Sexe","Curs","BAT")) %>% 
  sapply(.,mean) 

BCT<-notes %>% filter(BAT=="BCT") %>% 
  select(-c("Identificador","Sexe","Curs","BAT")) %>% 
  sapply(.,mean) 

BHCS<-notes %>% filter(BAT=="BHCS") %>% 
  select(-c("Identificador","Sexe","Curs","BAT")) %>% 
  sapply(.,mean) 

notes_e<-notes %>% select(-c("Identificador","Sexe","Curs","BAT")) %>%
  rbind(rep(10,7), rep(0,7), rep(5,7), BA, BCT, BHCS, .) %>% .[1:6,]

rownames(notes_e)[3:6]<-c("Aprovat", "BA", "BCT", "BHCS")
notes_e

radarchart(notes_e, axistype = 1,
           pcol=c(rgb(0.7,0.2,0.3,0.9),rgb(0.1,0.7,0.3,0.9),rgb(0.1,0.5,0.9 ,0.9), rgb(0.4,0.3,0.6,0.9)), plwd=c(5,2,2,2), plty=1,
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,10,2.5), cglwd=0.8,
           vlcex=0.7 
)
legend(x=0.85, y=0.7, legend=rownames(notes_e[-c(1,2),]),bty='n',pch=20, col=c(rgb(0.7,0.2,0.3,0.9),rgb(0.1,0.7,0.3,0.9),rgb(0.1,0.5,0.9 ,0.9), rgb(0.4,0.3,0.6,0.9)),text.col = "black", cex=1, pt.cex=2.5)



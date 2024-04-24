#1630376

###PROBLEMA 1

#(a)
any.naix<- 2021-edat; any.naix

#(b)
m2.terrassa<- m2.llar*0.15; m2.terrassa

#(c)
m2xind <- (m2.llar+m2.terrassa)/n.individus.llar; m2xind

#(d)
id.complert <- paste("Ind",id, edat, sep="-"); id.complert

###PROBLEMA 2

vector_xy <- rep(c("X","Y"),times=30)
vector_num <- rep(1:30, times=rep(2,30))

unio_xynum <- paste(vector_xy, vector_num, sep=""); unio_xynum

###PROBLEMA 3

#De quantes llars sabem la seua superfície?
(length(m2.llar)-sum(is.na(m2.llar)))

#Quants llars tenen exactament 55 metres quadrats?
sum(m2.llar==55, na.rm=TRUE)

#Quants llars són inferiors a 50 metres quadrats?
sum(m2.llar<50, na.rm=TRUE)

#Quants llars tene 70 o més metres quadrats?
sum(m2.llar>=70, na.rm=TRUE)

#Quants llars tenen entre 60 i 70 metres quadrats?
sum((m2.llar>=60) & (m2.llar<=70), na.rm=TRUE)

###PROBLEMA 4

M_edat<-matrix(edat,ncol=1)
M_no.ind <- matrix(n.individus.llar, ncol=1)
M_m2.llar<- matrix(m2.llar,ncol=1)
mdades<-cbind(M_edat,M_no.ind,M_m2.llar); mdades
colnames(mdades)<-c("edat","n.individus.llar", "m2.llar")


##(a)
dim(mdades)
mode(mdades)
class(mdades)
colnames(mdades)

##(b)
id2<- paste("individ", id, sep=""); id2
M_id2<-matrix(id2,ncol=1)
mdades2<-cbind(M_id2,mdades); mdades2
mode(mdades2)
#Ara el mode de la matriu ha canviat de "numeric" a "character", com 
#a conseqüència d'introduir un vector de caracters.

##(c)
rownames(mdades)<-id2
mdades

#(d)
M<-mdades; M

###PROBLEMA 5

#Segons em pogut veure en la Pràctica 2, sabem que un 3-array és com 
#una col·lecció de matrius una darrere l'altra formants capes o fulls, 
#tots els fulls amb el mateix nombre de files i columnes. 

#Llavors, podem pensar en els 4-array com blocks de capes de matrius,
#identics en el nombre de fulls que contenen i les dimensions de les
#matrius de cada full o capa (ie, mateixes files i columnes en cada capa
# de cada block).

#Però, es pot veure també com una matriu que té nrow=nombre_de_fulls i 
#ncol=µ (es el nombre de blocks que es designa el construir el 4-array),
#on cada component de la matriu es una matriu. 

AAAA<-array(1:96,dim=c(2,4,4,3)); AAAA

###PROBLEMA 6

library(MASS)
help(package="MASS")
search()

#newcombe és un vector numèric que dóna la tercera sèrie 
#mesures del temps de pas de la llum registrades per Newcomb en 1882.

#Llargada del vector newcomb
length(newcomb)

#Mitjada de newcomb
Mijta_newcomb <- sum(newcomb)/length(newcomb); Mijta_newcomb


###PROBLEMA 7

install.packages("AER")




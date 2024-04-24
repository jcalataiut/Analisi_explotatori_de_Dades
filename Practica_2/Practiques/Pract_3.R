notes <- c(9.5, 8, NA, NA, 5.7, 5, 6.1, 5.2, 3.7, 0.8, 9.3, 6, 2, 8.3, 6.4,2.9, 8.9, 4.8, 3.9, 0, 8.8, 9.4, 5.2, 9.3, 8.3, 8.7, 3.1, 5.8, 3.1,
           NA, 6.9, NA, 0.3, 5, 5, 7.6, 2.8, 9, 7, 7.3, 2.2, 6, 9.2, 1.9, 0, 3.8, 6.9, 9.2, NA, 8.8, 5, NA, 6.4, 2.5, 1.3, 0, 7.2, 5, NA, 3.6)

#Alumnes a classe
TAlumns <- length(notes); TAlumns

#S'han presentat tots els alumnes?
!(any(is.na(notes)))

#Quants no s'han presentat?
no.not_aprovats <- sum(is.na(notes)); no.not_aprovats

#Quants alumnes han tret una nota diferent de 0?
no.alumn_not_0 <- sum(notes>0, na.rm=TRUE); no.alumn_not_0

#Quants alumnes han suspès?
no.alumn_suspes <- sum(notes<5, na.rm=TRUE); no.alumn_suspes

#Quants han tret un 5 o un 6?
no.alumn_5_6 <- sum((notes==5)|(notes==6), na.rm=TRUE); no.alumn_5_6

#Quants alumnes han tret un notable?
no.alumnes_notable <- sum((notes>=7) & (notes<9), na.rm=TRUE); no.alumnes_notable

#Quants alumnes han tret un excel·lent?
no.alumnes_excel <- sum(notes>=9, na.rm=TRUE, na.rm=TRUE); no.alumnes_excel



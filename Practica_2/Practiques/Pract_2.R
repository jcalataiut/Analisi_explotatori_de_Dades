#(a)
x <- c(3,5,6,7,8,9)
mitja <- sum(x)/length(x); mitja

#(b)
km <- c(68,123,157,190)
m <- km*1000 # Ho passem a metres
dist_km233 <- (233*1000)-m; dist_km233

names(dist_km233) <- paste("Sort", 3:6, sep="-")
dist_km233

#(c)
Parcial.1 <- c(79,45,83,100,62)
Parcial.2 <- c(85,55,75,98,82)
Ordinador.1 <- c(100,63,55,90,51)
Ordinador.2 <- c(85,37,88,95,77)
Lliuraments <- c(100,0,80,90,80)

notes <- Parcial.1*0.2+Parcial.2*0.25+Ordinador.1*0.2+Ordinador.2*0.25+Lliuraments*0.1
names(notes) <- paste("Alum", 1:5, sep=".")
notes

aprovats <- notes>=50
no.aprovats = sum(aprovats); no.aprovats
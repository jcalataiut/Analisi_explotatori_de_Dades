table(grup)
table(cal)
df.cal<-as.data.frame(table(cal)); df.cal
(ni<-df.cal$Freq) #freq. absolutes
n<-sum(ni) #total observacions
(fi<-ni/n) #freq. relatives
(pci<-fi*100) #percentatges
(Ni<-cumsum(ni)) #freq. absolutes acum.
(Fi<-cumsum(fi)) #freq. relatives acum.
(Pci<-Fi*100) #percentatges acum.
(df.cal<-data.frame(df.cal,fi,pci,Ni,Fi,Pci))
options(digits=2)
df.cal


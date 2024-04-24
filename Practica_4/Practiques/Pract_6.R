#Utilitzarem els data frames Avaluades_18_19 i Avaluats_18_19 ja 
#elaborats a les pràctiques anteriors

dones<-c(sum(Avaluades_18_19$Avaluades),sum(Avaluades_18_19$`Promocionen sense pendents juny`),sum(Avaluades_18_19$`Promocionen sense pendents setembre`),
        sum(Avaluades_18_19$`Han de repetir`))
homes<-c(sum(Avaluats_18_19$Avaluats),sum(Avaluats_18_19$`Promocionen sense pendents juny`),sum(Avaluats_18_19$`Promocionen sense pendents setembre`),
         sum(Avaluats_18_19$`Han de repetir`))
total<-dones+homes

Total_Avaluacio_18_19<-data.frame(Total=total,Dones=dones,Homes=homes)
rownames(Total_Avaluacio_18_19)<-c("Avaluats","Promocionen sense pendents juny","Promocionen sense pendents setembre","Han de repetir")

Total_Avaluacio_18_19

write.table(Total_Avaluacio_18_19,"Curs18_19.csv", sep=';', dec='.',row.names=TRUE)
save(Total_Avaluacio_18_19,file="TotalAvaluacio1819.RData")


library(readxl)
Avaluats_18_19<-read_excel("batx-a-12.xls", sheet = "batx-a-12", range = "AM13:AP54", col_names = FALSE)
Avaluats_18_19[5]<-Avaluades_18_19[1]
Avaluats_18_19

Avaluats_18_19_b<-Avaluats_18_19
Avaluats_18_19[1]<-Avaluades_18_19[1]
for(i in 1:range(4)){
  Avaluats_18_19[i+1]<-Avaluats_18_19_b[i]
}
names(Avaluats_18_19)<-c("Comarca","Avaluats","Promocionen sense pendents juny",
                         "Promocionen sense pendents setembre","Han de repetir")
Avaluats_18_19
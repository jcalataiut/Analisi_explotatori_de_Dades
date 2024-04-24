Avaluades_18_19<-read.xlsx("batx-a-12.xls",sheetIndex=1,
                           startRow=13,endRow=54,colIndex=c(2,23:26),header=FALSE); Avaluades_18_19
names(Avaluades_18_19)<-c("Comarca","Avaluades","Promocionen sense pendents juny",
                          "Promocionen sense pendents setembre","Han de repetir")
Avaluades_18_19

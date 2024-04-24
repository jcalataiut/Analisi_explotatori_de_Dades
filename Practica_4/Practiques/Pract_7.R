PerTur17.dones<-subset(PerTur17, SEXE=="DONA"); PerTur17.dones

#Observa que per a PerTur17 quan intentem fer EDAT>65 no ens deixa perque
#està en forma de factor la variable EDAT, llavors tenim que convertir-la
#en vector i això és el que haviem fet en PerTur17_b (en canvi si els levels son character
#si que ens deixa per les comparacions com succedeix en PerTur17.dones):
PerTur17.seniors<-PerTur17[PerTur17$EDAT>65, ]; PerTur17.seniors 
PerTur17.seniors<-PerTur17_b[PerTur17_b$EDAT>65, ]; PerTur17.seniors 

names(PerTur17)
PerTur17.part1<-subset(PerTur17,select=c(1,39:50)); head(PerTur17.part1)
PerTur17.part2<-PerTur17[PerTur17$LLENGUA_ENQ=="CATALÀ", 
                        c("SEXE","LLENGUA_ENQ","FREQ_VISIT_GOTIC","FREQ_VISIT_BARCELONETA", 
                          "FREQ_VISIT_BORN","FREQ_VISIT_RAVAL","FREQ_VISIT_GRACIA",
                          "FREQ_VISIT_EIXAMPLE","FREQ_VISIT_POBLESEC","FREQ_VISIT_POBLENOU",
                          "FREQ_VISIT_FABRAICOATS","FREQ_VISIT_FORUM","FREQ_VISIT_ANTIAERIES",
                          "FREQ_VISIT_PARCNOUB")]; head(PerTur17.part2)
PerTur17.part3<-PerTur17[1:500,c("SEXE","EDAT","NACIO_ACT")]; PerTur17.part3






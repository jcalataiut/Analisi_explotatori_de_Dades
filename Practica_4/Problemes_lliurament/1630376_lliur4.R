### PROBLEMA 1

barcsv<-read.csv2("BarometreGenere2021_Microdadess_CSV.csv"); barcsv
library(foreign)
barspss<-read.spss("BarometreGenere2021_Microdatos_SPSS.sav",to.data.frame=T); barspss
barspss_df<-as.data.frame(barspss); barspss_df

df.genere<-barcsv

#(a) Quantes variables té?
ncol(df.genere)

#Quants casos?
nrow(df.genere)

#(b) Visualització 1 al 10 variables amb els 3 primers casos
df.genere[1:3,1:10]

#(c) Sub-dataframe enquestats del grup d'edat 20-24
df.mitjans<-subset(df.genere,C_EDAD_REC==2); head(df.mitjans)

#(d) Sub-dataframe de noies i nois
df.noies<-df.genere[df.genere$C_SEXO==1,]
df.nois<-subset(df.genere, C_SEXO==2)

#(e) Sub-dataframe noies que viuen a una gran ciutat
df.noies.ciutat<-df.genere[df.genere$C_HABITAT==3, ]

#(f) Sub-dataframe nois que no viuen a una gran ciutat
df.nois.nociutat<-subset(df.nois, C_HABITAT!=3)

#(g) Dataframe amb certes variables
df.classif<-subset(df.genere, select=c("C_SEXO","C_EDAD_REC",
                                       "C_CLASESOCIAL","C_VULNERABILIDAD",
                                       "C_ESTUDIOS","C_TRABAJO","C_NACIONALIDAD"))
head(df.classif)

#(h) Quantes noies de 25-35 tenen estudis superiors?
df.noies.25_30<-subset(df.genere, C_SEXO==1 & C_EDAD_REC==3, select=c("C_SEXO"))
noies.25_30<-sum(df.noies.25_30$C_SEXO); noies.25_30

###una altra forma
noies.25_30_b<-sum(df.genere$C_SEXO==1 & df.genere$C_EDAD_REC==3, na.rm=TRUE); noies.25_30_b

#Quants nois d'aquesta edat tenen estudis superiors
nois.25_30.es<-sum(df.genere$C_SEXO==2 & df.genere$C_EDAD_REC==3 & df.genere$C_ESTUDIOS==3, na.rm=T); nois.25_30.es

df.nois.25_30.es<-subset(df.genere, C_SEXO==2 & C_EDAD_REC==3 & C_ESTUDIOS==3, select=c("C_SEXO"))
nois.25_30.es<-sum(df.nois.25_30.es$C_SEXO)/2; nois.25_30.es

### PROBLEMA 2

casos_cov<-read.csv("Registre_de_casos_de_COVID-19_a_Catalunya_per_regi__sanit_ria__sexe_i_edat.csv"); head(casos_cov)

#(a) Quants homes de 20-29 anys?
df.joves<-subset(casos_cov,SexeDescripcio=="Home" & EdatRang=="20-29")
nrow(df.joves)

#(b) 
df.17oct21<-subset(casos_cov, TipusCasData=="17/10/2021")
df.17oct20<-subset(casos_cov, TipusCasData=="17/10/2020")
##Casos dia 17/10/20
nrow(df.17oct20)
##Casos dia 17/10/21
nrow(df.17oct21)

#(c)
df.20jun21<-subset(casos_cov, TipusCasData=="20/06/2021")
df.30jun21<-subset(casos_cov, TipusCasData=="30/06/2021")

casos.20jun21<-sum(df.20jun21$NumCasos, na.rm=T)
casos.30jun21<-sum(df.30jun21$NumCasos, na.rm=T)

df.20jun21.60_69<-subset(df.20jun21, EdatRang=="60-69")
df.30jun21.60_69<-subset(df.30jun21, EdatRang=="60-69")

casos.20jun21.60_69<-sum(df.20jun21.60_69$NumCasos)
casos.30jun21.60_69<-sum(df.30jun21.60_69$NumCasos)

(prop.20jun21<-casos.20jun21.60_69/casos.20jun21)
(prop.30jun21<-casos.30jun21.60_69/casos.30jun21)

#(d)
dates1<-paste(10:16,"/10/2021",sep=""); dates1
dates2<-paste(10:16,"/10/2020",sep=""); dates2

#(e)
df.21<-casos_cov[casos_cov$TipusCasData %in% dates1, ] 
tail(df.21)
head(df.21)

df.20<-casos_cov[casos_cov$TipusCasData %in% dates2, ]
tail(df.20)
head(df.20)

casos.sem21<-sum(df.21$NumCasos)
casos.sem20<-sum(df.20$NumCasos)

###Estem millor que l'any passat?
casos.sem21<casos.sem20

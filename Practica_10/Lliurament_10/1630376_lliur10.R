# PROBLEMA 1

gh<-read.csv("GastoHogaresEduc.csv", header=T,sep=",",dec=".",na.strings = c(NA," ")); head(gh)

## Apartat 1(a)
library(tidyverse)
install.packages("hrbrthemes")
library(hrbrthemes)

GHE<-gh %>% filter(!is.na(GTT),GTT>0)

gh %>% filter(!is.na(GTT),GTT>0,!is.na(C34A)) %>%
  ggplot(aes(GTT,C34A))+
  geom_point(color="blue")+
  geom_smooth(method=lm , color="red", se=FALSE)+
  labs(x="Despesa total en educació", title="Import d'altres estudis \n en funció despesa total en educació",
       y="Import d'altres estudis")+
  theme_ipsum()
  
gh %>% filter(!is.na(GTT),GTT>0,!is.na(C34A),!is.na(C01)) %>%
  mutate(C01 = factor(C01,levels=c(1,2,3),labels=c("E.Pública","E.Concertada","E.Privada"))) %>%
  ggplot(aes(x=GTT, y=C34A, color=C01))+
  geom_point()+
  geom_smooth(method=lm , color="black", se=FALSE)+
  labs(x="Despesa total en educació", title="Import d'altres estudis \n en funció despesa total en educació",
       y="Import d'altres estudis")+
  theme_ipsum()

# PROBLEMA 2

HAC<-read.csv("HappinessAlcoholConsumption.csv", header=T, sep=',', dec='.'); head(HAC)
summary(HAC)

#Apartat (a)

HAC_modif<-HAC %>% mutate(Com_alc=Beer_PerCapita+Spirit_PerCapita+Wine_PerCapita) %>%
  mutate(Region=factor(Region))

HAC_modif %>%
  ggplot(aes(y=Com_alc, x=HDI, size=HappinessScore, color=Region))+
  geom_point(alpha=0.5)+
  scale_size(range=c(.1,20), name="HappinessScore")+
  labs(y="Consum total d'alcohol", title="Gràfic de bombolles de HDI y Consum d'alcohol per Regions", x="Índex de desenvolupament humà (HDI)")+
  theme_ipsum()

### Interpretació: A partir del gràfic s'observa que a major HDI, major és el consum d'alcohol en aquest països
###                Aixina, una taxa superior de HDI va acompanyada d'una major taxa de consum d'alcohol (aquest factor
###                es pot entendre com a conseqüencia de tractar-se de països més desenvolupats que podem gaudir
###                de major temps d'oci). Hi ha una major felicitat quan major es el HDI i extranyament un consum
###                elevat d'alcohol s'associa també amb una alta felicitat. Casos excepcionals són com alguns països de 
###                del sud-est asiàtic que encara que tenen un elevat HDI mantenen en mínims el seu consum d'alcohol. 
###                No es extrany pensar en que els països amb alt HDI consumeixquen més alcohol ja que un major HDI 
###                sól anar relacionat a un poder adquisitiu superior (que poden destinar al consum d'alcohol). Un altre cas
###                és el de alguns països de LatinoAmérica, que presenten baixos HDI pero tenen un consum superior (el triple)
###                de la resta amb un mateix HDI. Els major consumidor d'alcohol son els països europeus (sobretot, centre i oest).


## Apartat (b)

Beer<-HAC[,-c(8,9)]
Beer$Alcohol<-rep("Beer",122)
colnames(Beer)[7]<-paste('Consumption_PerCapita')
Spirit<-HAC[,-c(7,9)]
Spirit$Alcohol<-rep("Spirit",122)
colnames(Spirit)[7]<-paste('Consumption_PerCapita')
Wine<-HAC[,-c(7,8)]
Wine$Alcohol<-rep("Wine",122)
colnames(Wine)[7]<-paste('Consumption_PerCapita')
HAC2<-rbind(Beer,Spirit,Wine); head(HAC2)

ggplot(data=HAC2, aes(x=Consumption_PerCapita, group=Alcohol, fill=Alcohol)) +
  geom_density(adjust=1.5, alpha=.4)+
  labs(x="Consum d'alcohol per càpita", title="Gràfic de densitat del consum d'alcohol per capita \n per tipus de begudes alcohóliques", y="Densitat")

### Interpretació: A partir del gràfic es poden deduir certes conclusions. En primer lloc,
###                per a països amb consums d'alcohol petits (<50) veiem que destaca el consum
###                de ví. En canvi, quan un país presenta una alta taxa de consum d'alcohol per capita
###                aquest sòl anar relacionat amb un consum de cervesa superior al ví o spirit.

## Apartat (c)

Q<-quantile(HAC$HDI,probs=c(0.1,0.9)); Q

HAC_per10<-HAC %>% filter(HDI<=Q[1]) %>% arrange(desc(HDI))
HAC_per90<-HAC %>% filter(HDI>=Q[2]) %>% arrange(desc(HDI))
HAC_per<-rbind(HAC_per90, HAC_per10); HAC_per

HAC_per %>% arrange(HDI) %>% mutate(Country=factor(Country, levels=Country)) %>%
  ggplot(aes(x=Country, y=HDI))+
  geom_segment(aes(xend=Country, yend=0)) +
  geom_point( size=4, color="violet") +
  coord_flip()+
  labs(y="Índex de desenvolupament humà", title="Gràfic lollipop 10% menor HDI i 10% major HDI", x="Països")

### Interpretació: Els països que pertanyen al 10% amb un HDI més alta presenten petites
###                diferències entre ells. El HDI del major del 10% més baix es la meitat del país
###                amb un HDI més petit del 10% més alt. Açò posa sobre la taula, la presència
###                de grans desigualtats entre aquest països.














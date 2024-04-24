mtcars %>%
  filter(am==0) %>%
  select(c('mpg','disp')) %>%
  summary

load("GastoHogaresEduc.RData"); fichero_salida
str(fichero_salida)
fichero_salida<-fichero_salida %>% filter(!is.na(MCL),!is.na(C11A)) 
# Aquesta instrucció inicial fa que es guarde el resultat de la 
# dreta de la pipa en l'esquerra

str(fichero_salida)

fichero_salida <- fichero_salida %>%
  mutate(SEXO=factor(SEXO, labels=c("dona","home")))
str(fichero_salida)

install.packages("magrittr")
library(magrittr)
library(tidyverse)
search()

fichero_salida %<>% mutate(SEXO=factor(SEXO, labels=c("dona","home")))
str(fichero_salida)





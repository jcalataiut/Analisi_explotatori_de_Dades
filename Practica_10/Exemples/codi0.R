install.packages('tidyverse')
library(tidyverse)
search()

install.packages(c('ggplot2','tibble','tidyr','readr','purrr','dplyr','stringr'))
sapply(c('ggplot2','tibble','tidyr','readr','purrr','dplyr','stringr'),library, character.only=TRUE)

data(mtcars)

# sense la filosofia de les pipes
sub.mtcars<-subset(mtcars,am==0,select=c('mpg','disp'))
summary(sub.mtcars)

# amb la filosofia de les pipes
## METODE 1:
subset(mtcars,am==0,select=c('mpg','disp')) %>% summary()

## METODE 2:
mtcars %>% subset(.,am==0,select=c('mpg','disp')) %>% summary()

iris %>%
  subset(Sepal.Length>5) %>%  #no es posa el punt perque ho entén
  aggregate(.~Species,.,mean) 

sub.iris<-subset(iris,Sepal.Length>5)
aggregate(.~Species,data=sub.iris,mean) # fixar-se que el primer
                                        #punt s'ha de posar igual, no té res a veure amb la pipa

rnorm(200) %>% 
  round(digits=1) %>%
  sort() %>%
  matrix(.,ncol=10)

rnorm(200) %>% 
  matrix(ncol=2) %T>%
  plot %>%
  colSums




library(ggplot2)
data(diamonds) 

plot(diamonds$carat,diamonds$price, col=diamonds$color,
     pch=as.numeric(diamonds$cut),xlab="carat",ylab="price")

legend(3.3,7500,legend=levels(diamonds$color),fill=1:7,title="col",cex=0.7)
legend(4,7500, legend=levels(diamonds$cut),pch=1:5,cex=0.7,title="cut")

library(ggplot2)
ggplot(diamonds, aes(carat,price,col=color,shape=cut))+geom_point()

library(ggplot2)
library(dplyr)
install.packages("gapminder")
library(gapminder)

data<-gapminder %>% filter(year=='2007') %>% dplyr::select(-year)

data %>% arrange(desc(pop)) %>%
  mutate(country = factor(country,country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) + 
  geom_point(alpha=0.5) + 
  scale_size(range = c(.1, 20), name='Population (M)')



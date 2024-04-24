ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, shape=class))

ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color="blue")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + aes(x=displ,y=hwy)+
  geom_point(col=4)+
  geom_smooth(col=2)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

ggplot(data=mpg)+
  aes(x=displ,y=hwy,col=drv)+
  geom_point()+
  geom_smooth(mapping=aes(linetype=drv,col=drv))

ggplot(data=mpg)+
  aes(x=displ,y=hwy,col=drv)+
  geom_point()+
  geom_smooth(mapping=aes(linetype=drv),col=1)

ggplot(data=mpg)+
  aes(x=displ,y=hwy,col=drv)+
  geom_point()+
  geom_smooth(mapping=aes(col=drv),method="lm")+
  scale_color_manual(values =c(3,4,6))

#Diagrama de barres

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, fill=clarity))

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, fill=clarity), position="fill")

ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut, fill=clarity), position="dodge")

# Altres diagrames

ggplot(data=diamonds)+
  stat_summary(
    mapping=aes(x=cut, y=depth),
    fun.ymin=min,
    fun.ymax=max,
    fun.y=median
  )

  ## boxplot

data(ToothGrowth)
ToothGrowth<-ToothGrowth %>%
  mutate(dose=as.factor(dose))

p <- ggplot(ToothGrowth, aes(x=dose, y=len))+
  geom_boxplot()
p

  ## Rotar el gràfic

p + coord_flip()

ggplot(ToothGrowth, aes(x=dose, y=len)) +
  geom_boxplot(notch=TRUE)

ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot(outlier.colour = "red", outlier.shape = 8,
               outlier.size = 4)

p + geom_dotplot(binaxis="y", stackdir="center", dotsize=1)

p + geom_jitter(shape=16, position=position_jitter(0.2), sixe=3)

ggplot(data = diamonds) + 
  stat_summary(
    mapping=aes(x=cut, y=depth),
    fun.ymin=min,
    fun.ymax=max,
    fun.y=median
  ) +
  coord_cartesian(ylim=c(0,80)) +
  labs(x="talls", title="Max, min i median", y="profunditat")

  ## Representar per grups  

ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) + 
  facet_wrap(~class, nrow=2)

ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy)) +
  facet_grid(drv~cyl)


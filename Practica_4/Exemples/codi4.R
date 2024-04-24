df<-data.frame(x1=c(2,4,6,8),x2=c(1,0,0,1),x3=c("a","b","b","a"))
df

(df1<-subset(df,x2==0))
df2<-subset(df,x2==0,select=c("x1","x3"))
df2
df3<-subset(df,x2==0 | x1>3); df3


v<-c(3,4,NA,NA,2,10,1,NA)
is.na(v)
!is.na(v)
seleccio<-!is.na(v)
v[seleccio]

df
(df1<-df[df$x2==0,])
df2<-df[df$x2==0,c('x1','x2')]; df2
df2<-df[df$x2==0,c(1,3)]; df2
df3<-df[df$x2==0 | df$x1>3, ]; df3

library(MASS)
data("anorexia")
names(anorexia)
dim(anorexia)
anorexia$AugmentRelatiu<-100*(anorexia$Postwt-anorexia$Prewt)/anorexia$Prewt
head(anorexia)

#construïm tres sub-dataframes segons tractament:
d.FT<-anorexia[anorexia$Treat=="FT",c("Treat","AugmentRelatiu")]; d.FT
d.Cont<-anorexia[anorexia$Treat=="Cont",c("Treat","AugmentRelatiu")]; d.Cont
d.CBT<-anorexia[anorexia$Treat=="CBT",c("Treat","AugmentRelatiu")]; d.CBT

#utilitzant la funció subset equivaldria a:
d.FT<-subset(anorexia,Treat=="FT", select=c("Treat","AugmentRelatiu")); d.FT
d.Cont<-subset(anorexia,Treat=="Cont",select=c("Treat","AugmentRelatiu")); d.Cont
d.CBT<-subset(anorexia,Treat=="CBT", select=c("Treat","AugmentRelatiu")); d.CBT

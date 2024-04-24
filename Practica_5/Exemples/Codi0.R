x1<-c(9,4,8,2,1,7,8,10,1); x2<-c(5,8,8,0,4,5,5,8,4)
x3<-c("A","B","B","B","A","A","A","B","B")
df1<-data.frame(alg=x1,cal=x2,grup=x3); df1

alg
attach(df1)
alg

grup<-c('A','B','AB','O','A','A','B','O','O')
attach(df1)
grup

attach(df1)
ls()

detach(df1) ###com que l'hem obert tres vegades abans
            ###llavors tenim que executar tres vegades detach()
            ###una per cada cop que l'obris
alg

length(df1[[1]])
length(df1$alg)
mean(df1[[1]])
mean(df1$alg)

var(df1$cal)  #la variància es la corregida
sd(df1$cal)   #la desviació típica es la seua arrel quadrada
median(df1$alg)
range(df1$cal)
(R<-range(df1$cal)[2]-range(df1$cal)[1])

attach(df1)
length(df1); mean(alg); median(alg); var(cal); sd(cal)
range(cal); (R<-range(cal)[2]-range(cal)[1])
(R<-max(cal)-min(cal))

print(paste("mitjana de càlcul=",mean(cal)))
print(paste("range=",R))
print(list("mitjana càlcul"=mean(cal),"range càlcul"=R))

var<-var(cal); s<-sd(cal)
var==s^2
isTRUE(all.equal(var,s^2))

median(alg)
sort(alg)

sum(alg)
sum(alg)/length(alg)==mean(alg)
suma<-sum(alg); n<-length(alg)
isTRUE(all.equal(suma/n,mean(alg)))

?quantile
quantile(alg,probs=.5)
quantile(alg,probs=.2)
quantile(alg,probs=.333)
quantile(alg,probs=seq(0,1,by=.1))
quantile(alg,probs=seq(0,1,by=.25))
quantile(alg,probs=.5,type=2)

colMeans(df1)
colMeans(df1[,-3]) #mitjana per columnes
rowMeans(df1[,-3]) #mitjana peer files
colSums(df1[,-3])
rowSums(df1[,-3])
df1["grup"]<-as.factor(df1$grup)

summary(df1)






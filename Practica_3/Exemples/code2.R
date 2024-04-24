df1<-data.frame(alg=c(5,4,8,2,7),cal=c(6,8,8,2,3),grup=c("A","B","B","A","B")); df1
rownames(df1)<-c("Pere","José M","Luisa","Lluís","Olga")
df1

#funcions info. del data.frame
length(df1)
dim(df1)
names(df1)
colnames(df1)
rownames(df1)

?iris
mode(iris)
class(iris)
names(iris)
dim(iris)
nrow(iris)
ncol(iris)

library(AER)
data(Affairs)
af<-data.frame(Affairs)
head(af)
tail(af)
str(af)



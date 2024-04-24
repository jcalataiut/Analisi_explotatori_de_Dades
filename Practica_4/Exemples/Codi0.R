a<-1:10
b<-LETTERS[4:10]
save(a,b,file="ab.RData")
load("ab.RData")

data()
?ToothGrowth
dim(ToothGrowth)
head(ToothGrowth)
tail(ToothGrowth)
names(ToothGrowth)

ls()
data(ToothGrowth)
ls()
dents<-ToothGrowth
len
dents$len
dents$supp
dents$dose

data(package="AER")
help('Affairs',package='AER')
data('Affairs', package='AER')
ls()
search()
data(package=.packages(all.available=TRUE))

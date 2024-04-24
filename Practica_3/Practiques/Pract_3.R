#(a)
data(mtcars)
df.cotxes<-data.frame(mtcars)
mode(df.cotxes)
class(df.cotxes)
names(df.cotxes)
dim(df.cotxes)
nrow(df.cotxes)
ncol(df.cotxes)
str(df.cotxes)
head(df.cotxes,n=10L) #la funció head es head(x,n=6L,...), 
                      #per defecte només pren les 6 primeres files
tail(df.cotxes)

#(b)
df.interes<-data.frame("sexe"=sex, "edat"=edat, "interès per l'estadística"=iest,"interès per la política"=ipol);df.interes

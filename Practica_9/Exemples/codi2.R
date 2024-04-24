library(lattice)
attach(df)

xyplot(salario~salini,groups=sexo,data=df,
       main="salari respecte del salari incial per sexes",
       xlab="salari inicial",ylab="salari actual",auto.key=T)

xyplot(salario~salini, groups=sexo, data=df, col=gray.colors(3),
       main="salari respecte del salari inicial per sexes",
       xlab="salari inicial", ylab="salari actual", pch=c(17,20), type=c("p","r"),
       key=list(text=list(levels(sexo)),lines=list(pch=c(17,20), type="b",col=gray.colors(3)[1:2]),columns=2,divide=1))

## type("p","r") indica que pose els plotting-characters (que són els puntets)
## i la "r" és per a la recta de regressió.

## key serveix per a la legenda, on hi ha que fer una llista d'on text es les paraules que es volen escriure
## lines són les coses que es volen posar al costats on pch son el tipus de plotting-characters, type="b"
## de both serveix per dir que pose line i plotting-character i finalment tria el color per a les rectes i punts de la legenda

model.grups<-by(df,sexo,function(x) lm(salario~salini,data=x))

model.grups$Mujer$coefficients
model.grups$Hombre$coefficients


library(lme4)
d<-lmList(formula = salario~salini | sexo, data=df); d

d$Hombre$coefficients
d$Mujer$coefficients

detach(df)




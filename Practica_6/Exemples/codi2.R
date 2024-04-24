mitjgeom<-function(x){
  if(any(x<=0)) stop("mijtana geom no es pot calcular, algun x<=0!")
  else{
    n<-length(x)
    lg=sum(log(x))/n
    exp(lg)
  }
}

dades<-1:10
mitjgeom(dades)
dad1<-c(-1,2,4)
mitjgeom(dad1)

mitjana.ordre.positiu<-function(x,p){
  if(any(x<=0)) {stop ("X<=0")}
  if(p<=0) {stop ("p<=0")}
  else mean(x^p)^(1/p)
}

set.seed(1)
y<-runif(100,min=1,max=2)
mitjana.ordre.positiu(y,3)
(sum(y^3)/100)^(1/3)

mitjana.ordre.p<-function(x,p){
  if(any(x<=0)) {stop("X<=0")}
  if(p==0) {return(exp(mean(log(x))))}
  else mean(x^p)^(1/p)
}

sapply(c(2,3,4), function(p) mitjana.ordre.p(y,p))
sapply(c(2,3,4),function(p) paste("ordre",p,"=",mitjana.ordre.p(y,p)))
"mitjana ordre 2 = 1.54102086359341" 
"mitjana ordre 3 = 1.56296399646648" 
"mitjana ordre 4 = 1.58349357346897"





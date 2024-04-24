x<-0:5
y<-choose(5,x)*0.3^x*0.7^(5-x);y #choose es el numero combinatorio
plot(x,y)
text(1,0.05,expression(paste(bgroup("(",atop(5,x),")"),0.3^x,0.7^(5-x))))
title(main=expression(paste(bgroup("(",atop(5,x),")"),0.3^x,0.7^{5-x})))
x<-seq(0,10,by=0.1)
plot(x,sqrt(x),pch=16,ylab="f(x)")
title(main = expression(paste("la funció ",sqrt(x))))
id <- paste("id", 1:10, sep=":")
id 

Pacients_m1 <- paste(rep(c("H","D"), times=c(5,10)), 201:215, sep="-"); Pacients_m1
Pacients_m2 <- paste(rep(c("D","H"), times=c(10,5)), c(206:215,201:205), sep="-"); Pacients_m2


temp_m1 <- rep(c(15,17,20,23,27,29,26,23,18,15),times=c(2,1,1,1,1,2,1,1,1,1)); temp_m1
temp_m2 <- c(15,15,17,20,23,27,29,29,26,23,18,15); temp_m2

names(temp_m1) <- month.abb
temp_m1


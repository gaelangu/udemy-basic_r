x <- c("a","b","c","d","e")
x
x[c(1,5)]

#subsetting
x[1]

Games
Games[1:3, 6:10]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]
Games[1,5]

is.matrix(Games[1,])
is.vector(Games[1,])

Games[1, , drop=F]
Games[1, 5, drop=F] #drop=F will get same class of objects as matrix


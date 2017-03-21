
install.packages("ggplot2")

?qplot()
?ggplot()
?diamonds

library(ggplot2) #use library to activate package but package is a package

qplot(data=diamonds, carat, price,
      colour=clarity, facets=.~clarity)

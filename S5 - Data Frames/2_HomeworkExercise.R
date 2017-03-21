getwd()

hw <- read.csv("Section5-Homework-Data.csv")

str(hw)
head(hw)
tail(hw)

data1960 <- hw[hw$Year == 1960,]
head(data1960)
str(data1960)

data2013 <- hw[hw$Year == 2013,]
head(data2013)
str(data2013)


data1960 <- cbind(data1960, Life_Expectancy_At_Birth_1960)
colnames(data1960) <- c("Country", "Code", "Region", "Year", "Fertility.Rate", "Life.Expectancy")
head(data1960)
rm(Life_Expectancy_At_Birth_1960)

data2013 <- cbind(data2013, Life_Expectancy_At_Birth_2013)
colnames(data2013) <- c("Country", "Code", "Region", "Year", "Fertility.Rate", "Life.Expectancy")
head(data2013)
rm(Life_Expectancy_At_Birth_2013)

qplot(data=data1960, x=Fertility.Rate, y=Life.Expectancy, colour=Region,
      size=I(5), alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate (1960)")

qplot(data=data2013, x=Fertility.Rate, y=Life.Expectancy, colour=Region,
      size=I(5), alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate (2013)")

#fertility rate dropped in general between the 2 years. (less than 2 children on avg)

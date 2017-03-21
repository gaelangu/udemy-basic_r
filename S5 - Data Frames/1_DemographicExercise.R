

#Method 1: Select the File Manually
stats <- read.csv(file.choose())

stats

#Method 2: Set Working Directory and Read Data
getwd()

#windows: Desktop
setwd("C:\\Users\\Gaelan\\Desktop\\R Programming")
#Mac: Desktop
setwd("/Users/Gaelan/Desktop/R Programming")
getwd()
rm(stats)

setwd("C:\\Users\\Gaelan\\Dropbox\\#Documents\\#R Scripts")
setwd("/Users/Gaelan/Dropbox/#Documents/#R Scripts")
stats <- read.csv("DemographicData.csv")


#------------------------------------------------------ Exploring Data

stats

#number of rows, exclude header
nrow(stats)
#imported 195 rows

#number of cols
ncol(stats)

#1st 6 rows, unless otherwise specified
head(stats, n=10)

#last 6 rows, unless otherwise specified
tail(stats, n=8)

#structure (quick summary) - most important functions
str(stats)
  #Factor means categories

#random variables distributed uniformly
runif()
rnorm()

#summary stat
summary(stats)


#------------------------------------------------------ Using the $ sign

head(stats)
stats[3,3]
stats[3, "Birth.rate"]
#cols have names but rows have NUMBERS

#extract whole column
stats$Internet.users
  #same as
  stats[,"Internet.users"]

#extract specific cell in col
stats$Internet.users[2]

#extracts factors in a col
levels(stats$Income.Group)

#------------------------------------------------------ Basic Operations with a DF

stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

#Remember how the [] work:
is.data.frame(stats[1,]) #no need for drop=F
is.data.frame(stats[,1]) #FALSE
is.data.frame(stats[,1,drop=F]) #TRUE

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#test of knowledge
stats$xyz <- 1:5
head(stats, n=10) #vector is recycled

#remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)


#------------------------------------------------------ Filtering a Data Frame

head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]


#------------------------------------------------------ Introduction to qplot()

qplot(data=stats, x=Internet.users)

#i has to be put around the value so that it is not assigned
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), 
      colour=I("blue"))

qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")


#------------------------------------------------------ Visualizing what we need

qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), colour=I("red"))

#categorize by income group
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), colour=Income.Group)
  #low birth rate, high internet users (usually associated with high income)


#------------------------------------------------------ Creating DataFrames

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)

head(mydf)
colnames(mydf) <- c("Country","Code","Region")

head(mydf)

rm(mydf)

#naming own data frame columns as functions (no "" marks)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
  #works in cbind and rbind as well!

head(mydf)
tail(mydf)
summary(mydf)


#------------------------------------------------------ Merging Data Frames

head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x="Country.Code", by.y="Code")
head(merged)

#remove duplicate col
merged$Country <- NULL
str(merged)
tail(merged)


#------------------------------------------------------ Visualizing with New Split

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)

#1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region,
      size=I(5), shape=I(23))

#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region,
      size=I(5), shape=I(19), alpha=I(0.6))

#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region,
      size=I(5), shape=I(19), alpha=I(0.6), 
      main="Birth Rate vs Internet Users")





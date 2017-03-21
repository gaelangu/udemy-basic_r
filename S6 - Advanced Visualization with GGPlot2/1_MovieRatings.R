getwd()
install.packages("ggplot2")
library(ggplot2)

movies <- read.csv("Movie-Ratings.csv")
head(movies)

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

head(movies)
tail(movies)
str(movies)
summary(movies)

#convert years into factors (currently int)
factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)

#aesthetics is how your data maps to what you want to see
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

#add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) + 
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre,size=BudgetMillions)) + 
  geom_point() #adding an object


#>>> This is #1 (we will improve it)

#------------------------------- Plotting with Layers

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre,size=BudgetMillions))

#point
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_line() + geom_point()


#------------------------------- Overriding Aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()

#overriding aes
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(colour=BudgetMillions))

#q remains the same
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")
  #Budget does not really affect rating

#ex4
q + geom_line() + geom_point()
#reduce line size (no need for aes() as 
#this is setting aes not mapping aes)
q + geom_line(size=1) + geom_point()


#------------------------------- Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#add colour
#1. Mapping (what we've done so far)
r + geom_point(aes(colour=Genre))

#2. Setting
r + geom_point(colour="DarkGreen")
#ERROR:
#r + geom_point(aes(colour="DarkGreen"))
  #you are mapping colour to "DarkGreen" variable

#you MAP VARIABLES using aes() and SET ACTUAL VALUES

#1. Mapping
r + geom_point(aes(size=BudgetMillions))

#2. Setting
r + geom_point(size=10)
#ERROR:
#r + geom_point(aes(size=10))


#------------------------------- Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

#add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))
#add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
#>>> 3 (we will improve this chart)

#sometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")


#------------------------------- Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                    fill="White", colour="Blue")



#another way

t <- ggplot(data=movies)
t + geom_histogram(aes(x=AudienceRating),
                   binwidth=10,
                   fill="White", colour="Blue")
#>>> 4
t + geom_histogram(aes(x=CriticRating),
                   binwidth=10,
                   fill="White", colour="Blue")
#>>> 5

t <- ggplot()
#skeletonplot


#------------------------------- Statistical Transformations

?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))

u + geom_point() + geom_smooth(fill=NA)


#boxplots
u <- ggplot(data=movies,aes(x=Genre, y=AudienceRating,
                             colour=Genre))

u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip/hack
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
#>>> 6


#------------------------------- Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black")

#facets
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") + 
  facet_grid(Genre~., scales="free") #axis scales are free to change

#scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))

w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year) +
  geom_smooth()


w + geom_point(aes(size=BudgetMillions)) +
  facet_grid(Genre~Year) +
  geom_smooth()

#>>> 1 (but still will improve)


#------------------------------- Coordinates

#limits
#zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))

m + geom_point()

m + geom_point() +
  xlim(50,100) + #limit CriticRating from 50 to 100
  ylim(50,100)

#won't always work
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black")

n + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") + ylim(0,50)

#instead - zoom:
n + geom_histogram(binwidth=10,aes(fill=Genre)) +
  coord_cartesian(ylim=c(0,50))

#improve #1:
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100)) #zoom layer


#------------------------------- Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

h

#axes labels
h + 
  xlab("Money Axis") + 
  ylab("Number of Movies")


#label formatting
h + 
  xlab("Money Axis") + 
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=30),
        axis.title.y=element_text(colour="Red", size=30))

#tick mark formatting
h + 
  xlab("Money Axis") + 
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=30),
        axis.title.y=element_text(colour="Red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20))

?theme

#legend formatting
h + 
  xlab("Money Axis") + 
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=30),
        axis.title.y=element_text(colour="Red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        legend.title=element_text(size=15),
        legend.text=element_text(size=10),
        legend.position=c(1,1),
        legend.justification=c(1,1))

#plot title
#o <- ggplot(data=movies, aes(x=BudgetMillions))
#h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
h + 
  xlab("Money Axis") + 
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")
  theme(axis.title.x=element_text(colour="DarkGreen", size=30),
        axis.title.y=element_text(colour="Red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        legend.title=element_text(size=15),
        legend.text=element_text(size=10),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        plot.title=element_text(colour="DarkBlue",
                                size=40,
                                family="Courier"))








myplot <- function(data, rows=1:10){
  Data <- data[rows,, drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18)
}

myplot(Games)


#Insights

#Salary
myplot(Salary)
myplot(Salary / Games)
  #anomalies arose due to injuries (lesser games played)
myplot(Salary / FieldGoals)
  #we should not link salary with in-game stats as they are not directly tied to each other

#In-Game Metrics
myplot(MinutesPlayed)
myplot(Points)

#In-Game Metrics Normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
  #accuracy. dwight howard has the top accuracy, 5th highest paid player
myplot(FieldGoalAttempts / Games)
  #dwight howard does not make many attempts per game
myplot(Points / Games)


#Interesting Observation
myplot(MinutesPlayed/Games)
  #players seem to play less minutes per game as time goes by
myplot(Games)
  #same number of games played, but lesser minutes per game

#Time is valuable
myplot(FieldGoals/MinutesPlayed)
  #kevin durant is using his time on the court valuably

#Player Style
myplot(Points/FieldGoals)
  #style changes with time, durant used to play 2 pts and gradually did more 3 pts
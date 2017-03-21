?matplot()

#we want to plot rows instead of columns (default in matplot)
#transpose matrix first
t(FieldGoals)
FieldGoals

#Normalizing Data (excluding injury)
matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, pch=15:18, col=c(1:4,6), horiz=F)
#matplot not commonly used


#Accuracy of Goals
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, pch=15:18, col=c(1:4,6), horiz=F)



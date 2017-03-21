#Logical:
#TRUE T
#FALSE F

4 < 5
10 > 100
4 == 5
# ==
# !=
# <
# >
# <=
# >=
# ! is the NOT operator
# | is the OR operator
# & is the AND operator
# isTRUE(x)

result <- 4 < 5
result
typeof(result)

result2 <- !(5 > 1)
result2

result | result2 #requires either variable to be TRUE
result & result2 #requires all variables to be TRUE

isTRUE(result)

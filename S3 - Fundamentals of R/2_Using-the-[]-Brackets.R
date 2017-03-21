
x <- c(1,123,534,13,4) #combine
y <- seq(201,250,11) #sequence
z <- rep("Hi!",3) #replicate

w <- c("a", "b", "c", "d", "e")
w

w[5] #5th one
w[-1] #all except 1st one
v <- w[-3] #all except 3rd one
w[1:3] #passes vector into [] to return those chars
w[3:5]
w[c(1,3,5)] #returns 1st, 3rd, 5th elements
w[c(-2,-4)] #excludes 2nd, 4th element
w[-3:-5] #excludes 3rd to 5th element
w[1:2] #same as the above

#many things occur in R in vectorized form



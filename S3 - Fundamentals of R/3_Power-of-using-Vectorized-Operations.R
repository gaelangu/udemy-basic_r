
x <- rnorm(5)
x

#R-specific programming loop - vectorized
for(i in x){
  print(i)
}

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#conventional programming loop
for(j in 1:5){
  print(x[j])
}

#----------------------------- Part 2

N <- 100
a <- rnorm(N)
b <- rnorm(N)

#Vectorized approach (faster & easier)
c <- a * b

#De-vectorized approach
d <- rep(NA, N)
for(i in 1:N){
  d[i] <- a[i] * b[i]
}


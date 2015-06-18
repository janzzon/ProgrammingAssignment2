# Optional script:
# Use this script to test the vectorn and matrix functions
# Test functions with packet testthat (install with 'install.packages("testthat")' if required)

# Build example functions from examples in assignment 2, makeVector() and cachemean()
source("./cacheVector.R")

# Build assignment functions makeVector() and makeCacheMatrix()
source("./cachematrix.R")

# Use and test example functions
a <- makeVector()
vectorvalues <- 5:10

a$set (vectorvalues)
a$get()
# Test that funtion get return stored content
testthat::expect_equal(a$get(),vectorvalues)  

a$getmean()
# Test that a$getmean() returns NULL before functions cachemean() is run
testthat::expect_null(a$getmean())

# Run function cachemean() to calculate mean of object from makeVector() if not already calculated
cachemean (a)

cachemean (a)
# Test that cachemean(a) returns message "getting cached data" when run more than once
testthat::expect_message(cachemean(a),"getting cached data")
# Test that output from cachemean() is correct
testthat::expect_equal(cachemean(a),mean(vectorvalues))

a$getmean()
# Test that mean value stored in object a is correct 
testthat::expect_equal(a$getmean(),mean(vectorvalues))

# Use and test assignment functions

b <- makeCacheMatrix()

d <- 25
number <- rnorm(d^2, mean = d, sd = d)
mtrx <- matrix (number, ncol= d)

b$set (mtrx)
head(b$get())
b$getinverse()

cacheSolve(b)
round(b$get() %*% b$getinverse())

testthat::expect_equal((b$get() %*% b$getinverse()),diag(d))
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
mtrx <- matrix (rnorm(d^2, mean = d, sd = d), ncol= d)

b$set (mtrx)
head(b$get())

# Test that funtion get return stored content
testthat::expect_equal(b$get(),mtrx)  

b$getinverse()
# Test that a$getmean() returns NULL before functions cachemean() is run
testthat::expect_null(b$getinverse())

# Run function cacheSolve() to calculate matrix inverse of object from makeCacheMatrix() if not already calculated
head(cacheSolve(b))

# Test that cachemean(a) returns message "getting cached data" when run more than once
testthat::expect_message(cacheSolve(b),"getting cached data")

# Test that output from cacheSolve() is correct by verify that b$get() %*% b$getinverse() is a identity matrix
# See http://www.mathsisfun.com/algebra/matrix-inverse.html for short peek of identity matrix

testthat::expect_equal((b$get() %*% b$getinverse()),diag(d))
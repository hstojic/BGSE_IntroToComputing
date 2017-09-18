# ----------------------------------------------------------------------
# Information
# ----------------------------------------------------------------------

# This script is defining exercises with basic concepts in programming
# with R - creating functions. 


# ----------------------------------------------------------------------
# Exercises
# ----------------------------------------------------------------------

# house keeping, its a good practice to clean the workspace
rm(list = ls())


# ----
# 1. Create a function that computes a mean, given an atomic numeric vector. 
# ----

# Generate an atomic vector of 100 values drawn from a Normal distribution,
# set the seed for reproducibility
set.seed(1234)
x <- rnorm(100, 5, 10) 

meanme <- function(x, loop = FALSE, na.rm = FALSE) {

    # first verify that input, x, has the expected form, using "stopifnot" fnc
    # e.g. it should be an atomic vector
    YOUR-CODE
    # it should also be a numeric vector
    YOUR-CODE
    # this is called defensive programming, preventing unexpected inputs
    # and warning user about it, check "assertthat" package

    # always take into account exceptions, e.g. numeric vectors often 
    # have missing values. If "na.rm" is set to TRUE remove them from x
    if (na.rm) {
        x <- YOUR-CODE
    }

    # we will have two ways of computing the mean, one will be with a loop
    # you have developed in loops.R, if "loop" argument is set to TRUE
    if (loop) {
        YOUR-CODE

    # in the second way will be by using matrix operations 
    # to compute the sum (%*% or crossprod fnc)
    } else {
        result <- YOUR-CODE
    }

    return(c(result))
}

# NOTE: When you execute a function R creates a special environment for that 
# function call and everything that gets created within the function will not 
# bevavailable outside of the function call. For example, in the function 
# above object "result" will not be available outside of it. 

# lets check out the function
meanme(x)
# you should get: 3.432383


### Debugging

# bugs can be roughly divided into three types: 
# 1. When the function crashes and throws an error (e.g. syntax error)  
# 2. A warning is issued. You should resolve them as they most likely are 
#    hiding a non detected error
# 3. An incorrect result. This is hardest to catch, function seems to work. 

# best way to deal with the (3) is to have a number of test cases where you
# know what the result should be, e.g.
meanme(1:3) == 2
is.na(meanme(c(1:3, NA)))
meanme(c(1:3, NA), na.rm = TRUE) == 2

# this is also called unit testing, check the "testthat" package that 
# facilitates unit testing in R

# when functions are simple, putting print statements in various places inside
# the function will work well
# when functions are complex, calling many other functions, it is useful to use
# some debugging tools, R has built in "debug" and "undebug" functions

# debug(meanme)   # set the flag for a debugging
# undebug(meanme) # unset the flag for a debugging

# after setting the flag, execute the function and you will enter the browse
# mode, where you can now examine the state of variables within the function
meanme(1:3)
# c + Enter continues with execution until the end
# Q + Enter stops the function execution


### Timing the execution

# Let's compare how efficient is your function for mean in comparison
# to built in R function
y <- rnorm(1000000)
system.time({
    meanme(y)
})
system.time({
    mean(y)
})

# looping takes much longer
system.time({
    meanme(y, TRUE)
})

# check "microbenchmark" package for more reliable timing


# ----
# 2. Function for computing Fibonnacci numbers 
# ----

# see https://en.wikipedia.org/wiki/Fibonacci_number

# We will use Fibonnacci numbers example to illustrate R's ability to use
# functions in recursive way. 

# you can think of recursive functions as another way to define a loop, 
# but now by using a function. The structure is similar to for/while loop: 
# We have to create a condition that while holds, function will be executing
# when it no longer holds function will terminate. This is how you would 
# construct loops in pure functional programming languages (e.g. Lisp).

fibonnacci <- function(n) {

    # first verify that input, n, has the expected form, using "stopifnot" fnc
    # e.g. it should be a scalar
    YOUR-CODE
    # it should also be a positive number
    YOUR-CODE

    # these conditions define a termination point
    if (n == 1) {
      return(YOUR-CODE)
    }
    if (n == 0) {
      return(YOUR-CODE)
    }

    # in the sequence each element is a sum of previous two numbers
    # here you will call the function itself!
    return(YOUR-CODE)
}

# apply the function 
fibonnacci(0)   # 0
fibonnacci(1)   # 1
fibonnacci(10)  # 55

# to get a whole sequence 
sapply(1:10, fibonnacci)

# falsification is important! try things for which the function should fail
fibonnacci(YOUR-CODE)  # error
fibonnacci(YOUR-CODE)   # error
fibonnacci(YOUR-CODE)  # error

# Note that although R can use recursive functions, it is not doing it
# it in particularly efficient way, it is relatively slow at it.


# ----
# 3. Create a function that will print out a summary
# ----

summariseme <- function(x, na.rm = FALSE, histogram = FALSE) {

    # first verify that input, x, has the expected form, using "stopifnot" fnc
    # e.g. it should be an atomic vector
    YOUR-CODE
    # it should also be a numeric vector
    YOUR-CODE
    
    # compute minimum and maximum of the vector, take into account missing 
    # values if "na.rm" is set to TRUE
    if (na.rm) {
        xmin <- YOUR-CODE; xmax <- YOUR-CODE
    } else {
        xmin <- YOUR-CODE; xmax <- YOUR-CODE
    }

    # compute median and mean of the vector, use your own "meanme" function
    # for computing the mean, take into account missing 
    # values if "na.rm" is set to TRUE
    if (na.rm) {
        xmean <- YOUR-CODE; xmedian <- YOUR-CODE
    } else {
        xmean <- YOUR-CODE; xmedian <- YOUR-CODE
    }

    # print out the results in a nice way, check the output of "summary" fnc
    # you can use "cat" command for that
    YOUR-CODE

    # in addition, we will plot a histogram of the values,
    # if "histogram" argument is set to TRUE
    if (histogram) {
        YOUR-CODE
    }

    # when you several different results as an output it's good
    # to use a list and name each element in the list appropriately
    result <- list()
    YOUR-CODE
    return(result)
}

# check out your function
(res <- summariseme(x))  # additional parenthesis prints out result
summariseme(x, histogram = TRUE)

# you can access a particular result if needed
res[["min"]]

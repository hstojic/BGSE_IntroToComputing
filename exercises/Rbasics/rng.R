# ----------------------------------------------------------------------
# Information
# ----------------------------------------------------------------------

# This script is defining exercises with basic concepts in programming
# with R - drawing random numbers. 


# ----------------------------------------------------------------------
# Exercises
# ----------------------------------------------------------------------

# house keeping, its a good practice to clean the workspace
rm(list = ls())

# Lets first draw some random numbers from Uniform distribution,
# you would usually use histogram to check the shape of the distribution
n <- 1000
u <- runif(n)
plot(u)
hist(u) 

# It is enough to have Uniform random numbers and we can create other 
# distributions given uniform. How do we get uniformly distributed numbers?
# one algorithm is Linear Congruential Generator
# see: https://en.wikipedia.org/wiki/Linear_congruential_generator


# ----
# 1. Create a function that generates Bernoulli draws. 
# ----

# For details on Bernoulli distributions, see:
# https://en.wikipedia.org/wiki/Bernoulli_process

# We will use this example to illustrate the acceptance-rejection method
# for drawing random numbers from arbitrary distribution (von Neumann, 1951). 
# see: https://en.wikipedia.org/wiki/Rejection_sampling

# function arguments:
# n = number of draws (0's and 1's)
# p = probability with which 1 will be drawn

bernoulli <- function(n, p) {

    # implement some checks of function arguments
    YOUR-CODE

    # generate a sequence of 0 and 1, using an "ifelse" function where
    # a condition is a function of runif draw and probability p
    results <- rep(NA, n)
    for (i in 1:n) {
        results[i] <- YOUR-CODE
    }
    return(results)
}

# check it out
bernoulli(10, 0.2)

# try to verify whether it really draws them correctly more thoroughly
all.equal(
    mean(bernoulli(100000, 0.2)),
    0.2, 
    tolerance = 0.01
)


# ----
# 2. Create an artifical dataset
# ----

# Creating artificial datasets is important for testing the algorithms, 
# because here you know the ground truth and you can evaluete clearly how well
# a method is performing.

# function arguments:
# n = number of observations
# w = weights of the linear model
# sd = sd of the error term

rlinmod <- function(n, w, sd) {
    
    # check that w has length of 2
    YOUR-CODE

    # lets draw observations for x from a uniform distribution
    x <- YOUR-CODE

    # and then generate y as a function of x and some optional error
    # a linear model of the form: w0 + w1*x1
    # use matrix multiplication operator    
    y <- YOUR-CODE

    # put x and y in a dataframe
    data <- YOUR-CODE

    return (data)
}

# lets try it out
set.seed(1234)
data <- rlinmod(200, c(5,3), 2)
head(data)

# output should be:
#          y         x
# 1 6.170157 0.1137034
# 2 5.917461 0.6222994
# 3 6.959811 0.6092747
# 4 5.865183 0.6233794
# 5 5.930749 0.8609154
# 6 7.254910 0.6403106
# ...

# scatterplot of the data
plot(data)


# ----
# 3. Monte Carlo simulations: Law of Large Number
# ----

# define a dice of 12 faces and use "sample" function to draw 4 dice throws
dice <- YOUR-CODE
YOUR-CODE

# What is an expected value?

# using analytical formula:
sum(range(dice))/2

# variance is 
(max(dice) - 1)*(max(dice) + 1)/max(dice)

# simulate draws (many) to check the veracity of these formulae
# these are called monte carlo simulations
res <- YOUR-CODE
mean(res)
var(res)
hist(res, xlim=c(1,12))

# now compute the distribution of the mean of a sample of size n = 3? 
set.seed(1234)
MC <- c()
n <- 200
for (i in 1:n) {
    sm <- YOUR-CODE
    MC <- c(MC, sm)
}
head(MC)

# you should get
# [1] 6.000000 9.000000 4.000000 7.666667 6.666667 6.333333

# how does it correspond to a normal distribution
hist(MC, breaks = 16, xlim = c(1,12), probability = TRUE)
xfit <- seq(min(MC),max(MC),length=40)
yfit <- dnorm(xfit, mean = mean(MC), sd = sd(MC))
lines(xfit, yfit, col="blue", lwd=2)


# what happens if you increase the sample size to 20?
# recognize the Law of Large Numbers
set.seed(1234)
MC <- c()
n <- 200
for (i in 1:n) {
    sm <- YOUR-CODE
    MC <- c(MC, sm)
}

hist(MC, breaks = 16, xlim = c(1,12), probability = TRUE)
xfit <- seq(min(MC),max(MC),length=40)
yfit <- dnorm(xfit, mean = mean(MC), sd = sd(MC))
lines(xfit, yfit, col="blue", lwd=2)
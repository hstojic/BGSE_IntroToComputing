# ----------------------------------------------------------------------
# Information
# ----------------------------------------------------------------------

# This script is defining exercises with basic concepts in programming
# with R - if-else statements, for and while loops. 


# ----------------------------------------------------------------------
# Exercises
# ----------------------------------------------------------------------

# house keeping, its a good practice to clean the workspace
rm(list = ls())

# A loop is a programming language construct that allows certain piece of 
# code to be repeatedly executed.


# ----
# 1. Create a for loop that will compute a mean of a vector of numbers
# ----

# Generate an atomic vector of 100 values drawn from a Normal distribution,
# set the seed for reproducibility
YOUR-CODE  
x <- YOUR-CODE  

# start with zero
result <- 0

# iterate over each element in the vector
for YOUR-CODE {
	# take an element and add it to the result
	result <- YOUR-CODE
}
result <- result/length(x)

# is it correct?
result == mean(x)  # will throw FALSE almost always, due to rounding
all.equal(result, mean(x), tolerance = 0.001)  # correct approach


# ----
# 2. Create a while loop that compounds the interest rates
# ----

# We will compute the final amount we get if we 
# deposit some capital during t years with an annual interest rate of r %.

capital <- 18000  # if you invested your tuition fee in an index fund instead
t <- 35  # ~retirement age
r <- 8  # average return of an index fund, e.g. Vanguard S&P500

i <- 1
while YOUR-CODE {
	print(i)
	capital <- YOUR-CODE
	YOUR-CODE
}

# check the result
capital

# it should look as follows:
# [1] 266136.2 
# 
# will your investment into education pay more than this?


# ----
# 3. Generating n-grams for arbitrary text
# ----

# We will use this example to illustrate repeat-break loop
# Repeat loop is used in combination with break keyword stop the iteration.
# We will decompose a string on a set of n-grams. 
# See here for a definition of n-grams:
# https://en.wikipedia.org/wiki/N-gram   

ex <- "Introduction to Computing."  # some text example
n <- 2  # bigrams
 
# first, remove spaces and dot character by using "gsub" function
ex <- YOUR-CODE   

# next, transform all the text to lower case by using "tolower" function
ex <- YOUR-CODE   

result <- NULL
repeat {
	# use "substr" function to subset the string according the position
	# make it a function of length of result vector
	result <- c(result, YOUR-CODE)

	# use the "break" keyword in combination with an if condition
	# you will need the number of characters in the string vector in the
	# condition
	if YOUR-CODE {
		break
	}
}  

# check the result
result

# it should look as follows:
# "in" "nt" "tr" "ro" "od" "du" "uc" "ct" "ti" "io" "on" "nt" "to" "oc" "co"
# "om" "mp" "pu" "ut" "ti" "in" "ng"

# Note that break keyword can be used to interrupt for and while loop 
# execution
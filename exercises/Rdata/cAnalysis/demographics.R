# ----------------------------------------------------------------------
# Information
# ----------------------------------------------------------------------

# This script is for doing a basic data analysis. 


# ----------------------------------------------------------------------
# Loading data
# ----------------------------------------------------------------------

# house cleaning
rm(list = ls())

# if interactive, during the development, set to TRUE
interactive <- FALSE
if (interactive) {
    setwd("/home/hstojic/Teaching/BGSE_DS_ITC_2017/solutions/Rdata")
} 

# load the data
loadFileName <- "dProcessed/procData.RData"
load(loadFileName)


# ----------------------------------------------------------------------
# Basic demographic information 
# ----------------------------------------------------------------------

# output of this analysis will be printed out to a text file, as instructed
# by "pipeline.sh", to a text file called "rTables/demographics"


# ----
# 1. Compute the average population in each district
# ----

# - tip: check out "tapply" command

# it helps to print a message what the part is about to delimit output
# in the resulting text file
print("1. The average population in each district")

# analysis
result <- YOUR-CODE

# print out
result


# ----
# 2. Compute the mean and variance of Seniors in North Warwickshire,
#    Arley and Whitacre ward
# ----

print("2. The mean and variance of Seniors in North Warwickshire, Arley and Whitacre ward")

# analysis
result <- YOUR-CODE

# print out
result


# ----
# 3. Compute the correlation between the Population and Seniors
# ----

print("3. The correlation between the Population and Seniors")

# analysis
result <- YOUR-CODE

# print out
result

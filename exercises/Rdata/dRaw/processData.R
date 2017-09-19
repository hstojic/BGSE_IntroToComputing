# ----------------------------------------------------------------------
# Description
# ----------------------------------------------------------------------

# This script does some processing on the data downloaded by pipeline.sh
# 
# OUTPUT:
# dProcessed/procData.RData file  


# ----------------------------------------------------------------------
# Loading the data
# ----------------------------------------------------------------------

# house cleaning
rm(list = ls())

# if interactive, during the development, set to TRUE
interactive <- FALSE
if (interactive) {
    # change the working directory to your own
    setwd("/home/hstojic/Teaching/BGSE_DS_ITC_2017/solutions/Rdata")
    dirName <- "dRaw/"
    fileName <- "rawData.csv" 
    saveFileName <- "dProcessed/procData.RData"
} 


# ----
# 1. Reading in the data
# ----

# - load the csv file using "read.csv" or "read.table" command 
# - you can connect the folder name with file name by using "paste" command
# - you will need to set some options in the "read.csv" to read the
#   data correctly

aging <- YOUR-CODE


# ----------------------------------------------------------------------
# Processing the data
# ----------------------------------------------------------------------


# ----
# 2. Initial examination of the data
# ---

# Use the "str", "head", "tail", "names" and "summary" commands 
# to take a first look at the data

YOUR-CODE


# ----
# 3. Reneming the variables
# ---

# Rename the last three columns to: 
# District, Population, Seniors

YOUR-CODE


# ----
# 4. Converting variables to correct format
# ---

# you will notice that the "Seniors" variable is in text format and contains %
# we need it in numeric format to continue working with it

aging$Seniors <- YOUR-CODE


# ----
# 5. Computing new variables
# ---

# Add a new variable to the data frame, "PopulationSeniors",
# which is Population multiplied with Seniors divided by 100

aging$PopulationSeniors <- YOUR-CODE


# ----------------------------------------------------------------------
# 6. Saving
# ----------------------------------------------------------------------

# save the data in RData format with the name stored in saveFileName

YOUR-CODE


